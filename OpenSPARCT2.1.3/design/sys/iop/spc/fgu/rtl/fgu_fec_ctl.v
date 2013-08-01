// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fec_ctl.v
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
module fgu_fec_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  mbi_frf_read_en, 
  mbi_wdata, 
  mbi_run, 
  fad_mbist_cmp64_fx1, 
  lsu_asi_error_inject, 
  scan_out, 
  fad_nombi_w2_result_fw, 
  fec_w1_ecc_inject_fb, 
  fec_w2_synd_fw, 
  fec_r1_ecc_fx1, 
  fec_mbist_wdata_1f, 
  fec_mbist_wdata_3f, 
  main_clken, 
  coreon_clken, 
  fac_frf_r1_addr_e, 
  fac_dec_valid_fx1, 
  fac_fgx_pdist_fx1, 
  fac_ecc_trap_en_fx1, 
  fac_r1_vld_fx1, 
  fac_r2_vld_fx1, 
  fad_r1_byp_hit_fx1, 
  fad_r2_byp_hit_fx1, 
  fpc_frf_store_vld_fx1, 
  dec_frf_r2_addr_d, 
  dec_frf_r1_32b_d, 
  dec_frf_r2_32b_d, 
  dec_frf_r1_odd32b_d, 
  dec_frf_r2_odd32b_d, 
  dec_flush_f1, 
  dec_flush_f2, 
  tlu_flush_fgu_b, 
  fad_rs1_fx1, 
  fad_rs2_fx1, 
  fad_i_parity_2e_fx1, 
  fad_i_parity_2o_fx1, 
  fad_i_parity_1e_fx1, 
  fad_i_parity_1o_fx1, 
  frf_r1_ecc_e, 
  frf_r2_ecc_e, 
  fgu_pdist_beat2_fx1, 
  fgu_ecc_addr_fx2, 
  fgu_ecc_check_fx2, 
  fgu_cecc_fx2, 
  fec_cecc_fx2, 
  fgu_uecc_fx2, 
  fec_uecc_fx2, 
  fgu_fst_ecc_error_fx2, 
  fgu_mbi_frf_fail);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk_pm2;
wire l1clk_pm1;
wire l1clk_sc;
wire spares_scanin;
wire spares_scanout;
wire rs1e_ecc_valid_fx1;
wire rs1o_ecc_valid_fx1;
wire rs2e_ecc_valid_fx1;
wire rs2o_ecc_valid_fx1;
wire frf_rs1_check_flops_e_fx1_scanin;
wire frf_rs1_check_flops_e_fx1_scanout;
wire [13:0] r1_ecc_check_fx1;
wire [13:0] r2_ecc_check_fx1;
wire [13:0] r1_ecc_check_fx2;
wire [13:0] r2_ecc_check_fx2;
wire frf_rs1_ecc_flops_e_fx1_scanin;
wire frf_rs1_ecc_flops_e_fx1_scanout;
wire pre_frf_fail;
wire mbist_frf_read_en_3f;
wire frf_rs2_ecc_flops_e_fx1_scanin;
wire frf_rs2_ecc_flops_e_fx1_scanout;
wire [13:0] r2_ecc_fx1;
wire [31:0] d1e;
wire [6:0] p1e;
wire [31:0] d1o;
wire [6:0] p1o;
wire [31:0] d2e;
wire [6:0] p2e;
wire [31:0] d2o;
wire [6:0] p2o;
wire rs1_ue_or_ce_fx1;
wire rs1e_ne;
wire rs1o_ne;
wire detect_ue_fx1;
wire rs1e_ue;
wire rs1o_ue;
wire rs2e_ue;
wire rs2o_ue;
wire detect_ce_fx1;
wire rs1e_ce;
wire rs1o_ce;
wire rs2e_ce;
wire rs2o_ce;
wire fst_ecc_error_fx1;
wire addr_flops_scanin;
wire addr_flops_scanout;
wire [4:0] r2_addr_e;
wire r1_32b_e;
wire r2_32b_e;
wire r1_odd32b_e;
wire r2_odd32b_e;
wire detect_ce_fx2;
wire detect_ue_fx2;
wire mbist_frf_read_en_1f;
wire mbist_frf_read_en_2f;
wire [7:0] mbist_wdata_2f;
wire [5:0] r1_expanded_addr_fx1;
wire [5:0] r2_expanded_addr_fx1;
wire [4:0] r1_addr_fx1;
wire [4:0] r2_addr_fx1;
wire r1_32b_fx1;
wire r2_32b_fx1;
wire r1_odd32b_fx1;
wire r2_odd32b_fx1;
wire fgx_pdist_fx2;
wire dec_valid_fx2;
wire dec_flush_fx2;
wire dec_flush_fx3;
wire frf_store_vld_fx2;
wire ecc_mask_global_en;
wire ecc_mask_frf_en;
wire [6:0] ecc_mask_data;
wire ecc_trap_en_fx2;
wire detect_ce_fx3;
wire detect_ue_fx3;
wire tlu_flush_fgu_fx3;
wire i_pdist_beat2_fx2;
wire mbist_run_1f;
wire rs1_ue_or_ce_fx2;
wire [5:0] r1_expanded_addr_fx2;
wire [5:0] r2_expanded_addr_fx2;
wire addr_flops2_scanin;
wire addr_flops2_scanout;
wire parity_1e;
wire [5:0] q1e;
wire parity_1o;
wire [5:0] q1o;
wire parity_2e;
wire [5:0] q2e;
wire parity_2o;
wire [5:0] q2o;
wire ce_ue_fec_flops_fx1_fx2_scanin;
wire ce_ue_fec_flops_fx1_fx2_scanout;
wire pdist_beat2_fx2;
wire frf_rd_vld_fx2;
wire [31:0] w2e;
wire [6:0] s2e;
wire [31:0] w2o;
wire [6:0] s2o;


// *** Global Inputs ***

input		l2clk;
input  		scan_in;
input  		tcu_pce_ov;		// scan signals
input  		spc_aclk;
input  		spc_bclk;
input           tcu_scan_en;
input           tcu_se_scancollar_out;
input           mbi_frf_read_en;        // MBIST
input    [7:0]  mbi_wdata;              // MBIST
input           mbi_run;                // MBIST
input           fad_mbist_cmp64_fx1;    // MBIST
input   [31:0]  lsu_asi_error_inject;   // [31]=global inject en, [24]=FRF inject en, [7:0]=mask

output 		scan_out;

// *** Generate ECC Local Inputs *** 

input 	[63:0]	fad_nombi_w2_result_fw;	// FRF w2 write data w/out mbist data muxed in

// *** Generate ECC Local Outputs *** 

output   [6:0]  fec_w1_ecc_inject_fb;   // ECC error injection
output	[13:0]	fec_w2_synd_fw;		// Generated ECC to FRF W2 port
output  [13:0]  fec_r1_ecc_fx1;         // ASI FRF ECC read data

output   [7:0]  fec_mbist_wdata_1f;     // MBIST
output   [7:0]  fec_mbist_wdata_3f;     // MBIST

// *** Check ECC Inputs *** 

input           main_clken;             // main clken
input           coreon_clken;           // controls all "free running" flops
input    [4:0]  fac_frf_r1_addr_e;
input           fac_dec_valid_fx1;
input           fac_fgx_pdist_fx1;      // PDIST
input           fac_ecc_trap_en_fx1;
input   [1:0] 	fac_r1_vld_fx1;         // FRF r1 read valid (unqualified)
input   [1:0] 	fac_r2_vld_fx1;         // FRF r2 read valid (unqualified)
input         	fad_r1_byp_hit_fx1;     // r1 is bypass data
input         	fad_r2_byp_hit_fx1;     // r2 is bypass data
input           fpc_frf_store_vld_fx1;

input   [4:0]   dec_frf_r2_addr_d;
input           dec_frf_r1_32b_d;       // FRF r1 is 32-bit source
input           dec_frf_r2_32b_d;       // FRF r2 is 32-bit source
input           dec_frf_r1_odd32b_d;    // FRF r1 is odd 32-bit source (32 LSBs)
input           dec_frf_r2_odd32b_d;    // FRF r2 is odd 32-bit source (32 LSBs) (incl. STF,STDF)
input           dec_flush_f1;           // flush fx2 (xmit in fx1/m)
input           dec_flush_f2;           // flush fx3 (xmit in fx2/b)
input           tlu_flush_fgu_b;        // flush fx3, non-load (xmit in fx2/b)

input  [63:0]	fad_rs1_fx1;		// Source register data bit
input  [63:0]	fad_rs2_fx1;		// - available at output of flop
input           fad_i_parity_2e_fx1;    // partial ECC check (parity portion), rs2 even
input           fad_i_parity_2o_fx1;    // partial ECC check (parity portion), rs2 odd
input           fad_i_parity_1e_fx1;    // partial ECC check (parity portion), rs1 even
input           fad_i_parity_1o_fx1;    // partial ECC check (parity portion), rs1 odd

input  [13:0]	frf_r1_ecc_e;		// Source register ECC bit 
input  [13:0]	frf_r2_ecc_e;		// - NOTE: E stage signal
					// - need to be flopped to Fx1
// *** Global Outputs ***

output          fgu_pdist_beat2_fx1;
output  [5:0]	fgu_ecc_addr_fx2;      	// FRF cecc/uecc address (6-bit reg number format)
output [13:0]   fgu_ecc_check_fx2;      // FRF ECC check bits {even[6:0],odd[6:0]}
output 		fgu_cecc_fx2;		// Flag: detected correctable ECC error
output 		fec_cecc_fx2;		// Flag: detected correctable ECC error
output 		fgu_uecc_fx2;		// Flag: detected uncorrectable ECC error
output 		fec_uecc_fx2;		// Flag: detected uncorrectable ECC error
output          fgu_fst_ecc_error_fx2;  // store float FRF ECC correctable/uncorrectable error

output          fgu_mbi_frf_fail;       // MBIST

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop   = 1'b0;
assign siclk  = spc_aclk;
assign soclk  = spc_bclk;
assign se     = tcu_scan_en;
// end scan


fgu_fec_ctl_l1clkhdr_ctl_macro clkgen_coreon (
  .l2clk(l2clk),
  .l1en (coreon_clken),
  .l1clk(l1clk_pm2),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fec_ctl_l1clkhdr_ctl_macro clkgen_main (
  .l2clk(l2clk),
  .l1en (main_clken),
  .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fec_ctl_l1clkhdr_ctl_macro clkgen_main_sco (
  .l2clk(l2clk),
  .l1en (main_clken),
  .se	(tcu_se_scancollar_out),
  .l1clk(l1clk_sc),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fec_ctl_spare_ctl_macro__num_2 spares  (  // spares: 13 gates + 1 flop for each "num"
  .scan_in(spares_scanin),
  .scan_out(spares_scanout),
  .l1clk(l1clk_pm2),
  .siclk(siclk),
  .soclk(soclk)
  );


/////////////////////////////////////////////////////////////////////////////
// ECC Error Dectection Logic
//-----------------------------
// - Regenerate ECC [5:0] and compare against retrived ECC
// - Check ECC [6] with parity
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
//
//       1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19
//      P0  P1  d0  P2  d1  d2  d3  P3  d4  d5  d6  d7  d8  d9 d10  P4 d11 d12 d13 
// p0 =  o   	 x       x       x       x       x       x       x       x       x
// p1 =      o   x           x   x           x   x           x   x           x   x
// p2 =     	     o   x   x   x      	     x   x   x   x     	          
// p3 =     	          	     o   x   x   x   x   x   x   x      	  
// p4 =     	          	          			     o   x   x   x
// p5 =     	          	          			         	  
// p6 =          x       x   x           x   x       x           x       x   x    
// --------------------------------------------------------------------------------
// Total 1   1   3   1   3   3   3   1   3   3   3   3   3   3   5   1   3   3   3
//   
//      20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38
//     d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25  P5 d26 d27 d28 d29 d30 d31 
// p0=       x       x       x       x       x       x       x       x       x    
// p1=           x   x           x   x           x   x           x   x           x
// p2=   x   x   x   x                   x   x   x   x                   x   x   x
// p3=                   x   x   x   x   x   x   x   x
// p4=   x   x   x   x   x   x   x   x   x   x   x   x
// p5=                                                   o   x   x   x   x   x   x
// p6=   x           x   x           x       x   x           x   x       x   
// --------------------------------------------------------------------------------
// Total 3   3   3   5   3   3   3   5   3   5   5   5   1   3   3   3   3   3   3
//
/////////////////////////////////////////////////////////////////////////////

// Calculating valid ECCs to check
// - (reading out of frf rs1 even word) & (rs1 is not bypass data)
// - (reading out of frf rs1 odd  word) & (rs1 is not bypass data)
// - (reading out of frf rs2 even word) & (rs2 is not bypass data)
// - (reading out of frf rs2 odd  word) & (rs2 is not bypass data)
// ---------------------------------------------------
assign rs1e_ecc_valid_fx1 = fac_r1_vld_fx1[1] & ~fad_r1_byp_hit_fx1;
assign rs1o_ecc_valid_fx1 = fac_r1_vld_fx1[0] & ~fad_r1_byp_hit_fx1;
assign rs2e_ecc_valid_fx1 = fac_r2_vld_fx1[1] & ~fad_r2_byp_hit_fx1;
assign rs2o_ecc_valid_fx1 = fac_r2_vld_fx1[0] & ~fad_r2_byp_hit_fx1;

fgu_fec_ctl_msff_ctl_macro__width_28  frf_rs1_check_flops_e_fx1  (
 .scan_in(frf_rs1_check_flops_e_fx1_scanin),
 .scan_out(frf_rs1_check_flops_e_fx1_scanout),
 .l1clk(l1clk_pm1),
 .din  ({r1_ecc_check_fx1[13:0], r2_ecc_check_fx1[13:0]}),
 .dout ({r1_ecc_check_fx2[13:0], r2_ecc_check_fx2[13:0]}),
  .siclk(siclk),
  .soclk(soclk));


fgu_fec_ctl_msff_ctl_macro__width_14  frf_rs1_ecc_flops_e_fx1  (
 .scan_in(frf_rs1_ecc_flops_e_fx1_scanin),
 .scan_out(frf_rs1_ecc_flops_e_fx1_scanout),
 .l1clk(l1clk_sc),
 .din  (frf_r1_ecc_e  [13:0]),
 .dout (fec_r1_ecc_fx1[13:0]),
  .siclk(siclk),
  .soclk(soclk));

assign pre_frf_fail =
  mbist_frf_read_en_3f &
  (~fad_mbist_cmp64_fx1 |
   ({fec_mbist_wdata_3f[6:0], fec_mbist_wdata_3f[6:0]} != fec_r1_ecc_fx1[13:0]));

fgu_fec_ctl_msff_ctl_macro__width_14  frf_rs2_ecc_flops_e_fx1  (
 .scan_in(frf_rs2_ecc_flops_e_fx1_scanin),
 .scan_out(frf_rs2_ecc_flops_e_fx1_scanout),
 .l1clk(l1clk_sc),
 .din  (frf_r2_ecc_e  [13:0] ),
 .dout (    r2_ecc_fx1[13:0] ),
  .siclk(siclk),
  .soclk(soclk));


// Rename nets for shorter expressions
// -----------------------------------------
assign d1e[31:0] = fad_rs1_fx1[63:32];
assign p1e[ 6:0] = fec_r1_ecc_fx1[13:7];

assign d1o[31:0] = fad_rs1_fx1[31:0];
assign p1o[ 6:0] = fec_r1_ecc_fx1[ 6:0];

assign d2e[31:0] = fad_rs2_fx1[63:32];
assign p2e[ 6:0] = r2_ecc_fx1[13:7];

assign d2o[31:0] = fad_rs2_fx1[31:0];
assign p2o[ 6:0] = r2_ecc_fx1[ 6:0];


// Overall error detected flags
// -----------------------------------------

// Priority: (1) rs1_ue (2) rs1_ce (3) rs2_ue (4) rs2_ce (5) rs3_ue (6) rs3_ce

assign rs1_ue_or_ce_fx1 = ~(rs1e_ne & rs1o_ne);

assign detect_ue_fx1 =
  (                    (rs1e_ue | rs1o_ue)) |
  (~rs1_ue_or_ce_fx1 & (rs2e_ue | rs2o_ue)) ;

assign detect_ce_fx1 =
  (                    (rs1e_ce | rs1o_ce) & ~detect_ue_fx1) |
  (~rs1_ue_or_ce_fx1 & (rs2e_ce | rs2o_ce) & ~detect_ue_fx1) ;

// Note: lsu doesn't care about qual w/ flush, store data is rs2 only, lsu doesn't care whether error is cecc or uecc
assign fst_ecc_error_fx1 =
  fac_ecc_trap_en_fx1   &
  fpc_frf_store_vld_fx1 &
  (rs2e_ue | rs2o_ue | rs2e_ce | rs2o_ce);

fgu_fec_ctl_msff_ctl_macro__width_76  addr_flops  (
 .scan_in(addr_flops_scanin),
 .scan_out(addr_flops_scanout),
 .l1clk(l1clk_pm1),
 .din  ({fac_frf_r1_addr_e[4:0],
                 r2_addr_e[4:0],
                 r1_32b_e,
                 r2_32b_e,
                 r1_odd32b_e,
                 r2_odd32b_e,
         fac_fgx_pdist_fx1,
         fac_dec_valid_fx1,
         dec_flush_f1,
	 dec_flush_f2,
         fpc_frf_store_vld_fx1,
         lsu_asi_error_inject[31],
         lsu_asi_error_inject[24],
         lsu_asi_error_inject[6:0],
         fac_ecc_trap_en_fx1,
         detect_ce_fx2,
         detect_ue_fx2,
         tlu_flush_fgu_b,
         fgu_pdist_beat2_fx1,
         mbi_frf_read_en,
         mbi_wdata[7:0],
         mbi_run,
         mbist_frf_read_en_1f,
         mbist_frf_read_en_2f,
         fec_mbist_wdata_1f[7:0],
             mbist_wdata_2f[7:0],
         pre_frf_fail,
             fst_ecc_error_fx1,
         rs1_ue_or_ce_fx1,
         r1_expanded_addr_fx1[5:0],
         r2_expanded_addr_fx1[5:0]}),
 .dout ({        r1_addr_fx1[4:0],
                 r2_addr_fx1[4:0],
                 r1_32b_fx1,
                 r2_32b_fx1,
                 r1_odd32b_fx1,
                 r2_odd32b_fx1,
             fgx_pdist_fx2,
         dec_valid_fx2,
         dec_flush_fx2,
	 dec_flush_fx3,
             frf_store_vld_fx2,
             ecc_mask_global_en,
             ecc_mask_frf_en,
             ecc_mask_data[6:0],
             ecc_trap_en_fx2,
         detect_ce_fx3,
         detect_ue_fx3,
         tlu_flush_fgu_fx3,
         i_pdist_beat2_fx2,
         mbist_frf_read_en_1f,
         fec_mbist_wdata_1f[7:0],
         mbist_run_1f,
         mbist_frf_read_en_2f,
         mbist_frf_read_en_3f,
             mbist_wdata_2f[7:0],
         fec_mbist_wdata_3f[7:0],
         fgu_mbi_frf_fail,
         fgu_fst_ecc_error_fx2,
         rs1_ue_or_ce_fx2,
         r1_expanded_addr_fx2[5:0],
         r2_expanded_addr_fx2[5:0]}),
  .siclk(siclk),
  .soclk(soclk));

fgu_fec_ctl_msff_ctl_macro__width_9  addr_flops2  (
 .scan_in(addr_flops2_scanin),
 .scan_out(addr_flops2_scanout),
 .l1clk(l1clk_pm2),
 .din  ({dec_frf_r2_addr_d[4:0],  // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_odd32b_d,     // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_odd32b_d}),   // requires free running clk or dec_fgu_decode_d en
 .dout ({        r2_addr_e[4:0],
                 r1_32b_e,
                 r2_32b_e,
                 r1_odd32b_e,
                 r2_odd32b_e}),
  .siclk(siclk),
  .soclk(soclk));

assign r1_expanded_addr_fx1[5:0] =  // expand addr to 6-bit reg number
  ({6{ r1_32b_fx1}} & {1'b0, r1_addr_fx1[3:0], r1_odd32b_fx1}) |
  ({6{~r1_32b_fx1}} & {      r1_addr_fx1[4:0], 1'b0         }) ;

assign r2_expanded_addr_fx1[5:0] =  // expand addr to 6-bit reg number
  ({6{ r2_32b_fx1}} & {1'b0, r2_addr_fx1[3:0], r2_odd32b_fx1}) |
  ({6{~r2_32b_fx1}} & {      r2_addr_fx1[4:0], 1'b0         }) ;

assign r1_ecc_check_fx1[13:0] = {parity_1e, q1e[5:0], parity_1o, q1o[5:0]};
assign r2_ecc_check_fx1[13:0] = {parity_2e, q2e[5:0], parity_2o, q2o[5:0]};

assign fgu_pdist_beat2_fx1 =
  dec_valid_fx2 &
  fgx_pdist_fx2 &
  ~dec_flush_fx2;

fgu_fec_ctl_msff_ctl_macro__width_2  ce_ue_fec_flops_fx1_fx2  (
 .scan_in(ce_ue_fec_flops_fx1_fx2_scanin),
 .scan_out(ce_ue_fec_flops_fx1_fx2_scanout),
 .l1clk(l1clk_pm1),
 .din  ({detect_ce_fx1, detect_ue_fx1}),
 .dout ({detect_ce_fx2, detect_ue_fx2}),
  .siclk(siclk),
  .soclk(soclk));

assign pdist_beat2_fx2 = i_pdist_beat2_fx2 & ~tlu_flush_fgu_fx3 & ~dec_flush_fx3;

assign frf_rd_vld_fx2 = (dec_valid_fx2 | frf_store_vld_fx2) & ~dec_flush_fx2;  // this eq. prevents FRF_ECC ASI diagnositc read from asserting fgu_{u,c}ecc_fx2

// For single source (or no source) fgu ops that read frf
// ensure that unneeded frf read port isn't enabled by DEC
// Note:
// dec_frf_store_d, dec_fsr_store_d   have rs2 only
// 0in custom -fire (fpc_frf_store_vld_fx1 & (|fac_r1_vld_fx1[1:0])) -message "Invalid FRF rs1 read enable during store"

assign fgu_cecc_fx2 =
  ecc_trap_en_fx2 &
  ((~pdist_beat2_fx2 & detect_ce_fx2 &  frf_rd_vld_fx2                 ) |
   ( pdist_beat2_fx2 & detect_ce_fx2 & ~(detect_ce_fx3 | detect_ue_fx3))  );  // pdist 2nd beat

assign fec_cecc_fx2 = fgu_cecc_fx2;  // for timing, isolate internal fgu sinks from external sinks

assign fgu_uecc_fx2 =
  ecc_trap_en_fx2 &
  ((~pdist_beat2_fx2 & detect_ue_fx2 &  frf_rd_vld_fx2                 ) |
   ( pdist_beat2_fx2 & detect_ue_fx2 & ~(detect_ce_fx3 | detect_ue_fx3))  );  // pdist 2nd beat

assign fec_uecc_fx2 = fgu_uecc_fx2;  // for timing, isolate internal fgu sinks from external sinks

assign fgu_ecc_addr_fx2[5:0] =
  ({6{ rs1_ue_or_ce_fx2}} & r1_expanded_addr_fx2[5:0]) |
  ({6{~rs1_ue_or_ce_fx2}} & r2_expanded_addr_fx2[5:0]) ;

assign fgu_ecc_check_fx2[13:0] =
  ({14{ rs1_ue_or_ce_fx2}} & r1_ecc_check_fx2[13:0]) |
  ({14{~rs1_ue_or_ce_fx2}} & r2_ecc_check_fx2[13:0]) ;

// 0in one_hot -var {rs1e_ne,rs1e_ce,rs1e_ue}
// 0in one_hot -var {rs1o_ne,rs1o_ce,rs1o_ue}
// 0in bits_on -max 1 -var {rs2e_ce,rs2e_ue}
// 0in bits_on -max 1 -var {rs2o_ce,rs2o_ue}

// Detection for RS1 even part [63:32]
// -----------------------------------

assign rs1e_ne = ~rs1e_ecc_valid_fx1 |
                     ~(parity_1e | q1e[5] | q1e[4] | q1e[3] | q1e[2] | q1e[1] | q1e[0]);

assign rs1e_ce = rs1e_ecc_valid_fx1 & parity_1e;

assign rs1e_ue = rs1e_ecc_valid_fx1 & ~parity_1e & 
	   	      (q1e[5] | q1e[4] | q1e[3] | q1e[2] | q1e[1] | q1e[0]);

assign q1e[0] = d1e[0]  ^ d1e[1]  ^ d1e[3]  ^ d1e[4]  ^ d1e[6]  
                        ^ d1e[8]  ^ d1e[10] ^ d1e[11] ^ d1e[13] ^ d1e[15]
                        ^ d1e[17] ^ d1e[19] ^ d1e[21] ^ d1e[23] ^ d1e[25] 
                        ^ d1e[26] ^ d1e[28] ^ d1e[30] ^ p1e[0];

assign q1e[1] = d1e[0]  ^ d1e[2]  ^ d1e[3]  ^ d1e[5]  ^ d1e[6] 
                        ^ d1e[9]  ^ d1e[10] ^ d1e[12] ^ d1e[13] ^ d1e[16]
                        ^ d1e[17] ^ d1e[20] ^ d1e[21] ^ d1e[24] ^ d1e[25]
                        ^ d1e[27] ^ d1e[28] ^ d1e[31] ^ p1e[1];

assign q1e[2] = d1e[1]  ^ d1e[2]  ^ d1e[3]  ^ d1e[7]  ^ d1e[8] 
                        ^ d1e[9]  ^ d1e[10] ^ d1e[14] ^ d1e[15] ^ d1e[16]
                        ^ d1e[17] ^ d1e[22] ^ d1e[23] ^ d1e[24] ^ d1e[25]
                        ^ d1e[29] ^ d1e[30] ^ d1e[31] ^ p1e[2];

assign q1e[3] = d1e[4]  ^ d1e[5]  ^ d1e[6]  ^ d1e[7]  ^ d1e[8]  
                        ^ d1e[9]  ^ d1e[10] ^ d1e[18] ^ d1e[19] ^ d1e[20]
                        ^ d1e[21] ^ d1e[22] ^ d1e[23] ^ d1e[24] ^ d1e[25]
                        ^ p1e[3];

assign q1e[4] = d1e[11] ^ d1e[12] ^ d1e[13] ^ d1e[14] ^ d1e[15] 
                        ^ d1e[16] ^ d1e[17] ^ d1e[18] ^ d1e[19] ^ d1e[20]
                        ^ d1e[21] ^ d1e[22] ^ d1e[23] ^ d1e[24] ^ d1e[25]
                        ^ p1e[4];

assign q1e[5] = d1e[26] ^ d1e[27] ^ d1e[28] ^ d1e[29] ^ d1e[30] ^ d1e[31]
                        ^ p1e[5];

assign parity_1e = fad_i_parity_1e_fx1 ^ p1e[0] ^ p1e[1] ^ p1e[2] ^ p1e[3] ^ p1e[4] ^ p1e[5] ^ p1e[6];


// Detection for RS1 odd part [31:00]
// -----------------------------------

assign rs1o_ne = ~rs1o_ecc_valid_fx1 |
                     ~(parity_1o | q1o[5] | q1o[4] | q1o[3] | q1o[2] | q1o[1] | q1o[0]);

assign rs1o_ce = rs1o_ecc_valid_fx1 & parity_1o;

assign rs1o_ue = rs1o_ecc_valid_fx1 & ~parity_1o & 
		      (q1o[5] | q1o[4] | q1o[3] | q1o[2] | q1o[1] | q1o[0]);

assign q1o[0] = d1o[0]  ^ d1o[1]  ^ d1o[3]  ^ d1o[4]  ^ d1o[6]  
                        ^ d1o[8]  ^ d1o[10] ^ d1o[11] ^ d1o[13] ^ d1o[15]
                        ^ d1o[17] ^ d1o[19] ^ d1o[21] ^ d1o[23] ^ d1o[25] 
                        ^ d1o[26] ^ d1o[28] ^ d1o[30] ^ p1o[0];

assign q1o[1] = d1o[0]  ^ d1o[2]  ^ d1o[3]  ^ d1o[5]  ^ d1o[6] 
                        ^ d1o[9]  ^ d1o[10] ^ d1o[12] ^ d1o[13] ^ d1o[16]
                        ^ d1o[17] ^ d1o[20] ^ d1o[21] ^ d1o[24] ^ d1o[25]
                        ^ d1o[27] ^ d1o[28] ^ d1o[31] ^ p1o[1];

assign q1o[2] = d1o[1]  ^ d1o[2]  ^ d1o[3]  ^ d1o[7]  ^ d1o[8] 
                        ^ d1o[9]  ^ d1o[10] ^ d1o[14] ^ d1o[15] ^ d1o[16]
                        ^ d1o[17] ^ d1o[22] ^ d1o[23] ^ d1o[24] ^ d1o[25]
                        ^ d1o[29] ^ d1o[30] ^ d1o[31] ^ p1o[2];

assign q1o[3] = d1o[4]  ^ d1o[5]  ^ d1o[6]  ^ d1o[7]  ^ d1o[8]  
                        ^ d1o[9]  ^ d1o[10] ^ d1o[18] ^ d1o[19] ^ d1o[20]
                        ^ d1o[21] ^ d1o[22] ^ d1o[23] ^ d1o[24] ^ d1o[25]
                        ^ p1o[3];

assign q1o[4] = d1o[11] ^ d1o[12] ^ d1o[13] ^ d1o[14] ^ d1o[15] 
                        ^ d1o[16] ^ d1o[17] ^ d1o[18] ^ d1o[19] ^ d1o[20]
                        ^ d1o[21] ^ d1o[22] ^ d1o[23] ^ d1o[24] ^ d1o[25]
                        ^ p1o[4];

assign q1o[5] = d1o[26] ^ d1o[27] ^ d1o[28] ^ d1o[29] ^ d1o[30] ^ d1o[31]
                        ^ p1o[5];

assign parity_1o = fad_i_parity_1o_fx1 ^ p1o[0] ^ p1o[1] ^ p1o[2] ^ p1o[3] ^ p1o[4] ^ p1o[5] ^ p1o[6];


// Detection for RS2 even part [63:32]
// -----------------------------------

assign rs2e_ce = rs2e_ecc_valid_fx1 & parity_2e;

assign rs2e_ue = rs2e_ecc_valid_fx1 & ~parity_2e & 
	   	      (q2e[5] | q2e[4] | q2e[3] | q2e[2] | q2e[1] | q2e[0]);

assign q2e[0] = d2e[0]  ^ d2e[1]  ^ d2e[3]  ^ d2e[4]  ^ d2e[6]  
                        ^ d2e[8]  ^ d2e[10] ^ d2e[11] ^ d2e[13] ^ d2e[15]
                        ^ d2e[17] ^ d2e[19] ^ d2e[21] ^ d2e[23] ^ d2e[25] 
                        ^ d2e[26] ^ d2e[28] ^ d2e[30] ^ p2e[0];

assign q2e[1] = d2e[0]  ^ d2e[2]  ^ d2e[3]  ^ d2e[5]  ^ d2e[6] 
                        ^ d2e[9]  ^ d2e[10] ^ d2e[12] ^ d2e[13] ^ d2e[16]
                        ^ d2e[17] ^ d2e[20] ^ d2e[21] ^ d2e[24] ^ d2e[25]
                        ^ d2e[27] ^ d2e[28] ^ d2e[31] ^ p2e[1];

assign q2e[2] = d2e[1]  ^ d2e[2]  ^ d2e[3]  ^ d2e[7]  ^ d2e[8] 
                        ^ d2e[9]  ^ d2e[10] ^ d2e[14] ^ d2e[15] ^ d2e[16]
                        ^ d2e[17] ^ d2e[22] ^ d2e[23] ^ d2e[24] ^ d2e[25]
                        ^ d2e[29] ^ d2e[30] ^ d2e[31] ^ p2e[2];

assign q2e[3] = d2e[4]  ^ d2e[5]  ^ d2e[6]  ^ d2e[7]  ^ d2e[8]  
                        ^ d2e[9]  ^ d2e[10] ^ d2e[18] ^ d2e[19] ^ d2e[20]
                        ^ d2e[21] ^ d2e[22] ^ d2e[23] ^ d2e[24] ^ d2e[25]
                        ^ p2e[3];

assign q2e[4] = d2e[11] ^ d2e[12] ^ d2e[13] ^ d2e[14] ^ d2e[15] 
                        ^ d2e[16] ^ d2e[17] ^ d2e[18] ^ d2e[19] ^ d2e[20]
                        ^ d2e[21] ^ d2e[22] ^ d2e[23] ^ d2e[24] ^ d2e[25]
                        ^ p2e[4];

assign q2e[5] = d2e[26] ^ d2e[27] ^ d2e[28] ^ d2e[29] ^ d2e[30] ^ d2e[31]
                        ^ p2e[5];

assign parity_2e = fad_i_parity_2e_fx1 ^ p2e[0] ^ p2e[1] ^ p2e[2] ^ p2e[3] ^ p2e[4] ^ p2e[5] ^ p2e[6];


// Detection for RS2 odd part [31:00]
// -----------------------------------

assign rs2o_ce = rs2o_ecc_valid_fx1 & parity_2o;

assign rs2o_ue = rs2o_ecc_valid_fx1 & ~parity_2o & 
		      (q2o[5] | q2o[4] | q2o[3] | q2o[2] | q2o[1] | q2o[0]);

assign q2o[0] = d2o[0]  ^ d2o[1]  ^ d2o[3]  ^ d2o[4]  ^ d2o[6]  
                        ^ d2o[8]  ^ d2o[10] ^ d2o[11] ^ d2o[13] ^ d2o[15]
                        ^ d2o[17] ^ d2o[19] ^ d2o[21] ^ d2o[23] ^ d2o[25] 
                        ^ d2o[26] ^ d2o[28] ^ d2o[30] ^ p2o[0];

assign q2o[1] = d2o[0]  ^ d2o[2]  ^ d2o[3]  ^ d2o[5]  ^ d2o[6] 
                        ^ d2o[9]  ^ d2o[10] ^ d2o[12] ^ d2o[13] ^ d2o[16]
                        ^ d2o[17] ^ d2o[20] ^ d2o[21] ^ d2o[24] ^ d2o[25]
                        ^ d2o[27] ^ d2o[28] ^ d2o[31] ^ p2o[1];

assign q2o[2] = d2o[1]  ^ d2o[2]  ^ d2o[3]  ^ d2o[7]  ^ d2o[8] 
                        ^ d2o[9]  ^ d2o[10] ^ d2o[14] ^ d2o[15] ^ d2o[16]
                        ^ d2o[17] ^ d2o[22] ^ d2o[23] ^ d2o[24] ^ d2o[25]
                        ^ d2o[29] ^ d2o[30] ^ d2o[31] ^ p2o[2];

assign q2o[3] = d2o[4]  ^ d2o[5]  ^ d2o[6]  ^ d2o[7]  ^ d2o[8]  
                        ^ d2o[9]  ^ d2o[10] ^ d2o[18] ^ d2o[19] ^ d2o[20]
                        ^ d2o[21] ^ d2o[22] ^ d2o[23] ^ d2o[24] ^ d2o[25]
                        ^ p2o[3];

assign q2o[4] = d2o[11] ^ d2o[12] ^ d2o[13] ^ d2o[14] ^ d2o[15] 
                        ^ d2o[16] ^ d2o[17] ^ d2o[18] ^ d2o[19] ^ d2o[20]
                        ^ d2o[21] ^ d2o[22] ^ d2o[23] ^ d2o[24] ^ d2o[25]
                        ^ p2o[4];

assign q2o[5] = d2o[26] ^ d2o[27] ^ d2o[28] ^ d2o[29] ^ d2o[30] ^ d2o[31]
                        ^ p2o[5];

assign parity_2o = fad_i_parity_2o_fx1 ^ p2o[0] ^ p2o[1] ^ p2o[2] ^ p2o[3] ^ p2o[4] ^ p2o[5] ^ p2o[6];


/////////////////////////////////////////////////////////////////////////////
//***************************************************************************
//***** ECC Generation ******************************************************
//***************************************************************************
/////////////////////////////////////////////////////////////////////////////
// W2 ECC Generation
//-----------------------------------
// - Encode the two 32-bit write data into two 7-bit Error Correction Code 
// - Trying to do encoding in one phase:
//   - FRF write happens in phase 2 of write stage
//   - If ECC takes longer than phase 1 of write stage, it could spill 
//     over to phase 2 of the stage before write.
// - W1 ECC generation is performed in FAD
//
/////////////////////////////////////////////////////////////////////////////

assign fec_w1_ecc_inject_fb[6:0] = ({7{ecc_mask_global_en & ecc_mask_frf_en}} & ecc_mask_data[6:0]);

// W2 port even word [63:32] ECC Generation
// ========================================
assign w2e[31:0] = fad_nombi_w2_result_fw[63:32];
assign fec_w2_synd_fw[13:7] =
  (s2e[6:0] & {7{~mbist_run_1f}}) ^
  (({7{ecc_mask_global_en & ecc_mask_frf_en & ~mbist_run_1f}} & ecc_mask_data[6:0]     ) |
   ({7{                                        mbist_run_1f}} & fec_mbist_wdata_1f[6:0])  );

assign s2e[0] = w2e[0]  ^ w2e[1]  ^ w2e[3]  ^ w2e[4]  ^ w2e[6]  
			  ^ w2e[8]  ^ w2e[10] ^ w2e[11] ^ w2e[13] ^ w2e[15]
			  ^ w2e[17] ^ w2e[19] ^ w2e[21] ^ w2e[23] ^ w2e[25] 
			  ^ w2e[26] ^ w2e[28] ^ w2e[30];

assign s2e[1] = w2e[0]  ^ w2e[2]  ^ w2e[3]  ^ w2e[5]  ^ w2e[6] 
			  ^ w2e[9]  ^ w2e[10] ^ w2e[12] ^ w2e[13] ^ w2e[16]
			  ^ w2e[17] ^ w2e[20] ^ w2e[21] ^ w2e[24] ^ w2e[25]
			  ^ w2e[27] ^ w2e[28] ^ w2e[31];

assign s2e[2] = w2e[1]  ^ w2e[2]  ^ w2e[3]  ^ w2e[7]  ^ w2e[8] 
			  ^ w2e[9]  ^ w2e[10] ^ w2e[14] ^ w2e[15] ^ w2e[16]
			  ^ w2e[17] ^ w2e[22] ^ w2e[23] ^ w2e[24] ^ w2e[25]
			  ^ w2e[29] ^ w2e[30] ^ w2e[31];

assign s2e[3] = w2e[4]  ^ w2e[5]  ^ w2e[6]  ^ w2e[7]  ^ w2e[8]  
			  ^ w2e[9]  ^ w2e[10] ^ w2e[18] ^ w2e[19] ^ w2e[20]
			  ^ w2e[21] ^ w2e[22] ^ w2e[23] ^ w2e[24] ^ w2e[25];

assign s2e[4] = w2e[11] ^ w2e[12] ^ w2e[13] ^ w2e[14] ^ w2e[15] 
			  ^ w2e[16] ^ w2e[17] ^ w2e[18] ^ w2e[19] ^ w2e[20]
			  ^ w2e[21] ^ w2e[22] ^ w2e[23] ^ w2e[24] ^ w2e[25];

assign s2e[5] = w2e[26] ^ w2e[27] ^ w2e[28] ^ w2e[29] ^ w2e[30] ^ w2e[31];

assign s2e[6] = w2e[0]  ^ w2e[1]  ^ w2e[2]  ^ w2e[4]  ^ w2e[5] 
			  ^ w2e[7]  ^ w2e[10] ^ w2e[11] ^ w2e[12] ^ w2e[14] 
			  ^ w2e[17] ^ w2e[18] ^ w2e[21] ^ w2e[23] ^ w2e[24] 
			  ^ w2e[26] ^ w2e[27] ^ w2e[29];


// W2 port odd word [31:00] ECC Generation
// ========================================
assign w2o[31:0] = fad_nombi_w2_result_fw[31:0];
assign fec_w2_synd_fw[6:0] =
  (s2o[6:0] & {7{~mbist_run_1f}}) ^
  (({7{ecc_mask_global_en & ecc_mask_frf_en & ~mbist_run_1f}} & ecc_mask_data[6:0]     ) |
   ({7{                                        mbist_run_1f}} & fec_mbist_wdata_1f[6:0])  );

assign s2o[0] = w2o[0]  ^ w2o[1]  ^ w2o[3]  ^ w2o[4]  ^ w2o[6]  
			  ^ w2o[8]  ^ w2o[10] ^ w2o[11] ^ w2o[13] ^ w2o[15]
			  ^ w2o[17] ^ w2o[19] ^ w2o[21] ^ w2o[23] ^ w2o[25] 
			  ^ w2o[26] ^ w2o[28] ^ w2o[30];

assign s2o[1] = w2o[0]  ^ w2o[2]  ^ w2o[3]  ^ w2o[5]  ^ w2o[6] 
			  ^ w2o[9]  ^ w2o[10] ^ w2o[12] ^ w2o[13] ^ w2o[16]
			  ^ w2o[17] ^ w2o[20] ^ w2o[21] ^ w2o[24] ^ w2o[25]
			  ^ w2o[27] ^ w2o[28] ^ w2o[31];

assign s2o[2] = w2o[1]  ^ w2o[2]  ^ w2o[3]  ^ w2o[7]  ^ w2o[8] 
			  ^ w2o[9]  ^ w2o[10] ^ w2o[14] ^ w2o[15] ^ w2o[16]
			  ^ w2o[17] ^ w2o[22] ^ w2o[23] ^ w2o[24] ^ w2o[25]
			  ^ w2o[29] ^ w2o[30] ^ w2o[31];

assign s2o[3] = w2o[4]  ^ w2o[5]  ^ w2o[6]  ^ w2o[7]  ^ w2o[8]  
			  ^ w2o[9]  ^ w2o[10] ^ w2o[18] ^ w2o[19] ^ w2o[20]
			  ^ w2o[21] ^ w2o[22] ^ w2o[23] ^ w2o[24] ^ w2o[25];

assign s2o[4] = w2o[11] ^ w2o[12] ^ w2o[13] ^ w2o[14] ^ w2o[15] 
			  ^ w2o[16] ^ w2o[17] ^ w2o[18] ^ w2o[19] ^ w2o[20]
			  ^ w2o[21] ^ w2o[22] ^ w2o[23] ^ w2o[24] ^ w2o[25];

assign s2o[5] = w2o[26] ^ w2o[27] ^ w2o[28] ^ w2o[29] ^ w2o[30] ^ w2o[31];

assign s2o[6] = w2o[0]  ^ w2o[1]  ^ w2o[2]  ^ w2o[4]  ^ w2o[5] 
			  ^ w2o[7]  ^ w2o[10] ^ w2o[11] ^ w2o[12] ^ w2o[14] 
			  ^ w2o[17] ^ w2o[18] ^ w2o[21] ^ w2o[23] ^ w2o[24] 
			  ^ w2o[26] ^ w2o[27] ^ w2o[29];


supply0 vss;
supply1 vdd;
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign frf_rs1_check_flops_e_fx1_scanin = spares_scanout           ;
assign frf_rs1_ecc_flops_e_fx1_scanin = frf_rs1_check_flops_e_fx1_scanout;
assign frf_rs2_ecc_flops_e_fx1_scanin = frf_rs1_ecc_flops_e_fx1_scanout;
assign addr_flops_scanin         = frf_rs2_ecc_flops_e_fx1_scanout;
assign addr_flops2_scanin        = addr_flops_scanout       ;
assign ce_ue_fec_flops_fx1_fx2_scanin = addr_flops2_scanout      ;
assign scan_out                  = ce_ue_fec_flops_fx1_fx2_scanout;
// fixscan end:
endmodule  // fgu_fec_ctl






// any PARAMS parms go into naming of macro

module fgu_fec_ctl_l1clkhdr_ctl_macro (
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


module fgu_fec_ctl_spare_ctl_macro__num_2 (
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

module fgu_fec_ctl_msff_ctl_macro__width_28 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [27:0] fdin;
wire [26:0] so;

  input [27:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [27:0] dout;
  output scan_out;
assign fdin[27:0] = din[27:0];






dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fec_ctl_msff_ctl_macro__width_14 (
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

module fgu_fec_ctl_msff_ctl_macro__width_76 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [75:0] fdin;
wire [74:0] so;

  input [75:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [75:0] dout;
  output scan_out;
assign fdin[75:0] = din[75:0];






dff #(76)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[75:0]),
.si({scan_in,so[74:0]}),
.so({so[74:0],scan_out}),
.q(dout[75:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fec_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fec_ctl_msff_ctl_macro__width_2 (
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








