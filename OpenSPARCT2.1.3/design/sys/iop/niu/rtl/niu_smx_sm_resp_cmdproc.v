// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_resp_cmdproc.v
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

module niu_smx_sm_resp_cmdproc(
/*AUTOARG*/
   // Outputs
   resp_cmdff_rd, xtb_rd, xtb_raddr, xtb_rcvfile_update, 
   xtb_rcvfile_update_addr, tid_valid_rst0, tid_valid_rst_addr0, 
   tid_valid_rd, tid_valid_raddr, resp_rcv_set, resp_rcv_set_addr, 
   procflag, procflag_cmd, procflag_addr, procflag_xid, 
   procflag_port, procflag_dma, procflag_client, 
   procflag_sop_line_en, procflag_eop_line_en, procflag_sop_byte_en, 
   procflag_eop_byte_en, procflag_err, procflag_rd, 
   procflag_with_data, procflag_sop, procflag_eop, procflag_xcomp, 
   niu_sio_dq, proc_cs, 
   // Inputs
   clk, reset_l, resp_cmdff_empty, resp_cmdff_rdata, xtb_rdata, 
   xtb_rd_ack, xtb_rdata_err, tid_valid_rdata, rst_procflag
   );

input		clk;
input		reset_l;

// resp cmdff if
input 		resp_cmdff_empty;
input [21:0] 	resp_cmdff_rdata;
output 		resp_cmdff_rd;


// xtb if
output 		xtb_rd;
output [5:0] 	xtb_raddr;
input [128:0] 	xtb_rdata;
input		xtb_rd_ack;
input		xtb_rdata_err;
output          xtb_rcvfile_update;
output [5:0]    xtb_rcvfile_update_addr;

// status if
output tid_valid_rst0;
output [5:0] tid_valid_rst_addr0;

output tid_valid_rd;
output [5:0] tid_valid_raddr;
input tid_valid_rdata;

output resp_rcv_set;
output [5:0] resp_rcv_set_addr;



// resp cmdlaunch if
output 		procflag;
output [7:0] 	procflag_cmd;
output [63:0] 	procflag_addr;
// output [13:0] 	procflag_len;
output [5:0] 	procflag_xid;
output [1:0] 	procflag_port;
output [4:0] 	procflag_dma;
output [7:0] 	procflag_client;
output [3:0] 	procflag_sop_line_en;
output [3:0] 	procflag_eop_line_en;
output [3:0] 	procflag_sop_byte_en;
output [3:0] 	procflag_eop_byte_en;
output [2:0] 	procflag_err;  // [0] - pkterr; pkt drop
				// [2:1] - reserved
output 		procflag_rd;  // rd= 1, wr= 0 
output 		procflag_with_data;  // 1- data, 0- no data (payload)  
output 		procflag_sop;  // sop portion rcving
output 		procflag_eop; // eop portion rcving
output 		procflag_xcomp;  // all rcv'd
input 		rst_procflag;

// input  		cmdlaunch_idle;   // in case need save 1 cycle at start
// output 		early_procflag;  // not use for now ???
// output [150:0] 	early_procflag_data; // not use for now ???

// sio if
output 		niu_sio_dq;


output [1:0] proc_cs;

parameter proc_s0= 2'h0,
	  proc_s1= 2'h1,
	  proc_s2= 2'h2,
	  proc_s3= 2'h3;


/*
  xlate to meta cmd
  rd xtb
  rd/wr lineen, sop_be, eop_be, xtb_data, xcomp
 (if wr, dq, no dv)
*/

wire [5:0]  xtb_raddr_n= resp_cmdff_rdata[`SMX_RESP_CMDFF_POS_ID_META];
wire [5:0]  xtb_raddr= xtb_raddr_n;
// made xtb_raddr one cycle earlier 
// reg [5:0] xtb_raddr;  // flop in at set_xtb_rd_n


reg [21:0] resp_cmdff_rdata_r;
reg xtb_rcvfile_update_n;
wire xtb_rcvfile_update= xtb_rcvfile_update_n ;
wire [5:0] xtb_rcvfile_update_addr= resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_ID_META];

reg resp_cmdff_rd_n;
wire resp_cmdff_rd= resp_cmdff_rd_n;

reg tid_valid_rd_n;
wire tid_valid_rd= tid_valid_rd_n;
wire [5:0] tid_valid_raddr= resp_cmdff_rdata[`SMX_RESP_CMDFF_POS_ID_META];

reg resp_rcv_set_n;
wire resp_rcv_set= resp_rcv_set_n;
wire [5:0] resp_rcv_set_addr= resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_ID_META];

reg tid_valid_rst0_n;  
wire tid_valid_rst0= tid_valid_rst0_n;
wire [5:0] tid_valid_rst_addr0= resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_ID_META];

reg ld_cmdff_r_n;
reg set_procflag_n;
reg procflag;
reg ld_procflag_data_n;
reg [1:0] proc_ns, proc_cs;
reg set_xtb_rd_n;  // rst by xtb_rd_ack 
reg pktdrop_n;

wire pkterr= resp_cmdff_rdata[`SMX_RESP_CMDFF_POS_PKTERR];
wire xtb_err_n= (tid_valid_rdata & xtb_rdata_err) | ~tid_valid_rdata;
wire procflag_xcomp_n;
wire xid_comp_n= procflag_xcomp_n & ~xtb_err_n;

always @(/*AUTOSENSE*/pkterr or proc_cs or procflag
	 or resp_cmdff_empty or xid_comp_n or xtb_err_n or xtb_rd_ack) begin
  ld_cmdff_r_n= 1'b0;
  resp_cmdff_rd_n= 1'b0; 
  set_procflag_n= 1'b0; 
  ld_procflag_data_n= 1'b0;
  set_xtb_rd_n= 1'b0;    // set xtb rd; 
  tid_valid_rd_n= 1'b0;  // rd tid_valid flag file
  resp_rcv_set_n= 1'b0;  // set resp_rcv flag 
  tid_valid_rst0_n= 1'b0;  // rst tid_valid flag; 
  xtb_rcvfile_update_n= 1'b0;   // inc rcvcnt
  pktdrop_n= 1'b0;
  proc_ns= proc_cs;
  case(proc_cs)
    proc_s0: begin  // wait for cmdff 
	       if(!resp_cmdff_empty) begin
		 ld_cmdff_r_n= 1'b1;
		 resp_cmdff_rd_n= 1'b1;
		 if(pkterr) begin
		   proc_ns= proc_s2;
		 end
		 else begin // rd xtb only if no pkterr 	
  	           set_xtb_rd_n= 1'b1;
 		   tid_valid_rd_n= 1'b1;
		   proc_ns= proc_s1;
		 end
	       end
	     end	
    proc_s1: begin  // xtb data avail
		// in case need multiple cycle for xtb data (ecc gen)
		// also arb with TO handler
	       if(xtb_rd_ack) begin 
  	         set_xtb_rd_n= 1'b0; // rst xtb_rd
				// set flag only if procflag ready
	 	 if(!procflag) begin
	           set_procflag_n= 1'b1;
	           ld_procflag_data_n= 1'b1;
		   pktdrop_n= xtb_err_n;
		   xtb_rcvfile_update_n= ~xtb_err_n; //inc rcvcnt only if no err 
		   resp_rcv_set_n= xid_comp_n; // set resp rcv flag on each resp
	           tid_valid_rst0_n= xid_comp_n; // rst tid_valid at xcomp
	           proc_ns= proc_s0; 
		 end
		 else proc_ns= proc_s3;
			// wait procflag if not ready
	       end  
   	       else begin // keep xtb_rd '1' until rd ack
  	           set_xtb_rd_n= 1'b1;
	           proc_ns= proc_cs; 
	        end	
	     end	
    proc_s2: begin  // wait procflag empty; pkterr; propagate err
	       if(!procflag) begin
	         set_procflag_n= 1'b1;
	         ld_procflag_data_n= 1'b1; // need this to load pktdrop status
	         pktdrop_n= 1'b1;
	         proc_ns= proc_s0;
 	       end	
	     end
    proc_s3: begin  // wait procflag empty; note xtb_rdata 
	            // (and rcvfile_rdata) needs to stag unchanged from proc_s1; 
		    // in xtb.v,  rdata flopped on each ack; 
	       if(!procflag) begin	
 	         set_procflag_n= 1'b1;
	         ld_procflag_data_n= 1'b1;
		 pktdrop_n= xtb_err_n;
		 xtb_rcvfile_update_n= ~xtb_err_n; //inc rcvcnt only if no err 
		 resp_rcv_set_n= xid_comp_n; // set resp rcv flag on each resp
	         tid_valid_rst0_n= xid_comp_n; // rst tid_valid at xcomp
	         proc_ns= proc_s0; 
               end
	     end
  endcase
end

			// assemble procflag data
wire procflag_sop_n= (resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_SEQ]==10'h0); 
reg procflag_sop;

wire [9:0] eop_index_n= xtb_rdata[`SMX_XTB_POS_NOF64B]-1'b1;
wire procflag_eop_n= (resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_SEQ]==eop_index_n); 
reg procflag_eop;

assign procflag_xcomp_n= (xtb_rdata[`SMX_XTB_POS_RCVCNT]==xtb_rdata[`SMX_XTB_POS_NOF64B]);
reg  procflag_xcomp;

wire [2:0] resp_code= (resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_RD])?
		`SMX_CMD_COMP_WITH_DATA : `SMX_CMD_COMP_WITHOUT_DATA;

wire [7:0] procflag_cmd_n= {	// si->meta cmd xlated
		2'h0, // rsv
		1'b0, // resp always non-posted
		1'b0,  // is wr completion ordered?
			// put 0 for resp
		1'b0, // rsv
		resp_code
		};
/*
	        2'b10, // resp code 
		~resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_RD]
			// si rd= 1, meta rd= 0
			// si wr= 0, meta wr= 1
*/
//
// not sure resp code; 
// descrepancy between peu and smx spec ???
// peu[4:3] error type ???
// for now , implement smx's 
// 
reg [7:0] procflag_cmd;

wire [63:0] xtb_data_addr= xtb_rdata[`SMX_XTB_POS_ADDR];
wire [9:0] resp_seq= resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_SEQ];
// wire [57:0] msb_new_addr_n= xtb_data_addr[63:6] + {48'h0, resp_seq};
wire [63:0] adder_msb_addr_out;
wire [57:0] msb_new_addr_n= adder_msb_addr_out[57:0];

wire [63:0] procflag_addr_n= (resp_seq==10'h0)? 
	      {xtb_data_addr[63:4], xtb_data_addr[3:0] & 4'h0} :   // xtb_data_addr : cc 071105 orignal start addr 
                                        // orignal start addr (16B aligned)
					// if first seq
		 	{msb_new_addr_n, 6'h0}; 
				// always at 64B boundary 
			    	// in subsequent seq 
cl_a1_add64_8x adder_msb_addr(
	.cin	(1'b0),
	.in0	({6'h0, xtb_data_addr[63:6]}),
	.in1	({54'h0, resp_seq}),
	.out	(adder_msb_addr_out[63:0]),
	.cout	()
	);

reg [63:0] procflag_addr;

// reg [13:0] procflag_len;
reg [1:0] procflag_port;
reg [4:0] procflag_dma;
reg [7:0] procflag_client;
reg [3:0] procflag_sop_line_en;
reg [3:0] procflag_eop_line_en;
reg [3:0] procflag_sop_byte_en;
reg [3:0] procflag_eop_byte_en;
reg [5:0] procflag_xid;
reg [2:0] procflag_err;
reg procflag_rd;
reg procflag_with_data;

always @(posedge clk) begin
  if(ld_cmdff_r_n) resp_cmdff_rdata_r<= `SMX_PD  resp_cmdff_rdata; // flop in for s1 use
  if(ld_procflag_data_n) begin   // sample at s1
		// derive from xtb, cmdff_r
    procflag_cmd<= `SMX_PD  procflag_cmd_n;  // cmdff_r
    procflag_addr<= `SMX_PD  procflag_addr_n; 
    procflag_xcomp<= `SMX_PD  procflag_xcomp_n;
    procflag_sop<= `SMX_PD  procflag_sop_n; // cmdff_r
    procflag_eop<= `SMX_PD  procflag_eop_n;
		// extract from xtb 
//     procflag_len<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_LEN];
    procflag_port<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_PORT];
    procflag_dma<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_DMA];
    procflag_client<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_CLIENT];
    procflag_sop_line_en<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_SOP_LINE_EN];
    procflag_eop_line_en<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_EOP_LINE_EN];
    procflag_sop_byte_en<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_SOP_BYTE_EN];
    procflag_eop_byte_en<= `SMX_PD  xtb_rdata[`SMX_XTB_POS_EOP_BYTE_EN];
		// extract from cmdff_r
    procflag_xid<= `SMX_PD  resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_ID_META];
    procflag_err<= `SMX_PD  {2'h0, pktdrop_n};
    procflag_rd<= `SMX_PD  resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_RD];
    procflag_with_data<= `SMX_PD  resp_cmdff_rdata_r[`SMX_RESP_CMDFF_POS_WITH_DATA];
  end
end

always @(posedge clk) begin
  if(!reset_l) begin
    procflag<= `SMX_PD  1'b0;
    proc_cs<= `SMX_PD  proc_s0;

//    xtb_rd<= `SMX_PD 1'b0;
  end
  else begin
    if(set_procflag_n) procflag<= `SMX_PD  1'b1;
    else if (rst_procflag) procflag<= `SMX_PD  1'b0; 
    proc_cs<= `SMX_PD  proc_ns;

/*
   made xtb_rd one cycle earlier
    if(set_xtb_rd_n) xtb_rd<= `SMX_PD  1'b1;
    else if (xtb_rd_ack) xtb_rd<= `SMX_PD  1'b0; 
*/
  end
end

// made xtb_raddr one cycle earlier 
// reg xtb_rd;	// level signal
wire xtb_rd= set_xtb_rd_n;

/*
  made xtb_rd one cycle earlier
always @ (posedge clk) begin
  if(set_xtb_rd_n) xtb_raddr<= `SMX_PD xtb_raddr_n;
end
*/

wire niu_sio_dq_n= resp_cmdff_rd; 
reg niu_sio_dq;
always @ (posedge clk) begin
  if(!reset_l) begin
    niu_sio_dq<= `SMX_PD  1'b0;
  end
  else begin
    niu_sio_dq<= `SMX_PD  niu_sio_dq_n;
  end
end

endmodule


