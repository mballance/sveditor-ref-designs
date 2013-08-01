// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_ucbflow_ctl.v
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
module ccu_ucbflow_ctl (
  rst_n,
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  ncu_ccu_vld, 
  ncu_ccu_data, 
  ccu_ncu_stall, 
  ccu_ncu_vld, 
  ccu_ncu_data, 
  ncu_ccu_stall, 
  rd_req_vld, 
  wr_req_vld, 
  thr_id_in, 
  buf_id_in, 
  addr_in, 
  data_in, 
  req_acpted, 
  rd_ack_vld, 
  rd_nack_vld, 
  thr_id_out, 
  buf_id_out, 
  data_out, 
  ack_busy) ;
wire indata_buf_vld;
wire [127:0] indata_buf;
wire ccu_ucbbusin4_ctl_scanin;
wire ccu_ucbbusin4_ctl_scanout;
wire ccu_ncu_stall_a1;
wire read_pending;
wire write_pending;
wire buf_full;
wire rd_buf;
wire [1:0] buf_head_next;
wire [1:0] buf_head;
wire buf_head_next0_;
wire buf_head0_;
wire buf_head_ff0_scanin;
wire buf_head_ff0_scanout;
wire l1clk;
wire buf_head_ff1_scanin;
wire buf_head_ff1_scanout;
wire wr_buf;
wire [1:0] buf_tail_next;
wire [1:0] buf_tail;
wire buf_tail_next0_;
wire buf_tail0_;
wire buf_tail_ff0_scanin;
wire buf_tail_ff0_scanout;
wire buf_tail_ff1_scanin;
wire buf_tail_ff1_scanout;
wire buf_full_next;
wire buf_full_ff_scanin;
wire buf_full_ff_scanout;
wire buf_empty_next;
wire buf_empty_next_;
wire buf_empty;
wire buf_empty_;
wire buf_empty_ff_scanin;
wire buf_empty_ff_scanout;
wire [116:0] req_in;
wire [8:0] unconnected_rsvd;
wire buf0_en;
wire buf0_ff_scanin;
wire buf0_ff_scanout;
wire [116:0] buf0;
wire buf1_en;
wire buf1_ff_scanin;
wire buf1_ff_scanout;
wire [116:0] buf1;
wire [116:0] req_out;
wire [2:0] unconnected_size_in;
wire wr_req_vld_nq;
wire rd_req_vld_nq;
wire ack_buf_wr;
wire ack_buf_vld_next;
wire ack_buf_rd;
wire ack_buf_vld;
wire ack_buf_vld_ff_scanin;
wire ack_buf_vld_ff_scanout;
wire ack_buf_is_nack_ff_scanin;
wire ack_buf_is_nack_ff_scanout;
wire ack_buf_is_nack;
wire [3:0] ack_typ_out;
wire [75:0] ack_buf_in;
wire ack_buf_ff_scanin;
wire ack_buf_ff_scanout;
wire [75:0] ack_buf;
wire [31:0] ack_buf_vec;
wire outdata_buf_busy;
wire outdata_buf_wr;
wire [127:0] outdata_buf_in;
wire [31:0] outdata_vec_in;
wire ccu_ucbbusout4_ctl_scanin;
wire ccu_ucbbusout4_ctl_scanout;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;



// Globals
input		rst_n;
input		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk    ;
input		tcu_bclk    ;
input           tcu_scan_en ;

// Downstream from NCU
input           ncu_ccu_vld;
input  [3:0]    ncu_ccu_data;
output          ccu_ncu_stall;

// Upstream to NCU
output          ccu_ncu_vld;
output [3:0]    ccu_ncu_data;
input           ncu_ccu_stall;

// CMDs to local unit
output          rd_req_vld;
output          wr_req_vld;
output [5:0]    thr_id_in;
output [1:0]    buf_id_in;
output [39:0]   addr_in;
output [63:0]   data_in;
input           req_acpted;

// Ack/Nack from local unit
input           rd_ack_vld;
input           rd_nack_vld;
input  [5:0]    thr_id_out;
input  [1:0]    buf_id_out;
input  [63:0]   data_out;
output          ack_busy;




// Local signals




//wire           int_buf_rd;
//wire           int_buf_wr;
//wire           int_buf_vld;
//wire           int_buf_vld_next;
//wire  [6:0]    int_buf_in;
//wire  [6:0]    int_buf;
//wire  [3:0]    int_buf_vec;

//wire           int_last_rd;
   
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * Inbound Data
 ************************************************************/
/*ccu_ucbbusin4_ctl auto_template ( .scan_in(ccu_ucbbusin4_ctl_scanin),
				    .vld(ncu_ccu_vld),
				    .data(ncu_ccu_data[3:0]),
				    .stall(ccu_ncu_stall),
				    .stall_a1(ccu_ncu_stall_a1) );
*/
ccu_ucbbusin4_ctl ccu_ucbbusin4_ctl (/*autoinst*/
				     // Outputs
				     .stall(ccu_ncu_stall),	 // Templated
				     .indata_buf_vld(indata_buf_vld),
				     .indata_buf(indata_buf[127:0]),
				     // Inputs
				     .rst_n(rst_n),
				     .scan_in(ccu_ucbbusin4_ctl_scanin),
				     .scan_out(ccu_ucbbusin4_ctl_scanout),
				     .iol2clk(iol2clk),
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(tcu_clk_stop),
				     .tcu_aclk    (tcu_aclk    ),
				     .tcu_bclk    (tcu_bclk    ),
				     .tcu_scan_en (tcu_scan_en ),
				     .vld(ncu_ccu_vld),		 // Templated
				     .data(ncu_ccu_data[3:0]),	 // Templated
				     .stall_a1(ccu_ncu_stall_a1)); // Templated

/************************************************************
 * Decode inbound packet type
 ************************************************************/
assign     read_pending = (indata_buf[3:0] == 4'b0100) & indata_buf_vld;

assign     write_pending = (indata_buf[3:0] == 4'b0101) & indata_buf_vld;

assign     ccu_ncu_stall_a1 = (read_pending | write_pending) & buf_full;

/************************************************************
 * Inbound buffer
 ************************************************************/
// Head pointer
assign     rd_buf = req_acpted;
assign     buf_head_next[1:0] = rd_buf ? {buf_head[0],buf_head[1]} : buf_head[1:0];

assign     buf_head_next0_ = ~buf_head_next[0] ;
assign     buf_head[0] = ~buf_head0_ ;
msff_width_1 buf_head_ff0 
				(
				.scan_in(buf_head_ff0_scanin),
				.scan_out(buf_head_ff0_scanout),
				.dout		(buf_head0_),
				.l1clk		(l1clk),
				.din		(buf_head_next0_),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_width_1 buf_head_ff1 
				(
				.scan_in(buf_head_ff1_scanin),
				.scan_out(buf_head_ff1_scanout),
				.dout		(buf_head[1]),
				.l1clk		(l1clk),
				.din		(buf_head_next[1]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// Tail pointer
assign     wr_buf = (read_pending | write_pending) & ~buf_full;

assign     buf_tail_next[1:0] = wr_buf ? {buf_tail[0], buf_tail[1]} : buf_tail[1:0];

assign   buf_tail_next0_ = ~buf_tail_next[0];
assign   buf_tail[0] = ~buf_tail0_ ;
msff_width_1 buf_tail_ff0 
				(
				.scan_in(buf_tail_ff0_scanin),
				.scan_out(buf_tail_ff0_scanout),
				.dout		(buf_tail0_),
				.l1clk		(l1clk),
				.din		(buf_tail_next0_),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_width_1 buf_tail_ff1 
				(
				.scan_in(buf_tail_ff1_scanin),
				.scan_out(buf_tail_ff1_scanout),
				.dout		(buf_tail[1]),
				.l1clk		(l1clk),
				.din		(buf_tail_next[1]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer full
assign     buf_full_next = (buf_head_next[1:0] == buf_tail_next[1:0]) & wr_buf;
msff_en_width_1 buf_full_ff  
				(
				.scan_in(buf_full_ff_scanin),
				.scan_out(buf_full_ff_scanout),
				.dout		(buf_full),
				.l1clk		(l1clk),
				.en		(rd_buf|wr_buf),
				.din		(buf_full_next),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer empty
assign     buf_empty_next = ((buf_head_next[1:0] == buf_tail_next[1:0]) & rd_buf) ;
assign     buf_empty_next_ = ~buf_empty_next ;
assign     buf_empty = ~buf_empty_ ;
msff_en_width_1 buf_empty_ff  
				(
				.scan_in(buf_empty_ff_scanin),
				.scan_out(buf_empty_ff_scanout),
				.dout		(buf_empty_),
				.l1clk		(l1clk),
				.en		(rd_buf|wr_buf),
				.din		(buf_empty_next_),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     { req_in[116:53],
	     unconnected_rsvd[8:0],
	     req_in[52:0] }   = { indata_buf[127:64],
	                          indata_buf[63:55],
                                  indata_buf[54:15],
                                  indata_buf[14:12],
                                  indata_buf[11:10],
                                  indata_buf[9:4],
                                  write_pending,
                                  read_pending };
          
// Buffer 0
assign     buf0_en = buf_tail[0] & wr_buf;
msff_en_width_117 buf0_ff  
				(
				.scan_in(buf0_ff_scanin),
				.scan_out(buf0_ff_scanout),
				.dout		(buf0[116:0]),
				.l1clk		(l1clk),
				.en		(buf0_en),
				.din		(req_in[116:0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);
// Buffer 1
assign buf1_en = buf_tail[1] & wr_buf;
msff_en_width_117 buf1_ff  
				(
				.scan_in(buf1_ff_scanin),
				.scan_out(buf1_ff_scanout),
				.dout		(buf1[116:0]),
				.l1clk		(l1clk),
				.en		(buf1_en),
				.din		(req_in[116:0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     req_out[116:0] = buf_head[0] ? buf0[116:0] :
                            buf_head[1] ? buf1[116:0] : 117'b0;

   
/************************************************************
* Inbound interface to local unit
************************************************************/
assign     {data_in[63:0],
            addr_in[39:0],
            unconnected_size_in[2:0],
            buf_id_in[1:0],
            thr_id_in[5:0],
            wr_req_vld_nq,
            rd_req_vld_nq} = req_out[116:0];

assign      rd_req_vld = rd_req_vld_nq & ~buf_empty;
assign      wr_req_vld = wr_req_vld_nq & ~buf_empty;
 
 
/************************************************************
 * Outbound Ack/Nack
 ************************************************************/
assign     ack_buf_wr = rd_ack_vld | rd_nack_vld;

assign     ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                              ack_buf_rd ? 1'b0 : ack_buf_vld;

msff_width_1 ack_buf_vld_ff 
				(
				.scan_in(ack_buf_vld_ff_scanin),
				.scan_out(ack_buf_vld_ff_scanout),
				.dout		(ack_buf_vld),
				.l1clk		(l1clk),
				.din		(ack_buf_vld_next),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_en_width_1 ack_buf_is_nack_ff  
				(
				.scan_in(ack_buf_is_nack_ff_scanin),
				.scan_out(ack_buf_is_nack_ff_scanout),
				.dout		(ack_buf_is_nack),
				.l1clk		(l1clk),
				.en		(ack_buf_wr),
				.din		(rd_nack_vld),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     ack_typ_out[3:0] = rd_ack_vld ? 4'b0001: //UCB_READ_ACK
                                           4'b0000; //UCB_READ_NACK
   
assign     ack_buf_in[75:0] = {  data_out[63:0],
                                buf_id_out[1:0],
                                thr_id_out[5:0],
                               ack_typ_out[3:0]  };
   
msff_en_width_76 ack_buf_ff  
				(
				.scan_in(ack_buf_ff_scanin),
				.scan_out(ack_buf_ff_scanout),
				.dout		(ack_buf[75:0]),
				.l1clk		(l1clk),
				.en		(ack_buf_wr),
				.din		(ack_buf_in[75:0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     ack_buf_vec[31:0] = ack_buf_is_nack  ? {16'h0000,16'hffff} : {32'hffff_ffff} ;
   
assign     ack_busy = ack_buf_vld;
   
assign     ack_buf_rd = ~outdata_buf_busy & ack_buf_vld ;

assign     outdata_buf_wr = ack_buf_rd ;

assign     outdata_buf_in[127:0] = {ack_buf[75:12],      //payload 64bit
                                    9'b0,                //reserved [63:55]
                                    40'h00_0000_0000,    //40bit addr [54:15]
                                    3'b000,              //size [14:12]
                                    ack_buf[11:10],      //buf_id 2bit
                                    ack_buf[9:4],        //thr_id 6bit
                                    ack_buf[3:0]};       //type 4bit
   
assign     outdata_vec_in[31:0] = ack_buf_vec[31:0] ;
   

/*ccu_ucbbusout4_ctl auto_template  (
				       .vld(ccu_ncu_vld),
				       .data(ccu_ncu_data[3:0]),
				       .stall(ncu_ccu_stall),
				       .outdata_vec_in(outdata_vec_in[31:0]) );
*/
ccu_ucbbusout4_ctl ccu_ucbbusout4_ctl (/*autoinst*/
				       // Outputs
				       .vld(ccu_ncu_vld),	 // Templated
				       .data(ccu_ncu_data[3:0]), // Templated
				       .outdata_buf_busy(outdata_buf_busy),
				       // Inputs
				       .rst_n (rst_n),
				       .scan_in(ccu_ucbbusout4_ctl_scanin),
				       .scan_out(ccu_ucbbusout4_ctl_scanout),
				       .iol2clk(iol2clk),
				       .tcu_pce_ov(tcu_pce_ov),
				       .tcu_clk_stop(tcu_clk_stop),
				       .tcu_aclk    (tcu_aclk    ),
				       .tcu_bclk    (tcu_bclk    ),
				       .tcu_scan_en (tcu_scan_en ),
				       .stall(ncu_ccu_stall),	 // Templated
				       .outdata_buf_in(outdata_buf_in[127:0]),
				       .outdata_vec_in(outdata_vec_in[31:0]), // Templated
				       .outdata_buf_wr(outdata_buf_wr));

// scan renames
assign se = tcu_scan_en;
// end scan

/**** adding clock header ****/
l1clkhdr_wrapper clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
                             // .pce_ov (1'b0   ),
                                .stop   (1'b0   ),
                             // .se     (1'b0   ),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk    ;
assign	soclk = tcu_bclk    ;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign ccu_ucbbusin4_ctl_scanin  = scan_in                  ;
assign buf_head_ff0_scanin       = ccu_ucbbusin4_ctl_scanout;
assign buf_head_ff1_scanin       = buf_head_ff0_scanout     ;
assign buf_tail_ff0_scanin       = buf_head_ff1_scanout     ;
assign buf_tail_ff1_scanin       = buf_tail_ff0_scanout     ;
assign buf_full_ff_scanin        = buf_tail_ff1_scanout     ;
assign buf_empty_ff_scanin       = buf_full_ff_scanout      ;
assign buf0_ff_scanin            = buf_empty_ff_scanout     ;
assign buf1_ff_scanin            = buf0_ff_scanout          ;
assign ack_buf_vld_ff_scanin     = buf1_ff_scanout          ;
assign ack_buf_is_nack_ff_scanin = ack_buf_vld_ff_scanout   ;
assign ack_buf_ff_scanin         = ack_buf_is_nack_ff_scanout;
assign ccu_ucbbusout4_ctl_scanin = ack_buf_ff_scanout       ;
assign scan_out                  = ccu_ucbbusout4_ctl_scanout;
// fixscan end:
endmodule // ucb_flow_ccu

// verilog-library-directories:(".")


// Verilog define statements for ccu_ucbbusin4_ctl.sv and ccu_ucbbusout4_ctl.sv:

`define UCB_BUS_WIDTH     4
`define UCB_BUS_WIDTH_M1  3
`define CYC_NUM          32
`define CYC_NUM_M1       31


// `define UCB_BUS_WIDTH 4
// `define UCB_BUS_WIDTH_M1 3
// `define CYC_NUM 32
// `define CYC_NUM_M1 31

module ccu_ucbbusin4_ctl (
  rst_n, 
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  vld, 
  data, 
  stall, 
  indata_buf_vld, 
  indata_buf, 
  stall_a1) ;
wire stall_d1_;
wire stall_d1;
wire vld_d1_ff_scanin;
wire vld_d1_ff_scanout;
wire vld_d1;
wire l1clk;
wire data_d1_ff_scanin;
wire data_d1_ff_scanout;
wire [3:0] data_d1;
wire stall_ff_scanin;
wire stall_ff_scanout;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire skid_buf0_en;
wire vld_buf0_ff_scanin;
wire vld_buf0_ff_scanout;
wire vld_buf0;
wire data_buf0_ff_scanin;
wire data_buf0_ff_scanout;
wire [3:0] data_buf0;
wire skid_buf1_en_ff_scanin;
wire skid_buf1_en_ff_scanout;
wire skid_buf1_en;
wire vld_buf1_ff_scanin;
wire vld_buf1_ff_scanout;
wire vld_buf1;
wire data_buf1_ff_scanin;
wire data_buf1_ff_scanout;
wire [3:0] data_buf1;
wire skid_buf0_sel;
wire skid_buf1_sel_ff_scanin;
wire skid_buf1_sel_ff_scanout;
wire skid_buf1_sel;
wire vld_mux;
wire [3:0] data_mux;
wire [31:0] indata_vec_next;
wire [31:0] indata_vec;
wire stall_a1_;
wire indata_vec_ff_scanin;
wire indata_vec_ff_scanout;
wire [127:0] indata_buf_next;
wire indata_buf_ff_scanin;
wire indata_buf_ff_scanout;
wire indata_vec0_d1_ff_scanin;
wire indata_vec0_d1_ff_scanout;
wire indata_vec0_d1;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire se;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		rst_n;
input		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk    ;
input		tcu_bclk    ;
input		tcu_scan_en ;

// UCB bus interface
input		vld;
input [`UCB_BUS_WIDTH_M1 :0]	data;
output		stall;


// Local interface
output		indata_buf_vld;
output [127:0]	indata_buf;
input		stall_a1;


// Internal signals

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * UCB bus interface flops
 * This is to make signals going between IOB and UCB flop-to-flop
 * to improve timing.
 ************************************************************/
assign stall_d1_ = ~stall_d1;
msff_en_width_1 vld_d1_ff  
				(
				.scan_in(vld_d1_ff_scanin),
				.scan_out(vld_d1_ff_scanout),
				.dout		(vld_d1),
				.l1clk		(l1clk),
				.en		(stall_d1_),
				.din		(vld),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_en_width_4 data_d1_ff  
				(
				.scan_in(data_d1_ff_scanin),
				.scan_out(data_d1_ff_scanout),
				.dout		(data_d1[`UCB_BUS_WIDTH_M1:0]),
				.l1clk		(l1clk),
				.en		(stall_d1_),
				.din		(data[`UCB_BUS_WIDTH_M1:0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_width_1 stall_ff 
				(
				.scan_in(stall_ff_scanin),
				.scan_out(stall_ff_scanout),
				.dout		(stall),
				.l1clk		(l1clk),
				.din		(stall_a1),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_width_1 stall_d1_ff 
				(
				.scan_in(stall_d1_ff_scanin),
				.scan_out(stall_d1_ff_scanout),
				.dout		(stall_d1),
				.l1clk		(l1clk),
				.din		(stall),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Skid buffer
 * We need a two deep skid buffer to handle stalling.
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

// Buffer 0
assign  skid_buf0_en = stall_a1 & ~stall;

msff_en_width_1 vld_buf0_ff  
				(
				.scan_in(vld_buf0_ff_scanin),
				.scan_out(vld_buf0_ff_scanout),
				.dout		(vld_buf0),
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(vld_d1),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_en_width_4 data_buf0_ff   
				(
				.scan_in(data_buf0_ff_scanin),
				.scan_out(data_buf0_ff_scanout),
				.dout		(data_buf0[`UCB_BUS_WIDTH_M1 :0]),
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(data_d1[`UCB_BUS_WIDTH_M1 :0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer 1
msff_width_1 skid_buf1_en_ff 
				(
				.scan_in(skid_buf1_en_ff_scanin),
				.scan_out(skid_buf1_en_ff_scanout),
				.dout		(skid_buf1_en),
				.l1clk		(l1clk),
				.din		(skid_buf0_en),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_en_width_1 vld_buf1_ff  
				(
				.scan_in(vld_buf1_ff_scanin),
				.scan_out(vld_buf1_ff_scanout),
				.dout		(vld_buf1),
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(vld_d1),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

msff_en_width_4 data_buf1_ff   
				(
				.scan_in(data_buf1_ff_scanin),
				.scan_out(data_buf1_ff_scanout),
				.dout		(data_buf1[`UCB_BUS_WIDTH_M1 :0]),
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(data_d1[`UCB_BUS_WIDTH_M1 :0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Mux between skid buffer and interface flop
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

assign	skid_buf0_sel = ~stall_a1 & stall;

msff_width_1 skid_buf1_sel_ff 
				(
				.scan_in(skid_buf1_sel_ff_scanin),
				.scan_out(skid_buf1_sel_ff_scanout),
				.dout		(skid_buf1_sel),
				.l1clk		(l1clk),
				.din		(skid_buf0_sel),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	vld_mux = skid_buf0_sel ? vld_buf0 : 
	   	     skid_buf1_sel ? vld_buf1 :
		                     vld_d1;

assign	data_mux[`UCB_BUS_WIDTH_M1 :0] = skid_buf0_sel ? data_buf0[`UCB_BUS_WIDTH_M1 :0] : 
					skid_buf1_sel ? data_buf1[`UCB_BUS_WIDTH_M1 :0] : 
					       		 data_d1[`UCB_BUS_WIDTH_M1 :0];


/************************************************************
 * Assemble inbound data
 ************************************************************/
// valid vector
assign	indata_vec_next[`CYC_NUM_M1:0] = {vld_mux, indata_vec[`CYC_NUM_M1 :1]};

assign	stall_a1_ = ~stall_a1;
msff_en_width_32 indata_vec_ff   
				(
				.scan_in(indata_vec_ff_scanin),
				.scan_out(indata_vec_ff_scanout),
				.dout		(indata_vec[`CYC_NUM_M1 :0]),
				.l1clk		(l1clk),
				.en		(stall_a1_),
				.din		(indata_vec_next[`CYC_NUM_M1 :0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// data buffer
assign	indata_buf_next[127:0] = {data_mux[`UCB_BUS_WIDTH_M1 :0], indata_buf[127:`UCB_BUS_WIDTH ]};
msff_en_width_128 indata_buf_ff  
				(
				.scan_in(indata_buf_ff_scanin),
				.scan_out(indata_buf_ff_scanout),
				.dout		(indata_buf[127:0]),
				.l1clk		(l1clk),
				.en		(stall_a1_),
				.din		(indata_buf_next[127:0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

// detect a new packet	  
msff_en_width_1 indata_vec0_d1_ff  
				(
				.scan_in(indata_vec0_d1_ff_scanin),
				.scan_out(indata_vec0_d1_ff_scanout),
				.dout		(indata_vec0_d1),
				.l1clk		(l1clk),
				.en		(stall_a1_),
				.din		(indata_vec[0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;



/**** adding clock header ****/
l1clkhdr_wrapper clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
                             // .pce_ov (1'b0   ),
                                .stop   (1'b0   ),
                             // .se     (1'b0   ),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk  = tcu_aclk    ;
assign	soclk  = tcu_bclk    ;
assign	pce_ov = tcu_pce_ov  ;
assign	stop   = tcu_clk_stop;
// scan renames
assign  se     = tcu_scan_en ;
// end scan

// fixscan start:
assign vld_d1_ff_scanin          = scan_in                  ;
assign data_d1_ff_scanin         = vld_d1_ff_scanout        ;
assign stall_ff_scanin           = data_d1_ff_scanout       ;
assign stall_d1_ff_scanin        = stall_ff_scanout         ;
assign vld_buf0_ff_scanin        = stall_d1_ff_scanout      ;
assign data_buf0_ff_scanin       = vld_buf0_ff_scanout      ;
assign skid_buf1_en_ff_scanin    = data_buf0_ff_scanout     ;
assign vld_buf1_ff_scanin        = skid_buf1_en_ff_scanout  ;
assign data_buf1_ff_scanin       = vld_buf1_ff_scanout      ;
assign skid_buf1_sel_ff_scanin   = data_buf1_ff_scanout     ;
assign indata_vec_ff_scanin      = skid_buf1_sel_ff_scanout ;
assign indata_buf_ff_scanin      = indata_vec_ff_scanout    ;
assign indata_vec0_d1_ff_scanin  = indata_buf_ff_scanout    ;
assign scan_out                  = indata_vec0_d1_ff_scanout;
// fixscan end:
endmodule // ucb_bus_in




// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_en_width_1 (
  reset,
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input reset; 
  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});



// dff #(1)  d0_0 (
cl_a1_msff_syrst_1x d0_0 ( 
.reset(reset),
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);



endmodule



// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_en_width_4 (
  reset,
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input reset;
  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});


/* 
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);
*/

ccu_msff_syrst_1x_4 U0  (
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[3:0]),
	.si(scan_in),
	.so(scan_out),
	.q(dout[3:0])
);

endmodule



// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_width_1 (
  reset,
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input reset;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];

// dff #(1)  d0_0 (
cl_a1_msff_syrst_1x U0 ( 
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[0:0]),
	.si(scan_in),
	.so(scan_out),
	.q(dout[0:0])
);


endmodule



// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_en_width_32 (
  reset,
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input reset;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});

// dff #(32)  d0_0 (
ccu_msff_syrst_1x_32 U0 ( 
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[31:0]),
	.si(scan_in), //	.si({scan_in,so[30:0]}),
	.so(scan_out),//  .so({so[30:0],scan_out}),
	.q(dout[31:0])
);


endmodule


// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************


module msff_en_width_128 (
  reset,
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});

/* 
dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);
*/

ccu_msff_syrst_1x_128 U0 (
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[127:0]),
	.si(scan_in),
	.so(scan_out),
	.q(dout[127:0])
);

endmodule





// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module l1clkhdr_wrapper (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



// cl_sc1_l1hdr_8x c_0 (
cl_a1_l1hdr_8x c_0 (		// using different l1 - mhassan 
  .l2clk(l2clk),
  .pce(l1en),
  .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule


// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_en_width_117 (
  reset,
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [116:0] fdin;
wire [115:0] so;

  input [116:0] din;
  input reset;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [116:0] dout;
  output scan_out;

  assign fdin[116:0] = (din[116:0] & {117{en}}) | (dout[116:0] & ~{117{en}});

/*
dff #(117)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[116:0]),
.si({scan_in,so[115:0]}),
.so({so[115:0],scan_out}),
.q(dout[116:0])
);
*/


ccu_msff_syrst_1x_117  U0 (
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[116:0]),
	.si(scan_in),
	.so(scan_out),
	.q(dout[116:0])
);



endmodule


// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_en_width_76 (
  reset, 
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [75:0] fdin;
wire [74:0] so;

  input [75:0] din;
  input en;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [75:0] dout;
  output scan_out;
assign fdin[75:0] = (din[75:0] & {76{en}}) | (dout[75:0] & ~{76{en}});


/*
dff #(76)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[75:0]),
.si({scan_in,so[74:0]}),
.so({so[74:0],scan_out}),
.q(dout[75:0])
);
*/

ccu_msff_syrst_1x_76  U0 (
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[75:0]),
	.si(scan_in),
	.so(scan_out),
	.q(dout[75:0])
);


endmodule




// Verilog define statements for ccu_ucbbusin4_ctl.sv and ccu_ucbbusout4_ctl.sv:

`define UCB_BUS_WIDTH     4
`define UCB_BUS_WIDTH_M1  3
`define CYC_NUM          32
`define CYC_NUM_M1       31


// `define UCB_BUS_WIDTH 4
// `define UCB_BUS_WIDTH_M1 3
// `define CYC_NUM 32
// `define CYC_NUM_M1 31

module ccu_ucbbusout4_ctl (
  rst_n, 
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  vld, 
  data, 
  stall, 
  outdata_buf_busy, 
  outdata_buf_in, 
  outdata_vec_in, 
  outdata_buf_wr) ;
wire [31:0] outdata_vec;
wire [127:0] outdata_buf;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire stall_d1;
wire l1clk;
wire load_outdata;
wire shift_outdata;
wire [31:0] outdata_vec_next;
wire outdata_vec_ff_scanin;
wire outdata_vec_ff_scanout;
wire [127:0] outdata_buf_next;
wire outdata_buf_ff_scanin;
wire outdata_buf_ff_scanout;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire se;


// Globals
input		rst_n;
input		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_aclk    ;
input		tcu_bclk    ;
input		tcu_scan_en ;

// UCB bus interface
output		vld;
output [`UCB_BUS_WIDTH_M1 :0]	data;
input		stall;

// Local interface
output		outdata_buf_busy;
input [127:0]	outdata_buf_in;
input [`CYC_NUM_M1 :0]	outdata_vec_in;
input		outdata_buf_wr;

// Local signals

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * UCB bus interface flops
 ************************************************************/
assign 	 vld = outdata_vec[0];
assign 	 data[`UCB_BUS_WIDTH_M1 :0] = outdata_buf[`UCB_BUS_WIDTH_M1 :0];

msff_width_1 stall_d1_ff 
				(
				.scan_in(stall_d1_ff_scanin),
				.scan_out(stall_d1_ff_scanout),
				.dout		(stall_d1),
				.l1clk		(l1clk),
				.din		(stall),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

/************************************************************
 * Outbound Data
 ************************************************************/
// accept new data only if there is none being processed
assign  load_outdata = outdata_buf_wr & ~outdata_buf_busy;

assign  outdata_buf_busy = outdata_vec[0] | stall_d1;

assign  shift_outdata = outdata_vec[0] & ~stall_d1;

assign  outdata_vec_next[`CYC_NUM_M1 :0] =
				load_outdata  ? outdata_vec_in[`CYC_NUM_M1 :0] : 
				shift_outdata ? {1'b0,outdata_vec[`CYC_NUM_M1 :1]} : 
						outdata_vec[`CYC_NUM_M1 :0] ;

msff_width_32 outdata_vec_ff  
				(
				.scan_in(outdata_vec_ff_scanin),
				.scan_out(outdata_vec_ff_scanout),
				.dout		(outdata_vec[`CYC_NUM_M1 :0]),
				.l1clk		(l1clk),
				.din		(outdata_vec_next[`CYC_NUM_M1 :0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign  outdata_buf_next[127:0] = load_outdata  ? outdata_buf_in[127:0] :
		 		  shift_outdata ? (outdata_buf[127:0] >> `UCB_BUS_WIDTH ) :  
	                         		   outdata_buf[127:0] ;

msff_width_128 outdata_buf_ff 
				(
				.scan_in(outdata_buf_ff_scanin),
				.scan_out(outdata_buf_ff_scanout),
				.dout		(outdata_buf[127:0]),
				.l1clk		(l1clk),
				.din		(outdata_buf_next[127:0]),
  .reset(rst_n),
  .siclk(siclk),
  .soclk(soclk)
				);



/**** adding clock header ****/
l1clkhdr_wrapper clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
                             // .pce_ov (1'b0   ),
                                .stop   (1'b0   ),
                             // .se     (1'b0   ),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk  = tcu_aclk    ;
assign	soclk  = tcu_bclk    ;
assign	pce_ov = tcu_pce_ov  ;
assign	stop   = tcu_clk_stop;
// scan renames
assign  se     = tcu_scan_en ;
// end scan

// fixscan start:
assign stall_d1_ff_scanin        = scan_in                  ;
assign outdata_vec_ff_scanin     = stall_d1_ff_scanout      ;
assign outdata_buf_ff_scanin     = outdata_vec_ff_scanout   ;
assign scan_out                  = outdata_buf_ff_scanout   ;
// fixscan end:
endmodule // ucb_bus_out




// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_width_32 (
  reset,
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input reset;
  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];


/*
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);

*/

ccu_msff_syrst_1x_32 U0 ( 
	.reset(reset),
	.l1clk(l1clk),
	.siclk(siclk),
	.soclk(soclk),
	.d(fdin[31:0]),
	.si(scan_in), //	.si({scan_in,so[30:0]}),
	.so(scan_out),//  .so({so[30:0],scan_out}),
	.q(dout[31:0])
);



endmodule



// ***********************************************
// any PARAMS parms go into naming of macro
// ***********************************************

module msff_width_128 (
  reset,
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input reset;
  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];



/*
dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);
*/

ccu_msff_syrst_1x_128  U0 (
.reset(reset),
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si(scan_in),
.so(scan_out),
.q(dout[127:0])
);


endmodule


