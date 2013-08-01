/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand5_7745150.s
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
# 517 "diag.j"
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
# 543 "diag.j"
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
# 565 "diag.j"
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
# 637 "diag.j"
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
	mov 0x35, %r14
	mov 0xb3, %r30
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
	mov 0xb4, %r14
	mov 0xb3, %r30
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
	mov 0x34, %r30
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
	mov 0xb3, %r30
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
	mov 0xb1, %r14
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
	mov 0xb3, %r14
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
	mov 0xb1, %r14
	mov 0x32, %r30
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
    set 0x1af0ccff, %g2
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
	.word 0x9f802b92  ! 1: SIR	sir	0x0b92
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
    ta T_CHANGE_NONHPRIV 
ibp_80_1:
	nop
	.word 0xc1bfe160  ! 1: STDFA_I	stda	%f0, [0x0160, %r31]
splash_cmpr_80_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 2: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_80_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 3: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xe19fe0e0  ! 4: LDDFA_I	ldda	[%r31, 0x00e0], %f16
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
    brnz %r10, cwq_80_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_4
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
cwq_80_4:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 5: RDPC	rd	%pc, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_5-donret_80_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006fc000 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd8b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r11+%r0], %g1
	done
donretarg_80_5:
	.word 0x8d903e65  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1e65, %pstate
	.word 0xe937e1da  ! 7: STQF_I	-	%f20, [0x01da, %r31]
jmptr_80_6:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803b76  ! 10: SIR	sir	0x1b76
	.word 0x8d802000  ! 11: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_80_8:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x48) 
	.word 0xe8884900  ! 12: LDUBA_R	lduba	[%r1, %r0] 0x48, %r20
	.word 0xe81fe100  ! 13: LDD_I	ldd	[%r31 + 0x0100], %r20
	.word 0x22ca0001  ! 1: BRZ	brz,a,pt	%r8,<label_0xa0001>
	.word 0x8d903cc4  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x1cc4, %pstate
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
    brnz %r10, cwq_80_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_10
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 15: RDPC	rd	%pc, %r16
brcommon2_80_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a449c6  ! 1: FDIVd	fdivd	%f48, %f6, %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 16: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_80_12:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 18: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
mondo_80_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d94c003  ! 19: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
splash_cmpr_80_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 20: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_16) + 56, 16, 16)) -> intp(3,0,7,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_16)&0xffffffff) + 40, 16, 16)) -> intp(1,0,31,,,,,1)
#else
	set 0x3b80cfc7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81da4011  ! 22: FLUSH_R	flush 	%r9, %r17, %r0
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c64  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x1c64, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_80_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d940006  ! 25: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x879c273e  ! 27: WRHPR_HINTP_I	wrhpr	%r16, 0x073e, %hintp
fpinit_80_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 28: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_80_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d94c002  ! 29: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
splash_hpstate_80_22:
	.word 0x819835ef  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15ef, %hpstate
splash_tba_80_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_80_24:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8d04940  ! 32: LDSHA_R	ldsha	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 34: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe89fe0d0  ! 35: LDDA_I	ldda	[%r31, + 0x00d0] %asi, %r20
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
    brnz %r10, sma_80_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 36: CASA_R	casa	[%r31] %asi, %r16, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_28-donret_80_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002e4c00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 29, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_28:
	.word 0x33400001  ! 37: FBPE	fbe,a,pn	%fcc0, <label_0x1>
brcommon2_80_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa3a00543  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe060  ! 38: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0x91908011  ! 39: WRPR_PIL_R	wrpr	%r2, %r17, %pil
	.word 0xd877e179  ! 40: STX_I	stx	%r12, [%r31 + 0x0179]
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
    brnz %r10, cwq_80_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_31
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
cwq_80_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 41: RDPC	rd	%pc, %r16
	.word 0xe69fe160  ! 42: LDDA_I	ldda	[%r31, + 0x0160] %asi, %r19
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
    brnz %r10, sma_80_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 43: CASA_R	casa	[%r31] %asi, %r20, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_34-donret_80_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a48100 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1365, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_34:
	.word 0xe66fe0d8  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x00d8]
	nop
	mov 0x80, %g3
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_35)+48, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_35)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_35:
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
xir_80_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9843c0e  ! 46: WR_SET_SOFTINT_I	wr	%r16, 0x1c0e, %set_softint
iaw_80_36:
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
iaw_startwait80_36:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_36
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_36:
    brnz %r16, iaw_wait80_36
    ld [%r23], %r16
    ba iaw_startwait80_36
    mov 0x80, %r16
continue_iaw_80_36:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_36:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_36
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_36:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_36
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_36:
	mov 0x38, %r18
iaw2_80_36:
	rdpr %tba, %r19
	mov 0x221,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe69fe030  ! 47: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_37-donret_80_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e3c700 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e0d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_80_37:
	.word 0x8d90289f  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x089f, %pstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
iaw_80_39:
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
iaw_startwait80_39:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_39
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_39:
    brnz %r16, iaw_wait80_39
    ld [%r23], %r16
    ba iaw_startwait80_39
    mov 0x80, %r16
continue_iaw_80_39:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_39:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_39
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_39:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_39
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_39:
	mov 0x38, %r18
iaw4_80_39:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd960  ! 50: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_80_40:
	nop
	ta T_CHANGE_HPRIV
	set 0x60c3cae7, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_80_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_41:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc1bfdf20  ! 53: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_43-donret_80_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e0400 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
.align 32
donretarg_80_43:
	.word 0x8d902e4d  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0e4d, %pstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe198  ! 57: LDDF_I	ldd	[%r31, 0x0198], %f19
	.word 0x8780201c  ! 58: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_80_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_45
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_45:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 60: RDPC	rd	%pc, %r9
mondo_80_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d940014  ! 61: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x83d020b3  ! 62: Tcc_I	te	icc_or_xcc, %r0 + 179
splash_lsu_80_47:
	nop
	ta T_CHANGE_HPRIV
	set 0xb5c0c1ed, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_80_48:
	nop
	.word 0xe19fe100  ! 64: LDDFA_I	ldda	[%r31, 0x0100], %f16
splash_hpstate_80_49:
	.word 0x81982e51  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e51, %hpstate
	.word 0x8d903d37  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1d37, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_80_52:
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
iaw_startwait80_52:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_52
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_52:
    brnz %r16, iaw_wait80_52
    ld [%r23], %r16
    ba iaw_startwait80_52
    mov 0x80, %r16
continue_iaw_80_52:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_52:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_52
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_52:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_52
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_52:
	mov 0x38, %r18
iaw2_80_52:
	rdpr %tba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a449ab  ! 68: FDIVs	fdivs	%f17, %f11, %f11
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_53-donret_80_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0082b200 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x629, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r11+%r0], %g1
	done
donretarg_80_53:
	.word 0x3f400001  ! 69: FBPO	fbo,a,pn	%fcc0, <label_0x1>
    set 0x110a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b487d0  ! 70: PDIST	pdistn	%d18, %d16, %d10
	.word 0x91a00172  ! 71: FABSq	dis not found

ibp_80_55:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe020  ! 72: LDDFA_I	ldda	[%r31, 0x0020], %f0
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_56-donret_80_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c36800 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1acd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
.align 32
donretarg_80_56:
	.word 0xe4ffe00d  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x000d] %asi
brcommon3_80_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c00c  ! 1: STQF_R	-	%f18, [%r12, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe43fe050  ! 74: STD_I	std	%r18, [%r31 + 0x0050]
	.word 0x91948003  ! 75: WRPR_PIL_R	wrpr	%r18, %r3, %pil
splash_cmpr_80_59:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 76: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_80_60:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 77: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87802036  ! 78: WRASI_I	wr	%r0, 0x0036, %asi
brcommon3_80_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c013  ! 1: STQF_R	-	%f18, [%r19, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe49fe070  ! 79: LDDA_I	ldda	[%r31, + 0x0070] %asi, %r18
mondo_80_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d918010  ! 80: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x39b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b487ca  ! 82: PDIST	pdistn	%d18, %d10, %d12
	.word 0xd23fc000  ! 83: STD_R	std	%r9, [%r31 + %r0]
	.word 0x97a00172  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_80_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_65
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
cwq_80_65:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 85: RDPC	rd	%pc, %r9
	.word 0xa7450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r19
brcommon1_80_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803153  ! 87: SIR	sir	0x1153
pmu_80_67:
	nop
	setx 0xffffffbdffffffa5, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_68)+16, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_68)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_68:
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
xir_80_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa980e169  ! 89: WR_SET_SOFTINT_I	wr	%r3, 0x0169, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_80_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 91: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_80_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d948006  ! 92: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0x8d902ec6  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
	.word 0x8d802000  ! 94: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
    brnz %r10, sma_80_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 95: CASA_R	casa	[%r31] %asi, %r20, %r8
ibp_80_74:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec4034  ! 96: PREFETCHA_R	prefetcha	[%r17, %r20] 0x01, #one_read
iaw_80_75:
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
iaw_startwait80_75:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_75
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_75:
    brnz %r16, iaw_wait80_75
    ld [%r23], %r16
    ba iaw_startwait80_75
    mov 0x80, %r16
continue_iaw_80_75:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_75:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_75
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_75:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_75
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_75:
	mov 0x38, %r18
iaw1_80_75:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea0026  ! 97: PREFETCHA_R	prefetcha	[%r8, %r6] 0x01, #one_read
trapasi_80_76:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8c04b40  ! 98: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_80_77:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb3ffffffa8, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_80_79:
	set 0x60540000, %r31
	.word 0x85827c75  ! 102: WRCCR_I	wr	%r9, 0x1c75, %ccr
	.word 0xd8cfe038  ! 103: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r12
change_to_randtl_80_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_80:
	.word 0x8f902001  ! 104: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
pmu_80_81:
	nop
	setx 0xffffffb6ffffffa8, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xbb297278, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe198  ! 107: LDSBA_I	ldsba	[%r31, + 0x0198] %asi, %r12
	.word 0x9f8035de  ! 108: SIR	sir	0x15de
	.word 0xd8dfe050  ! 109: LDXA_I	ldxa	[%r31, + 0x0050] %asi, %r12
	.word 0x87802020  ! 110: WRASI_I	wr	%r0, 0x0020, %asi
mondo_80_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d92c010  ! 111: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
	.word 0xa7a249d0  ! 113: FDIVd	fdivd	%f40, %f16, %f50
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
    brnz %r10, cwq_80_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_85
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
cwq_80_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 114: RDPC	rd	%pc, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_86) + 0, 16, 16)) -> intp(5,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_86)&0xffffffff) + 40, 16, 16)) -> intp(4,0,10,,,,,1)
#else
	set 0xdcd00210, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_87:
	nop
	setx 0xffffffbeffffffa6, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_80_88:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x49) 
	.word 0xd8c04920  ! 117: LDSWA_R	ldswa	[%r1, %r0] 0x49, %r12
	.word 0x99450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r12
fpinit_80_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d23  ! 119: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd23] %asi, #one_read
	.word 0x9f802939  ! 120: SIR	sir	0x0939
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_90-donret_80_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0036f000 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x795, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
.align 32
donretarg_80_90:
	.word 0xe66fe0f8  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x00f8]
	.word 0x9f80399f  ! 122: SIR	sir	0x199f
splash_htba_80_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_80_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_92
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_92:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 124: RDPC	rd	%pc, %r12
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 126: WRFPRS_I	wr	%r0, 0x0004, %fprs
iaw_80_94:
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
iaw_startwait80_94:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_94
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_94:
    brnz %r16, iaw_wait80_94
    ld [%r23], %r16
    ba iaw_startwait80_94
    mov 0x80, %r16
continue_iaw_80_94:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_94:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_94
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_94:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_94
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_94:
	mov 0x38, %r18
iaw4_80_94:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5b18493  ! 127: FCMPLE32	fcmple32	%d6, %d50, %r18
iaw_80_95:
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
iaw_startwait80_95:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_95
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_95:
    brnz %r16, iaw_wait80_95
    ld [%r23], %r16
    ba iaw_startwait80_95
    mov 0x80, %r16
continue_iaw_80_95:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_95:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_95
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_95:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_95
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_95:
	mov 0x38, %r18
iaw4_80_95:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87ab0a53  ! 128: FCMPd	fcmpd	%fcc<n>, %f12, %f50
	.word 0x95b304c1  ! 129: FCMPNE32	fcmpne32	%d12, %d32, %r10
	.word 0xe88008a0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
intveclr_80_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4059fee120a27300, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_98:
	.word 0x8198240d  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
trapasi_80_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8c04e40  ! 133: LDSWA_R	ldswa	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_100)+16, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_100)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_100:
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
xir_80_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa982a89c  ! 134: WR_SET_SOFTINT_I	wr	%r10, 0x089c, %set_softint
intveclr_80_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0x177556e31eb326cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe3a108e3d5e744e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_103-donret_80_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b85800 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1bcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r11+%r0], %g1
	done
donretarg_80_103:
	.word 0xe86fe0b4  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x00b4]
ibp_80_104:
	nop
	.word 0xe19fe0c0  ! 138: LDDFA_I	ldda	[%r31, 0x00c0], %f16
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
    brnz %r10, sma_80_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 139: CASA_R	casa	[%r31] %asi, %r17, %r20
splash_cmpr_80_106:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 140: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
iaw_80_107:
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
iaw_startwait80_107:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_107
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_107:
    brnz %r16, iaw_wait80_107
    ld [%r23], %r16
    ba iaw_startwait80_107
    mov 0x80, %r16
continue_iaw_80_107:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_107:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_107
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_107:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_107
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_107:
	mov 0x38, %r18
iaw1_80_107:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe89fe1f0  ! 141: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r20
	.word 0x91d020b2  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_hpstate_80_108:
	ta T_CHANGE_NONHPRIV
	.word 0x819826de  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06de, %hpstate
dvapa_80_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9c7, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ad0a4c  ! 144: FCMPd	fcmpd	%fcc<n>, %f20, %f12
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d902bc9  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0bc9, %pstate
memptr_80_111:
	set user_data_start, %r31
	.word 0x8581f631  ! 146: WRCCR_I	wr	%r7, 0x1631, %ccr
ceter_80_112:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 147: RDTICK	rd	%tick, %r18
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_113-donret_80_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0052b300 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x100d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	ldx [%r11+%r0], %g1
	done
donretarg_80_113:
	.word 0xe6ffe14d  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x014d] %asi
splash_tba_80_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_80_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_80_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 151: FCMPd	fcmpd	%fcc<n>, %f0, %f4
tagged_80_117:
	taddcctv %r2, 0x1911, %r18
	.word 0xe607e1d5  ! 152: LDUW_I	lduw	[%r31 + 0x01d5], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_118)+56, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_118)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_118:
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
xir_80_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984b1d5  ! 153: WR_SET_SOFTINT_I	wr	%r18, 0x11d5, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_80_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d910004  ! 155: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x87802020  ! 157: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x9a693ace  ! 158: UDIVX_I	udivx 	%r4, 0xffffface, %r13
splash_cmpr_80_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_80_122-donret_80_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00172600 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x162f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	ldx [%r12+%r0], %g1
	retry
donretarg_80_122:
	.word 0x93a4c9c6  ! 160: FDIVd	fdivd	%f50, %f6, %f40
pmu_80_123:
	nop
	setx 0xffffffb2ffffffa5, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_80_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_80_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d908009  ! 163: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0xa1902001  ! 164: WRPR_GL_I	wrpr	%r0, 0x0001, %-
trapasi_80_126:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5b) 
	.word 0xda884b60  ! 165: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r13
	.word 0x8d802004  ! 166: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_80_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_80_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00d  ! 169: CASA_R	casa	[%r31] %asi, %r13, %r13
	.word 0x9f8020fa  ! 170: SIR	sir	0x00fa
	.word 0x8d902431  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x0431, %pstate
ibp_80_130:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe020  ! 172: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xa46ca955  ! 173: UDIVX_I	udivx 	%r18, 0x0955, %r18
	.word 0xa9690009  ! 174: SDIVX_R	sdivx	%r4, %r9, %r20
dvapa_80_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0x95c, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc02d  ! 175: LDXA_R	ldxa	[%r31, %r13] 0x01, %r16
	.word 0xa7852b4e  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x0b4e, %-
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
    brnz %r10, cwq_80_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_132
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_132:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 177: RDPC	rd	%pc, %r9
fpinit_80_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 178: FDIVs	fdivs	%f0, %f4, %f6
splash_lsu_80_134:
	nop
	ta T_CHANGE_HPRIV
	set 0x902cfae4, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 180: WRASI_I	wr	%r0, 0x0014, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_135)+0, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_135)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_135:
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
xir_80_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98423bb  ! 181: WR_SET_SOFTINT_I	wr	%r16, 0x03bb, %set_softint
trapasi_80_136:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xdac84940  ! 182: LDSBA_R	ldsba	[%r1, %r0] 0x4a, %r13
intveclr_80_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd7c95357cd5464f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_80_138:
	tsubcctv %r0, 0x16f6, %r2
	.word 0xda07e0dc  ! 184: LDUW_I	lduw	[%r31 + 0x00dc], %r13
splash_hpstate_80_139:
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x819837df  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17df, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_80_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e070  ! 1: STQF_I	-	%f13, [0x0070, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d902744  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x0744, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
ibp_80_141:
	nop
	.word 0x87ac8a42  ! 189: FCMPd	fcmpd	%fcc<n>, %f18, %f2
tagged_80_142:
	tsubcctv %r17, 0x107c, %r16
	.word 0xd807e12e  ! 190: LDUW_I	lduw	[%r31 + 0x012e], %r12
	.word 0x87802058  ! 191: WRASI_I	wr	%r0, 0x0058, %asi
intveclr_80_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf785d1388fd1a80, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_144) + 48, 16, 16)) -> intp(7,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_144)&0xffffffff) + 16, 16, 16)) -> intp(4,0,31,,,,,1)
#else
	set 0x49201ca0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 194: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_80_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0x80c, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe000  ! 196: LDDFA_I	ldda	[%r31, 0x0000], %f0
splash_tba_80_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ac1e377  ! 198: ADDCcc_I	addccc 	%r7, 0x0377, %r13
pmu_80_148:
	nop
	setx 0xffffffbaffffffa2, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_80_149:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 200: STDFA_R	stda	%f0, [%r0, %r31]
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
ibp_40_1:
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
ibp_startwait40_1:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_1
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_1:
    brnz %r16, ibp_wait40_1
    ld [%r23], %r16
    ba ibp_startwait40_1
    mov 0x40, %r16
continue_ibp_40_1:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_1:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_1
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_1:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_1
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_1:
    best_set_reg(0x00000050f9c000be,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfe060  ! 1: STDFA_I	stda	%f0, [0x0060, %r31]
splash_cmpr_40_2:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 2: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_40_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d930013  ! 3: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
	.word 0xc19fe0e0  ! 4: LDDFA_I	ldda	[%r31, 0x00e0], %f0
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
    brnz %r10, cwq_40_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_4
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 5: RDPC	rd	%pc, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_5-donret_40_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003a6a00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d8f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r11+%r0], %g1
	done
donretarg_40_5:
	.word 0x8d903d59  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1d59, %pstate
	.word 0xe937e09d  ! 7: STQF_I	-	%f20, [0x009d, %r31]
jmptr_40_6:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9b7c490  ! 1: FCMPLE32	fcmple32	%d62, %d16, %r20
	.word 0x9f80310b  ! 10: SIR	sir	0x110b
	.word 0x8d802000  ! 11: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_40_8:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x48) 
	.word 0xe8d04900  ! 12: LDSHA_R	ldsha	[%r1, %r0] 0x48, %r20
	.word 0xe81fe1e0  ! 13: LDD_I	ldd	[%r31 + 0x01e0], %r20
	.word 0x2ac88001  ! 1: BRNZ	brnz,a,pt	%r2,<label_0x88001>
	.word 0x8d902c3b  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0c3b, %pstate
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
    brnz %r10, cwq_40_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_10
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
cwq_40_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 15: RDPC	rd	%pc, %r20
brcommon2_40_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc013  ! 1: FLUSH_R	flush 	%r31, %r19, %r0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fc2c0  ! 16: LDDFA_R	ldda	[%r31, %r0], %f0
jmptr_40_12:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d934003  ! 18: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
mondo_40_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d90c014  ! 19: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
splash_cmpr_40_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 20: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_16) + 32, 16, 16)) -> intp(7,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_16)&0xffffffff) + 0, 16, 16)) -> intp(6,0,27,,,,,1)
#else
	set 0xb2b07301, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81dd0011  ! 22: FLUSH_R	flush 	%r20, %r17, %r0
	.word 0x24ca0001  ! 1: BRLEZ	brlez,a,pt	%r8,<label_0xa0001>
	.word 0x8d903395  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x1395, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_40_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d92c012  ! 25: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x879ce6c3  ! 27: WRHPR_HINTP_I	wrhpr	%r19, 0x06c3, %hintp
fpinit_40_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 28: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_40_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 29: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
splash_hpstate_40_22:
	.word 0x81982ff5  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ff5, %hpstate
splash_tba_40_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_40_24:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8c04940  ! 32: LDSWA_R	ldswa	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 34: CASA_R	casa	[%r31] %asi, %r8, %r20
	.word 0xe89fe000  ! 35: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r20
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
    brnz %r10, sma_40_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 36: CASA_R	casa	[%r31] %asi, %r20, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_28-donret_40_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00704000 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d85, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_28:
	.word 0x21400001  ! 37: FBPN	fbn,a,pn	%fcc0, <label_0x1>
brcommon2_40_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a7c971  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe1c0  ! 38: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0x91914013  ! 39: WRPR_PIL_R	wrpr	%r5, %r19, %pil
	.word 0xd877e128  ! 40: STX_I	stx	%r12, [%r31 + 0x0128]
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
    brnz %r10, cwq_40_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_31
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_31:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 41: RDPC	rd	%pc, %r9
	.word 0xe7e7e010  ! 42: CASA_R	casa	[%r31] %asi, %r16, %r19
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
    brnz %r10, sma_40_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 43: CASA_R	casa	[%r31] %asi, %r11, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_34-donret_40_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e28900 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1458, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_34:
	.word 0xe66fe125  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x0125]
	nop
	mov 0x80, %g3
	.word 0x2cc90001  ! 1: BRGZ	brgz,a,pt	%r4,<label_0x90001>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_35)+24, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_35)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_35:
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
xir_40_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984ed92  ! 46: WR_SET_SOFTINT_I	wr	%r19, 0x0d92, %set_softint
	.word 0xe71fc00b  ! 47: LDDF_R	ldd	[%r31, %r11], %f19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_37-donret_40_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00385300 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dd5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_40_37:
	.word 0x8d9036df  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x16df, %pstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfe100  ! 50: STDFA_I	stda	%f16, [0x0100, %r31]
splash_lsu_40_40:
	nop
	ta T_CHANGE_HPRIV
	set 0x426c8412, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_40_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_41:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc1bfdb60  ! 53: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_43-donret_40_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0063af00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
.align 32
donretarg_40_43:
	.word 0x8d902c4d  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0c4d, %pstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe1b8  ! 57: LDDF_I	ldd	[%r31, 0x01b8], %f19
	.word 0x87802055  ! 58: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_40_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_45
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
cwq_40_45:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 60: RDPC	rd	%pc, %r12
mondo_40_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d910004  ! 61: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	.word 0x93d020b2  ! 62: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_lsu_40_47:
	nop
	ta T_CHANGE_HPRIV
	set 0x2da82354, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_40_48:
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
ibp_startwait40_48:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_48
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_48:
    brnz %r16, ibp_wait40_48
    ld [%r23], %r16
    ba ibp_startwait40_48
    mov 0x40, %r16
continue_ibp_40_48:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_48:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_48
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_48:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_48
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_48:
    best_set_reg(0x0000004034c0be75,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fdf20  ! 64: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_40_49:
	.word 0x819826c5  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c5, %hpstate
	.word 0x8d903571  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1571, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa370344d  ! 68: POPC_I	popc	0x144d, %r17
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_53-donret_40_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00757b00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ecd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r11+%r0], %g1
	done
donretarg_40_53:
	.word 0x3b400001  ! 69: FBPLE	fble,a,pn	%fcc0, <label_0x1>
    set 0x4a9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b1c7d3  ! 70: PDIST	pdistn	%d38, %d50, %d16
	.word 0x99a00173  ! 71: FABSq	dis not found

ibp_40_55:
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
ibp_startwait40_55:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_55
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_55:
    brnz %r16, ibp_wait40_55
    ld [%r23], %r16
    ba ibp_startwait40_55
    mov 0x40, %r16
continue_ibp_40_55:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_55:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_55
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_55:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_55
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_55:
    best_set_reg(0x00000040d4fe75e8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1a0  ! 72: STDFA_I	stda	%f16, [0x01a0, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_56-donret_40_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00706d00 | (54 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f04, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
.align 32
donretarg_40_56:
	.word 0xe4ffe17c  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x017c] %asi
brcommon3_40_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c00d  ! 1: STQF_R	-	%f18, [%r13, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe51fc013  ! 74: LDDF_R	ldd	[%r31, %r19], %f18
	.word 0x9194400c  ! 75: WRPR_PIL_R	wrpr	%r17, %r12, %pil
splash_cmpr_40_59:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 76: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_40_60:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 77: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8780208a  ! 78: WRASI_I	wr	%r0, 0x008a, %asi
brcommon3_40_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c00a  ! 1: STQF_R	-	%f18, [%r10, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe51fc012  ! 79: LDDF_R	ldd	[%r31, %r18], %f18
mondo_40_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d94c010  ! 80: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x4d7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b0c7c5  ! 82: PDIST	pdistn	%d34, %d36, %d48
	.word 0xc36fe0a4  ! 83: PREFETCH_I	prefetch	[%r31 + 0x00a4], #one_read
	.word 0x91a0016a  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_40_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_65
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
cwq_40_65:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 85: RDPC	rd	%pc, %r13
	.word 0xa7450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r19
brcommon1_40_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7cd  ! 1: PDIST	pdistn	%d62, %d44, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f80251a  ! 87: SIR	sir	0x051a
pmu_40_67:
	nop
	setx 0xffffffb8ffffffad, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_68)+56, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_68)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_68:
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
xir_40_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9837089  ! 89: WR_SET_SOFTINT_I	wr	%r13, 0x1089, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_40_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 91: FCMPLE32	fcmple32	%d0, %d4, %r8
mondo_40_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94c009  ! 92: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0x8d903962  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1962, %pstate
	.word 0x8d802000  ! 94: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
    brnz %r10, sma_40_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 95: CASA_R	casa	[%r31] %asi, %r8, %r8
ibp_40_74:
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
ibp_startwait40_74:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_74
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_74:
    brnz %r16, ibp_wait40_74
    ld [%r23], %r16
    ba ibp_startwait40_74
    mov 0x40, %r16
continue_ibp_40_74:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_74:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_74
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_74:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_74
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_74:
    best_set_reg(0x000000401cf5e816,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0031  ! 96: PREFETCHA_R	prefetcha	[%r16, %r17] 0x01, #one_read
	.word 0xc3ec8032  ! 97: PREFETCHA_R	prefetcha	[%r18, %r18] 0x01, #one_read
trapasi_40_76:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8904b40  ! 98: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_40_77:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb7ffffffa4, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_40_79:
	set 0x60540000, %r31
	.word 0x8584e677  ! 102: WRCCR_I	wr	%r19, 0x0677, %ccr
	.word 0xd8cfe160  ! 103: LDSBA_I	ldsba	[%r31, + 0x0160] %asi, %r12
change_to_randtl_40_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_40_81:
	nop
	setx 0xffffffb1ffffffaa, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x6e0ff372, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe1d8  ! 107: LDSBA_I	ldsba	[%r31, + 0x01d8] %asi, %r12
	.word 0xc32fc00d  ! 1: STXFSR_R	st-sfr	%f1, [%r13, %r31]
	.word 0x9f803e9d  ! 108: SIR	sir	0x1e9d
	.word 0xd8dfe010  ! 109: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0x87802020  ! 110: WRASI_I	wr	%r0, 0x0020, %asi
mondo_40_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d914013  ! 111: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
	.word 0x93703d23  ! 113: POPC_I	popc	0x1d23, %r9
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
    brnz %r10, cwq_40_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_85
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_85:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 114: RDPC	rd	%pc, %r9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_86) + 24, 16, 16)) -> intp(6,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_86)&0xffffffff) + 32, 16, 16)) -> intp(3,0,2,,,,,1)
#else
	set 0x23b08099, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_87:
	nop
	setx 0xffffffbeffffffa7, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_40_88:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x49) 
	.word 0xd8c04920  ! 117: LDSWA_R	ldswa	[%r1, %r0] 0x49, %r12
	.word 0x99450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r12
fpinit_40_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 119: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xe63fc009  ! 1: STD_R	std	%r19, [%r31 + %r9]
	.word 0x9f802174  ! 120: SIR	sir	0x0174
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_90-donret_40_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006e3200 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
.align 32
donretarg_40_90:
	.word 0xe66fe002  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x0002]
	.word 0xe63fe070  ! 1: STD_I	std	%r19, [%r31 + 0x0070]
	.word 0x9f8020e8  ! 122: SIR	sir	0x00e8
splash_htba_40_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_40_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_92
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
cwq_40_92:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 124: RDPC	rd	%pc, %r16
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 126: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95b2c7c3  ! 127: PDIST	pdistn	%d42, %d34, %d10
	.word 0x9b7022b7  ! 128: POPC_I	popc	0x02b7, %r13
	.word 0x87aaca47  ! 129: FCMPd	fcmpd	%fcc<n>, %f42, %f38
	.word 0xe8800b80  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r20
intveclr_40_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9680a754307362fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_98:
	.word 0x81982d8d  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
trapasi_40_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8d84e40  ! 133: LDXA_R	ldxa	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_100)+16, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_100)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_100:
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
xir_40_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984ae1a  ! 134: WR_SET_SOFTINT_I	wr	%r18, 0x0e1a, %set_softint
intveclr_40_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd1f7122337e86681, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd4fdfa6546cf442b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_103-donret_40_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b60900 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r11+%r0], %g1
	done
donretarg_40_103:
	.word 0xe86fe023  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x0023]
ibp_40_104:
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
ibp_startwait40_104:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_104
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_104:
    brnz %r16, ibp_wait40_104
    ld [%r23], %r16
    ba ibp_startwait40_104
    mov 0x40, %r16
continue_ibp_40_104:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_104:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_104
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_104:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_104
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_104:
    best_set_reg(0x00000040f9e816cd,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fda00  ! 138: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_40_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 139: CASA_R	casa	[%r31] %asi, %r12, %r20
splash_cmpr_40_106:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 140: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe91fe1b0  ! 141: LDDF_I	ldd	[%r31, 0x01b0], %f20
	.word 0x93d020b3  ! 142: Tcc_I	tne	icc_or_xcc, %r0 + 179
splash_hpstate_40_108:
	ta T_CHANGE_NONHPRIV
	.word 0x8198340f  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x140f, %hpstate
dvapa_40_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfca, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa9a0c9c6  ! 144: FDIVd	fdivd	%f34, %f6, %f20
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d903e97  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1e97, %pstate
memptr_40_111:
	set user_data_start, %r31
	.word 0x8584bf41  ! 146: WRCCR_I	wr	%r18, 0x1f41, %ccr
ceter_40_112:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 147: RDTICK	rd	%tick, %r13
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_113-donret_40_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000eb400 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc59, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	ldx [%r11+%r0], %g1
	done
donretarg_40_113:
	.word 0xe6ffe090  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x0090] %asi
splash_tba_40_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_40_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_40_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 151: FCMPd	fcmpd	%fcc<n>, %f0, %f4
tagged_40_117:
	taddcctv %r7, 0x10b4, %r20
	.word 0xe607e070  ! 152: LDUW_I	lduw	[%r31 + 0x0070], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_118)+48, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_118)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_118:
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
xir_40_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa982e738  ! 153: WR_SET_SOFTINT_I	wr	%r11, 0x0738, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_40_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 155: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x87802055  ! 157: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x946d254f  ! 158: UDIVX_I	udivx 	%r20, 0x054f, %r10
splash_cmpr_40_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_40_122-donret_40_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0006d700 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x555, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	ldx [%r12+%r0], %g1
	retry
donretarg_40_122:
	.word 0x9ba249c5  ! 160: FDIVd	fdivd	%f40, %f36, %f44
pmu_40_123:
	nop
	setx 0xffffffb6ffffffa1, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_40_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_40_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d924011  ! 163: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0xa190200b  ! 164: WRPR_GL_I	wrpr	%r0, 0x000b, %-
trapasi_40_126:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xda904b60  ! 165: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r13
	.word 0x8d802004  ! 166: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_40_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_40_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 169: CASA_R	casa	[%r31] %asi, %r16, %r13
	.word 0xdb3fc012  ! 1: STDF_R	std	%f13, [%r18, %r31]
	.word 0x9f80337a  ! 170: SIR	sir	0x137a
	.word 0x8d902452  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
ibp_40_130:
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
ibp_startwait40_130:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_130
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_130:
    brnz %r16, ibp_wait40_130
    ld [%r23], %r16
    ba ibp_startwait40_130
    mov 0x40, %r16
continue_ibp_40_130:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_130:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_130
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_130:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_130
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_130:
    best_set_reg(0x00000040eed6cd80,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 172: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9469fe9e  ! 173: UDIVX_I	udivx 	%r7, 0xfffffe9e, %r10
	.word 0x9b6b4002  ! 174: SDIVX_R	sdivx	%r13, %r2, %r13
dvapa_40_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xea9, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc032  ! 175: LDXA_R	ldxa	[%r31, %r18] 0x01, %r16
	.word 0xa7807057  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x1057, %-
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
    brnz %r10, cwq_40_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_132
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 177: RDPC	rd	%pc, %r20
fpinit_40_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 178: FDIVs	fdivs	%f0, %f4, %f8
splash_lsu_40_134:
	nop
	ta T_CHANGE_HPRIV
	set 0x01ceccb9, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802083  ! 180: WRASI_I	wr	%r0, 0x0083, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_135)+24, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_135)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_135:
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
xir_40_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98332cf  ! 181: WR_SET_SOFTINT_I	wr	%r12, 0x12cf, %set_softint
trapasi_40_136:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xdad84940  ! 182: LDXA_R	ldxa	[%r1, %r0] 0x4a, %r13
intveclr_40_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa372a6aac8246a6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_40_138:
	tsubcctv %r18, 0x1f10, %r12
	.word 0xda07e134  ! 184: LDUW_I	lduw	[%r31 + 0x0134], %r13
splash_hpstate_40_139:
	ta T_CHANGE_NONHPRIV
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81983595  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1595, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_40_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e160  ! 1: STQF_I	-	%f13, [0x0160, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903e9f  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x1e9f, %pstate
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 188: Tcc_R	te	icc_or_xcc, %r0 + %r30
ibp_40_141:
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
ibp_startwait40_141:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_141
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_141:
    brnz %r16, ibp_wait40_141
    ld [%r23], %r16
    ba ibp_startwait40_141
    mov 0x40, %r16
continue_ibp_40_141:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_141:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_141
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_141:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_141
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_141:
    best_set_reg(0x000000509ecd80ea,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9b702bfa  ! 189: POPC_I	popc	0x0bfa, %r13
tagged_40_142:
	tsubcctv %r12, 0x1648, %r20
	.word 0xd807e15d  ! 190: LDUW_I	lduw	[%r31 + 0x015d], %r12
	.word 0x87802055  ! 191: WRASI_I	wr	%r0, 0x0055, %asi
intveclr_40_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb6d3db7d753c3a21, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_144) + 48, 16, 16)) -> intp(2,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_144)&0xffffffff) + 40, 16, 16)) -> intp(6,0,12,,,,,1)
#else
	set 0x19c0dfb9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 194: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_40_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcd0, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 196: STDFA_R	stda	%f16, [%r0, %r31]
splash_tba_40_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa8c1b543  ! 198: ADDCcc_I	addccc 	%r6, 0xfffff543, %r20
pmu_40_148:
	nop
	setx 0xffffffbcffffffa7, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_149:
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
ibp_startwait40_149:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_149
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_149:
    brnz %r16, ibp_wait40_149
    ld [%r23], %r16
    ba ibp_startwait40_149
    mov 0x40, %r16
continue_ibp_40_149:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_149:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_149
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_149:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_149
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_149:
    best_set_reg(0x00000040ebc0ea16,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 200: STDFA_R	stda	%f0, [%r0, %r31]
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
ibp_20_1:
	nop
	.word 0xe19fda00  ! 1: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_20_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 2: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_20_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d904010  ! 3: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xe19fe180  ! 4: LDDFA_I	ldda	[%r31, 0x0180], %f16
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
    brnz %r10, cwq_20_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_4
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_4:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 5: RDPC	rd	%pc, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_5-donret_20_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0097c000 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d16, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r11+%r0], %g1
	done
donretarg_20_5:
	.word 0x81982f01  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
	.word 0xe937e1f2  ! 7: STQF_I	-	%f20, [0x01f2, %r31]
jmptr_20_6:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a7c9cd  ! 1: FDIVd	fdivd	%f62, %f44, %f20
	.word 0x9f8035b4  ! 10: SIR	sir	0x15b4
	.word 0x8d802004  ! 11: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_20_8:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x48) 
	.word 0xe8c04900  ! 12: LDSWA_R	ldswa	[%r1, %r0] 0x48, %r20
	.word 0xe81fe0d8  ! 13: LDD_I	ldd	[%r31 + 0x00d8], %r20
	.word 0x2ecb0001  ! 1: BRGEZ	brgez,a,pt	%r12,<label_0xb0001>
	.word 0x8d903887  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x1887, %pstate
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
    brnz %r10, cwq_20_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_10
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 15: RDPC	rd	%pc, %r20
brcommon2_20_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9ba109c5  ! 1: FDIVd	fdivd	%f4, %f36, %f44
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd960  ! 16: STDFA_R	stda	%f0, [%r0, %r31]
jmptr_20_12:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d924007  ! 18: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
mondo_20_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d92800d  ! 19: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
splash_cmpr_20_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 20: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_16) + 24, 16, 16)) -> intp(0,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_16)&0xffffffff) + 56, 16, 16)) -> intp(5,0,30,,,,,1)
#else
	set 0x53300637, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81db4013  ! 22: FLUSH_R	flush 	%r13, %r19, %r0
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d902a64  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0a64, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_20_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 25: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x87992af9  ! 27: WRHPR_HINTP_I	wrhpr	%r4, 0x0af9, %hintp
fpinit_20_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 28: FDIVs	fdivs	%f0, %f4, %f6
mondo_20_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d934005  ! 29: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
splash_hpstate_20_22:
	.word 0x81982a45  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a45, %hpstate
splash_tba_20_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_20_24:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8d84940  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 34: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe89fe040  ! 35: LDDA_I	ldda	[%r31, + 0x0040] %asi, %r20
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
    brnz %r10, sma_20_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 36: CASA_R	casa	[%r31] %asi, %r20, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_28-donret_20_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00255d00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1eb5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_28:
	.word 0x33400001  ! 37: FBPE	fbe,a,pn	%fcc0, <label_0x1>
brcommon2_20_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91a00546  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0e0  ! 38: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0x91904011  ! 39: WRPR_PIL_R	wrpr	%r1, %r17, %pil
	.word 0xd877e138  ! 40: STX_I	stx	%r12, [%r31 + 0x0138]
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
    brnz %r10, cwq_20_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_31
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_31:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 41: RDPC	rd	%pc, %r9
	.word 0xe69fe1e0  ! 42: LDDA_I	ldda	[%r31, + 0x01e0] %asi, %r19
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
    brnz %r10, sma_20_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e009  ! 43: CASA_R	casa	[%r31] %asi, %r9, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_34-donret_20_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ab3100 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x154c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_34:
	.word 0xe66fe1fb  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x01fb]
	nop
	mov 0x80, %g3
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_35)+16, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_35)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_35:
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
xir_20_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9847dff  ! 46: WR_SET_SOFTINT_I	wr	%r17, 0x1dff, %set_softint
	.word 0xc32fc011  ! 47: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_37-donret_20_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0034f500 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_20_37:
	.word 0x8d903752  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1752, %pstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfe0a0  ! 50: STDFA_I	stda	%f16, [0x00a0, %r31]
splash_lsu_20_40:
	nop
	ta T_CHANGE_HPRIV
	set 0x720913e1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_20_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_41:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfdc00  ! 53: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_43-donret_20_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00db6700 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	done
.align 32
donretarg_20_43:
	.word 0x81982c46  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe128  ! 57: LDDF_I	ldd	[%r31, 0x0128], %f19
	.word 0x87802016  ! 58: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_20_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_45
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
cwq_20_45:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 60: RDPC	rd	%pc, %r9
mondo_20_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940012  ! 61: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x91d020b5  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_20_47:
	nop
	ta T_CHANGE_HPRIV
	set 0x8d16583d, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_20_48:
	nop
	.word 0xe1bfdf20  ! 64: STDFA_R	stda	%f16, [%r0, %r31]
splash_hpstate_20_49:
	.word 0x819823cf  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cf, %hpstate
	.word 0x8d903cc0  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1cc0, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3b447d4  ! 68: PDIST	pdistn	%d48, %d20, %d48
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_53-donret_20_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d5cc00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf0d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r11+%r0], %g1
	done
donretarg_20_53:
	.word 0x24cc8001  ! 69: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
    set 0x1b64, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b447c3  ! 70: PDIST	pdistn	%d48, %d34, %d50
	.word 0xa1a00167  ! 71: FABSq	dis not found

ibp_20_55:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe1a0  ! 72: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_56-donret_20_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0095cd00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x199f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
.align 32
donretarg_20_56:
	.word 0xe4ffe0ac  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x00ac] %asi
brcommon3_20_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c011  ! 1: STQF_R	-	%f18, [%r17, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4dfc031  ! 74: LDXA_R	ldxa	[%r31, %r17] 0x01, %r18
	.word 0x91928010  ! 75: WRPR_PIL_R	wrpr	%r10, %r16, %pil
splash_cmpr_20_59:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 76: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_20_60:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 77: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87802058  ! 78: WRASI_I	wr	%r0, 0x0058, %asi
brcommon3_20_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c00c  ! 1: STQF_R	-	%f18, [%r12, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe53fc010  ! 79: STDF_R	std	%f18, [%r16, %r31]
mondo_20_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94c005  ! 80: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x10ca, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b407ca  ! 82: PDIST	pdistn	%d16, %d10, %d50
	.word 0xd3e7c020  ! 83: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0xa7a00168  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_20_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_65
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
cwq_20_65:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 85: RDPC	rd	%pc, %r20
	.word 0x97450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r11
brcommon1_20_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x97a509ab  ! 87: FDIVs	fdivs	%f20, %f11, %f11
pmu_20_67:
	nop
	setx 0xffffffbdffffffaf, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_68)+40, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_68)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_68:
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
xir_20_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9852c3c  ! 89: WR_SET_SOFTINT_I	wr	%r20, 0x0c3c, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e823fe  ! 91: PREFETCHA_I	prefetcha	[%r0, + 0x03fe] %asi, #one_read
mondo_20_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 92: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	.word 0x8d903191  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1191, %pstate
	.word 0x8d802004  ! 94: WRFPRS_I	wr	%r0, 0x0004, %fprs
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
    brnz %r10, sma_20_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 95: CASA_R	casa	[%r31] %asi, %r10, %r8
ibp_20_74:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9b703925  ! 96: POPC_I	popc	0x1925, %r13
	.word 0xc3ec0031  ! 97: PREFETCHA_R	prefetcha	[%r16, %r17] 0x01, #one_read
trapasi_20_76:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8c04b40  ! 98: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_20_77:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbcffffffa7, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_20_79:
	set 0x60540000, %r31
	.word 0x85853bfa  ! 102: WRCCR_I	wr	%r20, 0x1bfa, %ccr
	.word 0xd8cfe018  ! 103: LDSBA_I	ldsba	[%r31, + 0x0018] %asi, %r12
change_to_randtl_20_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_20_81:
	nop
	setx 0xffffffbeffffffa5, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xef760883, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe090  ! 107: LDSBA_I	ldsba	[%r31, + 0x0090] %asi, %r12
	.word 0xc36fe140  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0140], #one_read
	.word 0x9f802ffb  ! 108: SIR	sir	0x0ffb
	.word 0xd8dfe1f8  ! 109: LDXA_I	ldxa	[%r31, + 0x01f8] %asi, %r12
	.word 0x87802014  ! 110: WRASI_I	wr	%r0, 0x0014, %asi
mondo_20_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d91c011  ! 111: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
	.word 0x87ab4a44  ! 113: FCMPd	fcmpd	%fcc<n>, %f44, %f4
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
    brnz %r10, cwq_20_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_85
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
cwq_20_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 114: RDPC	rd	%pc, %r18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_86) + 40, 16, 16)) -> intp(5,0,0,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_86)&0xffffffff) + 32, 16, 16)) -> intp(3,0,20,,,,,1)
#else
	set 0x3850ce3c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_87:
	nop
	setx 0xffffffb9ffffffa3, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_20_88:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xd8d84920  ! 117: LDXA_R	ldxa	[%r1, %r0] 0x49, %r12
	.word 0x95450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r10
fpinit_20_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 119: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xc30fc00d  ! 1: LDXFSR_R	ld-fsr	[%r31, %r13], %f1
	.word 0x9f8034ef  ! 120: SIR	sir	0x14ef
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_90-donret_20_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00279900 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x148e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
.align 32
donretarg_20_90:
	.word 0xe66fe0d8  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x00d8]
	.word 0xe69fc02b  ! 1: LDDA_R	ldda	[%r31, %r11] 0x01, %r19
	.word 0x9f802611  ! 122: SIR	sir	0x0611
splash_htba_20_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_20_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_92
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
cwq_20_92:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 124: RDPC	rd	%pc, %r16
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 126: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc3e8c026  ! 127: PREFETCHA_R	prefetcha	[%r3, %r6] 0x01, #one_read
	.word 0x99702c9e  ! 128: POPC_I	popc	0x0c9e, %r12
	.word 0x9f80321a  ! 129: SIR	sir	0x121a
	.word 0xe88008a0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
intveclr_20_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcde8ed01559011c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_98:
	.word 0x81983e5f  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5f, %hpstate
trapasi_20_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8904e40  ! 133: LDUHA_R	lduha	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_100)+24, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_100)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_100:
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
xir_20_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984eeb6  ! 134: WR_SET_SOFTINT_I	wr	%r19, 0x0eb6, %set_softint
intveclr_20_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0x36c66d0e49c23e67, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0x608b555f8b1eacd8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_103-donret_20_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0097ce00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dd6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r11+%r0], %g1
	done
donretarg_20_103:
	.word 0xe86fe048  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x0048]
ibp_20_104:
	nop
	.word 0xc19fd920  ! 138: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_20_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 139: CASA_R	casa	[%r31] %asi, %r12, %r20
splash_cmpr_20_106:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 140: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe93fc00d  ! 141: STDF_R	std	%f20, [%r13, %r31]
	.word 0x91d020b4  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_hpstate_20_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81983f87  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f87, %hpstate
dvapa_20_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xacd, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95703287  ! 144: POPC_I	popc	0x1287, %r10
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f35  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0f35, %pstate
memptr_20_111:
	set user_data_start, %r31
	.word 0x8582a52e  ! 146: WRCCR_I	wr	%r10, 0x052e, %ccr
ceter_20_112:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 147: RDTICK	rd	%tick, %r13
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_113-donret_20_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0xe000 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x13d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	ldx [%r11+%r0], %g1
	done
donretarg_20_113:
	.word 0xe6ffe018  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x0018] %asi
splash_tba_20_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_20_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_20_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 151: FCMPd	fcmpd	%fcc<n>, %f0, %f4
tagged_20_117:
	taddcctv %r11, 0x1090, %r17
	.word 0xe607e114  ! 152: LDUW_I	lduw	[%r31 + 0x0114], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_118)+8, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_118)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_118:
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
xir_20_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984a7a4  ! 153: WR_SET_SOFTINT_I	wr	%r18, 0x07a4, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_20_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c004  ! 155: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x87802039  ! 157: WRASI_I	wr	%r0, 0x0039, %asi
	.word 0xa669667f  ! 158: UDIVX_I	udivx 	%r5, 0x067f, %r19
splash_cmpr_20_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_122-donret_20_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00816b00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b1f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	ldx [%r12+%r0], %g1
	retry
donretarg_20_122:
	.word 0x99a449d4  ! 160: FDIVd	fdivd	%f48, %f20, %f12
pmu_20_123:
	nop
	setx 0xffffffb5ffffffae, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_20_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_20_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91800a  ! 163: WRPR_WSTATE_R	wrpr	%r6, %r10, %wstate
	.word 0xa1902002  ! 164: WRPR_GL_I	wrpr	%r0, 0x0002, %-
trapasi_20_126:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5b) 
	.word 0xdad84b60  ! 165: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r13
	.word 0x8d802000  ! 166: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_20_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_20_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 169: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0xc32fc00c  ! 1: STXFSR_R	st-sfr	%f1, [%r12, %r31]
	.word 0x9f80307b  ! 170: SIR	sir	0x107b
	.word 0x8d903432  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x1432, %pstate
ibp_20_130:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe060  ! 172: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xa46c60d1  ! 173: UDIVX_I	udivx 	%r17, 0x00d1, %r18
	.word 0xa9688004  ! 174: SDIVX_R	sdivx	%r2, %r4, %r20
dvapa_20_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xce1, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc032  ! 175: STDA_R	stda	%r16, [%r31 + %r18] 0x01
	.word 0xa7817a24  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x1a24, %-
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
    brnz %r10, cwq_20_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_132
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 177: RDPC	rd	%pc, %r18
fpinit_20_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 178: FCMPLE32	fcmple32	%d0, %d4, %r4
splash_lsu_20_134:
	nop
	ta T_CHANGE_HPRIV
	set 0x3b0cd0f2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802083  ! 180: WRASI_I	wr	%r0, 0x0083, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_135)+32, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_135)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_135:
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
xir_20_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98427de  ! 181: WR_SET_SOFTINT_I	wr	%r16, 0x07de, %set_softint
trapasi_20_136:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xda884940  ! 182: LDUBA_R	lduba	[%r1, %r0] 0x4a, %r13
intveclr_20_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8a9074173e2a7d3d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_20_138:
	tsubcctv %r2, 0x1441, %r16
	.word 0xda07e187  ! 184: LDUW_I	lduw	[%r31 + 0x0187], %r13
splash_hpstate_20_139:
	ta T_CHANGE_NONHPRIV
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x81983e4d  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4d, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_20_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e110  ! 1: STQF_I	-	%f13, [0x0110, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81983dcd  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dcd, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 188: Tcc_R	te	icc_or_xcc, %r0 + %r30
ibp_20_141:
	nop
	.word 0xc3ec402d  ! 189: PREFETCHA_R	prefetcha	[%r17, %r13] 0x01, #one_read
tagged_20_142:
	tsubcctv %r17, 0x1019, %r3
	.word 0xd807e090  ! 190: LDUW_I	lduw	[%r31 + 0x0090], %r12
	.word 0x8780204f  ! 191: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_20_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe2913bfd7f96d03d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_144) + 0, 16, 16)) -> intp(2,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_144)&0xffffffff) + 32, 16, 16)) -> intp(5,0,8,,,,,1)
#else
	set 0x711053d9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 194: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_20_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf47, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe120  ! 196: LDDFA_I	ldda	[%r31, 0x0120], %f16
splash_tba_20_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x98c2a90d  ! 198: ADDCcc_I	addccc 	%r10, 0x090d, %r12
pmu_20_148:
	nop
	setx 0xffffffbfffffffa6, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_149:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe020  ! 200: LDDFA_I	ldda	[%r31, 0x0020], %f16
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
ibp_10_1:
	nop
	.word 0xc19fdf20  ! 1: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_10_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 2: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_10_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92c012  ! 3: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0xe19fe160  ! 4: LDDFA_I	ldda	[%r31, 0x0160], %f16
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
    brnz %r10, cwq_10_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_4
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
cwq_10_4:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 5: RDPC	rd	%pc, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_5-donret_10_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008cb400 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r11+%r0], %g1
	done
donretarg_10_5:
	.word 0x8198241f  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041f, %hpstate
	.word 0xe937e082  ! 7: STQF_I	-	%f20, [0x0082, %r31]
jmptr_10_6:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9b7c492  ! 1: FCMPLE32	fcmple32	%d62, %d18, %r20
	.word 0x9f8033af  ! 10: SIR	sir	0x13af
	.word 0x8d802004  ! 11: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_10_8:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x48) 
	.word 0xe8884900  ! 12: LDUBA_R	lduba	[%r1, %r0] 0x48, %r20
	.word 0xe81fe068  ! 13: LDD_I	ldd	[%r31 + 0x0068], %r20
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d903943  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x1943, %pstate
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
    brnz %r10, cwq_10_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_10
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
cwq_10_10:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 15: RDPC	rd	%pc, %r11
brcommon2_10_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00a  ! 1: FLUSH_R	flush 	%r31, %r10, %r0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc3e0  ! 16: LDDFA_R	ldda	[%r31, %r0], %f16
jmptr_10_12:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d948001  ! 18: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
mondo_10_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d94800b  ! 19: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
splash_cmpr_10_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 20: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_16) + 40, 16, 16)) -> intp(5,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_16)&0xffffffff) + 8, 16, 16)) -> intp(1,0,14,,,,,1)
#else
	set 0x34c0305a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81dd0008  ! 22: FLUSH_R	flush 	%r20, %r8, %r0
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d21  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0d21, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_10_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d92c008  ! 25: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x879cfcf8  ! 27: WRHPR_HINTP_I	wrhpr	%r19, 0x1cf8, %hintp
fpinit_10_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e22  ! 28: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe22] %asi, #one_read
mondo_10_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d930005  ! 29: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
splash_hpstate_10_22:
	.word 0x81983964  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1964, %hpstate
splash_tba_10_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_10_24:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8904940  ! 32: LDUHA_R	lduha	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 34: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0xe89fe068  ! 35: LDDA_I	ldda	[%r31, + 0x0068] %asi, %r20
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
    brnz %r10, sma_10_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 36: CASA_R	casa	[%r31] %asi, %r18, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_28-donret_10_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ee8b00 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5c3, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_28:
	.word 0x29400001  ! 37: FBPL	fbl,a,pn	%fcc0, <label_0x1>
brcommon2_10_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a7c972  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe000  ! 38: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0x91944010  ! 39: WRPR_PIL_R	wrpr	%r17, %r16, %pil
	.word 0xd877e0e0  ! 40: STX_I	stx	%r12, [%r31 + 0x00e0]
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
    brnz %r10, cwq_10_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_31
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
cwq_10_31:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 41: RDPC	rd	%pc, %r8
	.word 0xe697c02d  ! 42: LDUHA_R	lduha	[%r31, %r13] 0x01, %r19
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
    brnz %r10, sma_10_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 43: CASA_R	casa	[%r31] %asi, %r16, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_34-donret_10_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0077cc00 | (54 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c0b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_34:
	.word 0xe66fe1e5  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x01e5]
	nop
	mov 0x80, %g3
	.word 0x22cb0001  ! 1: BRZ	brz,a,pt	%r12,<label_0xb0001>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_35)+40, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_35)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_35:
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
xir_10_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981335d  ! 46: WR_SET_SOFTINT_I	wr	%r4, 0x135d, %set_softint
	.word 0xe697c032  ! 47: LDUHA_R	lduha	[%r31, %r18] 0x01, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_37-donret_10_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0031fe00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdb, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_10_37:
	.word 0x8d902b4f  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0b4f, %pstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fda00  ! 50: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_10_40:
	nop
	ta T_CHANGE_HPRIV
	set 0x006efe01, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_10_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_41:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe1bfd920  ! 53: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_43-donret_10_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0014ca00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	done
.align 32
donretarg_10_43:
	.word 0x819831d5  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x11d5, %hpstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe1b0  ! 57: LDDF_I	ldd	[%r31, 0x01b0], %f19
	.word 0x8780201c  ! 58: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_10_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_45
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
cwq_10_45:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 60: RDPC	rd	%pc, %r11
mondo_10_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d92c011  ! 61: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0x91d020b5  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_10_47:
	nop
	ta T_CHANGE_HPRIV
	set 0x24358e43, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_10_48:
	nop
	.word 0xc1bfda00  ! 64: STDFA_R	stda	%f0, [%r0, %r31]
splash_hpstate_10_49:
	.word 0x8198229d  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0x8d903d8b  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1d8b, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91b14488  ! 68: FCMPLE32	fcmple32	%d36, %d8, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_53-donret_10_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004b4700 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r11+%r0], %g1
	done
donretarg_10_53:
	.word 0x35400001  ! 69: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
    set 0x3ce6, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b1c7c5  ! 70: PDIST	pdistn	%d38, %d36, %d42
	.word 0xa9a00174  ! 71: FABSq	dis not found

ibp_10_55:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 72: STDFA_R	stda	%f0, [%r0, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_56-donret_10_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001b4b00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x504, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
.align 32
donretarg_10_56:
	.word 0xe4ffe186  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x0186] %asi
brcommon3_10_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c010  ! 1: STQF_R	-	%f18, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe53fc008  ! 74: STDF_R	std	%f18, [%r8, %r31]
	.word 0x9191000b  ! 75: WRPR_PIL_R	wrpr	%r4, %r11, %pil
splash_cmpr_10_59:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 76: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_10_60:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 77: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87802089  ! 78: WRASI_I	wr	%r0, 0x0089, %asi
brcommon3_10_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c013  ! 1: STQF_R	-	%f18, [%r19, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4dfc033  ! 79: LDXA_R	ldxa	[%r31, %r19] 0x01, %r18
mondo_10_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950003  ! 80: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x17c5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b4c7cb  ! 82: PDIST	pdistn	%d50, %d42, %d20
	.word 0xd3e7c020  ! 83: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0xa7a00174  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_10_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_65
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
cwq_10_65:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 85: RDPC	rd	%pc, %r9
	.word 0x91450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r8
brcommon1_10_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7d4  ! 1: PDIST	pdistn	%d62, %d20, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7b1c7d0  ! 87: PDIST	pdistn	%d38, %d16, %d50
pmu_10_67:
	nop
	setx 0xffffffb8ffffffa7, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_68)+8, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_68)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_68:
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
xir_10_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981fa3c  ! 89: WR_SET_SOFTINT_I	wr	%r7, 0x1a3c, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e823fe  ! 91: PREFETCHA_I	prefetcha	[%r0, + 0x03fe] %asi, #one_read
mondo_10_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d928001  ! 92: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
	.word 0x8d9030b4  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x10b4, %pstate
	.word 0x8d802000  ! 94: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
    brnz %r10, sma_10_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 95: CASA_R	casa	[%r31] %asi, %r8, %r8
ibp_10_74:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99a409b0  ! 96: FDIVs	fdivs	%f16, %f16, %f12
	.word 0xc3e9002c  ! 97: PREFETCHA_R	prefetcha	[%r4, %r12] 0x01, #one_read
trapasi_10_76:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8c04b40  ! 98: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_10_77:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb2ffffffaf, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_10_79:
	set 0x60140000, %r31
	.word 0x8581370c  ! 102: WRCCR_I	wr	%r4, 0x170c, %ccr
	.word 0xd8cfe078  ! 103: LDSBA_I	ldsba	[%r31, + 0x0078] %asi, %r12
change_to_randtl_10_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_10_81:
	nop
	setx 0xffffffbaffffffac, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x9d501388, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x22cc8001  ! 1: BRZ	brz,a,pt	%r18,<label_0xc8001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe0d8  ! 107: LDSBA_I	ldsba	[%r31, + 0x00d8] %asi, %r12
	.word 0xc36fe1e0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x01e0], #one_read
	.word 0x9f803224  ! 108: SIR	sir	0x1224
	.word 0xd8dfe118  ! 109: LDXA_I	ldxa	[%r31, + 0x0118] %asi, %r12
	.word 0x87802004  ! 110: WRASI_I	wr	%r0, 0x0004, %asi
mondo_10_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d910011  ! 111: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
	.word 0x87a94a51  ! 113: FCMPd	fcmpd	%fcc<n>, %f36, %f48
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
    brnz %r10, cwq_10_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_85
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
cwq_10_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 114: RDPC	rd	%pc, %r18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_86) + 8, 16, 16)) -> intp(7,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_86)&0xffffffff) + 24, 16, 16)) -> intp(2,0,9,,,,,1)
#else
	set 0xfe0949e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_87:
	nop
	setx 0xffffffbbffffffac, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_10_88:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x49) 
	.word 0xd8d04920  ! 117: LDSHA_R	ldsha	[%r1, %r0] 0x49, %r12
	.word 0x91450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r8
fpinit_10_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 119: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xc32fc010  ! 1: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	.word 0x9f803e0a  ! 120: SIR	sir	0x1e0a
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_90-donret_10_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e0df00 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1382, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
.align 32
donretarg_10_90:
	.word 0xe66fe1a1  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x01a1]
	.word 0xe6dfc032  ! 1: LDXA_R	ldxa	[%r31, %r18] 0x01, %r19
	.word 0x9f8025e5  ! 122: SIR	sir	0x05e5
splash_htba_10_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_10_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_92
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_92:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 124: RDPC	rd	%pc, %r11
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 126: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa9b207c1  ! 127: PDIST	pdistn	%d8, %d32, %d20
	.word 0x93a149a2  ! 128: FDIVs	fdivs	%f5, %f2, %f9
	.word 0x87a88a49  ! 129: FCMPd	fcmpd	%fcc<n>, %f2, %f40
	.word 0xe8800ae0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
intveclr_10_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe41e1882a0a44653, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_98:
	.word 0x81983585  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1585, %hpstate
trapasi_10_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8884e40  ! 133: LDUBA_R	lduba	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_100)+56, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_100)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_100:
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
xir_10_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9822959  ! 134: WR_SET_SOFTINT_I	wr	%r8, 0x0959, %set_softint
intveclr_10_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdcd59f1fadf6295c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9c22d1429bed53ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_103-donret_10_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00649900 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r11+%r0], %g1
	done
donretarg_10_103:
	.word 0xe86fe1b9  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x01b9]
ibp_10_104:
	nop
	.word 0xe19fe100  ! 138: LDDFA_I	ldda	[%r31, 0x0100], %f16
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
    brnz %r10, sma_10_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 139: CASA_R	casa	[%r31] %asi, %r17, %r20
splash_cmpr_10_106:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 140: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8dfc028  ! 141: LDXA_R	ldxa	[%r31, %r8] 0x01, %r20
	.word 0x91d020b5  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_hpstate_10_108:
	ta T_CHANGE_NONHPRIV
	.word 0x819822cf  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cf, %hpstate
dvapa_10_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8cb, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91a489b2  ! 144: FDIVs	fdivs	%f18, %f18, %f8
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d903197  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1197, %pstate
memptr_10_111:
	set user_data_start, %r31
	.word 0x8581e603  ! 146: WRCCR_I	wr	%r7, 0x0603, %ccr
ceter_10_112:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 147: RDTICK	rd	%tick, %r12
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_113-donret_10_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00958000 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a7c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	ldx [%r11+%r0], %g1
	done
donretarg_10_113:
	.word 0xe6ffe162  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x0162] %asi
splash_tba_10_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_10_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_10_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 151: FCMPd	fcmpd	%fcc<n>, %f0, %f4
tagged_10_117:
	taddcctv %r12, 0x1e60, %r19
	.word 0xe607e1d8  ! 152: LDUW_I	lduw	[%r31 + 0x01d8], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_118)+56, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_118)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_118:
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
xir_10_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9826130  ! 153: WR_SET_SOFTINT_I	wr	%r9, 0x0130, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_10_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d904014  ! 155: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x87802004  ! 157: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9a6d3120  ! 158: UDIVX_I	udivx 	%r20, 0xfffff120, %r13
splash_cmpr_10_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_122-donret_10_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0019f400 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e0f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	ldx [%r12+%r0], %g1
	retry
donretarg_10_122:
	.word 0xa1a409d3  ! 160: FDIVd	fdivd	%f16, %f50, %f16
pmu_10_123:
	nop
	setx 0xffffffbfffffffa0, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_10_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_10_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d928011  ! 163: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0xa1902002  ! 164: WRPR_GL_I	wrpr	%r0, 0x0002, %-
trapasi_10_126:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5b) 
	.word 0xda904b60  ! 165: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r13
	.word 0x8d802000  ! 166: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_10_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_10_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00a  ! 169: CASA_R	casa	[%r31] %asi, %r10, %r13
	.word 0xdb1fe1b0  ! 1: LDDF_I	ldd	[%r31, 0x01b0], %f13
	.word 0x9f803221  ! 170: SIR	sir	0x1221
	.word 0x8d903819  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x1819, %pstate
ibp_10_130:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 172: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa26cb9f2  ! 173: UDIVX_I	udivx 	%r18, 0xfffff9f2, %r17
	.word 0x97684005  ! 174: SDIVX_R	sdivx	%r1, %r5, %r11
dvapa_10_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa76, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 175: CASA_R	casa	[%r31] %asi, %r19, %r16
	.word 0xa784ed23  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x0d23, %-
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
    brnz %r10, cwq_10_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_132
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
cwq_10_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 177: RDPC	rd	%pc, %r16
fpinit_10_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d17  ! 178: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd17] %asi, #one_read
splash_lsu_10_134:
	nop
	ta T_CHANGE_HPRIV
	set 0xa4931b64, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802039  ! 180: WRASI_I	wr	%r0, 0x0039, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_135)+8, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_135)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_135:
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
xir_10_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9846f8a  ! 181: WR_SET_SOFTINT_I	wr	%r17, 0x0f8a, %set_softint
trapasi_10_136:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xdac84940  ! 182: LDSBA_R	ldsba	[%r1, %r0] 0x4a, %r13
intveclr_10_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa45e1a1ec7fe11e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_10_138:
	tsubcctv %r18, 0x1205, %r5
	.word 0xda07e115  ! 184: LDUW_I	lduw	[%r31 + 0x0115], %r13
splash_hpstate_10_139:
	ta T_CHANGE_NONHPRIV
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198340d  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x140d, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_10_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e1f0  ! 1: STQF_I	-	%f13, [0x01f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903f4f  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x1f4f, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
ibp_10_141:
	nop
	.word 0x87ac8a4a  ! 189: FCMPd	fcmpd	%fcc<n>, %f18, %f10
tagged_10_142:
	tsubcctv %r2, 0x19b4, %r20
	.word 0xd807e09d  ! 190: LDUW_I	lduw	[%r31 + 0x009d], %r12
	.word 0x8780208a  ! 191: WRASI_I	wr	%r0, 0x008a, %asi
intveclr_10_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe30d08e64350c328, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_144) + 40, 16, 16)) -> intp(7,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_144)&0xffffffff) + 40, 16, 16)) -> intp(2,0,5,,,,,1)
#else
	set 0x8b08e2b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 194: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_10_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb54, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe180  ! 196: STDFA_I	stda	%f16, [0x0180, %r31]
splash_tba_10_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa6c124c5  ! 198: ADDCcc_I	addccc 	%r4, 0x04c5, %r19
pmu_10_148:
	nop
	setx 0xffffffb6ffffffa8, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_149:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdc00  ! 200: LDDFA_R	ldda	[%r31, %r0], %f16
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
vahole5_8_0:
    nop
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	ta T_CHANGE_PRIV
ibp_8_1:
	nop
	.word 0xe1bfda00  ! 1: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_8_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 2: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_8_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d918011  ! 3: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	.word 0xe19fe0a0  ! 4: LDDFA_I	ldda	[%r31, 0x00a0], %f16
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
    brnz %r10, cwq_8_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_4
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 5: RDPC	rd	%pc, %r18
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_5-donret_8_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0094f200 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x709, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r11+%r0], %g1
	done
donretarg_8_5:
	.word 0x819825dd  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dd, %hpstate
	.word 0xe937e0f8  ! 7: STQF_I	-	%f20, [0x00f8, %r31]
jmptr_8_6:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803883  ! 10: SIR	sir	0x1883
	.word 0x8d802004  ! 11: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_8_8:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x48) 
	.word 0xe8d04900  ! 12: LDSHA_R	ldsha	[%r1, %r0] 0x48, %r20
	.word 0xe81fe078  ! 13: LDD_I	ldd	[%r31 + 0x0078], %r20
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d90273b  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x073b, %pstate
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
    brnz %r10, cwq_8_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_10
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
cwq_8_10:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 15: RDPC	rd	%pc, %r11
brcommon2_8_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9ba509c1  ! 1: FDIVd	fdivd	%f20, %f32, %f44
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe060  ! 16: LDDFA_I	ldda	[%r31, 0x0060], %f0
jmptr_8_12:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94000c  ! 18: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
mondo_8_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d934013  ! 19: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
splash_cmpr_8_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 20: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_16) + 8, 16, 16)) -> intp(0,0,27,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_16)&0xffffffff) + 40, 16, 16)) -> intp(5,0,9,,,,,1)
#else
	set 0x1820b104, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81dc000b  ! 22: FLUSH_R	flush 	%r16, %r11, %r0
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902f93  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0f93, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_8_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d92c00c  ! 25: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x879aed89  ! 27: WRHPR_HINTP_I	wrhpr	%r11, 0x0d89, %hintp
fpinit_8_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 28: FCMPLE32	fcmple32	%d0, %d4, %r6
mondo_8_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d904009  ! 29: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
splash_hpstate_8_22:
	.word 0x81982f54  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f54, %hpstate
splash_tba_8_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_8_24:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8c84940  ! 32: LDSBA_R	ldsba	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 34: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe89fe100  ! 35: LDDA_I	ldda	[%r31, + 0x0100] %asi, %r20
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
    brnz %r10, sma_8_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 36: CASA_R	casa	[%r31] %asi, %r8, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_28-donret_8_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002b1b00 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_28:
	.word 0x3d400001  ! 37: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon2_8_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a00552  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe160  ! 38: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0x9192c010  ! 39: WRPR_PIL_R	wrpr	%r11, %r16, %pil
	.word 0xd877e13a  ! 40: STX_I	stx	%r12, [%r31 + 0x013a]
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
    brnz %r10, cwq_8_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_31
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
cwq_8_31:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 41: RDPC	rd	%pc, %r11
vahole6_8_32:
    nop
    mov 1, %r27
    sllx %r27, 49, %r27
    jmpl %r27+0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0xe6dfc033  ! 42: LDXA_R	ldxa	[%r31, %r19] 0x01, %r19
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
    brnz %r10, sma_8_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 43: CASA_R	casa	[%r31] %asi, %r20, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_34-donret_8_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0088e400 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf3f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_34:
	.word 0xe66fe1a8  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x01a8]
	nop
	mov 0x80, %g3
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_35)+56, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_35)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_35:
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
xir_8_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9842b60  ! 46: WR_SET_SOFTINT_I	wr	%r16, 0x0b60, %set_softint
	.word 0xe69fe120  ! 47: LDDA_I	ldda	[%r31, + 0x0120] %asi, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_37-donret_8_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c37600 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_8_37:
	.word 0x8d903a8e  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x1a8e, %pstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc1bfe1c0  ! 50: STDFA_I	stda	%f0, [0x01c0, %r31]
splash_lsu_8_40:
	nop
	ta T_CHANGE_HPRIV
	set 0xa94c5c81, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_8_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_41:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc1bfc3e0  ! 53: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_43-donret_8_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eaa800 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x35f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x26c90001  ! 1: BRLZ	brlz,a,pt	%r4,<label_0x90001>
	done
.align 32
donretarg_8_43:
	.word 0x81982421  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0421, %hpstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe080  ! 57: LDDF_I	ldd	[%r31, 0x0080], %f19
	.word 0x87802083  ! 58: WRASI_I	wr	%r0, 0x0083, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_8_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_45
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_45:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 60: RDPC	rd	%pc, %r8
mondo_8_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d940007  ! 61: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0x83d02035  ! 62: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_lsu_8_47:
	nop
	ta T_CHANGE_HPRIV
	set 0xf4c33a12, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_8_48:
	nop
	.word 0xc19fde00  ! 64: LDDFA_R	ldda	[%r31, %r0], %f0
splash_hpstate_8_49:
	.word 0x8198278d  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078d, %hpstate
	.word 0x8d902fd5  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0fd5, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87a8ca51  ! 68: FCMPd	fcmpd	%fcc<n>, %f34, %f48
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_53-donret_8_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b7a500 | (54 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x747, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r11+%r0], %g1
	done
donretarg_8_53:
	.word 0x2b400001  ! 69: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
    set 19, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407c8  ! 70: PDIST	pdistn	%d16, %d8, %d20
	.word 0xa1a00161  ! 71: FABSq	dis not found

ibp_8_55:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fda00  ! 72: LDDFA_R	ldda	[%r31, %r0], %f16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_56-donret_8_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cd6f00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cc7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
.align 32
donretarg_8_56:
	.word 0xe4ffe060  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x0060] %asi
brcommon3_8_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c010  ! 1: STQF_R	-	%f18, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4bfc032  ! 74: STDA_R	stda	%r18, [%r31 + %r18] 0x01
	.word 0x91924005  ! 75: WRPR_PIL_R	wrpr	%r9, %r5, %pil
splash_cmpr_8_59:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 76: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_8_60:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 77: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87802014  ! 78: WRASI_I	wr	%r0, 0x0014, %asi
brcommon3_8_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c014  ! 1: STQF_R	-	%f18, [%r20, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4dfc029  ! 79: LDXA_R	ldxa	[%r31, %r9] 0x01, %r18
mondo_8_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 80: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %r14, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x1f2c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b347ca  ! 82: PDIST	pdistn	%d44, %d10, %d40
	fbuge,a,pn	%fcc0,  skip_8_63
	stxa %r13, [%r0] ASI_LSU_CONTROL
	.word 0xc36ceddb  ! 1: PREFETCH_I	prefetch	[%r19 + 0x0ddb], #one_read
	stxa %r11, [%r0] ASI_LSU_CONTROL
.align 32
skip_8_63:
	.word 0xd3e7c020  ! 83: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x93a00166  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_8_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_65
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
cwq_8_65:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 85: RDPC	rd	%pc, %r10
	.word 0xa7450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r19
brcommon1_8_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7cc  ! 1: PDIST	pdistn	%d62, %d12, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1703688  ! 87: POPC_I	popc	0x1688, %r16
pmu_8_67:
	nop
	setx 0xffffffb4ffffffa1, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_68)+24, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_68)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_68:
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
xir_8_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9807534  ! 89: WR_SET_SOFTINT_I	wr	%r1, 0x1534, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 91: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_8_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d92c013  ! 92: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	.word 0x8d903991  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1991, %pstate
	.word 0x8d802004  ! 94: WRFPRS_I	wr	%r0, 0x0004, %fprs
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
    brnz %r10, sma_8_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 95: CASA_R	casa	[%r31] %asi, %r9, %r8
ibp_8_74:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a349c2  ! 96: FDIVd	fdivd	%f44, %f2, %f18
	.word 0xa3a249d2  ! 97: FDIVd	fdivd	%f40, %f18, %f48
trapasi_8_76:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8c84b40  ! 98: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_8_77:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbfffffffa8, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_8_79:
	set 0x60140000, %r31
	.word 0x8584776b  ! 102: WRCCR_I	wr	%r17, 0x176b, %ccr
	.word 0xd8cfe128  ! 103: LDSBA_I	ldsba	[%r31, + 0x0128] %asi, %r12
change_to_randtl_8_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_8_81:
	nop
	setx 0xffffffbaffffffa4, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xc71b9ccd, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe0a0  ! 107: LDSBA_I	ldsba	[%r31, + 0x00a0] %asi, %r12
	.word 0x9f803dca  ! 108: SIR	sir	0x1dca
	.word 0xd8dfe190  ! 109: LDXA_I	ldxa	[%r31, + 0x0190] %asi, %r12
	.word 0x87802016  ! 110: WRASI_I	wr	%r0, 0x0016, %asi
mondo_8_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d948013  ! 111: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
vahole1_8_84:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa1b507d2  ! 113: PDIST	pdistn	%d20, %d18, %d16
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
    brnz %r10, cwq_8_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_85
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
cwq_8_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 114: RDPC	rd	%pc, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_86) + 16, 16, 16)) -> intp(2,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_86)&0xffffffff) + 48, 16, 16)) -> intp(5,0,19,,,,,1)
#else
	set 0x571017e1, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_87:
	nop
	setx 0xffffffbcffffffad, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_8_88:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xd8884920  ! 117: LDUBA_R	lduba	[%r1, %r0] 0x49, %r12
	.word 0xa7450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r19
fpinit_8_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 119: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x9f8026dc  ! 120: SIR	sir	0x06dc
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_90-donret_8_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0093a300 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1647, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
.align 32
donretarg_8_90:
	.word 0xe66fe026  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x0026]
	.word 0x9f8036d6  ! 122: SIR	sir	0x16d6
splash_htba_8_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_8_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_92
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_92:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 124: RDPC	rd	%pc, %r17
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 126: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc3e90032  ! 127: PREFETCHA_R	prefetcha	[%r4, %r18] 0x01, #one_read
	.word 0xa9b0c7cb  ! 128: PDIST	pdistn	%d34, %d42, %d20
	fblg,a,pn	%fcc0,  skip_8_96
	brlez,a,pt	%r4, skip_8_96
.align 2048
skip_8_96:
	.word 0x87ac8a53  ! 129: FCMPd	fcmpd	%fcc<n>, %f18, %f50
	.word 0xe88008a0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
intveclr_8_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0x253b0c7acd5feda8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_98:
	.word 0x81983787  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1787, %hpstate
trapasi_8_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8c84e40  ! 133: LDSBA_R	ldsba	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_100)+8, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_100)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_100:
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
xir_8_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9826a11  ! 134: WR_SET_SOFTINT_I	wr	%r9, 0x0a11, %set_softint
intveclr_8_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8a8b0839830a1c10, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7ba4886c73c8be71, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_103-donret_8_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aa7100 | (54 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c11, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r11+%r0], %g1
	done
donretarg_8_103:
	.word 0xe86fe0eb  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x00eb]
ibp_8_104:
	nop
	.word 0xc1bfe080  ! 138: STDFA_I	stda	%f0, [0x0080, %r31]
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
    brnz %r10, sma_8_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 139: CASA_R	casa	[%r31] %asi, %r12, %r20
splash_cmpr_8_106:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 140: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe83fe0c0  ! 141: STD_I	std	%r20, [%r31 + 0x00c0]
	.word 0x93d020b4  ! 142: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_hpstate_8_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81983e67  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e67, %hpstate
dvapa_8_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f2, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97702c2d  ! 144: POPC_I	popc	0x0c2d, %r11
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903b83  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1b83, %pstate
memptr_8_111:
	set user_data_start, %r31
	.word 0x8582f8ee  ! 146: WRCCR_I	wr	%r11, 0x18ee, %ccr
ceter_8_112:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 147: RDTICK	rd	%tick, %r16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_113-donret_8_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cdb300 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b52, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	ldx [%r11+%r0], %g1
	done
donretarg_8_113:
	.word 0xe6ffe029  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x0029] %asi
splash_tba_8_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_8_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_8_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 151: FDIVd	fdivd	%f0, %f4, %f6
tagged_8_117:
	taddcctv %r19, 0x15f3, %r17
	.word 0xe607e136  ! 152: LDUW_I	lduw	[%r31 + 0x0136], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_118)+48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_118)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_118:
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
xir_8_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98220db  ! 153: WR_SET_SOFTINT_I	wr	%r8, 0x00db, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_8_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 155: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x8780204f  ! 157: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa06ab5b8  ! 158: UDIVX_I	udivx 	%r10, 0xfffff5b8, %r16
splash_cmpr_8_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_122-donret_8_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00224600 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ddf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	ldx [%r12+%r0], %g1
	retry
donretarg_8_122:
	.word 0xa5a409d4  ! 160: FDIVd	fdivd	%f16, %f20, %f18
pmu_8_123:
	nop
	setx 0xffffffbeffffffa8, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_8_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_8_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d910013  ! 163: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0xa190200b  ! 164: WRPR_GL_I	wrpr	%r0, 0x000b, %-
trapasi_8_126:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xdad04b60  ! 165: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r13
	.word 0x8d802004  ! 166: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_8_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_8_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 169: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x9f8022e9  ! 170: SIR	sir	0x02e9
	.word 0x8d9022c5  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x02c5, %pstate
ibp_8_130:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe100  ! 172: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0x926c74d4  ! 173: UDIVX_I	udivx 	%r17, 0xfffff4d4, %r9
	.word 0x956cc006  ! 174: SDIVX_R	sdivx	%r19, %r6, %r10
dvapa_8_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbe4, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc014  ! 175: LDDF_R	ldd	[%r31, %r20], %f16
	.word 0xa782e921  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x0921, %-
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
    brnz %r10, cwq_8_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_132
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 177: RDPC	rd	%pc, %r18
fpinit_8_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d17  ! 178: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd17] %asi, #one_read
splash_lsu_8_134:
	nop
	ta T_CHANGE_HPRIV
	set 0xe9b4ad58, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 180: WRASI_I	wr	%r0, 0x0020, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_135)+40, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_135)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_135:
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
xir_8_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984fb8e  ! 181: WR_SET_SOFTINT_I	wr	%r19, 0x1b8e, %set_softint
trapasi_8_136:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xdac04940  ! 182: LDSWA_R	ldswa	[%r1, %r0] 0x4a, %r13
intveclr_8_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0x80bbca91f87df313, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_8_138:
	tsubcctv %r19, 0x1c97, %r16
	.word 0xda07e15d  ! 184: LDUW_I	lduw	[%r31 + 0x015d], %r13
splash_hpstate_8_139:
	ta T_CHANGE_NONHPRIV
	.word 0x22cc0001  ! 1: BRZ	brz,a,pt	%r16,<label_0xc0001>
	.word 0x819828df  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08df, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_8_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e0a0  ! 1: STQF_I	-	%f13, [0x00a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81983a9d  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a9d, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 188: Tcc_R	tne	icc_or_xcc, %r0 + %r30
ibp_8_141:
	nop
	.word 0xa97024ad  ! 189: POPC_I	popc	0x04ad, %r20
tagged_8_142:
	tsubcctv %r0, 0x1393, %r4
	.word 0xd807e0e4  ! 190: LDUW_I	lduw	[%r31 + 0x00e4], %r12
	.word 0x8780204f  ! 191: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_8_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0x82de610cf4b33840, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_144) + 16, 16, 16)) -> intp(1,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_144)&0xffffffff) + 48, 16, 16)) -> intp(3,0,16,,,,,1)
#else
	set 0xc840f9d9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 194: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_8_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc1e, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0e0  ! 196: STDFA_I	stda	%f0, [0x00e0, %r31]
splash_tba_8_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa4c42176  ! 198: ADDCcc_I	addccc 	%r16, 0x0176, %r18
pmu_8_148:
	nop
	setx 0xffffffb6ffffffad, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_149:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe180  ! 200: STDFA_I	stda	%f16, [0x0180, %r31]
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
setup_tick:
    setx 0xabb38513bafe24bf, %r1, %r17
    wrpr %g0, %r17, %tick

    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_4:
    setx 0xc43a940b74a22bf6, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
setup_spu_4:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %l6

#ifndef SPC
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
    sllx %o2, 5, %o2    !(CID*256)
    add %l6, %o2, %l6
#endif
# 878 "diag.j"
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
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
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

unlock_sync_thds_4:
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
ibp_4_1:
	nop
	.word 0xc1bfe060  ! 1: STDFA_I	stda	%f0, [0x0060, %r31]
splash_cmpr_4_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 2: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_4_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d950002  ! 3: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0xc19fe120  ! 4: LDDFA_I	ldda	[%r31, 0x0120], %f0
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
    brnz %r10, cwq_4_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_4
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 5: RDPC	rd	%pc, %r16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_5-donret_4_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008ca500 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f5f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r11+%r0], %g1
	done
donretarg_4_5:
	.word 0x8d903d8d  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1d8d, %pstate
	.word 0xe937e01e  ! 7: STQF_I	-	%f20, [0x001e, %r31]
jmptr_4_6:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9b7c7d4  ! 1: PDIST	pdistn	%d62, %d20, %d20
	.word 0x9f80394a  ! 10: SIR	sir	0x194a
	.word 0x8d802000  ! 11: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_4_8:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x48) 
	.word 0xe8c84900  ! 12: LDSBA_R	ldsba	[%r1, %r0] 0x48, %r20
	.word 0xe81fe168  ! 13: LDD_I	ldd	[%r31 + 0x0168], %r20
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d903807  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x1807, %pstate
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
    brnz %r10, cwq_4_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_10
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_10:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 15: RDPC	rd	%pc, %r12
brcommon2_4_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc009  ! 1: FLUSH_R	flush 	%r31, %r9, %r0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe020  ! 16: STDFA_I	stda	%f16, [0x0020, %r31]
jmptr_4_12:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 18: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
mondo_4_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d930003  ! 19: WRPR_WSTATE_R	wrpr	%r12, %r3, %wstate
splash_cmpr_4_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 20: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_16) + 16, 16, 16)) -> intp(6,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_16)&0xffffffff) + 8, 16, 16)) -> intp(1,0,24,,,,,1)
#else
	set 0x5930db2e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81d8400b  ! 22: FLUSH_R	flush 	%r1, %r11, %r0
	.word 0x24ca8001  ! 1: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
	.word 0x8d902921  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x0921, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_4_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940011  ! 25: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x879a27bf  ! 27: WRHPR_HINTP_I	wrhpr	%r8, 0x07bf, %hintp
fpinit_4_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 28: FCMPLE32	fcmple32	%d0, %d4, %r6
mondo_4_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d910008  ! 29: WRPR_WSTATE_R	wrpr	%r4, %r8, %wstate
splash_hpstate_4_22:
	.word 0x81982687  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
splash_tba_4_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_4_24:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8c84940  ! 32: LDSBA_R	ldsba	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 34: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe89fe1a8  ! 35: LDDA_I	ldda	[%r31, + 0x01a8] %asi, %r20
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
    brnz %r10, sma_4_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 36: CASA_R	casa	[%r31] %asi, %r19, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_28-donret_4_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00500f00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcd6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_28:
	.word 0x27400001  ! 37: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
brcommon2_4_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a7c969  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe180  ! 38: LDDFA_I	ldda	[%r31, 0x0180], %f0
cmp_4_30:
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
    xor %r9, 0x4, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x4, %r9         ! My core mask
#endif
    mov 0x4, %r10
cmp_startwait4_30:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_30
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_30:
    brnz,a %r10, cmp_wait4_30
    ld [%r23], %r10
    ba cmp_startwait4_30
    mov 0x4, %r10
continue_cmp_4_30:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_30
    mov 0xfb, %r17
    best_set_reg(0x3fdceff047d129fa, %r16, %r17)
cmp_multi_core_4_30:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948007  ! 39: WRPR_PIL_R	wrpr	%r18, %r7, %pil
	.word 0xd877e198  ! 40: STX_I	stx	%r12, [%r31 + 0x0198]
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
    brnz %r10, cwq_4_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_31
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_31:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 41: RDPC	rd	%pc, %r12
	.word 0xe69fe1f0  ! 42: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r19
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
    brnz %r10, sma_4_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 43: CASA_R	casa	[%r31] %asi, %r11, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_34-donret_4_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d61500 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x149f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_34:
	.word 0xe66fe0b9  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x00b9]
	nop
	mov 0x80, %g3
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_35)+48, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_35)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_35:
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
xir_4_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98326e9  ! 46: WR_SET_SOFTINT_I	wr	%r12, 0x06e9, %set_softint
iaw_4_36:
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
iaw_startwait4_36:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_36
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_36:
    brnz %r16, iaw_wait4_36
    ld [%r23], %r16
    ba iaw_startwait4_36
    mov 0x4, %r16
continue_iaw_4_36:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_36:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_36
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_36:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_36
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_36:
	mov 0x38, %r18
iaw2_4_36:
	rdpr %tba, %r19
	mov 0x11,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02d  ! 47: LDUHA_R	lduha	[%r31, %r13] 0x01, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_37-donret_4_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0004f900 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1007, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_4_37:
	.word 0x8d902445  ! 48: WRPR_PSTATE_I	wrpr	%r0, 0x0445, %pstate
splash_tick_4_38:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x9fed72b4cd9d631c, %r16, %r17)
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
iaw_4_39:
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
iaw_startwait4_39:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_39
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_39:
    brnz %r16, iaw_wait4_39
    ld [%r23], %r16
    ba iaw_startwait4_39
    mov 0x4, %r16
continue_iaw_4_39:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_39:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_39
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_39:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_39
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_39:
	mov 0x38, %r18
iaw4_4_39:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe100  ! 50: STDFA_I	stda	%f0, [0x0100, %r31]
splash_lsu_4_40:
	nop
	ta T_CHANGE_HPRIV
	set 0xb8e55709, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_41:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfdf20  ! 53: STDFA_R	stda	%f16, [%r0, %r31]
splash_tick_4_42:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xd4ebe61593823e85, %r16, %r17)
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_43-donret_4_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00692e00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f5d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
.align 32
donretarg_4_43:
	.word 0x819836d5  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16d5, %hpstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe0c0  ! 57: LDDF_I	ldd	[%r31, 0x00c0], %f19
	.word 0x87802039  ! 58: WRASI_I	wr	%r0, 0x0039, %asi
splash_tick_4_44:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xa885e9545cf09b02, %r16, %r17)
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_4_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_45
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
cwq_4_45:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 60: RDPC	rd	%pc, %r18
mondo_4_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d944005  ! 61: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0x93d02035  ! 62: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_4_47:
	nop
	ta T_CHANGE_HPRIV
	set 0xcb7db2fd, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_4_48:
	nop
	.word 0xc1bfdf20  ! 64: STDFA_R	stda	%f0, [%r0, %r31]
splash_hpstate_4_49:
	.word 0x819824c7  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0x8d903f47  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1f47, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_4_52:
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
iaw_startwait4_52:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_52
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_52:
    brnz %r16, iaw_wait4_52
    ld [%r23], %r16
    ba iaw_startwait4_52
    mov 0x4, %r16
continue_iaw_4_52:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_52:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_52
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_52:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_52
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_52:
	mov 0x38, %r18
iaw2_4_52:
	rdpr %tba, %r19
	mov 0x320,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba409d4  ! 68: FDIVd	fdivd	%f16, %f20, %f44
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_53-donret_4_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a51300 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf0d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r11+%r0], %g1
	done
donretarg_4_53:
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    set 0x1847, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b487c5  ! 70: PDIST	pdistn	%d18, %d36, %d40
cmp_4_54:
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
    xor %r9, 0x4, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x4, %r9         ! My core mask
#endif
    mov 0x4, %r10
cmp_startwait4_54:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_54
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_54:
    brnz,a %r10, cmp_wait4_54
    ld [%r23], %r10
    ba cmp_startwait4_54
    mov 0x4, %r10
continue_cmp_4_54:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_54
    mov 0x58, %r17
    best_set_reg(0x6c959f8949390f22, %r16, %r17)
cmp_multi_core_4_54:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa3a0016a  ! 71: FABSq	dis not found

ibp_4_55:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc2c0  ! 72: LDDFA_R	ldda	[%r31, %r0], %f0
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_56-donret_4_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000b2800 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x89d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
.align 32
donretarg_4_56:
	.word 0xe4ffe1d6  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x01d6] %asi
brcommon3_4_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c009  ! 1: STQF_R	-	%f18, [%r9, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe51fe1a0  ! 74: LDDF_I	ldd	[%r31, 0x01a0], %f18
cmp_4_58:
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
    xor %r9, 0x4, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x4, %r9         ! My core mask
#endif
    mov 0x4, %r10
cmp_startwait4_58:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_58
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_58:
    brnz,a %r10, cmp_wait4_58
    ld [%r23], %r10
    ba cmp_startwait4_58
    mov 0x4, %r10
continue_cmp_4_58:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_58
    mov 0xb0, %r17
    best_set_reg(0xa3b47c302883b518, %r16, %r17)
cmp_multi_core_4_58:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940006  ! 75: WRPR_PIL_R	wrpr	%r16, %r6, %pil
splash_cmpr_4_59:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 76: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_4_60:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 77: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8780208b  ! 78: WRASI_I	wr	%r0, 0x008b, %asi
brcommon3_4_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c009  ! 1: STQF_R	-	%f18, [%r9, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe51fe1c0  ! 79: LDDF_I	ldd	[%r31, 0x01c0], %f18
mondo_4_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d91c011  ! 80: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x2d4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b147d0  ! 82: PDIST	pdistn	%d36, %d16, %d48
	.word 0xd3e7c020  ! 83: CASA_I	casa	[%r31] 0x 1, %r0, %r9
cmp_4_64:
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
    xor %r9, 0x4, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x4, %r9         ! My core mask
#endif
    mov 0x4, %r10
cmp_startwait4_64:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_64
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_64:
    brnz,a %r10, cmp_wait4_64
    ld [%r23], %r10
    ba cmp_startwait4_64
    mov 0x4, %r10
continue_cmp_4_64:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_64
    mov 0xce, %r17
    best_set_reg(0x0c57dc5baceaba1e, %r16, %r17)
cmp_multi_core_4_64:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91a0016a  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_4_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_65
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
cwq_4_65:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 85: RDPC	rd	%pc, %r20
	.word 0x99450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r12
brcommon1_4_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1702a80  ! 87: POPC_I	popc	0x0a80, %r16
pmu_4_67:
	nop
	setx 0xffffffb0ffffffaa, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_68)+16, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_68)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_68:
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
xir_4_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98271f4  ! 89: WR_SET_SOFTINT_I	wr	%r9, 0x11f4, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e823fe  ! 91: PREFETCHA_I	prefetcha	[%r0, + 0x03fe] %asi, #one_read
mondo_4_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d948010  ! 92: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0x8d903da3  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1da3, %pstate
	.word 0x8d802000  ! 94: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
    brnz %r10, sma_4_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r8
ibp_4_74:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa97022a3  ! 96: POPC_I	popc	0x02a3, %r20
iaw_4_75:
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
iaw_startwait4_75:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_75
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_75:
    brnz %r16, iaw_wait4_75
    ld [%r23], %r16
    ba iaw_startwait4_75
    mov 0x4, %r16
continue_iaw_4_75:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_75:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_75
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_75:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_75
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_75:
	mov 0x38, %r18
iaw1_4_75:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9702e6c  ! 97: POPC_I	popc	0x0e6c, %r20
trapasi_4_76:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8c04b40  ! 98: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_4_77:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb2ffffffaa, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_4_79:
	set 0x60540000, %r31
	.word 0x85823969  ! 102: WRCCR_I	wr	%r8, 0x1969, %ccr
	.word 0xd8cfe058  ! 103: LDSBA_I	ldsba	[%r31, + 0x0058] %asi, %r12
change_to_randtl_4_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_4_81:
	nop
	setx 0xffffffb5ffffffa1, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x64371a1f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2eca0001  ! 1: BRGEZ	brgez,a,pt	%r8,<label_0xa0001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe1d8  ! 107: LDSBA_I	ldsba	[%r31, + 0x01d8] %asi, %r12
	.word 0xd9e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r12
	.word 0x9f803ce4  ! 108: SIR	sir	0x1ce4
	.word 0xd8dfe060  ! 109: LDXA_I	ldxa	[%r31, + 0x0060] %asi, %r12
	.word 0x87802088  ! 110: WRASI_I	wr	%r0, 0x0088, %asi
mondo_4_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d950001  ! 111: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
	.word 0xa3a489d3  ! 113: FDIVd	fdivd	%f18, %f50, %f48
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
    brnz %r10, cwq_4_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_85
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_85:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 114: RDPC	rd	%pc, %r8
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_86) + 0, 16, 16)) -> intp(2,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_86)&0xffffffff) + 24, 16, 16)) -> intp(5,0,3,,,,,1)
#else
	set 0xc50c659, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_87:
	nop
	setx 0xffffffb2ffffffa4, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_4_88:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xd8904920  ! 117: LDUHA_R	lduha	[%r1, %r0] 0x49, %r12
	.word 0x99450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r12
fpinit_4_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 119: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xe63fc008  ! 1: STD_R	std	%r19, [%r31 + %r8]
	.word 0x9f803bc3  ! 120: SIR	sir	0x1bc3
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_90-donret_4_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cb4b00 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f5f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
.align 32
donretarg_4_90:
	.word 0xe66fe044  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x0044]
	.word 0xe6bfc031  ! 1: STDA_R	stda	%r19, [%r31 + %r17] 0x01
	.word 0x9f803c2a  ! 122: SIR	sir	0x1c2a
splash_htba_4_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_4_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_92
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_92:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 124: RDPC	rd	%pc, %r17
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 126: WRFPRS_I	wr	%r0, 0x0004, %fprs
iaw_4_94:
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
iaw_startwait4_94:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_94
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_94:
    brnz %r16, iaw_wait4_94
    ld [%r23], %r16
    ba iaw_startwait4_94
    mov 0x4, %r16
continue_iaw_4_94:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_94:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_94
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_94:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_94
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_94:
	mov 0x38, %r18
iaw4_4_94:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a089d4  ! 127: FDIVd	fdivd	%f2, %f20, %f40
iaw_4_95:
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
iaw_startwait4_95:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_95
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_95:
    brnz %r16, iaw_wait4_95
    ld [%r23], %r16
    ba iaw_startwait4_95
    mov 0x4, %r16
continue_iaw_4_95:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_95:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_95
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_95:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_95
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_95:
	mov 0x38, %r18
iaw4_4_95:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1b187d2  ! 128: PDIST	pdistn	%d6, %d18, %d16
	.word 0x39400001  ! 129: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8800aa0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r20
intveclr_4_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcef9267a533d8af2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_98:
	.word 0x81983057  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1057, %hpstate
trapasi_4_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8c04e40  ! 133: LDSWA_R	ldswa	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_100)+16, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_100)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_100:
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
xir_4_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98074a9  ! 134: WR_SET_SOFTINT_I	wr	%r1, 0x14a9, %set_softint
intveclr_4_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0ba80e8e0983000a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0x271fb286bc7b7d8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_103-donret_4_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007dd700 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb64, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r11+%r0], %g1
	done
donretarg_4_103:
	.word 0xe86fe190  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x0190]
ibp_4_104:
	nop
	.word 0xc1bfe180  ! 138: STDFA_I	stda	%f0, [0x0180, %r31]
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
    brnz %r10, sma_4_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 139: CASA_R	casa	[%r31] %asi, %r17, %r20
splash_cmpr_4_106:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 140: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
iaw_4_107:
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
iaw_startwait4_107:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_107
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_107:
    brnz %r16, iaw_wait4_107
    ld [%r23], %r16
    ba iaw_startwait4_107
    mov 0x4, %r16
continue_iaw_4_107:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_107:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_107
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_107:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_107
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_107:
	mov 0x38, %r18
iaw1_4_107:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe93fc010  ! 141: STDF_R	std	%f20, [%r16, %r31]
	.word 0x91d020b4  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_hpstate_4_108:
	ta T_CHANGE_NONHPRIV
	.word 0x8198210d  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010d, %hpstate
dvapa_4_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd56, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a4c9d1  ! 144: FDIVd	fdivd	%f50, %f48, %f12
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d902109  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0109, %pstate
memptr_4_111:
	set user_data_start, %r31
	.word 0x85827ceb  ! 146: WRCCR_I	wr	%r9, 0x1ceb, %ccr
ceter_4_112:
    nop
    ta T_CHANGE_HPRIV
    mov 2, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 147: RDTICK	rd	%tick, %r18
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_113-donret_4_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00217100 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x69c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	ldx [%r11+%r0], %g1
	done
donretarg_4_113:
	.word 0xe6ffe095  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x0095] %asi
splash_tba_4_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_4_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_4_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 151: FDIVd	fdivd	%f0, %f4, %f8
tagged_4_117:
	taddcctv %r12, 0x1875, %r18
	.word 0xe607e02d  ! 152: LDUW_I	lduw	[%r31 + 0x002d], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_118)+0, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_118)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_118:
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
xir_4_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9842223  ! 153: WR_SET_SOFTINT_I	wr	%r16, 0x0223, %set_softint
splash_tick_4_119:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x858df4752dbd296e, %r16, %r17)
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_4_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d92c010  ! 155: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x8780204f  ! 157: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa06cb4d2  ! 158: UDIVX_I	udivx 	%r18, 0xfffff4d2, %r16
splash_cmpr_4_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_4_122-donret_4_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001c4c00 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c05, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	ldx [%r12+%r0], %g1
	retry
donretarg_4_122:
	.word 0x9ba4c9c7  ! 160: FDIVd	fdivd	%f50, %f38, %f44
pmu_4_123:
	nop
	setx 0xffffffbdffffffae, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_4_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d94c013  ! 163: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xa190200e  ! 164: WRPR_GL_I	wrpr	%r0, 0x000e, %-
trapasi_4_126:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xdac04b60  ! 165: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r13
	.word 0x8d802000  ! 166: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_4_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_4_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 169: CASA_R	casa	[%r31] %asi, %r12, %r13
	.word 0xda97c032  ! 1: LDUHA_R	lduha	[%r31, %r18] 0x01, %r13
	.word 0x9f802a99  ! 170: SIR	sir	0x0a99
	.word 0x8d902eff  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x0eff, %pstate
ibp_4_130:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc3e0  ! 172: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x966a209c  ! 173: UDIVX_I	udivx 	%r8, 0x009c, %r11
	.word 0xa36b0011  ! 174: SDIVX_R	sdivx	%r12, %r17, %r17
dvapa_4_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xce5, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00c  ! 175: STXFSR_R	st-sfr	%f1, [%r12, %r31]
	.word 0xa784a181  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r18, 0x0181, %-
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
    brnz %r10, cwq_4_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_132
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
cwq_4_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 177: RDPC	rd	%pc, %r17
fpinit_4_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d17  ! 178: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd17] %asi, #one_read
splash_lsu_4_134:
	nop
	ta T_CHANGE_HPRIV
	set 0x134b0685, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 180: WRASI_I	wr	%r0, 0x0010, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_135)+40, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_135)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_135:
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
xir_4_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98321f4  ! 181: WR_SET_SOFTINT_I	wr	%r12, 0x01f4, %set_softint
trapasi_4_136:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xdad84940  ! 182: LDXA_R	ldxa	[%r1, %r0] 0x4a, %r13
intveclr_4_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf93f90a02f8226ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_4_138:
	tsubcctv %r12, 0x1628, %r4
	.word 0xda07e17c  ! 184: LDUW_I	lduw	[%r31 + 0x017c], %r13
splash_hpstate_4_139:
	ta T_CHANGE_NONHPRIV
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8198220f  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020f, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_4_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e100  ! 1: STQF_I	-	%f13, [0x0100, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81983fcd  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fcd, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 188: Tcc_R	tne	icc_or_xcc, %r0 + %r30
ibp_4_141:
	nop
	.word 0x87ac8a48  ! 189: FCMPd	fcmpd	%fcc<n>, %f18, %f8
tagged_4_142:
	tsubcctv %r19, 0x1890, %r4
	.word 0xd807e10d  ! 190: LDUW_I	lduw	[%r31 + 0x010d], %r12
	.word 0x87802036  ! 191: WRASI_I	wr	%r0, 0x0036, %asi
intveclr_4_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1e8b1ab5ee3cb020, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_144) + 0, 16, 16)) -> intp(6,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_144)&0xffffffff) + 8, 16, 16)) -> intp(2,0,21,,,,,1)
#else
	set 0x33b082f0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802082  ! 194: WRASI_I	wr	%r0, 0x0082, %asi
splash_tick_4_145:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xc0801f37deafa8c2, %r16, %r17)
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_4_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0x94f, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 196: STDFA_R	stda	%f16, [%r0, %r31]
splash_tba_4_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa4c23124  ! 198: ADDCcc_I	addccc 	%r8, 0xfffff124, %r18
pmu_4_148:
	nop
	setx 0xffffffb6ffffffa8, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_4_149:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe060  ! 200: LDDFA_I	ldda	[%r31, 0x0060], %f0
# 952 "diag.j"
cmpenall_4_150:
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
cmpenall_startwait4_150:
    mov 0x4, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_4_150
    nop
cmpenall_wait4_150:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait4_150
    nop
    ba,a cmpenall_startwait4_150
continue_cmpenall_4_150:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_4_150:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_4_150
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_4_150:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_4_150
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
fork_lbl_0_2:
    ta T_CHANGE_NONHPRIV 
vahole5_2_0:
    nop
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	ta T_CHANGE_PRIV
ibp_2_1:
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
    mov 0x2, %r16
ibp_startwait2_1:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_1
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_1:
    brnz %r16, ibp_wait2_1
    ld [%r23], %r16
    ba ibp_startwait2_1
    mov 0x2, %r16
continue_ibp_2_1:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_1:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_1
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_1:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_1
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_1:
    best_set_reg(0x00000040c4c00be7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fe000  ! 1: LDDFA_I	ldda	[%r31, 0x0000], %f0
splash_cmpr_2_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 2: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_2_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d940003  ! 3: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0xe19fe120  ! 4: LDDFA_I	ldda	[%r31, 0x0120], %f16
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
    brnz %r10, cwq_2_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_4
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 5: RDPC	rd	%pc, %r16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_5-donret_2_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ffc900 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd5f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r11+%r0], %g1
	done
donretarg_2_5:
	.word 0x81982852  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0852, %hpstate
	.word 0xe937e118  ! 7: STQF_I	-	%f20, [0x0118, %r31]
jmptr_2_6:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_2_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa97021b0  ! 1: POPC_I	popc	0x01b0, %r20
	.word 0x9f802601  ! 10: SIR	sir	0x0601
	.word 0x8d802004  ! 11: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_2_8:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x48) 
	.word 0xe8d84900  ! 12: LDXA_R	ldxa	[%r1, %r0] 0x48, %r20
	.word 0xe81fe088  ! 13: LDD_I	ldd	[%r31 + 0x0088], %r20
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d902533  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0533, %pstate
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
    brnz %r10, cwq_2_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_10
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_10:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 15: RDPC	rd	%pc, %r12
brcommon2_2_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe140  ! 16: STDFA_I	stda	%f16, [0x0140, %r31]
jmptr_2_12:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 18: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
mondo_2_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d948011  ! 19: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
splash_cmpr_2_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 20: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_16) + 40, 16, 16)) -> intp(1,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_16)&0xffffffff) + 48, 16, 16)) -> intp(4,0,0,,,,,1)
#else
	set 0x19a0b56e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81dcc007  ! 22: FLUSH_R	flush 	%r19, %r7, %r0
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d903001  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x1001, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_2_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d920014  ! 25: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8799e0a9  ! 27: WRHPR_HINTP_I	wrhpr	%r7, 0x00a9, %hintp
fpinit_2_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 28: FCMPLE32	fcmple32	%d0, %d4, %r8
mondo_2_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d940013  ! 29: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
splash_hpstate_2_22:
	.word 0x81983694  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1694, %hpstate
splash_tba_2_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_2_24:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8d84940  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_2_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 34: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe89fe090  ! 35: LDDA_I	ldda	[%r31, + 0x0090] %asi, %r20
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
    brnz %r10, sma_2_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 36: CASA_R	casa	[%r31] %asi, %r11, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_28-donret_2_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e06a00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1515, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_28:
	.word 0x3e800001  ! 37: BVC	bvc,a	<label_0x1>
brcommon2_2_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x99a0054b  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe100  ! 38: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0x91950013  ! 39: WRPR_PIL_R	wrpr	%r20, %r19, %pil
	.word 0xd877e0ad  ! 40: STX_I	stx	%r12, [%r31 + 0x00ad]
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
    brnz %r10, cwq_2_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_31
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 41: RDPC	rd	%pc, %r20
vahole6_2_32:
    nop
    mov 1, %r27
    sllx %r27, 49, %r27
    jmpl %r27+0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02d  ! 42: LDUHA_R	lduha	[%r31, %r13] 0x01, %r19
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
    brnz %r10, sma_2_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 43: CASA_R	casa	[%r31] %asi, %r17, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_34-donret_2_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000cb800 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_34:
	.word 0xe66fe185  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x0185]
	nop
	mov 0x80, %g3
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_35)+40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_35)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_35:
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
xir_2_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9833238  ! 46: WR_SET_SOFTINT_I	wr	%r12, 0x1238, %set_softint
	.word 0xe6dfc033  ! 47: LDXA_R	ldxa	[%r31, %r19] 0x01, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_37-donret_2_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a25700 | (54 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcd1, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_2_37:
	.word 0x819824dd  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dd, %hpstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe1bfe0c0  ! 50: STDFA_I	stda	%f16, [0x00c0, %r31]
splash_lsu_2_40:
	nop
	ta T_CHANGE_HPRIV
	set 0x0251b571, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_41:
	.word 0x8f902000  ! 52: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc1bfc3e0  ! 53: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_43-donret_2_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e4ec00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x58d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	done
.align 32
donretarg_2_43:
	.word 0x819834dd  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x14dd, %hpstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe190  ! 57: LDDF_I	ldd	[%r31, 0x0190], %f19
	.word 0x87802010  ! 58: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_2_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_45
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_45:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 60: RDPC	rd	%pc, %r8
mondo_2_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d914001  ! 61: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0x91d02035  ! 62: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_2_47:
	nop
	ta T_CHANGE_HPRIV
	set 0xf007d4f1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_2_48:
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
    mov 0x2, %r16
ibp_startwait2_48:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_48
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_48:
    brnz %r16, ibp_wait2_48
    ld [%r23], %r16
    ba ibp_startwait2_48
    mov 0x2, %r16
continue_ibp_2_48:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_48:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_48
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_48:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_48
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_48:
    best_set_reg(0x00000040a1cbe75e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfd960  ! 64: STDFA_R	stda	%f16, [%r0, %r31]
splash_hpstate_2_49:
	.word 0x819828d5  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0x8d9027b5  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x07b5, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_2_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a049cd  ! 68: FDIVd	fdivd	%f32, %f44, %f10
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_53-donret_2_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001b0900 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17a4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r11+%r0], %g1
	done
donretarg_2_53:
	.word 0x33400001  ! 69: FBPE	fbe,a,pn	%fcc0, <label_0x1>
    set 0x109e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b0c7d1  ! 70: PDIST	pdistn	%d34, %d48, %d48
	.word 0xa7a0016b  ! 71: FABSq	dis not found

ibp_2_55:
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
    mov 0x2, %r16
ibp_startwait2_55:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_55
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_55:
    brnz %r16, ibp_wait2_55
    ld [%r23], %r16
    ba ibp_startwait2_55
    mov 0x2, %r16
continue_ibp_2_55:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_55:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_55
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_55:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_55
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_55:
    best_set_reg(0x000000402ee75e81,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe120  ! 72: STDFA_I	stda	%f16, [0x0120, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_56-donret_2_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005b3000 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ddd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
.align 32
donretarg_2_56:
	.word 0xe4ffe130  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x0130] %asi
brcommon3_2_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c010  ! 1: STQF_R	-	%f18, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4dfc030  ! 74: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
	.word 0x91944002  ! 75: WRPR_PIL_R	wrpr	%r17, %r2, %pil
splash_cmpr_2_59:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 76: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_2_60:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 77: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87802058  ! 78: WRASI_I	wr	%r0, 0x0058, %asi
brcommon3_2_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c008  ! 1: STQF_R	-	%f18, [%r8, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe53fc011  ! 79: STDF_R	std	%f18, [%r17, %r31]
mondo_2_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d92c009  ! 80: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	nop
	mov 0x80, %g3
	stxa %r7, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x1341, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb187d4  ! 82: PDIST	pdistn	%d6, %d20, %d44
	brz,pt  	%r19, skip_2_63
	stxa %r14, [%r0] ASI_LSU_CONTROL
	.word 0xc36cf617  ! 1: PREFETCH_I	prefetch	[%r19 + 0xfffff617], #one_read
	stxa %r14, [%r0] ASI_LSU_CONTROL
.align 32
skip_2_63:
	.word 0xd23fc000  ! 83: STD_R	std	%r9, [%r31 + %r0]
	.word 0x9ba00170  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_2_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_65
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_65:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 85: RDPC	rd	%pc, %r12
	.word 0x95450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r10
brcommon1_2_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8038b2  ! 87: SIR	sir	0x18b2
pmu_2_67:
	nop
	setx 0xffffffbcffffffa5, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_68)+8, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_68)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_68:
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
xir_2_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984a03f  ! 89: WR_SET_SOFTINT_I	wr	%r18, 0x003f, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_2_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 91: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_2_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94400c  ! 92: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0x8d902aef  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0aef, %pstate
	.word 0x8d802000  ! 94: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
    brnz %r10, sma_2_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 95: CASA_R	casa	[%r31] %asi, %r13, %r8
ibp_2_74:
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
    mov 0x2, %r16
ibp_startwait2_74:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_74
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_74:
    brnz %r16, ibp_wait2_74
    ld [%r23], %r16
    ba ibp_startwait2_74
    mov 0x2, %r16
continue_ibp_2_74:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_74:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_74
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_74:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_74
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_74:
    best_set_reg(0x00000040b6de816c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95b447d1  ! 96: PDIST	pdistn	%d48, %d48, %d10
	.word 0xa9b0448d  ! 97: FCMPLE32	fcmple32	%d32, %d44, %r20
trapasi_2_76:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8884b40  ! 98: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_2_77:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb6ffffffab, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_2_79:
	set 0x60540000, %r31
	.word 0x8584be6c  ! 102: WRCCR_I	wr	%r18, 0x1e6c, %ccr
	.word 0xd8cfe1f8  ! 103: LDSBA_I	ldsba	[%r31, + 0x01f8] %asi, %r12
change_to_randtl_2_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_2_81:
	nop
	setx 0xffffffbcffffffa7, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x918c3bf2, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe048  ! 107: LDSBA_I	ldsba	[%r31, + 0x0048] %asi, %r12
	.word 0xc30fc011  ! 1: LDXFSR_R	ld-fsr	[%r31, %r17], %f1
	.word 0x9f8033ba  ! 108: SIR	sir	0x13ba
	.word 0xd8dfe1e8  ! 109: LDXA_I	ldxa	[%r31, + 0x01e8] %asi, %r12
	.word 0x87802055  ! 110: WRASI_I	wr	%r0, 0x0055, %asi
mondo_2_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d910013  ! 111: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
vahole1_2_84:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9bb50488  ! 113: FCMPLE32	fcmple32	%d20, %d8, %r13
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
    brnz %r10, cwq_2_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_85
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
cwq_2_85:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 114: RDPC	rd	%pc, %r18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_86) + 0, 16, 16)) -> intp(2,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_86)&0xffffffff) + 0, 16, 16)) -> intp(3,0,25,,,,,1)
#else
	set 0xfc50219b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_87:
	nop
	setx 0xffffffbaffffffad, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_2_88:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xd8c84920  ! 117: LDSBA_R	ldsba	[%r1, %r0] 0x49, %r12
	.word 0x99450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r12
fpinit_2_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d23  ! 119: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd23] %asi, #one_read
	.word 0xe63fc012  ! 1: STD_R	std	%r19, [%r31 + %r18]
	.word 0x9f802c49  ! 120: SIR	sir	0x0c49
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_90-donret_2_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ec0000 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x459, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
.align 32
donretarg_2_90:
	.word 0xe66fe19d  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x019d]
	.word 0xe73fc00b  ! 1: STDF_R	std	%f19, [%r11, %r31]
	.word 0x9f80226b  ! 122: SIR	sir	0x026b
splash_htba_2_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_2_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_92
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
cwq_2_92:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 124: RDPC	rd	%pc, %r20
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 126: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91a4c9b0  ! 127: FDIVs	fdivs	%f19, %f16, %f8
	.word 0x95a089c4  ! 128: FDIVd	fdivd	%f2, %f4, %f10
	fbg,a,pn	%fcc0,  skip_2_96
	bne,a	 skip_2_96
.align 2048
skip_2_96:
	.word 0xa9a349d2  ! 129: FDIVd	fdivd	%f44, %f18, %f20
	.word 0xe8800b40  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r20
intveclr_2_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe5ce675ea8bf42c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_98:
	.word 0x81982fdf  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
trapasi_2_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8c04e40  ! 133: LDSWA_R	ldswa	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_100)+24, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_100)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_100:
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
xir_2_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9823edf  ! 134: WR_SET_SOFTINT_I	wr	%r8, 0x1edf, %set_softint
intveclr_2_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdb7d0fcc18ef3cd6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc1129efd709f7b9b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_103-donret_2_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00caf500 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x118d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r11+%r0], %g1
	done
donretarg_2_103:
	.word 0xe86fe051  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x0051]
ibp_2_104:
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
    mov 0x2, %r16
ibp_startwait2_104:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_104
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_104:
    brnz %r16, ibp_wait2_104
    ld [%r23], %r16
    ba ibp_startwait2_104
    mov 0x2, %r16
continue_ibp_2_104:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_104:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_104
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_104:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_104
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_104:
    best_set_reg(0x00000040a6c16cd8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fdb60  ! 138: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_2_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 139: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_cmpr_2_106:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 140: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe9e7e00a  ! 141: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0x93d020b2  ! 142: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_hpstate_2_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81983f1d  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f1d, %hpstate
dvapa_2_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe47, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a88a50  ! 144: FCMPd	fcmpd	%fcc<n>, %f2, %f16
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x8d903a97  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1a97, %pstate
memptr_2_111:
	set user_data_start, %r31
	.word 0x85823267  ! 146: WRCCR_I	wr	%r8, 0x1267, %ccr
ceter_2_112:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 147: RDTICK	rd	%tick, %r17
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_113-donret_2_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00874400 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	ldx [%r11+%r0], %g1
	done
donretarg_2_113:
	.word 0xe6ffe05c  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x005c] %asi
splash_tba_2_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_2_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_2_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 151: FDIVd	fdivd	%f0, %f4, %f8
tagged_2_117:
	taddcctv %r18, 0x15da, %r18
	.word 0xe607e0e7  ! 152: LDUW_I	lduw	[%r31 + 0x00e7], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_118)+24, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_118)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_118:
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
xir_2_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa9817e7d  ! 153: WR_SET_SOFTINT_I	wr	%r5, 0x1e7d, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_2_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d904006  ! 155: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x87802016  ! 157: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9a68e29e  ! 158: UDIVX_I	udivx 	%r3, 0x029e, %r13
splash_cmpr_2_121:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_122-donret_2_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002b0000 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x517, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	ldx [%r12+%r0], %g1
	retry
donretarg_2_122:
	.word 0x93a4c9d3  ! 160: FDIVd	fdivd	%f50, %f50, %f40
pmu_2_123:
	nop
	setx 0xffffffbbffffffae, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_2_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d914011  ! 163: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0xa190200c  ! 164: WRPR_GL_I	wrpr	%r0, 0x000c, %-
trapasi_2_126:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xdac04b60  ! 165: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r13
	.word 0x8d802000  ! 166: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_2_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_2_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00d  ! 169: CASA_R	casa	[%r31] %asi, %r13, %r13
	.word 0xdadfc032  ! 1: LDXA_R	ldxa	[%r31, %r18] 0x01, %r13
	.word 0x9f803c4d  ! 170: SIR	sir	0x1c4d
	.word 0x8d902160  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x0160, %pstate
ibp_2_130:
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
    mov 0x2, %r16
ibp_startwait2_130:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_130
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_130:
    brnz %r16, ibp_wait2_130
    ld [%r23], %r16
    ba ibp_startwait2_130
    mov 0x2, %r16
continue_ibp_2_130:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_130:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_130
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_130:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_130
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_130:
    best_set_reg(0x000000400fecd80e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 172: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa269feaf  ! 173: UDIVX_I	udivx 	%r7, 0xfffffeaf, %r17
	.word 0x996c8012  ! 174: SDIVX_R	sdivx	%r18, %r18, %r12
dvapa_2_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdf8, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe180  ! 175: STD_I	std	%r16, [%r31 + 0x0180]
	.word 0xa784e36e  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x036e, %-
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
    brnz %r10, cwq_2_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_132
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
cwq_2_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 177: RDPC	rd	%pc, %r20
fpinit_2_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 178: FDIVs	fdivs	%f0, %f4, %f4
splash_lsu_2_134:
	nop
	ta T_CHANGE_HPRIV
	set 0x6449b979, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 180: WRASI_I	wr	%r0, 0x0058, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_135)+32, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_135)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_135:
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
xir_2_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98377c8  ! 181: WR_SET_SOFTINT_I	wr	%r13, 0x17c8, %set_softint
trapasi_2_136:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xda904940  ! 182: LDUHA_R	lduha	[%r1, %r0] 0x4a, %r13
intveclr_2_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf0a20ff2c7bffc8, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_2_138:
	tsubcctv %r16, 0x10d6, %r2
	.word 0xda07e061  ! 184: LDUW_I	lduw	[%r31 + 0x0061], %r13
splash_hpstate_2_139:
	ta T_CHANGE_NONHPRIV
	.word 0x26c90001  ! 1: BRLZ	brlz,a,pt	%r4,<label_0x90001>
	.word 0x81982edb  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edb, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_2_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e0a0  ! 1: STQF_I	-	%f13, [0x00a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903ddd  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x1ddd, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
ibp_2_141:
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
    mov 0x2, %r16
ibp_startwait2_141:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_141
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_141:
    brnz %r16, ibp_wait2_141
    ld [%r23], %r16
    ba ibp_startwait2_141
    mov 0x2, %r16
continue_ibp_2_141:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_141:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_141
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_141:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_141
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_141:
    best_set_reg(0x0000005089d80ea1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x97b4c7d2  ! 189: PDIST	pdistn	%d50, %d18, %d42
tagged_2_142:
	tsubcctv %r2, 0x181e, %r19
	.word 0xd807e1f4  ! 190: LDUW_I	lduw	[%r31 + 0x01f4], %r12
	.word 0x87802016  ! 191: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_2_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe0b2f8c496b07ae6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_144) + 24, 16, 16)) -> intp(6,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_144)&0xffffffff) + 8, 16, 16)) -> intp(7,0,13,,,,,1)
#else
	set 0xfb00d263, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802030  ! 194: WRASI_I	wr	%r0, 0x0030, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_2_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb1e, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe140  ! 196: STDFA_I	stda	%f16, [0x0140, %r31]
splash_tba_2_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa0c46479  ! 198: ADDCcc_I	addccc 	%r17, 0x0479, %r16
pmu_2_148:
	nop
	setx 0xffffffbfffffffa5, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_149:
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
    mov 0x2, %r16
ibp_startwait2_149:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_149
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_149:
    brnz %r16, ibp_wait2_149
    ld [%r23], %r16
    ba ibp_startwait2_149
    mov 0x2, %r16
continue_ibp_2_149:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_149:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_149
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_149:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_149
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_149:
    best_set_reg(0x00000040adcea16c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc2c0  ! 200: LDDFA_R	ldda	[%r31, %r0], %f0
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
vahole5_1_0:
    nop
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	ta T_CHANGE_PRIV
ibp_1_1:
	nop
	.word 0xe19fe1c0  ! 1: LDDFA_I	ldda	[%r31, 0x01c0], %f16
splash_cmpr_1_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 2: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_1_3:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 3: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0xc19fe020  ! 4: LDDFA_I	ldda	[%r31, 0x0020], %f0
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
    brnz %r10, cwq_1_4
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_4
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
cwq_1_4:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 5: RDPC	rd	%pc, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_5:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_5-donret_1_5), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f66f00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r11+%r0], %g1
	done
donretarg_1_5:
	.word 0x8d90279d  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x079d, %pstate
	.word 0xe937e0dc  ! 7: STQF_I	-	%f20, [0x00dc, %r31]
jmptr_1_6:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 8: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_1_7:
	.word 0x39400001  ! 9: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802841  ! 10: SIR	sir	0x0841
	.word 0x8d802004  ! 11: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_1_8:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x48) 
	.word 0xe8c84900  ! 12: LDSBA_R	ldsba	[%r1, %r0] 0x48, %r20
	.word 0xe81fe1c0  ! 13: LDD_I	ldd	[%r31 + 0x01c0], %r20
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902b8f  ! 14: WRPR_PSTATE_I	wrpr	%r0, 0x0b8f, %pstate
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
    brnz %r10, cwq_1_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_10
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
cwq_1_10:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 15: RDPC	rd	%pc, %r16
brcommon2_1_11:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00c  ! 1: FLUSH_R	flush 	%r31, %r12, %r0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe0e0  ! 16: LDDFA_I	ldda	[%r31, 0x00e0], %f16
jmptr_1_12:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_13:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d910013  ! 18: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
mondo_1_14:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d920010  ! 19: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
splash_cmpr_1_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 20: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_16) + 32, 16, 16)) -> intp(2,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_16)&0xffffffff) + 16, 16, 16)) -> intp(3,0,0,,,,,1)
#else
	set 0xba30cd16, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_16:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81d9c010  ! 22: FLUSH_R	flush 	%r7, %r16, %r0
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903b07  ! 23: WRPR_PSTATE_I	wrpr	%r0, 0x1b07, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_18:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_1_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d944003  ! 25: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0x81510000  ! 26: RDPR_TICK	rdpr	%tick, %r0
	.word 0x879cbe22  ! 27: WRHPR_HINTP_I	wrhpr	%r18, 0x1e22, %hintp
fpinit_1_20:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 28: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_1_21:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d920014  ! 29: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
splash_hpstate_1_22:
	.word 0x8198288d  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088d, %hpstate
splash_tba_1_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 31: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_1_24:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4a) 
	.word 0xe8884940  ! 32: LDUBA_R	lduba	[%r1, %r0] 0x4a, %r20
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_1_25:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_26
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_26:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 34: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe89fe1f8  ! 35: LDDA_I	ldda	[%r31, + 0x01f8] %asi, %r20
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
    brnz %r10, sma_1_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_27:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 36: CASA_R	casa	[%r31] %asi, %r17, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_28:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_28-donret_1_28), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b10a00 | (57 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_28:
	.word 0x2c800001  ! 37: BNEG	bneg,a	<label_0x1>
brcommon2_1_29:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a7c973  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fda00  ! 38: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91930007  ! 39: WRPR_PIL_R	wrpr	%r12, %r7, %pil
	.word 0xd877e1c3  ! 40: STX_I	stx	%r12, [%r31 + 0x01c3]
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
    brnz %r10, cwq_1_31
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_31
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_31:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 41: RDPC	rd	%pc, %r19
vahole6_1_32:
    nop
    mov 1, %r27
    sllx %r27, 49, %r27
    jmpl %r27+0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0xe71fe000  ! 42: LDDF_I	ldd	[%r31, 0x0000], %f19
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
    brnz %r10, sma_1_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e009  ! 43: CASA_R	casa	[%r31] %asi, %r9, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_34:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_34-donret_1_34+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005ee800 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc55, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_34:
	.word 0xe66fe129  ! 44: LDSTUB_I	ldstub	%r19, [%r31 + 0x0129]
	nop
	mov 0x80, %g3
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_35)+32, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_35)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_35:
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
xir_1_35:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984738d  ! 46: WR_SET_SOFTINT_I	wr	%r17, 0x138d, %set_softint
	.word 0xe63fe080  ! 47: STD_I	std	%r19, [%r31 + 0x0080]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_37:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_37-donret_1_37+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00320500 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x19d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r11+%r0], %g1
	done
.align 32
donretarg_1_37:
	.word 0x81983e1f  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1f, %hpstate
	.word 0x89800011  ! 49: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc1bfe0a0  ! 50: STDFA_I	stda	%f0, [0x00a0, %r31]
splash_lsu_1_40:
	nop
	ta T_CHANGE_HPRIV
	set 0xa386b8c6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_41:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_41:
	.word 0x8f902002  ! 52: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe1bfde00  ! 53: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x89800011  ! 54: WRTICK_R	wr	%r0, %r17, %tick
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_43:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_43-donret_1_43+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006b1500 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f15, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
.align 32
donretarg_1_43:
	.word 0x8d9025dd  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x05dd, %pstate
	.word 0xe64fc000  ! 56: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0xe71fe050  ! 57: LDDF_I	ldd	[%r31, 0x0050], %f19
	.word 0x87802082  ! 58: WRASI_I	wr	%r0, 0x0082, %asi
	.word 0x89800011  ! 59: WRTICK_R	wr	%r0, %r17, %tick
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
    brnz %r10, cwq_1_45
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_45
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
cwq_1_45:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 60: RDPC	rd	%pc, %r20
mondo_1_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94800b  ! 61: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x93d02035  ! 62: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_1_47:
	nop
	ta T_CHANGE_HPRIV
	set 0x495caa28, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_1_48:
	nop
	.word 0xe19fe040  ! 64: LDDFA_I	ldda	[%r31, 0x0040], %f16
splash_hpstate_1_49:
	.word 0x819837c2  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17c2, %hpstate
	.word 0x8d903aeb  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1aeb, %pstate
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_1_51:
	.word 0x39400001  ! 67: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a209c9  ! 68: FDIVd	fdivd	%f8, %f40, %f8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_53:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_53-donret_1_53+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c0b200 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1254, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r11+%r0], %g1
	done
donretarg_1_53:
	.word 0x27400001  ! 69: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
    set 0x2d9e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b507c5  ! 70: PDIST	pdistn	%d20, %d36, %d20
	.word 0xa5a00169  ! 71: FABSq	dis not found

ibp_1_55:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe080  ! 72: STDFA_I	stda	%f16, [0x0080, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_56:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_56-donret_1_56), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00315800 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xac9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
.align 32
donretarg_1_56:
	.word 0xe4ffe05a  ! 73: SWAPA_I	swapa	%r18, [%r31 + 0x005a] %asi
brcommon3_1_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c013  ! 1: STQF_R	-	%f18, [%r19, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe51fc014  ! 74: LDDF_R	ldd	[%r31, %r20], %f18
	.word 0x9190c011  ! 75: WRPR_PIL_R	wrpr	%r3, %r17, %pil
splash_cmpr_1_59:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 76: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_1_60:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 77: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87802004  ! 78: WRASI_I	wr	%r0, 0x0004, %asi
brcommon3_1_61:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c008  ! 1: STQF_R	-	%f18, [%r8, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe5e7e008  ! 79: CASA_R	casa	[%r31] %asi, %r8, %r18
mondo_1_62:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 80: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %r11, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe45fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r18
    set 0x2acf, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b047cb  ! 82: PDIST	pdistn	%d32, %d42, %d40
	fbug skip_1_63
	stxa %r18, [%r0] ASI_LSU_CONTROL
	.word 0x99a4c9c7  ! 1: FDIVd	fdivd	%f50, %f38, %f12
	stxa %r9, [%r0] ASI_LSU_CONTROL
.align 32
skip_1_63:
	.word 0xd3e7c020  ! 83: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x91a0016b  ! 84: FABSq	dis not found

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
    brnz %r10, cwq_1_65
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_65
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_65:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 85: RDPC	rd	%pc, %r9
	.word 0x93450000  ! 86: RD_SET_SOFTINT	rd	%set_softint, %r9
brcommon1_1_66:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93b7c7cd  ! 1: PDIST	pdistn	%d62, %d44, %d40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91a409b4  ! 87: FDIVs	fdivs	%f16, %f20, %f8
pmu_1_67:
	nop
	setx 0xffffffb1ffffffac, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_68)+48, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_68)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_68:
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
xir_1_68:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98523fe  ! 89: WR_SET_SOFTINT_I	wr	%r20, 0x03fe, %set_softint
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_1_69:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_70:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e823fe  ! 91: PREFETCHA_I	prefetcha	[%r0, + 0x03fe] %asi, #one_read
mondo_1_71:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d914007  ! 92: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
	.word 0x8d90330d  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x130d, %pstate
	.word 0x8d802000  ! 94: WRFPRS_I	wr	%r0, 0x0000, %fprs
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
    brnz %r10, sma_1_73
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_73:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 95: CASA_R	casa	[%r31] %asi, %r12, %r8
ibp_1_74:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87acca53  ! 96: FCMPd	fcmpd	%fcc<n>, %f50, %f50
	.word 0x99b447d1  ! 97: PDIST	pdistn	%d48, %d48, %d12
trapasi_1_76:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xd8884b40  ! 98: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r12
	.word 0x81460000  ! 99: RD_STICK_REG	stbar
jmptr_1_77:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 100: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_78:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbbffffffa1, %g1, %g7
	.word 0xa3800007  ! 101: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_1_79:
	set 0x60340000, %r31
	.word 0x85813d80  ! 102: WRCCR_I	wr	%r4, 0x1d80, %ccr
	.word 0xd8cfe030  ! 103: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
change_to_randtl_1_80:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_80:
	.word 0x8f902000  ! 104: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_1_81:
	nop
	setx 0xffffffb9ffffffae, %g1, %g7
	.word 0xa3800007  ! 105: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x8f0cc1ec, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2acd0001  ! 1: BRNZ	brnz,a,pt	%r20,<label_0xd0001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8cfe050  ! 107: LDSBA_I	ldsba	[%r31, + 0x0050] %asi, %r12
	.word 0x9f803f16  ! 108: SIR	sir	0x1f16
	.word 0xd8dfe058  ! 109: LDXA_I	ldxa	[%r31, + 0x0058] %asi, %r12
	.word 0x87802016  ! 110: WRASI_I	wr	%r0, 0x0016, %asi
mondo_1_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d944013  ! 111: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0x81460000  ! 112: RD_STICK_REG	stbar
vahole1_1_84:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87ac0a54  ! 113: FCMPd	fcmpd	%fcc<n>, %f16, %f20
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
    brnz %r10, cwq_1_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_85
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_85:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 114: RDPC	rd	%pc, %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_86) + 0, 16, 16)) -> intp(3,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_86)&0xffffffff) + 48, 16, 16)) -> intp(6,0,28,,,,,1)
#else
	set 0x3860cbd1, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_86:
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_87:
	nop
	setx 0xffffffb1ffffffa8, %g1, %g7
	.word 0xa3800007  ! 116: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
trapasi_1_88:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xd8c04920  ! 117: LDSWA_R	ldswa	[%r1, %r0] 0x49, %r12
	.word 0xa7450000  ! 118: RD_SET_SOFTINT	rd	%set_softint, %r19
fpinit_1_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 119: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x9f802dd2  ! 120: SIR	sir	0x0dd2
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_90:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_90-donret_1_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a12700 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11fd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
.align 32
donretarg_1_90:
	.word 0xe66fe075  ! 121: LDSTUB_I	ldstub	%r19, [%r31 + 0x0075]
	.word 0x9f8029e9  ! 122: SIR	sir	0x09e9
splash_htba_1_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 123: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
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
    brnz %r10, cwq_1_92
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_92
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
cwq_1_92:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 124: RDPC	rd	%pc, %r18
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
	.word 0x39400001  ! 125: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 126: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87ab0a4c  ! 127: FCMPd	fcmpd	%fcc<n>, %f12, %f12
	.word 0x91a4c9ac  ! 128: FDIVs	fdivs	%f19, %f12, %f8
	fbl skip_1_96
	fbge,a,pn	%fcc0,  skip_1_96
.align 2048
skip_1_96:
	.word 0x87ac0a46  ! 129: FCMPd	fcmpd	%fcc<n>, %f16, %f6
	.word 0xe8800ae0  ! 130: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
intveclr_1_97:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe97e2d6c20966a6b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 131: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_98:
	.word 0x81983689  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1689, %hpstate
trapasi_1_99:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe8d84e40  ! 133: LDXA_R	ldxa	[%r1, %r0] 0x72, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_100)+40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_100)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_100:
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
xir_1_100:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984b598  ! 134: WR_SET_SOFTINT_I	wr	%r18, 0x1598, %set_softint
intveclr_1_101:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7082ff115dff282e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 135: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_102:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8165e96a11b2d99c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 136: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_103:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_103-donret_1_103), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0093c400 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r11+%r0], %g1
	done
donretarg_1_103:
	.word 0xe86fe18e  ! 137: LDSTUB_I	ldstub	%r20, [%r31 + 0x018e]
ibp_1_104:
	nop
	.word 0xe1bfe120  ! 138: STDFA_I	stda	%f16, [0x0120, %r31]
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
    brnz %r10, sma_1_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_105:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 139: CASA_R	casa	[%r31] %asi, %r19, %r20
splash_cmpr_1_106:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 140: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8bfc029  ! 141: STDA_R	stda	%r20, [%r31 + %r9] 0x01
	.word 0x91d02032  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_1_108:
	ta T_CHANGE_NONHPRIV
	.word 0x8198349e  ! 143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x149e, %hpstate
dvapa_1_109:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8b3, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac0a48  ! 144: FCMPd	fcmpd	%fcc<n>, %f16, %f8
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d903187  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1187, %pstate
memptr_1_111:
	set user_data_start, %r31
	.word 0x8580f5d0  ! 146: WRCCR_I	wr	%r3, 0x15d0, %ccr
ceter_1_112:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa7410000  ! 147: RDTICK	rd	%tick, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_113:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_113-donret_1_113+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00569700 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x194e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	ldx [%r11+%r0], %g1
	done
donretarg_1_113:
	.word 0xe6ffe1da  ! 148: SWAPA_I	swapa	%r19, [%r31 + 0x01da] %asi
splash_tba_1_114:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_htba_1_115:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
fpinit_1_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e835d0  ! 151: PREFETCHA_I	prefetcha	[%r0, + 0xfffff5d0] %asi, #one_read
tagged_1_117:
	taddcctv %r5, 0x1b0c, %r18
	.word 0xe607e1dd  ! 152: LDUW_I	lduw	[%r31 + 0x01dd], %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_118)+0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_118)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_118:
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
xir_1_118:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984bed8  ! 153: WR_SET_SOFTINT_I	wr	%r18, 0x1ed8, %set_softint
	.word 0x89800011  ! 154: WRTICK_R	wr	%r0, %r17, %tick
mondo_1_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d948011  ! 155: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0xe737c000  ! 156: STQF_R	-	%f19, [%r0, %r31]
	.word 0x87802039  ! 157: WRASI_I	wr	%r0, 0x0039, %asi
	.word 0xa868fbcd  ! 158: UDIVX_I	udivx 	%r3, 0xfffffbcd, %r20
splash_cmpr_1_121:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_122:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_122-donret_1_122), %r12
	add %r12, 0x4, %r11 ! seq tnpc
	andn %r11, %r10, %r11 ! low VA tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0090ce00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	ldx [%r12+%r0], %g1
	retry
donretarg_1_122:
	.word 0x9ba509d3  ! 160: FDIVd	fdivd	%f20, %f50, %f44
pmu_1_123:
	nop
	setx 0xffffffbeffffffa8, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_1_124:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 162: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d914003  ! 163: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xa190200c  ! 164: WRPR_GL_I	wrpr	%r0, 0x000c, %-
trapasi_1_126:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xdad04b60  ! 165: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r13
	.word 0x8d802000  ! 166: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_1_127:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 167: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    brnz %r10, sma_1_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_128:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 169: CASA_R	casa	[%r31] %asi, %r12, %r13
	.word 0x9f803e99  ! 170: SIR	sir	0x1e99
	.word 0x8d903f75  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x1f75, %pstate
ibp_1_130:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe1c0  ! 172: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0x9a68f694  ! 173: UDIVX_I	udivx 	%r3, 0xfffff694, %r13
	.word 0xa16cc010  ! 174: SDIVX_R	sdivx	%r19, %r16, %r16
dvapa_1_131:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe18, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc02d  ! 175: LDXA_R	ldxa	[%r31, %r13] 0x01, %r16
	.word 0xa7817d17  ! 176: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x1d17, %-
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
    brnz %r10, cwq_1_132
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_132
    set CWQ_BASE, %l6
#ifndef SPC
    add %l6, %o3, %l6
#endif
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    membar #Sync
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_132:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 177: RDPC	rd	%pc, %r13
fpinit_1_133:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 178: FDIVs	fdivs	%f0, %f4, %f4
splash_lsu_1_134:
	nop
	ta T_CHANGE_HPRIV
	set 0x6a49fa43, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 179: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802083  ! 180: WRASI_I	wr	%r0, 0x0083, %asi
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_135)+40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_135)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_135:
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
xir_1_135:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984aa1f  ! 181: WR_SET_SOFTINT_I	wr	%r18, 0x0a1f, %set_softint
trapasi_1_136:
	nop
	mov 0x110, %r1 	! (VA for ASI 0x4a) 
	.word 0xdad84940  ! 182: LDXA_R	ldxa	[%r1, %r0] 0x4a, %r13
intveclr_1_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0x39494d2c3ead1ae4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_1_138:
	tsubcctv %r16, 0x1340, %r6
	.word 0xda07e1b1  ! 184: LDUW_I	lduw	[%r31 + 0x01b1], %r13
splash_hpstate_1_139:
	ta T_CHANGE_NONHPRIV
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x819823cc  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cc, %hpstate
	.word 0xda77c000  ! 186: STX_R	stx	%r13, [%r31 + %r0]
brcommon3_1_140:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e150  ! 1: STQF_I	-	%f13, [0x0150, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d9034cd  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x14cd, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
ibp_1_141:
	nop
	.word 0x99a409d4  ! 189: FDIVd	fdivd	%f16, %f20, %f12
tagged_1_142:
	tsubcctv %r16, 0x146a, %r19
	.word 0xd807e1f5  ! 190: LDUW_I	lduw	[%r31 + 0x01f5], %r12
	.word 0x87802080  ! 191: WRASI_I	wr	%r0, 0x0080, %asi
intveclr_1_143:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfdaf5e0947547c8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 192: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_144) + 40, 16, 16)) -> intp(0,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_144)&0xffffffff) + 40, 16, 16)) -> intp(6,0,0,,,,,1)
#else
	set 0x97804665, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_144:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780208a  ! 194: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0x89800011  ! 195: WRTICK_R	wr	%r0, %r17, %tick
dvapa_1_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0x899, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe120  ! 196: LDDFA_I	ldda	[%r31, 0x0120], %f0
splash_tba_1_147:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x96c36bbd  ! 198: ADDCcc_I	addccc 	%r13, 0x0bbd, %r11
pmu_1_148:
	nop
	setx 0xffffffbaffffffa7, %g1, %g7
	.word 0xa3800007  ! 199: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_149:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fda00  ! 200: LDDFA_R	ldda	[%r31, %r0], %f0
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

	.xword	0x331b631809ec33a8
	.xword	0xf3b2213cb0dea26d
	.xword	0x36f450e2591d7299
	.xword	0x2461c18b19890e2b
	.xword	0x79465b8ad87a619a
	.xword	0x7d2be13d4a961d1d
	.xword	0x8f447def691df235
	.xword	0x27419199e2b6f3a0
	.xword	0x1e954d9787aa3690
	.xword	0xc06e83437b9c75ff
	.xword	0xf54dbd517524b3f8
	.xword	0x9976a12b0a6691c1
	.xword	0x0cf27cf381bd7062
	.xword	0xcf37afe424199982
	.xword	0xcc71ba8aead0c6d8
	.xword	0xb3834313074098ba
	.xword	0xce30a45eb2f5e70c
	.xword	0x36e4a485663c3433
	.xword	0x1e01a778a9397844
	.xword	0xcc7686cc0b312d96
	.xword	0x7272df29e076ec44
	.xword	0xac1bcf1cae8abc40
	.xword	0x8c8ccbe6b4227266
	.xword	0x147f9d40a8654ef4
	.xword	0x3e17088c5c85df73
	.xword	0xcc50c62d9f9f2c1d
	.xword	0xfb11fa24d34d501f
	.xword	0xd67e86332de99ea8
	.xword	0x1e069cbe678517a5
	.xword	0xd4d817d7b4bbec72
	.xword	0x1f0ba71a1ce39c52
	.xword	0x50b7bc6fec2e09e2
	.xword	0x1138eee77886f5c0
	.xword	0x5c6ace6603c0210d
	.xword	0xba717ab622189493
	.xword	0xfc271c39146465eb
	.xword	0x16648f9bc6f66df1
	.xword	0x73e0b8f71930e7c8
	.xword	0xe8948d34065c1154
	.xword	0x42f2386fbabd4b2e
	.xword	0x3215df64a76459a7
	.xword	0xc965a9be2d459570
	.xword	0xf03b78f5bb9e2eba
	.xword	0x93c1ca2c1104a983
	.xword	0xb1047e9f842f4292
	.xword	0xbf80d393179bb0ed
	.xword	0xc2df8c5a1e405cfb
	.xword	0x404ded6377fe882a
	.xword	0x42905c7a7bc24bad
	.xword	0xa5f2d961e77e8f67
	.xword	0x8bc589ba0b310f92
	.xword	0xd3f2d5528d1bbde6
	.xword	0x132710e0ef3b8e0c
	.xword	0x5fb683c1e0b4e535
	.xword	0xbee45201bd053576
	.xword	0x9ef5634f4ccfbdc7
	.xword	0xaeeb12d6305573ff
	.xword	0x0dad6655ed6690d3
	.xword	0xa779358e5aea373e
	.xword	0x7622eeeb5466363f
	.xword	0x5984a579011a9709
	.xword	0xff46adda829e7bf5
	.xword	0x144723a68806b153
	.xword	0xf7275545a1fb8a3f
	.xword	0x8720301346593fcf
	.xword	0x40b2b333f5b19794
	.xword	0xb08474ceb6e96c27
	.xword	0xcca9796998fd9534
	.xword	0x3e81ca8d31eeb0bf
	.xword	0xdab44fb08e69de80
	.xword	0xb8cda60d2375fde7
	.xword	0x287a43058488d311
	.xword	0x25bd277df88ac8e1
	.xword	0xd7ae5b5508607566
	.xword	0xdaa249e57ff302fa
	.xword	0x5d92132342b85224
	.xword	0x21a0c0aba29f2cfd
	.xword	0x42c23c5eaab46099
	.xword	0x7a2c7dd9e9f78df8
	.xword	0x12833f41b99b8cef
	.xword	0xb2c9ef3813df8b78
	.xword	0x4304159d1b96866f
	.xword	0xa480cc5aabb46afa
	.xword	0x81613a58b488cc4d
	.xword	0x45ee5320950356d7
	.xword	0x95a828b31a9ee744
	.xword	0x24047167a131f194
	.xword	0xad739170204c4fbe
	.xword	0x076ab02fa251d90b
	.xword	0xb3f988e15c01ecb2
	.xword	0xeb3d06e41a17640a
	.xword	0x184d38ffde261a06
	.xword	0x89e79e8fc99027af
	.xword	0xe2ccdae4cf7e7898
	.xword	0xa0a9540e2bfd468a
	.xword	0xc6288f4f07a209fc
	.xword	0x418036e3a5751abb
	.xword	0xd6d2f49cbbd46edd
	.xword	0x9bf65f68cf93d714
	.xword	0xeb0d99ef18f694b9
	.xword	0xe027115a3552352f
	.xword	0xd9178b5b18936710
	.xword	0x2730820b2309652f
	.xword	0xf86f16b629cba0f9
	.xword	0x016ddb14078cea1e
	.xword	0x6516d0946d17f4d2
	.xword	0x9f5d8e64c3bc8137
	.xword	0xa106931788d0c4f9
	.xword	0x30978524e2ee056f
	.xword	0x6500cfb5ecd46787
	.xword	0x5841a8c268faa02d
	.xword	0xac4fc6bed66f8c83
	.xword	0xd6b191cea3bf061e
	.xword	0x9ca24c8d82ee72ff
	.xword	0x3d7c8081720b96df
	.xword	0x916c57b9cb500227
	.xword	0x39ec751485bcd373
	.xword	0x8c4fd30b8d0f84c0
	.xword	0xfa3e7c1019b4e2f2
	.xword	0x417712ec3c894dab
	.xword	0xd012a6e04e59c025
	.xword	0x8fb62bd644795b2a
	.xword	0x0b9c425d502ea295
	.xword	0xf11c1cbcbed6507f
	.xword	0xda998fb727d4dcda
	.xword	0xf32cb5aeaa6c7351
	.xword	0x6bfd02e927d4a43a
	.xword	0xe6994d79b3b813a8
	.xword	0xe63eaf6c33f90d3d
	.xword	0x0d9a8b4351ac7b25
	.xword	0x61fdaa84848b94d6
	.xword	0xc95839ba8e6ea5cd
	.xword	0xbae6f87394baf8e1
	.xword	0x603c5770d88b0f29
	.xword	0x07fe9c506b1f3917
	.xword	0xbb6cbb81e02a5ced
	.xword	0x1bc5db89cf3e7793
	.xword	0x56d35d0a38b76ad0
	.xword	0x92a3a30421cab83d
	.xword	0x742364ff4bcdb537
	.xword	0xfa93c9a3470fab88
	.xword	0x3a2c0e1f20db0011
	.xword	0xc89be59dced24322
	.xword	0x1c1003fbb600bbd9
	.xword	0x83b6559944b260ea
	.xword	0x7cfd3f144d26d6ed
	.xword	0x606473938e7f12db
	.xword	0xc10e71b538735d9d
	.xword	0x0501836e7819a930
	.xword	0x47b7180867dd9d80
	.xword	0xfc7d678ce55499ba
	.xword	0xd326e7f31236df23
	.xword	0xd9f8903a6b9ef250
	.xword	0xe82c6a95782d597d
	.xword	0xfbf0fbe4c742bffd
	.xword	0x2ba10b767306d48b
	.xword	0xd12f25a5192ef433
	.xword	0xaedce25a1a5f2688
	.xword	0xd4ac019e53cb71ea
	.xword	0xa1d7dba8b75761cf
	.xword	0x57d6778855b90101
	.xword	0x78b61abdeff887a0
	.xword	0x977191d33a2013d8
	.xword	0x6767917ff44bc79f
	.xword	0xc9d2ea46f145859f
	.xword	0x65632085fbc357c2
	.xword	0xbf87887dab4167b8
	.xword	0x8033c5e296e50355
	.xword	0x23e3935cceb94a9b
	.xword	0xe9ae3044017ce315
	.xword	0xe8a16aa774800861
	.xword	0x49bb9ee55f82e2e4
	.xword	0x2d633a2c8fd1a0f4
	.xword	0x7373d1b65a2582f1
	.xword	0xaf2acee16e9c47cc
	.xword	0x9dde1e9c3a0ae090
	.xword	0xf73778e2d192c744
	.xword	0x54ada8850f266961
	.xword	0xcb2beeed9bc15254
	.xword	0x66f13a9f133591f6
	.xword	0x6834992e1dbec65b
	.xword	0x9faf9712f4172833
	.xword	0x4b4f856615883d23
	.xword	0x1dee51ed472128d2
	.xword	0x051f8e191ac1577b
	.xword	0x3afa4d141d6e861c
	.xword	0xa29646062edc1a54
	.xword	0x67b37f96c14ae8e9
	.xword	0x2671bc517302fd20
	.xword	0x1a2e5434d8029173
	.xword	0x0eb945b1b39092ab
	.xword	0x7c5f09fcd33701c5
	.xword	0x5497ca4ea727cfc6
	.xword	0x797a815e1fdb79c8
	.xword	0xef6215d63f159d4e
	.xword	0xde36a7be1137ff52
	.xword	0xc497a801325ac13e
	.xword	0x2e995d0b06f48a04
	.xword	0x7604d4a384474f23
	.xword	0x11b30607255842b7
	.xword	0xdd9a3e27fa585295
	.xword	0x6ae52f04ece0379b
	.xword	0xba01335bfe729e4a
	.xword	0x8eeeb2b41cc0e0da
	.xword	0x1280326c51f23b3c
	.xword	0x75e1b48995470904
	.xword	0xce714a9047fefda1
	.xword	0xcac5206c8ad61a32
	.xword	0xdf5d85b6658f5874
	.xword	0x99024ce6ae3f218d
	.xword	0xb96b5f2c791033aa
	.xword	0xe2f4e83ebe59bfd1
	.xword	0x53a21a7671cf989e
	.xword	0xec423431d2ff1b31
	.xword	0xbdada2d432099f9c
	.xword	0xcb3591cf27706e2a
	.xword	0xe91ed731fbfc4bc2
	.xword	0x1e94ab47ebd036a7
	.xword	0xd2d1ca7364e296ae
	.xword	0x310852fefdf320bd
	.xword	0x2ef22675cbfc96fd
	.xword	0x71ace5c4aac31d7b
	.xword	0x7b2448bbb15ab871
	.xword	0xc7b1765826d7608f
	.xword	0x917d3af12d80c3d6
	.xword	0xabfcd55692eec6b8
	.xword	0xe490304e21772152
	.xword	0x8f7fee154ded4399
	.xword	0x1709b319735c894d
	.xword	0x6f2fba8522c3e7da
	.xword	0x9f170a96a818759a
	.xword	0x8f9a95d370b99f4e
	.xword	0xd38de37b8dd80dc0
	.xword	0x2a66d3fb268584ea
	.xword	0xec4cdd6da4cfefbb
	.xword	0x4bf7e08ee16645f0
	.xword	0x14e7523dee58de28
	.xword	0x8c102af4f6f10ba0
	.xword	0x88b3aa498c50c433
	.xword	0x50fcef869704fa82
	.xword	0x950b6475c4e8d8a9
	.xword	0x2199f9a329093d94
	.xword	0x3d72297e4b4b633f
	.xword	0x89bb087b3fa4b290
	.xword	0xa6516f8752b2fdbd
	.xword	0x5b7a311fabc5e940
	.xword	0x0059d8bf90919eaf
	.xword	0x6dec1cff2edd7caf
	.xword	0x60a16bde68e62752
	.xword	0x2622afe97ca15109
	.xword	0x4159ac1a9b3d8b5a
	.xword	0xc2d2f8c78c3725eb
	.xword	0x3b390862858b65cf
	.xword	0x178c004788170053
	.xword	0xc23cc41715649449
	.xword	0xbdd870ae20c39013

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
# 1110 "diag.j"

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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	TTE_CV	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
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
	TTE_CV	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	TTE_NFO	 = 1,
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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1,
	TTE_X	 = 0
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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
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
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1,
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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
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
	TTE_W	 = 1,
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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
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
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1,
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
	.xword	0x49da8cac025338c3
	.xword	0x2295762788f564fa
	.xword	0xb6099cba18b41312
	.xword	0xdf25d04151f5a538
	.xword	0x60d5ebe9665e3021
	.xword	0xfdf478023b4998ad
	.xword	0x7054d39887606ed6
	.xword	0x3c52b746bf7ad623
	.xword	0xf0cc35124f5c494d
	.xword	0xdedde5e97cd6b235
	.xword	0x96faaa1cc3398485
	.xword	0x93723ea3fdfda19e
	.xword	0xbfff94720535ad49
	.xword	0x2c3a69cb50542103
	.xword	0x14995bd3a02381ef
	.xword	0x115ef6f3cdf21d91
	.xword	0x98abf0021bd23c6f
	.xword	0x81aa96c4e0feac12
	.xword	0x3b2bcc483f9bae1b
	.xword	0xb8774967aad35a12
	.xword	0x2d6f4fbaf14d3b5e
	.xword	0x0cb59c0eb2e9ff6e
	.xword	0x0bc421ace084ddd9
	.xword	0x967dc994b9be01cd
	.xword	0xfc04e8bbf9a2596a
	.xword	0x55ede22a92e59079
	.xword	0x1cfd651ad91cc68c
	.xword	0x391c4f0452d458cc
	.xword	0x5be31412b63de420
	.xword	0x3173965ee92c7994
	.xword	0x8a01611c0f7f6291
	.xword	0x76caa67ae2400de0



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
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
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
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1,
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
	.xword	0xdd88be54981d3fa4
	.xword	0xeb8d9c71d398928e
	.xword	0x30a02888af778940
	.xword	0x8eb8c8da1a88a1ba
	.xword	0xf620af1b24319de2
	.xword	0xa1054b68ea0d2b2b
	.xword	0x4419763a062c4822
	.xword	0x732c986a920296cb
	.xword	0x809755cc6fce0159
	.xword	0x47ae03dcd8735bfb
	.xword	0xb5ca69dfb397163b
	.xword	0x3f53e4f6982b56ac
	.xword	0xbb30f5ce10e9968a
	.xword	0x165175457ac582a4
	.xword	0xefe7c78eb5373d2b
	.xword	0x3f49a7fedc9d3262
	.xword	0x301e144e2fb6713e
	.xword	0xd03a65505c5c6642
	.xword	0xa50d37c1cf98dfac
	.xword	0x3ce26714d7224ec4
	.xword	0x2dbf5c5f9a6a8c47
	.xword	0x3792eda22fcd7cff
	.xword	0x1a5fdbfa6a4fd5f2
	.xword	0x6b353f386032cc8d
	.xword	0x6f5cacb770c1e42c
	.xword	0xddb419b7a72e17b2
	.xword	0x252b43af176a39ad
	.xword	0x3786ab0906a4fcc0
	.xword	0xb40d6c66c36108ab
	.xword	0x41eecd5bd8538bd5
	.xword	0x9dbafd74fdf69ed5
	.xword	0xd14393b22686ae91



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
	TTE_Size	 = 1,
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
	TTE_W	 = 1
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
	TTE_Size	 = 3,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
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
	.xword	0xa8641ee4fb3d400f
	.xword	0x9c5dc63a70902e4b
	.xword	0x24395de3afcab9ac
	.xword	0x1de98b5bdcf91eb1
	.xword	0x403ed8b2ad48ce59
	.xword	0x2deffed2a2d39799
	.xword	0x54f372b07d7dd35b
	.xword	0xb1b01ecbee960fa3
	.xword	0x7a47dd49630910ce
	.xword	0xfbde54cdc81daced
	.xword	0x79cc61dc9301e587
	.xword	0x0f9ed1a9c4ac1d7f
	.xword	0x705671a1dd2de410
	.xword	0xe4303b32acb1c6a6
	.xword	0x8225fd25a2006450
	.xword	0x7f0a23c142308ccd
	.xword	0x234049316312b0fe
	.xword	0xab7d675369210b32
	.xword	0x1bafb2c79a63785f
	.xword	0x65599d9e688a70a0
	.xword	0xe5f59fcc762243ce
	.xword	0xdf7b7d688ade0807
	.xword	0x73b2a1fab8d32e8f
	.xword	0xbec563de0937d9b0
	.xword	0xa524b85fed36e4df
	.xword	0x5a7a3ab1f6327fad
	.xword	0xaef852b8d85c5e3f
	.xword	0x116e2fae8c7b7998
	.xword	0xb82de5db93b6a300
	.xword	0xd5ae7f907e613029
	.xword	0x16914e709296ba83
	.xword	0xc83adf9b197a8bbc



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
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
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
	TTE_Size	 = 0,
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
	TTE_W	 = 1,
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
	.xword	0x6e16b7169a84fb67
	.xword	0x843c081cf9d8ec13
	.xword	0xa98637b2b1ac153a
	.xword	0x32d5a45a64bcee4b
	.xword	0x042d0e829e3c4757
	.xword	0x83a77e986cd18794
	.xword	0xd0cd681acbe0db80
	.xword	0xd7c3389ef23677b2
	.xword	0x3e624aacdc89f825
	.xword	0x7254f95126e9f25d
	.xword	0x2ce3ed3853fa2c7e
	.xword	0xc77ab8176c1d038a
	.xword	0x669157c743fddcc4
	.xword	0xfb45850a8fd29a54
	.xword	0xdf931bcf19cceee1
	.xword	0xa64ffff58074f4d8
	.xword	0xc09093040d0811c9
	.xword	0x76f49cfc43d8aab6
	.xword	0x20f68b09682260a5
	.xword	0x4de46528f991492c
	.xword	0x56dc42fe13b15c20
	.xword	0x8192962a494ff8a0
	.xword	0x8446e13ba805ed7f
	.xword	0xe26b4ed299514f5c
	.xword	0xd2edb30a4b1f522d
	.xword	0x1e8341cf918c85d0
	.xword	0x68de502e8c128048
	.xword	0xd049800e1a0c02f4
	.xword	0x915f01f22d87a522
	.xword	0x1144c0180bedc655
	.xword	0xc8d160a431cd9aaf
	.xword	0x81bf0782b4684cc5





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
	fdivd %f0, %f4, %f4
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	fdivs %f0, %f4, %f4



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
	TTE_P	 = 0,
	TTE_W	 = 0
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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f4
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	fdivs %f0, %f4, %f4



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
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
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
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1,
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
	TTE_Size	 = 3,
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
	TTE_Size	 = 0,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
