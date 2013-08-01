/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_fcrand05_ind_16.s
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
#define IMMU_SKIP_IF_NO_TTE
#define DMMU_SKIP_IF_NO_TTE
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

#d
# 474 "diag.j"
#define H_HT0_Instruction_Access_MMU_Error_0x71 inst_access_mmu_error_handler
#define H_HT0_Instruction_access_error_0x0a inst_access_error_handler
#define H_HT0_Internal_Processor_Error_0x29 int_proc_err_handler
#define H_HT0_Data_Access_MMU_Error_0x72 data_access_mmu_error_handler
#define H_HT0_Data_access_error_0x32 data_access_error_handler
#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler
#define H_HT0_Sw_Recoverable_Error_0x40 sw_recoverable_error_handler
#define H_HT0_Store_Error_0x07 store_error_handler

#define DAE_SKIP_IF_SOCU_ERROR
# 5 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    stda    %f16,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY ;\
    b .+8 ;\
    stda    %f0,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE ;
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
    stda %l4, [%l5]ASI_BLOCK_PRIMARY_LITTLE;
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
    stda    %f0,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE;
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
#define HT_HANDLER_RAND4_2 save %i7, %g0, %i7; \
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    restore %i7, %g0, %i7;
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
    stda    %f16,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY ;\
    b .+8 ;\
    stda    %f0,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE ;
#endif
#ifndef HT_HANDLER_RAND4_4
#define HT_HANDLER_RAND4_4 ldda [%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE, %l3;\
    b .+12 ;\
    stxa %l3, [%g0]ASI_LSU_CONTROL; nop
#endif
#ifndef HT_HANDLER_RAND7_4 
#define HT_HANDLER_RAND7_4 rdpr %tnpc, %l3;\
    mov ASI_DMMU_VA_WATCHPOINT_VAL, %l4 ;\
    stxa %l3, [%l4]ASI_DMMU_VA_WATCHPOINT  ;\
    mov 1, %l4;\
    sllx %l4, 33, %l4 ;\
    not %l4, %l3 ;\
    stxa %l3, [%g0]ASI_LSU_CONTROL;
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
    stda    %f0,[%l2]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE;
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
# 198 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 227 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 339 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
    HT_HANDLER_RAND4_4 ;\
    done ;
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    HT_HANDLER_RAND7_6 ;\
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
    HT_HANDLER_RAND7_4 ;\
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
# 707 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_data_access_protection_0x6c
#define SUN_H_HT0_data_access_protection_0x6c   ba daccess_prot_handler; nop

#define H_HT0_PA_Watchpoint_0x61
#define My_H_HT0_PA_Watchpoint_0x61 \
    HT_HANDLER_RAND7_4;\
    done

#define H_HT0_Data_access_error_0x32
#define SUN_H_HT0_Data_access_error_0x32 \
    done;nop

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

#define H_T0_Instruction_VA_Watchpoint_0x75
#define SUN_H_T0_Instruction_VA_Watchpoint_0x75 \
    T_HANDLER_RAND7_4;\
    done;

#define H_T1_Instruction_VA_Watchpoint_0x75
#define SUN_H_T1_Instruction_VA_Watchpoint_0x75 \
    T_HANDLER_RAND7_5;\
    done;

#define H_HT0_Instruction_VA_Watchpoint_0x75
#define SUN_H_HT0_Instruction_VA_Watchpoint_0x75 \
    HT_HANDLER_RAND7_6;\
    done;

#define H_HT0_Instruction_Breakpoint_0x76
#define SUN_H_HT0_Instruction_Breakpoint_0x76 \
    rdhpr %htstate, %g1;\
    wrhpr %g1, 0x400, %htstate;\
    retry;nop
# 756 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    HT_HANDLER_RAND4_1;\
    done;

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
    HT_HANDLER_RAND4_2;\
    done;
# 767 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 783 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done;
# 789 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
# 795 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    done;
# 805 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_privilege_violation_0x08
#define My_HT0_IAE_privilege_violation_0x08 \
    HT_HANDLER_RAND7_2;\
    done;

#define H_HT0_Instruction_Access_MMU_Error_0x71
#define SUN_H_HT0_Instruction_Access_MMU_Error_0x71 \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    retry;

#define H_HT0_Data_Access_MMU_Error_0x72
#define SUN_H_HT0_Data_Access_MMU_Error_0x72 \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    retry;
# 825 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 59 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    INT_HANDLER_RAND4_1 ;\
    retry;

!!!!! Queue interrupt handler
# 72 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 172 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 175 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 220 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 223 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
    wr %g0, %g0, %pic;\
    set 0x1ff8bfff, %g4;\
    wr %g4, %g0, %pcr;\
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
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
    wr %g0, %g0, %pic;\
    set 0x1ff8bfff, %g4;\
    wr %g4, %g0, %pcr;\
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
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
    wr %g0, %g0, %pic;\
    set 0x1ff8bfff, %g4;\
    wr %g4, %g0, %pcr;\
	retry; 
# 713 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 488 "diag.j"
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
# 556 "diag.j"
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
	mov 0x30, %r14
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
	mov 0xb2, %r14
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
	mov 0x32, %r14
	mov 0x33, %r30
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
	mov 0xb0, %r14
	mov 0xb1, %r30
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
	mov 0xb0, %r14
	mov 0xb5, %r30
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
	mov 0x35, %r14
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
	mov 0x31, %r14
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

    ! Set up fpr PMU traps 
    set 0x1ff8bfff, %g2
    b fork_threads
    wr %g2, %g0, %pcr

common_target:
    nop
    sub %r27, 8, %r27
    and %r27, 8, %r12
    brz,a  %r12, .+8
    lduw [%r27], %r12      ! load jmp dest into dcache - xinval
    jmp %r27
	.word 0xc30fc000  ! 1: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	nop
	jmp %r27
	nop
fork_threads:
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_80:
    setx 0x52e6604d1aca1d3a, %r1, %r28
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
# 780 "diag.j"
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

    !# set  CWQ control word ([38:36] is strand ID ..)
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
	setx vahole_target1, %r18, %r27
cwp_80_1:
    set user_data_start, %o7
	.word 0x93902007  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
pmu_80_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2d1fffff922, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_80_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 4: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2ac98001  ! 1: BRNZ	brnz,a,pt	%r6,<label_0x98001>
	.word 0x8d9021db  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x01db, %pstate
brcommon1_80_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9d4  ! 1: FDIVd	fdivd	%f62, %f20, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87aa0a42  ! 7: FCMPd	fcmpd	%fcc<n>, %f8, %f2
	.word 0xe277e132  ! 8: STX_I	stx	%r17, [%r31 + 0x0132]
ibp_80_6:
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
ibp_startwait80_6:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_6
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_6:
    brnz %r16, ibp_wait80_6
    ld [%r23], %r16
    ba ibp_startwait80_6
    mov 0x80, %r16
continue_ibp_80_6:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_6:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_6
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_6:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_6
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_6:
    best_set_reg(0x00000040cfc000ff,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc32fc00a  ! 9: STXFSR_R	st-sfr	%f1, [%r10, %r31]
	.word 0xa7520000  ! 10: RDPR_PIL	rdpr	%pil, %r19
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a8c  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1a8c, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa3520000  ! 14: RDPR_PIL	rdpr	%pil, %r17
mondo_80_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d91c011  ! 15: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
jmptr_80_9:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_10) + 48, 16, 16)) -> intp(4,0,2)
#else
	setx 0x157abb89b85d6f66, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_11:
	rd %pc, %r12
	add %r12, (donretarg_80_11-donret_80_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b3a800 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d15, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_80_11:
	.word 0xd8ffe138  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x0138] %asi
splash_hpstate_80_12:
	.word 0x81983087  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1087, %hpstate
	.word 0xab82c002  ! 20: WR_CLEAR_SOFTINT_R	wr	%r11, %r2, %clear_softint
splash_cmpr_80_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 21: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_80_14:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 22: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e090  ! 23: LDSWA_I	ldswa	[%r31, + 0x0090] %asi, %r12
	.word 0x8d9036c1  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x16c1, %pstate
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
    brnz %r10, sma_80_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 25: CASA_R	casa	[%r31] %asi, %r20, %r12
brcommon3_80_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c010  ! 1: STQF_R	-	%f12, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd83fe140  ! 26: STD_I	std	%r12, [%r31 + 0x0140]
trapasi_80_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8904e60  ! 27: LDUHA_R	lduha	[%r1, %r0] 0x73, %r12
ceter_80_19:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 28: RDTICK	rd	%tick, %r10
splash_cmpr_80_20:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_80_21:
	set user_data_start, %r31
	.word 0x8582210d  ! 30: WRCCR_I	wr	%r8, 0x010d, %ccr
	.word 0xa680c014  ! 31: ADDcc_R	addcc 	%r3, %r20, %r19
	.word 0xe1bfe1c0  ! 32: STDFA_I	stda	%f16, [0x01c0, %r31]
    set 0x3c48, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b447c1  ! 33: PDIST	pdistn	%d48, %d32, %d50
brcommon3_80_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e0f0  ! 1: STQF_I	-	%f13, [0x00f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fc013  ! 34: LDDF_R	ldd	[%r31, %r19], %f13
	.word 0xdac7e098  ! 35: LDSWA_I	ldswa	[%r31, + 0x0098] %asi, %r13
ibp_80_23:
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
ibp_startwait80_23:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_23
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_23:
    brnz %r16, ibp_wait80_23
    ld [%r23], %r16
    ba ibp_startwait80_23
    mov 0x80, %r16
continue_ibp_80_23:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_23:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_23
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_23:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_23
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_23:
    best_set_reg(0x000000402dc0ff8c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe1a0  ! 36: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_80_25:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xda884a00  ! 39: LDUBA_R	lduba	[%r1, %r0] 0x50, %r13
brcommon1_80_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe030  ! 1: STXFSR_I	st-sfr	%f1, [0x0030, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa3702ead  ! 40: POPC_I	popc	0x0ead, %r17
ibp_80_27:
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
ibp_startwait80_27:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_27
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_27:
    brnz %r16, ibp_wait80_27
    ld [%r23], %r16
    ba ibp_startwait80_27
    mov 0x80, %r16
continue_ibp_80_27:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_27:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_27
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_27:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_27
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_27:
    best_set_reg(0x0000004092ff8cb0,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd4bfc02a  ! 41: STDA_R	stda	%r10, [%r31 + %r10] 0x01
	.word 0xa5a000d4  ! 42: FNEGd	fnegd	%f20, %f18
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
    brnz %r10, cwq_80_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_28
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
cwq_80_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 43: RDPC	rd	%pc, %r20
splash_htba_80_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_30) + 16, 16, 16)) -> intp(4,0,27)
#else
	setx 0x0771889a420d4910, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90310b  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x110b, %pstate
ibp_80_32:
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
ibp_startwait80_32:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_32
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_32:
    brnz %r16, ibp_wait80_32
    ld [%r23], %r16
    ba ibp_startwait80_32
    mov 0x80, %r16
continue_ibp_80_32:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_32:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_32
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_32:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_32
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_32:
    best_set_reg(0x00000050b1ccb0f5,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fe180  ! 47: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_80_33:
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
ibp_startwait80_33:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_33
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_33:
    brnz %r16, ibp_wait80_33
    ld [%r23], %r16
    ba ibp_startwait80_33
    mov 0x80, %r16
continue_ibp_80_33:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_33:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_33
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_33:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_33
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_33:
    best_set_reg(0x00000050b2f0f5d1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe020  ! 49: STDFA_I	stda	%f16, [0x0020, %r31]
ibp_80_34:
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
ibp_startwait80_34:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_34
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_34:
    brnz %r16, ibp_wait80_34
    ld [%r23], %r16
    ba ibp_startwait80_34
    mov 0x80, %r16
continue_ibp_80_34:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_34:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_34
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_34:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_34
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_34:
    best_set_reg(0x00000050e2f5d186,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa97033aa  ! 50: POPC_I	popc	0x13aa, %r20
	.word 0x8d9024fb  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x04fb, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e120  ! 53: LDSWA_I	ldswa	[%r31, + 0x0120] %asi, %r17
	.word 0xe33fe1d3  ! 54: STDF_I	std	%f17, [0x01d3, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_80_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0x387be15a56093e21, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_80_38:
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
ibp_startwait80_38:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_38
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_38:
    brnz %r16, ibp_wait80_38
    ld [%r23], %r16
    ba ibp_startwait80_38
    mov 0x80, %r16
continue_ibp_80_38:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_38:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_38
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_38:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_38
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_38:
    best_set_reg(0x00000040c1d186b6,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe29fc029  ! 57: LDDA_R	ldda	[%r31, %r9] 0x01, %r17
	.word 0xa5524000  ! 58: RDPR_CWP	rdpr	%cwp, %r18
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
    best_set_reg(0x0000004006c6b636,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe040  ! 59: STDFA_I	stda	%f16, [0x0040, %r31]
mondo_80_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d90c012  ! 60: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
ibp_80_41:
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
ibp_startwait80_41:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_41
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_41:
    brnz %r16, ibp_wait80_41
    ld [%r23], %r16
    ba ibp_startwait80_41
    mov 0x80, %r16
continue_ibp_80_41:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_41:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_41
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_41:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_41
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_41:
    best_set_reg(0x000000408af636f8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fd920  ! 61: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe8dfe0c8  ! 62: LDXA_I	ldxa	[%r31, + 0x00c8] %asi, %r20
	.word 0x879a4012  ! 63: WRHPR_HINTP_R	wrhpr	%r9, %r18, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_42) + 32, 16, 16)) -> intp(6,0,31)
#else
	setx 0x6e1ec3fb60b5b7ac, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe000  ! 65: STDFA_I	stda	%f0, [0x0000, %r31]
ibp_80_44:
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
ibp_startwait80_44:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_44
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_44:
    brnz %r16, ibp_wait80_44
    ld [%r23], %r16
    ba ibp_startwait80_44
    mov 0x80, %r16
continue_ibp_80_44:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_44:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_44
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_44:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_44
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_44:
    best_set_reg(0x0000004034f6f8cf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fd920  ! 66: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_80_45:
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
ibp_startwait80_45:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_45
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_45:
    brnz %r16, ibp_wait80_45
    ld [%r23], %r16
    ba ibp_startwait80_45
    mov 0x80, %r16
continue_ibp_80_45:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_45:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_45
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_45:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_45
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_45:
    best_set_reg(0x000000401af8cf95,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe91fc010  ! 67: LDDF_R	ldd	[%r31, %r16], %f20
	.word 0xe927e04a  ! 68: STF_I	st	%f20, [0x004a, %r31]
mondo_80_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d940003  ! 69: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0xb1840010  ! 70: WR_STICK_REG_R	wr	%r16, %r16, %-
br_badelay3_80_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3150012  ! 1: LDQF_R	-	[%r20, %r18], %f17
	.word 0xa9a50822  ! 71: FADDs	fadds	%f20, %f2, %f20
fpinit_80_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e833aa  ! 72: PREFETCHA_I	prefetcha	[%r0, + 0xfffff3aa] %asi, #one_read
brcommon2_80_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x95a0c9c4  ! 1: FDIVd	fdivd	%f34, %f4, %f10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe040  ! 73: STDFA_I	stda	%f16, [0x0040, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_50) + 24, 16, 16)) -> intp(4,0,26)
#else
	setx 0x2fee9a703faba29e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_80_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2ab92c738c339a7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_80_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e140  ! 1: STQF_I	-	%f13, [0x0140, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda97c031  ! 77: LDUHA_R	lduha	[%r31, %r17] 0x01, %r13
	.word 0xa980c012  ! 78: WR_SET_SOFTINT_R	wr	%r3, %r18, %set_softint
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d9036e7  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x16e7, %pstate
splash_lsu_80_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x2db5a6a8, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_55:
	nop
	ta T_CHANGE_HPRIV
	set 0xcd973459, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_56:
	rd %pc, %r12
	add %r12, (donretarg_80_56-donret_80_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008a8900 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b0d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_56:
	.word 0x95a489d1  ! 82: FDIVd	fdivd	%f18, %f48, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_80_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0x895, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac0a50  ! 84: FCMPd	fcmpd	%fcc<n>, %f16, %f16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_59:
	rd %pc, %r12
	add %r12, (donretarg_80_59-donret_80_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009c7400 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xade, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_80_59:
	.word 0xd86fe1ef  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x01ef]
trapasi_80_60:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 86: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_80_61:
	nop
	setx 0xfffff512fffffd38, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tick_80_62:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x421a84e4679d924c, %r16, %r17)
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_80_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0x978, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc011  ! 90: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0xd857e068  ! 91: LDSH_I	ldsh	[%r31 + 0x0068], %r12
	.word 0xb1804012  ! 92: WR_STICK_REG_R	wr	%r1, %r18, %-
	.word 0xd89fd160  ! 93: LDDA_R	ldda	[%r31, %r0] 0x8b, %r12
splash_hpstate_80_64:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x81983f83  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f83, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_80_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x997020f0  ! 1: POPC_I	popc	0x00f0, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa570299b  ! 96: POPC_I	popc	0x099b, %r18
	.word 0x9f802f75  ! 97: SIR	sir	0x0f75
intveclr_80_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc4971271beda8e17, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tick_80_67:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x77a8cfe1faa92574, %r16, %r17)
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_80_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_80_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1a0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f802382  ! 101: SIR	sir	0x0382
intveclr_80_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa5f107d2953d68ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x76cf13486332d5c7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_72:
	rd %pc, %r12
	add %r12, (donretarg_80_72-donret_80_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003da300 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d07, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	retry
donretarg_80_72:
	.word 0x22cc8001  ! 104: BRZ	brz,a,pt	%r18,<label_0xc8001>
intveclr_80_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0x555bf37c206e4772, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd960  ! 106: STDFA_R	stda	%f0, [%r0, %r31]
cerer_80_75:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xf52364b407cf1e43, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0x9f80396f  ! 109: SIR	sir	0x196f
	.word 0xc1bfe1c0  ! 110: STDFA_I	stda	%f0, [0x01c0, %r31]
intveclr_80_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0x782989abb25d2a3e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 112: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfe1c0  ! 113: STDFA_I	stda	%f0, [0x01c0, %r31]
	.word 0xc3e84033  ! 114: PREFETCHA_R	prefetcha	[%r1, %r19] 0x01, #one_read
tagged_80_80:
	tsubcctv %r17, 0x18b4, %r19
	.word 0xd807e07a  ! 115: LDUW_I	lduw	[%r31 + 0x007a], %r12
	.word 0x96d0c010  ! 116: UMULcc_R	umulcc 	%r3, %r16, %r11
	setx 0xa564a1142dc71094, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_80_82:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2d04b40  ! 118: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r9
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d902c6d  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x0c6d, %pstate
ibp_80_84:
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
ibp_startwait80_84:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_84
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_84:
    brnz %r16, ibp_wait80_84
    ld [%r23], %r16
    ba ibp_startwait80_84
    mov 0x80, %r16
continue_ibp_80_84:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_84:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_84
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_84:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_84
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_84:
    best_set_reg(0x0000004084cf95d1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd297c028  ! 120: LDUHA_R	lduha	[%r31, %r8] 0x01, %r9
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
    brnz %r10, sma_80_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 121: CASA_R	casa	[%r31] %asi, %r13, %r9
fpinit_80_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82159  ! 122: PREFETCHA_I	prefetcha	[%r0, + 0x0159] %asi, #one_read
cmp_80_87:
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
cmp_startwait80_87:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_87
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_87:
    brnz,a %r10, cmp_wait80_87
    ld [%r23], %r10
    ba cmp_startwait80_87
    mov 0x80, %r10
continue_cmp_80_87:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_87
    mov 0xe2, %r17
    best_set_reg(0x77d0d9510735d9ae, %r16, %r17)
cmp_multi_core_80_87:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948011  ! 123: WRPR_PIL_R	wrpr	%r18, %r17, %pil
intveclr_80_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfbeb3f4b7dde7712, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d94c007  ! 125: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_90:
	rd %pc, %r12
	add %r12, (donretarg_80_90-donret_80_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c25f00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a19, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_90:
	.word 0xd26fe0e8  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x00e8]
	.word 0xd2cfe068  ! 127: LDSBA_I	ldsba	[%r31, + 0x0068] %asi, %r9
	.word 0xd23fe023  ! 128: STD_I	std	%r9, [%r31 + 0x0023]
	.word 0x8d802000  ! 129: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d020b2  ! 130: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x91520000  ! 131: RDPR_PIL	rdpr	%pil, %r8
mondo_80_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d924011  ! 132: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_92) + 32, 16, 16)) -> intp(4,0,11)
#else
	setx 0x6555ea15fbbe0db8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_80_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 134: FDIVd	fdivd	%f0, %f4, %f6
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2800a80  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r17
ibp_80_94:
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
ibp_startwait80_94:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_94
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_94:
    brnz %r16, ibp_wait80_94
    ld [%r23], %r16
    ba ibp_startwait80_94
    mov 0x80, %r16
continue_ibp_80_94:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_94:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_94
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_94:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_94
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_94:
    best_set_reg(0x0000005021d5d177,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe2dfc032  ! 137: LDXA_R	ldxa	[%r31, %r18] 0x01, %r17
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
    brnz %r10, cwq_80_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_95
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
cwq_80_95:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 138: RDPC	rd	%pc, %r12
	.word 0x87802020  ! 139: WRASI_I	wr	%r0, 0x0020, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_96) + 24, 16, 16)) -> intp(4,0,1)
#else
	setx 0x36f07e35b5992715, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1e7e010  ! 141: CASA_R	casa	[%r31] %asi, %r16, %r16
dvapa_80_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc5a, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ad0a51  ! 142: FCMPd	fcmpd	%fcc<n>, %f20, %f48
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_99:
	rd %pc, %r12
	add %r12, (donretarg_80_99-donret_80_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a5d300 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1785, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_99:
	.word 0x23400001  ! 143: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0xe477e0b8  ! 144: STX_I	stx	%r18, [%r31 + 0x00b8]
	.word 0x8d903067  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1067, %pstate
	.word 0xe4800c20  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
trapasi_80_101:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 147: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
ibp_80_102:
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
ibp_startwait80_102:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_102
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_102:
    brnz %r16, ibp_wait80_102
    ld [%r23], %r16
    ba ibp_startwait80_102
    mov 0x80, %r16
continue_ibp_80_102:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_102:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_102
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_102:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_102
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_102:
    best_set_reg(0x00000040cdd17716,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe4dfc030  ! 148: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
	setx 0xdea54024b780fce8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d918012  ! 150: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	setx 0xf60cf6a677ac0337, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_80_106:
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
ibp_startwait80_106:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_106
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_106:
    brnz %r16, ibp_wait80_106
    ld [%r23], %r16
    ba ibp_startwait80_106
    mov 0x80, %r16
continue_ibp_80_106:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_106:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_106
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_106:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_106
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_106:
    best_set_reg(0x000000502bf716c9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe43fe190  ! 152: STD_I	std	%r18, [%r31 + 0x0190]
trapasi_80_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4d04e40  ! 153: LDSHA_R	ldsha	[%r1, %r0] 0x72, %r18
	.word 0x9f8031ed  ! 154: SIR	sir	0x11ed
splash_cmpr_80_108:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 155: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_80_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x64b5996a3f50b4ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_80_110:
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
ibp_startwait80_110:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_110
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_110:
    brnz %r16, ibp_wait80_110
    ld [%r23], %r16
    ba ibp_startwait80_110
    mov 0x80, %r16
continue_ibp_80_110:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_110:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_110
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_110:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_110
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_110:
    best_set_reg(0x00000050f3d6c910,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x95b50494  ! 157: FCMPLE32	fcmple32	%d20, %d20, %r10
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe19fd920  ! 159: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80266e  ! 160: SIR	sir	0x066e
splash_hpstate_80_112:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x81983d65  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d65, %hpstate
	.word 0xe327e1bb  ! 162: STF_I	st	%f17, [0x01bb, %r31]
	.word 0x93d020b3  ! 163: Tcc_I	tne	icc_or_xcc, %r0 + 179
mondo_80_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d918011  ! 164: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
br_badelay2_80_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b48311  ! 165: ALIGNADDRESS	alignaddr	%r18, %r17, %r12
fpinit_80_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 166: FCMPLE32	fcmple32	%d0, %d4, %r6
    set 0x277c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b107cd  ! 167: PDIST	pdistn	%d4, %d44, %d8
memptr_80_116:
	set 0x60340000, %r31
	.word 0x8581f5fe  ! 168: WRCCR_I	wr	%r7, 0x15fe, %ccr
	.word 0xd4c7e0c0  ! 169: LDSWA_I	ldswa	[%r31, + 0x00c0] %asi, %r10
	setx 0xb70a461af0e49386, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_118:
	.word 0x81983acf  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1acf, %hpstate
mondo_80_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d910014  ! 172: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
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
    brnz %r10, cwq_80_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_120
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
cwq_80_120:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 173: RDPC	rd	%pc, %r18
ibp_80_121:
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
ibp_startwait80_121:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_121
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_121:
    brnz %r16, ibp_wait80_121
    ld [%r23], %r16
    ba ibp_startwait80_121
    mov 0x80, %r16
continue_ibp_80_121:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_121:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_121
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_121:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_121
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_121:
    best_set_reg(0x00000040cbc91076,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdc00  ! 174: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd48008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 176: WRFPRS_I	wr	%r0, 0x0000, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_122) + 40, 16, 16)) -> intp(0,0,4)
#else
	setx 0xd3609394e530ad71, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x6b5e651421f81668, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 179: Tcc_I	te	icc_or_xcc, %r0 + 50
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_124) + 8, 16, 16)) -> intp(7,0,15)
#else
	setx 0x0ff1230b12f46daa, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_80_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 181: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_tba_80_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_80_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 183: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xd4dfe0d0  ! 184: LDXA_I	ldxa	[%r31, + 0x00d0] %asi, %r10
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
    brnz %r10, cwq_80_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_128
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
cwq_80_128:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 185: RDPC	rd	%pc, %r13
intveclr_80_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd8de908149240903, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_80_130:
	set 0x60340000, %r31
	.word 0x8581e695  ! 187: WRCCR_I	wr	%r7, 0x0695, %ccr
cmp_80_131:
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
cmp_startwait80_131:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_131
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_131:
    brnz,a %r10, cmp_wait80_131
    ld [%r23], %r10
    ba cmp_startwait80_131
    mov 0x80, %r10
continue_cmp_80_131:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_131
    mov 30, %r17
    best_set_reg(0xd2e75a64dc6ef090, %r16, %r17)
cmp_multi_core_80_131:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91928010  ! 188: WRPR_PIL_R	wrpr	%r10, %r16, %pil
cmp_80_132:
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
cmp_startwait80_132:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_132
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_132:
    brnz,a %r10, cmp_wait80_132
    ld [%r23], %r10
    ba cmp_startwait80_132
    mov 0x80, %r10
continue_cmp_80_132:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_132
    mov 44, %r17
    best_set_reg(0xb0595c18d4df921b, %r16, %r17)
cmp_multi_core_80_132:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa1a00164  ! 189: FABSq	dis not found

	.word 0xe8800c60  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_80_133:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_80_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 194: RDTICK	rd	%tick, %r16
	.word 0x8d802004  ! 195: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97520000  ! 196: RDPR_PIL	rdpr	%pil, %r11
	setx 0x99fc5865527285d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e1b0  ! 198: STF_I	st	%f11, [0x01b0, %r31]
ibp_80_136:
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
ibp_startwait80_136:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_136
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_136:
    brnz %r16, ibp_wait80_136
    ld [%r23], %r16
    ba ibp_startwait80_136
    mov 0x80, %r16
continue_ibp_80_136:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_136:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_136
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_136:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_136
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_136:
    best_set_reg(0x000000409cd076fe,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fe0a0  ! 199: LDDFA_I	ldda	[%r31, 0x00a0], %f16
ibp_80_137:
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
ibp_startwait80_137:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_137
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_137:
    brnz %r16, ibp_wait80_137
    ld [%r23], %r16
    ba ibp_startwait80_137
    mov 0x80, %r16
continue_ibp_80_137:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_137:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_137
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_137:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_137
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_137:
    best_set_reg(0x0000004024f6fecf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd69fc032  ! 200: LDDA_R	ldda	[%r31, %r18] 0x01, %r11
splash_tick_80_138:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x4cb51b45869aa791, %r16, %r17)
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
cmpenall_80_139:
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
cmpenall_startwait80_139:
    mov 0x80, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_80_139
    nop
cmpenall_wait80_139:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait80_139
    nop
    ba,a cmpenall_startwait80_139
continue_cmpenall_80_139:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_80_139:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_80_139
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_80_139:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_80_139
    ldxa [0x58]%asi, %r16       !Running_status
    st %g0, [%r23]              !clear lock
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
    ta T_CHANGE_NONHPRIV 
vahole_40_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
cwp_40_1:
    set user_data_start, %o7
	.word 0x93902005  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
pmu_40_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdfffffff2ae, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_40_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 4: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d903838  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1838, %pstate
brcommon1_40_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9ca  ! 1: FDIVd	fdivd	%f62, %f10, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95b0c7d1  ! 7: PDIST	pdistn	%d34, %d48, %d10
	.word 0xe277e088  ! 8: STX_I	stx	%r17, [%r31 + 0x0088]
ibp_40_6:
	nop
	.word 0xe3e7e012  ! 9: CASA_R	casa	[%r31] %asi, %r18, %r17
	.word 0x95520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038ad  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x18ad, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa3520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_40_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 15: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
jmptr_40_9:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_10) + 56, 16, 16)) -> intp(0,0,2)
#else
	setx 0x40218a2acfdd3f18, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_11:
	rd %pc, %r12
	add %r12, (donretarg_40_11-donret_40_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00057c00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd1b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_11:
	.word 0xd8ffe1f2  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x01f2] %asi
splash_hpstate_40_12:
	.word 0x81983b97  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b97, %hpstate
	.word 0xab818008  ! 20: WR_CLEAR_SOFTINT_R	wr	%r6, %r8, %clear_softint
splash_cmpr_40_13:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 21: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_40_14:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8904980  ! 22: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e0d8  ! 23: LDSWA_I	ldswa	[%r31, + 0x00d8] %asi, %r12
	.word 0x8d903808  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x1808, %pstate
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
    brnz %r10, sma_40_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 25: CASA_R	casa	[%r31] %asi, %r11, %r12
brcommon3_40_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c00a  ! 1: STQF_R	-	%f12, [%r10, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd83fe060  ! 26: STD_I	std	%r12, [%r31 + 0x0060]
trapasi_40_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8d84e60  ! 27: LDXA_R	ldxa	[%r1, %r0] 0x73, %r12
ceter_40_19:
    nop
    ta T_CHANGE_HPRIV
    mov 4, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 28: RDTICK	rd	%tick, %r17
splash_cmpr_40_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_40_21:
	set user_data_start, %r31
	.word 0x8584ee0e  ! 30: WRCCR_I	wr	%r19, 0x0e0e, %ccr
	.word 0x94814012  ! 31: ADDcc_R	addcc 	%r5, %r18, %r10
	.word 0xc1bfe100  ! 32: STDFA_I	stda	%f0, [0x0100, %r31]
    set 0xa53, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b487c8  ! 33: PDIST	pdistn	%d18, %d8, %d10
brcommon3_40_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e090  ! 1: STQF_I	-	%f13, [0x0090, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb3fc011  ! 34: STDF_R	std	%f13, [%r17, %r31]
	.word 0xdac7e1c0  ! 35: LDSWA_I	ldswa	[%r31, + 0x01c0] %asi, %r13
ibp_40_23:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0e0  ! 36: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_40_25:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdac04a00  ! 39: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r13
brcommon1_40_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe100  ! 1: STXFSR_I	st-sfr	%f1, [0x0100, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f802fb5  ! 40: SIR	sir	0x0fb5
ibp_40_27:
	nop
	.word 0xd51fc014  ! 41: LDDF_R	ldd	[%r31, %r20], %f10
	.word 0xa9a000d0  ! 42: FNEGd	fnegd	%f16, %f20
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
    brnz %r10, cwq_40_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_28
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
cwq_40_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 43: RDPC	rd	%pc, %r19
splash_htba_40_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_30) + 24, 16, 16)) -> intp(7,0,31)
#else
	setx 0x2b150df48f3e7f8d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033c1  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x13c1, %pstate
ibp_40_32:
	nop
	.word 0xe19fe160  ! 47: LDDFA_I	ldda	[%r31, 0x0160], %f16
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_40_33:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 49: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_40_34:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa7a249d2  ! 50: FDIVd	fdivd	%f40, %f18, %f50
	.word 0x8d903499  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x1499, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e1b0  ! 53: LDSWA_I	ldswa	[%r31, + 0x01b0] %asi, %r17
	.word 0xe33fe0ec  ! 54: STDF_I	std	%f17, [0x00ec, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_40_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0x993c466124f30190, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_40_38:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc013  ! 57: LDDF_R	ldd	[%r31, %r19], %f17
	.word 0x97524000  ! 58: RDPR_CWP	<illegal instruction>
ibp_40_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0e0  ! 59: STDFA_I	stda	%f0, [0x00e0, %r31]
mondo_40_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d940013  ! 60: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
ibp_40_41:
	nop
	.word 0xe19fe180  ! 61: LDDFA_I	ldda	[%r31, 0x0180], %f16
	.word 0xe8dfe150  ! 62: LDXA_I	ldxa	[%r31, + 0x0150] %asi, %r20
	.word 0x879a4001  ! 63: WRHPR_HINTP_R	wrhpr	%r9, %r1, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_42) + 16, 16, 16)) -> intp(0,0,20)
#else
	setx 0xd1a5926505c9e975, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_40_43:
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
iaw_startwait40_43:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_43
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_43:
    brnz %r16, iaw_wait40_43
    ld [%r23], %r16
    ba iaw_startwait40_43
    mov 0x40, %r16
continue_iaw_40_43:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_43:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_43
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_43:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_43
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_43:
	mov 0x38, %r18
iaw1_40_43:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe180  ! 65: STDFA_I	stda	%f0, [0x0180, %r31]
ibp_40_44:
	nop
	.word 0xe1bfdb60  ! 66: STDFA_R	stda	%f16, [%r0, %r31]
ibp_40_45:
	nop
	.word 0x9f802110  ! 67: SIR	sir	0x0110
	.word 0xe927e1c4  ! 68: STF_I	st	%f20, [0x01c4, %r31]
mondo_40_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d95000b  ! 69: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0xb180c013  ! 70: WR_STICK_REG_R	wr	%r3, %r19, %-
br_badelay3_40_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9114011  ! 1: LDQF_R	-	[%r5, %r17], %f20
	.word 0x99a34831  ! 71: FADDs	fadds	%f13, %f17, %f12
fpinit_40_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 72: FCMPLE32	fcmple32	%d0, %d4, %r6
brcommon2_40_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f802010  ! 1: SIR	sir	0x0010
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe040  ! 73: LDDFA_I	ldda	[%r31, 0x0040], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_50) + 16, 16, 16)) -> intp(3,0,13)
#else
	setx 0x68694e631f5cf077, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_40_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1fb539b6e61b25b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_40_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e180  ! 1: STQF_I	-	%f13, [0x0180, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda3fe190  ! 77: STD_I	std	%r13, [%r31 + 0x0190]
	.word 0xa982c010  ! 78: WR_SET_SOFTINT_R	wr	%r11, %r16, %set_softint
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037fc  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x17fc, %pstate
splash_lsu_40_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x84c8b38e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_55:
	nop
	ta T_CHANGE_HPRIV
	set 0x602894de, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_56:
	rd %pc, %r12
	add %r12, (donretarg_40_56-donret_40_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000cc700 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_56:
	.word 0xa1a209ca  ! 82: FDIVd	fdivd	%f8, %f10, %f16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_40_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0x91f, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea4023  ! 84: PREFETCHA_R	prefetcha	[%r9, %r3] 0x01, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_59:
	rd %pc, %r12
	add %r12, (donretarg_40_59-donret_40_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009d3000 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x189f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	done
donretarg_40_59:
	.word 0xd86fe1ed  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x01ed]
trapasi_40_60:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d04b60  ! 86: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_40_61:
	nop
	setx 0xfffffbddfffff767, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_40_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb60, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd89fe190  ! 90: LDDA_I	ldda	[%r31, + 0x0190] %asi, %r12
	.word 0xd857e020  ! 91: LDSH_I	ldsh	[%r31 + 0x0020], %r12
	.word 0xb1844008  ! 92: WR_STICK_REG_R	wr	%r17, %r8, %-
	.word 0xd89fdc40  ! 93: LDDA_R	ldda	[%r31, %r0] 0xe2, %r12
splash_hpstate_40_64:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x81982a83  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a83, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_40_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x997020b0  ! 1: POPC_I	popc	0x00b0, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a2c9c7  ! 96: FDIVd	fdivd	%f42, %f38, %f50
	.word 0x9f802124  ! 97: SIR	sir	0x0124
intveclr_40_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf8dafe02273c0ea4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_40_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_40_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1a0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f80365e  ! 101: SIR	sir	0x165e
intveclr_40_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x704dca06abd2ad68, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xe5db76574d3cc38b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_72:
	rd %pc, %r12
	add %r12, (donretarg_40_72-donret_40_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0015dc00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1645, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	retry
donretarg_40_72:
	.word 0x22ca4001  ! 104: BRZ	brz,a,pt	%r9,<label_0xa4001>
intveclr_40_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc45040a223c703c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
iaw_40_74:
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
iaw_startwait40_74:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_74
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_74:
    brnz %r16, iaw_wait40_74
    ld [%r23], %r16
    ba iaw_startwait40_74
    mov 0x40, %r16
continue_iaw_40_74:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_74:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_74
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_74:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_74
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_74:
	mov 0x38, %r18
iaw1_40_74:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe1a0  ! 106: STDFA_I	stda	%f0, [0x01a0, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	fble skip_40_76
	brnz,a,pt	%r5, skip_40_76
.align 1024
skip_40_76:
	.word 0x39400001  ! 109: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe1a0  ! 110: STDFA_I	stda	%f0, [0x01a0, %r31]
intveclr_40_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0x891906cc4a6f85c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_78:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 112: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfe1e0  ! 113: STDFA_I	stda	%f0, [0x01e0, %r31]
unsupttte_40_79:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9b28485  ! 114: FCMPLE32	fcmple32	%d10, %d36, %r20
tagged_40_80:
	tsubcctv %r16, 0x1e04, %r20
	.word 0xd807e1a3  ! 115: LDUW_I	lduw	[%r31 + 0x01a3], %r12
	.word 0xa4d04010  ! 116: UMULcc_R	umulcc 	%r1, %r16, %r18
	setx 0x77b0255033ceb82e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_40_82:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2d84b40  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r9
	.word 0x2acac001  ! 1: BRNZ	brnz,a,pt	%r11,<label_0xac001>
	.word 0x8d902679  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x0679, %pstate
ibp_40_84:
	nop
	.word 0x9f802030  ! 120: SIR	sir	0x0030
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
    brnz %r10, sma_40_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 121: CASA_R	casa	[%r31] %asi, %r18, %r9
fpinit_40_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82159  ! 122: PREFETCHA_I	prefetcha	[%r0, + 0x0159] %asi, #one_read
	.word 0x91948013  ! 123: WRPR_PIL_R	wrpr	%r18, %r19, %pil
intveclr_40_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0x231fe7cb70561ef7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d944003  ! 125: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_90:
	rd %pc, %r12
	add %r12, (donretarg_40_90-donret_40_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007ed700 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x681, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_90:
	.word 0xd26fe18b  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x018b]
	.word 0xd2cfe1a0  ! 127: LDSBA_I	ldsba	[%r31, + 0x01a0] %asi, %r9
	.word 0xd23fe00a  ! 128: STD_I	std	%r9, [%r31 + 0x000a]
	.word 0x8d802000  ! 129: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d020b3  ! 130: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x99520000  ! 131: RDPR_PIL	rdpr	%pil, %r12
mondo_40_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d948014  ! 132: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_92) + 16, 16, 16)) -> intp(4,0,15)
#else
	setx 0xcc45ffa5cd50e1e5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_40_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 134: FDIVd	fdivd	%f0, %f4, %f6
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_40_94:
	nop
	.word 0xe23fe070  ! 137: STD_I	std	%r17, [%r31 + 0x0070]
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
    brnz %r10, cwq_40_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_95
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
cwq_40_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 138: RDPC	rd	%pc, %r20
	.word 0x87802014  ! 139: WRASI_I	wr	%r0, 0x0014, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_96) + 48, 16, 16)) -> intp(1,0,29)
#else
	setx 0x14b750d5370ad80c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_40_97:
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
iaw_startwait40_97:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_97
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_97:
    brnz %r16, iaw_wait40_97
    ld [%r23], %r16
    ba iaw_startwait40_97
    mov 0x40, %r16
continue_iaw_40_97:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_97:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_97
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_97:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_97
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_97:
	mov 0x38, %r18
iaw1_40_97:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe11fe150  ! 141: LDDF_I	ldd	[%r31, 0x0150], %f16
dvapa_40_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa0c, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5b307c3  ! 142: PDIST	pdistn	%d12, %d34, %d18
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_99:
	rd %pc, %r12
	add %r12, (donretarg_40_99-donret_40_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c81c00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d9e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_99:
	.word 0x25400001  ! 143: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe477e168  ! 144: STX_I	stx	%r18, [%r31 + 0x0168]
	.word 0x8d902420  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0420, %pstate
	.word 0xe48008a0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
trapasi_40_101:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c844a0  ! 147: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r18
ibp_40_102:
	nop
	.word 0xe4dfc02a  ! 148: LDXA_R	ldxa	[%r31, %r10] 0x01, %r18
	setx 0xa71a203e8c1963f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 150: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	setx 0x365f2bd8da875216, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_40_106:
	nop
	.word 0x9f802000  ! 152: SIR	sir	0x0000
trapasi_40_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4d04e40  ! 153: LDSHA_R	ldsha	[%r1, %r0] 0x72, %r18
	.word 0x9f80244a  ! 154: SIR	sir	0x044a
splash_cmpr_40_108:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 155: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_40_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xce9732f127ef21b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_40_110:
	nop
	.word 0xa5a449b3  ! 157: FDIVs	fdivs	%f17, %f19, %f18
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
iaw_40_111:
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
iaw_startwait40_111:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_111
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_111:
    brnz %r16, iaw_wait40_111
    ld [%r23], %r16
    ba iaw_startwait40_111
    mov 0x40, %r16
continue_iaw_40_111:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_111:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_111
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_111:
	mov 0x38, %r18
iaw4_40_111:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc3e0  ! 159: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802442  ! 160: SIR	sir	0x0442
splash_hpstate_40_112:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x81983745  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1745, %hpstate
	.word 0xe327e1a6  ! 162: STF_I	st	%f17, [0x01a6, %r31]
	.word 0x91d020b2  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_40_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 164: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
br_badelay2_40_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b48312  ! 165: ALIGNADDRESS	alignaddr	%r18, %r18, %r9
fpinit_40_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e826bd  ! 166: PREFETCHA_I	prefetcha	[%r0, + 0x06bd] %asi, #one_read
    set 0x3d0a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b507d3  ! 167: PDIST	pdistn	%d20, %d50, %d12
memptr_40_116:
	set 0x60740000, %r31
	.word 0x85847a59  ! 168: WRCCR_I	wr	%r17, 0x1a59, %ccr
	.word 0xd4c7e1b8  ! 169: LDSWA_I	ldswa	[%r31, + 0x01b8] %asi, %r10
	setx 0x183e3ee36b04d092, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_118:
	.word 0x819824cc  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cc, %hpstate
mondo_40_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d90c004  ! 172: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
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
    brnz %r10, cwq_40_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_120
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
cwq_40_120:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 173: RDPC	rd	%pc, %r13
ibp_40_121:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 174: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd4800b80  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r10
	.word 0x8d802004  ! 176: WRFPRS_I	wr	%r0, 0x0004, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_122) + 16, 16, 16)) -> intp(6,0,0)
#else
	setx 0x62c87d869b6e6900, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xd30aa2f6ecfbe24c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 178
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_124) + 56, 16, 16)) -> intp(0,0,25)
#else
	setx 0xa3310c34c11ea95d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_40_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83c6d  ! 181: PREFETCHA_I	prefetcha	[%r0, + 0xfffffc6d] %asi, #one_read
splash_tba_40_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_40_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 183: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xd4dfe050  ! 184: LDXA_I	ldxa	[%r31, + 0x0050] %asi, %r10
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
    brnz %r10, cwq_40_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_128
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
cwq_40_128:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 185: RDPC	rd	%pc, %r11
intveclr_40_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe98035f9fa6dc0c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_40_130:
	set 0x60540000, %r31
	.word 0x858262d9  ! 187: WRCCR_I	wr	%r9, 0x02d9, %ccr
	.word 0x91948012  ! 188: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	.word 0xa5a0016c  ! 189: FABSq	dis not found

	.word 0xe8800ae0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_40_133:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 192: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_40_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 194: RDTICK	rd	%tick, %r9
	.word 0x8d802004  ! 195: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa9520000  ! 196: RDPR_PIL	rdpr	%pil, %r20
	setx 0x6f8e7ba93dfde0b1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e1f0  ! 198: STF_I	st	%f11, [0x01f0, %r31]
ibp_40_136:
	nop
	.word 0xe1bfc2c0  ! 199: STDFA_R	stda	%f16, [%r0, %r31]
ibp_40_137:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc010  ! 200: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
    ta T_CHANGE_NONHPRIV 
vahole_20_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
cwp_20_1:
    set user_data_start, %o7
	.word 0x93902003  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
pmu_20_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb2efffff9c8, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_20_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 4: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903334  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1334, %pstate
brcommon1_20_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8033f7  ! 7: SIR	sir	0x13f7
	.word 0xe277e14c  ! 8: STX_I	stx	%r17, [%r31 + 0x014c]
ibp_20_6:
	nop
	.word 0xe29fc02c  ! 9: LDDA_R	ldda	[%r31, %r12] 0x01, %r17
	.word 0xa3520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x2cc98001  ! 1: BRGZ	brgz,a,pt	%r6,<label_0x98001>
	.word 0x8d903ec5  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1ec5, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x93520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_20_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d904002  ! 15: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
jmptr_20_9:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_10) + 40, 16, 16)) -> intp(6,0,17)
#else
	setx 0x255112c78ef0d900, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_11:
	rd %pc, %r12
	add %r12, (donretarg_20_11-donret_20_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0076ee00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe13, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_11:
	.word 0xd8ffe1b0  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x01b0] %asi
splash_hpstate_20_12:
	.word 0x81982187  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0187, %hpstate
	.word 0xab84400b  ! 20: WR_CLEAR_SOFTINT_R	wr	%r17, %r11, %clear_softint
splash_cmpr_20_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 21: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_20_14:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 22: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e068  ! 23: LDSWA_I	ldswa	[%r31, + 0x0068] %asi, %r12
	.word 0x8d90313a  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x113a, %pstate
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
    brnz %r10, sma_20_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 25: CASA_R	casa	[%r31] %asi, %r17, %r12
brcommon3_20_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd897c02d  ! 26: LDUHA_R	lduha	[%r31, %r13] 0x01, %r12
trapasi_20_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8d04e60  ! 27: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r12
ceter_20_19:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 28: RDTICK	rd	%tick, %r9
splash_cmpr_20_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_20_21:
	set user_data_start, %r31
	.word 0x858525f7  ! 30: WRCCR_I	wr	%r20, 0x05f7, %ccr
	.word 0xa0820012  ! 31: ADDcc_R	addcc 	%r8, %r18, %r16
	.word 0xe1bfe040  ! 32: STDFA_I	stda	%f16, [0x0040, %r31]
    set 0x11f5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507c6  ! 33: PDIST	pdistn	%d20, %d6, %d40
brcommon3_20_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e070  ! 1: STQF_I	-	%f13, [0x0070, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdabfc02d  ! 34: STDA_R	stda	%r13, [%r31 + %r13] 0x01
	.word 0xdac7e1b8  ! 35: LDSWA_I	ldswa	[%r31, + 0x01b8] %asi, %r13
ibp_20_23:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdf20  ! 36: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_20_25:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xdad04a00  ! 39: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r13
brcommon1_20_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1b0  ! 1: STXFSR_I	st-sfr	%f1, [0x01b0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99703e8f  ! 40: POPC_I	popc	0x1e8f, %r12
ibp_20_27:
	nop
	.word 0xd4bfc02a  ! 41: STDA_R	stda	%r10, [%r31 + %r10] 0x01
	.word 0x95a000cd  ! 42: FNEGd	fnegd	%f44, %f10
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
    brnz %r10, cwq_20_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_28
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
cwq_20_28:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 43: RDPC	rd	%pc, %r9
splash_htba_20_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_30) + 16, 16, 16)) -> intp(3,0,16)
#else
	setx 0xcebe73275bf2a154, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26ca0001  ! 1: BRLZ	brlz,a,pt	%r8,<label_0xa0001>
	.word 0x8d902948  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0948, %pstate
ibp_20_32:
	nop
	.word 0xe19fe180  ! 47: LDDFA_I	ldda	[%r31, 0x0180], %f16
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_20_33:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 49: STDFA_I	stda	%f0, [0x00a0, %r31]
ibp_20_34:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99b347c9  ! 50: PDIST	pdistn	%d44, %d40, %d12
	.word 0x8d903b1e  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x1b1e, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e018  ! 53: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r17
	.word 0xe33fe1f0  ! 54: STDF_I	std	%f17, [0x01f0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_20_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0x09db5d7576106f08, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_20_38:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00a  ! 57: CASA_R	casa	[%r31] %asi, %r10, %r17
	.word 0x95524000  ! 58: RDPR_CWP	<illegal instruction>
ibp_20_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 59: STDFA_R	stda	%f16, [%r0, %r31]
mondo_20_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d918013  ! 60: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
ibp_20_41:
	nop
	.word 0xe1bfe0a0  ! 61: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe8dfe1d8  ! 62: LDXA_I	ldxa	[%r31, + 0x01d8] %asi, %r20
	.word 0x879c8013  ! 63: WRHPR_HINTP_R	wrhpr	%r18, %r19, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_42) + 32, 16, 16)) -> intp(0,0,24)
#else
	setx 0xb1ad210c755a83e1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdc00  ! 65: STDFA_R	stda	%f16, [%r0, %r31]
ibp_20_44:
	nop
	.word 0xe1bfe040  ! 66: STDFA_I	stda	%f16, [0x0040, %r31]
ibp_20_45:
	nop
	.word 0xe9e7e009  ! 67: CASA_R	casa	[%r31] %asi, %r9, %r20
	.word 0xe927e106  ! 68: STF_I	st	%f20, [0x0106, %r31]
mondo_20_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d940006  ! 69: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xb1844014  ! 70: WR_STICK_REG_R	wr	%r17, %r20, %-
br_badelay3_20_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd315000b  ! 1: LDQF_R	-	[%r20, %r11], %f9
	.word 0xa7a44828  ! 71: FADDs	fadds	%f17, %f8, %f19
fpinit_20_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 72: FCMPLE32	fcmple32	%d0, %d4, %r8
brcommon2_20_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x93a4c9d1  ! 1: FDIVd	fdivd	%f50, %f48, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1c0  ! 73: STDFA_I	stda	%f0, [0x01c0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_50) + 16, 16, 16)) -> intp(4,0,17)
#else
	setx 0x856997d7d9b9c9cd, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_20_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0x14bff682785ad0e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_20_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e130  ! 1: STQF_I	-	%f13, [0x0130, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fe020  ! 77: LDDF_I	ldd	[%r31, 0x0020], %f13
	.word 0xa984400d  ! 78: WR_SET_SOFTINT_R	wr	%r17, %r13, %set_softint
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	.word 0x8d903de4  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1de4, %pstate
splash_lsu_20_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x932a8df5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_55:
	nop
	ta T_CHANGE_HPRIV
	set 0xb6f93bce, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_56:
	rd %pc, %r12
	add %r12, (donretarg_20_56-donret_20_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aeba00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x50d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_56:
	.word 0x93a4c9d0  ! 82: FDIVd	fdivd	%f50, %f16, %f40
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_20_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb36, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0034  ! 84: PREFETCHA_R	prefetcha	[%r16, %r20] 0x01, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_59:
	rd %pc, %r12
	add %r12, (donretarg_20_59-donret_20_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007f8c00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x70f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_59:
	.word 0xd86fe0d9  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x00d9]
trapasi_20_60:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 86: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_20_61:
	nop
	setx 0xfffff3d1ffffffde, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_20_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa85, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc014  ! 90: STDF_R	std	%f12, [%r20, %r31]
	.word 0xd857e090  ! 91: LDSH_I	ldsh	[%r31 + 0x0090], %r12
	.word 0xb1844010  ! 92: WR_STICK_REG_R	wr	%r17, %r16, %-
	.word 0xd89fc380  ! 93: LDDA_R	ldda	[%r31, %r0] 0x1c, %r12
splash_hpstate_20_64:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8198298c  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_20_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x997020b0  ! 1: POPC_I	popc	0x00b0, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1a109c3  ! 96: FDIVd	fdivd	%f4, %f34, %f16
	.word 0x9f8033b6  ! 97: SIR	sir	0x13b6
intveclr_20_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6031a1e959532a4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_20_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_20_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1b0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01b0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x957031c6  ! 101: POPC_I	popc	0x11c6, %r10
intveclr_20_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb0c006e20ed8b0ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x1597eebff5342bae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_72:
	rd %pc, %r12
	add %r12, (donretarg_20_72-donret_20_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0098e000 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1685, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_72:
	.word 0x29400001  ! 104: FBPL	fbl,a,pn	%fcc0, <label_0x1>
intveclr_20_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd622ac0b8552e5d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fe0c0  ! 106: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	bcs  	 skip_20_76
	fbe,a,pn	%fcc0,  skip_20_76
.align 1024
skip_20_76:
	.word 0xa5b104d3  ! 109: FCMPNE32	fcmpne32	%d4, %d50, %r18
	.word 0xe1bfe1e0  ! 110: STDFA_I	stda	%f16, [0x01e0, %r31]
intveclr_20_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc5b048a9ce7d9125, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 112: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfe0e0  ! 113: STDFA_I	stda	%f0, [0x00e0, %r31]
unsupttte_20_79:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba509cb  ! 114: FDIVd	fdivd	%f20, %f42, %f44
tagged_20_80:
	tsubcctv %r10, 0x1d8a, %r5
	.word 0xd807e080  ! 115: LDUW_I	lduw	[%r31 + 0x0080], %r12
	.word 0xa2d20007  ! 116: UMULcc_R	umulcc 	%r8, %r7, %r17
	setx 0x6ae21ec434165b98, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_20_82:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2884b40  ! 118: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r9
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903045  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x1045, %pstate
ibp_20_84:
	nop
	.word 0xd297c031  ! 120: LDUHA_R	lduha	[%r31, %r17] 0x01, %r9
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
    brnz %r10, sma_20_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 121: CASA_R	casa	[%r31] %asi, %r11, %r9
fpinit_20_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 122: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x91950013  ! 123: WRPR_PIL_R	wrpr	%r20, %r19, %pil
intveclr_20_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1f1afcd8f0fa9679, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d934008  ! 125: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_90:
	rd %pc, %r12
	add %r12, (donretarg_20_90-donret_20_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0024e400 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17c3, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_90:
	.word 0xd26fe18d  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x018d]
	.word 0xd2cfe148  ! 127: LDSBA_I	ldsba	[%r31, + 0x0148] %asi, %r9
	.word 0xd23fe03d  ! 128: STD_I	std	%r9, [%r31 + 0x003d]
	.word 0x8d802004  ! 129: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d020b5  ! 130: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x91520000  ! 131: RDPR_PIL	rdpr	%pil, %r8
mondo_20_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950004  ! 132: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_92) + 8, 16, 16)) -> intp(6,0,24)
#else
	setx 0x7c1cc8d255e30d91, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 134: FCMPLE32	fcmple32	%d0, %d4, %r8
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_20_94:
	nop
	.word 0xe29fc02b  ! 137: LDDA_R	ldda	[%r31, %r11] 0x01, %r17
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
    brnz %r10, cwq_20_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_95
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
cwq_20_95:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 138: RDPC	rd	%pc, %r12
	.word 0x8780204f  ! 139: WRASI_I	wr	%r0, 0x004f, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_96) + 48, 16, 16)) -> intp(0,0,30)
#else
	setx 0x348e387d3bf33d7c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe11fe190  ! 141: LDDF_I	ldd	[%r31, 0x0190], %f16
dvapa_20_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc06, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f803ec5  ! 142: SIR	sir	0x1ec5
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_99:
	rd %pc, %r12
	add %r12, (donretarg_20_99-donret_20_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00938d00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e57, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_99:
	.word 0x24c8c001  ! 143: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
	.word 0xe477e1f4  ! 144: STX_I	stx	%r18, [%r31 + 0x01f4]
	.word 0x8d903d97  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1d97, %pstate
	.word 0xe4800ac0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
trapasi_20_101:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 147: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
ibp_20_102:
	nop
	.word 0xe497c02d  ! 148: LDUHA_R	lduha	[%r31, %r13] 0x01, %r18
	setx 0x1dd5b93c9bc4467f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94000b  ! 150: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	setx 0x5e012c1c0fa19f4d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_20_106:
	nop
	.word 0xe4dfc02d  ! 152: LDXA_R	ldxa	[%r31, %r13] 0x01, %r18
trapasi_20_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4884e40  ! 153: LDUBA_R	lduba	[%r1, %r0] 0x72, %r18
	.word 0x9f803ee6  ! 154: SIR	sir	0x1ee6
splash_cmpr_20_108:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 155: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_20_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb8f71ac2a41604ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_20_110:
	nop
	.word 0x91a1c9d4  ! 157: FDIVd	fdivd	%f38, %f20, %f8
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc1bfe0e0  ! 159: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0x9f8027d8  ! 160: SIR	sir	0x07d8
splash_hpstate_20_112:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x819828a5  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08a5, %hpstate
	.word 0xe327e1b5  ! 162: STF_I	st	%f17, [0x01b5, %r31]
	.word 0x91d02034  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_20_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d95000b  ! 164: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
br_badelay2_20_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b48313  ! 165: ALIGNADDRESS	alignaddr	%r18, %r19, %r12
fpinit_20_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 166: FDIVd	fdivd	%f0, %f4, %f8
    set 0x1f3e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b447c4  ! 167: PDIST	pdistn	%d48, %d4, %d12
memptr_20_116:
	set 0x60740000, %r31
	.word 0x8580fb0e  ! 168: WRCCR_I	wr	%r3, 0x1b0e, %ccr
	.word 0xd4c7e0a8  ! 169: LDSWA_I	ldswa	[%r31, + 0x00a8] %asi, %r10
	setx 0x8e0fcc1ba8ceda30, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_118:
	.word 0x81983701  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1701, %hpstate
mondo_20_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d94c003  ! 172: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
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
    brnz %r10, cwq_20_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_120
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
cwq_20_120:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 173: RDPC	rd	%pc, %r12
ibp_20_121:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 174: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd48008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802004  ! 176: WRFPRS_I	wr	%r0, 0x0004, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_122) + 8, 16, 16)) -> intp(0,0,31)
#else
	setx 0xcc2b9df4da9a9a5f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xe9b9cd0068d17e8e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 179: Tcc_I	tne	icc_or_xcc, %r0 + 51
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_124) + 56, 16, 16)) -> intp(4,0,9)
#else
	setx 0x90944947bed27ae5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83c6d  ! 181: PREFETCHA_I	prefetcha	[%r0, + 0xfffffc6d] %asi, #one_read
splash_tba_20_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_20_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 183: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xd4dfe180  ! 184: LDXA_I	ldxa	[%r31, + 0x0180] %asi, %r10
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
    brnz %r10, cwq_20_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_128
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
cwq_20_128:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 185: RDPC	rd	%pc, %r13
intveclr_20_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x55c88e422128aca2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_20_130:
	set 0x60740000, %r31
	.word 0x8584637f  ! 187: WRCCR_I	wr	%r17, 0x037f, %ccr
	.word 0x91914013  ! 188: WRPR_PIL_R	wrpr	%r5, %r19, %pil
	.word 0x99a00170  ! 189: FABSq	dis not found

	.word 0xe8800c00  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_20_133:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 192: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_20_134:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 194: RDTICK	rd	%tick, %r11
	.word 0x8d802004  ! 195: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1520000  ! 196: RDPR_PIL	<illegal instruction>
	setx 0x41f96718c7e31ca1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e060  ! 198: STF_I	st	%f11, [0x0060, %r31]
ibp_20_136:
	nop
	.word 0xe1bfe040  ! 199: STDFA_I	stda	%f16, [0x0040, %r31]
ibp_20_137:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd697c032  ! 200: LDUHA_R	lduha	[%r31, %r18] 0x01, %r11
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
    ta T_CHANGE_NONHPRIV 
vahole_10_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
cwp_10_1:
    set user_data_start, %o7
	.word 0x93902000  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_10_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7f3fffff4cc, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_10_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a02  ! 4: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa02] %asi, #one_read
	.word 0x8d802000  ! 5: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902ef1  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x0ef1, %pstate
brcommon1_10_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9c9  ! 1: FDIVd	fdivd	%f62, %f40, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91702260  ! 7: POPC_I	popc	0x0260, %r8
	.word 0xe277e118  ! 8: STX_I	stx	%r17, [%r31 + 0x0118]
ibp_10_6:
	nop
	.word 0xe23fe190  ! 9: STD_I	std	%r17, [%r31 + 0x0190]
	.word 0x95520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903dd9  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1dd9, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe4800b00  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0xa1520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_10_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 15: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
jmptr_10_9:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_10) + 8, 16, 16)) -> intp(2,0,10)
#else
	setx 0x2a5fb60fbb0e26b4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_11:
	rd %pc, %r12
	add %r12, (donretarg_10_11-donret_10_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c6b900 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e06, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_11:
	.word 0xd8ffe174  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x0174] %asi
splash_hpstate_10_12:
	.word 0x81983d0b  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0b, %hpstate
	.word 0xab834003  ! 20: WR_CLEAR_SOFTINT_R	wr	%r13, %r3, %clear_softint
splash_cmpr_10_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 21: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_10_14:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 22: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e1c0  ! 23: LDSWA_I	ldswa	[%r31, + 0x01c0] %asi, %r12
	.word 0x8d903281  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x1281, %pstate
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
    brnz %r10, sma_10_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 25: CASA_R	casa	[%r31] %asi, %r18, %r12
brcommon3_10_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c008  ! 1: STQF_R	-	%f12, [%r8, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd9e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r12
trapasi_10_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8884e60  ! 27: LDUBA_R	lduba	[%r1, %r0] 0x73, %r12
ceter_10_19:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 28: RDTICK	rd	%tick, %r18
splash_cmpr_10_20:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_10_21:
	set user_data_start, %r31
	.word 0x858522ef  ! 30: WRCCR_I	wr	%r20, 0x02ef, %ccr
	.word 0xa2824010  ! 31: ADDcc_R	addcc 	%r9, %r16, %r17
	.word 0xc1bfe140  ! 32: STDFA_I	stda	%f0, [0x0140, %r31]
    set 0x174c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7d2  ! 33: PDIST	pdistn	%d50, %d18, %d40
brcommon3_10_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e000  ! 1: STQF_I	-	%f13, [0x0000, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdbe7e00b  ! 34: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0xdac7e000  ! 35: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
ibp_10_23:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe080  ! 36: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_10_25:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdac04a00  ! 39: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r13
brcommon1_10_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1a0  ! 1: STXFSR_I	st-sfr	%f1, [0x01a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9bb447d2  ! 40: PDIST	pdistn	%d48, %d18, %d44
ibp_10_27:
	nop
	.word 0xd5e7e014  ! 41: CASA_R	casa	[%r31] %asi, %r20, %r10
	.word 0x93a000c6  ! 42: FNEGd	fnegd	%f6, %f40
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
    brnz %r10, cwq_10_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_28
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
cwq_10_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 43: RDPC	rd	%pc, %r19
splash_htba_10_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_30) + 56, 16, 16)) -> intp(3,0,9)
#else
	setx 0x87dad7ae7ed4b758, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d902f5d  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0f5d, %pstate
ibp_10_32:
	nop
	.word 0xe1bfde00  ! 47: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_10_33:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 49: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_10_34:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97a049b1  ! 50: FDIVs	fdivs	%f1, %f17, %f11
	.word 0x8d903b14  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x1b14, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e0d8  ! 53: LDSWA_I	ldswa	[%r31, + 0x00d8] %asi, %r17
	.word 0xe33fe1f2  ! 54: STDF_I	std	%f17, [0x01f2, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_10_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0xef3ae1cebb327972, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_10_38:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 57: CASA_R	casa	[%r31] %asi, %r19, %r17
	.word 0x99524000  ! 58: RDPR_CWP	<illegal instruction>
ibp_10_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 59: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_10_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 60: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
ibp_10_41:
	nop
	.word 0xc1bfdf20  ! 61: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe8dfe038  ! 62: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r20
	.word 0x879ac010  ! 63: WRHPR_HINTP_R	wrhpr	%r11, %r16, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_42) + 8, 16, 16)) -> intp(6,0,21)
#else
	setx 0x44bd6edea7ef93b4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfd920  ! 65: STDFA_R	stda	%f16, [%r0, %r31]
ibp_10_44:
	nop
	.word 0xc1bfe0a0  ! 66: STDFA_I	stda	%f0, [0x00a0, %r31]
ibp_10_45:
	nop
	.word 0xe8bfc034  ! 67: STDA_R	stda	%r20, [%r31 + %r20] 0x01
	.word 0xe927e147  ! 68: STF_I	st	%f20, [0x0147, %r31]
mondo_10_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91000c  ! 69: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
	.word 0xb1840011  ! 70: WR_STICK_REG_R	wr	%r16, %r17, %-
br_badelay3_10_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3144002  ! 1: LDQF_R	-	[%r17, %r2], %f9
	.word 0xa5a2c832  ! 71: FADDs	fadds	%f11, %f18, %f18
fpinit_10_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e833aa  ! 72: PREFETCHA_I	prefetcha	[%r0, + 0xfffff3aa] %asi, #one_read
brcommon2_10_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f802020  ! 1: SIR	sir	0x0020
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe160  ! 73: LDDFA_I	ldda	[%r31, 0x0160], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_50) + 24, 16, 16)) -> intp(3,0,11)
#else
	setx 0x472505639a4e89ca, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_10_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf2ba20af17f37ed7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_10_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e1e0  ! 1: STQF_I	-	%f13, [0x01e0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdbe7e00d  ! 77: CASA_R	casa	[%r31] %asi, %r13, %r13
	.word 0xa9840014  ! 78: WR_SET_SOFTINT_R	wr	%r16, %r20, %set_softint
	.word 0x22ca0001  ! 1: BRZ	brz,a,pt	%r8,<label_0xa0001>
	.word 0x8d903ddb  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1ddb, %pstate
splash_lsu_10_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x8e6e3753, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_55:
	nop
	ta T_CHANGE_HPRIV
	set 0x879b8aac, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_56:
	rd %pc, %r12
	add %r12, (donretarg_10_56-donret_10_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0090d700 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdcf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_56:
	.word 0x95a189d0  ! 82: FDIVd	fdivd	%f6, %f16, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_10_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0x833, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a449b1  ! 84: FDIVs	fdivs	%f17, %f17, %f12
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_59:
	rd %pc, %r12
	add %r12, (donretarg_10_59-donret_10_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0013f200 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9de, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_10_59:
	.word 0xd86fe199  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x0199]
trapasi_10_60:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8c84b60  ! 86: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_10_61:
	nop
	setx 0xfffffb8dfffff4fa, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_10_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf89, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc013  ! 90: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0xd857e0d0  ! 91: LDSH_I	ldsh	[%r31 + 0x00d0], %r12
	.word 0xb1808003  ! 92: WR_STICK_REG_R	wr	%r2, %r3, %-
	.word 0xd89fd060  ! 93: LDDA_R	ldda	[%r31, %r0] 0x83, %r12
splash_hpstate_10_64:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8198258e  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058e, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_10_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x99702130  ! 1: POPC_I	popc	0x0130, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ab4a4b  ! 96: FCMPd	fcmpd	%fcc<n>, %f44, %f42
	.word 0x9f802ecc  ! 97: SIR	sir	0x0ecc
intveclr_10_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5758405d2147a2d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_10_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_10_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe060  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0060]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa5703353  ! 101: POPC_I	popc	0x1353, %r18
intveclr_10_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xde39870377690af4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xcb71a27e5f88e3ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_72:
	rd %pc, %r12
	add %r12, (donretarg_10_72-donret_10_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c6d800 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4ce, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_72:
	.word 0x2ccc0001  ! 104: BRGZ	brgz,a,pt	%r16,<label_0xc0001>
intveclr_10_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf75fe73e8ebe6fc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fdf20  ! 106: LDDFA_R	ldda	[%r31, %r0], %f0
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	fbuge skip_10_76
	bgu  	 skip_10_76
.align 1024
skip_10_76:
	.word 0x93b4c4c2  ! 109: FCMPNE32	fcmpne32	%d50, %d2, %r9
	.word 0xe1bfe0e0  ! 110: STDFA_I	stda	%f16, [0x00e0, %r31]
intveclr_10_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0c0831bd2607eff3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 112: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfe080  ! 113: STDFA_I	stda	%f0, [0x0080, %r31]
unsupttte_10_79:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5a309ab  ! 114: FDIVs	fdivs	%f12, %f11, %f18
tagged_10_80:
	tsubcctv %r8, 0x1b67, %r20
	.word 0xd807e1da  ! 115: LDUW_I	lduw	[%r31 + 0x01da], %r12
	.word 0xa2d4c010  ! 116: UMULcc_R	umulcc 	%r19, %r16, %r17
	setx 0x01b140c85b4058c8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_10_82:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2904b40  ! 118: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r9
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8d902186  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x0186, %pstate
ibp_10_84:
	nop
	.word 0xd3e7e00b  ! 120: CASA_R	casa	[%r31] %asi, %r11, %r9
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
    brnz %r10, sma_10_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e008  ! 121: CASA_R	casa	[%r31] %asi, %r8, %r9
fpinit_10_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82159  ! 122: PREFETCHA_I	prefetcha	[%r0, + 0x0159] %asi, #one_read
	.word 0x9194c00d  ! 123: WRPR_PIL_R	wrpr	%r19, %r13, %pil
intveclr_10_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb350953169e74e60, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d92c013  ! 125: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_90:
	rd %pc, %r12
	add %r12, (donretarg_10_90-donret_10_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cc7800 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c1f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_90:
	.word 0xd26fe138  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x0138]
	.word 0xd2cfe088  ! 127: LDSBA_I	ldsba	[%r31, + 0x0088] %asi, %r9
	.word 0xd23fe14b  ! 128: STD_I	std	%r9, [%r31 + 0x014b]
	.word 0x8d802004  ! 129: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02034  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99520000  ! 131: RDPR_PIL	rdpr	%pil, %r12
mondo_10_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 132: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_92) + 32, 16, 16)) -> intp(0,0,24)
#else
	setx 0x9ac14beb5bbb0541, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 134: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2800ac0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
ibp_10_94:
	nop
	.word 0xe2dfc02c  ! 137: LDXA_R	ldxa	[%r31, %r12] 0x01, %r17
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
    brnz %r10, cwq_10_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_95
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
cwq_10_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 138: RDPC	rd	%pc, %r18
	.word 0x87802058  ! 139: WRASI_I	wr	%r0, 0x0058, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_96) + 48, 16, 16)) -> intp(3,0,26)
#else
	setx 0x6737597ab3198875, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe11fe1f0  ! 141: LDDF_I	ldd	[%r31, 0x01f0], %f16
dvapa_10_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0x929, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93b147d0  ! 142: PDIST	pdistn	%d36, %d16, %d40
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_99:
	rd %pc, %r12
	add %r12, (donretarg_10_99-donret_10_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d2ca00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x131f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2ccc4001  ! 1: BRGZ	brgz,a,pt	%r17,<label_0xc4001>
	done
donretarg_10_99:
	.word 0x2d400001  ! 143: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0xe477e011  ! 144: STX_I	stx	%r18, [%r31 + 0x0011]
	.word 0x8d902dd9  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0dd9, %pstate
	.word 0xe4800b60  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
trapasi_10_101:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 147: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
ibp_10_102:
	nop
	.word 0xe5e7e008  ! 148: CASA_R	casa	[%r31] %asi, %r8, %r18
	setx 0x7bc1380908d2bf74, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 150: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	setx 0x75aa7e18c931222b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_10_106:
	nop
	.word 0xe4bfc02a  ! 152: STDA_R	stda	%r18, [%r31 + %r10] 0x01
trapasi_10_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4d04e40  ! 153: LDSHA_R	ldsha	[%r1, %r0] 0x72, %r18
	.word 0x9f803896  ! 154: SIR	sir	0x1896
splash_cmpr_10_108:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 155: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_10_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa02c27ce71f3f02f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_10_110:
	nop
	.word 0x9b7034aa  ! 157: POPC_I	popc	0x14aa, %r13
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe19fc3e0  ! 159: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80278f  ! 160: SIR	sir	0x078f
splash_hpstate_10_112:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81983947  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1947, %hpstate
	.word 0xe327e00a  ! 162: STF_I	st	%f17, [0x000a, %r31]
	.word 0x91d020b4  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_10_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 164: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
br_badelay2_10_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b4c314  ! 165: ALIGNADDRESS	alignaddr	%r19, %r20, %r9
fpinit_10_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 166: FDIVd	fdivd	%f0, %f4, %f6
    set 0xd23, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b407c6  ! 167: PDIST	pdistn	%d16, %d6, %d42
memptr_10_116:
	set 0x60540000, %r31
	.word 0x85846806  ! 168: WRCCR_I	wr	%r17, 0x0806, %ccr
	.word 0xd4c7e128  ! 169: LDSWA_I	ldswa	[%r31, + 0x0128] %asi, %r10
	setx 0xf7baabc133ece6a4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_118:
	.word 0x8198270d  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070d, %hpstate
mondo_10_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d914003  ! 172: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
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
    brnz %r10, cwq_10_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_120
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
cwq_10_120:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 173: RDPC	rd	%pc, %r16
ibp_10_121:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe000  ! 174: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xd4800a80  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	.word 0x8d802004  ! 176: WRFPRS_I	wr	%r0, 0x0004, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_122) + 56, 16, 16)) -> intp(4,0,5)
#else
	setx 0xcb1252b42983f2a2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xa1808db1c95a3a26, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 179: Tcc_I	te	icc_or_xcc, %r0 + 52
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_124) + 0, 16, 16)) -> intp(6,0,22)
#else
	setx 0x3799c17c252f0ac1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 181: FDIVd	fdivd	%f0, %f4, %f4
splash_tba_10_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_10_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 183: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xd4dfe0a0  ! 184: LDXA_I	ldxa	[%r31, + 0x00a0] %asi, %r10
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
    brnz %r10, cwq_10_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_128
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
cwq_10_128:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 185: RDPC	rd	%pc, %r13
intveclr_10_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7efe2d2839cbd11c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_10_130:
	set 0x60740000, %r31
	.word 0x85847ab0  ! 187: WRCCR_I	wr	%r17, 0x1ab0, %ccr
	.word 0x9194400c  ! 188: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0x91a0016b  ! 189: FABSq	dis not found

	.word 0xe88008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_10_133:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_10_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 194: RDTICK	rd	%tick, %r13
	.word 0x8d802004  ! 195: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97520000  ! 196: RDPR_PIL	<illegal instruction>
	setx 0x7792dd9856150562, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e185  ! 198: STF_I	st	%f11, [0x0185, %r31]
ibp_10_136:
	nop
	.word 0xc19fdf20  ! 199: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_10_137:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd69fc029  ! 200: LDDA_R	ldda	[%r31, %r9] 0x01, %r11
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
    ta T_CHANGE_NONHPRIV 
	setx vahole_target1, %r18, %r27
cwp_8_1:
    set user_data_start, %o7
	.word 0x93902005  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
pmu_8_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff998fffff855, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_8_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a02  ! 4: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa02] %asi, #one_read
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2accc001  ! 1: BRNZ	brnz,a,pt	%r19,<label_0xcc001>
	.word 0x8d90336b  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x136b, %pstate
brcommon1_8_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9d2  ! 1: FDIVd	fdivd	%f62, %f18, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9702a34  ! 7: POPC_I	popc	0x0a34, %r20
	.word 0xe277e089  ! 8: STX_I	stx	%r17, [%r31 + 0x0089]
ibp_8_6:
	nop
	.word 0xe31fc010  ! 9: LDDF_R	ldd	[%r31, %r16], %f17
	.word 0xa9520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d903100  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1100, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa5520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_8_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d928006  ! 15: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
jmptr_8_9:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_10) + 8, 16, 16)) -> intp(1,0,9)
#else
	setx 0xe68b58044cb802e4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_11:
	rd %pc, %r12
	add %r12, (donretarg_8_11-donret_8_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00624300 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1494, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_8_11:
	.word 0xd8ffe1ed  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x01ed] %asi
splash_hpstate_8_12:
	.word 0x8198318d  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x118d, %hpstate
	.word 0xab81c010  ! 20: WR_CLEAR_SOFTINT_R	wr	%r7, %r16, %clear_softint
splash_cmpr_8_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 21: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_8_14:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 22: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e038  ! 23: LDSWA_I	ldswa	[%r31, + 0x0038] %asi, %r12
	.word 0x8d902f46  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x0f46, %pstate
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
    brnz %r10, sma_8_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 25: CASA_R	casa	[%r31] %asi, %r17, %r12
brcommon3_8_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c00c  ! 1: STQF_R	-	%f12, [%r12, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd9e7e00b  ! 26: CASA_R	casa	[%r31] %asi, %r11, %r12
trapasi_8_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8d84e60  ! 27: LDXA_R	ldxa	[%r1, %r0] 0x73, %r12
ceter_8_19:
    nop
    ta T_CHANGE_HPRIV
    mov 5, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 28: RDTICK	rd	%tick, %r17
splash_cmpr_8_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_8_21:
	set user_data_start, %r31
	.word 0x8584ff5a  ! 30: WRCCR_I	wr	%r19, 0x1f5a, %ccr
	.word 0xa8828004  ! 31: ADDcc_R	addcc 	%r10, %r4, %r20
	.word 0xc1bfe100  ! 32: STDFA_I	stda	%f0, [0x0100, %r31]
    set 0x2b73, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b507d1  ! 33: PDIST	pdistn	%d20, %d48, %d18
brcommon3_8_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e070  ! 1: STQF_I	-	%f13, [0x0070, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdabfc030  ! 34: STDA_R	stda	%r13, [%r31 + %r16] 0x01
	.word 0xdac7e068  ! 35: LDSWA_I	ldswa	[%r31, + 0x0068] %asi, %r13
ibp_8_23:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc2c0  ! 36: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_8_25:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 39: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
brcommon1_8_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe090  ! 1: STXFSR_I	st-sfr	%f1, [0x0090, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3e94033  ! 40: PREFETCHA_R	prefetcha	[%r5, %r19] 0x01, #one_read
ibp_8_27:
	nop
	.word 0xd5e7e013  ! 41: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0xa5a000cb  ! 42: FNEGd	fnegd	%f42, %f18
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
    brnz %r10, cwq_8_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_28
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
cwq_8_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 43: RDPC	rd	%pc, %r16
splash_htba_8_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_30) + 56, 16, 16)) -> intp(2,0,25)
#else
	setx 0xad8f320e299c69f2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8d9037cd  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x17cd, %pstate
ibp_8_32:
	nop
	.word 0xe1bfda00  ! 47: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_8_33:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdf20  ! 49: STDFA_R	stda	%f16, [%r0, %r31]
ibp_8_34:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3b4048a  ! 50: FCMPLE32	fcmple32	%d16, %d10, %r17
	.word 0x8d90356f  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x156f, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e1d8  ! 53: LDSWA_I	ldswa	[%r31, + 0x01d8] %asi, %r17
	.word 0xe33fe0b8  ! 54: STDF_I	std	%f17, [0x00b8, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_8_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc844647bc7035871, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_8_38:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc031  ! 57: STDA_R	stda	%r17, [%r31 + %r17] 0x01
	.word 0x9b524000  ! 58: RDPR_CWP	<illegal instruction>
ibp_8_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 59: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_8_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d94800b  ! 60: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
ibp_8_41:
	nop
	.word 0xe1bfc3e0  ! 61: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe8dfe0a8  ! 62: LDXA_I	ldxa	[%r31, + 0x00a8] %asi, %r20
	.word 0x879c0013  ! 63: WRHPR_HINTP_R	wrhpr	%r16, %r19, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_42) + 56, 16, 16)) -> intp(6,0,15)
#else
	setx 0xd61778e2d2b3196b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_8_43:
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
iaw_startwait8_43:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_43
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_43:
    brnz %r16, iaw_wait8_43
    ld [%r23], %r16
    ba iaw_startwait8_43
    mov 0x8, %r16
continue_iaw_8_43:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_43:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_43
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_43:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_43
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_43:
	mov 0x38, %r18
iaw1_8_43:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 65: STDFA_R	stda	%f0, [%r0, %r31]
ibp_8_44:
	nop
	.word 0xe19fe080  ! 66: LDDFA_I	ldda	[%r31, 0x0080], %f16
ibp_8_45:
	nop
	.word 0xe9e7e012  ! 67: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe927e128  ! 68: STF_I	st	%f20, [0x0128, %r31]
mondo_8_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d95000b  ! 69: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0xb1814011  ! 70: WR_STICK_REG_R	wr	%r5, %r17, %-
br_badelay3_8_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb148006  ! 1: LDQF_R	-	[%r18, %r6], %f13
	.word 0xa1a40828  ! 71: FADDs	fadds	%f16, %f8, %f16
fpinit_8_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 72: FDIVs	fdivs	%f0, %f4, %f6
brcommon2_8_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a509c5  ! 1: FDIVd	fdivd	%f20, %f36, %f50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fde00  ! 73: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_50) + 48, 16, 16)) -> intp(5,0,11)
#else
	setx 0xdb1977429d9c040e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_8_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe8fd09096d2b1549, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_8_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e180  ! 1: STQF_I	-	%f13, [0x0180, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdbe7e00c  ! 77: CASA_R	casa	[%r31] %asi, %r12, %r13
	.word 0xa9850014  ! 78: WR_SET_SOFTINT_R	wr	%r20, %r20, %set_softint
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d9035bd  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x15bd, %pstate
splash_lsu_8_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x92715487, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_55:
	nop
	ta T_CHANGE_HPRIV
	set 0x62286079, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_56:
	rd %pc, %r12
	add %r12, (donretarg_8_56-donret_8_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0047b300 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x697, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_56:
	.word 0x95a209c1  ! 82: FDIVd	fdivd	%f8, %f32, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_8_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0x97f, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93a2c9a6  ! 84: FDIVs	fdivs	%f11, %f6, %f9
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_59:
	rd %pc, %r12
	add %r12, (donretarg_8_59-donret_8_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00725e00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_8_59:
	.word 0xd86fe03f  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x003f]
trapasi_8_60:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8884b60  ! 86: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_8_61:
	nop
	setx 0xfffff0e7fffffc1e, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_8_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd8a, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc030  ! 90: LDXA_R	ldxa	[%r31, %r16] 0x01, %r12
	.word 0xd857e0f0  ! 91: LDSH_I	ldsh	[%r31 + 0x00f0], %r12
	.word 0xb184800c  ! 92: WR_STICK_REG_R	wr	%r18, %r12, %-
	.word 0xd89fdc40  ! 93: LDDA_R	ldda	[%r31, %r0] 0xe2, %r12
splash_hpstate_8_64:
	.word 0x2aca0001  ! 1: BRNZ	brnz,a,pt	%r8,<label_0xa0001>
	.word 0x81983ddb  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddb, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_8_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x99702120  ! 1: POPC_I	popc	0x0120, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9b087d2  ! 96: PDIST	pdistn	%d2, %d18, %d20
	.word 0x9f803d8e  ! 97: SIR	sir	0x1d8e
intveclr_8_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x51b342ee2ac69d1a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_8_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_8_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe090  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0090]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1b1c494  ! 101: FCMPLE32	fcmple32	%d38, %d20, %r16
intveclr_8_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1fc277191e9e8aae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xc5c54343af92ad92, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_72:
	rd %pc, %r12
	add %r12, (donretarg_8_72-donret_8_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00edae00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e01, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_72:
	.word 0x2b400001  ! 104: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
intveclr_8_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbcdfe28e86da9abf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
iaw_8_74:
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
iaw_startwait8_74:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_74
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_74:
    brnz %r16, iaw_wait8_74
    ld [%r23], %r16
    ba iaw_startwait8_74
    mov 0x8, %r16
continue_iaw_8_74:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_74:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_74
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_74:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_74
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_74:
	mov 0x38, %r18
iaw1_8_74:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe060  ! 106: LDDFA_I	ldda	[%r31, 0x0060], %f16
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0x24cc4001  ! 109: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	.word 0xc1bfe120  ! 110: STDFA_I	stda	%f0, [0x0120, %r31]
intveclr_8_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0x09b6afa8a88883ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 112: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfe160  ! 113: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0x87ad0a43  ! 114: FCMPd	fcmpd	%fcc<n>, %f20, %f34
tagged_8_80:
	tsubcctv %r20, 0x1d0f, %r11
	.word 0xd807e0ea  ! 115: LDUW_I	lduw	[%r31 + 0x00ea], %r12
	.word 0xa2d1c013  ! 116: UMULcc_R	umulcc 	%r7, %r19, %r17
	setx 0x5d00f114aa8e28ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_8_82:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2d84b40  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r9
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d902f6f  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x0f6f, %pstate
ibp_8_84:
	nop
	.word 0xd33fc00b  ! 120: STDF_R	std	%f9, [%r11, %r31]
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
    brnz %r10, sma_8_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 121: CASA_R	casa	[%r31] %asi, %r18, %r9
fpinit_8_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 122: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x9191400b  ! 123: WRPR_PIL_R	wrpr	%r5, %r11, %pil
intveclr_8_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0x711f48949be4fe64, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 125: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_90:
	rd %pc, %r12
	add %r12, (donretarg_8_90-donret_8_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff1100 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_90:
	.word 0xd26fe030  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x0030]
	.word 0xd2cfe1b0  ! 127: LDSBA_I	ldsba	[%r31, + 0x01b0] %asi, %r9
	.word 0xd23fe14f  ! 128: STD_I	std	%r9, [%r31 + 0x014f]
	.word 0x8d802000  ! 129: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02035  ! 130: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa7520000  ! 131: RDPR_PIL	rdpr	%pil, %r19
mondo_8_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d94c009  ! 132: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_92) + 16, 16, 16)) -> intp(4,0,7)
#else
	setx 0x0d72a8df886c445f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82159  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x0159] %asi, #one_read
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_8_94:
	nop
	.word 0xe2dfc02d  ! 137: LDXA_R	ldxa	[%r31, %r13] 0x01, %r17
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
    brnz %r10, cwq_8_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_95
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
cwq_8_95:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 138: RDPC	rd	%pc, %r8
	.word 0x87802020  ! 139: WRASI_I	wr	%r0, 0x0020, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_96) + 0, 16, 16)) -> intp(2,0,8)
#else
	setx 0x9ed3dddd874756a8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_8_97:
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
iaw_startwait8_97:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_97
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_97:
    brnz %r16, iaw_wait8_97
    ld [%r23], %r16
    ba iaw_startwait8_97
    mov 0x8, %r16
continue_iaw_8_97:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_97:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_97
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_97:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_97
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_97:
	mov 0x38, %r18
iaw1_8_97:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00d  ! 141: CASA_R	casa	[%r31] %asi, %r13, %r16
dvapa_8_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd10, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a409b0  ! 142: FDIVs	fdivs	%f16, %f16, %f12
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_99:
	rd %pc, %r12
	add %r12, (donretarg_8_99-donret_8_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00724500 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7db, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_99:
	.word 0x20800001  ! 143: BN	bn,a	<label_0x1>
	.word 0xe477e1cc  ! 144: STX_I	stx	%r18, [%r31 + 0x01cc]
	.word 0x8d9037f5  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x17f5, %pstate
	.word 0xe48008a0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
trapasi_8_101:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4d044a0  ! 147: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r18
ibp_8_102:
	nop
	.word 0xc32fc014  ! 148: STXFSR_R	st-sfr	%f1, [%r20, %r31]
	setx 0x9e90e39d8034a655, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d934006  ! 150: WRPR_WSTATE_R	wrpr	%r13, %r6, %wstate
	setx 0x315de544b671dca7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_8_106:
	nop
	.word 0xe4dfc032  ! 152: LDXA_R	ldxa	[%r31, %r18] 0x01, %r18
trapasi_8_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4c04e40  ! 153: LDSWA_R	ldswa	[%r1, %r0] 0x72, %r18
	.word 0x9f803aab  ! 154: SIR	sir	0x1aab
splash_cmpr_8_108:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 155: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_8_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe532cc4a8db55574, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_8_110:
	nop
	.word 0xa9b2c7d2  ! 157: PDIST	pdistn	%d42, %d18, %d20
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
iaw_8_111:
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
iaw_startwait8_111:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_111
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_111:
    brnz %r16, iaw_wait8_111
    ld [%r23], %r16
    ba iaw_startwait8_111
    mov 0x8, %r16
continue_iaw_8_111:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_111:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_111
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_111:
	mov 0x38, %r18
iaw4_8_111:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe160  ! 159: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0x9f803795  ! 160: SIR	sir	0x1795
splash_hpstate_8_112:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81983ed9  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed9, %hpstate
	.word 0xe327e181  ! 162: STF_I	st	%f17, [0x0181, %r31]
	.word 0x91d020b5  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_8_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d918006  ! 164: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
br_badelay2_8_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b04303  ! 165: ALIGNADDRESS	alignaddr	%r1, %r3, %r17
fpinit_8_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e826bd  ! 166: PREFETCHA_I	prefetcha	[%r0, + 0x06bd] %asi, #one_read
    set 0x277f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b487c5  ! 167: PDIST	pdistn	%d18, %d36, %d20
memptr_8_116:
	set 0x60340000, %r31
	.word 0x8581e1f9  ! 168: WRCCR_I	wr	%r7, 0x01f9, %ccr
	.word 0xd4c7e0a0  ! 169: LDSWA_I	ldswa	[%r31, + 0x00a0] %asi, %r10
	setx 0x1f4e3c778acb51d5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_118:
	.word 0x8198365f  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x165f, %hpstate
mondo_8_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d920005  ! 172: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
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
    brnz %r10, cwq_8_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_120
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
cwq_8_120:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 173: RDPC	rd	%pc, %r12
ibp_8_121:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 174: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd4800b20  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
	.word 0x8d802004  ! 176: WRFPRS_I	wr	%r0, 0x0004, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_122) + 56, 16, 16)) -> intp(3,0,27)
#else
	setx 0x63baca1c321e9247, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xe71a2c4cdc495d22, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 53
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_124) + 48, 16, 16)) -> intp(5,0,6)
#else
	setx 0x3178a3fc5fabad44, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 181: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_tba_8_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_8_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83c6d  ! 183: PREFETCHA_I	prefetcha	[%r0, + 0xfffffc6d] %asi, #one_read
	.word 0xd4dfe130  ! 184: LDXA_I	ldxa	[%r31, + 0x0130] %asi, %r10
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
    brnz %r10, cwq_8_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_128
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
cwq_8_128:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 185: RDPC	rd	%pc, %r8
intveclr_8_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8a1728efc87d17ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_8_130:
	set 0x60140000, %r31
	.word 0x8582be7a  ! 187: WRCCR_I	wr	%r10, 0x1e7a, %ccr
	.word 0x9192000b  ! 188: WRPR_PIL_R	wrpr	%r8, %r11, %pil
	.word 0xa9a00174  ! 189: FABSq	dis not found

	.word 0xe88008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_8_133:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 192: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_8_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 194: RDTICK	rd	%tick, %r10
	.word 0x8d802004  ! 195: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1520000  ! 196: RDPR_PIL	<illegal instruction>
	setx 0xc96008c420a5937a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e1c0  ! 198: STF_I	st	%f11, [0x01c0, %r31]
ibp_8_136:
	nop
	.word 0xe19fc3e0  ! 199: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_8_137:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd69fc02b  ! 200: LDDA_R	ldda	[%r31, %r11] 0x01, %r11
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
    ta T_CHANGE_NONHPRIV 
vahole_4_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
cwp_4_1:
    set user_data_start, %o7
	.word 0x93902000  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_4_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff208fffff6e5, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_4_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 4: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x8d802000  ! 5: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d9035a6  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x15a6, %pstate
brcommon1_4_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa5b44490  ! 7: FCMPLE32	fcmple32	%d48, %d16, %r18
	.word 0xe277e138  ! 8: STX_I	stx	%r17, [%r31 + 0x0138]
ibp_4_6:
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
ibp_startwait4_6:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_6
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_6:
    brnz %r16, ibp_wait4_6
    ld [%r23], %r16
    ba ibp_startwait4_6
    mov 0x4, %r16
continue_ibp_4_6:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_6:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_6
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_6:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_6
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_6:
    best_set_reg(0x00000040e6c00ff8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe33fc008  ! 9: STDF_R	std	%f17, [%r8, %r31]
	.word 0x97520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x2ecc4001  ! 1: BRGEZ	brgez,a,pt	%r17,<label_0xc4001>
	.word 0x8d9030db  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x10db, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa5520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_4_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d910007  ! 15: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
jmptr_4_9:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_10) + 32, 16, 16)) -> intp(0,0,29)
#else
	setx 0x67a353b02778c353, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_11:
	rd %pc, %r12
	add %r12, (donretarg_4_11-donret_4_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0097ba00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2f5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x2ecc4001  ! 1: BRGEZ	brgez,a,pt	%r17,<label_0xc4001>
	done
donretarg_4_11:
	.word 0xd8ffe1c6  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x01c6] %asi
splash_hpstate_4_12:
	.word 0x819835e7  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15e7, %hpstate
	.word 0xab834003  ! 20: WR_CLEAR_SOFTINT_R	wr	%r13, %r3, %clear_softint
splash_cmpr_4_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 21: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_4_14:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 22: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e008  ! 23: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r12
	.word 0x8d902873  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x0873, %pstate
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
    brnz %r10, sma_4_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 25: CASA_R	casa	[%r31] %asi, %r17, %r12
brcommon3_4_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c009  ! 1: STQF_R	-	%f12, [%r9, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd8bfc033  ! 26: STDA_R	stda	%r12, [%r31 + %r19] 0x01
trapasi_4_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8d04e60  ! 27: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r12
ceter_4_19:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 28: RDTICK	rd	%tick, %r17
splash_cmpr_4_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_4_21:
	set user_data_start, %r31
	.word 0x85827a5e  ! 30: WRCCR_I	wr	%r9, 0x1a5e, %ccr
	.word 0x96830013  ! 31: ADDcc_R	addcc 	%r12, %r19, %r11
	.word 0xc1bfe100  ! 32: STDFA_I	stda	%f0, [0x0100, %r31]
    set 0x3b59, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb507ca  ! 33: PDIST	pdistn	%d20, %d10, %d44
brcommon3_4_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e180  ! 1: STQF_I	-	%f13, [0x0180, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda3fe0c0  ! 34: STD_I	std	%r13, [%r31 + 0x00c0]
	.word 0xdac7e1b0  ! 35: LDSWA_I	ldswa	[%r31, + 0x01b0] %asi, %r13
ibp_4_23:
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
ibp_startwait4_23:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_23
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_23:
    brnz %r16, ibp_wait4_23
    ld [%r23], %r16
    ba ibp_startwait4_23
    mov 0x4, %r16
continue_ibp_4_23:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_23:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_23
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_23:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_23
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_23:
    best_set_reg(0x00000050e3cff8cb,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe1a0  ! 36: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_4_25:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xda904a00  ! 39: LDUHA_R	lduha	[%r1, %r0] 0x50, %r13
brcommon1_4_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe030  ! 1: STXFSR_I	st-sfr	%f1, [0x0030, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95b40493  ! 40: FCMPLE32	fcmple32	%d16, %d50, %r10
ibp_4_27:
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
ibp_startwait4_27:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_27
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_27:
    brnz %r16, ibp_wait4_27
    ld [%r23], %r16
    ba ibp_startwait4_27
    mov 0x4, %r16
continue_ibp_4_27:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_27:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_27
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_27:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_27
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_27:
    best_set_reg(0x00000040ebf8cb0f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd51fe020  ! 41: LDDF_I	ldd	[%r31, 0x0020], %f10
	.word 0xa1a000cd  ! 42: FNEGd	fnegd	%f44, %f16
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
    brnz %r10, cwq_4_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_28
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
cwq_4_28:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 43: RDPC	rd	%pc, %r13
splash_htba_4_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_30) + 48, 16, 16)) -> intp(5,0,28)
#else
	setx 0xed7506f6e94017e3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2ac90001  ! 1: BRNZ	brnz,a,pt	%r4,<label_0x90001>
	.word 0x8d902893  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
ibp_4_32:
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
ibp_startwait4_32:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_32
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_32:
    brnz %r16, ibp_wait4_32
    ld [%r23], %r16
    ba ibp_startwait4_32
    mov 0x4, %r16
continue_ibp_4_32:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_32:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_32
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_32:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_32
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_32:
    best_set_reg(0x00000040b9cb0f5d,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe100  ! 47: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_4_33:
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
ibp_startwait4_33:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_33
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_33:
    brnz %r16, ibp_wait4_33
    ld [%r23], %r16
    ba ibp_startwait4_33
    mov 0x4, %r16
continue_ibp_4_33:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_33:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_33
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_33:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_33
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_33:
    best_set_reg(0x0000004037cf5d18,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc3e0  ! 49: STDFA_R	stda	%f16, [%r0, %r31]
ibp_4_34:
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
ibp_startwait4_34:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_34
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_34:
    brnz %r16, ibp_wait4_34
    ld [%r23], %r16
    ba ibp_startwait4_34
    mov 0x4, %r16
continue_ibp_4_34:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_34:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_34
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_34:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_34
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_34:
    best_set_reg(0x000000409cdd186b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a4c9aa  ! 50: FDIVs	fdivs	%f19, %f10, %f17
	.word 0x8d90388d  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x188d, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e0f8  ! 53: LDSWA_I	ldswa	[%r31, + 0x00f8] %asi, %r17
	.word 0xe33fe19f  ! 54: STDF_I	std	%f17, [0x019f, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_4_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb2b32d701ba35ad7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_4_38:
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
ibp_startwait4_38:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_38
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_38:
    brnz %r16, ibp_wait4_38
    ld [%r23], %r16
    ba ibp_startwait4_38
    mov 0x4, %r16
continue_ibp_4_38:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_38:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_38
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_38:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_38
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_38:
    best_set_reg(0x00000040fcd86b63,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe297c034  ! 57: LDUHA_R	lduha	[%r31, %r20] 0x01, %r17
	.word 0xa1524000  ! 58: RDPR_CWP	<illegal instruction>
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
    best_set_reg(0x00000050e5eb636f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 59: STDFA_R	stda	%f16, [%r0, %r31]
mondo_4_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d950008  ! 60: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
ibp_4_41:
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
ibp_startwait4_41:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_41
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_41:
    brnz %r16, ibp_wait4_41
    ld [%r23], %r16
    ba ibp_startwait4_41
    mov 0x4, %r16
continue_ibp_4_41:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_41:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_41
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_41:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_41
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_41:
    best_set_reg(0x00000040bee36f8c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe120  ! 61: STDFA_I	stda	%f16, [0x0120, %r31]
	.word 0xe8dfe160  ! 62: LDXA_I	ldxa	[%r31, + 0x0160] %asi, %r20
	.word 0x879c4002  ! 63: WRHPR_HINTP_R	wrhpr	%r17, %r2, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_42) + 24, 16, 16)) -> intp(2,0,21)
#else
	setx 0xd0a978ab3e3e8752, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fe020  ! 65: LDDFA_I	ldda	[%r31, 0x0020], %f0
ibp_4_44:
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
ibp_startwait4_44:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_44
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_44:
    brnz %r16, ibp_wait4_44
    ld [%r23], %r16
    ba ibp_startwait4_44
    mov 0x4, %r16
continue_ibp_4_44:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_44:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_44
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_44:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_44
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_44:
    best_set_reg(0x0000004019ef8cf9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe080  ! 66: STDFA_I	stda	%f16, [0x0080, %r31]
ibp_4_45:
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
ibp_startwait4_45:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_45
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_45:
    brnz %r16, ibp_wait4_45
    ld [%r23], %r16
    ba ibp_startwait4_45
    mov 0x4, %r16
continue_ibp_4_45:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_45:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_45
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_45:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_45
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_45:
    best_set_reg(0x000000501cccf95d,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe91fc013  ! 67: LDDF_R	ldd	[%r31, %r19], %f20
	.word 0xe927e0a1  ! 68: STF_I	st	%f20, [0x00a1, %r31]
mondo_4_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 69: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0xb180400c  ! 70: WR_STICK_REG_R	wr	%r1, %r12, %-
br_badelay3_4_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5144009  ! 1: LDQF_R	-	[%r17, %r9], %f10
	.word 0xa5a48834  ! 71: FADDs	fadds	%f18, %f20, %f18
fpinit_4_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 72: FDIVd	fdivd	%f0, %f4, %f6
brcommon2_4_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f802160  ! 1: SIR	sir	0x0160
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0a0  ! 73: STDFA_I	stda	%f16, [0x00a0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_50) + 48, 16, 16)) -> intp(6,0,13)
#else
	setx 0xbba76acc00d7777c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_4_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0x91b4cd2eb60eedb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_4_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e180  ! 1: STQF_I	-	%f13, [0x0180, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fc008  ! 77: LDDF_R	ldd	[%r31, %r8], %f13
	.word 0xa9844004  ! 78: WR_SET_SOFTINT_R	wr	%r17, %r4, %set_softint
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903aff  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1aff, %pstate
splash_lsu_4_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x9bbbe18c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_55:
	nop
	ta T_CHANGE_HPRIV
	set 0x5a7ae6fb, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_56:
	rd %pc, %r12
	add %r12, (donretarg_4_56-donret_4_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00774700 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfdf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_56:
	.word 0xa9a049ca  ! 82: FDIVd	fdivd	%f32, %f10, %f20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_4_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0x835, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7702340  ! 84: POPC_I	popc	0x0340, %r19
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_59:
	rd %pc, %r12
	add %r12, (donretarg_4_59-donret_4_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c51600 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f5e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_59:
	.word 0xd86fe0a0  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x00a0]
trapasi_4_60:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d04b60  ! 86: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_4_61:
	nop
	setx 0xfffff90dfffffd07, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_4_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbe6, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8bfc030  ! 90: STDA_R	stda	%r12, [%r31 + %r16] 0x01
	.word 0xd857e1e0  ! 91: LDSH_I	ldsh	[%r31 + 0x01e0], %r12
	.word 0xb185000a  ! 92: WR_STICK_REG_R	wr	%r20, %r10, %-
	.word 0xd89fc2e0  ! 93: LDDA_R	ldda	[%r31, %r0] 0x17, %r12
splash_hpstate_4_64:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8198390f  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x190f, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_4_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x99702180  ! 1: POPC_I	popc	0x0180, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87aa8a54  ! 96: FCMPd	fcmpd	%fcc<n>, %f10, %f20
	.word 0xc36fe050  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0050], #one_read
	.word 0x9f802ef6  ! 97: SIR	sir	0x0ef6
intveclr_4_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe68b803b3d8d19c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_4_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_4_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe130  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0130]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99a509d3  ! 101: FDIVd	fdivd	%f20, %f50, %f12
intveclr_4_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe71b4f3ce12cab86, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x92d694d4d7feef02, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_72:
	rd %pc, %r12
	add %r12, (donretarg_4_72-donret_4_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00668000 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dd3, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_72:
	.word 0x2aca8001  ! 104: BRNZ	brnz,a,pt	%r10,<label_0xa8001>
intveclr_4_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb67e438c78a33ae4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe160  ! 106: STDFA_I	stda	%f0, [0x0160, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	bn  	 skip_4_76
	fbo,a,pn	%fcc0,  skip_4_76
.align 1024
skip_4_76:
	.word 0xc36c2159  ! 109: PREFETCH_I	prefetch	[%r16 + 0x0159], #one_read
	.word 0xc1bfe1e0  ! 110: STDFA_I	stda	%f0, [0x01e0, %r31]
intveclr_4_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcffc79ee40569801, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 112: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfe0c0  ! 113: STDFA_I	stda	%f0, [0x00c0, %r31]
unsupttte_4_79:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3b5048d  ! 114: FCMPLE32	fcmple32	%d20, %d44, %r17
tagged_4_80:
	tsubcctv %r4, 0x149a, %r13
	.word 0xd807e0bd  ! 115: LDUW_I	lduw	[%r31 + 0x00bd], %r12
	.word 0x98d48005  ! 116: UMULcc_R	umulcc 	%r18, %r5, %r12
	setx 0x8c9fd033300b51db, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_4_82:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2c84b40  ! 118: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r9
	.word 0x2cc94001  ! 1: BRGZ	brgz,a,pt	%r5,<label_0x94001>
	.word 0x8d903beb  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x1beb, %pstate
ibp_4_84:
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
ibp_startwait4_84:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_84
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_84:
    brnz %r16, ibp_wait4_84
    ld [%r23], %r16
    ba ibp_startwait4_84
    mov 0x4, %r16
continue_ibp_4_84:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_84:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_84
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_84:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_84
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_84:
    best_set_reg(0x00000040aaf95d17,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd2bfc02c  ! 120: STDA_R	stda	%r9, [%r31 + %r12] 0x01
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
    brnz %r10, sma_4_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 121: CASA_R	casa	[%r31] %asi, %r20, %r9
fpinit_4_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 122: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x9194000b  ! 123: WRPR_PIL_R	wrpr	%r16, %r11, %pil
intveclr_4_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0x590159928e63c775, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d944009  ! 125: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_90:
	rd %pc, %r12
	add %r12, (donretarg_4_90-donret_4_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d5e800 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1699, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_90:
	.word 0xd26fe099  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x0099]
	.word 0xd2cfe1a0  ! 127: LDSBA_I	ldsba	[%r31, + 0x01a0] %asi, %r9
	.word 0xd23fe02b  ! 128: STD_I	std	%r9, [%r31 + 0x002b]
	.word 0x8d802004  ! 129: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02032  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa5520000  ! 131: RDPR_PIL	<illegal instruction>
mondo_4_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c007  ! 132: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_92) + 56, 16, 16)) -> intp(0,0,20)
#else
	setx 0xc5176cc6758ad3b5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 134: FDIVd	fdivd	%f0, %f4, %f6
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_4_94:
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
ibp_startwait4_94:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_94
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_94:
    brnz %r16, ibp_wait4_94
    ld [%r23], %r16
    ba ibp_startwait4_94
    mov 0x4, %r16
continue_ibp_4_94:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_94:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_94
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_94:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_94
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_94:
    best_set_reg(0x000000403ddd1771,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9f8021e0  ! 137: SIR	sir	0x01e0
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
    brnz %r10, cwq_4_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_95
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
cwq_4_95:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 138: RDPC	rd	%pc, %r11
	.word 0x87802004  ! 139: WRASI_I	wr	%r0, 0x0004, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_96) + 32, 16, 16)) -> intp(3,0,20)
#else
	setx 0x47e0e0f119c5747b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe11fc014  ! 141: LDDF_R	ldd	[%r31, %r20], %f16
dvapa_4_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf04, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95a409d2  ! 142: FDIVd	fdivd	%f16, %f18, %f10
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_99:
	rd %pc, %r12
	add %r12, (donretarg_4_99-donret_4_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00534100 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x455, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_99:
	.word 0x39400001  ! 143: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe477e189  ! 144: STX_I	stx	%r18, [%r31 + 0x0189]
	.word 0x8d902ecd  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	.word 0xe48008a0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
trapasi_4_101:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c044a0  ! 147: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r18
ibp_4_102:
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
ibp_startwait4_102:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_102
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_102:
    brnz %r16, ibp_wait4_102
    ld [%r23], %r16
    ba ibp_startwait4_102
    mov 0x4, %r16
continue_ibp_4_102:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_102:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_102
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_102:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_102
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_102:
    best_set_reg(0x0000004096d7716c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe53fc012  ! 148: STDF_R	std	%f18, [%r18, %r31]
	setx 0x0de0e0928b047e0e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92c00c  ! 150: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
	setx 0x1ca7f817b2317c90, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_4_106:
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
ibp_startwait4_106:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_106
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_106:
    brnz %r16, ibp_wait4_106
    ld [%r23], %r16
    ba ibp_startwait4_106
    mov 0x4, %r16
continue_ibp_4_106:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_106:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_106
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_106:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_106
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_106:
    best_set_reg(0x00000040cff16c91,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9f802000  ! 152: SIR	sir	0x0000
trapasi_4_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4c84e40  ! 153: LDSBA_R	ldsba	[%r1, %r0] 0x72, %r18
	.word 0xe43fc010  ! 1: STD_R	std	%r18, [%r31 + %r16]
	.word 0x9f802240  ! 154: SIR	sir	0x0240
splash_cmpr_4_108:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 155: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_4_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc59d562d5c48342f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_4_110:
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
ibp_startwait4_110:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_110
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_110:
    brnz %r16, ibp_wait4_110
    ld [%r23], %r16
    ba ibp_startwait4_110
    mov 0x4, %r16
continue_ibp_4_110:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_110:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_110
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_110:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_110
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_110:
    best_set_reg(0x00000040e5ec9107,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa9a4c9a2  ! 157: FDIVs	fdivs	%f19, %f2, %f20
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc19fe140  ! 159: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xa3702140  ! 1: POPC_I	popc	0x0140, %r17
	.word 0x9f802d6e  ! 160: SIR	sir	0x0d6e
splash_hpstate_4_112:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x819829d1  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0xe327e18c  ! 162: STF_I	st	%f17, [0x018c, %r31]
	.word 0x93d02033  ! 163: Tcc_I	tne	icc_or_xcc, %r0 + 51
mondo_4_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d924004  ! 164: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
br_badelay2_4_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b14310  ! 165: ALIGNADDRESS	alignaddr	%r5, %r16, %r9
fpinit_4_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e826bd  ! 166: PREFETCHA_I	prefetcha	[%r0, + 0x06bd] %asi, #one_read
    set 0x2973, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b407cd  ! 167: PDIST	pdistn	%d16, %d44, %d16
memptr_4_116:
	set 0x60740000, %r31
	.word 0x8584b6ed  ! 168: WRCCR_I	wr	%r18, 0x16ed, %ccr
	.word 0xd4c7e1a8  ! 169: LDSWA_I	ldswa	[%r31, + 0x01a8] %asi, %r10
	setx 0x5b5e86ca903bd7bd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_118:
	.word 0x81982a1a  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1a, %hpstate
mondo_4_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 172: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
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
    brnz %r10, cwq_4_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_120
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
cwq_4_120:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 173: RDPC	rd	%pc, %r9
ibp_4_121:
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
ibp_startwait4_121:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_121
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_121:
    brnz %r16, ibp_wait4_121
    ld [%r23], %r16
    ba ibp_startwait4_121
    mov 0x4, %r16
continue_ibp_4_121:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_121:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_121
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_121:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_121
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_121:
    best_set_reg(0x00000050ebd1076f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdf20  ! 174: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd48008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 176: WRFPRS_I	wr	%r0, 0x0000, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_122) + 24, 16, 16)) -> intp(6,0,21)
#else
	setx 0x6df48179af66c99c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x3cd433deb98b3ae9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 179: Tcc_I	te	icc_or_xcc, %r0 + 51
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_124) + 16, 16, 16)) -> intp(1,0,25)
#else
	setx 0x5da70636cfb0813a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 181: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_tba_4_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_4_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 183: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xd4dfe150  ! 184: LDXA_I	ldxa	[%r31, + 0x0150] %asi, %r10
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
    brnz %r10, cwq_4_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_128
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
cwq_4_128:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 185: RDPC	rd	%pc, %r12
intveclr_4_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x990f801b5f6c9196, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_130:
	set 0x60740000, %r31
	.word 0x8582397e  ! 187: WRCCR_I	wr	%r8, 0x197e, %ccr
	.word 0x9194000c  ! 188: WRPR_PIL_R	wrpr	%r16, %r12, %pil
	.word 0x99a00170  ! 189: FABSq	dis not found

	.word 0xe8800b60  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_4_133:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 192: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_4_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 194: RDTICK	rd	%tick, %r18
	.word 0x8d802000  ! 195: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93520000  ! 196: RDPR_PIL	<illegal instruction>
	setx 0x31734a548f0a9534, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e1e8  ! 198: STF_I	st	%f11, [0x01e8, %r31]
ibp_4_136:
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
ibp_startwait4_136:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_136
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_136:
    brnz %r16, ibp_wait4_136
    ld [%r23], %r16
    ba ibp_startwait4_136
    mov 0x4, %r16
continue_ibp_4_136:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_136:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_136
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_136:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_136
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_136:
    best_set_reg(0x00000040e1c76fec,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fdb60  ! 199: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_4_137:
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
ibp_startwait4_137:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_137
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_137:
    brnz %r16, ibp_wait4_137
    ld [%r23], %r16
    ba ibp_startwait4_137
    mov 0x4, %r16
continue_ibp_4_137:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_137:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_137
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_137:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_137
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_137:
    best_set_reg(0x0000004088efecf4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd6bfc032  ! 200: STDA_R	stda	%r11, [%r31 + %r18] 0x01
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
    ta T_CHANGE_NONHPRIV 
vahole_2_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
cwp_2_1:
    set user_data_start, %o7
	.word 0x93902003  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
pmu_2_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0c4fffff39c, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_2_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 4: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d9023f9  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x03f9, %pstate
brcommon1_2_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9c9  ! 1: FDIVd	fdivd	%f62, %f40, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa3b4c7c1  ! 7: PDIST	pdistn	%d50, %d32, %d48
	.word 0xe277e0b2  ! 8: STX_I	stx	%r17, [%r31 + 0x00b2]
ibp_2_6:
	nop
	.word 0xe33fc00d  ! 9: STDF_R	std	%f17, [%r13, %r31]
	.word 0xa3520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x26cc8001  ! 1: BRLZ	brlz,a,pt	%r18,<label_0xc8001>
	.word 0x8d903047  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x1047, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa5520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_2_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d91c013  ! 15: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
jmptr_2_9:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_10) + 48, 16, 16)) -> intp(7,0,7)
#else
	setx 0x55012eb10ac6e415, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_11:
	rd %pc, %r12
	add %r12, (donretarg_2_11-donret_2_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00507300 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x148e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x22cb0001  ! 1: BRZ	brz,a,pt	%r12,<label_0xb0001>
	done
donretarg_2_11:
	.word 0xd8ffe1f7  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x01f7] %asi
splash_hpstate_2_12:
	.word 0x819827d5  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d5, %hpstate
	.word 0xab85000a  ! 20: WR_CLEAR_SOFTINT_R	wr	%r20, %r10, %clear_softint
splash_cmpr_2_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 21: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_2_14:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c04980  ! 22: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e1c8  ! 23: LDSWA_I	ldswa	[%r31, + 0x01c8] %asi, %r12
	.word 0x8d90295f  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x095f, %pstate
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
    brnz %r10, sma_2_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 25: CASA_R	casa	[%r31] %asi, %r9, %r12
brcommon3_2_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c011  ! 1: STQF_R	-	%f12, [%r17, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd9e7e008  ! 26: CASA_R	casa	[%r31] %asi, %r8, %r12
trapasi_2_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8c04e60  ! 27: LDSWA_R	ldswa	[%r1, %r0] 0x73, %r12
ceter_2_19:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 28: RDTICK	rd	%tick, %r12
splash_cmpr_2_20:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_2_21:
	set user_data_start, %r31
	.word 0x8584a881  ! 30: WRCCR_I	wr	%r18, 0x0881, %ccr
	.word 0xa8840013  ! 31: ADDcc_R	addcc 	%r16, %r19, %r20
	.word 0xc1bfe0c0  ! 32: STDFA_I	stda	%f0, [0x00c0, %r31]
    set 0x35ea, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b4c7d2  ! 33: PDIST	pdistn	%d50, %d18, %d20
brcommon3_2_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e000  ! 1: STQF_I	-	%f13, [0x0000, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdabfc030  ! 34: STDA_R	stda	%r13, [%r31 + %r16] 0x01
	.word 0xdac7e058  ! 35: LDSWA_I	ldswa	[%r31, + 0x0058] %asi, %r13
ibp_2_23:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdb60  ! 36: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_2_25:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xda904a00  ! 39: LDUHA_R	lduha	[%r1, %r0] 0x50, %r13
brcommon1_2_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe050  ! 1: STXFSR_I	st-sfr	%f1, [0x0050, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803fe7  ! 40: SIR	sir	0x1fe7
ibp_2_27:
	nop
	.word 0xd4bfc031  ! 41: STDA_R	stda	%r10, [%r31 + %r17] 0x01
	.word 0xa3a000c5  ! 42: FNEGd	fnegd	%f36, %f48
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
    brnz %r10, cwq_2_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_28
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
cwq_2_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 43: RDPC	rd	%pc, %r19
splash_htba_2_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_30) + 56, 16, 16)) -> intp(3,0,3)
#else
	setx 0x6559ae0f558bd8ba, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033da  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x13da, %pstate
ibp_2_32:
	nop
	.word 0xc1bfe180  ! 47: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_2_33:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe040  ! 49: LDDFA_I	ldda	[%r31, 0x0040], %f0
ibp_2_34:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0027  ! 50: PREFETCHA_R	prefetcha	[%r16, %r7] 0x01, #one_read
	.word 0x8d902233  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x0233, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e158  ! 53: LDSWA_I	ldswa	[%r31, + 0x0158] %asi, %r17
	.word 0xe33fe040  ! 54: STDF_I	std	%f17, [0x0040, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_2_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3595489620399264, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_2_38:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc034  ! 57: STDA_R	stda	%r17, [%r31 + %r20] 0x01
	.word 0xa7524000  ! 58: RDPR_CWP	<illegal instruction>
ibp_2_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 59: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_2_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94800d  ! 60: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
ibp_2_41:
	nop
	.word 0xe1bfc3e0  ! 61: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe8dfe098  ! 62: LDXA_I	ldxa	[%r31, + 0x0098] %asi, %r20
	.word 0x879c000b  ! 63: WRHPR_HINTP_R	wrhpr	%r16, %r11, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_42) + 0, 16, 16)) -> intp(6,0,25)
#else
	setx 0x4a57496b1aaeacdd, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fdc00  ! 65: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_2_44:
	nop
	.word 0xc19fc3e0  ! 66: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_2_45:
	nop
	.word 0x9f802000  ! 67: SIR	sir	0x0000
	.word 0xe927e168  ! 68: STF_I	st	%f20, [0x0168, %r31]
mondo_2_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d944006  ! 69: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xb1848012  ! 70: WR_STICK_REG_R	wr	%r18, %r18, %-
br_badelay3_2_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9130005  ! 1: LDQF_R	-	[%r12, %r5], %f20
	.word 0xa5a1c829  ! 71: FADDs	fadds	%f7, %f9, %f18
fpinit_2_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 72: FDIVd	fdivd	%f0, %f4, %f8
brcommon2_2_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9ba209d4  ! 1: FDIVd	fdivd	%f8, %f20, %f44
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe020  ! 73: LDDFA_I	ldda	[%r31, 0x0020], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_50) + 40, 16, 16)) -> intp(5,0,19)
#else
	setx 0x5bcdfcbe4e205238, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_2_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6337573ca204b294, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_2_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e120  ! 1: STQF_I	-	%f13, [0x0120, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb3fc012  ! 77: STDF_R	std	%f13, [%r18, %r31]
	.word 0xa9848009  ! 78: WR_SET_SOFTINT_R	wr	%r18, %r9, %set_softint
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8d903685  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1685, %pstate
splash_lsu_2_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x76130692, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_55:
	nop
	ta T_CHANGE_HPRIV
	set 0x935f10e9, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_56:
	rd %pc, %r12
	add %r12, (donretarg_2_56-donret_2_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e8000 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x141d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_56:
	.word 0xa7a409d0  ! 82: FDIVd	fdivd	%f16, %f16, %f50
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_2_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9b8, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ed0025  ! 84: PREFETCHA_R	prefetcha	[%r20, %r5] 0x01, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_59:
	rd %pc, %r12
	add %r12, (donretarg_2_59-donret_2_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00844200 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe96, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_2_59:
	.word 0xd86fe0df  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x00df]
trapasi_2_60:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8904b60  ! 86: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_2_61:
	nop
	setx 0xfffff1a9fffff687, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_2_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0x887, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8bfc031  ! 90: STDA_R	stda	%r12, [%r31 + %r17] 0x01
	.word 0xd857e110  ! 91: LDSH_I	ldsh	[%r31 + 0x0110], %r12
	.word 0xb1840010  ! 92: WR_STICK_REG_R	wr	%r16, %r16, %-
	.word 0xd89fc2e0  ! 93: LDDA_R	ldda	[%r31, %r0] 0x17, %r12
splash_hpstate_2_64:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81982dc7  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_2_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x99702030  ! 1: POPC_I	popc	0x0030, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91a309d3  ! 96: FDIVd	fdivd	%f12, %f50, %f8
	.word 0xc32fc011  ! 1: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0x9f803bb8  ! 97: SIR	sir	0x1bb8
intveclr_2_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd010af0839c90982, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_2_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_2_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe0b0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x00b0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9ba2c9d1  ! 101: FDIVd	fdivd	%f42, %f48, %f44
intveclr_2_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0c1e4d1859ebde8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x39e957db24ef05f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_72:
	rd %pc, %r12
	add %r12, (donretarg_2_72-donret_2_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0008d300 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d5f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x26cc4001  ! 1: BRLZ	brlz,a,pt	%r17,<label_0xc4001>
	retry
donretarg_2_72:
	.word 0x2ecb4001  ! 104: BRGEZ	brgez,a,pt	%r13,<label_0xb4001>
intveclr_2_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe97fce01f7cce4a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe1a0  ! 106: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	fblg,a,pn	%fcc0,  skip_2_76
	fbul,a,pn	%fcc0,  skip_2_76
.align 1024
skip_2_76:
	.word 0x87aa0a44  ! 109: FCMPd	fcmpd	%fcc<n>, %f8, %f4
	.word 0xc1bfe1c0  ! 110: STDFA_I	stda	%f0, [0x01c0, %r31]
intveclr_2_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc8f8240a0d1d7aa6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 112: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfe140  ! 113: STDFA_I	stda	%f16, [0x0140, %r31]
unsupttte_2_79:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a1c9c5  ! 114: FDIVd	fdivd	%f38, %f36, %f20
tagged_2_80:
	tsubcctv %r8, 0x1831, %r16
	.word 0xd807e1f8  ! 115: LDUW_I	lduw	[%r31 + 0x01f8], %r12
	.word 0xa2d28006  ! 116: UMULcc_R	umulcc 	%r10, %r6, %r17
	setx 0x464e9835dcc0a3f7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_2_82:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2884b40  ! 118: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r9
	.word 0x2ecb0001  ! 1: BRGEZ	brgez,a,pt	%r12,<label_0xb0001>
	.word 0x8d903dfd  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x1dfd, %pstate
ibp_2_84:
	nop
	.word 0xd31fe110  ! 120: LDDF_I	ldd	[%r31, 0x0110], %f9
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
    brnz %r10, sma_2_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 121: CASA_R	casa	[%r31] %asi, %r20, %r9
fpinit_2_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 122: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x91944011  ! 123: WRPR_PIL_R	wrpr	%r17, %r17, %pil
intveclr_2_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0x68d80f1b7b7ee90e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d910011  ! 125: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_90:
	rd %pc, %r12
	add %r12, (donretarg_2_90-donret_2_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fc9900 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x70f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_90:
	.word 0xd26fe0de  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x00de]
	.word 0xd2cfe0c8  ! 127: LDSBA_I	ldsba	[%r31, + 0x00c8] %asi, %r9
	.word 0xd23fe048  ! 128: STD_I	std	%r9, [%r31 + 0x0048]
	.word 0x8d802004  ! 129: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d020b5  ! 130: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xa1520000  ! 131: RDPR_PIL	<illegal instruction>
mondo_2_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d94c012  ! 132: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_92) + 24, 16, 16)) -> intp(5,0,27)
#else
	setx 0x67a85c78d094c757, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82159  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x0159] %asi, #one_read
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 135: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe2800b20  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r17
ibp_2_94:
	nop
	.word 0xe29fc02d  ! 137: LDDA_R	ldda	[%r31, %r13] 0x01, %r17
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
    brnz %r10, cwq_2_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_95
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
cwq_2_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 138: RDPC	rd	%pc, %r16
	.word 0x87802089  ! 139: WRASI_I	wr	%r0, 0x0089, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_96) + 24, 16, 16)) -> intp(3,0,30)
#else
	setx 0x19f94b4b72d3e23f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc00a  ! 141: STXFSR_R	st-sfr	%f1, [%r10, %r31]
dvapa_2_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xecd, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3b4c7c2  ! 142: PDIST	pdistn	%d50, %d2, %d48
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_99:
	rd %pc, %r12
	add %r12, (donretarg_2_99-donret_2_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b33800 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x585, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_99:
	.word 0x3c800001  ! 143: BPOS	bpos,a	<label_0x1>
	.word 0xe477e078  ! 144: STX_I	stx	%r18, [%r31 + 0x0078]
	.word 0x8d9032f3  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x12f3, %pstate
	.word 0xe4800ac0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
trapasi_2_101:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 147: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
ibp_2_102:
	nop
	.word 0xe5e7e012  ! 148: CASA_R	casa	[%r31] %asi, %r18, %r18
	setx 0x5cda1bbd3b57ad14, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d944005  ! 150: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	setx 0xd777e236db34a7ce, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_2_106:
	nop
	.word 0xe43fe140  ! 152: STD_I	std	%r18, [%r31 + 0x0140]
trapasi_2_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4d84e40  ! 153: LDXA_R	ldxa	[%r1, %r0] 0x72, %r18
	.word 0xe43fc008  ! 1: STD_R	std	%r18, [%r31 + %r8]
	.word 0x9f802529  ! 154: SIR	sir	0x0529
splash_cmpr_2_108:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 155: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_2_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf18a55ba689c2868, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_2_110:
	nop
	.word 0xa770370b  ! 157: POPC_I	popc	0x170b, %r19
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xc1bfe160  ! 159: STDFA_I	stda	%f0, [0x0160, %r31]
	.word 0xa3a7c9cc  ! 1: FDIVd	fdivd	%f62, %f12, %f48
	.word 0x9f8029ad  ! 160: SIR	sir	0x09ad
splash_hpstate_2_112:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81983e5c  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5c, %hpstate
	.word 0xe327e038  ! 162: STF_I	st	%f17, [0x0038, %r31]
	.word 0x83d020b3  ! 163: Tcc_I	te	icc_or_xcc, %r0 + 179
mondo_2_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d91000a  ! 164: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
br_badelay2_2_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b28313  ! 165: ALIGNADDRESS	alignaddr	%r10, %r19, %r9
fpinit_2_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 166: FDIVs	fdivs	%f0, %f4, %f4
    set 0x3065, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b407d1  ! 167: PDIST	pdistn	%d16, %d48, %d16
memptr_2_116:
	set 0x60140000, %r31
	.word 0x8584a487  ! 168: WRCCR_I	wr	%r18, 0x0487, %ccr
	.word 0xd4c7e088  ! 169: LDSWA_I	ldswa	[%r31, + 0x0088] %asi, %r10
	setx 0x5b0f20d5337fcfc0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_118:
	.word 0x81983f97  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f97, %hpstate
mondo_2_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 172: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
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
    brnz %r10, cwq_2_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_120
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
cwq_2_120:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 173: RDPC	rd	%pc, %r19
ibp_2_121:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe0c0  ! 174: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	.word 0xd48008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802004  ! 176: WRFPRS_I	wr	%r0, 0x0004, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_122) + 56, 16, 16)) -> intp(1,0,30)
#else
	setx 0x2290d8918b4afa58, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x8e31e241c694c150, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 179: Tcc_I	tne	icc_or_xcc, %r0 + 53
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_124) + 24, 16, 16)) -> intp(2,0,3)
#else
	setx 0x73c2e62c9e9da718, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 181: FDIVs	fdivs	%f0, %f4, %f8
splash_tba_2_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_2_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 183: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xd4dfe020  ! 184: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
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
    brnz %r10, cwq_2_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_128
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
cwq_2_128:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 185: RDPC	rd	%pc, %r13
intveclr_2_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x51c20524236f8f1a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_130:
	set 0x60340000, %r31
	.word 0x85852d44  ! 187: WRCCR_I	wr	%r20, 0x0d44, %ccr
	.word 0x9194400c  ! 188: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0x91a0016b  ! 189: FABSq	dis not found

	.word 0xe88008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_2_133:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_2_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 194: RDTICK	rd	%tick, %r10
	.word 0x8d802004  ! 195: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91520000  ! 196: RDPR_PIL	<illegal instruction>
	setx 0xb8e58423fb7b6af3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e1b4  ! 198: STF_I	st	%f11, [0x01b4, %r31]
ibp_2_136:
	nop
	.word 0xe1bfdc00  ! 199: STDFA_R	stda	%f16, [%r0, %r31]
ibp_2_137:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd73fc00c  ! 200: STDF_R	std	%f11, [%r12, %r31]
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
	nop
	nop
	ta T_CHANGE_PRIV
	wrpr %g0, %g0, %gl
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
    ta T_CHANGE_NONHPRIV 
	setx vahole_target1, %r18, %r27
cwp_1_1:
    set user_data_start, %o7
	.word 0x93902000  ! 1: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_1_2:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb20fffff5f5, %g1, %g7
	.word 0xa3800007  ! 2: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd337c000  ! 3: STQF_R	-	%f9, [%r0, %r31]
fpinit_1_3:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 4: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d903b51  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1b51, %pstate
brcommon1_1_5:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x93a7c9d2  ! 1: FDIVd	fdivd	%f62, %f18, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ec0022  ! 7: PREFETCHA_R	prefetcha	[%r16, %r2] 0x01, #one_read
	.word 0xe277e0b2  ! 8: STX_I	stx	%r17, [%r31 + 0x00b2]
ibp_1_6:
	nop
	.word 0xe2dfc02a  ! 9: LDXA_R	ldxa	[%r31, %r10] 0x01, %r17
	.word 0xa5520000  ! 10: RDPR_PIL	<illegal instruction>
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d902eeb  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x0eeb, %pstate
	.word 0xe537c000  ! 12: STQF_R	-	%f18, [%r0, %r31]
	.word 0xe48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99520000  ! 14: RDPR_PIL	<illegal instruction>
mondo_1_8:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d91000d  ! 15: WRPR_WSTATE_R	wrpr	%r4, %r13, %wstate
jmptr_1_9:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_10) + 24, 16, 16)) -> intp(5,0,28)
#else
	setx 0x6c068b38f1aa8590, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_10:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_11:
	rd %pc, %r12
	add %r12, (donretarg_1_11-donret_1_11+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001f7300 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10cd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_1_11:
	.word 0xd8ffe138  ! 18: SWAPA_I	swapa	%r12, [%r31 + 0x0138] %asi
splash_hpstate_1_12:
	.word 0x81983c4d  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4d, %hpstate
	.word 0xab804014  ! 20: WR_CLEAR_SOFTINT_R	wr	%r1, %r20, %clear_softint
splash_cmpr_1_13:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 21: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
trapasi_1_14:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 22: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
	.word 0xd8c7e0b8  ! 23: LDSWA_I	ldswa	[%r31, + 0x00b8] %asi, %r12
	.word 0x8d9033d1  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x13d1, %pstate
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
    brnz %r10, sma_1_16
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_16:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 25: CASA_R	casa	[%r31] %asi, %r13, %r12
brcommon3_1_17:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c00c  ! 1: STQF_R	-	%f12, [%r12, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc009  ! 26: STXFSR_R	st-sfr	%f1, [%r9, %r31]
trapasi_1_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd8c04e60  ! 27: LDSWA_R	ldswa	[%r1, %r0] 0x73, %r12
ceter_1_19:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 28: RDTICK	rd	%tick, %r18
splash_cmpr_1_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
memptr_1_21:
	set user_data_start, %r31
	.word 0x85827d27  ! 30: WRCCR_I	wr	%r9, 0x1d27, %ccr
	.word 0x9284c014  ! 31: ADDcc_R	addcc 	%r19, %r20, %r9
	.word 0xe1bfe0c0  ! 32: STDFA_I	stda	%f16, [0x00c0, %r31]
    set 0x2201, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb447d0  ! 33: PDIST	pdistn	%d48, %d16, %d44
brcommon3_1_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e090  ! 1: STQF_I	-	%f13, [0x0090, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdadfc032  ! 34: LDXA_R	ldxa	[%r31, %r18] 0x01, %r13
	.word 0xdac7e180  ! 35: LDSWA_I	ldswa	[%r31, + 0x0180] %asi, %r13
ibp_1_23:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 36: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_24:
	ta	T_CHANGE_NONPRIV	! macro
trapasi_1_25:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xda884a00  ! 39: LDUBA_R	lduba	[%r1, %r0] 0x50, %r13
brcommon1_1_26:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe140  ! 1: STXFSR_I	st-sfr	%f1, [0x0140, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a489a4  ! 40: FDIVs	fdivs	%f18, %f4, %f10
ibp_1_27:
	nop
	.word 0x9f802030  ! 41: SIR	sir	0x0030
	.word 0xa5a000cb  ! 42: FNEGd	fnegd	%f42, %f18
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
    brnz %r10, cwq_1_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_28
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
cwq_1_28:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 43: RDPC	rd	%pc, %r18
splash_htba_1_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 44: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_30) + 0, 16, 16)) -> intp(6,0,9)
#else
	setx 0xdd63da56aecfd94f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_30:
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2ecc0001  ! 1: BRGEZ	brgez,a,pt	%r16,<label_0xc0001>
	.word 0x8d903a51  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x1a51, %pstate
ibp_1_32:
	nop
	.word 0xe1bfe000  ! 47: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xe537c000  ! 48: STQF_R	-	%f18, [%r0, %r31]
ibp_1_33:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc2c0  ! 49: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_1_34:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87aaca44  ! 50: FCMPd	fcmpd	%fcc<n>, %f42, %f4
	.word 0x8d903309  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x1309, %pstate
	.word 0xe24fc000  ! 52: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2c7e148  ! 53: LDSWA_I	ldswa	[%r31, + 0x0148] %asi, %r17
	.word 0xe33fe130  ! 54: STDF_I	std	%f17, [0x0130, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_36:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_1_37:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0f381914ed8e5087, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 56: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_1_38:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc02d  ! 57: STDA_R	stda	%r17, [%r31 + %r13] 0x01
	.word 0xa9524000  ! 58: RDPR_CWP	<illegal instruction>
ibp_1_39:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 59: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_1_40:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d94000c  ! 60: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
ibp_1_41:
	nop
	.word 0xe1bfe0c0  ! 61: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0xe8dfe140  ! 62: LDXA_I	ldxa	[%r31, + 0x0140] %asi, %r20
	.word 0x879b4011  ! 63: WRHPR_HINTP_R	wrhpr	%r13, %r17, %hintp
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_42) + 8, 16, 16)) -> intp(5,0,7)
#else
	setx 0x08faf5479792fcb0, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_42:
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fdc00  ! 65: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_1_44:
	nop
	.word 0xe19fe1a0  ! 66: LDDFA_I	ldda	[%r31, 0x01a0], %f16
ibp_1_45:
	nop
	.word 0xe8bfc034  ! 67: STDA_R	stda	%r20, [%r31 + %r20] 0x01
	.word 0xe927e09d  ! 68: STF_I	st	%f20, [0x009d, %r31]
mondo_1_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 69: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xb1828014  ! 70: WR_STICK_REG_R	wr	%r10, %r20, %-
br_badelay3_1_47:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5150004  ! 1: LDQF_R	-	[%r20, %r4], %f18
	.word 0xa5a4c826  ! 71: FADDs	fadds	%f19, %f6, %f18
fpinit_1_48:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 72: FCMPLE32	fcmple32	%d0, %d4, %r4
brcommon2_1_49:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f8020d0  ! 1: SIR	sir	0x00d0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe180  ! 73: LDDFA_I	ldda	[%r31, 0x0180], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_50) + 8, 16, 16)) -> intp(0,0,30)
#else
	setx 0x02877ccd6f903ca2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_50:
	.word 0x39400001  ! 74: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 75: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_1_51:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd2ed19b2ec5607eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 76: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon3_1_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37e1e0  ! 1: STQF_I	-	%f13, [0x01e0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fe1d0  ! 77: LDDF_I	ldd	[%r31, 0x01d0], %f13
	.word 0xa984c012  ! 78: WR_SET_SOFTINT_R	wr	%r19, %r18, %set_softint
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d903c58  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1c58, %pstate
splash_lsu_1_54:
	nop
	ta T_CHANGE_HPRIV
	set 0x2c1d02d2, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_55:
	nop
	ta T_CHANGE_HPRIV
	set 0x785525e4, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 81: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_56:
	rd %pc, %r12
	add %r12, (donretarg_1_56-donret_1_56+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008a1600 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c85, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_56:
	.word 0x97a109d4  ! 82: FDIVd	fdivd	%f4, %f20, %f42
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_57:
	ta	T_CHANGE_NONHPRIV	! macro
dvapa_1_58:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd82, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99703b3e  ! 84: POPC_I	popc	0x1b3e, %r12
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_59:
	rd %pc, %r12
	add %r12, (donretarg_1_59-donret_1_59), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ca6800 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe1b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_1_59:
	.word 0xd86fe17b  ! 85: LDSTUB_I	ldstub	%r12, [%r31 + 0x017b]
trapasi_1_60:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d04b60  ! 86: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r12
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_1_61:
	nop
	setx 0xfffffb00fffffe64, %g1, %g7
	.word 0xa3800007  ! 88: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 89: WRTICK_R	wr	%r0, %r17, %tick
dvapa_1_63:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbf8, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc012  ! 90: LDDF_R	ldd	[%r31, %r18], %f12
	.word 0xd857e150  ! 91: LDSH_I	ldsh	[%r31 + 0x0150], %r12
	.word 0xb1844013  ! 92: WR_STICK_REG_R	wr	%r17, %r19, %-
	.word 0xd89fd160  ! 93: LDDA_R	ldda	[%r31, %r0] 0x8b, %r12
splash_hpstate_1_64:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81982785  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
	.word 0xc30fc000  ! 95: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon1_1_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x99702020  ! 1: POPC_I	popc	0x0020, %r12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac0a50  ! 96: FCMPd	fcmpd	%fcc<n>, %f16, %f16
	.word 0xd03fc014  ! 1: STD_R	std	%r8, [%r31 + %r20]
	.word 0x9f803cb7  ! 97: SIR	sir	0x1cb7
intveclr_1_66:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5ee4649da053eaa2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 98: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 99: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_1_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 100: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_1_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe080  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0080]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ab4a53  ! 101: FCMPd	fcmpd	%fcc<n>, %f44, %f50
intveclr_1_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xeabf6b0e182504cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x01c0b4e792c3aee6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_71:
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_72:
	rd %pc, %r12
	add %r12, (donretarg_1_72-donret_1_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00881a00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x145d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	retry
donretarg_1_72:
	.word 0x2d400001  ! 104: FBPG	fbg,a,pn	%fcc0, <label_0x1>
intveclr_1_73:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf2a361a2d0f729c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 105: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe060  ! 106: LDDFA_I	ldda	[%r31, 0x0060], %f16
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 107: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xc32fc000  ! 108: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0x99a409cb  ! 109: FDIVd	fdivd	%f16, %f42, %f12
	.word 0xe1bfe140  ! 110: STDFA_I	stda	%f16, [0x0140, %r31]
intveclr_1_77:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4dff3640c623b393, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 111: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_78:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 112: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfe0c0  ! 113: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0x99a2c9c8  ! 114: FDIVd	fdivd	%f42, %f8, %f12
tagged_1_80:
	tsubcctv %r9, 0x1ccb, %r6
	.word 0xd807e060  ! 115: LDUW_I	lduw	[%r31 + 0x0060], %r12
	.word 0x92d40010  ! 116: UMULcc_R	umulcc 	%r16, %r16, %r9
	setx 0x3a5d0b3fddad622d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_81:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_1_82:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xd2c84b40  ! 118: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r9
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d902050  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
ibp_1_84:
	nop
	.word 0xd3e7e008  ! 120: CASA_R	casa	[%r31] %asi, %r8, %r9
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
    brnz %r10, sma_1_85
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_85:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 121: CASA_R	casa	[%r31] %asi, %r17, %r9
fpinit_1_86:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 122: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x91950005  ! 123: WRPR_PIL_R	wrpr	%r20, %r5, %pil
intveclr_1_88:
	nop
	ta T_CHANGE_HPRIV
	setx 0x32efb51d6c5dbe5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 124: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_89:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d92400d  ! 125: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_90:
	rd %pc, %r12
	add %r12, (donretarg_1_90-donret_1_90+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bc7800 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xaf5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_90:
	.word 0xd26fe0ed  ! 126: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ed]
	.word 0xd2cfe0d0  ! 127: LDSBA_I	ldsba	[%r31, + 0x00d0] %asi, %r9
	.word 0xd23fe0f4  ! 128: STD_I	std	%r9, [%r31 + 0x00f4]
	.word 0x8d802000  ! 129: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 130: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa3520000  ! 131: RDPR_PIL	<illegal instruction>
mondo_1_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d91c00d  ! 132: WRPR_WSTATE_R	wrpr	%r7, %r13, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_92) + 0, 16, 16)) -> intp(0,0,22)
#else
	setx 0xf0023ceb31bed5e6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_92:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_93:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82159  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x0159] %asi, #one_read
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 135: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_1_94:
	nop
	.word 0xc32fc00c  ! 137: STXFSR_R	st-sfr	%f1, [%r12, %r31]
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
    brnz %r10, cwq_1_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_95
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
cwq_1_95:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 138: RDPC	rd	%pc, %r16
	.word 0x8780208b  ! 139: WRASI_I	wr	%r0, 0x008b, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_96) + 16, 16, 16)) -> intp(6,0,24)
#else
	setx 0xf114e007b9d8b3b9, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_96:
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfc030  ! 141: LDXA_R	ldxa	[%r31, %r16] 0x01, %r16
dvapa_1_98:
	nop
	ta T_CHANGE_HPRIV
	mov 0xba3, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa57039ab  ! 142: POPC_I	popc	0x19ab, %r18
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_99:
	rd %pc, %r12
	add %r12, (donretarg_1_99-donret_1_99+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff9f00 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15db, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_99:
	.word 0x2ccc4001  ! 143: BRGZ	brgz,a,pt	%r17,<label_0xc4001>
	.word 0xe477e064  ! 144: STX_I	stx	%r18, [%r31 + 0x0064]
	.word 0x8d902404  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0404, %pstate
	.word 0xe4800b60  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
trapasi_1_101:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 147: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
ibp_1_102:
	nop
	.word 0xe51fe190  ! 148: LDDF_I	ldd	[%r31, 0x0190], %f18
	setx 0x0f2b43c8a42726b2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_103:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_104:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c009  ! 150: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	setx 0x859640719192b054, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_105:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_1_106:
	nop
	.word 0xe4bfc02b  ! 152: STDA_R	stda	%r18, [%r31 + %r11] 0x01
trapasi_1_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xe4c84e40  ! 153: LDSBA_R	ldsba	[%r1, %r0] 0x72, %r18
	.word 0xe5e7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r18
	.word 0x9f802385  ! 154: SIR	sir	0x0385
splash_cmpr_1_108:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 155: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_1_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc42712258bb746c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 156: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_1_110:
	nop
	.word 0xa3b407c3  ! 157: PDIST	pdistn	%d16, %d34, %d48
	.word 0xc32fc000  ! 158: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0xe1bfe120  ! 159: STDFA_I	stda	%f16, [0x0120, %r31]
	.word 0xa3b7c492  ! 1: FCMPLE32	fcmple32	%d62, %d18, %r17
	.word 0x9f8026bd  ! 160: SIR	sir	0x06bd
splash_hpstate_1_112:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x819830ce  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x10ce, %hpstate
	.word 0xe327e0ee  ! 162: STF_I	st	%f17, [0x00ee, %r31]
	.word 0x91d02032  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_1_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d944014  ! 164: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
br_badelay2_1_114:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b2030a  ! 165: ALIGNADDRESS	alignaddr	%r8, %r10, %r8
fpinit_1_115:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 166: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    set 0x2e1e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b507cd  ! 167: PDIST	pdistn	%d20, %d44, %d10
memptr_1_116:
	set 0x60340000, %r31
	.word 0x85843c6d  ! 168: WRCCR_I	wr	%r16, 0x1c6d, %ccr
	.word 0xd4c7e000  ! 169: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	setx 0x5c9ad2268ce79bb8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_117:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_118:
	.word 0x8198378d  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x178d, %hpstate
mondo_1_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d92400a  ! 172: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
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
    brnz %r10, cwq_1_120
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_120
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
cwq_1_120:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 173: RDPC	rd	%pc, %r10
ibp_1_121:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe060  ! 174: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xd4800bc0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
	.word 0x8d802000  ! 176: WRFPRS_I	wr	%r0, 0x0000, %fprs
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_122) + 0, 16, 16)) -> intp(6,0,14)
#else
	setx 0xf84b0f844990d997, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_122:
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x1078ac84adc27690, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_123:
	.word 0x39400001  ! 178: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 52
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_124) + 48, 16, 16)) -> intp(0,0,5)
#else
	setx 0x7d6f010b53f781f8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_124:
	.word 0x39400001  ! 180: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83c6d  ! 181: PREFETCHA_I	prefetcha	[%r0, + 0xfffffc6d] %asi, #one_read
splash_tba_1_126:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 182: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_1_127:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 183: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xd4dfe058  ! 184: LDXA_I	ldxa	[%r31, + 0x0058] %asi, %r10
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
    brnz %r10, cwq_1_128
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_128
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
cwq_1_128:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 185: RDPC	rd	%pc, %r18
intveclr_1_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0xae432c965ed94d70, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 186: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_130:
	set 0x60340000, %r31
	.word 0x8582f61d  ! 187: WRCCR_I	wr	%r11, 0x161d, %ccr
	.word 0x9192c013  ! 188: WRPR_PIL_R	wrpr	%r11, %r19, %pil
	.word 0xa9a00166  ! 189: FABSq	dis not found

	.word 0xe88008a0  ! 190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x81580000  ! 191: FLUSHW	flushw
splash_cmpr_1_133:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 192: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe877c000  ! 193: STX_R	stx	%r20, [%r31 + %r0]
ceter_1_134:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 194: RDTICK	rd	%tick, %r13
	.word 0x8d802000  ! 195: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97520000  ! 196: RDPR_PIL	<illegal instruction>
	setx 0xdacb87ab1efbdb9c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_135:
	.word 0x39400001  ! 197: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd727e130  ! 198: STF_I	st	%f11, [0x0130, %r31]
ibp_1_136:
	nop
	.word 0xe1bfe040  ! 199: STDFA_I	stda	%f16, [0x0040, %r31]
ibp_1_137:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd73fc009  ! 200: STDF_R	std	%f11, [%r9, %r31]
	.word 0x89800011  ! 201: WRTICK_R	wr	%r0, %r17, %tick
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

	.xword	0x21f8566b2af8bb91
	.xword	0x94c8b76aa71d9e6e
	.xword	0xe47e0306fcbf67de
	.xword	0x1d60598a85b18d3a
	.xword	0x86305c78e667ddee
	.xword	0xe43a8e3cbb424b57
	.xword	0x81db959b279c43f4
	.xword	0x04e0729f3f4c92a3
	.xword	0xbb981d4db6f46e76
	.xword	0x0b4e9dcef163e604
	.xword	0x9e0966036e870301
	.xword	0x2c9ef194a2bd385c
	.xword	0x56b9d04e322dfb0f
	.xword	0x3c43719584e30989
	.xword	0xd9e6a77f2368d0c2
	.xword	0x6eea1acb2cced97c
	.xword	0x9a619ce8861a7c22
	.xword	0x07e660e0df9ace42
	.xword	0xe8330ac89c1d4635
	.xword	0x39952aa20753c59e
	.xword	0xe97899b67c1f869f
	.xword	0x97920d26ce975b3a
	.xword	0x0ad58eec79fac0eb
	.xword	0xc2e0b38f86f6ca33
	.xword	0x0ca809ee3c4bebbf
	.xword	0x4f228a4a7028aad9
	.xword	0x39d3b2784f3c5c8f
	.xword	0x478668f017017943
	.xword	0xc5aacfd831065ff8
	.xword	0xfa1e8b1263997f8d
	.xword	0x52a8b17d9695a5e3
	.xword	0xad8c80ed62414b0e
	.xword	0x0959089ae08d2e18
	.xword	0x43a6ffa0bea832e4
	.xword	0xf956e5d4bfddf9a8
	.xword	0x1c97f0ec9b635409
	.xword	0x858c406c5f620dfa
	.xword	0x15eafe12696d31b0
	.xword	0x10d341c291d8f769
	.xword	0x5f0a648a53f33f6f
	.xword	0x98150a2fb0e85798
	.xword	0xae3b5794a74b5018
	.xword	0xc3613abfb30ae307
	.xword	0x4997b7dea78346ec
	.xword	0x41f35bd0e9bd37d2
	.xword	0xf1de0e5e9584864f
	.xword	0x62c55775cd8a1058
	.xword	0x23ead671de4413f8
	.xword	0x880b33da6a6b0250
	.xword	0x3dbca1295f41058c
	.xword	0x09ea17ec12ca3333
	.xword	0x45e8489d0720485f
	.xword	0x5c7c0b680797c2a2
	.xword	0x65ba5022508cc192
	.xword	0x6f0cd87938a04b99
	.xword	0x29b0f574a089e7e7
	.xword	0x1d9c304972c58563
	.xword	0x5f92189c53a61b3d
	.xword	0x0cb5a2a46706c46d
	.xword	0x382f8f2a86fdb887
	.xword	0x24e5859bbb2ce00d
	.xword	0x6cd2f49d8321a741
	.xword	0x484c3c907140ca0d
	.xword	0xd160047fdcf93250
	.xword	0x5bd8db7a774e0e0e
	.xword	0x4dd735668ffff9e5
	.xword	0x3a3a05de452abcb4
	.xword	0x784c7912cc2385d0
	.xword	0xb3406bba1cb338d9
	.xword	0xde0f21801010b404
	.xword	0xd8d7a9a13bc01350
	.xword	0xb5df4de55cd6a784
	.xword	0x4e370139df4eddc8
	.xword	0x289bdcb5e72cb106
	.xword	0x3aa6a1b47d301f2a
	.xword	0x714bfd6983b611a9
	.xword	0xf54cc345e176bf85
	.xword	0x19dd33b58b4b7cd5
	.xword	0x9ac7849e46fd07fe
	.xword	0x3b2d523c23c8ac49
	.xword	0x4f79688d32438c07
	.xword	0x2302d6962d057bea
	.xword	0x7133e327943efbdc
	.xword	0x4bec7ce31739678b
	.xword	0x95446d1805c1d765
	.xword	0x7295b069c725c285
	.xword	0x030b398f2e5d6689
	.xword	0x2e357b627dc65231
	.xword	0x39d8828ab49ef246
	.xword	0xeb11315a09020f71
	.xword	0x293e1d6df601e3d9
	.xword	0x06f3394b7f50f0ba
	.xword	0xcd5a36ee5fae5f28
	.xword	0x6c6ea67e8811864c
	.xword	0x4c8283303ee29eba
	.xword	0x23213362db73a521
	.xword	0x5093c3772e291d17
	.xword	0x9d6b7683e502b628
	.xword	0x7837a8a5759d44bf
	.xword	0xefd4f6cd56c8d22c
	.xword	0xd283749daf7aaed1
	.xword	0xe96fd346174d25da
	.xword	0x17a19400db327e60
	.xword	0xc4e86e722055fcb4
	.xword	0x597caebfff3b7ad9
	.xword	0x9ae7fb00b997ec0e
	.xword	0x264c4ce7efdf1f5f
	.xword	0x1c70533b59776c29
	.xword	0x525ce864fed9d594
	.xword	0x914c298152fd83e8
	.xword	0x34d41bcb79d53863
	.xword	0xd17888ae36b73cf1
	.xword	0x20347e7ef552f86f
	.xword	0xb023b34af682d1f6
	.xword	0xd2a3c9d7b946fddf
	.xword	0x6901ea2f4cd5c1f0
	.xword	0xdacb12d106c2c92b
	.xword	0x42875a5028ef5a96
	.xword	0x87b58a47892b8968
	.xword	0x3d93c8f4e8786607
	.xword	0x113aef102e182461
	.xword	0x8e340a3f6dd5f567
	.xword	0xe723817ca7a8d089
	.xword	0x62a72a020b32ef78
	.xword	0x08455021507b2ec4
	.xword	0x5e6f8d26c44941da
	.xword	0x006a52e7bb15d99e
	.xword	0x592f68270f977841
	.xword	0x8b99d8b562c14c8c
	.xword	0x47e11a15d3987339
	.xword	0x384f8b5fd443dc91
	.xword	0x4c923344aa936670
	.xword	0xbfbdff967f78e761
	.xword	0xbb852fd50243b3bd
	.xword	0x8c73616ce77c8281
	.xword	0xfbb6508c9db86b88
	.xword	0x9a9fda5fdebf7c8e
	.xword	0xdf16a29507e1fe77
	.xword	0xb6ba203efb9c0e8c
	.xword	0xd76e120e6ac0ba9f
	.xword	0xa440af4e5b0739c4
	.xword	0x2556b1da62a421f3
	.xword	0x1f60a57b2e2fad2b
	.xword	0xfd5fe1846fb58f99
	.xword	0x5d52c69954434875
	.xword	0x4dc6e4e4fe03957d
	.xword	0x45ee8e16e5737fdb
	.xword	0x80a01013fd4c961d
	.xword	0x8161b12c1e07641b
	.xword	0xa3c9ab4410e41445
	.xword	0x6578828397fc17ae
	.xword	0xdcf475fd0f22f4f3
	.xword	0xf902fff8f09241a3
	.xword	0x9e771f2a8e819b5b
	.xword	0x88aeff09fc7a97fd
	.xword	0x5b7881c4c8d90e1b
	.xword	0x5aff434801c62d95
	.xword	0xf1ce4dc4c752845d
	.xword	0xcb9016ba1c86bcef
	.xword	0x107c4711e28213f3
	.xword	0xb096d81ef8c1898c
	.xword	0x9de78705158d0c08
	.xword	0x5385babe24bba41c
	.xword	0xc45eab087c3bada1
	.xword	0x8cbe9351afcf6a86
	.xword	0x3b77690da8363b1e
	.xword	0x2dfa992691e64cec
	.xword	0xe2b0556b386f274b
	.xword	0xbdb542d346eff502
	.xword	0xaaefefb91f2f0e9f
	.xword	0x413b006084faf3c3
	.xword	0x07ad4f3b2e2a0813
	.xword	0x3b9e4c47fe6206d3
	.xword	0x1fb4525a3bf6dcfc
	.xword	0xaed2cafa6f00a7bf
	.xword	0x9f4d1080045d9c65
	.xword	0x980e0d555c4ea2cf
	.xword	0x940fe7ac0ce74f57
	.xword	0xae28ca6d3d506fc1
	.xword	0x31363d27148a2ac5
	.xword	0x9b3ada4ca6eb65c8
	.xword	0x2a6d6e578f00dad3
	.xword	0x712e5ea20232e484
	.xword	0x94cdd8242abd1426
	.xword	0x94dcfe4290bf28c5
	.xword	0xc7190e427478ff8b
	.xword	0x46221a47ad75d28b
	.xword	0x9070a28c2f33997f
	.xword	0x80d8410e3542b941
	.xword	0x046b7dd31f9fb843
	.xword	0x589e7eff6ba255ad
	.xword	0xafee310004a8e420
	.xword	0x011118df8647f044
	.xword	0x65f7c3417f7a438d
	.xword	0x583e9162b82221f9
	.xword	0xa2c8b904056a1907
	.xword	0xbd5d2f3c1850fbdb
	.xword	0x9ce29defe953d99f
	.xword	0x4d502eb02d5dc69d
	.xword	0x516714160d6daece
	.xword	0x1f6e52a0eea2ec4b
	.xword	0x84df4d01c5fc3636
	.xword	0xc837d6ae1ec81e06
	.xword	0x9317053be57a7bda
	.xword	0x2928ec2ecf975615
	.xword	0x669eb9a284f5abc3
	.xword	0xe3108e93af8fcf9c
	.xword	0xf127d94e16b9d8be
	.xword	0x0e2b180258bac317
	.xword	0x6fc53b48cf0b35f4
	.xword	0xab02f4efe06ddee6
	.xword	0x229852a247c650bb
	.xword	0xa861aec2bc5230f0
	.xword	0x98267fcc7a37865f
	.xword	0x3c1c3ea5400c215c
	.xword	0x4d48a1c54a662437
	.xword	0x42929bcd2ca1e139
	.xword	0x12a2c5dc5aaa0355
	.xword	0x4dde1187249e0657
	.xword	0xa38f282e5bda499c
	.xword	0x1acb145c5183d2aa
	.xword	0x35d43f90f891bb3e
	.xword	0x72f93235e1e91320
	.xword	0xa3cad95b99567f95
	.xword	0x7aa93ae254d51552
	.xword	0x90a221863450117a
	.xword	0xe6aef7e307ebe875
	.xword	0x7becce2ccbdec588
	.xword	0x7903cb0b85ae0311
	.xword	0xd8aaea179e0317f2
	.xword	0x1718c72f834db915
	.xword	0xc8f6cf1e046f082f
	.xword	0x38e50d8233c6a34f
	.xword	0x6902e060c10044bb
	.xword	0xff9d26c06f8ecc98
	.xword	0x5cef57a0a5f9b022
	.xword	0x42fec29fcc09a3dc
	.xword	0xef9e2cb0f04b028e
	.xword	0x26907535ffcadb6f
	.xword	0x387670fdb6270de1
	.xword	0xa1421bb1cc758d59
	.xword	0xa5beb2120912f110
	.xword	0x4065a663879ab163
	.xword	0xdbf567cc9e0d7f91
	.xword	0x3c9cee0f576ebf7c
	.xword	0x0ef3c7dd780075c0
	.xword	0x6b7bc46c9cdcbd98
	.xword	0x2835d89db5d82997
	.xword	0x27ebb0a9540d711c
	.xword	0xe226f3a4c3a5cee3
	.xword	0xe3816774cb145e2f
	.xword	0xd5988bdb4982bcf9
	.xword	0xa5288241aab06a2e
	.xword	0xa84c7e6a4c7d24c6
	.xword	0xf051019ce4de90e8
	.xword	0x6db01efffad72ec4

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
# 10 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
SECTION .HTRAPS
.global wdog_2_ext
.global retry_with_base_tba
.global resolve_bad_tte

.text
resolve_bad_tte:
    !if pc[13:5]==0, then assume not a relocated handler
    rdpr %tpc, %r4
    andn %r4, 0xf, %r4
    sllx %r4, 49, %r5
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
# 86 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 973 "diag.j"

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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	TTE_CP	 = 0,
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
	TTE_CV	 = 1,
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
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
	TTE_P	 = 1,
	TTE_W	 = 1,
	TTE_X	 = 1
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
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1,
	TTE_X	 = 0
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
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	TTE_NFO	 = 1,
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

#include "traps.s"





SECTION .MyDATA_0 TEXT_VA = 0x00000000e0140000, DATA_VA = 0x0000000060140000
attr_data {
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
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
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
	.xword	0x61b33db28d33341f
	.xword	0xbd22eb45d4327bd3
	.xword	0x1511920ad34a4525
	.xword	0xaaf3dbe49f0f0f46
	.xword	0x5ae1cf89dd3ec862
	.xword	0x48f3df721b1260cf
	.xword	0x3da247fb523431f2
	.xword	0xf2f0592ab42092d6
	.xword	0x559a925074f836d3
	.xword	0x0feadc2d5204e730
	.xword	0xc9a763f6487702eb
	.xword	0xe8c02c135d301a58
	.xword	0x77c569d934e657ee
	.xword	0xa9522012fda55ff3
	.xword	0xbd1fc9f255d1c37e
	.xword	0xc07fa7afb4a2b251
	.xword	0xadcbeb62fa27d607
	.xword	0xc7dc6ebeee9c22f9
	.xword	0x988d8c0e43ddd4c0
	.xword	0xbe02ec558d466c1a
	.xword	0x1749e4a60061e722
	.xword	0x12f70e2c72e0df8f
	.xword	0x5b5eeb1b631254bd
	.xword	0xf0e3a88ae7c4ae16
	.xword	0x4295f2705740907c
	.xword	0x75fa40c22e8d3951
	.xword	0xde0b6a1f82ee7b26
	.xword	0xe7f9f3602aa74886
	.xword	0xd921396ea8c29e52
	.xword	0x20cd2074f79e1914
	.xword	0xba5ab1297e212f0b
	.xword	0xed6458dcd879ce83



SECTION .MyDATA_1 TEXT_VA = 0x00000000e0340000, DATA_VA = 0x0000000060340000
attr_data {
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
	TTE_IE	 = 1,
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
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
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
	.xword	0x6e643fc2ec132885
	.xword	0x9d8ec8a15266c305
	.xword	0xc2cfc08507a4d95c
	.xword	0x408567d645c40caf
	.xword	0xcb6fd35473ecda3d
	.xword	0xf170e21610a2e133
	.xword	0x94ed11fcfcacef89
	.xword	0xb37d9a57254e0aef
	.xword	0x019fac13dad53cf8
	.xword	0x7cb7e5a2a82583ef
	.xword	0x96ad64814de3209b
	.xword	0x9e4e28e8a3c4afdb
	.xword	0x178a891b9a562796
	.xword	0x54b6d192627c1eec
	.xword	0xc4b4eb00baf7f0b3
	.xword	0x92549a90116f00cd
	.xword	0x3dc68dad091982cf
	.xword	0x8cf7111d512fc756
	.xword	0x40954eec289f2226
	.xword	0x9c03a7522c0a0472
	.xword	0x3a6b4d4f103be92f
	.xword	0xdf117afbaee45a84
	.xword	0x1eaad4edbc3b3264
	.xword	0x61d38dc88de543e8
	.xword	0x0823a6f2bce1490a
	.xword	0xaa21f7aa6ea2eda0
	.xword	0xb6b6bf453b9e0c2b
	.xword	0xf634140733fc9497
	.xword	0x05ba05fc33df8240
	.xword	0x3ff485a811713f1a
	.xword	0xd8f4128f5de3058d
	.xword	0x052770d5ca67c636



SECTION .MyDATA_2 TEXT_VA = 0x00000000e0540000, DATA_VA = 0x0000000060540000
attr_data {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
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
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	TTE_P	 = 0,
	TTE_W	 = 1,
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
	.xword	0xf640e668bcead998
	.xword	0x5af078cb42012b40
	.xword	0x69221fe77044475e
	.xword	0xdf7e9da1af32f842
	.xword	0x848d8b2fa0c517d7
	.xword	0x548b2dd2f4f4f1aa
	.xword	0x40f1d54bb1aadb6f
	.xword	0x85e99a950970c74b
	.xword	0xbad5a00781c0ea92
	.xword	0xe78aef3fade7aade
	.xword	0x52e539e99b70f4b7
	.xword	0xb3978cc8c5b8b430
	.xword	0x6b2dfcf625cf68f1
	.xword	0xefa7765f4830e943
	.xword	0x0d76e6174a0e5a41
	.xword	0x37297909793318fc
	.xword	0x31fea06a046f8cfe
	.xword	0xd726c837a9851e06
	.xword	0x65c1e1635515fa04
	.xword	0x0c5d4b54087d8372
	.xword	0x8312caf1c2fbfc9a
	.xword	0xff8d3bcadfcc16ca
	.xword	0x5f02a43d08ae1775
	.xword	0x408b5a4e7d4c41d9
	.xword	0x9f11c0fa88ec28b8
	.xword	0x5a0015c0126fb119
	.xword	0xbbf04fed21d1a150
	.xword	0xa5267cba3d7a9800
	.xword	0x7a65317fd0427645
	.xword	0x01142743be2b02ca
	.xword	0x3919196acf4e48a3
	.xword	0xaa4f0aa369dd5b0f



SECTION .MyDATA_3 TEXT_VA = 0x00000000e0740000, DATA_VA = 0x0000000060740000
attr_data {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	.xword	0xb00d22daee6bfe72
	.xword	0x9b2c5adad0d7acb1
	.xword	0x43577e1d4859a811
	.xword	0x7f72df2b0d1e31f7
	.xword	0x510341b77e8ea5b1
	.xword	0x193e68d3c92d8c60
	.xword	0x51e0fdc76baa6428
	.xword	0xa97df7298207d5e9
	.xword	0x7090f1b77a6ebc35
	.xword	0x4d2df2b3490e1584
	.xword	0x1dd376a1d3bdc64a
	.xword	0x47f757cd13d50048
	.xword	0x6da1a8093c9feb5f
	.xword	0xb276cc3b7667359a
	.xword	0xb8147e1972831900
	.xword	0x59840372f51cdd24
	.xword	0x16ec2b56b0e0664f
	.xword	0xebdc83334833f068
	.xword	0xc0f50e7046af1f0c
	.xword	0x545e8afb2e7fb64f
	.xword	0x95ba1f5e0a8fa641
	.xword	0xefc1f0a43bff11d0
	.xword	0xf03e660aa4a4fbb6
	.xword	0xd2e96187a901c3a9
	.xword	0x059652b1333a839f
	.xword	0xb65afde841974d2b
	.xword	0xe051795cc0812f9d
	.xword	0xccb8962610dba69f
	.xword	0xfaf426c71a155be0
	.xword	0x1bfe4625f69ff58f
	.xword	0x73c448df81ba1d24
	.xword	0x8ad088d9cc6bcb8a





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
	TTE_Size	 = 1,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f8
	jmpl %r27+8, %r0
	fdivs %f0, %f4, %f8



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
	TTE_Size	 = 5,
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

.text
nuff_said_1:
	fdivs %f0, %f4, %f4
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f8



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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f8
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f8
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f6





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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	nop
	nop
	jmpl %r27+8, %r0
	nop
	nop
	nop
	nop
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



#if 0
#endif
