// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_core.v
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
`timescale 1 ps/ 1 ps

`define CCU_ALIGN_CNT  5'h08
`define CCU_CSR_RST_CNT  6'h36

module ccu_core (
	l1clk,
	rst_ccu_,
	aligned,
	pll_arst_l,
	pll_div2,
	pll_div3,
	pll_div4,
	pll_div4_msb,
	io2x_phase_180,
	io_phase_180,
	io_phase_0,
	ccu_sys_cmp_sync_en,
	shift_amt,
	ccu_cmp_sys_sync_en,
	ratio,
//	ccu_vco_aligned,
	pll_div3_lat,
	pll_div4_lat,
	csr_rst_n,
	serdes_dtm1,
	serdes_dtm2,
	io_div,
	io2x_div,
	ccu_dbg1_serdes_dtm,
	ccu_mio_serdes_dtm,
	ccu_io2x_sync_en,
	ccu_pre_dr_sync_en, 
	ccu_dr_sync_en,
	tcu_atpg_mode,
	scan_in, 
	aclk, 
	bclk, 
	scan_out,
	rng_arst_l,
	ccu_serdes_dtm_lat,
	rng_ctl1,
	rng_ctl2,
	rng_ctl3 ,
	rng_ch_sel,
	ccu_cmp_io_sync_en,
	ccu_io_cmp_sync_en,
	ccu_rst_sync_stable,
	aligned_rst_n,
	dr_shift_amt
);

// port declarations

input   	l1clk;
input   	rst_ccu_;
input   	aligned;
input   	pll_arst_l;
input [5:0] pll_div2;
input [5:0] pll_div3;
input [6:0] pll_div4;
input   	io2x_phase_180;
input		io_phase_180;
input		io_phase_0;
output	   	ccu_sys_cmp_sync_en;
input 		serdes_dtm1;
input 		serdes_dtm2;
output [4:0] io_div;
output [4:0] io2x_div;
output		ccu_cmp_sys_sync_en;
output		aligned_rst_n;
output [4:0]	ratio;
// output 		ccu_vco_aligned;
output [5:0] pll_div3_lat;
output [6:0] pll_div4_lat;
output		csr_rst_n;
output		ccu_dbg1_serdes_dtm;
output		ccu_mio_serdes_dtm;
output		ccu_io2x_sync_en;
input		ccu_pre_dr_sync_en;
output		ccu_dr_sync_en;
input		tcu_atpg_mode;
input		scan_in; 
input		aclk; 
input		bclk; 
output		scan_out;
output		rng_arst_l;
output		ccu_serdes_dtm_lat;
input 		rng_ctl1;
input 		rng_ctl2;
input 		rng_ctl3;
output	[1:0]	rng_ch_sel;
output		ccu_cmp_io_sync_en;
output		ccu_io_cmp_sync_en;
output		ccu_rst_sync_stable;
output  [4:0] shift_amt;
output	pll_div4_msb;
output	[4:0] dr_shift_amt;

// external wire/reg declarations

wire   	l1clk;
wire   	rst_ccu_;
wire   	aligned;
wire   	pll_arst_l;
wire [5:0] pll_div2;
wire [5:0] pll_div3;
wire [6:0] pll_div4;
wire   	io2x_phase_180;
wire		io_phase_180;
wire		io_phase_0;
wire 		serdes_dtm1;
wire 		serdes_dtm2;
wire [4:0] io_div;
wire [4:0] io2x_div;
wire	   	ccu_sys_cmp_sync_en;
wire		ccu_cmp_sys_sync_en;
wire	 	aligned_rst_n;
wire [4:0]	ratio;
// wire 		ccu_vco_aligned;
wire [5:0] pll_div3_lat;
wire [6:0] pll_div4_lat;
wire		csr_rst_n;
wire		ccu_dbg1_serdes_dtm;
wire		ccu_mio_serdes_dtm;
wire		ccu_io2x_sync_en;
wire		ccu_dr_sync_en;
wire		tcu_atpg_mode;
wire		scan_in; 
wire		aclk; 
wire		bclk; 
wire		scan_out;
wire		rng_arst_l;
wire  		ccu_serdes_dtm_lat;
wire 		rng_ctl1;
wire 		rng_ctl2;
wire 		rng_ctl3;
wire [1:0] rng_ch_sel;
wire		ccu_cmp_io_sync_en;
wire		ccu_io_cmp_sync_en;
// reg		ccu_rst_sync_stable;	// for inferred flops
reg  [4:0] shift_amt;
wire	pll_div4_msb;
wire	[4:0] dr_shift_amt;

// internal wire/reg declarations

wire 	csr_rst;
reg	 aligned_rst_q1_n;
// reg  [4:0] csr_rst_cnt;		// for inferred flops
wire  [5:0] pll_div2_lat;
wire	 gclk_rst_n;
// reg  [4:0] align_pulse_cnt;	// for inferred flops

// for instantiated flops
wire [5:0] csr_rst_cnt;
wire [4:0] align_pulse_cnt;
wire ccu_rst_sync_stable;


wire rst_ccu;
wire	ccu_rst_sync_stable_in;
wire	[5:0]	csr_rst_cnt_in;


wire	[4:0]	align_pulse_cnt_in;
wire	unused;

// wire rst_ccu_gated;
// wire rst_ccu_n_gated;
wire csr_rst_n_gated;
wire csr_rst_gated;

wire io_phase_180_q1;
wire io_phase_0_q1;

wire serdes_dtm1_lat;
wire serdes_dtm2_lat;

reg	 aligned_rst_q2_n;
reg	 aligned_rst_q3_n;

wire gclk_rst         ; 
wire gclk_rst_n_gated ;
wire gclk_rst_gated   ;


assign gclk_rst         =                  ~gclk_rst_n; 
assign gclk_rst_n_gated =   tcu_atpg_mode | gclk_rst_n; 
assign gclk_rst_gated   =  ~gclk_rst_n_gated;

// assign rst_ccu_gated =   	~tcu_atpg_mode & rst_ccu;
// assign rst_ccu_n_gated = 	tcu_atpg_mode | rst_ccu_;

assign csr_rst_gated =  	~tcu_atpg_mode & csr_rst;
assign csr_rst_n_gated =	tcu_atpg_mode | csr_rst_n;

assign dr_shift_amt =  shift_amt; 

assign csr_rst = ~csr_rst_n;
assign ccu_serdes_dtm_lat = serdes_dtm1_lat | serdes_dtm2_lat; 

// clear rng during por_ or wmr_ with frequency change
assign  rng_arst_l = rst_ccu_;	

assign  scan_out = scan_in; 

assign  ccu_mio_serdes_dtm  = serdes_dtm1_lat; 
assign  ccu_dbg1_serdes_dtm = serdes_dtm1_lat; 


// ***********************************************
// synchronizer flop
// ***********************************************

wire pre_gclk_rst_n;

assign gclk_rst_n = rst_ccu_ & pre_gclk_rst_n; 

cl_a1_clksyncff_4x bf_sync1 (
	.l1clk (l1clk), .d (rst_ccu_), .q(pre_gclk_rst_n),
	.si(1'b0), .siclk(1'b0), .soclk (1'b0), .so() 
);

 
// ***********************************************
// now generate reset aligned w/aligned pulse
// ***********************************************

// BEGIN_ECO POST TAPEOUT - N2 BUG 
wire gclk_rst_n_eco;
wire aligned_hold;
wire aligned_hold_q;

assign aligned_hold = aligned | aligned_hold_q;

my_msff_arst_4x	gclk_rst_hold_eco ( 
	.d ( aligned_hold ), .q ( aligned_hold_q ), .reset ( gclk_rst ), .l1clk ( l1clk ),
	.si(1'b0), .siclk(1'b0), .soclk (1'b0), .so() 
);
// END_ECO POST TAPEOUT

always @( posedge l1clk) begin
	if ( !gclk_rst_n ) begin		// POST TAPEOUT ECO 
		aligned_rst_q1_n <= 1'b0; // internal
		aligned_rst_q2_n <= 1'b0; // additional pipe stage 
		aligned_rst_q3_n <= 1'b0; // external
	end else begin
		aligned_rst_q1_n <= aligned & aligned_hold_q; 	// POST TAPEOUT ECO
		aligned_rst_q2_n <= aligned_rst_q1_n; 
		aligned_rst_q3_n <=  aligned_rst_q3_n |  
				(aligned_rst_q2_n &  (~aligned_rst_q1_n));

	end
end	

assign aligned_rst_n = aligned_rst_q3_n;

// ***********************************************
// generate delayd rst signal for csr stuff 
// ***********************************************
assign csr_rst_n = (csr_rst_cnt==`CCU_CSR_RST_CNT)? 1'b1: 1'b0;

assign	csr_rst_cnt_in[5:0] = (csr_rst_cnt == `CCU_CSR_RST_CNT) ? csr_rst_cnt[5:0] : (csr_rst_cnt + 6'b1) ;

wire aligned_hold_q_gated = aligned_hold_q | tcu_atpg_mode; // POST TAPEOUT ECO 

ccu_msff_arst_4x_6	rst_cnt_bank6 ( 
	.q(csr_rst_cnt), 
	.so(),
	.si (1'b0), 
	.d(csr_rst_cnt_in), 
	.l1clk(l1clk), 
	.siclk (aclk),
	.soclk (bclk),
	.reset_n (aligned_hold_q_gated) // POST TAPEOUT ECO - changed from gclk_rst_n_gated
);


// ***********************************************
// latch in divider value similar to pll's 
// ***********************************************

assign pll_div4_msb = pll_div4_lat[4];  // ccu only needs bit 4 of 6:0
assign pll_div4_lat[6] = pll_div4[6]; 	// this is purely for maintaining 7 inputs to pll 
 
ccu_blatch_4x_6 pll_div2_bnk6 (
	.latout (pll_div2_lat), .d(pll_div2), .l1clk(pll_arst_l), 
 	.so(),	.si (1'b0), .siclk (1'b0), .soclk (1'b0) 
);

ccu_blatch_4x_6 pll_div3_bnk6 (
	.latout (pll_div3_lat), .d(pll_div3), .l1clk(pll_arst_l), 
 	.so(),	.si (1'b0), .siclk (1'b0), .soclk (1'b0) 
);

ccu_blatch_4x_6 pll_div4_bnk6 (
	.latout (pll_div4_lat[5:0]), .d(pll_div4[5:0]), 
	.l1clk(pll_arst_l), .so(),	.si (1'b0), .siclk (1'b0), .soclk (1'b0) 
);

ccu_blatch_4x_1 serdes_dtm1_bnk1  (
	.latout (serdes_dtm1_lat), .d(serdes_dtm1), .l1clk(pll_arst_l), 
 	.so(),	.si (1'b0), .siclk (1'b0), .soclk (1'b0) 
);

ccu_blatch_4x_1 serdes_dtm1_bnk2  (
	.latout (serdes_dtm2_lat), .d(serdes_dtm2), .l1clk(pll_arst_l), 
 	.so(),	.si (1'b0), .siclk (1'b0), .soclk (1'b0) 
);


// ***********************************************
// align shift value 
// ***********************************************
always @ (pll_div2_lat) begin 
	case (pll_div2_lat)
		6'h07: shift_amt = 5'h02;
		6'h08: shift_amt = 5'h03;
		6'h09: shift_amt = 5'h04;
		6'h0A: shift_amt = 5'h05;
		6'h0B: shift_amt = 5'h06;
		6'h0C: shift_amt = 5'h07;
		6'h0D: shift_amt = 5'h08;
		6'h0E: shift_amt = 5'h09;
		6'h0F: shift_amt = 5'h0A;
		6'h10: shift_amt = 5'h0B;
		6'h11: shift_amt = 5'h0C;
		6'h12: shift_amt = 5'h0D;
		6'h13: shift_amt = 5'h0E;
		6'h14: shift_amt = 5'h0F;
		6'h15: shift_amt = 5'h10;
		default: shift_amt = 5'h02;
	endcase
end

// assign ccu_vco_aligned = aligned;

// count align cycles, repeat after CCU_ALIGN_CNT 
assign	align_pulse_cnt_in = (aligned == 1'b1) ? 
			((align_pulse_cnt == `CCU_ALIGN_CNT) ? 5'b0 : (align_pulse_cnt + 5'b1) ) :
			align_pulse_cnt;

ccu_msff_arst_4x_5	align_pulse_cnt_bank5 ( 
	.q(align_pulse_cnt),
	.si(1'b0),
	.so(), 
	.d(align_pulse_cnt_in),
	.l1clk(l1clk), 
	.siclk (aclk),
	.soclk (bclk),
	.reset_n (csr_rst_n_gated) 
);


// generate ccu_rst_sync_stable signal after CCU_ALIGN_CNT 
// ref_clk (= 2 * CCU_ALIGN_CNT  sys_clk cycles)

assign	ccu_rst_sync_stable_in = (align_pulse_cnt == `CCU_ALIGN_CNT) ? 1'b1 : ccu_rst_sync_stable;
assign rst_ccu = ~rst_ccu_;

my_msff_arst_4x	ccu_rst_sync_stable_ff ( 
	.q(ccu_rst_sync_stable), 
	.so(), 
	.d(ccu_rst_sync_stable_in), 
	.l1clk(l1clk), 
	.si(1'b0), 
	.siclk(aclk), 
	.soclk(bclk), 
	.reset(csr_rst_gated) // .reset(csr_rst) 
);


// generate cmp->dr ratio
//
// normal mode: always cmp multiplier/4, range [2.00,5.50]x 
// use lsb to determine fractional parts 
// 		00 => .00
// 		01 => .25
// 		10 => .50
// 		11 => .75
// 		d3=2, pll_div4/2 is true ratio 
//
// func: assign ratio[4:0] = pll_div2_lat[4:0]; 
// dtm:  (pll_div2+1)/2 = ratio 


// shift io-cmp & cmp-io sync pulses by a cycle in functional mode
my_msff_arst_4x	sync1_shift ( 
	.q(io_phase_180_q1), .so(), .d(io_phase_180), .l1clk(l1clk), 
	.si(1'b0), .siclk(aclk), .soclk(bclk), .reset(gclk_rst_gated) 
);

my_msff_arst_4x	sync2_shift ( 
	.q(io_phase_0_q1), .so(), .d(io_phase_0), .l1clk(l1clk), 
	.si(1'b0), .siclk(aclk), .soclk(bclk), .reset(gclk_rst_gated) 
);

my_msff_arst_4x	sys_cmp_sync_shift1 ( 
	.q(ccu_pre_sys_cmp_sync_en ), .so(), .d(aligned), .l1clk(l1clk), 
	.si(1'b0), .siclk(aclk), .soclk(bclk), .reset(gclk_rst_gated) 
);


// take care of dtm mode
wire ccu_dr_sync_en_q2;
wire ccu_dr_sync_en_q1;
wire ccu_pre_cmp_io_sync_en;
wire ccu_pre_io_cmp_sync_en;
wire ccu_pre_io2x_sync_en;

assign ratio[4:0] = ccu_serdes_dtm_lat? pll_div2_lat[4:0] : pll_div4_lat[4:0]; 
assign io_div     = ccu_serdes_dtm_lat? pll_div2_lat[4:0] : 5'b00011;
assign io2x_div   = ccu_serdes_dtm_lat? pll_div2_lat[4:0] : 5'b00001;

assign 	ccu_pre_io2x_sync_en    =  ccu_serdes_dtm_lat?ccu_dr_sync_en_q1:io2x_phase_180;  // removed inversion
assign  ccu_pre_cmp_io_sync_en  =  ccu_serdes_dtm_lat?ccu_dr_sync_en_q1:io_phase_180_q1;
// FREEZE FEATURE BEGIN
// assign ccu_pre_io_cmp_sync_en=ccu_serdes_dtm_lat?ccu_dr_sync_en_q1:io_phase_0_q1;
assign  ccu_pre_io_cmp_sync_en = io_phase_0_q1;
// FREEZE FEATURE END
assign  ccu_cmp_sys_sync_en 	=  ccu_sys_cmp_sync_en;  // unaffected by dtm


// account for # delay in pre-grid driver
//


assign ccu_dr_sync_en = ccu_dr_sync_en_q2;  // shift twice needed here 


my_msff_arst_4x	dr_sync_shift1 ( 
	.q(ccu_dr_sync_en_q1), .so(), .d(ccu_pre_dr_sync_en), .l1clk(l1clk), 
	.si(1'b0), .siclk(aclk), .soclk(bclk), .reset(gclk_rst_gated) 
);

my_msff_arst_4x	dr_sync_shift2 ( 
	.q(ccu_dr_sync_en_q2), .so(), .d(ccu_dr_sync_en_q1), .l1clk(l1clk), 
	.si(1'b0), .siclk(aclk), .soclk(bclk), .reset(gclk_rst_gated) 
);


// finally, shift all sync pulses by single cycle to compensate
// for race-thru in cluster header 
ccu_msff_arst_4x_4 all_sync_shift ( 
	.l1clk(l1clk), 
	.q({ccu_sys_cmp_sync_en,ccu_io2x_sync_en,
	    ccu_io_cmp_sync_en,ccu_cmp_io_sync_en}),
	.d({ccu_pre_sys_cmp_sync_en,ccu_pre_io2x_sync_en,
	    ccu_pre_io_cmp_sync_en,ccu_pre_cmp_io_sync_en}),
	.reset_n(gclk_rst_n_gated) , 
	.si(1'b0), .siclk(aclk), .soclk(bclk), .so()
);

// rng channel encoding
// =====================
// ctl3 ctl2 ctl1 	ch_sel[1:0] 
//  0    0    0       11 	- really don't care 
//  0    0    1       00 	- select ch1
//  0    1    0       01 	- select ch2
//  1    0    0       10 	- select ch3 
//  1    0    1       11 	- select all ch
//  1    1    0       11 	- select all ch
//  1    1    1       11 	- select all ch
//  0    1    1       11 	- select all ch

// a = ctl3, b = ctl2, c = ctl1 
// ch0 = b + ac + !a!c 
// ch1 = a + bc + !b!c
assign  rng_ch_sel[0] = rng_ctl2 | (rng_ctl3 & rng_ctl1) | (~rng_ctl3 & ~rng_ctl1);  
assign  rng_ch_sel[1] = rng_ctl3 | (rng_ctl2 & rng_ctl1) | (~rng_ctl2 & ~rng_ctl1);  


endmodule

