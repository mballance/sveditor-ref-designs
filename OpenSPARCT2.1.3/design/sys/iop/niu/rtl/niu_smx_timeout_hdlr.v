// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_timeout_hdlr.v
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

module niu_smx_timeout_hdlr(
/*AUTOARG*/
   // Outputs
   timeout_rst, timeout_rst_addr, tohdl_cmdl_req, tohdl_cmdl_cmd, 
   tohdl_cmdl_addr, tohdl_cmdl_len, tohdl_cmdl_xid, tohdl_cmdl_port, 
   tohdl_cmdl_dma, tohdl_cmdl_client, tohdl_xtb_rd, tohdl_xtb_raddr, 
   smx_nc_err, tohdl_set_intr, tohdl_intr_status, 
   // Inputs
   clk, reset_l, timeout_rdata_bus, cmdl_tohdl_ack, tohdl_xtb_rdata, 
   tohdl_xtb_rd_ack, tohdl_xtb_rdata_err
   );

input clk;
input reset_l;

input [63:0] timeout_rdata_bus;
output timeout_rst;
output [5:0] timeout_rst_addr;

output		tohdl_cmdl_req;
output [7:0] 	tohdl_cmdl_cmd;
output [63:0] 	tohdl_cmdl_addr;
output [13:0] 	tohdl_cmdl_len;
output [5:0] 	tohdl_cmdl_xid;
output [1:0] 	tohdl_cmdl_port;
output [4:0] 	tohdl_cmdl_dma;
output [7:0] 	tohdl_cmdl_client;
input		cmdl_tohdl_ack;

output 		tohdl_xtb_rd;
output [5:0] 	tohdl_xtb_raddr;
input [118:0] 	tohdl_xtb_rdata; // {xtb_rdata}; rcvcnt not part of 
input		tohdl_xtb_rd_ack; // rst client rd signal
input		tohdl_xtb_rdata_err;   	

output 		smx_nc_err; // non-recoverable; level
			// reset by reset_l only 

output		tohdl_set_intr;
output [5:0]	tohdl_intr_status;

parameter s0= 3'h0,
	  s1= 3'h1,
	  s2= 3'h2,
	  s3= 3'h3,
	  s4= 3'h4,
	  s5= 3'h5;

wire [3:0] to_grp_15= timeout_rdata_bus[63:60]; 
wire [3:0] to_grp_14= timeout_rdata_bus[59:56];  
wire [3:0] to_grp_13= timeout_rdata_bus[55:52]; 
wire [3:0] to_grp_12= timeout_rdata_bus[51:48];  
wire [3:0] to_grp_11= timeout_rdata_bus[47:44]; 
wire [3:0] to_grp_10= timeout_rdata_bus[43:40];  
wire [3:0] to_grp_9= timeout_rdata_bus[39:36]; 
wire [3:0] to_grp_8= timeout_rdata_bus[35:32];  
wire [3:0] to_grp_7= timeout_rdata_bus[31:28]; 
wire [3:0] to_grp_6= timeout_rdata_bus[27:24];  
wire [3:0] to_grp_5= timeout_rdata_bus[23:20]; 
wire [3:0] to_grp_4= timeout_rdata_bus[19:16];  
wire [3:0] to_grp_3= timeout_rdata_bus[15:12]; 
wire [3:0] to_grp_2= timeout_rdata_bus[11:8];  
wire [3:0] to_grp_1= timeout_rdata_bus[7:4]; 
wire [3:0] to_grp_0= timeout_rdata_bus[3:0];

wire [15:0] to_grp_n= {
	|timeout_rdata_bus[63:60], |timeout_rdata_bus[59:56],
	|timeout_rdata_bus[55:52], |timeout_rdata_bus[51:48], 
	|timeout_rdata_bus[47:44], |timeout_rdata_bus[43:40],  
	|timeout_rdata_bus[39:36], |timeout_rdata_bus[35:32],  
	|timeout_rdata_bus[31:28], |timeout_rdata_bus[27:24],  
	|timeout_rdata_bus[23:20], |timeout_rdata_bus[19:16],  
	|timeout_rdata_bus[15:12], |timeout_rdata_bus[11:8],  
	|timeout_rdata_bus[7:4], |timeout_rdata_bus[3:0]};
wire any_to_n= |timeout_rdata_bus;

function [1:0] map_addr; 
  input [3:0] bus;
  begin
    if(bus[0]) map_addr= 2'h0;
    else if(bus[1]) map_addr= 2'h1;
    else if(bus[2]) map_addr= 2'h2;
    else if(bus[3]) map_addr= 2'h3;
    else map_addr= 2'h0;
  end
endfunction

wire [1:0] map_addr_0_n=  map_addr(to_grp_0);
wire [1:0] map_addr_1_n=  map_addr(to_grp_1);
wire [1:0] map_addr_2_n=  map_addr(to_grp_2);
wire [1:0] map_addr_3_n=  map_addr(to_grp_3);
wire [1:0] map_addr_4_n=  map_addr(to_grp_4);
wire [1:0] map_addr_5_n=  map_addr(to_grp_5);
wire [1:0] map_addr_6_n=  map_addr(to_grp_6);
wire [1:0] map_addr_7_n=  map_addr(to_grp_7);
wire [1:0] map_addr_8_n=  map_addr(to_grp_8);
wire [1:0] map_addr_9_n=  map_addr(to_grp_9);
wire [1:0] map_addr_10_n=  map_addr(to_grp_10);
wire [1:0] map_addr_11_n=  map_addr(to_grp_11);
wire [1:0] map_addr_12_n=  map_addr(to_grp_12);
wire [1:0] map_addr_13_n=  map_addr(to_grp_13);
wire [1:0] map_addr_14_n=  map_addr(to_grp_14);
wire [1:0] map_addr_15_n=  map_addr(to_grp_15);

reg [3:0] grpcnt;
reg [5:0] tid_addr; // {grpcnt, sel_map_addr_n}
reg [1:0] sel_map_addr_n;

reg inc_grpcnt_n;
reg ld_tid_addr_n; 
reg ld_cmd_n;
reg timeout_rst_n, timeout_rst; // pulse
reg smx_nc_err_n, smx_nc_err; // level
reg tohdl_xtb_rd_n, tohdl_xtb_rd;  // level
reg tohdl_cmdl_req_n, tohdl_cmdl_req; // level
reg [2:0] to_ns, to_cs;
reg tohdl_set_intr_n;
wire tohdl_set_intr= tohdl_set_intr_n;
wire [5:0] tohdl_intr_status= tid_addr;


always @(/*AUTOSENSE*/any_to_n or cmdl_tohdl_ack or grpcnt
	 or smx_nc_err or to_cs or to_grp_n or tohdl_cmdl_req
	 or tohdl_xtb_rd or tohdl_xtb_rd_ack or tohdl_xtb_rdata_err) begin
  to_ns= to_cs;
  inc_grpcnt_n= 1'b0;
  ld_tid_addr_n= 1'b0;
  tohdl_xtb_rd_n= tohdl_xtb_rd;
  tohdl_cmdl_req_n= tohdl_cmdl_req;
  ld_cmd_n= 1'b0;
  timeout_rst_n= 1'b0;
  tohdl_set_intr_n= 1'b0;
  smx_nc_err_n= smx_nc_err;
  case(to_cs) 
    s0: begin  // wait any timeout
 	  if(any_to_n) begin
            to_ns= s1;
	  end
	end
    s1: begin  // grp cnt sample
	  if(to_grp_n[grpcnt]) begin
	    ld_tid_addr_n= 1'b1;
	    inc_grpcnt_n= 1'b1; // inc for next round
            to_ns= s2;
	  end
	  else begin
	    inc_grpcnt_n= 1'b1;
	    to_ns= (any_to_n)? s0 : s1;
	  end
	end
    s2: begin  // serve tid_addr ({grpcnt, sel_map_addr_n})
		// tid_addr must be valid at s2,s3,s4
		// rd xtb
 	  tohdl_xtb_rd_n= 1'b1;
	  timeout_rst_n= 1'b1; // rst timeout bit
	  to_ns= s3;
	end
    s3: begin   // wait xtb
	  if(tohdl_xtb_rd_ack) begin
	    tohdl_xtb_rd_n= 1'b0;
	    if(tohdl_xtb_rdata_err) begin
	      smx_nc_err_n= 1'b1; // uncorrectable
	      tohdl_set_intr_n= 1'b1;
	      to_ns= s5;
	    end
	    else begin
	      tohdl_cmdl_req_n= 1'b1;
	      ld_cmd_n= 1'b1;
	      to_ns= s4;
	    end
	  end
	end
    s4: begin   // wait cmdl ack
	  if(cmdl_tohdl_ack) begin	
	    tohdl_cmdl_req_n= 1'b0;
	    to_ns= (any_to_n)? s0: s1; 
	  end
	end 
    s5: begin   // xid err
		// remain here
  	  to_ns= to_cs;
	end 
  endcase
end

always @ ( /*AUTOSENSE*/grpcnt or map_addr_0_n or map_addr_10_n
	  or map_addr_11_n or map_addr_12_n or map_addr_13_n
	  or map_addr_14_n or map_addr_15_n or map_addr_1_n
	  or map_addr_2_n or map_addr_3_n or map_addr_4_n
	  or map_addr_5_n or map_addr_6_n or map_addr_7_n
	  or map_addr_8_n or map_addr_9_n) begin 
  case(grpcnt)
    4'h0: sel_map_addr_n= map_addr_0_n; 
    4'h1: sel_map_addr_n= map_addr_1_n; 
    4'h2: sel_map_addr_n= map_addr_2_n; 
    4'h3: sel_map_addr_n= map_addr_3_n; 
    4'h4: sel_map_addr_n= map_addr_4_n; 
    4'h5: sel_map_addr_n= map_addr_5_n; 
    4'h6: sel_map_addr_n= map_addr_6_n; 
    4'h7: sel_map_addr_n= map_addr_7_n; 
    4'h8: sel_map_addr_n= map_addr_8_n; 
    4'h9: sel_map_addr_n= map_addr_9_n; 
    4'ha: sel_map_addr_n= map_addr_10_n; 
    4'hb: sel_map_addr_n= map_addr_11_n; 
    4'hc: sel_map_addr_n= map_addr_12_n; 
    4'hd: sel_map_addr_n= map_addr_13_n; 
    4'he: sel_map_addr_n= map_addr_14_n; 
    4'hf: sel_map_addr_n= map_addr_15_n; 
  endcase
end

wire [5:0] tohdl_xtb_raddr= tid_addr;
wire [63:0] tohdl_cmdl_addr_n= tohdl_xtb_rdata[`SMX_XTB_POS_ADDR];
wire [13:0] tohdl_cmdl_len_n= tohdl_xtb_rdata[`SMX_XTB_POS_LEN];
wire [1:0] tohdl_cmdl_port_n= tohdl_xtb_rdata[`SMX_XTB_POS_PORT];
wire [4:0] tohdl_cmdl_dma_n= tohdl_xtb_rdata[`SMX_XTB_POS_DMA];
wire [7:0] tohdl_cmdl_client_n= tohdl_xtb_rdata[`SMX_XTB_POS_CLIENT];
wire [5:0] tohdl_cmdl_xid_n= tid_addr;
wire [5:0] timeout_rst_addr= tid_addr;

reg [63:0] tohdl_cmdl_addr;
reg [13:0] tohdl_cmdl_len;
reg [1:0] tohdl_cmdl_port;
reg [4:0] tohdl_cmdl_dma;
reg [7:0] tohdl_cmdl_client;
reg [5:0] tohdl_cmdl_xid;
reg [7:0] tohdl_cmdl_cmd;


always @(posedge clk) begin
  if(!reset_l) begin
    timeout_rst<= `SMX_PD 1'b0;
    smx_nc_err<= `SMX_PD 1'b0;
    tohdl_xtb_rd<= `SMX_PD 1'b0;
    tohdl_cmdl_req<= `SMX_PD 1'b0; 
    to_cs<= `SMX_PD s0;
    grpcnt<= `SMX_PD 4'h0;
  end
  else begin
    timeout_rst<= `SMX_PD timeout_rst_n;
    smx_nc_err<= `SMX_PD smx_nc_err_n;
    tohdl_xtb_rd<= `SMX_PD tohdl_xtb_rd_n;
    tohdl_cmdl_req<= `SMX_PD tohdl_cmdl_req_n; 
    to_cs<= `SMX_PD to_ns;
    if(inc_grpcnt_n) grpcnt<= `SMX_PD grpcnt + 1'b1;
  end
end

always @(posedge clk) begin
  if(ld_tid_addr_n) tid_addr<= `SMX_PD {grpcnt, sel_map_addr_n};
  if(ld_cmd_n) begin
    tohdl_cmdl_addr<= `SMX_PD tohdl_cmdl_addr_n;
    tohdl_cmdl_len<= `SMX_PD tohdl_cmdl_len_n;
    tohdl_cmdl_port<= `SMX_PD tohdl_cmdl_port_n;
    tohdl_cmdl_dma<= `SMX_PD tohdl_cmdl_dma_n;
    tohdl_cmdl_client<= `SMX_PD tohdl_cmdl_client_n;
    tohdl_cmdl_xid<= `SMX_PD  tohdl_cmdl_xid_n;
    tohdl_cmdl_cmd<= `SMX_PD  {3'h0, 2'b00,`SMX_CMD_COMP_WITHOUT_DATA}; 
			// error type= 2'b11;  
  end
end

endmodule


