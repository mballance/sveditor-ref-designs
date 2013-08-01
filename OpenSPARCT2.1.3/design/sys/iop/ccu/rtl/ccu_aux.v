// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu_aux.v
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
module my_msff_arst_4x ( q, so, d, l1clk, si, siclk, soclk, reset );
 // RFM 05-14-2004
 // Level sensitive in SCAN_MODE
 // Edge triggered when not in SCAN_MODE
 
 parameter SIZE = 1;
 
 output  q;
 output  so;
 
 input   d;
 input   l1clk;
 input   si;
 input   siclk;
 input   soclk;
 input   reset;
 
cl_a1_msff_arst_4x lib_inst ( 
	.q( q ),
	.so( so ),
	.d( d ),
	.l1clk( l1clk ),
	.si( si ),
	.siclk( siclk ),
	.soclk( soclk ),
	.reset ( reset )
);
 
// reg     q;
// reg    so;
// wire    l1clk, siclk, soclk;
// 	
// reg 	l1;
// 
// // master latch (tpl)
// always @(l1clk or siclk or d or reset or si) begin
// 	if (reset) 
// 		l1 = 1'b0; 
// 	else if (!l1clk && !siclk) 
// 		l1 = d;
// 	else if (l1clk && siclk) 
// 		l1 = si; 
// 	else if (!l1clk && siclk) 
// 		l1 = 1'bx;
// end	
// 
// // slave latch (tph)
// always @(l1clk or soclk or l1 or reset) begin
// 	if (reset) 
// 		so = 1'b0; 
// 	else if (l1clk && !soclk) 
// 		so = l1; 
// end
// 
// always @(posedge l1clk or posedge reset) begin
// 	if (reset) 
// 		q <= 1'b0;
// 	else if (siclk || soclk) 
// 		q <= 1'bx;
// 	else 
// 		q <= d;
// end
// 	
// // assign so = q;
// 
endmodule // dff




// *******************************************
// 64 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_64 (  q, so, d, l1clk, si, siclk, soclk, reset_n );

   output [63:0]	q;
   output	so;

   input  [63:0]	d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[7:0] so_tmp;

   assign so    = so_tmp[7];

ccu_msff_arst_4x_8 U0 ( .q (q[7:0]),   .so (so_tmp[0]), .d (d[7:0]),   .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U1 ( .q (q[15:8]),  .so (so_tmp[1]), .d (d[15:8]),  .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U2 ( .q (q[23:16]), .so (so_tmp[2]), .d (d[23:16]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U3 ( .q (q[31:24]), .so (so_tmp[3]), .d (d[31:24]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U4 ( .q (q[39:32]), .so (so_tmp[4]), .d (d[39:32]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U5 ( .q (q[47:40]), .so (so_tmp[5]), .d (d[47:40]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U6 ( .q (q[55:48]), .so (so_tmp[6]), .d (d[55:48]), .l1clk (l1clk), .si (so_tmp[5]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );
ccu_msff_arst_4x_8 U7 ( .q (q[63:56]), .so (so_tmp[7]), .d (d[63:56]), .l1clk (l1clk), .si (so_tmp[6]), .siclk (siclk), .soclk (soclk), .reset_n (reset_n) );

endmodule

// *******************************************
// 8 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_8 (  q, so, d, l1clk, si, siclk, soclk, reset_n );

   output [7:0]	q;
   output	so;

   input  [7:0]	d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[7:0] so_tmp;
   wire 	reset;

   assign   reset  = ~reset_n;
   assign so    = so_tmp[7];

my_msff_arst_4x U0 ( .q (q[0]), .so (so_tmp[0]), .d (d[0]), .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U1 ( .q (q[1]), .so (so_tmp[1]), .d (d[1]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U2 ( .q (q[2]), .so (so_tmp[2]), .d (d[2]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U3 ( .q (q[3]), .so (so_tmp[3]), .d (d[3]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U4 ( .q (q[4]), .so (so_tmp[4]), .d (d[4]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U5 ( .q (q[5]), .so (so_tmp[5]), .d (d[5]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U6 ( .q (q[6]), .so (so_tmp[6]), .d (d[6]), .l1clk (l1clk), .si (so_tmp[5]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U7 ( .q (q[7]), .so (so_tmp[7]), .d (d[7]), .l1clk (l1clk), .si (so_tmp[6]), .siclk (siclk), .soclk (soclk), .reset (reset) );

endmodule

// *******************************************
// 64 flops shift-reg  
// *******************************************

module ccu_msff_arst_4x_64sr (  q, so, d, l1clk, si, siclk, soclk, reset_n );

   output 	[63:0] q;
   output	so;

   input    d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[63:0] d_tmp;
   wire 	[63:0] so_tmp;
   wire 	reset;

   assign   reset  	= ~reset_n;
   assign so    	= so_tmp[63];
   assign q     	= d_tmp;

   my_msff_arst_4x U0 ( .q (d_tmp[0]), .so (so_tmp[0]), .d (d), .l1clk (l1clk),        .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U1 ( .q (d_tmp[1]), .so (so_tmp[1]), .d (d_tmp[0]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U2 ( .q (d_tmp[2]), .so (so_tmp[2]), .d (d_tmp[1]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U3 ( .q (d_tmp[3]), .so (so_tmp[3]), .d (d_tmp[2]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U4 ( .q (d_tmp[4]), .so (so_tmp[4]), .d (d_tmp[3]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U5 ( .q (d_tmp[5]), .so (so_tmp[5]), .d (d_tmp[4]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U6 ( .q (d_tmp[6]), .so (so_tmp[6]), .d (d_tmp[5]), .l1clk (l1clk), .si (so_tmp[5]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U7 ( .q (d_tmp[7]), .so (so_tmp[7]), .d (d_tmp[6]), .l1clk (l1clk), .si (so_tmp[6]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U8 ( .q (d_tmp[8]), .so (so_tmp[8]), .d (d_tmp[7]), .l1clk (l1clk), .si (so_tmp[7]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U9 ( .q (d_tmp[9]), .so (so_tmp[9]), .d (d_tmp[8]), .l1clk (l1clk), .si (so_tmp[8]), .siclk (siclk), .soclk (soclk), .reset (reset) );

   my_msff_arst_4x U10 ( .q (d_tmp[10]), .so (so_tmp[10]), .d (d_tmp[9]), .l1clk (l1clk),  .si (so_tmp[9]),  .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U11 ( .q (d_tmp[11]), .so (so_tmp[11]), .d (d_tmp[10]), .l1clk (l1clk), .si (so_tmp[10]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U12 ( .q (d_tmp[12]), .so (so_tmp[12]), .d (d_tmp[11]), .l1clk (l1clk), .si (so_tmp[11]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U13 ( .q (d_tmp[13]), .so (so_tmp[13]), .d (d_tmp[12]), .l1clk (l1clk), .si (so_tmp[12]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U14 ( .q (d_tmp[14]), .so (so_tmp[14]), .d (d_tmp[13]), .l1clk (l1clk), .si (so_tmp[13]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U15 ( .q (d_tmp[15]), .so (so_tmp[15]), .d (d_tmp[14]), .l1clk (l1clk), .si (so_tmp[14]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U16 ( .q (d_tmp[16]), .so (so_tmp[16]), .d (d_tmp[15]), .l1clk (l1clk), .si (so_tmp[15]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U17 ( .q (d_tmp[17]), .so (so_tmp[17]), .d (d_tmp[16]), .l1clk (l1clk), .si (so_tmp[16]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U18 ( .q (d_tmp[18]), .so (so_tmp[18]), .d (d_tmp[17]), .l1clk (l1clk), .si (so_tmp[17]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U19 ( .q (d_tmp[19]), .so (so_tmp[19]), .d (d_tmp[18]), .l1clk (l1clk), .si (so_tmp[18]), .siclk (siclk), .soclk (soclk), .reset (reset) );

   my_msff_arst_4x U20 ( .q (d_tmp[20]), .so (so_tmp[20]), .d (d_tmp[19]), .l1clk (l1clk), .si (so_tmp[19]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U21 ( .q (d_tmp[21]), .so (so_tmp[21]), .d (d_tmp[20]), .l1clk (l1clk), .si (so_tmp[20]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U22 ( .q (d_tmp[22]), .so (so_tmp[22]), .d (d_tmp[21]), .l1clk (l1clk), .si (so_tmp[21]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U23 ( .q (d_tmp[23]), .so (so_tmp[23]), .d (d_tmp[22]), .l1clk (l1clk), .si (so_tmp[22]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U24 ( .q (d_tmp[24]), .so (so_tmp[24]), .d (d_tmp[23]), .l1clk (l1clk), .si (so_tmp[23]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U25 ( .q (d_tmp[25]), .so (so_tmp[25]), .d (d_tmp[24]), .l1clk (l1clk), .si (so_tmp[24]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U26 ( .q (d_tmp[26]), .so (so_tmp[26]), .d (d_tmp[25]), .l1clk (l1clk), .si (so_tmp[25]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U27 ( .q (d_tmp[27]), .so (so_tmp[27]), .d (d_tmp[26]), .l1clk (l1clk), .si (so_tmp[26]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U28 ( .q (d_tmp[28]), .so (so_tmp[28]), .d (d_tmp[27]), .l1clk (l1clk), .si (so_tmp[27]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U29 ( .q (d_tmp[29]), .so (so_tmp[29]), .d (d_tmp[28]), .l1clk (l1clk), .si (so_tmp[28]), .siclk (siclk), .soclk (soclk), .reset (reset) );

   my_msff_arst_4x U30 ( .q (d_tmp[30]), .so (so_tmp[30]), .d (d_tmp[29]), .l1clk (l1clk), .si (so_tmp[29]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U31 ( .q (d_tmp[31]), .so (so_tmp[31]), .d (d_tmp[30]), .l1clk (l1clk), .si (so_tmp[30]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U32 ( .q (d_tmp[32]), .so (so_tmp[32]), .d (d_tmp[31]), .l1clk (l1clk), .si (so_tmp[31]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U33 ( .q (d_tmp[33]), .so (so_tmp[33]), .d (d_tmp[32]), .l1clk (l1clk), .si (so_tmp[32]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U34 ( .q (d_tmp[34]), .so (so_tmp[34]), .d (d_tmp[33]), .l1clk (l1clk), .si (so_tmp[33]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U35 ( .q (d_tmp[35]), .so (so_tmp[35]), .d (d_tmp[34]), .l1clk (l1clk), .si (so_tmp[34]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U36 ( .q (d_tmp[36]), .so (so_tmp[36]), .d (d_tmp[35]), .l1clk (l1clk), .si (so_tmp[35]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U37 ( .q (d_tmp[37]), .so (so_tmp[37]), .d (d_tmp[36]), .l1clk (l1clk), .si (so_tmp[36]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U38 ( .q (d_tmp[38]), .so (so_tmp[38]), .d (d_tmp[37]), .l1clk (l1clk), .si (so_tmp[37]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U39 ( .q (d_tmp[39]), .so (so_tmp[39]), .d (d_tmp[38]), .l1clk (l1clk), .si (so_tmp[38]), .siclk (siclk), .soclk (soclk), .reset (reset) );

   my_msff_arst_4x U40 ( .q (d_tmp[40]), .so (so_tmp[40]), .d (d_tmp[39]), .l1clk (l1clk), .si (so_tmp[39]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U41 ( .q (d_tmp[41]), .so (so_tmp[41]), .d (d_tmp[40]), .l1clk (l1clk), .si (so_tmp[40]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U42 ( .q (d_tmp[42]), .so (so_tmp[42]), .d (d_tmp[41]), .l1clk (l1clk), .si (so_tmp[41]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U43 ( .q (d_tmp[43]), .so (so_tmp[43]), .d (d_tmp[42]), .l1clk (l1clk), .si (so_tmp[42]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U44 ( .q (d_tmp[44]), .so (so_tmp[44]), .d (d_tmp[43]), .l1clk (l1clk), .si (so_tmp[43]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U45 ( .q (d_tmp[45]), .so (so_tmp[45]), .d (d_tmp[44]), .l1clk (l1clk), .si (so_tmp[44]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U46 ( .q (d_tmp[46]), .so (so_tmp[46]), .d (d_tmp[45]), .l1clk (l1clk), .si (so_tmp[45]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U47 ( .q (d_tmp[47]), .so (so_tmp[47]), .d (d_tmp[46]), .l1clk (l1clk), .si (so_tmp[46]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U48 ( .q (d_tmp[48]), .so (so_tmp[48]), .d (d_tmp[47]), .l1clk (l1clk), .si (so_tmp[47]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U49 ( .q (d_tmp[49]), .so (so_tmp[49]), .d (d_tmp[48]), .l1clk (l1clk), .si (so_tmp[48]), .siclk (siclk), .soclk (soclk), .reset (reset) );

   my_msff_arst_4x U50 ( .q (d_tmp[50]), .so (so_tmp[50]), .d (d_tmp[49]), .l1clk (l1clk), .si (so_tmp[49]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U51 ( .q (d_tmp[51]), .so (so_tmp[51]), .d (d_tmp[50]), .l1clk (l1clk), .si (so_tmp[50]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U52 ( .q (d_tmp[52]), .so (so_tmp[52]), .d (d_tmp[51]), .l1clk (l1clk), .si (so_tmp[51]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U53 ( .q (d_tmp[53]), .so (so_tmp[53]), .d (d_tmp[52]), .l1clk (l1clk), .si (so_tmp[52]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U54 ( .q (d_tmp[54]), .so (so_tmp[54]), .d (d_tmp[53]), .l1clk (l1clk), .si (so_tmp[53]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U55 ( .q (d_tmp[55]), .so (so_tmp[55]), .d (d_tmp[54]), .l1clk (l1clk), .si (so_tmp[54]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U56 ( .q (d_tmp[56]), .so (so_tmp[56]), .d (d_tmp[55]), .l1clk (l1clk), .si (so_tmp[55]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U57 ( .q (d_tmp[57]), .so (so_tmp[57]), .d (d_tmp[56]), .l1clk (l1clk), .si (so_tmp[56]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U58 ( .q (d_tmp[58]), .so (so_tmp[58]), .d (d_tmp[57]), .l1clk (l1clk), .si (so_tmp[57]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U59 ( .q (d_tmp[59]), .so (so_tmp[59]), .d (d_tmp[58]), .l1clk (l1clk), .si (so_tmp[58]), .siclk (siclk), .soclk (soclk), .reset (reset) );

   my_msff_arst_4x U60 ( .q (d_tmp[60]), .so (so_tmp[60]), .d (d_tmp[59]), .l1clk (l1clk), .si (so_tmp[59]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U61 ( .q (d_tmp[61]), .so (so_tmp[61]), .d (d_tmp[60]), .l1clk (l1clk), .si (so_tmp[60]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U62 ( .q (d_tmp[62]), .so (so_tmp[62]), .d (d_tmp[61]), .l1clk (l1clk), .si (so_tmp[61]), .siclk (siclk), .soclk (soclk), .reset (reset) );
   my_msff_arst_4x U63 ( .q (d_tmp[63]), .so (so_tmp[63]), .d (d_tmp[62]), .l1clk (l1clk), .si (so_tmp[62]), .siclk (siclk), .soclk (soclk), .reset (reset) );
endmodule


// *******************************************
// 7 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_7 (  q, so, d, l1clk, si, siclk, soclk, reset_n );

   output [6:0]	q;
   output	so;

   input  [6:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[6:0] so_tmp;
   wire 	reset;

   assign   reset  = ~reset_n;
   assign so    = so_tmp[6];

my_msff_arst_4x U0 ( .q (q[0]), .so (so_tmp[0]), .d (d[0]), .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U1 ( .q (q[1]), .so (so_tmp[1]), .d (d[1]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U2 ( .q (q[2]), .so (so_tmp[2]), .d (d[2]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U3 ( .q (q[3]), .so (so_tmp[3]), .d (d[3]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U4 ( .q (q[4]), .so (so_tmp[4]), .d (d[4]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U5 ( .q (q[5]), .so (so_tmp[5]), .d (d[5]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U6 ( .q (q[6]), .so (so_tmp[6]), .d (d[6]), .l1clk (l1clk), .si (so_tmp[5]), .siclk (siclk), .soclk (soclk), .reset (reset) );

endmodule

// *******************************************
// 6 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_6 (  q, so, d, l1clk, si, siclk, soclk, reset_n );

   output [5:0]	q;
   output	so;

   input  [5:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[5:0] so_tmp;
   wire 	reset;

   assign   reset  = ~reset_n;
   assign so    = so_tmp[5];

my_msff_arst_4x U0 ( .q (q[0]), .so (so_tmp[0]), .d (d[0]), .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U1 ( .q (q[1]), .so (so_tmp[1]), .d (d[1]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U2 ( .q (q[2]), .so (so_tmp[2]), .d (d[2]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U3 ( .q (q[3]), .so (so_tmp[3]), .d (d[3]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U4 ( .q (q[4]), .so (so_tmp[4]), .d (d[4]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U5 ( .q (q[5]), .so (so_tmp[5]), .d (d[5]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk), .reset (reset) );

endmodule

// *******************************************
// 5 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_5 ( q, so, d, l1clk, si, siclk, soclk, reset_n );

   output [4:0]	q;
   output	so;

   input  [4:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	reset;

   assign   reset  = ~reset_n;

my_msff_arst_4x U0 ( .q (q[0]), .so (U0_so), .d (d[0]), .l1clk (l1clk), .si (U0_si), .siclk (siclk), .soclk (soclk), .reset (reset) ); 
my_msff_arst_4x U1 ( .q (q[1]), .so (U1_so), .d (d[1]), .l1clk (l1clk), .si (U1_si), .siclk (siclk), .soclk (soclk), .reset (reset) ); 
my_msff_arst_4x U2 ( .q (q[2]), .so (U2_so), .d (d[2]), .l1clk (l1clk), .si (U2_si), .siclk (siclk), .soclk (soclk), .reset (reset) ); 
my_msff_arst_4x U3 ( .q (q[3]), .so (U3_so), .d (d[3]), .l1clk (l1clk), .si (U3_si), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U4 ( .q (q[4]), .so (U4_so), .d (d[4]), .l1clk (l1clk), .si (U4_si), .siclk (siclk), .soclk (soclk), .reset (reset) );

assign U0_si = si;
assign U1_si = U0_so;
assign U2_si = U1_so;
assign U3_si = U2_so;
assign U4_si = U3_so;
assign so    = U4_so;

endmodule


// *******************************************
// 4 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_4 (  q, so, d, l1clk, si, siclk, soclk, reset_n );
   output [3:0]	q;
   output	so;
   input  [3:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[3:0] so_tmp;
   wire 	reset;

   	assign   reset  = ~reset_n;
	assign so    = so_tmp[3];

my_msff_arst_4x U0 ( .q (q[0]), .so (so_tmp[0]), .d (d[0]), .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U1 ( .q (q[1]), .so (so_tmp[1]), .d (d[1]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U2 ( .q (q[2]), .so (so_tmp[2]), .d (d[2]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U3 ( .q (q[3]), .so (so_tmp[3]), .d (d[3]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk), .reset (reset) );

endmodule

// *******************************************
// 3 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_3 (  q, so, d, l1clk, si, siclk, soclk, reset_n );
   output [2:0]	q;
   output	so;
   input  [2:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire 	[2:0] so_tmp;
   wire 	reset;

   	assign   reset  = ~reset_n;
	assign so    = so_tmp[2];

my_msff_arst_4x U0 ( .q (q[0]), .so (so_tmp[0]), .d (d[0]), .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U1 ( .q (q[1]), .so (so_tmp[1]), .d (d[1]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U2 ( .q (q[2]), .so (so_tmp[2]), .d (d[2]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk), .reset (reset) );

endmodule
// *******************************************
// 2 flops (async reset)
// *******************************************

module ccu_msff_arst_4x_2 (  q, so, d, l1clk, si, siclk, soclk, reset_n );
   output [1:0]	q;
   output so;
   input  [1:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input   	reset_n;

   wire [1:0] so_tmp;
   wire 	reset;

   	assign reset  = ~reset_n;
	assign so = so_tmp[1];

my_msff_arst_4x U0 ( .q (q[0]), .so (so_tmp[0]), .d (d[0]), .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk), .reset (reset) );
my_msff_arst_4x U1 ( .q (q[1]), .so (so_tmp[1]), .d (d[1]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk), .reset (reset) );

endmodule



//////////////////////////////////////////////// 
//
// ALL SYNC-RESETTABLE FLOPS 
//
//////////////////////////////////////////////// 

// *******************************************
// 64 flops
// *******************************************

module ccu_msff_syrst_1x_64 ( q, so, d, l1clk, si, siclk, soclk, reset );

   output [63:0] q;
   output	so;

   input  [63:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;
   input    reset;

   wire  [1:0] so_tmp;

   assign so = so_tmp[1];

   ccu_msff_syrst_1x_32 U0 ( .reset(reset), .q (q[31:0]),  .so (so_tmp[0]), .d (d[31:0]),  .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk) );
   ccu_msff_syrst_1x_32 U1 ( .reset(reset), .q (q[63:32]), .so (so_tmp[1]), .d (d[63:32]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk) );

endmodule


// *******************************************
// 2 flops
// *******************************************

module ccu_msff_syrst_1x_2 ( q, so, d, l1clk, si, siclk, soclk, reset );

   input 	reset;
   output [1:0] q;
   output	so;

   input  [1:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

cl_a1_msff_syrst_1x U0 ( .reset (reset), .q (q[0]), .so (U0_so), .d (d[0]), .l1clk (l1clk), .si (U0_si), .siclk (siclk), .soclk (soclk) ); 
cl_a1_msff_syrst_1x U1 ( .reset (reset), .q (q[1]), .so (U1_so), .d (d[1]), .l1clk (l1clk), .si (U1_si), .siclk (siclk), .soclk (soclk) );

assign U0_si = si;
assign U1_si = U0_so;
assign so = U1_so;

endmodule


// *******************************************
// 4 flops
// *******************************************

module ccu_msff_syrst_1x_4 ( q, so, d, l1clk, si, siclk, soclk, reset );

   output [3:0] q;
   output	so;

   input 	reset;
   input  [3:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

ccu_msff_syrst_1x_2 U0 ( .reset (reset), .q (q[1:0]), .so (U0_so), .d (d[1:0]), .l1clk (l1clk), .si (U0_si), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_2 U1 ( .reset (reset), .q (q[3:2]), .so (U1_so), .d (d[3:2]), .l1clk (l1clk), .si (U1_si), .siclk (siclk), .soclk (soclk) );

assign U0_si = si;
assign U1_si = U0_so;
assign so = U1_so;

endmodule

// *******************************************
// 128 flops
// *******************************************

module ccu_msff_syrst_1x_128 ( q, so, d, l1clk, si, siclk, soclk, reset );

   output [127:0] q;
   output	so;

   input 	reset;
   input  [127:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

ccu_msff_syrst_1x_64 U0 ( .reset (reset), .q (q[63:0]), .so (U0_so), .d (d[63:0]), .l1clk (l1clk), .si (U0_si), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_64 U1 ( .reset (reset), .q (q[127:64]), .so (U1_so), .d (d[127:64]), .l1clk (l1clk), .si (U1_si), .siclk (siclk), .soclk (soclk) );

assign U0_si = si;
assign U1_si = U0_so;
assign so = U1_so;

endmodule

// *******************************************
// 32 flops
// *******************************************

module ccu_msff_syrst_1x_32 ( q, so, d, l1clk, si, siclk, soclk, reset );

   output [31:0] q;
   output	so;

   input    reset;
   input  [31:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

   wire 	[6:0] so_tmp;

ccu_msff_syrst_1x_4 U0 ( .reset(reset), .q (q[3:0]),   .so (so_tmp[0]), .d (d[3:0]), .l1clk (l1clk),   .si (si), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U1 ( .reset(reset), .q (q[7:4]),   .so (so_tmp[1]), .d (d[7:4]), .l1clk (l1clk),   .si (so_tmp[0]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U2 ( .reset(reset), .q (q[11:8]),  .so (so_tmp[2]), .d (d[11:8]), .l1clk (l1clk),  .si (so_tmp[1]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U3 ( .reset(reset), .q (q[15:12]), .so (so_tmp[3]), .d (d[15:12]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U4 ( .reset(reset), .q (q[19:16]), .so (so_tmp[4]), .d (d[19:16]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U5 ( .reset(reset), .q (q[23:20]), .so (so_tmp[5]), .d (d[23:20]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U6 ( .reset(reset), .q (q[27:24]), .so (so_tmp[6]), .d (d[27:24]), .l1clk (l1clk), .si (so_tmp[5]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4 U7 ( .reset(reset), .q (q[31:28]), .so (so       ), .d (d[31:28]), .l1clk (l1clk), .si (so_tmp[6]), .siclk (siclk), .soclk (soclk) );

endmodule

// *******************************************
// 117 flops
// *******************************************

module ccu_msff_syrst_1x_117 ( reset, q, so, d, l1clk, si, siclk, soclk );

   output [116:0] q;
   output	so;

   input 	reset;
   input  [116:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

   wire 	[5:0] so_tmp;

ccu_msff_syrst_1x_64 U0 ( .reset(reset), .q (q[63:0]),    .so (so_tmp[0]), .d (d[63:0]),    .l1clk (l1clk), .si (si), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_32 U1 ( .reset(reset), .q (q[95:64]),   .so (so_tmp[1]), .d (d[95:64]),   .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_6  U2 ( .reset(reset), .q (q[101:96]),  .so (so_tmp[2]), .d (d[101:96]),  .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_6  U3 ( .reset(reset), .q (q[107:102]), .so (so_tmp[3]), .d (d[107:102]), .l1clk (l1clk), .si (so_tmp[2]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4  U4 ( .reset(reset), .q (q[111:108]), .so (so_tmp[4]), .d (d[111:108]), .l1clk (l1clk), .si (so_tmp[3]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_4  U5 ( .reset(reset), .q (q[115:112]), .so (so_tmp[5]), .d (d[115:112]), .l1clk (l1clk), .si (so_tmp[4]), .siclk (siclk), .soclk (soclk) );
cl_a1_msff_syrst_1x  U6 ( .reset(reset), .q (q[116:116]), .so (so       ), .d (d[116:116]), .l1clk (l1clk), .si (so_tmp[5]), .siclk (siclk), .soclk (soclk) );

endmodule
// *******************************************
// 6 flops
// *******************************************

module ccu_msff_syrst_1x_6 ( reset, q, so, d, l1clk, si, siclk, soclk);

   output [5:0]	q;
   output	so;
	input 	reset;
   input  [5:0]	 d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

cl_a1_msff_syrst_1x U0 ( .reset (reset), .q (q[0]), .so (U0_so), .d (d[0]), .l1clk (l1clk), .si (U0_si), .siclk (siclk), .soclk (soclk) ); 
cl_a1_msff_syrst_1x U1 ( .reset (reset), .q (q[1]), .so (U1_so), .d (d[1]), .l1clk (l1clk), .si (U1_si), .siclk (siclk), .soclk (soclk) );
cl_a1_msff_syrst_1x U2 ( .reset (reset), .q (q[2]), .so (U2_so), .d (d[2]), .l1clk (l1clk), .si (U2_si), .siclk (siclk), .soclk (soclk) );
cl_a1_msff_syrst_1x U3 ( .reset (reset), .q (q[3]), .so (U3_so), .d (d[3]), .l1clk (l1clk), .si (U3_si), .siclk (siclk), .soclk (soclk) ); 
cl_a1_msff_syrst_1x U4 ( .reset (reset), .q (q[4]), .so (U4_so), .d (d[4]), .l1clk (l1clk), .si (U4_si), .siclk (siclk), .soclk (soclk) ); 
cl_a1_msff_syrst_1x U5 ( .reset (reset), .q (q[5]), .so (U5_so), .d (d[5]), .l1clk (l1clk), .si (U5_si), .siclk (siclk), .soclk (soclk) );
 
assign U0_si = si;
assign U1_si = U0_so;
assign U2_si = U1_so;
assign U3_si = U2_so;
assign U4_si = U3_so;
assign U5_si = U4_so;
assign so    = U5_so;

endmodule

// *******************************************
// 76 flops
// *******************************************

module ccu_msff_syrst_1x_76 ( reset, q, so, d, l1clk, si, siclk, soclk );

   output [75:0] q;
   output	so;

   input	reset;
   input  [75:0] d;
   input	l1clk;
   input	si;
   input   	siclk;
   input   	soclk;

   wire 	[1:0] so_tmp;

ccu_msff_syrst_1x_64 U0 ( .reset(reset), .q (q[63:0]),  .so (so_tmp[0]), .d (d[63:0]),  .l1clk (l1clk), .si (si),        .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_6  U1 ( .reset(reset), .q (q[69:64]), .so (so_tmp[1]), .d (d[69:64]), .l1clk (l1clk), .si (so_tmp[0]), .siclk (siclk), .soclk (soclk) );
ccu_msff_syrst_1x_6  U2 ( .reset(reset), .q (q[75:70]), .so (so),        .d (d[75:70]), .l1clk (l1clk), .si (so_tmp[1]), .siclk (siclk), .soclk (soclk) );

endmodule




//////////////////////////////////////////////// 
//
// ONLY LATCHES FOLLOW 
//
//////////////////////////////////////////////// 


// *******************************************
// 1 latch
// *******************************************
module ccu_blatch_4x_1 (latout, so, d, l1clk, si, siclk, soclk);

output latout;
output so;
input d;
input l1clk;
input si;
input siclk;
input soclk;


cl_a1_blatch_4x U0 ( .latout(latout), .so(so), .d(d), .l1clk(l1clk), .si(si), .siclk(siclk), .soclk(soclk) );


endmodule // ccu_blatch_4x_1 


// *******************************************
// 6 latches
// *******************************************
module ccu_blatch_4x_6 (latout, so, d, l1clk, si, siclk, soclk);
 
output [5:0] latout;
output so;
input [5:0] d;
input l1clk;
input si;
input siclk;
input soclk;

wire [5:0] so_tmp;

assign so = so_tmp[5];


cl_a1_blatch_4x U0 ( .latout(latout[0]), .l1clk (l1clk), .d (d[0]), 
					 .so(so_tmp[0]), .si (si), .siclk(siclk), .soclk(soclk) );
cl_a1_blatch_4x U1 ( .latout(latout[1]), .l1clk (l1clk), .d (d[1]), 
					 .so(so_tmp[1]), .si (so_tmp[0]), .siclk(siclk), .soclk(soclk) );
cl_a1_blatch_4x U2 ( .latout(latout[2]), .l1clk (l1clk), .d (d[2]), 
					 .so(so_tmp[2]), .si (so_tmp[1]), .siclk(siclk), .soclk(soclk) );
cl_a1_blatch_4x U3 ( .latout(latout[3]), .l1clk (l1clk), .d (d[3]), 
					 .so(so_tmp[3]), .si (so_tmp[2]), .siclk(siclk), .soclk(soclk) );
cl_a1_blatch_4x U4 ( .latout(latout[4]), .l1clk (l1clk), .d (d[4]), 
					 .so(so_tmp[4]), .si (so_tmp[3]), .siclk(siclk), .soclk(soclk) );
cl_a1_blatch_4x U5 ( .latout(latout[5]), .l1clk (l1clk), .d (d[5]), 
					 .so(so_tmp[5]), .si (so_tmp[4]), .siclk(siclk), .soclk(soclk) );

endmodule // ccu_blatch_4x_6 




