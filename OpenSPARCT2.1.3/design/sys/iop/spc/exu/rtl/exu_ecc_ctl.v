// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: exu_ecc_ctl.v
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
module exu_ecc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  ect_mbist_sel, 
  mbi_write_data_p1, 
  edp_rd_ff_w, 
  edp_rd_ff_w2, 
  tlu_cerer_irf, 
  tlu_ceter_pscce, 
  lsu_asi_error_inject_b31, 
  lsu_asi_error_inject_b25, 
  lsu_asi_error_inject, 
  ecc_w_synd_w, 
  ecc_w2_synd_w2, 
  ecc_mbist_write_data_p4, 
  ect_ex_emb_clken, 
  ect_tg_clken, 
  ect_tid_lth_e, 
  ect_rs1_valid_e, 
  ect_rs2_valid_e, 
  ect_rs3_valid_e, 
  ect_two_cycle_m, 
  ect_rs1_addr_e, 
  ect_rs2_addr_e, 
  ect_rs3_addr_e, 
  edp_rcc_data_e, 
  exu_rs2_data_e, 
  edp_rs3_data_e, 
  edp_rcc_ecc_e, 
  edp_rs2_ecc_e, 
  edp_rs3_ecc_e, 
  dec_valid_e, 
  dec_flush_m, 
  exu_ecc_check_m, 
  exu_ecc_addr_m, 
  exu_ecc_m, 
  exu_cecc_m, 
  exu_uecc_m, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk_pm1;
wire l1clk_pm2;
wire mbist_ff_scanin;
wire mbist_ff_scanout;
wire [7:0] mbi_write_data_p2;
wire [7:0] mbi_write_data_p3;
wire ecc_mask_en_in;
wire debug_ff_scanin;
wire debug_ff_scanout;
wire cerer_irf_ff;
wire [3:0] ceter_pscce_ff;
wire [7:0] ecc_mask_data_ff;
wire ecc_mask_en_ff;
wire ecc_valid_e;
wire ecc_enable_e;
wire [63:0] d1_e;
wire [7:0] p1_e;
wire [63:0] d2_e;
wire [7:0] p2_e;
wire [63:0] d3_e;
wire [7:0] p3_e;
wire rs1_ne_e;
wire rs1_parity_e;
wire [6:0] q1_e;
wire rs1_ce_e;
wire rs1_ue_e;
wire rs2_ne_e;
wire rs2_parity_e;
wire [6:0] q2_e;
wire rs2_ce_e;
wire rs2_ue_e;
wire rs3_ce_e;
wire rs3_parity_e;
wire rs3_ue_e;
wire [6:0] q3_e;
wire [7:0] check_e;
wire [4:0] addr_e;
wire check_e_to_m_scanin;
wire check_e_to_m_scanout;
wire addr_e_to_m_scanin;
wire addr_e_to_m_scanout;
wire cecc_e;
wire uecc_e;
wire ecc_ecc_e;
wire ecc_uecc_e;
wire ecc_cecc_e;
wire ce_ue_ecc_flops_scanin;
wire ce_ue_ecc_flops_scanout;
wire [7:0] ecc_mask_b;
wire [63:0] w_d;
wire [7:0] w_p_b;
wire [63:0] w2_d;
wire [7:0] w2_p_w;
wire spares_scanin;
wire spares_scanout;


// *** Global Inputs ***

input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;			// scan signals
input 		spc_aclk;
input 		spc_bclk;
input 		tcu_scan_en;

input		ect_mbist_sel;			// MBIST
input  [7:0]	mbi_write_data_p1; 		// MBIST


// *** Generate ECC  Local  Inputs *** 

input  [63:0]	edp_rd_ff_w;			// w  port data
input  [63:0]	edp_rd_ff_w2;			// w2 port data 

input		tlu_cerer_irf;			// IRF ecc error trap enable
input  [3:0]	tlu_ceter_pscce;		// core error trap enable reg precise enable

input		lsu_asi_error_inject_b31;	// [31]=global inject en
input		lsu_asi_error_inject_b25;	// [25]=IRF inject en
input  [7:0]	lsu_asi_error_inject;		// [7:0]=mask


// *** Generate ECC  Local  Outputs *** 

output [7:0]	ecc_w_synd_w;			// Generated ECC to IRF W port
output [7:0]	ecc_w2_synd_w2;			// Generated ECC to IRF W2 port
output [7:0]	ecc_mbist_write_data_p4;	// MBIST

// *** Check ECC  Local  Inputs *** 

input		ect_ex_emb_clken;		// Power Management
input		ect_tg_clken;			// Power Management

input  [1:0]	ect_tid_lth_e;

input      	ect_rs1_valid_e;		// Source register valid bit
input      	ect_rs2_valid_e;		// - available at output of flop
input      	ect_rs3_valid_e;        	// - signals valid rs data 
input		ect_two_cycle_m;

input  [4:0]	ect_rs1_addr_e;			// Source register address
input  [4:0]	ect_rs2_addr_e;			// - available at output of flop
input  [4:0]	ect_rs3_addr_e;			// - addr for IRF physical active window

input  [63:0]	edp_rcc_data_e;			// Source register ECC and data bit
input  [63:0]	exu_rs2_data_e;			// - available at output of flop
input  [63:0]	edp_rs3_data_e;
input  [7:0]	edp_rcc_ecc_e;
input  [7:0]	edp_rs2_ecc_e;
input  [7:0]	edp_rs3_ecc_e;


input		dec_valid_e;
input		dec_flush_m;


// *** Global Outputs ***

output [7:0]	exu_ecc_check_m;
output [4:0]	exu_ecc_addr_m;

output		exu_ecc_m;

output 		exu_cecc_m;			// Flag for detected   correctable ECC error 
output 		exu_uecc_m;			// Flag for detected uncorrectable ECC error 


// *** Local  Outputs ***

output		scan_out;



// scan renames
assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se	= tcu_scan_en;
// end scan

exu_ecc_ctl_l1clkhdr_ctl_macro clkgen_pm1	(
 .l2clk( l2clk			),
 .l1en ( ect_tg_clken		),
 .l1clk( l1clk_pm1		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


exu_ecc_ctl_l1clkhdr_ctl_macro clkgen_pm2	(
 .l2clk( l2clk			),
 .l1en ( ect_ex_emb_clken	),
 .l1clk( l1clk_pm2		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


exu_ecc_ctl_msff_ctl_macro__width_24 mbist_ff 	 (
 .scan_in(mbist_ff_scanin),
 .scan_out(mbist_ff_scanout),
 .l1clk( l1clk_pm1										),
 .din  ({mbi_write_data_p1[7:0]    , mbi_write_data_p2[7:0] , mbi_write_data_p3[7:0]}		),
 .dout ({mbi_write_data_p2[7:0]    , mbi_write_data_p3[7:0] , ecc_mbist_write_data_p4[7:0]}	),
  .siclk(siclk),
  .soclk(soclk));


assign ecc_mask_en_in	= lsu_asi_error_inject_b31 & lsu_asi_error_inject_b25;

exu_ecc_ctl_msff_ctl_macro__width_14 debug_ff 	 (
 .scan_in(debug_ff_scanin),
 .scan_out(debug_ff_scanout),
 .l1clk( l1clk_pm1										),
 .din  ({tlu_cerer_irf , tlu_ceter_pscce[3:0] , lsu_asi_error_inject[7:0] , ecc_mask_en_in}	),
 .dout ({cerer_irf_ff  , ceter_pscce_ff[3:0]  , ecc_mask_data_ff[7:0]     , ecc_mask_en_ff}	),
  .siclk(siclk),
  .soclk(soclk));


assign ecc_valid_e	= dec_valid_e | (ect_two_cycle_m & ~dec_flush_m);

assign ecc_enable_e	= ( ecc_valid_e &  cerer_irf_ff & ceter_pscce_ff[0] & (ect_tid_lth_e[1:0] == 2'b00)) |
			  ( ecc_valid_e &  cerer_irf_ff & ceter_pscce_ff[1] & (ect_tid_lth_e[1:0] == 2'b01)) |
			  ( ecc_valid_e &  cerer_irf_ff & ceter_pscce_ff[2] & (ect_tid_lth_e[1:0] == 2'b10)) |
			  ( ecc_valid_e &  cerer_irf_ff & ceter_pscce_ff[3] & (ect_tid_lth_e[1:0] == 2'b11));


/////////////////////////////////////////////////////////////////////////////
// ECC Error Dectection Logic
//-----------------------------
// - Regenerate ECC [6:0] and compare against retrived ECC
// - Check ECC [7] with parity
// - Outputs the result of the detection:
//   - ne: no error - either no valid data to check, 
//                    or ECC [6:0] all matched 
//   - ce: correctable error
//                  - parity is 1, so an odd number of bits flipped,
//                    and ECC data is valid and regenerated ECC did not match
//   - ue: uncorrectable error
//                  - parity is 0, so an even number of bits flipped,
//                    and ECC data is valid and regenerated ECC did not match
//                  - implies more than one bit was corrupted
/////////////////////////////////////////////////////////////////////////////

// renaming inputs for shorter assign statements
assign d1_e[63:0] = edp_rcc_data_e[63:0];
assign p1_e[ 7:0] = edp_rcc_ecc_e[7:0];

assign d2_e[63:0] = exu_rs2_data_e[63:0];
assign p2_e[ 7:0] = edp_rs2_ecc_e[7:0];

assign d3_e[63:0] = edp_rs3_data_e[63:0];
assign p3_e[ 7:0] = edp_rs3_ecc_e[7:0];


// Detection for RS1
// -----------------------------------
assign rs1_ne_e = ~ect_rs1_valid_e |
		  ~(rs1_parity_e | q1_e[6] | q1_e[5] | q1_e[4] | q1_e[3] | q1_e[2] | q1_e[1] | q1_e[0]);

assign rs1_ce_e =  ect_rs1_valid_e & rs1_parity_e;

assign rs1_ue_e =  ect_rs1_valid_e & ~rs1_parity_e & 
		   (q1_e[6] | q1_e[5] | q1_e[4] | q1_e[3] | q1_e[2] | q1_e[1] | q1_e[0]);

assign q1_e[0] = d1_e[0]  ^ d1_e[1]  ^ d1_e[3]  ^ d1_e[4]  ^ d1_e[6]  
                          ^ d1_e[8]  ^ d1_e[10] ^ d1_e[11] ^ d1_e[13] ^ d1_e[15]  
                          ^ d1_e[17] ^ d1_e[19] ^ d1_e[21] ^ d1_e[23] ^ d1_e[25]  
                          ^ d1_e[26] ^ d1_e[28] ^ d1_e[30] ^ d1_e[32] ^ d1_e[34] 
                          ^ d1_e[36] ^ d1_e[38] ^ d1_e[40] ^ d1_e[42] ^ d1_e[44]  
                          ^ d1_e[46] ^ d1_e[48] ^ d1_e[50] ^ d1_e[52] ^ d1_e[54]  
                          ^ d1_e[56] ^ d1_e[57] ^ d1_e[59] ^ d1_e[61] ^ d1_e[63]
		          ^ p1_e[0] ; 

assign q1_e[1] = d1_e[0]  ^ d1_e[2]  ^ d1_e[3]  ^ d1_e[5]  ^ d1_e[6]  
                          ^ d1_e[9]  ^ d1_e[10] ^ d1_e[12] ^ d1_e[13] ^ d1_e[16]  
                          ^ d1_e[17] ^ d1_e[20] ^ d1_e[21] ^ d1_e[24] ^ d1_e[25] 
                          ^ d1_e[27] ^ d1_e[28] ^ d1_e[31] ^ d1_e[32] ^ d1_e[35]
                          ^ d1_e[36] ^ d1_e[39] ^ d1_e[40] ^ d1_e[43] ^ d1_e[44]
                          ^ d1_e[47] ^ d1_e[48] ^ d1_e[51] ^ d1_e[52] ^ d1_e[55] 
                          ^ d1_e[56] ^ d1_e[58] ^ d1_e[59] ^ d1_e[62] ^ d1_e[63]
		          ^ p1_e[1] ; 

assign q1_e[2] = d1_e[1]  ^ d1_e[2]  ^ d1_e[3]  ^ d1_e[7]  ^ d1_e[8]  
                          ^ d1_e[9]  ^ d1_e[10] ^ d1_e[14] ^ d1_e[15] ^ d1_e[16]  
                          ^ d1_e[17] ^ d1_e[22] ^ d1_e[23] ^ d1_e[24] ^ d1_e[25]
                          ^ d1_e[29] ^ d1_e[30] ^ d1_e[31] ^ d1_e[32] ^ d1_e[37]  
                          ^ d1_e[38] ^ d1_e[39] ^ d1_e[40] ^ d1_e[45] ^ d1_e[46]
                          ^ d1_e[47] ^ d1_e[48] ^ d1_e[53] ^ d1_e[54] ^ d1_e[55] 
                          ^ d1_e[56] ^ d1_e[60] ^ d1_e[61] ^ d1_e[62] ^ d1_e[63]
		          ^ p1_e[2] ; 

assign q1_e[3] = d1_e[4]  ^ d1_e[5]  ^ d1_e[6]  ^ d1_e[7]  ^ d1_e[8]  
                          ^ d1_e[9]  ^ d1_e[10] ^ d1_e[18] ^ d1_e[19] ^ d1_e[20]  
                          ^ d1_e[21] ^ d1_e[22] ^ d1_e[23] ^ d1_e[24] ^ d1_e[25]
                          ^ d1_e[33] ^ d1_e[34] ^ d1_e[35] ^ d1_e[36] ^ d1_e[37]
                          ^ d1_e[38] ^ d1_e[39] ^ d1_e[40] ^ d1_e[49] ^ d1_e[50]
                          ^ d1_e[51] ^ d1_e[52] ^ d1_e[53] ^ d1_e[54] ^ d1_e[55]
                          ^ d1_e[56]
                          ^ p1_e[3] ; 

assign q1_e[4] = d1_e[11] ^ d1_e[12] ^ d1_e[13] ^ d1_e[14] ^ d1_e[15]
                          ^ d1_e[16] ^ d1_e[17] ^ d1_e[18] ^ d1_e[19] ^ d1_e[20]
                          ^ d1_e[21] ^ d1_e[22] ^ d1_e[23] ^ d1_e[24] ^ d1_e[25]
                          ^ d1_e[41] ^ d1_e[42] ^ d1_e[43] ^ d1_e[44] ^ d1_e[45]
                          ^ d1_e[46] ^ d1_e[47] ^ d1_e[48] ^ d1_e[49] ^ d1_e[50]
                          ^ d1_e[51] ^ d1_e[52] ^ d1_e[53] ^ d1_e[54] ^ d1_e[55]
                          ^ d1_e[56]
                          ^ p1_e[4] ; 

assign q1_e[5] = d1_e[26] ^ d1_e[27] ^ d1_e[28] ^ d1_e[29] ^ d1_e[30] 
                          ^ d1_e[31] ^ d1_e[32] ^ d1_e[33] ^ d1_e[34] ^ d1_e[35]
                          ^ d1_e[36] ^ d1_e[37] ^ d1_e[38] ^ d1_e[39] ^ d1_e[40]
                          ^ d1_e[41] ^ d1_e[42] ^ d1_e[43] ^ d1_e[44] ^ d1_e[45]
                          ^ d1_e[46] ^ d1_e[47] ^ d1_e[48] ^ d1_e[49] ^ d1_e[50]
                          ^ d1_e[51] ^ d1_e[52] ^ d1_e[53] ^ d1_e[54] ^ d1_e[55]
                          ^ d1_e[56]  
                          ^ p1_e[5] ; 

assign q1_e[6] = d1_e[57] ^ d1_e[58] ^ d1_e[59] ^ d1_e[60] ^ d1_e[61] 
                          ^ d1_e[62] ^ d1_e[63]
                          ^ p1_e[6] ; 

assign rs1_parity_e = d1_e[0]  ^ d1_e[1]  ^ d1_e[2]  ^ d1_e[3]  ^ d1_e[4]
                          ^ d1_e[5]  ^ d1_e[6]  ^ d1_e[7]  ^ d1_e[8]  ^ d1_e[9]
                          ^ d1_e[10] ^ d1_e[11] ^ d1_e[12] ^ d1_e[13] ^ d1_e[14] 
                          ^ d1_e[15] ^ d1_e[16] ^ d1_e[17] ^ d1_e[18] ^ d1_e[19]
                          ^ d1_e[20] ^ d1_e[21] ^ d1_e[22] ^ d1_e[23] ^ d1_e[24]
                          ^ d1_e[25] ^ d1_e[26] ^ d1_e[27] ^ d1_e[28] ^ d1_e[29]
                          ^ d1_e[30] ^ d1_e[31] ^ d1_e[32] ^ d1_e[33] ^ d1_e[34]
                          ^ d1_e[35] ^ d1_e[36] ^ d1_e[37] ^ d1_e[38] ^ d1_e[39]
                          ^ d1_e[40] ^ d1_e[41] ^ d1_e[42] ^ d1_e[43] ^ d1_e[44]
                          ^ d1_e[45] ^ d1_e[46] ^ d1_e[47] ^ d1_e[48] ^ d1_e[49]
                          ^ d1_e[50] ^ d1_e[51] ^ d1_e[52] ^ d1_e[53] ^ d1_e[54]
                          ^ d1_e[55] ^ d1_e[56] ^ d1_e[57] ^ d1_e[58] ^ d1_e[59]
                          ^ d1_e[60] ^ d1_e[61] ^ d1_e[62] ^ d1_e[63]
                          ^ p1_e[0]  ^ p1_e[1]  ^ p1_e[2]  ^ p1_e[3]  ^ p1_e[4] 
                          ^ p1_e[5]  ^ p1_e[6]  ^ p1_e[7];


// Detection for RS2
// -----------------------------------
assign rs2_ne_e = ~ect_rs2_valid_e |
		  ~(rs2_parity_e | q2_e[6] | q2_e[5] | q2_e[4] | q2_e[3] | q2_e[2] | q2_e[1] | q2_e[0]);

assign rs2_ce_e =  ect_rs2_valid_e & rs2_parity_e;

assign rs2_ue_e =  ect_rs2_valid_e & ~rs2_parity_e & 
		   (q2_e[6] | q2_e[5] | q2_e[4] | q2_e[3] | q2_e[2] | q2_e[1] | q2_e[0]);

assign q2_e[0] = d2_e[0]  ^ d2_e[1]  ^ d2_e[3]  ^ d2_e[4]  ^ d2_e[6]  
                          ^ d2_e[8]  ^ d2_e[10] ^ d2_e[11] ^ d2_e[13] ^ d2_e[15]  
                          ^ d2_e[17] ^ d2_e[19] ^ d2_e[21] ^ d2_e[23] ^ d2_e[25]  
                          ^ d2_e[26] ^ d2_e[28] ^ d2_e[30] ^ d2_e[32] ^ d2_e[34] 
                          ^ d2_e[36] ^ d2_e[38] ^ d2_e[40] ^ d2_e[42] ^ d2_e[44]  
                          ^ d2_e[46] ^ d2_e[48] ^ d2_e[50] ^ d2_e[52] ^ d2_e[54]  
                          ^ d2_e[56] ^ d2_e[57] ^ d2_e[59] ^ d2_e[61] ^ d2_e[63]
		          ^ p2_e[0] ; 

assign q2_e[1] = d2_e[0]  ^ d2_e[2]  ^ d2_e[3]  ^ d2_e[5]  ^ d2_e[6]  
                          ^ d2_e[9]  ^ d2_e[10] ^ d2_e[12] ^ d2_e[13] ^ d2_e[16]  
                          ^ d2_e[17] ^ d2_e[20] ^ d2_e[21] ^ d2_e[24] ^ d2_e[25] 
                          ^ d2_e[27] ^ d2_e[28] ^ d2_e[31] ^ d2_e[32] ^ d2_e[35]
                          ^ d2_e[36] ^ d2_e[39] ^ d2_e[40] ^ d2_e[43] ^ d2_e[44]
                          ^ d2_e[47] ^ d2_e[48] ^ d2_e[51] ^ d2_e[52] ^ d2_e[55] 
                          ^ d2_e[56] ^ d2_e[58] ^ d2_e[59] ^ d2_e[62] ^ d2_e[63]
		          ^ p2_e[1] ; 

assign q2_e[2] = d2_e[1]  ^ d2_e[2]  ^ d2_e[3]  ^ d2_e[7]  ^ d2_e[8]  
                          ^ d2_e[9]  ^ d2_e[10] ^ d2_e[14] ^ d2_e[15] ^ d2_e[16]  
                          ^ d2_e[17] ^ d2_e[22] ^ d2_e[23] ^ d2_e[24] ^ d2_e[25]
                          ^ d2_e[29] ^ d2_e[30] ^ d2_e[31] ^ d2_e[32] ^ d2_e[37]  
                          ^ d2_e[38] ^ d2_e[39] ^ d2_e[40] ^ d2_e[45] ^ d2_e[46]
                          ^ d2_e[47] ^ d2_e[48] ^ d2_e[53] ^ d2_e[54] ^ d2_e[55] 
                          ^ d2_e[56] ^ d2_e[60] ^ d2_e[61] ^ d2_e[62] ^ d2_e[63]
		          ^ p2_e[2] ; 

assign q2_e[3] = d2_e[4]  ^ d2_e[5]  ^ d2_e[6]  ^ d2_e[7]  ^ d2_e[8]  
                          ^ d2_e[9]  ^ d2_e[10] ^ d2_e[18] ^ d2_e[19] ^ d2_e[20]  
                          ^ d2_e[21] ^ d2_e[22] ^ d2_e[23] ^ d2_e[24] ^ d2_e[25]
                          ^ d2_e[33] ^ d2_e[34] ^ d2_e[35] ^ d2_e[36] ^ d2_e[37]
                          ^ d2_e[38] ^ d2_e[39] ^ d2_e[40] ^ d2_e[49] ^ d2_e[50]
                          ^ d2_e[51] ^ d2_e[52] ^ d2_e[53] ^ d2_e[54] ^ d2_e[55]
                          ^ d2_e[56]
                          ^ p2_e[3] ; 

assign q2_e[4] = d2_e[11] ^ d2_e[12] ^ d2_e[13] ^ d2_e[14] ^ d2_e[15]
                          ^ d2_e[16] ^ d2_e[17] ^ d2_e[18] ^ d2_e[19] ^ d2_e[20]
                          ^ d2_e[21] ^ d2_e[22] ^ d2_e[23] ^ d2_e[24] ^ d2_e[25]
                          ^ d2_e[41] ^ d2_e[42] ^ d2_e[43] ^ d2_e[44] ^ d2_e[45]
                          ^ d2_e[46] ^ d2_e[47] ^ d2_e[48] ^ d2_e[49] ^ d2_e[50]
                          ^ d2_e[51] ^ d2_e[52] ^ d2_e[53] ^ d2_e[54] ^ d2_e[55]
                          ^ d2_e[56]
                          ^ p2_e[4] ; 

assign q2_e[5] = d2_e[26] ^ d2_e[27] ^ d2_e[28] ^ d2_e[29] ^ d2_e[30] 
                          ^ d2_e[31] ^ d2_e[32] ^ d2_e[33] ^ d2_e[34] ^ d2_e[35]
                          ^ d2_e[36] ^ d2_e[37] ^ d2_e[38] ^ d2_e[39] ^ d2_e[40]
                          ^ d2_e[41] ^ d2_e[42] ^ d2_e[43] ^ d2_e[44] ^ d2_e[45]
                          ^ d2_e[46] ^ d2_e[47] ^ d2_e[48] ^ d2_e[49] ^ d2_e[50]
                          ^ d2_e[51] ^ d2_e[52] ^ d2_e[53] ^ d2_e[54] ^ d2_e[55]
                          ^ d2_e[56]  
                          ^ p2_e[5] ; 

assign q2_e[6] = d2_e[57] ^ d2_e[58] ^ d2_e[59] ^ d2_e[60] ^ d2_e[61] 
                          ^ d2_e[62] ^ d2_e[63]
                          ^ p2_e[6] ; 

assign rs2_parity_e = d2_e[0]  ^ d2_e[1]  ^ d2_e[2]  ^ d2_e[3]  ^ d2_e[4]
                          ^ d2_e[5]  ^ d2_e[6]  ^ d2_e[7]  ^ d2_e[8]  ^ d2_e[9]
                          ^ d2_e[10] ^ d2_e[11] ^ d2_e[12] ^ d2_e[13] ^ d2_e[14] 
                          ^ d2_e[15] ^ d2_e[16] ^ d2_e[17] ^ d2_e[18] ^ d2_e[19]
                          ^ d2_e[20] ^ d2_e[21] ^ d2_e[22] ^ d2_e[23] ^ d2_e[24]
                          ^ d2_e[25] ^ d2_e[26] ^ d2_e[27] ^ d2_e[28] ^ d2_e[29]
                          ^ d2_e[30] ^ d2_e[31] ^ d2_e[32] ^ d2_e[33] ^ d2_e[34]
                          ^ d2_e[35] ^ d2_e[36] ^ d2_e[37] ^ d2_e[38] ^ d2_e[39]
                          ^ d2_e[40] ^ d2_e[41] ^ d2_e[42] ^ d2_e[43] ^ d2_e[44]
                          ^ d2_e[45] ^ d2_e[46] ^ d2_e[47] ^ d2_e[48] ^ d2_e[49]
                          ^ d2_e[50] ^ d2_e[51] ^ d2_e[52] ^ d2_e[53] ^ d2_e[54]
                          ^ d2_e[55] ^ d2_e[56] ^ d2_e[57] ^ d2_e[58] ^ d2_e[59]
                          ^ d2_e[60] ^ d2_e[61] ^ d2_e[62] ^ d2_e[63]
                          ^ p2_e[0]  ^ p2_e[1]  ^ p2_e[2]  ^ p2_e[3]  ^ p2_e[4] 
                          ^ p2_e[5]  ^ p2_e[6]  ^ p2_e[7];


// Detection for RS3
// -----------------------------------
//sign rs3_ne_e = ~ect_rs3_valid_e |
//		  ~(rs3_parity_e | q3_e[6] | q3_e[5] | q3_e[4] | q3_e[3] | q3_e[2] | q3_e[1] | q3_e[0]);

assign rs3_ce_e =  ect_rs3_valid_e & rs3_parity_e;

assign rs3_ue_e =  ect_rs3_valid_e & ~rs3_parity_e & 
		   (q3_e[6] | q3_e[5] | q3_e[4] | q3_e[3] | q3_e[2] | q3_e[1] | q3_e[0]);

assign q3_e[0] = d3_e[0]  ^ d3_e[1]  ^ d3_e[3]  ^ d3_e[4]  ^ d3_e[6]  
                          ^ d3_e[8]  ^ d3_e[10] ^ d3_e[11] ^ d3_e[13] ^ d3_e[15]  
                          ^ d3_e[17] ^ d3_e[19] ^ d3_e[21] ^ d3_e[23] ^ d3_e[25]  
                          ^ d3_e[26] ^ d3_e[28] ^ d3_e[30] ^ d3_e[32] ^ d3_e[34] 
                          ^ d3_e[36] ^ d3_e[38] ^ d3_e[40] ^ d3_e[42] ^ d3_e[44]  
                          ^ d3_e[46] ^ d3_e[48] ^ d3_e[50] ^ d3_e[52] ^ d3_e[54]  
                          ^ d3_e[56] ^ d3_e[57] ^ d3_e[59] ^ d3_e[61] ^ d3_e[63]
		          ^ p3_e[0] ; 

assign q3_e[1] = d3_e[0]  ^ d3_e[2]  ^ d3_e[3]  ^ d3_e[5]  ^ d3_e[6]  
                          ^ d3_e[9]  ^ d3_e[10] ^ d3_e[12] ^ d3_e[13] ^ d3_e[16]  
                          ^ d3_e[17] ^ d3_e[20] ^ d3_e[21] ^ d3_e[24] ^ d3_e[25] 
                          ^ d3_e[27] ^ d3_e[28] ^ d3_e[31] ^ d3_e[32] ^ d3_e[35]
                          ^ d3_e[36] ^ d3_e[39] ^ d3_e[40] ^ d3_e[43] ^ d3_e[44]
                          ^ d3_e[47] ^ d3_e[48] ^ d3_e[51] ^ d3_e[52] ^ d3_e[55] 
                          ^ d3_e[56] ^ d3_e[58] ^ d3_e[59] ^ d3_e[62] ^ d3_e[63]
		          ^ p3_e[1] ; 

assign q3_e[2] = d3_e[1]  ^ d3_e[2]  ^ d3_e[3]  ^ d3_e[7]  ^ d3_e[8]  
                          ^ d3_e[9]  ^ d3_e[10] ^ d3_e[14] ^ d3_e[15] ^ d3_e[16]  
                          ^ d3_e[17] ^ d3_e[22] ^ d3_e[23] ^ d3_e[24] ^ d3_e[25]
                          ^ d3_e[29] ^ d3_e[30] ^ d3_e[31] ^ d3_e[32] ^ d3_e[37]  
                          ^ d3_e[38] ^ d3_e[39] ^ d3_e[40] ^ d3_e[45] ^ d3_e[46]
                          ^ d3_e[47] ^ d3_e[48] ^ d3_e[53] ^ d3_e[54] ^ d3_e[55] 
                          ^ d3_e[56] ^ d3_e[60] ^ d3_e[61] ^ d3_e[62] ^ d3_e[63]
		          ^ p3_e[2] ; 

assign q3_e[3] = d3_e[4]  ^ d3_e[5]  ^ d3_e[6]  ^ d3_e[7]  ^ d3_e[8]  
                          ^ d3_e[9]  ^ d3_e[10] ^ d3_e[18] ^ d3_e[19] ^ d3_e[20]  
                          ^ d3_e[21] ^ d3_e[22] ^ d3_e[23] ^ d3_e[24] ^ d3_e[25]
                          ^ d3_e[33] ^ d3_e[34] ^ d3_e[35] ^ d3_e[36] ^ d3_e[37]
                          ^ d3_e[38] ^ d3_e[39] ^ d3_e[40] ^ d3_e[49] ^ d3_e[50]
                          ^ d3_e[51] ^ d3_e[52] ^ d3_e[53] ^ d3_e[54] ^ d3_e[55]
                          ^ d3_e[56]
                          ^ p3_e[3] ; 

assign q3_e[4] = d3_e[11] ^ d3_e[12] ^ d3_e[13] ^ d3_e[14] ^ d3_e[15]
                          ^ d3_e[16] ^ d3_e[17] ^ d3_e[18] ^ d3_e[19] ^ d3_e[20]
                          ^ d3_e[21] ^ d3_e[22] ^ d3_e[23] ^ d3_e[24] ^ d3_e[25]
                          ^ d3_e[41] ^ d3_e[42] ^ d3_e[43] ^ d3_e[44] ^ d3_e[45]
                          ^ d3_e[46] ^ d3_e[47] ^ d3_e[48] ^ d3_e[49] ^ d3_e[50]
                          ^ d3_e[51] ^ d3_e[52] ^ d3_e[53] ^ d3_e[54] ^ d3_e[55]
                          ^ d3_e[56]
                          ^ p3_e[4] ; 

assign q3_e[5] = d3_e[26] ^ d3_e[27] ^ d3_e[28] ^ d3_e[29] ^ d3_e[30] 
                          ^ d3_e[31] ^ d3_e[32] ^ d3_e[33] ^ d3_e[34] ^ d3_e[35]
                          ^ d3_e[36] ^ d3_e[37] ^ d3_e[38] ^ d3_e[39] ^ d3_e[40]
                          ^ d3_e[41] ^ d3_e[42] ^ d3_e[43] ^ d3_e[44] ^ d3_e[45]
                          ^ d3_e[46] ^ d3_e[47] ^ d3_e[48] ^ d3_e[49] ^ d3_e[50]
                          ^ d3_e[51] ^ d3_e[52] ^ d3_e[53] ^ d3_e[54] ^ d3_e[55]
                          ^ d3_e[56]  
                          ^ p3_e[5] ; 

assign q3_e[6] = d3_e[57] ^ d3_e[58] ^ d3_e[59] ^ d3_e[60] ^ d3_e[61] 
                          ^ d3_e[62] ^ d3_e[63]
                          ^ p3_e[6] ; 

assign rs3_parity_e = d3_e[0]  ^ d3_e[1]  ^ d3_e[2]  ^ d3_e[3]  ^ d3_e[4]
                          ^ d3_e[5]  ^ d3_e[6]  ^ d3_e[7]  ^ d3_e[8]  ^ d3_e[9]
                          ^ d3_e[10] ^ d3_e[11] ^ d3_e[12] ^ d3_e[13] ^ d3_e[14] 
                          ^ d3_e[15] ^ d3_e[16] ^ d3_e[17] ^ d3_e[18] ^ d3_e[19]
                          ^ d3_e[20] ^ d3_e[21] ^ d3_e[22] ^ d3_e[23] ^ d3_e[24]
                          ^ d3_e[25] ^ d3_e[26] ^ d3_e[27] ^ d3_e[28] ^ d3_e[29]
                          ^ d3_e[30] ^ d3_e[31] ^ d3_e[32] ^ d3_e[33] ^ d3_e[34]
                          ^ d3_e[35] ^ d3_e[36] ^ d3_e[37] ^ d3_e[38] ^ d3_e[39]
                          ^ d3_e[40] ^ d3_e[41] ^ d3_e[42] ^ d3_e[43] ^ d3_e[44]
                          ^ d3_e[45] ^ d3_e[46] ^ d3_e[47] ^ d3_e[48] ^ d3_e[49]
                          ^ d3_e[50] ^ d3_e[51] ^ d3_e[52] ^ d3_e[53] ^ d3_e[54]
                          ^ d3_e[55] ^ d3_e[56] ^ d3_e[57] ^ d3_e[58] ^ d3_e[59]
                          ^ d3_e[60] ^ d3_e[61] ^ d3_e[62] ^ d3_e[63]
                          ^ p3_e[0]  ^ p3_e[1]  ^ p3_e[2]  ^ p3_e[3]  ^ p3_e[4] 
                          ^ p3_e[5]  ^ p3_e[6]  ^ p3_e[7];



/////////////////////////////////////////////////////////////////////////////
// Operand selection for correction
//-----------------------------------
// - Only one operand can be corrected at a time
// - Selection based on hard coded priorty
//   - rs1 -> rs2 -> rs3
// - If no error, sel defaults to rs3
//
// NOTE: Doing operand selection in E stage adds timing pressure to E stage,
//       but saves about 150 flops.
//
//       If this does not make cycle time, need to pass sel signal to M stage,
//       must protect sel with rst_tri_en to ensure one-hot property.
//       
// - critical path1 is from (d1_e -> q1_e -> rs1_ne_e -> rs_to_correct)
//   
//   (d1_e->q1_e): xor3(fo1) -> xor3(fo1) -> xor2(fo1) -> xor2(fo4)  => 245ps
//   (q1_e -> rs1_ne_e): 
//                 nand3(fo1) -> nand3(fo4) -> inv(fo4) -> nand2(fo4)=> 120ps
//   (rs1_ne_e -> rs_to_correct):  
//                 buffer(fo4)(4 levels) -> nand3(fo1) -> nand3(fo4) => 165ps
//                                                                  ---------  
//                                                                      530ps
//
// - critical path2 is (d1_e -> rs1_parity_e -> rs1_ne_e -> rs_to_correct)
//   
//   (d1_e -> rs1_parity_e): 
//                 xor3(fo1) -> xor3(fo1) -> xor3(fo1) -> xor3(fo4)  => 275ps
//   (rs1_parity_e -> rs1_ne_e): inv(fo4) -> nand3(fo4)              =>  55ps
//   (rs1_ne_e -> rs_to_correct)
//                 buffer(fo4)(4 levels) -> nand3(fo1) -> nand3(fo4) => 165ps
//                                                                  ---------  
//                                                                      495ps
//
/////////////////////////////////////////////////////////////////////////////


assign check_e[7:0]	= ({8{~rs1_ne_e            }} & {rs1_parity_e,q1_e[6:0]}) |
			  ({8{ rs1_ne_e & ~rs2_ne_e}} & {rs2_parity_e,q2_e[6:0]}) |
			  ({8{ rs1_ne_e &  rs2_ne_e}} & {rs3_parity_e,q3_e[6:0]});

assign addr_e[4:0]	= ({5{~rs1_ne_e            }} & ect_rs1_addr_e[4:0]) |
			  ({5{ rs1_ne_e & ~rs2_ne_e}} & ect_rs2_addr_e[4:0]) |
			  ({5{ rs1_ne_e &  rs2_ne_e}} & ect_rs3_addr_e[4:0]);


exu_ecc_ctl_msff_ctl_macro__width_8 check_e_to_m	 (
 .scan_in(check_e_to_m_scanin),
 .scan_out(check_e_to_m_scanout),
 .l1clk( l1clk_pm2		),
 .din  ( check_e[7:0]		),
 .dout ( exu_ecc_check_m[7:0]	),
  .siclk(siclk),
  .soclk(soclk));


exu_ecc_ctl_msff_ctl_macro__width_5 addr_e_to_m	 (
 .scan_in(addr_e_to_m_scanin),
 .scan_out(addr_e_to_m_scanout),
 .l1clk( l1clk_pm2		),
 .din  ( addr_e[4:0]		),
 .dout ( exu_ecc_addr_m[4:0]	),
  .siclk(siclk),
  .soclk(soclk));




// control signals for other blocks
// -------------------------------------------
assign cecc_e  = rs1_ce_e | (rs1_ne_e & rs2_ce_e) | (rs1_ne_e & rs2_ne_e & rs3_ce_e);
assign uecc_e  = rs1_ue_e | (rs1_ne_e & rs2_ue_e) | (rs1_ne_e & rs2_ne_e & rs3_ue_e);

assign ecc_ecc_e	=  ecc_enable_e & (uecc_e | cecc_e);
assign ecc_uecc_e	=  ecc_enable_e &  uecc_e;
assign ecc_cecc_e   	=  ecc_enable_e &  cecc_e;

exu_ecc_ctl_msff_ctl_macro__width_3  ce_ue_ecc_flops  (
 .scan_in(ce_ue_ecc_flops_scanin),
 .scan_out(ce_ue_ecc_flops_scanout),
 .l1clk( l1clk_pm2						),
 .din  ({ecc_ecc_e, ecc_cecc_e, ecc_uecc_e}	),
 .dout ({exu_ecc_m, exu_cecc_m, exu_uecc_m}	),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////////////////////////////////
//***************************************************************************
//***** ECC Generation ******************************************************
//***************************************************************************
/////////////////////////////////////////////////////////////////////////////
// ECC Generation
//-----------------------------------
// - Encode the 64-bit write data into an 8-bit Error Correction Code 
// - Encode is first done in two stages:
//   - IRF write happens in phase 2 of write stage
//   - ECC will take longer than phase 1 of write stage
//   - ECC logic will spill over to phase 2 of the stage before write.
//   - WARNING: this may change as we explore ways to speed up ECC generation
//  
//   din= d0  d1  d2  d3  d4  d5  d6  d7  d8  d9 d10 d11 d12 d13 d14 d15 
//   p0 =  x   x       x   x       x       x       x   x       x       x
//   p1 =  x       x   x       x   x           x   x       x   x
//   p2 =      x   x   x               x   x   x   x               x   x
//   p3 =                  x   x   x   x   x   x   x                       
//   p4 =                                              x   x   x   x   x
//   p5 =
//   p6 =
//   p7 =  x   x   x       x   x       x           x   x   x       x
//   -------------------------------------------------------------------
//   Total 3   3   3   3   3   3   3   3   3   3   5   3   3   3   3   3 
//   
//   din=d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 
//   p0 =      x       x       x       x       x   x       x       x    
//   p1 =  x   x           x   x           x   x       x   x           x
//   p2 =  x   x                   x   x   x   x               x   x   x
//   p3 =          x   x   x   x   x   x   x   x
//   p4 =  x   x   x   x   x   x   x   x   x   x
//   p5 =                                          x   x   x   x   x   x
//   p6 =                                          
//   p7 =      x   x           x       x   x       x   x       x    
//   -------------------------------------------------------------------
//   total 3   5   3   3   3   5   3   5   5   5   3   3   3   3   3   3
// 
//   din=d32 d33 d34 d35 d36 d37 d38 d39 d40 d41 d42 d43 d44 d45 d46 d47 
//   p0 =  x       x       x       x       x       x       x       x    
//   p1 =  x           x   x           x   x           x   x           x
//   p2 =  x                   x   x   x   x                   x   x   x
//   p3 =      x   x   x   x   x   x   x   x
//   p4 =                                      x   x   x   x   x   x   x
//   p5 =  x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x
//   p6 =                                         
//   p7 =  x   x           x       x   x       x           x       x   x
//   -------------------------------------------------------------------
//   total 5   3   3   3   5   3   5   5   5   3   3   3   5   3   5   5
// 
//   din=d48 d49 d50 d51 d52 d53 d54 d55 d56 d57 d58 d59 d60 d61 d62 d63 
//   p0 =  x       x       x       x       x   x       x       x       x
//   p1 =  x           x   x           x   x       x   x           x   x
//   p2 =  x                   x   x   x   x               x   x   x   x
//   p3 =      x   x   x   x   x   x   x   x
//   p4 =  x   x   x   x   x   x   x   x   x   
//   p5 =  x   x   x   x   x   x   x   x   x  
//   p6 =                                      x   x   x   x   x   x   x
//   p7 =          x   x       x           x   x   x       x           x
//   -------------------------------------------------------------------
//   total 5   3   5   5   5   5   5   5   7   3   3   3   3   3   3   5
// 
/////////////////////////////////////////////////////////////////////////////

// Error injection logic for ECC logic testing
// - inject error if it is enabled 
// - the 8-bit ecc_mask is only xored with W port, not W2 port
// - xor takes place as part of the W port ECC generation.

assign ecc_mask_b[7:0] = {8{ecc_mask_en_ff}} & ecc_mask_data_ff[7:0];


//  W port ECC Generation
// -------------------------------------------
// assign shorter name to w port write data to make later code more readable
assign w_d[63:0]         = edp_rd_ff_w[63:0];
assign ecc_w_synd_w[7:0] = ({8{~ect_mbist_sel}} & w_p_b[7:0]) | ({8{ ect_mbist_sel}} & mbi_write_data_p2[7:0]);


  // w_p_b[0]
  assign   w_p_b[0] = ((w_d[0]  ^ w_d[1])  ^ (w_d[3]  ^ w_d[4] )) ^
                      ((w_d[6]  ^ w_d[8])  ^ (w_d[10] ^ w_d[11])) ^ 
                      ((w_d[13] ^ w_d[15]) ^ (w_d[17] ^ w_d[19])) ^
                      ((w_d[21] ^ w_d[23]) ^ (w_d[25] ^ w_d[26])) ^
                      ((w_d[28] ^ w_d[30]) ^ (w_d[32] ^ w_d[34])) ^
                      ((w_d[36] ^ w_d[38]) ^ (w_d[40] ^ w_d[42])) ^
                      ((w_d[44] ^ w_d[46]) ^ (w_d[48] ^ w_d[50])) ^
                      ((w_d[52] ^ w_d[54]) ^ (w_d[56] ^ w_d[57])) ^
                      ((w_d[59] ^ w_d[61]) ^ (w_d[63] ^ ecc_mask_b[0])); 

  // w_p_b[1]
  assign   w_p_b[1] = ((w_d[0]  ^ w_d[2] ) ^ (w_d[3]  ^ w_d[5] )) ^  
                      ((w_d[6]  ^ w_d[9] ) ^ (w_d[10] ^ w_d[12])) ^
                      ((w_d[13] ^ w_d[16]) ^ (w_d[17] ^ w_d[20])) ^
                      ((w_d[21] ^ w_d[24]) ^ (w_d[25] ^ w_d[27])) ^
                      ((w_d[28] ^ w_d[31]) ^ (w_d[32] ^ w_d[35])) ^
                      ((w_d[36] ^ w_d[39]) ^ (w_d[40] ^ w_d[43])) ^
                      ((w_d[44] ^ w_d[47]) ^ (w_d[48] ^ w_d[51])) ^
                      ((w_d[52] ^ w_d[55]) ^ (w_d[56] ^ w_d[58])) ^
                      ((w_d[59] ^ w_d[62]) ^ (w_d[63] ^ ecc_mask_b[1]));

  // w_p_b[2]
  assign   w_p_b[2] = ((w_d[1]  ^ w_d[2] ) ^ (w_d[3]  ^ w_d[7] )) ^
                      ((w_d[8]  ^ w_d[9] ) ^ (w_d[10] ^ w_d[14])) ^
                      ((w_d[15] ^ w_d[16]) ^ (w_d[17] ^ w_d[22])) ^
                      ((w_d[23] ^ w_d[24]) ^ (w_d[25] ^ w_d[29])) ^
                      ((w_d[30] ^ w_d[31]) ^ (w_d[32] ^ w_d[37])) ^
                      ((w_d[38] ^ w_d[39]) ^ (w_d[40] ^ w_d[45])) ^
                      ((w_d[46] ^ w_d[47]) ^ (w_d[48] ^ w_d[53])) ^
                      ((w_d[54] ^ w_d[55]) ^ (w_d[56] ^ w_d[60])) ^
                      ((w_d[61] ^ w_d[62]) ^ (w_d[63] ^ ecc_mask_b[2]));
  
  // w_p_b[3]
  assign   w_p_b[3] = ((w_d[4]  ^ w_d[5] ) ^ (w_d[6]  ^ w_d[7] )) ^ 
                      ((w_d[8]  ^ w_d[9] ) ^ (w_d[10] ^ w_d[18])) ^ 
                      ((w_d[19] ^ w_d[20]) ^ (w_d[21] ^ w_d[22])) ^ 
                      ((w_d[23] ^ w_d[24]) ^ (w_d[25] ^ w_d[33])) ^ 
                      ((w_d[34] ^ w_d[35]) ^ (w_d[36] ^ w_d[37])) ^ 
                      ((w_d[38] ^ w_d[39]) ^ (w_d[40] ^ w_d[49])) ^ 
                      ((w_d[50] ^ w_d[51]) ^ (w_d[52] ^ w_d[53])) ^ 
                      ((w_d[54] ^ w_d[55]) ^ (w_d[56] ^ ecc_mask_b[3]));

  // w_p_b[4]
  assign   w_p_b[4] = ((w_d[11] ^ w_d[12]) ^ (w_d[13] ^ w_d[14])) ^
                      ((w_d[15] ^ w_d[16]) ^ (w_d[17] ^ w_d[18])) ^
                      ((w_d[19] ^ w_d[20]) ^ (w_d[21] ^ w_d[22])) ^
                      ((w_d[23] ^ w_d[24]) ^ (w_d[25] ^ w_d[41])) ^
                      ((w_d[42] ^ w_d[43]) ^ (w_d[44] ^ w_d[45])) ^
                      ((w_d[46] ^ w_d[47]) ^ (w_d[48] ^ w_d[49])) ^
                      ((w_d[50] ^ w_d[51]) ^ (w_d[52] ^ w_d[53])) ^
                      ((w_d[54] ^ w_d[55]) ^ (w_d[56] ^ ecc_mask_b[4])); 

  // w_p_b[5]
  assign   w_p_b[5] = ((w_d[26] ^ w_d[27]) ^ (w_d[28] ^ w_d[29])) ^
                      ((w_d[30] ^ w_d[31]) ^ (w_d[32] ^ w_d[33])) ^
                      ((w_d[34] ^ w_d[35]) ^ (w_d[36] ^ w_d[37])) ^
                      ((w_d[38] ^ w_d[39]) ^ (w_d[40] ^ w_d[41])) ^
                      ((w_d[42] ^ w_d[43]) ^ (w_d[44] ^ w_d[45])) ^
                      ((w_d[46] ^ w_d[47]) ^ (w_d[48] ^ w_d[49])) ^
                      ((w_d[50] ^ w_d[51]) ^ (w_d[52] ^ w_d[53])) ^
                      ((w_d[54] ^ w_d[55]) ^ (w_d[56] ^ ecc_mask_b[5])); 

  // w_p_b[6]
  assign   w_p_b[6] = ((w_d[57] ^ w_d[58]) ^ (w_d[59] ^ w_d[60])) ^
                      ((w_d[61] ^ w_d[62]) ^ (w_d[63] ^ ecc_mask_b[6])); 

  // w_p_b[7]
  assign   w_p_b[7] = ((w_d[0]  ^ w_d[1] ) ^ (w_d[2]  ^ w_d[4] )) ^
                      ((w_d[5]  ^ w_d[7] ) ^ (w_d[10] ^ w_d[11])) ^
                      ((w_d[12] ^ w_d[14]) ^ (w_d[17] ^ w_d[18])) ^
                      ((w_d[21] ^ w_d[23]) ^ (w_d[24] ^ w_d[26])) ^
                      ((w_d[27] ^ w_d[29]) ^ (w_d[32] ^ w_d[33])) ^
                      ((w_d[36] ^ w_d[38]) ^ (w_d[39] ^ w_d[41])) ^
                      ((w_d[44] ^ w_d[46]) ^ (w_d[47] ^ w_d[50])) ^
                      ((w_d[51] ^ w_d[53]) ^ (w_d[56] ^ w_d[57])) ^
                      ((w_d[58] ^ w_d[60]) ^ (w_d[63] ^ ecc_mask_b[7]));
       


//  W2 port ECC Generation
// -------------------------------------------
// assign shorter name to w port write data to make later code more readable
assign w2_d[63:0]         = edp_rd_ff_w2[63:0];
assign ecc_w2_synd_w2[7:0] = w2_p_w[7:0];


  // w2_p_w[0]
  assign   w2_p_w[0] = ((w2_d[0]  ^ w2_d[1])  ^ (w2_d[3]  ^ w2_d[4] )) ^
                       ((w2_d[6]  ^ w2_d[8])  ^ (w2_d[10] ^ w2_d[11])) ^ 
                       ((w2_d[13] ^ w2_d[15]) ^ (w2_d[17] ^ w2_d[19])) ^
                       ((w2_d[21] ^ w2_d[23]) ^ (w2_d[25] ^ w2_d[26])) ^
                       ((w2_d[28] ^ w2_d[30]) ^ (w2_d[32] ^ w2_d[34])) ^
                       ((w2_d[36] ^ w2_d[38]) ^ (w2_d[40] ^ w2_d[42])) ^
                       ((w2_d[44] ^ w2_d[46]) ^ (w2_d[48] ^ w2_d[50])) ^
                       ((w2_d[52] ^ w2_d[54]) ^ (w2_d[56] ^ w2_d[57])) ^
                       ((w2_d[59] ^ w2_d[61]) ^ (w2_d[63] ^ ecc_mask_b[0])); 

  // w2_p_w[1]
  assign   w2_p_w[1] = ((w2_d[0]  ^ w2_d[2] ) ^ (w2_d[3]  ^ w2_d[5] )) ^  
                       ((w2_d[6]  ^ w2_d[9] ) ^ (w2_d[10] ^ w2_d[12])) ^
                       ((w2_d[13] ^ w2_d[16]) ^ (w2_d[17] ^ w2_d[20])) ^
                       ((w2_d[21] ^ w2_d[24]) ^ (w2_d[25] ^ w2_d[27])) ^
                       ((w2_d[28] ^ w2_d[31]) ^ (w2_d[32] ^ w2_d[35])) ^
                       ((w2_d[36] ^ w2_d[39]) ^ (w2_d[40] ^ w2_d[43])) ^
                       ((w2_d[44] ^ w2_d[47]) ^ (w2_d[48] ^ w2_d[51])) ^
                       ((w2_d[52] ^ w2_d[55]) ^ (w2_d[56] ^ w2_d[58])) ^
                       ((w2_d[59] ^ w2_d[62]) ^ (w2_d[63] ^ ecc_mask_b[1]));

  // w2_p_w[2]
  assign   w2_p_w[2] = ((w2_d[1]  ^ w2_d[2] ) ^ (w2_d[3]  ^ w2_d[7] )) ^
                       ((w2_d[8]  ^ w2_d[9] ) ^ (w2_d[10] ^ w2_d[14])) ^
                       ((w2_d[15] ^ w2_d[16]) ^ (w2_d[17] ^ w2_d[22])) ^
                       ((w2_d[23] ^ w2_d[24]) ^ (w2_d[25] ^ w2_d[29])) ^
                       ((w2_d[30] ^ w2_d[31]) ^ (w2_d[32] ^ w2_d[37])) ^
                       ((w2_d[38] ^ w2_d[39]) ^ (w2_d[40] ^ w2_d[45])) ^
                       ((w2_d[46] ^ w2_d[47]) ^ (w2_d[48] ^ w2_d[53])) ^
                       ((w2_d[54] ^ w2_d[55]) ^ (w2_d[56] ^ w2_d[60])) ^
                       ((w2_d[61] ^ w2_d[62]) ^ (w2_d[63] ^ ecc_mask_b[2]));
  
  // w2_p_w[3]
  assign   w2_p_w[3] = ((w2_d[4]  ^ w2_d[5] ) ^ (w2_d[6]  ^ w2_d[7] )) ^ 
                       ((w2_d[8]  ^ w2_d[9] ) ^ (w2_d[10] ^ w2_d[18])) ^ 
                       ((w2_d[19] ^ w2_d[20]) ^ (w2_d[21] ^ w2_d[22])) ^ 
                       ((w2_d[23] ^ w2_d[24]) ^ (w2_d[25] ^ w2_d[33])) ^ 
                       ((w2_d[34] ^ w2_d[35]) ^ (w2_d[36] ^ w2_d[37])) ^ 
                       ((w2_d[38] ^ w2_d[39]) ^ (w2_d[40] ^ w2_d[49])) ^ 
                       ((w2_d[50] ^ w2_d[51]) ^ (w2_d[52] ^ w2_d[53])) ^ 
                       ((w2_d[54] ^ w2_d[55]) ^ (w2_d[56] ^ ecc_mask_b[3]));

  // w2_p_w[4]
  assign   w2_p_w[4] = ((w2_d[11] ^ w2_d[12]) ^ (w2_d[13] ^ w2_d[14])) ^
                       ((w2_d[15] ^ w2_d[16]) ^ (w2_d[17] ^ w2_d[18])) ^
                       ((w2_d[19] ^ w2_d[20]) ^ (w2_d[21] ^ w2_d[22])) ^
                       ((w2_d[23] ^ w2_d[24]) ^ (w2_d[25] ^ w2_d[41])) ^
                       ((w2_d[42] ^ w2_d[43]) ^ (w2_d[44] ^ w2_d[45])) ^
                       ((w2_d[46] ^ w2_d[47]) ^ (w2_d[48] ^ w2_d[49])) ^
                       ((w2_d[50] ^ w2_d[51]) ^ (w2_d[52] ^ w2_d[53])) ^
                       ((w2_d[54] ^ w2_d[55]) ^ (w2_d[56] ^ ecc_mask_b[4])); 

  // w2_p_w[5]
  assign   w2_p_w[5] = ((w2_d[26] ^ w2_d[27]) ^ (w2_d[28] ^ w2_d[29])) ^
                       ((w2_d[30] ^ w2_d[31]) ^ (w2_d[32] ^ w2_d[33])) ^
                       ((w2_d[34] ^ w2_d[35]) ^ (w2_d[36] ^ w2_d[37])) ^
                       ((w2_d[38] ^ w2_d[39]) ^ (w2_d[40] ^ w2_d[41])) ^
                       ((w2_d[42] ^ w2_d[43]) ^ (w2_d[44] ^ w2_d[45])) ^
                       ((w2_d[46] ^ w2_d[47]) ^ (w2_d[48] ^ w2_d[49])) ^
                       ((w2_d[50] ^ w2_d[51]) ^ (w2_d[52] ^ w2_d[53])) ^
                       ((w2_d[54] ^ w2_d[55]) ^ (w2_d[56] ^ ecc_mask_b[5])); 

  // w2_p_w[6]
  assign   w2_p_w[6] = ((w2_d[57] ^ w2_d[58]) ^ (w2_d[59] ^ w2_d[60])) ^
                       ((w2_d[61] ^ w2_d[62]) ^ (w2_d[63] ^ ecc_mask_b[6])); 

  // w2_p_w[7]
  assign   w2_p_w[7] = ((w2_d[0]  ^ w2_d[1] ) ^ (w2_d[2]  ^ w2_d[4] )) ^
                       ((w2_d[5]  ^ w2_d[7] ) ^ (w2_d[10] ^ w2_d[11])) ^
                       ((w2_d[12] ^ w2_d[14]) ^ (w2_d[17] ^ w2_d[18])) ^
                       ((w2_d[21] ^ w2_d[23]) ^ (w2_d[24] ^ w2_d[26])) ^
                       ((w2_d[27] ^ w2_d[29]) ^ (w2_d[32] ^ w2_d[33])) ^
                       ((w2_d[36] ^ w2_d[38]) ^ (w2_d[39] ^ w2_d[41])) ^
                       ((w2_d[44] ^ w2_d[46]) ^ (w2_d[47] ^ w2_d[50])) ^
                       ((w2_d[51] ^ w2_d[53]) ^ (w2_d[56] ^ w2_d[57])) ^
                       ((w2_d[58] ^ w2_d[60]) ^ (w2_d[63] ^ ecc_mask_b[7]));



exu_ecc_ctl_spare_ctl_macro__num_4 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk));

       
supply0 vss;
supply1 vdd;

// fixscan start:
assign mbist_ff_scanin           = scan_in                  ;
assign debug_ff_scanin           = mbist_ff_scanout         ;
assign check_e_to_m_scanin       = debug_ff_scanout         ;
assign addr_e_to_m_scanin        = check_e_to_m_scanout     ;
assign ce_ue_ecc_flops_scanin    = addr_e_to_m_scanout      ;
assign spares_scanin             = ce_ue_ecc_flops_scanout  ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module exu_ecc_ctl_l1clkhdr_ctl_macro (
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

module exu_ecc_ctl_msff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_ecc_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_ecc_ctl_msff_ctl_macro__width_8 (
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

module exu_ecc_ctl_msff_ctl_macro__width_5 (
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

module exu_ecc_ctl_msff_ctl_macro__width_3 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module exu_ecc_ctl_spare_ctl_macro__num_4 (
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

