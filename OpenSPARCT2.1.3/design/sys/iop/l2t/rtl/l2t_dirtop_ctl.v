// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dirtop_ctl.v
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
module l2t_dirtop_ctl (
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  dir_rd_data_en_c4, 
  dir_wr_data_en_c4, 
  dir_cam_en_c4, 
  dir_rw_entry_c4, 
  dir_inval_mask_c4, 
  dir_warm_rst_c4, 
  dirlbf_lkup_wr_data_c4_buf, 
  dirlbf_force_hit_c4, 
  arb_force_hit_c4, 
  select_panel0, 
  select_panel1, 
  select_panel2, 
  select_panel3, 
  l2t_mb0_run, 
  l2t_mb0_mask, 
  l2t_mb0_addr, 
  l2t_mb0_row_panel_en, 
  l2t_mb0_row_row_en, 
  l2t_mb0_row_lookup_en, 
  l2t_mb0_lookup_wdata, 
  l2t_mb0_row_wr_en, 
  l2t_mb0_row_rd_en, 
  ic_dc_dir, 
  arbadr_arbdp_addr4_c4, 
  dirrep_rd_en_c4, 
  dirrep_wr_en_c4, 
  addr_index_bit5, 
  dirrep_inval_mask_c4, 
  dirrep_rdwr_row_en_c4, 
  dirrep_lkup_row_dec_c4, 
  dirrep_lkup_panel_dec_c4, 
  dirrep_rdwr_panel_dec_c4, 
  dirrep_rw_entry_c4, 
  lkup_wr_data_c4, 
  dir_clear_c4);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire ic_ctl_0145_scanin;
wire ic_ctl_0145_scanout;
wire [3:0] ic_lkup_en_c4_buf_row0;
wire [7:0] ic_inv_mask_c4_buf_row0;
wire [3:0] ic_rw_dec_c4_buf_row0;
wire ic_rd_en_c4_buf_row0;
wire ic_wr_en_c4_buf_row0;
wire [5:0] ic_rw_entry_c4_buf_row0;
wire ic_dir_clear_c4_buf_row0;
wire ic_buf_row0_scanin;
wire ic_buf_row0_scanout;


input           l2clk;
input           scan_in;
output          scan_out;

input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;

output	[3:0]	dir_rd_data_en_c4;
output	[3:0]   dir_wr_data_en_c4;
output	[3:0]   dir_cam_en_c4;
output	[5:0]   dir_rw_entry_c4;
output	[7:0]   dir_inval_mask_c4;
output		dir_warm_rst_c4;
output	[15:0]	dirlbf_lkup_wr_data_c4_buf;
output		dirlbf_force_hit_c4;
input		arb_force_hit_c4;

output		select_panel0;
output		select_panel1;
output		select_panel2;
output		select_panel3;


input           l2t_mb0_run;
input   [7:0]   l2t_mb0_mask;
input   [5:0]   l2t_mb0_addr;
input   [3:0]   l2t_mb0_row_panel_en;
input      	l2t_mb0_row_row_en;
input   [3:0]   l2t_mb0_row_lookup_en;
input   [15:0]  l2t_mb0_lookup_wdata;
input           l2t_mb0_row_wr_en;
input           l2t_mb0_row_rd_en;


input		ic_dc_dir;
input		arbadr_arbdp_addr4_c4;
input		dirrep_rd_en_c4;
input		dirrep_wr_en_c4;
input		addr_index_bit5;
input	[7:0]	dirrep_inval_mask_c4;
input	[1:0]	dirrep_rdwr_row_en_c4;
input	[1:0]	dirrep_lkup_row_dec_c4;
input	[3:0]	dirrep_lkup_panel_dec_c4;
input	[3:0]	dirrep_rdwr_panel_dec_c4;
input	[5:0]	dirrep_rw_entry_c4;
input	[14:0]	lkup_wr_data_c4;
input		dir_clear_c4;


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_dirtop_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////

l2t_dir_ctl     dir_ctl_0145( 
        .aclk(siclk),
        .bclk(soclk),
        .scan_in(ic_ctl_0145_scanin),
        .scan_out(ic_ctl_0145_scanout),
        .l1clk    (l1clk), 
        // Outputs 
        .dir_rd_data_en_c4(dir_rd_data_en_c4[3:0]), // to cam
        .dir_wr_data_en_c4(dir_wr_data_en_c4[3:0]),// to cam
        .dir_cam_en_c4    (dir_cam_en_c4[3:0]),// to cam
        .dir_rw_entry_c4  (dir_rw_entry_c4[5:0]),// to cam
        .dir_inval_mask_c4(dir_inval_mask_c4[7:0]),// to cam
        .dir_warm_rst_c4  (dir_warm_rst_c4),    // to cam
        .select_panel0(select_panel0),	// to dirout
        .select_panel1(select_panel1),// to dirout
        .select_panel2(select_panel2),// to dirout
        .select_panel3(select_panel3),// to dirout
        // Inputs 
        .dirlbf_lkup_en_c4_buf(ic_lkup_en_c4_buf_row0[3:0]),
        .dirlbf_inval_mask_c4_buf(ic_inv_mask_c4_buf_row0[7:0]),
        .dirlbf_rw_dec_c4_buf(ic_rw_dec_c4_buf_row0[3:0]),
        .dirlbf_rd_en_c4_buf (ic_rd_en_c4_buf_row0), 
        .dirlbf_wr_en_c4_buf (ic_wr_en_c4_buf_row0),
        .dirlbf_rw_entry_c4_buf(ic_rw_entry_c4_buf_row0[5:0]), 
        .dirlbf_dir_clear_c4_buf(ic_dir_clear_c4_buf_row0),
  .l2t_mb0_run(l2t_mb0_run));


//l2t_dirlbf_dp   ic_buf_row0     ( 
l2t_dirbuf_ctl   buf_row0     ( 
          // Outputs 
           .dirlbf_lkup_wr_data_c4_buf(dirlbf_lkup_wr_data_c4_buf[15:0]),
           .dirlbf_lkup_en_c4_buf(ic_lkup_en_c4_buf_row0[3:0]),
           .dirlbf_inval_mask_c4_buf(ic_inv_mask_c4_buf_row0[7:0]),
           .dirlbf_rw_dec_c4_buf(ic_rw_dec_c4_buf_row0[3:0]), 
           .dirlbf_rd_en_c4_buf(ic_rd_en_c4_buf_row0), 
           .dirlbf_wr_en_c4_buf(ic_wr_en_c4_buf_row0), 
           .dirlbf_rw_entry_c4_buf(ic_rw_entry_c4_buf_row0[5:0]), 
           .dirlbf_dir_clear_c4_buf(ic_dir_clear_c4_buf_row0),   
           .dirlbf_force_hit_c4 (dirlbf_force_hit_c4),
          // Inputs 
        	.aclk(siclk),
        	.bclk(soclk),
        	.scan_in(ic_buf_row0_scanin),
        	.scan_out(ic_buf_row0_scanout),
        	.l1clk    (l1clk),
           .l2t_mb0_run                 (l2t_mb0_run),
           .l2t_mb0_mask                (l2t_mb0_mask[7:0]),
           .l2t_mb0_addr                (l2t_mb0_addr[5:0]),
           .l2t_mb0_lookup_wdata         (l2t_mb0_lookup_wdata[15:0]),
           .l2t_mb0_row_wr_en            (l2t_mb0_row_wr_en),
           .l2t_mb0_row_rd_en            (l2t_mb0_row_rd_en),
           .l2t_mb0_row_lookup_en        (l2t_mb0_row_lookup_en[3:0]),
           .l2t_mb0_row_row_en           (l2t_mb0_row_row_en),
           .l2t_mb0_row_panel_en         (l2t_mb0_row_panel_en[3:0]),
          .arb_force_hit_c4 	(arb_force_hit_c4),
          .ic_dc_dir (ic_dc_dir),
          .arbadr_arbdp_addr4_c4 (arbadr_arbdp_addr4_c4),
          .rd_en_c4  (dirrep_rd_en_c4),           
          .wr_en_c4  (dirrep_wr_en_c4),           
          .addr_index_bit5  (addr_index_bit5),           
          .dir_inval_mask_c4(dirrep_inval_mask_c4[7:0]), 
          .rw_row_en_c4(dirrep_rdwr_row_en_c4[1:0]), 
          .rw_panel_en_c4(dirrep_rdwr_panel_dec_c4[3:0]), 
          .dir_rw_entry_c4(dirrep_rw_entry_c4[5:0]),
          .lkup_row_en_c4(dirrep_lkup_row_dec_c4[1:0]), 
          .lkup_panel_en_c4(dirrep_lkup_panel_dec_c4[3:0]), 
          .lkup_wr_data_c4(lkup_wr_data_c4[14:0]),
          .dir_clear_c4(dir_clear_c4)
	);     

// fixscan start:
assign ic_ctl_0145_scanin        = scan_in                  ;
assign ic_buf_row0_scanin        = ic_ctl_0145_scanout      ;
assign scan_out                  = ic_buf_row0_scanout      ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l2t_dirtop_ctl_l1clkhdr_ctl_macro (
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


module l2t_dirtop_ctl_spare_ctl_macro__num_4 (
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

module l2t_dirtop_ctl_msff_ctl_macro__width_3 (
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

module l2t_dirtop_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirtop_ctl_msff_ctl_macro__width_4 (
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

module l2t_dirtop_ctl_msff_ctl_macro__width_1 (
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

module l2t_dirtop_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





assign dout[1:0] = ( {2{sel0}} & din0[1:0] ) |
                       ( {2{sel1}} & din1[1:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirtop_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





assign dout[7:0] = ( {8{sel0}} & din0[7:0] ) |
                       ( {8{sel1}} & din1[7:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirtop_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  output [5:0] dout;





assign dout[5:0] = ( {6{sel0}} & din0[5:0] ) |
                       ( {6{sel1}} & din1[5:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirtop_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





assign dout[15:0] = ( {16{sel0}} & din0[15:0] ) |
                       ( {16{sel1}} & din1[15:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirtop_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
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

