// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_ilc_ctl.v
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
module	sii_ilc_ctl (
  l2t_sii_iq_dequeue, 
  l2t_sii_wib_dequeue, 
  sii_l2t_req_vld, 
  sii_dbg_l2t_req, 
  sio_sii_olc_ilc_dequeue_r, 
  ilc_ipcc_stop, 
  ilc_ipcc_dmu_wrm_dq, 
  ilc_ipcc_niu_wrm_dq, 
  ilc_ipcc_dmu_wrm, 
  ilc_ipcc_niu_wrm, 
  ilc_ild_de_sel, 
  ilc_ild_hdr_sel, 
  ilc_ild_cyc_sel, 
  ilc_ild_newhdr, 
  ilc_ild_ldhdr, 
  ilc_ild_addr_h, 
  ilc_ild_addr_lo, 
  ipcc_data_58_56, 
  ilc_ildq_rd_addr_m, 
  ilc_ildq_rd_en_m, 
  ipcc_ildq_wr_addr, 
  ipcc_ildq_wr_en, 
  ipcc_ilc_be, 
  ipcc_ilc_cmd, 
  ild_ilc_curhdr, 
  sii_mb0_run, 
  sii_mb0_rd_en, 
  sii_mb0_addr, 
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire ilc_ildq_rd_en_r_unused;
wire ilc_ildq_rd_en_r;
wire [5:0] cstate_r;
wire sii_l2t_req_vld_l;
wire arc_start_hdr1;
wire wrm;
wire wrm_drop;
wire [1:0] sii_dbg_l2t_req_l;
wire [1:0] req_en;
wire hdr_full;
wire [63:0] wrm_hdr;
wire jtag;
wire ilc_ipcc_dmu_wrm_l;
wire wrm_end_r;
wire ilc_ipcc_dmu_wrm_r;
wire ilc_ipcc_niu_wrm_l;
wire ilc_ipcc_niu_wrm_r;
wire wri;
wire [3:0] wri_cnt_l;
wire arc_hdr1_hdr2;
wire wrm_pre;
wire [4:0] curhdr_58_56;
wire [2:0] wrm_cnt_r;
wire [4:0] be_addr;
wire [1:0] cur_hdr_wr_ptr;
wire [2:0] hdr_wr_ptr_r;
wire be_en;
wire be00;
wire be01;
wire be02;
wire be03;
wire be04;
wire be05;
wire be06;
wire be07;
wire be10;
wire be11;
wire be12;
wire be13;
wire be14;
wire be15;
wire be16;
wire be17;
wire be20;
wire be21;
wire be22;
wire be23;
wire be24;
wire be25;
wire be26;
wire be27;
wire be30;
wire be31;
wire be32;
wire be33;
wire be34;
wire be35;
wire be36;
wire be37;
wire [63:0] full_be0;
wire [7:0] be07_r;
wire [7:0] be06_r;
wire [7:0] be05_r;
wire [7:0] be04_r;
wire [7:0] be03_r;
wire [7:0] be02_r;
wire [7:0] be01_r;
wire [7:0] be00_r;
wire [63:0] full_be1;
wire [7:0] be17_r;
wire [7:0] be16_r;
wire [7:0] be15_r;
wire [7:0] be14_r;
wire [7:0] be13_r;
wire [7:0] be12_r;
wire [7:0] be11_r;
wire [7:0] be10_r;
wire [63:0] full_be2;
wire [7:0] be27_r;
wire [7:0] be26_r;
wire [7:0] be25_r;
wire [7:0] be24_r;
wire [7:0] be23_r;
wire [7:0] be22_r;
wire [7:0] be21_r;
wire [7:0] be20_r;
wire [63:0] full_be3;
wire [7:0] be37_r;
wire [7:0] be36_r;
wire [7:0] be35_r;
wire [7:0] be34_r;
wire [7:0] be33_r;
wire [7:0] be32_r;
wire [7:0] be31_r;
wire [7:0] be30_r;
wire [2:0] hdr_rd_ptr_l;
wire [7:0] bem;
wire [2:0] wrm_cnt_l;
wire [5:0] ilc_ildq_rd_addr;
wire hdr_empty;
wire rrd;
wire wri_end;
wire [5:0] ilc_ildq_rd_addr_r;
wire sii_mb0_run_r;
wire [4:0] sii_mb0_addr_r;
wire sii_mb0_rd_en_r;
wire ilc_ildq_rd_en;
wire turn_off_rden;
wire [2:0] hdr_rd_ptr_r;
wire wri_end_pre;
wire [2:0] hdr_wr_ptr_l;
wire [1:0] l2iq_cnt_l;
wire [1:0] l2iq_cnt_r;
wire [2:0] l2wib_cnt_l;
wire [2:0] l2wib_cnt_r;
wire [2:0] sio_cnt_l;
wire posted;
wire [2:0] sio_cnt_r;
wire arc_hdr2_data1;
wire [3:0] wri_cnt_r;
wire arc_data2_start;
wire make_request;
wire l2ok;
wire wrdata_rdy;
wire [2:0] cmd;
wire [2:0] cmd_r;
wire wrm_end_l;
wire arc_data1_data2;
wire arc_data2_data2;
wire arc_data3_start;
wire [4:0] pre_curhdr;
wire [4:0] pre_curhdr0_mux;
wire [4:0] pre_curhdr1_mux;
wire [4:0] pre_curhdr2_mux;
wire [4:0] pre_curhdr3_mux;
wire [4:0] pre_curhdr0;
wire [4:0] pre_curhdr1;
wire [4:0] pre_curhdr2;
wire [4:0] pre_curhdr3;
wire [4:0] pre_curhdr0_r;
wire [4:0] pre_curhdr1_r;
wire [4:0] pre_curhdr2_r;
wire [4:0] pre_curhdr3_r;
wire reg_curhdr_58_56_scanin;
wire reg_curhdr_58_56_scanout;
wire reg_pre_curhdr0_scanin;
wire reg_pre_curhdr0_scanout;
wire reg_pre_curhdr1_scanin;
wire reg_pre_curhdr1_scanout;
wire reg_pre_curhdr2_scanin;
wire reg_pre_curhdr2_scanout;
wire reg_pre_curhdr3_scanin;
wire reg_pre_curhdr3_scanout;
wire reg_sii_l2t_req_vld_scanin;
wire reg_sii_l2t_req_vld_scanout;
wire reg_sii_dbg_l2t_req_scanin;
wire reg_sii_dbg_l2t_req_scanout;
wire reg_cstate_scanin;
wire reg_cstate_scanout;
wire reg_sio_cnt_scanin;
wire reg_sio_cnt_scanout;
wire reg_wri_cnt_scanin;
wire reg_wri_cnt_scanout;
wire reg_wrm_cnt_scanin;
wire reg_wrm_cnt_scanout;
wire reg_l2iq_cnt_r_scanin;
wire reg_l2iq_cnt_r_scanout;
wire reg_l2wib_cnt_r_scanin;
wire reg_l2wib_cnt_r_scanout;
wire reg_hdr_rd_ptr_scanin;
wire reg_hdr_rd_ptr_scanout;
wire reg_hdr_wr_ptr_scanin;
wire reg_hdr_wr_ptr_scanout;
wire reg_ilc_ildq_rd_addr_scanin;
wire reg_ilc_ildq_rd_addr_scanout;
wire reg_ilc_ildq_rd_en_scanin;
wire reg_ilc_ildq_rd_en_scanout;
wire reg_wrm_end_scanin;
wire reg_wrm_end_scanout;
wire reg_cmd_scanin;
wire reg_cmd_scanout;
wire reg_dmu_wrm_scanin;
wire reg_dmu_wrm_scanout;
wire reg_niu_wrm_scanin;
wire reg_niu_wrm_scanout;
wire reg_be00_scanin;
wire reg_be00_scanout;
wire reg_be01_scanin;
wire reg_be01_scanout;
wire reg_be02_scanin;
wire reg_be02_scanout;
wire reg_be03_scanin;
wire reg_be03_scanout;
wire reg_be04_scanin;
wire reg_be04_scanout;
wire reg_be05_scanin;
wire reg_be05_scanout;
wire reg_be06_scanin;
wire reg_be06_scanout;
wire reg_be07_scanin;
wire reg_be07_scanout;
wire reg_be10_scanin;
wire reg_be10_scanout;
wire reg_be11_scanin;
wire reg_be11_scanout;
wire reg_be12_scanin;
wire reg_be12_scanout;
wire reg_be13_scanin;
wire reg_be13_scanout;
wire reg_be14_scanin;
wire reg_be14_scanout;
wire reg_be15_scanin;
wire reg_be15_scanout;
wire reg_be16_scanin;
wire reg_be16_scanout;
wire reg_be17_scanin;
wire reg_be17_scanout;
wire reg_be20_scanin;
wire reg_be20_scanout;
wire reg_be21_scanin;
wire reg_be21_scanout;
wire reg_be22_scanin;
wire reg_be22_scanout;
wire reg_be23_scanin;
wire reg_be23_scanout;
wire reg_be24_scanin;
wire reg_be24_scanout;
wire reg_be25_scanin;
wire reg_be25_scanout;
wire reg_be26_scanin;
wire reg_be26_scanout;
wire reg_be27_scanin;
wire reg_be27_scanout;
wire reg_be30_scanin;
wire reg_be30_scanout;
wire reg_be31_scanin;
wire reg_be31_scanout;
wire reg_be32_scanin;
wire reg_be32_scanout;
wire reg_be33_scanin;
wire reg_be33_scanout;
wire reg_be34_scanin;
wire reg_be34_scanout;
wire reg_be35_scanin;
wire reg_be35_scanout;
wire reg_be36_scanin;
wire reg_be36_scanout;
wire reg_be37_scanin;
wire reg_be37_scanout;
wire reg_sii_mb0_run_scanin;
wire reg_sii_mb0_run_scanout;
wire reg_sii_mb0_rd_en_scanin;
wire reg_sii_mb0_rd_en_scanout;
wire reg_sii_mb0_addr_scanin;
wire reg_sii_mb0_addr_scanout;
wire reg_ilc_ild_addr_h_scanin;
wire reg_ilc_ild_addr_h_scanout;
wire reg_ilc_ild_addr_lo_scanin;
wire reg_ilc_ild_addr_lo_scanout;


input 		l2t_sii_iq_dequeue;	
input 		l2t_sii_wib_dequeue;	
output 		sii_l2t_req_vld;		
output  [1:0]	sii_dbg_l2t_req;		

input		sio_sii_olc_ilc_dequeue_r;
//------inter-submodule signals-------

output		ilc_ipcc_stop;		//cmp_clk
output		ilc_ipcc_dmu_wrm_dq;		//cmp_clk
output		ilc_ipcc_niu_wrm_dq;		//cmp_clk
output		ilc_ipcc_dmu_wrm;		//cmp_clk
output		ilc_ipcc_niu_wrm;		//cmp_clk
output  [1:0]   ilc_ild_de_sel;
output  [1:0]   ilc_ild_hdr_sel;        // select hdr cycle 1 or 2
output  [1:0]   ilc_ild_cyc_sel;
output  [63:0]  ilc_ild_newhdr;
output  [3:0]   ilc_ild_ldhdr;          // load into the hdr register
output  [3:0]   ilc_ild_addr_h;           // select the header register
output  [3:0]   ilc_ild_addr_lo;           // select the header register

input   [4:0]   ipcc_data_58_56;
//------going to register file ildq-------
output	[4:0]	ilc_ildq_rd_addr_m;	
output		ilc_ildq_rd_en_m;		
input	[4:0]	ipcc_ildq_wr_addr;	// for data 
input		ipcc_ildq_wr_en;	// for data 

input  	[7:0]   ipcc_ilc_be;             // from ilc
input		ipcc_ilc_cmd;		// active 1 cyc to indicate header on bus
input   [63:0]  ild_ilc_curhdr; 	// current transaction header

//------ mbist related signals -----------
input		sii_mb0_run;
input		sii_mb0_rd_en;
input 	[4:0]   sii_mb0_addr;

//------ test related signals -----------
input		l2clk;
input		scan_in ;
output		scan_out;
input   	tcu_scan_en;
input   	tcu_aclk;
input   	tcu_bclk;
input   	tcu_pce_ov;
input   	tcu_clk_stop;

reg	[63:0] 	cur_be;
reg	 	be_on;
reg	[3:0]	ilc_ild_addr_l;
reg	[3:0]	ilc_ild_ldhdr;

assign 		se = tcu_scan_en;
assign 		siclk = tcu_aclk;
assign 		soclk = tcu_bclk;
assign 		pce_ov = tcu_pce_ov;
assign 		stop = tcu_clk_stop;

// Clock header
sii_ilc_ctll1clkhdr_ctl_macro clkgen (
                              .l2clk  (l2clk                  ),
                              .l1en   (1'b1                   ),
                              .l1clk  (l1clk                  ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                              );
// Spare gates
sii_ilc_ctlspare_ctl_macro__num_6 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//************************************************************************
// UNUSED CONNECTIONS 
//************************************************************************
   assign 	ilc_ildq_rd_en_r_unused = ilc_ildq_rd_en_r;
   

//************************************************************************
// STATE DEFINITION 
//************************************************************************

`define		START_ST		6'b000001
`define		HDR1_ST			6'b000010
`define		HDR2_ST			6'b000100
`define		DATA1_ST		6'b001000
`define		DATA2_ST		6'b010000
`define		DATA3_ST		6'b100000

`define		START		 	0
`define		HDR1		 	1
`define		HDR2		 	2
`define		DATA1		 	3
`define		DATA2		 	4
`define		DATA3		 	5

`define		RDD		 	3'b001
`define		WRM		 	3'b010
`define		WRI		 	3'b100

reg [5:0]	nstate_r;
//reg [5:0]	cstate_r;

wire [5:0]	nstate;
wire [5:0]	cstate;

// ------- internal signals --------
reg  [7:0]	be;

assign		nstate = {nstate_r[5:1], ~nstate_r[0]};
assign		cstate = {cstate_r[5:1], ~cstate_r[0]};
//0in one_hot -var cstate[5:0]
//0in one_hot -var nstate_r[5:0]


//************************************************************************
//	OUTPUT LOGICS 
//************************************************************************

assign 	sii_l2t_req_vld_l =  arc_start_hdr1 && ~(wrm && ~be_on && ~wrm_drop);		
assign 	sii_dbg_l2t_req_l[1:0] = sii_l2t_req_vld_l ? req_en[1:0] : 2'b00; 

assign	ilc_ipcc_stop	= hdr_full;	//???  ipcc check  4 data space as well 
assign	ilc_ipcc_dmu_wrm_dq	= sii_l2t_req_vld && wrm &&  wrm_hdr[59]  && ~jtag; 
assign	ilc_ipcc_niu_wrm_dq	= sii_l2t_req_vld && wrm &&  ~wrm_hdr[59] && ~jtag; 
assign	ilc_ipcc_dmu_wrm_l	= ilc_ipcc_dmu_wrm_dq ? 1'b1 : (wrm_end_r &&  wrm_hdr[59]) 
				  ? 1'b0 : ilc_ipcc_dmu_wrm  ;
assign  ilc_ipcc_dmu_wrm 	= (wrm_end_r &&  wrm_hdr[59] && ~jtag) || ilc_ipcc_dmu_wrm_r;
assign	ilc_ipcc_niu_wrm_l	= ilc_ipcc_niu_wrm_dq ? 1'b1 : (wrm_end_r &&  ~wrm_hdr[59]) 
				  ? 1'b0 : ilc_ipcc_niu_wrm ;
assign  ilc_ipcc_niu_wrm 	= (wrm_end_r &&  ~wrm_hdr[59] && ~jtag) || ilc_ipcc_niu_wrm_r;

assign  ilc_ild_de_sel[0] = cstate[`DATA1] || (wri ? ~wri_cnt_l[0] : 1'b0);
assign  ilc_ild_de_sel[1] = ~ilc_ild_de_sel[0]; 

// select hdr cycle 1 or 2
assign  ilc_ild_hdr_sel[0] = arc_hdr1_hdr2;        // select hdr cycle 1 or 2
assign  ilc_ild_hdr_sel[1] = arc_start_hdr1 ;

assign  ilc_ild_cyc_sel[0] = arc_start_hdr1 || arc_hdr1_hdr2 ;
assign  ilc_ild_cyc_sel[1] = ~ilc_ild_cyc_sel[0]; 
assign  ilc_ild_newhdr[63:0] = ((wrm && ~wrm_drop) || wrm_pre) ? wrm_hdr[63:0]  : ild_ilc_curhdr[63:0];

assign	wrm_hdr = {curhdr_58_56[4], ild_ilc_curhdr[62:60], curhdr_58_56[3:0], ild_ilc_curhdr[55:48], be[7:0], 
		  ild_ilc_curhdr[39:6], wrm_cnt_r[2:0], ild_ilc_curhdr[2:0]};
assign  req_en  = ild_ilc_curhdr[56] ? 2'b01 : ild_ilc_curhdr[57] ? 2'b11 : 2'b10 ;
//------------	BYTE ENABLE SECTION  ----------------

assign	jtag 	= wrm_hdr[63];
assign	be_addr[4:0] = {cur_hdr_wr_ptr[1:0],ipcc_ildq_wr_addr[2:0]} ; 
assign  cur_hdr_wr_ptr[1:0] = hdr_wr_ptr_r[1:0] - 2'b01; 
assign	be_en 	= ipcc_ildq_wr_en;

assign	be00	= (be_addr[4:0] == 5'b00000) ? 1'b1 && be_en: 1'b0;
assign	be01	= (be_addr[4:0] == 5'b00001) ? 1'b1 && be_en: 1'b0;
assign	be02	= (be_addr[4:0] == 5'b00010) ? 1'b1 && be_en: 1'b0;
assign	be03	= (be_addr[4:0] == 5'b00011) ? 1'b1 && be_en: 1'b0;
assign	be04	= (be_addr[4:0] == 5'b00100) ? 1'b1 && be_en: 1'b0;
assign	be05	= (be_addr[4:0] == 5'b00101) ? 1'b1 && be_en: 1'b0;
assign	be06	= (be_addr[4:0] == 5'b00110) ? 1'b1 && be_en: 1'b0;
assign	be07	= (be_addr[4:0] == 5'b00111) ? 1'b1 && be_en: 1'b0;
assign	be10	= (be_addr[4:0] == 5'b01000) ? 1'b1 && be_en: 1'b0;
assign	be11	= (be_addr[4:0] == 5'b01001) ? 1'b1 && be_en: 1'b0;
assign	be12	= (be_addr[4:0] == 5'b01010) ? 1'b1 && be_en: 1'b0;
assign	be13	= (be_addr[4:0] == 5'b01011) ? 1'b1 && be_en: 1'b0;
assign	be14	= (be_addr[4:0] == 5'b01100) ? 1'b1 && be_en: 1'b0;
assign	be15	= (be_addr[4:0] == 5'b01101) ? 1'b1 && be_en: 1'b0;
assign	be16	= (be_addr[4:0] == 5'b01110) ? 1'b1 && be_en: 1'b0;
assign	be17	= (be_addr[4:0] == 5'b01111) ? 1'b1 && be_en: 1'b0;
assign	be20	= (be_addr[4:0] == 5'b10000) ? 1'b1 && be_en: 1'b0;
assign	be21	= (be_addr[4:0] == 5'b10001) ? 1'b1 && be_en: 1'b0;
assign	be22	= (be_addr[4:0] == 5'b10010) ? 1'b1 && be_en: 1'b0;
assign	be23	= (be_addr[4:0] == 5'b10011) ? 1'b1 && be_en: 1'b0;
assign	be24	= (be_addr[4:0] == 5'b10100) ? 1'b1 && be_en: 1'b0;
assign	be25	= (be_addr[4:0] == 5'b10101) ? 1'b1 && be_en: 1'b0;
assign	be26	= (be_addr[4:0] == 5'b10110) ? 1'b1 && be_en: 1'b0;
assign	be27	= (be_addr[4:0] == 5'b10111) ? 1'b1 && be_en: 1'b0;
assign	be30	= (be_addr[4:0] == 5'b11000) ? 1'b1 && be_en: 1'b0;
assign	be31	= (be_addr[4:0] == 5'b11001) ? 1'b1 && be_en: 1'b0;
assign	be32	= (be_addr[4:0] == 5'b11010) ? 1'b1 && be_en: 1'b0;
assign	be33	= (be_addr[4:0] == 5'b11011) ? 1'b1 && be_en: 1'b0;
assign	be34	= (be_addr[4:0] == 5'b11100) ? 1'b1 && be_en: 1'b0;
assign	be35	= (be_addr[4:0] == 5'b11101) ? 1'b1 && be_en: 1'b0;
assign	be36	= (be_addr[4:0] == 5'b11110) ? 1'b1 && be_en: 1'b0;
assign	be37	= (be_addr[4:0] == 5'b11111) ? 1'b1 && be_en: 1'b0;

assign  full_be0[63:0] = {be07_r[7:0], be06_r[7:0], be05_r[7:0], be04_r[7:0],
			  be03_r[7:0], be02_r[7:0], be01_r[7:0], be00_r[7:0]};
assign  full_be1[63:0] = {be17_r[7:0], be16_r[7:0], be15_r[7:0], be14_r[7:0],
			  be13_r[7:0], be12_r[7:0], be11_r[7:0], be10_r[7:0]};
assign  full_be2[63:0] = {be27_r[7:0], be26_r[7:0], be25_r[7:0], be24_r[7:0],
			  be23_r[7:0], be22_r[7:0], be21_r[7:0], be20_r[7:0]};
assign  full_be3[63:0] = {be37_r[7:0], be36_r[7:0], be35_r[7:0], be34_r[7:0],
			  be33_r[7:0], be32_r[7:0], be31_r[7:0], be30_r[7:0]};
always @ (hdr_rd_ptr_l[1:0] or full_be0[63:0] or full_be1[63:0] 
		or full_be2[63:0] or full_be3[63:0])
	case (hdr_rd_ptr_l[1:0])	//synopsys parallel_case full_case
		2'b00 : cur_be[63:0] = full_be0[63:0];
		2'b01 : cur_be[63:0] = full_be1[63:0];
		2'b10 : cur_be[63:0] = full_be2[63:0];
		2'b11 : cur_be[63:0] = full_be3[63:0];
		default : cur_be[63:0] = 64'h0000000000000000; // 0in < fire -message "ERROR: sii_ilc cur_be default case"
	endcase
assign bem[7:0]	= {|cur_be[63:56], |cur_be[55:48], |cur_be[47:40], |cur_be[39:32],
		  |cur_be[31:24], |cur_be[23:16], |cur_be[15:8], |cur_be[7:0]};

always @ (wrm_cnt_l[2:0] or bem[7:0] or cur_be[63:0])
    case (wrm_cnt_l[2:0])	//synopsys parallel_case full_case
	3'b000 	: begin
			be = cur_be[7:0];
			be_on = bem[0];
		  end
	3'b001 	: begin
			be = cur_be[15:8];
			be_on = bem[1];
		  end
	3'b010 	: begin
			be = cur_be[23:16];
			be_on = bem[2];
		  end
	3'b011 	: begin
			be = cur_be[31:24];
			be_on = bem[3];
		  end
	3'b100 	: begin
			be = cur_be[39:32];
			be_on = bem[4];
		  end
	3'b101 	: begin
			be = cur_be[47:40];
			be_on = bem[5];
		  end
	3'b110 	: begin
			be = cur_be[55:48];
			be_on = bem[6];
		  end
	3'b111 	: begin
			be = cur_be[63:56];
			be_on = bem[7];
		  end
	default : begin
			// 0in < fire -message "ERROR: sii_ilc be_on, be default case"
			be = 8'b00000000;	
			be_on = 1'b0;	
		  end
    endcase
//------------	READ/WRITE POINTER OF HEADERS  ----------------
always @ (hdr_rd_ptr_l[1:0] )
    case (hdr_rd_ptr_l[1:0])	//synopsys parallel_case full_case 
	2'b00	: ilc_ild_addr_l[3:0] = 4'b0001; 
	2'b01	: ilc_ild_addr_l[3:0] = 4'b0010; 
	2'b10	: ilc_ild_addr_l[3:0] = 4'b0100; 
	2'b11	: ilc_ild_addr_l[3:0] = 4'b1000; 
	default : ilc_ild_addr_l[3:0] = 4'b0000; // 0in < fire -message "ERROR :sii_ilc hdr_rd_ptr default case"
    endcase

always @ (hdr_wr_ptr_r[1:0] or ipcc_ilc_cmd)
if (~ipcc_ilc_cmd)
	ilc_ild_ldhdr[3:0]	= 4'b0000;
else
    case (hdr_wr_ptr_r[1:0])	//synopsys parallel_case full_case 
	2'b00	: ilc_ild_ldhdr[3:0] = 4'b0001; 
	2'b01	: ilc_ild_ldhdr[3:0] = 4'b0010; 
	2'b10	: ilc_ild_ldhdr[3:0] = 4'b0100; 
	2'b11	: ilc_ild_ldhdr[3:0] = 4'b1000; 
	default : ilc_ild_ldhdr[3:0] = 4'b0000; // 0in < fire -message "ERROR :sii_ilc hdr_wr_ptr default case"
    endcase

assign 	ilc_ildq_rd_addr[5:0] = ~hdr_empty && ((cstate[`HDR2] && ~rrd )|| cstate[`DATA2] && wri
				||  cstate[`DATA3] && wri_cnt_l[0] && ~wri_end ) ?
				(ilc_ildq_rd_addr_r[5:0] + 6'd1) : ilc_ildq_rd_addr_r[5:0];

assign  ilc_ildq_rd_addr_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ilc_ildq_rd_addr[4:0];
assign  ilc_ildq_rd_en_m = sii_mb0_run_r ? sii_mb0_rd_en_r : ilc_ildq_rd_en;

assign ilc_ildq_rd_en = ~turn_off_rden ;
			  
//************************************************************************
//	internal wires assignment	
//************************************************************************

//------------	header empty/full ----------------
assign	hdr_empty	= (hdr_rd_ptr_r[1:0] == hdr_wr_ptr_r[1:0]) && 
			  (hdr_rd_ptr_r[2] == hdr_wr_ptr_r[2]); 

assign	hdr_full	= (hdr_rd_ptr_r[1:0] == hdr_wr_ptr_r[1:0]) && 
			  (hdr_rd_ptr_r[2] != hdr_wr_ptr_r[2]); 

assign	hdr_rd_ptr_l[2:0] = ((cstate[`DATA1] && rrd) || (wrm_end_r && wrm ) || 
				(wri && wri_end_pre)) 
				? (hdr_rd_ptr_r[2:0] + 3'b001) 
				: hdr_rd_ptr_r[2:0]; 
assign	hdr_wr_ptr_l[2:0] = ipcc_ilc_cmd ? (hdr_wr_ptr_r[2:0] + 3'b001) 
				: hdr_wr_ptr_r[2:0]; 

	

//------------------l2 transaction counters---------------
assign	l2iq_cnt_l[1:0] = (sii_l2t_req_vld && ~ l2t_sii_iq_dequeue )? (l2iq_cnt_r[1:0]+2'b01) :
			  (l2t_sii_iq_dequeue && ~sii_l2t_req_vld )? (l2iq_cnt_r[1:0] - 2'b01):
			   l2iq_cnt_r[1:0]; 

assign	l2wib_cnt_l[2:0] = ((sii_l2t_req_vld && wri) && ~l2t_sii_wib_dequeue )? 
				(l2wib_cnt_r[2:0]+3'b001) :
			   (l2t_sii_wib_dequeue && ~(sii_l2t_req_vld && wri) ) ? 
			   	(l2wib_cnt_r[2:0] - 3'b001):
			   	l2wib_cnt_r[2:0]; 

assign	sio_cnt_l[2:0] = (sii_l2t_req_vld && ~posted && ~jtag && ~sio_sii_olc_ilc_dequeue_r )? 
			  (sio_cnt_r[2:0]+3'b001) :
			  (sio_sii_olc_ilc_dequeue_r && ~(sii_l2t_req_vld && ~posted))? (sio_cnt_r[2:0] - 3'b001):
			   sio_cnt_r[2:0]; 

//------------------Count WRI cycles ---------------
assign	wri_cnt_l[3:0]	= cstate[`HDR1] ? 4'b0000 : 
			  ((arc_hdr2_data1 && wri ) || cstate[`DATA3]) ? 
			  (wri_cnt_r[3:0] + 4'b0001) : wri_cnt_r[3:0];

//------------------Count WRM cycles ---------------
assign	wrm_cnt_l[2:0]	= (& wrm_cnt_r[2:0] && arc_data2_start ) ? 
			  3'b000 : (wrm && cstate[`DATA2] && make_request) ? 
			  (wrm_cnt_r[2:0] + 3'b001) : wrm_cnt_r[2:0];


assign	l2ok		= (l2iq_cnt_r != 2'b10) & (l2wib_cnt_r != 3'b100)  
			  & (sio_cnt_r[2:0] != 3'b100);
assign  turn_off_rden   = (ilc_ildq_rd_addr[4:0] == ipcc_ildq_wr_addr[4:0]) && ipcc_ildq_wr_en;
assign	make_request	= l2ok && ~hdr_empty && wrdata_rdy; 
assign  wrdata_rdy      = (cmd[2:0] == `RDD) ? 1'b1 : (hdr_full || (ilc_ildq_rd_addr_r[4:0] != ipcc_ildq_wr_addr[4:0]));  
assign  posted		= ild_ilc_curhdr[61];
assign  cmd[2:0]	= curhdr_58_56[2:0];
assign	wri		= (cmd_r[2:0] == `WRI) ? 1'b1 : 1'b0;
assign	rrd		= (cmd_r[2:0] == `RDD) ? 1'b1 : 1'b0; 
assign	wrm		= (cmd_r[2:0] == `WRM) ? 1'b1 : 1'b0;
assign	wri_end		= &wri_cnt_l[3:0];
//assign  wri_going	= |wri_cnt_r[3:0];
assign	wri_end_pre	= (wri_cnt_l[3:0] == 4'b1110);
assign	wrm_end_l	= &wrm_cnt_l[2:0] && cstate[`DATA1];
assign	wrm_drop 	= (cmd[2:0] == `WRM) ? 1'b0 : 1'b1;
assign	wrm_pre		= (cmd[2:0] == `WRM) ? 1'b1 : 1'b0;

//************************************************************************
// STATE TRANSITION SECTION
//************************************************************************

assign	arc_start_hdr1	= cstate[`START] && make_request ; 
assign	arc_hdr1_hdr2	= cstate[`HDR1] ;
assign	arc_hdr2_data1	= cstate[`HDR2] ;
assign	arc_data1_data2	= cstate[`DATA1] ;
//assign	arc_data2_start	= cstate[`DATA2] && ~make_request && ~(wri && wri_going);
//assign	arc_data2_hdr1	= cstate[`DATA2] && make_request && ~wri && ~wrm_end_r && ~rrd; 
assign	arc_data2_start	= cstate[`DATA2] && ~wri ;
//in the middle of wrm, l2 not gnt
assign	arc_data2_data2	= cstate[`DATA2] && (~l2ok && ~wrm_end_r) && wrm ; 
assign	arc_data3_start	= cstate[`DATA3] &&  wri_end;

always @ (arc_start_hdr1  or 	arc_hdr1_hdr2 	or arc_hdr2_data1 or 
	  arc_data1_data2 or 	arc_data2_start or 
	  arc_data2_data2 or arc_data3_start or cstate )

	begin
	case (1'b1)			//synopsys parallel_case full_case
		cstate[`START]	: if (arc_start_hdr1)
					nstate_r = `HDR1_ST;
				  else
					nstate_r = `START_ST;
		cstate[`HDR1]	: if (arc_hdr1_hdr2)
					nstate_r = `HDR2_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`HDR2]	: if (arc_hdr2_data1) 
					nstate_r = `DATA1_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA1]	: if (arc_data1_data2)
					nstate_r = `DATA2_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA2]	: if (arc_data2_data2)
					nstate_r = `DATA2_ST;
				  else if (arc_data2_start)
					nstate_r = `START_ST;
				  else
					nstate_r = `DATA3_ST;
		cstate[`DATA3]	: if (arc_data3_start)
					nstate_r = `START_ST;		
				  else	
					nstate_r = `DATA3_ST;
		default		: begin
					nstate_r = `START_ST; 
				   // 0in < fire -message "ERROR: SIU_ILC state machine default case"
				  end

	endcase
	end

//************************************************************************
// REGISTERS section  for timing fix
//************************************************************************
// Make a copy of the curhdr[58:56] inside ilc for timing critical paths

//{ precurhdr[4:0] = 63, 59-56}
assign  pre_curhdr[4:0] =  pre_curhdr0_mux[4:0] | pre_curhdr1_mux[4:0] |
                           pre_curhdr2_mux[4:0] | pre_curhdr3_mux[4:0];

assign  pre_curhdr0_mux[4:0]  = {5{ilc_ild_addr_l[0]}} & pre_curhdr0[4:0];
assign  pre_curhdr1_mux[4:0]  = {5{ilc_ild_addr_l[1]}} & pre_curhdr1[4:0];
assign  pre_curhdr2_mux[4:0]  = {5{ilc_ild_addr_l[2]}} & pre_curhdr2[4:0];
assign  pre_curhdr3_mux[4:0]  = {5{ilc_ild_addr_l[3]}} & pre_curhdr3[4:0];

assign  pre_curhdr0[4:0] = ilc_ild_ldhdr[0] ? ipcc_data_58_56[4:0] : pre_curhdr0_r[4:0];
assign  pre_curhdr1[4:0] = ilc_ild_ldhdr[1] ? ipcc_data_58_56[4:0] : pre_curhdr1_r[4:0];
assign  pre_curhdr2[4:0] = ilc_ild_ldhdr[2] ? ipcc_data_58_56[4:0] : pre_curhdr2_r[4:0];
assign  pre_curhdr3[4:0] = ilc_ild_ldhdr[3] ? ipcc_data_58_56[4:0] : pre_curhdr3_r[4:0];

sii_ilc_ctlmsff_ctl_macro__width_5 reg_curhdr_58_56 
                        (
                        .scan_in(reg_curhdr_58_56_scanin),
                        .scan_out(reg_curhdr_58_56_scanout),
                        .din    (pre_curhdr[4:0]),
                        .l1clk    (l1clk),
                        .dout   (curhdr_58_56[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                        ) ;

sii_ilc_ctlmsff_ctl_macro__width_5 reg_pre_curhdr0 
                        (
                        .scan_in(reg_pre_curhdr0_scanin),
                        .scan_out(reg_pre_curhdr0_scanout),
                        .din    (pre_curhdr0[4:0]),
                        .l1clk    (l1clk),
                        .dout   (pre_curhdr0_r[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                        ) ;

sii_ilc_ctlmsff_ctl_macro__width_5 reg_pre_curhdr1 
                        (
                        .scan_in(reg_pre_curhdr1_scanin),
                        .scan_out(reg_pre_curhdr1_scanout),
                        .din    (pre_curhdr1[4:0]),
                        .l1clk    (l1clk),
                        .dout   (pre_curhdr1_r[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                        ) ;

sii_ilc_ctlmsff_ctl_macro__width_5 reg_pre_curhdr2 
                        (
                        .scan_in(reg_pre_curhdr2_scanin),
                        .scan_out(reg_pre_curhdr2_scanout),
                        .din    (pre_curhdr2[4:0]),
                        .l1clk    (l1clk),
                        .dout   (pre_curhdr2_r[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                        ) ;

sii_ilc_ctlmsff_ctl_macro__width_5 reg_pre_curhdr3 
                        (
                        .scan_in(reg_pre_curhdr3_scanin),
                        .scan_out(reg_pre_curhdr3_scanout),
                        .din    (pre_curhdr3[4:0]),
                        .l1clk    (l1clk),
                        .dout   (pre_curhdr3_r[4:0]),
  .siclk(siclk),
  .soclk(soclk)
                        ) ;

//************************************************************************
// REGISTERS section
//************************************************************************
sii_ilc_ctlmsff_ctl_macro__width_1 reg_sii_l2t_req_vld  // ASYNC reset active low
                                (
					.scan_in(reg_sii_l2t_req_vld_scanin),
					.scan_out(reg_sii_l2t_req_vld_scanout),
					.dout(sii_l2t_req_vld),
                                      	.l1clk(l1clk),
                                      	.din(sii_l2t_req_vld_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_2 reg_sii_dbg_l2t_req  // ASYNC reset active low
                                (
					.scan_in(reg_sii_dbg_l2t_req_scanin),
					.scan_out(reg_sii_dbg_l2t_req_scanout),
					.dout(sii_dbg_l2t_req),
                                      	.l1clk(l1clk),
                                      	.din(sii_dbg_l2t_req_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_6 reg_cstate  // ASYNC reset active low
                                (
					.scan_in(reg_cstate_scanin),
					.scan_out(reg_cstate_scanout),
					.dout(cstate_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(nstate[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_3 reg_sio_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_sio_cnt_scanin),
					.scan_out(reg_sio_cnt_scanout),
					.dout(sio_cnt_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(sio_cnt_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_4 reg_wri_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_wri_cnt_scanin),
					.scan_out(reg_wri_cnt_scanout),
					.dout(wri_cnt_r[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(wri_cnt_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_3 reg_wrm_cnt // ASYNC reset active low
                                (
					.scan_in(reg_wrm_cnt_scanin),
					.scan_out(reg_wrm_cnt_scanout),
					.dout(wrm_cnt_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(wrm_cnt_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ilc_ctlmsff_ctl_macro__width_2 reg_l2iq_cnt_r  // ASYNC reset active low
                                (
					.scan_in(reg_l2iq_cnt_r_scanin),
					.scan_out(reg_l2iq_cnt_r_scanout),
					.dout(l2iq_cnt_r[1:0]),
                                      	.l1clk(l1clk),
                                      	.din(l2iq_cnt_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_3 reg_l2wib_cnt_r  // ASYNC reset active low
                                (
					.scan_in(reg_l2wib_cnt_r_scanin),
					.scan_out(reg_l2wib_cnt_r_scanout),
					.dout(l2wib_cnt_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(l2wib_cnt_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_3 reg_hdr_rd_ptr  // ASYNC reset active low
                                (
					.scan_in(reg_hdr_rd_ptr_scanin),
					.scan_out(reg_hdr_rd_ptr_scanout),
					.dout(hdr_rd_ptr_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(hdr_rd_ptr_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_3 reg_hdr_wr_ptr  // ASYNC reset active low
                                (
					.scan_in(reg_hdr_wr_ptr_scanin),
					.scan_out(reg_hdr_wr_ptr_scanout),
					.dout(hdr_wr_ptr_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(hdr_wr_ptr_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_6 reg_ilc_ildq_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ilc_ildq_rd_addr_scanin),
					.scan_out(reg_ilc_ildq_rd_addr_scanout),
					.dout(ilc_ildq_rd_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ilc_ildq_rd_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_1 reg_ilc_ildq_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_ilc_ildq_rd_en_scanin),
					.scan_out(reg_ilc_ildq_rd_en_scanout),
					.dout(ilc_ildq_rd_en_r),
                                      	.l1clk(l1clk),
                                      	.din(ilc_ildq_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_1 reg_wrm_end  // ASYNC reset active low
                                (
					.scan_in(reg_wrm_end_scanin),
					.scan_out(reg_wrm_end_scanout),
					.dout(wrm_end_r),
                                      	.l1clk(l1clk),
                                      	.din(wrm_end_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_3 reg_cmd  // ASYNC reset active low
                                (
					.scan_in(reg_cmd_scanin),
					.scan_out(reg_cmd_scanout),
					.dout(cmd_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(cmd[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_1 reg_dmu_wrm  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_wrm_scanin),
					.scan_out(reg_dmu_wrm_scanout),
					.dout(ilc_ipcc_dmu_wrm_r),
                                      	.l1clk(l1clk),
                                      	.din(ilc_ipcc_dmu_wrm_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_1 reg_niu_wrm  // ASYNC reset active low
                                (
					.scan_in(reg_niu_wrm_scanin),
					.scan_out(reg_niu_wrm_scanout),
					.dout(ilc_ipcc_niu_wrm_r),
                                      	.l1clk(l1clk),
                                      	.din(ilc_ipcc_niu_wrm_l),
  .siclk(siclk),
  .soclk(soclk)
					);

//******************************************************************
// BE REGISTERS
//******************************************************************
sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be00   // ASYNC reset active low
                                (
					.scan_in(reg_be00_scanin),
					.scan_out(reg_be00_scanout),
					.dout(be00_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be00),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be01   // ASYNC reset active low
                                (
					.scan_in(reg_be01_scanin),
					.scan_out(reg_be01_scanout),
					.dout(be01_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be01),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be02   // ASYNC reset active low
                                (
					.scan_in(reg_be02_scanin),
					.scan_out(reg_be02_scanout),
					.dout(be02_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be02),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be03   // ASYNC reset active low
                                (
					.scan_in(reg_be03_scanin),
					.scan_out(reg_be03_scanout),
					.dout(be03_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be03),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be04   // ASYNC reset active low
                                (
					.scan_in(reg_be04_scanin),
					.scan_out(reg_be04_scanout),
					.dout(be04_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be04),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be05   // ASYNC reset active low
                                (
					.scan_in(reg_be05_scanin),
					.scan_out(reg_be05_scanout),
					.dout(be05_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be05),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be06   // ASYNC reset active low
                                (
					.scan_in(reg_be06_scanin),
					.scan_out(reg_be06_scanout),
					.dout(be06_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be06),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be07   // ASYNC reset active low
                                (
					.scan_in(reg_be07_scanin),
					.scan_out(reg_be07_scanout),
					.dout(be07_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be07),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be10   // ASYNC reset active low
                                (
					.scan_in(reg_be10_scanin),
					.scan_out(reg_be10_scanout),
					.dout(be10_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be10),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be11   // ASYNC reset active low
                                (
					.scan_in(reg_be11_scanin),
					.scan_out(reg_be11_scanout),
					.dout(be11_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be11),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be12   // ASYNC reset active low
                                (
					.scan_in(reg_be12_scanin),
					.scan_out(reg_be12_scanout),
					.dout(be12_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be12),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be13   // ASYNC reset active low
                                (
					.scan_in(reg_be13_scanin),
					.scan_out(reg_be13_scanout),
					.dout(be13_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be13),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be14   // ASYNC reset active low
                                (
					.scan_in(reg_be14_scanin),
					.scan_out(reg_be14_scanout),
					.dout(be14_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be14),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be15   // ASYNC reset active low
                                (
					.scan_in(reg_be15_scanin),
					.scan_out(reg_be15_scanout),
					.dout(be15_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be15),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be16   // ASYNC reset active low
                                (
					.scan_in(reg_be16_scanin),
					.scan_out(reg_be16_scanout),
					.dout(be16_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be16),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be17   // ASYNC reset active low
                                (
					.scan_in(reg_be17_scanin),
					.scan_out(reg_be17_scanout),
					.dout(be17_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be17),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be20   // ASYNC reset active low
                                (
					.scan_in(reg_be20_scanin),
					.scan_out(reg_be20_scanout),
					.dout(be20_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be20),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be21   // ASYNC reset active low
                                (
					.scan_in(reg_be21_scanin),
					.scan_out(reg_be21_scanout),
					.dout(be21_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be21),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be22   // ASYNC reset active low
                                (
					.scan_in(reg_be22_scanin),
					.scan_out(reg_be22_scanout),
					.dout(be22_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be22),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be23   // ASYNC reset active low
                                (
					.scan_in(reg_be23_scanin),
					.scan_out(reg_be23_scanout),
					.dout(be23_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be23),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be24   // ASYNC reset active low
                                (
					.scan_in(reg_be24_scanin),
					.scan_out(reg_be24_scanout),
					.dout(be24_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be24),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be25   // ASYNC reset active low
                                (
					.scan_in(reg_be25_scanin),
					.scan_out(reg_be25_scanout),
					.dout(be25_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be25),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be26   // ASYNC reset active low
                                (
					.scan_in(reg_be26_scanin),
					.scan_out(reg_be26_scanout),
					.dout(be26_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be26),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be27   // ASYNC reset active low
                                (
					.scan_in(reg_be27_scanin),
					.scan_out(reg_be27_scanout),
					.dout(be27_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be27),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be30   // ASYNC reset active low
                                (
					.scan_in(reg_be30_scanin),
					.scan_out(reg_be30_scanout),
					.dout(be30_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be30),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be31   // ASYNC reset active low
                                (
					.scan_in(reg_be31_scanin),
					.scan_out(reg_be31_scanout),
					.dout(be31_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be31),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be32   // ASYNC reset active low
                                (
					.scan_in(reg_be32_scanin),
					.scan_out(reg_be32_scanout),
					.dout(be32_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be32),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be33   // ASYNC reset active low
                                (
					.scan_in(reg_be33_scanin),
					.scan_out(reg_be33_scanout),
					.dout(be33_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be33),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be34   // ASYNC reset active low
                                (
					.scan_in(reg_be34_scanin),
					.scan_out(reg_be34_scanout),
					.dout(be34_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be34),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be35   // ASYNC reset active low
                                (
					.scan_in(reg_be35_scanin),
					.scan_out(reg_be35_scanout),
					.dout(be35_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be35),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be36   // ASYNC reset active low
                                (
					.scan_in(reg_be36_scanin),
					.scan_out(reg_be36_scanout),
					.dout(be36_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be36),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__en_1__width_8 reg_be37   // ASYNC reset active low
                                (
					.scan_in(reg_be37_scanin),
					.scan_out(reg_be37_scanout),
					.dout(be37_r[7:0]),
                                      	.l1clk(l1clk),
					.en(be37),
                                      	.din(ipcc_ilc_be[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_run  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_run_scanin),
					.scan_out(reg_sii_mb0_run_scanout),
					.dout(sii_mb0_run_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_run),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_rd_en_scanin),
					.scan_out(reg_sii_mb0_rd_en_scanout),
					.dout(sii_mb0_rd_en_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_5 reg_sii_mb0_addr  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_addr_scanin),
					.scan_out(reg_sii_mb0_addr_scanout),
					.dout(sii_mb0_addr_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_addr[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_4 reg_ilc_ild_addr_h  // ASYNC reset active low
                                (
					.scan_in(reg_ilc_ild_addr_h_scanin),
					.scan_out(reg_ilc_ild_addr_h_scanout),
					.dout(ilc_ild_addr_h[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ilc_ild_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ilc_ctlmsff_ctl_macro__width_4 reg_ilc_ild_addr_lo  // ASYNC reset active low
                                (
					.scan_in(reg_ilc_ild_addr_lo_scanin),
					.scan_out(reg_ilc_ild_addr_lo_scanout),
					.dout(ilc_ild_addr_lo[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ilc_ild_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reg_curhdr_58_56_scanin   = spares_scanout           ;
assign reg_pre_curhdr0_scanin    = reg_curhdr_58_56_scanout ;
assign reg_pre_curhdr1_scanin    = reg_pre_curhdr0_scanout  ;
assign reg_pre_curhdr2_scanin    = reg_pre_curhdr1_scanout  ;
assign reg_pre_curhdr3_scanin    = reg_pre_curhdr2_scanout  ;
assign reg_sii_l2t_req_vld_scanin = reg_pre_curhdr3_scanout  ;
assign reg_sii_dbg_l2t_req_scanin = reg_sii_l2t_req_vld_scanout;
assign reg_cstate_scanin         = reg_sii_dbg_l2t_req_scanout;
assign reg_sio_cnt_scanin        = reg_cstate_scanout       ;
assign reg_wri_cnt_scanin        = reg_sio_cnt_scanout      ;
assign reg_wrm_cnt_scanin        = reg_wri_cnt_scanout      ;
assign reg_l2iq_cnt_r_scanin     = reg_wrm_cnt_scanout      ;
assign reg_l2wib_cnt_r_scanin    = reg_l2iq_cnt_r_scanout   ;
assign reg_hdr_rd_ptr_scanin     = reg_l2wib_cnt_r_scanout  ;
assign reg_hdr_wr_ptr_scanin     = reg_hdr_rd_ptr_scanout   ;
assign reg_ilc_ildq_rd_addr_scanin = reg_hdr_wr_ptr_scanout   ;
assign reg_ilc_ildq_rd_en_scanin = reg_ilc_ildq_rd_addr_scanout;
assign reg_wrm_end_scanin        = reg_ilc_ildq_rd_en_scanout;
assign reg_cmd_scanin            = reg_wrm_end_scanout      ;
assign reg_dmu_wrm_scanin        = reg_cmd_scanout          ;
assign reg_niu_wrm_scanin        = reg_dmu_wrm_scanout      ;
assign reg_be00_scanin           = reg_niu_wrm_scanout      ;
assign reg_be01_scanin           = reg_be00_scanout         ;
assign reg_be02_scanin           = reg_be01_scanout         ;
assign reg_be03_scanin           = reg_be02_scanout         ;
assign reg_be04_scanin           = reg_be03_scanout         ;
assign reg_be05_scanin           = reg_be04_scanout         ;
assign reg_be06_scanin           = reg_be05_scanout         ;
assign reg_be07_scanin           = reg_be06_scanout         ;
assign reg_be10_scanin           = reg_be07_scanout         ;
assign reg_be11_scanin           = reg_be10_scanout         ;
assign reg_be12_scanin           = reg_be11_scanout         ;
assign reg_be13_scanin           = reg_be12_scanout         ;
assign reg_be14_scanin           = reg_be13_scanout         ;
assign reg_be15_scanin           = reg_be14_scanout         ;
assign reg_be16_scanin           = reg_be15_scanout         ;
assign reg_be17_scanin           = reg_be16_scanout         ;
assign reg_be20_scanin           = reg_be17_scanout         ;
assign reg_be21_scanin           = reg_be20_scanout         ;
assign reg_be22_scanin           = reg_be21_scanout         ;
assign reg_be23_scanin           = reg_be22_scanout         ;
assign reg_be24_scanin           = reg_be23_scanout         ;
assign reg_be25_scanin           = reg_be24_scanout         ;
assign reg_be26_scanin           = reg_be25_scanout         ;
assign reg_be27_scanin           = reg_be26_scanout         ;
assign reg_be30_scanin           = reg_be27_scanout         ;
assign reg_be31_scanin           = reg_be30_scanout         ;
assign reg_be32_scanin           = reg_be31_scanout         ;
assign reg_be33_scanin           = reg_be32_scanout         ;
assign reg_be34_scanin           = reg_be33_scanout         ;
assign reg_be35_scanin           = reg_be34_scanout         ;
assign reg_be36_scanin           = reg_be35_scanout         ;
assign reg_be37_scanin           = reg_be36_scanout         ;
assign reg_sii_mb0_run_scanin    = reg_be37_scanout         ;
assign reg_sii_mb0_rd_en_scanin  = reg_sii_mb0_run_scanout  ;
assign reg_sii_mb0_addr_scanin   = reg_sii_mb0_rd_en_scanout;
assign reg_ilc_ild_addr_h_scanin = reg_sii_mb0_addr_scanout ;
assign reg_ilc_ild_addr_lo_scanin = reg_ilc_ild_addr_h_scanout;
assign scan_out                  = reg_ilc_ild_addr_lo_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module sii_ilc_ctll1clkhdr_ctl_macro (
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


module sii_ilc_ctlspare_ctl_macro__num_6 (
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
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;


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

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));
assign scan_out = so_5;



endmodule






// any PARAMS parms go into naming of macro

module sii_ilc_ctlmsff_ctl_macro__width_5 (
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

module sii_ilc_ctlmsff_ctl_macro__width_1 (
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

module sii_ilc_ctlmsff_ctl_macro__width_2 (
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

module sii_ilc_ctlmsff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ilc_ctlmsff_ctl_macro__width_3 (
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

module sii_ilc_ctlmsff_ctl_macro__width_4 (
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

module sii_ilc_ctlmsff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






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








