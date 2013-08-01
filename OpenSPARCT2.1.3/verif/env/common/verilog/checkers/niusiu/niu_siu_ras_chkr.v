// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_siu_ras_chkr.v
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
`ifdef SIU
`define TOP siu_top
`define TB_RST siu_top.reset
`else
`define TOP tb_top
`define TB_RST tb_top.reset
`endif

module niu_siu_ras_chkr();

reg no_niusiu_ras_chk ;
initial begin // {
    @(posedge `TOP.cpu.sii.iol2clk) ;
    if ($test$plusargs("ios_0in_ras_chk_off"))
        no_niusiu_ras_chk <= 1;
    else
        no_niusiu_ras_chk <= 0;
end //}

//  0in disable_checker no_niusiu_ras_chk -name cpu.niu_sii*parity*  
//  0in disable_checker no_niusiu_ras_chk -name cpu.niu_sii_ctag_ecc*  
//  0in disable_checker no_niusiu_ras_chk -name cpu.sio_niu_ctag*  
//  0in disable_checker no_niusiu_ras_chk -name cpu.sio_niu_data*parity*  

// set this to -constraint to constrain input signals to SIU
`define SIU_CONSTRAINT
// set this to -constraint to constrain input signals to NIU
`define NIU_CONSTRAINT
   
   
///////////////////////////////////////////////////////////////////////////////
// Check that all interface signals are not X or Z. This check can be disabled
// by not including the +define+X_GUARD arg on the command line.
///////////////////////////////////////////////////////////////////////////////
`ifdef X_GUARD
   // 0in known_driven -var niu_sii_hdr_vld   -name niu_sii_hdr_vld_x_guard   -module `TOP_MOD
   // 0in known_driven -var niu_sii_reqbypass -name niu_sii_reqbypass_x_guard -module `TOP_MOD
   // 0in known_driven -var niu_sii_datareq   -name niu_sii_datareq_x_guard   -module `TOP_MOD
   // 0in known_driven -var niu_sii_data      -name niu_sii_data_x_guard      -module `TOP_MOD
   // 0in known_driven -var niu_sii_parity    -name niu_sii_parity_x_guard    -module `TOP_MOD
   // 0in known_driven -var niu_sii_be        -name niu_sii_be_x_guard        -module `TOP_MOD
   // 0in known_driven -var sii_niu_wrack_vld -name sii_niu_wrack_vld_x_guard -module `TOP_MOD
   // 0in known_driven -var sii_niu_wrack_tag -name sii_niu_wrack_tag_x_guard -module `TOP_MOD

   // 0in known_driven -var sio_niu_hdr_vld   -name sio_niu_hdr_vld_x_guard   -module `TOP_MOD
   // 0in known_driven -var sio_niu_datareq   -name sio_niu_datareq_x_guard   -module `TOP_MOD
   // 0in known_driven -var sio_niu_data      -name sio_niu_data_x_guard      -module `TOP_MOD
   // 0in known_driven -var sio_niu_parity    -name sio_niu_parity_x_guard    -module `TOP_MOD
`endif

/*************************************************************************
*
*  NIU - SII
*  Check for data parity, address parity, ctag ecc, command parity
*
**************************************************************************/

/*   0in odd_parity 
      -var {niu_sii_data[127:122], ^ niu_sii_data[62]}
      -active (niu_sii_hdr_vld && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -name niu_sii_command_parity 
*/

/*   0in odd_parity 
      -var {niu_sii_data[1],niu_sii_data[3],niu_sii_data[5],niu_sii_data[7],niu_sii_data[9],niu_sii_data[11],niu_sii_data[13],niu_sii_data[15],niu_sii_data[17],niu_sii_data[19],niu_sii_data[21],niu_sii_data[23],niu_sii_data[25],niu_sii_data[27],niu_sii_data[29],niu_sii_data[31],niu_sii_data[33],niu_sii_data[35],niu_sii_data[37],niu_sii_data[39], ^ niu_sii_data[84]}
      -active (niu_sii_hdr_vld && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -name niu_sii_addr_parity_oddbits 
*/

/*   0in odd_parity 
      -var {niu_sii_data[0],niu_sii_data[2],niu_sii_data[4],niu_sii_data[6],niu_sii_data[8],niu_sii_data[10],niu_sii_data[12],niu_sii_data[14],niu_sii_data[16],niu_sii_data[18],niu_sii_data[20],niu_sii_data[22],niu_sii_data[24],niu_sii_data[26],niu_sii_data[28],niu_sii_data[30],niu_sii_data[32],niu_sii_data[34],niu_sii_data[36],niu_sii_data[38], ^ niu_sii_data[83]}
      -active (niu_sii_hdr_vld && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -name niu_sii_addr_parity_evenbits 
*/

wire p0  =   (`TOP.cpu.niu_sii_data[64] ^ `TOP.cpu.niu_sii_data[65] ^ `TOP.cpu.niu_sii_data[67] ^ `TOP.cpu.niu_sii_data[68] ^ `TOP.cpu.niu_sii_data[70] ^ `TOP.cpu.niu_sii_data[72] ^ `TOP.cpu.niu_sii_data[74] ^ `TOP.cpu.niu_sii_data[75] ^ `TOP.cpu.niu_sii_data[77] ^ `TOP.cpu.niu_sii_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(niu_sii_hdr_vld)) && !(p0 == niu_sii_data[56]))
      -message "ctag error for niu_sii:  p0 does not equal c0"
      -module `TOP_DESIGN
      -name niu_sii_ctag_ecc_p0 
*/

wire p1  =   (`TOP.cpu.niu_sii_data[64] ^ `TOP.cpu.niu_sii_data[66] ^ `TOP.cpu.niu_sii_data[67] ^ `TOP.cpu.niu_sii_data[69] ^ `TOP.cpu.niu_sii_data[70] ^ `TOP.cpu.niu_sii_data[73] ^ `TOP.cpu.niu_sii_data[74] ^ `TOP.cpu.niu_sii_data[76] ^ `TOP.cpu.niu_sii_data[77]);

/*   0in custom
      -fire (($0in_rising_edge(niu_sii_hdr_vld)) && !(p1 == niu_sii_data[57]))
      -message "ctag error for niu_sii:  p1 does not equal c1"
      -module `TOP_DESIGN
      -name niu_sii_ctag_ecc_p1 
*/

wire p2  =   (`TOP.cpu.niu_sii_data[65] ^ `TOP.cpu.niu_sii_data[66] ^ `TOP.cpu.niu_sii_data[67] ^ `TOP.cpu.niu_sii_data[71] ^ `TOP.cpu.niu_sii_data[72] ^ `TOP.cpu.niu_sii_data[73] ^ `TOP.cpu.niu_sii_data[74] ^ `TOP.cpu.niu_sii_data[78] ^ `TOP.cpu.niu_sii_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(niu_sii_hdr_vld)) && !(p2 == niu_sii_data[58]))
      -message "ctag error for niu_sii:  p2 does not equal c2"
      -module `TOP_DESIGN
      -name niu_sii_ctag_ecc_p2 
*/

wire p3  =   (`TOP.cpu.niu_sii_data[68] ^ `TOP.cpu.niu_sii_data[69] ^ `TOP.cpu.niu_sii_data[70] ^ `TOP.cpu.niu_sii_data[71] ^ `TOP.cpu.niu_sii_data[72] ^ `TOP.cpu.niu_sii_data[73] ^ `TOP.cpu.niu_sii_data[74]);

/*   0in custom
      -fire (($0in_rising_edge(niu_sii_hdr_vld)) && !(p3 == niu_sii_data[59]))
      -message "ctag error for niu_sii:  p3 does not equal c3"
      -module `TOP_DESIGN
      -name niu_sii_ctag_ecc_p3 
*/

wire p4  =   (`TOP.cpu.niu_sii_data[75] ^ `TOP.cpu.niu_sii_data[76] ^ `TOP.cpu.niu_sii_data[77] ^ `TOP.cpu.niu_sii_data[78] ^ `TOP.cpu.niu_sii_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(niu_sii_hdr_vld)) && !(p4 == niu_sii_data[60]))
      -message "ctag error for niu_sii:  p4 does not equal c4"
      -module `TOP_DESIGN
      -name niu_sii_ctag_ecc_p4 
*/

wire niu_sii_p5  =   (`TOP.cpu.niu_sii_data[64] ^ `TOP.cpu.niu_sii_data[65] ^ `TOP.cpu.niu_sii_data[66] ^ `TOP.cpu.niu_sii_data[68] ^ `TOP.cpu.niu_sii_data[69] ^ `TOP.cpu.niu_sii_data[71] ^ `TOP.cpu.niu_sii_data[74] ^ `TOP.cpu.niu_sii_data[75] ^ `TOP.cpu.niu_sii_data[76] ^ `TOP.cpu.niu_sii_data[78]);

/*   0in custom
      -fire (($0in_rising_edge(niu_sii_hdr_vld)) && !(niu_sii_p5 == niu_sii_data[61]))
      -message "ctag error for niu_sii:  p5 does not equal c5"
      -module `TOP_DESIGN
      -name niu_sii_ctag_ecc_p5 
*/

/*   0in odd_parity 
      -var {niu_sii_data[0],niu_sii_data[2],niu_sii_data[4],niu_sii_data[6],niu_sii_data[8],niu_sii_data[10],niu_sii_data[12],niu_sii_data[14],niu_sii_data[16],niu_sii_data[18],niu_sii_data[20],niu_sii_data[22],niu_sii_data[24],niu_sii_data[26],niu_sii_data[28],niu_sii_data[30], ^ niu_sii_parity[0]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[32],niu_sii_data[34],niu_sii_data[36],niu_sii_data[38],niu_sii_data[40],niu_sii_data[42],niu_sii_data[44],niu_sii_data[46],niu_sii_data[48],niu_sii_data[50],niu_sii_data[52],niu_sii_data[54],niu_sii_data[56],niu_sii_data[58],niu_sii_data[60],niu_sii_data[62], ^ niu_sii_parity[2]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_even_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[64],niu_sii_data[66],niu_sii_data[68],niu_sii_data[70],niu_sii_data[72],niu_sii_data[74],niu_sii_data[76],niu_sii_data[78],niu_sii_data[80],niu_sii_data[82],niu_sii_data[84],niu_sii_data[86],niu_sii_data[88],niu_sii_data[90],niu_sii_data[92],niu_sii_data[94], ^ niu_sii_parity[4]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_even_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[96],niu_sii_data[98],niu_sii_data[100],niu_sii_data[102],niu_sii_data[104],niu_sii_data[106],niu_sii_data[108],niu_sii_data[110],niu_sii_data[112],niu_sii_data[114],niu_sii_data[116],niu_sii_data[118],niu_sii_data[120],niu_sii_data[122],niu_sii_data[124],niu_sii_data[126], ^ niu_sii_parity[6]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_even_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[1],niu_sii_data[3],niu_sii_data[5],niu_sii_data[7],niu_sii_data[9],niu_sii_data[11],niu_sii_data[13],niu_sii_data[15],niu_sii_data[17],niu_sii_data[19],niu_sii_data[21],niu_sii_data[23],niu_sii_data[25],niu_sii_data[27],niu_sii_data[29],niu_sii_data[31], ^ niu_sii_parity[1]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[33],niu_sii_data[35],niu_sii_data[37],niu_sii_data[39],niu_sii_data[41],niu_sii_data[43],niu_sii_data[45],niu_sii_data[47],niu_sii_data[49],niu_sii_data[51],niu_sii_data[53],niu_sii_data[55],niu_sii_data[57],niu_sii_data[59],niu_sii_data[61],niu_sii_data[63], ^ niu_sii_parity[3]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[65],niu_sii_data[67],niu_sii_data[69],niu_sii_data[71],niu_sii_data[73],niu_sii_data[75],niu_sii_data[77],niu_sii_data[79],niu_sii_data[81],niu_sii_data[83],niu_sii_data[85],niu_sii_data[87],niu_sii_data[89],niu_sii_data[91],niu_sii_data[93],niu_sii_data[95], ^ niu_sii_parity[5]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[97],niu_sii_data[99],niu_sii_data[101],niu_sii_data[103],niu_sii_data[105],niu_sii_data[107],niu_sii_data[109],niu_sii_data[111],niu_sii_data[113],niu_sii_data[115],niu_sii_data[117],niu_sii_data[119],niu_sii_data[121],niu_sii_data[123],niu_sii_data[125],niu_sii_data[127], ^ niu_sii_parity[7]}
      -active (($0in_falling_edge(niu_sii_hdr_vld))  && ($0in_falling_edge(niu_sii_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data0_parity_odd_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[0],niu_sii_data[2],niu_sii_data[4],niu_sii_data[6],niu_sii_data[8],niu_sii_data[10],niu_sii_data[12],niu_sii_data[14],niu_sii_data[16],niu_sii_data[18],niu_sii_data[20],niu_sii_data[22],niu_sii_data[24],niu_sii_data[26],niu_sii_data[28],niu_sii_data[30], ^ niu_sii_parity[0]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[32],niu_sii_data[34],niu_sii_data[36],niu_sii_data[38],niu_sii_data[40],niu_sii_data[42],niu_sii_data[44],niu_sii_data[46],niu_sii_data[48],niu_sii_data[50],niu_sii_data[52],niu_sii_data[54],niu_sii_data[56],niu_sii_data[58],niu_sii_data[60],niu_sii_data[62], ^ niu_sii_parity[2]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_even_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[64],niu_sii_data[66],niu_sii_data[68],niu_sii_data[70],niu_sii_data[72],niu_sii_data[74],niu_sii_data[76],niu_sii_data[78],niu_sii_data[80],niu_sii_data[82],niu_sii_data[84],niu_sii_data[86],niu_sii_data[88],niu_sii_data[90],niu_sii_data[92],niu_sii_data[94], ^ niu_sii_parity[4]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_even_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[96],niu_sii_data[98],niu_sii_data[100],niu_sii_data[102],niu_sii_data[104],niu_sii_data[106],niu_sii_data[108],niu_sii_data[110],niu_sii_data[112],niu_sii_data[114],niu_sii_data[116],niu_sii_data[118],niu_sii_data[120],niu_sii_data[122],niu_sii_data[124],niu_sii_data[126], ^ niu_sii_parity[6]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_even_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[1],niu_sii_data[3],niu_sii_data[5],niu_sii_data[7],niu_sii_data[9],niu_sii_data[11],niu_sii_data[13],niu_sii_data[15],niu_sii_data[17],niu_sii_data[19],niu_sii_data[21],niu_sii_data[23],niu_sii_data[25],niu_sii_data[27],niu_sii_data[29],niu_sii_data[31], ^ niu_sii_parity[1]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[33],niu_sii_data[35],niu_sii_data[37],niu_sii_data[39],niu_sii_data[41],niu_sii_data[43],niu_sii_data[45],niu_sii_data[47],niu_sii_data[49],niu_sii_data[51],niu_sii_data[53],niu_sii_data[55],niu_sii_data[57],niu_sii_data[59],niu_sii_data[61],niu_sii_data[63], ^ niu_sii_parity[3]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[65],niu_sii_data[67],niu_sii_data[69],niu_sii_data[71],niu_sii_data[73],niu_sii_data[75],niu_sii_data[77],niu_sii_data[79],niu_sii_data[81],niu_sii_data[83],niu_sii_data[85],niu_sii_data[87],niu_sii_data[89],niu_sii_data[91],niu_sii_data[93],niu_sii_data[95], ^ niu_sii_parity[5]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[97],niu_sii_data[99],niu_sii_data[101],niu_sii_data[103],niu_sii_data[105],niu_sii_data[107],niu_sii_data[109],niu_sii_data[111],niu_sii_data[113],niu_sii_data[115],niu_sii_data[117],niu_sii_data[119],niu_sii_data[121],niu_sii_data[123],niu_sii_data[125],niu_sii_data[127], ^ niu_sii_parity[7]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,1 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data1_parity_odd_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[0],niu_sii_data[2],niu_sii_data[4],niu_sii_data[6],niu_sii_data[8],niu_sii_data[10],niu_sii_data[12],niu_sii_data[14],niu_sii_data[16],niu_sii_data[18],niu_sii_data[20],niu_sii_data[22],niu_sii_data[24],niu_sii_data[26],niu_sii_data[28],niu_sii_data[30], ^ niu_sii_parity[0]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[32],niu_sii_data[34],niu_sii_data[36],niu_sii_data[38],niu_sii_data[40],niu_sii_data[42],niu_sii_data[44],niu_sii_data[46],niu_sii_data[48],niu_sii_data[50],niu_sii_data[52],niu_sii_data[54],niu_sii_data[56],niu_sii_data[58],niu_sii_data[60],niu_sii_data[62], ^ niu_sii_parity[2]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_even_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[64],niu_sii_data[66],niu_sii_data[68],niu_sii_data[70],niu_sii_data[72],niu_sii_data[74],niu_sii_data[76],niu_sii_data[78],niu_sii_data[80],niu_sii_data[82],niu_sii_data[84],niu_sii_data[86],niu_sii_data[88],niu_sii_data[90],niu_sii_data[92],niu_sii_data[94], ^ niu_sii_parity[4]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_even_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[96],niu_sii_data[98],niu_sii_data[100],niu_sii_data[102],niu_sii_data[104],niu_sii_data[106],niu_sii_data[108],niu_sii_data[110],niu_sii_data[112],niu_sii_data[114],niu_sii_data[116],niu_sii_data[118],niu_sii_data[120],niu_sii_data[122],niu_sii_data[124],niu_sii_data[126], ^ niu_sii_parity[6]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_even_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[1],niu_sii_data[3],niu_sii_data[5],niu_sii_data[7],niu_sii_data[9],niu_sii_data[11],niu_sii_data[13],niu_sii_data[15],niu_sii_data[17],niu_sii_data[19],niu_sii_data[21],niu_sii_data[23],niu_sii_data[25],niu_sii_data[27],niu_sii_data[29],niu_sii_data[31], ^ niu_sii_parity[1]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[33],niu_sii_data[35],niu_sii_data[37],niu_sii_data[39],niu_sii_data[41],niu_sii_data[43],niu_sii_data[45],niu_sii_data[47],niu_sii_data[49],niu_sii_data[51],niu_sii_data[53],niu_sii_data[55],niu_sii_data[57],niu_sii_data[59],niu_sii_data[61],niu_sii_data[63], ^ niu_sii_parity[3]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[65],niu_sii_data[67],niu_sii_data[69],niu_sii_data[71],niu_sii_data[73],niu_sii_data[75],niu_sii_data[77],niu_sii_data[79],niu_sii_data[81],niu_sii_data[83],niu_sii_data[85],niu_sii_data[87],niu_sii_data[89],niu_sii_data[91],niu_sii_data[93],niu_sii_data[95], ^ niu_sii_parity[5]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[97],niu_sii_data[99],niu_sii_data[101],niu_sii_data[103],niu_sii_data[105],niu_sii_data[107],niu_sii_data[109],niu_sii_data[111],niu_sii_data[113],niu_sii_data[115],niu_sii_data[117],niu_sii_data[119],niu_sii_data[121],niu_sii_data[123],niu_sii_data[125],niu_sii_data[127], ^ niu_sii_parity[7]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,2 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data2_parity_odd_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[0],niu_sii_data[2],niu_sii_data[4],niu_sii_data[6],niu_sii_data[8],niu_sii_data[10],niu_sii_data[12],niu_sii_data[14],niu_sii_data[16],niu_sii_data[18],niu_sii_data[20],niu_sii_data[22],niu_sii_data[24],niu_sii_data[26],niu_sii_data[28],niu_sii_data[30], ^ niu_sii_parity[0]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[32],niu_sii_data[34],niu_sii_data[36],niu_sii_data[38],niu_sii_data[40],niu_sii_data[42],niu_sii_data[44],niu_sii_data[46],niu_sii_data[48],niu_sii_data[50],niu_sii_data[52],niu_sii_data[54],niu_sii_data[56],niu_sii_data[58],niu_sii_data[60],niu_sii_data[62], ^ niu_sii_parity[2]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_even_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[64],niu_sii_data[66],niu_sii_data[68],niu_sii_data[70],niu_sii_data[72],niu_sii_data[74],niu_sii_data[76],niu_sii_data[78],niu_sii_data[80],niu_sii_data[82],niu_sii_data[84],niu_sii_data[86],niu_sii_data[88],niu_sii_data[90],niu_sii_data[92],niu_sii_data[94], ^ niu_sii_parity[4]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_even_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[96],niu_sii_data[98],niu_sii_data[100],niu_sii_data[102],niu_sii_data[104],niu_sii_data[106],niu_sii_data[108],niu_sii_data[110],niu_sii_data[112],niu_sii_data[114],niu_sii_data[116],niu_sii_data[118],niu_sii_data[120],niu_sii_data[122],niu_sii_data[124],niu_sii_data[126], ^ niu_sii_parity[6]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_even_byte48
*/

/*   0in odd_parity 
      -var {niu_sii_data[1],niu_sii_data[3],niu_sii_data[5],niu_sii_data[7],niu_sii_data[9],niu_sii_data[11],niu_sii_data[13],niu_sii_data[15],niu_sii_data[17],niu_sii_data[19],niu_sii_data[21],niu_sii_data[23],niu_sii_data[25],niu_sii_data[27],niu_sii_data[29],niu_sii_data[31], ^ niu_sii_parity[1]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {niu_sii_data[33],niu_sii_data[35],niu_sii_data[37],niu_sii_data[39],niu_sii_data[41],niu_sii_data[43],niu_sii_data[45],niu_sii_data[47],niu_sii_data[49],niu_sii_data[51],niu_sii_data[53],niu_sii_data[55],niu_sii_data[57],niu_sii_data[59],niu_sii_data[61],niu_sii_data[63], ^ niu_sii_parity[3]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {niu_sii_data[65],niu_sii_data[67],niu_sii_data[69],niu_sii_data[71],niu_sii_data[73],niu_sii_data[75],niu_sii_data[77],niu_sii_data[79],niu_sii_data[81],niu_sii_data[83],niu_sii_data[85],niu_sii_data[87],niu_sii_data[89],niu_sii_data[91],niu_sii_data[93],niu_sii_data[95], ^ niu_sii_parity[5]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {niu_sii_data[97],niu_sii_data[99],niu_sii_data[101],niu_sii_data[103],niu_sii_data[105],niu_sii_data[107],niu_sii_data[109],niu_sii_data[111],niu_sii_data[113],niu_sii_data[115],niu_sii_data[117],niu_sii_data[119],niu_sii_data[121],niu_sii_data[123],niu_sii_data[125],niu_sii_data[127], ^ niu_sii_parity[7]}
      -active (($0in_falling_edge($0in_delay(niu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(niu_sii_datareq,3 )))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_data3_parity_odd_byte48
*/

/*************************************************************************
*
*  SIO - NIU
*  Check for data parity, and  ctag ecc
*
**************************************************************************/

wire p5  =   (`TOP.cpu.sio_niu_data[64] ^ `TOP.cpu.sio_niu_data[65] ^ `TOP.cpu.sio_niu_data[67] ^ `TOP.cpu.sio_niu_data[68] ^ `TOP.cpu.sio_niu_data[70] ^ `TOP.cpu.sio_niu_data[72] ^ `TOP.cpu.sio_niu_data[74] ^ `TOP.cpu.sio_niu_data[75] ^ `TOP.cpu.sio_niu_data[77] ^ `TOP.cpu.sio_niu_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(sio_niu_hdr_vld)) && !(p5 == sio_niu_data[56]))
      -message "ctag error for sio_niu:  p0 does not equal c0"
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_ctag_ecc_p0 
*/

wire p6  =   (`TOP.cpu.sio_niu_data[64] ^ `TOP.cpu.sio_niu_data[66] ^ `TOP.cpu.sio_niu_data[67] ^ `TOP.cpu.sio_niu_data[69] ^ `TOP.cpu.sio_niu_data[70] ^ `TOP.cpu.sio_niu_data[73] ^ `TOP.cpu.sio_niu_data[74] ^ `TOP.cpu.sio_niu_data[76] ^ `TOP.cpu.sio_niu_data[77]);

/*   0in custom
      -fire (($0in_rising_edge(sio_niu_hdr_vld)) && !(p6 == sio_niu_data[57]))
      -message "ctag error for sio_niu:  p1 does not equal c1"
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_ctag_ecc_p1 
*/

wire p7  =   (`TOP.cpu.sio_niu_data[65] ^ `TOP.cpu.sio_niu_data[66] ^ `TOP.cpu.sio_niu_data[67] ^ `TOP.cpu.sio_niu_data[71] ^ `TOP.cpu.sio_niu_data[72] ^ `TOP.cpu.sio_niu_data[73] ^ `TOP.cpu.sio_niu_data[74] ^ `TOP.cpu.sio_niu_data[78] ^ `TOP.cpu.sio_niu_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(sio_niu_hdr_vld)) && !(p7 == sio_niu_data[58]))
      -message "ctag error for sio_niu:  p2 does not equal c2"
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_ctag_ecc_p2 
*/


wire p8  =   (`TOP.cpu.sio_niu_data[68] ^ `TOP.cpu.sio_niu_data[69] ^ `TOP.cpu.sio_niu_data[70] ^ `TOP.cpu.sio_niu_data[71] ^ `TOP.cpu.sio_niu_data[72] ^ `TOP.cpu.sio_niu_data[73] ^ `TOP.cpu.sio_niu_data[74]);

/*   0in custom
      -fire (($0in_rising_edge(sio_niu_hdr_vld)) && !(p8 == sio_niu_data[59]))
      -message "ctag error for sio_niu:  p3 does not equal c3"
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_ctag_ecc_p3 
*/

wire p9  =   (`TOP.cpu.sio_niu_data[75] ^ `TOP.cpu.sio_niu_data[76] ^ `TOP.cpu.sio_niu_data[77] ^ `TOP.cpu.sio_niu_data[78] ^ `TOP.cpu.sio_niu_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(sio_niu_hdr_vld)) && !(p9 == sio_niu_data[60]))
      -message "ctag error for sio_niu:  p4 does not equal c4"
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_ctag_ecc_p4 
*/

wire sio_niu_p5  =   (`TOP.cpu.sio_niu_data[64] ^ `TOP.cpu.sio_niu_data[65] ^ `TOP.cpu.sio_niu_data[66] ^ `TOP.cpu.sio_niu_data[68] ^ `TOP.cpu.sio_niu_data[69] ^ `TOP.cpu.sio_niu_data[71] ^ `TOP.cpu.sio_niu_data[74] ^ `TOP.cpu.sio_niu_data[75] ^ `TOP.cpu.sio_niu_data[76] ^ `TOP.cpu.sio_niu_data[78]);

/*   0in custom
      -fire (($0in_rising_edge(sio_niu_hdr_vld)) && !(sio_niu_p5 == sio_niu_data[61]))
      -message "ctag error for sio_niu:  p5 does not equal c5"
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_ctag_ecc_p5 
*/

/*   0in odd_parity 
      -var {sio_niu_data[0],sio_niu_data[2],sio_niu_data[4],sio_niu_data[6],sio_niu_data[8],sio_niu_data[10],sio_niu_data[12],sio_niu_data[14],sio_niu_data[16],sio_niu_data[18],sio_niu_data[20],sio_niu_data[22],sio_niu_data[24],sio_niu_data[26],sio_niu_data[28],sio_niu_data[30], ^ sio_niu_parity[0]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[32],sio_niu_data[34],sio_niu_data[36],sio_niu_data[38],sio_niu_data[40],sio_niu_data[42],sio_niu_data[44],sio_niu_data[46],sio_niu_data[48],sio_niu_data[50],sio_niu_data[52],sio_niu_data[54],sio_niu_data[56],sio_niu_data[58],sio_niu_data[60],sio_niu_data[62], ^ sio_niu_parity[2]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq ))&& ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_even_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[64],sio_niu_data[66],sio_niu_data[68],sio_niu_data[70],sio_niu_data[72],sio_niu_data[74],sio_niu_data[76],sio_niu_data[78],sio_niu_data[80],sio_niu_data[82],sio_niu_data[84],sio_niu_data[86],sio_niu_data[88],sio_niu_data[90],sio_niu_data[92],sio_niu_data[94], ^ sio_niu_parity[4]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq )) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_even_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[96],sio_niu_data[98],sio_niu_data[100],sio_niu_data[102],sio_niu_data[104],sio_niu_data[106],sio_niu_data[108],sio_niu_data[110],sio_niu_data[112],sio_niu_data[114],sio_niu_data[116],sio_niu_data[118],sio_niu_data[120],sio_niu_data[122],sio_niu_data[124],sio_niu_data[126], ^ sio_niu_parity[6]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq )) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_even_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[1],sio_niu_data[3],sio_niu_data[5],sio_niu_data[7],sio_niu_data[9],sio_niu_data[11],sio_niu_data[13],sio_niu_data[15],sio_niu_data[17],sio_niu_data[19],sio_niu_data[21],sio_niu_data[23],sio_niu_data[25],sio_niu_data[27],sio_niu_data[29],sio_niu_data[31], ^ sio_niu_parity[1]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq )) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[33],sio_niu_data[35],sio_niu_data[37],sio_niu_data[39],sio_niu_data[41],sio_niu_data[43],sio_niu_data[45],sio_niu_data[47],sio_niu_data[49],sio_niu_data[51],sio_niu_data[53],sio_niu_data[55],sio_niu_data[57],sio_niu_data[59],sio_niu_data[61],sio_niu_data[63], ^ sio_niu_parity[3]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq )) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[65],sio_niu_data[67],sio_niu_data[69],sio_niu_data[71],sio_niu_data[73],sio_niu_data[75],sio_niu_data[77],sio_niu_data[79],sio_niu_data[81],sio_niu_data[83],sio_niu_data[85],sio_niu_data[87],sio_niu_data[89],sio_niu_data[91],sio_niu_data[93],sio_niu_data[95], ^ sio_niu_parity[5]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq )) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[97],sio_niu_data[99],sio_niu_data[101],sio_niu_data[103],sio_niu_data[105],sio_niu_data[107],sio_niu_data[109],sio_niu_data[111],sio_niu_data[113],sio_niu_data[115],sio_niu_data[117],sio_niu_data[119],sio_niu_data[121],sio_niu_data[123],sio_niu_data[125],sio_niu_data[127], ^ sio_niu_parity[7]}
      -active (($0in_falling_edge(sio_niu_hdr_vld))  && ($0in_falling_edge(sio_niu_datareq )) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data0_parity_odd_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[0],sio_niu_data[2],sio_niu_data[4],sio_niu_data[6],sio_niu_data[8],sio_niu_data[10],sio_niu_data[12],sio_niu_data[14],sio_niu_data[16],sio_niu_data[18],sio_niu_data[20],sio_niu_data[22],sio_niu_data[24],sio_niu_data[26],sio_niu_data[28],sio_niu_data[30], ^ sio_niu_parity[0]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[32],sio_niu_data[34],sio_niu_data[36],sio_niu_data[38],sio_niu_data[40],sio_niu_data[42],sio_niu_data[44],sio_niu_data[46],sio_niu_data[48],sio_niu_data[50],sio_niu_data[52],sio_niu_data[54],sio_niu_data[56],sio_niu_data[58],sio_niu_data[60],sio_niu_data[62], ^ sio_niu_parity[2]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_even_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[64],sio_niu_data[66],sio_niu_data[68],sio_niu_data[70],sio_niu_data[72],sio_niu_data[74],sio_niu_data[76],sio_niu_data[78],sio_niu_data[80],sio_niu_data[82],sio_niu_data[84],sio_niu_data[86],sio_niu_data[88],sio_niu_data[90],sio_niu_data[92],sio_niu_data[94], ^ sio_niu_parity[4]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_even_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[96],sio_niu_data[98],sio_niu_data[100],sio_niu_data[102],sio_niu_data[104],sio_niu_data[106],sio_niu_data[108],sio_niu_data[110],sio_niu_data[112],sio_niu_data[114],sio_niu_data[116],sio_niu_data[118],sio_niu_data[120],sio_niu_data[122],sio_niu_data[124],sio_niu_data[126], ^ sio_niu_parity[6]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_even_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[1],sio_niu_data[3],sio_niu_data[5],sio_niu_data[7],sio_niu_data[9],sio_niu_data[11],sio_niu_data[13],sio_niu_data[15],sio_niu_data[17],sio_niu_data[19],sio_niu_data[21],sio_niu_data[23],sio_niu_data[25],sio_niu_data[27],sio_niu_data[29],sio_niu_data[31], ^ sio_niu_parity[1]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[33],sio_niu_data[35],sio_niu_data[37],sio_niu_data[39],sio_niu_data[41],sio_niu_data[43],sio_niu_data[45],sio_niu_data[47],sio_niu_data[49],sio_niu_data[51],sio_niu_data[53],sio_niu_data[55],sio_niu_data[57],sio_niu_data[59],sio_niu_data[61],sio_niu_data[63], ^ sio_niu_parity[3]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[65],sio_niu_data[67],sio_niu_data[69],sio_niu_data[71],sio_niu_data[73],sio_niu_data[75],sio_niu_data[77],sio_niu_data[79],sio_niu_data[81],sio_niu_data[83],sio_niu_data[85],sio_niu_data[87],sio_niu_data[89],sio_niu_data[91],sio_niu_data[93],sio_niu_data[95], ^ sio_niu_parity[5]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))))
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[97],sio_niu_data[99],sio_niu_data[101],sio_niu_data[103],sio_niu_data[105],sio_niu_data[107],sio_niu_data[109],sio_niu_data[111],sio_niu_data[113],sio_niu_data[115],sio_niu_data[117],sio_niu_data[119],sio_niu_data[121],sio_niu_data[123],sio_niu_data[125],sio_niu_data[127], ^ sio_niu_parity[7]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,1 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data1_parity_odd_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[0],sio_niu_data[2],sio_niu_data[4],sio_niu_data[6],sio_niu_data[8],sio_niu_data[10],sio_niu_data[12],sio_niu_data[14],sio_niu_data[16],sio_niu_data[18],sio_niu_data[20],sio_niu_data[22],sio_niu_data[24],sio_niu_data[26],sio_niu_data[28],sio_niu_data[30], ^ sio_niu_parity[0]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[32],sio_niu_data[34],sio_niu_data[36],sio_niu_data[38],sio_niu_data[40],sio_niu_data[42],sio_niu_data[44],sio_niu_data[46],sio_niu_data[48],sio_niu_data[50],sio_niu_data[52],sio_niu_data[54],sio_niu_data[56],sio_niu_data[58],sio_niu_data[60],sio_niu_data[62], ^ sio_niu_parity[2]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_even_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[64],sio_niu_data[66],sio_niu_data[68],sio_niu_data[70],sio_niu_data[72],sio_niu_data[74],sio_niu_data[76],sio_niu_data[78],sio_niu_data[80],sio_niu_data[82],sio_niu_data[84],sio_niu_data[86],sio_niu_data[88],sio_niu_data[90],sio_niu_data[92],sio_niu_data[94], ^ sio_niu_parity[4]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_even_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[96],sio_niu_data[98],sio_niu_data[100],sio_niu_data[102],sio_niu_data[104],sio_niu_data[106],sio_niu_data[108],sio_niu_data[110],sio_niu_data[112],sio_niu_data[114],sio_niu_data[116],sio_niu_data[118],sio_niu_data[120],sio_niu_data[122],sio_niu_data[124],sio_niu_data[126], ^ sio_niu_parity[6]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_even_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[1],sio_niu_data[3],sio_niu_data[5],sio_niu_data[7],sio_niu_data[9],sio_niu_data[11],sio_niu_data[13],sio_niu_data[15],sio_niu_data[17],sio_niu_data[19],sio_niu_data[21],sio_niu_data[23],sio_niu_data[25],sio_niu_data[27],sio_niu_data[29],sio_niu_data[31], ^ sio_niu_parity[1]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[33],sio_niu_data[35],sio_niu_data[37],sio_niu_data[39],sio_niu_data[41],sio_niu_data[43],sio_niu_data[45],sio_niu_data[47],sio_niu_data[49],sio_niu_data[51],sio_niu_data[53],sio_niu_data[55],sio_niu_data[57],sio_niu_data[59],sio_niu_data[61],sio_niu_data[63], ^ sio_niu_parity[3]}
      -active  (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[65],sio_niu_data[67],sio_niu_data[69],sio_niu_data[71],sio_niu_data[73],sio_niu_data[75],sio_niu_data[77],sio_niu_data[79],sio_niu_data[81],sio_niu_data[83],sio_niu_data[85],sio_niu_data[87],sio_niu_data[89],sio_niu_data[91],sio_niu_data[93],sio_niu_data[95], ^ sio_niu_parity[5]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[97],sio_niu_data[99],sio_niu_data[101],sio_niu_data[103],sio_niu_data[105],sio_niu_data[107],sio_niu_data[109],sio_niu_data[111],sio_niu_data[113],sio_niu_data[115],sio_niu_data[117],sio_niu_data[119],sio_niu_data[121],sio_niu_data[123],sio_niu_data[125],sio_niu_data[127], ^ sio_niu_parity[7]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,2 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data2_parity_odd_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[0],sio_niu_data[2],sio_niu_data[4],sio_niu_data[6],sio_niu_data[8],sio_niu_data[10],sio_niu_data[12],sio_niu_data[14],sio_niu_data[16],sio_niu_data[18],sio_niu_data[20],sio_niu_data[22],sio_niu_data[24],sio_niu_data[26],sio_niu_data[28],sio_niu_data[30], ^ sio_niu_parity[0]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_even_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[32],sio_niu_data[34],sio_niu_data[36],sio_niu_data[38],sio_niu_data[40],sio_niu_data[42],sio_niu_data[44],sio_niu_data[46],sio_niu_data[48],sio_niu_data[50],sio_niu_data[52],sio_niu_data[54],sio_niu_data[56],sio_niu_data[58],sio_niu_data[60],sio_niu_data[62], ^ sio_niu_parity[2]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_even_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[64],sio_niu_data[66],sio_niu_data[68],sio_niu_data[70],sio_niu_data[72],sio_niu_data[74],sio_niu_data[76],sio_niu_data[78],sio_niu_data[80],sio_niu_data[82],sio_niu_data[84],sio_niu_data[86],sio_niu_data[88],sio_niu_data[90],sio_niu_data[92],sio_niu_data[94], ^ sio_niu_parity[4]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_even_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[96],sio_niu_data[98],sio_niu_data[100],sio_niu_data[102],sio_niu_data[104],sio_niu_data[106],sio_niu_data[108],sio_niu_data[110],sio_niu_data[112],sio_niu_data[114],sio_niu_data[116],sio_niu_data[118],sio_niu_data[120],sio_niu_data[122],sio_niu_data[124],sio_niu_data[126], ^ sio_niu_parity[6]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_even_byte48
*/

/*   0in odd_parity 
      -var {sio_niu_data[1],sio_niu_data[3],sio_niu_data[5],sio_niu_data[7],sio_niu_data[9],sio_niu_data[11],sio_niu_data[13],sio_niu_data[15],sio_niu_data[17],sio_niu_data[19],sio_niu_data[21],sio_niu_data[23],sio_niu_data[25],sio_niu_data[27],sio_niu_data[29],sio_niu_data[31], ^ sio_niu_parity[1]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_odd_byte0 
*/

/*   0in odd_parity 
      -var {sio_niu_data[33],sio_niu_data[35],sio_niu_data[37],sio_niu_data[39],sio_niu_data[41],sio_niu_data[43],sio_niu_data[45],sio_niu_data[47],sio_niu_data[49],sio_niu_data[51],sio_niu_data[53],sio_niu_data[55],sio_niu_data[57],sio_niu_data[59],sio_niu_data[61],sio_niu_data[63], ^ sio_niu_parity[3]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_odd_byte16
*/

/*   0in odd_parity 
      -var {sio_niu_data[65],sio_niu_data[67],sio_niu_data[69],sio_niu_data[71],sio_niu_data[73],sio_niu_data[75],sio_niu_data[77],sio_niu_data[79],sio_niu_data[81],sio_niu_data[83],sio_niu_data[85],sio_niu_data[87],sio_niu_data[89],sio_niu_data[91],sio_niu_data[93],sio_niu_data[95], ^ sio_niu_parity[5]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -module `TOP_DESIGN
      -reset `TB_RST
      -name sio_niu_data3_parity_odd_byte32
*/

/*   0in odd_parity 
      -var {sio_niu_data[97],sio_niu_data[99],sio_niu_data[101],sio_niu_data[103],sio_niu_data[105],sio_niu_data[107],sio_niu_data[109],sio_niu_data[111],sio_niu_data[113],sio_niu_data[115],sio_niu_data[117],sio_niu_data[119],sio_niu_data[121],sio_niu_data[123],sio_niu_data[125],sio_niu_data[127], ^ sio_niu_parity[7]}
      -active (($0in_falling_edge($0in_delay(sio_niu_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(sio_niu_datareq,3 ))) && ~no_niusiu_ras_chk)
      -reset `TB_RST
      -module `TOP_DESIGN
      -name sio_niu_data3_parity_odd_byte48
*/

/*************************************************************************
*
*  NIU  -> L2/NCU
*  Check error bit through interface
*
**************************************************************************/


/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t0_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t0_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t1_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t1_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t2_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t2_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t3_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t3_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t4_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t4_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t5_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t5_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t6_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t6_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower (sii_l2t7_req[28] == 1)
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_l2t7_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(niu_sii_hdr_vld)) && (niu_sii_data[7] == 0) && (niu_sii_data[8] == 0) && ((niu_sii_data[80] == 1) | (niu_sii_data[81] == 1) | (niu_sii_data[82] == 1)))
      -follower ((sii_ncu_data[29] == 1) | (sii_ncu_data[30] == 1) | (sii_ncu_data[31] == 1))
      -min 1
      -max 200
      -module `TOP_DESIGN
      -reset `TB_RST
      -name niu_sii_ncu_error
*/


endmodule // niu_siu_ras_chkr
