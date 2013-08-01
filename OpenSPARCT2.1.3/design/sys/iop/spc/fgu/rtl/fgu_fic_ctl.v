// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fic_ctl.v
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
module fgu_fic_ctl (
  fpf_rs2_cmp_din_fx1, 
  fpf_ma_sum_fx4, 
  fpf_man_se_byte_fx3_b38_32, 
  fpf_man_se_byte_fx3_b6_0, 
  fic_norm_eadj_fx5, 
  fic_i2f_align_sel_fx2, 
  fpe_align_sel_fx2, 
  fic_i2f_eadj_fx2, 
  fpc_lzd_override_fx4, 
  fpc_sp_source_fx3, 
  fic_mulscc_iccz_fx4, 
  fic_mulscc_xccz_fx4, 
  fic_convert_sticky_fx4, 
  fic_fxtod_sticky_fx4, 
  fic_ftoi_nx_fx4, 
  fic_ftox_nx_fx4, 
  fic_bzf31msb_fx2, 
  fic_bzf32lsb_fx2, 
  fic_bof22msb_fx2, 
  main_clken, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk_pm1;
wire spares_scanin;
wire spares_scanout;
wire bzf31msb_fx1;
wire bzf32lsb_fx1;
wire bof22msb_fx1;
wire [7:2] dpint_nx_byte_fx1;
wire [7:6] spint_nx_byte_fx1;
wire [63:1] dini;
wire [6:0] ibyte_sel;
wire ib0_nor_76;
wire ib0_nor_54;
wire ib0_zeroh_l;
wire [1:0] ib0_cnth;
wire [1:0] ib0_cntl;
wire [2:0] eadj_ibyte0;
wire ib1_nor_76;
wire ib1_nor_54;
wire ib1_zeroh_l;
wire [1:0] ib1_cnth;
wire [1:0] ib1_cntl;
wire [2:0] eadj_ibyte1;
wire ib2_nor_76;
wire ib2_nor_54;
wire ib2_zeroh_l;
wire [1:0] ib2_cnth;
wire [1:0] ib2_cntl;
wire [2:0] eadj_ibyte2;
wire ib3_nor_76;
wire ib3_nor_54;
wire ib3_zeroh_l;
wire [1:0] ib3_cnth;
wire [1:0] ib3_cntl;
wire [2:0] eadj_ibyte3;
wire ib4_nor_76;
wire ib4_nor_54;
wire ib4_zeroh_l;
wire [1:0] ib4_cnth;
wire [1:0] ib4_cntl;
wire [2:0] eadj_ibyte4;
wire ib5_nor_76;
wire ib5_nor_54;
wire ib5_zeroh_l;
wire [1:0] ib5_cnth;
wire [1:0] ib5_cntl;
wire [2:0] eadj_ibyte5;
wire ib6_nor_76;
wire ib6_nor_54;
wire ib6_zeroh_l;
wire [1:0] ib6_cnth;
wire [1:0] ib6_cntl;
wire [2:0] eadj_ibyte6;
wire ib7_nor_76;
wire ib7_nor_54;
wire ib7_zeroh_l;
wire [1:0] ib7_cnth;
wire [1:0] ib7_cntl;
wire [2:0] eadj_ibyte7;
wire [7:0] i2f_eadj_sel_fx1;
wire fx2_00_scanin;
wire fx2_00_scanout;
wire [7:2] dpint_nx_byte_fx2;
wire [7:6] spint_nx_byte_fx2;
wire [7:0] i2f_eadj_sel_fx2;
wire [2:0] eadj_ibyte0_fx2;
wire [2:0] eadj_ibyte1_fx2;
wire [2:0] eadj_ibyte2_fx2;
wire [2:0] eadj_ibyte3_fx2;
wire [2:0] eadj_ibyte4_fx2;
wire [2:0] eadj_ibyte5_fx2;
wire [2:0] eadj_ibyte6_fx2;
wire [2:0] eadj_ibyte7_fx2;
wire fx3_00_scanin;
wire fx3_00_scanout;
wire [5:0] align_sel_fx3;
wire [7:2] dpint_nx_byte_fx3;
wire [7:6] spint_nx_byte_fx3;
wire fstoi_nx_byte_fx3;
wire fstox_nx_byte_fx3;
wire fdtoi_nx_byte_fx3;
wire fdtox_nx_byte_fx3;
wire ftox_nx_bit_fx3;
wire ftoi_nx_bit_fx3;
wire ftoi_nx_fx3;
wire ftox_nx_fx3;
wire fx4_00_scanin;
wire fx4_00_scanout;
wire [63:11] dina;
wire shift_00;
wire [6:0] nbyte_sel;
wire ab0_nor_76;
wire ab0_nor_54;
wire ab0_zeroh_l;
wire [1:0] ab0_cnth;
wire [1:0] ab0_cntl;
wire [2:0] eadj_nbyte0;
wire ab1_nor_76;
wire ab1_nor_54;
wire ab1_zeroh_l;
wire [1:0] ab1_cnth;
wire [1:0] ab1_cntl;
wire [2:0] eadj_nbyte1;
wire ab2_nor_76;
wire ab2_nor_54;
wire ab2_zeroh_l;
wire [1:0] ab2_cnth;
wire [1:0] ab2_cntl;
wire [2:0] eadj_nbyte2;
wire ab3_nor_76;
wire ab3_nor_54;
wire ab3_zeroh_l;
wire [1:0] ab3_cnth;
wire [1:0] ab3_cntl;
wire [2:0] eadj_nbyte3;
wire ab4_nor_76;
wire ab4_nor_54;
wire ab4_zeroh_l;
wire [1:0] ab4_cnth;
wire [1:0] ab4_cntl;
wire [2:0] eadj_nbyte4;
wire ab5_nor_76;
wire ab5_nor_54;
wire ab5_zeroh_l;
wire [1:0] ab5_cnth;
wire [1:0] ab5_cntl;
wire [2:0] eadj_nbyte5;
wire ab6_nor_76;
wire ab6_nor_54;
wire ab6_zeroh_l;
wire [1:0] ab6_cnth;
wire [0:0] ab6_cntl;
wire [2:0] eadj_nbyte6;
wire [5:0] norm_eadj_fx4;
wire fx5_00_scanin;
wire fx5_00_scanout;



// ----------------------------------------------------------------------------
// Interface with FPF
// ----------------------------------------------------------------------------

input   [63:0] fpf_rs2_cmp_din_fx1;    // rt. justified rs2 for FiTO(s,d)
input   [63:0] fpf_ma_sum_fx4;
input  [38:32] fpf_man_se_byte_fx3_b38_32;
input    [6:0] fpf_man_se_byte_fx3_b6_0;
output   [5:0] fic_norm_eadj_fx5;
output   [5:0] fic_i2f_align_sel_fx2;

// ----------------------------------------------------------------------------
// Interface with FPE
// ----------------------------------------------------------------------------

input    [5:0] fpe_align_sel_fx2;
output   [5:0] fic_i2f_eadj_fx2;

// ----------------------------------------------------------------------------
// Interface with FPC
// ----------------------------------------------------------------------------

input          fpc_lzd_override_fx4;
input          fpc_sp_source_fx3;
output         fic_mulscc_iccz_fx4;
output         fic_mulscc_xccz_fx4;
output         fic_convert_sticky_fx4; // sticky for FxTOs, FiTOs, FdTOs
output         fic_fxtod_sticky_fx4;   // sticky for FxTOd
output         fic_ftoi_nx_fx4;        // inexact for FsTOi, FdTOi
output         fic_ftox_nx_fx4;        // inexact for FsTOx, FdTOx
output         fic_bzf31msb_fx2;       // rs2 frac 31 MSBs all zeros
output         fic_bzf32lsb_fx2;       // rs2 frac 32 LSBs all zeros
output         fic_bof22msb_fx2;       // rs2 frac 22 MSBs all ones

// ----------------------------------------------------------------------------
// Interface with FAC
// ----------------------------------------------------------------------------

input          main_clken;             // main clken

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input  		scan_in;
input  		tcu_pce_ov;		// scan signals
input  		spc_aclk;
input  		spc_bclk;
input           tcu_scan_en;
output 		scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop   = 1'b0;
assign siclk  = spc_aclk;
assign soclk  = spc_bclk;
assign se     = tcu_scan_en;
// end scan


fgu_fic_ctl_l1clkhdr_ctl_macro clkgen_main (
  .l2clk(l2clk),
  .l1en (main_clken),
  .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fic_ctl_spare_ctl_macro__num_2 spares  (  // spares: 13 gates + 1 flop for each "num"
  .scan_in(spares_scanin),
  .scan_out(spares_scanout),
  .l1clk(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
  );


// ----------------------------------------------------------------------------
//                               FX1 stage
// ----------------------------------------------------------------------------

// required for FdTOi large_maxint_result calculation
assign  bzf31msb_fx1 = ~(|fpf_rs2_cmp_din_fx1[51:21]);  // frac 31 MSBs all zeros

// required for FiTO(s,d) zero_src_result calculation
// fpf_rs2_cmp_din_fx1 is rt. justified for FiTO(s,d)
// fpf_bzf_fx1 doesn't work for FiTO(s,d) zero detection because 32 LSBs are unknown
assign  bzf32lsb_fx1 = ~(|fpf_rs2_cmp_din_fx1[31:0]);   // int32        all zeros

// required for FdTOs denorm round to norm detection
assign  bof22msb_fx1 =   &fpf_rs2_cmp_din_fx1[51:30];   // frac 22 MSBs all ones

// ------------------------------------
// F(s,d)TO(i,x) inexact detection (byte)
// ------------------------------------

assign  dpint_nx_byte_fx1[7] = |fpf_rs2_cmp_din_fx1[44:37];
assign  dpint_nx_byte_fx1[6] = |fpf_rs2_cmp_din_fx1[36:29];
assign  dpint_nx_byte_fx1[5] = |fpf_rs2_cmp_din_fx1[28:21];
assign  dpint_nx_byte_fx1[4] = |fpf_rs2_cmp_din_fx1[20:13];
assign  dpint_nx_byte_fx1[3] = |fpf_rs2_cmp_din_fx1[12:5];
assign  dpint_nx_byte_fx1[2] = |fpf_rs2_cmp_din_fx1[4:0];

assign  spint_nx_byte_fx1[7] = |fpf_rs2_cmp_din_fx1[47:40];
assign  spint_nx_byte_fx1[6] = |fpf_rs2_cmp_din_fx1[39:32];

// ------------------------------------
// i2f LZD "XOR function"
// Convert negative signed integer source
// to sign-magnitude value
// ------------------------------------

assign  dini[63:1] = fpf_rs2_cmp_din_fx1[63:1] ^ {63{fpf_rs2_cmp_din_fx1[63]}};

// ------------------------------------
// i2f LZD Byte selects (not priority encoded)
// ------------------------------------

assign  ibyte_sel[0] = |dini[63:56];  // shift 00-bits
assign  ibyte_sel[1] = |dini[55:48];  // shift 08-bits
assign  ibyte_sel[2] = |dini[47:40];  // shift 16-bits
assign  ibyte_sel[3] = |dini[39:32];  // shift 24-bits
assign  ibyte_sel[4] = |dini[31:24];  // shift 32-bits
assign  ibyte_sel[5] = |dini[23:16];  // shift 40-bits
assign  ibyte_sel[6] = |dini[15:8];  // shift 48-bits

// ------------------------------------
// i2f LZD Eadj[2:0]
//
// - count leading zeros in a given byte
//   and encode into a 3-bit value (Eadj[2:0])
//
//   Bit shift:  [4] [2] [1]
//   Eadj bit:   [2] [1] [0]
//   ---------------------------
//                0   0   0
//                0   0   1
//                0   1   0
//                0   1   1
//                1   0   0
//                1   0   1
//                1   1   0
//                1   1   1
//
//          din[7:0]    | Eadj[2:0]
//     -----------------|------------
//     1 x x x x x x x  |   0 0 0  
//     0 1 x x x x x x  |   0 0 1  
//     0 0 1 x x x x x  |   0 1 0  
//     0 0 0 1 x x x x  |   0 1 1  
//     0 0 0 0 1 x x x  |   1 0 0  
//     0 0 0 0 0 1 x x  |   1 0 1  
//     0 0 0 0 0 0 1 x  |   1 1 0  
//     0 0 0 0 0 0 0 x  |   1 1 1  
//
// Note: force Eadj[2:0] to 3'b111
//       if din[7:1]==7'b0000000 (i.e. assume din[0]==1'b1) 
//       This has already been done for byte0-byte7 below.
//
// ------------------------------------

// ----------------------------------------------------------------------------
// i2f LZD dini byte0 => dini[63:56]
// assume dini[56] == 1'b1
// ----------------------------------------------------------------------------

assign  ib0_nor_76  = ~(dini[63] | dini[62]);
assign  ib0_nor_54  = ~(dini[61] | dini[60]);

assign  ib0_zeroh_l = ~(ib0_nor_76 & ib0_nor_54);

assign  ib0_cnth[0] =  (~dini[63] &  dini[62]                        ) |
                       (~dini[63] &             ~dini[61] &  dini[60]) ;
assign  ib0_cnth[1] =  (~dini[63] & ~dini[62] &  dini[61]            ) |
                       (~dini[63] & ~dini[62] &              dini[60]) ;
assign  ib0_cntl[0] =  (~dini[59] &  dini[58]                        ) |
                       (~dini[59] &             ~dini[57]            ) ;
assign  ib0_cntl[1] =  (~dini[59] & ~dini[58] &  dini[57]            ) |
                       (~dini[59] & ~dini[58]                        ) ;

assign  eadj_ibyte0[0] = ( ib0_zeroh_l & ib0_cnth[0]) |
                         (~ib0_zeroh_l & ib0_cntl[0]) ;
assign  eadj_ibyte0[1] = ( ib0_zeroh_l & ib0_cnth[1]) |
                         (~ib0_zeroh_l & ib0_cntl[1]) ;
assign  eadj_ibyte0[2] =  ~ib0_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte1 => dini[55:48]
// assume dini[48] == 1'b1
// ----------------------------------------------------------------------------

assign  ib1_nor_76  = ~(dini[55] | dini[54]);
assign  ib1_nor_54  = ~(dini[53] | dini[52]);

assign  ib1_zeroh_l = ~(ib1_nor_76 & ib1_nor_54);

assign  ib1_cnth[0] =  (~dini[55] &  dini[54]                        ) |
                       (~dini[55] &             ~dini[53] &  dini[52]) ;
assign  ib1_cnth[1] =  (~dini[55] & ~dini[54] &  dini[53]            ) |
                       (~dini[55] & ~dini[54] &              dini[52]) ;
assign  ib1_cntl[0] =  (~dini[51] &  dini[50]                        ) |
                       (~dini[51] &             ~dini[49]            ) ;
assign  ib1_cntl[1] =  (~dini[51] & ~dini[50] &  dini[49]            ) |
                       (~dini[51] & ~dini[50]                        ) ;
 
assign  eadj_ibyte1[0] = ( ib1_zeroh_l & ib1_cnth[0]) |
                         (~ib1_zeroh_l & ib1_cntl[0]) ;
assign  eadj_ibyte1[1] = ( ib1_zeroh_l & ib1_cnth[1]) |
                         (~ib1_zeroh_l & ib1_cntl[1]) ;
assign  eadj_ibyte1[2] =  ~ib1_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte2 => dini[47:40]
// assume dini[40] == 1'b1
// ----------------------------------------------------------------------------

assign  ib2_nor_76  = ~(dini[47] | dini[46]);
assign  ib2_nor_54  = ~(dini[45] | dini[44]);

assign  ib2_zeroh_l = ~(ib2_nor_76 & ib2_nor_54);

assign  ib2_cnth[0] =  (~dini[47] &  dini[46]                        ) |
                       (~dini[47] &             ~dini[45] &  dini[44]) ;
assign  ib2_cnth[1] =  (~dini[47] & ~dini[46] &  dini[45]            ) |
                       (~dini[47] & ~dini[46] &              dini[44]) ;
assign  ib2_cntl[0] =  (~dini[43] &  dini[42]                        ) |
                       (~dini[43] &             ~dini[41]            ) ;
assign  ib2_cntl[1] =  (~dini[43] & ~dini[42] &  dini[41]            ) |
                       (~dini[43] & ~dini[42]                        ) ;

assign  eadj_ibyte2[0] = ( ib2_zeroh_l & ib2_cnth[0]) |
                         (~ib2_zeroh_l & ib2_cntl[0]) ;
assign  eadj_ibyte2[1] = ( ib2_zeroh_l & ib2_cnth[1]) |
                         (~ib2_zeroh_l & ib2_cntl[1]) ;
assign  eadj_ibyte2[2] =  ~ib2_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte3 => dini[39:32]
// assume dini[32] == 1'b1
// ----------------------------------------------------------------------------

assign  ib3_nor_76  = ~(dini[39] | dini[38]);
assign  ib3_nor_54  = ~(dini[37] | dini[36]);

assign  ib3_zeroh_l = ~(ib3_nor_76 & ib3_nor_54);

assign  ib3_cnth[0] =  (~dini[39] &  dini[38]                        ) |
                       (~dini[39] &             ~dini[37] &  dini[36]) ;
assign  ib3_cnth[1] =  (~dini[39] & ~dini[38] &  dini[37]            ) |
                       (~dini[39] & ~dini[38] &              dini[36]) ;
assign  ib3_cntl[0] =  (~dini[35] &  dini[34]                        ) |
                       (~dini[35] &             ~dini[33]            ) ;
assign  ib3_cntl[1] =  (~dini[35] & ~dini[34] &  dini[33]            ) |
                       (~dini[35] & ~dini[34]                        ) ;

assign  eadj_ibyte3[0] = ( ib3_zeroh_l & ib3_cnth[0]) |
                         (~ib3_zeroh_l & ib3_cntl[0]) ;
assign  eadj_ibyte3[1] = ( ib3_zeroh_l & ib3_cnth[1]) |
                         (~ib3_zeroh_l & ib3_cntl[1]) ;
assign  eadj_ibyte3[2] =  ~ib3_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte4 => dini[31:24]
// assume dini[24] == 1'b1
// ----------------------------------------------------------------------------

assign  ib4_nor_76  = ~(dini[31] | dini[30]);
assign  ib4_nor_54  = ~(dini[29] | dini[28]);

assign  ib4_zeroh_l = ~(ib4_nor_76 & ib4_nor_54);

assign  ib4_cnth[0] =  (~dini[31] &  dini[30]                        ) |
                       (~dini[31] &             ~dini[29] &  dini[28]) ;
assign  ib4_cnth[1] =  (~dini[31] & ~dini[30] &  dini[29]            ) |
                       (~dini[31] & ~dini[30] &              dini[28]) ;
assign  ib4_cntl[0] =  (~dini[27] &  dini[26]                        ) |
                       (~dini[27] &             ~dini[25]            ) ;
assign  ib4_cntl[1] =  (~dini[27] & ~dini[26] &  dini[25]            ) |
                       (~dini[27] & ~dini[26]                        ) ;

assign  eadj_ibyte4[0] = ( ib4_zeroh_l & ib4_cnth[0]) |
                         (~ib4_zeroh_l & ib4_cntl[0]) ;
assign  eadj_ibyte4[1] = ( ib4_zeroh_l & ib4_cnth[1]) |
                         (~ib4_zeroh_l & ib4_cntl[1]) ;
assign  eadj_ibyte4[2] =  ~ib4_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte5 => dini[23:16]
// assume dini[16] == 1'b1
// ----------------------------------------------------------------------------

assign  ib5_nor_76  = ~(dini[23] | dini[22]);
assign  ib5_nor_54  = ~(dini[21] | dini[20]);

assign  ib5_zeroh_l = ~(ib5_nor_76 & ib5_nor_54);

assign  ib5_cnth[0] =  (~dini[23] &  dini[22]                        ) |
                       (~dini[23] &             ~dini[21] &  dini[20]) ;
assign  ib5_cnth[1] =  (~dini[23] & ~dini[22] &  dini[21]            ) |
                       (~dini[23] & ~dini[22] &              dini[20]) ;
assign  ib5_cntl[0] =  (~dini[19] &  dini[18]                        ) |
                       (~dini[19] &             ~dini[17]            ) ;
assign  ib5_cntl[1] =  (~dini[19] & ~dini[18] &  dini[17]            ) |
                       (~dini[19] & ~dini[18]                        ) ;

assign  eadj_ibyte5[0] = ( ib5_zeroh_l & ib5_cnth[0]) |
                         (~ib5_zeroh_l & ib5_cntl[0]) ;
assign  eadj_ibyte5[1] = ( ib5_zeroh_l & ib5_cnth[1]) |
                         (~ib5_zeroh_l & ib5_cntl[1]) ;
assign  eadj_ibyte5[2] =  ~ib5_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte6 => dini[15:08]
// assume dini[08] == 1'b1
// ----------------------------------------------------------------------------

assign  ib6_nor_76  = ~(dini[15] | dini[14]);
assign  ib6_nor_54  = ~(dini[13] | dini[12]);

assign  ib6_zeroh_l = ~(ib6_nor_76 & ib6_nor_54);

assign  ib6_cnth[0] =  (~dini[15] &  dini[14]                        ) |
                       (~dini[15] &             ~dini[13] &  dini[12]) ;
assign  ib6_cnth[1] =  (~dini[15] & ~dini[14] &  dini[13]            ) |
                       (~dini[15] & ~dini[14] &              dini[12]) ;
assign  ib6_cntl[0] =  (~dini[11] &  dini[10]                        ) |
                       (~dini[11] &             ~dini[9]            ) ;
assign  ib6_cntl[1] =  (~dini[11] & ~dini[10] &  dini[9]            ) |
                       (~dini[11] & ~dini[10]                        ) ;

assign  eadj_ibyte6[0] = ( ib6_zeroh_l & ib6_cnth[0]) |
                         (~ib6_zeroh_l & ib6_cntl[0]) ;
assign  eadj_ibyte6[1] = ( ib6_zeroh_l & ib6_cnth[1]) |
                         (~ib6_zeroh_l & ib6_cntl[1]) ;
assign  eadj_ibyte6[2] =  ~ib6_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD dini byte7 => dini[07:00]
// assume dini[0] == 1'b1
// ----------------------------------------------------------------------------

assign  ib7_nor_76  = ~(dini[7] | dini[6]);
assign  ib7_nor_54  = ~(dini[5] | dini[4]);

assign  ib7_zeroh_l = ~(ib7_nor_76 & ib7_nor_54);

assign  ib7_cnth[0] =  (~dini[7] &  dini[6]                        ) |
                       (~dini[7] &             ~dini[5] &  dini[4]) ;
assign  ib7_cnth[1] =  (~dini[7] & ~dini[6] &  dini[5]            ) |
                       (~dini[7] & ~dini[6] &              dini[4]) ;
assign  ib7_cntl[0] =  (~dini[3] &  dini[2]                        ) |
                       (~dini[3] &             ~dini[1]            ) ;
assign  ib7_cntl[1] =  (~dini[3] & ~dini[2] &  dini[1]            ) |
                       (~dini[3] & ~dini[2]                        ) ;

assign  eadj_ibyte7[0] = ( ib7_zeroh_l & ib7_cnth[0]) |
                         (~ib7_zeroh_l & ib7_cntl[0]) ;
assign  eadj_ibyte7[1] = ( ib7_zeroh_l & ib7_cnth[1]) |
                         (~ib7_zeroh_l & ib7_cntl[1]) ;
assign  eadj_ibyte7[2] =  ~ib7_zeroh_l                ;

// ----------------------------------------------------------------------------
// i2f LZD Eadj[5:0] mux selects
// ----------------------------------------------------------------------------

assign  i2f_eadj_sel_fx1[0] =                      ibyte_sel[0];
assign  i2f_eadj_sel_fx1[1] = ~( ibyte_sel[0]  ) & ibyte_sel[1];
assign  i2f_eadj_sel_fx1[2] = ~(|ibyte_sel[1:0]) & ibyte_sel[2];
assign  i2f_eadj_sel_fx1[3] = ~(|ibyte_sel[2:0]) & ibyte_sel[3];
assign  i2f_eadj_sel_fx1[4] = ~(|ibyte_sel[3:0]) & ibyte_sel[4];
assign  i2f_eadj_sel_fx1[5] = ~(|ibyte_sel[4:0]) & ibyte_sel[5];
assign  i2f_eadj_sel_fx1[6] = ~(|ibyte_sel[5:0]) & ibyte_sel[6];
assign  i2f_eadj_sel_fx1[7] = ~(|ibyte_sel[6:0]);


// ----------------------------------------------------------------------------
//                               FX2 stage
// ----------------------------------------------------------------------------

fgu_fic_ctl_msff_ctl_macro__width_43 fx2_00  (
  .scan_in(fx2_00_scanin),
  .scan_out(fx2_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({    bzf31msb_fx1,
             bzf32lsb_fx1,
             bof22msb_fx1,
         dpint_nx_byte_fx1[7:2],
         spint_nx_byte_fx1[7:6],
         i2f_eadj_sel_fx1[7:0],
         eadj_ibyte0[2:0],
         eadj_ibyte1[2:0],
         eadj_ibyte2[2:0],
         eadj_ibyte3[2:0],
         eadj_ibyte4[2:0],
         eadj_ibyte5[2:0],
         eadj_ibyte6[2:0],
         eadj_ibyte7[2:0]}),
  .dout({fic_bzf31msb_fx2,
         fic_bzf32lsb_fx2,
         fic_bof22msb_fx2,
         dpint_nx_byte_fx2[7:2],
         spint_nx_byte_fx2[7:6],
         i2f_eadj_sel_fx2[7:0],
         eadj_ibyte0_fx2[2:0],
         eadj_ibyte1_fx2[2:0],
         eadj_ibyte2_fx2[2:0],
         eadj_ibyte3_fx2[2:0],
         eadj_ibyte4_fx2[2:0],
         eadj_ibyte5_fx2[2:0],
         eadj_ibyte6_fx2[2:0],
         eadj_ibyte7_fx2[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

// ----------------------------------------------------------------------------
// i2f LZD Eadj[5:0] mux
// ----------------------------------------------------------------------------

assign  fic_i2f_eadj_fx2[5:0] =
  ({6{i2f_eadj_sel_fx2[0]}} & ({3'b000, eadj_ibyte0_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[1]}} & ({3'b001, eadj_ibyte1_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[2]}} & ({3'b010, eadj_ibyte2_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[3]}} & ({3'b011, eadj_ibyte3_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[4]}} & ({3'b100, eadj_ibyte4_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[5]}} & ({3'b101, eadj_ibyte5_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[6]}} & ({3'b110, eadj_ibyte6_fx2[2:0]})) |
  ({6{i2f_eadj_sel_fx2[7]}} & ({3'b111, eadj_ibyte7_fx2[2:0]})) ;

assign  fic_i2f_align_sel_fx2[5:0] =
  (~fic_i2f_eadj_fx2[5:0]) + 6'b000001;  // 2's comp


// ----------------------------------------------------------------------------
//                               FX3 stage
// ----------------------------------------------------------------------------

fgu_fic_ctl_msff_ctl_macro__width_14 fx3_00  (
  .scan_in(fx3_00_scanin),
  .scan_out(fx3_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({fpe_align_sel_fx2[5:0], dpint_nx_byte_fx2[7:2], spint_nx_byte_fx2[7:6]}),
  .dout({    align_sel_fx3[5:0], dpint_nx_byte_fx3[7:2], spint_nx_byte_fx3[7:6]}),
  .siclk(siclk),
  .soclk(soclk)
  );

// ------------------------------------
// F(s,d)TO(i,x) inexact detection
//
//          -----------------------------------
// FsTOi   |     32          |      32         |
//          -----------------------------------
//          ------------     
//         |     24     |
//          ------------
//            4   3   2                  <= byte shift
//
//          -----------------------------------
// FsTOx   |                 64                |
//          -----------------------------------
//          ------------     
//         |     24     |
//          ------------
//            8   7   6                  <= byte shift
//
//          -----------------------------------
// FdTOi   |     32          |      32         |
//          -----------------------------------
//          --------------------------
//         |                 53       |
//          --------------------------
//            4   3   2   1   ---Any--   <= byte shift
// 
//          -----------------------------------
// FdTOx   |                 64                |
//          -----------------------------------
//          --------------------------
//         |                 53       |
//          --------------------------
//            8   7   6   5   4   3  2   <= byte shift
//
// ------------------------------------

assign  fstoi_nx_byte_fx3 =
  ((align_sel_fx3[4:3] == 2'd3) & (|spint_nx_byte_fx3[7:6])) |
  ((align_sel_fx3[4:3] == 2'd2) & ( spint_nx_byte_fx3[6]  )) ;

assign  fstox_nx_byte_fx3 =
  ((align_sel_fx3[5:3] == 3'd7) & (|spint_nx_byte_fx3[7:6])) |
  ((align_sel_fx3[5:3] == 3'd6) & ( spint_nx_byte_fx3[6]  )) ;

assign  fdtoi_nx_byte_fx3 =
  ((align_sel_fx3[5:3] == 3'd3) & (|dpint_nx_byte_fx3[7:5])) |
  ((align_sel_fx3[5:3] == 3'd2) & (|dpint_nx_byte_fx3[6:5])) |
  ((align_sel_fx3[5:3] == 3'd1) & ( dpint_nx_byte_fx3[5]  )) |
  (                               (|dpint_nx_byte_fx3[4:2])) ;

assign  fdtox_nx_byte_fx3 =
  ((align_sel_fx3[5:3] == 3'd7) & (|dpint_nx_byte_fx3[7:2])) |
  ((align_sel_fx3[5:3] == 3'd6) & (|dpint_nx_byte_fx3[6:2])) |
  ((align_sel_fx3[5:3] == 3'd5) & (|dpint_nx_byte_fx3[5:2])) |
  ((align_sel_fx3[5:3] == 3'd4) & (|dpint_nx_byte_fx3[4:2])) |
  ((align_sel_fx3[5:3] == 3'd3) & (|dpint_nx_byte_fx3[3:2])) |
  ((align_sel_fx3[5:3] == 3'd2) & ( dpint_nx_byte_fx3[2]  )) ;

assign  ftox_nx_bit_fx3 =
  ((align_sel_fx3[2:0] == 3'd7) & (|fpf_man_se_byte_fx3_b6_0[6:0])) |
  ((align_sel_fx3[2:0] == 3'd6) & (|fpf_man_se_byte_fx3_b6_0[5:0])) |
  ((align_sel_fx3[2:0] == 3'd5) & (|fpf_man_se_byte_fx3_b6_0[4:0])) |
  ((align_sel_fx3[2:0] == 3'd4) & (|fpf_man_se_byte_fx3_b6_0[3:0])) |
  ((align_sel_fx3[2:0] == 3'd3) & (|fpf_man_se_byte_fx3_b6_0[2:0])) |
  ((align_sel_fx3[2:0] == 3'd2) & (|fpf_man_se_byte_fx3_b6_0[1:0])) |
  ((align_sel_fx3[2:0] == 3'd1) & ( fpf_man_se_byte_fx3_b6_0[0]  )) ;

assign  ftoi_nx_bit_fx3 =
  ((align_sel_fx3[2:0] == 3'd7) & (|fpf_man_se_byte_fx3_b38_32[38:32])) |
  ((align_sel_fx3[2:0] == 3'd6) & (|fpf_man_se_byte_fx3_b38_32[37:32])) |
  ((align_sel_fx3[2:0] == 3'd5) & (|fpf_man_se_byte_fx3_b38_32[36:32])) |
  ((align_sel_fx3[2:0] == 3'd4) & (|fpf_man_se_byte_fx3_b38_32[35:32])) |
  ((align_sel_fx3[2:0] == 3'd3) & (|fpf_man_se_byte_fx3_b38_32[34:32])) |
  ((align_sel_fx3[2:0] == 3'd2) & (|fpf_man_se_byte_fx3_b38_32[33:32])) |
  ((align_sel_fx3[2:0] == 3'd1) & ( fpf_man_se_byte_fx3_b38_32[32]   )) ;

assign  ftoi_nx_fx3 =
  ftoi_nx_bit_fx3 |
  (fstoi_nx_byte_fx3 &  fpc_sp_source_fx3) |
  (fdtoi_nx_byte_fx3 & ~fpc_sp_source_fx3) ;

assign  ftox_nx_fx3 =
  ftox_nx_bit_fx3 |
  (fstox_nx_byte_fx3 &  fpc_sp_source_fx3) |
  (fdtox_nx_byte_fx3 & ~fpc_sp_source_fx3) ;


// ----------------------------------------------------------------------------
//                               FX4 stage
// ----------------------------------------------------------------------------

fgu_fic_ctl_msff_ctl_macro__width_2 fx4_00  (
  .scan_in(fx4_00_scanin),
  .scan_out(fx4_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({    ftoi_nx_fx3,     ftox_nx_fx3}),
  .dout({fic_ftoi_nx_fx4, fic_ftox_nx_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fic_mulscc_iccz_fx4 = (fpf_ma_sum_fx4[31:0] == 32'b0);
assign  fic_mulscc_xccz_fx4 = ~fpf_ma_sum_fx4[32] & fic_mulscc_iccz_fx4;

// ------------------------------------
// i2f and FdTOs sticky calculation
//
//          -----------------------------------
// FxTOs   |                 64                |
//          -----------------------------------
//          ------------ G   
//         |     24     |  7 |      32         |
//          ------------
//
//          -----------------------------------
// FxTOd   |                 64                |
//          -----------------------------------
//          -------------------------- G    
//         |                 53       |  7 | 3 |
//          --------------------------
//
//          -----------------------------------
// FiTOs   |     32          |      32         |
//          -----------------------------------
//          ------------ G    
//         |     24     |  7 |      32         |
//          ------------      
//
// FiTOd   never rounds (exact)
//
// i2f notes:
// - logically, LSB,G,X should be post-2comp for neg integers
// - X is equiv if calculated pre or post-2comp (post-2comp is used in
//   this design for simplicity)
// - The 2comp +1 function can't result in clearing all G,X bits and
//   blocking Rinc unless the post-2comp was b'00...00 in that region.
//   However, in that case a +1 was propagated to the LSB as if an Rinc
//   had taken place. Thus, effectively, a 2comp +1 can't block an Rinc,
//   and LSB,G need only reflect the 2comp invert function, not the
//   2comp +1 function.
//
// FdTOs notes:
// - the dp input (rs2) is always normalized
// - the dp mantissa resides in bits 63:11
// ------------------------------------

assign  fic_convert_sticky_fx4 = |fpf_ma_sum_fx4[38:0];  // FxTOs, FiTOs, FdTOs
assign  fic_fxtod_sticky_fx4   = |fpf_ma_sum_fx4[9:0];   // FxTOd

// ----------------------------------------------------------------------------
// Normalizer LZD
//
// data input format:
//
//         63                 32  31             8
//          -------------------    --------------
//         |      32-bits      |  |    24-bits   |
//          -------------------    --------------
//    Byte:  0    1    2    3       4    5    6
//
//
//      LSB pos.  G pos.
//      --------  ------
// DP     11        10
// SP     40        39
//
// ----------------------------------------------------------------------------

assign  dina[63:11] = fpf_ma_sum_fx4[63:11];

// ------------------------------------
// LZD override by setting dina bit 63 to
// force a Norm shift of 0-bits
//
// Override cases:
// - multiply (covered by ~logical_sub)
// - div/sqrt (covered by ~logical_sub)
// - 1X.XX    (covered by ~logical_sub)
// - 00.1X
// Note:
// - 1X.XX due to Rcout is unknown in fx4
// - 1X.XX not possible if logical_subtract
// - 00.1X is shifted 1-bit by the main adder output format mux
// ------------------------------------

assign  shift_00 =
  fpc_lzd_override_fx4 |   // mul | div | sqrt | 1X.XX
  (dina[63:62] == 2'b01);  // 00.1X

// ------------------------------------
// Norm LZD Byte selects (not priority encoded)
// ------------------------------------

assign  nbyte_sel[0] = shift_00;      // force eadj=0
assign  nbyte_sel[1] = |dina[63:56];  // shift 00-bits
assign  nbyte_sel[2] = |dina[55:48];  // shift 08-bits
assign  nbyte_sel[3] = |dina[47:40];  // shift 16-bits
assign  nbyte_sel[4] = |dina[39:32];  // shift 24-bits
assign  nbyte_sel[5] = |dina[31:24];  // shift 32-bits
assign  nbyte_sel[6] = |dina[23:16];  // shift 40-bits
	
// ------------------------------------
// Norm LZD Eadj[2:0]
//
// - count leading zeros in a given byte
//   and encode into a 3-bit value (Eadj[2:0])
//
//   Bit shift:  [4] [2] [1]
//   Eadj bit:   [2] [1] [0]
//   ---------------------------
//                0   0   0
//                0   0   1
//                0   1   0
//                0   1   1
//                1   0   0
//                1   0   1
//                1   1   0
//                1   1   1
//
//          din[7:0]    | Eadj[2:0]
//     -----------------|------------
//     1 x x x x x x x  |   0 0 0  
//     0 1 x x x x x x  |   0 0 1  
//     0 0 1 x x x x x  |   0 1 0  
//     0 0 0 1 x x x x  |   0 1 1  
//     0 0 0 0 1 x x x  |   1 0 0  
//     0 0 0 0 0 1 x x  |   1 0 1  
//     0 0 0 0 0 0 1 x  |   1 1 0  
//     0 0 0 0 0 0 0 x  |   1 1 1
//
// Note: force Eadj[2:0] to 3'b111
//       if din[7:1]==7'b0000000 (i.e. assume din[0]==1'b1) 
//       This has already been done for byte0-byte6 below.
//       Also, for DP operation, din[10] is assumed to be
//       1'b1 since bit 10 (the DP G pos.) isn't the LSB
//       position of byte6.
//
// ------------------------------------

// ----------------------------------------------------------------------------
// Norm LZD dina byte0 => dina[63:56]
// assume dina[56] == 1'b1
// ----------------------------------------------------------------------------

assign  ab0_nor_76  = ~(dina[63] | dina[62]);
assign  ab0_nor_54  = ~(dina[61] | dina[60]);

assign  ab0_zeroh_l = ~(ab0_nor_76 & ab0_nor_54);

assign  ab0_cnth[0] =  (~dina[63] &  dina[62]                        ) |
                       (~dina[63] &             ~dina[61] &  dina[60]) ;
assign  ab0_cnth[1] =  (~dina[63] & ~dina[62] &  dina[61]            ) |
                       (~dina[63] & ~dina[62] &              dina[60]) ;
assign  ab0_cntl[0] =  (~dina[59] &  dina[58]                        ) |
                       (~dina[59] &             ~dina[57]            ) ;
assign  ab0_cntl[1] =  (~dina[59] & ~dina[58] &  dina[57]            ) |
                       (~dina[59] & ~dina[58]                        ) ;

assign  eadj_nbyte0[0] = ( ab0_zeroh_l & ab0_cnth[0]) |
                         (~ab0_zeroh_l & ab0_cntl[0]) ;
assign  eadj_nbyte0[1] = ( ab0_zeroh_l & ab0_cnth[1]) |
                         (~ab0_zeroh_l & ab0_cntl[1]) ;
assign  eadj_nbyte0[2] =  ~ab0_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD dina byte1 => dina[55:48]
// assume dina[48] == 1'b1
// ----------------------------------------------------------------------------

assign  ab1_nor_76  = ~(dina[55] | dina[54]);
assign  ab1_nor_54  = ~(dina[53] | dina[52]);

assign  ab1_zeroh_l = ~(ab1_nor_76 & ab1_nor_54);

assign  ab1_cnth[0] =  (~dina[55] &  dina[54]                        ) |
                       (~dina[55] &             ~dina[53] &  dina[52]) ;
assign  ab1_cnth[1] =  (~dina[55] & ~dina[54] &  dina[53]            ) |
                       (~dina[55] & ~dina[54] &              dina[52]) ;
assign  ab1_cntl[0] =  (~dina[51] &  dina[50]                        ) |
                       (~dina[51] &             ~dina[49]            ) ;
assign  ab1_cntl[1] =  (~dina[51] & ~dina[50] &  dina[49]            ) |
                       (~dina[51] & ~dina[50]                        ) ;
 
assign  eadj_nbyte1[0] = ( ab1_zeroh_l & ab1_cnth[0]) |
                         (~ab1_zeroh_l & ab1_cntl[0]) ;
assign  eadj_nbyte1[1] = ( ab1_zeroh_l & ab1_cnth[1]) |
                         (~ab1_zeroh_l & ab1_cntl[1]) ;
assign  eadj_nbyte1[2] =  ~ab1_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD dina byte2 => dina[47:40]
// assume dina[40] == 1'b1
// ----------------------------------------------------------------------------

assign  ab2_nor_76  = ~(dina[47] | dina[46]);
assign  ab2_nor_54  = ~(dina[45] | dina[44]);

assign  ab2_zeroh_l = ~(ab2_nor_76 & ab2_nor_54);

assign  ab2_cnth[0] =  (~dina[47] &  dina[46]                        ) |
                       (~dina[47] &             ~dina[45] &  dina[44]) ;
assign  ab2_cnth[1] =  (~dina[47] & ~dina[46] &  dina[45]            ) |
                       (~dina[47] & ~dina[46] &              dina[44]) ;
assign  ab2_cntl[0] =  (~dina[43] &  dina[42]                        ) |
                       (~dina[43] &             ~dina[41]            ) ;
assign  ab2_cntl[1] =  (~dina[43] & ~dina[42] &  dina[41]            ) |
                       (~dina[43] & ~dina[42]                        ) ;

assign  eadj_nbyte2[0] = ( ab2_zeroh_l & ab2_cnth[0]) |
                         (~ab2_zeroh_l & ab2_cntl[0]) ;
assign  eadj_nbyte2[1] = ( ab2_zeroh_l & ab2_cnth[1]) |
                         (~ab2_zeroh_l & ab2_cntl[1]) ;
assign  eadj_nbyte2[2] =  ~ab2_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD dina byte3 => dina[39:32]
// assume dina[32] == 1'b1
// ----------------------------------------------------------------------------

assign  ab3_nor_76  = ~(dina[39] | dina[38]);
assign  ab3_nor_54  = ~(dina[37] | dina[36]);

assign  ab3_zeroh_l = ~(ab3_nor_76 & ab3_nor_54);

assign  ab3_cnth[0] =  (~dina[39] &  dina[38]                        ) |
                       (~dina[39] &             ~dina[37] &  dina[36]) ;
assign  ab3_cnth[1] =  (~dina[39] & ~dina[38] &  dina[37]            ) |
                       (~dina[39] & ~dina[38] &              dina[36]) ;
assign  ab3_cntl[0] =  (~dina[35] &  dina[34]                        ) |
                       (~dina[35] &             ~dina[33]            ) ;
assign  ab3_cntl[1] =  (~dina[35] & ~dina[34] &  dina[33]            ) |
                       (~dina[35] & ~dina[34]                        ) ;

assign  eadj_nbyte3[0] = ( ab3_zeroh_l & ab3_cnth[0]) |
                         (~ab3_zeroh_l & ab3_cntl[0]) ;
assign  eadj_nbyte3[1] = ( ab3_zeroh_l & ab3_cnth[1]) |
                         (~ab3_zeroh_l & ab3_cntl[1]) ;
assign  eadj_nbyte3[2] =  ~ab3_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD dina byte4 => dina[31:24]
// assume dina[24] == 1'b1
// ----------------------------------------------------------------------------

assign  ab4_nor_76  = ~(dina[31] | dina[30]);
assign  ab4_nor_54  = ~(dina[29] | dina[28]);

assign  ab4_zeroh_l = ~(ab4_nor_76 & ab4_nor_54);

assign  ab4_cnth[0] =  (~dina[31] &  dina[30]                        ) |
                       (~dina[31] &             ~dina[29] &  dina[28]) ;
assign  ab4_cnth[1] =  (~dina[31] & ~dina[30] &  dina[29]            ) |
                       (~dina[31] & ~dina[30] &              dina[28]) ;
assign  ab4_cntl[0] =  (~dina[27] &  dina[26]                        ) |
                       (~dina[27] &             ~dina[25]            ) ;
assign  ab4_cntl[1] =  (~dina[27] & ~dina[26] &  dina[25]            ) |
                       (~dina[27] & ~dina[26]                        ) ;

assign  eadj_nbyte4[0] = ( ab4_zeroh_l & ab4_cnth[0]) |
                         (~ab4_zeroh_l & ab4_cntl[0]) ;
assign  eadj_nbyte4[1] = ( ab4_zeroh_l & ab4_cnth[1]) |
                         (~ab4_zeroh_l & ab4_cntl[1]) ;
assign  eadj_nbyte4[2] =  ~ab4_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD dina byte5 => dina[23:16]
// assume dina[16] == 1'b1
// ----------------------------------------------------------------------------

assign  ab5_nor_76  = ~(dina[23] | dina[22]);
assign  ab5_nor_54  = ~(dina[21] | dina[20]);

assign  ab5_zeroh_l = ~(ab5_nor_76 & ab5_nor_54);

assign  ab5_cnth[0] =  (~dina[23] &  dina[22]                        ) |
                       (~dina[23] &             ~dina[21] &  dina[20]) ;
assign  ab5_cnth[1] =  (~dina[23] & ~dina[22] &  dina[21]            ) |
                       (~dina[23] & ~dina[22] &              dina[20]) ;
assign  ab5_cntl[0] =  (~dina[19] &  dina[18]                        ) |
                       (~dina[19] &             ~dina[17]            ) ;
assign  ab5_cntl[1] =  (~dina[19] & ~dina[18] &  dina[17]            ) |
                       (~dina[19] & ~dina[18]                        ) ;

assign  eadj_nbyte5[0] = ( ab5_zeroh_l & ab5_cnth[0]) |
                         (~ab5_zeroh_l & ab5_cntl[0]) ;
assign  eadj_nbyte5[1] = ( ab5_zeroh_l & ab5_cnth[1]) |
                         (~ab5_zeroh_l & ab5_cntl[1]) ;
assign  eadj_nbyte5[2] =  ~ab5_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD dina byte6 => dina[15:08]
// assume dina[10]  == 1'b1
// assume dina[9:8] == 2'b00
// ----------------------------------------------------------------------------

assign  ab6_nor_76  = ~(dina[15] | dina[14]);
assign  ab6_nor_54  = ~(dina[13] | dina[12]);

assign  ab6_zeroh_l = ~(ab6_nor_76 & ab6_nor_54);

assign  ab6_cnth[0] =  (~dina[15] &  dina[14]                        ) |
                       (~dina[15] &             ~dina[13] &  dina[12]) ;
assign  ab6_cnth[1] =  (~dina[15] & ~dina[14] &  dina[13]            ) |
                       (~dina[15] & ~dina[14] &              dina[12]) ;
assign  ab6_cntl[0] =  (~dina[11]                                    ) ;

assign  eadj_nbyte6[0] = ( ab6_zeroh_l & ab6_cnth[0]) |
                         (~ab6_zeroh_l & ab6_cntl[0]) ;
assign  eadj_nbyte6[1] = ( ab6_zeroh_l & ab6_cnth[1]) ;
assign  eadj_nbyte6[2] =  ~ab6_zeroh_l                ;

// ----------------------------------------------------------------------------
// Norm LZD Eadj[5:0] mux
// ----------------------------------------------------------------------------

assign  norm_eadj_fx4[5:0] =
//({6{(                     nbyte_sel[0])}} & ({3'b000, 3'b000          })) |
  ({6{(~( nbyte_sel[0]  ) & nbyte_sel[1])}} & ({3'b000, eadj_nbyte0[2:0]})) |
  ({6{(~(|nbyte_sel[1:0]) & nbyte_sel[2])}} & ({3'b001, eadj_nbyte1[2:0]})) |
  ({6{(~(|nbyte_sel[2:0]) & nbyte_sel[3])}} & ({3'b010, eadj_nbyte2[2:0]})) |
  ({6{(~(|nbyte_sel[3:0]) & nbyte_sel[4])}} & ({3'b011, eadj_nbyte3[2:0]})) |
  ({6{(~(|nbyte_sel[4:0]) & nbyte_sel[5])}} & ({3'b100, eadj_nbyte4[2:0]})) |
  ({6{(~(|nbyte_sel[5:0]) & nbyte_sel[6])}} & ({3'b101, eadj_nbyte5[2:0]})) |
  ({6{(~(|nbyte_sel[6:0])               )}} & ({3'b110, eadj_nbyte6[2:0]})) ;


// ----------------------------------------------------------------------------
//                               FX5 stage
// ----------------------------------------------------------------------------

fgu_fic_ctl_msff_ctl_macro__width_6 fx5_00  (
  .scan_in(fx5_00_scanin),
  .scan_out(fx5_00_scanout),
  .l1clk(l1clk_pm1),
  .din (    norm_eadj_fx4[5:0]),
  .dout(fic_norm_eadj_fx5[5:0]),
  .siclk(siclk),
  .soclk(soclk)
  );


supply0 vss;
supply1 vdd;
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign fx2_00_scanin             = spares_scanout           ;
assign fx3_00_scanin             = fx2_00_scanout           ;
assign fx4_00_scanin             = fx3_00_scanout           ;
assign fx5_00_scanin             = fx4_00_scanout           ;
assign scan_out                  = fx5_00_scanout           ;
// fixscan end:
endmodule  // fgu_fic_ctl






// any PARAMS parms go into naming of macro

module fgu_fic_ctl_l1clkhdr_ctl_macro (
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


module fgu_fic_ctl_spare_ctl_macro__num_2 (
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

module fgu_fic_ctl_msff_ctl_macro__width_43 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [42:0] fdin;
wire [41:0] so;

  input [42:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [42:0] dout;
  output scan_out;
assign fdin[42:0] = din[42:0];






dff #(43)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42:0]),
.si({scan_in,so[41:0]}),
.so({so[41:0],scan_out}),
.q(dout[42:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fic_ctl_msff_ctl_macro__width_14 (
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

module fgu_fic_ctl_msff_ctl_macro__width_2 (
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

module fgu_fic_ctl_msff_ctl_macro__width_6 (
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








