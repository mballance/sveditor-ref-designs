// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_evctag_dp.v
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
`define	IQ_SIZE	8
`define	OQ_SIZE	12
`define	TAG_WIDTH	28
`define	TAG_WIDTH_LESS1	27
`define	TAG_WIDTHr	28r
`define	TAG_WIDTHc	28c
`define	TAG_WIDTH6	22
`define	TAG_WIDTH6r	22r
`define	TAG_WIDTH6c	22c


`define	MBD_WIDTH	106    // BS and SR 11/12/03 N2 Xbar Packet format change

// BS and SR 11/12/03 N2 Xbar Packet format change

`define	MBD_ECC_HI	105
`define	MBD_ECC_HI_PLUS1	106
`define	MBD_ECC_HI_PLUS5	110
`define	MBD_ECC_LO	100
`define	MBD_EVICT	99 
`define	MBD_DEP		98
`define	MBD_TECC	97
`define	MBD_ENTRY_HI	96
`define	MBD_ENTRY_LO	93

`define	MBD_POISON	92   
`define	MBD_RDMA_HI	91
`define	MBD_RDMA_LO	90
`define	MBD_RQ_HI	89
`define	MBD_RQ_LO	85
`define	MBD_NC		84
`define	MBD_RSVD	83
`define	MBD_CP_HI	82
`define	MBD_CP_LO	80
`define	MBD_TH_HI	79
`define	MBD_TH_LO	77
`define	MBD_BF_HI	76
`define	MBD_BF_LO	74
`define	MBD_WY_HI	73
`define	MBD_WY_LO	72
`define	MBD_SZ_HI	71
`define	MBD_SZ_LO	64
`define	MBD_DATA_HI	63
`define	MBD_DATA_LO	0

// BS and SR 11/12/03 N2 Xbar Packet format change
`define	L2_FBF		40
`define	L2_MBF		39
`define	L2_SNP		38
`define	L2_CTRUE	37
`define	L2_EVICT  	36
`define	L2_DEP		35
`define	L2_TECC		34
`define	L2_ENTRY_HI	33
`define	L2_ENTRY_LO	29

`define	L2_POISON	28
`define	L2_RDMA_HI	27
`define	L2_RDMA_LO	26
// BS and SR 11/12/03 N2 Xbar Packet format change , maps to bits [128:104] of PCXS packet , ther than RSVD bit
`define	L2_RQTYP_HI	25
`define	L2_RQTYP_LO	21
`define	L2_NC		20
`define	L2_RSVD		19
`define	L2_CPUID_HI	18
`define	L2_CPUID_LO	16
`define	L2_TID_HI	15	
`define	L2_TID_LO	13	
`define	L2_BUFID_HI     12	
`define	L2_BUFID_LO	10	
`define	L2_L1WY_HI	9
`define	L2_L1WY_LO	8
`define	L2_SZ_HI	7
`define	L2_SZ_LO	0


`define	ERR_MEU		63
`define	ERR_MEC		62
`define	ERR_RW		61
`define	ERR_ASYNC	60
`define	ERR_TID_HI	59 // PRM needs to change to reflect this : TID will be bits [59:54] instead of [58:54]
`define	ERR_TID_LO	54
`define	ERR_LDAC	53
`define	ERR_LDAU	52
`define	ERR_LDWC	51
`define	ERR_LDWU	50
`define	ERR_LDRC	49
`define	ERR_LDRU	48
`define	ERR_LDSC	47
`define	ERR_LDSU	46
`define	ERR_LTC		45
`define	ERR_LRU		44
`define	ERR_LVU		43
`define	ERR_DAC		42
`define	ERR_DAU		41
`define	ERR_DRC		40
`define	ERR_DRU		39
`define	ERR_DSC		38
`define	ERR_DSU		37
`define	ERR_VEC		36
`define	ERR_VEU		35
`define ERR_LVC         34
`define	ERR_SYN_HI	31
`define	ERR_SYN_LO	0



`define ERR_MEND	51
`define ERR_NDRW	50
`define ERR_NDSP	49
`define ERR_NDDM	48
`define ERR_NDVCID_HI   45
`define ERR_NDVCID_LO   40
`define ERR_NDADR_HI    39
`define ERR_NDADR_LO    4


//  Phase 2 : SIU Inteface and format change

`define	JBI_HDR_SZ	26 // BS and SR 11/12/03 N2 Xbar Packet format change
`define	JBI_HDR_SZ_LESS1	25 // BS and SR 11/12/03 N2 Xbar Packet format change
`define	JBI_HDR_SZ4     23	
`define	JBI_HDR_SZc	27c
`define	JBI_HDR_SZ4c    23c	

`define	JBI_ADDR_LO	0	
`define	JBI_ADDR_HI	7	
`define	JBI_SZ_LO	8	
`define	JBI_SZ_HI	15	
// `define	JBI_RSVD	16	NOt used
`define	JBI_CTAG_LO	16	
`define	JBI_CTAG_HI	23	
`define	JBI_RQ_RD	24	
`define	JBI_RQ_WR8	25	
`define	JBI_RQ_WR64	26	
`define JBI_OPES_LO	27	// 0 = 30, P=29, E=28, S=27
`define JBI_OPES_HI	30
`define	JBI_RQ_POISON	31	
`define	JBI_ENTRY_LO	32
`define	JBI_ENTRY_HI	33

//  Phase 2 : SIU Inteface and format change
// BS and SR 11/12/03 N2 Xbar Packet format change :
`define	JBINST_SZ_LO	0	
`define	JBINST_SZ_HI	7	
// `define	JBINST_RSVD	8 NOT used	
`define	JBINST_CTAG_LO	8	
`define	JBINST_CTAG_HI	15	
`define	JBINST_RQ_RD	16	
`define	JBINST_RQ_WR8	17	
`define	JBINST_RQ_WR64	18	
`define JBINST_OPES_LO  19	// 0 = 22, P=21, E=20, S=19
`define JBINST_OPES_HI  22
`define	JBINST_ENTRY_LO	23
`define	JBINST_ENTRY_HI	24
`define	JBINST_POISON   25


`define	ST_REQ_ST	1
`define	LD_REQ_ST	2
`define	IDLE	0


 
 
//////////////////////////////////////////////////////////////////////// 
// Local header file includes / local defines 
// Change 4/7/2003: Added a pin, evctag_vuad_idx_c3 to the bottom. 
//////////////////////////////////////////////////////////////////////// 
 
module l2t_evctag_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  evctag_addr_px2, 
  evctag_mb_read_data, 
  scan_out, 
  evctag_evict_addr, 
  l2t_mcu_addr, 
  l2t_mcu_addr_5, 
  evctag_lkup_addr_c1, 
  evctag_mb_write_addr, 
  evctag_wb_write_addr, 
  evctag_vuad_idx_c3, 
  arbadr_ncu_l2t_pm_n_dist, 
  arbadr_2bnk_true_enbld_dist, 
  arbadr_4bnk_true_enbld_dist, 
  wb_read_data, 
  rdma_read_data, 
  mb_read_data, 
  fb_read_data, 
  arbadr_mbcam_addr_px2, 
  arbadr_mbcam_addr_px2_buff, 
  misbuf_buf_rd_en, 
  filbuf_buf_rd_en, 
  wb_read_en, 
  rdmat_read_en, 
  arbadr_arbdp_cam_addr_px2, 
  tagd_evict_tag_c4, 
  wbuf_wr_addr_sel, 
  wbuf_wb_or_rdma_wr_req_en, 
  misbuf_arb_l2rd_en, 
  misbuf_arb_mcurd_en, 
  filbuf_arb_l2rd_en, 
  arb_mux1_mbsel_px1, 
  arb_evict_c4, 
  l2clk, 
  scan_in, 
  mbdata_din_unbuf, 
  mbdata_din, 
  fbtag_din_unbuff, 
  fbtag_din, 
  l2t_mb2_run, 
  mbist_cam_sel, 
  l2t_mb2_wdata, 
  cam_mb2_rw_fail);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire [17:9] mbwr_idx_c2;
wire [15:9] mbrd_idx_c2;
wire arbadr_ncu_l2t_pm_n;
wire arbadr_4bnk_true_enbld;
wire arbadr_2bnk_true_enbld;
wire ff_read_mb_tag_reg_scanin;
wire ff_read_mb_tag_reg_scanout;
wire ff_read_fb_tag_reg_scanin;
wire ff_read_fb_tag_reg_scanout;
wire arb_mux1_mbsel_px1_n;
wire [39:0] evctag_addr_px2_unbuff;
wire mux1_mbsel_px2_1_n;
wire ff_mcu_read_addr_scanin;
wire ff_mcu_read_addr_scanout;
wire [39:5] mcu_read_addr_n;
wire wbuf_wr_addr_sel_n;
wire ff_wb_rdma_write_addr_scanin;
wire ff_wb_rdma_write_addr_scanout;
wire [39:6] mcu_wr_addr_n;
wire mcu_pick_d2_n;
wire [39:0] inst_addr_c1_fnl;
wire [41:9] arbadr_mbcam_addr_px2_reg;
wire l2t_mb2_run_r1_n_1;
wire ff_arbadr_mbcam_addr_px2_scanin;
wire ff_arbadr_mbcam_addr_px2_scanout;
wire ff_lkup_addr_c1_scanin;
wire ff_lkup_addr_c1_scanout;
wire ff_inst_addr_c2_scanin;
wire ff_inst_addr_c2_scanout;
wire [41:0] evctag_mb_write_addr_unbuff;
wire [7:0] l2t_mb2_wdata_r2;
wire l2t_mb2_run_r1_n;
wire l2t_mb2_run_r1;
wire ff_inst_addr_c3_scanin;
wire ff_inst_addr_c3_scanout;
wire misbuf_arb_mcurd_en_n;
wire ff_shifted_index_scanin;
wire ff_shifted_index_scanout;
wire [3:0] mbist_cam_sel_r1;
wire [3:0] mbist_cam_sel_r2;
wire [3:0] mbist_cam_sel_r3;
wire [3:0] mbist_cam_sel_r4;
wire l2t_mb2_run_n;
wire misbuf_buf_rd_en_r1;
wire [3:0] mbist_cam_sel_r5;
wire ff_inst_addr_c4_scanin;
wire ff_inst_addr_c4_scanout;
wire arb_evict_c4_n;
wire [39:0] evctag_wb_write_addr_fnl;
wire [7:0] l2t_mb2_wdata_r3;
wire cam_fail1;
wire [41:0] mbist_cam_read_data;
wire [41:0] mbist_cmp_read_data;
wire cam_fail2;
wire cam_mb2_rw_fail_raw;
wire rdmat_reads;
wire wb_reads;
wire fb_reads;
wire mb_reads;
wire read_enable_piped_1;
wire read_enable_piped;
wire read_enable_piped_r2_n;
wire read_enable_piped_r2;
wire ff_mbist_read_data_r1_scanin;
wire ff_mbist_read_data_r1_scanout;
wire [41:0] mbist_read_data;
wire [7:0] l2t_mb2_wdata_r5;
wire [41:0] mb_read_data_reg;
wire ff_mb_read_data_scanin;
wire ff_mb_read_data_scanout;
wire ff_l2t_mb2_wdata_scanin;
wire ff_l2t_mb2_wdata_scanout;
wire [7:0] l2t_mb2_wdata_r4;
wire ff_other_cam_match_scanin;
wire ff_other_cam_match_scanout;
wire read_enable_piped_r3_unused;
wire read_enable_piped_r1;
wire [7:0] l2t_mb2_wdata_r1;
 

input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;
input 		tcu_clk_stop;
 
output	[39:0]	evctag_addr_px2; 
output  [39:0]  evctag_mb_read_data;
output 		scan_out; 
output	[39:6]	evctag_evict_addr ; 	    // to the csr block 
output	[39:7]	l2t_mcu_addr; 
output          l2t_mcu_addr_5;
output	[39:7]	evctag_lkup_addr_c1; // address to lkup buffer tags. 
output	[41:0]	evctag_mb_write_addr;  
output	[39:0]	evctag_wb_write_addr; 
output	[8:0]	evctag_vuad_idx_c3; // Bottom. 

input          	arbadr_ncu_l2t_pm_n_dist; // BS 03/25/04 for partial bank/core modes support
input           arbadr_2bnk_true_enbld_dist;// BS 03/25/04 for partial bank/core modes support
input           arbadr_4bnk_true_enbld_dist; // BS 03/25/04 for partial bank/core modes support

input	[39:0]	wb_read_data ; // wr address from wb 
input	[39:0]	rdma_read_data; // wr address from rdmawb 
input	[41:0]	mb_read_data; 
input	[39:0]	fb_read_data; 
input	[41:7]	arbadr_mbcam_addr_px2; 
output	[41:7]	arbadr_mbcam_addr_px2_buff; 

input		misbuf_buf_rd_en;
input		filbuf_buf_rd_en;
input		wb_read_en;
input		rdmat_read_en;


//input	[31:0]	mb_cam_match;
//input	[7:0]	wb_cam_match_c2;
//input	[7:0]	fb_cam_match;
//input	[7:0]	rdmat_cam_match_c2;

 
input	[39:0]	arbadr_arbdp_cam_addr_px2; 
input	[`TAG_WIDTH-1:6] tagd_evict_tag_c4; 
 
input		wbuf_wr_addr_sel ; // sel wb_read_data 
input		wbuf_wb_or_rdma_wr_req_en ; // enable wr addr flop. 
input		misbuf_arb_l2rd_en; 
input		misbuf_arb_mcurd_en; 
input		filbuf_arb_l2rd_en; 
input		arb_mux1_mbsel_px1; // from arb 
input		arb_evict_c4;// from arb. 
 
input   	l2clk;  
input 		scan_in; 


// 

input	[127:64]  mbdata_din_unbuf;
output	[127:64]  mbdata_din;
input	[39:0]	fbtag_din_unbuff;
output	[39:0]	fbtag_din;


// for the sake of mbist
//input	[39:6]	rdmatag_wr_addr_s2;
//input	[127:0]	mb_data_read_data;


//output [41:0]	mbist_cam_read_data;

input		l2t_mb2_run;
input	[3:0]	mbist_cam_sel;
//input	[1:0]	mbdata_cmp_sel;
input	[7:0]	l2t_mb2_wdata;
output		cam_mb2_rw_fail;
//output		cam_mb2_cam_fail;



assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;


//assign scan_out = 1'b0;

wire	[39:7]	l2t_mcu_addr_muxout;
wire		l2t_mcu_addr_5_muxout;
wire    [23:0]  evct_addr_39_16;
wire	[39:0]	mbf_addr_px2, fbf_addr_px2; 
wire		mcu_pick_d2; 
wire	[39:6]	evict_rd_data; 
wire	[39:6]	mcu_wr_addr; 
wire	[39:5]	mcu_read_addr; 
 
 
wire	[39:0]	inst_addr_c1;  
wire	[39:0]	inst_addr_c2, inst_addr_c3; 
wire	[39:0] inst_addr_c4; 
wire	[39:0] evict_addr_c4; 
wire	mux1_mbsel_px2_1; 
wire	mux1_mbsel_px2_2; 
wire	mux1_mbsel_px2_3; 
wire	mux1_mbsel_px2_4; 
////////////////////////////// 
// Arb mux between MB and FB 
////////////////////////////// 

//mux_macro mux_mbrd_mbwr_idx_c2 (width=16,ports=3,mux=aonpe,stack=16r,dmux=8x)
//        (
//	.dout ({mbwr_idx_c2[17:9],mbrd_idx_c2[15:9]}),
//        .din0({inst_addr_c2[17:9],mb_read_data[15:9]}), // original idx , all banks enabled
//        .din1({inst_addr_c2[16:8],mb_read_data[16:10]}), // 1 bit shifted idx for 4 banks enabled
//        .din2({inst_addr_c2[15:7],mb_read_data[17:11]}), //2 bit shifted idx for 2 banks enabled
//        .sel0(arbadr_ncu_l2t_pm_n),
//        .sel1(arbadr_4bnk_true_enbld),
//        .sel2(arbadr_2bnk_true_enbld)
//        );
//

l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_42r__width_40 mux_mbrdwridx_evict_addr_c4 
	(
	.dout	({mbwr_idx_c2[17:9],mbrd_idx_c2[15:9],evct_addr_39_16[23:0]}),
	.din0	({inst_addr_c2[17:9],mb_read_data[15:9],tagd_evict_tag_c4[`TAG_WIDTH-1:6],inst_addr_c4[17:16]}),
	.din1	({inst_addr_c2[16:8],mb_read_data[16:10],1'b0,tagd_evict_tag_c4[`TAG_WIDTH-1:6],inst_addr_c4[16]}),
	.din2	({inst_addr_c2[15:7],mb_read_data[17:11],2'b0,tagd_evict_tag_c4[`TAG_WIDTH-1:6]}),
	.sel0(arbadr_ncu_l2t_pm_n),
        .sel1(arbadr_4bnk_true_enbld),
        .sel2(arbadr_2bnk_true_enbld)
	);

//assign evctag_mb_read_data = {mb_read_data[41:18],mbrd_idx_c2[15:9],mb_read_data[8:0]};

l2t_evctag_dp_buff_macro__dbuff_16x__stack_42r__width_40 buff_evctag_mb_read_data 
	(
	.dout	(evctag_mb_read_data[39:0]),
	.din	({mb_read_data[41:18],mbrd_idx_c2[15:9],mb_read_data[8:0]})
	);


l2t_evctag_dp_msff_macro__stack_42r__width_40 ff_read_mb_tag_reg 
        (
	.scan_in(ff_read_mb_tag_reg_scanin),
	.scan_out(ff_read_mb_tag_reg_scanout),
	.din	(evctag_mb_read_data[39:0]), 
	.clk	(l2clk), 
	.dout	(mbf_addr_px2[39:0]), 
	.en	(misbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 


l2t_evctag_dp_msff_macro__stack_42r__width_40 ff_read_fb_tag_reg 
        (
	.scan_in(ff_read_fb_tag_reg_scanin),
	.scan_out(ff_read_fb_tag_reg_scanout),
	.din	(fb_read_data[39:0]), 
	.clk	(l2clk), 
	.dout	(fbf_addr_px2[39:0]), 
	.en 	(filbuf_arb_l2rd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 


// Change 6/12/2003:  
// -created 4 sets fo selects for the evctag_addr_px2 mux. 
// -in the implementation, invert the data before muxing, 
//  use a 2x or 4x mux and drive the output of the mux 
// with a 40x driver. 
 

l2t_evctag_dp_inv_macro__width_1 inv_mux1_mbsel_px2_1  (
        .dout   (arb_mux1_mbsel_px1_n),
        .din    (arb_mux1_mbsel_px1 )
        );

l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_40 mux_mux1_addr_px2 
       (
       .dout   	(evctag_addr_px2_unbuff[39:0]) ,
       .din0 	(mbf_addr_px2[39:0]),
       .din1   	(fbf_addr_px2[39:0] ),
       .sel0 	(mux1_mbsel_px2_1),
       .sel1   	(mux1_mbsel_px2_1_n)
       );

l2t_evctag_dp_buff_macro__dbuff_16x__stack_42r__width_40 buff_evctag_addr_px2 
	(
	.dout	(evctag_addr_px2[39:0]) ,
	.din	(evctag_addr_px2_unbuff[39:0])
	);

////////////////////////////// 
// mcu read addr flop. 
////////////////////////////// 
 
 
l2t_evctag_dp_msffi_macro__dmsffi_32x__stack_42r__width_35 ff_mcu_read_addr 
        (
	.din(evctag_mb_read_data[39:5]), 
	.scan_in(ff_mcu_read_addr_scanin),
	.scan_out(ff_mcu_read_addr_scanout),
	.clk(l2clk), 
	.dout_l(mcu_read_addr_n[39:5]), 
	.en(misbuf_arb_mcurd_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	);



 
////////////////////////////// 
// MUX Between RDMA and WB addresses. 
// and wr addr flop 
////////////////////////////// 

l2t_evctag_dp_inv_macro__width_1 wbuf_wr_addr_sel_inv_slice  
	(
        .dout   (wbuf_wr_addr_sel_n),
        .din    (wbuf_wr_addr_sel )
        );

 
l2t_evctag_dp_mux_macro__mux_aonpe__ports_2__stack_42r__width_34 rdmawb_addr_mux 
	( 
	.dout 	(evict_rd_data[39:6]), 
        .din0	(rdma_read_data[39:6]), // rdma evict addr 
        .din1	(wb_read_data[39:6]), // wb evict addr 
        .sel0	(wbuf_wr_addr_sel_n), // sel rdma evict addr 
        .sel1	(wbuf_wr_addr_sel) // sel wb evict addr. 
	);
 
l2t_evctag_dp_msffi_macro__dmsffi_32x__stack_42r__width_34 ff_wb_rdma_write_addr 
        (
	.din	(evict_rd_data[39:6]),  
	.scan_in(ff_wb_rdma_write_addr_scanin),
	.scan_out(ff_wb_rdma_write_addr_scanout),
	.clk	(l2clk), 
	.dout_l	(mcu_wr_addr_n[39:6]), 
	.en	(wbuf_wb_or_rdma_wr_req_en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	);

 
// assign   evctag_evict_addr  =  mcu_wr_addr[39:6] ; 

//buff_macro buff_evctag_evict_addr (width=34,dbuff=32x,stack=42r)
l2t_evctag_dp_inv_macro__dinv_32x__stack_42r__width_34 buff_evctag_evict_addr 
	(
	.dout	(evctag_evict_addr[39:6]),
	.din	(mcu_wr_addr_n[39:6])
	);
 
//// ctl flop. This flop is here for timing reasons. 
//msff_macro ff_mcu_pick_d2 (width=1,stack=1r)
//                (
//		.scan_in(ff_mcu_pick_d2_scanin),
//		.scan_out(ff_mcu_pick_d2_scanout),
//		.din	(misbuf_arb_mcurd_en), 
//		.clk	(l2clk), 
//                .dout	(mcu_pick_d2), 
//		.en	(1'b1), 
//		); 
 
////////////////////////////// 
// Addr to DRAM 
////////////////////////////// 

//inv_macro mcu_pick_d2_inv_slice (width=1) 
//	(
//	.dout	(mcu_pick_d2_n),
//	.din	(mcu_pick_d2)
//	);

l2t_evctag_dp_buff_macro__dbuff_32x__stack_42r__width_35 buff_arbadr_mbcam_addr_px2 
      (
      .dout   (arbadr_mbcam_addr_px2_buff[41:7]),
      .din    (arbadr_mbcam_addr_px2[41:7])
      );

l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_34 mcu_addr_mux 
	( 
	.dout 	({l2t_mcu_addr_muxout[39:7],l2t_mcu_addr_5_muxout}), 
	.din0	({mcu_read_addr_n[39:7],mcu_read_addr_n[5]}), 
        .din1	({mcu_wr_addr_n[39:7],1'b1}), 
        .sel0	(mcu_pick_d2), 
        .sel1	(mcu_pick_d2_n)
	); 


l2t_evctag_dp_inv_macro__dinv_32x__stack_34r__width_34 inv1_l2t_mcu_addr  
        (
        .dout   ({l2t_mcu_addr[39:7],l2t_mcu_addr_5}),
        .din   ({l2t_mcu_addr_muxout[39:7],l2t_mcu_addr_5_muxout})
        );

 
////////////////////////////// 
// CAM addresses. 
// mb write addr. 
// wb write addr. 
////////////////////////////// 

l2t_evctag_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_42r__width_40  mux_mbist_lookup_c1 
        (
        .dout   (inst_addr_c1[39:0]),
        .din0   (inst_addr_c1_fnl[39:0]),
        // .din1   ({arbadr_mbcam_addr_px2[41:9],7'b0}),
        .din1   ({arbadr_mbcam_addr_px2_reg[41:9],7'b0}),
        .sel0   (l2t_mb2_run_r1_n_1)
        //.sel1   (l2t_mb2_run_r1)
        );

 
l2t_evctag_dp_msff_macro__stack_42r__width_33 ff_arbadr_mbcam_addr_px2 
        (
	.scan_in(ff_arbadr_mbcam_addr_px2_scanin),
	.scan_out(ff_arbadr_mbcam_addr_px2_scanout),
	.din	(arbadr_mbcam_addr_px2[41:9]), 
    .clk    (l2clk),
    .dout	(arbadr_mbcam_addr_px2_reg[41:9]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
l2t_evctag_dp_msff_macro__stack_42r__width_40 ff_lkup_addr_c1 
        (
	.scan_in(ff_lkup_addr_c1_scanin),
	.scan_out(ff_lkup_addr_c1_scanout),
	.din	(arbadr_arbdp_cam_addr_px2[39:0]), 
        .clk    (l2clk),
        .dout	(inst_addr_c1_fnl[39:0]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
assign	evctag_lkup_addr_c1[39:7]  = inst_addr_c1[39:7] ; 

//buff_macro buff_evctag_lkup_addr_c1 (width=33,dbuff=32x,stack=42r)
//	(
//	.dout	(evctag_lkup_addr_c1[39:7]),
//	.din	(inst_addr_c1[39:7])
//	);
//
 
l2t_evctag_dp_msff_macro__dmsff_32x__stack_42r__width_40 ff_inst_addr_c2 
        (	
	.scan_in(ff_inst_addr_c2_scanin),
	.scan_out(ff_inst_addr_c2_scanout),
	.din	(inst_addr_c1[39:0]), 
	.clk	(l2clk), 
        .dout	(inst_addr_c2[39:0]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 

// assign evctag_mb_write_addr = {inst_addr_c2[39:16],mbwr_idx_c2[17:9],inst_addr_c2[8:0]};

l2t_evctag_dp_buff_macro__dbuff_16x__stack_42r__width_42 buff_evctag_mb_write_addr 
        (
        .dout   (evctag_mb_write_addr[41:0]),
//        .din    ({inst_addr_c2[39:16],mbwr_idx_c2[17:9],inst_addr_c2[8:0]})
	.din	(evctag_mb_write_addr_unbuff[41:0])
        );

l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_42  mux_mb_write_addr  
        (
        .dout   (evctag_mb_write_addr_unbuff[41:0]),
        .din0   ({inst_addr_c2[39:16],mbwr_idx_c2[17:9],inst_addr_c2[8:0]}),
        .din1   ({l2t_mb2_wdata_r2[1:0],{5{l2t_mb2_wdata_r2[7:0]}}}),
        .sel0   (l2t_mb2_run_r1_n),
        .sel1   (l2t_mb2_run_r1)
	);


l2t_evctag_dp_msff_macro__stack_42r__width_40 ff_inst_addr_c3 
        (
	.scan_in(ff_inst_addr_c3_scanin),
	.scan_out(ff_inst_addr_c3_scanout),
	.din	(inst_addr_c2[39:0]), 
	.clk	(l2clk), 
        .dout	(inst_addr_c3[39:0]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
		); 

l2t_evctag_dp_inv_macro__width_1 inv_misbuf_arb_mcurd_en 
	(
	.dout	(misbuf_arb_mcurd_en_n),
	.din	(misbuf_arb_mcurd_en)
	);

l2t_evctag_dp_msff_macro__dmsff_32x__stack_42r__width_40 ff_shifted_index 
        (
        .scan_in(ff_shifted_index_scanin),
        .scan_out(ff_shifted_index_scanout),
        .din    ({misbuf_buf_rd_en,mbist_cam_sel[3:0],mbist_cam_sel_r1[3:0],mbist_cam_sel_r2[3:0],mbist_cam_sel_r3[3:0],
        mbist_cam_sel_r4[3:0],l2t_mb2_run,l2t_mb2_run_n, l2t_mb2_run_n,
		misbuf_arb_mcurd_en_n,misbuf_arb_mcurd_en,arb_mux1_mbsel_px1,arb_mux1_mbsel_px1_n,
		arbadr_ncu_l2t_pm_n_dist,arbadr_4bnk_true_enbld_dist,arbadr_2bnk_true_enbld_dist,mbwr_idx_c2[17:9]}),
        .clk    (l2clk),
        .dout   ({misbuf_buf_rd_en_r1,mbist_cam_sel_r1[3:0],mbist_cam_sel_r2[3:0],mbist_cam_sel_r3[3:0],mbist_cam_sel_r4[3:0],
        mbist_cam_sel_r5[3:0],l2t_mb2_run_r1,l2t_mb2_run_r1_n,l2t_mb2_run_r1_n_1,
		mcu_pick_d2_n,mcu_pick_d2,mux1_mbsel_px2_1,mux1_mbsel_px2_1_n,
		arbadr_ncu_l2t_pm_n,arbadr_4bnk_true_enbld,arbadr_2bnk_true_enbld,evctag_vuad_idx_c3[8:0]}),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);


l2t_evctag_dp_msff_macro__stack_42r__width_40 ff_inst_addr_c4 
        (
	.scan_in(ff_inst_addr_c4_scanin),
	.scan_out(ff_inst_addr_c4_scanout),
	.din	(inst_addr_c3[39:0]),
	.clk	(l2clk), 
        .dout	(inst_addr_c4[39:0]),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 
 
//assign	evict_addr_c4[39:18] = tagd_evict_tag_c4[`TAG_WIDTH-1:6] ; 
//assign	evict_addr_c4[17:6] = inst_addr_c4[17:6] ; 
//assign  evict_addr_c4[5:0] = 6'b0 ; 

// fix for bug 93448 : tag read from tag array on evict needs to be shifted around to
// original address before being sent to MCU

//mux_macro mux_evict_addr_c4 (width=24,ports=3,mux=aonpe,stack=24r,dmux=8x)
//        (
//        .dout (evct_addr_39_16[23:0]),
//        .din0({tagd_evict_tag_c4[`TAG_WIDTH-1:6],inst_addr_c4[17:16]}), // original idx , all banks enabled
//        .din1({1'b0,tagd_evict_tag_c4[`TAG_WIDTH-1:6],inst_addr_c4[16]}), // 1 bit shifted idx for 4 banks enabled
//        .din2({2'b0,tagd_evict_tag_c4[`TAG_WIDTH-1:6]}), //2 bit shifted idx for 2 banks enabled
//        .sel0(arbadr_ncu_l2t_pm_n),
//        .sel1(arbadr_4bnk_true_enbld),
//        .sel2(arbadr_2bnk_true_enbld)
//        );
//

l2t_evctag_dp_buff_macro__dbuff_16x__stack_42r__width_40 buff_evict_addr_c4 
	(
	.dout	(evict_addr_c4[39:0]),
	.din	({evct_addr_39_16[23:0],inst_addr_c4[15:6],6'b0})
	);



l2t_evctag_dp_inv_macro__width_1 arb_evict_c4invert_slice  
	(
	.dout	(arb_evict_c4_n),
	.din	(arb_evict_c4)
	);
 


l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_40  mux_wbtag 
        (
        .dout   (evctag_wb_write_addr[39:0]),
        .din0   (evctag_wb_write_addr_fnl[39:0]),
        .din1   ({5{l2t_mb2_wdata_r3[7:0]}}),
        .sel0   (l2t_mb2_run_r1_n),
        .sel1   (l2t_mb2_run_r1)
        );


l2t_evctag_dp_mux_macro__mux_aonpe__ports_2__stack_42r__width_40 mux_wbb_wraddr_c3 
	( 
	.dout 	(evctag_wb_write_addr_fnl[39:0]), 
        .din0	(inst_addr_c4[39:0]), 
	.din1	(evict_addr_c4[39:0]), 
        .sel0	(arb_evict_c4_n), 
	.sel1	(arb_evict_c4)
	); 

 
////////////////////////////////////////////////////////////
// MBIST SIGNALS
////////////////////////////////////////////////////////////

l2t_evctag_dp_cmp_macro__dcmp_8x__width_32 cmp_cam_data_compare 
	(
	.dout 	(cam_fail1),
	.din0	(mbist_cam_read_data[31:0]),
	.din1	(mbist_cmp_read_data[31:0])
	);


l2t_evctag_dp_cmp_macro__dcmp_8x__width_16 cmp_cam_data_compare1 
        (
        .dout   (cam_fail2),
        .din0   ({6'b0,mbist_cam_read_data[41:32]}),
        .din1   ({6'b0,mbist_cmp_read_data[41:32]})
        );

l2t_evctag_dp_and_macro__ports_2__width_1 and_cam_fail_out 
	(
	.dout	(cam_mb2_rw_fail_raw),
	.din0	(cam_fail1),
	.din1	(cam_fail2)
	);


//msff_macro ff_mbist_cam_sel (width=8)
//	(
//	.scan_in(ff_mbist_cam_sel_scanin),
//	.scan_out(ff_mbist_cam_sel_scanout),
//	.dout	({mbist_cam_sel_r1[3:0],mbist_cam_sel_r2[3:0]}),
//	.din	({mbist_cam_sel[3:0],mbist_cam_sel_r1[3:0]}),
//	.clk	(l2clk),
//	.en 	(1'b1),
//	);
//
//
//assign read_enable_piped = (misbuf_buf_rd_en & mbist_cam_sel[0] ) | 
//			   (filbuf_buf_rd_en & mbist_cam_sel[1] ) |
//			   (wb_read_en       & mbist_cam_sel[2] ) | 
//			   (rdmat_read_en    & mbist_cam_sel[3] );

l2t_evctag_dp_and_macro__ports_2__width_4 and_mbreads 
	(
	.dout	({rdmat_reads,wb_reads,fb_reads,mb_reads}),
	.din0	(mbist_cam_sel_r2[3:0]),
	.din1	({rdmat_read_en,wb_read_en,filbuf_buf_rd_en,misbuf_buf_rd_en_r1})
	);
l2t_evctag_dp_or_macro__ports_3__width_1 or_read_enable_piped 
	(
	.dout	(read_enable_piped_1),
	.din0	(mb_reads),
	.din1	(fb_reads),
	.din2	(wb_reads)
	);

l2t_evctag_dp_or_macro__ports_2__width_1 or_read_enable_piped1 
        (
        .dout   (read_enable_piped),
        .din0   (read_enable_piped_1),
        .din1   (rdmat_reads)
	);



//assign read_enable_piped_r2_n = ~read_enable_piped_r2;

l2t_evctag_dp_inv_macro__width_1 inv_read_enable_piped_r2 
	(
	.dout	(read_enable_piped_r2_n),
	.din	(read_enable_piped_r2)
	);

l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_1 mux_rw_failsignal 
	(
	.dout	(cam_mb2_rw_fail),
	.din0	(cam_mb2_rw_fail_raw),
	.din1	(1'b1),
	.sel0	(read_enable_piped_r2),
	.sel1	(read_enable_piped_r2_n)
	);

l2t_evctag_dp_msff_macro__stack_42r__width_42  ff_mbist_read_data_r1  
	(
	.scan_in(ff_mbist_read_data_r1_scanin),
	.scan_out(ff_mbist_read_data_r1_scanout),
	.dout	(mbist_cam_read_data[41:0]),
	.din	(mbist_read_data[41:0]),
	.clk	(l2clk),
	.en (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

l2t_evctag_dp_mux_macro__mux_aonpe__ports_4__stack_42r__width_42 mux_read_comp_all_cams 
        (
        .dout   (mbist_cmp_read_data[41:0]),
        .din0   ({l2t_mb2_wdata_r5[1:0],{5{l2t_mb2_wdata_r5[7:0]}}}),
        .din1   ({2'b0,{5{l2t_mb2_wdata_r5[7:0]}}}),
        .din2   ({2'b0,{5{l2t_mb2_wdata_r5[7:0]}}}),
        .din3   ({2'b0,{l2t_mb2_wdata_r5[1:0],{4{l2t_mb2_wdata_r5[7:0]}}},6'b0}),
        .sel0   (mbist_cam_sel_r5[0]),
        .sel1   (mbist_cam_sel_r5[1]),
        .sel2   (mbist_cam_sel_r5[2]),
        .sel3   (mbist_cam_sel_r5[3])
        );

l2t_evctag_dp_mux_macro__mux_aonpe__ports_4__stack_42r__width_42 mux_read_all_cams 
        (
        .dout   (mbist_read_data[41:0]),
        .din0   (mb_read_data_reg[41:0]),
        .din1   ({2'b0,fb_read_data[39:0]}),
        .din2   ({2'b0,wb_read_data[39:0]}),
        .din3   ({2'b0,rdma_read_data[39:0]}),
        .sel0   (mbist_cam_sel_r4[0]),
        .sel1   (mbist_cam_sel_r4[1]),
        .sel2   (mbist_cam_sel_r4[2]),
        .sel3   (mbist_cam_sel_r4[3])
        );


l2t_evctag_dp_msff_macro__stack_42r__width_42  ff_mb_read_data  
        (
        .scan_in(ff_mb_read_data_scanin),
        .scan_out(ff_mb_read_data_scanout),
        .dout   (mb_read_data_reg[41:0]),
        .din    (mb_read_data[41:0]),
        .clk    (l2clk),
        .en 	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



//
//msff_macro  ff_mb_cam_match  (width=40,stack=42r)
//        (
//        .scan_in(ff_mb_cam_match_scanin),
//        .scan_out(ff_mb_cam_match_scanout),
//        .dout   ({mb_cam_match_reg[31:0],
//		  l2t_mb2_wdata_r3[7:0]}),
//        .din    ({mb_cam_match[31:0],
//		  l2t_mb2_wdata_r2[7:0]}),
//        .clk    (l2clk),
//        .en 	(1'b1)
//        );
//

l2t_evctag_dp_msff_macro__stack_42r__width_24  ff_l2t_mb2_wdata  
        (
        .scan_in(ff_l2t_mb2_wdata_scanin),
        .scan_out(ff_l2t_mb2_wdata_scanout),
        .dout   ({l2t_mb2_wdata_r3[7:0],l2t_mb2_wdata_r4[7:0],l2t_mb2_wdata_r5[7:0]}),
        .din    ({l2t_mb2_wdata_r2[7:0],l2t_mb2_wdata_r3[7:0],l2t_mb2_wdata_r4[7:0]}),
        .clk    (l2clk),
        .en 	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

//buff_macro other_cam_match_minbuff (width=24,stack=46r,minbuff=1) (
//  .din ({rdmat_cam_match_c2[7:0],    fb_cam_match[7:0],    wb_cam_match_c2[7:0]}),
//  .dout({rdmat_cam_match_c2_buf[7:0],fb_cam_match_buf[7:0],wb_cam_match_c2_buf[7:0]}));
//
//
l2t_evctag_dp_msff_macro__stack_46r__width_19  ff_other_cam_match  
        (
        .scan_in(ff_other_cam_match_scanin),
        .scan_out(ff_other_cam_match_scanout),
        .dout   ({read_enable_piped_r3_unused,read_enable_piped_r2,read_enable_piped_r1,
		  l2t_mb2_wdata_r2[7:0],l2t_mb2_wdata_r1[7:0]}),
        .din    ({read_enable_piped_r2,read_enable_piped_r1,read_enable_piped,
		  l2t_mb2_wdata_r1[7:0],l2t_mb2_wdata[7:0]}),
        .clk    (l2clk),
        .en 	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

//
//mux_macro mux_cam_all_cams (width=32,ports=4,mux=aonpe,stack=42r,dmux=8x)
//        (
//        .dout   (mbist_cam_out[31:0]),
//        .din0   (mb_cam_match_reg[31:0]),
//        .din1   ({24'b0,fb_cam_match_reg[7:0]}),
//        .din2   ({24'b0,wb_cam_match_c2_reg[7:0]}),
//        .din3   ({24'b0,rdmat_cam_match_c2_reg[7:0]}),
//        .sel0   (mbist_cam_sel_r2[0]),
//        .sel1   (mbist_cam_sel_r2[1]),
//        .sel2   (mbist_cam_sel_r2[2]),
//        .sel3   (mbist_cam_sel_r2[3])
//        );
//
//cmp_macro cmp_cam_data (width=32)
//	(
//	.dout	(cam_mb2_cam_fail),
//	.din0	(mbist_cam_out[31:0]),
//	.din1	({4{l2t_mb2_wdata[7:0]}})
//	);
//
//
//
//   Buffered outputs
//
//
l2t_evctag_dp_inv_macro__dinv_32x__width_1 inv_l2t_mb2_run_r1  (
        .dout   (l2t_mb2_run_n),
        .din    (l2t_mb2_run)
        );

//mux_macro  mux_mbdata0 (width=32,stack=42r,mux=pgpe,ports=2,dmux=32x)
//        (
//        .dout   (mbdata_din[31:0]),
//        .din0   (mbdata_din_unbuf[31:0]),
//        .din1   ({4{l2t_mb2_wdata_r2[7:0]}}),
//        .sel0   (l2t_mb2_run_r1_n),
//        );
//mux_macro  mux_mbdata1 (width=32,stack=42r,mux=pgpe,ports=2,dmux=32x)
//        (
//        .dout   (mbdata_din[63:32]),
//        .din0   (mbdata_din_unbuf[63:32]),
//        .din1   ({4{l2t_mb2_wdata_r2[7:0]}}),
//        .sel0   (l2t_mb2_run_r1_n),
//        );

l2t_evctag_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_42r__width_32  mux_mbdata2 
        (
        .dout   (mbdata_din[95:64]),
        .din0   (mbdata_din_unbuf[95:64]),
        .din1   ({4{l2t_mb2_wdata_r2[7:0]}}),
        .sel0   (l2t_mb2_run_r1_n)
        );

l2t_evctag_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_42r__width_32  mux_mbdata3 
        (
        .dout   (mbdata_din[127:96]),
        .din0   (mbdata_din_unbuf[127:96]),
        .din1   ({4{l2t_mb2_wdata_r2[7:0]}}),
        .sel0   (l2t_mb2_run_r1_n)
        );


l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_40  mux_fbtag 
        (
        .dout   (fbtag_din[39:0]),
        .din0   (fbtag_din_unbuff[39:0]),
	.din1	({5{l2t_mb2_wdata_r3[7:0]}}),
	.sel0	(l2t_mb2_run_r1_n),
	.sel1	(l2t_mb2_run_r1)
	);


 
 
// fixscan start:
assign ff_read_mb_tag_reg_scanin = scan_in                  ;
assign ff_read_fb_tag_reg_scanin = ff_read_mb_tag_reg_scanout;
assign ff_mcu_read_addr_scanin   = ff_read_fb_tag_reg_scanout;
assign ff_wb_rdma_write_addr_scanin = ff_mcu_read_addr_scanout ;
assign ff_arbadr_mbcam_addr_px2_scanin = ff_wb_rdma_write_addr_scanout;
assign ff_lkup_addr_c1_scanin    = ff_arbadr_mbcam_addr_px2_scanout;
assign ff_inst_addr_c2_scanin    = ff_lkup_addr_c1_scanout  ;
assign ff_inst_addr_c3_scanin    = ff_inst_addr_c2_scanout  ;
assign ff_shifted_index_scanin   = ff_inst_addr_c3_scanout  ;
assign ff_inst_addr_c4_scanin    = ff_shifted_index_scanout ;
assign ff_mbist_read_data_r1_scanin = ff_inst_addr_c4_scanout  ;
assign ff_mb_read_data_scanin    = ff_mbist_read_data_r1_scanout;
assign ff_l2t_mb2_wdata_scanin   = ff_mb_read_data_scanout  ;
assign ff_other_cam_match_scanin = ff_l2t_mb2_wdata_scanout ;
assign scan_out                  = ff_other_cam_match_scanout;
// fixscan end:
endmodule 


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_3__stack_42r__width_40 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [39:0] din0;
  input sel0;
  input [39:0] din1;
  input sel1;
  input [39:0] din2;
  input sel2;
  output [39:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(40)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
  .in2(din2[39:0]),
.dout(dout[39:0])
);









  



endmodule


//
//   buff macro
//
//





module l2t_evctag_dp_buff_macro__dbuff_16x__stack_42r__width_40 (
  din, 
  dout);
  input [39:0] din;
  output [39:0] dout;






buff #(40)  d0_0 (
.in(din[39:0]),
.out(dout[39:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msff_macro__stack_42r__width_40 (
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
wire [38:0] so;

  input [39:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [39:0] dout;


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
dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_evctag_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_40 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [39:0] din0;
  input sel0;
  input [39:0] din1;
  input sel1;
  output [39:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(40)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msffi_macro__dmsffi_32x__stack_42r__width_35 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [33:0] so;

  input [34:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [34:0] dout_l;


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
msffi_dp #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q_l(dout_l[34:0])
);



















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__mux_aonpe__ports_2__stack_42r__width_34 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [33:0] din0;
  input sel0;
  input [33:0] din1;
  input sel1;
  output [33:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(34)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[33:0]),
  .in1(din1[33:0]),
.dout(dout[33:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msffi_macro__dmsffi_32x__stack_42r__width_34 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout_l;


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
msffi_dp #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q_l(dout_l[33:0])
);



















endmodule









//
//   invert macro
//
//





module l2t_evctag_dp_inv_macro__dinv_32x__stack_42r__width_34 (
  din, 
  dout);
  input [33:0] din;
  output [33:0] dout;






inv #(34)  d0_0 (
.in(din[33:0]),
.out(dout[33:0])
);









endmodule





//
//   buff macro
//
//





module l2t_evctag_dp_buff_macro__dbuff_32x__stack_42r__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






buff #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_34 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [33:0] din0;
  input sel0;
  input [33:0] din1;
  input sel1;
  output [33:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(34)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[33:0]),
  .in1(din1[33:0]),
.dout(dout[33:0])
);









  



endmodule


//
//   invert macro
//
//





module l2t_evctag_dp_inv_macro__dinv_32x__stack_34r__width_34 (
  din, 
  dout);
  input [33:0] din;
  output [33:0] dout;






inv #(34)  d0_0 (
.in(din[33:0]),
.out(dout[33:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_42r__width_40 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [39:0] din0;
  input [39:0] din1;
  input sel0;
  output [39:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(40)  d0_0 (
  .sel(psel1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msff_macro__stack_42r__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msff_macro__dmsff_32x__stack_42r__width_40 (
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
wire [38:0] so;

  input [39:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [39:0] dout;


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
dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);




















endmodule









//
//   buff macro
//
//





module l2t_evctag_dp_buff_macro__dbuff_16x__stack_42r__width_42 (
  din, 
  dout);
  input [41:0] din;
  output [41:0] dout;






buff #(42)  d0_0 (
.in(din[41:0]),
.out(dout[41:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_42r__width_42 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [41:0] din0;
  input sel0;
  input [41:0] din1;
  input sel1;
  output [41:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(42)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[41:0]),
  .in1(din1[41:0]),
.dout(dout[41:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__mux_aonpe__ports_2__stack_42r__width_40 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [39:0] din0;
  input sel0;
  input [39:0] din1;
  input sel1;
  output [39:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(40)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_evctag_dp_cmp_macro__dcmp_8x__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_evctag_dp_cmp_macro__dcmp_8x__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_evctag_dp_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_evctag_dp_and_macro__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_evctag_dp_or_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module l2t_evctag_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msff_macro__stack_42r__width_42 (
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
wire [40:0] so;

  input [41:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [41:0] dout;


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
dff #(42)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[41:0]),
.si({scan_in,so[40:0]}),
.so({so[40:0],scan_out}),
.q(dout[41:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__mux_aonpe__ports_4__stack_42r__width_42 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [41:0] din0;
  input sel0;
  input [41:0] din1;
  input sel1;
  input [41:0] din2;
  input sel2;
  input [41:0] din3;
  input sel3;
  output [41:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(42)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[41:0]),
  .in1(din1[41:0]),
  .in2(din2[41:0]),
  .in3(din3[41:0]),
.dout(dout[41:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msff_macro__stack_42r__width_24 (
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
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout;


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
dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_evctag_dp_msff_macro__stack_46r__width_19 (
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
wire [17:0] so;

  input [18:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [18:0] dout;


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
dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_evctag_dp_inv_macro__dinv_32x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_evctag_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_42r__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(32)  d0_0 (
  .sel(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule

