// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_siu_chkr.v
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
`else
`define TOP tb_top
`endif

module ncu_siu_chkr();

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


   /* x0in req_ack 
      -req sii_ncu_req 
      -ack ncu_sii_gnt 
      -req_until_ack
      -max_ack 1
      -max 1000
      -module cpu 
      -name ncu_sii_req_ack1 
   */

   /* x0in custom -fire sii_ncu_data[31]
    -active ($0in_delay(ncu_sii_gnt, 1))
    -clock `TOP.cpu.sii.iol2clk
    -module cpu
    -name sii_ncu_timeout_err 
    -message "Time out error in SIU to NCU Interface"
   */

   // check for reserved bits of header

   /* 0in  assert 
    -var ( |sii_ncu_data[27:22] == 1'b0)
    -active $0in_delay(ncu_sii_gnt, 1)
    -clock `TOP.cpu.sii.iol2clk
    -module cpu
    -name sii_ncu_hdr_rsrvd_bits
    -message "reserved bits in header are not all zero"
    */


   // check for Error bits of header

   /* x0in assert -- disable because the error bits SHOULD be set in some cases
    -var ( |sii_ncu_data[31:29] == 1'b0)
    -active ($0in_delay(ncu_sii_gnt, 1))
    -clock `TOP.cpu.sii.iol2clk
    -module cpu
    -name sii_ncu_error_bits
    -message "Error bits in header are not all zero"
    */


   // The minimum gap between 2 ncu_sii_gnt 4 clk

   /* x0in assert_window
    -start (ncu_sii_gnt)
    -start_count 1 
    -stop_count 5
    -not_in ncu_sii_gnt
    -module cpu
    -name ncu_sii_gnt_deassert_chk
    */


   // sii_ncu_req asserted always with iol2clk  

   /* x0in assert_leader
     -leader ccu_io_out 
     -follower sii_ncu_req
     -clock `TOP.cpu.sii.iol2clk
     -name sii_ncu_req_clk_chk
     -module cpu
   */
    

   // To confirm that ncu_sii_gnt asserted for 1 clk only

   /* 0in assert_timer
     -var ncu_sii_gnt
     -max 1
     -clock `TOP.cpu.sii.iol2clk
     -name ncu_sii_gnt_chk
     -module cpu
   */

   /***************************
     Partial Bank Mode 
   **************************/

   // check for invalid combinations: 5'b10000, 5'b10111, 5'b11011, 5'b11101, 5'b11110, 

   /* 0in value
     -var {ncu_sii_pm, ncu_sii_ba01, ncu_sii_ba23, ncu_sii_ba45, ncu_sii_ba67}
     -casex
     -val 5'b0XXXX 5'b10001 5'b10010 5'b10011 5'b10100 5'b10101 5'b10110  5'b11000 5'b11001 5'b11010  5'b11100  5'b11111 
     -module cpu
     -clock `TOP.cpu.sii.iol2clk
     -message "Illegal combination of partial bank bits"
     -name ncu_sii_illegal_partial_bits_constant
   */


   // Partial bank bits are not be changed

   /* x0in constant 
     -var {ncu_sii_pm, ncu_sii_ba01, ncu_sii_ba23, ncu_sii_ba45, ncu_sii_ba67}
     -module cpu
     -clock `TOP.cpu.sii.iol2clk
     -name ncu_sii_partial_bits_constant
   */




endmodule // niu_siu_chkr
