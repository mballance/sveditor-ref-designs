// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_pid_dp.v
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
module lsu_pid_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  const_cpuid, 
  lmd_bypass_data_m, 
  lmc_ld_tid, 
  lmc_ld_sz, 
  lmd_pcx_rqtyp, 
  lmd_pcx_nc, 
  lmd_pcx_pref, 
  lmd_pcx_rway, 
  lmd_pcx_addr, 
  lmd_asi_rngf, 
  lmd_asi_type, 
  lmd_asi_asi, 
  lmc_ld_vld_p4, 
  lmc_ld_inv_p4, 
  sbc_st_sel_tid_p4, 
  sbc_st_pcx_nc, 
  sbc_st_asi_fs, 
  sbc_pcx_bmask, 
  sbc_pcx_addr, 
  sbc_pcx_rmo_st, 
  sbc_pcx_blk_st, 
  sbc_pid_kill_store_p4_, 
  sbc_force_inv, 
  sbc_st_type_p4, 
  stb_cam_data, 
  stb_ram_data, 
  pic_ld_pcx_sel_p4, 
  pic_st_pcx_sel_p4, 
  pic_st_asi_p4, 
  pic_ld_asi_p4, 
  pic_asi_sel_p4, 
  pic_asi_req, 
  spc_pcx_data_pa, 
  pid_asi_pkt);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [63:0] lmd_cas_pkt2_data;
wire [129:0] load_pcx_pkt;
wire [129:0] store_pcx_pkt;
wire [129:0] pcx_data_pa;
wire [126:0] store_asi_pkt;
wire [126:0] load_asi_pkt;
wire [126:0] asi_pkt_hold;
wire dff_asi_pkt_hi_scanin;
wire dff_asi_pkt_hi_scanout;
wire dff_asi_pkt_lo_scanin;
wire dff_asi_pkt_lo_scanout;


input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input	[2:0]	const_cpuid;		// hardwired CPU ID

input	[63:0]	lmd_bypass_data_m;
input	[2:0]	lmc_ld_tid;		// thread id of load packet
input	[4:0]	lmc_ld_sz;
input	[2:0]	lmd_pcx_rqtyp;     
input		lmd_pcx_nc;        
input		lmd_pcx_pref;      
input	[1:0]	lmd_pcx_rway;
input	[39:0]	lmd_pcx_addr;
input		lmd_asi_rngf;      
input	[1:0]	lmd_asi_type;
input	[7:0]	lmd_asi_asi;
input		lmc_ld_vld_p4;
input		lmc_ld_inv_p4;


input	[2:0]	sbc_st_sel_tid_p4;
input		sbc_st_pcx_nc;
input		sbc_st_asi_fs;
input	[7:0]	sbc_pcx_bmask;
input	[2:0]	sbc_pcx_addr;
input		sbc_pcx_rmo_st;
input		sbc_pcx_blk_st;
input		sbc_pid_kill_store_p4_;
input		sbc_force_inv;
input	[2:0]	sbc_st_type_p4;

input	[44:0]	stb_cam_data;
input	[63:0]	stb_ram_data;

input		pic_ld_pcx_sel_p4;	// load port has access
input		pic_st_pcx_sel_p4;	// store port has access
input		pic_st_asi_p4;
input		pic_ld_asi_p4;
input		pic_asi_sel_p4;
input		pic_asi_req;

output	[129:0]	spc_pcx_data_pa;	// PCX Packet
output	[127:0]	pid_asi_pkt;

// scan renames
assign stop = 1'b0;
// end scan

lsu_pid_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

assign lmd_cas_pkt2_data[63:0] = lmd_bypass_data_m[63:0];

assign load_pcx_pkt[129:0] = {
  lmc_ld_vld_p4,
  2'b00, lmd_pcx_rqtyp[2:0],			// rqtyp
  lmd_pcx_nc,
  const_cpuid[2:0],
  lmc_ld_tid[2:0],
  lmc_ld_inv_p4, lmd_pcx_pref,			// inval and prefetch 
  1'b0, lmd_pcx_rway[1:0],			// replacement way
  {4{lmc_ld_sz[4]}}, lmc_ld_sz[3:0],		// size
  lmd_pcx_addr[39:0],
  lmd_cas_pkt2_data[63:0]
};

assign store_pcx_pkt[129:0] = {
  sbc_pid_kill_store_p4_,
  2'b00,sbc_st_type_p4[2:0],
  sbc_st_pcx_nc,
  const_cpuid[2:0],
  sbc_st_sel_tid_p4[2:0],
  sbc_force_inv,				// inv
  sbc_pcx_blk_st,				// BST
  sbc_pcx_rmo_st,				// BIS
  2'b00,					// way
  sbc_pcx_bmask[7:0],				// byte mask
  stb_cam_data[44:8], sbc_pcx_addr[2:0],	// address
  stb_ram_data[63:0]
};

// Select the pcx source
lsu_pid_dp_mux_macro__dmux_2x__mux_aonpe__ports_2__stack_66c__width_65 mx_pcx_data_hi       (
	.din0	(load_pcx_pkt[129:65]),
	.din1	(store_pcx_pkt[129:65]),
	.sel0	(pic_ld_pcx_sel_p4),
	.sel1	(pic_st_pcx_sel_p4),
	.dout	(pcx_data_pa[129:65])
);
lsu_pid_dp_mux_macro__dmux_2x__mux_aonpe__ports_2__stack_66c__width_65 mx_pcx_data_lo       (
	.din0	(load_pcx_pkt[64:0]),
	.din1	(store_pcx_pkt[64:0]),
	.sel0	(pic_ld_pcx_sel_p4),
	.sel1	(pic_st_pcx_sel_p4),
	.dout	(pcx_data_pa[64:0])
);

lsu_pid_dp_buff_macro__stack_66c__width_65 buf_pcx_data_hi   (
	.din	(pcx_data_pa[129:65]),
	.dout	(spc_pcx_data_pa[129:65])
);
lsu_pid_dp_buff_macro__stack_66c__width_65 buf_pcx_data_lo   (
	.din	(pcx_data_pa[64:0]),
	.dout	(spc_pcx_data_pa[64:0])
);
////////////////////////////////////////////////////////////////////////////////
// Interface to the ASI block
// Unlike the pcx interface, the asi interface includes the "request" as the
// packet valid bit.  Because the asi interface will reply with an ack on the
// next cycle best case, all packets will be driven for at least two cycles.
////////////////////////////////////////////////////////////////////////////////

assign store_asi_pkt[126:0] = {
  sbc_st_asi_fs,
  sbc_st_type_p4[1:0],
  1'b0,		// write
  sbc_st_sel_tid_p4[2:0],
  stb_cam_data[7:0],					// ASI ID
  8'h00,stb_cam_data[44:8], 3'b0,			// virt. addr
  stb_ram_data[63:0]					// data
};

assign load_asi_pkt[126:0] = {
  lmd_asi_rngf,
  lmd_asi_type[1:0],
  1'b1,
  lmc_ld_tid[2:0],
  lmd_asi_asi[7:0],
  8'h00,lmd_pcx_addr[39:0],
  64'd0
};

lsu_pid_dp_mux_macro__mux_aope__ports_3__stack_66c__width_62 mx_asi_pkt_hi      (
	.din0	(store_asi_pkt[126:65]),
	.din1	(load_asi_pkt[126:65]),
	.din2	(asi_pkt_hold[126:65]),
	.sel0	(pic_st_asi_p4),
	.sel1	(pic_ld_asi_p4),
	.dout	(pid_asi_pkt[126:65])
);
lsu_pid_dp_mux_macro__mux_aope__ports_3__stack_66c__width_65 mx_asi_pkt_lo      (
	.din0	(store_asi_pkt[64:0]),
	.din1	(load_asi_pkt[64:0]),
	.din2	(asi_pkt_hold[64:0]),
	.sel0	(pic_st_asi_p4),
	.sel1	(pic_ld_asi_p4),
	.dout	(pid_asi_pkt[64:0])
);

lsu_pid_dp_msff_macro__stack_66c__width_62 dff_asi_pkt_hi    (
	.scan_in(dff_asi_pkt_hi_scanin),
	.scan_out(dff_asi_pkt_hi_scanout),
	.din	(pid_asi_pkt[126:65]),
	.dout	(asi_pkt_hold[126:65]),
	.clk	(l2clk),
	.en	(pic_asi_sel_p4),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_pid_dp_msff_macro__stack_66c__width_65 dff_asi_pkt_lo    (
	.scan_in(dff_asi_pkt_lo_scanin),
	.scan_out(dff_asi_pkt_lo_scanout),
	.din	(pid_asi_pkt[64:0]),
	.dout	(asi_pkt_hold[64:0]),
	.clk	(l2clk),
	.en	(pic_asi_sel_p4),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign pid_asi_pkt[127] = pic_asi_req;

////////////////////////////////
// Assertions

// Check that CAS packets are always back to back
// 0in assert_sequence -var (spc_pcx_data_pa[129:124] == 6'b100010) (spc_pcx_data_pa[129:124] == 6'b100011) -max 1 -message "CAS packets not back-to-back"

// fixscan start:
assign dff_asi_pkt_hi_scanin     = scan_in                  ;
assign dff_asi_pkt_lo_scanin     = dff_asi_pkt_hi_scanout   ;
assign scan_out                  = dff_asi_pkt_lo_scanout   ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module lsu_pid_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_pid_dp_mux_macro__dmux_2x__mux_aonpe__ports_2__stack_66c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;
  output [64:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(65)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
.dout(dout[64:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_pid_dp_buff_macro__stack_66c__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






buff #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_pid_dp_mux_macro__mux_aope__ports_3__stack_66c__width_62 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [61:0] din0;
  input [61:0] din1;
  input [61:0] din2;
  input sel0;
  input sel1;
  output [61:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(62)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[61:0]),
  .in1(din1[61:0]),
  .in2(din2[61:0]),
.dout(dout[61:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_pid_dp_mux_macro__mux_aope__ports_3__stack_66c__width_65 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [64:0] din0;
  input [64:0] din1;
  input [64:0] din2;
  input sel0;
  input sel1;
  output [64:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(65)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
.dout(dout[64:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_pid_dp_msff_macro__stack_66c__width_62 (
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
wire [60:0] so;

  input [61:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [61:0] dout;


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
dff #(62)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[61:0]),
.si({scan_in,so[60:0]}),
.so({so[60:0],scan_out}),
.q(dout[61:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module lsu_pid_dp_msff_macro__stack_66c__width_65 (
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
wire [63:0] so;

  input [64:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


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
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule








