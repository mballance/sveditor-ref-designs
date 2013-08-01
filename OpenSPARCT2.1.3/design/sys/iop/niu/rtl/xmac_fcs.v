// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xmac_fcs.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : xmac_fcs.v
 * Author Name  : John Lo
 * Description  : xmac frame check sequence logic.
 * Parent Module: rx_xmac or tx_xmac
 * Child  Module: crc_gen_xmii
 * Interface Mod: many.
 * Date Created : 6/1/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: This module is very timing critical. Need custom layout.
 * 
 *************************************************************************/

module xmac_fcs (clk,initialize_crc,compute_en,
                   crc_chk_dis,data_valid,dv_8bit,
                    data_64bit,new_crc5_result,crc_result,crc_error);
   
   input         clk;
   input 	 initialize_crc;
   input 	 compute_en;
   input 	 crc_chk_dis;
   input 	 data_valid;
   input [7:0]	 dv_8bit;
   input [63:0]  data_64bit;
// outputs
   output [31:0] new_crc5_result;
   output [31:0] crc_result;
   output 	 crc_error;

   // The 32 bits of the CRC value are placed in the frame check seqeunce
   // field so that the x31 term is the left-most bit of the first octet, 
   // and the x0 term is the right most bit of the last octet.
   // The bits of the CRC are thus transmitted in the order X31,x30,...,x1,x0.
   // 802.3 3.3 pp-15: Each octec of the MAC frame, with the exception of
   // the FCS, is transmitted low_order bit first.
   // bit0 has to come into crc logic first.

   wire 	 initialize_crc,compute_en,crc_compute_error;
   wire [7:0] 	 swap_byte0 =  {data_64bit[0],
                                data_64bit[1],
                                data_64bit[2],
                                data_64bit[3],
                                data_64bit[4],
                                data_64bit[5],
                                data_64bit[6],
                                data_64bit[7]};
   wire [7:0] 	 swap_byte1 =  {data_64bit[8],
                                data_64bit[9],
                                data_64bit[10],
                                data_64bit[11],
                                data_64bit[12],
                                data_64bit[13],
                                data_64bit[14],
                                data_64bit[15]};
   wire [7:0] 	 swap_byte2 =  {data_64bit[16],
                                data_64bit[17],
                                data_64bit[18],
                                data_64bit[19],
                                data_64bit[20],
                                data_64bit[21],
                                data_64bit[22],
                                data_64bit[23]};
   wire [7:0] 	 swap_byte3 =  {data_64bit[24],
                                data_64bit[25],
                                data_64bit[26],
                                data_64bit[27],
                                data_64bit[28],
                                data_64bit[29],
                                data_64bit[30],
                                data_64bit[31]};
   wire [7:0] 	 swap_byte4 =  {data_64bit[32],
                                data_64bit[33],
                                data_64bit[34],
                                data_64bit[35],
                                data_64bit[36],
                                data_64bit[37],
                                data_64bit[38],
                                data_64bit[39]};
   wire [7:0] 	 swap_byte5 =  {data_64bit[40],
                                data_64bit[41],
                                data_64bit[42],
                                data_64bit[43],
                                data_64bit[44],
                                data_64bit[45],
                                data_64bit[46],
                                data_64bit[47]};
   wire [7:0] 	 swap_byte6 =  {data_64bit[48],
                                data_64bit[49],
                                data_64bit[50],
                                data_64bit[51],
                                data_64bit[52],
                                data_64bit[53],
                                data_64bit[54],
                                data_64bit[55]};
   wire [7:0] 	 swap_byte7 =  {data_64bit[56],
                                data_64bit[57],
                                data_64bit[58],
                                data_64bit[59],
                                data_64bit[60],
                                data_64bit[61],
                                data_64bit[62],
                                data_64bit[63]};
   
   wire [31:0] 	 new_crc5_result;
   wire [31:0] 	 crc_result;
   
   crc_gen_xmii  crc_gen_xmii (.clk(clk),.initialize_crc(initialize_crc),
                 .compute_en(compute_en), 
                 .data_valid(data_valid),
                 .dv_8bit(dv_8bit),
                 .input_byte0(swap_byte0),.input_byte1(swap_byte1),
                 .input_byte2(swap_byte2),.input_byte3(swap_byte3),
                 .input_byte4(swap_byte4),.input_byte5(swap_byte5),
                 .input_byte6(swap_byte6),.input_byte7(swap_byte7),
                 .new_crc5_result(new_crc5_result),
                 .crc_result(crc_result));


   assign 	 crc_compute_error = (crc_result != 32'h38FB2284);
   
   assign        crc_error = crc_compute_error & !crc_chk_dis;
   

endmodule // xmac_fcs

