// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_decode.v
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

module niu_smx_decode(
        in,
        out
        );

// synopsys template

  parameter IN_SZ= 6;
  parameter OUT_SZ= 64;

  input [IN_SZ-1:0] in;
  output [OUT_SZ-1:0] out;

  reg [OUT_SZ-1:0] out;
  integer i;

  always @ (in) begin
    for(i=0;i<OUT_SZ;i=i+1) begin
      if(in==i[IN_SZ-1:0])
        out[i]= 1'b1;
      else
        out[i]= 1'b0;
    end
  end

endmodule
