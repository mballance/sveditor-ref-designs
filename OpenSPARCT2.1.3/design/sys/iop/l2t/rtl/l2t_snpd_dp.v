// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_snpd_dp.v
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


 
 
module l2t_snpd_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_out, 
  snpd_snpq_arbdp_addr_px2, 
  snpd_snpq_arbdp_inst_px2, 
  snpd_snpq_arbdp_data_px2, 
  snpd_ecc_px2, 
  snpd_rq_winv_s1, 
  snpd_rdmatag_wr_addr_s2, 
  l2clk, 
  scan_in, 
  sii_l2t_req, 
  sii_l2b_ecc, 
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
  l2t_mb2_wdata, 
  l2t_mb2_run, 
  l2t_siu_delay);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire l2t_siu_delay_n;
wire ff_siu_req_delay_scanin;
wire ff_siu_req_delay_scanout;
wire [31:0] rdmat_sii_req_dely;
wire [31:0] muxed_dly_rdmat_sii_req;
wire ff_siu_ecc_delay_scanin;
wire ff_siu_ecc_delay_scanout;
wire [6:0] sii_l2b_ecc_delay;
wire [6:0] muxed_dly_rdmat_sii_ecc;
wire ff_siu_req_scanin;
wire ff_siu_req_scanout;
wire [31:0] rdmat_sii_req_buf;
wire ff_siu_ecc_scanin;
wire ff_siu_ecc_scanout;
wire [6:0] sii_l2b_ecc_d1;
wire ff_MERGED_scanin;
wire ff_MERGED_scanout;
wire [6:0] instr0_ecc;
wire ff_instr0_entry_scanin;
wire ff_instr0_entry_scanout;
wire ff_addr0_2_scanin;
wire ff_addr0_2_scanout;
wire ff_data0_1_scanin;
wire ff_data0_1_scanout;
wire ff_data0_2_scanin;
wire ff_data0_2_scanout;
wire ff_addr1_1_MERGED_scanin;
wire ff_addr1_1_MERGED_scanout;
wire [6:0] instr1_ecc;
wire ff_instr1_entry_scanin;
wire ff_instr1_entry_scanout;
wire ff_addr1_2_scanin;
wire ff_addr1_2_scanout;
wire ff_data1_1_scanin;
wire ff_data1_1_scanout;
wire ff_data1_2_scanin;
wire ff_data1_2_scanout;
wire l2t_mb2_run_r1_n;
wire snp_wr_ptr_n;
wire l2t_mb2_run_r1;
wire [39:6] snpd_rdmatag_wr_addr_s2_fnl;
wire [7:0] l2t_mb2_wdata_r3;
wire ff_snp_rd_ptr_d1_5_MERGED_scanin;
wire ff_snp_rd_ptr_d1_5_MERGED_scanout;
wire [7:0] l2t_mb2_wdata_r1;
wire [7:0] l2t_mb2_wdata_r2;
wire snp_rd_ptr_n;
wire snp_rd_ptr_d1_5;
wire snp_rd_ptr_d1_n;
wire snp_rd_ptr_d1_1_n;
wire [39:0] snpd_snpq_arbdp_addr_px2_unbuff;
wire snp_rd_ptr_d1_5_n;
wire snp_rd_ptr_d1_2_n;
wire snp_rd_ptr_d1_3_n;


input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input 		tcu_scan_en;
input 		tcu_clk_stop;
 
output 		scan_out; 
 
// to the arbiter 
output [39:0]			snpd_snpq_arbdp_addr_px2; 
output [`JBI_HDR_SZ-1:0]	snpd_snpq_arbdp_inst_px2; // this bus has grown by 1 bit since 2.0 
output [63:0]			snpd_snpq_arbdp_data_px2; 
output [6:0]			snpd_ecc_px2; 
 
// to snp 
output		snpd_rq_winv_s1; // to snp ctl; 
 
// to rdmatag 
output	[39:6]	snpd_rdmatag_wr_addr_s2 ; 
 
input	l2clk;
input scan_in; 
 
// from siu 
input	[31:0]	sii_l2t_req; 	// Phase 2 : SIU inteface and packet format change 2/7/04
input	[ 6:0]	sii_l2b_ecc; 	// RAS implementation 10/14/04
 
 // from snp 
input   snp_hdr1_wen0_s0, snp_hdr2_wen0_s1, snp_snp_data1_wen0_s2, snp_snp_data2_wen0_s3 ; 
input   snp_hdr1_wen1_s0, snp_hdr2_wen1_s1, snp_snp_data1_wen1_s2, snp_snp_data2_wen1_s3 ; 
input	snp_wr_ptr; 
input	snp_rd_ptr; 
input	[1:0]	snp_rdmad_wr_entry_s2; 

// mb2  controller

input	[7:0]	l2t_mb2_wdata;
input		l2t_mb2_run;

// from cpu 

input		l2t_siu_delay;

 
assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;


 
wire	[`JBI_HDR_SZ-1:0]	instr0;  
wire	[`JBI_HDR_SZ-1:0]	instr1;  
wire	[39:0]	addr0;  
wire	[39:0]	addr1;  
wire	[63:0]	data0; 
wire	[63:0]	data1; 
 
wire	snp_rd_ptr_d1, snp_rd_ptr_d1_1, snp_rd_ptr_d1_2, snp_rd_ptr_d1_3 ; 
 
wire	snp_rd_ptr_d1_4; 
 
//////////////////////////////////////////////////////////////////////////////////////////////////
//  data path is 92 bits wide. 
//  address = 40 bits 
//  header  = 20 bits 
//  data    = 64 bits/2  
//////////////////////////////////////////////////////////////////////////////////////////////////
//  Phase 2 : SIU inteface and packet format change 2/7/04 
// In cycle 1 write 24 bits of header and 8 bits of address. 
//	WRI					WR8				RDD
//[31] = don't care                     [31] = don't care               [31] = don't care
//[30] = 'O'rdered bit                  [30] = 'O'rdered bit            [30] = 'O'rdered bit
//[29] = 'P'osted bit                   [29] = 'P'osted bit             [29] = 'P'osted bit
//[28] = 'E'rror bit                    [28] = 'E'rror bit              [28] = 'E'rror bit
//[27] = 'S'ource bit (DMU/NIU)         [27] = 'S'ource bit (DMU/NIU)   [27] = 'S'ource bit (DMU/NIU)
//[26:24] = 3'b100 for WRI              [26:24] = 3'b010 for WR8        [26:24] = 3'b001 for RDD
//[23:08] = Tag bits[15:0]              [23:16] = Don't care            [23:08] = Tag bits[15:0]
//[7:0] = Address[39:32]                [15:8] = Bytemasks[7:0]         [7:0] = Address[39:32]
//                                      [7:0] = Address[39:32]
//////////////////////////////////////////////////////////////////////////////////////////////////

l2t_snpd_dp_inv_macro__width_1 inv_l2t_siu_delay 
	(
	.dout	(l2t_siu_delay_n),
	.din	(l2t_siu_delay)
	);


l2t_snpd_dp_msff_macro__stack_32c__width_32 ff_siu_req_delay 
         (
         .scan_in(ff_siu_req_delay_scanin),
         .scan_out(ff_siu_req_delay_scanout),
         .dout(rdmat_sii_req_dely[31:0]),
         .din(sii_l2t_req[31:0]),
         .clk(l2clk),
         .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_34c__width_32  mux_rdmat_sii_req_dely 
         (
         .dout   (muxed_dly_rdmat_sii_req[31:0]),
         .din0   (sii_l2t_req[31:0]),
         .din1   (rdmat_sii_req_dely[31:0]),
         .sel0   (l2t_siu_delay_n),
         .sel1   (l2t_siu_delay)
         );

l2t_snpd_dp_msff_macro__stack_8c__width_7 ff_siu_ecc_delay 
         (
         .scan_in(ff_siu_ecc_delay_scanin),
         .scan_out(ff_siu_ecc_delay_scanout),
         .din(sii_l2b_ecc[6:0]),
         .dout(sii_l2b_ecc_delay[6:0]),
         .clk(l2clk),
         .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_8c__width_7  mux_siu_ecc_dly 
         (
         .dout   (muxed_dly_rdmat_sii_ecc[6:0]),
         .din0   (sii_l2b_ecc[6:0]),
         .din1   (sii_l2b_ecc_delay[6:0]),
         .sel0   (l2t_siu_delay_n),
         .sel1   (l2t_siu_delay)
         );



// Phase 2 : SIU inteface and packet format change 2/7/04
// This adds the 1 cycle delay to the req bus from SIU hence lining
// up timing 

l2t_snpd_dp_msff_macro__stack_32c__width_32 ff_siu_req 
         (
         .scan_in(ff_siu_req_scanin),
         .scan_out(ff_siu_req_scanout),
         .dout(rdmat_sii_req_buf[31:0]),
         .din(muxed_dly_rdmat_sii_req[31:0]), 
	 .clk(l2clk),
         .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_snpd_dp_msff_macro__stack_7c__width_7 ff_siu_ecc 
         (
         .scan_in(ff_siu_ecc_scanin),
         .scan_out(ff_siu_ecc_scanout),
         .din(muxed_dly_rdmat_sii_ecc[6:0]),
         .dout(sii_l2b_ecc_d1[6:0]),
         .clk(l2clk),
         .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_snpd_dp_msff_macro__stack_39c__width_39 ff_MERGED 
         (
        .scan_in(ff_MERGED_scanin),
        .scan_out(ff_MERGED_scanout),
        .din({sii_l2b_ecc_d1[6:0],rdmat_sii_req_buf[`JBI_RQ_POISON],rdmat_sii_req_buf[`JBI_OPES_HI:`JBI_SZ_LO],rdmat_sii_req_buf[`JBI_ADDR_HI:`JBI_ADDR_LO]}),
        .clk(l2clk),
        .dout({instr0_ecc[6:0],instr0[`JBI_HDR_SZ-1],instr0[`JBI_HDR_SZ-4:0],addr0[39:32]}),
        .en(snp_hdr1_wen0_s0),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

// Phase 2 : SIU inteface and packet format change 2/7/04

l2t_snpd_dp_msff_macro__stack_2c__width_2 ff_instr0_entry 
	 ( 
	 .scan_in(ff_instr0_entry_scanin),
	 .scan_out(ff_instr0_entry_scanout),
	 .din(snp_rdmad_wr_entry_s2[1:0]), .clk(l2clk), 
	 .dout(instr0[`JBI_HDR_SZ-2:`JBI_HDR_SZ-3]), 
         .en(snp_snp_data1_wen0_s2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
// 32 bits of addr <31:0> 
// cycle s2 

l2t_snpd_dp_msff_macro__stack_32c__width_32 ff_addr0_2 
    	(
	.scan_in(ff_addr0_2_scanin),
	.scan_out(ff_addr0_2_scanout),
	.din(rdmat_sii_req_buf[31:0]), .clk(l2clk), 
        .dout(addr0[31:0]),  
	.en(snp_hdr2_wen0_s1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 

	); 
 
// 32 bits of data <63:32> 
// cycle s3 

l2t_snpd_dp_msff_macro__dmsff_16x__stack_32c__width_32 ff_data0_1 
	(
	.scan_in(ff_data0_1_scanin),
	.scan_out(ff_data0_1_scanout),
	.din(rdmat_sii_req_buf[31:0]), .clk(l2clk), 
	.dout(data0[63:32]),  
	.en(snp_snp_data1_wen0_s2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
// 32 bits of data <31:0> 
// cycle s4 


l2t_snpd_dp_msff_macro__dmsff_16x__stack_32c__width_32 ff_data0_2 
	(
	.scan_in(ff_data0_2_scanin),
	.scan_out(ff_data0_2_scanout),
	.din(rdmat_sii_req_buf[31:0]), .clk(l2clk), 
        .dout(data0[31:0]),  
	.en(snp_snp_data2_wen0_s3),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
// In cycle 1 write 24 bits of header and 8 bits of address. 
// Header = wr64 wr8 rd CTAG<11:0> RSVD SZ<7:0>  
// address : 7:0
// size : 15:8
// rsvd : 16
// ctag : 28:17
// rd : 29
// wr8 : 30
// wr64 : 31
// cycle s1
 
l2t_snpd_dp_msff_macro__stack_39c__width_39 ff_addr1_1_MERGED 
        (
        .scan_in(ff_addr1_1_MERGED_scanin),
        .scan_out(ff_addr1_1_MERGED_scanout),
        .din({sii_l2b_ecc_d1[6:0],rdmat_sii_req_buf[`JBI_OPES_HI:`JBI_SZ_LO],rdmat_sii_req_buf[`JBI_ADDR_HI:`JBI_ADDR_LO],rdmat_sii_req_buf[`JBI_RQ_POISON]}),
        .clk(l2clk),
        .dout({instr1_ecc[6:0],instr1[`JBI_HDR_SZ-4:0],addr1[39:32],instr1[`JBI_HDR_SZ-1]}),
        .en(snp_hdr1_wen1_s0),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
        );

// Phase 2 : SIU inteface and packet format change 2/7/04

l2t_snpd_dp_msff_macro__stack_2c__width_2 ff_instr1_entry 
	( 
	.scan_in(ff_instr1_entry_scanin),
	.scan_out(ff_instr1_entry_scanout),
	.din(snp_rdmad_wr_entry_s2[1:0]), .clk(l2clk), 
	.dout(instr1[`JBI_HDR_SZ-2:`JBI_HDR_SZ-3]), 
	.en(snp_snp_data1_wen1_s2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 

 
// 32 bits of addr <31:0> 
// cycle s2 


l2t_snpd_dp_msff_macro__stack_32c__width_32 ff_addr1_2 
	(.din(rdmat_sii_req_buf[31:0]), .clk(l2clk), 
	.scan_in(ff_addr1_2_scanin),
	.scan_out(ff_addr1_2_scanout),
	.dout(addr1[31:0]), 
	.en(snp_hdr2_wen1_s1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 


 
// 32 bits of data <63:32> 
// cycle s3 

l2t_snpd_dp_msff_macro__dmsff_16x__stack_32c__width_32 ff_data1_1 
    	(
	.scan_in(ff_data1_1_scanin),
	.scan_out(ff_data1_1_scanout),
	.din(rdmat_sii_req_buf[31:0]), .clk(l2clk), 
        .dout(data1[63:32]), 
        .en(snp_snp_data1_wen1_s2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
// 32 bits of data <31:0> 
// cycle s4 

l2t_snpd_dp_msff_macro__dmsff_16x__stack_32c__width_32 ff_data1_2 
	(
	.scan_in(ff_data1_2_scanin),
	.scan_out(ff_data1_2_scanout),
	.din(rdmat_sii_req_buf[31:0]), .clk(l2clk), 
	.dout(data1[31:0]), 
	.en(snp_snp_data2_wen1_s3),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	); 
 
 
 
 
///////////////////////////////////////////////// 
// A 34 bit mux is used to mux out the address 
// of the request that is being sent from the siu. 
// Hence wr ptr is used for this mux. 
// If this request happens to be a WR64, the  
// address is written into the rdma tags. 
///////////////////////////////////////////////// 

l2t_snpd_dp_inv_macro__width_2 snp_wr_ptr_inv_slice  
	( 
	.dout	({l2t_mb2_run_r1_n,snp_wr_ptr_n}), 
	.din	({l2t_mb2_run_r1,snp_wr_ptr}) 
	);	

 
l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_35c__width_35 mux_MERGED 
                        (.dout ({snpd_rdmatag_wr_addr_s2_fnl[39:6],snpd_rq_winv_s1}) ,
                        .din0({addr0[39:6],instr0[`JBINST_RQ_WR64]}),  // entry0
                        .din1({addr1[39:6],instr1[`JBINST_RQ_WR64]}), // entry1
                        .sel0(snp_wr_ptr_n),  // entry 0 is being written
                        .sel1(snp_wr_ptr)) ; // entry 1 is being written

l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_34c__width_34  mux_snpd_rdmatag_wr_addr_s2 
               (
		.dout (snpd_rdmatag_wr_addr_s2[39:6]),
		.din0	(snpd_rdmatag_wr_addr_s2_fnl[39:6]),
		.din1	({l2t_mb2_wdata_r3[1:0],{4{l2t_mb2_wdata_r3[7:0]}}}),
		.sel0	(l2t_mb2_run_r1_n),
		.sel1	(l2t_mb2_run_r1)
		);


 
	 
///////////////////////////////////////////////// 
// The snp q output is a mux between the  
// entry0 and entry1. 
// 
// rd pointer is updated when arb_snpsel_c1  
//  
///////////////////////////////////////////////// 
 
 
l2t_snpd_dp_msff_macro__dmsff_32x__stack_32c__width_32 ff_snp_rd_ptr_d1_5_MERGED 
       (
	.scan_in(ff_snp_rd_ptr_d1_5_MERGED_scanin),
	.scan_out(ff_snp_rd_ptr_d1_5_MERGED_scanout),
	.din({l2t_mb2_wdata[7:0],l2t_mb2_wdata_r1[7:0],l2t_mb2_wdata_r2[7:0],
		l2t_mb2_run,snp_rd_ptr,snp_rd_ptr,snp_rd_ptr,
		snp_rd_ptr,snp_rd_ptr,snp_rd_ptr,snp_rd_ptr_n}),
	.clk(l2clk),
	.dout({l2t_mb2_wdata_r1[7:0],l2t_mb2_wdata_r2[7:0],l2t_mb2_wdata_r3[7:0],
		l2t_mb2_run_r1,snp_rd_ptr_d1_5,
	snp_rd_ptr_d1_4,snp_rd_ptr_d1_3,snp_rd_ptr_d1_2,
	snp_rd_ptr_d1_1,snp_rd_ptr_d1,snp_rd_ptr_d1_n}),
	.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	); 

l2t_snpd_dp_inv_macro__width_1 snp_rd_ptr_inv_slice  
	( 
	.dout	(snp_rd_ptr_n ), 
	.din	(snp_rd_ptr ) 
	);	

 
l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_27c__width_26 mux_instr_px2 
			(.dout (snpd_snpq_arbdp_inst_px2[`JBI_HDR_SZ-1:0]), 
                	.din0(instr0[`JBI_HDR_SZ-1:0]),  // entry0 
                	.din1(instr1[`JBI_HDR_SZ-1:0]),  // entry1 
                	.sel0(snp_rd_ptr_d1_n),  // entry 0 is being written 
			.sel1(snp_rd_ptr_d1)) ; // entry 1 is being written 

l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 mux_snp_ecc_px2 
			(.dout (snpd_ecc_px2[6:0]), 
                	.din0  (instr0_ecc[6:0]),  // entry0 
                	.din1  (instr1_ecc[6:0]),  // entry1 
                	.sel0  (snp_rd_ptr_d1_n),  // entry 0 is being written 
			.sel1  (snp_rd_ptr_d1)) ; // entry 1 is being written 





 
 
// Change 6/13/2003 
// 1) use an 8x flop for snp_rd_ptr_d1_4, snp_rd_ptr_d1_5  
// The above signals can be used for the more critical address bits <17:8> 
// transmit the selects close to the affected bits before flopping them so 
// as to save time in PX2. 
// 2) The 2-1 addr mux ( use a 2x mux) can be performed between ~addr0 and ~addr1. 
//    The result can be driven using a 40x buffer  
 

l2t_snpd_dp_inv_macro__width_1 snp_rd_ptr_d1_1_inv_slice  
	( 
	.dout	(snp_rd_ptr_d1_1_n ), 
	.din	(snp_rd_ptr_d1_1 ) 
	);	

//buff_macro buff_snpd_snpq_arbdp_addr_px2_1  (width=30,stack=30c,dbuff=32x)
//	(
//	.dout	({snpd_snpq_arbdp_addr_px2[39:18],snpd_snpq_arbdp_addr_px2[7:0]}) ,
//	.din	({snpd_snpq_arbdp_addr_px2_unbuff[39:18],snpd_snpq_arbdp_addr_px2_unbuff[7:0]}) ,
//	);

assign snpd_snpq_arbdp_addr_px2[39:0] = snpd_snpq_arbdp_addr_px2_unbuff[39:0];

 
l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_30c__width_30 mux_addr_px2_39_18_MERGED 
        (
	.dout ({snpd_snpq_arbdp_addr_px2_unbuff[39:18],snpd_snpq_arbdp_addr_px2_unbuff[7:0]}) ,
        .din0({addr0[39:18],addr0[7:0]}),  // entry0
        .din1({addr1[39:18],addr1[7:0]}),  // entry1
        .sel0(snp_rd_ptr_d1_1_n)  // entry 0 is being read
	); // entry 1 is being read
 
l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_5c__width_5 mux_addr_px2_17_13 
			(.dout (snpd_snpq_arbdp_addr_px2_unbuff[17:13]) , 
                	.din0(addr1[17:13]),  // entry1 
                	.din1(addr0[17:13]),  // entry0 
                	.sel0(snp_rd_ptr_d1_4)  // entry 0 is being read 
			) ; // entry 1 is being read 
 
l2t_snpd_dp_inv_macro__width_1 snp_rd_ptr_d1_5_inv_slice  
	( 
	.dout	(snp_rd_ptr_d1_5_n ),
	.din	(snp_rd_ptr_d1_5 ) 
	);	

l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_5c__width_5 mux_addr_px2_12_8 
			(.dout (snpd_snpq_arbdp_addr_px2_unbuff[12:8]) , 
                	.din0(addr0[12:8]),  // entry0 
                	.din1(addr1[12:8]),  // entry1 
                	.sel0(snp_rd_ptr_d1_5_n)  // entry 0 is being read 
			) ; // entry 1 is being read 
 
l2t_snpd_dp_inv_macro__width_1 snp_rd_ptr_d1_2_inv_slice  
	( 
	.dout	(snp_rd_ptr_d1_2_n ), 
	.din	(snp_rd_ptr_d1_2 ) 
	);	
 
 
l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_32c__width_32 mux_data_px2_0 
			(.dout (snpd_snpq_arbdp_data_px2[31:0]) , 
                	.din0(data0[31:0]),  // entry0 
                	.din1(data1[31:0]),  // entry1 
                	.sel0(snp_rd_ptr_d1_2_n)  // entry 0 is being written 
			) ; // entry 1 is being written 
 
 
l2t_snpd_dp_inv_macro__width_1 snp_rd_ptr_d1_3_inv_slice  
	( 
	.dout	(snp_rd_ptr_d1_3_n ), 
	.din	(snp_rd_ptr_d1_3 ) 
	);	


l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_32c__width_32 mux_data_px2_1 
	(
	.dout (snpd_snpq_arbdp_data_px2[63:32]) , 
        .din0(data0[63:32]),  // entry0 
        .din1(data1[63:32]),  // entry1 
        .sel0(snp_rd_ptr_d1_3_n)  // entry 0 is being written 
	);

//buff_macro buff_snpd_snpq_arbdp_data_px2_1 (width=32,stack=32c,dbuff=32x)
//	(
//	.dout	(snpd_snpq_arbdp_data_px2[63:32]),
//	.din	(snpd_snpq_arbdp_data_px2_unbuff[63:32])
//	);
//
//buff_macro buff_snpd_snpq_arbdp_data_px2_2 (width=32,stack=32c,dbuff=32x)
//        (
//        .dout   (snpd_snpq_arbdp_data_px2[31:0]),
//        .din    (snpd_snpq_arbdp_data_px2_unbuff[31:0])
//        );
//







// fixscan start:
assign ff_siu_req_delay_scanin   = scan_in                  ;
assign ff_siu_ecc_delay_scanin   = ff_siu_req_delay_scanout ;
assign ff_siu_req_scanin         = ff_siu_ecc_delay_scanout ;
assign ff_siu_ecc_scanin         = ff_siu_req_scanout       ;
assign ff_MERGED_scanin          = ff_siu_ecc_scanout       ;
assign ff_instr0_entry_scanin    = ff_MERGED_scanout        ;
assign ff_addr0_2_scanin         = ff_instr0_entry_scanout  ;
assign ff_data0_1_scanin         = ff_addr0_2_scanout       ;
assign ff_data0_2_scanin         = ff_data0_1_scanout       ;
assign ff_addr1_1_MERGED_scanin  = ff_data0_2_scanout       ;
assign ff_instr1_entry_scanin    = ff_addr1_1_MERGED_scanout;
assign ff_addr1_2_scanin         = ff_instr1_entry_scanout  ;
assign ff_data1_1_scanin         = ff_addr1_2_scanout       ;
assign ff_data1_2_scanin         = ff_data1_1_scanout       ;
assign ff_snp_rd_ptr_d1_5_MERGED_scanin = ff_data1_2_scanout       ;
assign scan_out                  = ff_snp_rd_ptr_d1_5_MERGED_scanout;
// fixscan end:
endmodule 
 



//
//   invert macro
//
//





module l2t_snpd_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module l2t_snpd_dp_msff_macro__stack_32c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_34c__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  output [31:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_snpd_dp_msff_macro__stack_8c__width_7 (
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
wire [5:0] so;

  input [6:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [6:0] dout;


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
dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_8c__width_7 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [6:0] din0;
  input sel0;
  input [6:0] din1;
  input sel1;
  output [6:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(7)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
.dout(dout[6:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_snpd_dp_msff_macro__stack_7c__width_7 (
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
wire [5:0] so;

  input [6:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [6:0] dout;


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
dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_snpd_dp_msff_macro__stack_39c__width_39 (
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
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_snpd_dp_msff_macro__stack_2c__width_2 (
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
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


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
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_snpd_dp_msff_macro__dmsff_16x__stack_32c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   invert macro
//
//





module l2t_snpd_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_35c__width_35 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [34:0] din0;
  input sel0;
  input [34:0] din1;
  input sel1;
  output [34:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(35)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[34:0]),
  .in1(din1[34:0]),
.dout(dout[34:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_34c__width_34 (
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

module l2t_snpd_dp_msff_macro__dmsff_32x__stack_32c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_27c__width_26 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [25:0] din0;
  input sel0;
  input [25:0] din1;
  input sel1;
  output [25:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(26)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[25:0]),
  .in1(din1[25:0]),
.dout(dout[25:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_7c__width_7 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [6:0] din0;
  input sel0;
  input [6:0] din1;
  input sel1;
  output [6:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(7)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
.dout(dout[6:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_30c__width_30 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [29:0] din0;
  input [29:0] din1;
  input sel0;
  output [29:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(30)  d0_0 (
  .sel(psel1),
  .in0(din0[29:0]),
  .in1(din1[29:0]),
.dout(dout[29:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_5c__width_5 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [4:0] din0;
  input [4:0] din1;
  input sel0;
  output [4:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(5)  d0_0 (
  .sel(psel1),
  .in0(din0[4:0]),
  .in1(din1[4:0]),
.dout(dout[4:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_snpd_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_32c__width_32 (
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

