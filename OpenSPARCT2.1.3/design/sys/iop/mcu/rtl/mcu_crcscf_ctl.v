// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_crcscf_ctl.v
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
module mcu_crcscf_ctl (
  in, 
  crc);

   input [25:0] in;
   output [9:0] crc;
   
   assign crc[0] = in[25] ^ in[22] ^ in[21] ^ in[19] ^ in[17] ^ in[16] ^ in[14] ^ 
		   in[13] ^ in[10] ^ in[8] ^ in[2] ^ in[1] ^ in[0]; 
   assign crc[1] = in[25] ^ in[23] ^ in[21] ^ in[20] ^ in[19] ^ in[18] ^ in[16] ^ 
		   in[15] ^ in[13] ^ in[11] ^ in[10] ^ in[9] ^ in[8] ^ in[3] ^ in[0]; 
   assign crc[2] = in[25] ^ in[24] ^ in[20] ^ in[13] ^ in[12] ^ in[11] ^ in[9] ^ 
		   in[8] ^ in[4] ^ in[2] ^ in[0]; 
   assign crc[3] = in[22] ^ in[19] ^ in[17] ^ in[16] ^ in[12] ^ in[9] ^ in[8] ^ 
		   in[5] ^ in[3] ^ in[2] ^ in[0]; 
   assign crc[4] = in[25] ^ in[23] ^ in[22] ^ in[21] ^ in[20] ^ in[19] ^ in[18] ^ 
		   in[16] ^ in[14] ^ in[9] ^ in[8] ^ in[6] ^ in[4] ^ in[3] ^ 
		   in[2] ^ in[0]; 
   assign crc[5] = in[24] ^ in[23] ^ in[22] ^ in[21] ^ in[20] ^ in[19] ^ in[17] ^ 
		   in[15] ^ in[10] ^ in[9] ^ in[7] ^ in[5] ^ in[4] ^ in[3] ^ in[1]; 
   assign crc[6] = in[24] ^ in[23] ^ in[20] ^ in[19] ^ in[18] ^ in[17] ^ in[14] ^ 
		   in[13] ^ in[11] ^ in[6] ^ in[5] ^ in[4] ^ in[1] ^ in[0]; 
   assign crc[7] = in[24] ^ in[22] ^ in[20] ^ in[18] ^ in[17] ^ in[16] ^ in[15] ^ 
		   in[13] ^ in[12] ^ in[10] ^ in[8] ^ in[7] ^ in[6] ^ in[5] ^ in[0]; 
   assign crc[8] = in[25] ^ in[23] ^ in[21] ^ in[19] ^ in[18] ^ in[17] ^ in[16] ^ 
		   in[14] ^ in[13] ^ in[11] ^ in[9] ^ in[8] ^ in[7] ^ in[6] ^ in[1]; 
   assign crc[9] = in[25] ^ in[24] ^ in[21] ^ in[20] ^ in[18] ^ in[16] ^ in[15] ^ 
		   in[13] ^ in[12] ^ in[9] ^ in[7] ^ in[1] ^ in[0]; 

endmodule

