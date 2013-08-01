// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_ard_dp.v
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
`ifndef FPGA
module ccx_ard_dp (
  arb_grant_a, 
  arb_src8_grant_a, 
  arb_src7_grant_a, 
  arb_src6_grant_a, 
  arb_src5_grant_a, 
  arb_src4_grant_a, 
  arb_src3_grant_a, 
  arb_src2_grant_a, 
  arb_src1_grant_a, 
  arb_src0_grant_a, 
  ccx_dest_data_rdy_a, 
  ccx_dest_atom_a, 
  req_pkt_empty_a, 
  grant_a, 
  req_a, 
  atom_a, 
  src8_arb_atom_q, 
  src7_arb_atom_q, 
  src6_arb_atom_q, 
  src5_arb_atom_q, 
  src4_arb_atom_q, 
  src3_arb_atom_q, 
  src2_arb_atom_q, 
  src1_arb_atom_q, 
  src0_arb_atom_q, 
  src8_arb_req_q, 
  src7_arb_req_q, 
  src6_arb_req_q, 
  src5_arb_req_q, 
  src4_arb_req_q, 
  src3_arb_req_q, 
  src2_arb_req_q, 
  src1_arb_req_q, 
  src0_arb_req_q, 
  qfullbar_a, 
  direction, 
  fifo_req_sel_a, 
  input_req_sel_a, 
  input_req_sel_a_, 
  write_fifo_a, 
  fifo_rptr_a, 
  fifo_read_select, 
  atom_x, 
  stall_q_d1, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out, 
  tcu_pce_ov_out, 
  tcu_scan_en_out, 
  ccx_aclk_out, 
  ccx_bclk_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire [8:0] atom_q;
wire [8:0] req_q;
wire i_dff_atom_a_scanin;
wire i_dff_atom_a_scanout;
wire direction_;
wire dir_a_;
wire [8:0] atom_int_a;
wire i_dff_req_a_scanin;
wire i_dff_req_a_scanout;
wire dir_a;
wire [8:0] input_req_a_;
wire [8:0] input_req_a;
wire [9:0] fifo_wdata_prebuf;
wire [9:0] fifo_wdata;
wire i_dff_fmem17_scanin;
wire i_dff_fmem17_scanout;
wire [9:0] fifo_rdata17;
wire i_dff_fmem16_scanin;
wire i_dff_fmem16_scanout;
wire [9:0] fifo_rdata16;
wire [9:0] fifo_rdata17_16;
wire i_dff_fmem15_scanin;
wire i_dff_fmem15_scanout;
wire [9:0] fifo_rdata15;
wire i_dff_fmem14_scanin;
wire i_dff_fmem14_scanout;
wire [9:0] fifo_rdata14;
wire i_dff_fmem13_scanin;
wire i_dff_fmem13_scanout;
wire [9:0] fifo_rdata13;
wire i_dff_fmem12_scanin;
wire i_dff_fmem12_scanout;
wire [9:0] fifo_rdata12;
wire i_dff_fmem11_scanin;
wire i_dff_fmem11_scanout;
wire [9:0] fifo_rdata11;
wire i_dff_fmem10_scanin;
wire i_dff_fmem10_scanout;
wire [9:0] fifo_rdata10;
wire i_dff_fmem9_scanin;
wire i_dff_fmem9_scanout;
wire [9:0] fifo_rdata9;
wire i_dff_fmem8_scanin;
wire i_dff_fmem8_scanout;
wire [9:0] fifo_rdata8;
wire [9:0] fifo_rdata15_8;
wire i_dff_fmem7_scanin;
wire i_dff_fmem7_scanout;
wire [9:0] fifo_rdata7;
wire i_dff_fmem6_scanin;
wire i_dff_fmem6_scanout;
wire [9:0] fifo_rdata6;
wire i_dff_fmem5_scanin;
wire i_dff_fmem5_scanout;
wire [9:0] fifo_rdata5;
wire i_dff_fmem4_scanin;
wire i_dff_fmem4_scanout;
wire [9:0] fifo_rdata4;
wire i_dff_fmem3_scanin;
wire i_dff_fmem3_scanout;
wire [9:0] fifo_rdata3;
wire i_dff_fmem2_scanin;
wire i_dff_fmem2_scanout;
wire [9:0] fifo_rdata2;
wire i_dff_fmem1_scanin;
wire i_dff_fmem1_scanout;
wire [9:0] fifo_rdata1;
wire i_dff_fmem0_scanin;
wire i_dff_fmem0_scanout;
wire [9:0] fifo_rdata0;
wire [9:0] fifo_rdata7_0;
wire fifo_dir;
wire [8:0] fifo_req;
wire qual_dir;
wire [8:0] qual_req;
wire current_req_sel_a;
wire fq_dir;
wire [8:0] fq_req;
wire i_dff_reqreg_scanin;
wire i_dff_reqreg_scanout;
wire fq_dir_a_prebuf;
wire [8:0] fq_req_a;
wire fq_dir_a;
wire input_dir_a_;
wire [8:0] input_req_qfullbar_a_;
wire fq_input_dir_a_;
wire [8:0] fq_input_req_a_;
wire dir;
wire [8:0] req;
wire [8:0] atom_req_a_;
wire [8:0] atom_req_a;
wire [8:0] atom;
wire stall_a_;
wire input_dira_stall_;
wire fq_input_dira_stall_;
wire dira;
wire fq_dir_a_;
wire input_dird_stall_;
wire fq_input_dird_stall_;
wire dird;
wire r8_;
wire r7_;
wire r6_;
wire r5_;
wire r4_;
wire r3_;
wire r2_;
wire r1_;
wire r0_;
wire ra_or_7654_;
wire ra_or_3210_;
wire ra_or_654_;
wire ra_d54x;
wire ra_or_543_;
wire ra_or_210_;
wire ra_or_32_;
wire ra_or_21_;
wire ra_or_10_;
wire ra_d8_;
wire ra_d7_;
wire ra_d6_;
wire ra_d4_;
wire ra_d3_;
wire [8:0] grant_asc_;
wire ra_d8;
wire ra_d7;
wire ra_d6;
wire ra_d4;
wire ra_d3;
wire [8:0] reqd;
wire rd7_;
wire rd6_;
wire rd5_;
wire rd4_;
wire rd3_;
wire rd2_;
wire rd1_;
wire rd0_;
wire rd_or_7654_;
wire rd_or_3210_;
wire rd_or_654_;
wire rd_d54x;
wire rd_or_543_;
wire rd_or_210_;
wire rd_or_32_;
wire rd_or_21_;
wire rd_or_10_;
wire rd_d8_;
wire rd_d7_;
wire rd_d6_;
wire rd_d4_;
wire rd_d3_;
wire [8:0] grant_dsc_;
wire rd_d8;
wire rd_d7;
wire rd_d6;
wire rd_d4;
wire rd_d3;
wire [8:0] grant_des_;
wire [8:0] grant_int_a;
wire [8:0] grant_a_;
wire [8:0] qual_atomic_d1_;
wire [8:0] set_qual_atomic;
wire [8:0] qual_atomic_d1;
wire [8:0] hold_qual_atomic;
wire stall_q_d1_;
wire [8:0] qual_atomic;
wire i_dff_qual_atomic_d1_scanin;
wire i_dff_qual_atomic_d1_scanout;
wire [8:0] req_nogrant_;
wire [8:0] atom_2pass_;
wire qreq_8_6_;
wire qreq_5_3_;
wire qreq_2_0_;
wire drdy_8_6;
wire drdy_5_3;
wire drdy_2_0;
wire req_pkt_empty_a_;
wire data_rdy_a;
wire atom_8_6;
wire atom_5_3;
wire atom_2_0;
wire ccx_dest_atom_a_;
wire scan_out_prebuf;


//Primary outputs to ccx datapaths
output [8:0] arb_grant_a; //to ccx datapath

//Output to source: sparc or sctag grant flops
output         arb_src8_grant_a;
output         arb_src7_grant_a;
output         arb_src6_grant_a;
output         arb_src5_grant_a;
output         arb_src4_grant_a;
output         arb_src3_grant_a;
output         arb_src2_grant_a;
output         arb_src1_grant_a;
output         arb_src0_grant_a;

output        ccx_dest_data_rdy_a; // 
output        ccx_dest_atom_a;

//Output to arb control logic
output         req_pkt_empty_a;
output [8:0]   grant_a;   
output [8:0]   req_a;
output [8:0]   atom_a;
   

//Primary inputs from sources		 
input          src8_arb_atom_q;
input          src7_arb_atom_q;
input          src6_arb_atom_q;
input          src5_arb_atom_q;
input          src4_arb_atom_q;
input          src3_arb_atom_q;
input          src2_arb_atom_q;
input          src1_arb_atom_q;
input          src0_arb_atom_q;

input          src8_arb_req_q;
input          src7_arb_req_q;
input          src6_arb_req_q;
input          src5_arb_req_q;
input          src4_arb_req_q;
input          src3_arb_req_q;
input          src2_arb_req_q;
input          src1_arb_req_q;
input          src0_arb_req_q;

//Primary inputs from arbiter control logic
input [8:0]    qfullbar_a;
input          direction;	// priority encoder direction
input          fifo_req_sel_a;
//input          current_req_sel_a;
input          input_req_sel_a;
input          input_req_sel_a_;
input [17:0]   write_fifo_a; 	//write pointer for fifo.
input [2:0]    fifo_rptr_a;		//read pointer for fifo
input [1:0]    fifo_read_select;	//read pointer for fifo
input [8:0]    atom_x;
input          stall_q_d1;    // stall request from dest, flopped inside ccx

//Global signals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

// buffer HFN and drive to ctl
output          tcu_pce_ov_out;
output          tcu_scan_en_out;
output          ccx_aclk_out;
output          ccx_bclk_out;


// scan renames
assign pce_ov = tcu_pce_ov_out;
assign stop = 1'b0;
assign siclk = ccx_aclk_out;
assign soclk = ccx_bclk_out;
assign se = tcu_scan_en_out;
// end scan


// buffer hfn


ccx_ard_dp_buff_macro__dbuff_16x__stack_none__width_4 i_buf_hfn   (
	.din	({tcu_pce_ov, tcu_scan_en, ccx_aclk, ccx_bclk}),
	.dout	({tcu_pce_ov_out, tcu_scan_en_out, ccx_aclk_out, ccx_bclk_out})
);

assign atom_q[8:0] = { src8_arb_atom_q,
			src7_arb_atom_q,
			src6_arb_atom_q,
			src5_arb_atom_q,
			src4_arb_atom_q,
			src3_arb_atom_q,
			src2_arb_atom_q,
			src1_arb_atom_q,
			src0_arb_atom_q };

assign req_q[8:0] =    { src8_arb_req_q,
			src7_arb_req_q,
			src6_arb_req_q,
			src5_arb_req_q,
			src4_arb_req_q,
			src3_arb_req_q,
			src2_arb_req_q,
			src1_arb_req_q,
			src0_arb_req_q };

ccx_ard_dp_msff_macro__dmsff_16x__stack_10c__width_10 i_dff_atom_a  
(
 .scan_in(i_dff_atom_a_scanin),
 .scan_out(i_dff_atom_a_scanout),
 .clk	(l2clk),
 .din	({direction_, atom_q[8:0]}),
 .dout	({dir_a_,     atom_int_a[8:0]}),
 .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
 );
		 
ccx_ard_dp_msff_macro__dmsff_16x__stack_10c__width_10 i_dff_req_a   
(
 .scan_in(i_dff_req_a_scanin),
 .scan_out(i_dff_req_a_scanout),
 .clk	(l2clk),
 .din	({direction,req_q[8:0]}),
 .dout	({dir_a,req_a[8:0]}),
 .en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
 );


//BEGIN FIFO SECTION


// Do not accept a request for a queue that is full.
ccx_ard_dp_nand_macro__dnand_1x__ports_2__stack_10c__width_9 i_nand_inreq_a     
(
 .din0   (qfullbar_a[8:0]),
 .din1   (req_a[8:0]),
 .dout   (input_req_a_[8:0])
 );

ccx_ard_dp_inv_macro__dinv_24x__stack_10c__width_10 i_inv_inreq_a    
(
 .din   ({direction,input_req_a_[8:0]}),
 .dout   ({direction_,input_req_a[8:0]})
 );


// flop memory
assign fifo_wdata_prebuf[9:0] = {dir_a,input_req_a[8:0]};
ccx_ard_dp_buff_macro__dbuff_32x__minbuff_1__stack_none__width_19 i_buf_fifo_wdata    (
	.din	({atom_int_a[8:0], fifo_wdata_prebuf[9:0]}),
	.dout	({atom_a[8:0],     fifo_wdata[9:0]})
);

                                                             

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem17  (
	.scan_in(i_dff_fmem17_scanin),
	.scan_out(i_dff_fmem17_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata17[9:0]),
	.en	(write_fifo_a[17]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem16  (
	.scan_in(i_dff_fmem16_scanin),
	.scan_out(i_dff_fmem16_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata16[9:0]),
	.en	(write_fifo_a[16]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_mux_macro__dbuff_8x__dmux_4x__mux_aope__ports_2__stack_10c__width_10 i_mux_fmem17_16      (
	.din0	(fifo_rdata17[9:0]),
	.din1	(fifo_rdata16[9:0]),
	.sel0	(fifo_rptr_a[0]),
	.dout	(fifo_rdata17_16[9:0])
);

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem15  (
	.scan_in(i_dff_fmem15_scanin),
	.scan_out(i_dff_fmem15_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata15[9:0]),
	.en	(write_fifo_a[15]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem14  (
	.scan_in(i_dff_fmem14_scanin),
	.scan_out(i_dff_fmem14_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata14[9:0]),
	.en	(write_fifo_a[14]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem13  (
	.scan_in(i_dff_fmem13_scanin),
	.scan_out(i_dff_fmem13_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata13[9:0]),
	.en	(write_fifo_a[13]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem12  (
	.scan_in(i_dff_fmem12_scanin),
	.scan_out(i_dff_fmem12_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata12[9:0]),
	.en	(write_fifo_a[12]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

		 
ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem11  (
	.scan_in(i_dff_fmem11_scanin),
	.scan_out(i_dff_fmem11_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata11[9:0]),
	.en	(write_fifo_a[11]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem10  (
	.scan_in(i_dff_fmem10_scanin),
	.scan_out(i_dff_fmem10_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata10[9:0]),
	.en	(write_fifo_a[10]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem9  (
	.scan_in(i_dff_fmem9_scanin),
	.scan_out(i_dff_fmem9_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata9[9:0]),
	.en	(write_fifo_a[9]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem8  (
	.scan_in(i_dff_fmem8_scanin),
	.scan_out(i_dff_fmem8_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata8[9:0]),
	.en	(write_fifo_a[8]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10 i_mux_fmem15_8      (
	.din0	(fifo_rdata8[9:0]),
	.din1	(fifo_rdata9[9:0]),
	.din2	(fifo_rdata10[9:0]),
	.din3	(fifo_rdata11[9:0]),
	.din4	(fifo_rdata12[9:0]),
	.din5	(fifo_rdata13[9:0]),
	.din6	(fifo_rdata14[9:0]),
	.din7	(fifo_rdata15[9:0]),
	.sel	(fifo_rptr_a[2:0]),
	.dout	(fifo_rdata15_8[9:0])
);

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem7  (
	.scan_in(i_dff_fmem7_scanin),
	.scan_out(i_dff_fmem7_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata7[9:0]),
	.en	(write_fifo_a[7]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem6  (
	.scan_in(i_dff_fmem6_scanin),
	.scan_out(i_dff_fmem6_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata6[9:0]),
	.en	(write_fifo_a[6]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem5  (
	.scan_in(i_dff_fmem5_scanin),
	.scan_out(i_dff_fmem5_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata5[9:0]),
	.en	(write_fifo_a[5]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem4  (
	.scan_in(i_dff_fmem4_scanin),
	.scan_out(i_dff_fmem4_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata4[9:0]),
	.en	(write_fifo_a[4]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem3  (
	.scan_in(i_dff_fmem3_scanin),
	.scan_out(i_dff_fmem3_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata3[9:0]),
	.en	(write_fifo_a[3]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem2  (
	.scan_in(i_dff_fmem2_scanin),
	.scan_out(i_dff_fmem2_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata2[9:0]),
	.en	(write_fifo_a[2]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem1  (
	.scan_in(i_dff_fmem1_scanin),
	.scan_out(i_dff_fmem1_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata1[9:0]),
	.en	(write_fifo_a[1]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_fmem0  (
	.scan_in(i_dff_fmem0_scanin),
	.scan_out(i_dff_fmem0_scanout),
	.clk	(l2clk),
	.din	(fifo_wdata[9:0]),
	.dout	(fifo_rdata0[9:0]),
	.en	(write_fifo_a[0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);		

ccx_ard_dp_mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10 i_mux_fmem7_0      (
	.din0	(fifo_rdata0[9:0]),
	.din1	(fifo_rdata1[9:0]),
	.din2	(fifo_rdata2[9:0]),
	.din3	(fifo_rdata3[9:0]),
	.din4	(fifo_rdata4[9:0]),
	.din5	(fifo_rdata5[9:0]),
	.din6	(fifo_rdata6[9:0]),
	.din7	(fifo_rdata7[9:0]),
	.sel	(fifo_rptr_a[2:0]),
	.dout	(fifo_rdata7_0[9:0])
);
		 
ccx_ard_dp_mux_macro__dmux_1x__mux_aodec__ports_4__stack_10c__width_10 i_mux_fifo_req     (
	.din0	(fifo_rdata7_0[9:0]),
	.din1	(fifo_rdata15_8[9:0]),
	.din2	(fifo_rdata17_16[9:0]),
	.din3	(fifo_wdata[9:0]),
	.sel	({fifo_read_select[1:0]}),
	.dout   ({fifo_dir,fifo_req[8:0]})
);

//End flop memory section 


//BEGIN PE SECTION		 

ccx_ard_dp_mux_macro__dmux_1x__mux_aonpe__ports_2__stack_10c__width_10 i_mux_reqmux     (
	.din0	({qual_dir,qual_req[8:0]}),
	.din1	({fifo_dir,fifo_req[8:0]}),
	.sel0	(current_req_sel_a),
	.sel1	(fifo_req_sel_a),
	.dout	({fq_dir,fq_req[8:0]})
);

ccx_ard_dp_msff_macro__stack_10c__width_10 i_dff_reqreg  (
	.scan_in(i_dff_reqreg_scanin),
	.scan_out(i_dff_reqreg_scanout),
	.clk	(l2clk),
	.din	({fq_dir,fq_req[8:0]}),
	.dout	({fq_dir_a_prebuf,fq_req_a[8:0]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ccx_ard_dp_buff_macro__dbuff_8x__stack_10c__width_1 i_buf_fqdir   (
	.din	(fq_dir_a_prebuf),
	.dout	(fq_dir_a)
                                                      
);


// implement this mux using nand-nand. During the first nand, qualify
// req_a with qfull_bar. This removes one AND gate from critical path
//mux_macro i_mux_inmux (width=10, mux=aope, ports=2,stack=10c) (
//	.din0	({dir_a,input_req_a[8:0]}),
//	.din1	({fq_dir_a,fq_req_a[8:0]}),
//	.sel0	(input_req_sel_a),
//	.dout   ({dir,req[8:0]}),
//);



ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_10 i_nand3i_inmux    (
	.din0	({dir_a,req_a[8:0]}),
	.din1	({1'b1,qfullbar_a[8:0]}),
	.din2	({10{input_req_sel_a}}),
	.dout   ({input_dir_a_,input_req_qfullbar_a_[8:0]})
);

ccx_ard_dp_nand_macro__dnand_4x__ports_2__stack_10c__width_10 i_nand2i_inmux    (
	.din0	({fq_dir_a,fq_req_a[8:0]}),
	.din1	({10{input_req_sel_a_}}),
	.dout   ({fq_input_dir_a_,fq_input_req_a_[8:0]})
);

ccx_ard_dp_nand_macro__dnand_12x__ports_2__stack_10c__width_10 i_nand2o_inmux    (
	.din0	({input_dir_a_,input_req_qfullbar_a_[8:0]}),
	.din1	({fq_input_dir_a_,fq_input_req_a_[8:0]}),
	.dout   ({dir,req[8:0]})
);
                                                        


ccx_ard_dp_nand_macro__dnand_1x__ports_2__stack_10c__width_9 i_nand_atomreq    (
	.din0	(atom_int_a[8:0]),
	.din1	(input_req_a[8:0]),
	.dout	(atom_req_a_[8:0])
);

ccx_ard_dp_inv_macro__dinv_2x__stack_10c__width_9 i_inv_atomreq    (
	.din	(atom_req_a_[8:0]),
	.dout	(atom_req_a[8:0])
);

ccx_ard_dp_mux_macro__dmux_8x__mux_aope__ports_2__stack_10c__width_9 i_mux_atom     (
	.din0	(atom_req_a[8:0]),
	.din1	(atom_x[8:0]),
	.sel0	(input_req_sel_a),
	.dout   (atom[8:0])
);

//assign dira = ~stall_a & dir;
//assign dird = ~stall_a & ~dir;
// replicate the input mux with this functionality built in.

ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_dira_inmux     
(
	.din0	(dir_a),
	.din1	(stall_a_),
	.din2	(input_req_sel_a),
	.dout   (input_dira_stall_)
 );
                               
ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_fq_dira_inmux    (
	.din0	(fq_dir_a),
	.din1	(stall_a_),
	.din2	(input_req_sel_a_),
	.dout   (fq_input_dira_stall_)
);

ccx_ard_dp_nand_macro__dnand_12x__ports_2__stack_10c__width_1 i_nand2o_dira_inmux    (
	.din0	(input_dira_stall_),
	.din1	(fq_input_dira_stall_),
	.dout   (dira)
);

ccx_ard_dp_inv_macro__dinv_4x__stack_10c__width_1 i_inv_dir    (
	.din	({fq_dir_a}),
	.dout	({fq_dir_a_})
);

ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_dird_inmux     
(
	.din0	(dir_a_),
	.din1	(stall_a_),
	.din2	(input_req_sel_a),
	.dout   (input_dird_stall_)
 );
                               
ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_fq_dird_inmux    (
	.din0	(fq_dir_a_),
	.din1	(stall_a_),
	.din2   (input_req_sel_a_),
	.dout   (fq_input_dird_stall_)
);

ccx_ard_dp_nand_macro__dnand_12x__ports_2__stack_10c__width_1 i_nand2o_dird_inmux    (
	.din0	(input_dird_stall_),
	.din1	(fq_input_dird_stall_),
	.dout   (dird)
);




ccx_ard_dp_inv_macro__dinv_12x__stack_10c__width_9 i_ainv_1_w9   (
	.din	({req[8:0]}),
	.dout	({r8_,r7_,r6_,r5_,r4_,r3_,r2_,r1_,r0_})
);

ccx_ard_dp_and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2 i_aand4_1_w2      
(
 .din0 ({r4_,r0_}),
 .din1 ({r5_,r1_}),
 .din2 ({r6_,r2_}),
 .din3 ({r7_,r3_}),
 .dout({ra_or_7654_,ra_or_3210_})
 );

ccx_ard_dp_and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4 i_aand3_1_w4      
(
 .din0 ({r4_,       r4_,      r4_,       r0_}),
 .din1 ({r5_,       req[5],   r5_,       r1_}), 
 .din2 ({r6_,       dira,     r3_,       r2_}),
 .dout({ ra_or_654_, ra_d54x, ra_or_543_, ra_or_210_})
 );

ccx_ard_dp_nor_macro__dnor_8x__ports_2__stack_10c__width_3 i_anor2_1_w3    
(
 .din0({req[2],req[2],req[0]}),
 .din1({req[3],req[1],req[1]}),
 .dout({ra_or_32_,ra_or_21_,ra_or_10_})
 );

ccx_ard_dp_nand_macro__dnand_2x__ports_2__stack_10c__width_5 i_anand2_1_w5     
(
 .din0 ({dira,   dira,    dira,    dira,    dira   }),
 .din1 ({req[8], req[7],  req[6],  req[4],  req[3] }),
 .dout ({ra_d8_, ra_d7_,  ra_d6_,  ra_d4_,  ra_d3_ })
 );

ccx_ard_dp_nand_macro__dnand_8x__ports_2__stack_10c__width_1 i_anand2_2_w1     
(
 .din0 ({dira}),
 .din1 ({req[0]}),
 .dout ({grant_asc_[0]})
 );

ccx_ard_dp_inv_macro__dinv_4x__stack_10c__width_5 i_ainv_2_w5   (
	.din	({ra_d8_, ra_d7_,  ra_d6_,  ra_d4_,  ra_d3_}),
	.dout	({ra_d8,  ra_d7,   ra_d6,   ra_d4,   ra_d3})
); 

ccx_ard_dp_nand_macro__dnand_8x__ports_3__stack_10c__width_8 i_anand3_2_w8     
(
 .din0 ({ra_or_3210_, ra_or_3210_, ra_or_210_, ra_or_10_, ra_or_10_, r0_,       ra_or_10_, r0_}),
 .din1 ({ra_or_7654_, ra_or_654_,  ra_or_543_, ra_or_32_, ra_or_32_, ra_or_21_, req[2],    req[1]}),
 .din2 ({ra_d8,       ra_d7,       ra_d6,      ra_d54x,   ra_d4,     ra_d3,     dira,      dira}),
 .dout(grant_asc_[8:1])
 );

                               

//Descending priority encoder.
//assign grant_des[8] =  req[8];
//assign grant_des[7] = ~req[8]& req[7];
//assign grant_des[6] = ~req[8]&~req[7]& req[6];
//assign grant_des[5] = ~req[8]&~req[7]&~req[6]& req[5];                                  
//assign grant_des[4] = ~req[8]&~req[7]&~req[6]&~req[5]& req[4];                          
//assign grant_des[3] = ~req[8]&~req[7]&~req[6]&~req[5]&~req[4]& req[3];                    
//assign grant_des[2] = ~req[8]&~req[7]&~req[6]&~req[5]&~req[4]&~req[3]& req[2];        
//assign grant_des[1] = ~req[8]&~req[7]&~req[6]&~req[5]&~req[4]&~req[3]&~req[2]&req[1];
//assign grant_des[0] = ~req[8]&~req[7]&~req[6]&~req[5]&~req[4]&~req[3]&~req[2]&~req[1]&req[0];


assign reqd[8:0] = {req[0],req[1],req[2],req[3],req[4],req[5],req[6],req[7],req[8]};
assign {rd7_,rd6_,rd5_,rd4_,rd3_,rd2_,rd1_,rd0_} = {r1_,r2_,r3_,r4_,r5_,r6_,r7_,r8_};

ccx_ard_dp_and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2 i_dand4_1_w2      
(
 .din0 ({rd4_,rd0_}),
 .din1 ({rd5_,rd1_}),
 .din2 ({rd6_,rd2_}),
 .din3 ({rd7_,rd3_}),
 .dout({rd_or_7654_,rd_or_3210_})
 );


ccx_ard_dp_and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4 i_dand3_1_w4      
(
 .din0 ({rd4_,        rd4_,      rd4_,      rd0_}),
 .din1 ({rd5_,        reqd[5],   rd5_,      rd1_}), 
 .din2 ({rd6_,        dird,      rd3_,      rd2_}),
 .dout({ rd_or_654_,   rd_d54x,  rd_or_543_, rd_or_210_})
 );

ccx_ard_dp_nor_macro__dnor_8x__ports_2__stack_10c__width_3 i_dnor2_1_w3    
(
 .din0({reqd[2],reqd[2],reqd[0]}),
 .din1({reqd[3],reqd[1],reqd[1]}),
 .dout({rd_or_32_,rd_or_21_,rd_or_10_})
 );

ccx_ard_dp_nand_macro__dnand_2x__ports_2__stack_10c__width_5 i_dnand2_1_w5     
(
 .din0 ({dird,    dird,    dird,    dird,    dird   }),
 .din1 ({reqd[8], reqd[7], reqd[6], reqd[4], reqd[3]}),
 .dout ({rd_d8_,  rd_d7_,  rd_d6_,  rd_d4_,  rd_d3_ })
 );

ccx_ard_dp_nand_macro__dnand_8x__ports_2__stack_10c__width_1 i_dnand2_2_w1     
(
 .din0 ({dird}),
 .din1 ({reqd[0]}),
 .dout ({grant_dsc_[0]})
 );

ccx_ard_dp_inv_macro__dinv_4x__stack_10c__width_5 i_dinv_2_w5   (
	.din	({rd_d8_, rd_d7_,  rd_d6_,  rd_d4_,  rd_d3_}),
	.dout	({rd_d8,  rd_d7,   rd_d6,   rd_d4,   rd_d3})
); 

ccx_ard_dp_nand_macro__dnand_8x__ports_3__stack_10c__width_8 i_dnand3_2_w8     
(
 .din0 ({rd_or_3210_, rd_or_3210_, rd_or_210_, rd_or_10_, rd_or_10_, rd0_,       rd_or_10_, rd0_}),
 .din1 ({rd_or_7654_, rd_or_654_,  rd_or_543_, rd_or_32_, rd_or_32_, rd_or_21_, reqd[2],    reqd[1]}),
 .din2 ({rd_d8,       rd_d7,       rd_d6,      rd_d54x,   rd_d4,     rd_d3,     dird,      dird}),
 .dout(grant_dsc_[8:1])
 );

assign grant_des_[8:0] = {grant_dsc_[0],grant_dsc_[1],grant_dsc_[2],grant_dsc_[3],grant_dsc_[4],grant_dsc_[5],grant_dsc_[6],grant_dsc_[7],grant_dsc_[8]};
                                         
                               


ccx_ard_dp_nand_macro__dnand_32x__ports_2__stack_10c__width_9 i_nand_dirmux   
(
 .din0 (grant_asc_[8:0]),
 .din1	(grant_des_[8:0]),
 .dout   (grant_int_a[8:0])
 );

                                                      
// Buffer grants to be sent back to the sources (sparcs/L2s)
ccx_ard_dp_buff_macro__dbuff_48x__stack_10c__width_9 i_buf_src_grant   (
	.din	(grant_int_a[8:0]),
	.dout	({arb_src8_grant_a,
		  arb_src7_grant_a,
		  arb_src6_grant_a,
		  arb_src5_grant_a,
		  arb_src4_grant_a,
		  arb_src3_grant_a,
		  arb_src2_grant_a,
		  arb_src1_grant_a,
		  arb_src0_grant_a})
);

// Buffer grants to be sent back to the source queues
ccx_ard_dp_buff_macro__dbuff_32x__stack_10c__width_9 i_buf_queue_grant   
(
 .din	(grant_int_a[8:0]),
 .dout	(arb_grant_a[8:0])
 );

// Add MINTIME Buffer to grants to be sent back to the control block arc
ccx_ard_dp_buff_macro__dbuff_16x__minbuff_1__stack_10c__width_9 i_bufmin_grant    
(
 .din	(grant_int_a[8:0]),
 .dout	(grant_a[8:0])
 );



ccx_ard_dp_inv_macro__dinv_8x__stack_10c__width_9 i_inv_grant_a_x   (
	.din	(grant_int_a[8:0]),
	.dout	(grant_a_[8:0])
);


// When an atomic request is granted for the first time, the request needs
// to be preserved so that the second packet gets granted immediately following.
// The indicator is set when an atomic request is granted for first time.
// The indicator is held until the request is granted again.
//assign qual_atomic[8:0] = (atom[8:0] & grant_int_a[8:0] & qual_atomic_d1_[8:0]) | // set
//			              (grant_a_[8:0] & qual_atomic_d1[8:0]); // hold

ccx_ard_dp_nand_macro__dnand_1x__ports_3__stack_10c__width_9 i_nand_set_qualatom    (
	.din0	(atom[8:0]),
	.din1	(grant_int_a[8:0]),
	.din2	(qual_atomic_d1_[8:0]),
	.dout	(set_qual_atomic[8:0])
);

ccx_ard_dp_nand_macro__dnand_1x__ports_2__stack_10c__width_9 i_nand_hold_qualatom    (
	.din0	(grant_a_[8:0]),
	.din1	(qual_atomic_d1[8:0]),
	.dout	(hold_qual_atomic[8:0])
);

ccx_ard_dp_nand_macro__dnand_1x__ports_2__stack_10c__width_10 i_nand_qual_atomic    (
	.din0	({stall_q_d1,set_qual_atomic[8:0]}),
	.din1	({1'b1,hold_qual_atomic[8:0]}),
	.dout	({stall_q_d1_,qual_atomic[8:0]})
);

ccx_ard_dp_msff_macro__dmsff_8x__stack_10c__stack_10c__width_10 i_dff_qual_atomic_d1   (
	.scan_in(i_dff_qual_atomic_d1_scanin),
	.scan_out(i_dff_qual_atomic_d1_scanout),
	.clk	(l2clk),
	.din	({stall_q_d1_,qual_atomic[8:0]}),
	.dout	({stall_a_,qual_atomic_d1[8:0]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
ccx_ard_dp_inv_macro__dinv_2x__stack_10c__width_9 i_inv_qual_atomic_d1_x   (
	.din	(qual_atomic_d1[8:0]),
	.dout	(qual_atomic_d1_[8:0])
);

// Recycle the packet until it is empty.
// Keep any request that was not granted.
// Keep an atomic request after it's first grant.
// This gets fed into the request selection mux.
// one of the terms is the same as the SET term in qual_atomic
//assign qual_req[8:0] = (req[8:0] & grant_a_[8:0]) | (atom[8:0] & grant_int_a[8:0] & qual_atomic_d1_[8:0]) ;

ccx_ard_dp_nand_macro__dnand_2x__ports_2__stack_10c__width_9 i_nand_req_nogrant    (
	.din0	(req[8:0]),
	.din1	(grant_a_[8:0]),
	.dout	(req_nogrant_[8:0])
);

ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_9 i_nand_set_qualatom2    (
	.din0	(atom[8:0]),
	.din1	(grant_int_a[8:0]),
	.din2	(qual_atomic_d1_[8:0]),
	.dout	(atom_2pass_[8:0])
);
ccx_ard_dp_nand_macro__dnand_8x__ports_2__stack_10c__width_9 i_nand_qual_req    (
	.din0	(req_nogrant_[8:0]),
	.din1	(atom_2pass_[8:0]),
	.dout	(qual_req[8:0])
);

assign qual_dir = dir;

//assign req_pkt_empty_a  = ~(|(qual_req[8:0]));
//assign ccx_dest_data_rdy_a = |(grant_int_a[8:0]);
ccx_ard_dp_nor_macro__dnor_4x__ports_3__stack_10c__width_6 i_nor_rpe    (
	.din0	({qual_req[8], qual_req[5], qual_req[2], grant_int_a[8], grant_int_a[5], grant_int_a[2]}),
	.din1	({qual_req[7], qual_req[4], qual_req[1], grant_int_a[7], grant_int_a[4], grant_int_a[1]}),
	.din2	({qual_req[6], qual_req[3], qual_req[0], grant_int_a[6], grant_int_a[3], grant_int_a[0]}),
	.dout	({qreq_8_6_, qreq_5_3_, qreq_2_0_, drdy_8_6, drdy_5_3, drdy_2_0})
);
ccx_ard_dp_nand_macro__dnand_8x__ports_3__stack_10c__width_2 i_nand_rpe    (
	.din0	({qreq_8_6_,drdy_8_6}),
	.din1	({qreq_5_3_,drdy_5_3}),
	.din2	({qreq_2_0_,drdy_2_0}),
	.dout	({req_pkt_empty_a_,data_rdy_a})
);
ccx_ard_dp_inv_macro__dinv_32x__stack_10c__width_1 i_inv_rpe    (
	.din	(req_pkt_empty_a_),
	.dout	(req_pkt_empty_a)
);

ccx_ard_dp_buff_macro__dbuff_32x__stack_none__width_1 buff_drdy   (
	.din	(data_rdy_a),
	.dout	(ccx_dest_data_rdy_a)
);
assign current_req_sel_a = req_pkt_empty_a_;


//assign ccx_dest_atom_a = |(grant_int_a[8:0] & atom[8:0] & qual_atomic_d1_[8:0]);
ccx_ard_dp_nand_macro__dnand_1x__ports_3__stack_10c__width_3 i_nand_atom    (
	.din0	({atom_2pass_[8], atom_2pass_[5], atom_2pass_[2]}),
	.din1	({atom_2pass_[7], atom_2pass_[4], atom_2pass_[1]}),
	.din2	({atom_2pass_[6], atom_2pass_[3], atom_2pass_[0]}),
	.dout	({atom_8_6, atom_5_3, atom_2_0})
);
ccx_ard_dp_nor_macro__dnor_4x__ports_3__stack_10c__width_1 i_nor_atom    (
	.din0	(atom_8_6),
	.din1	(atom_5_3),
	.din2	(atom_2_0),
	.dout	(ccx_dest_atom_a_)
);
ccx_ard_dp_inv_macro__dinv_32x__stack_10c__width_1 i_inv_dest_atom   (
	.din	(ccx_dest_atom_a_),
	.dout	(ccx_dest_atom_a)
);
ccx_ard_dp_buff_macro__dbuff_8x__stack_none__width_1 buff_scanout   (
	.din	(scan_out_prebuf),
	.dout	(scan_out)
);


// fixscan start:
assign i_dff_atom_a_scanin       = scan_in                  ;
assign i_dff_req_a_scanin        = i_dff_atom_a_scanout     ;
assign i_dff_fmem17_scanin       = i_dff_req_a_scanout      ;
assign i_dff_fmem16_scanin       = i_dff_fmem17_scanout     ;
assign i_dff_fmem15_scanin       = i_dff_fmem16_scanout     ;
assign i_dff_fmem14_scanin       = i_dff_fmem15_scanout     ;
assign i_dff_fmem13_scanin       = i_dff_fmem14_scanout     ;
assign i_dff_fmem12_scanin       = i_dff_fmem13_scanout     ;
assign i_dff_fmem11_scanin       = i_dff_fmem12_scanout     ;
assign i_dff_fmem10_scanin       = i_dff_fmem11_scanout     ;
assign i_dff_fmem9_scanin        = i_dff_fmem10_scanout     ;
assign i_dff_fmem8_scanin        = i_dff_fmem9_scanout      ;
assign i_dff_fmem7_scanin        = i_dff_fmem8_scanout      ;
assign i_dff_fmem6_scanin        = i_dff_fmem7_scanout      ;
assign i_dff_fmem5_scanin        = i_dff_fmem6_scanout      ;
assign i_dff_fmem4_scanin        = i_dff_fmem5_scanout      ;
assign i_dff_fmem3_scanin        = i_dff_fmem4_scanout      ;
assign i_dff_fmem2_scanin        = i_dff_fmem3_scanout      ;
assign i_dff_fmem1_scanin        = i_dff_fmem2_scanout      ;
assign i_dff_fmem0_scanin        = i_dff_fmem1_scanout      ;
assign i_dff_reqreg_scanin       = i_dff_fmem0_scanout      ;
assign i_dff_qual_atomic_d1_scanin = i_dff_reqreg_scanout     ;
assign scan_out_prebuf             = i_dff_qual_atomic_d1_scanout;
// fixscan end:
endmodule


//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_16x__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ccx_ard_dp_msff_macro__dmsff_16x__stack_10c__width_10 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_1x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_24x__stack_10c__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






inv #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);









endmodule





//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_32x__minbuff_1__stack_none__width_19 (
  din, 
  dout);
  input [18:0] din;
  output [18:0] dout;






buff #(19)  d0_0 (
.in(din[18:0]),
.out(dout[18:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ccx_ard_dp_msff_macro__stack_10c__width_10 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_ard_dp_mux_macro__dbuff_8x__dmux_4x__mux_aope__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [9:0] din0;
  input [9:0] din1;
  input sel0;
  output [9:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(10)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_ard_dp_mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [9:0] din0;
  input [9:0] din1;
  input [9:0] din2;
  input [9:0] din3;
  input [9:0] din4;
  input [9:0] din5;
  input [9:0] din6;
  input [9:0] din7;
  input [2:0] sel;
  output [9:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(10)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
  .in2(din2[9:0]),
  .in3(din3[9:0]),
  .in4(din4[9:0]),
  .in5(din5[9:0]),
  .in6(din6[9:0]),
  .in7(din7[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_ard_dp_mux_macro__dmux_1x__mux_aodec__ports_4__stack_10c__width_10 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [9:0] din0;
  input [9:0] din1;
  input [9:0] din2;
  input [9:0] din3;
  input [1:0] sel;
  output [9:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(10)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
  .in2(din2[9:0]),
  .in3(din3[9:0]),
.dout(dout[9:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_ard_dp_mux_macro__dmux_1x__mux_aonpe__ports_2__stack_10c__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  output [9:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule


//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_8x__stack_10c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_10 (
  din0, 
  din1, 
  din2, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  input [9:0] din2;
  output [9:0] dout;






nand3 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.in2(din2[9:0]),
.out(dout[9:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_4x__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  output [9:0] dout;






nand2 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.out(dout[9:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_12x__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  output [9:0] dout;






nand2 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.out(dout[9:0])
);









endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_2x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ccx_ard_dp_mux_macro__dmux_8x__mux_aope__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [8:0] din0;
  input [8:0] din1;
  input sel0;
  output [8:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(9)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_12x__ports_2__stack_10c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_4x__stack_10c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_12x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ccx_ard_dp_and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  input [1:0] din3;
  output [1:0] dout;






and4 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.in3(din3[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ccx_ard_dp_and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






and3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module ccx_ard_dp_nor_macro__dnor_8x__ports_2__stack_10c__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






nor2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_2x__ports_2__stack_10c__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






nand2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_8x__ports_2__stack_10c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_4x__stack_10c__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






inv #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_8x__ports_3__stack_10c__width_8 (
  din0, 
  din1, 
  din2, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;






nand3 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.in2(din2[7:0]),
.out(dout[7:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_32x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_48x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_32x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_16x__minbuff_1__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_8x__stack_10c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_1x__ports_3__stack_10c__width_9 (
  din0, 
  din1, 
  din2, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  input [8:0] din2;
  output [8:0] dout;






nand3 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.in2(din2[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_1x__ports_2__stack_10c__width_10 (
  din0, 
  din1, 
  dout);
  input [9:0] din0;
  input [9:0] din1;
  output [9:0] dout;






nand2 #(10)  d0_0 (
.in0(din0[9:0]),
.in1(din1[9:0]),
.out(dout[9:0])
);









endmodule









// any PARAMS parms go into naming of macro

module ccx_ard_dp_msff_macro__dmsff_8x__stack_10c__stack_10c__width_10 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule









//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_2x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_4x__ports_3__stack_10c__width_9 (
  din0, 
  din1, 
  din2, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  input [8:0] din2;
  output [8:0] dout;






nand3 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.in2(din2[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_8x__ports_2__stack_10c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module ccx_ard_dp_nor_macro__dnor_4x__ports_3__stack_10c__width_6 (
  din0, 
  din1, 
  din2, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  input [5:0] din2;
  output [5:0] dout;






nor3 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.in2(din2[5:0]),
.out(dout[5:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_8x__ports_3__stack_10c__width_2 (
  din0, 
  din1, 
  din2, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  output [1:0] dout;






nand3 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.out(dout[1:0])
);









endmodule





//
//   invert macro
//
//





module ccx_ard_dp_inv_macro__dinv_32x__stack_10c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_32x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ccx_ard_dp_nand_macro__dnand_1x__ports_3__stack_10c__width_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  output [2:0] dout;






nand3 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.in2(din2[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module ccx_ard_dp_nor_macro__dnor_4x__ports_3__stack_10c__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





//
//   buff macro
//
//





module ccx_ard_dp_buff_macro__dbuff_8x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule


`endif // `ifndef FPGA

`ifdef FPGA
module ccx_ard_dp(arb_grant_a, arb_src8_grant_a, arb_src7_grant_a, 
	arb_src6_grant_a, arb_src5_grant_a, arb_src4_grant_a, arb_src3_grant_a, 
	arb_src2_grant_a, arb_src1_grant_a, arb_src0_grant_a, 
	ccx_dest_data_rdy_a, ccx_dest_atom_a, req_pkt_empty_a, grant_a, req_a, 
	atom_a, src8_arb_atom_q, src7_arb_atom_q, src6_arb_atom_q, 
	src5_arb_atom_q, src4_arb_atom_q, src3_arb_atom_q, src2_arb_atom_q, 
	src1_arb_atom_q, src0_arb_atom_q, src8_arb_req_q, src7_arb_req_q, 
	src6_arb_req_q, src5_arb_req_q, src4_arb_req_q, src3_arb_req_q, 
	src2_arb_req_q, src1_arb_req_q, src0_arb_req_q, qfullbar_a, direction, 
	fifo_req_sel_a, input_req_sel_a, input_req_sel_a_, write_fifo_a, 
	fifo_rptr_a, fifo_read_select, atom_x, stall_q_d1, tcu_scan_en, l2clk, 
	scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_out, tcu_pce_ov_out, 
	tcu_scan_en_out, ccx_aclk_out, ccx_bclk_out);

	output	[8:0]		arb_grant_a;
	output			arb_src8_grant_a;
	output			arb_src7_grant_a;
	output			arb_src6_grant_a;
	output			arb_src5_grant_a;
	output			arb_src4_grant_a;
	output			arb_src3_grant_a;
	output			arb_src2_grant_a;
	output			arb_src1_grant_a;
	output			arb_src0_grant_a;
	output			ccx_dest_data_rdy_a;
	output			ccx_dest_atom_a;
	output			req_pkt_empty_a;
	output	[8:0]		grant_a;
	output	[8:0]		req_a;
	output	[8:0]		atom_a;
	input			src8_arb_atom_q;
	input			src7_arb_atom_q;
	input			src6_arb_atom_q;
	input			src5_arb_atom_q;
	input			src4_arb_atom_q;
	input			src3_arb_atom_q;
	input			src2_arb_atom_q;
	input			src1_arb_atom_q;
	input			src0_arb_atom_q;
	input			src8_arb_req_q;
	input			src7_arb_req_q;
	input			src6_arb_req_q;
	input			src5_arb_req_q;
	input			src4_arb_req_q;
	input			src3_arb_req_q;
	input			src2_arb_req_q;
	input			src1_arb_req_q;
	input			src0_arb_req_q;
	input	[8:0]		qfullbar_a;
	input			direction;
	input			fifo_req_sel_a;
	input			input_req_sel_a;
	input			input_req_sel_a_;
	input	[17:0]		write_fifo_a;
	input	[2:0]		fifo_rptr_a;
	input	[1:0]		fifo_read_select;
	input	[8:0]		atom_x;
	input			stall_q_d1;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;
	output			tcu_pce_ov_out;
	output			tcu_scan_en_out;
	output			ccx_aclk_out;
	output			ccx_bclk_out;

	wire			pce_ov;
	wire			stop;
	wire			siclk;
	wire			soclk;
	wire			se;
	wire	[8:0]		atom_q;
	wire	[8:0]		req_q;
	wire			i_dff_atom_a_scanin;
	wire			i_dff_atom_a_scanout;
	wire			direction_;
	wire			dir_a_;
	wire	[8:0]		atom_int_a;
	wire			i_dff_req_a_scanin;
	wire			i_dff_req_a_scanout;
	wire			dir_a;
	wire	[8:0]		input_req_a_;
	wire	[8:0]		input_req_a;
	wire	[9:0]		fifo_wdata_prebuf;
	wire	[9:0]		fifo_wdata;
	wire			i_dff_fmem17_scanin;
	wire			i_dff_fmem17_scanout;
	wire	[9:0]		fifo_rdata17;
	wire			i_dff_fmem16_scanin;
	wire			i_dff_fmem16_scanout;
	wire	[9:0]		fifo_rdata16;
	wire	[9:0]		fifo_rdata17_16;
	wire			i_dff_fmem15_scanin;
	wire			i_dff_fmem15_scanout;
	wire	[9:0]		fifo_rdata15;
	wire			i_dff_fmem14_scanin;
	wire			i_dff_fmem14_scanout;
	wire	[9:0]		fifo_rdata14;
	wire			i_dff_fmem13_scanin;
	wire			i_dff_fmem13_scanout;
	wire	[9:0]		fifo_rdata13;
	wire			i_dff_fmem12_scanin;
	wire			i_dff_fmem12_scanout;
	wire	[9:0]		fifo_rdata12;
	wire			i_dff_fmem11_scanin;
	wire			i_dff_fmem11_scanout;
	wire	[9:0]		fifo_rdata11;
	wire			i_dff_fmem10_scanin;
	wire			i_dff_fmem10_scanout;
	wire	[9:0]		fifo_rdata10;
	wire			i_dff_fmem9_scanin;
	wire			i_dff_fmem9_scanout;
	wire	[9:0]		fifo_rdata9;
	wire			i_dff_fmem8_scanin;
	wire			i_dff_fmem8_scanout;
	wire	[9:0]		fifo_rdata8;
	wire	[9:0]		fifo_rdata15_8;
	wire			i_dff_fmem7_scanin;
	wire			i_dff_fmem7_scanout;
	wire	[9:0]		fifo_rdata7;
	wire			i_dff_fmem6_scanin;
	wire			i_dff_fmem6_scanout;
	wire	[9:0]		fifo_rdata6;
	wire			i_dff_fmem5_scanin;
	wire			i_dff_fmem5_scanout;
	wire	[9:0]		fifo_rdata5;
	wire			i_dff_fmem4_scanin;
	wire			i_dff_fmem4_scanout;
	wire	[9:0]		fifo_rdata4;
	wire			i_dff_fmem3_scanin;
	wire			i_dff_fmem3_scanout;
	wire	[9:0]		fifo_rdata3;
	wire			i_dff_fmem2_scanin;
	wire			i_dff_fmem2_scanout;
	wire	[9:0]		fifo_rdata2;
	wire			i_dff_fmem1_scanin;
	wire			i_dff_fmem1_scanout;
	wire	[9:0]		fifo_rdata1;
	wire			i_dff_fmem0_scanin;
	wire			i_dff_fmem0_scanout;
	wire	[9:0]		fifo_rdata0;
	wire	[9:0]		fifo_rdata7_0;
	wire			fifo_dir;
	wire	[8:0]		fifo_req;
	wire			qual_dir;
	wire	[8:0]		qual_req;
	wire			current_req_sel_a;
	wire			fq_dir;
	wire	[8:0]		fq_req;
	wire			i_dff_reqreg_scanin;
	wire			i_dff_reqreg_scanout;
	wire			fq_dir_a_prebuf;
	wire	[8:0]		fq_req_a;
	wire			fq_dir_a;
	wire			input_dir_a_;
	wire	[8:0]		input_req_qfullbar_a_;
	wire			fq_input_dir_a_;
	wire	[8:0]		fq_input_req_a_;
	wire			dir;
	wire	[8:0]		req;
	wire	[8:0]		atom_req_a_;
	wire	[8:0]		atom_req_a;
	wire	[8:0]		atom;
	wire			stall_a_;
	wire			input_dira_stall_;
	wire			fq_input_dira_stall_;
	wire			dira;
	wire			fq_dir_a_;
	wire			input_dird_stall_;
	wire			fq_input_dird_stall_;
	wire			dird;
	wire			r8_;
	wire			r7_;
	wire			r6_;
	wire			r5_;
	wire			r4_;
	wire			r3_;
	wire			r2_;
	wire			r1_;
	wire			r0_;
	wire			ra_or_7654_;
	wire			ra_or_3210_;
	wire			ra_or_654_;
	wire			ra_d54x;
	wire			ra_or_543_;
	wire			ra_or_210_;
	wire			ra_or_32_;
	wire			ra_or_21_;
	wire			ra_or_10_;
	wire			ra_d8_;
	wire			ra_d7_;
	wire			ra_d6_;
	wire			ra_d4_;
	wire			ra_d3_;
	wire	[8:0]		grant_asc_;
	wire			ra_d8;
	wire			ra_d7;
	wire			ra_d6;
	wire			ra_d4;
	wire			ra_d3;
	wire	[8:0]		reqd;
	wire			rd7_;
	wire			rd6_;
	wire			rd5_;
	wire			rd4_;
	wire			rd3_;
	wire			rd2_;
	wire			rd1_;
	wire			rd0_;
	wire			rd_or_7654_;
	wire			rd_or_3210_;
	wire			rd_or_654_;
	wire			rd_d54x;
	wire			rd_or_543_;
	wire			rd_or_210_;
	wire			rd_or_32_;
	wire			rd_or_21_;
	wire			rd_or_10_;
	wire			rd_d8_;
	wire			rd_d7_;
	wire			rd_d6_;
	wire			rd_d4_;
	wire			rd_d3_;
	wire	[8:0]		grant_dsc_;
	wire			rd_d8;
	wire			rd_d7;
	wire			rd_d6;
	wire			rd_d4;
	wire			rd_d3;
	wire	[8:0]		grant_des_;
	wire	[8:0]		grant_int_a;
	wire	[8:0]		grant_a_;
	wire	[8:0]		qual_atomic_d1_;
	wire	[8:0]		set_qual_atomic;
	wire	[8:0]		qual_atomic_d1;
	wire	[8:0]		hold_qual_atomic;
	wire			stall_q_d1_;
	wire	[8:0]		qual_atomic;
	wire			i_dff_qual_atomic_d1_scanin;
	wire			i_dff_qual_atomic_d1_scanout;
	wire	[8:0]		req_nogrant_;
	wire	[8:0]		atom_2pass_;
	wire			qreq_8_6_;
	wire			qreq_5_3_;
	wire			qreq_2_0_;
	wire			drdy_8_6;
	wire			drdy_5_3;
	wire			drdy_2_0;
	wire			req_pkt_empty_a_;
	wire			data_rdy_a;
	wire			atom_8_6;
	wire			atom_5_3;
	wire			atom_2_0;
	wire			ccx_dest_atom_a_;
	wire			scan_out_prebuf;

	assign pce_ov = tcu_pce_ov_out;
	assign stop = 1'b0;
	assign siclk = ccx_aclk_out;
	assign soclk = ccx_bclk_out;
	assign se = tcu_scan_en_out;
	assign atom_q[8:0] = {src8_arb_atom_q, src7_arb_atom_q, src6_arb_atom_q,
		src5_arb_atom_q, src4_arb_atom_q, src3_arb_atom_q, 
		src2_arb_atom_q, src1_arb_atom_q, src0_arb_atom_q};
	assign req_q[8:0] = {src8_arb_req_q, src7_arb_req_q, src6_arb_req_q, 
		src5_arb_req_q, src4_arb_req_q, src3_arb_req_q, src2_arb_req_q, 
		src1_arb_req_q, src0_arb_req_q};
	assign fifo_wdata_prebuf[9:0] = {dir_a, input_req_a[8:0]};
	assign reqd[8:0] = {req[0], req[1], req[2], req[3], req[4], req[5], 
		req[6], req[7], req[8]};
	assign {rd7_, rd6_, rd5_, rd4_, rd3_, rd2_, rd1_, rd0_} = {r1_, r2_, 
		r3_, r4_, r5_, r6_, r7_, r8_};
	assign grant_des_[8:0] = {grant_dsc_[0], grant_dsc_[1], grant_dsc_[2], 
		grant_dsc_[3], grant_dsc_[4], grant_dsc_[5], grant_dsc_[6], 
		grant_dsc_[7], grant_dsc_[8]};
	assign qual_dir = dir;
	assign current_req_sel_a = req_pkt_empty_a_;
	assign i_dff_atom_a_scanin = scan_in;
	assign i_dff_req_a_scanin = i_dff_atom_a_scanout;
	assign i_dff_fmem17_scanin = i_dff_req_a_scanout;
	assign i_dff_fmem16_scanin = i_dff_fmem17_scanout;
	assign i_dff_fmem15_scanin = i_dff_fmem16_scanout;
	assign i_dff_fmem14_scanin = i_dff_fmem15_scanout;
	assign i_dff_fmem13_scanin = i_dff_fmem14_scanout;
	assign i_dff_fmem12_scanin = i_dff_fmem13_scanout;
	assign i_dff_fmem11_scanin = i_dff_fmem12_scanout;
	assign i_dff_fmem10_scanin = i_dff_fmem11_scanout;
	assign i_dff_fmem9_scanin = i_dff_fmem10_scanout;
	assign i_dff_fmem8_scanin = i_dff_fmem9_scanout;
	assign i_dff_fmem7_scanin = i_dff_fmem8_scanout;
	assign i_dff_fmem6_scanin = i_dff_fmem7_scanout;
	assign i_dff_fmem5_scanin = i_dff_fmem6_scanout;
	assign i_dff_fmem4_scanin = i_dff_fmem5_scanout;
	assign i_dff_fmem3_scanin = i_dff_fmem4_scanout;
	assign i_dff_fmem2_scanin = i_dff_fmem3_scanout;
	assign i_dff_fmem1_scanin = i_dff_fmem2_scanout;
	assign i_dff_fmem0_scanin = i_dff_fmem1_scanout;
	assign i_dff_reqreg_scanin = i_dff_fmem0_scanout;
	assign i_dff_qual_atomic_d1_scanin = i_dff_reqreg_scanout;
	assign scan_out_prebuf = i_dff_qual_atomic_d1_scanout;

	buff_macro__dbuff_16x__stack_none__width_4 i_buf_hfn(
		.din				({tcu_pce_ov, tcu_scan_en,
		ccx_aclk, ccx_bclk}), 
		.dout				({tcu_pce_ov_out,
		tcu_scan_en_out, ccx_aclk_out, ccx_bclk_out}));
	msff_macro__dmsff_16x__stack_10c__width_10 i_dff_atom_a(
		.scan_in			(i_dff_atom_a_scanin), 
		.scan_out			(i_dff_atom_a_scanout), 
		.clk				(l2clk), 
		.din				({direction_, atom_q[8:0]}), 
		.dout				({dir_a_, atom_int_a[8:0]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__dmsff_16x__stack_10c__width_10 i_dff_req_a(
		.scan_in			(i_dff_req_a_scanin), 
		.scan_out			(i_dff_req_a_scanout), 
		.clk				(l2clk), 
		.din				({direction, req_q[8:0]}), 
		.dout				({dir_a, req_a[8:0]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	nand_macro__dnand_1x__ports_2__stack_10c__width_9 i_nand_inreq_a(
		.din0				(qfullbar_a[8:0]), 
		.din1				(req_a[8:0]), 
		.dout				(input_req_a_[8:0]));
	inv_macro__dinv_24x__stack_10c__width_10 i_inv_inreq_a(
		.din				({direction,
		input_req_a_[8:0]}), 
		.dout				({direction_, input_req_a[8:0]})
		);
	buff_macro__dbuff_32x__minbuff_1__stack_none__width_19 i_buf_fifo_wdata(
		.din				({atom_int_a[8:0],
		fifo_wdata_prebuf[9:0]}), 
		.dout				({atom_a[8:0], fifo_wdata[9:0]})
		);
	msff_macro__stack_10c__width_10 i_dff_fmem17(
		.scan_in			(i_dff_fmem17_scanin), 
		.scan_out			(i_dff_fmem17_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata17[9:0]), 
		.en				(write_fifo_a[17]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem16(
		.scan_in			(i_dff_fmem16_scanin), 
		.scan_out			(i_dff_fmem16_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata16[9:0]), 
		.en				(write_fifo_a[16]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	mux_macro__dbuff_8x__dmux_4x__mux_aope__ports_2__stack_10c__width_10 
		i_mux_fmem17_16(
		.din0				(fifo_rdata17[9:0]), 
		.din1				(fifo_rdata16[9:0]), 
		.sel0				(fifo_rptr_a[0]), 
		.dout				(fifo_rdata17_16[9:0]));
	msff_macro__stack_10c__width_10 i_dff_fmem15(
		.scan_in			(i_dff_fmem15_scanin), 
		.scan_out			(i_dff_fmem15_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata15[9:0]), 
		.en				(write_fifo_a[15]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem14(
		.scan_in			(i_dff_fmem14_scanin), 
		.scan_out			(i_dff_fmem14_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata14[9:0]), 
		.en				(write_fifo_a[14]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem13(
		.scan_in			(i_dff_fmem13_scanin), 
		.scan_out			(i_dff_fmem13_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata13[9:0]), 
		.en				(write_fifo_a[13]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem12(
		.scan_in			(i_dff_fmem12_scanin), 
		.scan_out			(i_dff_fmem12_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata12[9:0]), 
		.en				(write_fifo_a[12]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem11(
		.scan_in			(i_dff_fmem11_scanin), 
		.scan_out			(i_dff_fmem11_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata11[9:0]), 
		.en				(write_fifo_a[11]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem10(
		.scan_in			(i_dff_fmem10_scanin), 
		.scan_out			(i_dff_fmem10_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata10[9:0]), 
		.en				(write_fifo_a[10]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem9(
		.scan_in			(i_dff_fmem9_scanin), 
		.scan_out			(i_dff_fmem9_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata9[9:0]), 
		.en				(write_fifo_a[9]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem8(
		.scan_in			(i_dff_fmem8_scanin), 
		.scan_out			(i_dff_fmem8_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata8[9:0]), 
		.en				(write_fifo_a[8]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10 
		i_mux_fmem15_8(
		.din0				(fifo_rdata8[9:0]), 
		.din1				(fifo_rdata9[9:0]), 
		.din2				(fifo_rdata10[9:0]), 
		.din3				(fifo_rdata11[9:0]), 
		.din4				(fifo_rdata12[9:0]), 
		.din5				(fifo_rdata13[9:0]), 
		.din6				(fifo_rdata14[9:0]), 
		.din7				(fifo_rdata15[9:0]), 
		.sel				(fifo_rptr_a[2:0]), 
		.dout				(fifo_rdata15_8[9:0]));
	msff_macro__stack_10c__width_10 i_dff_fmem7(
		.scan_in			(i_dff_fmem7_scanin), 
		.scan_out			(i_dff_fmem7_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata7[9:0]), 
		.en				(write_fifo_a[7]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem6(
		.scan_in			(i_dff_fmem6_scanin), 
		.scan_out			(i_dff_fmem6_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata6[9:0]), 
		.en				(write_fifo_a[6]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem5(
		.scan_in			(i_dff_fmem5_scanin), 
		.scan_out			(i_dff_fmem5_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata5[9:0]), 
		.en				(write_fifo_a[5]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem4(
		.scan_in			(i_dff_fmem4_scanin), 
		.scan_out			(i_dff_fmem4_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata4[9:0]), 
		.en				(write_fifo_a[4]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem3(
		.scan_in			(i_dff_fmem3_scanin), 
		.scan_out			(i_dff_fmem3_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata3[9:0]), 
		.en				(write_fifo_a[3]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem2(
		.scan_in			(i_dff_fmem2_scanin), 
		.scan_out			(i_dff_fmem2_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata2[9:0]), 
		.en				(write_fifo_a[2]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem1(
		.scan_in			(i_dff_fmem1_scanin), 
		.scan_out			(i_dff_fmem1_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata1[9:0]), 
		.en				(write_fifo_a[1]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msff_macro__stack_10c__width_10 i_dff_fmem0(
		.scan_in			(i_dff_fmem0_scanin), 
		.scan_out			(i_dff_fmem0_scanout), 
		.clk				(l2clk), 
		.din				(fifo_wdata[9:0]), 
		.dout				(fifo_rdata0[9:0]), 
		.en				(write_fifo_a[0]), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	mux_macro__dbuff_8x__dmux_4x__mux_aodec__ports_8__stack_10c__width_10 
		i_mux_fmem7_0(
		.din0				(fifo_rdata0[9:0]), 
		.din1				(fifo_rdata1[9:0]), 
		.din2				(fifo_rdata2[9:0]), 
		.din3				(fifo_rdata3[9:0]), 
		.din4				(fifo_rdata4[9:0]), 
		.din5				(fifo_rdata5[9:0]), 
		.din6				(fifo_rdata6[9:0]), 
		.din7				(fifo_rdata7[9:0]), 
		.sel				(fifo_rptr_a[2:0]), 
		.dout				(fifo_rdata7_0[9:0]));
	mux_macro__dmux_1x__mux_aodec__ports_4__stack_10c__width_10 
		i_mux_fifo_req(
		.din0				(fifo_rdata7_0[9:0]), 
		.din1				(fifo_rdata15_8[9:0]), 
		.din2				(fifo_rdata17_16[9:0]), 
		.din3				(fifo_wdata[9:0]), 
		.sel				({fifo_read_select[1:0]}), 
		.dout				({fifo_dir, fifo_req[8:0]}));
	mux_macro__dmux_1x__mux_aonpe__ports_2__stack_10c__width_10 i_mux_reqmux
		(
		.din0				({qual_dir, qual_req[8:0]}), 
		.din1				({fifo_dir, fifo_req[8:0]}), 
		.sel0				(current_req_sel_a), 
		.sel1				(fifo_req_sel_a), 
		.dout				({fq_dir, fq_req[8:0]}));
	msff_macro__stack_10c__width_10 i_dff_reqreg(
		.scan_in			(i_dff_reqreg_scanin), 
		.scan_out			(i_dff_reqreg_scanout), 
		.clk				(l2clk), 
		.din				({fq_dir, fq_req[8:0]}), 
		.dout				({fq_dir_a_prebuf,
		fq_req_a[8:0]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	buff_macro__dbuff_8x__stack_10c__width_1 i_buf_fqdir(
		.din				(fq_dir_a_prebuf), 
		.dout				(fq_dir_a));
	nand_macro__dnand_4x__ports_3__stack_10c__width_10 i_nand3i_inmux(
		.din0				({dir_a, req_a[8:0]}), 
		.din1				({1'b1, qfullbar_a[8:0]}), 
		.din2				({10 {input_req_sel_a}}), 
		.dout				({input_dir_a_,
		input_req_qfullbar_a_[8:0]}));
	nand_macro__dnand_4x__ports_2__stack_10c__width_10 i_nand2i_inmux(
		.din0				({fq_dir_a, fq_req_a[8:0]}), 
		.din1				({10 {input_req_sel_a_}}), 
		.dout				({fq_input_dir_a_,
		fq_input_req_a_[8:0]}));
	nand_macro__dnand_12x__ports_2__stack_10c__width_10 i_nand2o_inmux(
		.din0				({input_dir_a_,
		input_req_qfullbar_a_[8:0]}), 
		.din1				({fq_input_dir_a_,
		fq_input_req_a_[8:0]}), 
		.dout				({dir, req[8:0]}));
	nand_macro__dnand_1x__ports_2__stack_10c__width_9 i_nand_atomreq(
		.din0				(atom_int_a[8:0]), 
		.din1				(input_req_a[8:0]), 
		.dout				(atom_req_a_[8:0]));
	inv_macro__dinv_2x__stack_10c__width_9 i_inv_atomreq(
		.din				(atom_req_a_[8:0]), 
		.dout				(atom_req_a[8:0]));
	mux_macro__dmux_8x__mux_aope__ports_2__stack_10c__width_9 i_mux_atom(
		.din0				(atom_req_a[8:0]), 
		.din1				(atom_x[8:0]), 
		.sel0				(input_req_sel_a), 
		.dout				(atom[8:0]));
	nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_dira_inmux(
		.din0				(dir_a), 
		.din1				(stall_a_), 
		.din2				(input_req_sel_a), 
		.dout				(input_dira_stall_));
	nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_fq_dira_inmux(
		.din0				(fq_dir_a), 
		.din1				(stall_a_), 
		.din2				(input_req_sel_a_), 
		.dout				(fq_input_dira_stall_));
	nand_macro__dnand_12x__ports_2__stack_10c__width_1 i_nand2o_dira_inmux(
		.din0				(input_dira_stall_), 
		.din1				(fq_input_dira_stall_), 
		.dout				(dira));
	inv_macro__dinv_4x__stack_10c__width_1 i_inv_dir(
		.din				({fq_dir_a}), 
		.dout				({fq_dir_a_}));
	nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_dird_inmux(
		.din0				(dir_a_), 
		.din1				(stall_a_), 
		.din2				(input_req_sel_a), 
		.dout				(input_dird_stall_));
	nand_macro__dnand_4x__ports_3__stack_10c__width_1 i_nand3_fq_dird_inmux(
		.din0				(fq_dir_a_), 
		.din1				(stall_a_), 
		.din2				(input_req_sel_a_), 
		.dout				(fq_input_dird_stall_));
	nand_macro__dnand_12x__ports_2__stack_10c__width_1 i_nand2o_dird_inmux(
		.din0				(input_dird_stall_), 
		.din1				(fq_input_dird_stall_), 
		.dout				(dird));
	inv_macro__dinv_12x__stack_10c__width_9 i_ainv_1_w9(
		.din				({req[8:0]}), 
		.dout				({r8_, r7_, r6_, r5_, r4_, r3_,
		r2_, r1_, r0_}));
	and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2 i_aand4_1_w2(
		.din0				({r4_, r0_}), 
		.din1				({r5_, r1_}), 
		.din2				({r6_, r2_}), 
		.din3				({r7_, r3_}), 
		.dout				({ra_or_7654_, ra_or_3210_}));
	and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4 i_aand3_1_w4(
		.din0				({r4_, r4_, r4_, r0_}), 
		.din1				({r5_, req[5], r5_, r1_}), 
		.din2				({r6_, dira, r3_, r2_}), 
		.dout				({ra_or_654_, ra_d54x,
		ra_or_543_, ra_or_210_}));
	nor_macro__dnor_8x__ports_2__stack_10c__width_3 i_anor2_1_w3(
		.din0				({req[2], req[2], req[0]}), 
		.din1				({req[3], req[1], req[1]}), 
		.dout				({ra_or_32_, ra_or_21_,
		ra_or_10_}));
	nand_macro__dnand_2x__ports_2__stack_10c__width_5 i_anand2_1_w5(
		.din0				({dira, dira, dira, dira,
		dira}), 
		.din1				({req[8], req[7], req[6],
		req[4], req[3]}), 
		.dout				({ra_d8_, ra_d7_, ra_d6_,
		ra_d4_, ra_d3_}));
	nand_macro__dnand_8x__ports_2__stack_10c__width_1 i_anand2_2_w1(
		.din0				({dira}), 
		.din1				({req[0]}), 
		.dout				({grant_asc_[0]}));
	inv_macro__dinv_4x__stack_10c__width_5 i_ainv_2_w5(
		.din				({ra_d8_, ra_d7_, ra_d6_,
		ra_d4_, ra_d3_}), 
		.dout				({ra_d8, ra_d7, ra_d6, ra_d4,
		ra_d3}));
	nand_macro__dnand_8x__ports_3__stack_10c__width_8 i_anand3_2_w8(
		.din0				({ra_or_3210_, ra_or_3210_,
		ra_or_210_, ra_or_10_, ra_or_10_, r0_, ra_or_10_, r0_}), 
		.din1				({ra_or_7654_, ra_or_654_,
		ra_or_543_, ra_or_32_, ra_or_32_, ra_or_21_, req[2], req[1]}), 
		.din2				({ra_d8, ra_d7, ra_d6, ra_d54x,
		ra_d4, ra_d3, dira, dira}), 
		.dout				(grant_asc_[8:1]));
	and_macro__dinv_12x__dnand_4x__ports_4__stack_10c__width_2 i_dand4_1_w2(
		.din0				({rd4_, rd0_}), 
		.din1				({rd5_, rd1_}), 
		.din2				({rd6_, rd2_}), 
		.din3				({rd7_, rd3_}), 
		.dout				({rd_or_7654_, rd_or_3210_}));
	and_macro__dinv_8x__dnand_2x__ports_3__stack_10c__width_4 i_dand3_1_w4(
		.din0				({rd4_, rd4_, rd4_, rd0_}), 
		.din1				({rd5_, reqd[5], rd5_, rd1_}), 
		.din2				({rd6_, dird, rd3_, rd2_}), 
		.dout				({rd_or_654_, rd_d54x,
		rd_or_543_, rd_or_210_}));
	nor_macro__dnor_8x__ports_2__stack_10c__width_3 i_dnor2_1_w3(
		.din0				({reqd[2], reqd[2], reqd[0]}), 
		.din1				({reqd[3], reqd[1], reqd[1]}), 
		.dout				({rd_or_32_, rd_or_21_,
		rd_or_10_}));
	nand_macro__dnand_2x__ports_2__stack_10c__width_5 i_dnand2_1_w5(
		.din0				({dird, dird, dird, dird,
		dird}), 
		.din1				({reqd[8], reqd[7], reqd[6],
		reqd[4], reqd[3]}), 
		.dout				({rd_d8_, rd_d7_, rd_d6_,
		rd_d4_, rd_d3_}));
	nand_macro__dnand_8x__ports_2__stack_10c__width_1 i_dnand2_2_w1(
		.din0				({dird}), 
		.din1				({reqd[0]}), 
		.dout				({grant_dsc_[0]}));
	inv_macro__dinv_4x__stack_10c__width_5 i_dinv_2_w5(
		.din				({rd_d8_, rd_d7_, rd_d6_,
		rd_d4_, rd_d3_}), 
		.dout				({rd_d8, rd_d7, rd_d6, rd_d4,
		rd_d3}));
	nand_macro__dnand_8x__ports_3__stack_10c__width_8 i_dnand3_2_w8(
		.din0				({rd_or_3210_, rd_or_3210_,
		rd_or_210_, rd_or_10_, rd_or_10_, rd0_, rd_or_10_, rd0_}), 
		.din1				({rd_or_7654_, rd_or_654_,
		rd_or_543_, rd_or_32_, rd_or_32_, rd_or_21_, reqd[2], reqd[1]}),
		.din2				({rd_d8, rd_d7, rd_d6, rd_d54x,
		rd_d4, rd_d3, dird, dird}), 
		.dout				(grant_dsc_[8:1]));
	nand_macro__dnand_32x__ports_2__stack_10c__width_9 i_nand_dirmux(
		.din0				(grant_asc_[8:0]), 
		.din1				(grant_des_[8:0]), 
		.dout				(grant_int_a[8:0]));
	buff_macro__dbuff_48x__stack_10c__width_9 i_buf_src_grant(
		.din				(grant_int_a[8:0]), 
		.dout				({arb_src8_grant_a,
		arb_src7_grant_a, arb_src6_grant_a, arb_src5_grant_a,
		arb_src4_grant_a, arb_src3_grant_a, arb_src2_grant_a,
		arb_src1_grant_a, arb_src0_grant_a}));
	buff_macro__dbuff_32x__stack_10c__width_9 i_buf_queue_grant(
		.din				(grant_int_a[8:0]), 
		.dout				(arb_grant_a[8:0]));
	buff_macro__dbuff_16x__minbuff_1__stack_10c__width_9 i_bufmin_grant(
		.din				(grant_int_a[8:0]), 
		.dout				(grant_a[8:0]));
	inv_macro__dinv_8x__stack_10c__width_9 i_inv_grant_a_x(
		.din				(grant_int_a[8:0]), 
		.dout				(grant_a_[8:0]));
	nand_macro__dnand_1x__ports_3__stack_10c__width_9 i_nand_set_qualatom(
		.din0				(atom[8:0]), 
		.din1				(grant_int_a[8:0]), 
		.din2				(qual_atomic_d1_[8:0]), 
		.dout				(set_qual_atomic[8:0]));
	nand_macro__dnand_1x__ports_2__stack_10c__width_9 i_nand_hold_qualatom(
		.din0				(grant_a_[8:0]), 
		.din1				(qual_atomic_d1[8:0]), 
		.dout				(hold_qual_atomic[8:0]));
	nand_macro__dnand_1x__ports_2__stack_10c__width_10 i_nand_qual_atomic(
		.din0				({stall_q_d1,
		set_qual_atomic[8:0]}), 
		.din1				({1'b1, hold_qual_atomic[8:0]}),
		.dout				({stall_q_d1_,
		qual_atomic[8:0]}));
	msff_macro__dmsff_8x__stack_10c__stack_10c__width_10 
		i_dff_qual_atomic_d1(
		.scan_in			(i_dff_qual_atomic_d1_scanin), 
		.scan_out			(i_dff_qual_atomic_d1_scanout), 
		.clk				(l2clk), 
		.din				({stall_q_d1_,
		qual_atomic[8:0]}), 
		.dout				({stall_a_,
		qual_atomic_d1[8:0]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	inv_macro__dinv_2x__stack_10c__width_9 i_inv_qual_atomic_d1_x(
		.din				(qual_atomic_d1[8:0]), 
		.dout				(qual_atomic_d1_[8:0]));
	nand_macro__dnand_2x__ports_2__stack_10c__width_9 i_nand_req_nogrant(
		.din0				(req[8:0]), 
		.din1				(grant_a_[8:0]), 
		.dout				(req_nogrant_[8:0]));
	nand_macro__dnand_4x__ports_3__stack_10c__width_9 i_nand_set_qualatom2(
		.din0				(atom[8:0]), 
		.din1				(grant_int_a[8:0]), 
		.din2				(qual_atomic_d1_[8:0]), 
		.dout				(atom_2pass_[8:0]));
	nand_macro__dnand_8x__ports_2__stack_10c__width_9 i_nand_qual_req(
		.din0				(req_nogrant_[8:0]), 
		.din1				(atom_2pass_[8:0]), 
		.dout				(qual_req[8:0]));
	nor_macro__dnor_4x__ports_3__stack_10c__width_6 i_nor_rpe(
		.din0				({qual_req[8], qual_req[5],
		qual_req[2], grant_int_a[8], grant_int_a[5], grant_int_a[2]}), 
		.din1				({qual_req[7], qual_req[4],
		qual_req[1], grant_int_a[7], grant_int_a[4], grant_int_a[1]}), 
		.din2				({qual_req[6], qual_req[3],
		qual_req[0], grant_int_a[6], grant_int_a[3], grant_int_a[0]}), 
		.dout				({qreq_8_6_, qreq_5_3_,
		qreq_2_0_, drdy_8_6, drdy_5_3, drdy_2_0}));
	nand_macro__dnand_8x__ports_3__stack_10c__width_2 i_nand_rpe(
		.din0				({qreq_8_6_, drdy_8_6}), 
		.din1				({qreq_5_3_, drdy_5_3}), 
		.din2				({qreq_2_0_, drdy_2_0}), 
		.dout				({req_pkt_empty_a_, data_rdy_a})
		);
	inv_macro__dinv_32x__stack_10c__width_1 i_inv_rpe(
		.din				(req_pkt_empty_a_), 
		.dout				(req_pkt_empty_a));
	buff_macro__dbuff_32x__stack_none__width_1 buff_drdy(
		.din				(data_rdy_a), 
		.dout				(ccx_dest_data_rdy_a));
	nand_macro__dnand_1x__ports_3__stack_10c__width_3 i_nand_atom(
		.din0				({atom_2pass_[8],
		atom_2pass_[5], atom_2pass_[2]}), 
		.din1				({atom_2pass_[7],
		atom_2pass_[4], atom_2pass_[1]}), 
		.din2				({atom_2pass_[6],
		atom_2pass_[3], atom_2pass_[0]}), 
		.dout				({atom_8_6, atom_5_3, atom_2_0})
		);
	nor_macro__dnor_4x__ports_3__stack_10c__width_1 i_nor_atom(
		.din0				(atom_8_6), 
		.din1				(atom_5_3), 
		.din2				(atom_2_0), 
		.dout				(ccx_dest_atom_a_));
	inv_macro__dinv_32x__stack_10c__width_1 i_inv_dest_atom(
		.din				(ccx_dest_atom_a_), 
		.dout				(ccx_dest_atom_a));
	buff_macro__dbuff_8x__stack_none__width_1 buff_scanout(
		.din				(scan_out_prebuf), 
		.dout				(scan_out));
endmodule

`ifdef FPGA
`else

`celldefine
module inv_macro__dinv_32x__stack_10c__width_1(din, dout);

        input   [0:0]           din;
        output  [0:0]           dout;

        inv #(1) d0_0(
                .in                             (din[0]),
                .out                            (dout[0]));
endmodule
`endcelldefine

module msff_macro__dmsff_8x__stack_10c__stack_10c__width_10(din, clk, en, se,
        scan_in, siclk, soclk, pce_ov, stop, dout, scan_out);

        input   [9:0]           din;
        input                   clk;
        input                   en;
        input                   se;
        input                   scan_in;
        input                   siclk;
        input                   soclk;
        input                   pce_ov;
        input                   stop;
        output  [9:0]           dout;
        output                  scan_out;

        wire                    l1clk;
        wire                    siclk_out;
        wire                    soclk_out;
        wire    [8:0]           so;

        cl_dp1_l1hdr_8x c0_0(
                .l2clk                          (clk),
                .pce                            (en),
                .aclk                           (siclk),
                .bclk                           (soclk),
                .l1clk                          (l1clk),
                .se                             (se),
                .pce_ov                         (pce_ov),
                .stop                           (stop),
                .siclk_out                      (siclk_out),
                .soclk_out                      (soclk_out));
        dff #(10) d0_0(
                .l1clk                          (l1clk),
                .siclk                          (siclk_out),
                .soclk                          (soclk_out),
                .d                              (din[9:0]),
                .si                             ({scan_in, so[8:0]}),
                .so                             ({so[8:0], scan_out}),
                .q                              (dout[9:0]));
endmodule

`celldefine
module nor_macro__dnor_4x__ports_3__stack_10c__width_1(din0, din1, din2, dout);

        input   [0:0]           din0;
        input   [0:0]           din1;
        input   [0:0]           din2;
        output  [0:0]           dout;

        nor3 #(1) d0_0(
                .in0                            (din0[0]),
                .in1                            (din1[0]),
                .in2                            (din2[0]),
                .out                            (dout[0]));
endmodule
`endcelldefine

`celldefine
module inv_macro__dinv_32x__stack_10c__width_1(din, dout);

        input   [0:0]           din;
        output  [0:0]           dout;

        inv #(1) d0_0(
                .in                             (din[0]),
                .out                            (dout[0]));
endmodule
`endcelldefine

`endif  // ifdef FPGA



`endif // `ifdef FPGA
