// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_inc_ctl.v
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
module	sii_inc_ctl (
  ncu_sii_gnt, 
  sii_ncu_req, 
  sii_ncu_data, 
  sii_ncu_dparity, 
  inc_indq_rd_addr, 
  inc_indq_rd_en, 
  indq_inc_dout, 
  inc_ipcc_stop, 
  ipcc_indq_wr_addr, 
  ipcc_indq_wr_en, 
  ipcc_inc_wr_ovfl, 
  l2clk, 
  cmp_io_sync_en_in, 
  io_cmp_sync_en_in, 
  scan_in, 
  scan_out, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  sii_mb0_run, 
  sii_mb0_ind_rd_en, 
  sii_mb0_addr, 
  sii_mb0_wdata, 
  sii_mb0_ind_fail);
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire [67:0] mbist1_data;
wire [7:0] sii_mb0_wdata_r;
wire [67:0] compare;
wire [67:0] mbist1_data_rr;
wire [1:0] sii_mb0_ind_fail_l;
wire [4:0] cstate_r;
wire [31:0] sii_ncu_data_l;
wire arc_hdr_data;
wire [33:0] new_data;
wire [1:0] sii_ncu_dparity_l;
wire sii_ncu_req_l;
wire make_request;
wire sii_mb0_run_r;
wire [5:0] sii_mb0_addr_r;
wire arc_gnt_hdr;
wire cmp_io_sync_en;
wire [2:0] cyc_cnt_r;
wire [5:0] inc_indq_rd_addr_r;
wire sii_mb0_ind_rd_en_r;
wire turn_off_rd_en;
wire ind_fifo_full;
wire [33:0] data_l;
wire [33:0] data_h;
wire ind_fifo_empty;
wire rd_ovfl_l;
wire ind_fifo_full_l;
wire rd_ovfl_r;
wire cyc_cnt_en;
wire [2:0] cyc_cnt_l;
wire data_end;
wire got_gnt_l;
wire ncu_sii_gnt_r;
wire got_gnt_r;
wire arc_start_req;
wire arc_req_gnt;
wire cmp_io_sync_en_dly2;
wire cmp_io_sync_en_dly3;
wire arc_data_start;
wire arc_data_gnt;
wire arc_data_req;
wire reg_cstate_scanin;
wire reg_cstate_scanout;
wire reg_sii_mb0_ind_fail_scanin;
wire reg_sii_mb0_ind_fail_scanout;
wire reg_mbist1_data_rr_scanin;
wire reg_mbist1_data_rr_scanout;
wire [67:0] mbist1_data_r;
wire reg_mbist1_data_r_scanin;
wire reg_mbist1_data_r_scanout;
wire reg_rd_ovfl_scanin;
wire reg_rd_ovfl_scanout;
wire reg_got_gnt_scanin;
wire reg_got_gnt_scanout;
wire reg_cmp_io_syn_en_scanin;
wire reg_cmp_io_syn_en_scanout;
wire cmp_io_sync_en_dly;
wire reg_cmp_io_syn_en_dly2_scanin;
wire reg_cmp_io_syn_en_dly2_scanout;
wire reg_cmp_io_syn_en_dly3_scanin;
wire reg_cmp_io_syn_en_dly3_scanout;
wire reg_ncu_sii_gnt_scanin;
wire reg_ncu_sii_gnt_scanout;
wire io_cmp_sync_en;
wire reg_cyc_cnt_r_scanin;
wire reg_cyc_cnt_r_scanout;
wire reg_inc_indq_rd_addr_scanin;
wire reg_inc_indq_rd_addr_scanout;
wire reg_sii_ncu_req_scanin;
wire reg_sii_ncu_req_scanout;
wire reg_sii_ncu_data_scanin;
wire reg_sii_ncu_data_scanout;
wire reg_sii_ncu_dparity_scanin;
wire reg_sii_ncu_dparity_scanout;
wire reg_cmp_io_sync_en_scanin;
wire reg_cmp_io_sync_en_scanout;
wire reg_io_cmp_sync_en_scanin;
wire reg_io_cmp_sync_en_scanout;
wire reg_sii_mb0_run_scanin;
wire reg_sii_mb0_run_scanout;
wire reg_sii_mb0_ind_rd_en_scanin;
wire reg_sii_mb0_ind_rd_en_scanout;
wire reg_sii_mb0_addr_scanin;
wire reg_sii_mb0_addr_scanout;
wire reg_sii_mb0_wdata_scanin;
wire reg_sii_mb0_wdata_scanout;
wire reg_ind_fifo_full_scanin;
wire reg_ind_fifo_full_scanout;


input 		ncu_sii_gnt;		//io_clk
output 		sii_ncu_req;		//io_clk	
output	[31:0]	sii_ncu_data;		//io_clk
output	[1:0]	sii_ncu_dparity;		//io_clk

//------inter-submodule signals-------

output	[5:0]	inc_indq_rd_addr;	//cmp_clk
output		inc_indq_rd_en;		//cmp_clk
input	[67:0]	indq_inc_dout;

output		inc_ipcc_stop;		//cmp_clk
input  	[5:0]	ipcc_indq_wr_addr;	//cmp_clk	
input  		ipcc_indq_wr_en;	//cmp_clk	
input  		ipcc_inc_wr_ovfl;	//for checking empty/full of fifo	

input		l2clk;
input		cmp_io_sync_en_in;
input		io_cmp_sync_en_in;
input		scan_in ;
output		scan_out;
input        	tcu_scan_en;
input        	tcu_aclk;
input        	tcu_bclk;
input        	tcu_pce_ov;
input        	tcu_clk_stop;

//-------mbist related signals -------

input        	sii_mb0_run;
input        	sii_mb0_ind_rd_en;
input 	[5:0]  	sii_mb0_addr;
input 	[7:0]  	sii_mb0_wdata;
output 	[1:0]  	sii_mb0_ind_fail;


// Clock header
sii_inc_ctll1clkhdr_ctl_macro clkgen (
                              .l2clk  (l2clk                  ),
                              .l1en   (1'b1                   ),
                              .l1clk  (l1clk                  ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                              );

// Spare gates
sii_inc_ctlspare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//************************************************************************
// SCAN CONNECTIONS 
//************************************************************************
// scan renames
assign 	 se = tcu_scan_en;
assign 	 siclk = tcu_aclk;
assign 	 soclk = tcu_bclk;
assign 	 pce_ov = tcu_pce_ov;
assign 	 stop = tcu_clk_stop;
// end scan

//************************************************************************
// 		MBIST CONNECTIONS 
//************************************************************************

assign	mbist1_data[67:0] = {sii_mb0_wdata_r[1:0], sii_mb0_wdata_r[7:6], sii_mb0_wdata_r[7:0], 
			     sii_mb0_wdata_r[7:0],
			     sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0],
			     sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0], sii_mb0_wdata_r[7:0]};
assign  compare[67:0]  = mbist1_data_rr[67:0] ^ indq_inc_dout[67:0];

assign  sii_mb0_ind_fail_l[1] = | compare[67:34];
assign  sii_mb0_ind_fail_l[0] = | compare[33:0];

//************************************************************************
// STATE DEFINITION 
//************************************************************************

`define	START_ST		5'b00001
`define	REQ_ST			5'b00010
`define	GNT_ST			5'b00100
`define	HDR_ST			5'b01000
`define	DATA_ST			5'b10000

`define	START		 	0
`define	REQ		 	1
`define	GNT		 	2
`define	HDR		 	3
`define	DATA		 	4


reg [4:0]	nstate_r;
//reg [4:0]	cstate_r;

wire [4:0]	nstate;
wire [4:0]	cstate;

// ------- internal signals --------

//0in one_hot -var cstate[4:0]
//0in one_hot -var nstate_r[4:0]

assign		nstate = {nstate_r[4:1], ~nstate_r[0]};
assign		cstate = {cstate_r[4:1], ~cstate_r[0]};

//************************************************************************
//	OUTPUT LOGICS 
//************************************************************************

assign	sii_ncu_data_l[31:0]  = ((cstate[`HDR] && ~arc_hdr_data )  || cstate[`GNT]) ? 
				indq_inc_dout[31:0] : new_data[31:0];

assign	sii_ncu_dparity_l[1:0]  = ((cstate[`HDR] && ~arc_hdr_data )  || cstate[`GNT]) ? 
				indq_inc_dout[65:64] : new_data[33:32];

assign	sii_ncu_req_l	  = make_request;

assign 	inc_indq_rd_addr[5:0] = sii_mb0_run_r ? sii_mb0_addr_r[5:0] :
				(arc_gnt_hdr || (cmp_io_sync_en && cyc_cnt_r[0]))  ? 
				((inc_indq_rd_addr_r[5:0] == 6'd47 ) ? 6'd0 :   // 0in range -var inc_indq_rd_addr_r -min 0 -max 47
			    	 (inc_indq_rd_addr_r[5:0] + 6'h01)) : 
				  inc_indq_rd_addr_r[5:0]; 

assign  inc_indq_rd_en	=   sii_mb0_run_r ?  sii_mb0_ind_rd_en_r :
			    ~turn_off_rd_en;
assign	inc_ipcc_stop	= ind_fifo_full;
//************************************************************************
//	internal wires assignment	
//************************************************************************
//assign  early_hdr_end   = cmp_io_sync_en  ; 
assign	new_data[33:0] 	= cyc_cnt_r[0] ? data_l[33:0] : data_h[33:0];
//assign  data_h[33:0]	= {indq_inc_dout[67:66], indq_inc_dout[39:32], 
//			   indq_inc_dout[47:40], indq_inc_dout[55:48], indq_inc_dout[63:56]};
//assign  data_l[33:0]	= {indq_inc_dout[65:64], indq_inc_dout[7:0], 
//			   indq_inc_dout[15:8], indq_inc_dout[23:16], indq_inc_dout[31:24]};

assign  data_h[33:0]	= {indq_inc_dout[67:66], indq_inc_dout[63:32]} ;
assign  data_l[33:0]	= {indq_inc_dout[65:64], indq_inc_dout[31:0]} ;


assign	turn_off_rd_en	= (ipcc_indq_wr_addr[5:0] == inc_indq_rd_addr[5:0]) && ipcc_indq_wr_en ;

//------------	fifo empty/full handling ----------------
//assign	ind_fifo_empty	= ((inc_indq_rd_addr[5:0] == ipcc_indq_wr_addr[5:0] )  
//				&& (rd_ovfl_r == ipcc_inc_wr_ovfl)) ||
//			 ((inc_indq_rd_addr[5:0] == ipcc_indq_wr_addr[5:0] - 6'h01) 
//			  && (rd_ovfl_r == ipcc_inc_wr_ovfl)) ||
//			  (inc_indq_rd_addr - ipcc_indq_wr_addr == 6'd47) ;

assign		ind_fifo_empty = (((ipcc_indq_wr_addr[5:0] - inc_indq_rd_addr[5:0]) < 6'd3) 
					&& (rd_ovfl_l == ipcc_inc_wr_ovfl) ||
				  ((inc_indq_rd_addr[5:0] - ipcc_indq_wr_addr[5:0]) > 6'd45)
					&& (rd_ovfl_l ^ ipcc_inc_wr_ovfl)) 
					  ? 1'b1 : 1'b0;
				  

assign	ind_fifo_full_l	= (ipcc_indq_wr_addr[5:0]- inc_indq_rd_addr_r[5:0] > 6'd44)
			  && (rd_ovfl_r == ipcc_inc_wr_ovfl) ||	
			  (inc_indq_rd_addr_r - ipcc_indq_wr_addr < 6'd6)
			  && (rd_ovfl_r != ipcc_inc_wr_ovfl) ;	
assign	rd_ovfl_l	= (inc_indq_rd_addr_r[5:0] == 6'd47) && (inc_indq_rd_addr[5:0] == 6'd0 ) ?
			   ~rd_ovfl_r : rd_ovfl_r;

//------------------payload cycle decoding---------------
assign	cyc_cnt_en	=  (cstate[`DATA]  && cmp_io_sync_en ) ;
assign	cyc_cnt_l[2:0]	= (arc_gnt_hdr )? 3'b000 : ((cyc_cnt_en && ~data_end) ?
			  (cyc_cnt_r[2:0] + 3'b001) : cyc_cnt_r[2:0]);

assign	data_end	= cyc_cnt_r[2]  ;
assign	got_gnt_l	= ncu_sii_gnt_r && sii_ncu_req ? 1'b1 : cstate[`HDR] ? 1'b0 :  got_gnt_r ;
assign 	make_request	= ~ind_fifo_empty ;

//************************************************************************
// STATE TRANSITION SECTION
//************************************************************************

assign	arc_start_req	= cstate[`START] && make_request; 

assign	arc_req_gnt	= cstate[`REQ] && got_gnt_l & cmp_io_sync_en;

assign	arc_gnt_hdr	= cstate[`GNT] && (cmp_io_sync_en )	;		//1 to 4
//				( cmp_io_sync_en_dly2 & cmp_io_sync_en));	// 1 to 3/4
assign	arc_hdr_data	= cstate[`HDR] && ~cmp_io_sync_en_dly2 && cmp_io_sync_en_dly3; 
assign  arc_data_start	= cstate[`DATA] && ind_fifo_empty && data_end;  
assign	arc_data_gnt	= cstate[`DATA] && data_end && got_gnt_l & cmp_io_sync_en;
assign	arc_data_req	= cstate[`DATA] && data_end && cmp_io_sync_en && make_request && ~got_gnt_l;

always @ (arc_start_req or arc_req_gnt or arc_gnt_hdr 	 or arc_hdr_data or
	  arc_data_gnt  or arc_data_req or arc_data_start or cstate )

	begin
	case (1'b1)			//synopsys parallel_case full_case
		cstate[`START]	: if (arc_start_req)
					nstate_r = `REQ_ST;
				  else
					nstate_r = `START_ST;
		cstate[`REQ]	: if (arc_req_gnt)
					nstate_r = `GNT_ST;		
				  else
					nstate_r = `REQ_ST;
		cstate[`GNT]	: if (arc_gnt_hdr) 
					nstate_r = `HDR_ST;		
				  else
					nstate_r = `GNT_ST;
		cstate[`HDR]	: if (arc_hdr_data)
					nstate_r = `DATA_ST;		
				  else
					nstate_r = `HDR_ST;
		cstate[`DATA]	: if (arc_data_gnt)
					nstate_r = `GNT_ST;		
				  else if (arc_data_start)
					nstate_r = `START_ST;
				  else if (arc_data_req)
					nstate_r = `REQ_ST;
				  else	
					nstate_r = `DATA_ST;
		default		: begin
					nstate_r = `START_ST; 
				// 0in < fire -message "ERROR: sii_inc statemachine default case"
				  end

	endcase
	end

//************************************************************************
// REGISTERS section
//************************************************************************
sii_inc_ctlmsff_ctl_macro__width_5 reg_cstate  // ASYNC reset active low
                                (
					.scan_in(reg_cstate_scanin),
					.scan_out(reg_cstate_scanout),
					.dout(cstate_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(nstate[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_2 reg_sii_mb0_ind_fail  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_ind_fail_scanin),
					.scan_out(reg_sii_mb0_ind_fail_scanout),
					.dout(sii_mb0_ind_fail[1:0]),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_ind_fail_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_68 reg_mbist1_data_rr  // ASYNC reset active low
                                (
					.scan_in(reg_mbist1_data_rr_scanin),
					.scan_out(reg_mbist1_data_rr_scanout),
					.dout(mbist1_data_rr[67:0]),
                                      	.l1clk(l1clk),
                                      	.din(mbist1_data_r[67:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_68 reg_mbist1_data_r  // ASYNC reset active low
                                (
					.scan_in(reg_mbist1_data_r_scanin),
					.scan_out(reg_mbist1_data_r_scanout),
					.dout(mbist1_data_r[67:0]),
                                      	.l1clk(l1clk),
                                      	.din(mbist1_data[67:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_rd_ovfl  // ASYNC reset active low
                                (
					.scan_in(reg_rd_ovfl_scanin),
					.scan_out(reg_rd_ovfl_scanout),
					.dout(rd_ovfl_r),
                                      	.l1clk(l1clk),
                                      	.din(rd_ovfl_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_got_gnt  // ASYNC reset active low
                                (
					.scan_in(reg_got_gnt_scanin),
					.scan_out(reg_got_gnt_scanout),
					.dout(got_gnt_r),
                                      	.l1clk(l1clk),
                                      	.din(got_gnt_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_cmp_io_syn_en  // ASYNC reset active low
                                (
					.scan_in(reg_cmp_io_syn_en_scanin),
					.scan_out(reg_cmp_io_syn_en_scanout),
					.dout(cmp_io_sync_en_dly),
                                      	.l1clk(l1clk),
  //                                    	.en(cmp_io_sync_en),
                                      	.din(cstate[`GNT]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_cmp_io_syn_en_dly2  // ASYNC reset active low
                                (
					.scan_in(reg_cmp_io_syn_en_dly2_scanin),
					.scan_out(reg_cmp_io_syn_en_dly2_scanout),
					.dout(cmp_io_sync_en_dly2),
                                      	.l1clk(l1clk),
                                      	.din(cmp_io_sync_en_dly),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_cmp_io_syn_en_dly3  // ASYNC reset active low
                                (
					.scan_in(reg_cmp_io_syn_en_dly3_scanin),
					.scan_out(reg_cmp_io_syn_en_dly3_scanout),
					.dout(cmp_io_sync_en_dly3),
                                      	.l1clk(l1clk),
                                      	.din(cmp_io_sync_en_dly2),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_gnt   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_gnt_scanin),
					.scan_out(reg_ncu_sii_gnt_scanout),
					.dout(ncu_sii_gnt_r),
                                      	.l1clk(l1clk),
					.en (io_cmp_sync_en),
                                      	.din(ncu_sii_gnt),
  .siclk(siclk),
  .soclk(soclk)
					);

//msff_ctl_macro reg_ind_fifo_empty (width=1) // ASYNC reset active low
//                                (
//					.scan_in(reg_ind_fifo_empty_scanin),
//					.scan_out(reg_ind_fifo_empty_scanout),
//					.dout(ind_fifo_empty_r),
//                                      	.l1clk(l1clk),
//                                      	.din(ind_fifo_empty),
//					);


sii_inc_ctlmsff_ctl_macro__width_3 reg_cyc_cnt_r  // ASYNC reset active low
                                (
					.scan_in(reg_cyc_cnt_r_scanin),
					.scan_out(reg_cyc_cnt_r_scanout),
					.dout(cyc_cnt_r[2:0]),
                                      	.l1clk(l1clk),
                                      	.din(cyc_cnt_l[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_6 reg_inc_indq_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_inc_indq_rd_addr_scanin),
					.scan_out(reg_inc_indq_rd_addr_scanout),
					.dout(inc_indq_rd_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(inc_indq_rd_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_inc_ctlmsff_ctl_macro__en_1__width_1 reg_sii_ncu_req   // ASYNC reset active low
                                (
					.scan_in(reg_sii_ncu_req_scanin),
					.scan_out(reg_sii_ncu_req_scanout),
					.dout(sii_ncu_req),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(sii_ncu_req_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__en_1__width_32 reg_sii_ncu_data   // ASYNC reset active low
                                (
					.scan_in(reg_sii_ncu_data_scanin),
					.scan_out(reg_sii_ncu_data_scanout),
					.dout(sii_ncu_data[31:0]),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(sii_ncu_data_l[31:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__en_1__width_2 reg_sii_ncu_dparity   // ASYNC reset active low
                                (
					.scan_in(reg_sii_ncu_dparity_scanin),
					.scan_out(reg_sii_ncu_dparity_scanout),
					.dout(sii_ncu_dparity[1:0]),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(sii_ncu_dparity_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_cmp_io_sync_en  // ASYNC reset active low
                                (
					.scan_in(reg_cmp_io_sync_en_scanin),
					.scan_out(reg_cmp_io_sync_en_scanout),
					.dout(cmp_io_sync_en),
                                      	.l1clk(l1clk),
                                      	.din(cmp_io_sync_en_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_io_cmp_sync_en  // ASYNC reset active low
                                (
					.scan_in(reg_io_cmp_sync_en_scanin),
					.scan_out(reg_io_cmp_sync_en_scanout),
					.dout(io_cmp_sync_en),
                                      	.l1clk(l1clk),
                                      	.din(io_cmp_sync_en_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_run  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_run_scanin),
					.scan_out(reg_sii_mb0_run_scanout),
					.dout(sii_mb0_run_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_run),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_ind_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_ind_rd_en_scanin),
					.scan_out(reg_sii_mb0_ind_rd_en_scanout),
					.dout(sii_mb0_ind_rd_en_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_ind_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_6 reg_sii_mb0_addr  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_addr_scanin),
					.scan_out(reg_sii_mb0_addr_scanout),
					.dout(sii_mb0_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_8 reg_sii_mb0_wdata  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_wdata_scanin),
					.scan_out(reg_sii_mb0_wdata_scanout),
					.dout(sii_mb0_wdata_r[7:0]),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_wdata[7:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_inc_ctlmsff_ctl_macro__width_1 reg_ind_fifo_full  // ASYNC reset active low
                                (
					.scan_in(reg_ind_fifo_full_scanin),
					.scan_out(reg_ind_fifo_full_scanout),
					.dout(ind_fifo_full),
                                      	.l1clk(l1clk),
                                      	.din(ind_fifo_full_l),
  .siclk(siclk),
  .soclk(soclk)
					);

// fixscan start:
assign spares_scanin             = scan_in                  ;
assign reg_cstate_scanin         = spares_scanout           ;
assign reg_sii_mb0_ind_fail_scanin = reg_cstate_scanout       ;
assign reg_mbist1_data_rr_scanin = reg_sii_mb0_ind_fail_scanout;
assign reg_mbist1_data_r_scanin  = reg_mbist1_data_rr_scanout;
assign reg_rd_ovfl_scanin        = reg_mbist1_data_r_scanout;
assign reg_got_gnt_scanin        = reg_rd_ovfl_scanout      ;
assign reg_cmp_io_syn_en_scanin  = reg_got_gnt_scanout      ;
assign reg_cmp_io_syn_en_dly2_scanin = reg_cmp_io_syn_en_scanout;
assign reg_cmp_io_syn_en_dly3_scanin = reg_cmp_io_syn_en_dly2_scanout;
assign reg_ncu_sii_gnt_scanin    = reg_cmp_io_syn_en_dly3_scanout;
assign reg_cyc_cnt_r_scanin      = reg_ncu_sii_gnt_scanout  ;
assign reg_inc_indq_rd_addr_scanin = reg_cyc_cnt_r_scanout    ;
assign reg_sii_ncu_req_scanin    = reg_inc_indq_rd_addr_scanout;
assign reg_sii_ncu_data_scanin   = reg_sii_ncu_req_scanout  ;
assign reg_sii_ncu_dparity_scanin = reg_sii_ncu_data_scanout ;
assign reg_cmp_io_sync_en_scanin = reg_sii_ncu_dparity_scanout;
assign reg_io_cmp_sync_en_scanin = reg_cmp_io_sync_en_scanout;
assign reg_sii_mb0_run_scanin    = reg_io_cmp_sync_en_scanout;
assign reg_sii_mb0_ind_rd_en_scanin = reg_sii_mb0_run_scanout  ;
assign reg_sii_mb0_addr_scanin   = reg_sii_mb0_ind_rd_en_scanout;
assign reg_sii_mb0_wdata_scanin  = reg_sii_mb0_addr_scanout ;
assign reg_ind_fifo_full_scanin  = reg_sii_mb0_wdata_scanout;
assign scan_out                  = reg_ind_fifo_full_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module sii_inc_ctll1clkhdr_ctl_macro (
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


module sii_inc_ctlspare_ctl_macro__num_2 (
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
assign scan_out = so_1;



endmodule






// any PARAMS parms go into naming of macro

module sii_inc_ctlmsff_ctl_macro__width_5 (
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

module sii_inc_ctlmsff_ctl_macro__width_2 (
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

module sii_inc_ctlmsff_ctl_macro__width_68 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [67:0] fdin;
wire [66:0] so;

  input [67:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [67:0] dout;
  output scan_out;
assign fdin[67:0] = din[67:0];






dff #(68)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[67:0]),
.si({scan_in,so[66:0]}),
.so({so[66:0],scan_out}),
.q(dout[67:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_inc_ctlmsff_ctl_macro__width_1 (
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

module sii_inc_ctlmsff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module sii_inc_ctlmsff_ctl_macro__width_3 (
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

module sii_inc_ctlmsff_ctl_macro__width_6 (
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

module sii_inc_ctlmsff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






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













// any PARAMS parms go into naming of macro

module sii_inc_ctlmsff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module sii_inc_ctlmsff_ctl_macro__width_8 (
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








