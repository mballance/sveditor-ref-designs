// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_ecc_correct.v
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
 `timescale 1ns/1ns 
// ****************************************************************************
//                Copyright (c) 2001 by Sun Microsystems Inc.
//
// All rights reserved. No part of this design may be reproduced stored
// in a retrieval system, or transmitted, in any form or by any means,
// electronic, mechanical, photocopying, recording, or otherwise, without
// prior written permission of Sun Microsystems, Inc.
//
//                       Sun Proprietary/Confidential
//
// ****************************************************************************
//      File Name : ecc_correct.sv
//        Version : /main/1
//    Last Update : 10/27/05 16:26:13 rp144381
// ****************************************************************************
//    Module      :  ecc_correct
//    Description :  Correction Circuitry for SEC-DED code
//                   For SEC and SEC-DED implementations, din and dout [75:0]
//                   refer to {data bits[67:0], check bits[7:0]}.
//                   For Hamming implementation, the check bits are located in 
//                   all possible values of 75-(a power of 2). Complete  
//                   layout given at end of file.
//                   Order of bits in din and dout [75:0] are the same as 
//                   dout[75:0] of the ecc_generate module.
//                   Error Signals: error covers CE+UE events, corr_error 
//                   covers CE events and uncorr_error covers UE events.
//                   This module is used while reading data       
// ***************************************************************************
// Revision History
// Date        Author  Description
// 10/27/05    rp144381   Initial verilog generated from ECC automation script
// ****************************************************************************


module niu_txc_ecc_correct (din, syn, dout, no_error, error, corr_error, uncorr_error); 

input  [75:0] din;    
input  [7:0] syn;
output [75:0] dout;
output no_error;
output error;
output corr_error;
output uncorr_error;

assign dout[75] = din[75] ^ (syn == 8'b00000111); 
assign dout[74] = din[74] ^ (syn == 8'b00111000); 
assign dout[73] = din[73] ^ (syn == 8'b11000001); 
assign dout[72] = din[72] ^ (syn == 8'b00001110); 
assign dout[71] = din[71] ^ (syn == 8'b01110000); 
assign dout[70] = din[70] ^ (syn == 8'b10000011); 
assign dout[69] = din[69] ^ (syn == 8'b00011100); 
assign dout[68] = din[68] ^ (syn == 8'b11100000); 
assign dout[67] = din[67] ^ (syn == 8'b00001011); 
assign dout[66] = din[66] ^ (syn == 8'b00110100); 
assign dout[65] = din[65] ^ (syn == 8'b11000010); 
assign dout[64] = din[64] ^ (syn == 8'b00001101); 
assign dout[63] = din[63] ^ (syn == 8'b10110000); 
assign dout[62] = din[62] ^ (syn == 8'b01000011); 
assign dout[61] = din[61] ^ (syn == 8'b00101100); 
assign dout[60] = din[60] ^ (syn == 8'b11010000); 
assign dout[59] = din[59] ^ (syn == 8'b00010011); 
assign dout[58] = din[58] ^ (syn == 8'b01001100); 
assign dout[57] = din[57] ^ (syn == 8'b10100001); 
assign dout[56] = din[56] ^ (syn == 8'b00010110); 
assign dout[55] = din[55] ^ (syn == 8'b01101000); 
assign dout[54] = din[54] ^ (syn == 8'b10000101); 
assign dout[53] = din[53] ^ (syn == 8'b00011010); 
assign dout[52] = din[52] ^ (syn == 8'b01100001); 
assign dout[51] = din[51] ^ (syn == 8'b10000110); 
assign dout[50] = din[50] ^ (syn == 8'b01011000); 
assign dout[49] = din[49] ^ (syn == 8'b10100010); 
assign dout[48] = din[48] ^ (syn == 8'b00010101); 
assign dout[47] = din[47] ^ (syn == 8'b10101000); 
assign dout[46] = din[46] ^ (syn == 8'b01000101); 
assign dout[45] = din[45] ^ (syn == 8'b00101010); 
assign dout[44] = din[44] ^ (syn == 8'b01010001); 
assign dout[43] = din[43] ^ (syn == 8'b10001010); 
assign dout[42] = din[42] ^ (syn == 8'b01010100); 
assign dout[41] = din[41] ^ (syn == 8'b10100100); 
assign dout[40] = din[40] ^ (syn == 8'b00100011); 
assign dout[39] = din[39] ^ (syn == 8'b10011000); 
assign dout[38] = din[38] ^ (syn == 8'b01001001); 
assign dout[37] = din[37] ^ (syn == 8'b00100110); 
assign dout[36] = din[36] ^ (syn == 8'b01010010); 
assign dout[35] = din[35] ^ (syn == 8'b10001001); 
assign dout[34] = din[34] ^ (syn == 8'b10010100); 
assign dout[33] = din[33] ^ (syn == 8'b01100010); 
assign dout[32] = din[32] ^ (syn == 8'b00100101); 
assign dout[31] = din[31] ^ (syn == 8'b00011001); 
assign dout[30] = din[30] ^ (syn == 8'b11000100); 
assign dout[29] = din[29] ^ (syn == 8'b01001010); 
assign dout[28] = din[28] ^ (syn == 8'b00110001); 
assign dout[27] = din[27] ^ (syn == 8'b10010010); 
assign dout[26] = din[26] ^ (syn == 8'b10001100); 
assign dout[25] = din[25] ^ (syn == 8'b01100100); 
assign dout[24] = din[24] ^ (syn == 8'b00101001); 
assign dout[23] = din[23] ^ (syn == 8'b00110010); 
assign dout[22] = din[22] ^ (syn == 8'b11001000); 
assign dout[21] = din[21] ^ (syn == 8'b10010001); 
assign dout[20] = din[20] ^ (syn == 8'b01000110); 
assign dout[19] = din[19] ^ (syn == 8'b00011111); 
assign dout[18] = din[18] ^ (syn == 8'b11100011); 
assign dout[17] = din[17] ^ (syn == 8'b01111100); 
assign dout[16] = din[16] ^ (syn == 8'b10001111); 
assign dout[15] = din[15] ^ (syn == 8'b11110001); 
assign dout[14] = din[14] ^ (syn == 8'b00111110); 
assign dout[13] = din[13] ^ (syn == 8'b11000111); 
assign dout[12] = din[12] ^ (syn == 8'b11111000); 
assign dout[11] = din[11] ^ (syn == 8'b00101111); 
assign dout[10] = din[10] ^ (syn == 8'b11010011); 
assign dout[9] = din[9] ^ (syn == 8'b10111100); 
assign dout[8] = din[8] ^ (syn == 8'b01001111); 
assign dout[7] = din[7] ^ (syn == 8'b10000000); 
assign dout[6] = din[6] ^ (syn == 8'b01000000); 
assign dout[5] = din[5] ^ (syn == 8'b00100000); 
assign dout[4] = din[4] ^ (syn == 8'b00010000); 
assign dout[3] = din[3] ^ (syn == 8'b00001000); 
assign dout[2] = din[2] ^ (syn == 8'b00000100); 
assign dout[1] = din[1] ^ (syn == 8'b00000010); 
assign dout[0] = din[0] ^ (syn == 8'b00000001); 

assign no_error = (syn == 8'b00000000);
assign error = (no_error != 1);
assign corr_error = ( syn == 8'b00000001 || syn == 8'b00000010 || syn == 8'b00000100 || syn == 8'b00001000 || syn == 8'b00010000 || syn == 8'b00100000 || syn == 8'b01000000 || syn == 8'b10000000 || syn == 8'b01001111 || syn == 8'b10111100 || syn == 8'b11010011 || syn == 8'b00101111 || syn == 8'b11111000 || syn == 8'b11000111 || syn == 8'b00111110 || syn == 8'b11110001 || syn == 8'b10001111 || syn == 8'b01111100 || syn == 8'b11100011 || syn == 8'b00011111 || syn == 8'b01000110 || syn == 8'b10010001 || syn == 8'b11001000 || syn == 8'b00110010 || syn == 8'b00101001 || syn == 8'b01100100 || syn == 8'b10001100 || syn == 8'b10010010 || syn == 8'b00110001 || syn == 8'b01001010 || syn == 8'b11000100 || syn == 8'b00011001 || syn == 8'b00100101 || syn == 8'b01100010 || syn == 8'b10010100 || syn == 8'b10001001 || syn == 8'b01010010 || syn == 8'b00100110 || syn == 8'b01001001 || syn == 8'b10011000 || syn == 8'b00100011 || syn == 8'b10100100 || syn == 8'b01010100 || syn == 8'b10001010 || syn == 8'b01010001 || syn == 8'b00101010 || syn == 8'b01000101 || syn == 8'b10101000 || syn == 8'b00010101 || syn == 8'b10100010 || syn == 8'b01011000 || syn == 8'b10000110 || syn == 8'b01100001 || syn == 8'b00011010 || syn == 8'b10000101 || syn == 8'b01101000 || syn == 8'b00010110 || syn == 8'b10100001 || syn == 8'b01001100 || syn == 8'b00010011 || syn == 8'b11010000 || syn == 8'b00101100 || syn == 8'b01000011 || syn == 8'b10110000 || syn == 8'b00001101 || syn == 8'b11000010 || syn == 8'b00110100 || syn == 8'b00001011 || syn == 8'b11100000 || syn == 8'b00011100 || syn == 8'b10000011 || syn == 8'b01110000 || syn == 8'b00001110 || syn == 8'b11000001 || syn == 8'b00111000 || syn == 8'b00000111);
assign uncorr_error = (corr_error!=1 && no_error!=1);

endmodule
