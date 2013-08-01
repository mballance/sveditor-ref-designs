// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_siu_ras_chkr.v
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


module ncu_siu_ras_chkr();

reg no_siuncu_ras_chk ;
initial begin // {
    @(posedge `TOP.cpu.sii.iol2clk) ;
    if ($test$plusargs("ios_0in_ras_chk_off"))
        no_siuncu_ras_chk <= 1;
    else
        no_siuncu_ras_chk <= 0;
end //}

//  0in disable_checker no_siuncu_ras_chk -name cpu.sii_ncu_ctag* 

`ifdef X_GUARD
   // 0in known_driven -var sii_ncu_req   -name sii_ncu_req_x_guard -module cpu
   // 0in known_driven -var sii_ncu_data  -name ncu_sii_data_x_guard -module cpu

   // 0in known_driven -var ncu_sii_gnt   -name ncu_sii_gnt_x_guard -module cpu

   // 0in known_driven -var ncu_sii_pm  -name ncu_sii_pm_x_guard -module cpu
   // 0in known_driven -var ncu_sii_ba01  -name ncu_sii_ba01_x_guard -module cpu
   // 0in known_driven -var ncu_sii_ba23  -name ncu_sii_ba23_x_guard -module cpu
   // 0in known_driven -var ncu_sii_ba45  -name ncu_sii_ba45_x_guard -module cpu
   // 0in known_driven -var ncu_sii_ba67  -name ncu_sii_ba67_x_guard -module cpu

   // 0in known_driven -var ncu_sii_l2_idx_hash_en  -name ncu_sii_l2_idx_hash_en_x_guard -module cpu
`endif


/*************************************************************************
*
*  Check for ctag ecc 
*
**************************************************************************/

wire p0 =  (`TOP.cpu.sii_ncu_data[0] ^ `TOP.cpu.sii_ncu_data[1] ^ `TOP.cpu.sii_ncu_data[3] ^ `TOP.cpu.sii_ncu_data[4] ^ `TOP.cpu.sii_ncu_data[6] ^ `TOP.cpu.sii_ncu_data[8] ^ `TOP.cpu.sii_ncu_data[10] ^ `TOP.cpu.sii_ncu_data[11] ^ `TOP.cpu.sii_ncu_data[13] ^ `TOP.cpu.sii_ncu_data[15]);

/*   0in custom
      -fire (($0in_rising_edge($0in_delay(ncu_sii_gnt,1)))  && !(p0 == sii_ncu_data[16]))
      -message "ctag error for sii_ncu:  p0 does not equal c0"
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_ncu_ctag_ecc_p0
*/

wire p1 =  (`TOP.cpu.sii_ncu_data[0] ^ `TOP.cpu.sii_ncu_data[2] ^ `TOP.cpu.sii_ncu_data[3] ^ `TOP.cpu.sii_ncu_data[5] ^ `TOP.cpu.sii_ncu_data[6] ^ `TOP.cpu.sii_ncu_data[9] ^ `TOP.cpu.sii_ncu_data[10] ^ `TOP.cpu.sii_ncu_data[12] ^ `TOP.cpu.sii_ncu_data[13]);

/*   0in custom
      -fire (($0in_rising_edge($0in_delay(ncu_sii_gnt,1)))  && !(p1 == sii_ncu_data[17]))
      -message "ctag error for sii_ncu:  p1 does not equal c1"
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_ncu_ctag_ecc_p1
*/

wire p2 =  (`TOP.cpu.sii_ncu_data[1] ^ `TOP.cpu.sii_ncu_data[2] ^ `TOP.cpu.sii_ncu_data[3] ^ `TOP.cpu.sii_ncu_data[7] ^ `TOP.cpu.sii_ncu_data[8] ^ `TOP.cpu.sii_ncu_data[9] ^ `TOP.cpu.sii_ncu_data[10] ^ `TOP.cpu.sii_ncu_data[14] ^ `TOP.cpu.sii_ncu_data[15]);

/*   0in custom
      -fire (($0in_rising_edge($0in_delay(ncu_sii_gnt,1)))  && !(p2 == sii_ncu_data[18]))
      -message "ctag error for sii_ncu:  p2 does not equal c2"
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_ncu_ctag_ecc_p2
*/

wire p3 =  (`TOP.cpu.sii_ncu_data[4] ^ `TOP.cpu.sii_ncu_data[5] ^ `TOP.cpu.sii_ncu_data[6] ^ `TOP.cpu.sii_ncu_data[7] ^ `TOP.cpu.sii_ncu_data[8] ^ `TOP.cpu.sii_ncu_data[9] ^ `TOP.cpu.sii_ncu_data[10]);

/*   0in custom
      -fire (($0in_rising_edge($0in_delay(ncu_sii_gnt,1)))  && !(p3 == sii_ncu_data[19]))
      -message "ctag error for sii_ncu:  p3 does not equal c3"
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_ncu_ctag_ecc_p3
*/

wire p4 =  (`TOP.cpu.sii_ncu_data[11] ^ `TOP.cpu.sii_ncu_data[12] ^ `TOP.cpu.sii_ncu_data[13] ^ `TOP.cpu.sii_ncu_data[14] ^ `TOP.cpu.sii_ncu_data[15]);

/*   0in custom
      -fire (($0in_rising_edge($0in_delay(ncu_sii_gnt,1)))  && !(p4 == sii_ncu_data[20]))
      -message "ctag error for sii_ncu:  p4 does not equal c4"
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_ncu_ctag_ecc_p4
*/

wire p5 =  (`TOP.cpu.sii_ncu_data[0] ^ `TOP.cpu.sii_ncu_data[1] ^ `TOP.cpu.sii_ncu_data[2] ^ `TOP.cpu.sii_ncu_data[4] ^ `TOP.cpu.sii_ncu_data[5] ^ `TOP.cpu.sii_ncu_data[7] ^ `TOP.cpu.sii_ncu_data[10] ^ `TOP.cpu.sii_ncu_data[11] ^ `TOP.cpu.sii_ncu_data[12] ^ `TOP.cpu.sii_ncu_data[14]);

/*   0in custom
      -fire (($0in_rising_edge($0in_delay(ncu_sii_gnt,1)))  && !(p5 == sii_ncu_data[21]))
      -message "ctag error for sii_ncu:  p5 does not equal c5"
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_ncu_ctag_ecc_p5
*/

/*************************************************************************
*
*  Check for SII Error syndrome 
*
**************************************************************************/

/*   0in assert_window
      -start (($0in_falling_edge(ccu_cmp_io_sync_en)) && (($0in_rising_edge(sii_ncu_syn_data[0]))  | ($0in_rising_edge(sii_ncu_syn_data[1])) | ($0in_rising_edge(sii_ncu_syn_data[2])) | ($0in_rising_edge(sii_ncu_syn_data[3]))))
      -start_count 1
      -stop_count 16
      -in sii_ncu_syn_vld
      -clock `TOP.cpu.sii.iol2clk
      -module cpu
      -reset `TB_RST
      -name sii_error_synd     
*/


endmodule // niu_siu_ras_chkr
