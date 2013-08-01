// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_shdwscn_dp.v
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



module l2t_shdwscn_dp (
  l2clk, 
  rd_errstate_reg, 
  rd_notdata_reg, 
  csr_l2_erraddr_reg, 
  tcu_l2t_shscan_scan_in, 
  tcu_l2t_shscan_aclk, 
  tcu_l2t_shscan_bclk, 
  tcu_l2t_shscan_scan_en, 
  tcu_l2t_shscan_pce_ov, 
  tcu_l2t_shscan_clk_stop_d2, 
  l2t_tcu_shscan_scan_out);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire stop;
wire [141:0] shadow_scan_flopin;
wire ff_rd_errstate_reg_00_scanin;
wire ff_rd_errstate_reg_00_scanout;
wire [63:0] shdw_rd_errstate_reg_unused;
wire ff_rd_errstate_reg_01_scanin;
wire ff_rd_errstate_reg_01_scanout;
wire ff_rd_errstate_reg_10_scanin;
wire ff_rd_errstate_reg_10_scanout;
wire ff_rd_errstate_reg_11_scanin;
wire ff_rd_errstate_reg_11_scanout;
wire ff_rd_notdata_reg_00_scanin;
wire ff_rd_notdata_reg_00_scanout;
wire [63:0] shdw_rd_notdata_reg_unused;
wire ff_rd_notdata_reg_01_scanin;
wire ff_rd_notdata_reg_01_scanout;
wire ff_rd_notdata_reg_10_scanin;
wire ff_rd_notdata_reg_10_scanout;
wire ff_rd_notdata_reg_11_scanin;
wire ff_rd_notdata_reg_11_scanout;
wire ff_csr_l2_erraddr_reg_00_scanin;
wire ff_csr_l2_erraddr_reg_00_scanout;
wire [45:32] shdw_csr_l2_erraddr_reg_unused;



input		l2clk;

input	[63:0]	rd_errstate_reg;
input 	[`ERR_MEND:`ERR_NDADR_LO]	rd_notdata_reg;
input	[39:4]	csr_l2_erraddr_reg;

// shadow scan ports
input           tcu_l2t_shscan_scan_in;
input           tcu_l2t_shscan_aclk;
input           tcu_l2t_shscan_bclk;    
input           tcu_l2t_shscan_scan_en; 
input           tcu_l2t_shscan_pce_ov;
input           tcu_l2t_shscan_clk_stop_d2; 
output          l2t_tcu_shscan_scan_out;


assign pce_ov 	= tcu_l2t_shscan_pce_ov;
assign siclk 	= tcu_l2t_shscan_aclk;
assign soclk 	= tcu_l2t_shscan_bclk;
assign se 	= tcu_l2t_shscan_scan_en;
assign stop 	= tcu_l2t_shscan_clk_stop_d2;

assign shadow_scan_flopin[141:84] = {rd_errstate_reg[63:34],rd_errstate_reg[27:0]};
assign shadow_scan_flopin[83:36]  =  rd_notdata_reg[`ERR_MEND:`ERR_NDADR_LO];
assign shadow_scan_flopin[35:0]   =  csr_l2_erraddr_reg[39:4];


l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_errstate_reg_00 
        (
        .scan_in(ff_rd_errstate_reg_00_scanin),
        .scan_out(ff_rd_errstate_reg_00_scanout),
        .dout           (shdw_rd_errstate_reg_unused[47:32]),
	.en		(1'b1),
        .clk          	(l2clk),
        .din            (shadow_scan_flopin[15:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_errstate_reg_01 
        (
        .scan_in(ff_rd_errstate_reg_01_scanin),
        .scan_out(ff_rd_errstate_reg_01_scanout),
        .dout           (shdw_rd_errstate_reg_unused[63:48]),
        .en             (1'b1),
        .clk            (l2clk),
        .din            (shadow_scan_flopin[31:16]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_errstate_reg_10 
        (
        .scan_in(ff_rd_errstate_reg_10_scanin),
        .scan_out(ff_rd_errstate_reg_10_scanout),
        .dout           (shdw_rd_errstate_reg_unused[15:0]),
        .en             (1'b1),
        .clk            (l2clk),
        .din            (shadow_scan_flopin[47:32]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_errstate_reg_11 
        (
        .scan_in(ff_rd_errstate_reg_11_scanin),
        .scan_out(ff_rd_errstate_reg_11_scanout),
        .dout           (shdw_rd_errstate_reg_unused[31:16]),
        .en             (1'b1),
        .clk            (l2clk),
        .din            (shadow_scan_flopin[63:48]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_notdata_reg_00 
        (
        .scan_in(ff_rd_notdata_reg_00_scanin),
        .scan_out(ff_rd_notdata_reg_00_scanout),
        .dout           (shdw_rd_notdata_reg_unused[47:32]),
        .clk          	(l2clk),
	.en		(1'b1),
        .din            (shadow_scan_flopin[79:64]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_notdata_reg_01 
        (
        .scan_in(ff_rd_notdata_reg_01_scanin),
        .scan_out(ff_rd_notdata_reg_01_scanout),
        .dout           (shdw_rd_notdata_reg_unused[63:48]),
        .clk            (l2clk),
        .en             (1'b1),
        .din            (shadow_scan_flopin[95:80]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_notdata_reg_10 
        (
        .scan_in(ff_rd_notdata_reg_10_scanin),
        .scan_out(ff_rd_notdata_reg_10_scanout),
        .dout           (shdw_rd_notdata_reg_unused[15:0]),
        .clk            (l2clk),
        .en             (1'b1),
        .din            (shadow_scan_flopin[111:96]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_shdwscn_dp_msff_macro__stack_16r__width_16 ff_rd_notdata_reg_11 
        (
        .scan_in(ff_rd_notdata_reg_11_scanin),
        .scan_out(ff_rd_notdata_reg_11_scanout),
        .dout           (shdw_rd_notdata_reg_unused[31:16]),
        .clk            (l2clk),
        .en             (1'b1),
        .din            (shadow_scan_flopin[127:112]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_shdwscn_dp_msff_macro__stack_16r__width_14 ff_csr_l2_erraddr_reg_00 
        (
        .scan_in(ff_csr_l2_erraddr_reg_00_scanin),
        .scan_out(ff_csr_l2_erraddr_reg_00_scanout),
        .dout           (shdw_csr_l2_erraddr_reg_unused[45:32]),
        .clk          	(l2clk),
	.en		(1'b1),
        .din            (shadow_scan_flopin[141:128]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


// fixscan start:
assign ff_rd_errstate_reg_00_scanin = tcu_l2t_shscan_scan_in   ;
assign ff_rd_errstate_reg_01_scanin = ff_rd_errstate_reg_00_scanout;
assign ff_rd_errstate_reg_10_scanin = ff_rd_errstate_reg_01_scanout;
assign ff_rd_errstate_reg_11_scanin = ff_rd_errstate_reg_10_scanout;
assign ff_rd_notdata_reg_00_scanin = ff_rd_errstate_reg_11_scanout;
assign ff_rd_notdata_reg_01_scanin = ff_rd_notdata_reg_00_scanout;
assign ff_rd_notdata_reg_10_scanin = ff_rd_notdata_reg_01_scanout;
assign ff_rd_notdata_reg_11_scanin = ff_rd_notdata_reg_10_scanout;
assign ff_csr_l2_erraddr_reg_00_scanin = ff_rd_notdata_reg_11_scanout;
assign l2t_tcu_shscan_scan_out     = ff_csr_l2_erraddr_reg_00_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l2t_shdwscn_dp_msff_macro__stack_16r__width_16 (
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
wire [14:0] so;

  input [15:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [15:0] dout;


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
dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_shdwscn_dp_msff_macro__stack_16r__width_14 (
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
wire [12:0] so;

  input [13:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [13:0] dout;


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
dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);




















endmodule








