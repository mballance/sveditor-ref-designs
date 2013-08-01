// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pku_pck_ctl.v
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
module pku_pck_ctl (
  lsu_pku_pmen, 
  pku_pick_p, 
  swl_ready_p, 
  swl_spec_ready_p, 
  ifu_buf0_valid_p, 
  scan_in, 
  l2clk, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  pku_raw_pick_p, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire pick_en;
wire [3:0] nsready;
wire [3:0] sready;
wire l1clk_pm1;
wire spares_scanin;
wire spares_scanout;
wire nspick_sel;
wire [3:0] nspick;
wire [7:0] lru;
wire [3:0] spick;
wire [3:0] ipick;
wire [7:0] nlru;
wire any_pick;
wire [7:0] real_nlru_in;
wire [7:0] lru_out;
wire lruf_scanin;
wire lruf_scanout;


input lsu_pku_pmen;		// power management enable for pku
input [3:0] pku_pick_p;	        // from datapath logic

input [3:0] swl_ready_p;        // thread is in ready state
input [3:0] swl_spec_ready_p;	// thread is in speculative ready state
input [3:0] ifu_buf0_valid_p;	// oldest instruction for thread i is valid
input scan_in;
input l2clk;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_scan_en;



output [3:0] pku_raw_pick_p;  // raw pick signals to mux the pc addresses in the ifu (no swl_cancel_pick or decode cancel)
output scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se = tcu_scan_en;
// end scan


assign pick_en = (|nsready[3:0]) | (|sready[3:0]) | ~lsu_pku_pmen;

pku_pck_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (pick_en ),
 .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

pku_pck_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

assign nsready[3:0] = (swl_ready_p[3:0] & ifu_buf0_valid_p[3:0]);

assign nspick_sel = |nsready[3:0];

// 0in value -var nspick[3:0]  -val 4'b0000 4'b0001 4'b0010 4'b0100 4'b1000
// 0in value -var spick[3:0]  -val 4'b0000 4'b0001 4'b0010 4'b0100 4'b1000
// 0in value -var ipick[3:0]  -val 4'b0000 4'b0001 4'b0010 4'b0100 4'b1000

assign nspick[3] = (nsready[3]&!nsready[1]&!nsready[0]&lru[1]&!lru[0]) | (nsready[3]
    &!nsready[2]&!nsready[0]&!lru[1]&lru[0]) | (nsready[3]&!nsready[1]&!lru[2]
    &!lru[0]) | (nsready[3]&!nsready[2]&!lru[3]&!lru[1]) | (nsready[3]&!nsready[2]
    &!nsready[1]&!lru[1]&!lru[0]) | (nsready[3]&!nsready[0]&!lru[7]&!lru[6]
    &lru[5]&lru[4]) | (nsready[3]&lru[7]&lru[6]) | (nsready[3]&!nsready[2]
    &!nsready[1]&!nsready[0]);

assign nspick[2] = (!nsready[3]&nsready[2]&!nsready[1]&!lru[1]&!lru[0]) | (nsready[2]
    &!nsready[1]&!nsready[0]&lru[1]&lru[0]) | (nsready[2]&!nsready[0]&lru[2]
    &lru[0]) | (!nsready[3]&nsready[2]&!lru[3]&!lru[1]) | (!nsready[3]&nsready[2]
    &!nsready[0]&!lru[1]&lru[0]) | (nsready[2]&!nsready[1]&!lru[7]&lru[6]
    &lru[5]&!lru[4]) | (nsready[2]&lru[7]&!lru[6]) | (!nsready[3]&nsready[2]
    &!nsready[1]&!nsready[0]);

assign nspick[1] = (!nsready[3]&!nsready[2]&nsready[1]&!lru[1]&!lru[0]) | (!nsready[2]
    &nsready[1]&!nsready[0]&lru[1]&lru[0]) | (!nsready[3]&nsready[1]&!lru[2]
    &!lru[0]) | (nsready[1]&!nsready[0]&lru[3]&lru[1]) | (!nsready[3]&nsready[1]
    &!nsready[0]&lru[1]&!lru[0]) | (!nsready[2]&nsready[1]&lru[7]&!lru[6]
    &!lru[5]&lru[4]) | (nsready[1]&!lru[7]&lru[6]) | (!nsready[3]&!nsready[2]
    &nsready[1]&!nsready[0]);

assign nspick[0] = (!nsready[3]&!nsready[1]&nsready[0]&lru[1]&!lru[0]) | (!nsready[3]
    &!nsready[2]&nsready[0]&!lru[1]&lru[0]) | (!nsready[2]&nsready[0]&lru[2]
    &lru[0]) | (!nsready[1]&nsready[0]&lru[3]&lru[1]) | (!nsready[2]&!nsready[1]
    &nsready[0]&lru[1]&lru[0]) | (!nsready[3]&nsready[0]&lru[7]&lru[6]&!lru[5]
    &!lru[4]) | (nsready[0]&!lru[7]&!lru[6]) | (!nsready[3]&!nsready[2]
    &!nsready[1]&nsready[0]);

assign sready[3:0] = (swl_spec_ready_p[3:0] & ifu_buf0_valid_p[3:0]);

assign spick[3] = (sready[3]&!sready[1]&!sready[0]&lru[1]&!lru[0]) | (sready[3]
    &!sready[2]&!sready[0]&!lru[1]&lru[0]) | (sready[3]&!sready[1]&!lru[2]
    &!lru[0]) | (sready[3]&!sready[2]&!lru[3]&!lru[1]) | (sready[3]&!sready[2]
    &!sready[1]&!lru[1]&!lru[0]) | (sready[3]&!sready[0]&!lru[7]&!lru[6]
    &lru[5]&lru[4]) | (sready[3]&lru[7]&lru[6]) | (sready[3]&!sready[2]
    &!sready[1]&!sready[0]);

assign spick[2] = (!sready[3]&sready[2]&!sready[1]&!lru[1]&!lru[0]) | (sready[2]
    &!sready[1]&!sready[0]&lru[1]&lru[0]) | (sready[2]&!sready[0]&lru[2]
    &lru[0]) | (!sready[3]&sready[2]&!lru[3]&!lru[1]) | (!sready[3]&sready[2]
    &!sready[0]&!lru[1]&lru[0]) | (sready[2]&!sready[1]&!lru[7]&lru[6]
    &lru[5]&!lru[4]) | (sready[2]&lru[7]&!lru[6]) | (!sready[3]&sready[2]
    &!sready[1]&!sready[0]);

assign spick[1] = (!sready[3]&!sready[2]&sready[1]&!lru[1]&!lru[0]) | (!sready[2]
    &sready[1]&!sready[0]&lru[1]&lru[0]) | (!sready[3]&sready[1]&!lru[2]
    &!lru[0]) | (sready[1]&!sready[0]&lru[3]&lru[1]) | (!sready[3]&sready[1]
    &!sready[0]&lru[1]&!lru[0]) | (!sready[2]&sready[1]&lru[7]&!lru[6]
    &!lru[5]&lru[4]) | (sready[1]&!lru[7]&lru[6]) | (!sready[3]&!sready[2]
    &sready[1]&!sready[0]);

assign spick[0] = (!sready[3]&!sready[1]&sready[0]&lru[1]&!lru[0]) | (!sready[3]
    &!sready[2]&sready[0]&!lru[1]&lru[0]) | (!sready[2]&sready[0]&lru[2]
    &lru[0]) | (!sready[1]&sready[0]&lru[3]&lru[1]) | (!sready[2]&!sready[1]
    &sready[0]&lru[1]&lru[0]) | (!sready[3]&sready[0]&lru[7]&lru[6]&!lru[5]
    &!lru[4]) | (sready[0]&!lru[7]&!lru[6]) | (!sready[3]&!sready[2]
    &!sready[1]&sready[0]);

assign ipick[3:0] = ({4{nspick_sel}} & nspick[3:0]) |
		   ({4{~nspick_sel}} & spick[3:0]);

assign pku_raw_pick_p[3:0] = ipick[3:0];

// lru is msb pair of the lru vector
assign nlru[7] = (ipick[0]&!lru[6]&lru[5]) | (ipick[1]&lru[6]&lru[5]) | (!lru[3]
    &!lru[1]) | (!ipick[2]&lru[7]&!lru[6]) | (!ipick[3]&lru[7]&lru[6]);

assign nlru[6] = (ipick[0]&!lru[7]&lru[4]) | (ipick[2]&lru[7]&lru[4]) | (!lru[2]
    &!lru[0]) | (!ipick[1]&!lru[7]&lru[6]) | (!ipick[3]&lru[7]&lru[6]);

assign nlru[5] = (!ipick[3]&!ipick[0]&lru[5]&lru[4]&lru[2]&lru[1]) | (ipick[0]
    &!lru[1]&lru[0]) | (ipick[1]&lru[3]&lru[1]) | (ipick[3]&lru[3]&!lru[2]
    &!lru[1]) | (ipick[0]&!lru[7]&lru[3]) | (ipick[2]&lru[3]&lru[2]&!lru[1]) | (
    ipick[1]&lru[3]&!lru[0]) | (!ipick[2]&!ipick[0]&!lru[7]&lru[5]&!lru[4]
    &lru[2]) | (!ipick[3]&!ipick[1]&!lru[7]&lru[5]&lru[4]&!lru[2]) | (
    !ipick[2]&!ipick[1]&!lru[7]&lru[5]&!lru[2]&lru[0]) | (!ipick[3]&!ipick[2]
    &lru[5]&!lru[1]);

assign nlru[4] = (ipick[0]&lru[1]&!lru[0]) | (ipick[2]&lru[2]&lru[0]) | (!ipick[3]
    &!ipick[2]&lru[4]&!lru[3]&!lru[1]) | (ipick[3]&!lru[3]&lru[2]&!lru[0]) | (
    ipick[0]&!lru[6]&lru[2]) | (ipick[1]&lru[3]&lru[2]&!lru[0]) | (ipick[2]
    &lru[2]&!lru[1]) | (!ipick[3]&!ipick[0]&!lru[7]&!lru[6]&lru[5]&lru[4]) | (
    !ipick[1]&!ipick[0]&!lru[6]&!lru[5]&lru[4]&lru[3]) | (!ipick[2]&!ipick[1]
    &!lru[6]&lru[4]&!lru[3]&lru[1]) | (!ipick[3]&!ipick[1]&lru[4]&!lru[0]);

assign nlru[3] = (ipick[3]&lru[1]&!lru[0]) | (ipick[2]&lru[1]&lru[0]) | (!ipick[3]
    &!ipick[2]&!ipick[1]&lru[3]&!lru[0]) | (!ipick[3]&!ipick[2]&!ipick[0]
    &lru[3]&lru[0]) | (ipick[1]&lru[1]) | (ipick[0]&lru[1]) | (lru[3]
    &lru[1]);

assign nlru[2] = (ipick[3]&!lru[1]&lru[0]) | (ipick[1]&lru[1]&lru[0]) | (lru[2]
    &lru[0]) | (!ipick[3]&!ipick[2]&!ipick[1]&lru[2]&!lru[1]) | (!ipick[3]
    &!ipick[1]&!ipick[0]&lru[2]&lru[1]) | (ipick[2]&lru[0]) | (ipick[0]
    &lru[0]);

assign nlru[1] = (!ipick[1]&!ipick[0]&lru[1]) | (ipick[3]) | (ipick[2]);

assign nlru[0] = (!ipick[2]&!ipick[0]&lru[0]) | (ipick[3]) | (ipick[1]);

// only update the lru with the actual pick signals
assign any_pick = |pku_pick_p[3:0];

assign real_nlru_in[7:0] = ({8{any_pick}} & {nlru[7],nlru[6],nlru[5],~nlru[4],~nlru[3],nlru[2],~nlru[1],~nlru[0]}) |
			   ({8{!any_pick}} & lru_out[7:0]);

pku_pck_ctl_msff_ctl_macro__width_8 lruf  (
 .scan_in(lruf_scanin),
 .scan_out(lruf_scanout),
 .l1clk(l1clk_pm1),
 .din  (real_nlru_in[7:0]),
 .dout (lru_out[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);
assign lru[7:0] = {lru_out[7],lru_out[6],lru_out[5],~lru_out[4],~lru_out[3],lru_out[2],~lru_out[1],~lru_out[0]};


supply0 vss;
supply1 vdd;
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign lruf_scanin               = spares_scanout           ;
assign scan_out                  = lruf_scanout             ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module pku_pck_ctl_l1clkhdr_ctl_macro (
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


module pku_pck_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule






// any PARAMS parms go into naming of macro

module pku_pck_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule








