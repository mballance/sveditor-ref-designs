// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dec_ded_ctl.v
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
module dec_ded_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  clken, 
  tlu_cerer_icdp, 
  del_test_sel_p, 
  del_twocycle_std_p, 
  del_twocycle_rs2_p, 
  del_default_sel_p, 
  del_test_addr_p, 
  ifu_buf0_inst0, 
  ifu_buf0_inst1, 
  ifu_buf0_inst2, 
  ifu_buf0_inst3, 
  ifu_buf0_excp0, 
  ifu_buf0_excp1, 
  ifu_buf0_excp2, 
  ifu_buf0_excp3, 
  del_noshift_d, 
  pku_raw_pick_p, 
  pku_isrc_rs1_p, 
  pku_isrc_rs2_p, 
  pku_isrc_rd_p, 
  exu_oddwin_b, 
  ded_oddwin_d, 
  dec_inst_d, 
  dec_inst_rs1_p, 
  dec_inst_rs2_p, 
  dec_inst_rs3_p, 
  dec_inst_rs1_vld_p, 
  dec_inst_rs2_vld_p, 
  dec_inst_rs3_vld_p, 
  ded_exc_d, 
  ded_perr_p, 
  ded_ferr_p, 
  ded_perr_d, 
  ded_ferr_d, 
  ded_legal_p, 
  scan_out);
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire icdf_perr_f_scanin;
wire icdf_perr_f_scanout;
wire icdp_perr_en;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire oddwinf_scanin;
wire oddwinf_scanout;
wire [3:0] oddwin;
wire [2:0] xor0;
wire [2:0] xor1;
wire [2:0] xor2;
wire [2:0] xor3;
wire [3:0] window_in;
wire [2:0] xor_d;
wire windowf_scanin;
wire windowf_scanout;
wire twocyclef_scanin;
wire twocyclef_scanout;
wire [4:0] inst_rs2_d;
wire [4:1] inst_rs3_d;
wire [2:0] isrc_in;
wire [32:0] decode_mux;
wire [2:0] isrc0_in;
wire [2:0] isrc1_in;
wire [2:0] isrc2_in;
wire [2:0] isrc3_in;
wire [2:0] isrc_d;
wire isrcf_scanin;
wire isrcf_scanout;
wire [4:0] exc_in;
wire excf_scanin;
wire excf_scanout;
wire decodef_scanin;
wire decodef_scanout;
wire parityerrf_scanin;
wire parityerrf_scanout;
wire [3:0] ifetch_err_p;
wire ifetcherrf_scanin;
wire ifetcherrf_scanout;
wire illegal0_p;
wire illegal1_p;
wire illegal2_p;
wire illegal3_p;
wire legal_d;
wire legalf_scanin;
wire legalf_scanout;



input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_scan_en;

input clken;

input tlu_cerer_icdp;		// enable for icdp perr (0 then mask it)

input del_test_sel_p;		// mux selects for IRF read port rs3
input del_twocycle_std_p;
input del_twocycle_rs2_p;
input del_default_sel_p;


input [4:0] del_test_addr_p;	// address to read for exu test access

input [32:0] ifu_buf0_inst0;		// instructions for each of the threads at p stage
input [32:0] ifu_buf0_inst1;
input [32:0] ifu_buf0_inst2;
input [32:0] ifu_buf0_inst3;

input [4:0] ifu_buf0_excp0;		// exception info for each of the threads at p stage
input [4:0] ifu_buf0_excp1;
input [4:0] ifu_buf0_excp2;
input [4:0] ifu_buf0_excp3;

input del_noshift_d;			// dont shift anything into decode0 stage
input [3:0]  pku_raw_pick_p;     	// raw pick signals to ifu to mux pc addresses


input [3:0] pku_isrc_rs1_p;		// has rs1 source
input [3:0] pku_isrc_rs2_p;		// has rs2 source
input [3:0] pku_isrc_rd_p;		// has rd source

input [3:0] exu_oddwin_b;		// whether window for current thread is odd or not

output ded_oddwin_d;			// window is odd for decode0

output [32:0] dec_inst_d;

output [4:0] dec_inst_rs1_p;
output [4:0] dec_inst_rs2_p;
output [4:0] dec_inst_rs3_p;
output dec_inst_rs1_vld_p;
output dec_inst_rs2_vld_p;
output dec_inst_rs3_vld_p;


output [4:0] ded_exc_d;

output ded_perr_p;		// inst parity error at p stage; to del to squash predecodes
output ded_ferr_p;		// inst ifetch error at p stage; to del to squash predecodes
	   
output ded_perr_d;		// inst parity error at d stage; to dcd to squash main decode
output ded_ferr_d;		// inst ifetch error at d stage; to dcd to squash main decode

output ded_legal_p;		// illegal instruction at p stage

output scan_out;


dec_ded_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (clken),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

dec_ded_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

dec_ded_ctl_msff_ctl_macro__width_1 icdf_perr_f  (
 .scan_in(icdf_perr_f_scanin),
 .scan_out(icdf_perr_f_scanout),
 .l1clk(l1clk),
 .din  (tlu_cerer_icdp),
 .dout (icdp_perr_en),
  .siclk(siclk),
  .soclk(soclk)
);


// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se = tcu_scan_en;
// end scan

// 0in value -var pku_raw_pick_p[3:0] -val 0 1 2 4 8


dec_ded_ctl_msff_ctl_macro__width_4 oddwinf  (
 .scan_in(oddwinf_scanin),
 .scan_out(oddwinf_scanout),
 .din(exu_oddwin_b[3:0]),
 .dout(oddwin[3:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// generate correct pointers for rd, rs1 and rs2 for each thread

assign xor0[2:0] = {ifu_buf0_inst0[29],ifu_buf0_inst0[18],ifu_buf0_inst0[4]} ^ ({3{oddwin[0]}} &  {ifu_buf0_inst0[28],ifu_buf0_inst0[17],ifu_buf0_inst0[3]});

assign xor1[2:0] = {ifu_buf0_inst1[29],ifu_buf0_inst1[18],ifu_buf0_inst1[4]} ^ ({3{oddwin[1]}} &  {ifu_buf0_inst1[28],ifu_buf0_inst1[17],ifu_buf0_inst1[3]});

assign xor2[2:0] = {ifu_buf0_inst2[29],ifu_buf0_inst2[18],ifu_buf0_inst2[4]} ^ ({3{oddwin[2]}} &  {ifu_buf0_inst2[28],ifu_buf0_inst2[17],ifu_buf0_inst2[3]});

assign xor3[2:0] = {ifu_buf0_inst3[29],ifu_buf0_inst3[18],ifu_buf0_inst3[4]} ^ ({3{oddwin[3]}} &  {ifu_buf0_inst3[28],ifu_buf0_inst3[17],ifu_buf0_inst3[3]});



assign window_in[3:0] =    ({4{del_noshift_d}} &                      {ded_oddwin_d,xor_d[2:0]}) |
			   ({4{~del_noshift_d & pku_raw_pick_p[0]}} & {oddwin[0],xor0[2:0]}) |
			   ({4{~del_noshift_d & pku_raw_pick_p[1]}} & {oddwin[1],xor1[2:0]}) |
			   ({4{~del_noshift_d & pku_raw_pick_p[2]}} & {oddwin[2],xor2[2:0]}) |
			   ({4{~del_noshift_d & pku_raw_pick_p[3]}} & {oddwin[3],xor3[2:0]});


dec_ded_ctl_msff_ctl_macro__width_4 windowf  (
 .scan_in(windowf_scanin),
 .scan_out(windowf_scanout),
 .din(window_in[3:0]),
 .dout({ded_oddwin_d,xor_d[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// twocycle operations use the rs3 port to the irf for the second read operation

dec_ded_ctl_msff_ctl_macro__width_9 twocyclef  (
 .scan_in(twocyclef_scanin),
 .scan_out(twocyclef_scanout),
 .din({dec_inst_rs2_p[4:0],dec_inst_rs3_p[4:1]}),
 .dout({inst_rs2_d[4:0],inst_rs3_d[4:1]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



assign {dec_inst_rs3_vld_p,dec_inst_rs3_p[4:0]} = ({6{del_test_sel_p}} & {1'b1,del_test_addr_p[4:0]}) |
						  ({6{del_twocycle_std_p}} & {1'b1,inst_rs3_d[4:1],1'b1}) |
					          ({6{del_twocycle_rs2_p}} & {1'b1,inst_rs2_d[4:0]}) |
						  ({6{del_default_sel_p}}  & {isrc_in[2],window_in[2],decode_mux[28:25]});


assign dec_inst_rs1_vld_p = isrc_in[1];
assign dec_inst_rs2_vld_p = isrc_in[0];

assign dec_inst_rs1_p[4:0] = {window_in[1],decode_mux[17:14]};
assign dec_inst_rs2_p[4:0] = {window_in[0],decode_mux[3:0]};


assign isrc0_in[2:0] = { pku_isrc_rd_p[0],pku_isrc_rs1_p[0],pku_isrc_rs2_p[0] };

assign isrc1_in[2:0] = { pku_isrc_rd_p[1],pku_isrc_rs1_p[1],pku_isrc_rs2_p[1] };

assign isrc2_in[2:0] = { pku_isrc_rd_p[2],pku_isrc_rs1_p[2],pku_isrc_rs2_p[2] };

assign isrc3_in[2:0] = { pku_isrc_rd_p[3],pku_isrc_rs1_p[3],pku_isrc_rs2_p[3] };


assign isrc_in[2:0] =      ({3{del_noshift_d}} & isrc_d[2:0]) |
			   ({3{~del_noshift_d & pku_raw_pick_p[0]}} & isrc0_in[2:0]) |
			   ({3{~del_noshift_d & pku_raw_pick_p[1]}} & isrc1_in[2:0]) |
			   ({3{~del_noshift_d & pku_raw_pick_p[2]}} & isrc2_in[2:0]) |
			   ({3{~del_noshift_d & pku_raw_pick_p[3]}} & isrc3_in[2:0]);


dec_ded_ctl_msff_ctl_macro__width_3 isrcf  (
 .scan_in(isrcf_scanin),
 .scan_out(isrcf_scanout),
 .din(isrc_in[2:0]),
 .dout(isrc_d[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);





assign exc_in[4:0] =       ({5{del_noshift_d}} & ded_exc_d[4:0]) |
			   ({5{~del_noshift_d & pku_raw_pick_p[0]}} & ifu_buf0_excp0[4:0]) |
			   ({5{~del_noshift_d & pku_raw_pick_p[1]}} & ifu_buf0_excp1[4:0]) |
			   ({5{~del_noshift_d & pku_raw_pick_p[2]}} & ifu_buf0_excp2[4:0]) |
			   ({5{~del_noshift_d & pku_raw_pick_p[3]}} & ifu_buf0_excp3[4:0]);

dec_ded_ctl_msff_ctl_macro__width_5 excf  (
 .scan_in(excf_scanin),
 .scan_out(excf_scanout),
 .din(exc_in[4:0]),
 .dout(ded_exc_d[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign decode_mux[32:0] = ({33{del_noshift_d}} & dec_inst_d[32:0]) |
			   ({33{~del_noshift_d & pku_raw_pick_p[0]}} & ifu_buf0_inst0[32:0]) |
			   ({33{~del_noshift_d & pku_raw_pick_p[1]}} & ifu_buf0_inst1[32:0]) |
			   ({33{~del_noshift_d & pku_raw_pick_p[2]}} & ifu_buf0_inst2[32:0]) |
			   ({33{~del_noshift_d & pku_raw_pick_p[3]}} & ifu_buf0_inst3[32:0]);

dec_ded_ctl_msff_ctl_macro__width_33 decodef  (
 .scan_in(decodef_scanin),
 .scan_out(decodef_scanout),
 .din(decode_mux[32:0]),
 .dout(dec_inst_d[32:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// its only a parity error if its enabled
assign ded_perr_p =   ( del_noshift_d & ded_perr_d) |
			   (~del_noshift_d & pku_raw_pick_p[0] & icdp_perr_en & (ifu_buf0_inst0[32] ^ (^ifu_buf0_inst0[31:0]))) |
			   (~del_noshift_d & pku_raw_pick_p[1] & icdp_perr_en & (ifu_buf0_inst1[32] ^ (^ifu_buf0_inst1[31:0]))) |
			   (~del_noshift_d & pku_raw_pick_p[2] & icdp_perr_en & (ifu_buf0_inst2[32] ^ (^ifu_buf0_inst2[31:0]))) |
			   (~del_noshift_d & pku_raw_pick_p[3] & icdp_perr_en & (ifu_buf0_inst3[32] ^ (^ifu_buf0_inst3[31:0])));

dec_ded_ctl_msff_ctl_macro__width_1 parityerrf  (
 .scan_in(parityerrf_scanin),
 .scan_out(parityerrf_scanout),
 .din(ded_perr_p),
 .dout(ded_perr_d),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ifetch_err_p[0] = 	(ifu_buf0_excp0[4:0] == 5'b00001) |
				(ifu_buf0_excp0[4:0] == 5'b00010) |
				(ifu_buf0_excp0[4:0] == 5'b00011) |
				(ifu_buf0_excp0[4:0] == 5'b00100) |
				(ifu_buf0_excp0[4:0] == 5'b00111) |
				(ifu_buf0_excp0[4:0] == 5'b11111) |
				(ifu_buf0_excp0[4:0] == 5'b01001) |
				(ifu_buf0_excp0[4:0] == 5'b01010) |
				(ifu_buf0_excp0[4:0] == 5'b01011) |
				(ifu_buf0_excp0[4:0] == 5'b01100) |
				(ifu_buf0_excp0[4:0] == 5'b01101) |
				(ifu_buf0_excp0[4:0] == 5'b01111) |
				(ifu_buf0_excp0[4:0] == 5'b10000) |
				(ifu_buf0_excp0[4:0] == 5'b10001) |
				(ifu_buf0_excp0[4:0] == 5'b10011) |
				(ifu_buf0_excp0[4:0] == 5'b10111) |
				(ifu_buf0_excp0[4:0] == 5'b11000);

assign ifetch_err_p[1] = 	(ifu_buf0_excp1[4:0] == 5'b00001) |
				(ifu_buf0_excp1[4:0] == 5'b00010) |
				(ifu_buf0_excp1[4:0] == 5'b00011) |
				(ifu_buf0_excp1[4:0] == 5'b00100) |
				(ifu_buf0_excp1[4:0] == 5'b00111) |
				(ifu_buf0_excp1[4:0] == 5'b11111) |
				(ifu_buf0_excp1[4:0] == 5'b01001) |
				(ifu_buf0_excp1[4:0] == 5'b01010) |
				(ifu_buf0_excp1[4:0] == 5'b01011) |
				(ifu_buf0_excp1[4:0] == 5'b01100) |
				(ifu_buf0_excp1[4:0] == 5'b01101) |
				(ifu_buf0_excp1[4:0] == 5'b01111) |
				(ifu_buf0_excp1[4:0] == 5'b10000) |
				(ifu_buf0_excp1[4:0] == 5'b10001) |
				(ifu_buf0_excp1[4:0] == 5'b10011) |
				(ifu_buf0_excp1[4:0] == 5'b10111) |
				(ifu_buf0_excp1[4:0] == 5'b11000);

assign ifetch_err_p[2] = 	(ifu_buf0_excp2[4:0] == 5'b00001) |
				(ifu_buf0_excp2[4:0] == 5'b00010) |
				(ifu_buf0_excp2[4:0] == 5'b00011) |
				(ifu_buf0_excp2[4:0] == 5'b00100) |
				(ifu_buf0_excp2[4:0] == 5'b00111) |
				(ifu_buf0_excp2[4:0] == 5'b11111) |
				(ifu_buf0_excp2[4:0] == 5'b01001) |
				(ifu_buf0_excp2[4:0] == 5'b01010) |
				(ifu_buf0_excp2[4:0] == 5'b01011) |
				(ifu_buf0_excp2[4:0] == 5'b01100) |
				(ifu_buf0_excp2[4:0] == 5'b01101) |
				(ifu_buf0_excp2[4:0] == 5'b01111) |
				(ifu_buf0_excp2[4:0] == 5'b10000) |
				(ifu_buf0_excp2[4:0] == 5'b10001) |
				(ifu_buf0_excp2[4:0] == 5'b10011) |
				(ifu_buf0_excp2[4:0] == 5'b10111) |
				(ifu_buf0_excp2[4:0] == 5'b11000);

assign ifetch_err_p[3] = 	(ifu_buf0_excp3[4:0] == 5'b00001) |
				(ifu_buf0_excp3[4:0] == 5'b00010) |
				(ifu_buf0_excp3[4:0] == 5'b00011) |
				(ifu_buf0_excp3[4:0] == 5'b00100) |
				(ifu_buf0_excp3[4:0] == 5'b00111) |
				(ifu_buf0_excp3[4:0] == 5'b11111) |
				(ifu_buf0_excp3[4:0] == 5'b01001) |
				(ifu_buf0_excp3[4:0] == 5'b01010) |
				(ifu_buf0_excp3[4:0] == 5'b01011) |
				(ifu_buf0_excp3[4:0] == 5'b01100) |
				(ifu_buf0_excp3[4:0] == 5'b01101) |
				(ifu_buf0_excp3[4:0] == 5'b01111) |
				(ifu_buf0_excp3[4:0] == 5'b10000) |
				(ifu_buf0_excp3[4:0] == 5'b10001) |
				(ifu_buf0_excp3[4:0] == 5'b10011) |
				(ifu_buf0_excp3[4:0] == 5'b10111) |
				(ifu_buf0_excp3[4:0] == 5'b11000);

assign ded_ferr_p =   ( del_noshift_d & ded_ferr_d) |
			    (~del_noshift_d & pku_raw_pick_p[0] & ifetch_err_p[0]) |
			    (~del_noshift_d & pku_raw_pick_p[1] & ifetch_err_p[1] ) |
			    (~del_noshift_d & pku_raw_pick_p[2] & ifetch_err_p[2] ) |
			    (~del_noshift_d & pku_raw_pick_p[3] & ifetch_err_p[3] );

dec_ded_ctl_msff_ctl_macro__width_1 ifetcherrf  (
 .scan_in(ifetcherrf_scanin),
 .scan_out(ifetcherrf_scanout),
 .din(ded_ferr_p),
 .dout(ded_ferr_d),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign illegal0_p = ~ifu_buf0_inst0[31] & ~ifu_buf0_inst0[30] & ~ifu_buf0_inst0[24] & ~ifu_buf0_inst0[23] & ~ifu_buf0_inst0[22];
assign illegal1_p = ~ifu_buf0_inst1[31] & ~ifu_buf0_inst1[30] & ~ifu_buf0_inst1[24] & ~ifu_buf0_inst1[23] & ~ifu_buf0_inst1[22];
assign illegal2_p = ~ifu_buf0_inst2[31] & ~ifu_buf0_inst2[30] & ~ifu_buf0_inst2[24] & ~ifu_buf0_inst2[23] & ~ifu_buf0_inst2[22];
assign illegal3_p = ~ifu_buf0_inst3[31] & ~ifu_buf0_inst3[30] & ~ifu_buf0_inst3[24] & ~ifu_buf0_inst3[23] & ~ifu_buf0_inst3[22];


assign ded_legal_p =       ( del_noshift_d & legal_d) |
			   (~del_noshift_d & pku_raw_pick_p[0] & ~illegal0_p) |
			   (~del_noshift_d & pku_raw_pick_p[1] & ~illegal1_p) |
			   (~del_noshift_d & pku_raw_pick_p[2] & ~illegal2_p) |
			   (~del_noshift_d & pku_raw_pick_p[3] & ~illegal3_p);

dec_ded_ctl_msff_ctl_macro__width_1 legalf  (
 .scan_in(legalf_scanin),
 .scan_out(legalf_scanout),
 .din(ded_legal_p),
 .dout(legal_d),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// fixscan start:
assign spares_scanin             = scan_in                  ;
assign icdf_perr_f_scanin        = spares_scanout           ;
assign oddwinf_scanin            = icdf_perr_f_scanout      ;
assign windowf_scanin            = oddwinf_scanout          ;
assign twocyclef_scanin          = windowf_scanout          ;
assign isrcf_scanin              = twocyclef_scanout        ;
assign excf_scanin               = isrcf_scanout            ;
assign decodef_scanin            = excf_scanout             ;
assign parityerrf_scanin         = decodef_scanout          ;
assign ifetcherrf_scanin         = parityerrf_scanout       ;
assign legalf_scanin             = ifetcherrf_scanout       ;
assign scan_out                  = legalf_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module dec_ded_ctl_l1clkhdr_ctl_macro (
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



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module dec_ded_ctl_spare_ctl_macro__num_2 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));
assign scan_out = so_1;



endmodule






// any PARAMS parms go into naming of macro

module dec_ded_ctl_msff_ctl_macro__width_1 (
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
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module dec_ded_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module dec_ded_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module dec_ded_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module dec_ded_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module dec_ded_ctl_msff_ctl_macro__width_33 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [32:0] fdin;
wire [31:0] so;

  input [32:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [32:0] dout;
  output scan_out;
assign fdin[32:0] = din[32:0];






dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);












endmodule








