// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_decoder_6to64.v
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
/***********************************************/ 
/* This file is genetated from decoder.c       */ 
/* This program is created by John Lo          */ 
/***********************************************/ 

module niu_pio_decoder_6to64 (clk,reset,ldgn,ldgn_map); 
input            clk; 
input            reset; 

input  [5:0]     ldgn; 
output [63:0]    ldgn_map; 

 
reg    [63:0]    ldgn_map_int; 
reg    [63:0]    ldgn_map; 

 always @ (ldgn) 
   casex(ldgn[5:0])  /* synopsys parallel_case full_case */ 
 /* --------- the first 32 ------------------- */ 
     6'd0: ldgn_map_int[63:0] = 64'h1; 
     6'd1: ldgn_map_int[63:0] = 64'h2; 
     6'd2: ldgn_map_int[63:0] = 64'h4; 
     6'd3: ldgn_map_int[63:0] = 64'h8; 
     6'd4: ldgn_map_int[63:0] = 64'h10; 
     6'd5: ldgn_map_int[63:0] = 64'h20; 
     6'd6: ldgn_map_int[63:0] = 64'h40; 
     6'd7: ldgn_map_int[63:0] = 64'h80; 
     6'd8: ldgn_map_int[63:0] = 64'h100; 
     6'd9: ldgn_map_int[63:0] = 64'h200; 
     6'd10: ldgn_map_int[63:0] = 64'h400; 
     6'd11: ldgn_map_int[63:0] = 64'h800; 
     6'd12: ldgn_map_int[63:0] = 64'h1000; 
     6'd13: ldgn_map_int[63:0] = 64'h2000; 
     6'd14: ldgn_map_int[63:0] = 64'h4000; 
     6'd15: ldgn_map_int[63:0] = 64'h8000; 
     6'd16: ldgn_map_int[63:0] = 64'h10000; 
     6'd17: ldgn_map_int[63:0] = 64'h20000; 
     6'd18: ldgn_map_int[63:0] = 64'h40000; 
     6'd19: ldgn_map_int[63:0] = 64'h80000; 
     6'd20: ldgn_map_int[63:0] = 64'h100000; 
     6'd21: ldgn_map_int[63:0] = 64'h200000; 
     6'd22: ldgn_map_int[63:0] = 64'h400000; 
     6'd23: ldgn_map_int[63:0] = 64'h800000; 
     6'd24: ldgn_map_int[63:0] = 64'h1000000; 
     6'd25: ldgn_map_int[63:0] = 64'h2000000; 
     6'd26: ldgn_map_int[63:0] = 64'h4000000; 
     6'd27: ldgn_map_int[63:0] = 64'h8000000; 
     6'd28: ldgn_map_int[63:0] = 64'h10000000; 
     6'd29: ldgn_map_int[63:0] = 64'h20000000; 
     6'd30: ldgn_map_int[63:0] = 64'h40000000; 
     6'd31: ldgn_map_int[63:0] = 64'h80000000; 
 /* --------- the second 32 ------------------------ */ 
     6'd32: ldgn_map_int[63:0] = 64'h1_00000000; 
     6'd33: ldgn_map_int[63:0] = 64'h2_00000000; 
     6'd34: ldgn_map_int[63:0] = 64'h4_00000000; 
     6'd35: ldgn_map_int[63:0] = 64'h8_00000000; 
     6'd36: ldgn_map_int[63:0] = 64'h10_00000000; 
     6'd37: ldgn_map_int[63:0] = 64'h20_00000000; 
     6'd38: ldgn_map_int[63:0] = 64'h40_00000000; 
     6'd39: ldgn_map_int[63:0] = 64'h80_00000000; 
     6'd40: ldgn_map_int[63:0] = 64'h100_00000000; 
     6'd41: ldgn_map_int[63:0] = 64'h200_00000000; 
     6'd42: ldgn_map_int[63:0] = 64'h400_00000000; 
     6'd43: ldgn_map_int[63:0] = 64'h800_00000000; 
     6'd44: ldgn_map_int[63:0] = 64'h1000_00000000; 
     6'd45: ldgn_map_int[63:0] = 64'h2000_00000000; 
     6'd46: ldgn_map_int[63:0] = 64'h4000_00000000; 
     6'd47: ldgn_map_int[63:0] = 64'h8000_00000000; 
     6'd48: ldgn_map_int[63:0] = 64'h10000_00000000; 
     6'd49: ldgn_map_int[63:0] = 64'h20000_00000000; 
     6'd50: ldgn_map_int[63:0] = 64'h40000_00000000; 
     6'd51: ldgn_map_int[63:0] = 64'h80000_00000000; 
     6'd52: ldgn_map_int[63:0] = 64'h100000_00000000; 
     6'd53: ldgn_map_int[63:0] = 64'h200000_00000000; 
     6'd54: ldgn_map_int[63:0] = 64'h400000_00000000; 
     6'd55: ldgn_map_int[63:0] = 64'h800000_00000000; 
     6'd56: ldgn_map_int[63:0] = 64'h1000000_00000000; 
     6'd57: ldgn_map_int[63:0] = 64'h2000000_00000000; 
     6'd58: ldgn_map_int[63:0] = 64'h4000000_00000000; 
     6'd59: ldgn_map_int[63:0] = 64'h8000000_00000000; 
     6'd60: ldgn_map_int[63:0] = 64'h10000000_00000000; 
     6'd61: ldgn_map_int[63:0] = 64'h20000000_00000000; 
     6'd62: ldgn_map_int[63:0] = 64'h40000000_00000000; 
     6'd63: ldgn_map_int[63:0] = 64'h80000000_00000000; 
     default: ldgn_map_int[63:0] = 64'b0;
  endcase 

always @ (posedge clk)
 begin
  if (reset)
   ldgn_map <= 64'b0 ;
  else
   ldgn_map <= ldgn_map_int ;
 end

endmodule // niu_pio_decoder_6to64
