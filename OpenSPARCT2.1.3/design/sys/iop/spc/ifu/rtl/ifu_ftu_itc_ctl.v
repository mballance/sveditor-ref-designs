// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_itc_ctl.v
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
module ifu_ftu_itc_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tlu_itlb_reload, 
  tlu_trap_pc_0, 
  tlu_trap_pc_1, 
  itd_index_valid_in, 
  ftp_itt_rd_req_bf, 
  ftp_itd_rd_req_bf, 
  mbi_wdata_6, 
  mbi_wdata_0, 
  tlu_trap_pc_0_45_43, 
  tlu_trap_pc_1_45_43, 
  lsu_asi_error_inject_b31, 
  lsu_asi_error_inject_b29, 
  lsu_asi_error_inject_b28, 
  tlu_itlb_bypass, 
  lsu_immu_enable, 
  ftp_itb_fetch_thr_bf, 
  asi_real_bf, 
  ftp_ith_det_req_bf, 
  mbi_run, 
  lbist_run, 
  mbi_cambist_run, 
  mbi_itb_demap_en, 
  mbi_demap_type, 
  mbi_dis_clr_ubit, 
  mbi_repl_write, 
  mbi_itb_cam_en_pre, 
  mbi_itb_write_en, 
  mbi_itb_read_en, 
  itb_tte_data_v_27_22, 
  itb_tte_data_v_21_16, 
  scan_out, 
  itc_wr_u_en, 
  itc_rw_index_vld, 
  itc_demap, 
  itc_demap_context, 
  itc_demap_all, 
  itc_demap_real, 
  itc_tte_ubit, 
  itc_sel_trap_pc_0, 
  itc_sel_trap_pc_1, 
  itc_sel_demap_tag_d, 
  itc_sel_demap_tag_c0, 
  itc_sel_demap_tag_c1, 
  itc_sel_write_tag, 
  itc_sel_write_tag_indexed, 
  itc_sel_default, 
  itc_itlb_rd_vld_bf, 
  itc_bypass_bf, 
  itc_ra_to_pa_bf, 
  itc_tag_error_inj, 
  itc_data_error_inj, 
  itc_dis_clr_ubit, 
  itc_write_next, 
  itc_demap_next, 
  itc_sel_mbist, 
  itc_mbi_itb_read_en, 
  itc_thr_to_write, 
  itc_itb_data_sz_1);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire lsu_err_inj_sig_reg_scanin;
wire lsu_err_inj_sig_reg_scanout;
wire asi_error_inject_b31_ff;
wire asi_error_inject_b29_ff;
wire asi_error_inject_b28_ff;
wire tag_error_inj;
wire wr_vld_in;
wire data_error_inj;
wire error_inj_latch_scanin;
wire error_inj_latch_scanout;
wire [1:0] reload;
wire demap_next_in;
wire reload0_latch_scanin;
wire reload0_latch_scanout;
wire reload0;
wire [37:35] tlu_tte;
wire [2:0] tlu_tte_45_43;
wire tte0_lat_scanin;
wire tte0_lat_scanout;
wire [37:35] tte0;
wire [7:0] tte0_tid_dec;
wire tte1_lat_scanin;
wire tte1_lat_scanout;
wire [7:0] tte1_tid_dec;
wire [7:0] thr_to_write_in;
wire demap_c0_reg_scanin;
wire demap_c0_reg_scanout;
wire [2:0] demap_c0;
wire demap_c1_reg_scanin;
wire demap_c1_reg_scanout;
wire [2:0] demap_c1;
wire reload1_latch_scanin;
wire reload1_latch_scanout;
wire reload1;
wire wr_vld_latch_scanin;
wire wr_vld_latch_scanout;
wire itc_cam_vld_1;
wire wr_vld;
wire mbist_dis_clr_ubit_ff;
wire itc_repl_wrire;
wire itc_cam_vld_2;
wire itc_cam_vld_2_unused;
wire bist_run_reg_scanin;
wire bist_run_reg_scanout;
wire itc_mbist_run;
wire itc_cambist_run;
wire itc_itb_demap_en;
wire [1:0] itc_demap_type;
wire itc_mbi_itb_write_en;
wire itc_mbi_wdata_6;
wire itc_mbi_wdata_0;
wire itc_tte_ubit_old;
wire demap_page;
wire demap_context;
wire demap_all;
wire demap_real;
wire itc_sel_demap_tag_d_in;
wire itc_sel_demap_tag_c0_in;
wire itc_sel_demap_tag_c1_in;
wire itc_sel_demap_reg_scanin;
wire itc_sel_demap_reg_scanout;
wire itc_sel_write_tag_in;
wire itc_sel_write_tag_indexed_in;
wire itc_sel_default_in;
wire index_valid;
wire itc_demap_page;
wire itc_demap_page_unused;
wire itlb_bypass_lat_scanin;
wire itlb_bypass_lat_scanout;
wire [7:0] itlb_bypass;
wire immu_enable_lat_scanin;
wire immu_enable_lat_scanout;
wire [7:0] immu_enable;
wire [7:0] pre_bypass_bf;
wire [7:0] pre_ra_to_pa;
wire spares_scanin;
wire spares_scanout;
wire se;




input		tcu_scan_en;
input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
                                        // The following signals indicate the
                                        // first cycle of TTE transfer as well
                                        // as the operation (write or demap)
input	[1:0]	tlu_itlb_reload;
input	[37:35]	tlu_trap_pc_0;	        // 
input	[37:35]	tlu_trap_pc_1;	        // 
input		itd_index_valid_in;	// Write with index

input		ftp_itt_rd_req_bf;
input		ftp_itd_rd_req_bf;
input		mbi_wdata_6;
input		mbi_wdata_0;
input [2:0] tlu_trap_pc_0_45_43;
input [2:0] tlu_trap_pc_1_45_43;

input  		lsu_asi_error_inject_b31;
input  		lsu_asi_error_inject_b29;
input  		lsu_asi_error_inject_b28;

input	[7:0]	tlu_itlb_bypass;
input	[7:0]	lsu_immu_enable;
input	[7:0]	ftp_itb_fetch_thr_bf;
input 		asi_real_bf;
input 	        ftp_ith_det_req_bf;

input           mbi_run;
input           lbist_run;
input           mbi_cambist_run ;
input           mbi_itb_demap_en ;
input  [1:0]    mbi_demap_type ;
input           mbi_dis_clr_ubit ;
input           mbi_repl_write ;
input           mbi_itb_cam_en_pre ;

input	        mbi_itb_write_en;
input	        mbi_itb_read_en;
input           itb_tte_data_v_27_22 ;
input           itb_tte_data_v_21_16 ;

output		scan_out;
output		itc_wr_u_en;		// Write enable
output		itc_rw_index_vld;	// Use index for read or write
output		itc_demap;		// Any demap
output		itc_demap_context;	// Demap context
output		itc_demap_all;		// Demap all
output		itc_demap_real;		// Demap real
output          itc_tte_ubit ;          // tte_ubit

output		itc_sel_trap_pc_0;	// Datapath controls
output		itc_sel_trap_pc_1;
output		itc_sel_demap_tag_d;
output		itc_sel_demap_tag_c0;
output		itc_sel_demap_tag_c1;
output		itc_sel_write_tag;
output		itc_sel_write_tag_indexed;
output		itc_sel_default;

output		itc_itlb_rd_vld_bf       ;
output 		itc_bypass_bf;

output		itc_ra_to_pa_bf;
output 	        itc_tag_error_inj;
output 	        itc_data_error_inj;

output          itc_dis_clr_ubit ;

output 	        itc_write_next;
output		itc_demap_next;
output 		itc_sel_mbist;
output 		itc_mbi_itb_read_en;
output [7:0]    itc_thr_to_write;
output 		itc_itb_data_sz_1;


//////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;

// Clock header
ifu_ftu_itc_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);





////////////////////////////////////////////////////////////////////////////////
//
//
//


ifu_ftu_itc_ctl_msff_ctl_macro__width_3 lsu_err_inj_sig_reg   (
	.scan_in(lsu_err_inj_sig_reg_scanin),
	.scan_out(lsu_err_inj_sig_reg_scanout),
	.din	({lsu_asi_error_inject_b31,
                  lsu_asi_error_inject_b29,
                  lsu_asi_error_inject_b28}	),
	.dout	({asi_error_inject_b31_ff,
                  asi_error_inject_b29_ff,
                  asi_error_inject_b28_ff}		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tag_error_inj  = asi_error_inject_b31_ff & asi_error_inject_b28_ff & wr_vld_in;
assign data_error_inj = asi_error_inject_b31_ff & asi_error_inject_b29_ff & wr_vld_in;

ifu_ftu_itc_ctl_msff_ctl_macro__width_2 error_inj_latch   (
        .scan_in(error_inj_latch_scanin),
        .scan_out(error_inj_latch_scanout),
        .din    ({    tag_error_inj,    data_error_inj  }),
        .dout   ({itc_tag_error_inj,itc_data_error_inj  }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//flop tlb_reload 

assign itc_sel_trap_pc_0 =
       tlu_itlb_reload[0] | reload[0];

assign itc_sel_trap_pc_1 =
       tlu_itlb_reload[1] | reload[1];

assign demap_next_in = (| tlu_itlb_reload[1:0] );
ifu_ftu_itc_ctl_msff_ctl_macro__width_3 reload0_latch   (
	.scan_in(reload0_latch_scanin),
	.scan_out(reload0_latch_scanout),
	.din	({tlu_itlb_reload[1:0], demap_next_in}	),
	.dout	({reload[1:0],itc_demap_next}		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign reload0 =
       (| reload[1:0]);


////////////////////////////////////////////////////
// TID logic                                      //
// Add logic here for timing reasons.             //
////////////////////////////////////////////////////

assign tlu_tte[37:35]     = itc_sel_trap_pc_0 ? tlu_trap_pc_0[37:35] : tlu_trap_pc_1[37:35] ;
assign tlu_tte_45_43[2:0] = itc_sel_trap_pc_0 ? tlu_trap_pc_0_45_43[2:0] : tlu_trap_pc_1_45_43[2:0] ;



ifu_ftu_itc_ctl_msff_ctl_macro__width_3 tte0_lat  (
        .scan_in(tte0_lat_scanin),
        .scan_out(tte0_lat_scanout),
        .din    (tlu_tte                [37:35] ),
        .dout   (tte0                   [37:35] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tte0_tid_dec[0] = ~tte0[37] & ~tte0[36]  & ~tte0[35] ;
assign tte0_tid_dec[1] = ~tte0[37] & ~tte0[36]  &  tte0[35] ;
assign tte0_tid_dec[2] = ~tte0[37] &  tte0[36]  & ~tte0[35] ;
assign tte0_tid_dec[3] = ~tte0[37] &  tte0[36]  &  tte0[35] ;
assign tte0_tid_dec[4] =  tte0[37] & ~tte0[36]  & ~tte0[35] ;
assign tte0_tid_dec[5] =  tte0[37] & ~tte0[36]  &  tte0[35] ;
assign tte0_tid_dec[6] =  tte0[37] &  tte0[36]  & ~tte0[35] ;
assign tte0_tid_dec[7] =  tte0[37] &  tte0[36]  &  tte0[35] ;

ifu_ftu_itc_ctl_msff_ctl_macro__width_8 tte1_lat  (
        .scan_in(tte1_lat_scanin),
        .scan_out(tte1_lat_scanout),
        .din    (tte0_tid_dec[7:0]),
        .dout   (tte1_tid_dec[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itc_thr_to_write[7:0] = thr_to_write_in[7:0] ;



assign thr_to_write_in[7:0] = ({8{ reload0}} & tte0_tid_dec[7:0]) |
                               ({8{~reload0}} & tte1_tid_dec[7:0]) ;


////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////
////////////////////////////////////////////////////



ifu_ftu_itc_ctl_msff_ctl_macro__width_3 demap_c0_reg   (
	.scan_in(demap_c0_reg_scanin),
	.scan_out(demap_c0_reg_scanout),
	.din	(tlu_tte_45_43[2:0]		),
	.dout	(demap_c0[2:0]		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_itc_ctl_msff_ctl_macro__width_3 demap_c1_reg   (
	.scan_in(demap_c1_reg_scanin),
	.scan_out(demap_c1_reg_scanout),
	.din	(demap_c0[2:0]		),
	.dout	(demap_c1[2:0]		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_itc_ctl_msff_ctl_macro__width_1 reload1_latch   (
	.scan_in(reload1_latch_scanin),
	.scan_out(reload1_latch_scanout),
	.din	(reload0		),
	.dout	(reload1		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// demap_control[2]:  1 means demap, 0 means write
// demap_control[1:0] (if demap_control[2] is 1)
//      00     Demap page
//      01     Demap context
//      10     Demap all 
//      11     Demap real
// demap_control[1:0] (if demap_control[2] is 0)
//      00     Demap and write with supplied context
//      01     Demap and write with context_0
//      10     Demap and write with context_1
//      11     Illegal (but demap and write with context_0)

assign wr_vld_in =
       reload1 & ~demap_c1[2];
		  
ifu_ftu_itc_ctl_msff_ctl_macro__width_5 wr_vld_latch   (
	.scan_in(wr_vld_latch_scanin),
	.scan_out(wr_vld_latch_scanout),
	.din	({wr_vld_in, mbi_dis_clr_ubit , mbi_repl_write, mbi_itb_cam_en_pre, itc_cam_vld_1}		),
	.dout	({wr_vld   , mbist_dis_clr_ubit_ff, itc_repl_wrire ,itc_cam_vld_1, itc_cam_vld_2}		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign itc_cam_vld_2_unused = itc_cam_vld_2 ; 

ifu_ftu_itc_ctl_msff_ctl_macro__width_9 bist_run_reg   (
	.scan_in(bist_run_reg_scanin),
	.scan_out(bist_run_reg_scanout),
	.din	({mbi_run,mbi_cambist_run, mbi_itb_demap_en,mbi_demap_type[1:0], 
                  mbi_itb_read_en,mbi_itb_write_en,mbi_wdata_6,mbi_wdata_0}),
	.dout	({itc_mbist_run,itc_cambist_run,itc_itb_demap_en,itc_demap_type[1:0],
                  itc_mbi_itb_read_en,itc_mbi_itb_write_en,itc_mbi_wdata_6,itc_mbi_wdata_0}	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign itc_tte_ubit_old =  (itc_mbist_run & ~itc_cambist_run) ? itc_mbi_wdata_0 : itc_mbi_wdata_6 ; 
assign itc_tte_ubit     = itc_tte_ubit_old | (~itc_cambist_run & ~itc_mbist_run) ;

assign demap_page =
       (reload1 & demap_c1[2] & ~demap_c1[1] & ~demap_c1[0]) |
       (reload1 & ~demap_c1[2]);

assign demap_context =
       reload1 & demap_c1[2] & ~demap_c1[1] &  demap_c1[0];

assign demap_all  =
       reload1 & demap_c1[2] &  demap_c1[1] & ~demap_c1[0];

assign demap_real =
       reload1 & demap_c1[2] &  demap_c1[1] &  demap_c1[0];

assign itc_sel_demap_tag_d_in = (reload0 &  demap_c0[2] & ~mbi_run) | 
                                (reload0 & ~demap_c0[2] & ~demap_c0[1] & ~mbi_run) ;

assign itc_sel_demap_tag_c0_in =  (reload0 & ~demap_c0[2] &  demap_c0[0] & ~mbi_run) ;

assign itc_sel_demap_tag_c1_in = 
       (reload0 & ~demap_c0[2] &  demap_c0[1] & ~demap_c0[0] & ~mbi_run) ;

ifu_ftu_itc_ctl_msff_ctl_macro__width_7 itc_sel_demap_reg   (
	.scan_in(itc_sel_demap_reg_scanin),
	.scan_out(itc_sel_demap_reg_scanout),
	.din	({itc_sel_demap_tag_d_in,
              itc_sel_demap_tag_c0_in,
              itc_sel_demap_tag_c1_in,
              itc_sel_write_tag_in,
              itc_sel_write_tag_indexed_in,
              itc_sel_default_in,
              itd_index_valid_in}	),
	.dout	({itc_sel_demap_tag_d,
              itc_sel_demap_tag_c0,
              itc_sel_demap_tag_c1,
              itc_sel_write_tag,
              itc_sel_write_tag_indexed,
              itc_sel_default,
              index_valid}		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itc_sel_write_tag_in = wr_vld_in & ~itd_index_valid_in & ~mbi_run;

assign itc_sel_write_tag_indexed_in = wr_vld_in & itd_index_valid_in & ~mbi_run;

assign itc_sel_mbist = itc_mbist_run ;
assign itc_sel_default_in = ~reload0 & ~wr_vld_in & ~mbi_run;

assign itc_write_next = wr_vld_in ;



///outputs

assign itc_demap                = (itc_mbist_run & itc_cambist_run) ? itc_itb_demap_en : (!itc_mbist_run & reload1);
assign itc_demap_page           = (itc_mbist_run & itc_cambist_run) ? (itc_itb_demap_en  & (itc_demap_type[1:0] == 2'b00)) : 
                                  (!itc_mbist_run & demap_page);
assign itc_demap_context        = (itc_mbist_run & itc_cambist_run) ? (itc_itb_demap_en  & (itc_demap_type[1:0] == 2'b10)) : 
                                  (!itc_mbist_run & demap_context);
assign itc_demap_all            = (itc_mbist_run & itc_cambist_run) ? (itc_itb_demap_en  & (itc_demap_type[1:0] == 2'b11)) : 
                                  (!itc_mbist_run & demap_all);
assign itc_demap_real           = (itc_mbist_run & itc_cambist_run) ? (itc_itb_demap_en  & (itc_demap_type[1:0] == 2'b01)) : 
                                  (!itc_mbist_run & demap_real);


assign itc_wr_u_en 		= (wr_vld & ~itc_mbist_run) | 
                                  (itc_mbi_itb_write_en & itc_mbist_run);

assign itc_rw_index_vld		= (wr_vld & index_valid & ~itc_mbist_run) | 
				  (ftp_itt_rd_req_bf  & ~itc_mbist_run) | 
                                  (ftp_itd_rd_req_bf  & ~itc_mbist_run) | 
                                  (itc_mbist_run & ~itc_repl_wrire) |
                                  lbist_run ;

assign itc_demap_page_unused = itc_demap_page ;


//////////////////////////////////////////////////////////////////////
// ITLB bypass control

ifu_ftu_itc_ctl_msff_ctl_macro__width_8 itlb_bypass_lat  (
	.scan_in(itlb_bypass_lat_scanin),
	.scan_out(itlb_bypass_lat_scanout),
	.din	(tlu_itlb_bypass	[7:0]	),
	.dout	(itlb_bypass		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_itc_ctl_msff_ctl_macro__width_8 immu_enable_lat  (
	.scan_in(immu_enable_lat_scanin),
	.scan_out(immu_enable_lat_scanout),
	.din	(lsu_immu_enable	[7:0]	),
	.dout	(immu_enable		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

       
   assign pre_bypass_bf[7:0] = ftp_ith_det_req_bf ? 8'h00 :
          itlb_bypass[7:0];

assign pre_ra_to_pa[7:0] = ftp_ith_det_req_bf ? {8{asi_real_bf}} :
       ~itlb_bypass[7:0] &~immu_enable[7:0];

assign itc_ra_to_pa_bf =
       (| (ftp_itb_fetch_thr_bf[7:0] & pre_ra_to_pa[7:0]));

assign itc_bypass_bf =
       (| (ftp_itb_fetch_thr_bf[7:0] & pre_bypass_bf[7:0])) & ~itc_mbist_run;


assign itc_itlb_rd_vld_bf          = (ftp_itt_rd_req_bf & ~itc_mbist_run) | 
                                     (ftp_itd_rd_req_bf & ~itc_mbist_run) | 
                                     (itc_mbi_itb_read_en & itc_mbist_run) ;

assign itc_itb_data_sz_1 = ~itb_tte_data_v_27_22 & itb_tte_data_v_21_16 ; 


///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ftu_itc_ctl_spare_ctl_macro__num_1 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign itc_dis_clr_ubit = itc_mbist_run & mbist_dis_clr_ubit_ff;

 

assign se = tcu_scan_en ;
// fixscan start:
assign lsu_err_inj_sig_reg_scanin = scan_in                  ;
assign error_inj_latch_scanin    = lsu_err_inj_sig_reg_scanout;
assign reload0_latch_scanin      = error_inj_latch_scanout  ;
assign tte0_lat_scanin           = reload0_latch_scanout    ;
assign tte1_lat_scanin           = tte0_lat_scanout         ;
assign demap_c0_reg_scanin       = tte1_lat_scanout         ;
assign demap_c1_reg_scanin       = demap_c0_reg_scanout     ;
assign reload1_latch_scanin      = demap_c1_reg_scanout     ;
assign wr_vld_latch_scanin       = reload1_latch_scanout    ;
assign bist_run_reg_scanin       = wr_vld_latch_scanout     ;
assign itc_sel_demap_reg_scanin  = bist_run_reg_scanout     ;
assign itlb_bypass_lat_scanin    = itc_sel_demap_reg_scanout;
assign immu_enable_lat_scanin    = itlb_bypass_lat_scanout  ;
assign spares_scanin             = immu_enable_lat_scanout  ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule	
	
	






// any PARAMS parms go into naming of macro

module ifu_ftu_itc_ctl_l1clkhdr_ctl_macro (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_3 (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_2 (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_8 (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_1 (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_5 (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_9 (
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

module ifu_ftu_itc_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_ftu_itc_ctl_spare_ctl_macro__num_1 (
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

