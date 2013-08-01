// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_encode_32.v
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
module niu_rdmc_encode_32 (din,dout);

input [15:0] din;
output[3:0]  dout;

reg  [3:0]  dout;

always @(din)
  case (din)
  /* 0in < case -parallel */
  16'b0000_0000_0000_0000: dout = 4'd0; 
  16'b0000_0000_0000_0001: dout = 4'd0; 
  16'b0000_0000_0000_0010: dout = 4'd1; 
  16'b0000_0000_0000_0100: dout = 4'd2; 
  16'b0000_0000_0000_1000: dout = 4'd3; 
  16'b0000_0000_0001_0000: dout = 4'd4; 
  16'b0000_0000_0010_0000: dout = 4'd5; 
  16'b0000_0000_0100_0000: dout = 4'd6; 
  16'b0000_0000_1000_0000: dout = 4'd7; 
  16'b0000_0001_0000_0000: dout = 4'd8; 
  16'b0000_0010_0000_0000: dout = 4'd9; 
  16'b0000_0100_0000_0000: dout = 4'd10; 
  16'b0000_1000_0000_0000: dout = 4'd11; 
  16'b0001_0000_0000_0000: dout = 4'd12; 
  16'b0010_0000_0000_0000: dout = 4'd13; 
  16'b0100_0000_0000_0000: dout = 4'd14; 
  16'b1000_0000_0000_0000: dout = 4'd15; 
  default: dout = 4'd0;
  endcase

endmodule
