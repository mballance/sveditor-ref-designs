// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_gnt_encoder.v
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

/* This file is genetated from encoder.c */ 
module niu_gnt_encoder (gnt,gnt_num); 
input  [63:0]  gnt; 
output [5:0]    gnt_num; 

 
reg    [5:0]    gnt_num; 

 always @ (gnt) 
   casex(gnt[63:0]) 
 /* ----------------------------------------- */ 
     64'h1: gnt_num[5:0] = 6'd0; 
     64'h2: gnt_num[5:0] = 6'd1; 
     64'h4: gnt_num[5:0] = 6'd2; 
     64'h8: gnt_num[5:0] = 6'd3; 
     64'h10: gnt_num[5:0] = 6'd4; 
     64'h20: gnt_num[5:0] = 6'd5; 
     64'h40: gnt_num[5:0] = 6'd6; 
     64'h80: gnt_num[5:0] = 6'd7; 
     64'h100: gnt_num[5:0] = 6'd8; 
     64'h200: gnt_num[5:0] = 6'd9; 
     64'h400: gnt_num[5:0] = 6'd10; 
     64'h800: gnt_num[5:0] = 6'd11; 
     64'h1000: gnt_num[5:0] = 6'd12; 
     64'h2000: gnt_num[5:0] = 6'd13; 
     64'h4000: gnt_num[5:0] = 6'd14; 
     64'h8000: gnt_num[5:0] = 6'd15; 
     64'h10000: gnt_num[5:0] = 6'd16; 
     64'h20000: gnt_num[5:0] = 6'd17; 
     64'h40000: gnt_num[5:0] = 6'd18; 
     64'h80000: gnt_num[5:0] = 6'd19; 
     64'h100000: gnt_num[5:0] = 6'd20; 
     64'h200000: gnt_num[5:0] = 6'd21; 
     64'h400000: gnt_num[5:0] = 6'd22; 
     64'h800000: gnt_num[5:0] = 6'd23; 
     64'h1000000: gnt_num[5:0] = 6'd24; 
     64'h2000000: gnt_num[5:0] = 6'd25; 
     64'h4000000: gnt_num[5:0] = 6'd26; 
     64'h8000000: gnt_num[5:0] = 6'd27; 
     64'h10000000: gnt_num[5:0] = 6'd28; 
     64'h20000000: gnt_num[5:0] = 6'd29; 
     64'h40000000: gnt_num[5:0] = 6'd30; 
     64'h80000000: gnt_num[5:0] = 6'd31; 
 /* ----------------------------------------- */ 
     64'h1_00000000: gnt_num[5:0] = 6'd32; 
     64'h2_00000000: gnt_num[5:0] = 6'd33; 
     64'h4_00000000: gnt_num[5:0] = 6'd34; 
     64'h8_00000000: gnt_num[5:0] = 6'd35; 
     64'h10_00000000: gnt_num[5:0] = 6'd36; 
     64'h20_00000000: gnt_num[5:0] = 6'd37; 
     64'h40_00000000: gnt_num[5:0] = 6'd38; 
     64'h80_00000000: gnt_num[5:0] = 6'd39; 
     64'h100_00000000: gnt_num[5:0] = 6'd40; 
     64'h200_00000000: gnt_num[5:0] = 6'd41; 
     64'h400_00000000: gnt_num[5:0] = 6'd42; 
     64'h800_00000000: gnt_num[5:0] = 6'd43; 
     64'h1000_00000000: gnt_num[5:0] = 6'd44; 
     64'h2000_00000000: gnt_num[5:0] = 6'd45; 
     64'h4000_00000000: gnt_num[5:0] = 6'd46; 
     64'h8000_00000000: gnt_num[5:0] = 6'd47; 
     64'h10000_00000000: gnt_num[5:0] = 6'd48; 
     64'h20000_00000000: gnt_num[5:0] = 6'd49; 
     64'h40000_00000000: gnt_num[5:0] = 6'd50; 
     64'h80000_00000000: gnt_num[5:0] = 6'd51; 
     64'h100000_00000000: gnt_num[5:0] = 6'd52; 
     64'h200000_00000000: gnt_num[5:0] = 6'd53; 
     64'h400000_00000000: gnt_num[5:0] = 6'd54; 
     64'h800000_00000000: gnt_num[5:0] = 6'd55; 
     64'h1000000_00000000: gnt_num[5:0] = 6'd56; 
     64'h2000000_00000000: gnt_num[5:0] = 6'd57; 
     64'h4000000_00000000: gnt_num[5:0] = 6'd58; 
     64'h8000000_00000000: gnt_num[5:0] = 6'd59; 
     64'h10000000_00000000: gnt_num[5:0] = 6'd60; 
     64'h20000000_00000000: gnt_num[5:0] = 6'd61; 
     64'h40000000_00000000: gnt_num[5:0] = 6'd62; 
     64'h80000000_00000000: gnt_num[5:0] = 6'd63; 
     default: gnt_num[5:0] = 6'd0;
   endcase
 

endmodule // niu_gnt_encoder
