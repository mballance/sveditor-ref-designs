// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ncu_chkr.v
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
module dmu_ncu_chkr ;

`ifdef X_GUARD
// 0in known_driven -var `CPU.ncu_dmu_stall   -name ncu_dmu_stall_x_guard -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.dmu_ncu_vld     -name dmu_ncu_vld_x_guard   -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.dmu_ncu_stall   -name dmu_ncu_stall_x_guard -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.ncu_dmu_vld     -name ncu_dmu_vld_x_guard   -clock `CPU.dmu.iol2clk

// The dmu_ncu_data and ncu_dmu_data buses should be known_driven when
// the cooresponding valid signal is active and the stall signal was
// inactive in the previous cycle.
   
/* 0in known_driven -var `CPU.dmu_ncu_data    -name dmu_ncu_data_x_guard    -clock `CPU.dmu.iol2clk
   -active (`CPU.dmu_ncu_vld & ($0in_delay(`CPU.ncu_dmu_stall,1) == 1'b0) ) */
/* 0in known_driven -var `CPU.ncu_dmu_data    -name ncu_dmu_data_x_guard    -clock `CPU.dmu.iol2clk
   -active (`CPU.ncu_dmu_vld & ($0in_delay(`CPU.dmu_ncu_stall,1) == 1'b0) ) */

// 0in known_driven -var `CPU.ncu_dmu_pio_hdr_vld    -name ncu_dmu_pio_hdr_vld_x_guard   -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.ncu_dmu_mmu_addr_vld   -name ncu_dmu_mmu_addr_vld_x_guard  -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.dmu_ncu_wrack_vld   	-name dmu_ncu_wrack_vld_x_guard     -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.ncu_dmu_mondo_ack   	-name ncu_dmu_mondo_ack_x_guard     -clock `CPU.dmu.iol2clk
// 0in known_driven -var `CPU.ncu_dmu_mondo_nack    	-name ncu_dmu_mondo_nack_x_guard    -clock `CPU.dmu.iol2clk
/* 0in known_driven -var `CPU.ncu_dmu_pio_data      	-name ncu_dmu_pio_data_x_guard       -clock `CPU.dmu.iol2clk
   -active (`CPU.ncu_dmu_pio_hdr_vld | `CPU.ncu_dmu_mmu_addr_vld) */
/* 0in known_driven -var `CPU.dmu_ncu_wrack_tag    	-name dmu_ncu_wrack_tag_x_guard     -clock `CPU.dmu.iol2clk
   -active `CPU.dmu_ncu_wrack_vld */
/* 0in known_driven -var `CPU.ncu_dmu_mondo_id     	-name ncu_dmu_mondo_id_x_guard      -clock `CPU.dmu.iol2clk 
   -active (`CPU.ncu_dmu_mondo_ack | `CPU.ncu_dmu_mondo_nack)     */

`endif


//******************************************************************
// *_vld  can't active  over 32 cycle without *_stall in active
//******************************************************************

/* 0in assert_window
        -start `CPU.dmu_ncu_vld
	-stop_count 32 
        -in    (!`CPU.dmu_ncu_vld || `CPU.ncu_dmu_stall)
        -min 1
        -clock `CPU.dmu.iol2clk
*/
/* 0in assert_window
        -start `CPU.ncu_dmu_vld
	-stop_count 32 
        -in    (!`CPU.ncu_dmu_vld || `CPU.dmu_ncu_stall)
        -min 1
        -clock `CPU.dmu.iol2clk
*/


//******************************************************************
// *_stall  can't active  too long, for dmu_ncu_stall this is
//  determined in dmu_dsn_ccc_fsm.v
//******************************************************************
/* 0in assert_window 
        -start `CPU.dmu_ncu_stall
	-stop_count 265
	-in    !`CPU.dmu_ncu_stall
        -min   1
        -name  dmu_stall_too_long
        -clock `CPU.dmu.iol2clk
*/


/* 0in assert_window 
        -start `CPU.ncu_dmu_stall
	-stop_count 100
	-in    !`CPU.ncu_dmu_stall
        -min   1
        -name  ncu_stall_too_long
        -clock `CPU.dmu.iol2clk
*/


//******************************************************************
// ncu_dmu_mondo_nack  and  ncu_dmu_mondo_ack never active same time 
//******************************************************************
/* 0in mutex
        -var   {`CPU.ncu_dmu_mondo_ack, `CPU.ncu_dmu_mondo_nack}
	-clock `CPU.dmu.iol2clk
*/

//******************************************************************
// ncu_dmu_pio_hdr_vld  and  ncu_dmu_mmu_addr_vld never active same time 
//******************************************************************
/* 0in mutex
        -var   {`CPU.ncu_dmu_mmu_addr_vld, `CPU.ncu_dmu_pio_hdr_vld}
	-clock `CPU.dmu.iol2clk
*/

endmodule // dmu_ncu_chkr
