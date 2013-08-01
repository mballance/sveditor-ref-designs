// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_sm_req_siireq.v
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


module niu_smx_sm_req_siireq(
/*AUTOARG*/
   // Outputs
   niu_sii_hdr_vld, niu_sii_reqbypass, niu_sii_datareq, niu_sii_data, 
   niu_sii_parity, nxt_xmit, wreq_dataff_rd, sii_cs, siireq_idle, 
   tid_xmited_set, tid_xmited_set_addr, 
   // Inputs
   clk, reset_l, xmitflag, rwflag, hdr_data, bypass, 
   wreq_dataff_rdata, wreq_dataff_empty
   );

input		clk;
input		reset_l;

// sii interface
output         	niu_sii_hdr_vld;
output         	niu_sii_reqbypass;
output         	niu_sii_datareq;
output [127:0] 	niu_sii_data;
output [7:0]   	niu_sii_parity;


// arb interface 
input 		xmitflag;
input 		rwflag;   // 0= rd, 1= wr
input [128:0] 	hdr_data; // [128] valid bit
input 		bypass;
output 		nxt_xmit;  // arb to update xmit flag


// dataff if
output 		wreq_dataff_rd;
input [127:0] 	wreq_dataff_rdata; 
input 		wreq_dataff_empty; // not use for now???

output	[1:0] 	sii_cs;

// stall_hdlr  if
output		siireq_idle;

// status file interface
output tid_xmited_set;   // rst by sii_req
output [5:0] tid_xmited_set_addr;

parameter sii_s0= 2'h0,
	  sii_s1= 2'h1;

reg inc_wcnt_n, rst_wcnt_n;
reg [2:0] wcnt;
reg  nxt_xmit_n;
wire nxt_xmit= nxt_xmit_n;
wire wcnt_done_n= (wcnt==`SMX_DATA_CYCLES); 

reg niu_sii_hdr_vld_n, niu_sii_hdr_vld ;
reg niu_sii_datareq_n, niu_sii_datareq;
reg ld_hdr_n;
reg ld_data_n;
reg wreq_dataff_rd_n;
reg [1:0] sii_ns, sii_cs;

wire siireq_idle= (sii_cs==sii_s0) && !xmitflag;

wire tag_is_valid_n= hdr_data[128]; // added 121405 - end
reg tid_xmited_set;
wire [5:0] tid_xmited_set_addr= hdr_data[79:74];

always @(/*AUTOSENSE*/`SMX_REQARB_WR or rwflag or sii_cs
	 or tag_is_valid_n or wcnt_done_n or xmitflag) begin
  tid_xmited_set= 1'b0;
  niu_sii_hdr_vld_n= 1'b0;
  niu_sii_datareq_n= 1'b0;
  nxt_xmit_n= 1'b0;
  ld_hdr_n= 1'b0;
  ld_data_n= 1'b0;
  wreq_dataff_rd_n= 1'b0; 
  inc_wcnt_n= 1'b0;
  rst_wcnt_n= 1'b0;
  sii_ns= sii_cs;
  case(sii_cs)
    sii_s0: begin
	      if(xmitflag) begin
	        niu_sii_hdr_vld_n= tag_is_valid_n; // changed 121405
	        niu_sii_datareq_n= (rwflag==`SMX_REQARB_WR);
		ld_hdr_n= 1'b1;
		sii_ns= (rwflag==`SMX_REQARB_WR)? sii_s1 : sii_s0;
		nxt_xmit_n= 1'b1;
	        rst_wcnt_n= 1'b1;
	        tid_xmited_set= tag_is_valid_n;  // set xmited flag; use by timer 
	      end
	    end
    sii_s1: begin  // wr data xfer
	      ld_data_n= 1'b1;
              wreq_dataff_rd_n= 1'b1; 
	      inc_wcnt_n= 1'b1;
	      sii_ns= (wcnt_done_n)? sii_s0 : sii_s1;
	    end 
  endcase
end

reg niu_sii_reqbypass;
reg [127:0] niu_sii_data;

wire [7:0] niu_hdr_parity_n= 8'h0;

		// little endian -> big endian
wire [127:0] niu_sii_data_n= {  wreq_dataff_rdata[`SMX_LE_B0],
				wreq_dataff_rdata[`SMX_LE_B1],
				wreq_dataff_rdata[`SMX_LE_B2],
				wreq_dataff_rdata[`SMX_LE_B3],
				wreq_dataff_rdata[`SMX_LE_B4],
				wreq_dataff_rdata[`SMX_LE_B5],
				wreq_dataff_rdata[`SMX_LE_B6],
				wreq_dataff_rdata[`SMX_LE_B7],
				wreq_dataff_rdata[`SMX_LE_B8],
				wreq_dataff_rdata[`SMX_LE_B9],
				wreq_dataff_rdata[`SMX_LE_B10],
				wreq_dataff_rdata[`SMX_LE_B11],
				wreq_dataff_rdata[`SMX_LE_B12],
				wreq_dataff_rdata[`SMX_LE_B13],
				wreq_dataff_rdata[`SMX_LE_B14],
				wreq_dataff_rdata[`SMX_LE_B15]
				};
/*
wire [15:0] e0_niu_sii_data_n={
				niu_sii_data_n[30], niu_sii_data_n[28],
				niu_sii_data_n[26], niu_sii_data_n[24],
				niu_sii_data_n[22], niu_sii_data_n[20],
				niu_sii_data_n[18], niu_sii_data_n[16],
				niu_sii_data_n[14], niu_sii_data_n[12],
				niu_sii_data_n[10], niu_sii_data_n[8],
				niu_sii_data_n[6], niu_sii_data_n[4],
				niu_sii_data_n[2], niu_sii_data_n[0]
				};
wire [15:0] e1_niu_sii_data_n={
				niu_sii_data_n[62], niu_sii_data_n[60],
				niu_sii_data_n[58], niu_sii_data_n[56],
				niu_sii_data_n[54], niu_sii_data_n[52],
				niu_sii_data_n[50], niu_sii_data_n[48],
				niu_sii_data_n[46], niu_sii_data_n[44],
				niu_sii_data_n[42], niu_sii_data_n[40],
				niu_sii_data_n[38], niu_sii_data_n[36],
				niu_sii_data_n[34], niu_sii_data_n[32]
				};
wire [15:0] e2_niu_sii_data_n={
				niu_sii_data_n[94], niu_sii_data_n[92],
				niu_sii_data_n[90], niu_sii_data_n[88],
				niu_sii_data_n[86], niu_sii_data_n[84],
				niu_sii_data_n[82], niu_sii_data_n[80],
				niu_sii_data_n[78], niu_sii_data_n[76],
				niu_sii_data_n[74], niu_sii_data_n[72],
				niu_sii_data_n[70], niu_sii_data_n[68],
				niu_sii_data_n[66], niu_sii_data_n[64]
				};
wire [15:0] e3_niu_sii_data_n={
				niu_sii_data_n[126], niu_sii_data_n[124],
				niu_sii_data_n[122], niu_sii_data_n[120],
				niu_sii_data_n[118], niu_sii_data_n[116],
				niu_sii_data_n[114], niu_sii_data_n[112],
				niu_sii_data_n[110], niu_sii_data_n[108],
				niu_sii_data_n[106], niu_sii_data_n[104],
				niu_sii_data_n[102], niu_sii_data_n[100],
				niu_sii_data_n[98], niu_sii_data_n[96]
				};

wire [15:0] o0_niu_sii_data_n={
				niu_sii_data_n[31], niu_sii_data_n[29],
				niu_sii_data_n[27], niu_sii_data_n[25],
				niu_sii_data_n[23], niu_sii_data_n[21],
				niu_sii_data_n[19], niu_sii_data_n[17],
				niu_sii_data_n[15], niu_sii_data_n[13],
				niu_sii_data_n[11], niu_sii_data_n[9],
				niu_sii_data_n[7], niu_sii_data_n[5],
				niu_sii_data_n[3], niu_sii_data_n[1]
				};
wire [15:0] o1_niu_sii_data_n={
				niu_sii_data_n[63], niu_sii_data_n[61],
				niu_sii_data_n[59], niu_sii_data_n[57],
				niu_sii_data_n[55], niu_sii_data_n[53],
				niu_sii_data_n[51], niu_sii_data_n[49],
				niu_sii_data_n[47], niu_sii_data_n[45],
				niu_sii_data_n[43], niu_sii_data_n[41],
				niu_sii_data_n[39], niu_sii_data_n[37],
				niu_sii_data_n[35], niu_sii_data_n[33]
				};
wire [15:0] o2_niu_sii_data_n={
				niu_sii_data_n[95], niu_sii_data_n[93],
				niu_sii_data_n[91], niu_sii_data_n[89],
				niu_sii_data_n[87], niu_sii_data_n[85],
				niu_sii_data_n[83], niu_sii_data_n[81],
				niu_sii_data_n[79], niu_sii_data_n[77],
				niu_sii_data_n[75], niu_sii_data_n[73],
				niu_sii_data_n[71], niu_sii_data_n[69],
				niu_sii_data_n[67], niu_sii_data_n[65]
				};
wire [15:0] o3_niu_sii_data_n={
				niu_sii_data_n[127], niu_sii_data_n[125],
				niu_sii_data_n[123], niu_sii_data_n[121],
				niu_sii_data_n[119], niu_sii_data_n[117],
				niu_sii_data_n[115], niu_sii_data_n[113],
				niu_sii_data_n[111], niu_sii_data_n[109],
				niu_sii_data_n[107], niu_sii_data_n[105],
				niu_sii_data_n[103], niu_sii_data_n[101],
				niu_sii_data_n[99], niu_sii_data_n[97]
				};
*/

/*
assign niu_sii_parity_n[0]=  ~(^e0_niu_sii_data_n);
assign niu_sii_parity_n[2]=  ~(^e1_niu_sii_data_n);
assign niu_sii_parity_n[4]=  ~(^e2_niu_sii_data_n);
assign niu_sii_parity_n[6]=  ~(^e3_niu_sii_data_n);

assign niu_sii_parity_n[1]=  ~(^o0_niu_sii_data_n);
assign niu_sii_parity_n[3]=  ~(^o1_niu_sii_data_n);
assign niu_sii_parity_n[5]=  ~(^o2_niu_sii_data_n);
assign niu_sii_parity_n[7]=  ~(^o3_niu_sii_data_n);
*/

reg [7:0] niu_sii_parity;
wire [7:0] niu_sii_parity_n;

niu_smx_gen_siudp gen_siudp(	// gen parity per N2 ras   
		.data	(niu_sii_data_n [127:0]),
		.parity (niu_sii_parity_n [7:0])
	);


wire	   cmd_parity_n= ~(^hdr_data[`SMX_SICMD_POS_CMD]);

wire [39:0] pa_hdr_data= hdr_data[`SMX_SICMD_POS_PA];
wire [19:0] e_pa_hdr_data={
				pa_hdr_data[38], pa_hdr_data[36],
				pa_hdr_data[34], pa_hdr_data[32],
				pa_hdr_data[30], pa_hdr_data[28],
				pa_hdr_data[26], pa_hdr_data[24],
				pa_hdr_data[22], pa_hdr_data[20],
				pa_hdr_data[18], pa_hdr_data[16],
				pa_hdr_data[14], pa_hdr_data[12],
				pa_hdr_data[10], pa_hdr_data[8],
				pa_hdr_data[6], pa_hdr_data[4],
				pa_hdr_data[2], pa_hdr_data[0]
				};
wire [19:0] o_pa_hdr_data={
				pa_hdr_data[39], pa_hdr_data[37],
				pa_hdr_data[35], pa_hdr_data[33],
				pa_hdr_data[31], pa_hdr_data[29],
				pa_hdr_data[27], pa_hdr_data[25],
				pa_hdr_data[23], pa_hdr_data[21],
				pa_hdr_data[19], pa_hdr_data[17],
				pa_hdr_data[15], pa_hdr_data[13],
				pa_hdr_data[11], pa_hdr_data[9],
				pa_hdr_data[7], pa_hdr_data[5],
				pa_hdr_data[3], pa_hdr_data[1]
				};
wire [1:0] pa_parity_n= {~(^o_pa_hdr_data), ~(^e_pa_hdr_data)};

wire [5:0] tid_ecc_n;	

niu_smx_ecc16_genpar ecc_genpar(
		.data	(hdr_data[`SMX_SICMD_POS_ID]),
		.chkbit (5'h0),
		.parity	(tid_ecc_n[5:0]),
		.cor_parity_5 () // nc
	);

wire [127:0] niu_hdr_data_n= {	hdr_data[`SMX_SICMD_POS_CMD],
				hdr_data[`SMX_SICMD_POS_RSV0],
				pa_parity_n,
				hdr_data[`SMX_SICMD_POS_ERR],
				hdr_data[`SMX_SICMD_POS_ID],
				hdr_data[`SMX_SICMD_POS_RSV1],
				cmd_parity_n,
				tid_ecc_n,
				hdr_data[`SMX_SICMD_POS_RSV2],
				hdr_data[`SMX_SICMD_POS_PA]
				};

always @(posedge clk) begin
  if(!reset_l) begin
    sii_cs<= `SMX_PD  sii_s0;
    niu_sii_hdr_vld<= `SMX_PD  1'b0;
    niu_sii_datareq<= `SMX_PD  1'b0;
    niu_sii_reqbypass<= `SMX_PD  1'b0;
    niu_sii_data<= `SMX_PD  128'h0;
    niu_sii_parity<= `SMX_PD  8'h0;
  end
  else begin
    sii_cs<= `SMX_PD  sii_ns;
    niu_sii_hdr_vld<= `SMX_PD  niu_sii_hdr_vld_n;
    niu_sii_datareq<= `SMX_PD  niu_sii_datareq_n;
    if(ld_hdr_n) 
      niu_sii_reqbypass<= `SMX_PD  bypass;
    else
      niu_sii_reqbypass<= `SMX_PD  1'b0;
    if(ld_hdr_n) begin
      niu_sii_data<= `SMX_PD  niu_hdr_data_n;
      niu_sii_parity<= `SMX_PD niu_hdr_parity_n;
    end
    else if (ld_data_n) begin
      niu_sii_data<= `SMX_PD  niu_sii_data_n;
      niu_sii_parity<= `SMX_PD  niu_sii_parity_n;
    end
  end
end

always @(posedge clk) begin
  if(!reset_l) 
    wcnt<= `SMX_PD  3'h1;	
  else begin
    if(rst_wcnt_n) wcnt<= `SMX_PD  3'h1; // start with 1 
    else if(inc_wcnt_n) wcnt<= `SMX_PD  wcnt + 1'b1;
  end
end 
	  
wire wreq_dataff_rd= wreq_dataff_rd_n;
endmodule




