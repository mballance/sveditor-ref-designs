// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_siu_chkr.v
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
module dmu_siu_chkr();

// set this to -constraint to constrain input signals to SIU
`define SIU_CONSTRAINT
// set this to -constraint to constrain input signals to DMU
`define DMU_CONSTRAINT
  
`define WRI_ORD_PST 7'b0100100
`define WRM_ORD_PST 7'b0101100
`define RDD_ORD_NPT 7'b0010100
`define INT_ORD_NPT 7'b0000010
`define PIO_BYP_NPT 7'b1x1x011
 
`ifdef FC_BENCH
`else
`ifdef IOS
// 0in set_clock iol2clk  -default -module dmu
`else
// 0in set_clock ccu_io_out -default  -module cpu
`endif
`endif

`ifdef FC_BENCH
`define TOP_DESIGN_DMU_INTF dmu
`else
`define TOP_DESIGN_DMU_INTF cpu
`endif


`ifdef FC_BENCH
reg bid_chk_off;
initial begin // {
    @(posedge tb_top.cpu.ncu.iol2clk) ;
    if ($test$plusargs("dmusiu_bid_chk_off"))
	bid_chk_off <= 1;
    else
	bid_chk_off <= 0;
end //}

//  0in disable_checker bid_chk_off -name *dmu_bus_id*
`endif
   
///////////////////////////////////////////////////////////////////////////////
// Check that all interface signals are not X or Z. This check can be disabled
// by not including the +define+X_GUARD arg on the command line.
///////////////////////////////////////////////////////////////////////////////
`ifdef X_GUARD
   // 0in known_driven -var dmu_sii_hdr_vld   -name dmu_sii_hdr_vld_x_guard   -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var dmu_sii_reqbypass -name dmu_sii_reqbypass_x_guard -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var dmu_sii_datareq   -name dmu_sii_datareq_x_guard   -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var dmu_sii_datareq16 -name dmu_sii_datareq16_x_guard -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var dmu_sii_data      -name dmu_sii_data_x_guard      -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var dmu_sii_parity    -name dmu_sii_parity_x_guard    -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var dmu_sii_be        -name dmu_sii_be_x_guard        -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var sii_dmu_wrack_vld -name sii_dmu_wrack_vld_x_guard -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var sii_dmu_wrack_tag -name sii_dmu_wrack_tag_x_guard -module `TOP_DESIGN_DMU_INTF

   // 0in known_driven -var sio_dmu_hdr_vld   -name sio_dmu_hdr_vld_x_guard   -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var sio_dmu_data      -name sio_dmu_data_x_guard      -module `TOP_DESIGN_DMU_INTF
   // 0in known_driven -var sio_dmu_parity    -name sio_dmu_parity_x_guard    -module `TOP_DESIGN_DMU_INTF
`endif

`define DMU_SII_COMMAND    {dmu_sii_data[127:122], dmu_sii_reqbypass}
`define DMC_TAG    dmu_sii_data[79:64]
   
///////////////////////////////////////////////////////////////////////////////
// Check for valid commands from DMU to SIU
///////////////////////////////////////////////////////////////////////////////
   
   /* 0in value -var `DMU_SII_COMMAND -casex
    -val `WRI_ORD_PST `WRM_ORD_PST `RDD_ORD_NPT `INT_ORD_NPT `PIO_BYP_NPT 
    -active dmu_sii_hdr_vld -module `TOP_DESIGN_DMU_INTF   -name dmu_sii_hdr_cmd_vld
    -message "Bad value for dmu_siu header" 
    `SIU_CONSTRAINT
    */
   

   // check for reserved bits of header
   /* 0in value
    -var {dmu_sii_data[121:85],dmu_sii_data[63], dmu_sii_data[55:40], dmu_sii_data[5:0]}
    -val 0
    -active dmu_sii_hdr_vld -module `TOP_DESIGN_DMU_INTF -name dmu_sii_hdr_rsrvd_bits
    -message "reserved bits in header are not all zero"
    `SIU_CONSTRAINT
    */

   
///////////////////////////////////////////////////////////////////////////////
// Check for no overlap of transactions:
// 1. After dmu_sii_hdr_vld & dmu_sii_datareq16, 
//    dmu_sii_hdr_vld and datareq signals are 0 for 1 cycle.
// 2. After dmu_sii_datareq and not dmu_sii_datareq16,
//    dmu_sii_hdr_vld and datareq signals are 0 for 4 cycles.
///////////////////////////////////////////////////////////////////////////////

   /* 0in  assert_window 
    -start (dmu_sii_hdr_vld & dmu_sii_datareq16) 
    -start_count 0 
    -stop_count 1
    -not_in dmu_sii_hdr_vld dmu_sii_datareq16 dmu_sii_datareq
    -module `TOP_DESIGN_DMU_INTF -name dmu_siu_no_overlap_chk1 `SIU_CONSTRAINT
    */

   /* 0in  assert_window 
    -start (dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16) 
    -start_count 0 
    -stop_count 4
    -not_in dmu_sii_hdr_vld dmu_sii_datareq16 dmu_sii_datareq
    -module `TOP_DESIGN_DMU_INTF -name dmu_siu_no_overlap_chk2 `SIU_CONSTRAINT
    */

   
///////////////////////////////////////////////////////////////////////////////
// Check for good parity on header 
///////////////////////////////////////////////////////////////////////////////

   /* x0in 
    even_parity -var {dmu_sii_data[127:64], dmu_sii_parity[1]} 
    -active dmu_sii_hdr_vld  -module `TOP_DESIGN_DMU_INTF `SIU_CONSTRAINT
    -name dmu_sii_hdr_parity1  ;
    even_parity -var {dmu_sii_data[ 63: 0], dmu_sii_parity[0]} 
    -active dmu_sii_hdr_vld  -module `TOP_DESIGN_DMU_INTF `SIU_CONSTRAINT
    -name dmu_sii_hdr_parity0 
    */
   
   /* x0in 
    even_parity -var {dmu_sii_data[127:96], dmu_sii_parity[3]} 
    -active dmu_sii_hdr_vld  -module `TOP_DESIGN_DMU_INTF `SIU_CONSTRAINT
    -name dmu_sii_hdr_parity3  ;
    even_parity -var {dmu_sii_data[ 95:64], dmu_sii_parity[2]} 
    -active dmu_sii_hdr_vld  -module `TOP_DESIGN_DMU_INTF `SIU_CONSTRAINT
    -name dmu_sii_hdr_parity2  ;
    even_parity -var {dmu_sii_data[ 63:32], dmu_sii_parity[1]} 
    -active dmu_sii_hdr_vld  -module `TOP_DESIGN_DMU_INTF `SIU_CONSTRAINT
    -name dmu_sii_hdr_parity1  ;
    even_parity -var {dmu_sii_data[ 31: 0], dmu_sii_parity[0]} 
    -active dmu_sii_hdr_vld  -module `TOP_DESIGN_DMU_INTF `SIU_CONSTRAINT
    -name dmu_sii_hdr_parity0 
    */
   
	 
///////////////////////////////////////////////////////////////////////////////
// Check for good parity on data0, data1, data2, and data3
// - DSN spec says that there are 4 parity bits, but sii rtl only has 2.
///////////////////////////////////////////////////////////////////////////////

   /* x0in 
    even_parity -var {dmu_sii_data[127:64], dmu_sii_parity[1]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & (dmu_sii_datareq16|dmu_sii_datareq)), 1 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data0_parity1  ;
    even_parity -var {dmu_sii_data[ 63: 0], dmu_sii_parity[0]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & (dmu_sii_datareq16|dmu_sii_datareq)), 1 ) 
     -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data0_parity0  
    */

   /* x0in 
    even_parity -var {dmu_sii_data[127:64], dmu_sii_parity[1]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16), 2 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data1_parity1  ;
    even_parity -var {dmu_sii_data[ 63: 0], dmu_sii_parity[0]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16), 2 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data1_parity0  
    */

   /* x0in 
    even_parity -var {dmu_sii_data[127:64], dmu_sii_parity[1]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16), 3 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data2_parity1  ;
    even_parity -var {dmu_sii_data[ 63: 0], dmu_sii_parity[0]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16), 3 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data2_parity0  
    */

   /* x0in 
    even_parity -var {dmu_sii_data[127:64], dmu_sii_parity[1]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16), 4 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data3_parity1  ;
    even_parity -var {dmu_sii_data[ 63: 0], dmu_sii_parity[0]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq & !dmu_sii_datareq16), 4 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data3_parity0  
    */


   /* x0in 
    even_parity -var {dmu_sii_data[127:96], dmu_sii_parity[3]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & (dmu_sii_datareq16|dmu_sii_datareq)), 1 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data0_parity3  ;
    even_parity -var {dmu_sii_data[ 95:64], dmu_sii_parity[2]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & (dmu_sii_datareq16|dmu_sii_datareq)), 1 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data0_parity2  ;
    even_parity -var {dmu_sii_data[ 63:32], dmu_sii_parity[1]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & (dmu_sii_datareq16|dmu_sii_datareq)), 1 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data0_parity1  ;
    even_parity -var {dmu_sii_data[ 31: 0], dmu_sii_parity[0]}  `SIU_CONSTRAINT
    -active $0in_delay((dmu_sii_hdr_vld & (dmu_sii_datareq16|dmu_sii_datareq)), 1 ) 
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data0_parity0  
    */

   /* x0in 
    even_parity -var {dmu_sii_data[127:96], dmu_sii_parity[3]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 2 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data1_parity3  ;
    even_parity -var {dmu_sii_data[ 95:64], dmu_sii_parity[2]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 2 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data1_parity2  ;
    even_parity -var {dmu_sii_data[ 63:32], dmu_sii_parity[1]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 2 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data1_parity1  ;
    even_parity -var {dmu_sii_data[ 31: 0], dmu_sii_parity[0]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 2 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data1_parity0  
    */

   /* x0in 
    even_parity -var {dmu_sii_data[127:96], dmu_sii_parity[3]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 3 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data2_parity3  ;
    even_parity -var {dmu_sii_data[ 95:64], dmu_sii_parity[2]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 3 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data2_parity2  ;
    even_parity -var {dmu_sii_data[ 63:32], dmu_sii_parity[1]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 3 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data2_parity1  ;
    even_parity -var {dmu_sii_data[ 31: 0], dmu_sii_parity[0]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 3 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data2_parity0  
    */

   /* x0in 
    even_parity -var {dmu_sii_data[127:96], dmu_sii_parity[3]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 4 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data3_parity3  ;
    even_parity -var {dmu_sii_data[ 95:64], dmu_sii_parity[2]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 4 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data3_parity2  ;
    even_parity -var {dmu_sii_data[ 63:32], dmu_sii_parity[1]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 4 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data3_parity1  ;
    even_parity -var {dmu_sii_data[ 31: 0], dmu_sii_parity[0]} 
    -active $0in_delay((dmu_sii_hdr_vld & dmu_sii_datareq), 4 )  `SIU_CONSTRAINT
    -module `TOP_DESIGN_DMU_INTF -name dmu_sii_data3_parity0  
    */



   
///////////////////////////////////////////////////////////////////////////////
// Check for no overlap of transactions from sio to dmu:
//  After dmu_sii_datareq and not dmu_sii_datareq16,
//  dmu_sii_hdr_vld and datareq signals are 0 for 4 cycles.
///////////////////////////////////////////////////////////////////////////////

`define SIO_DMU_COMMAND    sio_dmu_data[127:122]
`define SIO_DMC_TAG        sio_dmu_data[79:64]

`ifdef FC_BENCH
   /* 0in
    assert_window
    -start (sio_dmu_hdr_vld) 
    -start_count 0
    -stop_count 4
    -not_in sio_dmu_hdr_vld
    -module cpu 
    -clock tb_top.cpu.dmu.iol2clk
    -name sio_dmu_pkt_no_overlap `DMU_CONSTRAINT
    */
`else
   /* 0in
    assert_window
    -start (sio_dmu_hdr_vld) 
    -start_count 0
    -stop_count 4
    -not_in sio_dmu_hdr_vld
   -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_pkt_no_overlap `DMU_CONSTRAINT
    */
`endif

   /* x0in value 
    -var `SIO_DMU_COMMAND 
    -casex
    -val 6'b101010 
    -active sio_dmu_hdr_vld 
    -module `TOP_DESIGN_DMU_INTF  
    -name sio_dmu_cmd_chk
    -message "Bad value for sio_dmu header"
    */


  // check for reserved bits of header
  // UPDATE/check for the differences with RAS changes for RSVD bits
  /* 0in  assert
   -var ( |{sio_dmu_data[121:82],sio_dmu_data[63:62], sio_dmu_data[55:40]} == 1'b0)
   -active sio_dmu_hdr_vld
   -module `TOP_DESIGN_DMU_INTF
   -name sio_dmu_hdr_rsrvd_bits
   -message "reserved bits in header are not all zero"
   */

`ifdef FC_BENCH
   // RDD
   /* 0in assert_together
    -leader ((`SIO_DMU_COMMAND==6'b101010) & sio_dmu_hdr_vld)
    -follower (sio_dmu_hdr_vld) 
    -module cpu 
    -clock tb_top.cpu.dmu.iol2clk
    -name sio_dmu_cmd_rdd
    */
`else
   /* 0in assert_together
    -leader ((sio_dmu_data[127]==1'b1) & sio_dmu_hdr_vld)
    -follower (sio_dmu_hdr_vld) 
   -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_cmd_rdd
    */
`endif
   
///////////////////////////////////////////////////////////////////////////////
// NO check for good parity on header in sio_dmu_data, since SIU does not
// generate parity during the header cycle.
///////////////////////////////////////////////////////////////////////////////

   /* x0inx
    even_parity -var {sio_dmu_data[127:96], sio_dmu_parity[3]} 
    -active sio_dmu_hdr_vld  -module `TOP_DESIGN_DMU_INTF `DMU_CONSTRAINT
    -name sio_dmu_hdr_parity3  ;
    even_parity -var {sio_dmu_data[ 95:64], sio_dmu_parity[2]} 
    -active sio_dmu_hdr_vld  -module `TOP_DESIGN_DMU_INTF `DMU_CONSTRAINT
    -name sio_dmu_hdr_parity2  ;
    even_parity -var {sio_dmu_data[ 63:32], sio_dmu_parity[1]} 
    -active sio_dmu_hdr_vld  -module `TOP_DESIGN_DMU_INTF `DMU_CONSTRAINT
    -name sio_dmu_hdr_parity1  ;
    even_parity -var {sio_dmu_data[ 31: 0], sio_dmu_parity[0]} 
    -active sio_dmu_hdr_vld  -module `TOP_DESIGN_DMU_INTF `DMU_CONSTRAINT
    -name sio_dmu_hdr_parity0 
    */
   
///////////////////////////////////////////////////////////////////////////////
// Check for good parity in sio_dmu_data during data xfer cycles
///////////////////////////////////////////////////////////////////////////////

   /* x0in 
    even_parity -var {sio_dmu_data[127:96], sio_dmu_parity[3]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 1 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data0_parity3  ;
    even_parity -var {sio_dmu_data[ 95:64], sio_dmu_parity[2]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 1 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data0_parity2  ;
    even_parity -var {sio_dmu_data[ 63:32], sio_dmu_parity[1]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 1 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data0_parity1  ;
    even_parity -var {sio_dmu_data[ 31: 0], sio_dmu_parity[0]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 1 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data0_parity0 
    */
   
   /* x0in 
    even_parity -var {sio_dmu_data[127:96], sio_dmu_parity[3]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 2 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data1_parity3  ;
    even_parity -var {sio_dmu_data[ 95:64], sio_dmu_parity[2]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 2 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data1_parity2  ;
    even_parity -var {sio_dmu_data[ 63:32], sio_dmu_parity[1]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 2 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data1_parity1  ;
    even_parity -var {sio_dmu_data[ 31: 0], sio_dmu_parity[0]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 2 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data1_parity0 
    */
   
   /* x0in 
    even_parity -var {sio_dmu_data[127:96], sio_dmu_parity[3]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 3 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data2_parity3  ;
    even_parity -var {sio_dmu_data[ 95:64], sio_dmu_parity[2]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 3 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data2_parity2  ;
    even_parity -var {sio_dmu_data[ 63:32], sio_dmu_parity[1]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 3 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data2_parity1  ;
    even_parity -var {sio_dmu_data[ 31: 0], sio_dmu_parity[0]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 3 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data2_parity0 
    */
   
   /* x0in 
    even_parity -var {sio_dmu_data[127:96], sio_dmu_parity[3]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 4 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data3_parity3  ;
    even_parity -var {sio_dmu_data[ 95:64], sio_dmu_parity[2]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 4 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data3_parity2  ;
    even_parity -var {sio_dmu_data[ 63:32], sio_dmu_parity[1]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 4 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data3_parity1  ;
    even_parity -var {sio_dmu_data[ 31: 0], sio_dmu_parity[0]}  `DMU_CONSTRAINT
    -active $0in_delay((sio_dmu_hdr_vld & sio_dmu_datareq), 4 )  -module `TOP_DESIGN_DMU_INTF
    -name sio_dmu_data3_parity0 
    */

   /* 0in bus_id
    -req (dmu_sii_hdr_vld & ~dmu_sii_data[126] & dmu_sii_data[123])
    -ret sio_dmu_hdr_vld
    -req_id dmu_sii_data[79:64] 
    -ret_id sio_dmu_data[79:64]
    -max_ids 65536 
    -max_ids_check off
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_bus_id
   */


////////////////////////////////////////////////////////////////////////////////
// Each WRI and WRM Transaction to sii has to be followed by a sii_dmu_wrack_vld 
// and the other way also

////////////////////////////////////////////////////////////////////////////////
   /* 0in assert_follower
    -leader (dmu_sii_hdr_vld & ((`DMU_SII_COMMAND==`WRI_ORD_PST) || (`DMU_SII_COMMAND==`WRM_ORD_PST)))
    -follower sii_dmu_wrack_vld
    -min 2
    -max 48000
    -max_leader 16
    -clock ccu_io_out
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_sii_wriack_assert_follower
   */


   /* 0in assert_leader
    -leader (dmu_sii_hdr_vld & ((`DMU_SII_COMMAND==`WRI_ORD_PST) || (`DMU_SII_COMMAND==`WRM_ORD_PST)))
    -follower sii_dmu_wrack_vld 
    -min 2
    -max 48000
    -max_leader 16
    -clock ccu_io_out
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_sii_wriack_assert_leader
   */

/////////////////////////////////////////////////////////
// Header and signals with Transactions from DMU to SII:
// RDD, WRI, INT, PIO
//////////////////////////////////////////////////////////
   // RDD
   /* 0in assert_together
    -leader ((dmu_sii_data[127:122]==6'b001010) & dmu_sii_hdr_vld)
    -follower (dmu_sii_hdr_vld & ~dmu_sii_datareq & ~dmu_sii_datareq16 & ~dmu_sii_reqbypass)
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_sii_cmd_rdd
    */

   // WRI or WRM
   /* 0in assert_together
    -leader ((dmu_sii_data[127:122]==6'b010x10) & dmu_sii_hdr_vld)
    -follower (dmu_sii_hdr_vld & dmu_sii_datareq & ~dmu_sii_datareq16 & ~dmu_sii_reqbypass)
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_sii_cmd_wri_wrm
    */

   // INT 
   /* 0in assert_together
    -leader ((dmu_sii_data[127:122]==6'b000001) & dmu_sii_hdr_vld)
    -follower (dmu_sii_hdr_vld & dmu_sii_datareq & dmu_sii_datareq16 & ~dmu_sii_reqbypass)
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_sii_cmd_int
    */

   // PIO
   /* 0in assert_together
    -leader ((dmu_sii_data[127:122]==6'b1x1001) & dmu_sii_hdr_vld)
    -follower (dmu_sii_hdr_vld & dmu_sii_datareq & dmu_sii_datareq16 & dmu_sii_reqbypass)
    -module `TOP_DESIGN_DMU_INTF
    -name dmu_sii_cmd_pio
    */



endmodule // dmu_siu_chkr
