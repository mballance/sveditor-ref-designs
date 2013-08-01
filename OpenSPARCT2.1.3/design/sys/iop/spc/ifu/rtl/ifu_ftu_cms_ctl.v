// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_cms_ctl.v
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
module ifu_ftu_cms_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  lsu_ic_enable, 
  lsu_ifu_direct_map, 
  agd_direct_map_rep_way, 
  ftp_curr_fetch_thr_f, 
  ftu_agc_thr0_cmiss_c, 
  ftu_agc_thr1_cmiss_c, 
  ftu_agc_thr2_cmiss_c, 
  ftu_agc_thr3_cmiss_c, 
  ftu_agc_thr4_cmiss_c, 
  ftu_agc_thr5_cmiss_c, 
  ftu_agc_thr6_cmiss_c, 
  ftu_agc_thr7_cmiss_c, 
  cmu_ic_data_parity, 
  ftu_paddr_unq, 
  agc_any_invalidation_req_f, 
  itb_tte_cp_c, 
  itc_bypass_bf, 
  cmu_l2_err, 
  tlu_cerer_icl2u, 
  tlu_cerer_icl2nd, 
  ftu_thrx_un_cacheable, 
  ftu_rep_way, 
  cms_ic_modified_parity, 
  ftu_paddr, 
  scan_out) ;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire itb_tte_cp_c_q;
wire itb_bypass_c;
wire ic_disabled_c;
wire any_invalidation_req_c_l;
wire flip_parity_ff;
wire any_miss;
wire [2:0] rep_way_inc;
wire sel_miss;
wire ifu_direct_map_ff;
wire sel_direct_map;
wire sel_hold;
wire [2:0] rep_way_in;
wire flip_parity;
wire cerer_icl2u_ff;
wire cerer_icl2nd_ff;
wire any_invalidation_req_f_l;
wire rep_way_reg_scanin;
wire rep_way_reg_scanout;
wire itb_bypass_f;
wire ic_enable_reg_scanin;
wire ic_enable_reg_scanout;
wire [7:0] cms_icache_enable;
wire ic_disabled_f;
wire ic_disabled_reg_scanin;
wire ic_disabled_reg_scanout;
wire se;
wire spares_scanin;
wire spares_scanout;
 


input tcu_scan_en ;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;

input [7:0] lsu_ic_enable    ; 
input       lsu_ifu_direct_map;
input [2:0] agd_direct_map_rep_way; 

input [7:0] ftp_curr_fetch_thr_f    ; 
// input [7:0] agd_itlb_valid_f    ; 
   
// input       agc_qualify_cmiss    ;




 input        ftu_agc_thr0_cmiss_c;
 input        ftu_agc_thr1_cmiss_c;
 input        ftu_agc_thr2_cmiss_c;
 input        ftu_agc_thr3_cmiss_c;
 input        ftu_agc_thr4_cmiss_c;
 input        ftu_agc_thr5_cmiss_c;
 input        ftu_agc_thr6_cmiss_c;
 input        ftu_agc_thr7_cmiss_c;
 input [7:0]  cmu_ic_data_parity;
 input [39:37]  ftu_paddr_unq;
 input        agc_any_invalidation_req_f;
 input        itb_tte_cp_c ;
 input        itc_bypass_bf ;
 input [1:0]  cmu_l2_err     ;
 input        tlu_cerer_icl2u     ;
 input        tlu_cerer_icl2nd    ;


output       ftu_thrx_un_cacheable;

output [2:0] ftu_rep_way;
output [7:0] cms_ic_modified_parity;
output [39:37]  ftu_paddr;


output   scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan


ifu_ftu_cms_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));








///////////////////////////////////////////////////////////
// Generate duplicate miss reset signal from WOB bits.   //
///////////////////////////////////////////////////////////
assign  itb_tte_cp_c_q = itb_tte_cp_c | itb_bypass_c ; 

assign ftu_thrx_un_cacheable = (ftu_paddr[39] | ic_disabled_c | ~itb_tte_cp_c_q) & any_invalidation_req_c_l ;
assign cms_ic_modified_parity[7:0] = (cmu_ic_data_parity[7:0] ^ {8{flip_parity_ff}}) ;


//////////////////////////////////////////////////////////////////
// Replace_way generation. The replace way is just a shifter which
// is shifted whenever a miss is sent to the cmu
//////////////////////////////////////////////////////////////////

assign any_miss = ftu_agc_thr7_cmiss_c | ftu_agc_thr6_cmiss_c | ftu_agc_thr5_cmiss_c |
                  ftu_agc_thr4_cmiss_c | ftu_agc_thr3_cmiss_c | ftu_agc_thr2_cmiss_c |
                  ftu_agc_thr1_cmiss_c | ftu_agc_thr0_cmiss_c ;  

assign rep_way_inc[2] = (!ftu_rep_way[2] &  ftu_rep_way[1]  &  ftu_rep_way[0]) | 
                        ( ftu_rep_way[2] & !ftu_rep_way[0]) | 
                        ( ftu_rep_way[2] & !ftu_rep_way[1]) ;
assign rep_way_inc[1] = (ftu_rep_way[1]  & !ftu_rep_way[0]) | 
                        (!ftu_rep_way[1]  &  ftu_rep_way[0]) ;
assign rep_way_inc[0] = (!ftu_rep_way[0]);

assign sel_miss        = (any_miss & ~ifu_direct_map_ff);
assign sel_direct_map  =  ifu_direct_map_ff;
assign sel_hold        = ~any_miss & ~ifu_direct_map_ff ;

assign rep_way_in[2:0]  = ({3{sel_miss}}       &  rep_way_inc[2:0] ) | 
                          ({3{sel_direct_map}} &  agd_direct_map_rep_way[2:0]      ) | 
                          ({3{sel_hold}}       &  ftu_rep_way[2:0]      ) ; 

assign flip_parity =   (cmu_l2_err[1] & ~cmu_l2_err[0] & cerer_icl2u_ff) |
                       (cmu_l2_err[1] &  cmu_l2_err[0] & cerer_icl2nd_ff) ; 
 
assign any_invalidation_req_f_l = ~agc_any_invalidation_req_f ;
ifu_ftu_cms_ctl_msff_ctl_macro__width_10 rep_way_reg  (
 .scan_in(rep_way_reg_scanin),
 .scan_out(rep_way_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({rep_way_in[2:0],flip_parity,lsu_ifu_direct_map,itc_bypass_bf,itb_bypass_f, 
         any_invalidation_req_f_l,tlu_cerer_icl2u,tlu_cerer_icl2nd}),
 .dout ({ftu_rep_way[2:0],flip_parity_ff,ifu_direct_map_ff,itb_bypass_f,itb_bypass_c,
         any_invalidation_req_c_l,cerer_icl2u_ff,cerer_icl2nd_ff}),
  .siclk(siclk),
  .soclk(soclk));

assign ftu_paddr[39:37] = ftu_paddr_unq[39:37] & {3{any_invalidation_req_c_l}} ;


ifu_ftu_cms_ctl_msff_ctl_macro__width_8 ic_enable_reg  (
 .scan_in(ic_enable_reg_scanin),
 .scan_out(ic_enable_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (lsu_ic_enable[7:0]),
 .dout (cms_icache_enable[7:0]),
  .siclk(siclk),
  .soclk(soclk)) ;


assign ic_disabled_f = (ftp_curr_fetch_thr_f[0] & ~cms_icache_enable[0] ) |
                     (ftp_curr_fetch_thr_f[1] & ~cms_icache_enable[1] ) |
                     (ftp_curr_fetch_thr_f[2] & ~cms_icache_enable[2] ) |
                     (ftp_curr_fetch_thr_f[3] & ~cms_icache_enable[3] ) |
                     (ftp_curr_fetch_thr_f[4] & ~cms_icache_enable[4] ) |
                     (ftp_curr_fetch_thr_f[5] & ~cms_icache_enable[5] ) |
                     (ftp_curr_fetch_thr_f[6] & ~cms_icache_enable[6] ) |
                     (ftp_curr_fetch_thr_f[7] & ~cms_icache_enable[7] ) ;

ifu_ftu_cms_ctl_msff_ctl_macro__width_1 ic_disabled_reg  (
 .scan_in(ic_disabled_reg_scanin),
 .scan_out(ic_disabled_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (ic_disabled_f),
 .dout (ic_disabled_c),
  .siclk(siclk),
  .soclk(soclk)) ;







assign se = tcu_scan_en ;
///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ftu_cms_ctl_spare_ctl_macro__num_1 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



// fixscan start:
assign rep_way_reg_scanin        = scan_in                  ;
assign ic_enable_reg_scanin      = rep_way_reg_scanout      ;
assign ic_disabled_reg_scanin    = ic_enable_reg_scanout    ;
assign spares_scanin             = ic_disabled_reg_scanout  ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_cms_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module ifu_ftu_cms_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_cms_ctl_msff_ctl_macro__width_8 (
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













// any PARAMS parms go into naming of macro

module ifu_ftu_cms_ctl_msff_ctl_macro__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_ftu_cms_ctl_spare_ctl_macro__num_1 (
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

