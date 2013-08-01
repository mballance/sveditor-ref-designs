// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_iqu_ctl.v
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
module l2t_iqu_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  l2clk, 
  wmr_l, 
  scan_in, 
  pcx_l2t_data_rdy_px1, 
  pcx_l2t_atm_px1, 
  arb_iqsel_px2, 
  arb_iqsel_px2_v1, 
  l2t_mb2_run, 
  l2t_mb2_iqarray_wr_en, 
  l2t_mb2_iqarray_rd_en, 
  l2t_mb2_addr, 
  scan_out, 
  iqu_iq_array_wr_en, 
  iqu_iq_array_wr_wl, 
  iqu_iq_array_rd_en, 
  iqu_iq_array_rd_wl, 
  l2t_pcx_stall_pq, 
  iqu_iq_arb_vld_px2, 
  iqu_iq_arb_vld_px2_v1, 
  iqu_pcx_l2t_atm_px2_p, 
  iqu_sel_pcx, 
  iqu_sel_c1, 
  iqu_hold_rd_n, 
  iqu_sel_c1reg_over_iqarray);
wire reset_flop_scanin;
wire reset_flop_scanout;
wire l1clk;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire spares_scanin;
wire spares_scanout;
wire pcx_l2t_data_rdy_px1_fnl;
wire ff_pcx_l2t_data_rdy_px1_fnl_scanin;
wire ff_pcx_l2t_data_rdy_px1_fnl_scanout;
wire ff_pcx_l2t_data_rdy_px2_scanin;
wire ff_pcx_l2t_data_rdy_px2_scanout;
wire pcx_l2t_data_rdy_px2_for_ext;
wire ff_pcx_l2t_data_rdy_px2_1_scanin;
wire ff_pcx_l2t_data_rdy_px2_1_scanout;
wire ff_pcx_l2t_data_rdy_px2_d1_scanin;
wire ff_pcx_l2t_data_rdy_px2_d1_scanout;
wire ff_pcx_l2t_atm_px2_p_scanin;
wire ff_pcx_l2t_atm_px2_p_scanout;
wire pcx_l2t_atm_px1_fnl;
wire ff_pcx_l2t_atm_px1_p_fnl_scanin;
wire ff_pcx_l2t_atm_px1_p_fnl_scanout;
wire ff_arb_iqsel_px2_d1_scanin;
wire ff_arb_iqsel_px2_d1_scanout;
wire ff_pcx_inst_vld_c1_scanin;
wire ff_pcx_inst_vld_c1_scanout;
wire c1_reg_inst_vld_cloned;
wire ff_pcx_inst_vld_c1_1_scanin;
wire ff_pcx_inst_vld_c1_1_scanout;
wire ff_inc_wr_ptr_c1_scanin;
wire ff_inc_wr_ptr_c1_scanout;
wire ff_array_wr_ptr_plus1_scanin;
wire ff_array_wr_ptr_plus1_scanout;
wire ff_array_wr_ptr_scanin;
wire ff_array_wr_ptr_scanout;
wire ff_l2t_mb2_run_r1_scanin;
wire ff_l2t_mb2_run_r1_scanout;
wire l2t_mb2_run_r1;
wire iqu_iq_arb_vld_px2_internal;
wire ff_array_rd_ptr_scanin;
wire ff_array_rd_ptr_scanout;
wire ff_que_cnt_scanin;
wire ff_que_cnt_scanout;
wire que_cnt_9_p;
wire que_cnt_10_p;
wire que_cnt_10_plus_p;
wire que_cnt_10_n;
wire que_cnt_10_plus_n;
wire ff_que_cnt_0_scanin;
wire ff_que_cnt_0_scanout;
wire ff_que_cnt_1_scanin;
wire ff_que_cnt_1_scanout;
wire ff_que_cnt_1_plus_scanin;
wire ff_que_cnt_1_plus_scanout;
wire ff_que_cnt_2_scanin;
wire ff_que_cnt_2_scanout;
wire que_cnt_10;
wire ff_que_cnt_10_scanin;
wire ff_que_cnt_10_scanout;
wire que_cnt_10_plus;
wire ff_que_cnt_10_plus_scanin;
wire ff_que_cnt_10_plus_scanout;
wire ff_iqu_sel_iq_scanin;
wire ff_iqu_sel_iq_scanout;
wire ff_iqu_sel_c1_scanin;
wire ff_iqu_sel_c1_scanout;
wire ff_iqu_sel_pcx_scanin;
wire ff_iqu_sel_pcx_scanout;
wire ff_iqu_sel_iq_d1_scanin;
wire ff_iqu_sel_iq_d1_scanout;
wire iqu_sel_iq_n;
wire arb_iqsel_px2_v1_n;
wire iqu_sel_iq_fe_n;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
input          l2clk; 
input          wmr_l; 
input scan_in; 
input          pcx_l2t_data_rdy_px1; 
input          pcx_l2t_atm_px1; 
input          arb_iqsel_px2; 
input          arb_iqsel_px2_v1; 

input		l2t_mb2_run;
input		l2t_mb2_iqarray_wr_en;
input		l2t_mb2_iqarray_rd_en;
input	[3:0]	l2t_mb2_addr;
 
output 		scan_out; 
output	       iqu_iq_array_wr_en; 
output	[3:0]  iqu_iq_array_wr_wl; 
output	       iqu_iq_array_rd_en; 
output	[3:0]  iqu_iq_array_rd_wl; 
 
output         l2t_pcx_stall_pq; 
 
output         iqu_iq_arb_vld_px2; 
output         iqu_iq_arb_vld_px2_v1; 
output         iqu_pcx_l2t_atm_px2_p; 
 
output         iqu_sel_pcx; 
output         iqu_sel_c1; 
//output         iqu_hold_rd; 
output         iqu_hold_rd_n; 
 
output         iqu_sel_c1reg_over_iqarray; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// Local Wires declaration 
//////////////////////////////////////////////////////////////////////////////// 
wire           pcx_l2t_data_rdy_px2 ; 
wire           pcx_l2t_data_rdy_px2_d1 ; 
wire           arb_iqsel_px2_d1 ; 
 
wire           set_c1_reg_inst_vld ; 
wire           c1_reg_inst_vld ; 
 
wire           inc_wr_ptr_px2 ; 
wire           inc_wr_ptr_c1 ; 
wire           sel_wrptr_same, sel_wrptr_plus1 ; 
wire  [3:0]    wrptr, wrptr_plus1 ; 
wire  [3:0]    wrptr_d1, wrptr_plus1_d1 ; 
 
wire           inc_rd_ptr_px2 ; 
wire  [3:0]    rdptr, rdptr_plus1 ; 
wire  [3:0]    rdptr_d1 ; 
 
wire           sel_qcount_plus1 ; 
wire           sel_qcount_minus1 ; 
wire           sel_qcount_same ; 
wire  [4:0]    que_cnt, que_cnt_plus1, que_cnt_minus1 ; 
wire  [4:0]    next_que_cnt ; 
wire           que_cnt_0, que_cnt_0_p, que_cnt_0_n ; 
wire           que_cnt_1, que_cnt_1_p, que_cnt_1_n ; 
wire           que_cnt_1_plus, que_cnt_1_plus_p, que_cnt_1_plus_n ; 
wire           que_cnt_2, que_cnt_2_p, que_cnt_2_n ; 
wire           que_cnt_2_plus_p ; 
wire           que_cnt_3_p ; 
wire           que_cnt_11_p ; 
wire           que_cnt_12, que_cnt_12_p, que_cnt_12_n ; 
wire           que_cnt_12_plus, que_cnt_12_plus_p, que_cnt_12_plus_n ; 
 
wire           set_iqu_sel_iq ; 
wire           set_iqu_sel_pcx ; 
wire           iqu_sel_iq; 
wire           iqu_sel_iq_d1; 
wire           iqu_sel_iq_fe; 
 
wire            dbb_rst_l; 
/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 reset_flop 
	(
	.scan_in(reset_flop_scanin),
	.scan_out(reset_flop_scanout),
	.dout(dbb_rst_l), 
        .l1clk(l1clk), 
        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
	); 
 

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_iqu_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_iqu_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////

l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_l2t_data_rdy_px1_fnl 
            (.dout   (pcx_l2t_data_rdy_px1_fnl), 
             .scan_in(ff_pcx_l2t_data_rdy_px1_fnl_scanin),
             .scan_out(ff_pcx_l2t_data_rdy_px1_fnl_scanout),
             .din (pcx_l2t_data_rdy_px1), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_l2t_data_rdy_px2 
            (.dout   (pcx_l2t_data_rdy_px2), 
             .scan_in(ff_pcx_l2t_data_rdy_px2_scanin),
             .scan_out(ff_pcx_l2t_data_rdy_px2_scanout),
             .din (pcx_l2t_data_rdy_px1_fnl), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
            ) ; 


l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_l2t_data_rdy_px2_1 
            (.dout   (pcx_l2t_data_rdy_px2_for_ext),
             .scan_in(ff_pcx_l2t_data_rdy_px2_1_scanin),
             .scan_out(ff_pcx_l2t_data_rdy_px2_1_scanout),
             .din (pcx_l2t_data_rdy_px1_fnl),
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
            ) ;

 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_l2t_data_rdy_px2_d1 
            (.dout   (pcx_l2t_data_rdy_px2_d1), 
             .scan_in(ff_pcx_l2t_data_rdy_px2_d1_scanin),
             .scan_out(ff_pcx_l2t_data_rdy_px2_d1_scanout),
             .din (pcx_l2t_data_rdy_px2), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__dmsff_32x__width_1 ff_pcx_l2t_atm_px2_p 
            (.dout   (iqu_pcx_l2t_atm_px2_p), 
             .scan_in(ff_pcx_l2t_atm_px2_p_scanin),
             .scan_out(ff_pcx_l2t_atm_px2_p_scanout),
             .din (pcx_l2t_atm_px1_fnl), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_l2t_atm_px1_p_fnl 
            (.dout   (pcx_l2t_atm_px1_fnl), 
             .scan_in(ff_pcx_l2t_atm_px1_p_fnl_scanin),
             .scan_out(ff_pcx_l2t_atm_px1_p_fnl_scanout),
             .din (pcx_l2t_atm_px1), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_arb_iqsel_px2_d1 
            (.dout   (arb_iqsel_px2_d1), 
             .scan_in(ff_arb_iqsel_px2_d1_scanin),
             .scan_out(ff_arb_iqsel_px2_d1_scanout),
             .din (arb_iqsel_px2), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// "c1_reg_inst_vld" signal will be used to indicate that there is a valid 
// instructon in the C1 Flop. C1 flop instruction is only valid if the queue is 
// empty and the instruction issued by the pcx is not selected in the same cycle 
// by the arbiter. C1 flop is used to store the instruction for only one cycle 
// in the case queue is empty and instruction issued by pcx is not selected by 
// arbiter in the same cycle. 
//////////////////////////////////////////////////////////////////////////////// 
 
assign set_c1_reg_inst_vld = ((que_cnt_0 | (que_cnt_1 & sel_qcount_minus1)) & 
                               ~c1_reg_inst_vld & pcx_l2t_data_rdy_px2 & ~arb_iqsel_px2) | 
                             (((c1_reg_inst_vld) | 
                               (que_cnt_1 & ~sel_qcount_minus1 & ~sel_qcount_plus1) | 
                               (que_cnt_2 &  sel_qcount_minus1)) & 
                               pcx_l2t_data_rdy_px2 & arb_iqsel_px2) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_inst_vld_c1 
            (.dout   (c1_reg_inst_vld), 
             .scan_in(ff_pcx_inst_vld_c1_scanin),
             .scan_out(ff_pcx_inst_vld_c1_scanout),
             .din (set_c1_reg_inst_vld), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
            ) ; 


l2t_iqu_ctl_msff_ctl_macro__width_1 ff_pcx_inst_vld_c1_1 
            (.dout   (c1_reg_inst_vld_cloned),
             .scan_in(ff_pcx_inst_vld_c1_1_scanin),
             .scan_out(ff_pcx_inst_vld_c1_1_scanout),
             .din (set_c1_reg_inst_vld),
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
            ) ;


 
 
//////////////////////////////////////////////////////////////////////////////// 
// Pipeline for Write Enable and Write Pointer generation for PH2 write 
// 
//=================================================== 
//    PX2            |               C1             | 
//=================================================== 
//       write into  |                  write into  | 
//       IQ array    |                  IQ array    | 
//                   |                              | 
//       gen wrt en  |                  gen wrt en  | 
//                   |                              | 
//       gen inc wrt | Mux select new   gen inc wrt | 
//       ptr signal  | wrt pointer      ptr signal  | 
//                   |                              | 
//       gen wrt ptr |                  gen wrt ptr | 
//       plus 1      |                  plus 1      | 
//=================================================== 
//////////////////////////////////////////////////////////////////////////////// 
 
assign inc_wr_ptr_px2 = pcx_l2t_data_rdy_px2 & (~arb_iqsel_px2 | 
                        ((~que_cnt_0 & ~(que_cnt_1 & sel_qcount_minus1)) | 
                           c1_reg_inst_vld)) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_inc_wr_ptr_c1 
            (.dout   (inc_wr_ptr_c1), 
             .scan_in(ff_inc_wr_ptr_c1_scanin),
             .scan_out(ff_inc_wr_ptr_c1_scanout),
             .din (inc_wr_ptr_px2), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
assign	sel_wrptr_plus1 = dbb_rst_l &  inc_wr_ptr_c1 ; 
assign	sel_wrptr_same  = dbb_rst_l & ~inc_wr_ptr_c1 ;  
 
assign	wrptr_plus1     = wrptr + 4'b1 ; 
 
l2t_iqu_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_wrptr  
              (.dout (wrptr[3:0]), 
               .din0  (4'b0),                 .sel0 (~dbb_rst_l), 
               .din1  (wrptr_plus1_d1[3:0]),  .sel1 (sel_wrptr_plus1), 
               .din2  (wrptr_d1[3:0]),        .sel2 (sel_wrptr_same) 
              ) ; 
 
 
l2t_iqu_ctl_msff_ctl_macro__width_4 ff_array_wr_ptr_plus1 
            (.dout   (wrptr_plus1_d1[3:0]), 
             .scan_in(ff_array_wr_ptr_plus1_scanin),
             .scan_out(ff_array_wr_ptr_plus1_scanout),
             .din (wrptr_plus1[3:0]), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_4 ff_array_wr_ptr 
            (.dout   (wrptr_d1[3:0]), 
             .scan_in(ff_array_wr_ptr_scanin),
             .scan_out(ff_array_wr_ptr_scanout),
             .din (wrptr[3:0]), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 


l2t_iqu_ctl_msff_ctl_macro__width_1 ff_l2t_mb2_run_r1 
                           (.din(l2t_mb2_run), .l1clk(l1clk),  
		.scan_in(ff_l2t_mb2_run_r1_scanin),
		.scan_out(ff_l2t_mb2_run_r1_scanout),
		.dout(l2t_mb2_run_r1),
  .siclk(siclk),
  .soclk(soclk)  
); 


assign  iqu_iq_array_wr_en = l2t_mb2_run_r1 ? l2t_mb2_iqarray_wr_en : pcx_l2t_data_rdy_px2; 
assign  iqu_iq_array_wr_wl = l2t_mb2_run_r1 ? l2t_mb2_addr : wrptr ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
//================================================== 
//    PX2            |            C1               | 
//================================================== 
//      gen rd en    |                gen rd en    | 
//                   |                             | 
//     mux slect new | gen rd ptr    mux slect new | 
//       rd ptr      |   plus 1        rd ptr      | 
//================================================== 
// 
// Generation of Mux select for selecting between Read Pointer and it's 
// Incremented value depends on the 'arb_iqsel_px2' signal. New value of 
// write pointer is selected and transmitted to the IQ array for reading the 
// array. Since 'arb_iqsel_px2' signal arrives late in the cycle this may 
// create timing problem. 
// 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  iqu_iq_array_rd_en = l2t_mb2_run_r1 ? l2t_mb2_iqarray_rd_en : iqu_iq_arb_vld_px2_internal ; 
assign	iqu_iq_array_rd_wl = l2t_mb2_run_r1 ? l2t_mb2_addr:  rdptr ; 
 
assign  inc_rd_ptr_px2 =  c1_reg_inst_vld | 
                          (que_cnt_1 & sel_qcount_plus1 & arb_iqsel_px2) | 
                          (que_cnt_1_plus & ~(que_cnt_2 & sel_qcount_minus1) & 
                           arb_iqsel_px2 );
 
 
assign	rdptr_plus1    = rdptr_d1 + 4'b1 ; 
 
l2t_iqu_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_rdptr 
              (.dout (rdptr[3:0]), 
               .din0  (rdptr_d1[3:0]),     .sel0 (~inc_rd_ptr_px2), 
               .din1  (rdptr_plus1[3:0]),  .sel1 (inc_rd_ptr_px2) 
              ) ; 
 
 
l2t_iqu_ctl_msff_ctl_macro__clr_1__width_4 ff_array_rd_ptr  // sync reset active low
             (.dout   (rdptr_d1[3:0]), 
              .scan_in(ff_array_rd_ptr_scanin),
              .scan_out(ff_array_rd_ptr_scanout),
              .din (rdptr[3:0]), 
              .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
               
 
             ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
//============================================================================== 
//    PX2                |            C1             |         C2 
//============================================================================== 
//       latch pcx rdy   |  gen qcount inc, dec or   | new Qcount vlue 
//       & iqsel signals |         same sig.         | 
//                       |                           | 
//                       | gen next compare values   | new compare values 
//                       | based on current qcount   | 
//                       | & inc, dec or same signal | 
//                       |                           | 
//                       |           latch pcx rdy   | gen qcount inc, dec or 
//                       |           & iqsel signals |       same sig. 
//                       |                           | 
//                       |                           | gen next compare values 
//                       |                           | based on current qcount 
//                       |                           | & inc, dec or same signal 
//                       |                           | 
//                       |                           |          latch pcx rdy 
//                       |                           |          & iqsel signals 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  sel_qcount_plus1  =  pcx_l2t_data_rdy_px2_d1 & ~arb_iqsel_px2_d1 ; 
assign	sel_qcount_minus1 = ~pcx_l2t_data_rdy_px2_d1 &  arb_iqsel_px2_d1 ; 
assign  sel_qcount_same   = ~(sel_qcount_plus1 | sel_qcount_minus1) ; 
 
assign	que_cnt_plus1     = que_cnt + 5'b1 ; 
assign	que_cnt_minus1    = que_cnt - 5'b1 ; 
 
l2t_iqu_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_5 mux_que_cnt  
              (.dout (next_que_cnt[4:0]), 
               .din0 (que_cnt_plus1[4:0]),   .sel0 (sel_qcount_plus1), 
               .din1 (que_cnt_minus1[4:0]),  .sel1 (sel_qcount_minus1), 
               .din2 (que_cnt[4:0]),         .sel2 (sel_qcount_same) 
              ) ; 
l2t_iqu_ctl_msff_ctl_macro__clr_1__width_5 ff_que_cnt  // sync reset active low
             (.dout   (que_cnt[4:0]), 
              .scan_in(ff_que_cnt_scanin),
              .scan_out(ff_que_cnt_scanout),
              .din (next_que_cnt[4:0]), 
              .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
               
 
             ) ; 
 
 
 
assign  que_cnt_0_p       = ~(|que_cnt[4:0]) ; 
assign  que_cnt_1_p       = (~que_cnt_1_plus & que_cnt[0]) ; 
assign  que_cnt_1_plus_p  = |(que_cnt[4:1]) ; 
assign  que_cnt_2_p       = ~(|que_cnt[4:2] | que_cnt[0]) & que_cnt[1] ; 
assign  que_cnt_2_plus_p  = (|que_cnt[4:2]) | (&que_cnt[1:0]) ; 
assign  que_cnt_3_p       = ~(|que_cnt[4:2]) & (&que_cnt[1:0]) ; 

assign  que_cnt_9_p       = (que_cnt == 5'd9) ;
assign  que_cnt_10_p      = (que_cnt == 5'd10) ;
assign  que_cnt_10_plus_p = (que_cnt >  5'd10) ;



assign  que_cnt_11_p      = (que_cnt == 5'd11) ; 
//assign  que_cnt_11_plus_p = (que_cnt >  5'd11) ;
//assign  que_cnt_12_p      = (que_cnt == 5'd12) ; 
//assign  que_cnt_12_plus_p = (que_cnt >  5'd12) ; 
//assign  que_cnt_13_p      = (que_cnt == 5'd13) ; 
//assign  que_cnt_13_plus_p = (que_cnt >  5'd13) ; 
 
 
assign  que_cnt_0_n       = (que_cnt_0_p & sel_qcount_same)  | 
                            (que_cnt_1_p & sel_qcount_minus1) ; 
assign  que_cnt_1_n       = (que_cnt_1_p & sel_qcount_same)  | 
                            (que_cnt_0_p & sel_qcount_plus1) | 
                            (que_cnt_2_p & sel_qcount_minus1) ; 
assign  que_cnt_1_plus_n  = (que_cnt_1_plus_p & (sel_qcount_same | sel_qcount_plus1)) | 
                            (que_cnt_1_p & sel_qcount_plus1) | 
                            (que_cnt_2_plus_p & sel_qcount_minus1) ; 
assign  que_cnt_2_n       = (que_cnt_2_p & sel_qcount_same)  | 
                            (que_cnt_1_p & sel_qcount_plus1) | 
                           (que_cnt_3_p & sel_qcount_minus1) ; 

//assign  que_cnt_12_n      = (que_cnt_12_p & sel_qcount_same)  | 
//                            (que_cnt_11_p & sel_qcount_plus1) | 
//                            (que_cnt_13_p & sel_qcount_minus1) ; 
//assign  que_cnt_12_plus_n = (que_cnt_12_plus_p & (sel_qcount_same | sel_qcount_plus1)) | 
//                            (que_cnt_12_p & sel_qcount_plus1) | 
//                            (que_cnt_13_plus_p & sel_qcount_minus1) ; 
// 
//
//assign  que_cnt_11_n      = (que_cnt_11_p & sel_qcount_same)  |
//                            (que_cnt_10_p & sel_qcount_plus1) |
//                            (que_cnt_12_p & sel_qcount_minus1) ;
//assign  que_cnt_11_plus_n = (que_cnt_11_plus_p & (sel_qcount_same | sel_qcount_plus1)) |
//                            (que_cnt_11_p & sel_qcount_plus1) |
//                            (que_cnt_12_plus_p & sel_qcount_minus1) ;
//
 
assign  que_cnt_10_n      = (que_cnt_10_p & sel_qcount_same)  |
                            (que_cnt_9_p  & sel_qcount_plus1) |
                            (que_cnt_11_p & sel_qcount_minus1) ;

assign  que_cnt_10_plus_n = (que_cnt_10_plus_p & (sel_qcount_same | sel_qcount_plus1)) |
                            (que_cnt_10_p & sel_qcount_plus1) |
                            (que_cnt_10_plus_p & sel_qcount_minus1) ;

 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_que_cnt_0 
            (.dout   (que_cnt_0), 
             .scan_in(ff_que_cnt_0_scanin),
             .scan_out(ff_que_cnt_0_scanout),
             .din (que_cnt_0_n), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_que_cnt_1 
            (.dout   (que_cnt_1), 
             .scan_in(ff_que_cnt_1_scanin),
             .scan_out(ff_que_cnt_1_scanout),
             .din (que_cnt_1_n), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_que_cnt_1_plus 
            (.dout   (que_cnt_1_plus), 
             .scan_in(ff_que_cnt_1_plus_scanin),
             .scan_out(ff_que_cnt_1_plus_scanout),
             .din (que_cnt_1_plus_n), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_que_cnt_2 
            (.dout   (que_cnt_2), 
             .scan_in(ff_que_cnt_2_scanin),
             .scan_out(ff_que_cnt_2_scanout),
             .din (que_cnt_2_n), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
//msff_ctl_macro ff_que_cnt_12 (width=1)
//            (.dout   (que_cnt_11), 
//             .scan_in(ff_que_cnt_12_scanin),
//             .scan_out(ff_que_cnt_12_scanout),
//             .din (que_cnt_11_n), 
//             .l1clk (l1clk), 
//              
// 
//            ) ; 
// 
//msff_ctl_macro ff_que_cnt_12_plus (width=1)
//            (.dout   (que_cnt_11_plus), 
//             .scan_in(ff_que_cnt_12_plus_scanin),
//             .scan_out(ff_que_cnt_12_plus_scanout),
//             .din (que_cnt_11_plus_n), 
//             .l1clk (l1clk), 
//              
// 
//            ) ; 
// 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_que_cnt_10 
            (.dout   (que_cnt_10), 
             .scan_in(ff_que_cnt_10_scanin),
             .scan_out(ff_que_cnt_10_scanout),
             .din (que_cnt_10_n), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_que_cnt_10_plus 
            (.dout   (que_cnt_10_plus), 
             .scan_in(ff_que_cnt_10_plus_scanin),
             .scan_out(ff_que_cnt_10_plus_scanout),
             .din (que_cnt_10_plus_n), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
 
////////////////////////////////////////////////////////////////////////////////

assign  iqu_sel_c1reg_over_iqarray = (wrptr_d1 == rdptr_d1); 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// MUX sel generation for IQ dp. 
//////////////////////////////////////////////////////////////////////////////// 
 
//assign  iqu_sel_iq  = ~c1_reg_inst_vld & 
//                        (que_cnt_1_plus | (que_cnt_1 & ~arb_iqsel_px2_d1)) ; 
assign  set_iqu_sel_iq = ~set_c1_reg_inst_vld & 
                           (que_cnt_1_plus_n | (que_cnt_1_n & ~arb_iqsel_px2)) ; 
l2t_iqu_ctl_msff_ctl_macro__width_1 ff_iqu_sel_iq 
            (.dout   (iqu_sel_iq), 
             .scan_in(ff_iqu_sel_iq_scanin),
             .scan_out(ff_iqu_sel_iq_scanout),
             .din (set_iqu_sel_iq), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              
 
            ) ; 
 
 
//assign  iqu_sel_c1  = c1_reg_inst_vld ; 
l2t_iqu_ctl_msff_ctl_macro__dmsff_32x__width_1 ff_iqu_sel_c1 
            (.dout   (iqu_sel_c1), 
             .scan_in(ff_iqu_sel_c1_scanin),
             .scan_out(ff_iqu_sel_c1_scanout),
             .din (set_c1_reg_inst_vld), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
            ) ; 
 
 
//assign  iqu_sel_pcx = ~iqu_sel_iq & ~iqu_sel_c1 ; 
assign  set_iqu_sel_pcx = ~set_iqu_sel_iq & ~set_c1_reg_inst_vld ; 

l2t_iqu_ctl_msff_ctl_macro__dmsff_32x__width_1 ff_iqu_sel_pcx 
            (.dout   (iqu_sel_pcx), 
             .scan_in(ff_iqu_sel_pcx_scanin),
             .scan_out(ff_iqu_sel_pcx_scanout),
             .din (set_iqu_sel_pcx), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
            ) ; 

l2t_iqu_ctl_msff_ctl_macro__dmsff_32x__width_1 ff_iqu_sel_iq_d1 
            (.dout   (iqu_sel_iq_d1), 
             .scan_in(ff_iqu_sel_iq_d1_scanin),
             .scan_out(ff_iqu_sel_iq_d1_scanout),
             .din (iqu_sel_iq), 
             .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
            ) ; 
 
//assign  iqu_sel_iq_fe = iqu_sel_iq_d1 & ~iqu_sel_iq ; 
//assign  iqu_hold_rd   = iqu_sel_iq & ~arb_iqsel_px2 & ~iqu_sel_iq_fe ; 
//assign  iqu_hold_rd_n = ~iqu_hold_rd;

cl_u1_inv_16x inv_iqu_sel_iq
	(
	.in	(iqu_sel_iq),
	.out	(iqu_sel_iq_n)
	);

cl_u1_inv_16x inv_arb_iqsel_px2
        (
        .in     (arb_iqsel_px2_v1),
        .out    (arb_iqsel_px2_v1_n)
        );


cl_u1_nand2_16x nand_iqu_sel_iq_fe 
	(
	.in0	(iqu_sel_iq_d1),
	.in1	(iqu_sel_iq_n),
	.out	(iqu_sel_iq_fe_n)
	);

cl_u1_nand3_16x nand_iqu_hold_rd_n
	(
	.in0	(iqu_sel_iq_fe_n),
	.in1	(arb_iqsel_px2_v1_n),
	.in2	(iqu_sel_iq),
	.out	(iqu_hold_rd_n)
	);

//////////////////////////////////////////////////////////////////////////////// 
// IQ COUNT 
// 
// MUX here 
//      PQ  PA  PX1 PX2  C1   C2(counter update for pckt in PX2) 
//          PQ  PA  PX1  PX2  C1   C2 
//              PQ  PA   PX1  PX2  C1	C2 
//                  PQ   PA   PX1  PX2  C1 
//                       PQ   PA   PX1  PX2  C1   C2 
//                            PQ   PA   PX1  PX2  C1 
// 
// When the stall is signalled, there can potentially be 5 packets in C1,  
// PX2, Px1, PA and PQ that need to be queued in the IQ. The packet in PQ may 
// be an atomic hence, the high water mark is 11. 
//////////////////////////////////////////////////////////////////////////////// 
 
//assign l2t_pcx_stall_pq = que_cnt_12_plus | 
//                           (que_cnt_12 & (pcx_l2t_data_rdy_px2_d1 & 
//                                            ~arb_iqsel_px2_d1)) ; 

// assign l2t_pcx_stall_pq =  que_cnt_11_plus | 
// 			(que_cnt_11 & (pcx_l2t_data_rdy_px2_d1 &  ~arb_iqsel_px2_d1)) ;

assign l2t_pcx_stall_pq =  que_cnt_10_plus | 
			(que_cnt_10 & (pcx_l2t_data_rdy_px2_d1 &  ~arb_iqsel_px2_d1)) ;

 
assign iqu_iq_arb_vld_px2_internal  = (pcx_l2t_data_rdy_px2 | c1_reg_inst_vld | 
		(que_cnt_1_plus | (que_cnt_1 & ~sel_qcount_minus1))) ;

assign iqu_iq_arb_vld_px2  = (pcx_l2t_data_rdy_px2_for_ext | c1_reg_inst_vld_cloned | 
		(que_cnt_1_plus | (que_cnt_1 & ~sel_qcount_minus1))) ;

assign iqu_iq_arb_vld_px2_v1  = (pcx_l2t_data_rdy_px2_for_ext | c1_reg_inst_vld_cloned | 
		(que_cnt_1_plus | (que_cnt_1 & ~sel_qcount_minus1))) ;

// fixscan start:
assign reset_flop_scanin         = scan_in                  ;
assign spares_scanin             = reset_flop_scanout       ;
assign ff_pcx_l2t_data_rdy_px1_fnl_scanin = spares_scanout           ;
assign ff_pcx_l2t_data_rdy_px2_scanin = ff_pcx_l2t_data_rdy_px1_fnl_scanout;
assign ff_pcx_l2t_data_rdy_px2_1_scanin = ff_pcx_l2t_data_rdy_px2_scanout;
assign ff_pcx_l2t_data_rdy_px2_d1_scanin = ff_pcx_l2t_data_rdy_px2_1_scanout;
assign ff_pcx_l2t_atm_px2_p_scanin = ff_pcx_l2t_data_rdy_px2_d1_scanout;
assign ff_pcx_l2t_atm_px1_p_fnl_scanin = ff_pcx_l2t_atm_px2_p_scanout;
assign ff_arb_iqsel_px2_d1_scanin = ff_pcx_l2t_atm_px1_p_fnl_scanout;
assign ff_pcx_inst_vld_c1_scanin = ff_arb_iqsel_px2_d1_scanout;
assign ff_pcx_inst_vld_c1_1_scanin = ff_pcx_inst_vld_c1_scanout;
assign ff_inc_wr_ptr_c1_scanin   = ff_pcx_inst_vld_c1_1_scanout;
assign ff_array_wr_ptr_plus1_scanin = ff_inc_wr_ptr_c1_scanout ;
assign ff_array_wr_ptr_scanin    = ff_array_wr_ptr_plus1_scanout;
assign ff_l2t_mb2_run_r1_scanin  = ff_array_wr_ptr_scanout  ;
assign ff_array_rd_ptr_scanin    = ff_l2t_mb2_run_r1_scanout;
assign ff_que_cnt_scanin         = ff_array_rd_ptr_scanout  ;
assign ff_que_cnt_0_scanin       = ff_que_cnt_scanout       ;
assign ff_que_cnt_1_scanin       = ff_que_cnt_0_scanout     ;
assign ff_que_cnt_1_plus_scanin  = ff_que_cnt_1_scanout     ;
assign ff_que_cnt_2_scanin       = ff_que_cnt_1_plus_scanout;
assign ff_que_cnt_10_scanin      = ff_que_cnt_2_scanout     ;
assign ff_que_cnt_10_plus_scanin = ff_que_cnt_10_scanout    ;
assign ff_iqu_sel_iq_scanin      = ff_que_cnt_10_plus_scanout;
assign ff_iqu_sel_c1_scanin      = ff_iqu_sel_iq_scanout    ;
assign ff_iqu_sel_pcx_scanin     = ff_iqu_sel_c1_scanout    ;
assign ff_iqu_sel_iq_d1_scanin   = ff_iqu_sel_pcx_scanout   ;
assign scan_out                  = ff_iqu_sel_iq_d1_scanout ;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_msff_ctl_macro__width_1 (
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

module l2t_iqu_ctl_l1clkhdr_ctl_macro (
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


module l2t_iqu_ctl_spare_ctl_macro__num_4 (
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
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;


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

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));
assign scan_out = so_3;



endmodule






// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_msff_ctl_macro__dmsff_32x__width_1 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  input [3:0] din2;
  input sel2;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]) |
                       ( {4{sel2}} & din2[3:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_msff_ctl_macro__width_4 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_msff_ctl_macro__clr_1__width_4 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0] & ~{4{clr}};






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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  input [4:0] din2;
  input sel2;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]) |
                       ( {5{sel2}} & din2[4:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_iqu_ctl_msff_ctl_macro__clr_1__width_5 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0] & ~{5{clr}};






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








