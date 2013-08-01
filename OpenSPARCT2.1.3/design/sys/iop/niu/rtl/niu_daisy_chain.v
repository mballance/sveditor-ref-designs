// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_daisy_chain.v
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
/* This file is genetated from daisy_chain.c */ 

module niu_daisy_chain (req_mux_dout,gnt); 
   input  [63:0]    req_mux_dout; 
   output [63:0]    gnt; 
  
 
   wire   [63:0]    req_mux_dout; 
   wire   [63:0]    gnt; 
  
 
  assign gnt[0] = req_mux_dout[0]; 
  assign gnt[1] = req_mux_dout[1] & ~(gnt[0]);
  assign gnt[2] = req_mux_dout[2] & ~(|gnt[1:0]);
  assign gnt[3] = req_mux_dout[3] & ~(|gnt[2:0]);
  assign gnt[4] = req_mux_dout[4] & ~(|gnt[3:0]);
  assign gnt[5] = req_mux_dout[5] & ~(|gnt[4:0]);
  assign gnt[6] = req_mux_dout[6] & ~(|gnt[5:0]);
  assign gnt[7] = req_mux_dout[7] & ~(|gnt[6:0]);
  assign gnt[8] = req_mux_dout[8] & ~(|gnt[7:0]);
  assign gnt[9] = req_mux_dout[9] & ~(|gnt[8:0]);
  assign gnt[10] = req_mux_dout[10] & ~(|gnt[9:0]);
  assign gnt[11] = req_mux_dout[11] & ~(|gnt[10:0]);
  assign gnt[12] = req_mux_dout[12] & ~(|gnt[11:0]);
  assign gnt[13] = req_mux_dout[13] & ~(|gnt[12:0]);
  assign gnt[14] = req_mux_dout[14] & ~(|gnt[13:0]);
  assign gnt[15] = req_mux_dout[15] & ~(|gnt[14:0]);
  assign gnt[16] = req_mux_dout[16] & ~(|gnt[15:0]);
  assign gnt[17] = req_mux_dout[17] & ~(|gnt[16:0]);
  assign gnt[18] = req_mux_dout[18] & ~(|gnt[17:0]);
  assign gnt[19] = req_mux_dout[19] & ~(|gnt[18:0]);
  assign gnt[20] = req_mux_dout[20] & ~(|gnt[19:0]);
  assign gnt[21] = req_mux_dout[21] & ~(|gnt[20:0]);
  assign gnt[22] = req_mux_dout[22] & ~(|gnt[21:0]);
  assign gnt[23] = req_mux_dout[23] & ~(|gnt[22:0]);
  assign gnt[24] = req_mux_dout[24] & ~(|gnt[23:0]);
  assign gnt[25] = req_mux_dout[25] & ~(|gnt[24:0]);
  assign gnt[26] = req_mux_dout[26] & ~(|gnt[25:0]);
  assign gnt[27] = req_mux_dout[27] & ~(|gnt[26:0]);
  assign gnt[28] = req_mux_dout[28] & ~(|gnt[27:0]);
  assign gnt[29] = req_mux_dout[29] & ~(|gnt[28:0]);
  assign gnt[30] = req_mux_dout[30] & ~(|gnt[29:0]);
  assign gnt[31] = req_mux_dout[31] & ~(|gnt[30:0]);
  assign gnt[32] = req_mux_dout[32] & ~(|gnt[31:0]);
  assign gnt[33] = req_mux_dout[33] & ~(|gnt[32:0]);
  assign gnt[34] = req_mux_dout[34] & ~(|gnt[33:0]);
  assign gnt[35] = req_mux_dout[35] & ~(|gnt[34:0]);
  assign gnt[36] = req_mux_dout[36] & ~(|gnt[35:0]);
  assign gnt[37] = req_mux_dout[37] & ~(|gnt[36:0]);
  assign gnt[38] = req_mux_dout[38] & ~(|gnt[37:0]);
  assign gnt[39] = req_mux_dout[39] & ~(|gnt[38:0]);
  assign gnt[40] = req_mux_dout[40] & ~(|gnt[39:0]);
  assign gnt[41] = req_mux_dout[41] & ~(|gnt[40:0]);
  assign gnt[42] = req_mux_dout[42] & ~(|gnt[41:0]);
  assign gnt[43] = req_mux_dout[43] & ~(|gnt[42:0]);
  assign gnt[44] = req_mux_dout[44] & ~(|gnt[43:0]);
  assign gnt[45] = req_mux_dout[45] & ~(|gnt[44:0]);
  assign gnt[46] = req_mux_dout[46] & ~(|gnt[45:0]);
  assign gnt[47] = req_mux_dout[47] & ~(|gnt[46:0]);
  assign gnt[48] = req_mux_dout[48] & ~(|gnt[47:0]);
  assign gnt[49] = req_mux_dout[49] & ~(|gnt[48:0]);
  assign gnt[50] = req_mux_dout[50] & ~(|gnt[49:0]);
  assign gnt[51] = req_mux_dout[51] & ~(|gnt[50:0]);
  assign gnt[52] = req_mux_dout[52] & ~(|gnt[51:0]);
  assign gnt[53] = req_mux_dout[53] & ~(|gnt[52:0]);
  assign gnt[54] = req_mux_dout[54] & ~(|gnt[53:0]);
  assign gnt[55] = req_mux_dout[55] & ~(|gnt[54:0]);
  assign gnt[56] = req_mux_dout[56] & ~(|gnt[55:0]);
  assign gnt[57] = req_mux_dout[57] & ~(|gnt[56:0]);
  assign gnt[58] = req_mux_dout[58] & ~(|gnt[57:0]);
  assign gnt[59] = req_mux_dout[59] & ~(|gnt[58:0]);
  assign gnt[60] = req_mux_dout[60] & ~(|gnt[59:0]);
  assign gnt[61] = req_mux_dout[61] & ~(|gnt[60:0]);
  assign gnt[62] = req_mux_dout[62] & ~(|gnt[61:0]);
  assign gnt[63] = req_mux_dout[63] & ~(|gnt[62:0]);
   
endmodule // daisy_chain
