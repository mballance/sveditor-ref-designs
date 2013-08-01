// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: global_monitor.v
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
module global_monitor();


`ifndef GATESIM


//print out trap type explicitly inside the vcs.log file (XMR signal is taken from the trap logic unit, i.e. TLU)

wire[8:0] trap_type = tb_top.cpu.spc0.tlu.trl0_trap_type[8:0];

always @(trap_type) begin
 if ((`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) && (trap_type!=0)) begin
  case (trap_type)
   9'h1     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" power_on_reset \" ",trap_type);    end
   9'h2     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" watchdog_reset \" ",trap_type);    end
   9'h3     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" externally_initiated_reset \" ",trap_type);    end
   9'h4     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" SW_initiated_reset \" ",trap_type);    end
   9'h5     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" RED_state_exception \" ",trap_type);    end
   9'h7     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" store_error \" ",trap_type);    end
   9'h8     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Instruction_Access_Exception_privilege_violation \" ",trap_type);    end
   9'h9     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_access_MMU_miss \" ",trap_type);    end
   9'hA     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_access_error \" ",trap_type);    end
   9'hB     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Instruction_Access_Exception_unauth_access \" ",trap_type);    end
   9'hC     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Instruction_Access_Exception_nfo_page \" ",trap_type);    end
   9'hD     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_address_range \" ",trap_type);    end
   9'hE     :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_real_range \" ",trap_type);    end
   9'h10    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" illegal_instruction \" ",trap_type);    end
   9'h11    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" privileged_opcode \" ",trap_type);    end
   9'h12    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" unimplemented_LDD \" ",trap_type);    end
   9'h13    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" unimplemented_STD \" ",trap_type);    end
   9'h14    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Data_Access_Exception_invalid_asi \" ",trap_type);    end
   9'h15    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Data_Access_Exception_privilege_violation \" ",trap_type);    end
   9'h16    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Data_Access_Exception_nc_page \" ",trap_type);    end
   9'h17    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Data_Access_Exception_nfo_page \" ",trap_type);    end
   9'h20    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" fp_disabled \" ",trap_type);    end
   9'h21    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" fp_exception_ieee_754 \" ",trap_type);    end
   9'h22    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" fp_exception_other \" ",trap_type);    end
   9'h23    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" tag_overflow \" ",trap_type);    end
   9'h24,9'h25,9'h26,9'h27    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" clean_window \" ",trap_type);    end
   9'h28    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" division_by_zero \" ",trap_type);    end
   9'h29    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" internal_processor_error \" ",trap_type);    end
   9'h2A    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_invalid_TSB_entry \" ",trap_type);    end
   9'h2B    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" data_invalid_TSB_entry \" ",trap_type);    end
   9'h2D    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" mem_real_range \" ",trap_type);    end
   9'h2E    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" mem_address_range \" ",trap_type);    end
   9'h30    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" Data_Access_Exception_so_page \" ",trap_type);    end
   9'h31    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" data_access_MMU_miss \" ",trap_type);    end
   9'h32    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" data_access_error \" ",trap_type);    end
   9'h33    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" data_access_protection \" ",trap_type);    end
   9'h34    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" mem_address_not_aligned \" ",trap_type);    end
   9'h35    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" LDDF_mem_address_not_aligned \" ",trap_type);    end
   9'h36    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" STDF_mem_address_not_aligned \" ",trap_type);    end
   9'h37    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" privileged_action \" ",trap_type);    end
   9'h38    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" LDQF_mem_address_not_aligned \" ",trap_type);    end
   9'h39    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" STQF_mem_addess_not_aligned \" ",trap_type);    end
   9'h3B    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" unsupported_page_size \" ",trap_type);    end
   9'h3C    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" control_word_queue_interrupt \" ",trap_type);    end
   9'h3D    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" modular_arithmetic_interrupt \" ",trap_type);    end
   9'h3E    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" inst_real_translation_miss \" ",trap_type);    end
   9'h3F    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" data_real_translation_miss \" ",trap_type);    end
   9'h40    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" SW_recoverable_error \" ",trap_type);    end
   9'h41    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_1 \" ",trap_type);    end
   9'h42    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_2 \" ",trap_type);    end
   9'h43    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_3 \" ",trap_type);    end
   9'h44    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_4 \" ",trap_type);    end
   9'h45    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_5 \" ",trap_type);    end
   9'h46    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_6 \" ",trap_type);    end
   9'h47    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_7 \" ",trap_type);    end
   9'h48    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_8 \" ",trap_type);    end
   9'h49    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_9 \" ",trap_type);    end
   9'h4A    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_10 \" ",trap_type);    end
   9'h4B    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_11 \" ",trap_type);    end
   9'h4C    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_12 \" ",trap_type);    end
   9'h4D    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_13 \" ",trap_type);    end
   9'h4E    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_level_14 \" ",trap_type);    end
   9'h4F    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" pic_overflow (interrupt_level_15) \" ",trap_type);    end
   9'h5E    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" hstick_match \" ",trap_type);    end
   9'h5F    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" trap_level_zero \" ",trap_type);    end
   9'h60    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" interrupt_vector_trap \" ",trap_type);    end
   9'h61    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" PA_watchpoint \" ",trap_type);    end
   9'h62    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" VA_watchpoint \" ",trap_type);    end
   9'h63    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HW_corrected_error \" ",trap_type);    end
   9'h64    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" fast_instruction_access_MMU_miss \" ",trap_type);    end
   9'h68    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" fast_data_access_MMU_miss \" ",trap_type);    end
   9'h6C    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" fast_data_access_protection \" ",trap_type);    end
   9'h71    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_access_MMU_error \" ",trap_type);    end
   9'h72    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" data_access_MMU_error \" ",trap_type);    end
   9'h74    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" control_transfer_instruction \" ",trap_type);    end
   9'h75    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_VA_watchpoint \" ",trap_type);    end
   9'h76    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" instruction_breakpoint \" ",trap_type);    end
   9'h7C    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" cpu_mondo_trap \" ",trap_type);    end
   9'h7D    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" dev_mondo_trap \" ",trap_type);    end
   9'h7E    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" resumable_error \" ",trap_type);    end
   9'h7F    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" nonresumable_error (generated by SW only) \" ",trap_type);    end
   9'h80    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_0_normal \" ",trap_type);    end
   9'h84    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_1_normal \" ",trap_type);    end
   9'h88    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_2_normal \" ",trap_type);    end
   9'h8C    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_3_normal \" ",trap_type);    end
   9'h90    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_4_normal \" ",trap_type);    end
   9'h94    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_5_normal \" ",trap_type);    end
   9'h98    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_6_normal \" ",trap_type);    end
   9'h9C    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_7_normal \" ",trap_type);    end
   9'hA0    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_0_other \" ",trap_type);    end
   9'hA4    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_1_other \" ",trap_type);    end
   9'hA8    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_2_other \" ",trap_type);    end
   9'hAC    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_3_other \" ",trap_type);    end
   9'hB0    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_4_other \" ",trap_type);    end
   9'hB4    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_5_other \" ",trap_type);    end
   9'hB8    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_6_other \" ",trap_type);    end
   9'hBC    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window spill_7_other \" ",trap_type);    end
   9'hC0    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_0_normal \" ",trap_type);    end
   9'hC4    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_1_normal \" ",trap_type);    end
   9'hC8    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_2_normal \" ",trap_type);    end
   9'hCC    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_3_normal \" ",trap_type);    end
   9'hD0    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_4_normal \" ",trap_type);    end
   9'hD4    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_5_normal \" ",trap_type);    end
   9'hD8    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_6_normal \" ",trap_type);    end
   9'hDC    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_7_normal \" ",trap_type);    end
   9'hE0    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_0_other \" ",trap_type);    end
   9'hE4    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_1_other \" ",trap_type);    end
   9'hE8    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_2_other \" ",trap_type);    end
   9'hEC    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_3_other \" ",trap_type);    end
   9'hF0    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_4_other \" ",trap_type);    end
   9'hF4    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_5_other \" ",trap_type);    end
   9'hF8    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_6_other \" ",trap_type);    end
   9'hFC    :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" window fill_7_other \" ",trap_type);    end
   //9'h100-9'h17F  :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" trap_instruction \" ",trap_type);    end
   9'h100   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  GoodTrap \" ",trap_type);    end
   9'h101   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  BadTrap \" ",trap_type);    end
   9'h102   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangePriv \" ",trap_type);    end
   9'h103   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeNonPriv \" ",trap_type);    end
   9'h104   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeToTL1 \" ",trap_type);    end
   9'h105   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeToTL0 \" ",trap_type);    end
   9'h106   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeToTL0 \" ",trap_type);    end
   9'h107   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeToTL0 \" ",trap_type);    end
   9'h108   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  TrapEn \" ",trap_type);    end
   9'h10A   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  TrapDis \" ",trap_type);    end
   9'h10C   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  TrapEn_Ntimes \" ",trap_type);    end
   9'h110   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  PThreadMutexLock \" ",trap_type);    end
   9'h111   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeToTL0 \" ",trap_type);    end
   9'h114   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  PThreadMutexUnLock \" ",trap_type);    end
   9'h116   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  Trap_Sync \" ",trap_type);    end
   9'h118   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  Trap_SysCall \" ",trap_type);    end
   9'h11A   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  Trap_SysRet  \" ",trap_type);    end
   9'h120   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  HTrap_ChangePriv  \" ",trap_type);    end
   9'h122   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  HTrap_ChangeNonPriv  \" ",trap_type);    end
   9'h124   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  HTrapEn  \" ",trap_type);    end
   9'h126   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  HTrapDis  \" ",trap_type);    end
   9'h128   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  HTrapEn_Ntimes  \" ",trap_type);    end
   9'h12A   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  ChangeCtx  \" ",trap_type);    end
   9'h12C   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  Dummy  \" ",trap_type);    end
   9'h12E   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" T0  RdThId  \" ",trap_type);    end
   //9'h180-9'h1FF  :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" htrap_instruction \" ",trap_type);    end
   9'h180   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 ChangePriv  \" ",trap_type);    end
   9'h182   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 ChangeNonPriv  \" ",trap_type);    end
   9'h184   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 TrapEn  \" ",trap_type);    end
   9'h186   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 TrapDis  \" ",trap_type);    end
   9'h188   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 TrapEn_Ntimes  \" ",trap_type);    end
   9'h18A   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 ChangeCtx  \" ",trap_type);    end
   9'h18E   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 RdThId  \" ",trap_type);    end
   9'h1A0   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 GoodTrap  \" ",trap_type);    end
   9'h1A1   :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" HT0 BadTrap  \" ",trap_type);    end
   default  :   begin   `PR_ALWAYS("global_monitor", `ALWAYS, " ***   TRAP TAKEN :    TT is 0x%h    \" RESERVED! \" ",trap_type);    end
  endcase
 end
end



//print out status from each of the core ESRs 


wire [2:0] isfsr_errtype = tb_top.cpu.spc0.tlu.asi.isfsr_data[2:0] ;
wire [3:0] dsfsr_errtype = tb_top.cpu.spc0.tlu.asi.dsfsr_data[3:0] ;
wire [47:0] dsfar_erraddr = tb_top.cpu.spc0.tlu.asi.dsfar_data[47:0] ;
wire [4:0] desr_errtype = tb_top.cpu.spc0.tlu.asi.desr_data[60:56] ;
wire [10:0] desr_erraddr = tb_top.cpu.spc0.tlu.asi.desr_data[10:0] ;
wire desr_61 = tb_top.cpu.spc0.tlu.asi.desr_data[61];



always @(isfsr_errtype) begin
 if ((`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) && (isfsr_errtype!=0) && (trap_type!=0)) begin
  case (isfsr_errtype)
    3'h1   : begin 
           if (trap_type == 9'h9) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     ISFSR [2:0] is 0x%h    \"  (ITTM) IT Tag Multiple hit  \" ",trap_type,isfsr_errtype);   end
           else if (trap_type == 9'hA) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     ISFSR [2:0] is 0x%h    \"  (ICL2U) IC L2 Uncorrectable  \" ",trap_type,isfsr_errtype);   end
           end
    3'h2   :  begin
           if (trap_type == 9'h9)  begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     ISFSR [2:0] is 0x%h    \"  (ITTP) IT Tag Parity  \" ",trap_type,isfsr_errtype);   end
           else if (trap_type == 9'hA) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     ISFSR [2:0] is 0x%h    \"  (ICL2ND) IC L2 NotData  \" ",trap_type,isfsr_errtype);   end
           end
    3'h3   :    begin    `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---    ISFSR [2:0] is 0x%h    \"   (ITDP) IT Data Parity  \" ",trap_type,isfsr_errtype);   end
    3'h4   :    begin    `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---    ISFSR [2:0] is 0x%h    \"   (ITMU) IT MRA Uncorrectable   \" ",trap_type,isfsr_errtype);   end
    3'h5   :    begin    `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---    ISFSR [2:0] is 0x%h    \"   (ITL2U) IT L2 Uncorrectable   \" ",trap_type,isfsr_errtype);   end
    3'h6   :    begin    `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---    ISFSR [2:0] is 0x%h    \"   (ITL2ND) IT L2 NotData   \" ",trap_type,isfsr_errtype);   end
    default  :   begin    `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---    ISFSR [2:0] is 0x%h    \"   UNDEFINED! \" ",trap_type,isfsr_errtype);   end
  endcase
 end
end



always @(dsfsr_errtype) begin
 if ((`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) && (dsfsr_errtype!=0) && (trap_type!=0)) begin
  case (dsfsr_errtype)
    4'h1   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (IRFU)  Integer register file uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h31) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DTTM)  DT tag multiple hit  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h32) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DCL2U) data cache L2 uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h2   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (IRFC)  Integer register file correctable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h31) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DTTP)  DT tag parity  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h32) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DCL2ND) data cache L2 NotData  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h3   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (FRFU)  FP register file uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h31) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DTDP)  DT data parity  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h4   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (FRFC)  FP register file correctable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h31) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DTMU) DT MRA uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h32) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (SOCU) SOC uncorrectable \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h5   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (SBDLC)  Store buffer data load hit correctable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h31) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DTL2U)  DT L2 uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h6   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (SBDLU)  Store buffer data load hit uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
           else if (trap_type == 9'h31) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (DTL2ND)  DT L2 NotData  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h7   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (MRAU)  MRA uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h8   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (TSAC)  TSA correctable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'h9   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (TSAU)  TSA uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'hA   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (SCAC)  SCA correctable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'hB   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (SCAU)  SCA uncorrectable  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'hC   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (TCCP)  Tick compare correctable precise  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
    4'hD   : begin 
           if (trap_type == 9'h29) begin  `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---     DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"  (TCUP)  Tick compare uncorrectable precise  \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
            end
   default  :   begin    `PR_ALWAYS("global_monitor", `ALWAYS, " ***  TT is 0x%h   ---    DSFSR [3:0] is 0x%h    ---  DSFAR [47:0] is 0x%h    \"   UNDEFINED! \" ",trap_type,dsfsr_errtype,dsfar_erraddr);   end
  endcase
 end
end


always @(desr_errtype) begin
 if ((`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) && (desr_errtype!=0) && (trap_type!=0)) begin 
  case (desr_errtype)
    5'h1   : begin   
             if ( (trap_type == 9'h40) && (desr_erraddr == 11'h3) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (ITL2C) IT L2 correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63) && (desr_erraddr == 11'h4) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (ICVP) Instruction cache valid bit parity    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h2   : begin   
             if ( (trap_type == 9'h40) && (desr_erraddr == 11'h3) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (ICL2C) IC L2 correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63)  && (desr_erraddr == 11'h4) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (ICTP) Instruction cache tag parity    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h3   : begin   
             if ( (trap_type == 9'h40) && (desr_erraddr == 11'h3) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (DTL2C) DT L2 correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63) && (desr_erraddr == 11'h4) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (ICTM) Instruction cache tag multiple    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h4   : begin   
             if ( (trap_type == 9'h40) && (desr_erraddr == 11'h3) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (DCL2C) DC L2 correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63)  && (desr_erraddr == 11'h4) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (ICDP) Instruction cache data parity    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h5   : begin   
            if ( (trap_type == 9'h63)  && (desr_erraddr == 11'h5) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (DCVP) Data cache valid bit parity    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h6   : begin   
            if ( (trap_type == 9'h63)  && (desr_erraddr == 11'h5) )   begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (DCTP) Data cache tag parity    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h6) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (SBDPU) Store buffer data PCX read uncorrectable ECC    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h7   : begin   
             if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h14) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (MAMU) MA memory uncorrectable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63)  && (desr_erraddr == 11'h5) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (DCTM) Data cache tag multiple    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h8   : begin   
             if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (MAL2C) MA L2 read correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63)  && (desr_erraddr == 11'h5) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (DCDP) Data cache data parity    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h9   : begin   
             if ( (trap_type == 9'h40) && (desr_erraddr == 11'h3) ) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (MAL2U) MA L2 read uncorrectable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63) && (desr_erraddr == 11'h6) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (L2C) L2 cache correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'hA   : begin   
             if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) )   begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (MAL2ND) MA L2 read NotData    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if ( (trap_type == 9'h63) && (desr_erraddr == 11'h6) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (SBDPC) Store buffer data PCX read correctable ECC    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'hB   : begin   
             if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (CWQL2C) CWQ L2 read correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            else if (trap_type == 9'h63) begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (SOCC) SOC correctable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'hC   : begin   
            if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (CWQL2U) CWQ L2 read uncorrectable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'hD   : begin   
            if ( (trap_type == 9'h40 ) && (desr_erraddr == 11'h3) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (CWQL2ND) CWQ L2 read NotData    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'hE   : begin   
            if ( (trap_type == 9'h63) && (desr_erraddr == 11'h13) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (TCCD) Tick_compare correctable disrupting    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'hF   : begin   
            if ( (trap_type == 9'h63) && (desr_erraddr == 11'h13) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (TCUD) Tick_compare uncorrectable disrupting    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h10   : begin   
            if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) )  begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (L2U) L2 uncorrectable ECC error    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h11   : begin   
            if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) )   begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (L2ND) L2 NotData error    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h13   : begin   
            if (trap_type == 9'h40)   begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (SOCU) SOC uncorrectable    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
    5'h14   : begin   
            if ( (trap_type == 9'h40)  && (desr_erraddr == 11'h3) )   begin  `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  (L2C) L2 correctable ECC error    \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
            end
   default  :   begin    `PR_ALWAYS("global_monitor", `ALWAYS, "  ***  TT is 0x%h   ---   DESR [61] is %b    ---    DESR [60:56] is 0x%h    ---    DESR [10:0] is 0x%h   \"  UNDEFINED! \" ",trap_type,desr_61,desr_errtype,desr_erraddr);   end
  endcase
 end
end


//***************************************************************************************************
//***************************************************************************************************
wire drl2clk=`MCU0.drl2clk;

// new fullchip ecc injector written since original injector :/verif/env/mcu/amb_dram_err_inject.v
// works only on return packets from dram. this injector injects on both ingoing QWs as well as the return QWs

wire mcu0_esr_dac = `MCU0.drif.rdpctl_err_sts_reg[23];
wire mcu1_esr_dac = `MCU1.drif.rdpctl_err_sts_reg[23];
wire mcu2_esr_dac = `MCU2.drif.rdpctl_err_sts_reg[23];
wire mcu3_esr_dac = `MCU3.drif.rdpctl_err_sts_reg[23];

wire mcu0_esr_dau = `MCU0.drif.rdpctl_err_sts_reg[22];
wire mcu1_esr_dau = `MCU1.drif.rdpctl_err_sts_reg[22];
wire mcu2_esr_dau = `MCU2.drif.rdpctl_err_sts_reg[22];
wire mcu3_esr_dau = `MCU3.drif.rdpctl_err_sts_reg[22];

wire mcu0_esr_dsc = `MCU0.drif.rdpctl_err_sts_reg[21];
wire mcu1_esr_dsc = `MCU1.drif.rdpctl_err_sts_reg[21];
wire mcu2_esr_dsc = `MCU2.drif.rdpctl_err_sts_reg[21];
wire mcu3_esr_dsc = `MCU3.drif.rdpctl_err_sts_reg[21];

wire mcu0_esr_dsu = `MCU0.drif.rdpctl_err_sts_reg[20];
wire mcu1_esr_dsu = `MCU1.drif.rdpctl_err_sts_reg[20];
wire mcu2_esr_dsu = `MCU2.drif.rdpctl_err_sts_reg[20];
wire mcu3_esr_dsu = `MCU3.drif.rdpctl_err_sts_reg[20];

  reg               one_nibble_error=0;
  reg               multi_nibble_error=0;
  reg               random_nibble_error=0;
reg on_ecc_bits_only=0; reg on_write_only=0;
integer quadword=1;
integer flip=1;

initial begin
  if ($test$plusargs("ONE_NIBBLE_ERROR"))  begin
    one_nibble_error = 1;
  end
  else if ($test$plusargs("MULTI_NIBBLE_ERROR")) begin
    multi_nibble_error = 1;
  end
  else if ($test$plusargs("RANDOM_NIBBLE_ERROR")) begin
    random_nibble_error = 1;
  end
if ($test$plusargs("ON_ECC_NEW")) on_ecc_bits_only=1;
if ($test$plusargs("ON_WRITE_NEW")) on_write_only=1;
if ($value$plusargs("QUADWORD_NEW=%d",quadword) && (one_nibble_error || multi_nibble_error ) ) 
    begin
    if ( (quadword<1) || (quadword>4) ) `PR_ERROR ("global_monitor", `ERROR, "can only specify 1,2,3 or 4!");
        if (one_nibble_error==1)
            `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: will inject ECC CE on quadword %d",quadword);
        else if (multi_nibble_error==1) 
            `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: will inject ECC UE on quadword %d",quadword);
    end
else if ($test$plusargs("RANDOM_QUADWORD_NEW") && (one_nibble_error || multi_nibble_error ) )
    begin
    quadword=({$random}%4)+1;
        if (one_nibble_error==1)
    `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: will randomly select 1st/2nd/3rd/4th quadword for injecting CE!");
        else if (multi_nibble_error==1) 
    `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: will randomly select 1st/2nd/3rd/4th quadword for injecting UE!");
    end
if ( $value$plusargs("FLIP_NEW=%d",flip) && (one_nibble_error || multi_nibble_error ) )
    begin
    if ( (flip<1) || (flip>4) ) `PR_ERROR ("global_monitor", `ERROR, "can only specify 1,2,3 or 4!");
    `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: will FLIP %d bits in nibble",flip);
    end
else if ( $test$plusargs("RANDOM_FLIP_NEW") && (one_nibble_error || multi_nibble_error ) ) 
    begin
    flip=({$random}%4)+1;
    `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: will randomly FLIP 1/2/3/4 bits in nibble!");
    end

end

//end of bootcode
reg passed_bootEnd_mask=0;
	always @( `TOP.gOutOfBoot[63:0] ) begin
	if (!passed_bootEnd_mask && (`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0]) ) begin
            repeat (1000) @ (posedge drl2clk); // wait until 1000 cycles after bootEnd, then start injecting
            passed_bootEnd_mask=1;
            end
	end

integer delay_ecc_new;
initial
    if (!$value$plusargs("DELAY_ECC_NEW=%d",delay_ecc_new)) delay_ecc_new=6;

integer ce_count=0;
integer ue_count=0;

//READ
wire [143:0]mcu0_rddata0 = `MCU0.fbdird0_data[143:0];
wire [143:0]mcu0_rddata1 = `MCU0.fbdird1_data[143:0];
reg [143:0] mcu0_rddata0_corrupted=144'b0 ;
reg [143:0] mcu0_rddata1_corrupted=144'b0 ;

reg [31:0] random;
integer rddata_count=0;

always @( posedge `MCU0.fbdic_rddata_vld ) begin
if (passed_bootEnd_mask==1) begin
if (one_nibble_error || multi_nibble_error || random_nibble_error) begin
	rddata_count=rddata_count+1;
	if ((rddata_count % delay_ecc_new==1) && !on_write_only && (!mcu0_esr_dac && !mcu0_esr_dau)) begin

    if(random_nibble_error) begin
        random={$random}%2;
        if(random[0]) begin
            one_nibble_error = 1'b1;
            multi_nibble_error = 1'b0;
        end
        else begin
            one_nibble_error = 1'b0;
            multi_nibble_error = 1'b1;
        end
    end

        if (one_nibble_error) ce_count=ce_count+1;
        else if (multi_nibble_error) ue_count=ue_count+1;
        
        if (quadword==1 && !(mcu0_rddata0[143:128] == 16'hffff) ) begin
            mcu0_rddata0_corrupted = quadword_inject ( mcu0_rddata0, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
            force `MCU0.fbdird0_data[143:0] = mcu0_rddata0_corrupted [143:0];
            end
        else if (quadword==2 && !(mcu0_rddata1[143:128] == 16'hffff) ) begin
            mcu0_rddata1_corrupted = quadword_inject ( mcu0_rddata1, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
            force `MCU0.fbdird1_data[143:0] = mcu0_rddata1_corrupted [143:0];
            end
            
        @(posedge drl2clk);
        if (quadword==3 && !(mcu0_rddata0[143:128] == 16'hffff) ) begin
            mcu0_rddata0_corrupted = quadword_inject ( mcu0_rddata0, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
            force `MCU0.fbdird0_data[143:0] = mcu0_rddata0_corrupted [143:0];
            end
        else if (quadword==4 && !(mcu0_rddata1[143:128] == 16'hffff) ) begin
            mcu0_rddata1_corrupted = quadword_inject ( mcu0_rddata1, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
            force `MCU0.fbdird1_data[143:0] = mcu0_rddata1_corrupted [143:0];
            end

        repeat (10) @ (posedge drl2clk); //hold it for 10 clocks, then release it
        release `MCU0.fbdird0_data[143:0];
        release `MCU0.fbdird1_data[143:0];
end
end
end
end

//WRITE
wire [143:0] mcu0_wdata = `MCU0.fbdiwr.wrdp_data[143:0];
reg [143:0] mcu0_wdata_corrupted=144'b0 ;

integer wdata_count=0;

always @( `MCU0.drif.drif_dram_cmd_b[2:0] ) begin
if (passed_bootEnd_mask==1) begin
if (one_nibble_error || multi_nibble_error || random_nibble_error) begin
if ( `MCU0.drif.drif_dram_cmd_b[2:0]==3'h5) begin
    wdata_count=wdata_count+1;
    if ( (wdata_count % delay_ecc_new==1) && on_write_only && ( !mcu0_esr_dac && !mcu0_esr_dau && !mcu0_esr_dsc && !mcu0_esr_dsu ) ) begin

    if(random_nibble_error) begin
        random={$random}%2;
        if(random[0]) begin
            one_nibble_error = 1'b1;
            multi_nibble_error = 1'b0;
        end
        else begin
            one_nibble_error = 1'b0;
            multi_nibble_error = 1'b1;
        end
    end

    if (one_nibble_error) ce_count=ce_count+1;
    else if (multi_nibble_error) ue_count=ue_count+1;

    @(posedge drl2clk) ; // this 1 clock delay is necessary to get data
    if (quadword==1 && !(mcu0_wdata[143:128] == 16'hffff)) begin
        mcu0_wdata_corrupted = quadword_inject ( mcu0_wdata, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
        #1 force `MCU0.fbdiwr.wrdp_data[143:0] = mcu0_wdata_corrupted[143:0];
       end
    @(posedge drl2clk) ;
    if (quadword==2 && !(mcu0_wdata[143:128] == 16'hffff)) begin
        mcu0_wdata_corrupted = quadword_inject ( mcu0_wdata, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
        #1 force `MCU0.fbdiwr.wrdp_data[143:0] = mcu0_wdata_corrupted[143:0];
       end
    @(posedge drl2clk) ;
    if (quadword==3 && !(mcu0_wdata[143:128] == 16'hffff)) begin
        mcu0_wdata_corrupted = quadword_inject ( mcu0_wdata, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
        #1 force `MCU0.fbdiwr.wrdp_data[143:0] = mcu0_wdata_corrupted[143:0];
       end
    @(posedge drl2clk) ;
    if (quadword==4 && !(mcu0_wdata[143:128] == 16'hffff)) begin
        mcu0_wdata_corrupted = quadword_inject ( mcu0_wdata, one_nibble_error, multi_nibble_error, on_ecc_bits_only, flip,ce_count,ue_count );
        #1 force `MCU0.fbdiwr.wrdp_data[143:0] = mcu0_wdata_corrupted[143:0];
       end

        repeat (10) @ (posedge drl2clk); //hold it for 10 clocks, then release it
        release `MCU0.fbdiwr.wrdp_data[143:0];
end
end
end
end
end


function [143:0] quadword_inject;
input[143:0] data;
input one_nibble_error;
input multi_nibble_error;
input on_ecc_bits_only;
input [31:0] flip;
input [31:0] ce_count;
input [31:0] ue_count;
reg [4:0] nibble_error_position1;
reg [4:0] nibble_error_position2;
reg [3:0] ecc_error_position1;
reg [3:0] ecc_error_position2;
reg [127:0]tmp_data;
reg [15:0]tmp_ecc;
reg [3:0] calc_flipbits_out;

begin
    if (one_nibble_error) 
    begin
    if (!on_ecc_bits_only) begin //inject on data bits only
        nibble_error_position1 = {$random}%32; // 32 data nibbles

        calc_flipbits_out=calc_flipbits(flip);
        tmp_data=(calc_flipbits_out << (4*nibble_error_position1));
        quadword_inject = data ^ { {16{1'b0}}, tmp_data };
        `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: Injected CE DATA error no. %d (nibble is %d, %d bits/nibble flipped, nibble config is %4b) --> orig. data [143:0] was %x, modif. data [143:0] is %x",ce_count,nibble_error_position1,flip,calc_flipbits_out,data,quadword_inject);
    end
    else begin //inject on ecc bits only
        ecc_error_position1 = {$random}%16; // 16 ECC bits

        tmp_ecc=(1 << ecc_error_position1);
        quadword_inject = data ^ { tmp_ecc, {128{1'b0}} };
        `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: Injected CE ECC error no. %d (ecc bit flipped is %d) --> orig. data [143:0] was %x, modif. data [143:0] is %x",ce_count,ecc_error_position1,data,quadword_inject);
    end
    end
    else if(multi_nibble_error) 
    begin
    if (!on_ecc_bits_only) begin //inject on data bits only
        nibble_error_position1 = {$random}%32;
        nibble_error_position2 = {$random}%32;
        while ( (nibble_error_position2 == nibble_error_position1) || (nibble_error_position2 < nibble_error_position1) )
            nibble_error_position2 = {$random}%32;
        
        calc_flipbits_out=calc_flipbits(flip);
        tmp_data=(calc_flipbits_out << (4*nibble_error_position1));
        tmp_data=(tmp_data | (calc_flipbits_out << (4*nibble_error_position2)));
        quadword_inject = data ^ { {16{1'b0}}, tmp_data };
        `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: Injected UE DATA error no. %d (nibbles are %d and %d, %d bits/nibble flipped, nibble config is %4b) --> orig. data [143:0] was %x, modif. data [143:0] is %x",ue_count,nibble_error_position1,nibble_error_position2,flip,calc_flipbits_out,data,quadword_inject);
    end
    else begin //inject on ecc bits only
        ecc_error_position1 = {$random}%16;
        ecc_error_position2 = {$random}%16;
        while ( (ecc_error_position2 == ecc_error_position1) || (ecc_error_position2 < ecc_error_position1) ||
            ( (ecc_error_position2 > ecc_error_position1) && (ecc_error_position2 - ecc_error_position1 <4) ) )
            ecc_error_position2 = {$random}%16;
        
        tmp_ecc=(1 << ecc_error_position1);
        tmp_ecc=(tmp_ecc | (1 << ecc_error_position2));
        quadword_inject = data ^ { tmp_ecc, {128{1'b0}} };
        `PR_ALWAYS ("global_monitor", `ALWAYS, "INFO: Injected UE ECC error no. %d (ecc bits flipped are %d and %d,i.e. placed 4 bits apart) --> orig. data [143:0] was %x, modif. data [143:0] is %x",ue_count,ecc_error_position1,ecc_error_position2,data,quadword_inject);
    end
    end

end
endfunction

function [3:0] calc_flipbits;
input [31:0] flip;
integer i;
begin
        case (flip)
            1: begin
                i=({$random}%4)+1;
                case (i)
                    1: calc_flipbits=4'b0001;
                    2: calc_flipbits=4'b0010;
                    3: calc_flipbits=4'b0100;
                    4: calc_flipbits=4'b1000;
                    default: calc_flipbits=4'b0001;
                endcase
                end
            2: begin
                i=({$random}%6)+1;
                case (i)
                    1: calc_flipbits=4'b0011;
                    2: calc_flipbits=4'b0101;
                    3: calc_flipbits=4'b1001;
                    4: calc_flipbits=4'b0110;
                    5: calc_flipbits=4'b1010;
                    6: calc_flipbits=4'b1100;
                    default: calc_flipbits=4'b0011;
                endcase
                end
            3: begin
                i=({$random}%4)+1;
                case (i)
                    1: calc_flipbits=4'b0111;
                    2: calc_flipbits=4'b1011;
                    3: calc_flipbits=4'b1101;
                    4: calc_flipbits=4'b1110;
                    default: calc_flipbits=4'b0111;
                endcase
                end
            4: calc_flipbits=4'b1111;
        endcase
end
endfunction

//***************************************************************************************************
//***************************************************************************************************

`endif  //GATESIM

endmodule
