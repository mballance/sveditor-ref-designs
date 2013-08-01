// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_crcsd_ctl.v
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
module mcu_crcsd_ctl (
  in, 
  crc);
   
   input [71:0] in;
   output [21:0] crc;
   
   assign crc[0] = in[70] ^ in[69] ^ in[66] ^ in[62] ^ in[61] ^ in[59] ^ in[58] ^ 
		   in[55] ^ in[54] ^ in[53] ^ in[50] ^ in[49] ^ in[42] ^ in[39] ^ 
		   in[33] ^ in[32] ^ in[31] ^ in[29] ^ in[27] ^ in[25] ^ in[24] ^ 
		   in[22] ^ in[21] ^ in[19] ^ in[18] ^ in[16] ^ in[15] ^ in[10] ^ 
		   in[9] ^ in[8] ^ in[0]; 
   assign crc[1] = in[71] ^ in[69] ^ in[67] ^ in[66] ^ in[63] ^ in[61] ^ in[60] ^ 
		   in[58] ^ in[56] ^ in[53] ^ in[51] ^ in[49] ^ in[43] ^ in[42] ^ 
		   in[40] ^ in[39] ^ in[34] ^ in[31] ^ in[30] ^ in[29] ^ in[28] ^ 
		   in[27] ^ in[26] ^ in[24] ^ in[23] ^ in[21] ^ in[20] ^ in[18] ^ 
		   in[17] ^ in[15] ^ in[11] ^ in[8] ^ in[1] ^ in[0]; 
   assign crc[2] = in[69] ^ in[68] ^ in[67] ^ in[66] ^ in[64] ^ in[58] ^ in[57] ^ 
		   in[55] ^ in[53] ^ in[52] ^ in[49] ^ in[44] ^ in[43] ^ in[42] ^ 
		   in[41] ^ in[40] ^ in[39] ^ in[35] ^ in[33] ^ in[30] ^ in[28] ^ 
		   in[15] ^ in[12] ^ in[10] ^ in[8] ^ in[2] ^ in[1] ^ in[0]; 
   assign crc[3] = in[68] ^ in[67] ^ in[66] ^ in[65] ^ in[62] ^ in[61] ^ in[56] ^ 
		   in[55] ^ in[49] ^ in[45] ^ in[44] ^ in[43] ^ in[41] ^ in[40] ^ 
		   in[39] ^ in[36] ^ in[34] ^ in[33] ^ in[32] ^ in[27] ^ in[25] ^ 
		   in[24] ^ in[22] ^ in[21] ^ in[19] ^ in[18] ^ in[15] ^ in[13] ^ 
		   in[11] ^ in[10] ^ in[8] ^ in[3] ^ in[2] ^ in[1] ^ in[0]; 
   assign crc[4] = in[69] ^ in[68] ^ in[67] ^ in[66] ^ in[63] ^ in[62] ^ in[57] ^ 
		   in[56] ^ in[50] ^ in[46] ^ in[45] ^ in[44] ^ in[42] ^ in[41] ^ 
		   in[40] ^ in[37] ^ in[35] ^ in[34] ^ in[33] ^ in[28] ^ in[26] ^ 
		   in[25] ^ in[23] ^ in[22] ^ in[20] ^ in[19] ^ in[16] ^ in[14] ^ 
		   in[12] ^ in[11] ^ in[9] ^ in[4] ^ in[3] ^ in[2] ^ in[1]; 
   assign crc[5] = in[70] ^ in[69] ^ in[68] ^ in[67] ^ in[64] ^ in[63] ^ in[58] ^ 
		   in[57] ^ in[51] ^ in[47] ^ in[46] ^ in[45] ^ in[43] ^ in[42] ^ 
		   in[41] ^ in[38] ^ in[36] ^ in[35] ^ in[34] ^ in[29] ^ in[27] ^ 
		   in[26] ^ in[24] ^ in[23] ^ in[21] ^ in[20] ^ in[17] ^ in[15] ^ 
		   in[13] ^ in[12] ^ in[10] ^ in[5] ^ in[4] ^ in[3] ^ in[2]; 
   assign crc[6] = in[71] ^ in[70] ^ in[69] ^ in[68] ^ in[65] ^ in[64] ^ in[59] ^ 
		   in[58] ^ in[52] ^ in[48] ^ in[47] ^ in[46] ^ in[44] ^ in[43] ^ 
		   in[42] ^ in[39] ^ in[37] ^ in[36] ^ in[35] ^ in[30] ^ in[28] ^ 
		   in[27] ^ in[25] ^ in[24] ^ in[22] ^ in[21] ^ in[18] ^ in[16] ^ 
		   in[14] ^ in[13] ^ in[11] ^ in[6] ^ in[5] ^ in[4] ^ in[3]; 
   assign crc[7] = in[71] ^ in[65] ^ in[62] ^ in[61] ^ in[60] ^ in[58] ^ in[55] ^ 
		   in[54] ^ in[50] ^ in[48] ^ in[47] ^ in[45] ^ in[44] ^ in[43] ^ 
		   in[42] ^ in[40] ^ in[39] ^ in[38] ^ in[37] ^ in[36] ^ in[33] ^ 
		   in[32] ^ in[28] ^ in[27] ^ in[26] ^ in[24] ^ in[23] ^ in[21] ^ 
		   in[18] ^ in[17] ^ in[16] ^ in[14] ^ in[12] ^ in[10] ^ in[9] ^ 
		   in[8] ^ in[7] ^ in[6] ^ in[5] ^ in[4] ^ in[0]; 
   assign crc[8] = in[66] ^ in[63] ^ in[62] ^ in[61] ^ in[59] ^ in[56] ^ in[55] ^ 
		   in[51] ^ in[49] ^ in[48] ^ in[46] ^ in[45] ^ in[44] ^ in[43] ^ 
		   in[41] ^ in[40] ^ in[39] ^ in[38] ^ in[37] ^ in[34] ^ in[33] ^ 
		   in[29] ^ in[28] ^ in[27] ^ in[25] ^ in[24] ^ in[22] ^ in[19] ^ 
		   in[18] ^ in[17] ^ in[15] ^ in[13] ^ in[11] ^ in[10] ^ in[9] ^
		   in[8] ^ in[7] ^ in[6] ^ in[5] ^ in[1]; 
   assign crc[9] = in[67] ^ in[64] ^ in[63] ^ in[62] ^ in[60] ^ in[57] ^ in[56] ^ 
		   in[52] ^ in[50] ^ in[49] ^ in[47] ^ in[46] ^ in[45] ^ in[44] ^ 
		   in[42] ^ in[41] ^ in[40] ^ in[39] ^ in[38] ^ in[35] ^ in[34] ^ 
		   in[30] ^ in[29] ^ in[28] ^ in[26] ^ in[25] ^ in[23] ^ in[20] ^ 
		   in[19] ^ in[18] ^ in[16] ^ in[14] ^ in[12] ^ in[11] ^ in[10] ^ 
		   in[9] ^ in[8] ^ in[7] ^ in[6] ^ in[2]; 
   assign crc[10] = in[68] ^ in[65] ^ in[64] ^ in[63] ^ in[61] ^ in[58] ^ in[57] ^ 
		    in[53] ^ in[51] ^ in[50] ^ in[48] ^ in[47] ^ in[46] ^ in[45] ^ 
		    in[43] ^ in[42] ^ in[41] ^ in[40] ^ in[39] ^ in[36] ^ in[35] ^ 
		    in[31] ^ in[30] ^ in[29] ^ in[27] ^ in[26] ^ in[24] ^ in[21] ^ 
		    in[20] ^ in[19] ^ in[17] ^ in[15] ^ in[13] ^ in[12] ^ in[11] ^ 
		    in[10] ^ in[9] ^ in[8] ^ in[7] ^ in[3]; 
   assign crc[11] = in[69] ^ in[66] ^ in[65] ^ in[64] ^ in[62] ^ in[59] ^ in[58] ^ 
		    in[54] ^ in[52] ^ in[51] ^ in[49] ^ in[48] ^ in[47] ^ in[46] ^ 
		    in[44] ^ in[43] ^ in[42] ^ in[41] ^ in[40] ^ in[37] ^ in[36] ^ 
		    in[32] ^ in[31] ^ in[30] ^ in[28] ^ in[27] ^ in[25] ^ in[22] ^ 
		    in[21] ^ in[20] ^ in[18] ^ in[16] ^ in[14] ^ in[13] ^ in[12] ^ 
		    in[11] ^ in[10] ^ in[9] ^ in[8] ^ in[4]; 
   assign crc[12] = in[69] ^ in[67] ^ in[65] ^ in[63] ^ in[62] ^ in[61] ^ in[60] ^ 
		    in[58] ^ in[54] ^ in[52] ^ in[48] ^ in[47] ^ in[45] ^ in[44] ^ 
		    in[43] ^ in[41] ^ in[39] ^ in[38] ^ in[37] ^ in[28] ^ in[27] ^ 
		    in[26] ^ in[25] ^ in[24] ^ in[23] ^ in[18] ^ in[17] ^ in[16] ^ 
		    in[14] ^ in[13] ^ in[12] ^ in[11] ^ in[8] ^ in[5] ^ in[0]; 
   assign crc[13] = in[69] ^ in[68] ^ in[64] ^ in[63] ^ in[58] ^ in[54] ^ in[50] ^  
		    in[48] ^ in[46] ^ in[45] ^ in[44] ^ in[40] ^ in[38] ^ in[33] ^  
		    in[32] ^ in[31] ^ in[28] ^ in[26] ^ in[22] ^ in[21] ^ in[17] ^  
		    in[16] ^ in[14] ^ in[13] ^ in[12] ^ in[10] ^ in[8] ^ in[6] ^  
		    in[1] ^ in[0]; 
   assign crc[14] = in[66] ^ in[65] ^ in[64] ^ in[62] ^ in[61] ^ in[58] ^ in[54] ^  
		    in[53] ^ in[51] ^ in[50] ^ in[47] ^ in[46] ^ in[45] ^ in[42] ^  
		    in[41] ^ in[34] ^ in[31] ^ in[25] ^ in[24] ^ in[23] ^ in[21] ^  
		    in[19] ^ in[17] ^ in[16] ^ in[14] ^ in[13] ^ in[11] ^ in[10] ^  
		    in[8] ^ in[7] ^ in[2] ^ in[1] ^ in[0]; 
   assign crc[15] = in[67] ^ in[66] ^ in[65] ^ in[63] ^ in[62] ^ in[59] ^ in[55] ^  
		    in[54] ^ in[52] ^ in[51] ^ in[48] ^ in[47] ^ in[46] ^ in[43] ^  
		    in[42] ^ in[35] ^ in[32] ^ in[26] ^ in[25] ^ in[24] ^ in[22] ^  
		    in[20] ^ in[18] ^ in[17] ^ in[15] ^ in[14] ^ in[12] ^ in[11] ^  
		    in[9] ^ in[8] ^ in[3] ^ in[2] ^ in[1]; 
   assign crc[16] = in[68] ^ in[67] ^ in[66] ^ in[64] ^ in[63] ^ in[60] ^ in[56] ^  
		    in[55] ^ in[53] ^ in[52] ^ in[49] ^ in[48] ^ in[47] ^ in[44] ^  
		    in[43] ^ in[36] ^ in[33] ^ in[27] ^ in[26] ^ in[25] ^ in[23] ^  
		    in[21] ^ in[19] ^ in[18] ^ in[16] ^ in[15] ^ in[13] ^ in[12] ^  
		    in[10] ^ in[9] ^ in[4] ^ in[3] ^ in[2]; 
   assign crc[17] = in[69] ^ in[68] ^ in[67] ^ in[65] ^ in[64] ^ in[61] ^ in[57] ^  
		    in[56] ^ in[54] ^ in[53] ^ in[50] ^ in[49] ^ in[48] ^ in[45] ^  
		    in[44] ^ in[37] ^ in[34] ^ in[28] ^ in[27] ^ in[26] ^ in[24] ^  
		    in[22] ^ in[20] ^ in[19] ^ in[17] ^ in[16] ^ in[14] ^ in[13] ^  
		    in[11] ^ in[10] ^ in[5] ^ in[4] ^ in[3]; 
   assign crc[18] = in[70] ^ in[69] ^ in[68] ^ in[66] ^ in[65] ^ in[62] ^ in[58] ^  
		    in[57] ^ in[55] ^ in[54] ^ in[51] ^ in[50] ^ in[49] ^ in[46] ^  
		    in[45] ^ in[38] ^ in[35] ^ in[29] ^ in[28] ^ in[27] ^ in[25] ^  
		    in[23] ^ in[21] ^ in[20] ^ in[18] ^ in[17] ^ in[15] ^ in[14] ^  
		    in[12] ^ in[11] ^ in[6] ^ in[5] ^ in[4]; 
   assign crc[19] = in[71] ^ in[70] ^ in[69] ^ in[67] ^ in[66] ^ in[63] ^ in[59] ^  
		    in[58] ^ in[56] ^ in[55] ^ in[52] ^ in[51] ^ in[50] ^ in[47] ^  
		    in[46] ^ in[39] ^ in[36] ^ in[30] ^ in[29] ^ in[28] ^ in[26] ^  
		    in[24] ^ in[22] ^ in[21] ^ in[19] ^ in[18] ^ in[16] ^ in[15] ^  
		    in[13] ^ in[12] ^ in[7] ^ in[6] ^ in[5]; 
   assign crc[20] = in[71] ^ in[70] ^ in[68] ^ in[67] ^ in[64] ^ in[60] ^ in[59] ^  
		    in[57] ^ in[56] ^ in[53] ^ in[52] ^ in[51] ^ in[48] ^ in[47] ^  
		    in[40] ^ in[37] ^ in[31] ^ in[30] ^ in[29] ^ in[27] ^ in[25] ^  
		    in[23] ^ in[22] ^ in[20] ^ in[19] ^ in[17] ^ in[16] ^ in[14] ^  
		    in[13] ^ in[8] ^ in[7] ^ in[6];
   assign crc[21] = in[71] ^ in[69] ^ in[68] ^ in[65] ^ in[61] ^ in[60] ^ in[58] ^  
		    in[57] ^ in[54] ^ in[53] ^ in[52] ^ in[49] ^ in[48] ^ in[41] ^  
		    in[38] ^ in[32] ^ in[31] ^ in[30] ^ in[28] ^ in[26] ^ in[24] ^  
		    in[23] ^ in[21] ^ in[20] ^ in[18] ^ in[17] ^ in[15] ^ in[14] ^  
		    in[9] ^ in[8] ^ in[7]; 
   
endmodule

