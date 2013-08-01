// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_siu_ras_chkr.v
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
module dmu_siu_ras_chkr();

reg no_dmusiu_ras_chk ;
initial begin // {
    @(posedge `TOP.cpu.sii.iol2clk) ;
    if ($test$plusargs("ios_0in_ras_chk_off"))
        no_dmusiu_ras_chk <= 1;
    else
        no_dmusiu_ras_chk <= 0;
end //}

//  0in disable_checker no_dmusiu_ras_chk -name cpu.dmu_sii*parity* 
//  0in disable_checker no_dmusiu_ras_chk -name cpu.dmu_sii_ctag* 
//  0in disable_checker no_dmusiu_ras_chk -name cpu.sio_dmu_ctag* 
//  0in disable_checker no_dmusiu_ras_chk -name cpu.sio_dmu_data*parity*

// set this to -constraint to constrain input signals to SIU
`define SIU_CONSTRAINT
// set this to -constraint to constrain input signals to DMU
`define DMU_CONSTRAINT
  
// 0in set_clock  -default   iol2clk   -module sii
   
///////////////////////////////////////////////////////////////////////////////
// Check that all interface signals are not X or Z. This check can be disabled
// by not including the +define+X_GUARD arg on the command line.
///////////////////////////////////////////////////////////////////////////////
`ifdef X_GUARD
   // 0in known_driven -var dmu_sii_hdr_vld   -name dmu_sii_hdr_vld_x_guard   -module cpu
   // 0in known_driven -var dmu_sii_reqbypass -name dmu_sii_reqbypass_x_guard -module cpu
   // 0in known_driven -var dmu_sii_datareq   -name dmu_sii_datareq_x_guard   -module cpu
   // 0in known_driven -var dmu_sii_datareq16 -name dmu_sii_datareq16_x_guard -module cpu
   // 0in known_driven -var dmu_sii_data      -name dmu_sii_data_x_guard      -module cpu
   // 0in known_driven -var dmu_sii_parity    -name dmu_sii_parity_x_guard    -module cpu
   // 0in known_driven -var dmu_sii_be        -name dmu_sii_be_x_guard        -module cpu
   // 0in known_driven -var sii_dmu_wrack_vld -name sii_dmu_wrack_vld_x_guard -module cpu
   // 0in known_driven -var sii_dmu_wrack_tag -name sii_dmu_wrack_tag_x_guard -module cpu

   // 0in known_driven -var sio_dmu_hdr_vld   -name sio_dmu_hdr_vld_x_guard   -module cpu
   // 0in known_driven -var sio_dmu_data      -name sio_dmu_data_x_guard      -module cpu
   // 0in known_driven -var sio_dmu_parity    -name sio_dmu_parity_x_guard    -module cpu
`endif

/*************************************************************************
*
*  DMU -> SII
*  Check for data parity, address parity, ctag ecc, command parity
*  For write and for interrupt write
*
**************************************************************************/

/*   0in odd_parity
      -var {dmu_sii_data[127:122], ^ dmu_sii_data[62]}
      -active (dmu_sii_hdr_vld && ~no_dmusiu_ras_chk)
      -module cpu
      -name dmu_sii_command_parity
*/

/*   0in odd_parity
      -var {dmu_sii_data[1],dmu_sii_data[3],dmu_sii_data[5],dmu_sii_data[7],dmu_sii_data[9],dmu_sii_data[11],dmu_sii_data[13],dmu_sii_data[15],dmu_sii_data[17],dmu_sii_data[19],dmu_sii_data[21],dmu_sii_data[23],dmu_sii_data[25],dmu_sii_data[27],dmu_sii_data[29],dmu_sii_data[31],dmu_sii_data[33],dmu_sii_data[35],dmu_sii_data[37],dmu_sii_data[39], ^ dmu_sii_data[84]}
      -active (dmu_sii_hdr_vld && ~no_dmusiu_ras_chk)
      -module cpu
      -name dmu_sii_addr_parity_oddbits
*/

/*   0in odd_parity
      -var {dmu_sii_data[0],dmu_sii_data[2],dmu_sii_data[4],dmu_sii_data[6],dmu_sii_data[8],dmu_sii_data[10],dmu_sii_data[12],dmu_sii_data[14],dmu_sii_data[16],dmu_sii_data[18],dmu_sii_data[20],dmu_sii_data[22],dmu_sii_data[24],dmu_sii_data[26],dmu_sii_data[28],dmu_sii_data[30],dmu_sii_data[32],dmu_sii_data[34],dmu_sii_data[36],dmu_sii_data[38], ^ dmu_sii_data[83]}
      -active (dmu_sii_hdr_vld && ~no_dmusiu_ras_chk)
      -module cpu
      -name dmu_sii_addr_parity_evenbits
*/

wire p0 =  (`TOP.cpu.dmu_sii_data[64] ^ `TOP.cpu.dmu_sii_data[65] ^ `TOP.cpu.dmu_sii_data[67] ^ `TOP.cpu.dmu_sii_data[68] ^ `TOP.cpu.dmu_sii_data[70] ^ `TOP.cpu.dmu_sii_data[72] ^ `TOP.cpu.dmu_sii_data[74] ^ `TOP.cpu.dmu_sii_data[75] ^ `TOP.cpu.dmu_sii_data[77] ^ `TOP.cpu.dmu_sii_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(dmu_sii_hdr_vld)) && !(p0 == dmu_sii_data[56]))
      -message "ctag error for dmu_sii:  p0 does not equal c0"
      -module cpu
      -name dmu_sii_ctag_ecc_p0 
*/

wire p1 =  (`TOP.cpu.dmu_sii_data[64] ^ `TOP.cpu.dmu_sii_data[66] ^ `TOP.cpu.dmu_sii_data[67] ^ `TOP.cpu.dmu_sii_data[69] ^ `TOP.cpu.dmu_sii_data[70] ^ `TOP.cpu.dmu_sii_data[73] ^ `TOP.cpu.dmu_sii_data[74] ^ `TOP.cpu.dmu_sii_data[76] ^ `TOP.cpu.dmu_sii_data[77]);

/*   0in custom
      -fire (($0in_rising_edge(dmu_sii_hdr_vld)) && !(p1 == dmu_sii_data[57]))
      -message "ctag error for dmu_sii:  p1 does not equal c1"
      -module cpu
      -name dmu_sii_ctag_ecc_p1 
*/

wire p2 =  (`TOP.cpu.dmu_sii_data[65] ^ `TOP.cpu.dmu_sii_data[66] ^ `TOP.cpu.dmu_sii_data[67] ^ `TOP.cpu.dmu_sii_data[71] ^ `TOP.cpu.dmu_sii_data[72] ^ `TOP.cpu.dmu_sii_data[73] ^ `TOP.cpu.dmu_sii_data[74] ^ `TOP.cpu.dmu_sii_data[78] ^ `TOP.cpu.dmu_sii_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(dmu_sii_hdr_vld)) && !(p2 == dmu_sii_data[58]))
      -message "ctag error for dmu_sii:  p2 does not equal c2"
      -module cpu
      -name dmu_sii_ctag_ecc_p2 
*/

wire p3 =  (`TOP.cpu.dmu_sii_data[68] ^ `TOP.cpu.dmu_sii_data[69] ^ `TOP.cpu.dmu_sii_data[70] ^ `TOP.cpu.dmu_sii_data[71] ^ `TOP.cpu.dmu_sii_data[72] ^ `TOP.cpu.dmu_sii_data[73] ^ `TOP.cpu.dmu_sii_data[74]);

/*   0in custom
      -fire (($0in_rising_edge(dmu_sii_hdr_vld)) && !(p3 == dmu_sii_data[59]))
      -message "ctag error for dmu_sii:  p3 does not equal c3"
      -module cpu
      -name dmu_sii_ctag_ecc_p3 
*/

wire p4 =  (`TOP.cpu.dmu_sii_data[75] ^ `TOP.cpu.dmu_sii_data[76] ^ `TOP.cpu.dmu_sii_data[77] ^ `TOP.cpu.dmu_sii_data[78] ^ `TOP.cpu.dmu_sii_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(dmu_sii_hdr_vld)) && !(p4 == dmu_sii_data[60]))
      -message "ctag error for dmu_sii:  p4 does not equal c4"
      -module cpu
      -name dmu_sii_ctag_ecc_p4 
*/

wire dmu_sii_p5 =  (`TOP.cpu.dmu_sii_data[64] ^ `TOP.cpu.dmu_sii_data[65] ^ `TOP.cpu.dmu_sii_data[66] ^ `TOP.cpu.dmu_sii_data[68] ^ `TOP.cpu.dmu_sii_data[69] ^ `TOP.cpu.dmu_sii_data[71] ^ `TOP.cpu.dmu_sii_data[74] ^ `TOP.cpu.dmu_sii_data[75] ^ `TOP.cpu.dmu_sii_data[76] ^ `TOP.cpu.dmu_sii_data[78]);

/*   0in custom
      -fire (($0in_rising_edge(dmu_sii_hdr_vld)) && !(dmu_sii_p5 == dmu_sii_data[61]))
      -message "ctag error for dmu_sii:  p5 does not equal c5"
      -module cpu
      -name dmu_sii_ctag_ecc_p5 
*/

/*   0in odd_parity
      -var {dmu_sii_data[0],dmu_sii_data[2],dmu_sii_data[4],dmu_sii_data[6],dmu_sii_data[8],dmu_sii_data[10],dmu_sii_data[12],dmu_sii_data[14],dmu_sii_data[16],dmu_sii_data[18],dmu_sii_data[20],dmu_sii_data[22],dmu_sii_data[24],dmu_sii_data[26],dmu_sii_data[28],dmu_sii_data[30], ^ dmu_sii_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_even_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[32],dmu_sii_data[34],dmu_sii_data[36],dmu_sii_data[38],dmu_sii_data[40],dmu_sii_data[42],dmu_sii_data[44],dmu_sii_data[46],dmu_sii_data[48],dmu_sii_data[50],dmu_sii_data[52],dmu_sii_data[54],dmu_sii_data[56],dmu_sii_data[58],dmu_sii_data[60],dmu_sii_data[62], ^ dmu_sii_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_even_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[64],dmu_sii_data[66],dmu_sii_data[68],dmu_sii_data[70],dmu_sii_data[72],dmu_sii_data[74],dmu_sii_data[76],dmu_sii_data[78],dmu_sii_data[80],dmu_sii_data[82],dmu_sii_data[84],dmu_sii_data[86],dmu_sii_data[88],dmu_sii_data[90],dmu_sii_data[92],dmu_sii_data[94], ^ dmu_sii_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_even_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[96],dmu_sii_data[98],dmu_sii_data[100],dmu_sii_data[102],dmu_sii_data[104],dmu_sii_data[106],dmu_sii_data[108],dmu_sii_data[110],dmu_sii_data[112],dmu_sii_data[114],dmu_sii_data[116],dmu_sii_data[118],dmu_sii_data[120],dmu_sii_data[122],dmu_sii_data[124],dmu_sii_data[126], ^ dmu_sii_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_even_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[1],dmu_sii_data[3],dmu_sii_data[5],dmu_sii_data[7],dmu_sii_data[9],dmu_sii_data[11],dmu_sii_data[13],dmu_sii_data[15],dmu_sii_data[17],dmu_sii_data[19],dmu_sii_data[21],dmu_sii_data[23],dmu_sii_data[25],dmu_sii_data[27],dmu_sii_data[29],dmu_sii_data[31], ^ dmu_sii_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_odd_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[33],dmu_sii_data[35],dmu_sii_data[37],dmu_sii_data[39],dmu_sii_data[41],dmu_sii_data[43],dmu_sii_data[45],dmu_sii_data[47],dmu_sii_data[49],dmu_sii_data[51],dmu_sii_data[53],dmu_sii_data[55],dmu_sii_data[57],dmu_sii_data[59],dmu_sii_data[61],dmu_sii_data[63], ^ dmu_sii_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_odd_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[65],dmu_sii_data[67],dmu_sii_data[69],dmu_sii_data[71],dmu_sii_data[73],dmu_sii_data[75],dmu_sii_data[77],dmu_sii_data[79],dmu_sii_data[81],dmu_sii_data[83],dmu_sii_data[85],dmu_sii_data[87],dmu_sii_data[89],dmu_sii_data[91],dmu_sii_data[93],dmu_sii_data[95], ^ dmu_sii_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_odd_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[97],dmu_sii_data[99],dmu_sii_data[101],dmu_sii_data[103],dmu_sii_data[105],dmu_sii_data[107],dmu_sii_data[109],dmu_sii_data[111],dmu_sii_data[113],dmu_sii_data[115],dmu_sii_data[117],dmu_sii_data[119],dmu_sii_data[121],dmu_sii_data[123],dmu_sii_data[125],dmu_sii_data[127], ^ dmu_sii_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && !$0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_parity_odd_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[0],dmu_sii_data[2],dmu_sii_data[4],dmu_sii_data[6],dmu_sii_data[8],dmu_sii_data[10],dmu_sii_data[12],dmu_sii_data[14],dmu_sii_data[16],dmu_sii_data[18],dmu_sii_data[20],dmu_sii_data[22],dmu_sii_data[24],dmu_sii_data[26],dmu_sii_data[28],dmu_sii_data[30], ^ dmu_sii_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_even_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[32],dmu_sii_data[34],dmu_sii_data[36],dmu_sii_data[38],dmu_sii_data[40],dmu_sii_data[42],dmu_sii_data[44],dmu_sii_data[46],dmu_sii_data[48],dmu_sii_data[50],dmu_sii_data[52],dmu_sii_data[54],dmu_sii_data[56],dmu_sii_data[58],dmu_sii_data[60],dmu_sii_data[62], ^ dmu_sii_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_even_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[64],dmu_sii_data[66],dmu_sii_data[68],dmu_sii_data[70],dmu_sii_data[72],dmu_sii_data[74],dmu_sii_data[76],dmu_sii_data[78],dmu_sii_data[80],dmu_sii_data[82],dmu_sii_data[84],dmu_sii_data[86],dmu_sii_data[88],dmu_sii_data[90],dmu_sii_data[92],dmu_sii_data[94], ^ dmu_sii_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_even_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[96],dmu_sii_data[98],dmu_sii_data[100],dmu_sii_data[102],dmu_sii_data[104],dmu_sii_data[106],dmu_sii_data[108],dmu_sii_data[110],dmu_sii_data[112],dmu_sii_data[114],dmu_sii_data[116],dmu_sii_data[118],dmu_sii_data[120],dmu_sii_data[122],dmu_sii_data[124],dmu_sii_data[126], ^ dmu_sii_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_even_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[1],dmu_sii_data[3],dmu_sii_data[5],dmu_sii_data[7],dmu_sii_data[9],dmu_sii_data[11],dmu_sii_data[13],dmu_sii_data[15],dmu_sii_data[17],dmu_sii_data[19],dmu_sii_data[21],dmu_sii_data[23],dmu_sii_data[25],dmu_sii_data[27],dmu_sii_data[29],dmu_sii_data[31], ^ dmu_sii_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_odd_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[33],dmu_sii_data[35],dmu_sii_data[37],dmu_sii_data[39],dmu_sii_data[41],dmu_sii_data[43],dmu_sii_data[45],dmu_sii_data[47],dmu_sii_data[49],dmu_sii_data[51],dmu_sii_data[53],dmu_sii_data[55],dmu_sii_data[57],dmu_sii_data[59],dmu_sii_data[61],dmu_sii_data[63], ^ dmu_sii_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_odd_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[65],dmu_sii_data[67],dmu_sii_data[69],dmu_sii_data[71],dmu_sii_data[73],dmu_sii_data[75],dmu_sii_data[77],dmu_sii_data[79],dmu_sii_data[81],dmu_sii_data[83],dmu_sii_data[85],dmu_sii_data[87],dmu_sii_data[89],dmu_sii_data[91],dmu_sii_data[93],dmu_sii_data[95], ^ dmu_sii_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_odd_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[97],dmu_sii_data[99],dmu_sii_data[101],dmu_sii_data[103],dmu_sii_data[105],dmu_sii_data[107],dmu_sii_data[109],dmu_sii_data[111],dmu_sii_data[113],dmu_sii_data[115],dmu_sii_data[117],dmu_sii_data[119],dmu_sii_data[121],dmu_sii_data[123],dmu_sii_data[125],dmu_sii_data[127], ^ dmu_sii_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,1)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,1 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,1)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data1_parity_odd_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[0],dmu_sii_data[2],dmu_sii_data[4],dmu_sii_data[6],dmu_sii_data[8],dmu_sii_data[10],dmu_sii_data[12],dmu_sii_data[14],dmu_sii_data[16],dmu_sii_data[18],dmu_sii_data[20],dmu_sii_data[22],dmu_sii_data[24],dmu_sii_data[26],dmu_sii_data[28],dmu_sii_data[30], ^ dmu_sii_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_even_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[32],dmu_sii_data[34],dmu_sii_data[36],dmu_sii_data[38],dmu_sii_data[40],dmu_sii_data[42],dmu_sii_data[44],dmu_sii_data[46],dmu_sii_data[48],dmu_sii_data[50],dmu_sii_data[52],dmu_sii_data[54],dmu_sii_data[56],dmu_sii_data[58],dmu_sii_data[60],dmu_sii_data[62], ^ dmu_sii_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_even_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[64],dmu_sii_data[66],dmu_sii_data[68],dmu_sii_data[70],dmu_sii_data[72],dmu_sii_data[74],dmu_sii_data[76],dmu_sii_data[78],dmu_sii_data[80],dmu_sii_data[82],dmu_sii_data[84],dmu_sii_data[86],dmu_sii_data[88],dmu_sii_data[90],dmu_sii_data[92],dmu_sii_data[94], ^ dmu_sii_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_even_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[96],dmu_sii_data[98],dmu_sii_data[100],dmu_sii_data[102],dmu_sii_data[104],dmu_sii_data[106],dmu_sii_data[108],dmu_sii_data[110],dmu_sii_data[112],dmu_sii_data[114],dmu_sii_data[116],dmu_sii_data[118],dmu_sii_data[120],dmu_sii_data[122],dmu_sii_data[124],dmu_sii_data[126], ^ dmu_sii_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_even_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[1],dmu_sii_data[3],dmu_sii_data[5],dmu_sii_data[7],dmu_sii_data[9],dmu_sii_data[11],dmu_sii_data[13],dmu_sii_data[15],dmu_sii_data[17],dmu_sii_data[19],dmu_sii_data[21],dmu_sii_data[23],dmu_sii_data[25],dmu_sii_data[27],dmu_sii_data[29],dmu_sii_data[31], ^ dmu_sii_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_odd_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[33],dmu_sii_data[35],dmu_sii_data[37],dmu_sii_data[39],dmu_sii_data[41],dmu_sii_data[43],dmu_sii_data[45],dmu_sii_data[47],dmu_sii_data[49],dmu_sii_data[51],dmu_sii_data[53],dmu_sii_data[55],dmu_sii_data[57],dmu_sii_data[59],dmu_sii_data[61],dmu_sii_data[63], ^ dmu_sii_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_odd_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[65],dmu_sii_data[67],dmu_sii_data[69],dmu_sii_data[71],dmu_sii_data[73],dmu_sii_data[75],dmu_sii_data[77],dmu_sii_data[79],dmu_sii_data[81],dmu_sii_data[83],dmu_sii_data[85],dmu_sii_data[87],dmu_sii_data[89],dmu_sii_data[91],dmu_sii_data[93],dmu_sii_data[95], ^ dmu_sii_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_odd_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[97],dmu_sii_data[99],dmu_sii_data[101],dmu_sii_data[103],dmu_sii_data[105],dmu_sii_data[107],dmu_sii_data[109],dmu_sii_data[111],dmu_sii_data[113],dmu_sii_data[115],dmu_sii_data[117],dmu_sii_data[119],dmu_sii_data[121],dmu_sii_data[123],dmu_sii_data[125],dmu_sii_data[127], ^ dmu_sii_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,2)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,2 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,2)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data2_parity_odd_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[0],dmu_sii_data[2],dmu_sii_data[4],dmu_sii_data[6],dmu_sii_data[8],dmu_sii_data[10],dmu_sii_data[12],dmu_sii_data[14],dmu_sii_data[16],dmu_sii_data[18],dmu_sii_data[20],dmu_sii_data[22],dmu_sii_data[24],dmu_sii_data[26],dmu_sii_data[28],dmu_sii_data[30], ^ dmu_sii_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_even_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[32],dmu_sii_data[34],dmu_sii_data[36],dmu_sii_data[38],dmu_sii_data[40],dmu_sii_data[42],dmu_sii_data[44],dmu_sii_data[46],dmu_sii_data[48],dmu_sii_data[50],dmu_sii_data[52],dmu_sii_data[54],dmu_sii_data[56],dmu_sii_data[58],dmu_sii_data[60],dmu_sii_data[62], ^ dmu_sii_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_even_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[64],dmu_sii_data[66],dmu_sii_data[68],dmu_sii_data[70],dmu_sii_data[72],dmu_sii_data[74],dmu_sii_data[76],dmu_sii_data[78],dmu_sii_data[80],dmu_sii_data[82],dmu_sii_data[84],dmu_sii_data[86],dmu_sii_data[88],dmu_sii_data[90],dmu_sii_data[92],dmu_sii_data[94], ^ dmu_sii_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_even_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[96],dmu_sii_data[98],dmu_sii_data[100],dmu_sii_data[102],dmu_sii_data[104],dmu_sii_data[106],dmu_sii_data[108],dmu_sii_data[110],dmu_sii_data[112],dmu_sii_data[114],dmu_sii_data[116],dmu_sii_data[118],dmu_sii_data[120],dmu_sii_data[122],dmu_sii_data[124],dmu_sii_data[126], ^ dmu_sii_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_even_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[1],dmu_sii_data[3],dmu_sii_data[5],dmu_sii_data[7],dmu_sii_data[9],dmu_sii_data[11],dmu_sii_data[13],dmu_sii_data[15],dmu_sii_data[17],dmu_sii_data[19],dmu_sii_data[21],dmu_sii_data[23],dmu_sii_data[25],dmu_sii_data[27],dmu_sii_data[29],dmu_sii_data[31], ^ dmu_sii_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_odd_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[33],dmu_sii_data[35],dmu_sii_data[37],dmu_sii_data[39],dmu_sii_data[41],dmu_sii_data[43],dmu_sii_data[45],dmu_sii_data[47],dmu_sii_data[49],dmu_sii_data[51],dmu_sii_data[53],dmu_sii_data[55],dmu_sii_data[57],dmu_sii_data[59],dmu_sii_data[61],dmu_sii_data[63], ^ dmu_sii_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_odd_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[65],dmu_sii_data[67],dmu_sii_data[69],dmu_sii_data[71],dmu_sii_data[73],dmu_sii_data[75],dmu_sii_data[77],dmu_sii_data[79],dmu_sii_data[81],dmu_sii_data[83],dmu_sii_data[85],dmu_sii_data[87],dmu_sii_data[89],dmu_sii_data[91],dmu_sii_data[93],dmu_sii_data[95], ^ dmu_sii_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_odd_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[97],dmu_sii_data[99],dmu_sii_data[101],dmu_sii_data[103],dmu_sii_data[105],dmu_sii_data[107],dmu_sii_data[109],dmu_sii_data[111],dmu_sii_data[113],dmu_sii_data[115],dmu_sii_data[117],dmu_sii_data[119],dmu_sii_data[121],dmu_sii_data[123],dmu_sii_data[125],dmu_sii_data[127], ^ dmu_sii_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(dmu_sii_hdr_vld,3)))  && ($0in_falling_edge($0in_delay(dmu_sii_datareq,3 ))) && !$0in_falling_edge($0in_delay(dmu_sii_datareq16,3)))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data3_parity_odd_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[0],dmu_sii_data[2],dmu_sii_data[4],dmu_sii_data[6],dmu_sii_data[8],dmu_sii_data[10],dmu_sii_data[12],dmu_sii_data[14],dmu_sii_data[16],dmu_sii_data[18],dmu_sii_data[20],dmu_sii_data[22],dmu_sii_data[24],dmu_sii_data[26],dmu_sii_data[28],dmu_sii_data[30], ^ dmu_sii_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_even_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[32],dmu_sii_data[34],dmu_sii_data[36],dmu_sii_data[38],dmu_sii_data[40],dmu_sii_data[42],dmu_sii_data[44],dmu_sii_data[46],dmu_sii_data[48],dmu_sii_data[50],dmu_sii_data[52],dmu_sii_data[54],dmu_sii_data[56],dmu_sii_data[58],dmu_sii_data[60],dmu_sii_data[62], ^ dmu_sii_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_even_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[64],dmu_sii_data[66],dmu_sii_data[68],dmu_sii_data[70],dmu_sii_data[72],dmu_sii_data[74],dmu_sii_data[76],dmu_sii_data[78],dmu_sii_data[80],dmu_sii_data[82],dmu_sii_data[84],dmu_sii_data[86],dmu_sii_data[88],dmu_sii_data[90],dmu_sii_data[92],dmu_sii_data[94], ^ dmu_sii_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_even_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[96],dmu_sii_data[98],dmu_sii_data[100],dmu_sii_data[102],dmu_sii_data[104],dmu_sii_data[106],dmu_sii_data[108],dmu_sii_data[110],dmu_sii_data[112],dmu_sii_data[114],dmu_sii_data[116],dmu_sii_data[118],dmu_sii_data[120],dmu_sii_data[122],dmu_sii_data[124],dmu_sii_data[126], ^ dmu_sii_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_even_byte48
*/

/*   0in odd_parity
      -var {dmu_sii_data[1],dmu_sii_data[3],dmu_sii_data[5],dmu_sii_data[7],dmu_sii_data[9],dmu_sii_data[11],dmu_sii_data[13],dmu_sii_data[15],dmu_sii_data[17],dmu_sii_data[19],dmu_sii_data[21],dmu_sii_data[23],dmu_sii_data[25],dmu_sii_data[27],dmu_sii_data[29],dmu_sii_data[31], ^ dmu_sii_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_odd_byte0
*/

/*   0in odd_parity
      -var {dmu_sii_data[33],dmu_sii_data[35],dmu_sii_data[37],dmu_sii_data[39],dmu_sii_data[41],dmu_sii_data[43],dmu_sii_data[45],dmu_sii_data[47],dmu_sii_data[49],dmu_sii_data[51],dmu_sii_data[53],dmu_sii_data[55],dmu_sii_data[57],dmu_sii_data[59],dmu_sii_data[61],dmu_sii_data[63], ^ dmu_sii_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_odd_byte16
*/

/*   0in odd_parity
      -var {dmu_sii_data[65],dmu_sii_data[67],dmu_sii_data[69],dmu_sii_data[71],dmu_sii_data[73],dmu_sii_data[75],dmu_sii_data[77],dmu_sii_data[79],dmu_sii_data[81],dmu_sii_data[83],dmu_sii_data[85],dmu_sii_data[87],dmu_sii_data[89],dmu_sii_data[91],dmu_sii_data[93],dmu_sii_data[95], ^ dmu_sii_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_odd_byte32
*/

/*   0in odd_parity
      -var {dmu_sii_data[97],dmu_sii_data[99],dmu_sii_data[101],dmu_sii_data[103],dmu_sii_data[105],dmu_sii_data[107],dmu_sii_data[109],dmu_sii_data[111],dmu_sii_data[113],dmu_sii_data[115],dmu_sii_data[117],dmu_sii_data[119],dmu_sii_data[121],dmu_sii_data[123],dmu_sii_data[125],dmu_sii_data[127], ^ dmu_sii_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(dmu_sii_hdr_vld))  && ($0in_falling_edge(dmu_sii_datareq)) && $0in_falling_edge(dmu_sii_datareq16))
      -module cpu
      -reset `TB_RST
      -name dmu_sii_data0_wri_parity_odd_byte48
*/

/*************************************************************************
*
*  SIO -> DMU
*  Check for data parity, and ctag ecc
*
**************************************************************************/

wire p5 =  (`TOP.cpu.sio_dmu_data[64] ^ `TOP.cpu.sio_dmu_data[65] ^ `TOP.cpu.sio_dmu_data[67] ^ `TOP.cpu.sio_dmu_data[68] ^ `TOP.cpu.sio_dmu_data[70] ^ `TOP.cpu.sio_dmu_data[72] ^ `TOP.cpu.sio_dmu_data[74] ^ `TOP.cpu.sio_dmu_data[75] ^ `TOP.cpu.sio_dmu_data[77] ^ `TOP.cpu.sio_dmu_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(sio_dmu_hdr_vld)) && !(p5 == sio_dmu_data[56]))
      -message "ctag error for sio_dmu:  p0 does not equal c0"
      -module cpu
      -reset `TB_RST
      -name sio_dmu_ctag_ecc_p0 
*/

wire p6 =  (`TOP.cpu.sio_dmu_data[64] ^ `TOP.cpu.sio_dmu_data[66] ^ `TOP.cpu.sio_dmu_data[67] ^ `TOP.cpu.sio_dmu_data[69] ^ `TOP.cpu.sio_dmu_data[70] ^ `TOP.cpu.sio_dmu_data[73] ^ `TOP.cpu.sio_dmu_data[74] ^ `TOP.cpu.sio_dmu_data[76] ^ `TOP.cpu.sio_dmu_data[77]);


/*   0in custom
      -fire (($0in_rising_edge(sio_dmu_hdr_vld)) && !(p6 == sio_dmu_data[57]))
      -message "ctag error for sio_dmu:  p1 does not equal c1"
      -module cpu
      -reset `TB_RST
      -name sio_dmu_ctag_ecc_p1 
*/

wire p7 =  (`TOP.cpu.sio_dmu_data[65] ^ `TOP.cpu.sio_dmu_data[66] ^ `TOP.cpu.sio_dmu_data[67] ^ `TOP.cpu.sio_dmu_data[71] ^ `TOP.cpu.sio_dmu_data[72] ^ `TOP.cpu.sio_dmu_data[73] ^ `TOP.cpu.sio_dmu_data[74] ^ `TOP.cpu.sio_dmu_data[78] ^ `TOP.cpu.sio_dmu_data[79]);


/*   0in custom
      -fire (($0in_rising_edge(sio_dmu_hdr_vld)) && !(p7 == sio_dmu_data[58]))
      -message "ctag error for sio_dmu:  p2 does not equal c2"
      -module cpu
      -reset `TB_RST
      -name sio_dmu_ctag_ecc_p2 
*/

wire p8 =  (`TOP.cpu.sio_dmu_data[68] ^ `TOP.cpu.sio_dmu_data[69] ^ `TOP.cpu.sio_dmu_data[70] ^ `TOP.cpu.sio_dmu_data[71] ^ `TOP.cpu.sio_dmu_data[72] ^ `TOP.cpu.sio_dmu_data[73] ^ `TOP.cpu.sio_dmu_data[74]);

/*   0in custom
      -fire (($0in_rising_edge(sio_dmu_hdr_vld)) && !(p8 == sio_dmu_data[59]))
      -message "ctag error for sio_dmu:  p3 does not equal c3"
      -module cpu
      -reset `TB_RST
      -name sio_dmu_ctag_ecc_p3 
*/

wire p9 =  (`TOP.cpu.sio_dmu_data[75] ^ `TOP.cpu.sio_dmu_data[76] ^ `TOP.cpu.sio_dmu_data[77] ^ `TOP.cpu.sio_dmu_data[78] ^ `TOP.cpu.sio_dmu_data[79]);

/*   0in custom
      -fire (($0in_rising_edge(sio_dmu_hdr_vld)) && !(p9 == sio_dmu_data[60]))
      -message "ctag error for sio_dmu:  p4 does not equal c4"
      -module cpu
      -reset `TB_RST
      -name sio_dmu_ctag_ecc_p4 
*/

wire sio_dmu_p5 =  (`TOP.cpu.sio_dmu_data[64] ^ `TOP.cpu.sio_dmu_data[65] ^ `TOP.cpu.sio_dmu_data[66] ^ `TOP.cpu.sio_dmu_data[68] ^ `TOP.cpu.sio_dmu_data[69] ^ `TOP.cpu.sio_dmu_data[71] ^ `TOP.cpu.sio_dmu_data[74] ^ `TOP.cpu.sio_dmu_data[75] ^ `TOP.cpu.sio_dmu_data[76] ^ `TOP.cpu.sio_dmu_data[78]);

/*   0in custom
      -fire (($0in_rising_edge(sio_dmu_hdr_vld)) && !(sio_dmu_p5 == sio_dmu_data[61]))
      -message "ctag error for sio_dmu:  p5 does not equal c5"
      -module cpu
      -reset `TB_RST
      -name sio_dmu_ctag_ecc_p5 
*/

/*   0in odd_parity
      -var {sio_dmu_data[0],sio_dmu_data[2],sio_dmu_data[4],sio_dmu_data[6],sio_dmu_data[8],sio_dmu_data[10],sio_dmu_data[12],sio_dmu_data[14],sio_dmu_data[16],sio_dmu_data[18],sio_dmu_data[20],sio_dmu_data[22],sio_dmu_data[24],sio_dmu_data[26],sio_dmu_data[28],sio_dmu_data[30], ^ sio_dmu_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_even_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[32],sio_dmu_data[34],sio_dmu_data[36],sio_dmu_data[38],sio_dmu_data[40],sio_dmu_data[42],sio_dmu_data[44],sio_dmu_data[46],sio_dmu_data[48],sio_dmu_data[50],sio_dmu_data[52],sio_dmu_data[54],sio_dmu_data[56],sio_dmu_data[58],sio_dmu_data[60],sio_dmu_data[62], ^ sio_dmu_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_even_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[64],sio_dmu_data[66],sio_dmu_data[68],sio_dmu_data[70],sio_dmu_data[72],sio_dmu_data[74],sio_dmu_data[76],sio_dmu_data[78],sio_dmu_data[80],sio_dmu_data[82],sio_dmu_data[84],sio_dmu_data[86],sio_dmu_data[88],sio_dmu_data[90],sio_dmu_data[92],sio_dmu_data[94], ^ sio_dmu_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_even_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[96],sio_dmu_data[98],sio_dmu_data[100],sio_dmu_data[102],sio_dmu_data[104],sio_dmu_data[106],sio_dmu_data[108],sio_dmu_data[110],sio_dmu_data[112],sio_dmu_data[114],sio_dmu_data[116],sio_dmu_data[118],sio_dmu_data[120],sio_dmu_data[122],sio_dmu_data[124],sio_dmu_data[126], ^ sio_dmu_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_even_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[1],sio_dmu_data[3],sio_dmu_data[5],sio_dmu_data[7],sio_dmu_data[9],sio_dmu_data[11],sio_dmu_data[13],sio_dmu_data[15],sio_dmu_data[17],sio_dmu_data[19],sio_dmu_data[21],sio_dmu_data[23],sio_dmu_data[25],sio_dmu_data[27],sio_dmu_data[29],sio_dmu_data[31], ^ sio_dmu_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_odd_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[33],sio_dmu_data[35],sio_dmu_data[37],sio_dmu_data[39],sio_dmu_data[41],sio_dmu_data[43],sio_dmu_data[45],sio_dmu_data[47],sio_dmu_data[49],sio_dmu_data[51],sio_dmu_data[53],sio_dmu_data[55],sio_dmu_data[57],sio_dmu_data[59],sio_dmu_data[61],sio_dmu_data[63], ^ sio_dmu_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_odd_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[65],sio_dmu_data[67],sio_dmu_data[69],sio_dmu_data[71],sio_dmu_data[73],sio_dmu_data[75],sio_dmu_data[77],sio_dmu_data[79],sio_dmu_data[81],sio_dmu_data[83],sio_dmu_data[85],sio_dmu_data[87],sio_dmu_data[89],sio_dmu_data[91],sio_dmu_data[93],sio_dmu_data[95], ^ sio_dmu_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_odd_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[97],sio_dmu_data[99],sio_dmu_data[101],sio_dmu_data[103],sio_dmu_data[105],sio_dmu_data[107],sio_dmu_data[109],sio_dmu_data[111],sio_dmu_data[113],sio_dmu_data[115],sio_dmu_data[117],sio_dmu_data[119],sio_dmu_data[121],sio_dmu_data[123],sio_dmu_data[125],sio_dmu_data[127], ^ sio_dmu_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge(sio_dmu_hdr_vld)))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data0_parity_odd_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[0],sio_dmu_data[2],sio_dmu_data[4],sio_dmu_data[6],sio_dmu_data[8],sio_dmu_data[10],sio_dmu_data[12],sio_dmu_data[14],sio_dmu_data[16],sio_dmu_data[18],sio_dmu_data[20],sio_dmu_data[22],sio_dmu_data[24],sio_dmu_data[26],sio_dmu_data[28],sio_dmu_data[30], ^ sio_dmu_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_even_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[32],sio_dmu_data[34],sio_dmu_data[36],sio_dmu_data[38],sio_dmu_data[40],sio_dmu_data[42],sio_dmu_data[44],sio_dmu_data[46],sio_dmu_data[48],sio_dmu_data[50],sio_dmu_data[52],sio_dmu_data[54],sio_dmu_data[56],sio_dmu_data[58],sio_dmu_data[60],sio_dmu_data[62], ^ sio_dmu_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_even_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[64],sio_dmu_data[66],sio_dmu_data[68],sio_dmu_data[70],sio_dmu_data[72],sio_dmu_data[74],sio_dmu_data[76],sio_dmu_data[78],sio_dmu_data[80],sio_dmu_data[82],sio_dmu_data[84],sio_dmu_data[86],sio_dmu_data[88],sio_dmu_data[90],sio_dmu_data[92],sio_dmu_data[94], ^ sio_dmu_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_even_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[96],sio_dmu_data[98],sio_dmu_data[100],sio_dmu_data[102],sio_dmu_data[104],sio_dmu_data[106],sio_dmu_data[108],sio_dmu_data[110],sio_dmu_data[112],sio_dmu_data[114],sio_dmu_data[116],sio_dmu_data[118],sio_dmu_data[120],sio_dmu_data[122],sio_dmu_data[124],sio_dmu_data[126], ^ sio_dmu_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_even_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[1],sio_dmu_data[3],sio_dmu_data[5],sio_dmu_data[7],sio_dmu_data[9],sio_dmu_data[11],sio_dmu_data[13],sio_dmu_data[15],sio_dmu_data[17],sio_dmu_data[19],sio_dmu_data[21],sio_dmu_data[23],sio_dmu_data[25],sio_dmu_data[27],sio_dmu_data[29],sio_dmu_data[31], ^ sio_dmu_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_odd_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[33],sio_dmu_data[35],sio_dmu_data[37],sio_dmu_data[39],sio_dmu_data[41],sio_dmu_data[43],sio_dmu_data[45],sio_dmu_data[47],sio_dmu_data[49],sio_dmu_data[51],sio_dmu_data[53],sio_dmu_data[55],sio_dmu_data[57],sio_dmu_data[59],sio_dmu_data[61],sio_dmu_data[63], ^ sio_dmu_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_odd_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[65],sio_dmu_data[67],sio_dmu_data[69],sio_dmu_data[71],sio_dmu_data[73],sio_dmu_data[75],sio_dmu_data[77],sio_dmu_data[79],sio_dmu_data[81],sio_dmu_data[83],sio_dmu_data[85],sio_dmu_data[87],sio_dmu_data[89],sio_dmu_data[91],sio_dmu_data[93],sio_dmu_data[95], ^ sio_dmu_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_odd_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[97],sio_dmu_data[99],sio_dmu_data[101],sio_dmu_data[103],sio_dmu_data[105],sio_dmu_data[107],sio_dmu_data[109],sio_dmu_data[111],sio_dmu_data[113],sio_dmu_data[115],sio_dmu_data[117],sio_dmu_data[119],sio_dmu_data[121],sio_dmu_data[123],sio_dmu_data[125],sio_dmu_data[127], ^ sio_dmu_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,1))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data1_parity_odd_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[0],sio_dmu_data[2],sio_dmu_data[4],sio_dmu_data[6],sio_dmu_data[8],sio_dmu_data[10],sio_dmu_data[12],sio_dmu_data[14],sio_dmu_data[16],sio_dmu_data[18],sio_dmu_data[20],sio_dmu_data[22],sio_dmu_data[24],sio_dmu_data[26],sio_dmu_data[28],sio_dmu_data[30], ^ sio_dmu_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_even_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[32],sio_dmu_data[34],sio_dmu_data[36],sio_dmu_data[38],sio_dmu_data[40],sio_dmu_data[42],sio_dmu_data[44],sio_dmu_data[46],sio_dmu_data[48],sio_dmu_data[50],sio_dmu_data[52],sio_dmu_data[54],sio_dmu_data[56],sio_dmu_data[58],sio_dmu_data[60],sio_dmu_data[62], ^ sio_dmu_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_even_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[64],sio_dmu_data[66],sio_dmu_data[68],sio_dmu_data[70],sio_dmu_data[72],sio_dmu_data[74],sio_dmu_data[76],sio_dmu_data[78],sio_dmu_data[80],sio_dmu_data[82],sio_dmu_data[84],sio_dmu_data[86],sio_dmu_data[88],sio_dmu_data[90],sio_dmu_data[92],sio_dmu_data[94], ^ sio_dmu_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_even_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[96],sio_dmu_data[98],sio_dmu_data[100],sio_dmu_data[102],sio_dmu_data[104],sio_dmu_data[106],sio_dmu_data[108],sio_dmu_data[110],sio_dmu_data[112],sio_dmu_data[114],sio_dmu_data[116],sio_dmu_data[118],sio_dmu_data[120],sio_dmu_data[122],sio_dmu_data[124],sio_dmu_data[126], ^ sio_dmu_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_even_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[1],sio_dmu_data[3],sio_dmu_data[5],sio_dmu_data[7],sio_dmu_data[9],sio_dmu_data[11],sio_dmu_data[13],sio_dmu_data[15],sio_dmu_data[17],sio_dmu_data[19],sio_dmu_data[21],sio_dmu_data[23],sio_dmu_data[25],sio_dmu_data[27],sio_dmu_data[29],sio_dmu_data[31], ^ sio_dmu_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_odd_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[33],sio_dmu_data[35],sio_dmu_data[37],sio_dmu_data[39],sio_dmu_data[41],sio_dmu_data[43],sio_dmu_data[45],sio_dmu_data[47],sio_dmu_data[49],sio_dmu_data[51],sio_dmu_data[53],sio_dmu_data[55],sio_dmu_data[57],sio_dmu_data[59],sio_dmu_data[61],sio_dmu_data[63], ^ sio_dmu_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_odd_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[65],sio_dmu_data[67],sio_dmu_data[69],sio_dmu_data[71],sio_dmu_data[73],sio_dmu_data[75],sio_dmu_data[77],sio_dmu_data[79],sio_dmu_data[81],sio_dmu_data[83],sio_dmu_data[85],sio_dmu_data[87],sio_dmu_data[89],sio_dmu_data[91],sio_dmu_data[93],sio_dmu_data[95], ^ sio_dmu_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_odd_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[97],sio_dmu_data[99],sio_dmu_data[101],sio_dmu_data[103],sio_dmu_data[105],sio_dmu_data[107],sio_dmu_data[109],sio_dmu_data[111],sio_dmu_data[113],sio_dmu_data[115],sio_dmu_data[117],sio_dmu_data[119],sio_dmu_data[121],sio_dmu_data[123],sio_dmu_data[125],sio_dmu_data[127], ^ sio_dmu_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,2))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data2_parity_odd_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[0],sio_dmu_data[2],sio_dmu_data[4],sio_dmu_data[6],sio_dmu_data[8],sio_dmu_data[10],sio_dmu_data[12],sio_dmu_data[14],sio_dmu_data[16],sio_dmu_data[18],sio_dmu_data[20],sio_dmu_data[22],sio_dmu_data[24],sio_dmu_data[26],sio_dmu_data[28],sio_dmu_data[30], ^ sio_dmu_parity[0]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_even_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[32],sio_dmu_data[34],sio_dmu_data[36],sio_dmu_data[38],sio_dmu_data[40],sio_dmu_data[42],sio_dmu_data[44],sio_dmu_data[46],sio_dmu_data[48],sio_dmu_data[50],sio_dmu_data[52],sio_dmu_data[54],sio_dmu_data[56],sio_dmu_data[58],sio_dmu_data[60],sio_dmu_data[62], ^ sio_dmu_parity[2]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_even_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[64],sio_dmu_data[66],sio_dmu_data[68],sio_dmu_data[70],sio_dmu_data[72],sio_dmu_data[74],sio_dmu_data[76],sio_dmu_data[78],sio_dmu_data[80],sio_dmu_data[82],sio_dmu_data[84],sio_dmu_data[86],sio_dmu_data[88],sio_dmu_data[90],sio_dmu_data[92],sio_dmu_data[94], ^ sio_dmu_parity[4]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_even_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[96],sio_dmu_data[98],sio_dmu_data[100],sio_dmu_data[102],sio_dmu_data[104],sio_dmu_data[106],sio_dmu_data[108],sio_dmu_data[110],sio_dmu_data[112],sio_dmu_data[114],sio_dmu_data[116],sio_dmu_data[118],sio_dmu_data[120],sio_dmu_data[122],sio_dmu_data[124],sio_dmu_data[126], ^ sio_dmu_parity[6]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_even_byte48
*/

/*   0in odd_parity
      -var {sio_dmu_data[1],sio_dmu_data[3],sio_dmu_data[5],sio_dmu_data[7],sio_dmu_data[9],sio_dmu_data[11],sio_dmu_data[13],sio_dmu_data[15],sio_dmu_data[17],sio_dmu_data[19],sio_dmu_data[21],sio_dmu_data[23],sio_dmu_data[25],sio_dmu_data[27],sio_dmu_data[29],sio_dmu_data[31], ^ sio_dmu_parity[1]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_odd_byte0
*/

/*   0in odd_parity
      -var {sio_dmu_data[33],sio_dmu_data[35],sio_dmu_data[37],sio_dmu_data[39],sio_dmu_data[41],sio_dmu_data[43],sio_dmu_data[45],sio_dmu_data[47],sio_dmu_data[49],sio_dmu_data[51],sio_dmu_data[53],sio_dmu_data[55],sio_dmu_data[57],sio_dmu_data[59],sio_dmu_data[61],sio_dmu_data[63], ^ sio_dmu_parity[3]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_odd_byte16
*/

/*   0in odd_parity
      -var {sio_dmu_data[65],sio_dmu_data[67],sio_dmu_data[69],sio_dmu_data[71],sio_dmu_data[73],sio_dmu_data[75],sio_dmu_data[77],sio_dmu_data[79],sio_dmu_data[81],sio_dmu_data[83],sio_dmu_data[85],sio_dmu_data[87],sio_dmu_data[89],sio_dmu_data[91],sio_dmu_data[93],sio_dmu_data[95], ^ sio_dmu_parity[5]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_odd_byte32
*/

/*   0in odd_parity
      -var {sio_dmu_data[97],sio_dmu_data[99],sio_dmu_data[101],sio_dmu_data[103],sio_dmu_data[105],sio_dmu_data[107],sio_dmu_data[109],sio_dmu_data[111],sio_dmu_data[113],sio_dmu_data[115],sio_dmu_data[117],sio_dmu_data[119],sio_dmu_data[121],sio_dmu_data[123],sio_dmu_data[125],sio_dmu_data[127], ^ sio_dmu_parity[7]}
      -active (~no_dmusiu_ras_chk && ($0in_falling_edge($0in_delay(sio_dmu_hdr_vld,3))))
      -module cpu
      -reset `TB_RST
      -name sio_dmu_data3_parity_odd_byte48
*/

/*************************************************************************
*
*  DMU  -> L2/NCU
*  Check error bit through interface 
*
**************************************************************************/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t0_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t0_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t1_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t1_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t2_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t2_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t3_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t3_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t4_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t4_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t5_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t5_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t6_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t6_error
*/

/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower (sii_l2t7_req[28] == 1)
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_l2t7_error
*/


/* 0in assert_follower
      -leader (($0in_rising_edge(dmu_sii_hdr_vld)) && ((dmu_sii_data[80] == 1) | (dmu_sii_data[81] == 1) | (dmu_sii_data[82] == 1)))
      -follower ((sii_ncu_data[29] == 1) | (sii_ncu_data[30] == 1) | (sii_ncu_data[31] == 1)) 
      -min 1
      -max 200
      -module cpu
      -reset `TB_RST
      -name dmu_sii_ncu_error
*/


endmodule // dmu_siu_ras_chkr
