// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_timer.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
module niu_smx_timer(
/*AUTOARG*/
   // Outputs
   resp_rcv_rst, resp_rcv_rst_addr, tid_valid_rst1, 
   tid_valid_rst_addr1, tid_newarr_rst, tid_newarr_rst_addr, 
   timeout_set, timeout_set_addr, 
   // Inputs
   clk, reset_l, reg_timer_cfg, resp_rcv_rdata_bus, 
   tid_valid_rdata_bus, tid_newarr_rdata_bus, tid_xmited_rdata_bus
   );

input clk;
input reset_l;

input [31:0] reg_timer_cfg;
		// [27:20] -timeout value; use 8 bits for now
		// [19:0] - tick per table visit

// pio_ld_cfg to update cfg ???

input [63:0] resp_rcv_rdata_bus;
output resp_rcv_rst;
output [5:0] resp_rcv_rst_addr;

input [63:0] tid_valid_rdata_bus;
output tid_valid_rst1;
output [5:0] tid_valid_rst_addr1;

input [63:0] tid_newarr_rdata_bus;
output tid_newarr_rst;
output [5:0] tid_newarr_rst_addr;

output	timeout_set;
output  [5:0] timeout_set_addr;

input [63:0] tid_xmited_rdata_bus;

parameter DATA_WIDTH= 8; // current timeout is 8 bits
parameter ADDR_WIDTH= 6;
// parameter ENTRY_SIZE= 1<<ADDR_WIDTH;


parameter s0= 1'b0,
	  s1= 1'b1;
// sm: tid_valid, resprcv, tid_newarr bus& -> snap shot per visit (table)
// cycle thru 
// newarr - ld init timer value

reg [27:0] reg_timer_cfg_r;
reg	   pio_ld_cfg;

reg [19:0] tick_table_cnt;
reg [5:0] cur_tid_addr;

wire [19:0] cfg_table= reg_timer_cfg_r[19:0];  // shadow version
wire [DATA_WIDTH-1:0] cfg_timeout= reg_timer_cfg_r[DATA_WIDTH+19:20];

wire	pio_ld_cfg_n= (reg_timer_cfg_r != reg_timer_cfg[27:0]); 
		// reload shadow whenever differs from pio

wire visit_table_n= (tick_table_cnt == 20'h1);
wire cfg_table_is_zero_n= ~(|cfg_table);
wire all_entry_done_n= &cur_tid_addr;

reg timer_cs, timer_ns; 
reg ld_snap_shot_n, ld_snap_shot;
wire rst_snap_shot_n= ld_snap_shot & ~ld_snap_shot_n ; 
   // rst next cycle if pipe and no new entry follow; 
reg ld_table_cnt_n; 
reg rst_cur_tid_addr_n; 
reg inc_cur_tid_addr_n;
reg dec_table_cnt_n;
reg timer_tb_rd_n;

	// snap shot; pulse 
reg ss_tid_valid;
reg ss_tid_xmited;
reg ss_tid_newarr;
reg ss_resprcv; 
reg [5:0] ss_tid_addr;


always @ (
/*AUTOSENSE*/all_entry_done_n or cfg_table_is_zero_n or timer_cs
	  or visit_table_n) begin
  timer_ns= timer_cs;
  ld_snap_shot_n= 1'b0;
  ld_table_cnt_n= 1'b0;
  dec_table_cnt_n= 1'b0;
  rst_cur_tid_addr_n= 1'b0; 
  inc_cur_tid_addr_n= 1'b0;
  timer_tb_rd_n= 1'b0;
  case(timer_cs) 
    s0: begin // wait table visit
          if(visit_table_n) begin
	    timer_ns= s1;
	  end
 	  else begin
	    dec_table_cnt_n= (~cfg_table_is_zero_n); 
	  end
        end
    s1: begin  // entry visit
            ld_snap_shot_n= 1'b1; 
	    rst_cur_tid_addr_n=  all_entry_done_n;
	    inc_cur_tid_addr_n=  ~all_entry_done_n;
  	    timer_tb_rd_n= 1'b1;
 	    timer_ns= (all_entry_done_n)? s0: s1;
	    ld_table_cnt_n= (all_entry_done_n)? 1'b1 : 1'b0;
        end
  endcase 

end

always @(posedge clk) begin
  if(!reset_l) begin
    reg_timer_cfg_r<= `SMX_PD 28'h0;
    pio_ld_cfg<= `SMX_PD 1'b0;
  end
  else begin
    if(pio_ld_cfg_n) reg_timer_cfg_r<= `SMX_PD reg_timer_cfg[27:0];
    pio_ld_cfg<= `SMX_PD pio_ld_cfg_n;
  end
end

always @(posedge clk) begin
  if(!reset_l) begin
    tick_table_cnt<= `SMX_PD 20'hff; // default 255 cnt at init 
			// probably overwrite with pio init after reset
    cur_tid_addr<= `SMX_PD  6'h0;   
    timer_cs<= `SMX_PD s0;
  end
  else begin
    if(ld_table_cnt_n || pio_ld_cfg) tick_table_cnt<= `SMX_PD cfg_table; 
    else if (dec_table_cnt_n) tick_table_cnt<= `SMX_PD tick_table_cnt - 1'b1; 

    if(rst_cur_tid_addr_n) cur_tid_addr<= `SMX_PD 6'h0;
    else if (inc_cur_tid_addr_n) cur_tid_addr<= `SMX_PD cur_tid_addr + 1'b1; 

    timer_cs<= `SMX_PD timer_ns;
  end
end


always @ (posedge clk) begin
  if(!reset_l) begin
    ss_tid_valid<= `SMX_PD 1'b0;
    ss_tid_xmited<= `SMX_PD 1'b0;
    ss_tid_newarr<= `SMX_PD 1'b0;
    ss_resprcv<= `SMX_PD 1'b0;
    ld_snap_shot<= `SMX_PD 1'b0;
  end
  else begin
    if(ld_snap_shot_n) begin
       ss_tid_valid<= `SMX_PD tid_valid_rdata_bus[cur_tid_addr];
       ss_tid_xmited<= `SMX_PD tid_xmited_rdata_bus[cur_tid_addr];
       ss_tid_newarr<= `SMX_PD tid_newarr_rdata_bus[cur_tid_addr];
       ss_resprcv<= `SMX_PD resp_rcv_rdata_bus[cur_tid_addr];
       ld_snap_shot<= `SMX_PD 1'b1; // use this to rst itself
    end
    else begin
      if(rst_snap_shot_n) begin
        ss_tid_valid<= `SMX_PD 1'b0;
        ss_tid_xmited<= `SMX_PD 1'b0;
        ss_tid_newarr<= `SMX_PD 1'b0;
        ss_resprcv<= `SMX_PD 1'b0;
        ld_snap_shot<= `SMX_PD 1'b0;
      end
    end  // snap_shot
  end  // !reset 
end

always @ (posedge clk) begin
  if(ld_snap_shot_n) begin
    ss_tid_addr<= `SMX_PD cur_tid_addr;
  end
end

			// rst timer to init value
	// ss align with timer_tb_rdata avail
wire [DATA_WIDTH-1:0]  timer_tb_rdata;
wire rst_timer_tb_n= ss_tid_valid & (ss_resprcv | ss_tid_newarr); 
wire dec_timer_tb_n= ss_tid_valid & ~ss_resprcv & ~ss_tid_newarr & ss_tid_xmited;
wire timer_tb_rdata_iszero= ~(|timer_tb_rdata);
wire [DATA_WIDTH-1:0] timer_tb_rdata_dec_n= timer_tb_rdata - 1'b1;
wire time_out_n= dec_timer_tb_n & (timer_tb_rdata=={{(DATA_WIDTH-1){1'b0}}, 1'b1}); 
  // value of 1 left; waited this '1' already; therefore timeout
// wire       resp_rcv_rst= rst_timer_tb_n;
// wire [5:0] resp_rcv_rst_addr= ss_tid_addr;
wire       resp_rcv_rst= ld_snap_shot_n;    // wanna rst resp_rcv at same time of load, 
wire [5:0] resp_rcv_rst_addr= cur_tid_addr; // in case 'set' resp rcv happens at same time   
wire       tid_newarr_rst= ss_tid_valid & ss_tid_newarr;
wire [5:0] tid_newarr_rst_addr= ss_tid_addr;

wire timer_tb_wr_n= rst_timer_tb_n | dec_timer_tb_n;
wire [DATA_WIDTH-1:0] timer_tb_wdata_n= 
	(rst_timer_tb_n)? cfg_timeout : 
	((timer_tb_rdata_iszero)? timer_tb_rdata : timer_tb_rdata_dec_n);
reg timer_tb_wr;
reg [DATA_WIDTH-1:0] timer_tb_wdata;

reg timeout_set;
reg [5:0] timeout_set_addr;

always @ (posedge clk) begin
  if(!reset_l) begin
    timer_tb_wr<= `SMX_PD 1'b0;
    timeout_set<= `SMX_PD 1'b0;
  end
  else begin
    timer_tb_wr<= `SMX_PD timer_tb_wr_n;
    timeout_set<= `SMX_PD time_out_n;
  end 
end

reg [ADDR_WIDTH-1:0] timer_tb_waddr;
always @ (posedge clk) begin
  if(timer_tb_wr_n) begin
    timer_tb_wdata<= `SMX_PD timer_tb_wdata_n;
    timer_tb_waddr<= `SMX_PD ss_tid_addr;
  end
  if(time_out_n) timeout_set_addr<= `SMX_PD ss_tid_addr;
end

	// rst tid_valid if timeout
wire tid_valid_rst1= timeout_set;
wire [5:0] tid_valid_rst_addr1= timeout_set_addr;

niu_smx_regfl #(DATA_WIDTH,ADDR_WIDTH) timer_tb( 
        .clk            (clk),
        .reset_l        (reset_l),
        .wr             (timer_tb_wr),
        .addr_wr        (timer_tb_waddr[ADDR_WIDTH-1:0]),
        .data_wr        (timer_tb_wdata[DATA_WIDTH-1:0]),
        .rd             (timer_tb_rd_n),
        .addr_rd        (cur_tid_addr[ADDR_WIDTH-1:0]),
        .data_rd        (timer_tb_rdata[DATA_WIDTH-1:0])
);



endmodule


