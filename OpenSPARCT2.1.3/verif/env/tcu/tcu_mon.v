// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_mon.v
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
`include "tcu_top.h"

module tcu_mon();

   wire  tb_spc0_clk_stop      = `TCU.tcu_spc0_clk_stop;
   wire  tb_spc1_clk_stop      = `TCU.tcu_spc1_clk_stop;
   wire  tb_spc2_clk_stop      = `TCU.tcu_spc2_clk_stop;
   wire  tb_spc3_clk_stop      = `TCU.tcu_spc3_clk_stop;
   wire  tb_spc4_clk_stop      = `TCU.tcu_spc4_clk_stop;
   wire  tb_spc5_clk_stop      = `TCU.tcu_spc5_clk_stop;
   wire  tb_spc6_clk_stop      = `TCU.tcu_spc6_clk_stop;
   wire  tb_spc7_clk_stop      = `TCU.tcu_spc7_clk_stop;
   wire  tb_l2d0_clk_stop      = `TCU.tcu_l2d0_clk_stop;
   wire  tb_l2d1_clk_stop      = `TCU.tcu_l2d1_clk_stop;
   wire  tb_l2d2_clk_stop      = `TCU.tcu_l2d2_clk_stop;
   wire  tb_l2d3_clk_stop      = `TCU.tcu_l2d3_clk_stop;
   wire  tb_l2d4_clk_stop      = `TCU.tcu_l2d4_clk_stop;
   wire  tb_l2d5_clk_stop      = `TCU.tcu_l2d5_clk_stop;
   wire  tb_l2d6_clk_stop      = `TCU.tcu_l2d6_clk_stop;
   wire  tb_l2d7_clk_stop      = `TCU.tcu_l2d7_clk_stop;
   wire  tb_mcu0_clk_stop      = `TCU.tcu_mcu0_clk_stop;
   wire  tb_mcu1_clk_stop      = `TCU.tcu_mcu1_clk_stop;
   wire  tb_mcu2_clk_stop      = `TCU.tcu_mcu2_clk_stop;
   wire  tb_mcu3_clk_stop      = `TCU.tcu_mcu3_clk_stop;
   wire  tb_sii_clk_stop      = `TCU.tcu_sii_clk_stop;
   wire  tb_tds_io_clk_stop      = `TCU.tcu_tds_io_clk_stop;
   wire  tb_dmu_io_clk_stop      = `TCU.tcu_dmu_io_clk_stop;
   wire  tb_peu_io_clk_stop      = `TCU.tcu_peu_io_clk_stop;
   //wire  tb_soc0cmp_clk_stop   = `TCU.tcu_soc0cmp_clk_stop;
   //wire  tb_soc1cmp_clk_stop   = `TCU.tcu_soc1cmp_clk_stop;
   //wire  tb_soc2cmp_clk_stop   = `TCU.tcu_soc2cmp_clk_stop;
   //wire  tb_soc3cmp_clk_stop   = `TCU.tcu_soc3cmp_clk_stop;
   //wire  tb_soc4cmp_clk_stop   = `TCU.tcu_soc4cmp_clk_stop;
   //wire  tb_soc5ddr_clk_stop   = `TCU.tcu_soc5ddr_clk_stop;
   //wire  tb_soc6io_clk_stop    = `TCU.tcu_soc6io_clk_stop;
   //wire  tb_soc7pc_clk_stop    = `TCU.tcu_soc7pc_clk_stop;
   //wire  tb_soc8en_clk_stop    = `TCU.tcu_soc8en_clk_stop;
   wire  tb_l2clk              = `CCU.cmp_pll_clk;   
   wire  tb_sc_POR             = `RST.mio_rst_pwron_rst_l;
   wire  tb_sc_XIR             = `RST.mio_rst_button_xir_l;
   wire  tb_sc_PB              = `RST.mio_rst_pb_rst_l;
   wire  tb_spc0_core_avail    = `TCU.ncu_spc0_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc1_core_avail    = `TCU.ncu_spc1_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc2_core_avail    = `TCU.ncu_spc2_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc3_core_avail    = `TCU.ncu_spc3_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc4_core_avail    = `TCU.ncu_spc4_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc5_core_avail    = `TCU.ncu_spc5_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc6_core_avail    = `TCU.ncu_spc6_core_available; // Clock stop control, used below and by 0in
   wire  tb_spc7_core_avail    = `TCU.ncu_spc7_core_available; // Clock stop control, used below and by 0in
   wire [21:0] tb_fusedata_init;  // Used by ncu_init.v/vera interface for setting up efuse
   wire [7:0]  tb_spc_clk_stop_bus = {tb_spc7_clk_stop, tb_spc6_clk_stop, tb_spc5_clk_stop, tb_spc4_clk_stop, tb_spc3_clk_stop, tb_spc2_clk_stop, tb_spc1_clk_stop, tb_spc0_clk_stop}; // Used by 0in for clk stop assert/deassert
   

   //------- 0in, Guard against unknowns going into cluster header ----------
   wire 	tb_core_avail_xguard = tb_spc0_core_avail ^ tb_spc1_core_avail ^ tb_spc2_core_avail ^ tb_spc3_core_avail ^ tb_spc4_core_avail ^ tb_spc5_core_avail ^ tb_spc6_core_avail ^ tb_spc7_core_avail;   
   wire 	tb_clk_stop_xguard = tb_spc0_clk_stop ^ tb_spc1_clk_stop ^ tb_spc2_clk_stop ^ tb_spc3_clk_stop ^ tb_spc4_clk_stop ^ tb_spc5_clk_stop ^ tb_spc6_clk_stop ^ tb_spc7_clk_stop ^ tb_l2d0_clk_stop ^ tb_l2d1_clk_stop ^ tb_l2d2_clk_stop ^ tb_l2d3_clk_stop ^ tb_l2d4_clk_stop ^ tb_l2d5_clk_stop ^ tb_l2d6_clk_stop ^ tb_l2d7_clk_stop ^ tb_mcu0_clk_stop ^ tb_mcu1_clk_stop ^ tb_mcu2_clk_stop ^ tb_mcu3_clk_stop ^ tb_sii_clk_stop ^ tb_tds_io_clk_stop ^ tb_dmu_io_clk_stop ^ tb_peu_io_clk_stop;

   
   //------- Vera interface, Reset testbench class uses this for all or nothing checks ----------
   wire 	tb_clk_stop_all = tb_spc0_clk_stop & tb_spc1_clk_stop & tb_spc2_clk_stop & tb_spc3_clk_stop & tb_spc4_clk_stop & tb_spc5_clk_stop & tb_spc6_clk_stop & tb_spc7_clk_stop & tb_l2d0_clk_stop & tb_l2d1_clk_stop & tb_l2d2_clk_stop & tb_l2d3_clk_stop & tb_l2d4_clk_stop & tb_l2d5_clk_stop & tb_l2d6_clk_stop & tb_l2d7_clk_stop & tb_mcu0_clk_stop & tb_mcu1_clk_stop & tb_mcu2_clk_stop & tb_mcu3_clk_stop & tb_sii_clk_stop & tb_tds_io_clk_stop & tb_dmu_io_clk_stop & tb_peu_io_clk_stop;

   wire 	tb_clk_stop_one = tb_spc0_clk_stop | tb_spc1_clk_stop | tb_spc2_clk_stop | tb_spc3_clk_stop | tb_spc4_clk_stop | tb_spc5_clk_stop | tb_spc6_clk_stop | tb_spc7_clk_stop | tb_l2d0_clk_stop | tb_l2d1_clk_stop | tb_l2d2_clk_stop | tb_l2d3_clk_stop | tb_l2d4_clk_stop | tb_l2d5_clk_stop | tb_l2d6_clk_stop | tb_l2d7_clk_stop | tb_mcu0_clk_stop | tb_mcu1_clk_stop | tb_mcu2_clk_stop | tb_mcu3_clk_stop | tb_sii_clk_stop | tb_tds_io_clk_stop | tb_dmu_io_clk_stop | tb_peu_io_clk_stop;

endmodule // tcu_mon

