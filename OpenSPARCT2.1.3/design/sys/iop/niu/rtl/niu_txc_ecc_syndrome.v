// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_ecc_syndrome.v
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
//      File Name : ecc_syndrome.sv
//        Version : /main/1
//    Last Update : 10/27/05 16:26:13 rp144381
// ****************************************************************************
//    Module      :  ecc_syndrome
//    Description :  Syndrome Generation for SEC-DED code
//                   For SEC and SEC-DED implementations, din[75:0] refers to
//                   {data bits[67:0], check bits[7:0]}.
//                   For Hamming implementation, the check bits are distributed
//                   among the data bits. Refer to the generated parity check 
//                   matrix for details.
//                   Order of bits in din[75:0] has to be the same as 
//                   dout[75:0] of the ecc_generate module.
//                   This module is used while reading data       
// ***************************************************************************
// Revision History
// Date        Author  Description
// 10/27/05    rp144381   Initial verilog generated from ECC automation script
// ****************************************************************************

module niu_txc_ecc_syndrome (din, syn);

input  [75:0] din;
output [7:0] syn;

assign syn[7] = din[73] ^ din[70] ^ din[68] ^ din[65] ^ din[63] ^ din[60] ^ din[57] ^ din[54] ^ din[51] ^ din[49] ^ din[47] ^ din[43] ^ din[41] ^ din[39] ^ din[35] ^ din[34] ^ din[30] ^ din[27] ^ din[26] ^ din[22] ^ din[21] ^ din[18] ^ din[16] ^ din[15] ^ din[13] ^ din[12] ^ din[10] ^ din[9] ^ din[7];
assign syn[6] = din[73] ^ din[71] ^ din[68] ^ din[65] ^ din[62] ^ din[60] ^ din[58] ^ din[55] ^ din[52] ^ din[50] ^ din[46] ^ din[44] ^ din[42] ^ din[38] ^ din[36] ^ din[33] ^ din[30] ^ din[29] ^ din[25] ^ din[22] ^ din[20] ^ din[18] ^ din[17] ^ din[15] ^ din[13] ^ din[12] ^ din[10] ^ din[8] ^ din[6];
assign syn[5] = din[74] ^ din[71] ^ din[68] ^ din[66] ^ din[63] ^ din[61] ^ din[57] ^ din[55] ^ din[52] ^ din[49] ^ din[47] ^ din[45] ^ din[41] ^ din[40] ^ din[37] ^ din[33] ^ din[32] ^ din[28] ^ din[25] ^ din[24] ^ din[23] ^ din[18] ^ din[17] ^ din[15] ^ din[14] ^ din[12] ^ din[11] ^ din[9] ^ din[5];
assign syn[4] = din[74] ^ din[71] ^ din[69] ^ din[66] ^ din[63] ^ din[60] ^ din[59] ^ din[56] ^ din[53] ^ din[50] ^ din[48] ^ din[44] ^ din[42] ^ din[39] ^ din[36] ^ din[34] ^ din[31] ^ din[28] ^ din[27] ^ din[23] ^ din[21] ^ din[19] ^ din[17] ^ din[15] ^ din[14] ^ din[12] ^ din[10] ^ din[9] ^ din[4];
assign syn[3] = din[74] ^ din[72] ^ din[69] ^ din[67] ^ din[64] ^ din[61] ^ din[58] ^ din[55] ^ din[53] ^ din[50] ^ din[47] ^ din[45] ^ din[43] ^ din[39] ^ din[38] ^ din[35] ^ din[31] ^ din[29] ^ din[26] ^ din[24] ^ din[22] ^ din[19] ^ din[17] ^ din[16] ^ din[14] ^ din[12] ^ din[11] ^ din[9] ^ din[8] ^ din[3];
assign syn[2] = din[75] ^ din[72] ^ din[69] ^ din[66] ^ din[64] ^ din[61] ^ din[58] ^ din[56] ^ din[54] ^ din[51] ^ din[48] ^ din[46] ^ din[42] ^ din[41] ^ din[37] ^ din[34] ^ din[32] ^ din[30] ^ din[26] ^ din[25] ^ din[20] ^ din[19] ^ din[17] ^ din[16] ^ din[14] ^ din[13] ^ din[11] ^ din[9] ^ din[8] ^ din[2];
assign syn[1] = din[75] ^ din[72] ^ din[70] ^ din[67] ^ din[65] ^ din[62] ^ din[59] ^ din[56] ^ din[53] ^ din[51] ^ din[49] ^ din[45] ^ din[43] ^ din[40] ^ din[37] ^ din[36] ^ din[33] ^ din[29] ^ din[27] ^ din[23] ^ din[20] ^ din[19] ^ din[18] ^ din[16] ^ din[14] ^ din[13] ^ din[11] ^ din[10] ^ din[8] ^ din[1];
assign syn[0] = din[75] ^ din[73] ^ din[70] ^ din[67] ^ din[64] ^ din[62] ^ din[59] ^ din[57] ^ din[54] ^ din[52] ^ din[48] ^ din[46] ^ din[44] ^ din[40] ^ din[38] ^ din[35] ^ din[32] ^ din[31] ^ din[28] ^ din[24] ^ din[21] ^ din[19] ^ din[18] ^ din[16] ^ din[15] ^ din[13] ^ din[11] ^ din[10] ^ din[8] ^ din[0];
endmodule
