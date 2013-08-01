// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fflp_CRC16_D64.v
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

module fflp_CRC16_D64 (Data, CRC, NewCRC);

  // polynomial: (0 5 12 16)
  // data width: 64
  // convention: the first serial data bit is D[63]
  // function [15:0] nextCRC16_D64;

    input [63:0] Data;
    input [15:0] CRC;

    output[15:0] NewCRC;

    wire [63:0] D;
    wire [15:0] C;
    wire [15:0] NewCRC;

assign    D = Data;
assign    C = CRC;

assign    NewCRC[0] = D[63] ^ D[58] ^ D[56] ^ D[55] ^ D[52] ^ D[51] ^ D[49] ^ 
                D[48] ^ D[42] ^ D[35] ^ D[33] ^ D[32] ^ D[28] ^ D[27] ^ 
                D[26] ^ D[22] ^ D[20] ^ D[19] ^ D[12] ^ D[11] ^ D[8] ^ 
                D[4] ^ D[0] ^ C[0] ^ C[1] ^ C[3] ^ C[4] ^ C[7] ^ C[8] ^ 
                C[10] ^ C[15];
assign    NewCRC[1] = D[59] ^ D[57] ^ D[56] ^ D[53] ^ D[52] ^ D[50] ^ D[49] ^ 
                D[43] ^ D[36] ^ D[34] ^ D[33] ^ D[29] ^ D[28] ^ D[27] ^ 
                D[23] ^ D[21] ^ D[20] ^ D[13] ^ D[12] ^ D[9] ^ D[5] ^ 
                D[1] ^ C[1] ^ C[2] ^ C[4] ^ C[5] ^ C[8] ^ C[9] ^ C[11];
assign    NewCRC[2] = D[60] ^ D[58] ^ D[57] ^ D[54] ^ D[53] ^ D[51] ^ D[50] ^ 
                D[44] ^ D[37] ^ D[35] ^ D[34] ^ D[30] ^ D[29] ^ D[28] ^ 
                D[24] ^ D[22] ^ D[21] ^ D[14] ^ D[13] ^ D[10] ^ D[6] ^ 
                D[2] ^ C[2] ^ C[3] ^ C[5] ^ C[6] ^ C[9] ^ C[10] ^ C[12];
assign    NewCRC[3] = D[61] ^ D[59] ^ D[58] ^ D[55] ^ D[54] ^ D[52] ^ D[51] ^ 
                D[45] ^ D[38] ^ D[36] ^ D[35] ^ D[31] ^ D[30] ^ D[29] ^ 
                D[25] ^ D[23] ^ D[22] ^ D[15] ^ D[14] ^ D[11] ^ D[7] ^ 
                D[3] ^ C[3] ^ C[4] ^ C[6] ^ C[7] ^ C[10] ^ C[11] ^ 
                C[13];
assign    NewCRC[4] = D[62] ^ D[60] ^ D[59] ^ D[56] ^ D[55] ^ D[53] ^ D[52] ^ 
                D[46] ^ D[39] ^ D[37] ^ D[36] ^ D[32] ^ D[31] ^ D[30] ^ 
                D[26] ^ D[24] ^ D[23] ^ D[16] ^ D[15] ^ D[12] ^ D[8] ^ 
                D[4] ^ C[4] ^ C[5] ^ C[7] ^ C[8] ^ C[11] ^ C[12] ^ 
                C[14];
assign    NewCRC[5] = D[61] ^ D[60] ^ D[58] ^ D[57] ^ D[55] ^ D[54] ^ D[53] ^ 
                D[52] ^ D[51] ^ D[49] ^ D[48] ^ D[47] ^ D[42] ^ D[40] ^ 
                D[38] ^ D[37] ^ D[35] ^ D[31] ^ D[28] ^ D[26] ^ D[25] ^ 
                D[24] ^ D[22] ^ D[20] ^ D[19] ^ D[17] ^ D[16] ^ D[13] ^ 
                D[12] ^ D[11] ^ D[9] ^ D[8] ^ D[5] ^ D[4] ^ D[0] ^ 
                C[0] ^ C[1] ^ C[3] ^ C[4] ^ C[5] ^ C[6] ^ C[7] ^ C[9] ^ 
                C[10] ^ C[12] ^ C[13];
assign    NewCRC[6] = D[62] ^ D[61] ^ D[59] ^ D[58] ^ D[56] ^ D[55] ^ D[54] ^ 
                D[53] ^ D[52] ^ D[50] ^ D[49] ^ D[48] ^ D[43] ^ D[41] ^ 
                D[39] ^ D[38] ^ D[36] ^ D[32] ^ D[29] ^ D[27] ^ D[26] ^ 
                D[25] ^ D[23] ^ D[21] ^ D[20] ^ D[18] ^ D[17] ^ D[14] ^ 
                D[13] ^ D[12] ^ D[10] ^ D[9] ^ D[6] ^ D[5] ^ D[1] ^ 
                C[0] ^ C[1] ^ C[2] ^ C[4] ^ C[5] ^ C[6] ^ C[7] ^ C[8] ^ 
                C[10] ^ C[11] ^ C[13] ^ C[14];
assign    NewCRC[7] = D[63] ^ D[62] ^ D[60] ^ D[59] ^ D[57] ^ D[56] ^ D[55] ^ 
                D[54] ^ D[53] ^ D[51] ^ D[50] ^ D[49] ^ D[44] ^ D[42] ^ 
                D[40] ^ D[39] ^ D[37] ^ D[33] ^ D[30] ^ D[28] ^ D[27] ^ 
                D[26] ^ D[24] ^ D[22] ^ D[21] ^ D[19] ^ D[18] ^ D[15] ^ 
                D[14] ^ D[13] ^ D[11] ^ D[10] ^ D[7] ^ D[6] ^ D[2] ^ 
                C[1] ^ C[2] ^ C[3] ^ C[5] ^ C[6] ^ C[7] ^ C[8] ^ C[9] ^ 
                C[11] ^ C[12] ^ C[14] ^ C[15];
assign    NewCRC[8] = D[63] ^ D[61] ^ D[60] ^ D[58] ^ D[57] ^ D[56] ^ D[55] ^ 
                D[54] ^ D[52] ^ D[51] ^ D[50] ^ D[45] ^ D[43] ^ D[41] ^ 
                D[40] ^ D[38] ^ D[34] ^ D[31] ^ D[29] ^ D[28] ^ D[27] ^ 
                D[25] ^ D[23] ^ D[22] ^ D[20] ^ D[19] ^ D[16] ^ D[15] ^ 
                D[14] ^ D[12] ^ D[11] ^ D[8] ^ D[7] ^ D[3] ^ C[2] ^ 
                C[3] ^ C[4] ^ C[6] ^ C[7] ^ C[8] ^ C[9] ^ C[10] ^ C[12] ^ 
                C[13] ^ C[15];
assign    NewCRC[9] = D[62] ^ D[61] ^ D[59] ^ D[58] ^ D[57] ^ D[56] ^ D[55] ^ 
                D[53] ^ D[52] ^ D[51] ^ D[46] ^ D[44] ^ D[42] ^ D[41] ^ 
                D[39] ^ D[35] ^ D[32] ^ D[30] ^ D[29] ^ D[28] ^ D[26] ^ 
                D[24] ^ D[23] ^ D[21] ^ D[20] ^ D[17] ^ D[16] ^ D[15] ^ 
                D[13] ^ D[12] ^ D[9] ^ D[8] ^ D[4] ^ C[3] ^ C[4] ^ 
                C[5] ^ C[7] ^ C[8] ^ C[9] ^ C[10] ^ C[11] ^ C[13] ^ 
                C[14];
assign    NewCRC[10] = D[63] ^ D[62] ^ D[60] ^ D[59] ^ D[58] ^ D[57] ^ D[56] ^ 
                 D[54] ^ D[53] ^ D[52] ^ D[47] ^ D[45] ^ D[43] ^ D[42] ^ 
                 D[40] ^ D[36] ^ D[33] ^ D[31] ^ D[30] ^ D[29] ^ D[27] ^ 
                 D[25] ^ D[24] ^ D[22] ^ D[21] ^ D[18] ^ D[17] ^ D[16] ^ 
                 D[14] ^ D[13] ^ D[10] ^ D[9] ^ D[5] ^ C[4] ^ C[5] ^ 
                 C[6] ^ C[8] ^ C[9] ^ C[10] ^ C[11] ^ C[12] ^ C[14] ^ 
                 C[15];
assign    NewCRC[11] = D[63] ^ D[61] ^ D[60] ^ D[59] ^ D[58] ^ D[57] ^ D[55] ^ 
                 D[54] ^ D[53] ^ D[48] ^ D[46] ^ D[44] ^ D[43] ^ D[41] ^ 
                 D[37] ^ D[34] ^ D[32] ^ D[31] ^ D[30] ^ D[28] ^ D[26] ^ 
                 D[25] ^ D[23] ^ D[22] ^ D[19] ^ D[18] ^ D[17] ^ D[15] ^ 
                 D[14] ^ D[11] ^ D[10] ^ D[6] ^ C[0] ^ C[5] ^ C[6] ^ 
                 C[7] ^ C[9] ^ C[10] ^ C[11] ^ C[12] ^ C[13] ^ C[15];
assign    NewCRC[12] = D[63] ^ D[62] ^ D[61] ^ D[60] ^ D[59] ^ D[54] ^ D[52] ^ 
                 D[51] ^ D[48] ^ D[47] ^ D[45] ^ D[44] ^ D[38] ^ D[31] ^ 
                 D[29] ^ D[28] ^ D[24] ^ D[23] ^ D[22] ^ D[18] ^ D[16] ^ 
                 D[15] ^ D[8] ^ D[7] ^ D[4] ^ D[0] ^ C[0] ^ C[3] ^ C[4] ^ 
                 C[6] ^ C[11] ^ C[12] ^ C[13] ^ C[14] ^ C[15];
assign    NewCRC[13] = D[63] ^ D[62] ^ D[61] ^ D[60] ^ D[55] ^ D[53] ^ D[52] ^ 
                 D[49] ^ D[48] ^ D[46] ^ D[45] ^ D[39] ^ D[32] ^ D[30] ^ 
                 D[29] ^ D[25] ^ D[24] ^ D[23] ^ D[19] ^ D[17] ^ D[16] ^ 
                 D[9] ^ D[8] ^ D[5] ^ D[1] ^ C[0] ^ C[1] ^ C[4] ^ C[5] ^ 
                 C[7] ^ C[12] ^ C[13] ^ C[14] ^ C[15];
assign    NewCRC[14] = D[63] ^ D[62] ^ D[61] ^ D[56] ^ D[54] ^ D[53] ^ D[50] ^ 
                 D[49] ^ D[47] ^ D[46] ^ D[40] ^ D[33] ^ D[31] ^ D[30] ^ 
                 D[26] ^ D[25] ^ D[24] ^ D[20] ^ D[18] ^ D[17] ^ D[10] ^ 
                 D[9] ^ D[6] ^ D[2] ^ C[1] ^ C[2] ^ C[5] ^ C[6] ^ C[8] ^ 
                 C[13] ^ C[14] ^ C[15];
assign    NewCRC[15] = D[63] ^ D[62] ^ D[57] ^ D[55] ^ D[54] ^ D[51] ^ D[50] ^ 
                 D[48] ^ D[47] ^ D[41] ^ D[34] ^ D[32] ^ D[31] ^ D[27] ^ 
                 D[26] ^ D[25] ^ D[21] ^ D[19] ^ D[18] ^ D[11] ^ D[10] ^ 
                 D[7] ^ D[3] ^ C[0] ^ C[2] ^ C[3] ^ C[6] ^ C[7] ^ C[9] ^ 
                 C[14] ^ C[15];

endmodule

