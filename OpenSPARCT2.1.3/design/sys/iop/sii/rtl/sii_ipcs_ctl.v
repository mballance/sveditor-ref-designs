// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_ipcs_ctl.v
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
module	sii_ipcs_ctl (
  ext_sii_hdr_vld, 
  ext_sii_reqbypass, 
  ext_sii_datareq, 
  ext_sii_datareq16, 
  ext_sii_data, 
  ext_sii_be, 
  ext_sii_parity, 
  ext_sii_be_parity, 
  ncu_sii_ctag_uei, 
  ncu_sii_ctag_cei, 
  ncu_sii_a_pei, 
  ncu_sii_d_pei, 
  sii_ext_wrack_tag, 
  sii_ext_wrack_vld, 
  sii_ext_wrack_parity, 
  sii_ext_oqdq, 
  sii_ext_bqdq, 
  ipcc_ipcs_or_go_lv, 
  ipcc_ipcs_by_go_lv, 
  ipcc_ipcs_or_ptr, 
  ipcc_ipcs_by_ptr, 
  ipcc_ipcs_dmu_tag, 
  ipcc_ipcs_dmu_wrack_p, 
  ipcc_ipcs_wrack_lv, 
  ipcs_ipcc_or_dep, 
  ipcs_ipcc_by_dep, 
  ipcs_ipcc_add_or, 
  ipcs_ipcc_add_by, 
  ipdohq_din, 
  ipdbhq_din, 
  ipdodq_din, 
  ipdbdq_din, 
  ipcs_ipdohq_wr_addr, 
  ipcs_ipdohq_wr_en, 
  ipcs_ipdbhq_wr_addr, 
  ipcs_ipdbhq_wr_en, 
  ipcs_ipdodq_wr_addr, 
  ipcs_ipdodq_wr_en, 
  ipcs_ipdbdq_wr_addr, 
  ipcs_ipdbdq_wr_en, 
  dmu_mode, 
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_scan_en, 
  tcu_dbr_gateoff, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  sii_mb1_ipdodq_wr_en, 
  sii_mb1_ipdbdq_wr_en, 
  sii_mb1_ipdohq_wr_en, 
  sii_mb1_ipdbhq_wr_en, 
  sii_mb1_run_r, 
  sii_mb1_wr_addr, 
  sii_mb1_wdata);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire cmd_grp_4_unused;
wire [5:0] cmd_grp;
wire gt_wrptr_4_unused;
wire [4:0] gt_wrptr;
wire [71:0] mbist_hdr_data;
wire [159:0] mbist_data_data;
wire dmu_wrack_vld;
wire ipcc_ipcs_or_go;
wire ipcc_ipcs_by_go;
wire add_or;
wire ext_sii_reqbypass_r;
wire [6:0] cstate;
wire l2_io;
wire [2:0] cmd;
wire add_by;
wire [40:0] or_cam15_r;
wire [40:0] or_cam14_r;
wire [40:0] or_cam13_r;
wire [40:0] or_cam12_r;
wire [40:0] or_cam11_r;
wire [40:0] or_cam10_r;
wire [40:0] or_cam9_r;
wire [40:0] or_cam8_r;
wire [40:0] or_cam7_r;
wire [40:0] or_cam6_r;
wire [40:0] or_cam5_r;
wire [40:0] or_cam4_r;
wire [40:0] or_cam3_r;
wire [40:0] or_cam2_r;
wire [40:0] or_cam1_r;
wire [40:0] or_cam0_r;
wire [40:0] by_cam15_r;
wire [40:0] by_cam14_r;
wire [40:0] by_cam13_r;
wire [40:0] by_cam12_r;
wire [40:0] by_cam11_r;
wire [40:0] by_cam10_r;
wire [40:0] by_cam9_r;
wire [40:0] by_cam8_r;
wire [40:0] by_cam7_r;
wire [40:0] by_cam6_r;
wire [40:0] by_cam5_r;
wire [40:0] by_cam4_r;
wire [40:0] by_cam3_r;
wire [40:0] by_cam2_r;
wire [40:0] by_cam1_r;
wire [40:0] by_cam0_r;
wire ext_sii_datai;
wire [4:0] ipdohq_wr_addr_r;
wire [4:0] ipdohq_wr_addr_l;
wire ipcs_ipdohq_wr_en_i;
wire [4:0] ipdbhq_wr_addr_r;
wire [4:0] ipdbhq_wr_addr_l;
wire ipcs_ipdbhq_wr_en_i;
wire [71:0] newhdr;
wire [5:0] ipcs_ipdodq_wr_addr_l;
wire arc_data1_data2;
wire [5:0] ipcs_ipdodq_wr_addr_r;
wire [5:0] ipcs_ipdbdq_wr_addr_l;
wire [5:0] ipcs_ipdbdq_wr_addr_r;
wire ext_sii_datareq16_l;
wire ext_sii_datareq16_r;
wire dmu_sii_reqbypass_l;
wire [127:0] ext_sii_hdr_l;
wire [127:0] ext_sii_hdr_r;
wire [5:0] ctag_ecc;
wire [1:0] addr_parity;
wire cmd_parity;
wire intr;
wire posted;
wire [15:0] id;
wire timeout;
wire unmap;
wire uncor;
wire [37:0] pa;
wire cmd_parity_ori;
wire [4:0] last_or_wr_l;
wire [3:0] ipcc_ipcs_or_raddr;
wire [4:0] last_or_wr_r;
wire w_r;
wire [4:0] last_by_wr_l;
wire [3:0] ipcc_ipcs_by_raddr;
wire [4:0] last_by_wr_r;
wire [33:0] addr;
wire [3:0] ptr;
wire [3:0] dmu_ptr;
wire [3:0] niu_ptr;
wire [3:0] youngest_match;
wire [3:0] youngest_dep;
wire [3:0] dmu_or_ptr;
wire [3:0] dmu_by_ptr;
wire [3:0] dmu_or_ptr_l;
wire [3:0] dmu_by_ptr_l;
wire niu_dep;
wire address_matched;
wire [4:0] last_wrptr;
wire dmu_dep;
wire or_qvalid;
wire by_qvalid;
wire dep;
wire [40:0] cam_l;
wire match0;
wire by_cam0_v;
wire or_cam0_v;
wire match1;
wire by_cam1_v;
wire or_cam1_v;
wire match2;
wire by_cam2_v;
wire or_cam2_v;
wire match3;
wire by_cam3_v;
wire or_cam3_v;
wire match4;
wire by_cam4_v;
wire or_cam4_v;
wire match5;
wire by_cam5_v;
wire or_cam5_v;
wire match6;
wire by_cam6_v;
wire or_cam6_v;
wire match7;
wire by_cam7_v;
wire or_cam7_v;
wire match8;
wire by_cam8_v;
wire or_cam8_v;
wire match9;
wire by_cam9_v;
wire or_cam9_v;
wire match10;
wire by_cam10_v;
wire or_cam10_v;
wire match11;
wire by_cam11_v;
wire or_cam11_v;
wire match12;
wire by_cam12_v;
wire or_cam12_v;
wire match13;
wire by_cam13_v;
wire or_cam13_v;
wire match14;
wire by_cam14_v;
wire or_cam14_v;
wire match15;
wire by_cam15_v;
wire or_cam15_v;
wire by_clr_v0;
wire by_clr_v1;
wire by_clr_v2;
wire by_clr_v3;
wire by_clr_v4;
wire by_clr_v5;
wire by_clr_v6;
wire by_clr_v7;
wire by_clr_v8;
wire by_clr_v9;
wire by_clr_v10;
wire by_clr_v11;
wire by_clr_v12;
wire by_clr_v13;
wire by_clr_v14;
wire by_clr_v15;
wire or_clr_v0;
wire or_clr_v1;
wire or_clr_v2;
wire or_clr_v3;
wire or_clr_v4;
wire or_clr_v5;
wire or_clr_v6;
wire or_clr_v7;
wire or_clr_v8;
wire or_clr_v9;
wire or_clr_v10;
wire or_clr_v11;
wire or_clr_v12;
wire or_clr_v13;
wire or_clr_v14;
wire or_clr_v15;
wire [3:0] wpt;
wire [4:0] lt_wrptr;
wire [6:0] nstate;
wire [6:0] cstate_r;
wire arc_start_hdr;
wire arc_start_hdrpayld;
wire arc_hdr_hdrpayld;
wire arc_hdr_hdr;
wire arc_hdrpayld_data1;
wire arc_data1_hdrpayld;
wire arc_data1_hdr;
wire arc_data2_data3;
wire arc_data3_data4;
wire arc_data4_hdr;
wire arc_data4_hdrpayld;
wire or_clr_d0;
wire or_clr_d1;
wire or_clr_d2;
wire or_clr_d3;
wire or_clr_d4;
wire or_clr_d5;
wire or_clr_d6;
wire or_clr_d7;
wire or_clr_d8;
wire or_clr_d9;
wire or_clr_d10;
wire or_clr_d11;
wire or_clr_d12;
wire or_clr_d13;
wire or_clr_d14;
wire or_clr_d15;
wire by_clr_d0;
wire by_clr_d1;
wire by_clr_d2;
wire by_clr_d3;
wire by_clr_d4;
wire by_clr_d5;
wire by_clr_d6;
wire by_clr_d7;
wire by_clr_d8;
wire by_clr_d9;
wire by_clr_d10;
wire by_clr_d11;
wire by_clr_d12;
wire by_clr_d13;
wire by_clr_d14;
wire by_clr_d15;
wire reg_cstate_scanin;
wire reg_cstate_scanout;
wire reg_last_or_wr_scanin;
wire reg_last_or_wr_scanout;
wire reg_last_by_wr_scanin;
wire reg_last_by_wr_scanout;
wire reg_dmu_or_ptr_scanin;
wire reg_dmu_or_ptr_scanout;
wire reg_dmu_by_ptr_scanin;
wire reg_dmu_by_ptr_scanout;
wire reg_ipdohq_wr_addr_scanin;
wire reg_ipdohq_wr_addr_scanout;
wire reg_ipdbhq_wr_addr_scanin;
wire reg_ipdbhq_wr_addr_scanout;
wire reg_ipdodq_wr_addr_scanin;
wire reg_ipdodq_wr_addr_scanout;
wire reg_ipdbdq_wr_addr_scanin;
wire reg_ipdbdq_wr_addr_scanout;
wire reg_dmu_sii_hdr_scanin;
wire reg_dmu_sii_hdr_scanout;
wire reg_datareq16_scanin;
wire reg_datareq16_scanout;
wire reg_reqbypass_scanin;
wire reg_reqbypass_scanout;
wire reg_add_or_scanin;
wire reg_add_or_scanout;
wire reg_add_by_scanin;
wire reg_add_by_scanout;
wire reg_dmu_wrack_tag_scanin;
wire reg_dmu_wrack_tag_scanout;
wire reg_dmu_wrack_parity_scanin;
wire reg_dmu_wrack_parity_scanout;
wire ipcc_ipcs_wrack_vld;
wire sync2_wrack;
wire reg_ipcc_ipcs_wrack_scanin;
wire reg_ipcc_ipcs_wrack_scanout;
wire sync_ff_wrack1_scanin;
wire sync_ff_wrack1_scanout;
wire sync1_wrack;
wire sync_ff_wrack2_scanin;
wire sync_ff_wrack2_scanout;
wire ipcc_ipcs_or_dq;
wire reg_ipcc_ipcs_or_dq_scanin;
wire reg_ipcc_ipcs_or_dq_scanout;
wire ipcc_ipcs_by_dq;
wire reg_ipcc_ipcs_by_dq_scanin;
wire reg_ipcc_ipcs_by_dq_scanout;
wire sync_ff_or_ptr2_scanin;
wire sync_ff_or_ptr2_scanout;
wire sync_ff_by_ptr1_scanin;
wire sync_ff_by_ptr1_scanout;
wire reg_by_cam0_scanin;
wire reg_by_cam0_scanout;
wire reg_by_cam1_scanin;
wire reg_by_cam1_scanout;
wire reg_by_cam2_scanin;
wire reg_by_cam2_scanout;
wire reg_by_cam3_scanin;
wire reg_by_cam3_scanout;
wire reg_by_cam4_scanin;
wire reg_by_cam4_scanout;
wire reg_by_cam5_scanin;
wire reg_by_cam5_scanout;
wire reg_by_cam6_scanin;
wire reg_by_cam6_scanout;
wire reg_by_cam7_scanin;
wire reg_by_cam7_scanout;
wire reg_by_cam8_scanin;
wire reg_by_cam8_scanout;
wire reg_by_cam9_scanin;
wire reg_by_cam9_scanout;
wire reg_by_cam10_scanin;
wire reg_by_cam10_scanout;
wire reg_by_cam11_scanin;
wire reg_by_cam11_scanout;
wire reg_by_cam12_scanin;
wire reg_by_cam12_scanout;
wire reg_by_cam13_scanin;
wire reg_by_cam13_scanout;
wire reg_by_cam14_scanin;
wire reg_by_cam14_scanout;
wire reg_by_cam15_scanin;
wire reg_by_cam15_scanout;
wire reg_or_cam0_scanin;
wire reg_or_cam0_scanout;
wire reg_or_cam1_scanin;
wire reg_or_cam1_scanout;
wire reg_or_cam2_scanin;
wire reg_or_cam2_scanout;
wire reg_or_cam3_scanin;
wire reg_or_cam3_scanout;
wire reg_or_cam4_scanin;
wire reg_or_cam4_scanout;
wire reg_or_cam5_scanin;
wire reg_or_cam5_scanout;
wire reg_or_cam6_scanin;
wire reg_or_cam6_scanout;
wire reg_or_cam7_scanin;
wire reg_or_cam7_scanout;
wire reg_or_cam8_scanin;
wire reg_or_cam8_scanout;
wire reg_or_cam9_scanin;
wire reg_or_cam9_scanout;
wire reg_or_cam10_scanin;
wire reg_or_cam10_scanout;
wire reg_or_cam11_scanin;
wire reg_or_cam11_scanout;
wire reg_or_cam12_scanin;
wire reg_or_cam12_scanout;
wire reg_or_cam13_scanin;
wire reg_or_cam13_scanout;
wire reg_or_cam14_scanin;
wire reg_or_cam14_scanout;
wire reg_or_cam15_scanin;
wire reg_or_cam15_scanout;


//----- b/w DMU or NIU to SIU --------
input 		ext_sii_hdr_vld;	
input 		ext_sii_reqbypass;	
input 		ext_sii_datareq;	
input 		ext_sii_datareq16;	
input  	[127:0]	ext_sii_data;	
input 	[15:0]	ext_sii_be;	
input 	[7:0]	ext_sii_parity;	
input 		ext_sii_be_parity;	

input		ncu_sii_ctag_uei;	// niu ctag uncorrectable error injection 
input		ncu_sii_ctag_cei;	// niu ctag correctable error injection
input		ncu_sii_a_pei;	// niu address prarity error injection
input		ncu_sii_d_pei;	// niu data parity error injection
 
output  [3:0]	sii_ext_wrack_tag;
output  	sii_ext_wrack_vld;
output  	sii_ext_wrack_parity;
output  	sii_ext_oqdq;		// dequeue signal for external device to keep track of credit 
output  	sii_ext_bqdq;

//------ b/w ipcc and ipcs-------/
input		ipcc_ipcs_or_go_lv;
input		ipcc_ipcs_by_go_lv;	// act as valid for the read address pointer	
input 	[3:0]	ipcc_ipcs_or_ptr; 	//ordered header queue read address pointer 
input 	[3:0]	ipcc_ipcs_by_ptr;
input 	[3:0]	ipcc_ipcs_dmu_tag;	// for dmu to keep track of credit
input 		ipcc_ipcs_dmu_wrack_p;	// for dmu to keep track of credit
input 		ipcc_ipcs_wrack_lv;	// for dmu to keep track of credit
output 	[15:0]	ipcs_ipcc_or_dep;	// tell the corresponding dependcy is removed
output 	[15:0]	ipcs_ipcc_by_dep;
output		ipcs_ipcc_add_or;
output		ipcs_ipcc_add_by;
		
//------going to register file ildq-------
output  [71:0]  ipdohq_din;		// write data going to the ordered queue
output  [71:0]  ipdbhq_din;		// write data going to the bypass queue
output  [159:0] ipdodq_din;		// write data 128 pay load + 16 bit be 
output  [159:0] ipdbdq_din;		// write data 128 pay load + 16 bit be

// header queues control signals
output  [3:0]   ipcs_ipdohq_wr_addr;   //dmu ordered data queue write address 
output     	ipcs_ipdohq_wr_en;   	//dmu ordered data queue write enable 
output  [3:0]   ipcs_ipdbhq_wr_addr;   //dmu ordered data queue write address 
output    	ipcs_ipdbhq_wr_en;   	//dmu ordered data queue write enable 

// data queues control signals
output  [5:0]   ipcs_ipdodq_wr_addr;   //dmu ordered data queue write address 
output     	ipcs_ipdodq_wr_en;   	//dmu ordered data queue write enable 
output  [5:0]   ipcs_ipdbdq_wr_addr;   //dmu ordered data queue write address 
output    	ipcs_ipdbdq_wr_en;   	//dmu ordered data queue write enable 

input	dmu_mode;			// dmu_mode = 1, all dma rd/wr and  interrupt go to order queue
					// and only PIO read return go to bypass queue
input	iol2clk;
input	scan_in ;
output	scan_out;
input   tcu_scan_en;
input	tcu_dbr_gateoff;
input   tcu_aclk;
input   tcu_bclk;
input   tcu_pce_ov;
input   tcu_clk_stop;

//------ mbist related control signals -----
input         	sii_mb1_ipdodq_wr_en;
input         	sii_mb1_ipdbdq_wr_en;
input         	sii_mb1_ipdohq_wr_en;
input         	sii_mb1_ipdbhq_wr_en;
input		sii_mb1_run_r;
input [5:0]   	sii_mb1_wr_addr;
input [7:0]     sii_mb1_wdata;


assign 	 se = tcu_scan_en;
assign 	 siclk = tcu_aclk;
assign 	 soclk = tcu_bclk;
assign 	 pce_ov = tcu_pce_ov;
assign 	 stop = tcu_clk_stop;

reg 	[6:0]	nstate_r;

reg 	[40:0]	or_cam0_l;	
reg 	[40:0]	or_cam1_l;	
reg 	[40:0]	or_cam2_l;	
reg 	[40:0]	or_cam3_l;	
reg 	[40:0]	or_cam4_l;	
reg 	[40:0]	or_cam5_l;	
reg 	[40:0]	or_cam6_l;	
reg 	[40:0]	or_cam7_l;	
reg 	[40:0]	or_cam8_l;	
reg 	[40:0]	or_cam9_l;	
reg 	[40:0]	or_cam10_l;	
reg 	[40:0]	or_cam11_l;	
reg 	[40:0]	or_cam12_l;	
reg 	[40:0]	or_cam13_l;	
reg 	[40:0]	or_cam14_l;	
reg 	[40:0]	or_cam15_l;	

reg 	[40:0]	by_cam0_l;	
reg 	[40:0]	by_cam1_l;	
reg 	[40:0]	by_cam2_l;	
reg 	[40:0]	by_cam3_l;	
reg 	[40:0]	by_cam4_l;	
reg 	[40:0]	by_cam5_l;	
reg 	[40:0]	by_cam6_l;	
reg 	[40:0]	by_cam7_l;	
reg 	[40:0]	by_cam8_l;	
reg 	[40:0]	by_cam9_l;	
reg 	[40:0]	by_cam10_l;	
reg 	[40:0]	by_cam11_l;	
reg 	[40:0]	by_cam12_l;	
reg 	[40:0]	by_cam13_l;	
reg 	[40:0]	by_cam14_l;	
reg 	[40:0]	by_cam15_l;	

//************************************************************************
// CLOCK HEADER 
//************************************************************************
sii_ipcs_ctll1clkhdr_ctl_macro clkgen (
                              .l2clk  (iol2clk                  ),
                              .l1en   (1'b1                   ),
                              .l1clk  (l1clk                ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                              );

//Spare gates
sii_ipcs_ctlspare_ctl_macro__num_20 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//************************************************************************
// UNUSED CONNECTIONS 
//************************************************************************
assign 		cmd_grp_4_unused = cmd_grp[4];
assign 		gt_wrptr_4_unused = gt_wrptr[4];
   
//************************************************************************
// STATE DEFINITION 
//************************************************************************

`define		START_ST		7'b0000001
`define		HDR_ST			7'b0000010
`define		HDR_PAYLD_ST		7'b0000100
`define		DATA1_ST		7'b0001000
`define		DATA2_ST		7'b0010000
`define		DATA3_ST		7'b0100000
`define		DATA4_ST		7'b1000000

`define		START		 	0
`define		HDR		 	1
`define		HDR_PAYLD	 	2
`define		DATA1		 	3
`define		DATA2		 	4
`define		DATA3		 	5
`define		DATA4		 	6

//************************************************************************
//				MBIST SECTIONS
//************************************************************************

assign  mbist_hdr_data[71:0]	= {sii_mb1_wdata[7:0], sii_mb1_wdata[7:0], sii_mb1_wdata[7:0],
				   sii_mb1_wdata[7:0], sii_mb1_wdata[7:0], sii_mb1_wdata[7:0],	
				   sii_mb1_wdata[7:0], sii_mb1_wdata[7:0], sii_mb1_wdata[7:0]};

assign  mbist_data_data[159:0]	= {mbist_hdr_data[15:0], mbist_hdr_data[71:0], mbist_hdr_data[71:0]}; 

//************************************************************************
//				OUTPUT LOGICS 
//************************************************************************
assign	sii_ext_wrack_vld	= dmu_wrack_vld & ~tcu_dbr_gateoff;
// Flopped to synchronize to IO domain
//assign	sii_ext_wrack_tag[3:0] = ipcc_ipcs_dmu_tag[3:0];
//assign	sii_ext_wrack_parity	= ipcc_ipcs_dmu_wrack_p;
assign  sii_ext_oqdq		= ipcc_ipcs_or_go & ~tcu_dbr_gateoff;
assign  sii_ext_bqdq		= ipcc_ipcs_by_go & ~tcu_dbr_gateoff;

assign  add_or			= ~ext_sii_reqbypass_r && ((cstate[`HDR] && l2_io && cmd[0])|| //dma_rd
				   (cstate[`DATA1] && ~l2_io) || //PIO, interrupt
					(cstate[`DATA4] ) ) ;	//dma_wr
assign  add_by			= ext_sii_reqbypass_r && ((cstate[`HDR] && l2_io && cmd[0])|| 
				   (cstate[`DATA1] && ~l2_io) || 
					(cstate[`DATA4] ) ) ;
assign  ipcs_ipcc_or_dep[15:0]	= {or_cam15_r[1], or_cam14_r[1], or_cam13_r[1], or_cam12_r[1],
				   or_cam11_r[1], or_cam10_r[1], or_cam9_r[1], or_cam8_r[1],      
				   or_cam7_r[1], or_cam6_r[1], or_cam5_r[1], or_cam4_r[1],      
				   or_cam3_r[1], or_cam2_r[1], or_cam1_r[1], or_cam0_r[1]};      

assign  ipcs_ipcc_by_dep[15:0]	= {by_cam15_r[1], by_cam14_r[1], by_cam13_r[1], by_cam12_r[1],
				   by_cam11_r[1], by_cam10_r[1], by_cam9_r[1], by_cam8_r[1],      
				   by_cam7_r[1], by_cam6_r[1], by_cam5_r[1], by_cam4_r[1],      
				   by_cam3_r[1], by_cam2_r[1], by_cam1_r[1], by_cam0_r[1]};      

//assign  ipdodq_din[159:0]	= {8'h00,ext_sii_data[127:0],ext_sii_be[15:0],new_parity[7:0]};       
//assign  ipdbdq_din[159:0]	= {8'h00,ext_sii_data[127:0],ext_sii_be[15:0],new_parity[7:0]};       

assign  ipdodq_din[159:0]	= sii_mb1_run_r ? mbist_data_data[159:0] :
				  {7'h00,ext_sii_be_parity, ext_sii_parity[7:0],ext_sii_be[15:0],
					ext_sii_data[127:1], ext_sii_datai };       
assign  ipdbdq_din[159:0]	= sii_mb1_run_r ? mbist_data_data[159:0] : 
				  {7'h00, ext_sii_be_parity, ext_sii_parity[7:0],ext_sii_be[15:0],
					ext_sii_data[127:1], ext_sii_datai };

assign  ext_sii_datai           = ncu_sii_d_pei ^ ext_sii_data[0];

//----- header queue signals ------------------
assign  ipcs_ipdohq_wr_addr [3:0] = sii_mb1_run_r ? sii_mb1_wr_addr[3:0] :ipdohq_wr_addr_r[3:0];
assign  ipdohq_wr_addr_l[4:0] =  (cstate[`HDR] || cstate[`HDR_PAYLD]) && ~ext_sii_reqbypass_r ?
					(ipdohq_wr_addr_r[4:0] + 5'b00001) :
					ipdohq_wr_addr_r[4:0];   
assign  ipcs_ipdohq_wr_en	= sii_mb1_run_r? sii_mb1_ipdohq_wr_en : ipcs_ipdohq_wr_en_i;
assign  ipcs_ipdohq_wr_en_i	= (cstate[`HDR] || cstate[`HDR_PAYLD]) && ~ext_sii_reqbypass_r;      

assign  ipcs_ipdbhq_wr_addr[3:0] =  sii_mb1_run_r? sii_mb1_wr_addr[3:0] :ipdbhq_wr_addr_r[3:0];
assign  ipdbhq_wr_addr_l[4:0] = (cstate[`HDR] || cstate[`HDR_PAYLD]) && ext_sii_reqbypass_r ?
                                        (ipdbhq_wr_addr_r[4:0] + 5'b00001) :
                                         ipdbhq_wr_addr_r[4:0];
assign  ipcs_ipdbhq_wr_en       = sii_mb1_run_r ? sii_mb1_ipdbhq_wr_en : ipcs_ipdbhq_wr_en_i; 
assign  ipcs_ipdbhq_wr_en_i     = (cstate[`HDR] || cstate[`HDR_PAYLD]) && ext_sii_reqbypass_r;

assign  ipdohq_din[71:0]	= sii_mb1_run_r ? mbist_hdr_data[71:0] : newhdr[71:0];            
assign  ipdbhq_din[71:0]	= sii_mb1_run_r ? mbist_hdr_data[71:0] : newhdr[71:0];            

//----- data queues control signals -----------
assign  ipcs_ipdodq_wr_addr_l[5:0] =  ~ext_sii_reqbypass_r && ((cstate[`HDR_PAYLD] || 
					(cstate[`DATA1] && arc_data1_data2 ) || cstate[`DATA2] 
				       || cstate[`DATA3])) ? (ipcs_ipdodq_wr_addr_r[5:0] + 6'b000001)
				     : ipcs_ipdodq_wr_addr_r[5:0];   
assign  ipcs_ipdodq_wr_addr[5:0] = 	sii_mb1_run_r ? sii_mb1_wr_addr[5:0] : ipcs_ipdodq_wr_addr_r[5:0];
assign  ipcs_ipdodq_wr_en 	= 	sii_mb1_run_r ? sii_mb1_ipdodq_wr_en :
					(~ext_sii_reqbypass_r && (cstate[`HDR_PAYLD] ||
					(cstate[`DATA1] && arc_data1_data2) || cstate[`DATA2] 
					|| cstate[`DATA3]));    

assign  ipcs_ipdbdq_wr_addr_l[5:0] =   ext_sii_reqbypass_r && ((cstate[`HDR_PAYLD] || 
                                        (cstate[`DATA1] && arc_data1_data2 ) || cstate[`DATA2] 
                                       || cstate[`DATA3])) ? (ipcs_ipdbdq_wr_addr_r[5:0] + 6'b000001)
                                     : ipcs_ipdbdq_wr_addr_r[5:0];

assign  ipcs_ipdbdq_wr_addr[5:0] = 	sii_mb1_run_r ? sii_mb1_wr_addr[5:0] : ipcs_ipdbdq_wr_addr_r[5:0];
assign  ipcs_ipdbdq_wr_en	= 	sii_mb1_run_r ? sii_mb1_ipdbdq_wr_en : 
					(ext_sii_reqbypass_r && (cstate[`HDR_PAYLD] ||
                                        (cstate[`DATA1] &&  arc_data1_data2 ) || cstate[`DATA2] 
					|| cstate[`DATA3]));      

//************************************************************************
//	internal wires assignment	
//************************************************************************
assign	ext_sii_datareq16_l = ext_sii_hdr_vld ?  ext_sii_datareq16 : ext_sii_datareq16_r;
assign	dmu_sii_reqbypass_l = (ext_sii_hdr_vld) ? ext_sii_reqbypass :
				ext_sii_reqbypass_r;
assign	ext_sii_hdr_l[127:0] = (ext_sii_hdr_vld) ? ext_sii_data[127:0] :
				ext_sii_hdr_r[127:0];
assign	newhdr[71:0] = {ctag_ecc[5:0], addr_parity[1:0], cmd_parity,  intr, cmd[2:0], l2_io, posted, id[15:0], timeout,
			unmap, uncor, pa[37:0]}; 		

assign  cmd[2:0] = ((cmd_grp[3] == 1'b1) && (cmd_grp[1:0]== 2'b10)) ? 3'b001 :
		  (~cmd_grp[5] && (cmd_grp[3:0] == 4'b0010)) ? 3'b100 : 3'b010;
assign  l2_io 	= ext_sii_hdr_r[123];
assign  posted 	= ext_sii_hdr_r[126];
assign  intr 	= (ext_sii_hdr_r[127:122] == 6'b000001) ? 1'b1 : 1'b0;
assign  timeout	= ext_sii_hdr_r[82];
assign  unmap	= ext_sii_hdr_r[81];
assign  uncor	= ext_sii_hdr_r[80]; 
assign  id[15:0] =  ncu_sii_ctag_uei ? {ext_sii_hdr_r[79:66], ~ext_sii_hdr_r[65], ~ext_sii_hdr_r[64]} : 
		    ncu_sii_ctag_cei ?  {ext_sii_hdr_r[79:65], ~ext_sii_hdr_r[64]} :ext_sii_hdr_r[79:64];
assign  pa[37:0] = { ext_sii_hdr_r[39:10], ncu_sii_a_pei ^ ext_sii_hdr_r[9], ext_sii_hdr_r[8:2]} ; 
assign  cmd_grp[5:0] = {ext_sii_hdr_r[127:122]};
assign  ctag_ecc[5:0] = ext_sii_hdr_r[61:56];
assign  addr_parity[1:0] = ext_sii_hdr_r[84:83];

assign  cmd_parity_ori =   ^ cmd_grp[5:0] ^ ext_sii_hdr_r[62];

assign  cmd_parity =  cmd[2] ^ cmd[1] ^ cmd[0] ^ intr ^ l2_io ^ cmd_parity_ori ;

//------------------------------------------------------------------------
//	Duplicate Address registers and tag depedency
//------------------------------------------------------------------------
// Set the last write pointer in both queues , the msb bit[4] is valid it
// Whenever ipcc dequeue a write transaction , if the address matched last_write ptr,
// the last write pointer will be invalidate, meaning there is no more write
// transactons in the queue.

assign  last_or_wr_l[4]	= ipcc_ipcs_or_go && 
			  (ipcc_ipcs_or_raddr[3:0] == last_or_wr_r[3:0]) ? 1'b0 :
			  last_or_wr_r[4] ; 
assign  last_or_wr_l[3:0] = (ipcs_ipdohq_wr_en_i && w_r) ? ipdohq_wr_addr_r[3:0] : 
				last_or_wr_r[3:0];  

assign  last_by_wr_l[4]	= ipcc_ipcs_by_go && 
			  (ipcc_ipcs_by_raddr[3:0] == last_by_wr_r[3:0]) ? 1'b0 :
			  last_by_wr_r[4] ; 
assign  last_by_wr_l[3:0] = (ipcs_ipdbhq_wr_en_i && w_r) ? ipdbhq_wr_addr_r[3:0] : 
				last_by_wr_r[3:0];  

//------------------------------------------------------------------------
// 	ADDIDNG ENTRY INTO THE DUPLICATE ADDRESS REGISTER
//------------------------------------------------------------------------
// In DMU mode, all the transaction are in strict order regardless of order
// or bypass queue, so the dependency pointer is always pointing to the 
// youngest transaction in the other queue.
//
// cam_l[40:7]	= 34-bit physical address
// cam_l[6:3]	= pointer to the dependency transaction in the other queue
// cam_l[2]	= 1 write, 0 read
// cam_l[1]	= 1 depend on dequeue of transaction in the other queue, 0 free to go
// cam_l[0]	= valid bit.  1= valid, 0=not valid

assign  addr[33:0]	= ext_sii_hdr_r[39:6];	//cache line address
assign 	ptr[3:0]	= dmu_mode ? dmu_ptr[3:0] : niu_ptr[3:0];
assign  niu_ptr[3:0]	= ext_sii_reqbypass_r ? youngest_match[3:0] : youngest_dep[3:0]; 
assign  dmu_ptr[3:0]	= ext_sii_reqbypass_r ?   dmu_or_ptr[3:0] 
						: dmu_by_ptr[3:0];
assign  dmu_or_ptr_l[3:0] = ipcs_ipdohq_wr_en_i ? ipdohq_wr_addr_r[3:0]  
					    : dmu_or_ptr[3:0];
assign  dmu_by_ptr_l[3:0] = ipcs_ipdbhq_wr_en_i ? ipdbhq_wr_addr_r[3:0]  
					    : dmu_by_ptr[3:0];
assign  w_r		= cmd[1] || cmd[2] ;	
assign	niu_dep		= address_matched ? 1'b1 : ext_sii_reqbypass_r ? 1'b0 :
			  last_wrptr[4] ;		//dependency bit

assign  dmu_dep		= ext_sii_reqbypass_r ? or_qvalid : by_qvalid;  
//assign  dmu_dep		= (dmu_ptr[3:0] ==4'b0) ? head_q_v : 1'b1;		  
//assign	head_q_v	= ext_sii_reqbypass_r ? or_cam0_v : by_cam0_v; 
assign  dep		= dmu_mode ? dmu_dep : niu_dep;
assign	cam_l[40:0] 	= {addr[33:0], ptr[3:0], w_r, dep, 1'b1};
			   
//--------------------------------------------------------------------------------------
//				Address comparison logic
//--------------------------------------------------------------------------------------
// 	find the entry with cacheline match and is valid (not yet dequeue)
assign	match0	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam0_r[40:7]) ? by_cam0_v 
		  : 1'b0) : ((addr[33:0] == or_cam0_r[40:7]) ? or_cam0_v : 1'b0)) ; 
assign	match1	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam1_r[40:7]) ? by_cam1_v 
		  : 1'b0) : ((addr[33:0] == or_cam1_r[40:7]) ? or_cam1_v : 1'b0))  ; 
assign	match2	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam2_r[40:7]) ? by_cam2_v 
		  : 1'b0) : ((addr[33:0] == or_cam2_r[40:7]) ? or_cam2_v : 1'b0))  ; 
assign	match3	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam3_r[40:7]) ? by_cam3_v 
		  : 1'b0) : ((addr[33:0] == or_cam3_r[40:7]) ? or_cam3_v : 1'b0))  ; 
assign	match4	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam4_r[40:7]) ? by_cam4_v  
		  : 1'b0) : ((addr[33:0] == or_cam4_r[40:7]) ? or_cam4_v : 1'b0))  ; 
assign	match5	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam5_r[40:7]) ? by_cam5_v 
		  : 1'b0) : ((addr[33:0] == or_cam5_r[40:7]) ? or_cam5_v : 1'b0))  ; 
assign	match6	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam6_r[40:7]) ? by_cam6_v 
		  : 1'b0) : ((addr[33:0] == or_cam6_r[40:7]) ? or_cam6_v : 1'b0))  ; 
assign	match7	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam7_r[40:7]) ? by_cam7_v 
		  : 1'b0) : ((addr[33:0] == or_cam7_r[40:7]) ? or_cam7_v : 1'b0))  ; 
assign	match8	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam8_r[40:7]) ? by_cam8_v 
		  : 1'b0) : ((addr[33:0] == or_cam8_r[40:7]) ? or_cam8_v : 1'b0))  ; 
assign	match9	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam9_r[40:7]) ? by_cam9_v 
		  : 1'b0) : ((addr[33:0] == or_cam9_r[40:7]) ? or_cam9_v : 1'b0))  ; 
assign	match10	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam10_r[40:7]) ? by_cam10_v 
		  : 1'b0) : ((addr[33:0] == or_cam10_r[40:7]) ? or_cam10_v : 1'b0))  ; 
assign	match11	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam11_r[40:7]) ? by_cam11_v 
		  : 1'b0) : ((addr[33:0] == or_cam11_r[40:7]) ? or_cam11_v : 1'b0)) ; 
assign	match12	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam12_r[40:7]) ? by_cam12_v 
		  : 1'b0) : ((addr[33:0] == or_cam12_r[40:7]) ? or_cam12_v : 1'b0))  ; 
assign	match13	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam13_r[40:7]) ? by_cam13_v 
		  : 1'b0) : ((addr[33:0] == or_cam13_r[40:7]) ? or_cam13_v : 1'b0))  ; 
assign	match14	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam14_r[40:7]) ? by_cam14_v 
		  : 1'b0) : ((addr[33:0] == or_cam14_r[40:7]) ? or_cam14_v : 1'b0))  ; 
assign	match15	= (~ext_sii_reqbypass_r ? ((addr[33:0] == by_cam15_r[40:7]) ? by_cam15_v 
		  : 1'b0) : ((addr[33:0] == or_cam15_r[40:7]) ? or_cam15_v : 1'b0))  ; 

// validate the bypass queue cam entery

assign  by_cam0_v = by_cam0_r[0] && ~by_clr_v0;
assign  by_cam1_v = by_cam1_r[0] && ~by_clr_v1;
assign  by_cam2_v = by_cam2_r[0] && ~by_clr_v2;
assign  by_cam3_v = by_cam3_r[0] && ~by_clr_v3;
assign  by_cam4_v = by_cam4_r[0] && ~by_clr_v4;
assign  by_cam5_v = by_cam5_r[0] && ~by_clr_v5;
assign  by_cam6_v = by_cam6_r[0] && ~by_clr_v6;
assign  by_cam7_v = by_cam7_r[0] && ~by_clr_v7;
assign  by_cam8_v = by_cam8_r[0] && ~by_clr_v8;
assign  by_cam9_v = by_cam9_r[0] && ~by_clr_v9;
assign  by_cam10_v = by_cam10_r[0] && ~by_clr_v10;
assign  by_cam11_v = by_cam11_r[0] && ~by_clr_v11;
assign  by_cam12_v = by_cam12_r[0] && ~by_clr_v12;
assign  by_cam13_v = by_cam13_r[0] && ~by_clr_v13;
assign  by_cam14_v = by_cam14_r[0] && ~by_clr_v14;
assign  by_cam15_v = by_cam15_r[0] && ~by_clr_v15;

// find out if there is valid entry in the order queue
assign or_qvalid = or_cam0_v || or_cam1_v || or_cam2_v || or_cam3_v
		|| or_cam4_v || or_cam5_v || or_cam6_v || or_cam7_v
		|| or_cam8_v || or_cam9_v || or_cam10_v || or_cam11_v
		|| or_cam12_v || or_cam13_v || or_cam14_v || or_cam15_v;

// find out if there is valid entry in the bypass queue
assign by_qvalid = by_cam0_v || by_cam1_v || by_cam2_v || by_cam3_v
		|| by_cam4_v || by_cam5_v || by_cam6_v || by_cam7_v
		|| by_cam8_v || by_cam9_v || by_cam10_v || by_cam11_v
		|| by_cam12_v || by_cam13_v || by_cam14_v || by_cam15_v;

// validate order queue cam entry
assign  or_cam0_v = or_cam0_r[0] && ~or_clr_v0;
assign  or_cam1_v = or_cam1_r[0] && ~or_clr_v1;
assign  or_cam2_v = or_cam2_r[0] && ~or_clr_v2;
assign  or_cam3_v = or_cam3_r[0] && ~or_clr_v3;
assign  or_cam4_v = or_cam4_r[0] && ~or_clr_v4;
assign  or_cam5_v = or_cam5_r[0] && ~or_clr_v5;
assign  or_cam6_v = or_cam6_r[0] && ~or_clr_v6;
assign  or_cam7_v = or_cam7_r[0] && ~or_clr_v7;
assign  or_cam8_v = or_cam8_r[0] && ~or_clr_v8;
assign  or_cam9_v = or_cam9_r[0] && ~or_clr_v9;
assign  or_cam10_v = or_cam10_r[0] && ~or_clr_v10;
assign  or_cam11_v = or_cam11_r[0] && ~or_clr_v11;
assign  or_cam12_v = or_cam12_r[0] && ~or_clr_v12;
assign  or_cam13_v = or_cam13_r[0] && ~or_clr_v13;
assign  or_cam14_v = or_cam14_r[0] && ~or_clr_v14;
assign  or_cam15_v = or_cam15_r[0] && ~or_clr_v15;

// find the youngest dependcy pointer from the other queue
assign last_wrptr[4:0] 	= ext_sii_reqbypass_r ? last_or_wr_r[4:0] : last_by_wr_r[4:0];

assign wpt[3:0]		= ext_sii_reqbypass_r ? ipdohq_wr_addr_r[3:0] 
			  : ipdbhq_wr_addr_r[3:0];    //cur wr pointer of other queue
assign youngest_dep[3:0] = ~last_wrptr[4] ? youngest_match[3:0] :
		  	   (wpt[3:0] == youngest_match[3:0]) ? youngest_match[3:0] :
			   (wpt[3:0] == last_wrptr[3:0]) ? last_wrptr[3:0] :
			   ((wpt[3:0] > last_wrptr[3:0]) && (wpt[3:0] < youngest_match[3:0])) 
			     ? last_wrptr[3:0] :
			   ((wpt[3:0] < last_wrptr[3:0]) && (wpt[3:0] > youngest_match[3:0]))	
			     ? youngest_match[3:0] :
			   ( youngest_match[3:0]> last_wrptr[3:0]) ? youngest_match[3:0] :
				last_wrptr[3:0];

// find if there is at least one cacheline address match
assign  address_matched = match0 || match1 || match2 || match3 || match4 ||
 			  match5 || match6 || match7 || match8 || match9 ||
 			  match10 || match11 || match12 || match13 || match14 || match15;

// find the youngest matched address pointer from the right queue
assign youngest_match[3:0] = (lt_wrptr[4]) ? lt_wrptr[3:0] : gt_wrptr[3:0]; 

assign  gt_wrptr[4:0] = (match15 && (wpt[3:0] < 4'b1111)) ? 5'b11111 : 
			(match14 && (wpt[3:0] < 4'b1110)) ? 5'b11110 :
			(match13 && (wpt[3:0] < 4'b1101)) ? 5'b11101 :
			(match12 && (wpt[3:0] < 4'b1100)) ? 5'b11100 :
			(match11 && (wpt[3:0] < 4'b1011)) ? 5'b11011 :
			(match10 && (wpt[3:0] < 4'b1010)) ? 5'b11010 :
			(match9 && (wpt[3:0] < 4'b1001)) ? 5'b11001 :
			(match8 && (wpt[3:0] < 4'b1000)) ? 5'b11000 :
			(match7 && (wpt[3:0] < 4'b0111)) ? 5'b10111 :
			(match6 && (wpt[3:0] < 4'b0110)) ? 5'b10110 :
			(match5 && (wpt[3:0] < 4'b0101)) ? 5'b10101 :
			(match4 && (wpt[3:0] < 4'b0100)) ? 5'b10100 :
			(match3 && (wpt[3:0] < 4'b0011)) ? 5'b10011 :
			(match2 && (wpt[3:0] < 4'b0010)) ? 5'b10010 :
			(match1 && (wpt[3:0] < 4'b0001)) ? 5'b10001 :
			(match0 && (wpt[3:0] == 4'b0000)) ? 5'b10000 : 5'b00000; 


assign  lt_wrptr[4:0] = (match15 && (wpt[3:0] == 4'b1111)) ? 5'b11111 : 
			(match14 && (wpt[3:0] > 4'b1110)) ? 5'b11110 :
			(match13 && (wpt[3:0] > 4'b1101)) ? 5'b11101 :
			(match12 && (wpt[3:0] > 4'b1100)) ? 5'b11100 :
			(match11 && (wpt[3:0] > 4'b1011)) ? 5'b11011 :
			(match10 && (wpt[3:0] > 4'b1010)) ? 5'b11010 :
			(match9 && (wpt[3:0] > 4'b1001)) ? 5'b11001 :
			(match8 && (wpt[3:0] > 4'b1000)) ? 5'b11000 :
			(match7 && (wpt[3:0] > 4'b0111)) ? 5'b10111 :
			(match6 && (wpt[3:0] > 4'b0110)) ? 5'b10110 :
			(match5 && (wpt[3:0] > 4'b0101)) ? 5'b10101 :
			(match4 && (wpt[3:0] > 4'b0100)) ? 5'b10100 :
			(match3 && (wpt[3:0] > 4'b0011)) ? 5'b10011 :
			(match2 && (wpt[3:0] > 4'b0010)) ? 5'b10010 :
			(match1 && (wpt[3:0] > 4'b0001)) ? 5'b10001 :
			(match0 && (wpt[3:0] > 4'b0000)) ? 5'b10000 : 5'b00000; 

//************************************************************************
// 			STATE TRANSITION SECTION
//************************************************************************
//0in one_hot -var cstate[6:0]
//0in one_hot -var nstate_r[6:0]

assign	nstate[6:0] = {nstate_r[6:1], ~nstate_r[0]};
assign	cstate[6:0] = {cstate_r[6:1], ~cstate_r[0]};
assign	arc_start_hdr		= cstate[`START] && ext_sii_hdr_vld && ~ext_sii_datareq;
assign	arc_start_hdrpayld	= cstate[`START] && ext_sii_hdr_vld && ext_sii_datareq; 
assign	arc_hdr_hdrpayld	= cstate[`HDR] && ext_sii_hdr_vld && ext_sii_datareq;
assign	arc_hdr_hdr		= cstate[`HDR] && ext_sii_hdr_vld && ~ext_sii_datareq;
assign	arc_hdrpayld_data1	= cstate[`HDR_PAYLD] ;
assign	arc_data1_hdrpayld	= cstate[`DATA1] && 
					ext_sii_hdr_vld && ext_sii_datareq;
assign	arc_data1_hdr		= cstate[`DATA1] && 
					ext_sii_hdr_vld && ~ext_sii_datareq;
assign	arc_data1_data2		= cstate[`DATA1] && ~ext_sii_datareq16_r; //record the current transaction
//assign	arc_data1_data2		= cstate[`DATA1]; 
assign	arc_data2_data3		= cstate[`DATA2];
assign	arc_data3_data4		= cstate[`DATA3];
assign	arc_data4_hdr		= cstate[`DATA4] && ext_sii_hdr_vld && ~ext_sii_datareq;
assign	arc_data4_hdrpayld	= cstate[`DATA4] && ext_sii_hdr_vld && ext_sii_datareq;

always @ (arc_start_hdr   or 	arc_start_hdrpayld 	or arc_hdr_hdrpayld 	or 
	  arc_hdr_hdr 	  or 	arc_hdrpayld_data1 	or arc_data1_hdrpayld 	or 
	  arc_data1_hdr   or 	arc_data1_data2		or arc_data2_data3	or
	  arc_data3_data4 or 	arc_data4_hdr		or arc_data4_hdrpayld	or
	  cstate)

	begin
	case (1'b1)			//synopsys parallel_case full_case
		cstate[`START]	: if (arc_start_hdr)
					nstate_r = `HDR_ST;
				  else if (arc_start_hdrpayld)
					nstate_r = `HDR_PAYLD_ST;
				  else
					nstate_r = `START_ST;
		cstate[`HDR]	: if (arc_hdr_hdrpayld)
					nstate_r = `HDR_PAYLD_ST;		
				  else if (arc_hdr_hdr)
					nstate_r = `HDR_ST;
				  else
					nstate_r = `START_ST;
		cstate[`HDR_PAYLD] : if (arc_hdrpayld_data1) 
					nstate_r = `DATA1_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA1]	: if (arc_data1_data2)
					nstate_r = `DATA2_ST;		
				  else if (arc_data1_hdr)
					nstate_r = `HDR_ST;
				  else if (arc_data1_hdrpayld)
					nstate_r = `HDR_PAYLD_ST;
				  else
					nstate_r = `START_ST;
		cstate[`DATA2]	: if (arc_data2_data3)
					nstate_r = `DATA3_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA3]	: if (arc_data3_data4)
					nstate_r = `DATA4_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA4]	: if (arc_data4_hdr)
					nstate_r = `HDR_ST;		
				  else if (arc_data4_hdrpayld)
					nstate_r = `HDR_PAYLD_ST;
				  else	
					nstate_r = `START_ST;
		default		: begin
				  // 0in < fire -message "ERROR : sii_ipcs state machine default case"
					nstate_r = `START_ST;
				  end

	endcase
	end

//--------------------------------------------------------------------------------------
//		Clear Valid Signal for CAM (Ordered)
//--------------------------------------------------------------------------------------
assign or_clr_v0 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h0)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v1 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h1)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v2 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h2)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v3 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h3)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v4 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h4)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v5 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h5)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v6 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h6)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v7 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h7)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v8 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h8)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v9 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'h9)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v10 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'hA)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v11 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'hB)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v12 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'hC)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v13 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'hD)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v14 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'hE)) ? 
		   	1'b1 : 1'b0;
assign or_clr_v15 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == 4'hF)) ? 
		   	1'b1 : 1'b0;

//--------------------------------------------------------------------------------------
//		Clear Valid Signal for CAM (Bypass)
//--------------------------------------------------------------------------------------
assign by_clr_v0 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h0)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v1 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h1)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v2 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h2)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v3 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h3)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v4 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h4)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v5 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h5)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v6 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h6)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v7 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h7)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v8 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h8)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v9 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'h9)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v10 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'hA)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v11 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'hB)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v12 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'hC)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v13 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'hD)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v14 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'hE)) ? 
		   	1'b1 : 1'b0;
assign by_clr_v15 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == 4'hF)) ? 
		   	1'b1 : 1'b0;

//--------------------------------------------------------------------------------------
//		Clear Dependency bit for CAM (Ordered)
//--------------------------------------------------------------------------------------
assign or_clr_d0 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam0_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d1 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam1_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d2 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam2_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d3 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam3_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d4 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam4_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d5 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam5_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d6 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam6_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d7 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam7_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d8 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam8_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d9 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam9_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d10 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam10_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d11 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam11_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d12 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam12_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d13 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam13_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d14 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam14_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign or_clr_d15 = (ipcc_ipcs_by_go && (ipcc_ipcs_by_raddr[3:0] == or_cam15_r[6:3]))
		    	? 1'b1 : 1'b0; 

//--------------------------------------------------------------------------------------
//		Clear Dependency bit for CAM (Bypass)
//--------------------------------------------------------------------------------------
assign by_clr_d0 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam0_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d1 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam1_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d2 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam2_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d3 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam3_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d4 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam4_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d5 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam5_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d6 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam6_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d7 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam7_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d8 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam8_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d9 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam9_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d10 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam10_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d11 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam11_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d12 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam12_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d13 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam13_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d14 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam14_r[6:3]))
		    	? 1'b1 : 1'b0; 
assign by_clr_d15 = (ipcc_ipcs_or_go && (ipcc_ipcs_or_raddr[3:0] == by_cam15_r[6:3]))
		    	? 1'b1 : 1'b0; 

//--------------------------------------------------------------------------------------
//		Register write section	(Ordered)
//--------------------------------------------------------------------------------------

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v0 or or_clr_d0 or or_cam0_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0000) && ipcs_ipdohq_wr_en_i)
	or_cam0_l[40:0] = cam_l[40:0];
    else if (or_clr_v0)
	or_cam0_l[40:0] = {or_cam0_r[40:1],1'b0};
    else if (or_clr_d0)
	or_cam0_l[40:0] = {or_cam0_r[40:2],1'b0, or_cam0_r[0]};
    else
	or_cam0_l[40:0] = or_cam0_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v1 or or_clr_d1 or or_cam1_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0001) && ipcs_ipdohq_wr_en_i)
	or_cam1_l[40:0] = cam_l[40:0];
    else if (or_clr_v1)
	or_cam1_l[40:0] = {or_cam1_r[40:1],1'b0};
    else if (or_clr_d1)
	or_cam1_l[40:0] = {or_cam1_r[40:2],1'b0, or_cam1_r[0]};
    else
	or_cam1_l[40:0] = or_cam1_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v2 or or_clr_d2 or or_cam2_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0010) && ipcs_ipdohq_wr_en_i)
	or_cam2_l[40:0] = cam_l[40:0];
    else if (or_clr_v2)
	or_cam2_l[40:0] = {or_cam2_r[40:1],1'b0};
    else if (or_clr_d2)
	or_cam2_l[40:0] = {or_cam2_r[40:2],1'b0, or_cam2_r[0]};
    else
	or_cam2_l[40:0] = or_cam2_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v3 or or_clr_d3 or or_cam3_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0011) && ipcs_ipdohq_wr_en_i)
	or_cam3_l[40:0] = cam_l[40:0];
    else if (or_clr_v3)
	or_cam3_l[40:0] = {or_cam3_r[40:1],1'b0};
    else if (or_clr_d3)
	or_cam3_l[40:0] = {or_cam3_r[40:2],1'b0, or_cam3_r[0]};
    else
	or_cam3_l[40:0] = or_cam3_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v4 or or_clr_d4 or or_cam4_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0100) && ipcs_ipdohq_wr_en_i)
	or_cam4_l[40:0] = cam_l[40:0];
    else if (or_clr_v4)
	or_cam4_l[40:0] = {or_cam4_r[40:1],1'b0};
    else if (or_clr_d4)
	or_cam4_l[40:0] = {or_cam4_r[40:2],1'b0, or_cam4_r[0]};
    else
	or_cam4_l[40:0] = or_cam4_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v5 or or_clr_d5 or or_cam5_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0101) && ipcs_ipdohq_wr_en_i)
	or_cam5_l[40:0] = cam_l[40:0];
    else if (or_clr_v5)
	or_cam5_l[40:0] = {or_cam5_r[40:1],1'b0};
    else if (or_clr_d5)
	or_cam5_l[40:0] = {or_cam5_r[40:2],1'b0, or_cam5_r[0]};
    else
	or_cam5_l[40:0] = or_cam5_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v6 or or_clr_d6 or or_cam6_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0110) && ipcs_ipdohq_wr_en_i)
	or_cam6_l[40:0] = cam_l[40:0];
    else if (or_clr_v6)
	or_cam6_l[40:0] = {or_cam6_r[40:1],1'b0};
    else if (or_clr_d6)
	or_cam6_l[40:0] = {or_cam6_r[40:2],1'b0, or_cam6_r[0]};
    else
	or_cam6_l[40:0] = or_cam6_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v7 or or_clr_d7 or or_cam7_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b0111) && ipcs_ipdohq_wr_en_i)
	or_cam7_l[40:0] = cam_l[40:0];
    else if (or_clr_v7)
	or_cam7_l[40:0] = {or_cam7_r[40:1],1'b0};
    else if (or_clr_d7)
	or_cam7_l[40:0] = {or_cam7_r[40:2],1'b0, or_cam7_r[0]};
    else
	or_cam7_l[40:0] = or_cam7_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v8 or or_clr_d8 or or_cam8_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1000) && ipcs_ipdohq_wr_en_i)
	or_cam8_l[40:0] = cam_l[40:0];
    else if (or_clr_v8)
	or_cam8_l[40:0] = {or_cam8_r[40:1],1'b0};
    else if (or_clr_d8)
	or_cam8_l[40:0] = {or_cam8_r[40:2],1'b0, or_cam8_r[0]};
    else
	or_cam8_l[40:0] = or_cam8_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v9 or or_clr_d9 or or_cam9_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1001) && ipcs_ipdohq_wr_en_i)
	or_cam9_l[40:0] = cam_l[40:0];
    else if (or_clr_v9)
	or_cam9_l[40:0] = {or_cam9_r[40:1],1'b0};
    else if (or_clr_d9)
	or_cam9_l[40:0] = {or_cam9_r[40:2],1'b0, or_cam9_r[0]};
    else
	or_cam9_l[40:0] = or_cam9_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v10 or or_clr_d10 or or_cam10_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1010) && ipcs_ipdohq_wr_en_i)
	or_cam10_l[40:0] = cam_l[40:0];
    else if (or_clr_v10)
	or_cam10_l[40:0] = {or_cam10_r[40:1],1'b0};
    else if (or_clr_d10)
	or_cam10_l[40:0] = {or_cam10_r[40:2],1'b0, or_cam10_r[0]};
    else
	or_cam10_l[40:0] = or_cam10_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v11 or or_clr_d11 or or_cam11_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1011) && ipcs_ipdohq_wr_en_i)
	or_cam11_l[40:0] = cam_l[40:0];
    else if (or_clr_v11)
	or_cam11_l[40:0] = {or_cam11_r[40:1],1'b0};
    else if (or_clr_d11)
	or_cam11_l[40:0] = {or_cam11_r[40:2],1'b0, or_cam11_r[0]};
    else
	or_cam11_l[40:0] = or_cam11_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v12 or or_clr_d12 or or_cam12_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1100) && ipcs_ipdohq_wr_en_i)
	or_cam12_l[40:0] = cam_l[40:0];
    else if (or_clr_v12)
	or_cam12_l[40:0] = {or_cam12_r[40:1],1'b0};
    else if (or_clr_d12)
	or_cam12_l[40:0] = {or_cam12_r[40:2],1'b0, or_cam12_r[0]};
    else
	or_cam12_l[40:0] = or_cam12_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v13 or or_clr_d13 or or_cam13_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1101) && ipcs_ipdohq_wr_en_i)
	or_cam13_l[40:0] = cam_l[40:0];
    else if (or_clr_v13)
	or_cam13_l[40:0] = {or_cam13_r[40:1],1'b0};
    else if (or_clr_d13)
	or_cam13_l[40:0] = {or_cam13_r[40:2],1'b0, or_cam13_r[0]};
    else
	or_cam13_l[40:0] = or_cam13_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v14 or or_clr_d14 or or_cam14_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1110) && ipcs_ipdohq_wr_en_i)
	or_cam14_l[40:0] = cam_l[40:0];
    else if (or_clr_v14)
	or_cam14_l[40:0] = {or_cam14_r[40:1],1'b0};
    else if (or_clr_d14)
	or_cam14_l[40:0] = {or_cam14_r[40:2],1'b0, or_cam14_r[0]};
    else
	or_cam14_l[40:0] = or_cam14_r[40:0];

always @ (ipdohq_wr_addr_r[3:0] or ipcs_ipdohq_wr_en_i or cam_l[40:0] or 
	or_clr_v15 or or_clr_d15 or or_cam15_r[40:0])
    if ((ipdohq_wr_addr_r[3:0] == 4'b1111) && ipcs_ipdohq_wr_en_i)
	or_cam15_l[40:0] = cam_l[40:0];
    else if (or_clr_v15)
	or_cam15_l[40:0] = {or_cam15_r[40:1],1'b0};
    else if (or_clr_d15)
	or_cam15_l[40:0] = {or_cam15_r[40:2],1'b0, or_cam15_r[0]};
    else
	or_cam15_l[40:0] = or_cam15_r[40:0];

//--------------------------------------------------------------------------------------
//		Register write section	(Bypass)
//--------------------------------------------------------------------------------------
always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v0 or by_clr_d0 or by_cam0_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0000) && ipcs_ipdbhq_wr_en_i)
	by_cam0_l[40:0] = cam_l[40:0];
    else if (by_clr_v0)
	by_cam0_l[40:0] = {by_cam0_r[40:1],1'b0};
    else if (by_clr_d0)
	by_cam0_l[40:0] = {by_cam0_r[40:2],1'b0, by_cam0_r[0]};
    else
	by_cam0_l[40:0] = by_cam0_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v1 or by_clr_d1 or by_cam1_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0001) && ipcs_ipdbhq_wr_en_i)
	by_cam1_l[40:0] = cam_l[40:0];
    else if (by_clr_v1)
	by_cam1_l[40:0] = {by_cam1_r[40:1],1'b0};
    else if (by_clr_d1)
	by_cam1_l[40:0] = {by_cam1_r[40:2],1'b0, by_cam1_r[0]};
    else
	by_cam1_l[40:0] = by_cam1_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v2 or by_clr_d2 or by_cam2_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0010) && ipcs_ipdbhq_wr_en_i)
	by_cam2_l[40:0] = cam_l[40:0];
    else if (by_clr_v2)
	by_cam2_l[40:0] = {by_cam2_r[40:1],1'b0};
    else if (by_clr_d2)
	by_cam2_l[40:0] = {by_cam2_r[40:2],1'b0, by_cam2_r[0]};
    else
	by_cam2_l[40:0] = by_cam2_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v3 or by_clr_d3 or by_cam3_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0011) && ipcs_ipdbhq_wr_en_i)
	by_cam3_l[40:0] = cam_l[40:0];
    else if (by_clr_v3)
	by_cam3_l[40:0] = {by_cam3_r[40:1],1'b0};
    else if (by_clr_d3)
	by_cam3_l[40:0] = {by_cam3_r[40:2],1'b0, by_cam3_r[0]};
    else
	by_cam3_l[40:0] = by_cam3_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v4 or by_clr_d4 or by_cam4_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0100) && ipcs_ipdbhq_wr_en_i)
	by_cam4_l[40:0] = cam_l[40:0];
    else if (by_clr_v4)
	by_cam4_l[40:0] = {by_cam4_r[40:1],1'b0};
    else if (by_clr_d4)
	by_cam4_l[40:0] = {by_cam4_r[40:2],1'b0, by_cam4_r[0]};
    else
	by_cam4_l[40:0] = by_cam4_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v5 or by_clr_d5 or by_cam5_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0101) && ipcs_ipdbhq_wr_en_i)
	by_cam5_l[40:0] = cam_l[40:0];
    else if (by_clr_v5)
	by_cam5_l[40:0] = {by_cam5_r[40:1],1'b0};
    else if (by_clr_d5)
	by_cam5_l[40:0] = {by_cam5_r[40:2],1'b0, by_cam5_r[0]};
    else
	by_cam5_l[40:0] = by_cam5_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v6 or by_clr_d6 or by_cam6_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0110) && ipcs_ipdbhq_wr_en_i)
	by_cam6_l[40:0] = cam_l[40:0];
    else if (by_clr_v6)
	by_cam6_l[40:0] = {by_cam6_r[40:1],1'b0};
    else if (by_clr_d6)
	by_cam6_l[40:0] = {by_cam6_r[40:2],1'b0, by_cam6_r[0]};
    else
	by_cam6_l[40:0] = by_cam6_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v7 or by_clr_d7 or by_cam7_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b0111) && ipcs_ipdbhq_wr_en_i)
	by_cam7_l[40:0] = cam_l[40:0];
    else if (by_clr_v7)
	by_cam7_l[40:0] = {by_cam7_r[40:1],1'b0};
    else if (by_clr_d7)
	by_cam7_l[40:0] = {by_cam7_r[40:2],1'b0, by_cam7_r[0]};
    else
	by_cam7_l[40:0] = by_cam7_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v8 or by_clr_d8 or by_cam8_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1000) && ipcs_ipdbhq_wr_en_i)
	by_cam8_l[40:0] = cam_l[40:0];
    else if (by_clr_v8)
	by_cam8_l[40:0] = {by_cam8_r[40:1],1'b0};
    else if (by_clr_d8)
	by_cam8_l[40:0] = {by_cam8_r[40:2],1'b0, by_cam8_r[0]};
    else
	by_cam8_l[40:0] = by_cam8_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v9 or by_clr_d9 or by_cam9_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1001) && ipcs_ipdbhq_wr_en_i)
	by_cam9_l[40:0] = cam_l[40:0];
    else if (by_clr_v9)
	by_cam9_l[40:0] = {by_cam9_r[40:1],1'b0};
    else if (by_clr_d9)
	by_cam9_l[40:0] = {by_cam9_r[40:2],1'b0, by_cam9_r[0]};
    else
	by_cam9_l[40:0] = by_cam9_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v10 or by_clr_d10 or by_cam10_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1010) && ipcs_ipdbhq_wr_en_i)
	by_cam10_l[40:0] = cam_l[40:0];
    else if (by_clr_v10)
	by_cam10_l[40:0] = {by_cam10_r[40:1],1'b0};
    else if (by_clr_d10)
	by_cam10_l[40:0] = {by_cam10_r[40:2],1'b0, by_cam10_r[0]};
    else
	by_cam10_l[40:0] = by_cam10_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v11 or by_clr_d11 or by_cam11_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1011) && ipcs_ipdbhq_wr_en_i)
	by_cam11_l[40:0] = cam_l[40:0];
    else if (by_clr_v11)
	by_cam11_l[40:0] = {by_cam11_r[40:1],1'b0};
    else if (by_clr_d11)
	by_cam11_l[40:0] = {by_cam11_r[40:2],1'b0, by_cam11_r[0]};
    else
	by_cam11_l[40:0] = by_cam11_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v12 or by_clr_d12  or by_cam12_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1100) && ipcs_ipdbhq_wr_en_i)
	by_cam12_l[40:0] = cam_l[40:0];
    else if (by_clr_v12)
	by_cam12_l[40:0] = {by_cam12_r[40:1],1'b0};
    else if (by_clr_d12)
	by_cam12_l[40:0] = {by_cam12_r[40:2],1'b0, by_cam12_r[0]};
    else
	by_cam12_l[40:0] = by_cam12_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v13 or by_clr_d13 or by_cam13_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1101) && ipcs_ipdbhq_wr_en_i)
	by_cam13_l[40:0] = cam_l[40:0];
    else if (by_clr_v13)
	by_cam13_l[40:0] = {by_cam13_r[40:1],1'b0};
    else if (by_clr_d13)
	by_cam13_l[40:0] = {by_cam13_r[40:2],1'b0, by_cam13_r[0]};
    else
	by_cam13_l[40:0] = by_cam13_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v14 or by_clr_d14 or by_cam14_r[40:0])
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1110) && ipcs_ipdbhq_wr_en_i)
	by_cam14_l[40:0] = cam_l[40:0];
    else if (by_clr_v14)
	by_cam14_l[40:0] = {by_cam14_r[40:1],1'b0};
    else if (by_clr_d14)
	by_cam14_l[40:0] = {by_cam14_r[40:2],1'b0, by_cam14_r[0]};
    else
	by_cam14_l[40:0] = by_cam14_r[40:0];

always @ (ipdbhq_wr_addr_r[3:0] or ipcs_ipdbhq_wr_en_i or cam_l[40:0] or 
	by_clr_v15 or by_clr_d15 or by_cam15_r[40:0])
begin
    if ((ipdbhq_wr_addr_r[3:0] == 4'b1111) && ipcs_ipdbhq_wr_en_i)
	by_cam15_l[40:0] = cam_l[40:0];
    else if (by_clr_v15)
	by_cam15_l[40:0] = {by_cam15_r[40:1],1'b0};
    else if (by_clr_d15)
	by_cam15_l[40:0] = {by_cam15_r[40:2],1'b0, by_cam15_r[0]};
    else
	by_cam15_l[40:0] = by_cam15_r[40:0];
end

//--------------------------------------------------------------------------------------
//************************************************************************
// 				REGISTERS section
//************************************************************************

sii_ipcs_ctlmsff_ctl_macro__width_7 reg_cstate  // ASYNC reset active low
                                (
					.scan_in(reg_cstate_scanin),
					.scan_out(reg_cstate_scanout),
					.dout(cstate_r[6:0]),
                                      	.l1clk(l1clk),
                                      	.din(nstate[6:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_5 reg_last_or_wr  // ASYNC reset active low
                                (
					.scan_in(reg_last_or_wr_scanin),
					.scan_out(reg_last_or_wr_scanout),
					.dout(last_or_wr_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(last_or_wr_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_5 reg_last_by_wr  // ASYNC reset active low
                                (
					.scan_in(reg_last_by_wr_scanin),
					.scan_out(reg_last_by_wr_scanout),
					.dout(last_by_wr_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(last_by_wr_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_4 reg_dmu_or_ptr  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_or_ptr_scanin),
					.scan_out(reg_dmu_or_ptr_scanout),
					.dout(dmu_or_ptr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_or_ptr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_4 reg_dmu_by_ptr  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_by_ptr_scanin),
					.scan_out(reg_dmu_by_ptr_scanout),
					.dout(dmu_by_ptr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_by_ptr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_5 reg_ipdohq_wr_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdohq_wr_addr_scanin),
					.scan_out(reg_ipdohq_wr_addr_scanout),
					.dout(ipdohq_wr_addr_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipdohq_wr_addr_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_5 reg_ipdbhq_wr_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdbhq_wr_addr_scanin),
					.scan_out(reg_ipdbhq_wr_addr_scanout),
					.dout(ipdbhq_wr_addr_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipdbhq_wr_addr_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_6 reg_ipdodq_wr_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdodq_wr_addr_scanin),
					.scan_out(reg_ipdodq_wr_addr_scanout),
					.dout(ipcs_ipdodq_wr_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcs_ipdodq_wr_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_6 reg_ipdbdq_wr_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdbdq_wr_addr_scanin),
					.scan_out(reg_ipdbdq_wr_addr_scanout),
					.dout(ipcs_ipdbdq_wr_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcs_ipdbdq_wr_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ipcs_ctlmsff_ctl_macro__width_128 reg_dmu_sii_hdr  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_sii_hdr_scanin),
					.scan_out(reg_dmu_sii_hdr_scanout),
					.dout(ext_sii_hdr_r[127:0]),
                                      	.l1clk(l1clk),
                                      	.din(ext_sii_hdr_l[127:0]),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ipcs_ctlmsff_ctl_macro__width_1 reg_datareq16  // ASYNC reset active low
                                (
					.scan_in(reg_datareq16_scanin),
					.scan_out(reg_datareq16_scanout),
					.dout(ext_sii_datareq16_r),
                                      	.l1clk(l1clk),
                                      	.din(ext_sii_datareq16_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_1 reg_reqbypass  // ASYNC reset active low
                                (
					.scan_in(reg_reqbypass_scanin),
					.scan_out(reg_reqbypass_scanout),
					.dout(ext_sii_reqbypass_r),
                                      	.l1clk(l1clk),
                                      	.din(dmu_sii_reqbypass_l),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ipcs_ctlmsff_ctl_macro__width_1 reg_add_or  // ASYNC reset active low
                                (
					.scan_in(reg_add_or_scanin),
					.scan_out(reg_add_or_scanout),
					.dout(ipcs_ipcc_add_or),
                                      	.l1clk(l1clk),
                                      	.din(add_or),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_1 reg_add_by  // ASYNC reset active low
                                (
					.scan_in(reg_add_by_scanin),
					.scan_out(reg_add_by_scanout),
					.dout(ipcs_ipcc_add_by),
                                      	.l1clk(l1clk),
                                      	.din(add_by),
  .siclk(siclk),
  .soclk(soclk)
					);

//-------------------------------------------------------------------
//     	Synchronization Section (l2clk -> iol1clk) 
//-------------------------------------------------------------------
sii_ipcs_ctlmsff_ctl_macro__width_4 reg_dmu_wrack_tag  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_wrack_tag_scanin),
					.scan_out(reg_dmu_wrack_tag_scanout),
					.dout(sii_ext_wrack_tag[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_dmu_tag[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_1 reg_dmu_wrack_parity  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_wrack_parity_scanin),
					.scan_out(reg_dmu_wrack_parity_scanout),
					.dout(sii_ext_wrack_parity),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_dmu_wrack_p),
  .siclk(siclk),
  .soclk(soclk)
					);

assign dmu_wrack_vld = ipcc_ipcs_wrack_vld ^ sync2_wrack;
sii_ipcs_ctlmsff_ctl_macro__width_1 reg_ipcc_ipcs_wrack  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ipcs_wrack_scanin),
					.scan_out(reg_ipcc_ipcs_wrack_scanout),
					.dout(ipcc_ipcs_wrack_vld),
                                      	.l1clk(l1clk),
                                      	.din(sync2_wrack),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_1 sync_ff_wrack1  // ASYNC reset active low
                                (
					.scan_in(sync_ff_wrack1_scanin),
					.scan_out(sync_ff_wrack1_scanout),
					.dout(sync1_wrack),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_wrack_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcs_ctlmsff_ctl_macro__width_1 sync_ff_wrack2  // ASYNC reset active low
                                (
					.scan_in(sync_ff_wrack2_scanin),
					.scan_out(sync_ff_wrack2_scanout),
					.dout(sync2_wrack),
                                      	.l1clk(l1clk),
                                      	.din(sync1_wrack),
  .siclk(siclk),
  .soclk(soclk)
					);

assign ipcc_ipcs_or_go = ipcc_ipcs_or_dq ^ ipcc_ipcs_or_go_lv;
sii_ipcs_ctlmsff_ctl_macro__width_1 reg_ipcc_ipcs_or_dq  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ipcs_or_dq_scanin),
					.scan_out(reg_ipcc_ipcs_or_dq_scanout),
					.dout(ipcc_ipcs_or_dq),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_or_go_lv),
  .siclk(siclk),
  .soclk(soclk)
					);


assign ipcc_ipcs_by_go = ipcc_ipcs_by_dq ^ ipcc_ipcs_by_go_lv;
sii_ipcs_ctlmsff_ctl_macro__width_1 reg_ipcc_ipcs_by_dq  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ipcs_by_dq_scanin),
					.scan_out(reg_ipcc_ipcs_by_dq_scanout),
					.dout(ipcc_ipcs_by_dq),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_by_go_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

//msff_ctl_macro sync_ff_or_ptr1 (width=4) // ASYNC reset active low
//                                (
//					.scan_in(sync_ff_or_ptr1_scanin),
//					.scan_out(sync_ff_or_ptr1_scanout),
//					.dout(sync1_or_ptr[3:0]),
 //                                     	.l1clk(l1clk),
  //                                    	.din(ipcc_ipcs_or_ptr[3:0]),
//					);

sii_ipcs_ctlmsff_ctl_macro__width_4 sync_ff_or_ptr2  // ASYNC reset active low
                                (
					.scan_in(sync_ff_or_ptr2_scanin),
					.scan_out(sync_ff_or_ptr2_scanout),
					.dout(ipcc_ipcs_or_raddr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_or_ptr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

//msff_ctl_macro sync_ff_or_ptr4 (width=4) // ASYNC reset active low
//                                (
//					.scan_in(sync_ff_or_ptr4_scanin),
//					.scan_out(sync_ff_or_ptr4_scanout),
//					.dout(ipcc_ipcs_or_raddr[3:0]),
 //                                    	.l1clk(l1clk),
//                                      	.din(sync3_or_ptr[3:0]),
//					);

//msff_ctl_macro sync_ff_or_ptr3 (width=4) // ASYNC reset active low
//                                (
//					.scan_in(sync_ff_or_ptr3_scanin),
//					.scan_out(sync_ff_or_ptr3_scanout),
//					.dout(ipcc_ipcs_or_raddr[3:0]),
 //                                     	.l1clk(l1clk),
 //                                     	.din(sync2_or_ptr[3:0]),
//					);

sii_ipcs_ctlmsff_ctl_macro__width_4 sync_ff_by_ptr1  // ASYNC reset active low
                                (
					.scan_in(sync_ff_by_ptr1_scanin),
					.scan_out(sync_ff_by_ptr1_scanout),
					.dout(ipcc_ipcs_by_raddr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipcs_by_ptr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

//msff_ctl_macro sync_ff_by_ptr2 (width=4) // ASYNC reset active low
//                                (
//					.scan_in(sync_ff_by_ptr2_scanin),
//					.scan_out(sync_ff_by_ptr2_scanout),
//					.dout(ipcc_ipcs_by_raddr[3:0]),
 //                                     	.l1clk(l1clk),
 //                                     	.din(sync1_by_ptr[3:0]),
//					);

//msff_ctl_macro sync_ff_by_ptr4 (width=4) // ASYNC reset active low
//                                (
//					.scan_in(sync_ff_by_ptr4_scanin),
//					.scan_out(sync_ff_by_ptr4_scanout),
//					.dout(ipcc_ipcs_by_raddr[3:0]),
//                                   	.l1clk(l1clk),
//                                  	.din(sync3_by_ptr[3:0]),
//					);

//msff_ctl_macro sync_ff_by_ptr3 (width=4) // ASYNC reset active low
//                                (
//					.scan_in(sync_ff_by_ptr3_scanin),
//					.scan_out(sync_ff_by_ptr3_scanout),
//					.dout(ipcc_ipcs_by_raddr[3:0]),
 //                                     	.l1clk(l1clk),
//                                      	.din(sync2_by_ptr[3:0]),
//					);
//

//-------------------------------------------------------------------
//      DUPLICATE ADDRESS REGISTERS  (  bypass queue)
//-------------------------------------------------------------------
sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam0 
                                (
                                        .scan_in(reg_by_cam0_scanin),
                                        .scan_out(reg_by_cam0_scanout),
                                        .dout(by_cam0_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam0_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam1 
                                (
                                        .scan_in(reg_by_cam1_scanin),
                                        .scan_out(reg_by_cam1_scanout),
                                        .dout(by_cam1_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam1_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam2 
                                (
                                        .scan_in(reg_by_cam2_scanin),
                                        .scan_out(reg_by_cam2_scanout),
                                        .dout(by_cam2_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam2_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam3 
                                (
                                        .scan_in(reg_by_cam3_scanin),
                                        .scan_out(reg_by_cam3_scanout),
                                        .dout(by_cam3_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam3_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam4 
                                (
                                        .scan_in(reg_by_cam4_scanin),
                                        .scan_out(reg_by_cam4_scanout),
                                        .dout(by_cam4_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam4_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam5 
                                (
                                        .scan_in(reg_by_cam5_scanin),
                                        .scan_out(reg_by_cam5_scanout),
                                        .dout(by_cam5_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam5_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam6 
                                (
                                        .scan_in(reg_by_cam6_scanin),
                                        .scan_out(reg_by_cam6_scanout),
                                        .dout(by_cam6_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam6_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam7 
                                (
                                        .scan_in(reg_by_cam7_scanin),
                                        .scan_out(reg_by_cam7_scanout),
                                        .dout(by_cam7_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam7_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam8 
                                (
                                        .scan_in(reg_by_cam8_scanin),
                                        .scan_out(reg_by_cam8_scanout),
                                        .dout(by_cam8_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam8_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam9 
                                (
                                        .scan_in(reg_by_cam9_scanin),
                                        .scan_out(reg_by_cam9_scanout),
                                        .dout(by_cam9_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam9_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam10 
                                (
                                        .scan_in(reg_by_cam10_scanin),
                                        .scan_out(reg_by_cam10_scanout),
                                        .dout(by_cam10_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam10_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam11 
                                (
                                        .scan_in(reg_by_cam11_scanin),
                                        .scan_out(reg_by_cam11_scanout),
                                        .dout(by_cam11_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam11_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam12 
                                (
                                        .scan_in(reg_by_cam12_scanin),
                                        .scan_out(reg_by_cam12_scanout),
                                        .dout(by_cam12_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam12_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam13 
                                (
                                        .scan_in(reg_by_cam13_scanin),
                                        .scan_out(reg_by_cam13_scanout),
                                        .dout(by_cam13_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam13_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam14 
                                (
                                        .scan_in(reg_by_cam14_scanin),
                                        .scan_out(reg_by_cam14_scanout),
                                        .dout(by_cam14_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam14_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_by_cam15 
                                (
                                        .scan_in(reg_by_cam15_scanin),
                                        .scan_out(reg_by_cam15_scanout),
                                        .dout(by_cam15_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(by_cam15_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );
//-------------------------------------------------------------------
//      DUPLICATE ADDRESS REGISTERS  ( ordered queue)
//-------------------------------------------------------------------
sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam0 
                                (
                                        .scan_in(reg_or_cam0_scanin),
                                        .scan_out(reg_or_cam0_scanout),
                                        .dout(or_cam0_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam0_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam1 
                                (
                                        .scan_in(reg_or_cam1_scanin),
                                        .scan_out(reg_or_cam1_scanout),
                                        .dout(or_cam1_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam1_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam2 
                                (
                                        .scan_in(reg_or_cam2_scanin),
                                        .scan_out(reg_or_cam2_scanout),
                                        .dout(or_cam2_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam2_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam3 
                                (
                                        .scan_in(reg_or_cam3_scanin),
                                        .scan_out(reg_or_cam3_scanout),
                                        .dout(or_cam3_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam3_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam4 
                                (
                                        .scan_in(reg_or_cam4_scanin),
                                        .scan_out(reg_or_cam4_scanout),
                                        .dout(or_cam4_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam4_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam5 
                                (
                                        .scan_in(reg_or_cam5_scanin),
                                        .scan_out(reg_or_cam5_scanout),
                                        .dout(or_cam5_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam5_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam6 
                                (
                                        .scan_in(reg_or_cam6_scanin),
                                        .scan_out(reg_or_cam6_scanout),
                                        .dout(or_cam6_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam6_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam7 
                                (
                                        .scan_in(reg_or_cam7_scanin),
                                        .scan_out(reg_or_cam7_scanout),
                                        .dout(or_cam7_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam7_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam8 
                                (
                                        .scan_in(reg_or_cam8_scanin),
                                        .scan_out(reg_or_cam8_scanout),
                                        .dout(or_cam8_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam8_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam9 
                                (
                                        .scan_in(reg_or_cam9_scanin),
                                        .scan_out(reg_or_cam9_scanout),
                                        .dout(or_cam9_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam9_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam10 
                                (
                                        .scan_in(reg_or_cam10_scanin),
                                        .scan_out(reg_or_cam10_scanout),
                                        .dout(or_cam10_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam10_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam11 
                                (
                                        .scan_in(reg_or_cam11_scanin),
                                        .scan_out(reg_or_cam11_scanout),
                                        .dout(or_cam11_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam11_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam12 
                                (
                                        .scan_in(reg_or_cam12_scanin),
                                        .scan_out(reg_or_cam12_scanout),
                                        .dout(or_cam12_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam12_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam13 
                                (
                                        .scan_in(reg_or_cam13_scanin),
                                        .scan_out(reg_or_cam13_scanout),
                                        .dout(or_cam13_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam13_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam14 
                                (
                                        .scan_in(reg_or_cam14_scanin),
                                        .scan_out(reg_or_cam14_scanout),
                                        .dout(or_cam14_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam14_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcs_ctlmsff_ctl_macro__width_41 reg_or_cam15 
                                (
                                        .scan_in(reg_or_cam15_scanin),
                                        .scan_out(reg_or_cam15_scanout),
                                        .dout(or_cam15_r[40:0]),
                                        .l1clk(l1clk),
                                        .din(or_cam15_l[40:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

//msff_ctl_macro reg_sii_mb1_addr (width=6)
//                                (
//                                        .scan_in(reg_sii_mb1_addr_scanin),
//                                        .scan_out(reg_sii_mb1_addr_scanout),
//                                        .dout(sii_mb1_addr_r[5:0]),
//                                        .l1clk(l1clk),
//                                        .din(sii_mb1_addr[5:0]),
//                                        );

//msff_ctl_macro reg_sii_mb1_wdata (width=8)
//                                (
//                                        .scan_in(reg_sii_mb1_wdata_scanin),
//                                        .scan_out(reg_sii_mb1_wdata_scanout),
//                                        .dout(sii_mb1_wdata_r[7:0]),
//                                        .l1clk(l1clk),
//                                        .din(sii_mb1_wdata[7:0]),
//                                        );


//msff_ctl_macro reg_sii_mb1_ipdodq_wr_en (width=1)
//                                (
//                                        .scan_in(reg_sii_mb1_ipdodq_wr_en_scanin),
//                                        .scan_out(reg_sii_mb1_ipdodq_wr_en_scanout),
//                                        .dout(sii_mb1_ipdodq_wr_en_r),
//                                        .l1clk(l1clk),
//                                        .din(sii_mb1_ipdodq_wr_en),
//                                        );

//msff_ctl_macro reg_sii_mb1_ipdbdq_wr_en (width=1)
//                                (
//                                        .scan_in(reg_sii_mb1_ipdbdq_wr_en_scanin),
//                                        .scan_out(reg_sii_mb1_ipdbdq_wr_en_scanout),
//                                        .dout(sii_mb1_ipdbdq_wr_en_r),
//                                        .l1clk(l1clk),
//                                        .din(sii_mb1_ipdbdq_wr_en),
//                                        );

//msff_ctl_macro reg_sii_mb1_ipdohq_wr_en (width=1)
//                                (
//                                        .scan_in(reg_sii_mb1_ipdohq_wr_en_scanin),
//                                        .scan_out(reg_sii_mb1_ipdohq_wr_en_scanout),
//                                        .dout(sii_mb1_ipdohq_wr_en_r),
//                                        .l1clk(l1clk),
//                                        .din(sii_mb1_ipdohq_wr_en),
//                                        );

//msff_ctl_macro reg_sii_mb1_ipdbhq_wr_en (width=1)
//                                (
//                                        .scan_in(reg_sii_mb1_ipdbhq_wr_en_scanin),
//                                        .scan_out(reg_sii_mb1_ipdbhq_wr_en_scanout),
//                                        .dout(sii_mb1_ipdbhq_wr_en_r),
//                                        .l1clk(l1clk),
//                                        .din(sii_mb1_ipdbhq_wr_en),
//                                        );
//
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reg_cstate_scanin         = spares_scanout           ;
assign reg_last_or_wr_scanin     = reg_cstate_scanout       ;
assign reg_last_by_wr_scanin     = reg_last_or_wr_scanout   ;
assign reg_dmu_or_ptr_scanin     = reg_last_by_wr_scanout   ;
assign reg_dmu_by_ptr_scanin     = reg_dmu_or_ptr_scanout   ;
assign reg_ipdohq_wr_addr_scanin = reg_dmu_by_ptr_scanout   ;
assign reg_ipdbhq_wr_addr_scanin = reg_ipdohq_wr_addr_scanout;
assign reg_ipdodq_wr_addr_scanin = reg_ipdbhq_wr_addr_scanout;
assign reg_ipdbdq_wr_addr_scanin = reg_ipdodq_wr_addr_scanout;
assign reg_dmu_sii_hdr_scanin    = reg_ipdbdq_wr_addr_scanout;
assign reg_datareq16_scanin      = reg_dmu_sii_hdr_scanout  ;
assign reg_reqbypass_scanin      = reg_datareq16_scanout    ;
assign reg_add_or_scanin         = reg_reqbypass_scanout    ;
assign reg_add_by_scanin         = reg_add_or_scanout       ;
assign reg_dmu_wrack_tag_scanin  = reg_add_by_scanout       ;
assign reg_dmu_wrack_parity_scanin = reg_dmu_wrack_tag_scanout;
assign reg_ipcc_ipcs_wrack_scanin = reg_dmu_wrack_parity_scanout;
assign sync_ff_wrack1_scanin     = reg_ipcc_ipcs_wrack_scanout;
assign sync_ff_wrack2_scanin     = sync_ff_wrack1_scanout   ;
assign reg_ipcc_ipcs_or_dq_scanin = sync_ff_wrack2_scanout   ;
assign reg_ipcc_ipcs_by_dq_scanin = reg_ipcc_ipcs_or_dq_scanout;
assign sync_ff_or_ptr2_scanin    = reg_ipcc_ipcs_by_dq_scanout;
assign sync_ff_by_ptr1_scanin    = sync_ff_or_ptr2_scanout  ;
assign reg_by_cam0_scanin        = sync_ff_by_ptr1_scanout  ;
assign reg_by_cam1_scanin        = reg_by_cam0_scanout      ;
assign reg_by_cam2_scanin        = reg_by_cam1_scanout      ;
assign reg_by_cam3_scanin        = reg_by_cam2_scanout      ;
assign reg_by_cam4_scanin        = reg_by_cam3_scanout      ;
assign reg_by_cam5_scanin        = reg_by_cam4_scanout      ;
assign reg_by_cam6_scanin        = reg_by_cam5_scanout      ;
assign reg_by_cam7_scanin        = reg_by_cam6_scanout      ;
assign reg_by_cam8_scanin        = reg_by_cam7_scanout      ;
assign reg_by_cam9_scanin        = reg_by_cam8_scanout      ;
assign reg_by_cam10_scanin       = reg_by_cam9_scanout      ;
assign reg_by_cam11_scanin       = reg_by_cam10_scanout     ;
assign reg_by_cam12_scanin       = reg_by_cam11_scanout     ;
assign reg_by_cam13_scanin       = reg_by_cam12_scanout     ;
assign reg_by_cam14_scanin       = reg_by_cam13_scanout     ;
assign reg_by_cam15_scanin       = reg_by_cam14_scanout     ;
assign reg_or_cam0_scanin        = reg_by_cam15_scanout     ;
assign reg_or_cam1_scanin        = reg_or_cam0_scanout      ;
assign reg_or_cam2_scanin        = reg_or_cam1_scanout      ;
assign reg_or_cam3_scanin        = reg_or_cam2_scanout      ;
assign reg_or_cam4_scanin        = reg_or_cam3_scanout      ;
assign reg_or_cam5_scanin        = reg_or_cam4_scanout      ;
assign reg_or_cam6_scanin        = reg_or_cam5_scanout      ;
assign reg_or_cam7_scanin        = reg_or_cam6_scanout      ;
assign reg_or_cam8_scanin        = reg_or_cam7_scanout      ;
assign reg_or_cam9_scanin        = reg_or_cam8_scanout      ;
assign reg_or_cam10_scanin       = reg_or_cam9_scanout      ;
assign reg_or_cam11_scanin       = reg_or_cam10_scanout     ;
assign reg_or_cam12_scanin       = reg_or_cam11_scanout     ;
assign reg_or_cam13_scanin       = reg_or_cam12_scanout     ;
assign reg_or_cam14_scanin       = reg_or_cam13_scanout     ;
assign reg_or_cam15_scanin       = reg_or_cam14_scanout     ;
assign scan_out                  = reg_or_cam15_scanout     ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module sii_ipcs_ctll1clkhdr_ctl_macro (
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


module sii_ipcs_ctlspare_ctl_macro__num_20 (
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
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;
wire si_11;
wire so_11;
wire spare11_flop_unused;
wire spare11_buf_32x_unused;
wire spare11_nand3_8x_unused;
wire spare11_inv_8x_unused;
wire spare11_aoi22_4x_unused;
wire spare11_buf_8x_unused;
wire spare11_oai22_4x_unused;
wire spare11_inv_16x_unused;
wire spare11_nand2_16x_unused;
wire spare11_nor3_4x_unused;
wire spare11_nand2_8x_unused;
wire spare11_buf_16x_unused;
wire spare11_nor2_16x_unused;
wire spare11_inv_32x_unused;
wire si_12;
wire so_12;
wire spare12_flop_unused;
wire spare12_buf_32x_unused;
wire spare12_nand3_8x_unused;
wire spare12_inv_8x_unused;
wire spare12_aoi22_4x_unused;
wire spare12_buf_8x_unused;
wire spare12_oai22_4x_unused;
wire spare12_inv_16x_unused;
wire spare12_nand2_16x_unused;
wire spare12_nor3_4x_unused;
wire spare12_nand2_8x_unused;
wire spare12_buf_16x_unused;
wire spare12_nor2_16x_unused;
wire spare12_inv_32x_unused;
wire si_13;
wire so_13;
wire spare13_flop_unused;
wire spare13_buf_32x_unused;
wire spare13_nand3_8x_unused;
wire spare13_inv_8x_unused;
wire spare13_aoi22_4x_unused;
wire spare13_buf_8x_unused;
wire spare13_oai22_4x_unused;
wire spare13_inv_16x_unused;
wire spare13_nand2_16x_unused;
wire spare13_nor3_4x_unused;
wire spare13_nand2_8x_unused;
wire spare13_buf_16x_unused;
wire spare13_nor2_16x_unused;
wire spare13_inv_32x_unused;
wire si_14;
wire so_14;
wire spare14_flop_unused;
wire spare14_buf_32x_unused;
wire spare14_nand3_8x_unused;
wire spare14_inv_8x_unused;
wire spare14_aoi22_4x_unused;
wire spare14_buf_8x_unused;
wire spare14_oai22_4x_unused;
wire spare14_inv_16x_unused;
wire spare14_nand2_16x_unused;
wire spare14_nor3_4x_unused;
wire spare14_nand2_8x_unused;
wire spare14_buf_16x_unused;
wire spare14_nor2_16x_unused;
wire spare14_inv_32x_unused;
wire si_15;
wire so_15;
wire spare15_flop_unused;
wire spare15_buf_32x_unused;
wire spare15_nand3_8x_unused;
wire spare15_inv_8x_unused;
wire spare15_aoi22_4x_unused;
wire spare15_buf_8x_unused;
wire spare15_oai22_4x_unused;
wire spare15_inv_16x_unused;
wire spare15_nand2_16x_unused;
wire spare15_nor3_4x_unused;
wire spare15_nand2_8x_unused;
wire spare15_buf_16x_unused;
wire spare15_nor2_16x_unused;
wire spare15_inv_32x_unused;
wire si_16;
wire so_16;
wire spare16_flop_unused;
wire spare16_buf_32x_unused;
wire spare16_nand3_8x_unused;
wire spare16_inv_8x_unused;
wire spare16_aoi22_4x_unused;
wire spare16_buf_8x_unused;
wire spare16_oai22_4x_unused;
wire spare16_inv_16x_unused;
wire spare16_nand2_16x_unused;
wire spare16_nor3_4x_unused;
wire spare16_nand2_8x_unused;
wire spare16_buf_16x_unused;
wire spare16_nor2_16x_unused;
wire spare16_inv_32x_unused;
wire si_17;
wire so_17;
wire spare17_flop_unused;
wire spare17_buf_32x_unused;
wire spare17_nand3_8x_unused;
wire spare17_inv_8x_unused;
wire spare17_aoi22_4x_unused;
wire spare17_buf_8x_unused;
wire spare17_oai22_4x_unused;
wire spare17_inv_16x_unused;
wire spare17_nand2_16x_unused;
wire spare17_nor3_4x_unused;
wire spare17_nand2_8x_unused;
wire spare17_buf_16x_unused;
wire spare17_nor2_16x_unused;
wire spare17_inv_32x_unused;
wire si_18;
wire so_18;
wire spare18_flop_unused;
wire spare18_buf_32x_unused;
wire spare18_nand3_8x_unused;
wire spare18_inv_8x_unused;
wire spare18_aoi22_4x_unused;
wire spare18_buf_8x_unused;
wire spare18_oai22_4x_unused;
wire spare18_inv_16x_unused;
wire spare18_nand2_16x_unused;
wire spare18_nor3_4x_unused;
wire spare18_nand2_8x_unused;
wire spare18_buf_16x_unused;
wire spare18_nor2_16x_unused;
wire spare18_inv_32x_unused;
wire si_19;
wire so_19;
wire spare19_flop_unused;
wire spare19_buf_32x_unused;
wire spare19_nand3_8x_unused;
wire spare19_inv_8x_unused;
wire spare19_aoi22_4x_unused;
wire spare19_buf_8x_unused;
wire spare19_oai22_4x_unused;
wire spare19_inv_16x_unused;
wire spare19_nand2_16x_unused;
wire spare19_nor3_4x_unused;
wire spare19_nand2_8x_unused;
wire spare19_buf_16x_unused;
wire spare19_nor2_16x_unused;
wire spare19_inv_32x_unused;


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

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));

cl_sc1_msff_8x spare11_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_11),
                               .so(so_11),
                               .d(1'b0),
                               .q(spare11_flop_unused));
assign si_11 = so_10;

cl_u1_buf_32x   spare11_buf_32x (.in(1'b1),
                                   .out(spare11_buf_32x_unused));
cl_u1_nand3_8x spare11_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare11_nand3_8x_unused));
cl_u1_inv_8x    spare11_inv_8x (.in(1'b1),
                                  .out(spare11_inv_8x_unused));
cl_u1_aoi22_4x spare11_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_aoi22_4x_unused));
cl_u1_buf_8x    spare11_buf_8x (.in(1'b1),
                                  .out(spare11_buf_8x_unused));
cl_u1_oai22_4x spare11_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_oai22_4x_unused));
cl_u1_inv_16x   spare11_inv_16x (.in(1'b1),
                                   .out(spare11_inv_16x_unused));
cl_u1_nand2_16x spare11_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare11_nand2_16x_unused));
cl_u1_nor3_4x spare11_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare11_nor3_4x_unused));
cl_u1_nand2_8x spare11_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare11_nand2_8x_unused));
cl_u1_buf_16x   spare11_buf_16x (.in(1'b1),
                                   .out(spare11_buf_16x_unused));
cl_u1_nor2_16x spare11_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare11_nor2_16x_unused));
cl_u1_inv_32x   spare11_inv_32x (.in(1'b1),
                                   .out(spare11_inv_32x_unused));

cl_sc1_msff_8x spare12_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_12),
                               .so(so_12),
                               .d(1'b0),
                               .q(spare12_flop_unused));
assign si_12 = so_11;

cl_u1_buf_32x   spare12_buf_32x (.in(1'b1),
                                   .out(spare12_buf_32x_unused));
cl_u1_nand3_8x spare12_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare12_nand3_8x_unused));
cl_u1_inv_8x    spare12_inv_8x (.in(1'b1),
                                  .out(spare12_inv_8x_unused));
cl_u1_aoi22_4x spare12_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_aoi22_4x_unused));
cl_u1_buf_8x    spare12_buf_8x (.in(1'b1),
                                  .out(spare12_buf_8x_unused));
cl_u1_oai22_4x spare12_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_oai22_4x_unused));
cl_u1_inv_16x   spare12_inv_16x (.in(1'b1),
                                   .out(spare12_inv_16x_unused));
cl_u1_nand2_16x spare12_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare12_nand2_16x_unused));
cl_u1_nor3_4x spare12_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare12_nor3_4x_unused));
cl_u1_nand2_8x spare12_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare12_nand2_8x_unused));
cl_u1_buf_16x   spare12_buf_16x (.in(1'b1),
                                   .out(spare12_buf_16x_unused));
cl_u1_nor2_16x spare12_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare12_nor2_16x_unused));
cl_u1_inv_32x   spare12_inv_32x (.in(1'b1),
                                   .out(spare12_inv_32x_unused));

cl_sc1_msff_8x spare13_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_13),
                               .so(so_13),
                               .d(1'b0),
                               .q(spare13_flop_unused));
assign si_13 = so_12;

cl_u1_buf_32x   spare13_buf_32x (.in(1'b1),
                                   .out(spare13_buf_32x_unused));
cl_u1_nand3_8x spare13_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare13_nand3_8x_unused));
cl_u1_inv_8x    spare13_inv_8x (.in(1'b1),
                                  .out(spare13_inv_8x_unused));
cl_u1_aoi22_4x spare13_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_aoi22_4x_unused));
cl_u1_buf_8x    spare13_buf_8x (.in(1'b1),
                                  .out(spare13_buf_8x_unused));
cl_u1_oai22_4x spare13_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_oai22_4x_unused));
cl_u1_inv_16x   spare13_inv_16x (.in(1'b1),
                                   .out(spare13_inv_16x_unused));
cl_u1_nand2_16x spare13_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare13_nand2_16x_unused));
cl_u1_nor3_4x spare13_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare13_nor3_4x_unused));
cl_u1_nand2_8x spare13_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare13_nand2_8x_unused));
cl_u1_buf_16x   spare13_buf_16x (.in(1'b1),
                                   .out(spare13_buf_16x_unused));
cl_u1_nor2_16x spare13_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare13_nor2_16x_unused));
cl_u1_inv_32x   spare13_inv_32x (.in(1'b1),
                                   .out(spare13_inv_32x_unused));

cl_sc1_msff_8x spare14_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_14),
                               .so(so_14),
                               .d(1'b0),
                               .q(spare14_flop_unused));
assign si_14 = so_13;

cl_u1_buf_32x   spare14_buf_32x (.in(1'b1),
                                   .out(spare14_buf_32x_unused));
cl_u1_nand3_8x spare14_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare14_nand3_8x_unused));
cl_u1_inv_8x    spare14_inv_8x (.in(1'b1),
                                  .out(spare14_inv_8x_unused));
cl_u1_aoi22_4x spare14_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_aoi22_4x_unused));
cl_u1_buf_8x    spare14_buf_8x (.in(1'b1),
                                  .out(spare14_buf_8x_unused));
cl_u1_oai22_4x spare14_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_oai22_4x_unused));
cl_u1_inv_16x   spare14_inv_16x (.in(1'b1),
                                   .out(spare14_inv_16x_unused));
cl_u1_nand2_16x spare14_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare14_nand2_16x_unused));
cl_u1_nor3_4x spare14_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare14_nor3_4x_unused));
cl_u1_nand2_8x spare14_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare14_nand2_8x_unused));
cl_u1_buf_16x   spare14_buf_16x (.in(1'b1),
                                   .out(spare14_buf_16x_unused));
cl_u1_nor2_16x spare14_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare14_nor2_16x_unused));
cl_u1_inv_32x   spare14_inv_32x (.in(1'b1),
                                   .out(spare14_inv_32x_unused));

cl_sc1_msff_8x spare15_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_15),
                               .so(so_15),
                               .d(1'b0),
                               .q(spare15_flop_unused));
assign si_15 = so_14;

cl_u1_buf_32x   spare15_buf_32x (.in(1'b1),
                                   .out(spare15_buf_32x_unused));
cl_u1_nand3_8x spare15_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare15_nand3_8x_unused));
cl_u1_inv_8x    spare15_inv_8x (.in(1'b1),
                                  .out(spare15_inv_8x_unused));
cl_u1_aoi22_4x spare15_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare15_aoi22_4x_unused));
cl_u1_buf_8x    spare15_buf_8x (.in(1'b1),
                                  .out(spare15_buf_8x_unused));
cl_u1_oai22_4x spare15_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare15_oai22_4x_unused));
cl_u1_inv_16x   spare15_inv_16x (.in(1'b1),
                                   .out(spare15_inv_16x_unused));
cl_u1_nand2_16x spare15_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare15_nand2_16x_unused));
cl_u1_nor3_4x spare15_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare15_nor3_4x_unused));
cl_u1_nand2_8x spare15_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare15_nand2_8x_unused));
cl_u1_buf_16x   spare15_buf_16x (.in(1'b1),
                                   .out(spare15_buf_16x_unused));
cl_u1_nor2_16x spare15_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare15_nor2_16x_unused));
cl_u1_inv_32x   spare15_inv_32x (.in(1'b1),
                                   .out(spare15_inv_32x_unused));

cl_sc1_msff_8x spare16_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_16),
                               .so(so_16),
                               .d(1'b0),
                               .q(spare16_flop_unused));
assign si_16 = so_15;

cl_u1_buf_32x   spare16_buf_32x (.in(1'b1),
                                   .out(spare16_buf_32x_unused));
cl_u1_nand3_8x spare16_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare16_nand3_8x_unused));
cl_u1_inv_8x    spare16_inv_8x (.in(1'b1),
                                  .out(spare16_inv_8x_unused));
cl_u1_aoi22_4x spare16_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare16_aoi22_4x_unused));
cl_u1_buf_8x    spare16_buf_8x (.in(1'b1),
                                  .out(spare16_buf_8x_unused));
cl_u1_oai22_4x spare16_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare16_oai22_4x_unused));
cl_u1_inv_16x   spare16_inv_16x (.in(1'b1),
                                   .out(spare16_inv_16x_unused));
cl_u1_nand2_16x spare16_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare16_nand2_16x_unused));
cl_u1_nor3_4x spare16_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare16_nor3_4x_unused));
cl_u1_nand2_8x spare16_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare16_nand2_8x_unused));
cl_u1_buf_16x   spare16_buf_16x (.in(1'b1),
                                   .out(spare16_buf_16x_unused));
cl_u1_nor2_16x spare16_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare16_nor2_16x_unused));
cl_u1_inv_32x   spare16_inv_32x (.in(1'b1),
                                   .out(spare16_inv_32x_unused));

cl_sc1_msff_8x spare17_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_17),
                               .so(so_17),
                               .d(1'b0),
                               .q(spare17_flop_unused));
assign si_17 = so_16;

cl_u1_buf_32x   spare17_buf_32x (.in(1'b1),
                                   .out(spare17_buf_32x_unused));
cl_u1_nand3_8x spare17_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare17_nand3_8x_unused));
cl_u1_inv_8x    spare17_inv_8x (.in(1'b1),
                                  .out(spare17_inv_8x_unused));
cl_u1_aoi22_4x spare17_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare17_aoi22_4x_unused));
cl_u1_buf_8x    spare17_buf_8x (.in(1'b1),
                                  .out(spare17_buf_8x_unused));
cl_u1_oai22_4x spare17_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare17_oai22_4x_unused));
cl_u1_inv_16x   spare17_inv_16x (.in(1'b1),
                                   .out(spare17_inv_16x_unused));
cl_u1_nand2_16x spare17_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare17_nand2_16x_unused));
cl_u1_nor3_4x spare17_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare17_nor3_4x_unused));
cl_u1_nand2_8x spare17_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare17_nand2_8x_unused));
cl_u1_buf_16x   spare17_buf_16x (.in(1'b1),
                                   .out(spare17_buf_16x_unused));
cl_u1_nor2_16x spare17_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare17_nor2_16x_unused));
cl_u1_inv_32x   spare17_inv_32x (.in(1'b1),
                                   .out(spare17_inv_32x_unused));

cl_sc1_msff_8x spare18_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_18),
                               .so(so_18),
                               .d(1'b0),
                               .q(spare18_flop_unused));
assign si_18 = so_17;

cl_u1_buf_32x   spare18_buf_32x (.in(1'b1),
                                   .out(spare18_buf_32x_unused));
cl_u1_nand3_8x spare18_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare18_nand3_8x_unused));
cl_u1_inv_8x    spare18_inv_8x (.in(1'b1),
                                  .out(spare18_inv_8x_unused));
cl_u1_aoi22_4x spare18_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare18_aoi22_4x_unused));
cl_u1_buf_8x    spare18_buf_8x (.in(1'b1),
                                  .out(spare18_buf_8x_unused));
cl_u1_oai22_4x spare18_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare18_oai22_4x_unused));
cl_u1_inv_16x   spare18_inv_16x (.in(1'b1),
                                   .out(spare18_inv_16x_unused));
cl_u1_nand2_16x spare18_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare18_nand2_16x_unused));
cl_u1_nor3_4x spare18_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare18_nor3_4x_unused));
cl_u1_nand2_8x spare18_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare18_nand2_8x_unused));
cl_u1_buf_16x   spare18_buf_16x (.in(1'b1),
                                   .out(spare18_buf_16x_unused));
cl_u1_nor2_16x spare18_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare18_nor2_16x_unused));
cl_u1_inv_32x   spare18_inv_32x (.in(1'b1),
                                   .out(spare18_inv_32x_unused));

cl_sc1_msff_8x spare19_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_19),
                               .so(so_19),
                               .d(1'b0),
                               .q(spare19_flop_unused));
assign si_19 = so_18;

cl_u1_buf_32x   spare19_buf_32x (.in(1'b1),
                                   .out(spare19_buf_32x_unused));
cl_u1_nand3_8x spare19_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare19_nand3_8x_unused));
cl_u1_inv_8x    spare19_inv_8x (.in(1'b1),
                                  .out(spare19_inv_8x_unused));
cl_u1_aoi22_4x spare19_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare19_aoi22_4x_unused));
cl_u1_buf_8x    spare19_buf_8x (.in(1'b1),
                                  .out(spare19_buf_8x_unused));
cl_u1_oai22_4x spare19_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare19_oai22_4x_unused));
cl_u1_inv_16x   spare19_inv_16x (.in(1'b1),
                                   .out(spare19_inv_16x_unused));
cl_u1_nand2_16x spare19_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare19_nand2_16x_unused));
cl_u1_nor3_4x spare19_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare19_nor3_4x_unused));
cl_u1_nand2_8x spare19_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare19_nand2_8x_unused));
cl_u1_buf_16x   spare19_buf_16x (.in(1'b1),
                                   .out(spare19_buf_16x_unused));
cl_u1_nor2_16x spare19_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare19_nor2_16x_unused));
cl_u1_inv_32x   spare19_inv_32x (.in(1'b1),
                                   .out(spare19_inv_32x_unused));
assign scan_out = so_19;



endmodule






// any PARAMS parms go into naming of macro

module sii_ipcs_ctlmsff_ctl_macro__width_7 (
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













// any PARAMS parms go into naming of macro

module sii_ipcs_ctlmsff_ctl_macro__width_5 (
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

module sii_ipcs_ctlmsff_ctl_macro__width_4 (
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

module sii_ipcs_ctlmsff_ctl_macro__width_6 (
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

module sii_ipcs_ctlmsff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcs_ctlmsff_ctl_macro__width_1 (
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

module sii_ipcs_ctlmsff_ctl_macro__width_41 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [40:0] fdin;
wire [39:0] so;

  input [40:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [40:0] dout;
  output scan_out;
assign fdin[40:0] = din[40:0];






dff #(41)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[40:0]),
.si({scan_in,so[39:0]}),
.so({so[39:0],scan_out}),
.q(dout[40:0])
);












endmodule








