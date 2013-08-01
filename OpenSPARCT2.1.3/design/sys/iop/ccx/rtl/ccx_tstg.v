// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccx_tstg.v
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
module ccx_tstg (
  dout, 
  din, 
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  local_stop);
wire scan_out0;
wire scan_out1;
wire scan_out2;
wire scan_out3;
wire scan_out4;
wire scan_out5;
wire scan_out6;
wire scan_out7;
wire scan_out8;


output [159:0] dout;

input [159:0]  din;

input           l2clk;          
input           scan_in;
output          scan_out;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_pce_ov;
input           local_stop;


n2_flop_bank_cust i0(
           .data_out(dout[15:0]),
           .data_in(din[15:0]),
           .scan_in(scan_in),
           .scan_out(scan_out0),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i1(
           .data_out(dout[31:16]),
           .data_in(din[31:16]),
           .scan_in(scan_out0),
           .scan_out(scan_out1),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i2(
           .data_out(dout[47:32]),
           .data_in(din[47:32]),
           .scan_in(scan_out1),
           .scan_out(scan_out2),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i3(
           .data_out(dout[63:48]),
           .data_in(din[63:48]),
           .scan_in(scan_out2),
           .scan_out(scan_out3),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i4(
           .data_out(dout[79:64]),
           .data_in(din[79:64]),
           .scan_in(scan_out3),
           .scan_out(scan_out4),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i5(
           .data_out(dout[95:80]),
           .data_in(din[95:80]),
           .scan_in(scan_out4),
           .scan_out(scan_out5),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i6(
           .data_out(dout[111:96]),
           .data_in(din[111:96]),
           .scan_in(scan_out5),
           .scan_out(scan_out6),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i7(
           .data_out(dout[127:112]),
           .data_in(din[127:112]),
           .scan_in(scan_out6),
           .scan_out(scan_out7),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i8(
           .data_out(dout[143:128]),
           .data_in(din[143:128]),
           .scan_in(scan_out7),
           .scan_out(scan_out8),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

n2_flop_bank_cust i9(
           .data_out(dout[159:144]),
           .data_in(din[159:144]),
           .scan_in(scan_out8),
           .scan_out(scan_out),
  .l2clk(l2clk),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .local_stop(local_stop)
);

endmodule // ccx_trep


