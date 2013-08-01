// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_resp_cmdlaunch.v
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

module niu_smx_sm_resp_cmdlaunch(
/*AUTOARG*/
   // Outputs
   smx_dmc_rdy, smx_dmc_cmd, smx_dmc_cmd_status, smx_dmc_addr, 
   smx_dmc_len, smx_dmc_xid, smx_dmc_port, smx_dmc_dma, 
   smx_dmc_client, smx_dmc_ack_rdy, smx_dmc_ack_cmd, 
   smx_dmc_ack_cmd_status, 
   smx_dmc_ack_xid, 
   smx_dmc_ack_dma, 
   smx_dmc_ack_client, rst_procflag, dvflag, 
   dvflag_with_data, dvflag_line_en, dvflag_sop_pos, dvflag_eop_pos, 
   dvflag_sop_byte_en, dvflag_eop_byte_en, dvflag_client, 
   dvflag_xcomp, dvflag_status, early_dvflag, early_dvflag_with_data, 
   early_dvflag_line_en, early_dvflag_sop_pos, early_dvflag_eop_pos, 
   early_dvflag_sop_byte_en, early_dvflag_eop_byte_en, 
   early_dvflag_client, early_dvflag_xcomp, early_dvflag_status, 
   cmdl_tohdl_ack, cmdl_cs, 
   // Inputs
   clk, reset_l, dmc_smx_accept, dmc_smx_ack_accept, procflag, 
   procflag_cmd, procflag_addr, procflag_xid, 
   procflag_port, procflag_dma, procflag_client, 
   procflag_sop_line_en, procflag_eop_line_en, procflag_sop_byte_en, 
   procflag_eop_byte_en, procflag_err, procflag_rd, 
   procflag_with_data, procflag_xcomp, procflag_sop, procflag_eop, 
   rst_dvflag, dv_idle, tohdl_cmdl_req, tohdl_cmdl_cmd, 
   tohdl_cmdl_addr, tohdl_cmdl_len, tohdl_cmdl_xid, tohdl_cmdl_port, 
   tohdl_cmdl_dma, tohdl_cmdl_client, tid_dirty_rdata_bus
   );

input		clk;
input		reset_l;

	// dmc if
output 		smx_dmc_rdy;
output [7:0] 	smx_dmc_cmd;
output [3:0] 	smx_dmc_cmd_status;
output [63:0] 	smx_dmc_addr;
output [13:0] 	smx_dmc_len;
output [5:0] 	smx_dmc_xid;
output [1:0] 	smx_dmc_port;
output [4:0] 	smx_dmc_dma;
output [7:0] 	smx_dmc_client;
input [7:0] 	dmc_smx_accept;

	// ack if
output 		smx_dmc_ack_rdy;
output [7:0] 	smx_dmc_ack_cmd;
output [3:0] 	smx_dmc_ack_cmd_status;
// output [63:0] 	smx_dmc_ack_addr;
// output [13:0] 	smx_dmc_ack_len;
output [5:0] 	smx_dmc_ack_xid;
// output [1:0] 	smx_dmc_ack_port;
output [4:0] 	smx_dmc_ack_dma;
output [7:0] 	smx_dmc_ack_client;
input [7:0] 	dmc_smx_ack_accept;

	// cmdproc if
input 		procflag;
input [7:0] 	procflag_cmd;
input [63:0] 	procflag_addr;
input [5:0] 	procflag_xid;
input [1:0] 	procflag_port;
input [4:0] 	procflag_dma;
input [7:0] 	procflag_client;
input [3:0] 	procflag_sop_line_en;
input [3:0] 	procflag_eop_line_en;
input [3:0] 	procflag_sop_byte_en;
input [3:0] 	procflag_eop_byte_en;
input [2:0] 	procflag_err;
input 		procflag_rd;  // rd= 1, wr= 0 
input 		procflag_with_data;  //1- data,  0- no data 
input 		procflag_xcomp;
input 		procflag_sop;
input 		procflag_eop;
output 		rst_procflag;

// output  	cmdlaunch_idle;   // in case need save 1 cycle at start
// input 		early_procflag;
// input [150:0] 	early_procflag_data; // not use for now


// dv if
output 		dvflag;
output [1:0]	dvflag_with_data; // 1= rd (data,dv also sio dq) , 
				  // 0= wr/rderr (sio dq only) 
output [3:0] 	dvflag_line_en;
output [3:0] 	dvflag_sop_pos; // indicate first data line position
output [3:0] 	dvflag_eop_pos; // indicate last data line position
output [15:0] 	dvflag_sop_byte_en; // use this for 'first' data line
output [15:0] 	dvflag_eop_byte_en; // use this for 'last' data line 
output [7:0] 	dvflag_client;
output [3:0] 	dvflag_xcomp;
output [3:0] 	dvflag_status;
input 		rst_dvflag;

input 		dv_idle;  // dv in idle state
output 		early_dvflag; // dv needs to be in idle to catch this pulse
			      // and dvflag not set 
output [1:0]	early_dvflag_with_data; // 1= rd (data,dv also sio dq) , 
				        // 0= wr/rderr (sio dq only) 
output [3:0] 	early_dvflag_line_en;
output [3:0] 	early_dvflag_sop_pos; // indicate first data line position
output [3:0] 	early_dvflag_eop_pos; // indicate last data line position
output [15:0] 	early_dvflag_sop_byte_en; // use this for 'first' data line
output [15:0] 	early_dvflag_eop_byte_en; // use this for 'last' data line 
output [7:0] 	early_dvflag_client;
output [3:0] 	early_dvflag_xcomp;
output [3:0] 	early_dvflag_status;

	// TO handler if
input		tohdl_cmdl_req;
input [7:0] 	tohdl_cmdl_cmd;
input [63:0] 	tohdl_cmdl_addr;
input [13:0] 	tohdl_cmdl_len;
input [5:0] 	tohdl_cmdl_xid;
input [1:0] 	tohdl_cmdl_port;
input [4:0] 	tohdl_cmdl_dma;
input [7:0] 	tohdl_cmdl_client;
output		cmdl_tohdl_ack;

output [2:0] cmdl_cs;

	// status i/f 
input [63:0] tid_dirty_rdata_bus; 

function [15:0] decode_eop_16b_byte_en_little; // B15,B14..,B1,B0
  input [3:0] offset;

  reg [15:0] byte_en;
  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'h1;
      4'h2: byte_en= 16'h3;
      4'h3: byte_en= 16'h7;
      4'h4: byte_en= 16'hf;
      4'h5: byte_en= 16'h1f;
      4'h6: byte_en= 16'h3f;
      4'h7: byte_en= 16'h7f;
      4'h8: byte_en= 16'hff;
      4'h9: byte_en= 16'h1ff;
      4'ha: byte_en= 16'h3ff;
      4'hb: byte_en= 16'h7ff;
      4'hc: byte_en= 16'hfff;
      4'hd: byte_en= 16'h1fff;
      4'he: byte_en= 16'h3fff;
      4'hf: byte_en= 16'h7fff;
    endcase
    decode_eop_16b_byte_en_little= byte_en;
  end
endfunction

function [15:0] decode_sop_16b_byte_en_little; // B15,B14..,B1,B0
  input [3:0] offset;

  reg [15:0] byte_en;
  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'hfffe;
      4'h2: byte_en= 16'hfffc;
      4'h3: byte_en= 16'hfff8;
      4'h4: byte_en= 16'hfff0;
      4'h5: byte_en= 16'hffe0;
      4'h6: byte_en= 16'hffc0;
      4'h7: byte_en= 16'hff80;
      4'h8: byte_en= 16'hff00;
      4'h9: byte_en= 16'hfe00;
      4'ha: byte_en= 16'hfc00;
      4'hb: byte_en= 16'hf800;
      4'hc: byte_en= 16'hf000;
      4'hd: byte_en= 16'he000;
      4'he: byte_en= 16'hc000;
      4'hf: byte_en= 16'h8000;
    endcase
    decode_sop_16b_byte_en_little= byte_en;
  end
endfunction


/*
function [15:0] decode_eop_16b_byte_en_big; // B0,B1...,B14,B15
  input [3:0] offset;

  reg [15:0] byte_en;

  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'h8000;
      4'h2: byte_en= 16'hc000;
      4'h3: byte_en= 16'he000;
      4'h4: byte_en= 16'hf000;
      4'h5: byte_en= 16'hf800;
      4'h6: byte_en= 16'hfc00;
      4'h7: byte_en= 16'hfe00;
      4'h8: byte_en= 16'hff00;
      4'h9: byte_en= 16'hff80;
      4'ha: byte_en= 16'hffc0;
      4'hb: byte_en= 16'hffe0;
      4'hc: byte_en= 16'hfff0;
      4'hd: byte_en= 16'hfff8;
      4'he: byte_en= 16'hfffc;
      4'hf: byte_en= 16'hfffe;
    endcase
    decode_eop_16b_byte_en_big= byte_en;
  end
endfunction

function [15:0] decode_sop_16b_byte_en_big; // B0,B1...,B14,B15
  input [3:0] offset;

  reg [15:0] byte_en;

  begin
    case(offset)
      4'h0: byte_en= 16'hffff;
      4'h1: byte_en= 16'h7fff;
      4'h2: byte_en= 16'h3fff;
      4'h3: byte_en= 16'h1fff;
      4'h4: byte_en= 16'h0fff;
      4'h5: byte_en= 16'h07ff;
      4'h6: byte_en= 16'h03ff;
      4'h7: byte_en= 16'h01ff;
      4'h8: byte_en= 16'h00ff;
      4'h9: byte_en= 16'h007f;
      4'ha: byte_en= 16'h003f;
      4'hb: byte_en= 16'h001f;
      4'hc: byte_en= 16'h000f;
      4'hd: byte_en= 16'h0007;
      4'he: byte_en= 16'h0003;
      4'hf: byte_en= 16'h0001;
    endcase
    decode_sop_16b_byte_en_big= byte_en;
  end
endfunction
*/

parameter cmdl_s0= 3'h0,
	  cmdl_s1= 3'h1,
	  cmdl_s2= 3'h2,
 	  cmdl_s3= 3'h3,
 	  cmdl_s4= 3'h4;


wire client_accept_n= (|(dmc_smx_accept & smx_dmc_client)) |
		      (|(dmc_smx_ack_accept & smx_dmc_ack_client));

reg early_dvflag_n;
wire early_dvflag= early_dvflag_n;

reg rst_procflag_n;
wire rst_procflag= rst_procflag_n;


reg smx_dmc_rdy_n, smx_dmc_rdy ;
reg smx_dmc_ack_rdy_n, smx_dmc_ack_rdy ;
reg ld_dmc_n;
reg set_dvflag_n;
reg dvflag;
reg [2:0] cmdl_ns, cmdl_cs;
wire cmdl_req_n=  procflag && !dvflag;
reg rst_serve_tohdl_n;
reg cmdl_tohdl_ack_n;
wire cmdl_tohdl_ack= cmdl_tohdl_ack_n;
reg serve_tohdl;

wire proc_tid_is_dirty= tid_dirty_rdata_bus[procflag_xid];

always @(/*AUTOSENSE*/client_accept_n or cmdl_cs or cmdl_req_n
	 or dv_idle or dvflag or procflag or procflag_err
	 or procflag_rd or serve_tohdl or smx_dmc_ack_rdy
	 or smx_dmc_rdy or tohdl_cmdl_req or tohdl_cmdl_xid 
	 or proc_tid_is_dirty) begin
  smx_dmc_rdy_n= smx_dmc_rdy;
  smx_dmc_ack_rdy_n= smx_dmc_ack_rdy;
  ld_dmc_n= 1'b0;  // pulse to flop out smx_dmc cmd bus
  set_dvflag_n= 1'b0; // also set dvflag_data
  early_dvflag_n= 1'b0;
  rst_procflag_n= 1'b0;
  rst_serve_tohdl_n= 1'b0;
  cmdl_tohdl_ack_n= 1'b0;
  cmdl_ns= cmdl_cs;
  case(cmdl_cs)
    cmdl_s0: begin  // wait procflag  & !dvflag
		     // gen early_dvflag_xx using procflag_xx

			// err ???  time share this with
			// err handle;
			// if both arb:  serve_errhdl_first & lauch_err, cmdl_s3 (errhdl state) 
			// set served errhdl_first= each regular served
			// rst each errhdl served
			//
	       if(tohdl_cmdl_req & (serve_tohdl | (~serve_tohdl & ~cmdl_req_n))) begin
 		 if(!dvflag) cmdl_ns= cmdl_s3;
	       end
	       else begin	
	         if(procflag && !dvflag) begin
			// flop in procflag_xx (->early_dvflag_xx)
	           rst_procflag_n= 1'b1; 
		   if(procflag_err[0] | proc_tid_is_dirty) begin // pkterr; drop pkt
		     cmdl_ns= cmdl_s2;
		   end
		   else begin // launch cmd
		     if(procflag_rd) // rd
	               smx_dmc_rdy_n= 1'b1; 
		     else 	// wr
	               smx_dmc_ack_rdy_n= 1'b1; 
		     ld_dmc_n= 1'b1;  // flop out dmc cmd bus
		     cmdl_ns= cmdl_s1;
		   end
	         end
 	       end	
	     end
    cmdl_s1: begin  // wait dmc client accept
		   // use procflag_xx_r to derive dvflag_xx_n
	       if(client_accept_n) begin
	         if(dv_idle) // kick dv earlier; save one cycle at start
	           early_dvflag_n= 1'b1; // early_dvflag_xx available
  	         else
		   set_dvflag_n= 1'b1;
	         smx_dmc_rdy_n= 1'b0;  // put all rdy to 0
	         smx_dmc_ack_rdy_n= 1'b0;
		 cmdl_ns= cmdl_s0;
	       end
	     end
    cmdl_s2: begin // pkterr; drop pkt
	       set_dvflag_n= 1'b1;
	       cmdl_ns= cmdl_s0;
	     end	
    cmdl_s3: begin // TO hdlr
	       rst_serve_tohdl_n= 1'b1;
	       ld_dmc_n= 1'b1;
	       if(tohdl_cmdl_xid[5]) // wr	
	         smx_dmc_ack_rdy_n= 1'b1; 
 	       else	
	         smx_dmc_rdy_n= 1'b1; 
	       cmdl_ns= cmdl_s4;	
	     end
    cmdl_s4: begin
	       if(client_accept_n) begin
		 set_dvflag_n= 1'b1;
	         smx_dmc_rdy_n= 1'b0;  // put all rdy to 0
	         smx_dmc_ack_rdy_n= 1'b0;
  	         cmdl_tohdl_ack_n= 1'b1;
		 cmdl_ns= cmdl_s0;
	       end
	     end
  endcase
end

always @(posedge clk) begin
  if(!reset_l) begin
    cmdl_cs<= `SMX_PD  cmdl_s0;
    smx_dmc_rdy<= `SMX_PD  1'b0;
    smx_dmc_ack_rdy<= `SMX_PD  1'b0;
    dvflag<= `SMX_PD  1'b0;
    serve_tohdl<= `SMX_PD 1'b0;
  end
  else begin
    cmdl_cs<= `SMX_PD  cmdl_ns;
    smx_dmc_rdy<= `SMX_PD  smx_dmc_rdy_n;
    smx_dmc_ack_rdy<= `SMX_PD  smx_dmc_ack_rdy_n;
    if(set_dvflag_n) dvflag<= `SMX_PD  1'b1;
    else if(rst_dvflag) dvflag<= `SMX_PD  1'b0;
    if(rst_procflag_n) serve_tohdl<= `SMX_PD 1'b1;
    else if(rst_serve_tohdl_n) serve_tohdl<= `SMX_PD 1'b0;
  end
end

// wire cmdlaunch_idle= (cmdl_cs==cmdl_s0);

// reg [3:0] procflag_sop_line_en_r;
// reg [3:0] procflag_eop_line_en_r;
// reg [3:0] procflag_sop_byte_en_r;
// reg [3:0] procflag_eop_byte_en_r;
// reg [2:0] procflag_err_r;
// reg procflag_rd_r;
// reg procflag_with_data_r;
// reg procflag_xcomp_r;
// reg procflag_sop_r;
// reg procflag_eop_r;

reg [7:0] 	smx_dmc_cmd;
reg [3:0] 	smx_dmc_cmd_status;
reg [63:0] 	smx_dmc_addr;
reg [13:0] 	smx_dmc_len;
reg [5:0] 	smx_dmc_xid;
reg [1:0] 	smx_dmc_port;
reg [4:0] 	smx_dmc_dma;
reg [7:0] 	smx_dmc_client;

// wire [63:0] 	smx_dmc_ack_addr= smx_dmc_addr;
// wire [13:0] 	smx_dmc_ack_len= smx_dmc_len;
// wire [1:0] 	smx_dmc_ack_port= smx_dmc_port;

// cc registered to prevent ghosting effect with response bus 062905
// wire [7:0]	smx_dmc_ack_cmd= smx_dmc_cmd;
// wire [3:0]	smx_dmc_ack_cmd_status= smx_dmc_cmd_status;
// wire [5:0]	smx_dmc_ack_xid= smx_dmc_xid;
// wire [4:0]	smx_dmc_ack_dma= smx_dmc_dma;
// wire [7:0]	smx_dmc_ack_client= smx_dmc_client;

reg [6:0]       resp_len_n;

reg [7:0] smx_dmc_ack_cmd;
reg [3:0] smx_dmc_ack_cmd_status;
reg [5:0] smx_dmc_ack_xid;
reg [4:0] smx_dmc_ack_dma;
reg [7:0] smx_dmc_ack_client;

always @(posedge clk) begin
  if(ld_dmc_n & smx_dmc_ack_rdy_n) begin // cc qualify to smx_dmc_ack_rdy_n 062905
     smx_dmc_ack_cmd        <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_cmd : procflag_cmd;
     smx_dmc_ack_cmd_status <= `SMX_PD  (rst_serve_tohdl_n)? 4'hf : 4'h0;  
     smx_dmc_ack_xid        <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_xid : procflag_xid;
     smx_dmc_ack_dma        <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_dma : procflag_dma;
     smx_dmc_ack_client     <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_client : procflag_client;
  end
end

always @(posedge clk) begin
  if(ld_dmc_n & smx_dmc_rdy_n) begin  // cc qualify to smx_dmc_rdy_n 062905
    smx_dmc_cmd         <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_cmd  : procflag_cmd;
    smx_dmc_cmd_status  <= `SMX_PD  (rst_serve_tohdl_n)? 4'hf : 4'h0;
    smx_dmc_addr        <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_addr : procflag_addr;
    smx_dmc_len         <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_len  : {7'h0, resp_len_n};
    smx_dmc_xid         <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_xid  : procflag_xid;
    smx_dmc_port        <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_port : procflag_port;
    smx_dmc_dma         <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_dma  : procflag_dma;
    smx_dmc_client      <= `SMX_PD  (rst_serve_tohdl_n)? tohdl_cmdl_client : procflag_client;

    		// also make own copy of non dmc
		// make not need this copy ???
 //   procflag_sop_line_en_r<= `SMX_PD  procflag_sop_line_en;
 //  procflag_eop_line_en_r<= `SMX_PD  procflag_eop_line_en;
//   procflag_sop_byte_en_r<= `SMX_PD  procflag_sop_byte_en;
//   procflag_eop_byte_en_r<= `SMX_PD  procflag_eop_byte_en;
//    procflag_err_r<= `SMX_PD  procflag_err; 
//    procflag_rd_r<= `SMX_PD  procflag_rd; 
//    procflag_with_data_r<= `SMX_PD  procflag_with_data; 
 //   procflag_xcomp_r<= `SMX_PD  procflag_xcomp; 
 //   procflag_sop_r<= `SMX_PD  procflag_sop; 
 //   procflag_eop_r<= `SMX_PD  procflag_eop; 
  end
end

reg [3:0] dvflag_line_en_n;
always @ (/*AUTOSENSE*/procflag_eop or procflag_eop_line_en
	  or procflag_sop or procflag_sop_line_en) begin
  case({procflag_sop, procflag_eop})
    2'b00: dvflag_line_en_n= 4'hf; // mid of pkt   
    2'b01: dvflag_line_en_n= procflag_eop_line_en; // rcving eop
    2'b10: dvflag_line_en_n= procflag_sop_line_en; // rcving sop
    2'b11: dvflag_line_en_n= (procflag_sop_line_en & procflag_eop_line_en); // single 64B
  endcase
end

reg [3:0] dvflag_sop_pos_n;
always @ (/*AUTOSENSE*/procflag_sop_line_en) begin
    dvflag_sop_pos_n= 4'h0;
    case(procflag_sop_line_en)
      4'b1111: dvflag_sop_pos_n= 4'b0001;
      4'b1110: dvflag_sop_pos_n= 4'b0010;
      4'b1100: dvflag_sop_pos_n= 4'b0100;
      4'b1000: dvflag_sop_pos_n= 4'b1000;
      default: dvflag_sop_pos_n= 4'b0000;
    endcase
end

reg [3:0] dvflag_eop_pos_n;
always @ (/*AUTOSENSE*/procflag_eop_line_en) begin
    dvflag_eop_pos_n= 4'h0;
    case(procflag_eop_line_en)
      4'b1111: dvflag_eop_pos_n= 4'b1000;
      4'b0111: dvflag_eop_pos_n= 4'b0100;
      4'b0011: dvflag_eop_pos_n= 4'b0010;
      4'b0001: dvflag_eop_pos_n= 4'b0001;
      default: dvflag_eop_pos_n= 4'b0000;
    endcase
end

wire [3:0] dvflag_xcomp_n; 
assign  dvflag_xcomp_n[3]= procflag_xcomp & dvflag_line_en_n[3];  
assign  dvflag_xcomp_n[2]= procflag_xcomp && (dvflag_line_en_n[3:2]==2'b01);  
assign  dvflag_xcomp_n[1]= procflag_xcomp && (dvflag_line_en_n[3:1]==3'b001);  
assign  dvflag_xcomp_n[0]= (procflag_xcomp && (dvflag_line_en_n[3:0]==4'b0001)) || // rd
			   (~procflag_rd && procflag_xcomp); // wr  

reg [1:0]	dvflag_with_data; 
reg [3:0] 	dvflag_line_en;
reg [3:0] 	dvflag_sop_pos; // indicate first data line position
reg [3:0] 	dvflag_eop_pos; // indicate last data line position
reg [15:0] 	dvflag_sop_byte_en; // use this for 'first' data line
reg [15:0] 	dvflag_eop_byte_en; // use this for 'last' data line 
reg [7:0] 	dvflag_client;
reg [3:0] 	dvflag_xcomp;
reg [3:0] 	dvflag_status;

reg [1:0] 	early_dvflag_with_data; // 1= rd (data,dv also sio dq) , 
				        // 0= wr/rderr (sio dq only) 
reg [3:0] 	early_dvflag_line_en;
reg [3:0] 	early_dvflag_sop_pos; // indicate first data line position
reg [3:0] 	early_dvflag_eop_pos; // indicate last data line position
reg [15:0] 	early_dvflag_sop_byte_en; // use this for 'first' data line
reg [15:0] 	early_dvflag_eop_byte_en; // use this for 'last' data line 
reg [7:0] 	early_dvflag_client;
reg [3:0] 	early_dvflag_xcomp;
reg [3:0] 	early_dvflag_status;


wire procflag_err_0_cond= proc_tid_is_dirty? 1'b1 : procflag_err[0];

always @(posedge clk) begin
  if(rst_procflag_n) begin // make early dvflag_xxx
    early_dvflag_with_data<= `SMX_PD  {procflag_rd, procflag_with_data};  
    early_dvflag_line_en<= `SMX_PD  dvflag_line_en_n;
			// if rcving sop, sop at line X, else 0
    early_dvflag_sop_pos<= `SMX_PD  (procflag_sop)? dvflag_sop_pos_n : 4'h0; 
			// if rcving eop, eop at line X, else 0
    early_dvflag_eop_pos<= `SMX_PD  (procflag_eop)? dvflag_eop_pos_n : 4'h0; 
			// if 1 in sop/eop_pos , use sop/eop_byte_en
    early_dvflag_sop_byte_en<= `SMX_PD  decode_sop_16b_byte_en_little(procflag_sop_byte_en); 
    early_dvflag_eop_byte_en<= `SMX_PD  decode_eop_16b_byte_en_little(procflag_eop_byte_en); 
    early_dvflag_xcomp<= `SMX_PD  dvflag_xcomp_n;
    early_dvflag_status<= `SMX_PD  {1'b0, procflag_err[2:1],procflag_err_0_cond}; // extract from  procflag_err
    early_dvflag_client<= `SMX_PD  procflag_client;
  end
  if(set_dvflag_n) begin
    dvflag_with_data<= `SMX_PD  (cmdl_tohdl_ack_n)? {~tohdl_cmdl_xid[5], 1'b0} :
							 early_dvflag_with_data;
    dvflag_line_en<= `SMX_PD  (cmdl_tohdl_ack_n)? 4'h0 : early_dvflag_line_en;
    dvflag_sop_pos<= `SMX_PD  (cmdl_tohdl_ack_n)? 4'h0: early_dvflag_sop_pos;
    dvflag_eop_pos<= `SMX_PD  (cmdl_tohdl_ack_n)? 4'h0: early_dvflag_eop_pos;
    dvflag_sop_byte_en<= `SMX_PD  (cmdl_tohdl_ack_n)? 16'h0: early_dvflag_sop_byte_en; 
    dvflag_eop_byte_en<= `SMX_PD  (cmdl_tohdl_ack_n)? 16'h0: early_dvflag_eop_byte_en; 
    dvflag_xcomp<= `SMX_PD  (cmdl_tohdl_ack_n)? 4'h1 : early_dvflag_xcomp; 
    dvflag_status<= `SMX_PD  (cmdl_tohdl_ack_n)? 4'h0 : early_dvflag_status;
    dvflag_client<= `SMX_PD  (cmdl_tohdl_ack_n)? tohdl_cmdl_client : early_dvflag_client; 
  end
/*
  ??? note if need to have bubble between accept and dv,
      need to put this back; right now, dv assert immediate
      after accpet ??? 
    or simply hard code dv_idle to 0;
  
  if(set_dvflag_n) begin // right hand side all xx_r; gen dvflag_xx late
		// important!!
		// remember to chg dvflag_xx_n above to use _r if wanna use this
		//   line_en_n, eop/sop_pos_n.... 	
		// important!!
    dvflag_with_data<= `SMX_PD  procflag_with_data_r;  
    dvflag_line_en<= `SMX_PD  dvflag_line_en_n;
    dvflag_sop_pos<= `SMX_PD  (procflag_sop_r)? dvflag_sop_pos_n : 4'h0; 
    dvflag_eop_pos<= `SMX_PD  (procflag_eop_r)? dvflag_eop_pos_n : 4'h0; 
    dvflag_sop_byte_en<= `SMX_PD  decode_sop_16b_byte_en_big(procflag_sop_byte_en_r); 
    dvflag_eop_byte_en<= `SMX_PD  decode_eop_16b_byte_en_big(procflag_eop_byte_en_r); 
    dvflag_xcomp<= `SMX_PD  procflag_xcomp_r;
    dvflag_status<= `SMX_PD  4'h0; // extract from  procflag_err ???;
    dvflag_client<= `SMX_PD  smx_dmc_client;
  end
*/
end

// adj resp_len to be actual len 
// not sure if timing can be a problem ??

wire [1:0] sum_line_en_n= {1'b0, dvflag_line_en_n[0]} + 
			  {1'b0, dvflag_line_en_n[1]} +
			  {1'b0, dvflag_line_en_n[2]} +
			  {1'b0, dvflag_line_en_n[3]};
reg [6:0] sum_line_en_in_byte_n;  // line_en in bytes

always @(/*AUTOSENSE*/sum_line_en_n) begin
  case(sum_line_en_n)
    2'h0: sum_line_en_in_byte_n= 7'd64;
    2'h1: sum_line_en_in_byte_n= 7'd16;
    2'h2: sum_line_en_in_byte_n= 7'd32;
    2'h3: sum_line_en_in_byte_n= 7'd48;
    default: sum_line_en_in_byte_n= 7'd64;
  endcase
end

//wire [4:0] sop_firstline_in_byte_n= 5'd16 - {1'b0, procflag_sop_byte_en};
wire [4:0] sop_firstline_notuse_in_byte_n= {1'b0, procflag_sop_byte_en};
wire [4:0] eop_lastline_in_byte_n= (|procflag_eop_byte_en)? 
				{1'b0, procflag_eop_byte_en} : 5'd16;
wire [4:0] eop_lastline_notuse_in_byte_n= 5'd16 - eop_lastline_in_byte_n;

always @(/*AUTOSENSE*/eop_lastline_notuse_in_byte_n or procflag_eop
	 or procflag_sop or sop_firstline_notuse_in_byte_n
	 or sum_line_en_in_byte_n) begin
  case({procflag_sop, procflag_eop})
    2'h0: resp_len_n= sum_line_en_in_byte_n; // mid resp 
    2'h1: resp_len_n= sum_line_en_in_byte_n - {2'h0, eop_lastline_notuse_in_byte_n}; // eop 
    2'h2: resp_len_n= sum_line_en_in_byte_n - {2'h0, sop_firstline_notuse_in_byte_n}; // sop
    2'h3: resp_len_n= sum_line_en_in_byte_n - {2'h0, sop_firstline_notuse_in_byte_n} 
					     - {2'h0, eop_lastline_notuse_in_byte_n}; 
							// sop/eop in this resp chunk 
    default: resp_len_n= 7'd64;
  endcase
end

endmodule





