/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand5fc_8149597.s
* Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
* 4150 Network Circle, Santa Clara, California 95054, U.S.A.
*
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
* For the avoidance of doubt, and except that if any non-GPL license 
* choice is available it will apply instead, Sun elects to use only 
* the General Public License version 2 (GPLv2) at this time for any 
* software where a choice of GPL license versions is made 
* available with the language indicating that GPLv2 or any later version 
* may be used, or where a choice of which version of the GPL is applied is 
* otherwise unspecified. 
*
* Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
* CA 95054 USA or visit www.sun.com if you need additional information or 
* have any questions. 
*
* 
* ========== Copyright Header End ============================================
*/
# 518 "diag.j.pp"
#define IMMU_SKIP_IF_NO_TTE
#define DMMU_SKIP_IF_NO_TTE
#define PORTABLE_CORE
#define MAIN_PAGE_NUCLEUS_ALSO
#define MAIN_PAGE_HV_ALSO
#define MAIN_PAGE_VA_IS_RA_ALSO
#define DISABLE_PART_LIMIT_CHECK
#define MAIN_PAGE_USE_CONFIG 3
#define PART0_Z_TSB_SIZE_3 10
#define PART0_Z_PAGE_SIZE_3 1
#define PART0_NZ_TSB_SIZE_3 10
#define PART0_NZ_PAGE_SIZE_3 1
#define PART0_Z_TSB_SIZE_1 3
#define PART0_NZ_TSB_SIZE_1 3

#define PART_0_BASE 0x0
#define USER_PAGE_CUSTOM_MAP
#define MAIN_BASE_TEXT_VA 0x333000000
#define MAIN_BASE_TEXT_RA 0x033000000
#define MAIN_BASE_DATA_VA 0x379400000
#define MAIN_BASE_DATA_RA 0x079400000
#define HIGHVA_HIGHNUM 0x3

#d
# 544 "diag.j.pp"
#undef H_HT0_Instruction_Access_MMU_Error_0x71
#define H_HT0_Instruction_Access_MMU_Error_0x71 inst_access_mmu_error_handler
#undef H_HT0_Instruction_access_error_0x0a
#define H_HT0_Instruction_access_error_0x0a inst_access_error_handler
#undef H_HT0_Internal_Processor_Error_0x29
#define H_HT0_Internal_Processor_Error_0x29 int_proc_err_handler
#undef H_HT0_Data_Access_MMU_Error_0x72
#define H_HT0_Data_Access_MMU_Error_0x72 data_access_mmu_error_handler
#undef H_HT0_Data_access_error_0x32
#define H_HT0_Data_access_error_0x32 data_access_error_handler
#undef H_HT0_Hw_Corrected_Error_0x63
#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler
#undef H_HT0_Sw_Recoverable_Error_0x40
#define H_HT0_Sw_Recoverable_Error_0x40 sw_recoverable_error_handler
#undef H_HT0_Store_Error_0x07
#define H_HT0_Store_Error_0x07 store_error_handler

#define DAE_SKIP_IF_SOCU_ERROR
# 5 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#ifndef T_HANDLER_RAND4_1
#define T_HANDLER_RAND4_1 b .+16;\
    sdiv %r1, %r0, %l4;nop;nop
#endif
#ifndef T_HANDLER_RAND7_1
#define T_HANDLER_RAND7_1 b .+28;\
    pdist %f4, %f6, %f20; \
    nop; nop ; nop; nop; illtrap
#endif
#ifndef T_HANDLER_RAND4_2 
#define T_HANDLER_RAND4_2 save %i7, %g0, %i7; \
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    restore %i7, %g0, %i7;
#endif
#ifndef T_HANDLER_RAND7_2
#define T_HANDLER_RAND7_2 b .+8 ;\
    rdpr %pstate, %l2;\
    b .+8 ;\
    rdpr %tstate, %l3;\
    b .+12 ;\
    wrpr %l3, %r0, %tstate; nop
#endif
#ifndef T_HANDLER_RAND4_3
#define T_HANDLER_RAND4_3 save %i7, %g0, %i7;\
    restore %i7, %g0, %i7;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;
#endif
#ifndef T_HANDLER_RAND7_3
#define T_HANDLER_RAND7_3 b .+8 ;\
    rdpr %tnpc, %l2;\
    and %l2, 0xfc0, %l2;\
    add %i7, %l2, %l2;\
    stda    %f16,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY ;\
    b .+8 ;\
    stda    %f0,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE ;
#endif
#ifndef T_HANDLER_RAND4_4
#define T_HANDLER_RAND4_4 b .+4 ; b .+4; b .+4; b .+4
#endif
#ifndef T_HANDLER_RAND7_4 
#define T_HANDLER_RAND7_4 b .+8;\
    save %i7, %g0, %i7; \
    b,a .+8;\
    b .+12;\
    stw %i7, [%i7];\
    b .-8;;\
    restore %i7, %g0, %i7; 

#endif
#ifndef T_HANDLER_RAND4_5
#define T_HANDLER_RAND4_5 ldda	[%r31]ASI_NUCLEUS_QUAD_LDD, %l4;\
    sdiv %l4, %l5, %l7;\
    add  %r31, 128, %l5;\
    stda %l4, [%i7]ASI_BLOCK_PRIMARY_LITTLE;
#endif
#ifndef T_HANDLER_RAND7_5
#define T_HANDLER_RAND7_5 save %i7, %g0, %i7;\
    rdpr %tnpc, %l2;\
    wrpr %l2, %tpc;\
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc;\
    restore %i7, %g0, %i7;\
    retry;
#endif
#ifndef T_HANDLER_RAND4_6
#define T_HANDLER_RAND4_6 ldda [%r31]ASI_BLOCK_AS_IF_USER_PRIMARY, %l2;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    stda    %f0,[%r31]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE;
#endif
#ifndef T_HANDLER_RAND7_6
#define T_HANDLER_RAND7_6 umul %o4, 2, %o5;\
    rdpr %tnpc, %l2;\
    wrpr %l2, %tpc;\
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc;\
    stw %l2, [%i7];\
    retry;
#endif
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#ifndef HT_HANDLER_RAND4_1  
#define HT_HANDLER_RAND4_1 mov 0x80, %l3;\
    b .+12;\
    stxa %l3, [%l3]0x57 ;\
    nop
#endif
#ifndef HT_HANDLER_RAND7_1
#define HT_HANDLER_RAND7_1 b .+28;\
    pdist %f4, %f4, %f20;\
    nop; nop ; nop; nop; illtrap
#endif
#ifndef HT_HANDLER_RAND4_2 
#define HT_HANDLER_RAND4_2 rdpr %tstate, %l2;\
    b .+12;\
    wrpr %l2, 0x800, %tstate;\
    nop;
#endif
#ifndef HT_HANDLER_RAND7_2
#define HT_HANDLER_RAND7_2 b .+8 ;\
    rdhpr %hpstate, %l2;\
    b .+8 ;\
    rdhpr %htstate, %l3;\
    b .+12 ;\
    wrhpr %l3, %r0, %htstate; nop
#endif
#ifndef HT_HANDLER_RAND4_3
#define HT_HANDLER_RAND4_3 stxa %l4, [%r31]ASI_AS_IF_USER_PRIMARY;\
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    b .+8 ;\
    ldxa [%r31]ASI_AS_IF_USER_PRIMARY, %l4;
#endif
#ifndef HT_HANDLER_RAND7_3
#define HT_HANDLER_RAND7_3 b .+8 ;\
    rdpr %tnpc, %l2;\
    and %l2, 0xfc0, %l2;\
    add %i7, %l2, %l2;\
    stda    %f16,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY ;\
    b .+8 ;\
    stda    %f0,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE ;
#endif
#ifndef HT_HANDLER_RAND4_4
#define HT_HANDLER_RAND4_4 ldda [%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE, %l3;\
    b .+12 ;\
    stxa %l3, [%g0]ASI_LSU_CONTROL; nop
#endif
#ifndef HT_HANDLER_RAND7_4 
#define HT_HANDLER_RAND7_4 rdpr %tnpc, %l3;\
    and %l3, 0xff, %l3;\
    sllx %l3, 26, %l3;\
    ldxa [%g0]0x45, %l4;\
    or %l3, %l4, %l3 ;\
    stxa %l3, [%g0]0x45  ;\
    nop;
#endif
#ifndef HT_HANDLER_RAND4_5
#define HT_HANDLER_RAND4_5 ldda	[%r31]ASI_NUCLEUS_QUAD_LDD, %l4;\
    sdiv %l4, %l5, %l6;\
    sdiv %l3, %l6, %l7;\
    stda %f32, [%r31]ASI_BLOCK_PRIMARY_LITTLE;
#endif
#ifndef HT_HANDLER_RAND7_5
#define HT_HANDLER_RAND7_5 save %i7, %g0, %i7;\
    rdpr %tnpc, %l2;\
    wrpr %l2, %tpc;\
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc;\
    restore %i7, %g0, %i7;\
    retry;
#endif
#ifndef HT_HANDLER_RAND4_6
#define HT_HANDLER_RAND4_6 ld [%r31], %l2;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    stda    %f0,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE;
#endif
#ifndef HT_HANDLER_RAND7_6
#define HT_HANDLER_RAND7_6 rdhpr %htstate, %o4;\
    rdpr %tnpc, %l2;\
    wrpr %l2, %tpc;\
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc;\
    wrhpr %o4, %r0, %htstate;\
    retry;
#endif

!!!!!!!!!!!!!!!!!!!!!!!!!
!! Disable trap checking
#define NO_TRAPCHECK

! Enable Traps
#define ENABLE_T1_Privileged_Opcode_0x11
#define ENABLE_T1_Fp_Disabled_0x20
#define ENABLE_HT0_Watchdog_Reset_0x02

#define FILL_TRAP_RETRY
#define SPILL_TRAP_RETRY
#define CLEAN_WIN_RETRY

#define My_RED_Mode_Other_Reset
#define My_RED_Mode_Other_Reset \
    ba red_other_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_HT0_Software_Initiated_Reset_0x04
#define SUN_H_HT0_Software_Initiated_Reset_0x04 \
    setx Software_Reset_Handler, %g1, %g2 ;\
    jmp %g2 ;\
    nop
# 198 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_T1_Clean_Window_0x24
#define SUN_H_T1_Clean_Window_0x24 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x25
#define SUN_H_T1_Clean_Window_0x25 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x26
#define SUN_H_T1_Clean_Window_0x26 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x27
#define SUN_H_T1_Clean_Window_0x27 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop
# 227 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_Tag_Overflow
#define My_HT0_Tag_Overflow \
    HT_HANDLER_RAND7_1 ;\
    done

#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
    T_HANDLER_RAND7_2 ;\
    done

#define H_T1_Tag_Overflow_0x23
#define SUN_H_T1_Tag_Overflow_0x23 \
    T_HANDLER_RAND7_3 ;\
    done

#define H_T0_Window_Spill_0_Normal_Trap
#define SUN_H_T0_Window_Spill_0_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_1_Normal_Trap
#define SUN_H_T0_Window_Spill_1_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_2_Normal_Trap
#define SUN_H_T0_Window_Spill_2_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_3_Normal_Trap
#define SUN_H_T0_Window_Spill_3_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_4_Normal_Trap
#define SUN_H_T0_Window_Spill_4_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_5_Normal_Trap
#define SUN_H_T0_Window_Spill_5_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_6_Normal_Trap
#define SUN_H_T0_Window_Spill_6_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_7_Normal_Trap
#define SUN_H_T0_Window_Spill_7_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_0_Other_Trap
#define  SUN_H_T0_Window_Spill_0_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_1_Other_Trap
#define  SUN_H_T0_Window_Spill_1_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_2_Other_Trap
#define  SUN_H_T0_Window_Spill_2_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_3_Other_Trap
#define  SUN_H_T0_Window_Spill_3_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_4_Other_Trap
#define  SUN_H_T0_Window_Spill_4_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_5_Other_Trap
#define  SUN_H_T0_Window_Spill_5_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_6_Other_Trap
#define  SUN_H_T0_Window_Spill_6_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_7_Other_Trap
#define  SUN_H_T0_Window_Spill_7_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_0_Normal_Trap
#define  SUN_H_T0_Window_Fill_0_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_1_Normal_Trap
#define  SUN_H_T0_Window_Fill_1_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_2_Normal_Trap
#define  SUN_H_T0_Window_Fill_2_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_3_Normal_Trap
#define  SUN_H_T0_Window_Fill_3_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_4_Normal_Trap
#define  SUN_H_T0_Window_Fill_4_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_5_Normal_Trap
#define  SUN_H_T0_Window_Fill_5_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_6_Normal_Trap
#define  SUN_H_T0_Window_Fill_6_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_7_Normal_Trap
#define  SUN_H_T0_Window_Fill_7_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_0_Other_Trap
#define SUN_H_T0_Window_Fill_0_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_1_Other_Trap
#define SUN_H_T0_Window_Fill_1_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_2_Other_Trap
#define SUN_H_T0_Window_Fill_2_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_3_Other_Trap
#define SUN_H_T0_Window_Fill_3_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_4_Other_Trap
#define SUN_H_T0_Window_Fill_4_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_5_Other_Trap
#define SUN_H_T0_Window_Fill_5_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_6_Other_Trap
#define SUN_H_T0_Window_Fill_6_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_7_Other_Trap
#define SUN_H_T0_Window_Fill_7_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;
# 339 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_T1_Window_Spill_0_Normal_Trap
#define SUN_H_T1_Window_Spill_0_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_1_Normal_Trap
#define SUN_H_T1_Window_Spill_1_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_2_Normal_Trap
#define SUN_H_T1_Window_Spill_2_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_3_Normal_Trap
#define SUN_H_T1_Window_Spill_3_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_4_Normal_Trap
#define SUN_H_T1_Window_Spill_4_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_5_Normal_Trap
#define SUN_H_T1_Window_Spill_5_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_6_Normal_Trap
#define SUN_H_T1_Window_Spill_6_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_7_Normal_Trap
#define SUN_H_T1_Window_Spill_7_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_0_Other_Trap
#define SUN_H_T1_Window_Spill_0_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_1_Other_Trap
#define SUN_H_T1_Window_Spill_1_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_2_Other_Trap
#define SUN_H_T1_Window_Spill_2_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_3_Other_Trap
#define SUN_H_T1_Window_Spill_3_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_4_Other_Trap
#define SUN_H_T1_Window_Spill_4_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_5_Other_Trap
#define SUN_H_T1_Window_Spill_5_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_6_Other_Trap
#define SUN_H_T1_Window_Spill_6_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_7_Other_Trap
#define SUN_H_T1_Window_Spill_7_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_0_Normal_Trap
#define SUN_H_T1_Window_Fill_0_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_1_Normal_Trap
#define SUN_H_T1_Window_Fill_1_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_2_Normal_Trap
#define SUN_H_T1_Window_Fill_2_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_3_Normal_Trap
#define SUN_H_T1_Window_Fill_3_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_4_Normal_Trap
#define SUN_H_T1_Window_Fill_4_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_5_Normal_Trap
#define SUN_H_T1_Window_Fill_5_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_6_Normal_Trap
#define SUN_H_T1_Window_Fill_6_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_7_Normal_Trap
#define SUN_H_T1_Window_Fill_7_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_0_Other_Trap
#define SUN_H_T1_Window_Fill_0_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_1_Other_Trap
#define SUN_H_T1_Window_Fill_1_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_2_Other_Trap
#define SUN_H_T1_Window_Fill_2_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_3_Other_Trap
#define SUN_H_T1_Window_Fill_3_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_4_Other_Trap
#define SUN_H_T1_Window_Fill_4_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_5_Other_Trap
#define SUN_H_T1_Window_Fill_5_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_6_Other_Trap
#define SUN_H_T1_Window_Fill_6_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_7_Other_Trap
#define SUN_H_T1_Window_Fill_7_Other_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0 \
    T_HANDLER_RAND7_5 ;\
    done;

#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
    T_HANDLER_RAND7_6 ;\
    done;

#define H_T0_Trap_Instruction_2
#define My_T0_Trap_Instruction_2 \
    inc %o3;\
    umul %o3, 2, %o4;\
    ba 1f; \
    save %i7, %g0, %i7; \
    2: done; \
    nop; \
    1: ba 2b; \
    restore %i7, %g0, %i7
#define H_T0_Trap_Instruction_3
#define My_T0_Trap_Instruction_3 \
    save %i7, %g0, %i7 ;\
    T_HANDLER_RAND4_5;\
    stw %o4, [%i7];\
    restore %i7, %g0, %i7 ;\
    done 
#define H_T0_Trap_Instruction_4
#define My_T0_Trap_Instruction_4 \
    T_HANDLER_RAND7_6 ;\
    done;

#define H_T0_Trap_Instruction_5
#define My_T0_Trap_Instruction_5 \
    T_HANDLER_RAND4_5;\
    done;

#define H_T1_Trap_Instruction_0
#define My_T1_Trap_Instruction_0 \
    inc %o4;\
    umul %o4, 2, %o5;\
    ba 3f; \
    save %i7, %g0, %i7; \
    4: done; \
    nop; \
    3: ba 4b; \
    restore %i7, %g0, %i7
#define H_T1_Trap_Instruction_1
#define My_T1_Trap_Instruction_1 \
    T_HANDLER_RAND7_3;\
    done
#define H_T1_Trap_Instruction_2
#define My_T1_Trap_Instruction_2 \
    inc %o3;\
    umul %o3, 2, %o4;\
    ba 5f; \
    save %i7, %g0, %i7; \
    6: done; \
    nop; \
    5: ba 6b; \
    restore %i7, %g0, %i7
#define H_T1_Trap_Instruction_3
#define My_T1_Trap_Instruction_3 \
   T_HANDLER_RAND4_1;\
   done;

#define H_T1_Trap_Instruction_4
#define My_T1_Trap_Instruction_4 \
    T_HANDLER_RAND7_1;\
    done;
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    T_HANDLER_RAND7_2;\
    done
#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    HT_HANDLER_RAND4_1 ;\
    done;
#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    HT_HANDLER_RAND4_3 ;\
    done
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    HT_HANDLER_RAND7_5 ;\
    done;
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    HT_HANDLER_RAND4_5 ;\
    done
#define H_HT0_Trap_Instruction_4
#define My_HT0_Trap_Instruction_4 \
    HT_HANDLER_RAND7_4 ;\
    done
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    ba htrap_5_ext;\
    nop; retry;\
    nop; nop; nop; nop; nop

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    HT_HANDLER_RAND4_2 ;\
    done ;
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    HT_HANDLER_RAND4_2 ;\
    done;

#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    HT_HANDLER_RAND4_2;\
    done; 
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    HT_HANDLER_RAND4_3 ;\
    done
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    HT_HANDLER_RAND4_4 ;\
    done;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    done; \
    nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    HT_HANDLER_RAND4_3 ;\
    done
#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
    HT_HANDLER_RAND7_1;\
    done
#define H_HT0_Fp_exception_ieee_754_0x21
#define My_HT0_Fp_exception_ieee_754_0x21 \
    HT_HANDLER_RAND4_2 ;\
    done
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    HT_HANDLER_RAND7_2 ;\
    done
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    HT_HANDLER_RAND4_6;\
    done
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
    T_HANDLER_RAND4_3;\
    done
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    T_HANDLER_RAND4_3;\
    done
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero\
    T_HANDLER_RAND4_4 ;\
    done
#define H_T0_Fp_exception_ieee_754_0x21
#define My_T0_Fp_exception_ieee_754_0x21 \
    T_HANDLER_RAND4_3 ;\
    done
#define H_T1_Fp_Exception_Ieee_754_0x21
#define My_H_T1_Fp_Exception_Ieee_754_0x21 \
    T_HANDLER_RAND4_4 ;\
    done
#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    T_HANDLER_RAND4_5 ;\
    done
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    T_HANDLER_RAND4_6 ;\
    done

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    HT_HANDLER_RAND4_1;\
    done;

#define H_HT0_Fp_disabled_0x20
#define My_HT0_Fp_disabled_0x20 \
    mov  0x4, %l2 ;\
    wr %l2, 0x0, %fprs ;\
    sllx %l2, 10, %l3; \
    rdpr %tstate, %l2;\
    or %l2, %l3, %l2 ;\
    stw %l2, [%i7];\
    wrpr %l2, 0x0, %tstate;\
    retry;

#define H_T0_Fp_disabled_0x20
#define My_T0_Fp_disabled_0x20 \
    mov  0x4, %l2 ;\
    wr %l2, 0x0, %fprs ;\
    sllx %l2, 10, %l3; \
    rdpr %tstate, %l2;\
    or %l2, %l3, %l2 ;\
    wrpr %l2, 0x0, %tstate;\
    retry; nop

#define H_T1_Fp_Disabled_0x20
#define My_H_T1_Fp_Disabled_0x20 \
    mov  0x4, %l2 ;\
    wr %l2, 0x0, %fprs ;\
    sllx %l2, 10, %l3; \
    rdpr %tstate, %l2;\
    or %l2, %l3, %l2 ;\
    wrpr %l2, 0x0, %tstate;\
    stw %l2, [%i7];\
    retry

#define H_HT0_Watchdog_Reset_0x02
#define My_HT0_Watchdog_Reset_0x02 \
    ba wdog_2_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
    T_HANDLER_RAND4_4;\
    done

#define H_T1_Fp_exception_other_0x22
#define My_T1_Fp_exception_other_0x22 \
    T_HANDLER_RAND7_3 ;\
    done; 

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    T_HANDLER_RAND7_4;\
    done

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    not %g0, %r13; \
    rdhpr %hpstate, %l3;\
    jmp %r13;\
    rdhpr %htstate, %l3;\
    and %l3, 0xfe, %l3;\
    wrhpr %l3, 0, %htstate;\
    stw %r13, [%i7];\
    retry

#define My_Watchdog_Reset
#define My_Watchdog_Reset \
    ba wdog_red_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_HT0_Control_Transfer_Instr_0x74
#define My_H_HT0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    mov 1, %l4;\
    sllx %l4, 20, %l4;\
    wrpr %l3, %l4, %tstate ;\
    retry;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    mov 1, %l4;\
    sllx %l4, 20, %l4;\
    wrpr %l3, %l4, %tstate ;\
    retry;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    mov 1, %l4;\
    sllx %l4, 20, %l4;\
    wrpr %l3, %l4, %tstate ;\
    retry;nop;
# 707 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_data_access_protection_0x6c
#define SUN_H_HT0_data_access_protection_0x6c   ba daccess_prot_handler; nop

#define H_HT0_PA_Watchpoint_0x61
#define My_H_HT0_PA_Watchpoint_0x61 \
    HT_HANDLER_RAND7_4;\
    done

#ifndef H_HT0_Data_access_error_0x32
#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
    done;nop
#endif
# 722 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_T0_VA_Watchpoint_0x62
#define My_T0_VA_Watchpoint_0x62 \
    T_HANDLER_RAND7_5;\
    done

#define H_T1_VA_Watchpoint_0x62
#define SUN_H_T1_VA_Watchpoint_0x62 \
    T_HANDLER_RAND7_3;\
    done

#define H_HT0_VA_Watchpoint_0x62
#define My_H_HT0_VA_Watchpoint_0x62 \
    HT_HANDLER_RAND7_5;\
    done

#define H_HT0_Instruction_VA_Watchpoint_0x75
#define SUN_H_HT0_Instruction_VA_Watchpoint_0x75 \
    done;

#define H_HT0_Instruction_Breakpoint_0x76
#define SUN_H_HT0_Instruction_Breakpoint_0x76 \
    rdhpr %htstate, %g1;\
    wrhpr %g1, 0x400, %htstate;\
    retry;nop
# 748 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    HT_HANDLER_RAND4_1;\
    done;

#define H_HT0_Instruction_real_range_0x0e
#define SUN_H_HT0_Instruction_real_range_0x0e \
    HT_HANDLER_RAND4_1;\
    done;

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
    HT_HANDLER_RAND4_2;\
    done;
# 764 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    HT_HANDLER_RAND4_3;\
    done;

#define H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
    HT_HANDLER_RAND4_4;\
    done;

#define H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
    HT_HANDLER_RAND4_5;\
    done;
# 780 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done;
# 786 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
# 792 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    done;
# 802 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_privilege_violation_0x08
#define My_HT0_IAE_privilege_violation_0x08 \
    HT_HANDLER_RAND7_2;\
    done;

#ifndef H_HT0_Instruction_Access_MMU_Error_0x71
#define H_HT0_Instruction_Access_MMU_Error_0x71
#define SUN_H_HT0_Instruction_Access_MMU_Error_0x71 \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    retry;
#endif

#ifndef H_HT0_Data_Access_MMU_Error_0x72
#define H_HT0_Data_Access_MMU_Error_0x72
#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    retry;
#endif

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#ifndef INT_HANDLER_RAND4_1
#define INT_HANDLER_RAND4_1 retry; nop; nop; nop
#endif
#ifndef INT_HANDLER_RAND7_1
#define INT_HANDLER_RAND7_1 mov 0x20,%g1; mov 1, %g2;stxa %g2,[%g1]0x40
#endif
#ifndef INT_HANDLER_RAND4_2
#define INT_HANDLER_RAND4_2 retry; nop; nop; nop
#endif
#ifndef INT_HANDLER_RAND7_2
#define INT_HANDLER_RAND7_2 mov 0x80,%g1;stxa %g0,[%g1]0x40
#endif
#ifndef INT_HANDLER_RAND4_3
#define INT_HANDLER_RAND4_3 retry; nop; nop; nop
#endif
#ifndef INT_HANDLER_RAND7_3
#define INT_HANDLER_RAND7_3 retry; nop; nop; nop ; nop; nop; nop
#endif
#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    ldxa    [%g0] ASI_LSU_CTL_REG, %g1; \
    set cregs_lsu_ctl_reg_r64, %g1; \
    stxa    %g1, [%g0] ASI_LSU_CTL_REG; \
    retry;nop

#define My_External_Reset \
    ldxa    [%g0] ASI_LSU_CTL_REG, %l5; \
    set cregs_lsu_ctl_reg_r64, %l5; \
    stxa    %l5, [%g0] ASI_LSU_CTL_REG; \
    retry;nop

!!!!! SPU Interrupt Handlers

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
        INT_HANDLER_RAND7_1 ;\
    	retry ; 

#define H_HT0_Modular_Arithmetic_Interrupt_0x3d
#define My_H_HT0_Modular_Arithmetic_Interrupt_0x3d \
        INT_HANDLER_RAND7_2 ;\
    	retry ; 
# 59 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    INT_HANDLER_RAND4_1 ;\
    retry;

!!!!! Queue interrupt handler
# 72 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
#define H_T0_Cpu_Mondo_Trap_0x7c
#define My_T0_Cpu_Mondo_Trap_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Dev_Mondo_Trap_0x7d
#define My_T0_Dev_Mondo_Trap_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Resumable_Error_0x7e
#define My_T0_Resumable_Error_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Cpu_Mondo_Trap_0x7c
#define My_T1_Cpu_Mondo_Trap_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Dev_Mondo_Trap_0x7d
#define My_T1_Dev_Mondo_Trap_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Resumable_Error_0x7e
#define My_T1_Resumable_Error_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7c
#define SUN_H_HT0_Reserved_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7d
#define SUN_H_HT0_Reserved_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7e
#define SUN_H_HT0_Reserved_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
# 172 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 175 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Hstick_Match_0x5e
#define My_HT0_Hstick_Match_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x5e
#define My_T1_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop
# 220 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 223 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_1_0x41
#define My_T0_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_2_0x42
#define My_T0_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_3_0x43
#define My_T0_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_4_0x44
#define My_T0_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_5_0x45
#define My_T0_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_6_0x46
#define My_T0_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_7_0x47
#define My_T0_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_8_0x48
#define My_T0_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_9_0x49
#define My_T0_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_10_0x4a
#define My_T0_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_11_0x4b
#define My_T0_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_12_0x4c
#define My_T0_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_13_0x4d
#define My_T0_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
       sethi   %hi(0x8000), %g3; \
       wr  %g3, %g0, %clear_softint; \
       wr %g0, %g0, %pic;\
       sethi %hi(0x80040000), %g2;\
       rd %pcr, %g3;\
       andn %g3, %g2, %g3;\
       wr %g3, %g0, %pcr;\
       retry; 


#define H_T1_Interrupt_Level_14_0x4e
#define My_T1_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_1_0x41
#define My_T1_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_2_0x42
#define My_T1_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_3_0x43
#define My_T1_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_4_0x44
#define My_T1_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_5_0x45
#define My_T1_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_6_0x46
#define My_T1_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_7_0x47
#define My_T1_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_8_0x48
#define My_T1_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_9_0x49
#define My_T1_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_10_0x4a
#define My_T1_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_11_0x4b
#define My_T1_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_12_0x4c
#define My_T1_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_13_0x4d
#define My_T1_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_15_0x4f
#define My_T1_Interrupt_Level_15_0x4f \
       sethi   %hi(0x8000), %g3; \
       wr  %g3, %g0, %clear_softint; \
       wr %g0, %g0, %pic;\
       sethi %hi(0x80040000), %g2;\
       rd %pcr, %g3;\
       andn %g3, %g2, %g3;\
       wr %g3, %g0, %pcr;\
       retry; 


#define H_HT0_Interrupt_Level_14_0x4e
#define My_HT0_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_1_0x41
#define My_HT0_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_2_0x42
#define My_HT0_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_3_0x43
#define My_HT0_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_4_0x44
#define My_HT0_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_5_0x45
#define My_HT0_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_6_0x46
#define My_HT0_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_7_0x47
#define My_HT0_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_8_0x48
#define My_HT0_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_9_0x49
#define My_HT0_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_10_0x4a
#define My_HT0_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_11_0x4b
#define My_HT0_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_12_0x4c
#define My_HT0_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_13_0x4d
#define My_HT0_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_15_0x4f
#define My_HT0_Interrupt_Level_15_0x4f \
       sethi   %hi(0x8000), %g3; \
       wr  %g3, %g0, %clear_softint; \
       wr %g0, %g0, %pic;\
       sethi %hi(0x80040000), %g2;\
       rd %pcr, %g3;\
       andn %g3, %g2, %g3;\
       wr %g3, %g0, %pcr;\
       retry; 

# 710 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 566 "diag.j.pp"
!# Steer towards main TBA on these errors ..
!# These are redefines ...
#undef SUN_H_HT0_DAE_nc_page_0x16
#define SUN_H_HT0_DAE_nc_page_0x16 \
    best_set_reg(0x120000, %r1, %r2);\
    wrpr %r0, %r2, %tba; \
    done;nop

#undef SUN_H_HT0_DAE_nfo_page_0x17
#define SUN_H_HT0_DAE_nfo_page_0x17 \
    best_set_reg(0x120000, %r1, %r2);\
    wrpr %r0, %r2, %tba; \
    done;nop

#undef SUN_H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    set resolve_bad_tte, %g3;\
    jmp %g3;\
    nop

#undef My_HT0_IAE_privilege_violation_0x08
#define My_HT0_IAE_privilege_violation_0x08 \
    set resolve_bad_tte, %g3;\
    jmp %g3;\
    nop

#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    rdpr %tpc, %g1;\
    rdpr %tnpc, %g2;\
    stw %g1, [%i7];\
    stw %g2, [%i7+4];\
    jmpl %r27+8, %r27;\
    fdivd %f0, %f4, %f4;\
    nop;

#define H_HT0_Instruction_real_range_0x0e
#define SUN_H_HT0_Instruction_real_range_0x0e \
    rdpr %tpc, %g1;\
    rdpr %tnpc, %g2;\
    stw %g1, [%i7];\
    stw %g2, [%i7+4];\
    jmpl %r27+8, %r27;\
    fdivd %f0, %f4, %f4;\
    nop;

#undef SUN_H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    set resolve_bad_tte, %g3;\
    jmp %g3;\
    nop

#define H_HT0_Instruction_Invalid_TSB_Entry_0x2a
#define SUN_H_HT0_Instruction_Invalid_TSB_Entry_0x2a \
    set restore_range_regs, %g3;\
    jmp %g3;\
    nop

#define H_HT0_Data_Invalid_TSB_Entry_0x2b
#define SUN_H_HT0_Data_Invalid_TSB_Entry_0x2b \
    set restore_range_regs, %g3;\
    jmp %g3;\
    nop

#undef FAST_BOOT
#include "hboot.s"

#ifndef MULTIPASS
#define MULTIPASS 0
#endif
# 638 "diag.j.pp"
#define LOMEIN_TEXT_VA [0x]mpeval(MAIN_BASE_TEXT_VA&0xffffffff,16)
#define LOMEIN_DATA_VA [0x]mpeval(MAIN_BASE_DATA_VA&0xffffffff,16)
changequote([, ])dnl
SECTION .LOMEIN TEXT_VA=LOMEIN_TEXT_VA, DATA_VA=LOMEIN_DATA_VA
attr_text {
    Name = .LOMEIN,
    VA= LOMEIN_TEXT_VA,
    RA= MAIN_BASE_TEXT_RA,
    PA= ra2pa2(MAIN_BASE_TEXT_RA, 0),
    part_0_ctx_nonzero_tsb_config_1,
    part_0_ctx_zero_tsb_config_1,
    TTE_G=1, TTE_Context=0x44, TTE_V=1, 
    TTE_Size=0, TTE_NFO=0, TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=1,
    tsbonly
    }
attr_data {
    Name = .LOMEIN,
    VA= LOMEIN_DATA_VA,
    RA= MAIN_BASE_DATA_RA,
    PA= ra2pa2(MAIN_BASE_DATA_RA, 0),
    part_0_ctx_nonzero_tsb_config_2,
    part_0_ctx_zero_tsb_config_2
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
    tsbonly
        }
attr_data {
    Name = .LOMEIN,
    VA= LOMEIN_DATA_VA,
    RA= MAIN_BASE_DATA_RA,
    PA= ra2pa2(MAIN_BASE_DATA_RA, 0),
    part_0_ctx_nonzero_tsb_config_3,
    part_0_ctx_zero_tsb_config_3
        TTE_G=1, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
    tsbonly
        }
.text
.align 0x100000
    nop
.data
    .word 0x0

SECTION .MAIN TEXT_VA=MAIN_BASE_TEXT_VA, DATA_VA=MAIN_BASE_DATA_VA
attr_text {
    Name = .MAIN,
    VA=MAIN_BASE_TEXT_VA,
    RA= LOMEIN_TEXT_VA,
    PA= LOMEIN_TEXT_VA,
    part_0_ctx_nonzero_tsb_config_2,
    part_0_ctx_zero_tsb_config_2,
    TTE_G=1, TTE_Context=0x44, TTE_V=1, 
    TTE_Size=0, TTE_NFO=0, TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
    TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=1,
    }

attr_data {
    Name = .MAIN,
    VA=MAIN_BASE_DATA_VA
    RA= LOMEIN_DATA_VA,
    PA= LOMEIN_DATA_VA,
    part_0_ctx_nonzero_tsb_config_1,
    part_0_ctx_zero_tsb_config_1
        TTE_G=1, TTE_Context=0x44, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
        }

attr_data {
    Name = .MAIN,
    VA=MAIN_BASE_DATA_VA
    RA= LOMEIN_DATA_VA,
    PA= LOMEIN_DATA_VA,
    part_0_ctx_nonzero_tsb_config_3,
    part_0_ctx_zero_tsb_config_3
        TTE_G=1, TTE_Context=0x55, TTE_V=1, TTE_Size=0, TTE_NFO=0,
        TTE_IE=0, TTE_Soft2=0, TTE_Diag=0, TTE_Soft=0,
        TTE_L=0, TTE_CP=1, TTE_CV=0, TTE_E=0, TTE_P=0, TTE_W=1, TTE_X=0,
    tsbonly
        }

attr_text {
    Name = .MAIN,
    VA=MAIN_BASE_TEXT_VA,
    hypervisor
}

attr_data {
    Name = .MAIN,
    VA=MAIN_BASE_DATA_VA
    hypervisor
}
changequote(`,')dnl'

.text
.global main
main:

    ! Set up ld/st area per thread
    ta T_CHANGE_HPRIV
    ldxa [%g0]0x63, %o2
    and %o2, 0x7, %o1
    brnz %o1, init_start
    mov 0xff, %r10
lock_sync_thds:
    set sync_thr_counter4, %r23
#ifndef SPC
    and %o2, 0x38, %o2
    add %o2,%r23,%r23           !Core's sync counter
#endif
    st %r10, [%r23]             !lock sync_thr_counter4
    add %r23, 64, %r23
    st %r10, [%r23]             !lock sync_thr_counter5
    add %r23, 64, %r23
    st %r10, [%r23]             !lock sync_thr_counter6
init_start:
    ta T_CHANGE_NONHPRIV
	umul	%r9, 256, %r31
	setx	user_data_start, %r1, %r3
	add	%r31, %r3, %r31
    wr  %r0, 0x4, %asi

!Initializing integer registers
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0xb4, %r14
	mov 0x35, %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0x34, %r14
	mov 0x35, %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0xb2, %r14
	mov 0x31, %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0x32, %r14
	mov 0x32, %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0xb2, %r14
	mov 0x31, %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0xb5, %r14
	mov 0xb2, %r30
	save %r31, %r0, %r31
	ldx [%r31+0], %r0
	ldx [%r31+8], %r1
	ldx [%r31+16], %r2
	ldx [%r31+24], %r3
	ldx [%r31+32], %r4
	ldx [%r31+40], %r5
	ldx [%r31+48], %r6
	ldx [%r31+56], %r7
	ldx [%r31+64], %r8
	ldx [%r31+72], %r9
	ldx [%r31+80], %r10
	ldx [%r31+88], %r11
	ldx [%r31+96], %r12
	ldx [%r31+104], %r13
	ldx [%r31+112], %r14
	mov %r31, %r15
	ldx [%r31+128], %r16
	ldx [%r31+136], %r17
	ldx [%r31+144], %r18
	ldx [%r31+152], %r19
	ldx [%r31+160], %r20
	ldx [%r31+168], %r21
	ldx [%r31+176], %r22
	ldx [%r31+184], %r23
	ldx [%r31+192], %r24
	ldx [%r31+200], %r25
	ldx [%r31+208], %r26
	ldx [%r31+216], %r27
	ldx [%r31+224], %r28
	ldx [%r31+232], %r29
	mov 0xb2, %r14
	mov 0xb3, %r30
	save %r31, %r0, %r31
	restore
	restore
	restore
!Initializing float registers
	ldd [%r31+0], %f0
	ldd [%r31+16], %f2
	ldd [%r31+32], %f4
	ldd [%r31+48], %f6
	ldd [%r31+64], %f8
	ldd [%r31+80], %f10
	ldd [%r31+96], %f12
	ldd [%r31+112], %f14
	ldd [%r31+128], %f16
	ldd [%r31+144], %f18
	ldd [%r31+160], %f20
	ldd [%r31+176], %f22
	ldd [%r31+192], %f24
	ldd [%r31+208], %f26
	ldd [%r31+224], %f28
	ldd [%r31+240], %f30
    !! Set TPC/TNPC to diag-finish in case we get to a strange TL ..
    ta T_CHANGE_HPRIV
    setx diag_finish, %r29, %r28
    add %r28, 4, %r29
    wrpr %g0, 1, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 2, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 3, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 4, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 5, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 6, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 0, %tl

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr

#if  (MULTIPASS > 0)
    mov 0x38, %g1
    stxa %r0, [%g1]ASI_SCRATCHPAD
#endif

    ! Set up fpr PMU traps 
    set 0x21810df2, %g2
    b fork_threads
    wr %g2, %g0, %pcr

common_target:
    nop
    sub %r27, 8, %r27
    and %r27, 8, %r12
    mov HIGHVA_HIGHNUM, %r11
    sllx %r11, 32, %r11
    or %r27, %r11, %r27
    brz,a  %r12, .+8
    lduw [%r27], %r12      ! load jmp dest into dcache - xinval
    jmp %r27
	.word 0x87a94a46  ! 1: FCMPd	fcmpd	%fcc<n>, %f36, %f6
	nop
	jmp %r27
	nop
fork_threads:
	rd %tick, %r17
	mov 0x40, %g1
setup_hwtw_config:
	stxa %r17, [%g1]0x58
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffffffffffff; target strm = 0x1               
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x2               
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x4               
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x8               
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x10              
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x20              
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x40              
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffffffffffff; target strm = 0x80              
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
setup_tick:
    setx 0x35fa54dc6e413323, %r1, %r17
    wrpr %g0, %r17, %tick

    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_80:
    setx 0xcbd887619c93dcb4, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
setup_spu_80:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %l6

#ifndef SPC
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
    sllx %o2, 5, %o2    !(CID*256)
    add %l6, %o2, %l6
#endif
# 879 "diag.j.pp"
    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %l5				!# then end of CWQ region to LAST
#ifndef SPC
    add %l5, %o2, %l5
#endif
    stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi

    !# set  CWQ control word ([39:37] is strand ID ..)
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2

    !# write CWQ entry (%l6 points to CWQ)
    stx  %l2, [%l6 + 0x0]

    setx msg, %g1, %l2
    stx %l2, [%l6 + 0x8]	!# source address

    stx %g0, [%l6 + 0x10]	!# Authentication Key  Address (40-bit)
    stx %g0, [%l6 + 0x18]	!# Authentication IV   Address (40-bit)
    stx %g0, [%l6 + 0x20]	!# Authentication FSAS Address (40-bit)
    stx %g0, [%l6 + 0x28]	!# Encryption Key Address (40-bit)
    stx %g0, [%l6 + 0x30]	!# Encryption Initialization Vector Address (40-bit)

    setx    results, %g1, %o3
    stx %o3, [%l6 + 0x38]	!# Destination Address (40-bit)

    membar #Sync

    ldxa    [%g0 + ASI_SPU_CWQ_TAIL] %asi, %l2
    add %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_TAIL] %asi

    !# Kick off the CWQ operation by writing to the CWQ_CSR
    !# Set the enabled bit and reset the other bits
    or      %g0, 0x1, %g1
    stxa    %g1,    [%g0 + ASI_SPU_CWQ_CSR] %asi

unlock_sync_thds_80:
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
    add %o2, %r23, %r23
#endif
    st %r0, [%r23]          !unlock sync_thr_counter6
    sub %r23, 64, %r23
    st %r0, [%r23]          !unlock sync_thr_counter5
    sub %r23, 64, %r23
    st %r0, [%r23]          !unlock sync_thr_counter4

    wr %r0, %r12, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e082  ! 1: STX_I	stx	%r20, [%r31 + 0x0082]
br_longdelay4_80_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902002  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe93fe054  ! 3: STDF_I	std	%f20, [0x0054, %r31]
fpinit_80_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 4: FDIVs	fdivs	%f0, %f4, %f4
splash_lsu_80_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x1846bed8, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_3:
	.word 0x81982cde  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cde, %hpstate
memptr_80_4:
	set 0x60740000, %r31
	.word 0x858531f5  ! 7: WRCCR_I	wr	%r20, 0x11f5, %ccr
	nop
	mov 0x80, %g3
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xc19fe000  ! 9: LDDFA_I	ldda	[%r31, 0x0000], %f0
splash_tick_80_5:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x13ff3c4654610161, %r16, %r17)
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc1bfd920  ! 11: STDFA_R	stda	%f0, [%r0, %r31]
dvapa_80_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe73, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 12: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_80_7:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbfffffffae, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_9:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 17: CASA_R	casa	[%r31] %asi, %r11, %r20
	.word 0x87802004  ! 18: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_80_11:
	nop
	ta T_CHANGE_HPRIV
	set 0x02f655af, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe1e2  ! 20: STDF_I	std	%f20, [0x01e2, %r31]
brcommon1_80_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95b44491  ! 21: FCMPLE32	fcmple32	%d48, %d48, %r10
splash_lsu_80_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x51f68fec, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc19fdc00  ! 23: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfc3e0  ! 24: STDFA_R	stda	%f16, [%r0, %r31]
pmu_80_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb8ffffffa0, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36b3717  ! 1: PREFETCH_I	prefetch	[%r12 + 0xfffff717], #one_read
intvec_80_15:
	.word 0x97a4c9ca  ! 26: FDIVd	fdivd	%f50, %f10, %f42
cmp_80_16:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_16:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_16
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_16:
    brnz,a %r10, cmp_wait80_16
    ld [%r23], %r10
    ba cmp_startwait80_16
    mov 0x80, %r10
continue_cmp_80_16:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_16
    mov 0xc2, %r17
    best_set_reg(0x0e000cc4361d4b95, %r16, %r17)
cmp_multi_core_80_16:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9194c00c  ! 27: WRPR_PIL_R	wrpr	%r19, %r12, %pil
	nop
	mov 0x80, %g3
	stxa %r6, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_17)+32, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_17)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_80_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9852894  ! 29: WR_SET_SOFTINT_I	wr	%r20, 0x0894, %set_softint
cmp_80_18:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_18:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_18
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_18:
    brnz,a %r10, cmp_wait80_18
    ld [%r23], %r10
    ba cmp_startwait80_18
    mov 0x80, %r10
continue_cmp_80_18:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_18
    mov 49, %r17
    best_set_reg(0xcefe037aaee8500b, %r16, %r17)
cmp_multi_core_80_18:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00173  ! 30: FABSq	dis not found

cmp_80_19:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_19:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_19
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_19:
    brnz,a %r10, cmp_wait80_19
    ld [%r23], %r10
    ba cmp_startwait80_19
    mov 0x80, %r10
continue_cmp_80_19:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_19
    mov 5, %r17
    best_set_reg(0xc000c3a54f360794, %r16, %r17)
cmp_multi_core_80_19:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a00169  ! 31: FABSq	dis not found

tagged_80_20:
	tsubcctv %r9, 0x128c, %r16
	.word 0xd807e0fc  ! 32: LDUW_I	lduw	[%r31 + 0x00fc], %r12
mondo_80_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d948014  ! 33: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xb184c010  ! 34: WR_STICK_REG_R	wr	%r19, %r16, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 35: CASA_R	casa	[%r31] %asi, %r17, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 36: CASA_R	casa	[%r31] %asi, %r18, %r12
splash_tba_80_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_80_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xd111120a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_26) + 24, 16, 16)) -> intp(7,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_26)&0xffffffff) + 32, 16, 16)) -> intp(4,0,7,,,,,1)
#else
	set 0x595054f1, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_80_26:
	.word 0xa9b404d2  ! 39: FCMPNE32	fcmpne32	%d16, %d18, %r20
	.word 0xd727e16d  ! 40: STF_I	st	%f11, [0x016d, %r31]
	.word 0xd627e1a8  ! 41: STW_I	stw	%r11, [%r31 + 0x01a8]
jmptr_80_27:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_80_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0xecb, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b4c7c9  ! 44: PDIST	pdistn	%d50, %d40, %d10
pmu_80_29:
	nop
	setx 0xffffffbaffffffa6, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_80_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe31fe1b0  ! 46: LDDF_I	ldd	[%r31, 0x01b0], %f17
brcommon3_80_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe060  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x0060]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r10, [%r0] ASI_LSU_CONTROL
	.word 0x93aac830  ! 47: FMOVGE	fmovs	%fcc1, %f16, %f9
brcommon3_80_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e0c0  ! 1: STQF_I	-	%f11, [0x00c0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd73fc010  ! 48: STDF_R	std	%f11, [%r16, %r31]
	nop
	mov 0x80, %g3
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_33-donret_80_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00288900 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c56, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	ldx [%r11+%r0], %g1
	done
donretarg_80_33:
	.word 0x2a800001  ! 50: BCS	bcs,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_34) + 24, 16, 16)) -> intp(7,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_34)&0xffffffff) + 48, 16, 16)) -> intp(3,0,13,,,,,1)
#else
	set 0x36b01868, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_34:
	.word 0xa3a209d0  ! 51: FDIVd	fdivd	%f8, %f16, %f48
	.word 0xe927e06d  ! 52: STF_I	st	%f20, [0x006d, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_80_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc3ed0030  ! 55: PREFETCHA_R	prefetcha	[%r20, %r16] 0x01, #one_read
ibp_80_37:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x80, %r16
ibp_startwait80_37:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_37
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_37:
    brnz %r16, ibp_wait80_37
    ld [%r23], %r16
    ba ibp_startwait80_37
    mov 0x80, %r16
continue_ibp_80_37:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_37:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_37
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_37:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_37
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_37:
    best_set_reg(0x000000503ec000be,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a289b0  ! 56: FDIVs	fdivs	%f10, %f16, %f18
brcommon3_80_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e140  ! 1: STQF_I	-	%f20, [0x0140, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe8bfc028  ! 57: STDA_R	stda	%r20, [%r31 + %r8] 0x01
ibp_80_39:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x80, %r16
ibp_startwait80_39:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_39
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_39:
    brnz %r16, ibp_wait80_39
    ld [%r23], %r16
    ba ibp_startwait80_39
    mov 0x80, %r16
continue_ibp_80_39:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_39:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_39
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_39:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_39
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_39:
    best_set_reg(0x00000040fcc0be4b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87acca51  ! 58: FCMPd	fcmpd	%fcc<n>, %f50, %f48
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_40-donret_80_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00707900 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r12+%r0], %g1
	retry
donretarg_80_40:
	.word 0x2f400001  ! 59: FBPU	fbu,a,pn	%fcc0, <label_0x1>
memptr_80_41:
	set 0x60740000, %r31
	.word 0x8580aa21  ! 60: WRCCR_I	wr	%r2, 0x0a21, %ccr
	nop
	mov 0x80, %g3
	stxa %r8, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x9953c000  ! 62: RDPR_FQ	<illegal instruction>
	fbul,a,pn	%fcc0,  skip_80_42
	.word 0xa3b4c4d2  ! 1: FCMPNE32	fcmpne32	%d50, %d18, %r17
.align 1024
skip_80_42:
	.word 0x95a409d0  ! 63: FDIVd	fdivd	%f16, %f16, %f10
	brgz,a,pn	%r9, skip_80_43
	stxa %r7, [%r0] ASI_LSU_CONTROL
	fbn skip_80_43
	stxa %r13, [%r0] ASI_LSU_CONTROL
.align 1024
skip_80_43:
	.word 0xc30fc000  ! 64: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0xe19fdf20  ! 65: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_44:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 66: RDPC	rd	%pc, %r19
mondo_80_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d944006  ! 67: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
cmp_80_46:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_46:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_46
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_46:
    brnz,a %r10, cmp_wait80_46
    ld [%r23], %r10
    ba cmp_startwait80_46
    mov 0x80, %r10
continue_cmp_80_46:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_46
    mov 25, %r17
    best_set_reg(0x75a5606940c0cb66, %r16, %r17)
cmp_multi_core_80_46:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00165  ! 68: FABSq	dis not found

cmp_80_47:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_47:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_47
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_47:
    brnz,a %r10, cmp_wait80_47
    ld [%r23], %r10
    ba cmp_startwait80_47
    mov 0x80, %r10
continue_cmp_80_47:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_47
    mov 0xc2, %r17
    best_set_reg(0x37befdf8ec0eddf0, %r16, %r17)
cmp_multi_core_80_47:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91928012  ! 69: WRPR_PIL_R	wrpr	%r10, %r18, %pil
splash_tick_80_48:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x6dd9ef5706b99a05, %r16, %r17)
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_49)+16, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_49)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_80_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98422ad  ! 71: WR_SET_SOFTINT_I	wr	%r16, 0x02ad, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_50) + 56, 16, 16)) -> intp(5,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_50)&0xffffffff) + 40, 16, 16)) -> intp(6,0,26,,,,,1)
#else
	set 0x30c01840, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_80_50:
	.word 0xc369f0eb  ! 72: PREFETCH_I	prefetch	[%r7 + 0xfffff0eb], #one_read
invtsb_80_51:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %r14, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 75: CASA_R	casa	[%r31] %asi, %r20, %r18
cmp_80_53:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_53:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_53
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_53:
    brnz,a %r10, cmp_wait80_53
    ld [%r23], %r10
    ba cmp_startwait80_53
    mov 0x80, %r10
continue_cmp_80_53:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_53
    mov 0xb9, %r17
    best_set_reg(0xba9296c1bd158538, %r16, %r17)
cmp_multi_core_80_53:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9194c011  ! 76: WRPR_PIL_R	wrpr	%r19, %r17, %pil
pmu_80_54:
	nop
	setx 0xffffffbaffffffa3, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_80_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b59  ! 78: PREFETCHA_I	prefetcha	[%r0, + 0x0b59] %asi, #one_read
jmptr_80_56:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %r8, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
ticken_80_57:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0xd86624f368b787f7, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0x91b100e9  ! 81: EDGE16LN	edge16ln	%r4, %r9, %r8
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_58) + 16, 16, 16)) -> intp(6,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_58)&0xffffffff) + 40, 16, 16)) -> intp(5,0,22,,,,,1)
#else
	set 0x4a20cab5, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3b084d1  ! 1: FCMPNE32	fcmpne32	%d2, %d48, %r17
intvec_80_58:
	.word 0x91b404ca  ! 82: FCMPNE32	fcmpne32	%d16, %d10, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 83: CASA_R	casa	[%r31] %asi, %r12, %r18
fpinit_80_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 84: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x87802020  ! 85: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xc19fdf20  ! 86: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_80_61:
	nop
	ta T_CHANGE_HPRIV
	set 0xe2fcc268, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_62:
	nop
	ta T_CHANGE_HPRIV
	set 0x7c8f01ab, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_63:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 89: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_80_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_80_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb8d, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc02c  ! 92: LDXA_R	ldxa	[%r31, %r12] 0x01, %r18
splash_lsu_80_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x33526812, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_80_67:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x80, %r16
ibp_startwait80_67:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_67
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_67:
    brnz %r16, ibp_wait80_67
    ld [%r23], %r16
    ba ibp_startwait80_67
    mov 0x80, %r16
continue_ibp_80_67:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_67:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_67
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_67:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_67
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_67:
    best_set_reg(0x00000040b9fe4b94,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe497c029  ! 94: LDUHA_R	lduha	[%r31, %r9] 0x01, %r18
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 96: CASA_R	casa	[%r31] %asi, %r16, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_69)+24, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_69)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_80_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9816b74  ! 97: WR_SET_SOFTINT_I	wr	%r5, 0x0b74, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_70) + 40, 16, 16)) -> intp(1,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_70)&0xffffffff) + 8, 16, 16)) -> intp(6,0,22,,,,,1)
#else
	set 0xafd01f39, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_70:
	.word 0x95a249d4  ! 98: FDIVd	fdivd	%f40, %f20, %f10
fpinit_80_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8228f  ! 99: PREFETCHA_I	prefetcha	[%r0, + 0x028f] %asi, #one_read
splash_lsu_80_72:
	nop
	ta T_CHANGE_HPRIV
	set 0x56cd396b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ticken_80_73:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0x53672f119fbbaea9, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0xa5b480f4  ! 101: EDGE16LN	edge16ln	%r18, %r20, %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00a  ! 102: CASA_R	casa	[%r31] %asi, %r10, %r11
	nop
	mov 0x80, %g3
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
invtsb_80_75:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	.word 0xe19fdc00  ! 105: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_80_77:
	nop
	ta T_CHANGE_HPRIV
	set 0xece8419f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x22cb0001  ! 1: BRZ	brz,a,pt	%r12,<label_0xb0001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdf20  ! 107: STDFA_R	stda	%f16, [%r0, %r31]
cmp_80_78:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_78:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_78
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_78:
    brnz,a %r10, cmp_wait80_78
    ld [%r23], %r10
    ba cmp_startwait80_78
    mov 0x80, %r10
continue_cmp_80_78:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_78
    mov 59, %r17
    best_set_reg(0x84ec48351a966b79, %r16, %r17)
cmp_multi_core_80_78:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91918010  ! 108: WRPR_PIL_R	wrpr	%r6, %r16, %pil
splash_lsu_80_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xb84ffc99, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd960  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
	bvc  	 skip_80_80
	ba  	 skip_80_80
.align 128
skip_80_80:
	.word 0x39400001  ! 111: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc3e0  ! 112: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_81:
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe060  ! 114: STDFA_I	stda	%f0, [0x0060, %r31]
	nop
	mov 0x80, %g3
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_80_82:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_80_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cmp_80_84:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_84:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_84
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_84:
    brnz,a %r10, cmp_wait80_84
    ld [%r23], %r10
    ba cmp_startwait80_84
    mov 0x80, %r10
continue_cmp_80_84:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_84
    mov 0xe1, %r17
    best_set_reg(0x4653c94ab63ca68f, %r16, %r17)
cmp_multi_core_80_84:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191800b  ! 118: WRPR_PIL_R	wrpr	%r6, %r11, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_85)+24, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_85)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_80_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98533a8  ! 119: WR_SET_SOFTINT_I	wr	%r20, 0x13a8, %set_softint
cwp_80_86:
    set user_data_start, %o7
	.word 0x93902006  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %r13, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_87-donret_80_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cdd000 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x98d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r11+%r0], %g1
	done
donretarg_80_87:
	.word 0xe66fe13c  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x013c]
invtsb_80_88:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0x9545c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xc19fdc00  ! 125: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 126: RDPC	rd	%pc, %r20
cmp_80_90:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_90:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_90
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_90:
    brnz,a %r10, cmp_wait80_90
    ld [%r23], %r10
    ba cmp_startwait80_90
    mov 0x80, %r10
continue_cmp_80_90:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_90
    mov 0x68, %r17
    best_set_reg(0x6ceb81a2ca3b526e, %r16, %r17)
cmp_multi_core_80_90:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a00174  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_91)+32, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_91)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_80_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9846b2b  ! 128: WR_SET_SOFTINT_I	wr	%r17, 0x0b2b, %set_softint
memptr_80_92:
	set 0x60340000, %r31
	.word 0x8584258f  ! 129: WRCCR_I	wr	%r16, 0x058f, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_93:
	.word 0xa7b4c4c3  ! 130: FCMPNE32	fcmpne32	%d50, %d34, %r19
splash_tick_80_94:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x435ae92b637f0328, %r16, %r17)
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_80_95:
	set 0x60540000, %r31
	.word 0x8581b230  ! 132: WRCCR_I	wr	%r6, 0x1230, %ccr
splash_hpstate_80_96:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81983415  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1415, %hpstate
jmptr_80_97:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	bgu,a	 skip_80_98
	stxa %r7, [%r0] ASI_LSU_CONTROL
	fbuge,a,pn	%fcc0,  skip_80_98
	stxa %r17, [%r0] ASI_LSU_CONTROL
.align 128
skip_80_98:
	.word 0xd3e7c020  ! 135: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x8d903041  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1041, %pstate
cmp_80_100:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_100:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_100
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_100:
    brnz,a %r10, cmp_wait80_100
    ld [%r23], %r10
    ba cmp_startwait80_100
    mov 0x80, %r10
continue_cmp_80_100:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_100
    mov 0x8a, %r17
    best_set_reg(0x226e9bb71c5a9c2e, %r16, %r17)
cmp_multi_core_80_100:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa3a00170  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 138: CASA_R	casa	[%r31] %asi, %r11, %r16
ticken_80_102:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0x240ea2c9565d48a4, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0xa5b400eb  ! 139: EDGE16LN	edge16ln	%r16, %r11, %r18
splash_lsu_80_103:
	nop
	ta T_CHANGE_HPRIV
	set 0x30af08ce, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x956c400c  ! 141: SDIVX_R	sdivx	%r17, %r12, %r10
	.word 0xc19fe000  ! 142: LDDFA_I	ldda	[%r31, 0x0000], %f0
cmp_80_104:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    xor %r9, 0x80, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x80, %r9         ! My core mask
#endif
    mov 0x80, %r10
cmp_startwait80_104:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_104
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_104:
    brnz,a %r10, cmp_wait80_104
    ld [%r23], %r10
    ba cmp_startwait80_104
    mov 0x80, %r10
continue_cmp_80_104:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_104
    mov 36, %r17
    best_set_reg(0x24675290b57af9e5, %r16, %r17)
cmp_multi_core_80_104:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91950006  ! 143: WRPR_PIL_R	wrpr	%r20, %r6, %pil
splash_hpstate_80_105:
	ta T_CHANGE_NONHPRIV
	.word 0x81983ba4  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ba4, %hpstate
splash_tick_80_106:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x3deb81030a93c6eb, %r16, %r17)
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x80, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 146: CASA_R	casa	[%r31] %asi, %r12, %r8
fpinit_80_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 147: FDIVd	fdivd	%f0, %f4, %f8
intveclr_80_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb0d314e1ba80279a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_80_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe050  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0050]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd09fe1e0  ! 149: LDDA_I	ldda	[%r31, + 0x01e0] %asi, %r8
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d903cbf  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x1cbf, %pstate
# 953 "diag.j.pp"
cmpenall_80_112:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
    mov 0xff, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0xff, %r9                   ! My core mask
#endif
cmpenall_startwait80_112:
    mov 0x80, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_80_112
    nop
cmpenall_wait80_112:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait80_112
    nop
    ba,a cmpenall_startwait80_112
continue_cmpenall_80_112:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_80_112:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_80_112
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_80_112:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_80_112
    ldxa [0x58]%asi, %r16       !Running_status
    st %g0, [%r23]              !clear lock
#if  (MULTIPASS > 0)
multipass_check_mt:
    rd %asi, %r12
    wr %g0, ASI_SCRATCHPAD, %asi
    ldxa [0x38]%asi, %r10
    cmp  %r10, MULTIPASS
    inc %r10
    stxa %r10, [0x38]%asi
    be finish_diag
    wr %g0, %r12, %asi
lock_sync_thds_again:
    mov 0xff, %r10
    set sync_thr_counter4, %r23
#ifndef SPC
    add %o2,%r9,%r23            !Core's sync counter
#endif
    st %r10, [%r23]             !lock sync_thr_counter4
    add %r23, 64, %r23
    st %r10, [%r23]             !lock sync_thr_counter5
    add %r23, 64, %r23
    st %r10, [%r23]             !lock sync_thr_counter6
    ba fork_threads
    wrpr %g0, %g0, %gl
#endif
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e022  ! 1: STX_I	stx	%r20, [%r31 + 0x0022]
br_longdelay4_40_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902000  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe93fe00c  ! 3: STDF_I	std	%f20, [0x000c, %r31]
fpinit_40_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 4: FCMPLE32	fcmple32	%d0, %d4, %r6
splash_lsu_40_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xaf0ecd73, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_3:
	.word 0x81982c1f  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1f, %hpstate
memptr_40_4:
	set 0x60740000, %r31
	.word 0x85836c23  ! 7: WRCCR_I	wr	%r13, 0x0c23, %ccr
	nop
	mov 0x80, %g3
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe19fe1c0  ! 9: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfc2c0  ! 11: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_40_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa42, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe180  ! 12: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_40_7:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb0ffffffa4, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_9:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 17: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0x87802020  ! 18: WRASI_I	wr	%r0, 0x0020, %asi
splash_lsu_40_11:
	nop
	ta T_CHANGE_HPRIV
	set 0x3915a99d, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe078  ! 20: STDF_I	std	%f20, [0x0078, %r31]
brcommon1_40_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7cc  ! 1: PDIST	pdistn	%d62, %d12, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8022aa  ! 21: SIR	sir	0x02aa
splash_lsu_40_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x95677068, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc19fd920  ! 23: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc1bfdf20  ! 24: STDFA_R	stda	%f0, [%r0, %r31]
pmu_40_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbeffffffa8, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x91a449d1  ! 1: FDIVd	fdivd	%f48, %f48, %f8
intvec_40_15:
	.word 0x95a409c6  ! 26: FDIVd	fdivd	%f16, %f6, %f10
	.word 0x91908008  ! 27: WRPR_PIL_R	wrpr	%r2, %r8, %pil
	nop
	mov 0x80, %g3
	stxa %r18, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_17)+32, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_17)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_40_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9852418  ! 29: WR_SET_SOFTINT_I	wr	%r20, 0x0418, %set_softint
	.word 0xa5a00161  ! 30: FABSq	dis not found

	.word 0x93a00166  ! 31: FABSq	dis not found

tagged_40_20:
	tsubcctv %r13, 0x1bc6, %r17
	.word 0xd807e0a4  ! 32: LDUW_I	lduw	[%r31 + 0x00a4], %r12
mondo_40_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d940014  ! 33: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0xb1830013  ! 34: WR_STICK_REG_R	wr	%r12, %r19, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00c  ! 35: CASA_R	casa	[%r31] %asi, %r12, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00c  ! 36: CASA_R	casa	[%r31] %asi, %r12, %r12
splash_tba_40_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_40_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xfea700d7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_26) + 48, 16, 16)) -> intp(7,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_26)&0xffffffff) + 48, 16, 16)) -> intp(0,0,2,,,,,1)
#else
	set 0x6cc0f16b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_40_26:
	.word 0xc36afd54  ! 39: PREFETCH_I	prefetch	[%r11 + 0xfffffd54], #one_read
	.word 0xd727e0b4  ! 40: STF_I	st	%f11, [0x00b4, %r31]
	.word 0xd627e07c  ! 41: STW_I	stw	%r11, [%r31 + 0x007c]
jmptr_40_27:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_40_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3af, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b047d3  ! 44: PDIST	pdistn	%d32, %d50, %d10
pmu_40_29:
	nop
	setx 0xffffffb8ffffffa2, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_40_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe3e7e010  ! 46: CASA_R	casa	[%r31] %asi, %r16, %r17
brcommon3_40_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe150  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x0150]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r13, [%r0] ASI_LSU_CONTROL
	.word 0xa1aac831  ! 47: FMOVGE	fmovs	%fcc1, %f17, %f16
brcommon3_40_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e1a0  ! 1: STQF_I	-	%f11, [0x01a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6dfc032  ! 48: LDXA_R	ldxa	[%r31, %r18] 0x01, %r11
	nop
	mov 0x80, %g3
	.word 0x2cc98001  ! 1: BRGZ	brgz,a,pt	%r6,<label_0x98001>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_33-donret_40_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c2b300 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6ed, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	ldx [%r11+%r0], %g1
	done
donretarg_40_33:
	.word 0x3d400001  ! 50: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_34) + 56, 16, 16)) -> intp(1,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_34)&0xffffffff) + 56, 16, 16)) -> intp(3,0,29,,,,,1)
#else
	set 0x34900460, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_34:
	.word 0x9f8026ad  ! 51: SIR	sir	0x06ad
	.word 0xe927e056  ! 52: STF_I	st	%f20, [0x0056, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_40_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
iaw_40_36:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x40, %r16
iaw_startwait40_36:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_36
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_36:
    brnz %r16, iaw_wait40_36
    ld [%r23], %r16
    ba iaw_startwait40_36
    mov 0x40, %r16
continue_iaw_40_36:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_36:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_36
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_36:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_36
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_36:
	mov 0x38, %r18
iaw2_40_36:
	rdpr %tba, %r19
	mov 0x320,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91b047c9  ! 55: PDIST	pdistn	%d32, %d40, %d8
ibp_40_37:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x93a309b3  ! 56: FDIVs	fdivs	%f12, %f19, %f9
brcommon3_40_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e180  ! 1: STQF_I	-	%f20, [0x0180, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe89fe170  ! 57: LDDA_I	ldda	[%r31, + 0x0170] %asi, %r20
ibp_40_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec4026  ! 58: PREFETCHA_R	prefetcha	[%r17, %r6] 0x01, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_40-donret_40_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00720d00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x179f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r12+%r0], %g1
	retry
donretarg_40_40:
	.word 0x2cccc001  ! 59: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
memptr_40_41:
	set 0x60540000, %r31
	.word 0x8580bab6  ! 60: WRCCR_I	wr	%r2, 0x1ab6, %ccr
	nop
	mov 0x80, %g3
	stxa %r20, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xa753c000  ! 62: RDPR_FQ	<illegal instruction>
	fbo skip_40_42
	brlez,pt  	%r19, skip_40_42
.align 1024
skip_40_42:
	.word 0x9ba4c9d4  ! 63: FDIVd	fdivd	%f50, %f20, %f44
	fbn skip_40_43
	stxa %r18, [%r0] ASI_LSU_CONTROL
	brlz,pn  	%r19, skip_40_43
	stxa %r14, [%r0] ASI_LSU_CONTROL
.align 1024
skip_40_43:
	.word 0xc36fe1fc  ! 64: PREFETCH_I	prefetch	[%r31 + 0x01fc], #one_read
	.word 0xe19fc3e0  ! 65: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_44:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 66: RDPC	rd	%pc, %r13
mondo_40_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d914013  ! 67: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0xa7a00167  ! 68: FABSq	dis not found

	.word 0x9190c00d  ! 69: WRPR_PIL_R	wrpr	%r3, %r13, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_49)+24, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_49)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_40_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9853678  ! 71: WR_SET_SOFTINT_I	wr	%r20, 0x1678, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_50) + 0, 16, 16)) -> intp(5,0,27,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_50)&0xffffffff) + 8, 16, 16)) -> intp(7,0,13,,,,,1)
#else
	set 0xa690fcb6, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa9b404d0  ! 1: FCMPNE32	fcmpne32	%d16, %d16, %r20
intvec_40_50:
	.word 0x39400001  ! 72: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %r12, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 75: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x91940014  ! 76: WRPR_PIL_R	wrpr	%r16, %r20, %pil
pmu_40_54:
	nop
	setx 0xffffffb1ffffffa8, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_40_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 78: FDIVs	fdivs	%f0, %f4, %f8
jmptr_40_56:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %r20, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa1b500f2  ! 81: EDGE16LN	edge16ln	%r20, %r18, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_58) + 32, 16, 16)) -> intp(0,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_58)&0xffffffff) + 24, 16, 16)) -> intp(3,0,12,,,,,1)
#else
	set 0xe590a6f0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803b73  ! 1: SIR	sir	0x1b73
intvec_40_58:
	.word 0x39400001  ! 82: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 83: CASA_R	casa	[%r31] %asi, %r19, %r18
fpinit_40_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 84: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x87802088  ! 85: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc19fc2c0  ! 86: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_40_61:
	nop
	ta T_CHANGE_HPRIV
	set 0xc65b759f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_62:
	nop
	ta T_CHANGE_HPRIV
	set 0xa69cd245, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_63:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_40_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_40_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe75, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe49fe1c0  ! 92: LDDA_I	ldda	[%r31, + 0x01c0] %asi, %r18
splash_lsu_40_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x98e5fef9, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_40_67:
	nop
	.word 0xe5e7e00d  ! 94: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 96: CASA_R	casa	[%r31] %asi, %r20, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_69)+8, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_69)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_40_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9846428  ! 97: WR_SET_SOFTINT_I	wr	%r17, 0x0428, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_70) + 24, 16, 16)) -> intp(6,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_70)&0xffffffff) + 32, 16, 16)) -> intp(7,0,9,,,,,1)
#else
	set 0xc5c0a343, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_70:
	.word 0xa7a509d4  ! 98: FDIVd	fdivd	%f20, %f20, %f50
fpinit_40_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 99: FDIVs	fdivs	%f0, %f4, %f4
splash_lsu_40_72:
	nop
	ta T_CHANGE_HPRIV
	set 0xf9ce3466, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7b240f3  ! 101: EDGE16LN	edge16ln	%r9, %r19, %r19
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 102: CASA_R	casa	[%r31] %asi, %r12, %r11
	nop
	mov 0x80, %g3
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
iaw_40_76:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x40, %r16
iaw_startwait40_76:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_76
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_76:
    brnz %r16, iaw_wait40_76
    ld [%r23], %r16
    ba iaw_startwait40_76
    mov 0x40, %r16
continue_iaw_40_76:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_76:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_76
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_76:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_76
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_76:
	mov 0x38, %r18
iaw2_40_76:
	rdpr %tba, %r19
	mov 0x21,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 105: STDFA_R	stda	%f0, [%r0, %r31]
splash_lsu_40_77:
	nop
	ta T_CHANGE_HPRIV
	set 0xa9a409f2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 107: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9194c00d  ! 108: WRPR_PIL_R	wrpr	%r19, %r13, %pil
splash_lsu_40_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xc35f7384, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
	ba,a	 skip_40_80
	fbo,a,pn	%fcc0,  skip_40_80
.align 128
skip_40_80:
	.word 0x39400001  ! 111: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfd920  ! 112: STDFA_R	stda	%f16, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_81:
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe100  ! 114: STDFA_I	stda	%f16, [0x0100, %r31]
	nop
	mov 0x80, %g3
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_40_82:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_40_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91944012  ! 118: WRPR_PIL_R	wrpr	%r17, %r18, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_85)+0, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_85)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_40_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa980b7b3  ! 119: WR_SET_SOFTINT_I	wr	%r2, 0x17b3, %set_softint
cwp_40_86:
    set user_data_start, %o7
	.word 0x93902002  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %r20, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_87-donret_40_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001cb200 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x155, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r11+%r0], %g1
	done
donretarg_40_87:
	.word 0xe66fe0b6  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x00b6]
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0x9b45c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xe19fd960  ! 125: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_89:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 126: RDPC	rd	%pc, %r9
	.word 0x93a00164  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_91)+24, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_91)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_40_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98533d8  ! 128: WR_SET_SOFTINT_I	wr	%r20, 0x13d8, %set_softint
memptr_40_92:
	set 0x60740000, %r31
	.word 0x85846400  ! 129: WRCCR_I	wr	%r17, 0x0400, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_93:
	.word 0xc36c6283  ! 130: PREFETCH_I	prefetch	[%r17 + 0x0283], #one_read
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_40_95:
	set 0x60740000, %r31
	.word 0x8584fc58  ! 132: WRCCR_I	wr	%r19, 0x1c58, %ccr
splash_hpstate_40_96:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x81982b9d  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
jmptr_40_97:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	fbge skip_40_98
	stxa %r9, [%r0] ASI_LSU_CONTROL
	.word 0xa3b304cb  ! 1: FCMPNE32	fcmpne32	%d12, %d42, %r17
	stxa %r9, [%r0] ASI_LSU_CONTROL
.align 128
skip_40_98:
	.word 0xc32fc000  ! 135: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0x8d902511  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x0511, %pstate
	.word 0xa1a00171  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 138: CASA_R	casa	[%r31] %asi, %r8, %r16
	.word 0xa3b480e5  ! 139: EDGE16LN	edge16ln	%r18, %r5, %r17
splash_lsu_40_103:
	nop
	ta T_CHANGE_HPRIV
	set 0x17ac0964, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5688012  ! 141: SDIVX_R	sdivx	%r2, %r18, %r18
	.word 0xc19fe000  ! 142: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0x91944004  ! 143: WRPR_PIL_R	wrpr	%r17, %r4, %pil
splash_hpstate_40_105:
	ta T_CHANGE_NONHPRIV
	.word 0x81983c15  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c15, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x40, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 146: CASA_R	casa	[%r31] %asi, %r19, %r8
fpinit_40_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 147: FDIVd	fdivd	%f0, %f4, %f8
intveclr_40_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbc2e70680e78965b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_40_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe0e0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x00e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd0bfc028  ! 149: STDA_R	stda	%r8, [%r31 + %r8] 0x01
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x8d903212  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x1212, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e039  ! 1: STX_I	stx	%r20, [%r31 + 0x0039]
br_longdelay4_20_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902003  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe93fe1e6  ! 3: STDF_I	std	%f20, [0x01e6, %r31]
fpinit_20_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 4: FDIVd	fdivd	%f0, %f4, %f4
splash_lsu_20_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x1fd74ff7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_3:
	.word 0x81982cc5  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc5, %hpstate
memptr_20_4:
	set 0x60540000, %r31
	.word 0x8584ac98  ! 7: WRCCR_I	wr	%r18, 0x0c98, %ccr
	nop
	mov 0x80, %g3
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xc19fe040  ! 9: LDDFA_I	ldda	[%r31, 0x0040], %f0
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfd960  ! 11: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_20_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc51, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe080  ! 12: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_20_7:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb4ffffffae, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_9:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x87802010  ! 18: WRASI_I	wr	%r0, 0x0010, %asi
splash_lsu_20_11:
	nop
	ta T_CHANGE_HPRIV
	set 0x1e119b37, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe070  ! 20: STDF_I	std	%f20, [0x0070, %r31]
brcommon1_20_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7ca  ! 1: PDIST	pdistn	%d62, %d10, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87a90a45  ! 21: FCMPd	fcmpd	%fcc<n>, %f4, %f36
splash_lsu_20_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x9ab8abb5, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc19fde00  ! 23: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc1bfc2c0  ! 24: STDFA_R	stda	%f0, [%r0, %r31]
pmu_20_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb5ffffffaa, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f802193  ! 1: SIR	sir	0x0193
intvec_20_15:
	.word 0x9f8027e2  ! 26: SIR	sir	0x07e2
	.word 0x91948014  ! 27: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	nop
	mov 0x80, %g3
	stxa %r14, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_17)+0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_17)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_20_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98461da  ! 29: WR_SET_SOFTINT_I	wr	%r17, 0x01da, %set_softint
	.word 0x97a0016d  ! 30: FABSq	dis not found

	.word 0xa1a0016c  ! 31: FABSq	dis not found

tagged_20_20:
	tsubcctv %r7, 0x1ca8, %r18
	.word 0xd807e0f4  ! 32: LDUW_I	lduw	[%r31 + 0x00f4], %r12
mondo_20_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 33: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xb184800b  ! 34: WR_STICK_REG_R	wr	%r18, %r11, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 35: CASA_R	casa	[%r31] %asi, %r11, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 36: CASA_R	casa	[%r31] %asi, %r19, %r12
splash_tba_20_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_20_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xd9511c57, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_26) + 16, 16, 16)) -> intp(5,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_26)&0xffffffff) + 24, 16, 16)) -> intp(1,0,10,,,,,1)
#else
	set 0xbc004129, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802b4d  ! 1: SIR	sir	0x0b4d
intvec_20_26:
	.word 0x9f803215  ! 39: SIR	sir	0x1215
	.word 0xd727e095  ! 40: STF_I	st	%f11, [0x0095, %r31]
	.word 0xd627e076  ! 41: STW_I	stw	%r11, [%r31 + 0x0076]
jmptr_20_27:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_20_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1ca1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b0c7cd  ! 44: PDIST	pdistn	%d34, %d44, %d12
pmu_20_29:
	nop
	setx 0xffffffb5ffffffa9, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_20_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c034  ! 1: CASA_I	casa	[%r31] 0x 1, %r20, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe31fe170  ! 46: LDDF_I	ldd	[%r31, 0x0170], %f17
brcommon3_20_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe170  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x0170]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r9, [%r0] ASI_LSU_CONTROL
	.word 0x91aac825  ! 47: FMOVGE	fmovs	%fcc1, %f5, %f8
brcommon3_20_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e010  ! 1: STQF_I	-	%f11, [0x0010, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6bfc029  ! 48: STDA_R	stda	%r11, [%r31 + %r9] 0x01
	nop
	mov 0x80, %g3
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_33-donret_20_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0044f600 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	ldx [%r11+%r0], %g1
	done
donretarg_20_33:
	.word 0x2e800001  ! 50: BVS	bvs,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_34) + 56, 16, 16)) -> intp(6,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_34)&0xffffffff) + 24, 16, 16)) -> intp(7,0,22,,,,,1)
#else
	set 0x5fd0898c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_34:
	.word 0xa9a4c9d1  ! 51: FDIVd	fdivd	%f50, %f48, %f20
	.word 0xe927e172  ! 52: STF_I	st	%f20, [0x0172, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_20_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5a409a1  ! 55: FDIVs	fdivs	%f16, %f1, %f18
ibp_20_37:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3e88028  ! 56: PREFETCHA_R	prefetcha	[%r2, %r8] 0x01, #one_read
brcommon3_20_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e050  ! 1: STQF_I	-	%f20, [0x0050, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe91fe0b0  ! 57: LDDF_I	ldd	[%r31, 0x00b0], %f20
ibp_20_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97a509ad  ! 58: FDIVs	fdivs	%f20, %f13, %f11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_40-donret_20_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eb8800 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa4b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r12+%r0], %g1
	retry
donretarg_20_40:
	.word 0x3c800001  ! 59: BPOS	bpos,a	<label_0x1>
memptr_20_41:
	set 0x60140000, %r31
	.word 0x8584b307  ! 60: WRCCR_I	wr	%r18, 0x1307, %ccr
	nop
	mov 0x80, %g3
	stxa %r10, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x9953c000  ! 62: RDPR_FQ	<illegal instruction>
	brnz,pn  	%r8, skip_20_42
	.word 0x97a049c5  ! 1: FDIVd	fdivd	%f32, %f36, %f42
.align 1024
skip_20_42:
	.word 0x39400001  ! 63: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbne skip_20_43
	stxa %r13, [%r0] ASI_LSU_CONTROL
	fbl skip_20_43
	stxa %r8, [%r0] ASI_LSU_CONTROL
.align 1024
skip_20_43:
	.word 0xc30fc000  ! 64: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0xc19fdc00  ! 65: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_44:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 66: RDPC	rd	%pc, %r16
mondo_20_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d940014  ! 67: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0xa7a00173  ! 68: FABSq	dis not found

	.word 0x91940001  ! 69: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_49)+8, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_49)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_20_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9847665  ! 71: WR_SET_SOFTINT_I	wr	%r17, 0x1665, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_50) + 0, 16, 16)) -> intp(2,0,0,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_50)&0xffffffff) + 56, 16, 16)) -> intp(4,0,11,,,,,1)
#else
	set 0xff2038dd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802b9c  ! 1: SIR	sir	0x0b9c
intvec_20_50:
	.word 0x9ba409d0  ! 72: FDIVd	fdivd	%f16, %f16, %f44
invtsb_20_51:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %r10, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 75: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x91950014  ! 76: WRPR_PIL_R	wrpr	%r20, %r20, %pil
pmu_20_54:
	nop
	setx 0xffffffbcffffffa0, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_20_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 78: FDIVd	fdivd	%f0, %f4, %f6
jmptr_20_56:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %r14, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x91b040f0  ! 81: EDGE16LN	edge16ln	%r1, %r16, %r8
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_58) + 24, 16, 16)) -> intp(2,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_58)&0xffffffff) + 16, 16, 16)) -> intp(6,0,2,,,,,1)
#else
	set 0x35e01f10, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x99a309c9  ! 1: FDIVd	fdivd	%f12, %f40, %f12
intvec_20_58:
	.word 0xc36a6d47  ! 82: PREFETCH_I	prefetch	[%r9 + 0x0d47], #one_read
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 83: CASA_R	casa	[%r31] %asi, %r16, %r18
fpinit_20_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 84: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x87802010  ! 85: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe19fdc00  ! 86: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_20_61:
	nop
	ta T_CHANGE_HPRIV
	set 0xe8abe0ee, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_62:
	nop
	ta T_CHANGE_HPRIV
	set 0x6a11bae6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_63:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 89: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x22c98001  ! 1: BRZ	brz,a,pt	%r6,<label_0x98001>
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_20_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_20_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa85, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fe0e0  ! 92: LDDF_I	ldd	[%r31, 0x00e0], %f18
splash_lsu_20_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x48610697, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_20_67:
	nop
	.word 0xe51fe1d0  ! 94: LDDF_I	ldd	[%r31, 0x01d0], %f18
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 96: CASA_R	casa	[%r31] %asi, %r16, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_69)+0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_69)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_20_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981221e  ! 97: WR_SET_SOFTINT_I	wr	%r4, 0x021e, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_70) + 40, 16, 16)) -> intp(4,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_70)&0xffffffff) + 32, 16, 16)) -> intp(7,0,15,,,,,1)
#else
	set 0xfd0086e9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_70:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 99: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_20_72:
	nop
	ta T_CHANGE_HPRIV
	set 0xa9749179, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9bb040f1  ! 101: EDGE16LN	edge16ln	%r1, %r17, %r13
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 102: CASA_R	casa	[%r31] %asi, %r8, %r11
	nop
	mov 0x80, %g3
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
invtsb_20_75:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	.word 0xe19fdc00  ! 105: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_20_77:
	nop
	ta T_CHANGE_HPRIV
	set 0xf30efe17, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdb60  ! 107: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91948001  ! 108: WRPR_PIL_R	wrpr	%r18, %r1, %pil
splash_lsu_20_79:
	nop
	ta T_CHANGE_HPRIV
	set 0x2a66ded0, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdb60  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
	ble,a	 skip_20_80
	fblg skip_20_80
.align 128
skip_20_80:
	.word 0x93a489c8  ! 111: FDIVd	fdivd	%f18, %f8, %f40
	.word 0xc1bfc2c0  ! 112: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_81:
	.word 0x9f80391f  ! 113: SIR	sir	0x191f
	.word 0xe1bfe0a0  ! 114: STDFA_I	stda	%f16, [0x00a0, %r31]
	nop
	mov 0x80, %g3
	.word 0x22cd0001  ! 1: BRZ	brz,a,pt	%r20,<label_0xd0001>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_20_82:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_20_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91928011  ! 118: WRPR_PIL_R	wrpr	%r10, %r17, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_85)+8, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_85)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_20_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981e559  ! 119: WR_SET_SOFTINT_I	wr	%r7, 0x0559, %set_softint
cwp_20_86:
    set user_data_start, %o7
	.word 0x93902003  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %r14, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_87-donret_20_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f24300 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x347, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r11+%r0], %g1
	done
donretarg_20_87:
	.word 0xe66fe019  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x0019]
invtsb_20_88:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0x9745c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xc19fde00  ! 125: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 126: RDPC	rd	%pc, %r18
	.word 0xa7a00171  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_91)+0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_91)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_20_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9836ca2  ! 128: WR_SET_SOFTINT_I	wr	%r13, 0x0ca2, %set_softint
memptr_20_92:
	set 0x60540000, %r31
	.word 0x85806323  ! 129: WRCCR_I	wr	%r1, 0x0323, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_93:
	.word 0x93b0c4c9  ! 130: FCMPNE32	fcmpne32	%d34, %d40, %r9
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_20_95:
	set 0x60140000, %r31
	.word 0x8584bc28  ! 132: WRCCR_I	wr	%r18, 0x1c28, %ccr
splash_hpstate_20_96:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8198368f  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x168f, %hpstate
jmptr_20_97:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	bleu,a	 skip_20_98
	stxa %r11, [%r0] ASI_LSU_CONTROL
	.word 0x9f80367d  ! 1: SIR	sir	0x167d
	stxa %r16, [%r0] ASI_LSU_CONTROL
.align 128
skip_20_98:
	.word 0xc32fc000  ! 135: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0x8d9030e8  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x10e8, %pstate
	.word 0x99a00168  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 138: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xa7b140e7  ! 139: EDGE16LN	edge16ln	%r5, %r7, %r19
splash_lsu_20_103:
	nop
	ta T_CHANGE_HPRIV
	set 0x86b1693a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95684011  ! 141: SDIVX_R	sdivx	%r1, %r17, %r10
	.word 0xe19fe000  ! 142: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0x91940001  ! 143: WRPR_PIL_R	wrpr	%r16, %r1, %pil
splash_hpstate_20_105:
	ta T_CHANGE_NONHPRIV
	.word 0x81983d8f  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8f, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x20, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 146: CASA_R	casa	[%r31] %asi, %r11, %r8
fpinit_20_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 147: FDIVs	fdivs	%f0, %f4, %f8
intveclr_20_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe83f03ce9e2cda7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_20_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe030  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0030]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fe060  ! 149: LDDF_I	ldd	[%r31, 0x0060], %f8
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a23  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x1a23, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e0ba  ! 1: STX_I	stx	%r20, [%r31 + 0x00ba]
br_longdelay4_10_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902002  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe93fe0a8  ! 3: STDF_I	std	%f20, [0x00a8, %r31]
fpinit_10_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 4: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_10_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xd444aa0e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_3:
	.word 0x81983f1b  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1b, %hpstate
memptr_10_4:
	set 0x60540000, %r31
	.word 0x8584abeb  ! 7: WRCCR_I	wr	%r18, 0x0beb, %ccr
	nop
	mov 0x80, %g3
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe19fe040  ! 9: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfc3e0  ! 11: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_10_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf0d, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdf20  ! 12: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_10_7:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbcffffffac, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_9:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 17: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x87802058  ! 18: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_10_11:
	nop
	ta T_CHANGE_HPRIV
	set 0xe6b9acc4, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe169  ! 20: STDF_I	std	%f20, [0x0169, %r31]
brcommon1_10_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c9  ! 1: PDIST	pdistn	%d62, %d40, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87aa8a51  ! 21: FCMPd	fcmpd	%fcc<n>, %f10, %f48
splash_lsu_10_13:
	nop
	ta T_CHANGE_HPRIV
	set 0xb6e197a2, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd960  ! 23: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfda00  ! 24: STDFA_R	stda	%f16, [%r0, %r31]
pmu_10_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb1ffffffad, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa7a349d4  ! 1: FDIVd	fdivd	%f44, %f20, %f50
intvec_10_15:
	.word 0x95b144d4  ! 26: FCMPNE32	fcmpne32	%d36, %d20, %r10
	.word 0x91944012  ! 27: WRPR_PIL_R	wrpr	%r17, %r18, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_17)+24, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_17)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_10_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9852545  ! 29: WR_SET_SOFTINT_I	wr	%r20, 0x0545, %set_softint
	.word 0xa7a00161  ! 30: FABSq	dis not found

	.word 0xa3a00167  ! 31: FABSq	dis not found

tagged_10_20:
	tsubcctv %r6, 0x1575, %r16
	.word 0xd807e1d1  ! 32: LDUW_I	lduw	[%r31 + 0x01d1], %r12
mondo_10_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 33: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xb181800b  ! 34: WR_STICK_REG_R	wr	%r6, %r11, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 35: CASA_R	casa	[%r31] %asi, %r11, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 36: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_tba_10_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_10_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x7295da7d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_26) + 40, 16, 16)) -> intp(6,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_26)&0xffffffff) + 48, 16, 16)) -> intp(2,0,27,,,,,1)
#else
	set 0xe58091ce, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9ba489c3  ! 1: FDIVd	fdivd	%f18, %f34, %f44
intvec_10_26:
	.word 0xa7b284d0  ! 39: FCMPNE32	fcmpne32	%d10, %d16, %r19
	.word 0xd727e0e0  ! 40: STF_I	st	%f11, [0x00e0, %r31]
	.word 0xd627e09e  ! 41: STW_I	stw	%r11, [%r31 + 0x009e]
jmptr_10_27:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_10_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1ee4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b487c4  ! 44: PDIST	pdistn	%d18, %d4, %d42
pmu_10_29:
	nop
	setx 0xffffffb5ffffffa7, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_10_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe29fe1c0  ! 46: LDDA_I	ldda	[%r31, + 0x01c0] %asi, %r17
brcommon3_10_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe0d0  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x00d0]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r12, [%r0] ASI_LSU_CONTROL
	.word 0x95aac830  ! 47: FMOVGE	fmovs	%fcc1, %f16, %f10
brcommon3_10_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e160  ! 1: STQF_I	-	%f11, [0x0160, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd69fc032  ! 48: LDDA_R	ldda	[%r31, %r18] 0x01, %r11
	nop
	mov 0x80, %g3
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_33-donret_10_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00454600 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x190f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	ldx [%r11+%r0], %g1
	done
donretarg_10_33:
	.word 0x26c98001  ! 50: BRLZ	brlz,a,pt	%r6,<label_0x98001>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_34) + 48, 16, 16)) -> intp(6,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_34)&0xffffffff) + 48, 16, 16)) -> intp(4,0,19,,,,,1)
#else
	set 0xcfb0985c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_34:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe927e123  ! 52: STF_I	st	%f20, [0x0123, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_10_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc3ea0023  ! 55: PREFETCHA_R	prefetcha	[%r8, %r3] 0x01, #one_read
ibp_10_37:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa7a349c7  ! 56: FDIVd	fdivd	%f44, %f38, %f50
brcommon3_10_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e0f0  ! 1: STQF_I	-	%f20, [0x00f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe8dfc032  ! 57: LDXA_R	ldxa	[%r31, %r18] 0x01, %r20
ibp_10_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5702576  ! 58: POPC_I	popc	0x0576, %r18
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_40-donret_10_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e23500 | (54 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f5e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r12+%r0], %g1
	retry
donretarg_10_40:
	.word 0x27400001  ! 59: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
memptr_10_41:
	set 0x60140000, %r31
	.word 0x8584f3df  ! 60: WRCCR_I	wr	%r19, 0x13df, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xa953c000  ! 62: RDPR_FQ	<illegal instruction>
	.word 0x9ba049cc  ! 63: FDIVd	fdivd	%f32, %f12, %f44
	.word 0xc36fe052  ! 64: PREFETCH_I	prefetch	[%r31 + 0x0052], #one_read
	.word 0xe19fd960  ! 65: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_44:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 66: RDPC	rd	%pc, %r17
mondo_10_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d914001  ! 67: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0xa5a00165  ! 68: FABSq	dis not found

	.word 0x91950012  ! 69: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_49)+0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_49)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_10_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984b66f  ! 71: WR_SET_SOFTINT_I	wr	%r18, 0x166f, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_50) + 56, 16, 16)) -> intp(3,0,27,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_50)&0xffffffff) + 32, 16, 16)) -> intp(1,0,17,,,,,1)
#else
	set 0x2da06a2d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_10_50:
	.word 0x39400001  ! 72: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 75: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x91944011  ! 76: WRPR_PIL_R	wrpr	%r17, %r17, %pil
pmu_10_54:
	nop
	setx 0xffffffbcffffffa8, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_10_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b59  ! 78: PREFETCHA_I	prefetcha	[%r0, + 0x0b59] %asi, #one_read
jmptr_10_56:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa9b300f0  ! 81: EDGE16LN	edge16ln	%r12, %r16, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_58) + 24, 16, 16)) -> intp(3,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_58)&0xffffffff) + 16, 16, 16)) -> intp(3,0,20,,,,,1)
#else
	set 0xc706138, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_10_58:
	.word 0x9f802b35  ! 82: SIR	sir	0x0b35
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 83: CASA_R	casa	[%r31] %asi, %r17, %r18
fpinit_10_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 84: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x8780201c  ! 85: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe19fdf20  ! 86: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_10_61:
	nop
	ta T_CHANGE_HPRIV
	set 0xbb0bac49, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_62:
	nop
	ta T_CHANGE_HPRIV
	set 0x6b94383a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_63:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 89: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_10_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_10_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xddf, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fe070  ! 92: LDDF_I	ldd	[%r31, 0x0070], %f18
splash_lsu_10_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x7e537379, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_10_67:
	nop
	.word 0xe5e7e008  ! 94: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 96: CASA_R	casa	[%r31] %asi, %r10, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_69)+8, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_69)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_10_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa982e29f  ! 97: WR_SET_SOFTINT_I	wr	%r11, 0x029f, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_70) + 56, 16, 16)) -> intp(0,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_70)&0xffffffff) + 56, 16, 16)) -> intp(4,0,24,,,,,1)
#else
	set 0xe8b05005, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_70:
	.word 0x97b0c4c2  ! 98: FCMPNE32	fcmpne32	%d34, %d2, %r11
fpinit_10_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 99: FDIVd	fdivd	%f0, %f4, %f4
splash_lsu_10_72:
	nop
	ta T_CHANGE_HPRIV
	set 0xbcb37f43, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3b340f4  ! 101: EDGE16LN	edge16ln	%r13, %r20, %r17
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 102: CASA_R	casa	[%r31] %asi, %r12, %r11
	nop
	mov 0x80, %g3
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	.word 0xe1bfc2c0  ! 105: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_10_77:
	nop
	ta T_CHANGE_HPRIV
	set 0x64c258e9, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdf20  ! 107: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91948011  ! 108: WRPR_PIL_R	wrpr	%r18, %r17, %pil
splash_lsu_10_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xfb87e10c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdc00  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x99b344c7  ! 111: FCMPNE32	fcmpne32	%d44, %d38, %r12
	.word 0xe1bfc3e0  ! 112: STDFA_R	stda	%f16, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_81:
	.word 0x91a409d2  ! 113: FDIVd	fdivd	%f16, %f18, %f8
	.word 0xe1bfe0e0  ! 114: STDFA_I	stda	%f16, [0x00e0, %r31]
	nop
	mov 0x80, %g3
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_10_82:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_10_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91914012  ! 118: WRPR_PIL_R	wrpr	%r5, %r18, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_85)+8, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_85)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_10_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa982a580  ! 119: WR_SET_SOFTINT_I	wr	%r10, 0x0580, %set_softint
cwp_10_86:
    set user_data_start, %o7
	.word 0x93902005  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_87-donret_10_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00710100 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x109f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r11+%r0], %g1
	done
donretarg_10_87:
	.word 0xe66fe0a9  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x00a9]
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0x9345c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xe19fde00  ! 125: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_89:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 126: RDPC	rd	%pc, %r12
	.word 0xa3a00174  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_91)+32, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_91)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_10_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98331ba  ! 128: WR_SET_SOFTINT_I	wr	%r12, 0x11ba, %set_softint
memptr_10_92:
	set 0x60740000, %r31
	.word 0x8584be90  ! 129: WRCCR_I	wr	%r18, 0x1e90, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_93:
	.word 0xc36caf4d  ! 130: PREFETCH_I	prefetch	[%r18 + 0x0f4d], #one_read
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_10_95:
	set 0x60340000, %r31
	.word 0x8584e87d  ! 132: WRCCR_I	wr	%r19, 0x087d, %ccr
splash_hpstate_10_96:
	.word 0x26ca4001  ! 1: BRLZ	brlz,a,pt	%r9,<label_0xa4001>
	.word 0x81983d97  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d97, %hpstate
jmptr_10_97:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd3e7c020  ! 135: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x8d903af5  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1af5, %pstate
	.word 0x99a00171  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 138: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xa9b0c0e6  ! 139: EDGE16LN	edge16ln	%r3, %r6, %r20
splash_lsu_10_103:
	nop
	ta T_CHANGE_HPRIV
	set 0x9951c12a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x996b4011  ! 141: SDIVX_R	sdivx	%r13, %r17, %r12
	.word 0xc19fe060  ! 142: LDDFA_I	ldda	[%r31, 0x0060], %f0
	.word 0x9194400a  ! 143: WRPR_PIL_R	wrpr	%r17, %r10, %pil
splash_hpstate_10_105:
	ta T_CHANGE_NONHPRIV
	.word 0x819821cd  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cd, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x10, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 146: CASA_R	casa	[%r31] %asi, %r17, %r8
fpinit_10_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 147: FDIVs	fdivs	%f0, %f4, %f4
intveclr_10_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x18ce3ecde50394c5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_10_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1b0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01b0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd13fc00b  ! 149: STDF_R	std	%f8, [%r11, %r31]
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d90368d  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x168d, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e039  ! 1: STX_I	stx	%r20, [%r31 + 0x0039]
br_longdelay4_8_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902005  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe93fe1b1  ! 3: STDF_I	std	%f20, [0x01b1, %r31]
fpinit_8_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 4: FDIVs	fdivs	%f0, %f4, %f8
splash_lsu_8_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xec7cd304, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_3:
	.word 0x819824d5  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d5, %hpstate
memptr_8_4:
	set 0x60740000, %r31
	.word 0x85852cd0  ! 7: WRCCR_I	wr	%r20, 0x0cd0, %ccr
	nop
	mov 0x80, %g3
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe19fe1c0  ! 9: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfdc00  ! 11: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_8_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0x981, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 12: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_8_7:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb9ffffffa2, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_9:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e009  ! 17: CASA_R	casa	[%r31] %asi, %r9, %r20
	.word 0x87802055  ! 18: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_8_11:
	nop
	ta T_CHANGE_HPRIV
	set 0x693f31f2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe001  ! 20: STDF_I	std	%f20, [0x0001, %r31]
brcommon1_8_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d2  ! 1: PDIST	pdistn	%d62, %d18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8021b2  ! 21: SIR	sir	0x01b2
splash_lsu_8_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x8321efe4, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd960  ! 23: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfdc00  ! 24: STDFA_R	stda	%f16, [%r0, %r31]
pmu_8_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb0ffffffab, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa7a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f50
intvec_8_15:
	.word 0xa9a109d3  ! 26: FDIVd	fdivd	%f4, %f50, %f20
	.word 0x91914007  ! 27: WRPR_PIL_R	wrpr	%r5, %r7, %pil
	nop
	mov 0x80, %g3
	stxa %r7, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_17)+40, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_17)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_8_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9853de9  ! 29: WR_SET_SOFTINT_I	wr	%r20, 0x1de9, %set_softint
	.word 0xa5a00172  ! 30: FABSq	dis not found

	.word 0x95a00164  ! 31: FABSq	dis not found

tagged_8_20:
	tsubcctv %r18, 0x13eb, %r13
	.word 0xd807e1e8  ! 32: LDUW_I	lduw	[%r31 + 0x01e8], %r12
mondo_8_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d90800c  ! 33: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
	.word 0xb180c013  ! 34: WR_STICK_REG_R	wr	%r3, %r19, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 35: CASA_R	casa	[%r31] %asi, %r9, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 36: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_tba_8_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_8_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x7e939dc3, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_26) + 0, 16, 16)) -> intp(0,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_26)&0xffffffff) + 32, 16, 16)) -> intp(1,0,5,,,,,1)
#else
	set 0x5880bcab, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc368aeb1  ! 1: PREFETCH_I	prefetch	[%r2 + 0x0eb1], #one_read
intvec_8_26:
	.word 0x9f803c22  ! 39: SIR	sir	0x1c22
	.word 0xd727e077  ! 40: STF_I	st	%f11, [0x0077, %r31]
	.word 0xd627e05e  ! 41: STW_I	stw	%r11, [%r31 + 0x005e]
jmptr_8_27:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_8_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1b03, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b247d2  ! 44: PDIST	pdistn	%d40, %d18, %d12
pmu_8_29:
	nop
	setx 0xffffffb4ffffffa7, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_8_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe31fc00c  ! 46: LDDF_R	ldd	[%r31, %r12], %f17
brcommon3_8_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe0c0  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x00c0]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r7, [%r0] ASI_LSU_CONTROL
	.word 0x97aac832  ! 47: FMOVGE	fmovs	%fcc1, %f18, %f11
brcommon3_8_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e180  ! 1: STQF_I	-	%f11, [0x0180, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc014  ! 48: STXFSR_R	st-sfr	%f1, [%r20, %r31]
	nop
	mov 0x80, %g3
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_33-donret_8_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002c4800 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x645, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	ldx [%r11+%r0], %g1
	done
donretarg_8_33:
	.word 0x2f400001  ! 50: FBPU	fbu,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_34) + 48, 16, 16)) -> intp(3,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_34)&0xffffffff) + 8, 16, 16)) -> intp(0,0,26,,,,,1)
#else
	set 0xb10cc4f, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_34:
	.word 0xc369fb4d  ! 51: PREFETCH_I	prefetch	[%r7 + 0xfffffb4d], #one_read
	.word 0xe927e1b0  ! 52: STF_I	st	%f20, [0x01b0, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_8_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
iaw_8_36:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x8, %r16
iaw_startwait8_36:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_36
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_36:
    brnz %r16, iaw_wait8_36
    ld [%r23], %r16
    ba iaw_startwait8_36
    mov 0x8, %r16
continue_iaw_8_36:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_36:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_36
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_36:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_36
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_36:
	mov 0x38, %r18
iaw2_8_36:
	rdpr %tba, %r19
	mov 0x320,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97b40486  ! 55: FCMPLE32	fcmple32	%d16, %d6, %r11
ibp_8_37:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3703380  ! 56: POPC_I	popc	0x1380, %r17
brcommon3_8_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e0b0  ! 1: STQF_I	-	%f20, [0x00b0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe9e7e00b  ! 57: CASA_R	casa	[%r31] %asi, %r11, %r20
ibp_8_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3a409b0  ! 58: FDIVs	fdivs	%f16, %f16, %f17
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_40-donret_8_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dea800 | (48 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ad7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r12+%r0], %g1
	retry
donretarg_8_40:
	.word 0x25400001  ! 59: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_8_41:
	set 0x60340000, %r31
	.word 0x85847b29  ! 60: WRCCR_I	wr	%r17, 0x1b29, %ccr
	nop
	mov 0x80, %g3
	stxa %r14, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x9153c000  ! 62: RDPR_FQ	<illegal instruction>
	fbu skip_8_42
	fbuge,a,pn	%fcc0,  skip_8_42
.align 1024
skip_8_42:
	.word 0x87a8ca44  ! 63: FCMPd	fcmpd	%fcc<n>, %f34, %f4
	fbg,a,pn	%fcc0,  skip_8_43
	stxa %r18, [%r0] ASI_LSU_CONTROL
	fbug,a,pn	%fcc0,  skip_8_43
	stxa %r15, [%r0] ASI_LSU_CONTROL
.align 1024
skip_8_43:
	.word 0xc30fc000  ! 64: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0xc19fc2c0  ! 65: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_44:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 66: RDPC	rd	%pc, %r11
mondo_8_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d94000c  ! 67: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0xa7a00161  ! 68: FABSq	dis not found

	.word 0x91948004  ! 69: WRPR_PIL_R	wrpr	%r18, %r4, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_49)+56, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_49)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_8_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981f201  ! 71: WR_SET_SOFTINT_I	wr	%r7, 0x1201, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_50) + 0, 16, 16)) -> intp(7,0,18,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_50)&0xffffffff) + 40, 16, 16)) -> intp(6,0,9,,,,,1)
#else
	set 0x1370c2f8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36b7245  ! 1: PREFETCH_I	prefetch	[%r13 + 0xfffff245], #one_read
intvec_8_50:
	.word 0x39400001  ! 72: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %r15, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 75: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0x9190c010  ! 76: WRPR_PIL_R	wrpr	%r3, %r16, %pil
pmu_8_54:
	nop
	setx 0xffffffb2ffffffaa, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_8_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 78: FCMPLE32	fcmple32	%d0, %d4, %r6
jmptr_8_56:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %r12, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x95b340e3  ! 81: EDGE16LN	edge16ln	%r13, %r3, %r10
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_58) + 0, 16, 16)) -> intp(2,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_58)&0xffffffff) + 0, 16, 16)) -> intp(0,0,22,,,,,1)
#else
	set 0xef10d61c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36c6e5a  ! 1: PREFETCH_I	prefetch	[%r17 + 0x0e5a], #one_read
intvec_8_58:
	.word 0x39400001  ! 82: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 83: CASA_R	casa	[%r31] %asi, %r11, %r18
fpinit_8_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 84: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x87802058  ! 85: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe19fda00  ! 86: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_8_61:
	nop
	ta T_CHANGE_HPRIV
	set 0x545d1ace, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_62:
	nop
	ta T_CHANGE_HPRIV
	set 0x6fca9ccd, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_63:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 89: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_8_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_8_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa50, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc030  ! 92: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
splash_lsu_8_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x6af7fe68, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_8_67:
	nop
	.word 0x9f8021d0  ! 94: SIR	sir	0x01d0
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 96: CASA_R	casa	[%r31] %asi, %r17, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_69)+16, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_69)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_8_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984f071  ! 97: WR_SET_SOFTINT_I	wr	%r19, 0x1071, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_70) + 56, 16, 16)) -> intp(3,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_70)&0xffffffff) + 56, 16, 16)) -> intp(3,0,12,,,,,1)
#else
	set 0x8600f0f4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_70:
	.word 0x97a349d3  ! 98: FDIVd	fdivd	%f44, %f50, %f42
fpinit_8_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8228f  ! 99: PREFETCHA_I	prefetcha	[%r0, + 0x028f] %asi, #one_read
splash_lsu_8_72:
	nop
	ta T_CHANGE_HPRIV
	set 0x58edda22, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97b140e3  ! 101: EDGE16LN	edge16ln	%r5, %r3, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 102: CASA_R	casa	[%r31] %asi, %r17, %r11
	nop
	mov 0x80, %g3
	.word 0x24ccc001  ! 1: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
iaw_8_76:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x8, %r16
iaw_startwait8_76:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_76
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_76:
    brnz %r16, iaw_wait8_76
    ld [%r23], %r16
    ba iaw_startwait8_76
    mov 0x8, %r16
continue_iaw_8_76:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_76:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_76
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_76:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_76
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_76:
	mov 0x38, %r18
iaw2_8_76:
	rdpr %tba, %r19
	mov 0x211,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe0e0  ! 105: LDDFA_I	ldda	[%r31, 0x00e0], %f16
splash_lsu_8_77:
	nop
	ta T_CHANGE_HPRIV
	set 0x5ac702d2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 107: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91948012  ! 108: WRPR_PIL_R	wrpr	%r18, %r18, %pil
splash_lsu_8_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xf499e51d, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2ac84001  ! 1: BRNZ	brnz,a,pt	%r1,<label_0x84001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
	bl  	 skip_8_80
	fbule skip_8_80
.align 128
skip_8_80:
	.word 0x24ca0001  ! 111: BRLEZ	brlez,a,pt	%r8,<label_0xa0001>
	.word 0xc1bfde00  ! 112: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_81:
	.word 0xa7b404d4  ! 113: FCMPNE32	fcmpne32	%d16, %d20, %r19
	.word 0xc1bfe080  ! 114: STDFA_I	stda	%f0, [0x0080, %r31]
	nop
	mov 0x80, %g3
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_8_82:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_8_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9191800d  ! 118: WRPR_PIL_R	wrpr	%r6, %r13, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_85)+48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_85)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_8_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa980e138  ! 119: WR_SET_SOFTINT_I	wr	%r3, 0x0138, %set_softint
cwp_8_86:
    set user_data_start, %o7
	.word 0x93902000  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %r9, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_87-donret_8_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007cab00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x19ef, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r11+%r0], %g1
	done
donretarg_8_87:
	.word 0xe66fe156  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x0156]
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0x9345c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xe19fdf20  ! 125: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_89:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 126: RDPC	rd	%pc, %r12
	.word 0x95a00169  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_91)+0, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_91)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_8_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9846abb  ! 128: WR_SET_SOFTINT_I	wr	%r17, 0x0abb, %set_softint
memptr_8_92:
	set 0x60740000, %r31
	.word 0x8584beb0  ! 129: WRCCR_I	wr	%r18, 0x1eb0, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_93:
	.word 0x9f803ec7  ! 130: SIR	sir	0x1ec7
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_8_95:
	set 0x60140000, %r31
	.word 0x8584eb63  ! 132: WRCCR_I	wr	%r19, 0x0b63, %ccr
splash_hpstate_8_96:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81982c2e  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c2e, %hpstate
jmptr_8_97:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	bgu  	 skip_8_98
	stxa %r7, [%r0] ASI_LSU_CONTROL
	.word 0x87ac0a4a  ! 1: FCMPd	fcmpd	%fcc<n>, %f16, %f10
	stxa %r19, [%r0] ASI_LSU_CONTROL
.align 128
skip_8_98:
	.word 0xc36fe183  ! 135: PREFETCH_I	prefetch	[%r31 + 0x0183], #one_read
	.word 0x8d90268f  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x068f, %pstate
	.word 0xa5a00162  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 138: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x93b400e3  ! 139: EDGE16LN	edge16ln	%r16, %r3, %r9
splash_lsu_8_103:
	nop
	ta T_CHANGE_HPRIV
	set 0xeb246eb6, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91690005  ! 141: SDIVX_R	sdivx	%r4, %r5, %r8
	.word 0xe19fe1a0  ! 142: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0x9191400c  ! 143: WRPR_PIL_R	wrpr	%r5, %r12, %pil
splash_hpstate_8_105:
	ta T_CHANGE_NONHPRIV
	.word 0x81982f4f  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x8, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 146: CASA_R	casa	[%r31] %asi, %r9, %r8
fpinit_8_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 147: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_8_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0c1fd3e3cd6f6159, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_8_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1b0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01b0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fc00d  ! 149: LDDF_R	ldd	[%r31, %r13], %f8
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d902841  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x0841, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e062  ! 1: STX_I	stx	%r20, [%r31 + 0x0062]
br_longdelay4_4_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902002  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe93fe1a2  ! 3: STDF_I	std	%f20, [0x01a2, %r31]
fpinit_4_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 4: FCMPLE32	fcmple32	%d0, %d4, %r6
splash_lsu_4_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xdbcc1111, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_3:
	.word 0x81983596  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1596, %hpstate
memptr_4_4:
	set 0x60140000, %r31
	.word 0x85852ada  ! 7: WRCCR_I	wr	%r20, 0x0ada, %ccr
	nop
	mov 0x80, %g3
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xc19fe1a0  ! 9: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc1bfc2c0  ! 11: STDFA_R	stda	%f0, [%r0, %r31]
dvapa_4_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0xff1, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0c0  ! 12: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_4_7:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb2ffffffa2, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_9:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x87802083  ! 18: WRASI_I	wr	%r0, 0x0083, %asi
splash_lsu_4_11:
	nop
	ta T_CHANGE_HPRIV
	set 0xff6ddb18, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe0b4  ! 20: STDF_I	std	%f20, [0x00b4, %r31]
brcommon1_4_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7cc  ! 1: PDIST	pdistn	%d62, %d12, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa970317a  ! 21: POPC_I	popc	0x117a, %r20
splash_lsu_4_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x4db7d8f2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd920  ! 23: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfde00  ! 24: STDFA_R	stda	%f16, [%r0, %r31]
pmu_4_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb0ffffffaa, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa5b284d3  ! 1: FCMPNE32	fcmpne32	%d10, %d50, %r18
intvec_4_15:
	.word 0x99b304d4  ! 26: FCMPNE32	fcmpne32	%d12, %d20, %r12
	.word 0x91924004  ! 27: WRPR_PIL_R	wrpr	%r9, %r4, %pil
	nop
	mov 0x80, %g3
	stxa %r11, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_17)+32, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_17)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_4_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981e7d2  ! 29: WR_SET_SOFTINT_I	wr	%r7, 0x07d2, %set_softint
	.word 0x99a00161  ! 30: FABSq	dis not found

	.word 0xa9a00173  ! 31: FABSq	dis not found

tagged_4_20:
	tsubcctv %r2, 0x1fb3, %r20
	.word 0xd807e05c  ! 32: LDUW_I	lduw	[%r31 + 0x005c], %r12
mondo_4_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 33: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xb181000a  ! 34: WR_STICK_REG_R	wr	%r4, %r10, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e008  ! 35: CASA_R	casa	[%r31] %asi, %r8, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 36: CASA_R	casa	[%r31] %asi, %r18, %r12
splash_tba_4_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xbc467e9a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_26) + 32, 16, 16)) -> intp(1,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_26)&0xffffffff) + 48, 16, 16)) -> intp(3,0,8,,,,,1)
#else
	set 0xf230b67c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3b1c4d2  ! 1: FCMPNE32	fcmpne32	%d38, %d18, %r17
intvec_4_26:
	.word 0xa7b0c4c1  ! 39: FCMPNE32	fcmpne32	%d34, %d32, %r19
	.word 0xd727e1c4  ! 40: STF_I	st	%f11, [0x01c4, %r31]
	.word 0xd627e0d0  ! 41: STW_I	stw	%r11, [%r31 + 0x00d0]
jmptr_4_27:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_4_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3803, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b307d3  ! 44: PDIST	pdistn	%d12, %d50, %d40
pmu_4_29:
	nop
	setx 0xffffffb9ffffffa9, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_4_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe23fe0b0  ! 46: STD_I	std	%r17, [%r31 + 0x00b0]
brcommon3_4_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe120  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x0120]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r20, [%r0] ASI_LSU_CONTROL
	.word 0x95aac831  ! 47: FMOVGE	fmovs	%fcc1, %f17, %f10
brcommon3_4_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e0b0  ! 1: STQF_I	-	%f11, [0x00b0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd697c02c  ! 48: LDUHA_R	lduha	[%r31, %r12] 0x01, %r11
	nop
	mov 0x80, %g3
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_33-donret_4_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ef8200 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	ldx [%r11+%r0], %g1
	done
donretarg_4_33:
	.word 0x2d400001  ! 50: FBPG	fbg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_34) + 16, 16, 16)) -> intp(0,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_34)&0xffffffff) + 16, 16, 16)) -> intp(0,0,10,,,,,1)
#else
	set 0x6d8059fd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_34:
	.word 0x39400001  ! 51: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe927e03c  ! 52: STF_I	st	%f20, [0x003c, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_4_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1a509d0  ! 55: FDIVd	fdivd	%f20, %f16, %f16
ibp_4_37:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x4, %r16
ibp_startwait4_37:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_37
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_37:
    brnz %r16, ibp_wait4_37
    ld [%r23], %r16
    ba ibp_startwait4_37
    mov 0x4, %r16
continue_ibp_4_37:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_37:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_37
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_37:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_37
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_37:
    best_set_reg(0x00000040bec00be4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87ad0a4c  ! 56: FCMPd	fcmpd	%fcc<n>, %f20, %f12
brcommon3_4_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e170  ! 1: STQF_I	-	%f20, [0x0170, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc012  ! 57: STXFSR_R	st-sfr	%f1, [%r18, %r31]
ibp_4_39:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x4, %r16
ibp_startwait4_39:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_39
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_39:
    brnz %r16, ibp_wait4_39
    ld [%r23], %r16
    ba ibp_startwait4_39
    mov 0x4, %r16
continue_ibp_4_39:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_39:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_39
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_39:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_39
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_39:
    best_set_reg(0x00000040ddcbe4b9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97b34492  ! 58: FCMPLE32	fcmple32	%d44, %d18, %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_40-donret_4_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bc0c00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd1c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r12+%r0], %g1
	retry
donretarg_4_40:
	.word 0x20800001  ! 59: BN	bn,a	<label_0x1>
memptr_4_41:
	set 0x60140000, %r31
	.word 0x85852e02  ! 60: WRCCR_I	wr	%r20, 0x0e02, %ccr
	nop
	mov 0x80, %g3
	stxa %r11, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xa953c000  ! 62: RDPR_FQ	<illegal instruction>
	fbul skip_4_42
	fbuge,a,pn	%fcc0,  skip_4_42
.align 1024
skip_4_42:
	.word 0x24cc8001  ! 63: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	brgez,pt  	%r8, skip_4_43
	stxa %r12, [%r0] ASI_LSU_CONTROL
	be,a	 skip_4_43
	stxa %r9, [%r0] ASI_LSU_CONTROL
.align 1024
skip_4_43:
	.word 0xc32fc000  ! 64: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc19fde00  ! 65: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_44:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 66: RDPC	rd	%pc, %r8
mondo_4_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 67: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x93a00172  ! 68: FABSq	dis not found

	.word 0x9191c004  ! 69: WRPR_PIL_R	wrpr	%r7, %r4, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_49)+24, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_49)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_4_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa980a5e0  ! 71: WR_SET_SOFTINT_I	wr	%r2, 0x05e0, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_50) + 24, 16, 16)) -> intp(4,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_50)&0xffffffff) + 16, 16, 16)) -> intp(2,0,12,,,,,1)
#else
	set 0xc1309bcf, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5a1c9d1  ! 1: FDIVd	fdivd	%f38, %f48, %f18
intvec_4_50:
	.word 0x39400001  ! 72: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %r18, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 75: CASA_R	casa	[%r31] %asi, %r11, %r18
	.word 0x91910005  ! 76: WRPR_PIL_R	wrpr	%r4, %r5, %pil
pmu_4_54:
	nop
	setx 0xffffffb4ffffffa5, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_4_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 78: FCMPLE32	fcmple32	%d0, %d4, %r6
jmptr_4_56:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %r18, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x95b100f4  ! 81: EDGE16LN	edge16ln	%r4, %r20, %r10
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_58) + 40, 16, 16)) -> intp(2,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_58)&0xffffffff) + 48, 16, 16)) -> intp(0,0,15,,,,,1)
#else
	set 0x576099fd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f80250d  ! 1: SIR	sir	0x050d
intvec_4_58:
	.word 0x39400001  ! 82: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 83: CASA_R	casa	[%r31] %asi, %r16, %r18
fpinit_4_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 84: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x87802004  ! 85: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc19fdc00  ! 86: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_4_61:
	nop
	ta T_CHANGE_HPRIV
	set 0x8fa3bbf5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_62:
	nop
	ta T_CHANGE_HPRIV
	set 0xcc708111, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_63:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_4_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_4_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc09, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe497c02c  ! 92: LDUHA_R	lduha	[%r31, %r12] 0x01, %r18
splash_lsu_4_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x31b66568, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2ac84001  ! 1: BRNZ	brnz,a,pt	%r1,<label_0x84001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_4_67:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x4, %r16
ibp_startwait4_67:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_67
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_67:
    brnz %r16, ibp_wait4_67
    ld [%r23], %r16
    ba ibp_startwait4_67
    mov 0x4, %r16
continue_ibp_4_67:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_67:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_67
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_67:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_67
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_67:
    best_set_reg(0x00000040fbe4b944,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe51fc012  ! 94: LDDF_R	ldd	[%r31, %r18], %f18
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 96: CASA_R	casa	[%r31] %asi, %r17, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_69)+56, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_69)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_4_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984a8ac  ! 97: WR_SET_SOFTINT_I	wr	%r18, 0x08ac, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_70) + 56, 16, 16)) -> intp(5,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_70)&0xffffffff) + 0, 16, 16)) -> intp(6,0,30,,,,,1)
#else
	set 0x26a04df1, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_70:
	.word 0xc36ca28f  ! 98: PREFETCH_I	prefetch	[%r18 + 0x028f], #one_read
fpinit_4_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 99: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_4_72:
	nop
	ta T_CHANGE_HPRIV
	set 0x5c75e76c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93b0c0eb  ! 101: EDGE16LN	edge16ln	%r3, %r11, %r9
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e010  ! 102: CASA_R	casa	[%r31] %asi, %r16, %r11
	nop
	mov 0x80, %g3
	.word 0x22c98001  ! 1: BRZ	brz,a,pt	%r6,<label_0x98001>
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	.word 0xe19fd960  ! 105: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_4_77:
	nop
	ta T_CHANGE_HPRIV
	set 0xb60e30ae, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 107: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91918009  ! 108: WRPR_PIL_R	wrpr	%r6, %r9, %pil
splash_lsu_4_79:
	nop
	ta T_CHANGE_HPRIV
	set 0x25aad3df, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x24c84001  ! 1: BRLEZ	brlez,a,pt	%r1,<label_0x84001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfd960  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
	fblg skip_4_80
	fbule skip_4_80
.align 128
skip_4_80:
	.word 0x87ac4a49  ! 111: FCMPd	fcmpd	%fcc<n>, %f48, %f40
	.word 0xc1bfde00  ! 112: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_81:
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe120  ! 114: STDFA_I	stda	%f0, [0x0120, %r31]
	nop
	mov 0x80, %g3
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_4_82:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_4_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9191c001  ! 118: WRPR_PIL_R	wrpr	%r7, %r1, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_85)+24, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_85)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_4_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9817564  ! 119: WR_SET_SOFTINT_I	wr	%r5, 0x1564, %set_softint
cwp_4_86:
    set user_data_start, %o7
	.word 0x93902006  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	nop
	mov 0x80, %g3
	stxa %r8, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_87-donret_4_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00378100 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x40d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r11+%r0], %g1
	done
donretarg_4_87:
	.word 0xe66fe08f  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x008f]
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0xa545c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r18
	.word 0xc19fc3e0  ! 125: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 126: RDPC	rd	%pc, %r17
	.word 0xa5a0016b  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_91)+48, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_91)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_4_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984b933  ! 128: WR_SET_SOFTINT_I	wr	%r18, 0x1933, %set_softint
memptr_4_92:
	set 0x60740000, %r31
	.word 0x8581b570  ! 129: WRCCR_I	wr	%r6, 0x1570, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_93:
	.word 0xc3693d99  ! 130: PREFETCH_I	prefetch	[%r4 + 0xfffffd99], #one_read
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_4_95:
	set 0x60140000, %r31
	.word 0x858171f1  ! 132: WRCCR_I	wr	%r5, 0x11f1, %ccr
splash_hpstate_4_96:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8198259f  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059f, %hpstate
jmptr_4_97:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	bne  	 skip_4_98
	stxa %r13, [%r0] ASI_LSU_CONTROL
	.word 0x87ad0a53  ! 1: FCMPd	fcmpd	%fcc<n>, %f20, %f50
	stxa %r17, [%r0] ASI_LSU_CONTROL
.align 128
skip_4_98:
	.word 0xc36fe024  ! 135: PREFETCH_I	prefetch	[%r31 + 0x0024], #one_read
	.word 0x8d903683  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1683, %pstate
	.word 0xa1a00163  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 138: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0x91b1c0e8  ! 139: EDGE16LN	edge16ln	%r7, %r8, %r8
splash_lsu_4_103:
	nop
	ta T_CHANGE_HPRIV
	set 0xc11d10b1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9768c013  ! 141: SDIVX_R	sdivx	%r3, %r19, %r11
	.word 0xc19fe0e0  ! 142: LDDFA_I	ldda	[%r31, 0x00e0], %f0
	.word 0x9194c006  ! 143: WRPR_PIL_R	wrpr	%r19, %r6, %pil
splash_hpstate_4_105:
	ta T_CHANGE_NONHPRIV
	.word 0x81982ec7  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x4, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 146: CASA_R	casa	[%r31] %asi, %r13, %r8
fpinit_4_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 147: FDIVd	fdivd	%f0, %f4, %f6
intveclr_4_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x79541440b0840665, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_4_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe0a0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x00a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fe060  ! 149: LDDF_I	ldd	[%r31, 0x0060], %f8
	.word 0x2cc8c001  ! 1: BRGZ	brgz,a,pt	%r3,<label_0x8c001>
	.word 0x8d902d27  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x0d27, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e070  ! 1: STX_I	stx	%r20, [%r31 + 0x0070]
br_longdelay4_2_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902003  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe93fe0e0  ! 3: STDF_I	std	%f20, [0x00e0, %r31]
fpinit_2_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 4: FDIVs	fdivs	%f0, %f4, %f6
splash_lsu_2_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xfef774a6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_3:
	.word 0x81983499  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1499, %hpstate
memptr_2_4:
	set 0x60140000, %r31
	.word 0x858129ec  ! 7: WRCCR_I	wr	%r4, 0x09ec, %ccr
	nop
	mov 0x80, %g3
	.word 0x2ec90001  ! 1: BRGEZ	brgez,a,pt	%r4,<label_0x90001>
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xc19fe180  ! 9: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfdc00  ! 11: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_2_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf67, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe120  ! 12: STDFA_I	stda	%f16, [0x0120, %r31]
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_2_7:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb2ffffffa1, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_9:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 17: CASA_R	casa	[%r31] %asi, %r11, %r20
	.word 0x87802014  ! 18: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_2_11:
	nop
	ta T_CHANGE_HPRIV
	set 0x948ea2c5, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe0a7  ! 20: STDF_I	std	%f20, [0x00a7, %r31]
brcommon1_2_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d2  ! 1: PDIST	pdistn	%d62, %d18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3e98027  ! 21: PREFETCHA_R	prefetcha	[%r6, %r7] 0x01, #one_read
splash_lsu_2_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x52a56155, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc19fdb60  ! 23: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc1bfc2c0  ! 24: STDFA_R	stda	%f0, [%r0, %r31]
pmu_2_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb3ffffffa2, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_2_15:
	.word 0xc36c20c9  ! 26: PREFETCH_I	prefetch	[%r16 + 0x00c9], #one_read
	.word 0x91934008  ! 27: WRPR_PIL_R	wrpr	%r13, %r8, %pil
	nop
	mov 0x80, %g3
	stxa %r20, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_17)+56, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_17)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_2_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa980bf53  ! 29: WR_SET_SOFTINT_I	wr	%r2, 0x1f53, %set_softint
	.word 0x99a00168  ! 30: FABSq	dis not found

	.word 0xa7a0016b  ! 31: FABSq	dis not found

tagged_2_20:
	tsubcctv %r18, 0x176d, %r20
	.word 0xd807e1ec  ! 32: LDUW_I	lduw	[%r31 + 0x01ec], %r12
mondo_2_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d91800b  ! 33: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0xb1804012  ! 34: WR_STICK_REG_R	wr	%r1, %r18, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 35: CASA_R	casa	[%r31] %asi, %r16, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 36: CASA_R	casa	[%r31] %asi, %r18, %r12
splash_tba_2_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x439ff524, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_26) + 48, 16, 16)) -> intp(2,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_26)&0xffffffff) + 0, 16, 16)) -> intp(3,0,5,,,,,1)
#else
	set 0x63109a34, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36d38ad  ! 1: PREFETCH_I	prefetch	[%r20 + 0xfffff8ad], #one_read
intvec_2_26:
	.word 0x97a189d3  ! 39: FDIVd	fdivd	%f6, %f50, %f42
	.word 0xd727e192  ! 40: STF_I	st	%f11, [0x0192, %r31]
	.word 0xd627e1f8  ! 41: STW_I	stw	%r11, [%r31 + 0x01f8]
jmptr_2_27:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_2_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x25f0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b147d4  ! 44: PDIST	pdistn	%d36, %d20, %d42
pmu_2_29:
	nop
	setx 0xffffffb1ffffffa7, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_2_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe31fc010  ! 46: LDDF_R	ldd	[%r31, %r16], %f17
brcommon3_2_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe150  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x0150]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r14, [%r0] ASI_LSU_CONTROL
	.word 0xa9aac82c  ! 47: FMOVGE	fmovs	%fcc1, %f12, %f20
brcommon3_2_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e050  ! 1: STQF_I	-	%f11, [0x0050, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd7e7e012  ! 48: CASA_R	casa	[%r31] %asi, %r18, %r11
	nop
	mov 0x80, %g3
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_33-donret_2_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00134900 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b93, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	ldx [%r11+%r0], %g1
	done
donretarg_2_33:
	.word 0x2eca8001  ! 50: BRGEZ	brgez,a,pt	%r10,<label_0xa8001>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_34) + 32, 16, 16)) -> intp(5,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_34)&0xffffffff) + 40, 16, 16)) -> intp(4,0,21,,,,,1)
#else
	set 0x15c0c6cb, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_34:
	.word 0x9f802760  ! 51: SIR	sir	0x0760
	.word 0xe927e0f0  ! 52: STF_I	st	%f20, [0x00f0, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_2_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87acca4b  ! 55: FCMPd	fcmpd	%fcc<n>, %f50, %f42
ibp_2_37:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3a509d3  ! 56: FDIVd	fdivd	%f20, %f50, %f48
brcommon3_2_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e000  ! 1: STQF_I	-	%f20, [0x0000, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe8bfc032  ! 57: STDA_R	stda	%r20, [%r31 + %r18] 0x01
ibp_2_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1702168  ! 58: POPC_I	popc	0x0168, %r16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_40-donret_2_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0004a500 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e75, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r12+%r0], %g1
	retry
donretarg_2_40:
	.word 0x2c800001  ! 59: BNEG	bneg,a	<label_0x1>
memptr_2_41:
	set 0x60140000, %r31
	.word 0x8580a03e  ! 60: WRCCR_I	wr	%r2, 0x003e, %ccr
	nop
	mov 0x80, %g3
	stxa %r20, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x9153c000  ! 62: RDPR_FQ	<illegal instruction>
	bg  	 skip_2_42
	.word 0x9f803aa7  ! 1: SIR	sir	0x1aa7
.align 1024
skip_2_42:
	.word 0x99b444d4  ! 63: FCMPNE32	fcmpne32	%d48, %d20, %r12
	be,a	 skip_2_43
	stxa %r6, [%r0] ASI_LSU_CONTROL
	bn,a	 skip_2_43
	stxa %r10, [%r0] ASI_LSU_CONTROL
.align 1024
skip_2_43:
	.word 0xd9e7c020  ! 64: CASA_I	casa	[%r31] 0x 1, %r0, %r12
	.word 0xc19fde00  ! 65: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_44:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 66: RDPC	rd	%pc, %r16
mondo_2_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d904012  ! 67: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x97a00162  ! 68: FABSq	dis not found

	.word 0x9192c00c  ! 69: WRPR_PIL_R	wrpr	%r11, %r12, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_49)+40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_49)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_2_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984af84  ! 71: WR_SET_SOFTINT_I	wr	%r18, 0x0f84, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_50) + 56, 16, 16)) -> intp(6,0,12,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_50)&0xffffffff) + 24, 16, 16)) -> intp(0,0,21,,,,,1)
#else
	set 0x6170306c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa1a1c9d0  ! 1: FDIVd	fdivd	%f38, %f16, %f16
intvec_2_50:
	.word 0xa5b144c7  ! 72: FCMPNE32	fcmpne32	%d36, %d38, %r18
invtsb_2_51:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %r18, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 75: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x91920009  ! 76: WRPR_PIL_R	wrpr	%r8, %r9, %pil
pmu_2_54:
	nop
	setx 0xffffffb7ffffffae, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_2_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b59  ! 78: PREFETCHA_I	prefetcha	[%r0, + 0x0b59] %asi, #one_read
jmptr_2_56:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %r12, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xa1b180e1  ! 81: EDGE16LN	edge16ln	%r6, %r1, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_58) + 24, 16, 16)) -> intp(3,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_58)&0xffffffff) + 8, 16, 16)) -> intp(3,0,30,,,,,1)
#else
	set 0xd7400f77, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3b344d1  ! 1: FCMPNE32	fcmpne32	%d44, %d48, %r17
intvec_2_58:
	.word 0x9f802142  ! 82: SIR	sir	0x0142
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 83: CASA_R	casa	[%r31] %asi, %r18, %r18
fpinit_2_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 84: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8780201c  ! 85: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xc19fda00  ! 86: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_2_61:
	nop
	ta T_CHANGE_HPRIV
	set 0xc151a1f6, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_62:
	nop
	ta T_CHANGE_HPRIV
	set 0x3318d4f9, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_63:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_2_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_2_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9b1, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe49fe170  ! 92: LDDA_I	ldda	[%r31, + 0x0170] %asi, %r18
splash_lsu_2_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x049a5c83, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_2_67:
	nop
	.word 0xe43fe100  ! 94: STD_I	std	%r18, [%r31 + 0x0100]
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 96: CASA_R	casa	[%r31] %asi, %r20, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_69)+16, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_69)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_2_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9812027  ! 97: WR_SET_SOFTINT_I	wr	%r4, 0x0027, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_70) + 0, 16, 16)) -> intp(7,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_70)&0xffffffff) + 48, 16, 16)) -> intp(5,0,2,,,,,1)
#else
	set 0x2bd03365, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_70:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8228f  ! 99: PREFETCHA_I	prefetcha	[%r0, + 0x028f] %asi, #one_read
splash_lsu_2_72:
	nop
	ta T_CHANGE_HPRIV
	set 0x22ab22ae, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95b340f3  ! 101: EDGE16LN	edge16ln	%r13, %r19, %r10
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 102: CASA_R	casa	[%r31] %asi, %r18, %r11
	nop
	mov 0x80, %g3
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
invtsb_2_75:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	.word 0xc1bfe0a0  ! 105: STDFA_I	stda	%f0, [0x00a0, %r31]
splash_lsu_2_77:
	nop
	ta T_CHANGE_HPRIV
	set 0x6d282347, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd920  ! 107: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91948007  ! 108: WRPR_PIL_R	wrpr	%r18, %r7, %pil
splash_lsu_2_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xa5561caf, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x22c88001  ! 1: BRZ	brz,a,pt	%r2,<label_0x88001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdb60  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
	fbl,a,pn	%fcc0,  skip_2_80
	bge,a	 skip_2_80
.align 128
skip_2_80:
	.word 0x9f802c50  ! 111: SIR	sir	0x0c50
	.word 0xc1bfd960  ! 112: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_2_81:
	.word 0x9f802298  ! 113: SIR	sir	0x0298
	.word 0xe1bfe000  ! 114: STDFA_I	stda	%f16, [0x0000, %r31]
	nop
	mov 0x80, %g3
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_2_82:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_2_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91940006  ! 118: WRPR_PIL_R	wrpr	%r16, %r6, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_85)+56, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_85)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_2_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9817281  ! 119: WR_SET_SOFTINT_I	wr	%r5, 0x1281, %set_softint
cwp_2_86:
    set user_data_start, %o7
	.word 0x93902002  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %r15, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_87-donret_2_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0005df00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r11+%r0], %g1
	done
donretarg_2_87:
	.word 0xe66fe089  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x0089]
invtsb_2_88:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0xa145c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xc19fc2c0  ! 125: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 126: RDPC	rd	%pc, %r20
	.word 0xa1a00173  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_91)+56, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_91)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_2_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984fff1  ! 128: WR_SET_SOFTINT_I	wr	%r19, 0x1ff1, %set_softint
memptr_2_92:
	set 0x60340000, %r31
	.word 0x8584b933  ! 129: WRCCR_I	wr	%r18, 0x1933, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_2_93:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_2_95:
	set 0x60740000, %r31
	.word 0x8584a86b  ! 132: WRCCR_I	wr	%r18, 0x086b, %ccr
splash_hpstate_2_96:
	.word 0x2ecd0001  ! 1: BRGEZ	brgez,a,pt	%r20,<label_0xd0001>
	.word 0x819834d6  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x14d6, %hpstate
jmptr_2_97:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	bne,a	 skip_2_98
	stxa %r18, [%r0] ASI_LSU_CONTROL
	brlez,a,pt	%r19, skip_2_98
	stxa %r8, [%r0] ASI_LSU_CONTROL
.align 128
skip_2_98:
	.word 0xd23fc000  ! 135: STD_R	std	%r9, [%r31 + %r0]
	.word 0x8d903db3  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1db3, %pstate
	.word 0x9ba00170  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 138: CASA_R	casa	[%r31] %asi, %r17, %r16
	.word 0x95b300f2  ! 139: EDGE16LN	edge16ln	%r12, %r18, %r10
splash_lsu_2_103:
	nop
	ta T_CHANGE_HPRIV
	set 0xb6b0d0f0, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93688013  ! 141: SDIVX_R	sdivx	%r2, %r19, %r9
	.word 0xe19fe020  ! 142: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0x91924004  ! 143: WRPR_PIL_R	wrpr	%r9, %r4, %pil
splash_hpstate_2_105:
	ta T_CHANGE_NONHPRIV
	.word 0x81982de7  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0de7, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x2, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 146: CASA_R	casa	[%r31] %asi, %r11, %r8
fpinit_2_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 147: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_2_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x75dfc8e8302f2b6e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_2_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe020  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0020]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd097c029  ! 149: LDUHA_R	lduha	[%r31, %r9] 0x01, %r8
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a7b  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x1a7b, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
    ta T_CHANGE_NONHPRIV 
	.word 0xe877e0f9  ! 1: STX_I	stx	%r20, [%r31 + 0x00f9]
br_longdelay4_1_0:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902003  ! 2: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe93fe1d9  ! 3: STDF_I	std	%f20, [0x01d9, %r31]
fpinit_1_1:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 4: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_1_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x033656e3, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2acc0001  ! 1: BRNZ	brnz,a,pt	%r16,<label_0xc0001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 5: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_3:
	.word 0x81982f66  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f66, %hpstate
memptr_1_4:
	set 0x60540000, %r31
	.word 0x8580bf76  ! 7: WRCCR_I	wr	%r2, 0x1f76, %ccr
	nop
	mov 0x80, %g3
	.word 0x22cc4001  ! 1: BRZ	brz,a,pt	%r17,<label_0xc4001>
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe85fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe19fe1c0  ! 9: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0x89800011  ! 10: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc1bfda00  ! 11: STDFA_R	stda	%f0, [%r0, %r31]
dvapa_1_6:
	nop
	ta T_CHANGE_HPRIV
	mov 0x85c, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe120  ! 12: LDDFA_I	ldda	[%r31, 0x0120], %f0
	.word 0x3c800001  ! 13: BPOS	bpos,a	<label_0x1>
jmptr_1_7:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 14: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_8:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbaffffffac, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_9:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_10:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 17: CASA_R	casa	[%r31] %asi, %r11, %r20
	.word 0x87802082  ! 18: WRASI_I	wr	%r0, 0x0082, %asi
splash_lsu_1_11:
	nop
	ta T_CHANGE_HPRIV
	set 0x159c14d4, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe93fe192  ! 20: STDF_I	std	%f20, [0x0192, %r31]
brcommon1_1_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d1  ! 1: PDIST	pdistn	%d62, %d48, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91a049d3  ! 21: FDIVd	fdivd	%f32, %f50, %f8
splash_lsu_1_13:
	nop
	ta T_CHANGE_HPRIV
	set 0x8a30f39a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 22: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe19fde00  ! 23: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc1bfd920  ! 24: STDFA_R	stda	%f0, [%r0, %r31]
pmu_1_14:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbbffffffa1, %g1, %g7
	.word 0xa3800007  ! 25: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f803e4d  ! 1: SIR	sir	0x1e4d
intvec_1_15:
	.word 0xc36b366e  ! 26: PREFETCH_I	prefetch	[%r12 + 0xfffff66e], #one_read
	.word 0x91948013  ! 27: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85fc000  ! 28: LDX_R	ldx	[%r31 + %r0], %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_17)+0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_17)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_17:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_1_17:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981befc  ! 29: WR_SET_SOFTINT_I	wr	%r6, 0x1efc, %set_softint
	.word 0x93a00165  ! 30: FABSq	dis not found

	.word 0x99a0016a  ! 31: FABSq	dis not found

tagged_1_20:
	tsubcctv %r4, 0x102f, %r20
	.word 0xd807e110  ! 32: LDUW_I	lduw	[%r31 + 0x0110], %r12
mondo_1_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d914001  ! 33: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0xb1848002  ! 34: WR_STICK_REG_R	wr	%r18, %r2, %-
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_22:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e008  ! 35: CASA_R	casa	[%r31] %asi, %r8, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_23:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00c  ! 36: CASA_R	casa	[%r31] %asi, %r12, %r12
splash_tba_1_24:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 37: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xd2da4b5f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 38: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_26) + 16, 16, 16)) -> intp(6,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_26)&0xffffffff) + 48, 16, 16)) -> intp(0,0,30,,,,,1)
#else
	set 0x7b40069e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93b484cc  ! 1: FCMPNE32	fcmpne32	%d18, %d12, %r9
intvec_1_26:
	.word 0x9f8021ae  ! 39: SIR	sir	0x01ae
	.word 0xd727e0b4  ! 40: STF_I	st	%f11, [0x00b4, %r31]
	.word 0xd627e1c0  ! 41: STW_I	stw	%r11, [%r31 + 0x01c0]
jmptr_1_27:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 42: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_1_28:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 43: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x774, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b187d1  ! 44: PDIST	pdistn	%d6, %d48, %d48
pmu_1_29:
	nop
	setx 0xffffffbfffffffac, %g1, %g7
	.word 0xa3800007  ! 45: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_1_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe3e7c02b  ! 1: CASA_I	casa	[%r31] 0x 1, %r11, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe33fc011  ! 46: STDF_R	std	%f17, [%r17, %r31]
brcommon3_1_31:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe26fe1d0  ! 1: LDSTUB_I	ldstub	%r17, [%r31 + 0x01d0]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r6, [%r0] ASI_LSU_CONTROL
	.word 0x97aac833  ! 47: FMOVGE	fmovs	%fcc1, %f19, %f11
brcommon3_1_32:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e1f0  ! 1: STQF_I	-	%f11, [0x01f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6dfc034  ! 48: LDXA_R	ldxa	[%r31, %r20] 0x01, %r11
	nop
	mov 0x80, %g3
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_33:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_33-donret_1_33), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f4d400 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x187, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	ldx [%r11+%r0], %g1
	done
donretarg_1_33:
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_34) + 16, 16, 16)) -> intp(0,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_34)&0xffffffff) + 16, 16, 16)) -> intp(1,0,28,,,,,1)
#else
	set 0x26002252, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_34:
	.word 0x9f803bc1  ! 51: SIR	sir	0x1bc1
	.word 0xe927e114  ! 52: STF_I	st	%f20, [0x0114, %r31]
	.word 0xe8bfc020  ! 53: STDA_R	stda	%r20, [%r31 + %r0] 0x01
splash_tba_1_35:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 54: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa1a489cc  ! 55: FDIVd	fdivd	%f18, %f12, %f16
ibp_1_37:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa970355c  ! 56: POPC_I	popc	0x155c, %r20
brcommon3_1_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e060  ! 1: STQF_I	-	%f20, [0x0060, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe89fc02a  ! 57: LDDA_R	ldda	[%r31, %r10] 0x01, %r20
ibp_1_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ecc031  ! 58: PREFETCHA_R	prefetcha	[%r19, %r17] 0x01, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_40:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_40-donret_1_40+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bdcb00 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe85, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r12+%r0], %g1
	retry
donretarg_1_40:
	.word 0x27400001  ! 59: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
memptr_1_41:
	set 0x60140000, %r31
	.word 0x8584a4cf  ! 60: WRCCR_I	wr	%r18, 0x04cf, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe05fc000  ! 61: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x9753c000  ! 62: RDPR_FQ	<illegal instruction>
	.word 0x39400001  ! 63: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd83fc000  ! 64: STD_R	std	%r12, [%r31 + %r0]
	.word 0xc19fdf20  ! 65: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_44
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_44:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 66: RDPC	rd	%pc, %r16
mondo_1_45:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92c002  ! 67: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
	.word 0xa7a00172  ! 68: FABSq	dis not found

	.word 0x91948009  ! 69: WRPR_PIL_R	wrpr	%r18, %r9, %pil
	.word 0x89800011  ! 70: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_49)+32, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_49)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_49:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_1_49:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9823fa9  ! 71: WR_SET_SOFTINT_I	wr	%r8, 0x1fa9, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_50) + 16, 16, 16)) -> intp(5,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_50)&0xffffffff) + 8, 16, 16)) -> intp(6,0,1,,,,,1)
#else
	set 0x4bd067d0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3a1c9c6  ! 1: FDIVd	fdivd	%f38, %f6, %f48
intvec_1_50:
	.word 0xc368ab59  ! 72: PREFETCH_I	prefetch	[%r2 + 0x0b59], #one_read
invtsb_1_51:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 73: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe45fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r18
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_52:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 75: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x91930005  ! 76: WRPR_PIL_R	wrpr	%r12, %r5, %pil
pmu_1_54:
	nop
	setx 0xffffffb1ffffffaf, %g1, %g7
	.word 0xa3800007  ! 77: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_1_55:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 78: FDIVs	fdivs	%f0, %f4, %f6
jmptr_1_56:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 79: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe45fc000  ! 80: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x97b0c0f4  ! 81: EDGE16LN	edge16ln	%r3, %r20, %r11
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_58) + 48, 16, 16)) -> intp(7,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_58)&0xffffffff) + 56, 16, 16)) -> intp(2,0,22,,,,,1)
#else
	set 0x6070da41, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x97a109d0  ! 1: FDIVd	fdivd	%f4, %f16, %f42
intvec_1_58:
	.word 0xa5a309d4  ! 82: FDIVd	fdivd	%f12, %f20, %f18
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_59:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 83: CASA_R	casa	[%r31] %asi, %r12, %r18
fpinit_1_60:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 84: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x87802055  ! 85: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xc19fdb60  ! 86: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_1_61:
	nop
	ta T_CHANGE_HPRIV
	set 0x3d323ffe, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_62:
	nop
	ta T_CHANGE_HPRIV
	set 0x06827127, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 88: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_63:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 90: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_1_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 91: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_1_65:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa45, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe43fe150  ! 92: STD_I	std	%r18, [%r31 + 0x0150]
splash_lsu_1_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x50c879f9, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_1_67:
	nop
	.word 0xe51fe120  ! 94: LDDF_I	ldd	[%r31, 0x0120], %f18
	.word 0xe527c000  ! 95: STF_R	st	%f18, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_68:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 96: CASA_R	casa	[%r31] %asi, %r13, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_69)+0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_69)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_69:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_1_69:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9822444  ! 97: WR_SET_SOFTINT_I	wr	%r8, 0x0444, %set_softint
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_70) + 8, 16, 16)) -> intp(3,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_70)&0xffffffff) + 8, 16, 16)) -> intp(3,0,25,,,,,1)
#else
	set 0x3a00b98e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_70:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_71:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 99: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_lsu_1_72:
	nop
	ta T_CHANGE_HPRIV
	set 0x50bd6621, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 100: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97b100e5  ! 101: EDGE16LN	edge16ln	%r4, %r5, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_74:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 102: CASA_R	casa	[%r31] %asi, %r11, %r11
	nop
	mov 0x80, %g3
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r11
invtsb_1_75:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	.word 0xe19fe0e0  ! 105: LDDFA_I	ldda	[%r31, 0x00e0], %f16
splash_lsu_1_77:
	nop
	ta T_CHANGE_HPRIV
	set 0x3f9d9c6d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfda00  ! 107: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91940007  ! 108: WRPR_PIL_R	wrpr	%r16, %r7, %pil
splash_lsu_1_79:
	nop
	ta T_CHANGE_HPRIV
	set 0x30003bcb, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x39400001  ! 111: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfd960  ! 112: STDFA_R	stda	%f16, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_1_81:
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe1c0  ! 114: STDFA_I	stda	%f16, [0x01c0, %r31]
	nop
	mov 0x80, %g3
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe65fc000  ! 115: LDX_R	ldx	[%r31 + %r0], %r19
jmptr_1_82:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 116: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_1_83:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 117: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9190c00d  ! 118: WRPR_PIL_R	wrpr	%r3, %r13, %pil
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_85)+40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_85)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_85:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_1_85:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981624f  ! 119: WR_SET_SOFTINT_I	wr	%r5, 0x024f, %set_softint
cwp_1_86:
    set user_data_start, %o7
	.word 0x93902000  ! 120: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe65fc000  ! 121: LDX_R	ldx	[%r31 + %r0], %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_87:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_87-donret_1_87), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008c7200 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1495, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r11+%r0], %g1
	done
donretarg_1_87:
	.word 0xe66fe0ed  ! 122: LDSTUB_I	ldstub	%r19, [%r31 + 0x00ed]
invtsb_1_88:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r21
    wr %r0,ASI_MMU_REAL_RANGE, %asi
    mov 1, %r20
    sllx %r20, 63, %r20
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %r22
    xor %r22 ,%r20, %r22
    stxa %r22,  [ASI_MMU_REAL_RANGE_3] %asi
    wr %r21, %r0, %asi
    ta T_CHANGE_NONHPRIV 
	.word 0x29800001  ! 123: FBL	fbl,a	<label_0x1>
	.word 0xa945c000  ! 124: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xc19fc2c0  ! 125: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
    sllx %o1, 5, %o3    !(CID*256)
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_89
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 126: RDPC	rd	%pc, %r20
	.word 0xa3a00172  ! 127: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_91)+0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_91)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_91:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
	ta T_CHANGE_HPRIV
	rdpr %pstate, %r18
	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
	ldxa [%g0] 0x63, %o1
	mov 1, %r18
	sllx %r18, %o1, %r18
#endif
	mov 0x30, %r19
	setx 0x8900000808, %r16, %r17
	mov 0x2, %r16
xir_1_91:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984e2ab  ! 128: WR_SET_SOFTINT_I	wr	%r19, 0x02ab, %set_softint
memptr_1_92:
	set 0x60140000, %r31
	.word 0x85817d21  ! 129: WRCCR_I	wr	%r5, 0x1d21, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_1_93:
	.word 0x9f8024bb  ! 130: SIR	sir	0x04bb
	.word 0x89800011  ! 131: WRTICK_R	wr	%r0, %r17, %tick
memptr_1_95:
	set 0x60340000, %r31
	.word 0x8584ab62  ! 132: WRCCR_I	wr	%r18, 0x0b62, %ccr
splash_hpstate_1_96:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81983cc8  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc8, %hpstate
jmptr_1_97:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 134: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd23fc000  ! 135: STD_R	std	%r9, [%r31 + %r0]
	.word 0x8d903d91  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1d91, %pstate
	.word 0xa1a00172  ! 137: FABSq	dis not found

    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_101:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 138: CASA_R	casa	[%r31] %asi, %r11, %r16
	.word 0x95b500e5  ! 139: EDGE16LN	edge16ln	%r20, %r5, %r10
splash_lsu_1_103:
	nop
	ta T_CHANGE_HPRIV
	set 0x9ad0ae4e, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91688004  ! 141: SDIVX_R	sdivx	%r2, %r4, %r8
	.word 0xe19fe0e0  ! 142: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x9190c013  ! 143: WRPR_PIL_R	wrpr	%r3, %r19, %pil
splash_hpstate_1_105:
	ta T_CHANGE_NONHPRIV
	.word 0x8198355d  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x155d, %hpstate
	.word 0x89800011  ! 145: WRTICK_R	wr	%r0, %r17, %tick
    nop
    ta T_CHANGE_HPRIV
    mov 0x1, %r10
    set sync_thr_counter6, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_107:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 146: CASA_R	casa	[%r31] %asi, %r20, %r8
fpinit_1_108:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 147: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_1_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe2a00a3be4aedb34, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 148: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_1_110:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe0a0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x00a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd0dfc033  ! 149: LDXA_R	ldxa	[%r31, %r19] 0x01, %r8
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d9025a2  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x05a2, %pstate
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop

join_lbl_0_0:
SECTION .MAIN
.text
diag_finish:
    nop
    nop
    nop
    ta T_CHANGE_HPRIV
#if  (MULTIPASS > 0)
multipass_check:
    rd %asi, %r12
    wr %g0, ASI_SCRATCHPAD, %asi
    ldxa [0x38]%asi, %r10
    cmp  %r10, MULTIPASS
    inc %r10
    stxa %r10, [0x38]%asi
    wr %g0, %r12, %asi
    bne fork_threads
    wrpr %g0, %g0, %gl
#endif
finish_diag:
	best_set_reg(HV_TRAP_BASE_PA, %r1, %r2)
    wrhpr %g2, %g0, %htba
    ta T_GOOD_TRAP
    nop
    nop
    nop
.data
    .xword 0x0
    ! fp data rs1, rs2, fsr, gsr quads ..
.global fp_data_quads
fp_data_quads:
	.xword 0x0044000000000000
	.xword 0x4028000000000000
	.xword 0x0fc0400400000000 
	.xword 0x0000000000000000 
	.xword 0x0041000000000000
	.xword 0x4022000000000000
	.xword 0x0600800000000000 
	.xword 0x0000000000000000 
	.xword 0x0220000000000000
	.xword 0x4140000000000000
	.xword 0x4fc0400400000000 
	.xword 0x0000000000000000 
	.xword 0x4090000000000000
	.xword 0x0090000000000000
	.xword 0x0f80400800000000 
	.xword 0x0a00000000000000 
.align 128
.global user_data_start
.data
user_data_start:

	.xword	0x1a9fcdbccb744441
	.xword	0x4923ec55eedfcf9f
	.xword	0xfbbb08c72ed164de
	.xword	0x20429ff47e90168b
	.xword	0x3886d3e2a255a739
	.xword	0xaf23ee6397c7b60d
	.xword	0xa476b6763a3c0ce8
	.xword	0xe0cd8702efe7b278
	.xword	0x163b56ed2d12f839
	.xword	0x5a2edf8d3dfea00d
	.xword	0x1ee8424a2171d871
	.xword	0xe18b417eb294bd0b
	.xword	0xa5347aac98e5fe0a
	.xword	0x11afac6c3cb2aa9c
	.xword	0x507b636e47637eef
	.xword	0xcc378d0384f0c06e
	.xword	0xc5debcfb70fbd82d
	.xword	0x849d586ba730fab6
	.xword	0x8a300f33efaac39b
	.xword	0x2270a2ed622d0b32
	.xword	0x371510847a4a61f0
	.xword	0xd624f896339d6ead
	.xword	0x6c1353f2cfb2fa2d
	.xword	0x95860f0799cf27bf
	.xword	0xd8b3baa08b005259
	.xword	0x8e0ed9532e7e1c93
	.xword	0xc3cb7add8bade322
	.xword	0x253fe33f260f8b77
	.xword	0x7a49492329de07ac
	.xword	0xd272e2796796129b
	.xword	0x6dfd521b71914b68
	.xword	0xf2175d942d7baf8d
	.xword	0xbe09c31f44ac6683
	.xword	0xff70d6ae04648ec9
	.xword	0xc1348b7b4c451d02
	.xword	0x3980c6605e45e8e5
	.xword	0x300fe8eb12825f99
	.xword	0x5ca6345e393cf75e
	.xword	0x7313b928b19f7ba3
	.xword	0x155a447046672759
	.xword	0xaeb3ec1eb07339e2
	.xword	0xd685ead0b7e368e0
	.xword	0x14f2a13b1e2c3ffd
	.xword	0x582fd1fa2b468f64
	.xword	0x80e09d5e6cf80b0c
	.xword	0x53856a0145ce5e8b
	.xword	0x585a51b852eae910
	.xword	0x8de40adac185235e
	.xword	0xc27142ae74249342
	.xword	0x38d07e6bd85419ae
	.xword	0x5cd170af657eeeae
	.xword	0xdd8aaea13e2c253e
	.xword	0x230472994e6100da
	.xword	0x4fdc3ec62f93316e
	.xword	0xa4a643de54360d84
	.xword	0x3c4e28f572c27383
	.xword	0xfb80b2175556c750
	.xword	0x98028e49b524ecd2
	.xword	0x047178845ad7fa94
	.xword	0xf57bb7da5032c59a
	.xword	0x03683a0f63254881
	.xword	0xff3aa9d32d5a45d4
	.xword	0xb87427630f48b0da
	.xword	0xbb7345ece1b3e5ed
	.xword	0xcc478d30b2917c7b
	.xword	0xaec8accaff9deac2
	.xword	0xf5f3efbcbc642a97
	.xword	0x444f0378fc3de47c
	.xword	0xf7c261549401ce9c
	.xword	0xbd1a7499846e062d
	.xword	0xbdcf09f4b6224bca
	.xword	0xa27b81769dde4a32
	.xword	0xafcf9b3372281cc4
	.xword	0x2705923e3642b9ab
	.xword	0xb33e8f44604d794d
	.xword	0x4fd3a51767a1d76b
	.xword	0x8ed43fb339f085b7
	.xword	0xf5eb37c6f8d94a78
	.xword	0xdb8a4c77679f0f3d
	.xword	0x6a0b94d4ebe4093b
	.xword	0xab66fa80d966c67c
	.xword	0xbbbb1a058cee7376
	.xword	0x15397cd2012f4031
	.xword	0x32e9a6a5b2be349f
	.xword	0x21f6adf329db1d89
	.xword	0xc3c1827b0add6772
	.xword	0xde504da7578ca5ac
	.xword	0xa370e072b23e1ee3
	.xword	0xfc76a2690e04fdb7
	.xword	0x577a4e6fc826009c
	.xword	0x15619b7f12f184fd
	.xword	0x35dffc70c560d787
	.xword	0x3310bc007c2b5884
	.xword	0x606e9f12a60954e1
	.xword	0xacca9430b06be826
	.xword	0xf55b4acd5cecd641
	.xword	0x90e240d1947832fa
	.xword	0x41d24ae881d27473
	.xword	0xe77b90997e64f1cf
	.xword	0x8ca17084ecb9427e
	.xword	0x6cfbe9e942e92e44
	.xword	0xf00b2429c6870d29
	.xword	0xc6137efef07cd453
	.xword	0xd0e3a8474c37c07d
	.xword	0x78a8e9533350b669
	.xword	0x4d34befee1fbb684
	.xword	0xd98ff30c3cef51ca
	.xword	0xcf45ae3249ed6df9
	.xword	0x0c65e29d5175c334
	.xword	0x560f855a159bb5e3
	.xword	0x2d80d9126ad50bc3
	.xword	0xc66377d65035c67f
	.xword	0x9439dc10104d63e3
	.xword	0x96d9a6068f140e7b
	.xword	0xed129f7f68c9202d
	.xword	0x1aecd029290d3242
	.xword	0x21493c12bd397904
	.xword	0x3c2bf43b88776a11
	.xword	0x32d286731926ca92
	.xword	0x656f7c332c5eb998
	.xword	0xebfdcc8db1d5a241
	.xword	0x578746b1413100d5
	.xword	0x0e0b5015c4c89e77
	.xword	0xffac5848f6408a16
	.xword	0xe166aac10cefca43
	.xword	0x3d2e43fbd2df2738
	.xword	0xe16c6956e071be15
	.xword	0xb78a8ef9a05aed4b
	.xword	0x46940738e1bfdca4
	.xword	0x98017aab9a76376e
	.xword	0xf7f3ef35c97f0257
	.xword	0x851ee65f3d1285ad
	.xword	0xe84a1a235249bd73
	.xword	0x0e37f98e22d4c4c3
	.xword	0xd905e6e46f445cf9
	.xword	0xcd2b79e26e0e5b6b
	.xword	0x9da676bdf94862f2
	.xword	0x3c08a7bb5f169110
	.xword	0x9de8d6a4bc02ddac
	.xword	0xbfb5f5862ad0b44e
	.xword	0x420c290d8fae585a
	.xword	0x5f709cda70c260d3
	.xword	0x7752c2d97bc67b23
	.xword	0xd8e1c095ea66e49e
	.xword	0x8e6c3211e1f34e61
	.xword	0x2b8aa7367442a711
	.xword	0x4e7108f695e5e57c
	.xword	0x0e8289117267293a
	.xword	0xc1d058a0aa576d09
	.xword	0xe2c849885d09d9c0
	.xword	0xed65b0e3c444e7ec
	.xword	0x6555ce37eb921ee7
	.xword	0xc7048648605820a4
	.xword	0x8b0b3eb51aab99d0
	.xword	0x5b3cd6f26e730a53
	.xword	0x14f3cd7ccad05ab7
	.xword	0x52118e647416b63b
	.xword	0x19e8e2ea0333398c
	.xword	0x95e93de286eea266
	.xword	0x3c28d5baaeebd835
	.xword	0x2b256ec247ce638d
	.xword	0xbf19167401a1de1e
	.xword	0x69a60f814a665b95
	.xword	0x17f08f9af05e8f00
	.xword	0x3589078da5c7fdfb
	.xword	0xf8d254ae3bb304f3
	.xword	0xf0b43cab159b815c
	.xword	0x9a9c2681c62f6bd9
	.xword	0x959c40fdee70c7d6
	.xword	0x8d49bdd2e798b205
	.xword	0x059cd24b354ba281
	.xword	0x328a90b2948c9323
	.xword	0x299a87834a1027d0
	.xword	0x06ad35655f229098
	.xword	0xb884b15c07f1a436
	.xword	0xa88ed2b8154a181d
	.xword	0x4cdbe53550fc4850
	.xword	0xcfe377c2ffa02a19
	.xword	0xc253f64c905b731f
	.xword	0x55e47d709614c9fe
	.xword	0x444fb17650ed589f
	.xword	0xdf07316098ab8779
	.xword	0x0140b08be865b1ca
	.xword	0xfd62cb6eb43aa5c6
	.xword	0x25d839742723e870
	.xword	0xca7cb3b45c45ccfc
	.xword	0xec14c84e4f5831ca
	.xword	0xa798e5b2f958fc68
	.xword	0x17df5b06d84c617e
	.xword	0x8309d8baa56a2317
	.xword	0xd7b7b5502b67aa1d
	.xword	0x61f12f7687a0be2d
	.xword	0xb71e396af0a32673
	.xword	0xd25e5e814be9669d
	.xword	0x11350756d6ddc42c
	.xword	0x732d97cb1cb43af2
	.xword	0xa156c5da7188f25a
	.xword	0x4a4b95f42a9b8530
	.xword	0x1a297206b38dbe48
	.xword	0x7b672c319e2bef1f
	.xword	0xc11a35d859077356
	.xword	0xc375edb9662a1cb1
	.xword	0x0f2086ba51dbd5cc
	.xword	0x91cfa3e544b7b78e
	.xword	0xb84fb610b52ef434
	.xword	0xbca8efb241b160f1
	.xword	0xca663d2ac7473011
	.xword	0xe93f3120469e8112
	.xword	0xabd69d5abb7103d4
	.xword	0x6594f24e17ce53e2
	.xword	0x5a7ebe82b1aec098
	.xword	0x3715207a785441ef
	.xword	0xb5ee0a442e407947
	.xword	0xba601cb3b235ddd7
	.xword	0x16d21aa2d30cc403
	.xword	0x39a93410b14aab05
	.xword	0x1415af03b3f786ca
	.xword	0x5cdb60ec2b51566a
	.xword	0xaa578e11ffe504cb
	.xword	0x7de23561356d28ef
	.xword	0x117867d304c3c2fb
	.xword	0xac187a968225b70a
	.xword	0x650cd654e110b2e9
	.xword	0xecf4fffe3b731976
	.xword	0xd2ceb5e6ceba6932
	.xword	0xb1e5d7c6a3612674
	.xword	0xe237ae0855757020
	.xword	0x6aa8fb35c7c53f81
	.xword	0xfaa7612a272ee5d6
	.xword	0xd5350b9261c7e420
	.xword	0xdeafc78deac2be95
	.xword	0xec86a2c454a9a5a5
	.xword	0xf8aaa91872a3f3da
	.xword	0x9a1a80092dcb6503
	.xword	0x6d2028318f4a7ff4
	.xword	0x9ceefd873f6d29b6
	.xword	0x7ac73ee26366fa67
	.xword	0x613a4b4eaf7e2e39
	.xword	0x45b7b2e7a19a3146
	.xword	0x18b8a6d96d27c88c
	.xword	0x972e77dcf47f1162
	.xword	0x6908f6fc5b867cac
	.xword	0x1f78f5643815d992
	.xword	0x4f32eb242c10bfb4
	.xword	0xd1b789fb7b5b4c5c
	.xword	0x8128b361fa5fec9b
	.xword	0x3ab2aed430248fbe
	.xword	0x34071061814d5df6
	.xword	0xbddced5cf24baa48
	.xword	0x1dd8b3e383c2f273
	.xword	0xf6374cb5ea9221b3
	.xword	0x9bfbe162823f7119
	.xword	0x8c53aeab623ab477
	.xword	0x5c768c5918c6ebcf
	.xword	0xb973ba49a1ed7d6d
	.xword	0xaa1cf7ea9f688887

SECTION .HTRAPS
.text
.global restore_range_regs
restore_range_regs:
    wr %g0, ASI_MMU_REAL_RANGE, %asi
    mov 1, %g1
    sllx %g1, 63, %g1
    ldxa [ASI_MMU_REAL_RANGE_0] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_0] %asi
    ldxa [ASI_MMU_REAL_RANGE_1] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_1] %asi
    ldxa [ASI_MMU_REAL_RANGE_2] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_2] %asi
    ldxa [ASI_MMU_REAL_RANGE_3] %asi, %g2
    or %g2 ,%g1, %g2
    stxa %g2,  [ASI_MMU_REAL_RANGE_3] %asi
    retry

.global wdog_2_ext
# 10 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_extensions.s"
SECTION .HTRAPS
.global wdog_2_ext
.global retry_with_base_tba
.global resolve_bad_tte

.text
resolve_bad_tte:
    !if pc[13:5]==0, then assume not a relocated handler
    rdpr %tpc, %r4
    andn %r4, 0xf, %r5
    sllx %r5, 49, %r5
    brnz,a %r5, retry_with_base_tba
    !assume %r27 is where we came from ..
    fdivd %f0, %f4, %f12
    jmpl %r27+8, %r0
    fdivs %f0, %f4, %f12
retry_with_base_tba:
    best_set_reg(TRAP_BASE_VA, %r3, %r5)
    cmp %r4, %r5
    bz htrap_5_ext_done
    set 0x7fff, %r3
    and %r4, %r3, %r4
    or %r5, %r4, %r4
    wrpr %r4, %tpc
    rdpr %tnpc, %r4
    and %r4, %r3, %r4
    or %r5, %r4, %r4
    wrpr %r4, %tnpc
    retry

htrap_5_ext:
    rd %pc, %l2
    inc %l3
    add %l2, htrap_5_ext_done-htrap_5_ext, %l2
    rdpr %tl, %l3
    rdpr %tstate, %l4
    rdhpr %htstate, %l5
    or %l5, 0x4, %l5
    inc %l3
    wrpr %l3, %tl
    wrpr %l2, %tpc
    add %l2, 4, %l2
    wrpr %l2, %tnpc
    wrpr %l4, %tstate
    wrhpr %l5, %htstate
    retry
htrap_5_ext_done:
    done

wdog_2_ext:
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1
    cmp %l1, 0x2
    bne wdog_2_goto_handler
    nop
 ! else done
    done
wdog_2_goto_handler:
    rdhpr %htstate, %l3
    and %l3, 0x4, %l3    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l3, wdog_2_goto_handler_1
    rdhpr %htba, %l3
    srlx %l1, 7, %l3     ! Send priv sw traps to priv mode ..
    cmp %l3, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a wdog_2_goto_handler_1
    rdpr %tba, %l3
    rdhpr %htba, %l3
wdog_2_goto_handler_1:
    sllx %l1, 5, %l1
    add %l1, %l3, %l3
    jmp %l3
    nop
# 86 "/import/n2-aus-random/N2/sandbox-24x7/somePerson/SIMRUN/DIAG/include/tlu_custom_trap_extensions.s"
! Red mode other reset handler
! Get htba, and tt and make trap address
! Jump to trap handler ..

SECTION .RED_SEC
.global red_other_ext
.global wdog_red_ext
.text
red_other_ext:
 ! IF TL=6, shift stack by one ..
    rdpr %tl, %l1
    cmp %l1, 6
    be start_tsa_shift
    nop

continue_red_other:
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG

    rdpr %tt, %l1

    rdhpr %htstate, %l2
    and %l2, 0x4, %l2    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l2, red_goto_handler
    rdhpr %htba, %l2
    srlx %l1, 7, %l2     ! Send priv sw traps to priv mode ..
    cmp %l2, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a red_goto_handler
    rdpr %tba, %l2
    rdhpr %htba, %l2
red_goto_handler:

    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    rdhpr %hpstate, %l1
    jmp %l2
    wrhpr %l1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %l1
    cmp %l1, 6
    bl wdog_end
start_tsa_shift:
    mov 0x2, %l2

tsa_shift:
    wrpr %l2, %tl
    rdpr %tt, %l3
    rdpr %tpc, %l4
    rdpr %tnpc, %l5
    rdpr %tstate, %l6
    rdhpr %htstate, %l7
    dec %l2
    wrpr %l2, %tl
    wrpr %l3, %tt
    wrpr %l4, %tpc
    wrpr %l5, %tnpc
    wrpr %l6, %tstate
    wrhpr %l7, %htstate
    add %l2, 2, %l2
    cmp %l2, %l1
    ble tsa_shift
    nop
tsa_shift_done:
    dec %l1
    wrpr %l1, %tl

wdog_end:
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1

    cmp %l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    done
# 1111 "diag.j.pp"

SECTION .CWQ_DATA DATA_VA =0x4000
attr_data {
    Name = .CWQ_DATA 
    hypervisor
}

.data
.align 16
.global msg
msg:
.xword 0xad32fa52374cc6ba
.xword 0x4cbf52280549003a

.align 16
.global results
results:
.xword 0xDEADBEEFDEADBEEF
.xword 0xDEADBEEFDEADBEEF
!# CWQ data area 
!# CWQ_BASE for core N is CWQ_BASE+(N*256)
!# CWQ_LAST for core N is CWQ_LAST+(N*256)
.align 64
.global CWQ_BASE
CWQ_BASE:
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.global CWQ_LAST
.align 64
CWQ_LAST:
.word 0x0
.align 64
cwq_base1:
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
cwq_last1:
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0
.align 64
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 64
.word 0x0



SECTION .MyHTRAPS_0 TEXT_VA = 0x0000000000280000, DATA_VA = 0x00000000002c0000
attr_text {
	Name	 = .MyHTRAPS_0,
	RA	 = 0x0000000000280000,
	PA	 = ra2pa(0x0000000000280000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_0,
	RA	 = 0x00000000002c0000,
	PA	 = ra2pa(0x00000000002c0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
#include "htraps.s"
#include "tlu_htraps_ext.s"



SECTION .MyHTRAPS_1 TEXT_VA = 0x00000000002a0000, DATA_VA = 0x00000000002e0000
attr_text {
	Name	 = .MyHTRAPS_1,
	RA	 = 0x00000000002a0000,
	PA	 = ra2pa(0x00000000002a0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_1,
	RA	 = 0x00000000002e0000,
	PA	 = ra2pa(0x00000000002e0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
#include "htraps.s"
#include "tlu_htraps_ext.s"



SECTION .MyHTRAPS_2 TEXT_VA = 0x0000000200280000, DATA_VA = 0x00000002002c0000
attr_text {
	Name	 = .MyHTRAPS_2,
	RA	 = 0x0000000200280000,
	PA	 = ra2pa(0x0000000200280000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_2,
	RA	 = 0x00000002002c0000,
	PA	 = ra2pa(0x00000002002c0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
#include "htraps.s"
#include "tlu_htraps_ext.s"



SECTION .MyHTRAPS_3 TEXT_VA = 0x00000002002a0000, DATA_VA = 0x00000002002e0000
attr_text {
	Name	 = .MyHTRAPS_3,
	RA	 = 0x00000002002a0000,
	PA	 = ra2pa(0x00000002002a0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyHTRAPS_3,
	RA	 = 0x00000002002e0000,
	PA	 = ra2pa(0x00000002002e0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
#include "htraps.s"
#include "tlu_htraps_ext.s"





SECTION .MyTRAPS_0 TEXT_VA = 0x0000000000380000, DATA_VA = 0x00000000003c0000
attr_text {
	Name	 = .MyTRAPS_0,
	RA	 = 0x0000000000380000,
	PA	 = ra2pa(0x0000000000380000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyTRAPS_0,
	RA	 = 0x00000000003c0000,
	PA	 = ra2pa(0x00000000003c0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

#include "traps.s"



SECTION .MyTRAPS_1 TEXT_VA = 0x00000000003a0000, DATA_VA = 0x00000000003e0000
attr_text {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003a0000,
	PA	 = ra2pa(0x00000000003a0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003e0000,
	PA	 = ra2pa(0x00000000003e0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

#include "traps.s"



SECTION .MyTRAPS_2 TEXT_VA = 0x0000000400380000, DATA_VA = 0x00000004003c0000
attr_text {
	Name	 = .MyTRAPS_2,
	RA	 = 0x0000000400380000,
	PA	 = ra2pa(0x0000000400380000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000004003c0000,
	PA	 = ra2pa(0x00000004003c0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

#include "traps.s"



SECTION .MyTRAPS_3 TEXT_VA = 0x00000004003a0000, DATA_VA = 0x00000004003e0000
attr_text {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000004003a0000,
	PA	 = ra2pa(0x00000004003a0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0,
	TTE_X	 = 0
}


attr_data {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000004003e0000,
	PA	 = ra2pa(0x00000004003e0000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0,
	TTE_V	 = 1,
	TTE_Size	 = PART0_Z_PAGE_SIZE_3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

#include "traps.s"





SECTION .MyDATA_0 TEXT_VA = 0x00000000e0140000, DATA_VA = 0x0000000060140000
attr_text {
	Name	 = .MyDATA_0,
	RA	 = 0x0000000170100000,
	PA	 = ra2pa(0x0000000170100000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 3,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}


attr_data {
	Name	 = .MyDATA_0,
	RA	 = 0x0000000170100000,
	PA	 = ra2pa(0x0000000170100000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0,
	tsbonly
}


attr_data {
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0xa38d13a20b95e5f4
	.xword	0x557e7377aafec941
	.xword	0x0c7ef84e756889be
	.xword	0xd76879f41caa3471
	.xword	0xb54e327cafa94eb8
	.xword	0x9dac092b410807bd
	.xword	0x7239b753894db7ae
	.xword	0x71eb5bbdc644d2af
	.xword	0x5f29b5b5b4aa36cc
	.xword	0xf0319ae3892d74c1
	.xword	0x96c618e7558989cc
	.xword	0xf5607b4e37067744
	.xword	0x25bd5af8f34960a4
	.xword	0x1ce3de35679586dc
	.xword	0xc9c6c39d336cf851
	.xword	0x9c537ef8f4e21060
	.xword	0xb908db9b3b50342e
	.xword	0x614f963a42a2b679
	.xword	0xde1ad59dfc433477
	.xword	0x524c209b0a5c3f4b
	.xword	0x8373e8040ee0b268
	.xword	0xc1643619d63ca83d
	.xword	0xe9ab0bcc13c49271
	.xword	0xce8391ddcbddc6fb
	.xword	0x8fcb1bdf9c8cddc4
	.xword	0x90640ce675195134
	.xword	0xe20abed543cf55d9
	.xword	0xead60c2e95bee339
	.xword	0x4b5231519be58a0e
	.xword	0xb8cbc60e99409221
	.xword	0x4d4f5f2e91541aa3
	.xword	0x160c57852c8e8e78



SECTION .MyDATA_1 TEXT_VA = 0x00000000e0340000, DATA_VA = 0x0000000060340000
attr_text {
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 3,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}


attr_data {
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0,
	tsbonly
}


attr_data {
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0xf468945bf19f6f3b
	.xword	0xfb93b56df5cbb74c
	.xword	0x345077d9766dbd71
	.xword	0xf409994e4f4d5e30
	.xword	0xedd976e4cb683205
	.xword	0xc72ff9168ba8779d
	.xword	0x306a533008a1ce45
	.xword	0x7d58f852be33459b
	.xword	0x072b9f251a9a59d8
	.xword	0xe3efcf69fc28e6a6
	.xword	0x1387e26f86831fd1
	.xword	0xef7cb6b12b90164e
	.xword	0x6d3783891b2e2556
	.xword	0x9532f579b3eac6f6
	.xword	0x344f3413effcad20
	.xword	0xe2caab67e7f7326e
	.xword	0x34c1bf90c0f1189d
	.xword	0x6fc230a26502b7b4
	.xword	0xa35b82ce5217eaa0
	.xword	0x0f2cda06708f2cf8
	.xword	0x34edb2b23713f62d
	.xword	0x09c2b13f2e0595f0
	.xword	0x8cadf4ce12ca788f
	.xword	0x1f7646d4870d47d8
	.xword	0xc059ad64690318ee
	.xword	0x00aaa979cdebe07e
	.xword	0x6088f613ccad13f0
	.xword	0x99d9e793ded44214
	.xword	0x3587201e133646b5
	.xword	0x8262571d093ca289
	.xword	0x5748a9215048a8c6
	.xword	0x224ed4cbd2519a52



SECTION .MyDATA_2 TEXT_VA = 0x00000000e0540000, DATA_VA = 0x0000000060540000
attr_text {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 5,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0,
	tsbonly
}


attr_data {
	Name	 = .MyDATA_2,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_2,
	hypervisor
}

.data
	.xword	0x2aff6c5c76d32178
	.xword	0xb0cfa9d0e05722c0
	.xword	0x4fff8753836fb6d8
	.xword	0xeb492644f76d76ec
	.xword	0xe8e66bf07e8d29dc
	.xword	0x76b67f236fc26d5a
	.xword	0x33c0d559c7f16d60
	.xword	0x663ea2a90beac5eb
	.xword	0x678ff0017b3bff1d
	.xword	0x9c154b418fd5f3b3
	.xword	0x666832badc990800
	.xword	0x43743edef6c79633
	.xword	0xe1bbf091f9063fd8
	.xword	0xbd232fe84eeb6cf9
	.xword	0xfc9e269673852b97
	.xword	0xdeaffb9ae77925ef
	.xword	0x62bfe0089792a3e9
	.xword	0x0a0ebb0b6864e3b5
	.xword	0xbd639dbbc07eac10
	.xword	0x3da5b9bb5c98fc1e
	.xword	0x862c853feb8953a3
	.xword	0x59a618b187550f91
	.xword	0x3790c7c1f57bfc29
	.xword	0x20103280fcff1b9d
	.xword	0x296e7d458ac00541
	.xword	0x7bfa448d694a7445
	.xword	0xd56c00ac96766058
	.xword	0xc85b2192a36cd731
	.xword	0x1b4119a700cba578
	.xword	0x2a3d00892c04c61a
	.xword	0x65885026ab6f6a28
	.xword	0xc303371ec71debba



SECTION .MyDATA_3 TEXT_VA = 0x00000000e0740000, DATA_VA = 0x0000000060740000
attr_text {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0,
	tsbonly
}


attr_data {
	Name	 = .MyDATA_3,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_3,
	hypervisor
}

.data
	.xword	0x769e7c0636c03b5d
	.xword	0x1a8ba01a06a805a5
	.xword	0x4bed03ec5eda3a4c
	.xword	0x46ec812540882e7c
	.xword	0xb86e91598998e104
	.xword	0x6ac53040e3892977
	.xword	0x3f4c61a4f9df43a1
	.xword	0xc81b1305eb470d46
	.xword	0xfa2250f2f799ab72
	.xword	0xffb9a2e1c3c84d85
	.xword	0x37c242b4a99c43f7
	.xword	0x79552f42be2aac42
	.xword	0xdf9f273386b6cb6d
	.xword	0x7d15d141e1c5e4bd
	.xword	0xa02bb41eb4fdac1a
	.xword	0x6379ae5a70dceb3e
	.xword	0x8284c1824081c9fa
	.xword	0xb21e9033768f4869
	.xword	0x86517c8fff76dbe0
	.xword	0xb9936f0ae784b0da
	.xword	0x063b7334cdbe093f
	.xword	0x373cd21b8c5379a4
	.xword	0x4c637c14f356d971
	.xword	0xf00078bfbe613ba2
	.xword	0xf7998f9af29e18ed
	.xword	0xbd34058ae405b425
	.xword	0xd6f488c77f46a9da
	.xword	0x864bfe5fd8584dbf
	.xword	0x6f2c4b93307a9d51
	.xword	0x7b5a2cfd1e02b1fc
	.xword	0x5c8fd69a501bc7d5
	.xword	0xdc98896c5504327d





SECTION .MyTEXT_0 TEXT_VA = 0x00000000e0200000
attr_text {
	Name	 = .MyTEXT_0,
	RA	 = 0x00000000e0200000,
	PA	 = ra2pa(0x00000000e0200000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 3,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f6
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	fdivs %f0, %f4, %f6



SECTION .MyTEXT_1 TEXT_VA = 0x00000000e0a00000
attr_text {
	Name	 = .MyTEXT_1,
	RA	 = 0x00000000e0a00000,
	PA	 = ra2pa(0x00000000e0a00000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 3,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f8
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f6



SECTION .MyTEXT_2 TEXT_VA = 0x00000000e1200000
attr_text {
	Name	 = .MyTEXT_2,
	RA	 = 0x00000000e1200000,
	PA	 = ra2pa(0x00000000e1200000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f8
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	fdivs %f0, %f4, %f8



SECTION .MyTEXT_3 TEXT_VA = 0x00000000e1a00000
attr_text {
	Name	 = .MyTEXT_3,
	RA	 = 0x00000000e1a00000,
	PA	 = ra2pa(0x00000000e1a00000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 5,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f6
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f4





SECTION .VaHOLE_0 TEXT_VA = 0x00007fffffffe000
attr_text {
	Name	 = .VaHOLE_0,
	RA	 = 0x00000000ffffe000,
	PA	 = ra2pa(0x00000000ffffe000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0,
	TTE_X	 = 1
}

.text
.global vahole_target0
.text
.global vahole_target1
.text
.global vahole_target2
.text
.global vahole_target3
	nop
.align 4096
	nop
.align 2048
	nop
.align 1024
	nop
.align 512
	nop
.align 256
	nop
.align 128
	nop
.align 64
	nop
	nop
.align 16
	nop;nop;nop
vahole_target0: nop;nop
vahole_target1: nop
vahole_target2: nop;nop;nop
vahole_target3: nop;nop;nop





SECTION .VaHOLEL_0 TEXT_VA = 0x00000000ffffe000
attr_text {
	Name	 = .VaHOLEL_0,
	RA	 = 0x00000000ffffe000,
	PA	 = ra2pa(0x00000000ffffe000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
	TTE_G	 = 1,
	TTE_Context	 = PCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 5,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0,
	TTE_X	 = 1,
	tsbonly
}

.text
	nop





SECTION .ZERO_0 TEXT_VA = 0x0000000000000000
attr_text {
	Name	 = .ZERO_0,
	RA	 = 0x0000000000000000,
	PA	 = ra2pa(0x0000000000000000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 5,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1,
	TTE_X	 = 1
}


.text
    mov HIGHVA_HIGHNUM, %r11
    sllx %r11, 32, %r11
    or %r27, %r11, %r27
	jmpl %r27+8, %r0
	nop
	nop
	jmpl %r27+8, %r0
	nop

Power_On_Reset:
    setx HRedmode_Reset_Handler, %g1, %g2
    jmp %g2
    nop
.align 32

Watchdog_Reset:
    setx wdog_red_ext, %g1, %g2
    jmp %g2
    nop
.align 32

External_Reset:
    My_External_Reset

.align 32

Software_Initiated_Reset:
    setx Software_Reset_Handler, %g1, %g2
    jmp %g2
    nop

.align 32

RED_Mode_Other_Reset:
 ! IF TL=6, shift stack by one ..
    rdpr %tl, %l1
    cmp %l1, 6
    be start_tsa_shift
    nop

continue_red_other:
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG

    rdpr %tt, %l1

    rdhpr %htstate, %l2
    and %l2, 0x4, %l2    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l2, red_goto_handler
    rdhpr %htba, %l2
    srlx %l1, 7, %l2     ! Send priv sw traps to priv mode ..
    cmp %l2, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a red_goto_handler
    rdpr %tba, %l2
    rdhpr %htba, %l2
red_goto_handler:

    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    rdhpr %hpstate, %l1
    jmp %l2
    wrhpr %l1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %l1
    cmp %l1, 6
    bl wdog_end
start_tsa_shift:
    mov 0x2, %l2

tsa_shift:
    wrpr %l2, %tl
    rdpr %tt, %l3
    rdpr %tpc, %l4
    rdpr %tnpc, %l5
    rdpr %tstate, %l6
    rdhpr %htstate, %l7
    dec %l2
    wrpr %l2, %tl
    wrpr %l3, %tt
    wrpr %l4, %tpc
    wrpr %l5, %tnpc
    wrpr %l6, %tstate
    wrhpr %l7, %htstate
    add %l2, 2, %l2
    cmp %l2, %l1
    ble tsa_shift
    nop
tsa_shift_done:
    dec %l1
    wrpr %l1, %tl

wdog_end:
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1

    cmp %l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    done





SECTION .VaHOLE_PA_0 TEXT_VA = 0x000000ffffffe000
attr_text {
	Name	 = .VAHOLE_PA_0,
	hypervisor
}

	nop
.align 4096
	nop
.align 2048
	nop
.align 1024
	nop
.align 512
	nop
.align 256
	nop
.align 128
	nop
.align 64
	nop
	nop
.align 16
	nop;nop;nop
	nop
	nop
	jmpl %r27+8, %r0
	nop
	nop
	nop
	jmpl %r27+8, %r0
	nop





SECTION .MASKEDHOLE_0 TEXT_VA = 0x0000000100000000
attr_text {
	Name	 = .MASKEDHOLE_0,
	RA	 = 0x0000000000000000,
	PA	 = ra2pa(0x0000000000000000,0),
	part_0_ctx_zero_tsb_config_3,
	part_0_ctx_nonzero_tsb_config_3,
	TTE_G	 = 1,
	TTE_Context	 = 0x44,
	TTE_V	 = 1,
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0,
	TTE_X	 = 1,
	tsbonly
}


attr_text {
	Name	 = .MASKEDHOLE_0,
	hypervisor
}

	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	nop



#if 0
#endif
