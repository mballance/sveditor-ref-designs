// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_snp_ctl.v
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


 
 
 
module l2t_snp_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  rdmat_sii_req_vld_buf, 
  arb_snp_snpsel_px2, 
  snpd_rq_winv_s1, 
  rdmat_wr_entry_s1, 
  l2clk, 
  scan_in, 
  wmr_l, 
  scan_out, 
  l2t_sii_iq_dequeue, 
  snp_snpq_arb_vld_px1, 
  snp_hdr1_wen0_s0, 
  snp_hdr2_wen0_s1, 
  snp_snp_data1_wen0_s2, 
  snp_snp_data2_wen0_s3, 
  snp_hdr1_wen1_s0, 
  snp_hdr2_wen1_s1, 
  snp_snp_data1_wen1_s2, 
  snp_snp_data2_wen1_s3, 
  snp_wr_ptr, 
  snp_rd_ptr, 
  snp_rdmad_wr_entry_s2, 
  snp_rdmatag_wr_en_s2, 
  l2t_l2b_rdma_wren_s2, 
  l2t_l2b_rdma_wrwl_s2, 
  l2t_dbg_sii_iq_dequeue, 
  l2t_mb2_run, 
  l2t_mb2_rdmatag_wr_en, 
  l2t_siu_delay);
wire reset_flop_scanin;
wire reset_flop_scanout;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire ff_siu_req_vld_s0_scanin;
wire ff_siu_req_vld_s0_scanout;
wire ff_l2t_dbg_sii_iq_dequeue_scanin;
wire ff_l2t_dbg_sii_iq_dequeue_scanout;
wire l2t_sii_iq_dequeue_r1;
wire ff_arb_snp_snpsel_px2_scanin;
wire ff_arb_snp_snpsel_px2_scanout;
wire arb_snpsel_c1;
wire ff_winv_rq_active_s2_scanin;
wire ff_winv_rq_active_s2_scanout;
wire ff_snpiq_cnt_scanin;
wire ff_snpiq_cnt_scanout;
wire ff_wr_ptr_scanin;
wire ff_wr_ptr_scanout;
wire ff_mbist_signals_scanin;
wire ff_mbist_signals_scanout;
wire l2t_mb2_rdmatag_wr_en_r1;
wire l2t_mb2_rdmatag_wr_en_r2;
wire l2t_mb2_rdmatag_wr_en_r3;
wire l2t_mb2_run_r1;
wire snp_rdmatag_wr_en_s2_4muxsel;
wire ff_snp_rdmatag_wr_en_s2_4muxsel_d1_scanin;
wire ff_snp_rdmatag_wr_en_s2_4muxsel_d1_scanout;
wire snp_rdmatag_wr_en_s2_4muxsel_d1_n;
wire snp_rdmatag_wr_en_s2_4muxsel_d1;
wire ff_rdmadata_wen_s2_scanin;
wire ff_rdmadata_wen_s2_scanout;
wire ff_winv_rq_active_s2_1_scanin;
wire ff_winv_rq_active_s2_1_scanout;
wire [15:0] l2t_l2b_rdma_wren_s2_n;
wire ff_rdmad_wr_entry_s2_scanin;
wire ff_rdmad_wr_entry_s2_scanout;
wire [1:0] snp_rdmad_wr_entry_s2_internal;
wire ff_rdmad_wr_entry_s2_d1_scanin;
wire ff_rdmad_wr_entry_s2_d1_scanout;
wire l2t_l2b_rdma_wrwl_s2_bit0_a;
wire l2t_l2b_rdma_wrwl_s2_bit0_b;
wire l2t_l2b_rdma_wrwl_s2_bit1_a;
wire l2t_l2b_rdma_wrwl_s2_bit1_b;
wire ff_snp_valid_scanin;
wire ff_snp_valid_scanout;
wire ff_rd_ptr_scanin;
wire ff_rd_ptr_scanout;
 
 
 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
input	rdmat_sii_req_vld_buf; // primary input. 
//input	arb_snpsel_c1; // This signal is used to advance the rd ptr. 
input	arb_snp_snpsel_px2;
input	snpd_rq_winv_s1; // from snoop sp. Request type bit indicating winv. 
input	[1:0]	rdmat_wr_entry_s1; // encoded from rdma tag ctl. 
 
 
input	l2clk; 
input scan_in;
input	wmr_l; 
 
output scan_out; 
// to siu 
output	l2t_sii_iq_dequeue ; 
// to arb. 
output 	snp_snpq_arb_vld_px1; 
// to snpd. 
output	snp_hdr1_wen0_s0; 
output	snp_hdr2_wen0_s1;
output	snp_snp_data1_wen0_s2; 
output	snp_snp_data2_wen0_s3 ; 
output	snp_hdr1_wen1_s0; 
output	snp_hdr2_wen1_s1;
output	snp_snp_data1_wen1_s2; 
output	snp_snp_data2_wen1_s3 ; 
output	snp_wr_ptr; 
output	snp_rd_ptr; 
output	[1:0]	snp_rdmad_wr_entry_s2; 
// to rdmatag. 
output	snp_rdmatag_wr_en_s2; 
// to l2b 
output	[15:0]	l2t_l2b_rdma_wren_s2; 
output	[1:0]	l2t_l2b_rdma_wrwl_s2; 
// to debug
output		l2t_dbg_sii_iq_dequeue;
// mbist
input           l2t_mb2_run;
input           l2t_mb2_rdmatag_wr_en;

//input		pf_ice_stall;

input           l2t_siu_delay;

 
wire	siu_req_vld_s0; 
wire	wr_ptr_in, wr_ptr; 
wire	rd_ptr_in, rd_ptr ; 
 
wire	winv_reset, winv_en ; 
wire	winv_rq_active_s2, winv_rq_active_s2_1; 
wire	sel_snpiq_cnt_reset, snpiq_cnt_en, sel_snpiq_cnt_plus0, snpiq_cnt_rst ; 
wire	[4:0]	snpiq_cnt_plus0, snpiq_cnt_in, snpiq_cnt ; 
wire	[1:0]	snpq_valid_in, snpq_valid ; 
wire	[15:0]	rdmadata_wen_s1, rdmadata_wen_s2 ; 
wire	[1:0]	rdmad_wr_entry_s2_d1, rdmad_wr_wl_s2; 
wire            dbb_rst_l; 
/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_snp_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 
 

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_snp_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_snp_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

 
 
 
 
 
 
//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
// requests from JBI to issue pipeline. 
// WR8s and Reads are separated by 5 cycles. 
// Wr64 is a 19 cycle instruction so no new  
// request can be issued within 19 cycles or a WR64 
//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//	INstA		S0		S1		S2		S3		S4		S5 
//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//----------------------------------------------------------------------------------------------------------- 
//	req_vld		hdr1		hdr2		data1		data2		 
//	A											 
//											 
//----------------------------------------------------------------------------------------------------------- 
//											 
//					cnt=1		2		3		 
//											set vld=1	 
//											 
//----------------------------------------------------------------------------------------------------------- 
//							winv_rq_active_s2 
//							set if 
//							hdr1 indicates 
//							WR64				 
// 
//----------------------------------------------------------------------------------------------------------- 
//							wrptr_p = 
//							~wrptr.				non WR64 PX1	PX2 
// 
//----------------------------------------------------------------------------------------------------------- 
//											 
//			writehdr1	writehdr2	writedata1	writedata2 
//					 
//----------------------------------------------------------------------------------------------------------- 
//					 
//					send entry to	mux		write rdmat	 
//					snpqctl from	out		set rdmat vld 
//					rdmat	addr from 
//							written 
//							entry 
// 
//----------------------------------------------------------------------------------------------------------- 
//							xmit wr_wen 
//							& wl for 
//							rdmad write 
//											INST B 
//----------------------------------------------------------------------------------------------------------- 
// 
//	In this block of code, the enables for writing into the hdr addr and data flops are  
//	generated. Since the snp IQ is 2 deep, there are a total of 8 mux selects that  
//	are generated here. 
//	The mux selects are a cross product of the IQ entry and IQ field that is written. 
// 
// 
// - winv_rq_active_s2 is maintained high from the S2 of a WR64 instruction  
// till the S2 of a following instruction that is not a WR64. 
// - counter is reset when count is 3 or count is 17. The resetting of the counter 
//   indicates that the Wr pointer needs to be toggled.Also, one cycle after the 
//   counter expires,  vld_px1 is turned on to the arbiter. 
// 
// - The wenables for writing into the rdma Wr Buffer data assume that the 64Bytes of 
//   data arrive in the order 0,4,...60 
// - valid bit for an entry in the snp IQ is set when the request counter is reset. 
// - rd pointer is toggled when an instruction is issued down the pipe. 
// - entry in the rdma Wr Buffer to write into is determined in S1 based on the  
//   valid bits in rdmat. 
//  
//  
//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_snp_ctl_msff_ctl_macro__width_1 ff_siu_req_vld_s0 
                (.din(rdmat_sii_req_vld_buf), .l1clk(l1clk), 
                 .scan_in(ff_siu_req_vld_s0_scanin),
                 .scan_out(ff_siu_req_vld_s0_scanout),
                 .dout(siu_req_vld_s0),
  .siclk(siclk),
  .soclk(soclk)  
		); 

// FOR DEBUG

// assign l2t_dbg_sii_iq_dequeue = l2t_sii_iq_dequeue;

l2t_snp_ctl_msff_ctl_macro__width_2 ff_l2t_dbg_sii_iq_dequeue 
        (
	.scan_in(ff_l2t_dbg_sii_iq_dequeue_scanin),
	.scan_out(ff_l2t_dbg_sii_iq_dequeue_scanout),
	.din({l2t_sii_iq_dequeue,l2t_sii_iq_dequeue}), 
	.l1clk(l1clk),
        .dout({l2t_dbg_sii_iq_dequeue,l2t_sii_iq_dequeue_r1}),
  .siclk(siclk),
  .soclk(soclk)
        );

// 
// This signal will be delayed by a clock 
// assign	l2t_sii_iq_dequeue = arb_snpsel_c1 ; 
// 
l2t_snp_ctl_msff_ctl_macro__width_1 ff_arb_snp_snpsel_px2 
        (
        .scan_in(ff_arb_snp_snpsel_px2_scanin),
        .scan_out(ff_arb_snp_snpsel_px2_scanout),
        .din(arb_snp_snpsel_px2),
        .l1clk(l1clk),
        .dout(arb_snpsel_c1),
  .siclk(siclk),
  .soclk(soclk)
        );


assign l2t_sii_iq_dequeue = l2t_siu_delay ? l2t_sii_iq_dequeue_r1 : arb_snpsel_c1;


 
assign 	winv_reset = ~dbb_rst_l ; 
assign 	winv_en = ( snpiq_cnt == 5'd1); 
 
l2t_snp_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_winv_rq_active_s2  // sync reset active high
                           (.din(snpd_rq_winv_s1), 
                 .scan_in(ff_winv_rq_active_s2_scanin),
                 .scan_out(ff_winv_rq_active_s2_scanout),
                 .en(winv_en), .l1clk(l1clk), .clr(winv_reset), 
                 .dout(winv_rq_active_s2),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
assign	sel_snpiq_cnt_reset = (( snpiq_cnt == 5'd17) & winv_rq_active_s2)  | 
			(( snpiq_cnt == 5'd3) &  ~winv_rq_active_s2 ) ; 
 
assign	sel_snpiq_cnt_plus0 = ( |(snpiq_cnt)   | siu_req_vld_s0 ) ; 
assign	snpiq_cnt_plus0 = snpiq_cnt + 5'd1; 
assign	snpiq_cnt_en = sel_snpiq_cnt_plus0 | sel_snpiq_cnt_reset ; 
assign	snpiq_cnt_rst = ~dbb_rst_l ; 
 
l2t_snp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_snpiq_cnt 
		(.dout (snpiq_cnt_in[4:0]), 
               	.din0  (snpiq_cnt_plus0[4:0]),     .din1  (5'b0),   
		.sel0 (~sel_snpiq_cnt_reset), .sel1 (sel_snpiq_cnt_reset)) ; 
 
l2t_snp_ctl_msff_ctl_macro__clr_1__en_1__width_5 ff_snpiq_cnt  // sync reset active high
                           (.din(snpiq_cnt_in[4:0]), 
               	.scan_in(ff_snpiq_cnt_scanin),
               	.scan_out(ff_snpiq_cnt_scanout),
               	.en(snpiq_cnt_en), .l1clk(l1clk), .clr(snpiq_cnt_rst), 
               	.dout(snpiq_cnt[4:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
 
 
/////////////////////////////////////////////////////////////////// 
// Instruction WR pointer logic.  
// Wr pointer is initialized at 1 and toggles between 
// 0 and 1 everytime a req is written into the  
// snp IQ. A request is considered to be written when the 
// request counter is reset to 0. 
/////////////////////////////////////////////////////////////////// 
 
assign	wr_ptr_in = (( ~wr_ptr & sel_snpiq_cnt_reset ) | wr_ptr ) & // set condition 
		~( wr_ptr & sel_snpiq_cnt_reset ) ; // reset condition. 
		     
 
l2t_snp_ctl_msff_ctl_macro__clr_1__width_1 ff_wr_ptr  // sync reset active low
				(.dout(wr_ptr), .din (wr_ptr_in), 
              .scan_in(ff_wr_ptr_scanin),
              .scan_out(ff_wr_ptr_scanout),
              .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk)  
 
             ) ; 
 
assign	snp_wr_ptr = wr_ptr ; 
 
 
 
/////////////////////////// 
// Wenable generation into  
// the snpIQ 
/////////////////////////// 
 
assign	snp_hdr1_wen0_s0 = ~wr_ptr & (snpiq_cnt==5'd0)  & siu_req_vld_s0 ; 
assign	snp_hdr2_wen0_s1 = ~wr_ptr & (snpiq_cnt==5'd1) ; 
assign	snp_snp_data1_wen0_s2 = ~wr_ptr & (snpiq_cnt==5'd2) ; 
assign	snp_snp_data2_wen0_s3 = ~wr_ptr & (snpiq_cnt==5'd3) ; 
 
assign	snp_hdr1_wen1_s0 = wr_ptr & (snpiq_cnt==5'd0)  & siu_req_vld_s0; 
assign	snp_hdr2_wen1_s1 = wr_ptr & (snpiq_cnt==5'd1) ; 
assign	snp_snp_data1_wen1_s2 = wr_ptr & (snpiq_cnt==5'd2) ; 
assign	snp_snp_data2_wen1_s3 = wr_ptr & (snpiq_cnt==5'd3) ; 
 
   
/////////////////////////// 
// Wenable generation into  
// rdmatag cam2 
/////////////////////////// 


l2t_snp_ctl_msff_ctl_macro__width_4 ff_mbist_signals 
        (
        .scan_in(ff_mbist_signals_scanin),
        .scan_out(ff_mbist_signals_scanout),
        .dout   ({l2t_mb2_rdmatag_wr_en_r1,l2t_mb2_rdmatag_wr_en_r2,l2t_mb2_rdmatag_wr_en_r3,l2t_mb2_run_r1}),
        .din    ({l2t_mb2_rdmatag_wr_en,l2t_mb2_rdmatag_wr_en_r1,l2t_mb2_rdmatag_wr_en_r2,l2t_mb2_run}),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


 
assign	snp_rdmatag_wr_en_s2 = l2t_mb2_run_r1 ? l2t_mb2_rdmatag_wr_en_r3 : (winv_rq_active_s2 & ( snpiq_cnt==5'd2 )); 


assign snp_rdmatag_wr_en_s2_4muxsel = snpd_rq_winv_s1 &  ( snpiq_cnt==5'd1 );

l2t_snp_ctl_msff_ctl_macro__dmsff_32x__width_2 ff_snp_rdmatag_wr_en_s2_4muxsel_d1 
        (
        .scan_in(ff_snp_rdmatag_wr_en_s2_4muxsel_d1_scanin),
        .scan_out(ff_snp_rdmatag_wr_en_s2_4muxsel_d1_scanout),
        .dout   ({snp_rdmatag_wr_en_s2_4muxsel_d1_n,snp_rdmatag_wr_en_s2_4muxsel_d1}),
        .din    ({~snp_rdmatag_wr_en_s2_4muxsel,snp_rdmatag_wr_en_s2_4muxsel}),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );



 
/////////////////////////// 
// Wenable generation into  
// rdmadata  
// This signal is calculated 
// in S1 and then staged. 
// data write happens starting in s4 all the way upto 
// 
/////////////////////////// 
 
assign	rdmadata_wen_s1[0] = ( snpiq_cnt==5'd1) ; 
assign	rdmadata_wen_s1[1] = ( snpiq_cnt==5'd2) ; 
assign	rdmadata_wen_s1[2] = ( snpiq_cnt==5'd3) ; 
assign	rdmadata_wen_s1[3] = ( snpiq_cnt==5'd4) ; 
assign	rdmadata_wen_s1[4] = ( snpiq_cnt==5'd5) ; 
assign	rdmadata_wen_s1[5] = ( snpiq_cnt==5'd6) ; 
assign	rdmadata_wen_s1[6] = ( snpiq_cnt==5'd7) ; 
assign	rdmadata_wen_s1[7] = ( snpiq_cnt==5'd8) ; 
assign	rdmadata_wen_s1[8] = ( snpiq_cnt==5'd9) ; 
assign	rdmadata_wen_s1[9] = ( snpiq_cnt==5'd10) ; 
assign	rdmadata_wen_s1[10] = ( snpiq_cnt==5'd11) ; 
assign	rdmadata_wen_s1[11] = ( snpiq_cnt==5'd12) ; 
assign	rdmadata_wen_s1[12] = ( snpiq_cnt==5'd13) ; 
assign	rdmadata_wen_s1[13] = ( snpiq_cnt==5'd14) ; 
assign	rdmadata_wen_s1[14] = ( snpiq_cnt==5'd15) ; 
assign	rdmadata_wen_s1[15] = ( snpiq_cnt==5'd16) ; 
 
 
l2t_snp_ctl_msff_ctl_macro__dmsff_32x__width_16 ff_rdmadata_wen_s2 
                           (.din(rdmadata_wen_s1[15:0]), .l1clk(l1clk), 
                 .scan_in(ff_rdmadata_wen_s2_scanin),
                 .scan_out(ff_rdmadata_wen_s2_scanout),
                 .dout(rdmadata_wen_s2[15:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_snp_ctl_msff_ctl_macro__clr_1__dmsff_32x__en_1__width_1 ff_winv_rq_active_s2_1  // sync reset active high
                           (.din(snpd_rq_winv_s1), 
                 .scan_in(ff_winv_rq_active_s2_1_scanin),
                 .scan_out(ff_winv_rq_active_s2_1_scanout),
                 .en(winv_en), .l1clk(l1clk), .clr(winv_reset), 
                 .dout(winv_rq_active_s2_1),
  .siclk(siclk),
  .soclk(soclk)  
); 
 

//assign	l2t_l2b_rdma_wren_s2 = rdmadata_wen_s2 &  {16{winv_rq_active_s2_1}} ; 

// FED UP OF RUNSCF INSTANTIATING LOGIC

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_0
	(
	.in0	(rdmadata_wen_s2[0]),
	.in1	(winv_rq_active_s2_1),
	.out	(l2t_l2b_rdma_wren_s2_n[0])
	);

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_1
        (
        .in0    (rdmadata_wen_s2[1]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[1])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_2
        (
        .in0    (rdmadata_wen_s2[2]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[2])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_3
        (
        .in0    (rdmadata_wen_s2[3]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[3])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_4
        (
        .in0    (rdmadata_wen_s2[4]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[4])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_5
        (
        .in0    (rdmadata_wen_s2[5]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[5])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_6
        (
        .in0    (rdmadata_wen_s2[6]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[6])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_7
        (
        .in0    (rdmadata_wen_s2[7]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[7])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_8
        (
        .in0    (rdmadata_wen_s2[8]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[8])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_9
        (
        .in0    (rdmadata_wen_s2[9]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[9])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_10
        (
        .in0    (rdmadata_wen_s2[10]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[10])
        );
cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_11
        (
        .in0    (rdmadata_wen_s2[11]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[11])
        );
cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_12
        (
        .in0    (rdmadata_wen_s2[12]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[12])
        );
cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_13
        (
        .in0    (rdmadata_wen_s2[13]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[13])
        );
cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_14
        (
        .in0    (rdmadata_wen_s2[14]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[14])
        );

cl_u1_nand2_32x nand_l2t_l2b_rdma_wren_s2_n_15
        (
        .in0    (rdmadata_wen_s2[15]),
        .in1    (winv_rq_active_s2_1),
        .out    (l2t_l2b_rdma_wren_s2_n[15])
        );

cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_0 ( .in	(l2t_l2b_rdma_wren_s2_n[0]),  .out	(l2t_l2b_rdma_wren_s2[0]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_1 ( .in	(l2t_l2b_rdma_wren_s2_n[1]),  .out	(l2t_l2b_rdma_wren_s2[1]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_2 ( .in	(l2t_l2b_rdma_wren_s2_n[2]),  .out	(l2t_l2b_rdma_wren_s2[2]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_3 ( .in	(l2t_l2b_rdma_wren_s2_n[3]),  .out	(l2t_l2b_rdma_wren_s2[3]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_4 ( .in	(l2t_l2b_rdma_wren_s2_n[4]),  .out	(l2t_l2b_rdma_wren_s2[4]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_5 ( .in	(l2t_l2b_rdma_wren_s2_n[5]),  .out	(l2t_l2b_rdma_wren_s2[5]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_6 ( .in	(l2t_l2b_rdma_wren_s2_n[6]),  .out	(l2t_l2b_rdma_wren_s2[6]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_7 ( .in	(l2t_l2b_rdma_wren_s2_n[7]),  .out	(l2t_l2b_rdma_wren_s2[7]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_8 ( .in	(l2t_l2b_rdma_wren_s2_n[8]),  .out	(l2t_l2b_rdma_wren_s2[8]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_9 ( .in	(l2t_l2b_rdma_wren_s2_n[9]),  .out	(l2t_l2b_rdma_wren_s2[9]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_10 ( .in	(l2t_l2b_rdma_wren_s2_n[10]), .out	(l2t_l2b_rdma_wren_s2[10]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_11 ( .in	(l2t_l2b_rdma_wren_s2_n[11]), .out	(l2t_l2b_rdma_wren_s2[11]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_12 ( .in	(l2t_l2b_rdma_wren_s2_n[12]), .out	(l2t_l2b_rdma_wren_s2[12]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_13 ( .in	(l2t_l2b_rdma_wren_s2_n[13]), .out	(l2t_l2b_rdma_wren_s2[13]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_14 ( .in	(l2t_l2b_rdma_wren_s2_n[14]), .out	(l2t_l2b_rdma_wren_s2[14]));
cl_u1_inv_48x inv_l2t_l2b_rdma_wren_s2_15 ( .in	(l2t_l2b_rdma_wren_s2_n[15]), .out	(l2t_l2b_rdma_wren_s2[15]));

/////////////////////////// 
// Write Wline generation 
/////////////////////////// 
 
 
 
l2t_snp_ctl_msff_ctl_macro__dmsff_32x__width_4 ff_rdmad_wr_entry_s2 
                           (.din({rdmat_wr_entry_s1[1:0],rdmat_wr_entry_s1[1:0]}), .l1clk(l1clk), 
                 .scan_in(ff_rdmad_wr_entry_s2_scanin),
                 .scan_out(ff_rdmad_wr_entry_s2_scanout),
                 .dout({snp_rdmad_wr_entry_s2[1:0],snp_rdmad_wr_entry_s2_internal[1:0]}),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_snp_ctl_msff_ctl_macro__clr_1__dmsff_32x__width_2 ff_rdmad_wr_entry_s2_d1  // sync reset active low
                           (.din(rdmad_wr_wl_s2[1:0]), .l1clk(l1clk), 
		 .scan_in(ff_rdmad_wr_entry_s2_d1_scanin),
		 .scan_out(ff_rdmad_wr_entry_s2_d1_scanout),
		 .clr(~dbb_rst_l), 
                 .dout(rdmad_wr_entry_s2_d1[1:0]),
  .siclk(siclk),
  .soclk(soclk)  
); 
 
l2t_snp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 mux_rdmad_wr_entry_s2 
                (.dout (rdmad_wr_wl_s2[1:0]) ,
                        .din0(snp_rdmad_wr_entry_s2[1:0]),  // new entry
                        .din1(rdmad_wr_entry_s2_d1[1:0]), // old entry
                        .sel0(snp_rdmatag_wr_en_s2_4muxsel_d1),  //  wr64 in s2
                        .sel1(~snp_rdmatag_wr_en_s2_4muxsel_d1)) ; // ~wr64 in S2

//assign  l2t_l2b_rdma_wrwl_s2 = rdmad_wr_wl_s2;


// FED UP OF RUNSCF INSTANTIATING LOGIC
cl_u1_nand2_32x nand_bit0_stage_a
        (
        .out    (l2t_l2b_rdma_wrwl_s2_bit0_a),
        .in0    (snp_rdmad_wr_entry_s2_internal[0]),
        .in1    (snp_rdmatag_wr_en_s2_4muxsel_d1)
        );

cl_u1_nand2_32x nand_bit0_stage_b
        (
        .out    (l2t_l2b_rdma_wrwl_s2_bit0_b),
        .in0    (rdmad_wr_entry_s2_d1[0]),
        .in1    (snp_rdmatag_wr_en_s2_4muxsel_d1_n)
        );

cl_u1_nand2_32x nand_bit0_stage_final
        (
        .out    (l2t_l2b_rdma_wrwl_s2[0]),
        .in0    (l2t_l2b_rdma_wrwl_s2_bit0_b),
        .in1    (l2t_l2b_rdma_wrwl_s2_bit0_a)
        );


cl_u1_nand2_32x nand_bit1_stage_a
        (
        .out    (l2t_l2b_rdma_wrwl_s2_bit1_a),
        .in0    (snp_rdmad_wr_entry_s2_internal[1]),
        .in1    (snp_rdmatag_wr_en_s2_4muxsel_d1)
        );

cl_u1_nand2_32x nand_bit1_stage_b
        (
        .out    (l2t_l2b_rdma_wrwl_s2_bit1_b),
        .in0    (rdmad_wr_entry_s2_d1[1]),
        .in1    (snp_rdmatag_wr_en_s2_4muxsel_d1_n)
        );

cl_u1_nand2_32x nand_bit1_stage_final
        (
        .out    (l2t_l2b_rdma_wrwl_s2[1]),
        .in0    (l2t_l2b_rdma_wrwl_s2_bit1_b),
        .in1    (l2t_l2b_rdma_wrwl_s2_bit1_a)
        );

/////////////////////////// 
// Valid bit generation in the 
// SNPIQ 
// set when an instruction in written 
// into the snp IQ.i.e. in the S3 or S17 cycles. 
// reset when an instruction is issued 
// down the pipe. 
/////////////////////////// 
 
// Removed '[0]' at the end of sel_snpiq_cnt_reset for synthesis 
// - connie 1/16/2003 
 
assign	snpq_valid_in[0]  = ( snpq_valid[0] | ( ~wr_ptr & sel_snpiq_cnt_reset ) ) & 
				~( ~rd_ptr & arb_snpsel_c1 ) ; 
	 
assign	snpq_valid_in[1]  = ( snpq_valid[1] | ( wr_ptr & sel_snpiq_cnt_reset ) ) & 
				~( rd_ptr & arb_snpsel_c1 ) ; 
 
l2t_snp_ctl_msff_ctl_macro__clr_1__width_2 ff_snp_valid  // sync reset active low
				(.dout(snpq_valid[1:0]), .din (snpq_valid_in[1:0]), 
              .scan_in(ff_snp_valid_scanin),
              .scan_out(ff_snp_valid_scanout),
              .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
 
//assign	snp_snpq_arb_vld_px1 = (|( snpq_valid )) & ~snp_stall ; 
assign	snp_snpq_arb_vld_px1 = (|( snpq_valid )) ; 
 
// assign	snp_snpq_arb_vld_px1 = 0; 
 
 
///////////////////////////////////////////////////////////////////// 
// Instruction RD pointer logic. 
// Read pointer is used for select the requests in FIFO order 
// Rd pointer is initialized at 1 and toggles between 
// 0 and 1 everytime a req is issued down the pipe from the snpIQ 
///////////////////////////////////////////////////////////////////// 
 
assign  rd_ptr_in = (( ~rd_ptr & arb_snpsel_c1 ) | rd_ptr ) & // set condition 
                        ~( rd_ptr & arb_snpsel_c1 ) ; // reset condition. 
                     
 
l2t_snp_ctl_msff_ctl_macro__clr_1__width_1 ff_rd_ptr  // sync reset active low
				(.dout(rd_ptr), .din (rd_ptr_in), 
              .scan_in(ff_rd_ptr_scanin),
              .scan_out(ff_rd_ptr_scanout),
              .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk)  
) ; 
 
 
assign	snp_rd_ptr = rd_ptr; 


 
// fixscan start:
assign reset_flop_scanin         = scan_in                  ;
assign spares_scanin             = reset_flop_scanout       ;
assign ff_siu_req_vld_s0_scanin  = spares_scanout           ;
assign ff_l2t_dbg_sii_iq_dequeue_scanin = ff_siu_req_vld_s0_scanout;
assign ff_arb_snp_snpsel_px2_scanin = ff_l2t_dbg_sii_iq_dequeue_scanout;
assign ff_winv_rq_active_s2_scanin = ff_arb_snp_snpsel_px2_scanout;
assign ff_snpiq_cnt_scanin       = ff_winv_rq_active_s2_scanout;
assign ff_wr_ptr_scanin          = ff_snpiq_cnt_scanout     ;
assign ff_mbist_signals_scanin   = ff_wr_ptr_scanout        ;
assign ff_snp_rdmatag_wr_en_s2_4muxsel_d1_scanin = ff_mbist_signals_scanout ;
assign ff_rdmadata_wen_s2_scanin = ff_snp_rdmatag_wr_en_s2_4muxsel_d1_scanout;
assign ff_winv_rq_active_s2_1_scanin = ff_rdmadata_wen_s2_scanout;
assign ff_rdmad_wr_entry_s2_scanin = ff_winv_rq_active_s2_1_scanout;
assign ff_rdmad_wr_entry_s2_d1_scanin = ff_rdmad_wr_entry_s2_scanout;
assign ff_snp_valid_scanin       = ff_rdmad_wr_entry_s2_d1_scanout;
assign ff_rd_ptr_scanin          = ff_snp_valid_scanout     ;
assign scan_out                  = ff_rd_ptr_scanout        ;
// fixscan end:
endmodule 
 







// any PARAMS parms go into naming of macro

module l2t_snp_ctl_msff_ctl_macro__width_1 (
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


module l2t_snp_ctl_spare_ctl_macro__num_4 (
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

module l2t_snp_ctl_l1clkhdr_ctl_macro (
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

module l2t_snp_ctl_msff_ctl_macro__width_2 (
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

module l2t_snp_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{clr}}) | (dout[0:0] & ~{1{en}} & ~{1{clr}});






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

module l2t_snp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_snp_ctl_msff_ctl_macro__clr_1__en_1__width_5 (
  din, 
  en, 
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
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}} & ~{5{clr}}) | (dout[4:0] & ~{5{en}} & ~{5{clr}});






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

module l2t_snp_ctl_msff_ctl_macro__clr_1__width_1 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{clr}};






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

module l2t_snp_ctl_msff_ctl_macro__width_4 (
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

module l2t_snp_ctl_msff_ctl_macro__dmsff_32x__width_2 (
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

module l2t_snp_ctl_msff_ctl_macro__dmsff_32x__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_snp_ctl_msff_ctl_macro__clr_1__dmsff_32x__en_1__width_1 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{clr}}) | (dout[0:0] & ~{1{en}} & ~{1{clr}});






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

module l2t_snp_ctl_msff_ctl_macro__dmsff_32x__width_4 (
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

module l2t_snp_ctl_msff_ctl_macro__clr_1__dmsff_32x__width_2 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{clr}};






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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snp_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_2 (
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






// any PARAMS parms go into naming of macro

module l2t_snp_ctl_msff_ctl_macro__clr_1__width_2 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{clr}};






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








