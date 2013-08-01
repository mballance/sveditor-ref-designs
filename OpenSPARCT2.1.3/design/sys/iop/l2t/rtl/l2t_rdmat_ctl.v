// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_rdmat_ctl.v
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
//////////////////////////////////////////////////////////////////////// 
 
module l2t_rdmat_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  rdmat_wr_entry_s1, 
  rdmat_or_rdmat_valid, 
  rdmat_pick_vec, 
  rdmat_rdma_hit_unqual_c2, 
  rdmat_rdma_misbuf_dep_rdy_en, 
  rdmat_rdma_misbuf_dep_mbid, 
  rdmat_wr_wl_s2, 
  l2t_l2b_word_vld_c7, 
  l2t_l2b_ctag_en_c7, 
  l2t_l2b_req_en_c7, 
  l2t_l2b_word_c7, 
  rdmat_rdmard_cerr_c12, 
  rdmat_rdmard_uerr_c12, 
  rdmat_rdmard_notdata_c12, 
  rdmat_ev_uerr_r6, 
  rdmat_ev_cerr_r6, 
  scan_out, 
  snp_rdmatag_wr_en_s2, 
  wbuf_reset_rdmat_vld, 
  wbuf_set_rdmat_acked, 
  rdmat_cam_match_c2, 
  arb_wbuf_inst_vld_c2, 
  arb_wbuf_hit_off_c1, 
  arbdec_arbdp_rdma_entry_c3, 
  misbuf_wbuf_mbid_c4, 
  misbuf_hit_c4, 
  tag_rdma_ev_en_c4, 
  wmr_l, 
  l2clk, 
  scan_in, 
  l2b_l2t_rdma_cerr_c10, 
  l2b_l2t_rdma_uerr_c10, 
  l2b_l2t_rdma_notdata_c10, 
  l2b_l2t_ev_uerr_r5, 
  l2b_l2t_ev_cerr_r5, 
  arbdec_ctag_c6, 
  l2t_l2b_ctag_c7, 
  rdma_mbist_cam_hit, 
  rdma_mbist_cam_sel, 
  l2t_dbg_xbar_vcid_unreg, 
  l2t_dbg_xbar_vcid, 
  l2t_dbg_sii_iq_dequeue_unreg, 
  l2t_dbg_sii_iq_dequeue, 
  tag_inc_rdma_cnt_c4, 
  tag_set_rdma_reg_vld_c4, 
  tag_siu_req_en_c52, 
  arbdp_rdma_addr_c6, 
  l2t_mb2_run, 
  l2t_mb2_addr);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire reset_flop_scanin;
wire reset_flop_scanout;
wire ff_l2t_l2b_ctag_c7_scanin;
wire ff_l2t_l2b_ctag_c7_scanout;
wire ff_rdma_wr_ptr_s2_scanin;
wire ff_rdma_wr_ptr_s2_scanout;
wire ff_l2t_mb2_addr_scanin;
wire ff_l2t_mb2_addr_scanout;
wire [1:0] l2t_mb2_addr_r1;
wire [1:0] l2t_mb2_addr_r2;
wire [1:0] l2t_mb2_addr_r3;
wire [3:0] l2t_mb2_wr_addr;
wire ff_mb_run_scanin;
wire ff_mb_run_scanout;
wire rdma_mbist_cam_sel_r1;
wire ff_valid_bit_scanin;
wire ff_valid_bit_scanout;
wire ff_arb_wbuf_hit_off_c2_scanin;
wire ff_arb_wbuf_hit_off_c2_scanout;
wire rdma_mbist_cam_hit_raw;
wire rdma_mbist_cam_hit_r1;
wire ff_rdma_mbist_cam_hit_scanin;
wire ff_rdma_mbist_cam_hit_scanout;
wire ff_rdma_cam_hit_vec_c3_scanin;
wire ff_rdma_cam_hit_vec_c3_scanout;
wire ff_rdma_cam_hit_vec_c4_scanin;
wire ff_rdma_cam_hit_vec_c4_scanout;
wire ff_rdma_hit_qual_c3_scanin;
wire ff_rdma_hit_qual_c3_scanout;
wire ff_rdma_hit_qual_c4_scanin;
wire ff_rdma_hit_qual_c4_scanout;
wire ff_mbid0_scanin;
wire ff_mbid0_scanout;
wire ff_mbid1_scanin;
wire ff_mbid1_scanout;
wire ff_mbid2_scanin;
wire ff_mbid2_scanout;
wire ff_mbid3_scanin;
wire ff_mbid3_scanout;
wire ff_rdma_mbid_vld_scanin;
wire ff_rdma_mbid_vld_scanout;
wire ff_rdma_entry_c4_scanin;
wire ff_rdma_entry_c4_scanout;
wire ff_mcu_req_scanin;
wire ff_mcu_req_scanout;
wire ff_rdma_acked_scanin;
wire ff_rdma_acked_scanout;
wire ff_inc_rdma_cnt_c5_scanin;
wire ff_inc_rdma_cnt_c5_scanout;
wire ff_inc_rdma_cnt_c52_scanin;
wire ff_inc_rdma_cnt_c52_scanout;
wire ff_inc_rdma_cnt_c6_scanin;
wire ff_inc_rdma_cnt_c6_scanout;
wire ff_inc_rdma_cnt_c7_scanin;
wire ff_inc_rdma_cnt_c7_scanout;
wire ff_set_rdma_reg_vld_c5_scanin;
wire ff_set_rdma_reg_vld_c5_scanout;
wire ff_set_rdma_reg_vld_c52_scanin;
wire ff_set_rdma_reg_vld_c52_scanout;
wire ff_set_rdma_reg_vld_c6_scanin;
wire ff_set_rdma_reg_vld_c6_scanout;
wire ff_tag_siu_req_en_c6_scanin;
wire ff_tag_siu_req_en_c6_scanout;
wire ff_tag_siu_req_en_c7_scanin;
wire ff_tag_siu_req_en_c7_scanout;
wire ff_rdmard_st_scanin;
wire ff_rdmard_st_scanout;
wire ff_rdmard_cerr_c12_scanin;
wire ff_rdmard_cerr_c12_scanout;
wire ff_rdmard_uerr_c12_scanin;
wire ff_rdmard_uerr_c12_scanout;
wire ff_rdmard_notdata_c12_scanin;
wire ff_rdmard_notdata_c12_scanout;
wire ff_ev_uerr_r6_scanin;
wire ff_ev_uerr_r6_scanout;
wire ff_ev_cerr_r6_scanin;
wire ff_ev_cerr_r6_scanout;
wire ff_dbg_signals_scanin;
wire ff_dbg_signals_scanout;
 
 
 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
output	[1:0]	rdmat_wr_entry_s1; // to snp ctl. 
output		rdmat_or_rdmat_valid; // to wbuf 
output	[3:0]	rdmat_pick_vec; // to wbuf 
output		rdmat_rdma_hit_unqual_c2 ; // to misbuf 
output		rdmat_rdma_misbuf_dep_rdy_en;// to misbuf 
output	[4:0]	rdmat_rdma_misbuf_dep_mbid; // to misbuf , BS & SR 11/04/03, MB grows to 32
output	[3:0]	rdmat_wr_wl_s2; 
//output  [2:0]   l2t_l2b_fbwr_wl_r2; // NEW_PIN 
//output          l2t_l2b_fbrd_en_c3; // NEW_PIN 
//output  [2:0]   l2t_l2b_fbrd_wl_c3; // NEW_PIN 
output          l2t_l2b_word_vld_c7; // NEW_PIN 
output          l2t_l2b_ctag_en_c7; // NEW_PIN 
output          l2t_l2b_req_en_c7;  // NEW_PIN 
output  [3:0]   l2t_l2b_word_c7; // NEW_PIN 
 
output		rdmat_rdmard_cerr_c12;  // NEW_PIN 
output  	rdmat_rdmard_uerr_c12;
output  	rdmat_rdmard_notdata_c12;
output		rdmat_ev_uerr_r6; // NEW_PIN 
output  	rdmat_ev_cerr_r6;
 
 
output 		scan_out; 
input		snp_rdmatag_wr_en_s2 ; // from snp. 
input	[3:0]	wbuf_reset_rdmat_vld; // comes from  wbuf 
input	[3:0]	wbuf_set_rdmat_acked; // from wbuf 
input	[3:0]	rdmat_cam_match_c2; // from cm2 
input		arb_wbuf_inst_vld_c2 ; // from arb. 
input		arb_wbuf_hit_off_c1 ; // from arb. 
input	[1:0]	arbdec_arbdp_rdma_entry_c3; // mbid 
input   [4:0]   misbuf_wbuf_mbid_c4; // misbuf  // BS  & SR 11/04/03, MB grows to 32
input           misbuf_hit_c4; // misbuf 
input		tag_rdma_ev_en_c4; // generated in tag; 
//input		tag_l2b_fbd_stdatasel_c3; 
//input	[15:0]	tag_l2b_fbwr_wen_r2; 
//output	[15:0] 	l2t_l2b_fbwr_wen_r2 ; 
//output		l2t_l2b_fbd_stdatasel_c3 ; 
 
input		wmr_l; 
input		l2clk; 
input 		scan_in;
 
// from l2b 
input	l2b_l2t_rdma_cerr_c10; // NEW_PIN 
input	l2b_l2t_rdma_uerr_c10; // NEW_PIN 
input   l2b_l2t_rdma_notdata_c10;

// from l2b 
input   l2b_l2t_ev_uerr_r5; // NEW_PIN 
input   l2b_l2t_ev_cerr_r5; // NEW_PIN 
input	[31:0]	arbdec_ctag_c6; // NEW_PIN POST_3.3 Bottom // Phase 2 : SIU inteface and packet format change 2/7/04
				// RAS implementation changes 10/14/04
  
output	[31:0]	l2t_l2b_ctag_c7; // NEW_PIN POST_3.3 TOp // Phase 2 : SIU inteface and packet format change 2/7/04
		                 // RAS implementation changes 10/14/04

 
output		rdma_mbist_cam_hit; 
input		rdma_mbist_cam_sel; 
 
 
input	[5:0] l2t_dbg_xbar_vcid_unreg;
output	[5:0] l2t_dbg_xbar_vcid;
input		l2t_dbg_sii_iq_dequeue_unreg;
output		l2t_dbg_sii_iq_dequeue;
	
 
 
 
// from tag. 
input           tag_inc_rdma_cnt_c4; // NEW_PIN 
input           tag_set_rdma_reg_vld_c4 ; // NEW_PIN 
input           tag_siu_req_en_c52; // NEW_PIN 
 
// from arbaddr 
input   [5:2]   arbdp_rdma_addr_c6; // NEW_PIN 
 
// from filbuf 
//input           filbuf_fbd_rd_en_c2; // rd en for fbdata NEW_PIN 
//input   [2:0]   filbuf_fbd_rd_entry_c2; // rd entry for fbdata NEW_PIN 
//input   [2:0]   filbuf_fbd_wr_entry_r1; // entry for fbdata wr NEW_PIN 
 
// mbist
input		l2t_mb2_run;
input	[3:0]	l2t_mb2_addr;


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_l1clkhdr_ctl_macro clkgen (
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
l2t_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


 
wire    siu_req_en_c7; 
wire   siu_req_en_c6;
 
wire    inc_rdma_cnt_c5, inc_rdma_cnt_c52, inc_rdma_cnt_c6, inc_rdma_cnt_c7 ; // BS 03/11/04 extra cycle for mem access 
wire    set_rdma_reg_vld_c5 , set_rdma_reg_vld_c52, set_rdma_reg_vld_c6, set_rdma_reg_vld_c7 ;// BS 03/11/04 extra cycle for mem access 
wire    [3:0]   rdma_state_in, rdma_state_plus1 , rdma_state ; 
wire    inc_state_en; 
wire    rdma_state_en; 
 
 
wire	[3:0]	rdma_wr_ptr_s1, rdma_wr_ptr_s2; 
wire	[3:0]	rdma_valid_prev, rdma_valid ; 
 
wire	[3:0]	rdma_cam_hit_vec_c2, rdma_cam_hit_vec_c3, rdma_cam_hit_vec_c4; 
wire		rdma_hit_qual_c2, rdma_hit_qual_c3, rdma_hit_qual_c4; 
 
wire		mbid_wr_en ; 
wire	[3:0]	sel_insert_mbid_c4; 
 
wire	[4:0]	mbid0, mbid1, mbid2, mbid3; // BS & SR 11/04/03, MB grows to 32
wire	[3:0]	rdma_mbid_vld_in, rdma_mbid_vld ; 
wire	[3:0]	sel_mbid; 
wire		sel_def_mbid; 
wire	[4:0]	enc_mbid;  // BS & SR 11/04/03, MB grows to 32
 
wire	[3:0]	rdma_acked_in, rdma_acked; 
 
wire	[3:0]	rdma_mcu_req_in, rdma_mcu_req ; 
wire	[3:0]	noalloc_evict_mcu_c4; 
wire	or_rdma_mbid_vld; 
wire	[1:0]	rdma_entry_c4; 
wire	arb_wbuf_hit_off_c2; 
wire	[3:0]	sel_mbid_rst; 
 
wire            dbb_rst_l; 
/////////////////////////////////////////////////////////////////// 
// Reset flop 
/////////////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 
 
 
//assign		l2t_l2b_fbd_stdatasel_c3 = tag_l2b_fbd_stdatasel_c3 ; 
//assign		l2t_l2b_fbwr_wen_r2 = tag_l2b_fbwr_wen_r2 ; 
 
// int 5.0 changes
// assign	rdmat_siu_req_vld_buf = siu_l2t_req_vld; 
// assign	rdmat_siu_req_buf = siu_l2t_req; 
 
///////////////////////////////////////// 
// Repeater for ctag from arbdec. 
///////////////////////////////////////// 
// RAS implementation changes 10/14/04
l2t_msff_ctl_macro__width_32 ff_l2t_l2b_ctag_c7 	// Phase 2 : SIU inteface and packet format change 2/7/04
                           (.din(arbdec_ctag_c6[31:0]), .l1clk(l1clk), 
                    .scan_in(ff_l2t_l2b_ctag_c7_scanin),
                    .scan_out(ff_l2t_l2b_ctag_c7_scanout),
                    .dout(l2t_l2b_ctag_c7[31:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
///////////////////////////////////////// 
// Generating the wr ptr for rdmat 
///////////////////////////////////////// 
 
assign	rdma_wr_ptr_s1[0] = ~rdma_valid[0] ; 
assign	rdma_wr_ptr_s1[1] = rdma_valid[0] & ~rdma_valid[1]; 
assign	rdma_wr_ptr_s1[2] = (rdma_valid[0] & rdma_valid[1]) & ~rdma_valid[2] ; 
assign	rdma_wr_ptr_s1[3] = ( rdma_valid[0] & rdma_valid[1] & rdma_valid[2]) & ~rdma_valid[3] ; 
 
assign	rdmat_wr_entry_s1[0] = ( rdma_wr_ptr_s1[1] | rdma_wr_ptr_s1[3] ) ; 
assign	rdmat_wr_entry_s1[1] = ( rdma_wr_ptr_s1[2] | rdma_wr_ptr_s1[3] ) ; 
 
l2t_msff_ctl_macro__width_4 ff_rdma_wr_ptr_s2 
                           (.din(rdma_wr_ptr_s1[3:0]), .l1clk(l1clk), 
                    .scan_in(ff_rdma_wr_ptr_s2_scanin),
                    .scan_out(ff_rdma_wr_ptr_s2_scanout),
                    .dout(rdma_wr_ptr_s2[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 

l2t_msff_ctl_macro__width_6 ff_l2t_mb2_addr 
        (
	.scan_in(ff_l2t_mb2_addr_scanin),
	.scan_out(ff_l2t_mb2_addr_scanout),
	.din({l2t_mb2_addr[1:0],l2t_mb2_addr_r1[1:0], l2t_mb2_addr_r2[1:0]}),
	.l1clk(l1clk),
        .dout({l2t_mb2_addr_r1[1:0],l2t_mb2_addr_r2[1:0],l2t_mb2_addr_r3[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
	);




assign l2t_mb2_wr_addr[0] = (l2t_mb2_addr_r3[1:0] == 2'b00);
assign l2t_mb2_wr_addr[1] = (l2t_mb2_addr_r3[1:0] == 2'b01);
assign l2t_mb2_wr_addr[2] = (l2t_mb2_addr_r3[1:0] == 2'b10);
assign l2t_mb2_wr_addr[3] = (l2t_mb2_addr_r3[1:0] == 2'b11);



l2t_msff_ctl_macro__width_1 ff_mb_run 
                           (.din(rdma_mbist_cam_sel), .l1clk(l1clk),
                    .scan_in(ff_mb_run_scanin),
                    .scan_out(ff_mb_run_scanout),
                    .dout(rdma_mbist_cam_sel_r1),
  .siclk(siclk),
  .soclk(soclk)
);

 
assign	rdmat_wr_wl_s2[3:0] = l2t_mb2_run ? l2t_mb2_wr_addr[3:0] : rdma_wr_ptr_s2[3:0] ; 
 
/////////////////////////////////////////////////////////////////// 
// Pipeline for setting and resetting the valid bits  
// for the rdmat  
// 
// Set Pipeline. 
//----------------------------------------------------------------- 
// 	S1			S2		S3 
//----------------------------------------------------------------- 
//	xmit wr entry		snp		 
//	pick to			generates 
//	snp			rdmat/rdmad	vld=1 
//				wren and wrwl 
// 
//				 
//				set valid bit 
//----------------------------------------------------------------- 
// 
// 
// Reset Pipeline  
//----------------------------------------------------------------- 
// 	R0	R5 ..... R11		R12 
//----------------------------------------------------------------- 
//		evict	 evict		evict 
//		data1	 data7		data8 
// 
//			 reset		valid=0 
//			 valid. 
//----------------------------------------------------------------- 
/////////////////////////////////////////////////////////////////// 
 
assign	rdma_valid_prev = ( rdma_wr_ptr_s2 & {4{snp_rdmatag_wr_en_s2}}   
			| rdma_valid )   
			& ~wbuf_reset_rdmat_vld ; 
 
l2t_msff_ctl_macro__clr_1__width_4 ff_valid_bit  // sync reset active low
                           (.din(rdma_valid_prev[3:0]), .l1clk(l1clk),  
			.scan_in(ff_valid_bit_scanin),
			.scan_out(ff_valid_bit_scanout),
			.clr(~dbb_rst_l), 
                       .dout(rdma_valid[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
//////////////////////////////////////////////////////////////////// 
// Hit calculation. 
// RDMA hit is asserted only under the  following conditions.  
// wb_valid = 1 
// wb_mcu_req = 1 => that the Wr64 corresponding to that entry 
// 		    has cleared all dependencies and successfully 
//		    completed an issue down the pipe. 
// wb_acked = 1 => an ack was received for the Wr req sent to  
//		   mcu.  
//////////////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__width_1 ff_arb_wbuf_hit_off_c2 
              (.dout   (arb_wbuf_hit_off_c2), 
               .scan_in(ff_arb_wbuf_hit_off_c2_scanin),
               .scan_out(ff_arb_wbuf_hit_off_c2_scanout),
               .din (arb_wbuf_hit_off_c1), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 



assign rdma_mbist_cam_hit_raw = rdma_mbist_cam_sel_r1 ?  |(rdmat_cam_match_c2[3:0]) :1'b0; 

l2t_msff_ctl_macro__width_2 ff_rdma_mbist_cam_hit 
              (.dout   ({rdma_mbist_cam_hit_r1,rdma_mbist_cam_hit}),
               .scan_in(ff_rdma_mbist_cam_hit_scanin),
               .scan_out(ff_rdma_mbist_cam_hit_scanout),
               .din ({rdma_mbist_cam_hit_raw,rdma_mbist_cam_hit_r1}),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;




 
assign	rdma_cam_hit_vec_c2 =  ( rdmat_cam_match_c2 &  
				rdma_valid & rdma_mcu_req &  
				~( rdma_acked |  {4{arb_wbuf_hit_off_c2}} ) ); 
 
assign 	rdmat_rdma_hit_unqual_c2 = |( rdma_cam_hit_vec_c2 )  ; 
 
l2t_msff_ctl_macro__width_4 ff_rdma_cam_hit_vec_c3 
              (.dout   (rdma_cam_hit_vec_c3[3:0]), 
               .scan_in(ff_rdma_cam_hit_vec_c3_scanin),
               .scan_out(ff_rdma_cam_hit_vec_c3_scanout),
               .din (rdma_cam_hit_vec_c2[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_msff_ctl_macro__width_4 ff_rdma_cam_hit_vec_c4 
              (.dout   (rdma_cam_hit_vec_c4[3:0]), 
               .scan_in(ff_rdma_cam_hit_vec_c4_scanin),
               .scan_out(ff_rdma_cam_hit_vec_c4_scanout),
               .din (rdma_cam_hit_vec_c3[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign	rdma_hit_qual_c2 = rdmat_rdma_hit_unqual_c2 &  
			arb_wbuf_inst_vld_c2 ; 
 
l2t_msff_ctl_macro__width_1 ff_rdma_hit_qual_c3 
              (.dout   (rdma_hit_qual_c3), 
               .scan_in(ff_rdma_hit_qual_c3_scanin),
               .scan_out(ff_rdma_hit_qual_c3_scanout),
               .din (rdma_hit_qual_c2), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_msff_ctl_macro__width_1 ff_rdma_hit_qual_c4 
              (.dout   (rdma_hit_qual_c4), 
               .scan_in(ff_rdma_hit_qual_c4_scanin),
               .scan_out(ff_rdma_hit_qual_c4_scanout),
               .din (rdma_hit_qual_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// MBID and MBID_vld. 
// Written in the C4 cycle of a non-dependent instruction that hits 
// the rdma buffer. 
// 
// When an ack is received from DRAM for the entry with mbid_vld, 
// the corresponding mbid is used to wake up the miss buffer entry 
// that depends on the write.The ack may be received when the instruction 
// is in flight i.e in C2, C3 otr C4 and yet to set mbid vld. But that is 
// okay since the "acked" bit can only be set for one entry in the WBB at 
// a time. 
// MBID_vld is reset when an entry has mbid_vld =1 and acked=1 
// 
//////////////////////////////////////////////////////////////////////////////// 
 
 
assign  mbid_wr_en = rdma_hit_qual_c4 & ~misbuf_hit_c4; 
assign  sel_insert_mbid_c4 = {4{mbid_wr_en}} & rdma_cam_hit_vec_c4 ; 
 
l2t_msff_ctl_macro__en_1__width_5 ff_mbid0  // BS & SR 11/04/03, MB grows to 32
                           (.din( misbuf_wbuf_mbid_c4[4:0]),  
			.scan_in(ff_mbid0_scanin),
			.scan_out(ff_mbid0_scanout),
			.en(sel_insert_mbid_c4[0]), 
                        .l1clk(l1clk), .dout(mbid0[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_5 ff_mbid1  // BS & SR 11/04/03, MB grows to 32
                           (.din(misbuf_wbuf_mbid_c4[4:0]),  
			.scan_in(ff_mbid1_scanin),
			.scan_out(ff_mbid1_scanout),
			.en(sel_insert_mbid_c4[1]),  
			.l1clk(l1clk), .dout(mbid1[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_5 ff_mbid2  // BS & SR 11/04/03, MB grows to 32
                           (.din(misbuf_wbuf_mbid_c4[4:0]),  
			.scan_in(ff_mbid2_scanin),
			.scan_out(ff_mbid2_scanout),
			.en(sel_insert_mbid_c4[2]), 
                        .l1clk(l1clk), .dout(mbid2[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__en_1__width_5 ff_mbid3  // BS & SR 11/04/03, MB grows to 32
                           (.din(misbuf_wbuf_mbid_c4[4:0]),  
			.scan_in(ff_mbid3_scanin),
			.scan_out(ff_mbid3_scanout),
			.en(sel_insert_mbid_c4[3]),  
			.l1clk(l1clk), .dout(mbid3[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
assign  rdma_mbid_vld_in = 	( rdma_mbid_vld | sel_insert_mbid_c4 ) &  
				 ~(sel_mbid[3:0])    ; 
 
l2t_msff_ctl_macro__clr_1__width_4 ff_rdma_mbid_vld  // sync reset active low
                           (.din(rdma_mbid_vld_in[3:0]),  
				.scan_in(ff_rdma_mbid_vld_scanin),
				.scan_out(ff_rdma_mbid_vld_scanout),
				.l1clk(l1clk),.clr(~dbb_rst_l), 
                                .dout(rdma_mbid_vld[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
/////////////////////////////////////////////////////////////////// 
// Mbf dependent Ready logic. 
/////////////////////////////////////////////////////////////////// 
 
assign	sel_mbid	= rdma_acked & rdma_mbid_vld ; 
 
assign	sel_def_mbid = ~( sel_mbid[2] | sel_mbid[1] | sel_mbid[0] ) ; 
 
assign	 sel_mbid_rst[0] = sel_mbid[0] ; 
assign	 sel_mbid_rst[1] = sel_mbid[1] ; 
assign	 sel_mbid_rst[2] = sel_mbid[2] ; 
assign	 sel_mbid_rst[3] = sel_def_mbid  ; 
 
 
 
l2t_mux_ctl_macro__mux_aonpe__ports_4__width_5 rdma_mb_mbid  // BS & SR 11/04/03, MB grows to 32
		(.dout (enc_mbid[4:0]), 
                             .din0(mbid0[4:0]), .din1(mbid1[4:0]), 
                             .din2(mbid2[4:0]), .din3(mbid3[4:0]), 
                             .sel0(sel_mbid_rst[0]), .sel1(sel_mbid_rst[1]), 
                             .sel2(sel_mbid_rst[2]), .sel3(sel_mbid_rst[3])); 
 
 
assign	rdmat_rdma_misbuf_dep_rdy_en = |(sel_mbid[3:0]); 
assign	rdmat_rdma_misbuf_dep_mbid = enc_mbid[4:0]; 
 
 
 
/////////////////////////////////////////////////////////////////////////////// 
// This bit indicates if  an entry in the RDMA WR Buffer  
// can be evicted to DRAM. 
// 
// The mcu req bit of an  entry is set in the C4 cycle of  
// a WR64 instruction that completes successfully.  
// A Wr64 instruction much like the RD64 instruction is  
// followed by 2 bubbles. This means that an instruction 
// following it 2 cycles later will see the mcu_req 
// bit without any need for bypassing. 
/////////////////////////////////////////////////////////////////////////////// 
 
l2t_msff_ctl_macro__width_2 ff_rdma_entry_c4 
                           (.din( arbdec_arbdp_rdma_entry_c3[1:0]),  
                        .scan_in(ff_rdma_entry_c4_scanin),
                        .scan_out(ff_rdma_entry_c4_scanout),
                        .l1clk(l1clk), .dout(rdma_entry_c4[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	noalloc_evict_mcu_c4[0] = ( rdma_entry_c4[1:0] == 2'b00 ) &  
					tag_rdma_ev_en_c4 ; 
assign	noalloc_evict_mcu_c4[1] = ( rdma_entry_c4[1:0] == 2'b01 ) &  
					tag_rdma_ev_en_c4 ; 
assign	noalloc_evict_mcu_c4[2] = ( rdma_entry_c4[1:0] == 2'b10 ) &  
					tag_rdma_ev_en_c4 ; 
assign	noalloc_evict_mcu_c4[3] = ( rdma_entry_c4[1:0] == 2'b11 ) &  
					tag_rdma_ev_en_c4 ; 
 
assign  rdma_mcu_req_in = ( rdma_mcu_req | noalloc_evict_mcu_c4 ) 
                                & ~wbuf_reset_rdmat_vld; 
 
l2t_msff_ctl_macro__clr_1__width_4 ff_mcu_req  // sync reset active low
                           (.din(rdma_mcu_req_in[3:0]), .l1clk(l1clk), 
		   	.scan_in(ff_mcu_req_scanin),
		   	.scan_out(ff_mcu_req_scanout),
		   	.clr(~dbb_rst_l), 
                   	.dout(rdma_mcu_req[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	rdmat_or_rdmat_valid = |( rdma_mcu_req ) ; 
 
assign	or_rdma_mbid_vld = |( rdma_mcu_req & rdma_mbid_vld); 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_quad0_in 
              (.dout (rdmat_pick_vec[3:0]), 
               .din0  (rdma_mcu_req[3:0]),     .sel0 (~or_rdma_mbid_vld), 
               .din1  (rdma_mbid_vld[3:0]),  .sel1 (or_rdma_mbid_vld) 
              ) ; 
 
 
/////////////////////////////////////////////////////////////////////////////// 
// ACKED  bit 
// Set when an entry is acked by the DRAM controller. 
//  Reset along with the valid bit. 
/////////////////////////////////////////////////////////////////////////////// 
 
 
assign  rdma_acked_in = ( rdma_acked | wbuf_set_rdmat_acked ) &  
				~wbuf_reset_rdmat_vld ; 
 
l2t_msff_ctl_macro__clr_1__width_4 ff_rdma_acked  // sync reset active low
                           (.din(rdma_acked_in[3:0]), .l1clk(l1clk), 
		   	.scan_in(ff_rdma_acked_scanin),
		   	.scan_out(ff_rdma_acked_scanout),
		   	.clr(~dbb_rst_l), 
                  	.dout(rdma_acked[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//msff_ctl_macro ff_l2t_l2b_fbrd_en_c3 (width=1)
//                           (.din(filbuf_fbd_rd_en_c2), .l1clk(l1clk), 
//                        .scan_in(ff_l2t_l2b_fbrd_en_c3_scanin),
//                        .scan_out(ff_l2t_l2b_fbrd_en_c3_scanout),
//                        .dout(l2t_l2b_fbrd_en_c3),  
//); 
// 
//msff_ctl_macro ff_l2t_l2b_fbrd_wl_c3 (width=3)
//                           (.din(filbuf_fbd_rd_entry_c2[2:0]), 
//                        .scan_in(ff_l2t_l2b_fbrd_wl_c3_scanin),
//                        .scan_out(ff_l2t_l2b_fbrd_wl_c3_scanout),
//                        .l1clk(l1clk), 
//                       .dout(l2t_l2b_fbrd_wl_c3[2:0]),  
//); 
//// 
//msff_ctl_macro ff_l2t_l2b_fbwr_wl_r2 (width=3)
//                           (.din(filbuf_fbd_wr_entry_r1[2:0]), 
//                        .scan_in(ff_l2t_l2b_fbwr_wl_r2_scanin),
//                        .scan_out(ff_l2t_l2b_fbwr_wl_r2_scanout),
//                        .l1clk(l1clk), 
//                       .dout(l2t_l2b_fbwr_wl_r2[2:0]),  
//); 
 
 
 
l2t_msff_ctl_macro__width_1 ff_inc_rdma_cnt_c5 
                           (.din(tag_inc_rdma_cnt_c4), .l1clk(l1clk), 
                .scan_in(ff_inc_rdma_cnt_c5_scanin),
                .scan_out(ff_inc_rdma_cnt_c5_scanout),
                .dout(inc_rdma_cnt_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_inc_rdma_cnt_c52 
                           (.din(inc_rdma_cnt_c5), .l1clk(l1clk),
                .scan_in(ff_inc_rdma_cnt_c52_scanin),
                .scan_out(ff_inc_rdma_cnt_c52_scanout),
                .dout(inc_rdma_cnt_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_inc_rdma_cnt_c6 
                           (.din(inc_rdma_cnt_c52), .l1clk(l1clk), 
                .scan_in(ff_inc_rdma_cnt_c6_scanin),
                .scan_out(ff_inc_rdma_cnt_c6_scanout),
                .dout(inc_rdma_cnt_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_inc_rdma_cnt_c7 
                           (.din(inc_rdma_cnt_c6), .l1clk(l1clk), 
                .scan_in(ff_inc_rdma_cnt_c7_scanin),
                .scan_out(ff_inc_rdma_cnt_c7_scanout),
                .dout(inc_rdma_cnt_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  l2t_l2b_word_vld_c7 = inc_rdma_cnt_c7 ; 
 
l2t_msff_ctl_macro__width_1 ff_set_rdma_reg_vld_c5 
                           (.din(tag_set_rdma_reg_vld_c4), .l1clk(l1clk), 
                .scan_in(ff_set_rdma_reg_vld_c5_scanin),
                .scan_out(ff_set_rdma_reg_vld_c5_scanout),
                .dout(set_rdma_reg_vld_c5),
  .siclk(siclk),
  .soclk(soclk)  
); 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_set_rdma_reg_vld_c52 
                           (.din(set_rdma_reg_vld_c5), .l1clk(l1clk),
                .scan_in(ff_set_rdma_reg_vld_c52_scanin),
                .scan_out(ff_set_rdma_reg_vld_c52_scanout),
                .dout(set_rdma_reg_vld_c52),
  .siclk(siclk),
  .soclk(soclk)  
);

 
l2t_msff_ctl_macro__width_1 ff_set_rdma_reg_vld_c6 
                           (.din(set_rdma_reg_vld_c52), .l1clk(l1clk), 
                .scan_in(ff_set_rdma_reg_vld_c6_scanin),
                .scan_out(ff_set_rdma_reg_vld_c6_scanout),
                .dout(set_rdma_reg_vld_c6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
//msff_ctl_macro ff_set_rdma_reg_vld_c7 (width=1)
//                           (.din(set_rdma_reg_vld_c6), .l1clk(l1clk), 
//                .scan_in(ff_set_rdma_reg_vld_c7_scanin),
//                .scan_out(ff_set_rdma_reg_vld_c7_scanout),
//                .dout(set_rdma_reg_vld_c7),  
//); 
 
assign  l2t_l2b_ctag_en_c7 = set_rdma_reg_vld_c6 ; 

// BS 03/11/04 extra cycle for mem access

l2t_msff_ctl_macro__width_1 ff_tag_siu_req_en_c6 
                           (.din(tag_siu_req_en_c52), .l1clk(l1clk),
                .scan_in(ff_tag_siu_req_en_c6_scanin),
                .scan_out(ff_tag_siu_req_en_c6_scanout),
                .dout(siu_req_en_c6),
  .siclk(siclk),
  .soclk(soclk)  
);
 
l2t_msff_ctl_macro__width_1 ff_tag_siu_req_en_c7 
                           (.din(siu_req_en_c6), .l1clk(l1clk), 
                .scan_in(ff_tag_siu_req_en_c7_scanin),
                .scan_out(ff_tag_siu_req_en_c7_scanout),
                .dout(siu_req_en_c7),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  l2t_l2b_req_en_c7 = siu_req_en_c7 ; 
 
///////////////////////////////////////// 
// rdma state counter. 
// streaming to siu is mbist_done critical word 
// first. 
// The counter that determines the mux selects 
// to do this is maintained here. 
///////////////////////////////////////// 
assign  inc_state_en = inc_rdma_cnt_c6 & ~set_rdma_reg_vld_c6 ; 
                        // implies ld64 beyond c6. 
 
assign  rdma_state_en = (inc_rdma_cnt_c6 | set_rdma_reg_vld_c6 ); 
 
assign  rdma_state_plus1 = rdma_state + 4'b1; 
 
 
l2t_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_rdma_state_in 
		(.dout (rdma_state_in[3:0]), 
                                .din0(rdma_state_plus1[3:0]), 
                                .din1(arbdp_rdma_addr_c6[5:2]), 
                                .sel0(inc_state_en), 
                                .sel1(~inc_state_en)); 
 
 
l2t_msff_ctl_macro__en_1__width_4 ff_rdmard_st 
                           (.din(rdma_state_in[3:0]), 
                 .scan_in(ff_rdmard_st_scanin),
                 .scan_out(ff_rdmard_st_scanout),
                 .en(rdma_state_en), .l1clk(l1clk), 
                 .dout(rdma_state[3:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign  l2t_l2b_word_c7 = rdma_state ; 
 
 
////////////////////////////////////////////////////////////////////////// 
// Buffer repeater for the rdma rd err 
// signals. 
// These signals are actually C11 signals coming 
// in from l2b even though the suffix reads 
// C10( rdmard operation is skewed by 1 cyc).  
// Here's the pipeline. 
// 
//-------------------------------------------------------------------- 
//	C5	C6	C7	C8	C9	C10	C11 
//-------------------------------------------------------------------- 
//	$rd	$rd	xmit	xmit	mux	ecc	xmit 
//							err 
//							to 
//							l2t 
//-------------------------------------------------------------------- 
// 
///////////////////////////////////////////////////////////////////////// 
l2t_msff_ctl_macro__width_1 ff_rdmard_cerr_c12 
                           (.din(l2b_l2t_rdma_cerr_c10), .l1clk(l1clk), 
                        .scan_in(ff_rdmard_cerr_c12_scanin),
                        .scan_out(ff_rdmard_cerr_c12_scanout),
                        .dout(rdmat_rdmard_cerr_c12),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_rdmard_uerr_c12 
                           (.din(l2b_l2t_rdma_uerr_c10), .l1clk(l1clk), 
                        .scan_in(ff_rdmard_uerr_c12_scanin),
                        .scan_out(ff_rdmard_uerr_c12_scanout),
                        .dout(rdmat_rdmard_uerr_c12),
  .siclk(siclk),
  .soclk(soclk)  
); 
 

l2t_msff_ctl_macro__width_1 ff_rdmard_notdata_c12 
                           (.din(l2b_l2t_rdma_notdata_c10), .l1clk(l1clk),
			.scan_in(ff_rdmard_notdata_c12_scanin),
			.scan_out(ff_rdmard_notdata_c12_scanout),
			.dout(rdmat_rdmard_notdata_c12),
  .siclk(siclk),
  .soclk(soclk)
);

 
l2t_msff_ctl_macro__width_1 ff_ev_uerr_r6 
                           (.din(l2b_l2t_ev_uerr_r5), .l1clk(l1clk), 
                .scan_in(ff_ev_uerr_r6_scanin),
                .scan_out(ff_ev_uerr_r6_scanout),
                .dout(rdmat_ev_uerr_r6),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_msff_ctl_macro__width_1 ff_ev_cerr_r6 
                           (.din(l2b_l2t_ev_cerr_r5), .l1clk(l1clk), 
                .scan_in(ff_ev_cerr_r6_scanin),
                .scan_out(ff_ev_cerr_r6_scanout),
                .dout(rdmat_ev_cerr_r6),
  .siclk(siclk),
  .soclk(soclk)  
); 



// Flopped here for timing reasons


l2t_msff_ctl_macro__width_7 ff_dbg_signals 
       (
	.scan_in(ff_dbg_signals_scanin),
	.scan_out(ff_dbg_signals_scanout),
	.din({l2t_dbg_xbar_vcid_unreg[5:0],l2t_dbg_sii_iq_dequeue_unreg}), 
	.l1clk(l1clk),
        .dout({l2t_dbg_xbar_vcid[5:0],l2t_dbg_sii_iq_dequeue}),
  .siclk(siclk),
  .soclk(soclk)
	);






 
 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reset_flop_scanin         = spares_scanout           ;
assign ff_l2t_l2b_ctag_c7_scanin = reset_flop_scanout       ;
assign ff_rdma_wr_ptr_s2_scanin  = ff_l2t_l2b_ctag_c7_scanout;
assign ff_l2t_mb2_addr_scanin    = ff_rdma_wr_ptr_s2_scanout;
assign ff_mb_run_scanin          = ff_l2t_mb2_addr_scanout  ;
assign ff_valid_bit_scanin       = ff_mb_run_scanout        ;
assign ff_arb_wbuf_hit_off_c2_scanin = ff_valid_bit_scanout     ;
assign ff_rdma_mbist_cam_hit_scanin = ff_arb_wbuf_hit_off_c2_scanout;
assign ff_rdma_cam_hit_vec_c3_scanin = ff_rdma_mbist_cam_hit_scanout;
assign ff_rdma_cam_hit_vec_c4_scanin = ff_rdma_cam_hit_vec_c3_scanout;
assign ff_rdma_hit_qual_c3_scanin = ff_rdma_cam_hit_vec_c4_scanout;
assign ff_rdma_hit_qual_c4_scanin = ff_rdma_hit_qual_c3_scanout;
assign ff_mbid0_scanin           = ff_rdma_hit_qual_c4_scanout;
assign ff_mbid1_scanin           = ff_mbid0_scanout         ;
assign ff_mbid2_scanin           = ff_mbid1_scanout         ;
assign ff_mbid3_scanin           = ff_mbid2_scanout         ;
assign ff_rdma_mbid_vld_scanin   = ff_mbid3_scanout         ;
assign ff_rdma_entry_c4_scanin   = ff_rdma_mbid_vld_scanout ;
assign ff_mcu_req_scanin         = ff_rdma_entry_c4_scanout ;
assign ff_rdma_acked_scanin      = ff_mcu_req_scanout       ;
assign ff_inc_rdma_cnt_c5_scanin = ff_rdma_acked_scanout    ;
assign ff_inc_rdma_cnt_c52_scanin = ff_inc_rdma_cnt_c5_scanout;
assign ff_inc_rdma_cnt_c6_scanin = ff_inc_rdma_cnt_c52_scanout;
assign ff_inc_rdma_cnt_c7_scanin = ff_inc_rdma_cnt_c6_scanout;
assign ff_set_rdma_reg_vld_c5_scanin = ff_inc_rdma_cnt_c7_scanout;
assign ff_set_rdma_reg_vld_c52_scanin = ff_set_rdma_reg_vld_c5_scanout;
assign ff_set_rdma_reg_vld_c6_scanin = ff_set_rdma_reg_vld_c52_scanout;
assign ff_tag_siu_req_en_c6_scanin = ff_set_rdma_reg_vld_c6_scanout;
assign ff_tag_siu_req_en_c7_scanin = ff_tag_siu_req_en_c6_scanout;
assign ff_rdmard_st_scanin       = ff_tag_siu_req_en_c7_scanout;
assign ff_rdmard_cerr_c12_scanin = ff_rdmard_st_scanout     ;
assign ff_rdmard_uerr_c12_scanin = ff_rdmard_cerr_c12_scanout;
assign ff_rdmard_notdata_c12_scanin = ff_rdmard_uerr_c12_scanout;
assign ff_ev_uerr_r6_scanin      = ff_rdmard_notdata_c12_scanout;
assign ff_ev_cerr_r6_scanin      = ff_ev_uerr_r6_scanout    ;
assign ff_dbg_signals_scanin     = ff_ev_cerr_r6_scanout    ;
assign scan_out                  = ff_dbg_signals_scanout   ;
// fixscan end:
endmodule 


 

// any PARAMS parms go into naming of macro

module l2t_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});


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

module l2t_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






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

module l2t_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule








//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_spare_ctl_macro__num_4 (
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

module l2t_msff_ctl_macro__clr_1__width_4 (
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


