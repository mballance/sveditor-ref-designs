// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_io_chkr.v
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
module tcu_io_chkr();

`ifdef X_GUARD
   /* 0in- known_driven
      -name x_guard_tcu_sck_bypass
      -var tcu_sck_bypass
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_ncu_stall
      -var tcu_ncu_stall
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_ncu_vld
      -var tcu_ncu_vld
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_ncu_data
      -var tcu_ncu_data
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_mcu_testmode
      -var tcu_mcu_testmode
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_sii_data
      -var tcu_sii_data
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_sii_vld
      -var tcu_sii_vld
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_rst_efu_done
      -var tcu_rst_efu_done
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_test_protect
      -var tcu_test_protect
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_dbr_gateoff
      -var tcu_dbr_gateoff
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_mbist_bisi_en
      -var tcu_mbist_bisi_en
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_rtx_dmo_ctl
      -var tcu_rtx_dmo_ctl
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_rst_asicflush_stop_ack
      -var tcu_rst_asicflush_stop_ack
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_rst_flush_init_ack
      -var tcu_rst_flush_init_ack
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_rst_flush_stop_ack
      -var tcu_rst_flush_stop_ack
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_bisx_done
      -var tcu_bisx_done
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

   /* 0in- known_driven
      -name x_guard_tcu_rst_scan_mode
      -var tcu_rst_scan_mode
      -clock l2clk
      -active POR_
      -module tcu
      -group tcu_io_chkr
   */

  `ifdef FC8_BENCH
	//Assertions for FC8 models
  `endif // end of FC8_BENCH
`endif // end of X_GUARD

endmodule //tcu_io_chkr
