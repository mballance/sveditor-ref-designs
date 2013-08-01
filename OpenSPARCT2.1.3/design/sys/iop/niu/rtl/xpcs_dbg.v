// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_dbg.v
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
module xpcs_dbg (csr_vendor_debug_sel,
                 training_vector,
                 rx0_debug,
                 rx1_debug,
                 rx2_debug,
                 rx3_debug,
                 tx0_debug,
                 tx1_debug,
                 tx2_debug,
                 tx3_debug,
                 xpcs_debug);

input  [3:0]  csr_vendor_debug_sel;
input  [31:0] training_vector;
input  [31:0] rx0_debug;
input  [31:0] rx1_debug;
input  [31:0] rx2_debug;
input  [31:0] rx3_debug;

input  [31:0] tx0_debug;
input  [31:0] tx1_debug;
input  [31:0] tx2_debug;
input  [31:0] tx3_debug;

output [31:0] xpcs_debug;

reg [31:0] xpcs_debug;

always @ (csr_vendor_debug_sel or rx0_debug or rx1_debug or rx2_debug or
          rx3_debug or tx0_debug or tx1_debug or tx2_debug or tx3_debug or
          training_vector)
    case (csr_vendor_debug_sel[3:0]) // synopsys parallel_case infer_mux
     4'h0 : xpcs_debug = rx0_debug; 
     4'h1 : xpcs_debug = rx1_debug;
     4'h2 : xpcs_debug = rx2_debug;
     4'h3 : xpcs_debug = rx3_debug;
     4'h4 : xpcs_debug = tx0_debug;
     4'h5 : xpcs_debug = tx1_debug;
     4'h6 : xpcs_debug = tx2_debug;
     4'h7 : xpcs_debug = tx3_debug;
     `SEL_xpcs_training_vector: xpcs_debug = training_vector;
   default: xpcs_debug = rx0_debug;

   endcase

endmodule

