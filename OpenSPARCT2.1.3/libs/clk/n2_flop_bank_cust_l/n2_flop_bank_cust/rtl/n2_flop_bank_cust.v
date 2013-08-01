// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_flop_bank_cust.v
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
module n2_flop_bank_cust (
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  local_stop, 
  data_out, 
  data_in);
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire l1clk;
wire datain_ff_scanin;
wire datain_ff_scanout;

   
   
////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
   // Global interface
input		l2clk;		
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;
input           tcu_pce_ov;
input 		local_stop;
// Local interface
output [15:0]  data_out;
input  [15:0]  data_in;

//Internal Scan Chain
wire  [14:0]  fdin;
wire  [15:0]  flop_out;


// Internal signals
//wire   [15:0]		data;

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////

// Scan reassigns
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;

cl_u1_buf_32x buf_15_ ( .in(flop_out[15]), .out(data_out[15]));
cl_u1_buf_32x buf_14_ ( .in(flop_out[14]), .out(data_out[14]));
cl_u1_buf_32x buf_13_ ( .in(flop_out[13]), .out(data_out[13]));
cl_u1_buf_32x buf_12_ ( .in(flop_out[12]), .out(data_out[12]));
cl_u1_buf_32x buf_11_ ( .in(flop_out[11]), .out(data_out[11]));
cl_u1_buf_32x buf_10_ ( .in(flop_out[10]), .out(data_out[10]));
cl_u1_buf_32x buf_9_ ( .in(flop_out[9]), .out(data_out[9]));
cl_u1_buf_32x buf_8_ ( .in(flop_out[8]), .out(data_out[8]));
cl_u1_buf_32x buf_7_ ( .in(flop_out[7]), .out(data_out[7]));
cl_u1_buf_32x buf_6_ ( .in(flop_out[6]), .out(data_out[6]));
cl_u1_buf_32x buf_5_ ( .in(flop_out[5]), .out(data_out[5]));
cl_u1_buf_32x buf_4_ ( .in(flop_out[4]), .out(data_out[4]));
cl_u1_buf_32x buf_3_ ( .in(flop_out[3]), .out(data_out[3]));
cl_u1_buf_32x buf_2_ ( .in(flop_out[2]), .out(data_out[2]));
cl_u1_buf_32x buf_1_ ( .in(flop_out[1]), .out(data_out[1]));
cl_u1_buf_32x buf_0_ ( .in(flop_out[0]), .out(data_out[0]));

cl_sc1_l1hdr_32x c_0 (
   .l2clk(l2clk),
   .pce(1'b1),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(local_stop)
);

cl_sc1_msff_8x d0_0 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[0]),
.q(flop_out[0]),
.si(scan_in),
.so(fdin[0])
);

cl_sc1_msff_8x d0_1 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[1]),
.q(flop_out[1]),
.si(fdin[0]),
.so(fdin[1])
);

cl_sc1_msff_8x d0_2 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[2]),
.q(flop_out[2]),
.si(fdin[1]),
.so(fdin[2])
);

cl_sc1_msff_8x d0_3 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[3]),
.q(flop_out[3]),
.si(fdin[2]),
.so(fdin[3])
);

cl_sc1_msff_8x d0_4 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[4]),
.q(flop_out[4]),
.si(fdin[3]),
.so(fdin[4])
);


cl_sc1_msff_8x d0_5 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[5]),
.q(flop_out[5]),
.si(fdin[4]),
.so(fdin[5])
);

cl_sc1_msff_8x d0_6 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[6]),
.q(flop_out[6]),
.si(fdin[5]),
.so(fdin[6])
);

cl_sc1_msff_8x d0_7 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[7]),
.q(flop_out[7]),
.si(fdin[6]),
.so(fdin[7])
);

cl_sc1_msff_8x d0_8 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[8]),
.q(flop_out[8]),
.si(fdin[7]),
.so(fdin[8])
);

cl_sc1_msff_8x d0_9 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[9]),
.q(flop_out[9]),
.si(fdin[8]),
.so(fdin[9])
);

cl_sc1_msff_8x d0_10 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[10]),
.q(flop_out[10]),
.si(fdin[9]),
.so(fdin[10])
);

cl_sc1_msff_8x d0_11 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[11]),
.q(flop_out[11]),
.si(fdin[10]),
.so(fdin[11])
);

cl_sc1_msff_8x d0_12 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[12]),
.q(flop_out[12]),
.si(fdin[11]),
.so(fdin[12])
);

cl_sc1_msff_8x d0_13 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[13]),
.q(flop_out[13]),
.si(fdin[12]),
.so(fdin[13])
);

cl_sc1_msff_8x d0_14 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[14]),
.q(flop_out[14]),
.si(fdin[13]),
.so(fdin[14])
);

cl_sc1_msff_8x d0_15 (
.l1clk(l1clk),
.siclk(tcu_aclk),
.soclk(tcu_bclk),
.d(data_in[15]),
.q(flop_out[15]),
.si(fdin[14]),
.so(scan_out)
);


endmodule
