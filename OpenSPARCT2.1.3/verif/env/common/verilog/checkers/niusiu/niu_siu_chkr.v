// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_siu_chkr.v
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
`ifdef FC_BENCH
  `define TOP_DESIGN cpu
  `define SII_REF_CLK tb_top.cpu.sii.iol2clk
  `define SIO_REF_CLK tb_top.cpu.sio.iol2clk
`else
`ifdef IOS
  `define TOP_DESIGN cpu
  `define SII_REF_CLK sii.iol2clk
  `define SIO_REF_CLK sio.iol2clk
`else
  `ifdef SIU
    `define TOP_DESIGN cpu
    `define TB_TOP siu_top.cpu
    `define SII_REF_CLK sii.iol2clk
    `define SIO_REF_CLK sio.iol2clk
  `else
     `ifdef N2_NIU
         `define TOP_DESIGN cpu
         `define TB_TOP tb_top.cpu
    	`define SII_REF_CLK ccu_io_out
    	`define SIO_REF_CLK ccu_io_out
      `endif
  `endif
`endif
`endif

module niu_siu_chkr();

`ifdef FC_BENCH
reg bid_chk_off;
initial begin // {
    @(posedge `SII_REF_CLK) ;
    if ($test$plusargs("niusiu_bid_chk_off"))
        bid_chk_off <= 1;
    else
        bid_chk_off <= 0;
end //}

//  0in disable_checker bid_chk_off -name *niu_bus_id*
`endif

// set this to -constraint to constrain input signals to SIU
`define SIU_CONSTRAINT
// set this to -constraint to constrain input signals to NIU
`define NIU_CONSTRAINT
   
   
///////////////////////////////////////////////////////////////////////////////
// Check that all interface signals are not X or Z. This check can be disabled
// by not including the +define+X_GUARD arg on the command line.
///////////////////////////////////////////////////////////////////////////////
`ifdef X_GUARD
   // 0in known_driven -var niu_sii_hdr_vld   -name niu_sii_hdr_vld_x_guard   -clock `SII_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var niu_sii_reqbypass -name niu_sii_reqbypass_x_guard -clock `SII_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var niu_sii_datareq   -name niu_sii_datareq_x_guard   -clock `SII_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var niu_sii_data      -name niu_sii_data_x_guard      -clock `SII_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var niu_sii_parity    -name niu_sii_parity_x_guard    -clock `SII_REF_CLK -module `TOP_DESIGN
   // x0in known_driven -var niu_sii_be        -name niu_sii_be_x_guard        -clock `SII_REF_CLK -module `TOP_DESIGN
   // x0in known_driven -var sii_niu_wrack_vld -name sii_niu_wrack_vld_x_guard -clock `SII_REF_CLK -module `TOP_DESIGN
   // x0in known_driven -var sii_niu_wrack_tag -name sii_niu_wrack_tag_x_guard -clock `SII_REF_CLK -module `TOP_DESIGN

   // 0in known_driven -var sio_niu_hdr_vld   -name sio_niu_hdr_vld_x_guard   -clock `SIO_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var sio_niu_datareq   -name sio_niu_datareq_x_guard   -clock `SIO_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var sio_niu_data      -name sio_niu_data_x_guard      -clock `SIO_REF_CLK -module `TOP_DESIGN
   // 0in known_driven -var sio_niu_parity    -name sio_niu_parity_x_guard    -clock `SIO_REF_CLK -module `TOP_DESIGN
`endif


///////////////////////////////////////////////////////////////////////////////
// These signals can be used to disable certain 0-In checkers at runtime,
// so that testcases forcing interface errors don't die with checker firings.
///////////////////////////////////////////////////////////////////////////////
reg disable_hdr_checks;
reg disable_niu_sii_parity_checks;
reg disable_sio_niu_parity_checks;
   
initial begin
   disable_hdr_checks = 1'b0;
   disable_niu_sii_parity_checks = 1'b0;
   disable_sio_niu_parity_checks = 1'b0;
end

`define NIU_SII_COMMAND	   {niu_sii_data[127:122], niu_sii_reqbypass}
`define NIU_SII_NIU_ID     niu_sii_data[79:64]

`define SIO_NIU_COMMAND    sio_niu_data[127:122]
`define SIO_NIU_NIU_ID     sio_niu_data[79:64]
   
///////////////////////////////////////////////////////////////////////////////
// Check for valid commands from NIU to SIU
///////////////////////////////////////////////////////////////////////////////

   // valid Transactions : RDD_npt_ord RDD_npt_byp WRI_pst_ord WRI_pst_byp WRI_npt_ord WRI_npt_byp 
   /* 0in value -var `NIU_SII_COMMAND -casex
    -val 7'b0010_100 7'b0010_101 7'b0100_100 7'b0100_101 7'b0000_100 7'b0000_101
    -active niu_sii_hdr_vld -module `TOP_DESIGN  -name niu_sii_hdr_cmd_vld
    -message "Bad value for niu_siu header" 
    -areset disable_hdr_checks `SIU_CONSTRAINT
    -clock `SII_REF_CLK
   */
   

   // check for reserved bits of header
   /* 0in  assert -var ( |{niu_sii_data[121:85], niu_sii_data[63], niu_sii_data[55:40], niu_sii_data[5:0]} == 1'b0)
    -active niu_sii_hdr_vld -module `TOP_DESIGN -name niu_sii_hdr_rsrvd_bits
    -message "reserved bits in header are not all zero"
    -areset disable_hdr_checks `SIU_CONSTRAINT
    -clock `SII_REF_CLK
   */

   
///////////////////////////////////////////////////////////////////////////////
// Check for no overlap of transactions:
// After niu_sii_hdr_vld & niu_sii_datareq 
// niu_sii_hdr_vld is 0 for 4 cycle.
///////////////////////////////////////////////////////////////////////////////

   /* 0in 
    assert_window -start (niu_sii_hdr_vld & niu_sii_datareq) 
    -start_count 0 -stop_count 4
    -not_in niu_sii_hdr_vld
    -module `TOP_DESIGN -name niu_siu_no_overlap_chk1 `SIU_CONSTRAINT
    -clock `SII_REF_CLK
    */

///////////////////////////////////////////////////////////////////////////////
// Check for outstanding bus_id
// max_ids set to 65536 otherwise it counts -req_id -ret_id as 4bit
///////////////////////////////////////////////////////////////////////////////

   /* 0in 
    bus_id 
    -req (niu_sii_hdr_vld & ~niu_sii_data[126])
    -req_id niu_sii_data[79:64] 
    -ret sio_niu_hdr_vld 
    -ret_id sio_niu_data[79:64]
    -max_ids 65536 -max_ids_check off
    -module `TOP_DESIGN
    -clock `SII_REF_CLK
    -name niu_bus_id
   */


///////////////////////////////////////////////////////////////////////////////
// sii-to-niu
// sii_niu_oqdq & sii_niu_bqdq cannot be asserted in the same cycle
///////////////////////////////////////////////////////////////////////////////

   /* 0in
    assert -var (~(sii_niu_oqdq & sii_niu_bqdq))
    -module `TOP_DESIGN
    -name sii_niu_dq
    -clock `SII_REF_CLK
   */

   /* 0in assert_follower 
    -leader (niu_sii_hdr_vld & ~niu_sii_reqbypass) 
    -follower sii_niu_oqdq
    -min 2
    -max 3000
    -max_leader 16
    -module `TOP_DESIGN
    -name niu_sii_oq_assert_follower
    -clock `SII_REF_CLK
   */

   /* 0in assert_follower
    -leader (niu_sii_hdr_vld & niu_sii_reqbypass)
    -follower sii_niu_bqdq
    -min 2
    -max 3000
    -max_leader 16
    -module `TOP_DESIGN
    -clock `SII_REF_CLK
    -name niu_sii_bq_assert_follower
   */

   /* 0in assert_leader 
    -leader (niu_sii_hdr_vld & ~niu_sii_reqbypass)
    -follower sii_niu_oqdq
    -min 2
    -max 3000
    -max_leader 16
    -module `TOP_DESIGN
    -name niu_sii_oq_assert_leader
    -clock `SII_REF_CLK
   */

   /* 0in assert_leader 
    -leader (niu_sii_hdr_vld & niu_sii_reqbypass)
    -follower sii_niu_bqdq
    -min 2
    -max 3000
    -max_leader 16
    -module `TOP_DESIGN
    -name niu_sii_bq_assert_leader
    -clock `SII_REF_CLK
   */

   // RDD 
   /* 0in assert_together
    -leader ((niu_sii_data[127:122]==6'b001010) & niu_sii_hdr_vld)
    -follower (niu_sii_hdr_vld & ~niu_sii_datareq)
    -module `TOP_DESIGN
    -clock `SII_REF_CLK
    -name niu_sii_cmd_rdd
    */

   // WRI
   /* 0in assert_together
    -leader ((niu_sii_data[127:122]==6'b0x0010) & niu_sii_hdr_vld)
    -follower (niu_sii_hdr_vld & niu_sii_datareq)
    -module `TOP_DESIGN
    -name niu_sii_cmd_wri
    -clock `SII_REF_CLK
    */

   
///////////////////////////////////////////////////////////////////////////////
// Check for no overlap of transactions from sio to niu:
//  After sio_niu_datareq
//  sio_niu_hdr_vld is 0 for 4 cycles.
///////////////////////////////////////////////////////////////////////////////

   /* 0in
    assert_window
    -start (sio_niu_hdr_vld & sio_niu_datareq)
    -start_count 0
    -stop_count 4
    -not_in sio_niu_hdr_vld
    -module `TOP_DESIGN
    -clock `SIO_REF_CLK
    -name sio_niu_pkt_no_overlap
    */

   //valid transaction check
   /* 0in value 
    -var `SIO_NIU_COMMAND 
    -casex
    -val 6'b100010 6'b101010
    -active sio_niu_hdr_vld
    -module `TOP_DESIGN
    -name sio_niu_hdr_cmd_vld
    -message "Bad value for sio_niu_header"
    -areset disable_hdr_checks
    -clock `SIO_REF_CLK 
    */

  // check for reserved bits of header
  /* 0in  assert 
   -var ( |{sio_niu_data[121:83],sio_niu_data[63:62],sio_niu_data[55:40]} == 1'b0)
   -active sio_niu_hdr_vld 
   -module `TOP_DESIGN 
   -name sio_niu_hdr_rsrvd_bits
   -message "reserved bits in header are not all zero"
   -areset disable_hdr_checks
   -clock `SIO_REF_CLK 
   */

   // RDD
   /* 0in assert_together 
    -leader ((`SIO_NIU_COMMAND==6'b101010) & sio_niu_hdr_vld) 
    -follower (sio_niu_hdr_vld & sio_niu_datareq)
    -module `TOP_DESIGN 
    -name sio_niu_cmd_rdd
    -clock `SIO_REF_CLK 
    */
 
   //WRI 
   /* 0in assert_together
    -leader ((`SIO_NIU_COMMAND==6'b100010) & sio_niu_hdr_vld)
    -follower (sio_niu_hdr_vld & ~sio_niu_datareq)
    -module `TOP_DESIGN
    -name sio_niu_cmd_rwri
    -clock `SIO_REF_CLK 
    */
 
/* NIU to sio credit check */

/* 0in fifo
      -enq sio_niu_hdr_vld
      -deq niu_sio_dq
      -depth 4
      -clock `SIO_REF_CLK
      -module `TOP_DESIGN
      -name niu_credit_check
*/

///////////////////////////////////////////////////////////////////////////////
// sii-to-niu
// sii_niu_oqdq & sii_niu_bqdq cannot be asserted in the same cycle
///////////////////////////////////////////////////////////////////////////////

endmodule // niu_siu_chkr
