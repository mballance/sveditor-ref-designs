// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_rng_cust.v
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
module n2_rng_cust(vreg_selbg_l ,rng_arst_l ,ch_sel ,anlg_sel ,
     vcoctrl_sel ,vdd_hv15 ,soclk ,si ,anlg_char_out ,bypass ,
     tcu_se_scancollar_out ,so ,stop ,l2clk ,siclk ,rng_data );
input [1:0]	ch_sel ;
input [1:0]	anlg_sel ;
input [1:0]	vcoctrl_sel ;
output		anlg_char_out ;
output		so ;
output		rng_data ;
input		vreg_selbg_l ;
input		rng_arst_l ;
input		vdd_hv15 ;
input		soclk ;
input		si ;
input		bypass ;
input		tcu_se_scancollar_out ;
input		stop ;
input		l2clk ;
input		siclk ;
supply1		vdd ;
supply0		vss ;
 
wire [3:0]	vcoctrl_sel2 ;
wire [3:0]	vcoctrl_sel1 ;
wire [2:0]	raw_data ;
wire [1:0]	amux_sel1 ;
wire [1:0]	amux_sel0 ;
wire [3:0]	vcoctrl_sel0 ;
wire [1:0]	amux_sel2 ;
wire		net102 ;
wire		net103 ;
wire		vbn ;
wire		net093 ;
wire		v300m ;
wire		fast_vco ;
wire		i50n4_lowv ;
wire		i50n6_lowv ;
wire		i50n8_lowv ;
wire		vdd_reg ;
wire		i50n0_lowv ;
wire		i50n2_lowv ;
wire		net95 ;
wire		virt_vss ;
wire		v400m ;
wire		net055 ;
wire		v500m ;
wire		net0117 ;
wire		net0118 ;
wire		i50n3_lowv ;
wire		i50n5_lowv ;
wire		i50n7_lowv ;
wire		i50n9_lowv ;
wire		amux_off ;
wire		i50n1_lowv ;
 
 
//n2_vreg_cust x3 (
//     .i50n            ({i50n9_lowv ,i50n8_lowv ,i50n7_lowv ,i50n6_lowv ,
//            i50n5_lowv ,i50n4_lowv ,i50n3_lowv ,i50n2_lowv ,i50n1_lowv ,
//            i50n0_lowv } ),
//     .v1p1reg_lowv    (vdd_reg ),
//     .vdd_hv15        (vdd_hv15 ),
//     .vref            (net0118 ),
//     .vrefb           (net0117 ),
//     .selbg_l         (vreg_selbg_l ) );
//n2_esd_vddo x4 (
//     .vdd_esd         (vdd ),
//     .vddo_esd        (vdd_hv15 ) );
//terminator i21 (
//     .TERM            (net093 ) );
//n2_esd_sig_3diode x10 (
//     .sig             (anlg_char_out ) );
//terminator i30 (
//     .TERM            (net102 ) );
//terminator i31 (
//     .TERM            (net055 ) );
//terminator i35 (
//     .TERM            (v500m ) );
//n2_rng_rc_filter_cust x98 (
//     .vdd_reg         (vdd_reg ),
//     .rc_fltr_out     (virt_vss ),
//     .rc_fltr_in      (v300m ),
//     .vbn             (vbn ) );
//terminator i36 (
//     .TERM            (v400m ) );
//n2_rng_resarray_cust x24 (
//     .r               ({net95 ,net093 ,v300m ,v400m ,v500m ,net055 ,vbn
//             ,net102 ,net103 } ),
//     .vm              (vss ),
//     .vp              (vdd_reg ) );
//terminator i45 (
//     .TERM            (fast_vco ) );
//terminator iia (
//     .TERM            (net0118 ) );
//terminator ib (
//     .TERM            (net0117 ) );
n2_rng_sampler_cust xs (
     .anlg_sel        ({anlg_sel } ),
     .vcoctrl_sel     ({vcoctrl_sel } ),
     .ch_sel          ({ch_sel } ),
     .vcoctrl_sel2    ({vcoctrl_sel2 } ),
     .amux_sel0       ({amux_sel0 } ),
     .amux_sel1       ({amux_sel1 } ),
     .amux_sel2       ({amux_sel2 } ),
     .vcoctrl_sel0    ({vcoctrl_sel0 } ),
     .vcoctrl_sel1    ({vcoctrl_sel1 } ),
     .raw_data        ({raw_data } ),
     .arst_l          (rng_arst_l ),
     .amux_off        (amux_off ),
     .fast_vco        (fast_vco ),
     .si              (si ),
     .so              (so ),
     .rng_data        (rng_data ),
     .se              (tcu_se_scancollar_out ),
     .l2clk           (l2clk ),
     .stop            (stop ),
     .siclk           (siclk ),
     .soclk           (soclk ) );
//terminator ia_0_ (
//     .TERM            (i50n6_lowv ) );
//n2_rng_channel_cust xx1_0_ (
//     .vcoctrl_sel     ({vcoctrl_sel0 } ),
//     .amux_sel        ({amux_sel0 } ),
//     .inb40u          (i50n3_lowv ),
//     .ina40u          (i50n0_lowv ),
//     .bypass          (bypass ),
//     .vbn             (vbn ),
//     .virt_vss        (virt_vss ),
//     .vdd_hv15        (vdd_hv15 ),
//     .anlg_char_out   (anlg_char_out ),
//     .ch_out          (raw_data[0] ),
//     .vdd_reg         (vdd_reg ),
//     .arst_l          (rng_arst_l ),
//     .l2clk           (vss ),
//     .fast_vco        (vdd_reg ) );
//pfet_thox m1 (
//     .B               (vdd_reg ),
//     .G               (vss ),
//     .D               (vdd_reg ),
//     .S               (vdd_reg ) );
//pfet_thox m2 (
//     .B               (vdd ),
//     .G               (vss ),
//     .D               (vdd ),
//     .S               (vdd ) );
//terminator ia_1_ (
//     .TERM            (i50n7_lowv ) );
//n2_rng_channel_cust xx1_1_ (
//     .vcoctrl_sel     ({vcoctrl_sel1 } ),
//     .amux_sel        ({amux_sel1 } ),
//     .inb40u          (i50n4_lowv ),
//     .ina40u          (i50n1_lowv ),
//     .bypass          (bypass ),
//     .vbn             (vbn ),
//     .virt_vss        (virt_vss ),
//     .vdd_hv15        (vdd_hv15 ),
//     .anlg_char_out   (anlg_char_out ),
//     .ch_out          (raw_data[1] ),
//     .vdd_reg         (vdd_reg ),
//     .arst_l          (rng_arst_l ),
//     .l2clk           (vss ),
//     .fast_vco        (vdd_reg ) );
//terminator ia_2_ (
//     .TERM            (i50n8_lowv ) );
//n2_rng_channel_cust xx1_2_ (
//     .vcoctrl_sel     ({vcoctrl_sel2 } ),
//     .amux_sel        ({amux_sel2 } ),
//     .inb40u          (i50n5_lowv ),
//     .ina40u          (i50n2_lowv ),
//     .bypass          (bypass ),
//     .vbn             (vbn ),
//     .virt_vss        (virt_vss ),
//     .vdd_hv15        (vdd_hv15 ),
//     .anlg_char_out   (anlg_char_out ),
//     .ch_out          (raw_data[2] ),
//     .vdd_reg         (vdd_reg ),
//     .arst_l          (rng_arst_l ),
//     .l2clk           (vss ),
//     .fast_vco        (vdd_reg ) );
//terminator ix5 (
//     .TERM            (net103 ) );
//terminator ia_3_ (
//     .TERM            (i50n9_lowv ) );
//terminator ix6 (
//     .TERM            (net95 ) );
//n2_rng_hvamux_cust x0 (
//     .vdd_hv15        (vdd_hv15 ),
//     .amux_sel        (amux_off ),
//     .in_lowv         (vss ),
//     .out             (anlg_char_out ) );

//===== following code added for testbench (7/26/06) =====

reg [2:0] noise_cells;
integer seed;

initial begin
  seed = 1;
  if (!($test$plusargs("disable_rng_noisecell"))) begin
    force raw_data = noise_cells;
    while (1) begin
      @(posedge l2clk or negedge rng_arst_l);
      if (!rng_arst_l) 
        noise_cells <= 3'b000;
      else 
        noise_cells <= $random (seed);
    end
  end
end

endmodule


//
// N2_RNG_SAMPLER_CUST - vgate file generated by KC
// 
module n2_rng_sampler_cust(arst_l ,anlg_sel ,vcoctrl_sel ,ch_sel ,
     vcoctrl_sel2 ,amux_off ,amux_sel0 ,amux_sel1 ,amux_sel2 ,
     vcoctrl_sel0 ,vcoctrl_sel1 ,fast_vco ,si ,so ,rng_data ,raw_data ,
     se ,l2clk ,stop ,siclk ,soclk );
output [3:0]	vcoctrl_sel2 ;
output [1:0]	amux_sel0 ;
output [1:0]	amux_sel1 ;
output [1:0]	amux_sel2 ;
output [3:0]	vcoctrl_sel0 ;
output [3:0]	vcoctrl_sel1 ;
input [1:0]	anlg_sel ;
input [1:0]	vcoctrl_sel ;
input [1:0]	ch_sel ;
input [2:0]	raw_data ;
output		amux_off ;
output		fast_vco ;
output		so ;
output		rng_data ;
input		arst_l ;
input		si ;
input		se ;
input		l2clk ;
input		stop ;
input		siclk ;
input		soclk ;
 
wire [2:0]	ctrl ;
 
 
n2_rng_reg_cust x3 (
     .ctrl            ({ctrl } ),
     .amux_sel1       ({amux_sel1 } ),
     .amux_sel0       ({amux_sel0 } ),
     .amux_sel2       ({amux_sel2 } ),
     .anlg_sel        ({anlg_sel } ),
     .vcoctrl_sel     ({vcoctrl_sel } ),
     .ch_sel          ({ch_sel } ),
     .vcoctrl_sel0    ({vcoctrl_sel0 } ),
     .vcoctrl_sel1    ({vcoctrl_sel1 } ),
     .vcoctrl_sel2    ({vcoctrl_sel2 } ),
     .fast_vco        (fast_vco ),
     .amux_off        (amux_off ),
     .l2clk           (l2clk ),
     .stop            (stop ),
     .arst_l          (arst_l ) );
n2_rng_sync_cust x0 (
     .ctrl            ({ctrl } ),
     .raw_data        ({raw_data } ),
     .si              (si ),
     .so              (so ),
     .rng_data        (rng_data ),
     .se              (se ),
     .l2clk           (l2clk ),
     .stop            (stop ),
     .siclk           (siclk ),
     .soclk           (soclk ) );
endmodule


//
// N2_RNG_SYNC_CUST - vgate file generated by KC
// 
module n2_rng_sync_cust(ctrl ,si ,so ,rng_data ,raw_data ,se ,l2clk ,
     stop ,siclk ,soclk );
input [2:0]	ctrl ;
input [2:0]	raw_data ;
output		so ;
output		rng_data ;
input		si ;
input		se ;
input		l2clk ;
input		stop ;
input		siclk ;
input		soclk ;
supply1		vdd ;
supply0		vss ;
 
wire [3:0]	qb2 ;
wire [3:0]	so0 ;
wire [2:0]	data ;
wire [3:0]	so1 ;
wire [3:0]	net143 ;
wire [3:0]	q1 ;
wire [3:0]	q0 ;
wire [2:0]	so2 ;
wire [3:0]	qb0 ;
wire [3:0]	net141 ;
wire [3:0]	net145 ;
wire [3:0]	q2 ;
wire [3:0]	qb1 ;
wire		net190 ;
wire		net192 ;
wire		net193 ;
wire		net129 ;
wire		sob ;
wire		sof ;
wire		net154 ;
wire		net057 ;
wire		l2clk_v1 ;
wire		net068 ;
wire		net081 ;
 
assign so=sob;
assign rng_data=net193;
 
cl_u1_buf_4x x2 (
     .out             (l2clk_v1 ),
     .in              (l2clk ) );
cl_u1_inv_1x x5_1_ (
     .out             (net141[2] ),
     .in              (q2[1] ) );
cl_u1_inv_2x x4_3_ (
     .out             (qb1[3] ),
     .in              (net143[0] ) );
cl_u1_inv_1x x8_3_ (
     .out             (net145[0] ),
     .in              (q0[3] ) );
cl_sc1_msff_4x x9 (
     .q               (net193 ),
     .so              (sof ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (si ),
     .l1clk           (net154 ),
     .d               (net068 ) );
cl_sc1_msff_4x xa0_0_ (
     .q               (q0[0] ),
     .so              (so0[0] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (sof ),
     .l1clk           (net154 ),
     .d               (data[0] ) );
cl_u1_inv_1x x5_2_ (
     .out             (net141[1] ),
     .in              (q2[2] ) );
cl_u1_inv_2x x6_0_ (
     .out             (qb2[0] ),
     .in              (net141[3] ) );
cl_u1_inv_4x x10 (
     .out             (net068 ),
     .in              (net129 ) );
cl_sc1_msff_4x xa0_1_ (
     .q               (q0[1] ),
     .so              (so0[1] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so0[0] ),
     .l1clk           (net154 ),
     .d               (qb0[0] ) );
cl_u1_xnor3_1x x14 (
     .out             (net129 ),
     .in2             (qb0[3] ),
     .in0             (qb2[3] ),
     .in1             (qb1[3] ) );
cl_u1_inv_2x xb_0_ (
     .out             (qb0[0] ),
     .in              (net145[3] ) );
cl_u1_inv_1x x5_3_ (
     .out             (net141[0] ),
     .in              (q2[3] ) );
cl_u1_inv_2x x6_1_ (
     .out             (qb2[1] ),
     .in              (net141[2] ) );
cl_sc1_msff_4x xa0_2_ (
     .q               (q0[2] ),
     .so              (so0[2] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so0[1] ),
     .l1clk           (net154 ),
     .d               (qb0[1] ) );
cl_sc1_msff_4x xa1_0_ (
     .q               (q1[0] ),
     .so              (so1[0] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so0[3] ),
     .l1clk           (net154 ),
     .d               (data[1] ) );
cl_u1_buf_8x xc (
     .out             (net190 ),
     .in              (siclk ) );
cl_u1_nand2_2x x3_0_ (
     .out             (data[0] ),
     .in1             (ctrl[0] ),
     .in0             (raw_data[0] ) );
cl_u1_inv_2x xb_1_ (
     .out             (qb0[1] ),
     .in              (net145[2] ) );
cl_u1_inv_1x x7_0_ (
     .out             (net143[3] ),
     .in              (q1[0] ) );
cl_u1_inv_2x x6_2_ (
     .out             (qb2[2] ),
     .in              (net141[1] ) );
cl_sc1_msff_4x xa0_3_ (
     .q               (q0[3] ),
     .so              (so0[3] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so0[2] ),
     .l1clk           (net154 ),
     .d               (qb0[2] ) );
cl_sc1_msff_4x xa1_1_ (
     .q               (q1[1] ),
     .so              (so1[1] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so1[0] ),
     .l1clk           (net154 ),
     .d               (qb1[0] ) );
cl_u1_nand2_2x x3_1_ (
     .out             (data[1] ),
     .in1             (ctrl[1] ),
     .in0             (raw_data[1] ) );
cl_u1_inv_2x xb_2_ (
     .out             (qb0[2] ),
     .in              (net145[1] ) );
cl_u1_inv_1x x7_1_ (
     .out             (net143[2] ),
     .in              (q1[1] ) );
cl_u1_inv_2x x6_3_ (
     .out             (qb2[3] ),
     .in              (net141[0] ) );
//pmos m0 (so ,vdd ,net081  );
cl_sc1_msff_4x xa2_0_ (
     .q               (q2[0] ),
     .so              (so2[0] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so1[3] ),
     .l1clk           (net154 ),
     .d               (data[2] ) );
cl_sc1_msff_4x xa1_2_ (
     .q               (q1[2] ),
     .so              (so1[2] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so1[1] ),
     .l1clk           (net154 ),
     .d               (qb1[1] ) );
//pmos m1 (net081 ,vdd ,sob  );
//nmos m2 (so ,vss ,net081  );
//nmos m3 (net081 ,vss ,sob  );
cl_u1_nand2_2x x3_2_ (
     .out             (data[2] ),
     .in1             (ctrl[2] ),
     .in0             (raw_data[2] ) );
cl_u1_inv_2x xb_3_ (
     .out             (qb0[3] ),
     .in              (net145[0] ) );
cl_u1_inv_2x x4_0_ (
     .out             (qb1[0] ),
     .in              (net143[3] ) );
cl_u1_inv_1x x8_0_ (
     .out             (net145[3] ),
     .in              (q0[0] ) );
cl_u1_inv_1x x7_2_ (
     .out             (net143[1] ),
     .in              (q1[2] ) );
//nmos mn0 (net057 ,vss ,net193  );
//nmos mn1 (rng_data ,vss ,net057  );
cl_sc1_msff_4x xa2_1_ (
     .q               (q2[1] ),
     .so              (so2[1] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so2[0] ),
     .l1clk           (net154 ),
     .d               (qb2[0] ) );
cl_sc1_msff_4x xa1_3_ (
     .q               (q1[3] ),
     .so              (so1[3] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so1[2] ),
     .l1clk           (net154 ),
     .d               (qb1[2] ) );
cl_u1_inv_2x x4_1_ (
     .out             (qb1[1] ),
     .in              (net143[2] ) );
cl_u1_inv_1x x8_1_ (
     .out             (net145[2] ),
     .in              (q0[1] ) );
cl_u1_inv_1x x7_3_ (
     .out             (net143[0] ),
     .in              (q1[3] ) );
cl_sc1_msff_4x xa2_2_ (
     .q               (q2[2] ),
     .so              (so2[2] ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so2[1] ),
     .l1clk           (net154 ),
     .d               (qb2[1] ) );
cl_u1_inv_1x x5_0_ (
     .out             (net141[3] ),
     .in              (q2[0] ) );
cl_u1_inv_2x x4_2_ (
     .out             (qb1[2] ),
     .in              (net143[1] ) );
cl_u1_inv_1x x8_2_ (
     .out             (net145[1] ),
     .in              (q0[2] ) );
//pmos mp0 (net057 ,vdd ,net193  );
//pmos mp1 (rng_data ,vdd ,net057  );
cl_sc1_msff_4x xa2_3_ (
     .q               (q2[3] ),
     .so              (sob ),
     .soclk           (net192 ),
     .siclk           (net190 ),
     .si              (so2[2] ),
     .l1clk           (net154 ),
     .d               (qb2[2] ) );
cl_sc1_l1hdr_16x x0 (
     .se              (se ),
     .pce             (vdd ),
     .pce_ov          (vdd ),
     .stop            (stop ),
     .l2clk           (l2clk_v1 ),
     .l1clk           (net154 ) );
cl_u1_buf_8x x1 (
     .out             (net192 ),
     .in              (soclk ) );
endmodule

//
// N2_RNG_REG_CUST - vgate file generated by KC
// 
module n2_rng_reg_cust(fast_vco ,ctrl ,amux_sel1 ,amux_sel0 ,amux_off ,
     l2clk ,stop ,arst_l ,amux_sel2 ,anlg_sel ,vcoctrl_sel ,ch_sel ,
     vcoctrl_sel0 ,vcoctrl_sel1 ,vcoctrl_sel2 );
output [2:0]	ctrl ;
output [1:0]	amux_sel1 ;
output [1:0]	amux_sel0 ;
output [1:0]	amux_sel2 ;
output [3:0]	vcoctrl_sel0 ;
output [3:0]	vcoctrl_sel1 ;
output [3:0]	vcoctrl_sel2 ;
input [1:0]	anlg_sel ;
input [1:0]	vcoctrl_sel ;
input [1:0]	ch_sel ;
output		fast_vco ;
output		amux_off ;
input		l2clk ;
input		stop ;
input		arst_l ;
supply1		vdd ;
supply0		vss ;
 
wire [1:0]	net399 ;
wire [1:0]	net253 ;
wire [1:0]	net395 ;
wire [3:0]	ch_sel_d ;
wire [1:0]	net328 ;
wire [1:0]	net232 ;
wire [1:0]	ch_sel_d1 ;
wire [1:0]	net258 ;
wire [1:0]	vco_sel_d1 ;
wire [0:0]	anlg_sel_d ;
wire [1:0]	net227 ;
wire [1:0]	net237 ;
wire [1:0]	net247 ;
wire [1:0]	net243 ;
wire [1:0]	net251 ;
wire [1:0]	net255 ;
wire [1:0]	net269 ;
wire [1:0]	net265 ;
wire [2:0]	net279 ;
wire [1:0]	anlg_sel_d1 ;
wire [1:0]	net400 ;
wire [1:0]	net397 ;
wire [2:0]	net393 ;
wire [2:0]	dctrl ;
wire [1:0]	net230 ;
wire [1:0]	net262 ;
wire [1:0]	net272 ;
wire [1:0]	net401 ;
wire [1:0]	net225 ;
wire [1:0]	net425 ;
wire [1:0]	net235 ;
wire [1:0]	net249 ;
wire [1:0]	net245 ;
wire		net380 ;
wire		net300 ;
wire		net283 ;
wire		net286 ;
wire		net403 ;
wire		net307 ;
wire		net389 ;
wire		net210 ;
wire		net293 ;
wire		net212 ;
wire		net0204 ;
wire		net0207 ;
wire		net394 ;
wire		net215 ;
wire		net217 ;
wire		net220 ;
wire		net222 ;
wire		net439 ;
wire		net441 ;
wire		net443 ;
wire		net445 ;
wire		net447 ;
wire		net449 ;
wire		arst ;
wire		l2clk_v1 ;
wire		net0210 ;
wire		net0212 ;
wire		l1clk ;
wire		net360 ;
wire		net364 ;
wire		net368 ;
wire		net0225 ;
wire		net372 ;
wire		net377 ;
 
assign arst=net389;
 
cl_u1_inv_1x x2 (
     .out             (dctrl[0] ),
     .in              (net0210 ) );
//terminator ix32 (
//     .TERM            (net394 ) );
n2_rng_dec_cust x5 (
     .dec_sel         ({vcoctrl_sel2 } ),
     .sel             ({net237[0] ,net237[1] } ),
     .vdd_reg         (vdd ) );
n2_core_pll_flop_reset_new_1x_cust xa_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net251[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net328[1] ),
     .q               (ch_sel_d1[0] ) );
cl_u1_buf_2x x6 (
     .out             (net283 ),
     .in              (anlg_sel_d1[1] ) );
//terminator ix9_0_ (
//     .TERM            (net395[1] ) );
cl_u1_buf_2x x7 (
     .out             (anlg_sel_d[0] ),
     .in              (anlg_sel_d1[0] ) );
cl_u1_nand3_2x x8 (
     .out             (net380 ),
     .in2             (net403 ),
     .in1             (ctrl[2] ),
     .in0             (net307 ) );
n2_rng_dec_cust x9 (
     .dec_sel         ({vcoctrl_sel1 } ),
     .sel             ({net232[0] ,net232[1] } ),
     .vdd_reg         (vdd ) );
cl_u1_inv_8x x45_1_ (
     .out             (ctrl[1] ),
     .in              (net279[1] ) );
cl_u1_inv_4x x49_1_ (
     .out             (net253[0] ),
     .in              (net245[0] ) );
//terminator ixn2_0_ (
//     .TERM            (net401[1] ) );
cl_sc1_aomux2_4x xm2_1_ (
     .in1             (net425[0] ),
     .sel1            (ch_sel_d[2] ),
     .out             (net235[0] ),
     .in0             (net237[0] ),
     .sel0            (net449 ) );
n2_core_pll_flop_reset_new_1x_cust xa_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net251[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net328[0] ),
     .q               (ch_sel_d1[1] ) );
//terminator ix9_1_ (
//     .TERM            (net395[0] ) );
//terminator i4_0_ (
//     .TERM            (net393[2] ) );
n2_core_pll_flop_reset_new_1x_cust x42_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (dctrl[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net279[2] ),
     .q               (net393[2] ) );
cl_u1_inv_8x x45_2_ (
     .out             (ctrl[2] ),
     .in              (net279[0] ) );
cl_u1_inv_4x x46_0_ (
     .out             (net251[1] ),
     .in              (net243[1] ) );
cl_u1_inv_2x x11 (
     .out             (net443 ),
     .in              (ch_sel_d[2] ) );
cl_u1_nand3_2x x12 (
     .out             (net377 ),
     .in2             (net403 ),
     .in1             (ctrl[2] ),
     .in0             (net222 ) );
cl_u1_inv_4x x50_0_ (
     .out             (net247[1] ),
     .in              (net249[1] ) );
//terminator ixn0_1_ (
//     .TERM            (net399[0] ) );
cl_sc1_aomux2_4x x13 (
     .in1             (anlg_sel_d[0] ),
     .sel1            (ch_sel_d[2] ),
     .out             (net220 ),
     .in0             (net222 ),
     .sel0            (net443 ) );
n2_core_pll_flop_reset_new_1x_cust x14 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net220 ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net307 ),
     .q               (net222 ) );
cl_u1_inv_2x xi0 (
     .out             (net445 ),
     .in              (ch_sel_d[0] ) );
cl_u1_inv_8x x15 (
     .out             (amux_sel2[1] ),
     .in              (net377 ) );
cl_u1_inv_2x xi1 (
     .out             (net447 ),
     .in              (ch_sel_d[1] ) );
cl_u1_inv_8x x16 (
     .out             (amux_sel2[0] ),
     .in              (net380 ) );
cl_u1_inv_2x xi2 (
     .out             (net449 ),
     .in              (ch_sel_d[2] ) );
cl_u1_inv_8x x17 (
     .out             (amux_sel1[0] ),
     .in              (net372 ) );
cl_u1_inv_8x x18 (
     .out             (amux_sel1[1] ),
     .in              (net360 ) );
n2_core_pll_flop_reset_new_1x_cust xv0_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net225[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net399[1] ),
     .q               (net227[1] ) );
cl_u1_nand3_2x x19 (
     .out             (net372 ),
     .in2             (net403 ),
     .in1             (ctrl[1] ),
     .in0             (net300 ) );
//terminator i15_0_ (
//     .TERM            (net272[1] ) );
//terminator i4_1_ (
//     .TERM            (net393[1] ) );
n2_core_pll_flop_reset_new_1x_cust x42_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (dctrl[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net279[1] ),
     .q               (net393[1] ) );
cl_u1_nand3_2x x20 (
     .out             (net360 ),
     .in2             (net403 ),
     .in1             (ctrl[1] ),
     .in0             (net217 ) );
cl_u1_inv_4x x46_1_ (
     .out             (net251[0] ),
     .in              (net243[0] ) );
cl_u1_inv_2x x21 (
     .out             (net439 ),
     .in              (ch_sel_d[1] ) );
cl_u1_inv_4x x50_1_ (
     .out             (net247[0] ),
     .in              (net249[0] ) );
cl_sc1_aomux2_4x x22 (
     .in1             (anlg_sel_d[0] ),
     .sel1            (ch_sel_d[1] ),
     .out             (net215 ),
     .in0             (net217 ),
     .sel0            (net439 ) );
n2_core_pll_flop_reset_new_1x_cust x23 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net215 ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net300 ),
     .q               (net217 ) );
cl_u1_inv_8x x24 (
     .out             (amux_sel0[1] ),
     .in              (net368 ) );
cl_u1_inv_8x x25 (
     .out             (amux_sel0[0] ),
     .in              (net364 ) );
//terminator ixb_0_ (
//     .TERM            (net328[1] ) );
cl_u1_nand3_2x x26 (
     .out             (net368 ),
     .in2             (net403 ),
     .in1             (ctrl[0] ),
     .in0             (net212 ) );
cl_u1_nand3_2x x27 (
     .out             (net364 ),
     .in2             (net403 ),
     .in1             (ctrl[0] ),
     .in0             (net293 ) );
cl_u1_inv_2x x28 (
     .out             (net441 ),
     .in              (ch_sel_d[0] ) );
n2_core_pll_flop_reset_new_1x_cust xv0_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net225[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net399[0] ),
     .q               (net227[0] ) );
cl_sc1_aomux2_4x x29 (
     .in1             (anlg_sel_d[0] ),
     .sel1            (ch_sel_d[0] ),
     .out             (net210 ),
     .in0             (net212 ),
     .sel0            (net441 ) );
n2_core_pll_flop_reset_new_1x_cust x3_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (ch_sel[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net258[1] ),
     .q               (net255[1] ) );
//terminator i15_1_ (
//     .TERM            (net272[0] ) );
//terminator i4_2_ (
//     .TERM            (net393[0] ) );
n2_core_pll_flop_reset_new_1x_cust x42_2_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (dctrl[2] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net279[0] ),
     .q               (net393[0] ) );
n2_core_pll_flop_reset_new_1x_cust x43_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (vcoctrl_sel[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net265[1] ),
     .q               (net262[1] ) );
n2_core_pll_flop_reset_new_1x_cust x30 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net210 ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net293 ),
     .q               (net212 ) );
cl_u1_inv_4x x47_0_ (
     .out             (net243[1] ),
     .in              (net255[1] ) );
n2_core_pll_flop_reset_new_1x_cust x31 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (net283 ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net286 ),
     .q               (net394 ) );
cl_u1_inv_8x x32 (
     .out             (amux_off ),
     .in              (net403 ) );
cl_u1_inv_4x x51_0_ (
     .out             (net249[1] ),
     .in              (net269[1] ) );
cl_u1_buf_8x x33 (
     .out             (net403 ),
     .in              (net286 ) );
//terminator ixn1_1_ (
//     .TERM            (net400[0] ) );
cl_sc1_l1hdr_48x x34 (
     .pce             (vdd ),
     .pce_ov          (vdd ),
     .stop            (stop ),
     .l2clk           (l2clk_v1 ),
     .se              (vss ),
     .l1clk           (l1clk ) );
cl_sc1_aomux2_4x xm0_0_ (
     .in1             (net425[1] ),
     .sel1            (ch_sel_d[0] ),
     .out             (net225[1] ),
     .in0             (net227[1] ),
     .sel0            (net445 ) );
//terminator ixb_1_ (
//     .TERM            (net328[0] ) );
cl_u1_inv_2x x36 (
     .out             (net389 ),
     .in              (arst_l ) );
cl_u1_nor2_1x x37 (
     .out             (net0204 ),
     .in1             (ch_sel_d[2] ),
     .in0             (ch_sel_d[3] ) );
n2_core_pll_flop_reset_new_1x_cust xv1_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net230[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net400[1] ),
     .q               (net232[1] ) );
cl_u1_nor2_1x x38 (
     .out             (net0207 ),
     .in1             (ch_sel_d[1] ),
     .in0             (ch_sel_d[3] ) );
//terminator ix3_0_ (
//     .TERM            (net397[1] ) );
cl_u1_nor2_1x x39 (
     .out             (net0210 ),
     .in1             (ch_sel_d[0] ),
     .in0             (ch_sel_d[3] ) );
n2_core_pll_flop_reset_new_1x_cust x3_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (ch_sel[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net258[0] ),
     .q               (net255[0] ) );
//terminator i16_0_ (
//     .TERM            (net265[1] ) );
n2_core_pll_flop_reset_new_1x_cust x43_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (vcoctrl_sel[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net265[0] ),
     .q               (net262[0] ) );
cl_u1_inv_4x x47_1_ (
     .out             (net243[0] ),
     .in              (net255[0] ) );
n2_rng_dec_cust x41 (
     .dec_sel         ({vcoctrl_sel0 } ),
     .sel             ({net227[0] ,net227[1] } ),
     .vdd_reg         (vdd ) );
n2_core_pll_flop_reset_new_1x_cust x10_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net247[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net395[1] ),
     .q               (anlg_sel_d1[0] ) );
cl_u1_inv_4x x51_1_ (
     .out             (net249[0] ),
     .in              (net269[0] ) );
//terminator ixn0_0_ (
//     .TERM            (net399[1] ) );
cl_sc1_aomux2_4x xm0_1_ (
     .in1             (net425[0] ),
     .sel1            (ch_sel_d[0] ),
     .out             (net225[0] ),
     .in0             (net227[0] ),
     .sel0            (net445 ) );
n2_core_pll_flop_reset_new_1x_cust xv1_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net230[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net400[0] ),
     .q               (net232[0] ) );
//terminator ix3_1_ (
//     .TERM            (net397[0] ) );
n2_core_pll_flop_reset_new_1x_cust x4_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net253[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net397[1] ),
     .q               (vco_sel_d1[0] ) );
//terminator i16_1_ (
//     .TERM            (net265[0] ) );
cl_u1_buf_2x x40_0_ (
     .out             (net425[1] ),
     .in              (vco_sel_d1[0] ) );
n2_core_pll_flop_reset_new_1x_cust x44_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (anlg_sel[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net272[1] ),
     .q               (net269[1] ) );
n2_rng_dec_cust x52 (
     .dec_sel         ({ch_sel_d } ),
     .sel             ({ch_sel_d1 } ),
     .vdd_reg         (vdd ) );
cl_u1_inv_4x x48_0_ (
     .out             (net245[1] ),
     .in              (net262[1] ) );
cl_u1_nand2_2x x53 (
     .out             (net0212 ),
     .in1             (amux_off ),
     .in0             (anlg_sel_d[0] ) );
//nmos mn0 (net0225 ,vss ,net389  );
cl_u1_inv_8x x54 (
     .out             (fast_vco ),
     .in              (net0212 ) );
n2_core_pll_flop_reset_new_1x_cust x10_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (net247[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net395[0] ),
     .q               (anlg_sel_d1[1] ) );
//nmos mn1 (arst ,vss ,net0225  );
//terminator ixn2_1_ (
//     .TERM            (net401[0] ) );
cl_u1_buf_16x x55 (
     .out             (l2clk_v1 ),
     .in              (l2clk ) );
cl_sc1_aomux2_4x xm1_0_ (
     .in1             (net425[1] ),
     .sel1            (ch_sel_d[1] ),
     .out             (net230[1] ),
     .in0             (net232[1] ),
     .sel0            (net447 ) );
cl_sc1_l1hdr_32x x56 (
     .se              (vss ),
     .l1clk           (l1clk ),
     .l2clk           (l2clk_v1 ),
     .stop            (stop ),
     .pce_ov          (vdd ),
     .pce             (vdd ) );
n2_core_pll_flop_reset_new_1x_cust xv2_0_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net235[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net401[1] ),
     .q               (net237[1] ) );
n2_core_pll_flop_reset_new_1x_cust x4_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net253[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net397[0] ),
     .q               (vco_sel_d1[1] ) );
//terminator i17_0_ (
//     .TERM            (net258[1] ) );
cl_u1_buf_2x x40_1_ (
     .out             (net425[0] ),
     .in              (vco_sel_d1[1] ) );
n2_core_pll_flop_reset_new_1x_cust x44_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (anlg_sel[1] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net272[0] ),
     .q               (net269[0] ) );
cl_u1_inv_4x x48_1_ (
     .out             (net245[0] ),
     .in              (net262[0] ) );
//terminator ixn1_0_ (
//     .TERM            (net400[1] ) );
cl_sc1_aomux2_4x xm1_1_ (
     .in1             (net425[0] ),
     .sel1            (ch_sel_d[1] ),
     .out             (net230[0] ),
     .in0             (net232[0] ),
     .sel0            (net447 ) );
n2_core_pll_flop_reset_new_1x_cust xv2_1_ (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net235[0] ),
     .reset           (arst ),
     .clk             (l1clk ),
     .q_l             (net401[0] ),
     .q               (net237[0] ) );
//terminator i17_1_ (
//     .TERM            (net258[0] ) );
cl_u1_inv_8x x45_0_ (
     .out             (ctrl[0] ),
     .in              (net279[2] ) );
cl_u1_inv_4x x49_0_ (
     .out             (net253[1] ),
     .in              (net245[1] ) );
//pmos mp0 (net0225 ,vdd ,net389  );
//pmos mp1 (arst ,vdd ,net0225  );
cl_u1_inv_1x x0 (
     .out             (dctrl[2] ),
     .in              (net0204 ) );
cl_sc1_aomux2_4x xm2_0_ (
     .in1             (net425[1] ),
     .sel1            (ch_sel_d[2] ),
     .out             (net235[1] ),
     .in0             (net237[1] ),
     .sel0            (net449 ) );
cl_u1_inv_1x x1 (
     .out             (dctrl[1] ),
     .in              (net0207 ) );
endmodule


//
// N2_RNG_DEC_CUST - vgate file generated by KC
// 
module n2_rng_dec_cust(dec_sel ,vdd_reg ,sel );
output [3:0]	dec_sel ;
input [1:0]	sel ;
input		vdd_reg ;
 
wire [3:0]	net9 ;
wire [1:0]	sel_d ;
wire [1:0]	sel_l ;
 
 
n2_core_pll_inv_1x_cust x1_1_ (
     .vdd_reg         (vdd_reg ),
     .out             (sel_d[1] ),
     .in              (sel_l[1] ) );
n2_core_pll_nand2_2x_cust x2_0_ (
     .vdd_reg         (vdd_reg ),
     .out             (net9[3] ),
     .in1             (sel_l[0] ),
     .in0             (sel_l[1] ) );
n2_core_pll_nand2_2x_cust x2_1_ (
     .vdd_reg         (vdd_reg ),
     .out             (net9[2] ),
     .in1             (sel_d[0] ),
     .in0             (sel_l[1] ) );
n2_core_pll_inv_8x_cust x3_0_ (
     .vdd_reg         (vdd_reg ),
     .out             (dec_sel[0] ),
     .in              (net9[3] ) );
n2_core_pll_nand2_2x_cust x2_2_ (
     .vdd_reg         (vdd_reg ),
     .out             (net9[1] ),
     .in1             (sel_l[0] ),
     .in0             (sel_d[1] ) );
n2_core_pll_inv_8x_cust x3_1_ (
     .vdd_reg         (vdd_reg ),
     .out             (dec_sel[1] ),
     .in              (net9[2] ) );
n2_core_pll_nand2_2x_cust x2_3_ (
     .vdd_reg         (vdd_reg ),
     .out             (net9[0] ),
     .in1             (sel_d[0] ),
     .in0             (sel_d[1] ) );
n2_core_pll_inv_8x_cust x3_2_ (
     .vdd_reg         (vdd_reg ),
     .out             (dec_sel[2] ),
     .in              (net9[1] ) );
n2_core_pll_inv_1x_cust x0_0_ (
     .vdd_reg         (vdd_reg ),
     .out             (sel_l[0] ),
     .in              (sel[0] ) );
n2_core_pll_inv_8x_cust x3_3_ (
     .vdd_reg         (vdd_reg ),
     .out             (dec_sel[3] ),
     .in              (net9[0] ) );
n2_core_pll_inv_1x_cust x0_1_ (
     .vdd_reg         (vdd_reg ),
     .out             (sel_l[1] ),
     .in              (sel[1] ) );
n2_core_pll_inv_1x_cust x1_0_ (
     .vdd_reg         (vdd_reg ),
     .out             (sel_d[0] ),
     .in              (sel_l[0] ) );
endmodule

