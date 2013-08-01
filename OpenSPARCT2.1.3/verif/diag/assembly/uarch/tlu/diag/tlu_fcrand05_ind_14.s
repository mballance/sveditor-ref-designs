/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_fcrand05_ind_14.s
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
	mov 0x35, %r14
	mov 0xb0, %r30
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
	mov 0x30, %r14
	mov 0x30, %r30
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
	mov 0xb2, %r14
	mov 0x30, %r30
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
	mov 0xb1, %r30
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
	.word 0xe1e7c020  ! 1: CASA_I	casa	[%r31] 0x 1, %r0, %r16
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
    setx 0xf13299d55c29e179, %r1, %r28
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
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xc19fdb60  ! 2: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe08008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
splash_tick_80_0:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x08907a7c00148dad, %r16, %r17)
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 5: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d903e69  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1e69, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_2) + 56, 16, 16)) -> intp(1,0,3)
#else
	setx 0x432e45b2dc93ee70, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_80_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x486d8438, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
splash_decr_80_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7814014  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r20, %-
fpinit_80_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 13: FDIVd	fdivd	%f0, %f4, %f4
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879cc012  ! 15: WRHPR_HINTP_R	wrhpr	%r19, %r18, %hintp
	.word 0xa57035a9  ! 16: POPC_I	popc	0x15a9, %r18
	.word 0x8780208b  ! 17: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0x93b507d1  ! 18: PDIST	pdistn	%d20, %d48, %d40
cmp_80_7:
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
cmp_startwait80_7:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_7
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_7:
    brnz,a %r10, cmp_wait80_7
    ld [%r23], %r10
    ba cmp_startwait80_7
    mov 0x80, %r10
continue_cmp_80_7:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_7
    mov 0xbb, %r17
    best_set_reg(0x2f9dc727bdfca641, %r16, %r17)
cmp_multi_core_80_7:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x97a0016d  ! 19: FABSq	dis not found

	.word 0xe49fe148  ! 20: LDDA_I	ldda	[%r31, + 0x0148] %asi, %r18
	.word 0xe44fe0e8  ! 21: LDSB_I	ldsb	[%r31 + 0x00e8], %r18
memptr_80_8:
	set 0x60340000, %r31
	.word 0x8584f0be  ! 22: WRCCR_I	wr	%r19, 0x10be, %ccr
splash_tba_80_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
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
	.word 0x9b414000  ! 24: RDPC	rd	%pc, %r13
	.word 0x8d903a57  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1a57, %pstate
brcommon1_80_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702070  ! 1: POPC_I	popc	0x0070, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8026ea  ! 26: SIR	sir	0x06ea
intveclr_80_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x459b80f9c8d5f9e2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_80_14:
	nop
	ta T_CHANGE_HPRIV
	set 0x3761edaf, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_80_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d1  ! 1: PDIST	pdistn	%d62, %d48, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f80260a  ! 30: SIR	sir	0x060a
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_80_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_80_18:
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
ibp_startwait80_18:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_18
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_18:
    brnz %r16, ibp_wait80_18
    ld [%r23], %r16
    ba ibp_startwait80_18
    mov 0x80, %r16
continue_ibp_80_18:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_18:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_18
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_18:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_18
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_18:
    best_set_reg(0x0000004032c000e5,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd0bfc031  ! 33: STDA_R	stda	%r8, [%r31 + %r17] 0x01
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e148  ! 35: LDSWA_I	ldswa	[%r31, + 0x0148] %asi, %r8
ibp_80_19:
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
ibp_startwait80_19:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_19
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_19:
    brnz %r16, ibp_wait80_19
    ld [%r23], %r16
    ba ibp_startwait80_19
    mov 0x80, %r16
continue_ibp_80_19:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_19:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_19
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_19:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_19
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_19:
    best_set_reg(0x00000050a5c0e5b7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc32fc008  ! 36: STXFSR_R	st-sfr	%f1, [%r8, %r31]
splash_cmpr_80_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc19fe1a0  ! 38: LDDFA_I	ldda	[%r31, 0x01a0], %f0
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
    brnz %r10, cwq_80_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_21
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
cwq_80_21:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 39: RDPC	rd	%pc, %r19
	.word 0xa5a4c9c1  ! 40: FDIVd	fdivd	%f50, %f32, %f18
jmptr_80_23:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x97508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe098  ! 43: LDXA_I	ldxa	[%r31, + 0x0098] %asi, %r19
	.word 0xc3ec402a  ! 44: PREFETCHA_R	prefetcha	[%r17, %r10] 0x01, #one_read
	.word 0xc369f123  ! 45: PREFETCH_I	prefetch	[%r7 + 0xfffff123], #one_read
br_longdelay4_80_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	setx 0xc5a46be0ed9682c5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ad0a47  ! 48: FCMPd	fcmpd	%fcc<n>, %f20, %f38
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_80_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x838f3165c7b52503, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d90400c  ! 51: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
	.word 0xe63fe1db  ! 52: STD_I	std	%r19, [%r31 + 0x01db]
	.word 0xa781281f  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x081f, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d90305d  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x105d, %pstate
splash_tba_80_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9b0c486  ! 57: FCMPLE32	fcmple32	%d34, %d6, %r20
splash_tick_80_34:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x5ca48d7c08c164dc, %r16, %r17)
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_80_35:
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
ibp_startwait80_35:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_35
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_35:
    brnz %r16, ibp_wait80_35
    ld [%r23], %r16
    ba ibp_startwait80_35
    mov 0x80, %r16
continue_ibp_80_35:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_35:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_35
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_35:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_35
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_35:
    best_set_reg(0x00000050a4e5b7c7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe8bfc030  ! 59: STDA_R	stda	%r20, [%r31 + %r16] 0x01
	.word 0xe8cfe100  ! 60: LDSBA_I	ldsba	[%r31, + 0x0100] %asi, %r20
	.word 0x91a489d2  ! 61: FDIVd	fdivd	%f18, %f18, %f8
ceter_80_37:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 62: RDTICK	rd	%tick, %r20
	.word 0xd31fe020  ! 63: LDDF_I	ldd	[%r31, 0x0020], %f9
mondo_80_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d924013  ! 64: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0xc36fe1ce  ! 65: PREFETCH_I	prefetch	[%r31 + 0x01ce], #one_read
fpinit_80_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 66: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_42:
	rd %pc, %r12
	add %r12, (donretarg_80_42-donret_80_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f9ec00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf4c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_42:
	.word 0xd26fe031  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x0031]
ibp_80_43:
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
ibp_startwait80_43:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_43
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_43:
    brnz %r16, ibp_wait80_43
    ld [%r23], %r16
    ba ibp_startwait80_43
    mov 0x80, %r16
continue_ibp_80_43:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_43:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_43
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_43:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_43
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_43:
    best_set_reg(0x00000040acf7c7aa,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa7a489b1  ! 68: FDIVs	fdivs	%f18, %f17, %f19
splash_tba_80_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_80_45:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe1e8  ! 71: LDXA_I	ldxa	[%r31, + 0x01e8] %asi, %r19
	.word 0xe737e0bc  ! 72: STQF_I	-	%f19, [0x00bc, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x2f12, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b507c5  ! 74: PDIST	pdistn	%d20, %d36, %d10
	.word 0xd22fe160  ! 75: STB_I	stb	%r9, [%r31 + 0x0160]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
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
    mov 0x62, %r17
    best_set_reg(0x4232431ecbb23edc, %r16, %r17)
cmp_multi_core_80_46:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91944014  ! 77: WRPR_PIL_R	wrpr	%r17, %r20, %pil
	.word 0xd297c032  ! 78: LDUHA_R	lduha	[%r31, %r18] 0x01, %r9
	.word 0x83d020b5  ! 79: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_tick_80_48:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x9a622a9fd7397fad, %r16, %r17)
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_80_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_80_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x33e31affa379bd8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e00a  ! 84: STQF_I	-	%f9, [0x000a, %r31]
memptr_80_51:
	set user_data_start, %r31
	.word 0x8580f41c  ! 85: WRCCR_I	wr	%r3, 0x141c, %ccr
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_80_52:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x3fd1d7940d24a498, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_80_54:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_55:
	nop
	setx 0xfffffffffffff3e1, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd2800c60  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
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
    brnz %r10, cwq_80_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_56
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
cwq_80_56:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 93: RDPC	rd	%pc, %r19
brcommon3_80_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe0f0  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x00f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1e7e010  ! 94: CASA_R	casa	[%r31] %asi, %r16, %r16
splash_lsu_80_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x68a958a8, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d90c012  ! 96: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
ibp_80_60:
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
ibp_startwait80_60:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_60
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_60:
    brnz %r16, ibp_wait80_60
    ld [%r23], %r16
    ba ibp_startwait80_60
    mov 0x80, %r16
continue_ibp_80_60:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_60:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_60
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_60:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_60
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_60:
    best_set_reg(0x000000401dc7aa0f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe0a0  ! 97: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0xc19fde00  ! 98: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, cwq_80_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_61
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
cwq_80_61:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 99: RDPC	rd	%pc, %r9
	.word 0xdb37e007  ! 100: STQF_I	-	%f13, [0x0007, %r31]
	.word 0xc3ec4031  ! 101: PREFETCHA_R	prefetcha	[%r17, %r17] 0x01, #one_read
splash_tick_80_63:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x89ce993dd4e0bdba, %r16, %r17)
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_80_64:
    set user_data_start, %o7
	.word 0x93902007  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_80_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x561b8935, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xbb662c67, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_80_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 106: FCMPLE32	fcmple32	%d0, %d4, %r6
ibp_80_68:
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
ibp_startwait80_68:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_68
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_68:
    brnz %r16, ibp_wait80_68
    ld [%r23], %r16
    ba ibp_startwait80_68
    mov 0x80, %r16
continue_ibp_80_68:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_68:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_68
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_68:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_68
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_68:
    best_set_reg(0x00000040c1ea0f7b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a489a8  ! 107: FDIVs	fdivs	%f18, %f8, %f9
cerer_80_69:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xf5da2eecb26deb75, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_80_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcbaf51f9023ae5c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 110: CASA_R	casa	[%r31] %asi, %r17, %r11
	.word 0xe1bfe180  ! 111: STDFA_I	stda	%f16, [0x0180, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_72:
	rd %pc, %r12
	add %r12, (donretarg_80_72-donret_80_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ba7d00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1455, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	retry
donretarg_80_72:
	.word 0x95a149c5  ! 112: FDIVd	fdivd	%f36, %f36, %f10
ibp_80_73:
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
ibp_startwait80_73:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_73
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_73:
    brnz %r16, ibp_wait80_73
    ld [%r23], %r16
    ba ibp_startwait80_73
    mov 0x80, %r16
continue_ibp_80_73:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_73:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_73
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_73:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_73
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_73:
    best_set_reg(0x0000004083cf7b7e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd297c033  ! 113: LDUHA_R	lduha	[%r31, %r19] 0x01, %r9
	.word 0xe1bfdc00  ! 114: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d903103  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1103, %pstate
	.word 0x87802010  ! 116: WRASI_I	wr	%r0, 0x0010, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_76) + 0, 16, 16)) -> intp(6,0,9)
#else
	setx 0x5c4b5afdde9a152e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_80_77:
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
ibp_startwait80_77:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_77
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_77:
    brnz %r16, ibp_wait80_77
    ld [%r23], %r16
    ba ibp_startwait80_77
    mov 0x80, %r16
continue_ibp_80_77:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_77:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_77
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_77:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_77
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_77:
    best_set_reg(0x00000040f0fb7e47,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb4022  ! 118: PREFETCHA_R	prefetcha	[%r13, %r2] 0x01, #one_read
	.word 0x83d020b2  ! 119: Tcc_I	te	icc_or_xcc, %r0 + 178
mondo_80_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d918007  ! 120: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
ibp_80_79:
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
ibp_startwait80_79:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_79
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_79:
    brnz %r16, ibp_wait80_79
    ld [%r23], %r16
    ba ibp_startwait80_79
    mov 0x80, %r16
continue_ibp_80_79:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_79:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_79
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_79:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_79
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_79:
    best_set_reg(0x00000040b3fe476c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fdf20  ! 121: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_80_80:
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
ibp_startwait80_80:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_80
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_80:
    brnz %r16, ibp_wait80_80
    ld [%r23], %r16
    ba ibp_startwait80_80
    mov 0x80, %r16
continue_ibp_80_80:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_80:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_80
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_80:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_80
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_80:
    best_set_reg(0x00000050cbc76cd3,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7b40484  ! 122: FCMPLE32	fcmple32	%d16, %d4, %r19
	.word 0x8d802000  ! 123: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_80_81:
	ta T_CHANGE_NONHPRIV
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x819821b4  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01b4, %hpstate
ibp_80_82:
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
ibp_startwait80_82:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_82
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_82:
    brnz %r16, ibp_wait80_82
    ld [%r23], %r16
    ba ibp_startwait80_82
    mov 0x80, %r16
continue_ibp_80_82:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_82:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_82
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_82:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_82
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_82:
    best_set_reg(0x0000005010ecd3f6,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc009  ! 125: STDF_R	std	%f8, [%r9, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_83:
	rd %pc, %r12
	add %r12, (donretarg_80_83-donret_80_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0040a300 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x71f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_80_83:
	.word 0x22800001  ! 126: BE	be,a	<label_0x1>
	.word 0xd11fc008  ! 127: LDDF_R	ldd	[%r31, %r8], %f8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_80_85:
	set 0x60540000, %r31
	.word 0x8581707f  ! 130: WRCCR_I	wr	%r5, 0x107f, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_80_86:
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
ibp_startwait80_86:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_86
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_86:
    brnz %r16, ibp_wait80_86
    ld [%r23], %r16
    ba ibp_startwait80_86
    mov 0x80, %r16
continue_ibp_80_86:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_86:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_86
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_86:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_86
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_86:
    best_set_reg(0x000000400ad3f62f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fdb60  ! 132: LDDFA_R	ldda	[%r31, %r0], %f16
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
    mov 57, %r17
    best_set_reg(0x0eabbe140cc308f1, %r16, %r17)
cmp_multi_core_80_87:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91a00171  ! 133: FABSq	dis not found

	.word 0xdad7e130  ! 134: LDSHA_I	ldsha	[%r31, + 0x0130] %asi, %r13
	.word 0x9f80367a  ! 135: SIR	sir	0x167a
fpinit_80_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 136: FCMPLE32	fcmple32	%d0, %d4, %r4
br_badelay2_80_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa1b40307  ! 137: ALIGNADDRESS	alignaddr	%r16, %r7, %r16
	.word 0xe137e192  ! 138: STQF_I	-	%f16, [0x0192, %r31]
fpinit_80_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 139: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d903cf5  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x1cf5, %pstate
ibp_80_93:
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
ibp_startwait80_93:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_93
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_93:
    brnz %r16, ibp_wait80_93
    ld [%r23], %r16
    ba ibp_startwait80_93
    mov 0x80, %r16
continue_ibp_80_93:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_93:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_93
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_93:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_93
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_93:
    best_set_reg(0x00000040f9f62fdf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa7a449d2  ! 141: FDIVd	fdivd	%f48, %f18, %f50
	.word 0x95a000cd  ! 142: FNEGd	fnegd	%f44, %f10
    set 0x3eae, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7d0  ! 143: PDIST	pdistn	%d50, %d16, %d48
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_80_95:
	set 0x60540000, %r31
	.word 0x858161b0  ! 146: WRCCR_I	wr	%r5, 0x01b0, %ccr
dvapa_80_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb56, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fe0a0  ! 147: LDDA_I	ldda	[%r31, + 0x00a0] %asi, %r19
splash_decr_80_97:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7824014  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r20, %-
	.word 0xe637e0d2  ! 149: STH_I	sth	%r19, [%r31 + 0x00d2]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_98) + 56, 16, 16)) -> intp(1,0,15)
#else
	setx 0x6e63ba1cd7798e42, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe7f26770c09d57a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800b80  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
	.word 0xe62fe0d9  ! 153: STB_I	stb	%r19, [%r31 + 0x00d9]
mondo_80_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d944008  ! 154: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
	.word 0xa350c000  ! 155: RDPR_TT	rdpr	%tt, %r17
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_80_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd9144008  ! 1: LDQF_R	-	[%r17, %r8], %f12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe1a0  ! 157: LDDFA_I	ldda	[%r31, 0x01a0], %f0
tagged_80_102:
	tsubcctv %r18, 0x1e35, %r17
	.word 0xd407e0ec  ! 158: LDUW_I	lduw	[%r31 + 0x00ec], %r10
splash_cmpr_80_103:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c033  ! 160: CASA_I	casa	[%r31] 0x 1, %r19, %r10
br_longdelay2_80_104:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x95b7c4d4  ! 161: FCMPNE32	fcmpne32	%d62, %d20, %r10
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
    brnz %r10, cwq_80_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_105
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
cwq_80_105:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 162: RDPC	rd	%pc, %r20
splash_hpstate_80_106:
	ta T_CHANGE_NONHPRIV
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x81983eed  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1eed, %hpstate
trapasi_80_107:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4d04b40  ! 164: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r10
	.word 0xc1bfe1c0  ! 165: STDFA_I	stda	%f0, [0x01c0, %r31]
splash_hpstate_80_108:
	ta T_CHANGE_NONHPRIV
	.word 0x8198369e  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x169e, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd43fe178  ! 169: STD_I	std	%r10, [%r31 + 0x0178]
jmptr_80_109:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_80_110:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xe1bfe0e0  ! 173: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xd51fe080  ! 174: LDDF_I	ldd	[%r31, 0x0080], %f10
	.word 0xd44fe0e0  ! 175: LDSB_I	ldsb	[%r31 + 0x00e0], %r10
cmp_80_112:
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
cmp_startwait80_112:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_112
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_112:
    brnz,a %r10, cmp_wait80_112
    ld [%r23], %r10
    ba cmp_startwait80_112
    mov 0x80, %r10
continue_cmp_80_112:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_112
    mov 0x57, %r17
    best_set_reg(0xef6e0c0effc24af4, %r16, %r17)
cmp_multi_core_80_112:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9193400b  ! 176: WRPR_PIL_R	wrpr	%r13, %r11, %pil
trapasi_80_113:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d04980  ! 177: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r10
intveclr_80_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0x65020c4bf953a4df, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_80_115:
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
ibp_startwait80_115:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_115
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_115:
    brnz %r16, ibp_wait80_115
    ld [%r23], %r16
    ba ibp_startwait80_115
    mov 0x80, %r16
continue_ibp_80_115:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_115:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_115
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_115:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_115
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_115:
    best_set_reg(0x00000050bbefdf4b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fe160  ! 179: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_80_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_116
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
cwq_80_116:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 181: RDPC	rd	%pc, %r12
splash_cmpr_80_117:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 182: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_80_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd65c149f772f8a9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe0e8  ! 184: LDXA_I	ldxa	[%r31, + 0x00e8] %asi, %r16
intveclr_80_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5321dd69d1452d98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_120) + 0, 16, 16)) -> intp(4,0,0)
#else
	setx 0x594fc42e6e72eaa2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x3af7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b447d3  ! 187: PDIST	pdistn	%d48, %d50, %d48
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_80_121:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7808011  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r17, %-
	.word 0xda97e058  ! 190: LDUHA_I	lduha	[%r31, + 0x0058] %asi, %r13
	.word 0x879cf1b2  ! 191: WRHPR_HINTP_I	wrhpr	%r19, 0x11b2, %hintp
	.word 0x91d02034  ! 192: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_decr_80_122:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa780c011  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r17, %-
dvapa_80_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xed5, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99702a39  ! 194: POPC_I	popc	0x0a39, %r12
brcommon3_80_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd297c029  ! 195: LDUHA_R	lduha	[%r31, %r9] 0x01, %r9
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_80_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaa5, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91b18492  ! 197: FCMPLE32	fcmple32	%d6, %d18, %r8
memptr_80_126:
	set user_data_start, %r31
	.word 0x8581a6c6  ! 198: WRCCR_I	wr	%r6, 0x06c6, %ccr
	.word 0xc1bfe120  ! 199: STDFA_I	stda	%f0, [0x0120, %r31]
trapasi_80_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0884e60  ! 200: LDUBA_R	lduba	[%r1, %r0] 0x73, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_129:
	ta	T_CHANGE_NONHPRIV	! macro
cmpenall_80_130:
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
cmpenall_startwait80_130:
    mov 0x80, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_80_130
    nop
cmpenall_wait80_130:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait80_130
    nop
    ba,a cmpenall_startwait80_130
continue_cmpenall_80_130:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_80_130:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_80_130
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_80_130:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_80_130
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe19fc2c0  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe0800c20  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d90276d  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x076d, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_2) + 40, 16, 16)) -> intp(5,0,27)
#else
	setx 0xf684cb5605a2a8d1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_40_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x93c68c65, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
	.word 0xa7850011  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
fpinit_40_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 13: FDIVd	fdivd	%f0, %f4, %f4
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879c000c  ! 15: WRHPR_HINTP_R	wrhpr	%r16, %r12, %hintp
	.word 0x95703cae  ! 16: POPC_I	popc	0x1cae, %r10
	.word 0x8780201c  ! 17: WRASI_I	wr	%r0, 0x001c, %asi
iaw_40_6:
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
iaw_startwait40_6:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_6
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_6:
    brnz %r16, iaw_wait40_6
    ld [%r23], %r16
    ba iaw_startwait40_6
    mov 0x40, %r16
continue_iaw_40_6:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_6:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_6
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_6:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_6
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_6:
	mov 0x38, %r18
iaw4_40_6:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb4021  ! 18: PREFETCHA_R	prefetcha	[%r13, %r1] 0x01, #one_read
	.word 0x9ba00165  ! 19: FABSq	dis not found

	.word 0xe49fe0e8  ! 20: LDDA_I	ldda	[%r31, + 0x00e8] %asi, %r18
	.word 0xe44fe058  ! 21: LDSB_I	ldsb	[%r31 + 0x0058], %r18
memptr_40_8:
	set 0x60140000, %r31
	.word 0x8582b50c  ! 22: WRCCR_I	wr	%r10, 0x150c, %ccr
splash_tba_40_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
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
	.word 0xa5414000  ! 24: RDPC	rd	%pc, %r18
	.word 0x8d90350d  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x150d, %pstate
brcommon1_40_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa17021e0  ! 1: POPC_I	popc	0x01e0, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa77026b4  ! 26: POPC_I	popc	0x06b4, %r19
intveclr_40_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1c18c1b8cc9c1bdb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_40_14:
	nop
	ta T_CHANGE_HPRIV
	set 0x682b5b4b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_15:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_40_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d4  ! 1: PDIST	pdistn	%d62, %d20, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9970207a  ! 30: POPC_I	popc	0x007a, %r12
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_40_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_40_18:
	nop
	.word 0xd11fc00d  ! 33: LDDF_R	ldd	[%r31, %r13], %f8
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e188  ! 35: LDSWA_I	ldswa	[%r31, + 0x0188] %asi, %r8
ibp_40_19:
	nop
	.word 0xc32fc00b  ! 36: STXFSR_R	st-sfr	%f1, [%r11, %r31]
splash_cmpr_40_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 37: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc19fe0e0  ! 38: LDDFA_I	ldda	[%r31, 0x00e0], %f0
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
    brnz %r10, cwq_40_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_21
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
cwq_40_21:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 39: RDPC	rd	%pc, %r10
	.word 0x87a9ca53  ! 40: FCMPd	fcmpd	%fcc<n>, %f38, %f50
jmptr_40_23:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x93508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe158  ! 43: LDXA_I	ldxa	[%r31, + 0x0158] %asi, %r19
iaw_40_24:
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
iaw_startwait40_24:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_24
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_24:
    brnz %r16, iaw_wait40_24
    ld [%r23], %r16
    ba iaw_startwait40_24
    mov 0x40, %r16
continue_iaw_40_24:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_24:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_24
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_24:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_24
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_24:
	mov 0x38, %r18
iaw0_40_24:
	rd %pc, %r19
	add %r19, (16+5), %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91702a9e  ! 44: POPC_I	popc	0x0a9e, %r8
	.word 0x24ccc001  ! 45: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
br_longdelay4_40_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	setx 0xdf7a3f95675d5bc5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a049d2  ! 48: FDIVd	fdivd	%f32, %f18, %f42
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_40_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc7179a7059bf4264, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94c007  ! 51: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	.word 0xe63fe090  ! 52: STD_I	std	%r19, [%r31 + 0x0090]
	.word 0xa784251b  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x051b, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903801  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1801, %pstate
splash_tba_40_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc3ec4026  ! 57: PREFETCHA_R	prefetcha	[%r17, %r6] 0x01, #one_read
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_40_35:
	nop
	.word 0xe897c02a  ! 59: LDUHA_R	lduha	[%r31, %r10] 0x01, %r20
	.word 0xe8cfe1e8  ! 60: LDSBA_I	ldsba	[%r31, + 0x01e8] %asi, %r20
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
	mov 0x221,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba489d2  ! 61: FDIVd	fdivd	%f18, %f18, %f44
ceter_40_37:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 62: RDTICK	rd	%tick, %r20
iaw_40_38:
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
iaw_startwait40_38:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_38
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_38:
    brnz %r16, iaw_wait40_38
    ld [%r23], %r16
    ba iaw_startwait40_38
    mov 0x40, %r16
continue_iaw_40_38:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_38:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_38
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_38:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_38
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_38:
	mov 0x38, %r18
iaw4_40_38:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc009  ! 63: STXFSR_R	st-sfr	%f1, [%r9, %r31]
mondo_40_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d930012  ! 64: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0xc32fc000  ! 65: STXFSR_R	st-sfr	%f1, [%r0, %r31]
fpinit_40_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 66: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_42:
	rd %pc, %r12
	add %r12, (donretarg_40_42-donret_40_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005bf800 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x377, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_42:
	.word 0xd26fe056  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x0056]
ibp_40_43:
	nop
	.word 0xc3e88027  ! 68: PREFETCHA_R	prefetcha	[%r2, %r7] 0x01, #one_read
splash_tba_40_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_40_45:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe168  ! 71: LDXA_I	ldxa	[%r31, + 0x0168] %asi, %r19
	.word 0xe737e06a  ! 72: STQF_I	-	%f19, [0x006a, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x9dc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b347ca  ! 74: PDIST	pdistn	%d44, %d10, %d18
	.word 0xd22fe103  ! 75: STB_I	stb	%r9, [%r31 + 0x0103]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9194c005  ! 77: WRPR_PIL_R	wrpr	%r19, %r5, %pil
iaw_40_47:
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
iaw_startwait40_47:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_47
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_47:
    brnz %r16, iaw_wait40_47
    ld [%r23], %r16
    ba iaw_startwait40_47
    mov 0x40, %r16
continue_iaw_40_47:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_47:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_47
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_47:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_47
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_47:
	mov 0x38, %r18
iaw4_40_47:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd23fe0c0  ! 78: STD_I	std	%r9, [%r31 + 0x00c0]
	.word 0x91d020b3  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_40_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_40_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5dea91aaefafd4d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e014  ! 84: STQF_I	-	%f9, [0x0014, %r31]
memptr_40_51:
	set user_data_start, %r31
	.word 0x8580acd3  ! 85: WRCCR_I	wr	%r2, 0x0cd3, %ccr
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_40_52:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xc633e1b6d0fcab6b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_40_54:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_55:
	nop
	setx 0xfffffe36fffffcbd, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd2800c20  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
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
    brnz %r10, cwq_40_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_56
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
cwq_40_56:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 93: RDPC	rd	%pc, %r13
brcommon3_40_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe000  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x0000]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe09fe010  ! 94: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r16
splash_lsu_40_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x55aecd64, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d920005  ! 96: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
ibp_40_60:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 97: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fda00  ! 98: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, cwq_40_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_61
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
cwq_40_61:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 99: RDPC	rd	%pc, %r12
	.word 0xdb37e0e1  ! 100: STQF_I	-	%f13, [0x00e1, %r31]
iaw_40_62:
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
iaw_startwait40_62:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_62
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_62:
    brnz %r16, iaw_wait40_62
    ld [%r23], %r16
    ba iaw_startwait40_62
    mov 0x40, %r16
continue_iaw_40_62:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_62:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_62
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_62:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_62
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_62:
	mov 0x38, %r18
iaw4_40_62:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a109b2  ! 101: FDIVs	fdivs	%f4, %f18, %f16
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_40_64:
    set user_data_start, %o7
	.word 0x93902002  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_40_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xaef4f28c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x33f952b1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_40_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 106: FDIVs	fdivs	%f0, %f4, %f6
ibp_40_68:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa17025cc  ! 107: POPC_I	popc	0x05cc, %r16
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_40_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd902b1ccb60d0c9d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 110: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0xc1bfe000  ! 111: STDFA_I	stda	%f0, [0x0000, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_72:
	rd %pc, %r12
	add %r12, (donretarg_40_72-donret_40_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b7c100 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	retry
donretarg_40_72:
	.word 0xa3a309cc  ! 112: FDIVd	fdivd	%f12, %f12, %f48
ibp_40_73:
	nop
	.word 0xd297c034  ! 113: LDUHA_R	lduha	[%r31, %r20] 0x01, %r9
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
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdf20  ! 114: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d90225f  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	.word 0x87802004  ! 116: WRASI_I	wr	%r0, 0x0004, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_76) + 8, 16, 16)) -> intp(0,0,16)
#else
	setx 0xcec1a4e4b65786f0, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_40_77:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97a449c7  ! 118: FDIVd	fdivd	%f48, %f38, %f42
	.word 0x91d02032  ! 119: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_40_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d948011  ! 120: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
ibp_40_79:
	nop
	.word 0xc19fdc00  ! 121: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_40_80:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1702b60  ! 122: POPC_I	popc	0x0b60, %r16
	.word 0x8d802000  ! 123: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_40_81:
	ta T_CHANGE_NONHPRIV
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8198261f  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061f, %hpstate
ibp_40_82:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd11fe110  ! 125: LDDF_I	ldd	[%r31, 0x0110], %f8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_83:
	rd %pc, %r12
	add %r12, (donretarg_40_83-donret_40_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00221a00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14d4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_83:
	.word 0x37400001  ! 126: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
iaw_40_84:
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
iaw_startwait40_84:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_84
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_84:
    brnz %r16, iaw_wait40_84
    ld [%r23], %r16
    ba iaw_startwait40_84
    mov 0x40, %r16
continue_iaw_40_84:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_84:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_84
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_84:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_84
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_84:
	mov 0x38, %r18
iaw2_40_84:
	rdpr %tba, %r19
	mov 0x211,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd097c02a  ! 127: LDUHA_R	lduha	[%r31, %r10] 0x01, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_40_85:
	set 0x60340000, %r31
	.word 0x85826459  ! 130: WRCCR_I	wr	%r9, 0x0459, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_40_86:
	nop
	.word 0xe19fdf20  ! 132: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9a00174  ! 133: FABSq	dis not found

	.word 0xdad7e100  ! 134: LDSHA_I	ldsha	[%r31, + 0x0100] %asi, %r13
	.word 0xc36d2921  ! 135: PREFETCH_I	prefetch	[%r20 + 0x0921], #one_read
fpinit_40_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 136: FCMPd	fcmpd	%fcc<n>, %f0, %f4
br_badelay2_40_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b40310  ! 137: ALIGNADDRESS	alignaddr	%r16, %r16, %r10
	.word 0xe137e060  ! 138: STQF_I	-	%f16, [0x0060, %r31]
fpinit_40_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 139: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d90361a  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x161a, %pstate
ibp_40_93:
	nop
	.word 0x95702e73  ! 141: POPC_I	popc	0x0e73, %r10
	.word 0x99a000cb  ! 142: FNEGd	fnegd	%f42, %f12
    set 0xdfe, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b087d1  ! 143: PDIST	pdistn	%d2, %d48, %d50
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 144: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_40_95:
	set 0x60140000, %r31
	.word 0x8584a970  ! 146: WRCCR_I	wr	%r18, 0x0970, %ccr
dvapa_40_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe3a, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc02d  ! 147: LDDA_R	ldda	[%r31, %r13] 0x01, %r19
	.word 0xa7850001  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r1, %-
	.word 0xe637e086  ! 149: STH_I	sth	%r19, [%r31 + 0x0086]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_98) + 24, 16, 16)) -> intp(7,0,21)
#else
	setx 0xdd083d62bf292d7d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe49f4ccc99fd2716, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800c40  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
	.word 0xe62fe109  ! 153: STB_I	stb	%r19, [%r31 + 0x0109]
mondo_40_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944007  ! 154: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0x9950c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_40_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91b7c711  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f17, %d8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe0a0  ! 157: STDFA_I	stda	%f0, [0x00a0, %r31]
tagged_40_102:
	tsubcctv %r16, 0x1402, %r17
	.word 0xd407e1c2  ! 158: LDUW_I	lduw	[%r31 + 0x01c2], %r10
splash_cmpr_40_103:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c032  ! 160: CASA_I	casa	[%r31] 0x 1, %r18, %r10
br_longdelay2_40_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x87afca52  ! 161: FCMPd	fcmpd	%fcc<n>, %f62, %f18
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
    brnz %r10, cwq_40_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_105
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
cwq_40_105:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 162: RDPC	rd	%pc, %r18
splash_hpstate_40_106:
	ta T_CHANGE_NONHPRIV
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x81983fc7  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc7, %hpstate
trapasi_40_107:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4904b40  ! 164: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r10
	.word 0xe1bfe160  ! 165: STDFA_I	stda	%f16, [0x0160, %r31]
splash_hpstate_40_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81982ec7  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 167: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd43fe078  ! 169: STD_I	std	%r10, [%r31 + 0x0078]
jmptr_40_109:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_40_110:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
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
	.word 0xc19fe160  ! 173: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0xd51fe138  ! 174: LDDF_I	ldd	[%r31, 0x0138], %f10
	.word 0xd44fe048  ! 175: LDSB_I	ldsb	[%r31 + 0x0048], %r10
	.word 0x91940010  ! 176: WRPR_PIL_R	wrpr	%r16, %r16, %pil
trapasi_40_113:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4c84980  ! 177: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r10
intveclr_40_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4f33151ca4a75faf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_40_115:
	nop
	.word 0xc1bfe180  ! 179: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_40_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_116
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
cwq_40_116:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 181: RDPC	rd	%pc, %r12
splash_cmpr_40_117:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 182: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_40_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd002c562da68a75a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe038  ! 184: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r16
intveclr_40_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4a6561a2fb78120b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_120) + 40, 16, 16)) -> intp(5,0,7)
#else
	setx 0x41a5092e9cbc85d8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x1a72, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b087cb  ! 187: PDIST	pdistn	%d2, %d42, %d10
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7840005  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r5, %-
	.word 0xda97e048  ! 190: LDUHA_I	lduha	[%r31, + 0x0048] %asi, %r13
	.word 0x879c6060  ! 191: WRHPR_HINTP_I	wrhpr	%r17, 0x0060, %hintp
	.word 0x83d020b3  ! 192: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa7850003  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r3, %-
dvapa_40_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeac, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95b50492  ! 194: FCMPLE32	fcmple32	%d20, %d18, %r10
brcommon3_40_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd2dfc02d  ! 195: LDXA_R	ldxa	[%r31, %r13] 0x01, %r9
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_40_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd7c, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0025  ! 197: PREFETCHA_R	prefetcha	[%r16, %r5] 0x01, #one_read
memptr_40_126:
	set user_data_start, %r31
	.word 0x8584a8b7  ! 198: WRCCR_I	wr	%r18, 0x08b7, %ccr
iaw_40_127:
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
iaw_startwait40_127:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_127
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_127:
    brnz %r16, iaw_wait40_127
    ld [%r23], %r16
    ba iaw_startwait40_127
    mov 0x40, %r16
continue_iaw_40_127:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_127
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_127:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_127
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_127:
	mov 0x38, %r18
iaw4_40_127:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe020  ! 199: LDDFA_I	ldda	[%r31, 0x0020], %f16
trapasi_40_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0884e60  ! 200: LDUBA_R	lduba	[%r1, %r0] 0x73, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_129:
	ta	T_CHANGE_NONHPRIV	! macro
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
	.word 0xe0800b00  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r16
	.word 0xe19fd960  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe08008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033c8  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x13c8, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_2) + 40, 16, 16)) -> intp(6,0,10)
#else
	setx 0xe0af905dd5df8bcf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_20_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x90561031, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
	.word 0xa7844003  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r3, %-
fpinit_20_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 13: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87998002  ! 15: WRHPR_HINTP_R	wrhpr	%r6, %r2, %hintp
	.word 0xa770321e  ! 16: POPC_I	popc	0x121e, %r19
	.word 0x87802089  ! 17: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x97a049c4  ! 18: FDIVd	fdivd	%f32, %f4, %f42
	.word 0xa3a00170  ! 19: FABSq	dis not found

	.word 0xe49fe010  ! 20: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r18
	.word 0xe44fe018  ! 21: LDSB_I	ldsb	[%r31 + 0x0018], %r18
memptr_20_8:
	set 0x60340000, %r31
	.word 0x858429b4  ! 22: WRCCR_I	wr	%r16, 0x09b4, %ccr
splash_tba_20_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
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
	.word 0xa3414000  ! 24: RDPC	rd	%pc, %r17
	.word 0x8d903862  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1862, %pstate
brcommon1_20_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702010  ! 1: POPC_I	popc	0x0010, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ea0024  ! 26: PREFETCHA_R	prefetcha	[%r8, %r4] 0x01, #one_read
intveclr_20_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x69614f46d6d905ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_20_14:
	nop
	ta T_CHANGE_HPRIV
	set 0x2abc23c4, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_20_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3eac030  ! 30: PREFETCHA_R	prefetcha	[%r11, %r16] 0x01, #one_read
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_20_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_20_18:
	nop
	.word 0xd1e7e011  ! 33: CASA_R	casa	[%r31] %asi, %r17, %r8
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e168  ! 35: LDSWA_I	ldswa	[%r31, + 0x0168] %asi, %r8
ibp_20_19:
	nop
	.word 0xd13fc011  ! 36: STDF_R	std	%f8, [%r17, %r31]
splash_cmpr_20_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc19fe080  ! 38: LDDFA_I	ldda	[%r31, 0x0080], %f0
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
    brnz %r10, cwq_20_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_21
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
cwq_20_21:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 39: RDPC	rd	%pc, %r13
unsupttte_20_22:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x91a349d2  ! 40: FDIVd	fdivd	%f44, %f18, %f8
jmptr_20_23:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x97508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe0a0  ! 43: LDXA_I	ldxa	[%r31, + 0x00a0] %asi, %r19
	.word 0xa9703b46  ! 44: POPC_I	popc	0x1b46, %r20
	fbge skip_20_25
	fbne,a,pn	%fcc0,  skip_20_25
.align 128
skip_20_25:
	.word 0x9f803c11  ! 45: SIR	sir	0x1c11
br_longdelay4_20_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	setx 0x652c86ffe3fecb95, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte_20_28:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aaca4a  ! 48: FCMPd	fcmpd	%fcc<n>, %f42, %f10
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_20_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdf903d4772088b49, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d90c006  ! 51: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
	.word 0xe63fe0c6  ! 52: STD_I	std	%r19, [%r31 + 0x00c6]
	.word 0xa784fac8  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x1ac8, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d903bd1  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1bd1, %pstate
splash_tba_20_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
unsupttte_20_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3a489a1  ! 57: FDIVs	fdivs	%f18, %f1, %f17
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_20_35:
	nop
	.word 0xe89fc029  ! 59: LDDA_R	ldda	[%r31, %r9] 0x01, %r20
	.word 0xe8cfe1b8  ! 60: LDSBA_I	ldsba	[%r31, + 0x01b8] %asi, %r20
	.word 0xa3703972  ! 61: POPC_I	popc	0x1972, %r17
ceter_20_37:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 62: RDTICK	rd	%tick, %r10
	.word 0xd31fe030  ! 63: LDDF_I	ldd	[%r31, 0x0030], %f9
mondo_20_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94400d  ! 64: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
	bg,a	 skip_20_40
	fbl skip_20_40
.align 2048
skip_20_40:
	.word 0xc30fc000  ! 65: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_20_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 66: FDIVs	fdivs	%f0, %f4, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_42:
	rd %pc, %r12
	add %r12, (donretarg_20_42-donret_20_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c5d700 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfc9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_42:
	.word 0xd26fe080  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x0080]
ibp_20_43:
	nop
	.word 0xa7a4c9b0  ! 68: FDIVs	fdivs	%f19, %f16, %f19
splash_tba_20_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_20_45:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe180  ! 71: LDXA_I	ldxa	[%r31, + 0x0180] %asi, %r19
	.word 0xe737e0c1  ! 72: STQF_I	-	%f19, [0x00c1, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x16b2, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b4c7c3  ! 74: PDIST	pdistn	%d50, %d34, %d16
	.word 0xd22fe174  ! 75: STB_I	stb	%r9, [%r31 + 0x0174]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9194c013  ! 77: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0xd29fe050  ! 78: LDDA_I	ldda	[%r31, + 0x0050] %asi, %r9
	.word 0x83d02033  ! 79: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_20_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_20_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x32f6c0d2643b6bae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e192  ! 84: STQF_I	-	%f9, [0x0192, %r31]
memptr_20_51:
	set user_data_start, %r31
	.word 0x85843954  ! 85: WRCCR_I	wr	%r16, 0x1954, %ccr
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_20_52:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xb83f66312b07aaa2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_20_54:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_55:
	nop
	setx 0xfffff0e3fffffead, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd28008a0  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
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
    brnz %r10, cwq_20_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_56
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
cwq_20_56:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 93: RDPC	rd	%pc, %r18
brcommon3_20_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe1f0  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x01f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe09fc032  ! 94: LDDA_R	ldda	[%r31, %r18] 0x01, %r16
splash_lsu_20_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x8afad2ee, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 96: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
ibp_20_60:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdb60  ! 97: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fdc00  ! 98: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, cwq_20_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_61
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
cwq_20_61:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 99: RDPC	rd	%pc, %r18
	.word 0xdb37e124  ! 100: STQF_I	-	%f13, [0x0124, %r31]
	.word 0xc3ec0032  ! 101: PREFETCHA_R	prefetcha	[%r16, %r18] 0x01, #one_read
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_20_64:
    set user_data_start, %o7
	.word 0x93902003  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_20_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x306bbf04, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x0c098d9c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_20_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82fe8  ! 106: PREFETCHA_I	prefetcha	[%r0, + 0x0fe8] %asi, #one_read
ibp_20_68:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec002a  ! 107: PREFETCHA_R	prefetcha	[%r16, %r10] 0x01, #one_read
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_20_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x06f3ff2907523cda, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 110: CASA_R	casa	[%r31] %asi, %r18, %r11
	.word 0xe1bfe060  ! 111: STDFA_I	stda	%f16, [0x0060, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_72:
	rd %pc, %r12
	add %r12, (donretarg_20_72-donret_20_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000fa900 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x897, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_72:
	.word 0x9ba409cb  ! 112: FDIVd	fdivd	%f16, %f42, %f44
ibp_20_73:
	nop
	.word 0xc32fc011  ! 113: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0xc1bfdb60  ! 114: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d903172  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1172, %pstate
	.word 0x87802058  ! 116: WRASI_I	wr	%r0, 0x0058, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_76) + 40, 16, 16)) -> intp(2,0,8)
#else
	setx 0x993df71598200c8f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_20_77:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5702f2f  ! 118: POPC_I	popc	0x0f2f, %r18
	.word 0x91d02035  ! 119: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_20_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d920014  ! 120: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
ibp_20_79:
	nop
	.word 0xe19fe1a0  ! 121: LDDFA_I	ldda	[%r31, 0x01a0], %f16
ibp_20_80:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3eac023  ! 122: PREFETCHA_R	prefetcha	[%r11, %r3] 0x01, #one_read
	.word 0x8d802004  ! 123: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_20_81:
	ta T_CHANGE_NONHPRIV
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x81982d94  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d94, %hpstate
ibp_20_82:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc008  ! 125: STXFSR_R	st-sfr	%f1, [%r8, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_83:
	rd %pc, %r12
	add %r12, (donretarg_20_83-donret_20_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00228a00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x655, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_20_83:
	.word 0x25400001  ! 126: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd1e7e00b  ! 127: CASA_R	casa	[%r31] %asi, %r11, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_20_85:
	set 0x60540000, %r31
	.word 0x85833144  ! 130: WRCCR_I	wr	%r12, 0x1144, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_20_86:
	nop
	.word 0xc1bfe020  ! 132: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xa7a00170  ! 133: FABSq	dis not found

	.word 0xdad7e128  ! 134: LDSHA_I	ldsha	[%r31, + 0x0128] %asi, %r13
	brz,pt  	%r5, skip_20_88
	bvs  	 skip_20_88
.align 1024
skip_20_88:
	.word 0x24cb0001  ! 135: BRLEZ	brlez,a,pt	%r12,<label_0xb0001>
fpinit_20_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 136: FCMPd	fcmpd	%fcc<n>, %f0, %f4
br_badelay2_20_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b20306  ! 137: ALIGNADDRESS	alignaddr	%r8, %r6, %r11
	.word 0xe137e11a  ! 138: STQF_I	-	%f16, [0x011a, %r31]
fpinit_20_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 139: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d9036ff  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x16ff, %pstate
ibp_20_93:
	nop
	.word 0xc3ec402d  ! 141: PREFETCHA_R	prefetcha	[%r17, %r13] 0x01, #one_read
	.word 0x95a000d0  ! 142: FNEGd	fnegd	%f16, %f10
    set 0x1e57, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b4c7c2  ! 143: PDIST	pdistn	%d50, %d2, %d16
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 144: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_20_95:
	set 0x60340000, %r31
	.word 0x8584edbc  ! 146: WRCCR_I	wr	%r19, 0x0dbc, %ccr
dvapa_20_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdfb, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc010  ! 147: STDF_R	std	%f19, [%r16, %r31]
	.word 0xa7844001  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r1, %-
	.word 0xe637e178  ! 149: STH_I	sth	%r19, [%r31 + 0x0178]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_98) + 32, 16, 16)) -> intp(0,0,31)
#else
	setx 0x72c6476983d61638, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8d19a04437ee58bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800bc0  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	.word 0xe62fe0dc  ! 153: STB_I	stb	%r19, [%r31 + 0x00dc]
mondo_20_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d924011  ! 154: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0x9950c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_20_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe7150004  ! 1: LDQF_R	-	[%r20, %r4], %f19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe000  ! 157: LDDFA_I	ldda	[%r31, 0x0000], %f16
tagged_20_102:
	tsubcctv %r4, 0x1358, %r17
	.word 0xd407e12c  ! 158: LDUW_I	lduw	[%r31 + 0x012c], %r10
splash_cmpr_20_103:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c033  ! 160: CASA_I	casa	[%r31] 0x 1, %r19, %r10
br_longdelay2_20_104:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x24cfc001  ! 161: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
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
    brnz %r10, cwq_20_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_105
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
cwq_20_105:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 162: RDPC	rd	%pc, %r16
splash_hpstate_20_106:
	ta T_CHANGE_NONHPRIV
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982b8f  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8f, %hpstate
trapasi_20_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4c04b40  ! 164: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r10
	.word 0xc1bfe180  ! 165: STDFA_I	stda	%f0, [0x0180, %r31]
splash_hpstate_20_108:
	ta T_CHANGE_NONHPRIV
	.word 0x819820dd  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 168: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd43fe1c0  ! 169: STD_I	std	%r10, [%r31 + 0x01c0]
jmptr_20_109:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_110:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xe19fe160  ! 173: LDDFA_I	ldda	[%r31, 0x0160], %f16
	.word 0xd51fe048  ! 174: LDDF_I	ldd	[%r31, 0x0048], %f10
	.word 0xd44fe1b8  ! 175: LDSB_I	ldsb	[%r31 + 0x01b8], %r10
	.word 0x91934013  ! 176: WRPR_PIL_R	wrpr	%r13, %r19, %pil
trapasi_20_113:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4904980  ! 177: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r10
intveclr_20_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb6d5358f9182465d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_20_115:
	nop
	.word 0xe19fdc00  ! 179: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_20_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_116
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
cwq_20_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 181: RDPC	rd	%pc, %r16
splash_cmpr_20_117:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 182: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_20_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4ae8310246683cd0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe0a8  ! 184: LDXA_I	ldxa	[%r31, + 0x00a8] %asi, %r16
intveclr_20_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x89e0f53a818c82b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_120) + 32, 16, 16)) -> intp(2,0,14)
#else
	setx 0xe0c95aa21fabee2d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0xf0c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b4c7d3  ! 187: PDIST	pdistn	%d50, %d50, %d50
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7820012  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r18, %-
	.word 0xda97e1e8  ! 190: LDUHA_I	lduha	[%r31, + 0x01e8] %asi, %r13
	.word 0x879ce990  ! 191: WRHPR_HINTP_I	wrhpr	%r19, 0x0990, %hintp
	.word 0x83d02034  ! 192: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa7810014  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r20, %-
dvapa_20_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdbf, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a51  ! 194: FCMPd	fcmpd	%fcc<n>, %f48, %f48
brcommon3_20_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd29fc02d  ! 195: LDDA_R	ldda	[%r31, %r13] 0x01, %r9
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_20_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f2, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b147cc  ! 197: PDIST	pdistn	%d36, %d12, %d42
memptr_20_126:
	set user_data_start, %r31
	.word 0x8584fa7c  ! 198: WRCCR_I	wr	%r19, 0x1a7c, %ccr
	.word 0xc1bfc2c0  ! 199: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_20_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0c84e60  ! 200: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_129:
	ta	T_CHANGE_NONHPRIV	! macro
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe19fdb60  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe08008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e0b  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1e0b, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_2) + 56, 16, 16)) -> intp(7,0,19)
#else
	setx 0xa587d25567803154, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_10_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xab3a8358, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
	.word 0xa784800b  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r11, %-
fpinit_10_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 13: FDIVd	fdivd	%f0, %f4, %f8
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879c4009  ! 15: WRHPR_HINTP_R	wrhpr	%r17, %r9, %hintp
	.word 0xa5703641  ! 16: POPC_I	popc	0x1641, %r18
	.word 0x87802058  ! 17: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa7a109aa  ! 18: FDIVs	fdivs	%f4, %f10, %f19
	.word 0xa9a00161  ! 19: FABSq	dis not found

	.word 0xe49fe0c0  ! 20: LDDA_I	ldda	[%r31, + 0x00c0] %asi, %r18
	.word 0xe44fe148  ! 21: LDSB_I	ldsb	[%r31 + 0x0148], %r18
memptr_10_8:
	set 0x60340000, %r31
	.word 0x85837b95  ! 22: WRCCR_I	wr	%r13, 0x1b95, %ccr
splash_tba_10_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
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
	.word 0xa9414000  ! 24: RDPC	rd	%pc, %r20
	.word 0x8d903b5d  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1b5d, %pstate
brcommon1_10_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702190  ! 1: POPC_I	popc	0x0190, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9a449c9  ! 26: FDIVd	fdivd	%f48, %f40, %f20
intveclr_10_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1c1a7285575e7b55, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_10_14:
	nop
	ta T_CHANGE_HPRIV
	set 0xd6693bd4, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_10_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d4  ! 1: PDIST	pdistn	%d62, %d20, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x97703953  ! 30: POPC_I	popc	0x1953, %r11
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_10_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_10_18:
	nop
	.word 0xd11fe0c0  ! 33: LDDF_I	ldd	[%r31, 0x00c0], %f8
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e058  ! 35: LDSWA_I	ldswa	[%r31, + 0x0058] %asi, %r8
ibp_10_19:
	nop
	.word 0xd0dfc032  ! 36: LDXA_R	ldxa	[%r31, %r18] 0x01, %r8
splash_cmpr_10_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe19fe1c0  ! 38: LDDFA_I	ldda	[%r31, 0x01c0], %f16
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
    brnz %r10, cwq_10_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_21
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
cwq_10_21:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 39: RDPC	rd	%pc, %r16
unsupttte_10_22:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a209aa  ! 40: FDIVs	fdivs	%f8, %f10, %f10
jmptr_10_23:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe180  ! 43: LDXA_I	ldxa	[%r31, + 0x0180] %asi, %r19
	.word 0x99a189a1  ! 44: FDIVs	fdivs	%f6, %f1, %f12
	fblg,a,pn	%fcc0,  skip_10_25
	be,a	 skip_10_25
.align 128
skip_10_25:
	.word 0xa1a509c9  ! 45: FDIVd	fdivd	%f20, %f40, %f16
br_longdelay4_10_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	setx 0xa1b472e66b91a7a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte_10_28:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ab0a46  ! 48: FCMPd	fcmpd	%fcc<n>, %f12, %f6
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_10_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x645368b8f7623f00, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 51: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xe63fe030  ! 52: STD_I	std	%r19, [%r31 + 0x0030]
	.word 0xa781a83e  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x083e, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d902abe  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0abe, %pstate
splash_tba_10_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
unsupttte_10_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aaca53  ! 57: FCMPd	fcmpd	%fcc<n>, %f42, %f50
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_10_35:
	nop
	.word 0xe8bfc02a  ! 59: STDA_R	stda	%r20, [%r31 + %r10] 0x01
	.word 0xe8cfe1a8  ! 60: LDSBA_I	ldsba	[%r31, + 0x01a8] %asi, %r20
	.word 0xa3a509b0  ! 61: FDIVs	fdivs	%f20, %f16, %f17
ceter_10_37:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 62: RDTICK	rd	%tick, %r11
	.word 0xd297c02d  ! 63: LDUHA_R	lduha	[%r31, %r13] 0x01, %r9
mondo_10_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 64: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	brgz,pn  	%r5, skip_10_40
	brz,pt  	%r10, skip_10_40
.align 2048
skip_10_40:
	.word 0xd3e7c020  ! 65: CASA_I	casa	[%r31] 0x 1, %r0, %r9
fpinit_10_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 66: FDIVd	fdivd	%f0, %f4, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_42:
	rd %pc, %r12
	add %r12, (donretarg_10_42-donret_10_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00658400 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c43, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_42:
	.word 0xd26fe1e3  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x01e3]
ibp_10_43:
	nop
	.word 0x91b507d0  ! 68: PDIST	pdistn	%d20, %d16, %d8
splash_tba_10_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_10_45:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe1a0  ! 71: LDXA_I	ldxa	[%r31, + 0x01a0] %asi, %r19
	.word 0xe737e0f1  ! 72: STQF_I	-	%f19, [0x00f1, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x3b64, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b207c4  ! 74: PDIST	pdistn	%d8, %d4, %d16
	.word 0xd22fe137  ! 75: STB_I	stb	%r9, [%r31 + 0x0137]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9194800d  ! 77: WRPR_PIL_R	wrpr	%r18, %r13, %pil
	.word 0xd3e7e012  ! 78: CASA_R	casa	[%r31] %asi, %r18, %r9
	.word 0x91d02033  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_10_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_10_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0x153ff68237553918, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e130  ! 84: STQF_I	-	%f9, [0x0130, %r31]
memptr_10_51:
	set user_data_start, %r31
	.word 0x8581f452  ! 85: WRCCR_I	wr	%r7, 0x1452, %ccr
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_10_52:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xdc2e0ebd727a68f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_10_54:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_55:
	nop
	setx 0xfffff5d0fffff424, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd2800ba0  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
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
    brnz %r10, cwq_10_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_56
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
cwq_10_56:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 93: RDPC	rd	%pc, %r19
brcommon3_10_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe1e0  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x01e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe09fc028  ! 94: LDDA_R	ldda	[%r31, %r8] 0x01, %r16
splash_lsu_10_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x6ae4293b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d930008  ! 96: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
ibp_10_60:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd920  ! 97: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fdb60  ! 98: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, cwq_10_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_61
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
cwq_10_61:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 99: RDPC	rd	%pc, %r9
	.word 0xdb37e0fa  ! 100: STQF_I	-	%f13, [0x00fa, %r31]
	.word 0xa9702fe8  ! 101: POPC_I	popc	0x0fe8, %r20
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_10_64:
    set user_data_start, %o7
	.word 0x93902004  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_10_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xe46b03ae, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xe2a9818f, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_10_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 106: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ibp_10_68:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87acca49  ! 107: FCMPd	fcmpd	%fcc<n>, %f50, %f40
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_10_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0xed6a6e9ebab02557, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00b  ! 110: CASA_R	casa	[%r31] %asi, %r11, %r11
	.word 0xc1bfe040  ! 111: STDFA_I	stda	%f0, [0x0040, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_72:
	rd %pc, %r12
	add %r12, (donretarg_10_72-donret_10_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004cd600 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x41d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_72:
	.word 0xa9a409d0  ! 112: FDIVd	fdivd	%f16, %f16, %f20
ibp_10_73:
	nop
	.word 0xd3e7e010  ! 113: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xe19fe1e0  ! 114: LDDFA_I	ldda	[%r31, 0x01e0], %f16
	.word 0x8d9036cd  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x16cd, %pstate
	.word 0x87802083  ! 116: WRASI_I	wr	%r0, 0x0083, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_76) + 48, 16, 16)) -> intp(1,0,31)
#else
	setx 0xf21ea6f0853b3714, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_10_77:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a489a3  ! 118: FDIVs	fdivs	%f18, %f3, %f18
	.word 0x93d02033  ! 119: Tcc_I	tne	icc_or_xcc, %r0 + 51
mondo_10_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d940008  ! 120: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
ibp_10_79:
	nop
	.word 0xc1bfe180  ! 121: STDFA_I	stda	%f0, [0x0180, %r31]
ibp_10_80:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb0034  ! 122: PREFETCHA_R	prefetcha	[%r12, %r20] 0x01, #one_read
	.word 0x8d802004  ! 123: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_10_81:
	ta T_CHANGE_NONHPRIV
	.word 0x2ac9c001  ! 1: BRNZ	brnz,a,pt	%r7,<label_0x9c001>
	.word 0x819826b7  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06b7, %hpstate
ibp_10_82:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd11fc012  ! 125: LDDF_R	ldd	[%r31, %r18], %f8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_83:
	rd %pc, %r12
	add %r12, (donretarg_10_83-donret_10_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ca2a00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ed9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_83:
	.word 0x26cc0001  ! 126: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0xd0bfc031  ! 127: STDA_R	stda	%r8, [%r31 + %r17] 0x01
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_10_85:
	set 0x60340000, %r31
	.word 0x8584b211  ! 130: WRCCR_I	wr	%r18, 0x1211, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_10_86:
	nop
	.word 0xc1bfe180  ! 132: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0xa3a00166  ! 133: FABSq	dis not found

	.word 0xdad7e058  ! 134: LDSHA_I	ldsha	[%r31, + 0x0058] %asi, %r13
	bcs  	 skip_10_88
	be  	 skip_10_88
.align 1024
skip_10_88:
	.word 0x93a449c5  ! 135: FDIVd	fdivd	%f48, %f36, %f40
fpinit_10_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 136: FDIVs	fdivs	%f0, %f4, %f8
br_badelay2_10_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b08301  ! 137: ALIGNADDRESS	alignaddr	%r2, %r1, %r10
	.word 0xe137e070  ! 138: STQF_I	-	%f16, [0x0070, %r31]
fpinit_10_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8273e  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x073e] %asi, #one_read
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903cf5  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x1cf5, %pstate
ibp_10_93:
	nop
	.word 0xa5b14492  ! 141: FCMPLE32	fcmple32	%d36, %d18, %r18
	.word 0xa7a000c9  ! 142: FNEGd	fnegd	%f40, %f50
    set 0x2ad1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb187cc  ! 143: PDIST	pdistn	%d6, %d12, %d44
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_10_95:
	set 0x60340000, %r31
	.word 0x8584a96f  ! 146: WRCCR_I	wr	%r18, 0x096f, %ccr
dvapa_10_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ed, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 147: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xa784c003  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r3, %-
	.word 0xe637e0e6  ! 149: STH_I	sth	%r19, [%r31 + 0x00e6]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_98) + 40, 16, 16)) -> intp(4,0,4)
#else
	setx 0x2155ddce77765283, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0x02616b63abb65de4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800b40  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r19
	.word 0xe62fe15f  ! 153: STB_I	stb	%r19, [%r31 + 0x015f]
mondo_10_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d91000a  ! 154: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
	.word 0xa750c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_10_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91b7c70b  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f11, %d8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fc3e0  ! 157: LDDFA_R	ldda	[%r31, %r0], %f0
tagged_10_102:
	tsubcctv %r19, 0x10d7, %r16
	.word 0xd407e05c  ! 158: LDUW_I	lduw	[%r31 + 0x005c], %r10
splash_cmpr_10_103:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c034  ! 160: CASA_I	casa	[%r31] 0x 1, %r20, %r10
br_longdelay2_10_104:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x24cfc001  ! 161: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
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
    brnz %r10, cwq_10_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_105
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
cwq_10_105:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 162: RDPC	rd	%pc, %r17
splash_hpstate_10_106:
	ta T_CHANGE_NONHPRIV
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8198398b  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x198b, %hpstate
trapasi_10_107:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4d04b40  ! 164: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r10
	.word 0xc1bfe020  ! 165: STDFA_I	stda	%f0, [0x0020, %r31]
splash_hpstate_10_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81983cd6  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd6, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd43fe119  ! 169: STD_I	std	%r10, [%r31 + 0x0119]
jmptr_10_109:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_110:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xe19fdf20  ! 173: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd51fe000  ! 174: LDDF_I	ldd	[%r31, 0x0000], %f10
	.word 0xd44fe048  ! 175: LDSB_I	ldsb	[%r31 + 0x0048], %r10
	.word 0x9194800d  ! 176: WRPR_PIL_R	wrpr	%r18, %r13, %pil
trapasi_10_113:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d04980  ! 177: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r10
intveclr_10_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfd8b8390a1d93c08, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_10_115:
	nop
	.word 0xc1bfe020  ! 179: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_10_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_116
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
cwq_10_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 181: RDPC	rd	%pc, %r18
splash_cmpr_10_117:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 182: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_10_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5c7ec9eadd2b7c11, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe1b8  ! 184: LDXA_I	ldxa	[%r31, + 0x01b8] %asi, %r16
intveclr_10_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4b549685cb1180dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_120) + 48, 16, 16)) -> intp(2,0,31)
#else
	setx 0xa56892bc94cb678a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x1dfe, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b407c4  ! 187: PDIST	pdistn	%d16, %d4, %d16
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 188: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa7820007  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r7, %-
	.word 0xda97e008  ! 190: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r13
	.word 0x879b317e  ! 191: WRHPR_HINTP_I	wrhpr	%r12, 0x117e, %hintp
	.word 0x91d020b4  ! 192: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa781c004  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r4, %-
dvapa_10_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa45, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a98a52  ! 194: FCMPd	fcmpd	%fcc<n>, %f6, %f18
brcommon3_10_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd3e7e011  ! 195: CASA_R	casa	[%r31] %asi, %r17, %r9
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_10_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0x901, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80222c  ! 197: SIR	sir	0x022c
memptr_10_126:
	set user_data_start, %r31
	.word 0x8584a43a  ! 198: WRCCR_I	wr	%r18, 0x043a, %ccr
	.word 0xe19fc3e0  ! 199: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_10_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0d04e60  ! 200: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_129:
	ta	T_CHANGE_NONHPRIV	! macro
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe19fdf20  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe08008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033ce  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x13ce, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_2) + 16, 16, 16)) -> intp(3,0,11)
#else
	setx 0x873bc2ffa4dc00db, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_8_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xef623113, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
splash_decr_8_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7840012  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r18, %-
fpinit_8_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 13: FDIVs	fdivs	%f0, %f4, %f8
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 14: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879c400c  ! 15: WRHPR_HINTP_R	wrhpr	%r17, %r12, %hintp
	.word 0xa1703467  ! 16: POPC_I	popc	0x1467, %r16
	.word 0x8780208a  ! 17: WRASI_I	wr	%r0, 0x008a, %asi
iaw_8_6:
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
iaw_startwait8_6:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_6
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_6:
    brnz %r16, iaw_wait8_6
    ld [%r23], %r16
    ba iaw_startwait8_6
    mov 0x8, %r16
continue_iaw_8_6:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_6:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_6
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_6:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_6
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_6:
	mov 0x38, %r18
iaw4_8_6:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7b4848b  ! 18: FCMPLE32	fcmple32	%d18, %d42, %r19
	.word 0x9ba00170  ! 19: FABSq	dis not found

	.word 0xe49fe0b8  ! 20: LDDA_I	ldda	[%r31, + 0x00b8] %asi, %r18
	.word 0xe44fe1d0  ! 21: LDSB_I	ldsb	[%r31 + 0x01d0], %r18
memptr_8_8:
	set 0x60140000, %r31
	.word 0x8584eba3  ! 22: WRCCR_I	wr	%r19, 0x0ba3, %ccr
splash_tba_8_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
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
	.word 0xa1414000  ! 24: RDPC	rd	%pc, %r16
	.word 0x8d903a8a  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1a8a, %pstate
brcommon1_8_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702090  ! 1: POPC_I	popc	0x0090, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac8a4d  ! 26: FCMPd	fcmpd	%fcc<n>, %f18, %f44
intveclr_8_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2e1c9b9d88028234, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_8_14:
	nop
	ta T_CHANGE_HPRIV
	set 0x543c992b, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_8_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d3  ! 1: PDIST	pdistn	%d62, %d50, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93a089aa  ! 30: FDIVs	fdivs	%f2, %f10, %f9
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_8_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_8_18:
	nop
	.word 0xd11fc008  ! 33: LDDF_R	ldd	[%r31, %r8], %f8
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e190  ! 35: LDSWA_I	ldswa	[%r31, + 0x0190] %asi, %r8
ibp_8_19:
	nop
	.word 0xd0dfc034  ! 36: LDXA_R	ldxa	[%r31, %r20] 0x01, %r8
splash_cmpr_8_20:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 37: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe19fe0a0  ! 38: LDDFA_I	ldda	[%r31, 0x00a0], %f16
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
    brnz %r10, cwq_8_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_21
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
cwq_8_21:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 39: RDPC	rd	%pc, %r17
unsupttte_8_22:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba089b3  ! 40: FDIVs	fdivs	%f2, %f19, %f13
jmptr_8_23:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x93508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe098  ! 43: LDXA_I	ldxa	[%r31, + 0x0098] %asi, %r19
iaw_8_24:
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
iaw_startwait8_24:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_24
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_24:
    brnz %r16, iaw_wait8_24
    ld [%r23], %r16
    ba iaw_startwait8_24
    mov 0x8, %r16
continue_iaw_8_24:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_24:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_24
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_24:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_24
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_24:
	mov 0x38, %r18
iaw0_8_24:
	rd %pc, %r19
	add %r19, (16+1), %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99b28482  ! 44: FCMPLE32	fcmple32	%d10, %d2, %r12
	ba,a	 skip_8_25
	fbul skip_8_25
.align 128
skip_8_25:
	.word 0xc36cbc29  ! 45: PREFETCH_I	prefetch	[%r18 + 0xfffffc29], #one_read
br_longdelay4_8_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	setx 0x9f0a55e5dc840f57, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte_8_28:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba309b1  ! 48: FDIVs	fdivs	%f12, %f17, %f13
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_8_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x32360dbf98097d70, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 51: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xe63fe050  ! 52: STD_I	std	%r19, [%r31 + 0x0050]
	.word 0xa7846d7b  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x0d7b, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902611  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0611, %pstate
splash_tba_8_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
unsupttte_8_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a94a46  ! 57: FCMPd	fcmpd	%fcc<n>, %f36, %f6
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_8_35:
	nop
	.word 0xe8bfc034  ! 59: STDA_R	stda	%r20, [%r31 + %r20] 0x01
	.word 0xe8cfe060  ! 60: LDSBA_I	ldsba	[%r31, + 0x0060] %asi, %r20
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
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3b187d3  ! 61: PDIST	pdistn	%d6, %d50, %d48
ceter_8_37:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 62: RDTICK	rd	%tick, %r16
iaw_8_38:
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
iaw_startwait8_38:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_38
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_38:
    brnz %r16, iaw_wait8_38
    ld [%r23], %r16
    ba iaw_startwait8_38
    mov 0x8, %r16
continue_iaw_8_38:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_38:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_38
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_38:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_38
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_38:
	mov 0x38, %r18
iaw4_8_38:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e014  ! 63: CASA_R	casa	[%r31] %asi, %r20, %r9
mondo_8_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 64: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	bg,a	 skip_8_40
	fble skip_8_40
.align 2048
skip_8_40:
	.word 0xd23fc000  ! 65: STD_R	std	%r9, [%r31 + %r0]
fpinit_8_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 66: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_42:
	rd %pc, %r12
	add %r12, (donretarg_8_42-donret_8_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002f4d00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15ce, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_42:
	.word 0xd26fe055  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x0055]
ibp_8_43:
	nop
	.word 0xa1a449b1  ! 68: FDIVs	fdivs	%f17, %f17, %f16
splash_tba_8_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_8_45:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe1a8  ! 71: LDXA_I	ldxa	[%r31, + 0x01a8] %asi, %r19
	.word 0xe737e0a8  ! 72: STQF_I	-	%f19, [0x00a8, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x3ccf, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b507d2  ! 74: PDIST	pdistn	%d20, %d18, %d42
	.word 0xd22fe0f7  ! 75: STB_I	stb	%r9, [%r31 + 0x00f7]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9190c004  ! 77: WRPR_PIL_R	wrpr	%r3, %r4, %pil
iaw_8_47:
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
iaw_startwait8_47:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_47
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_47:
    brnz %r16, iaw_wait8_47
    ld [%r23], %r16
    ba iaw_startwait8_47
    mov 0x8, %r16
continue_iaw_8_47:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_47:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_47
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_47:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_47
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_47:
	mov 0x38, %r18
iaw4_8_47:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd31fe1e0  ! 78: LDDF_I	ldd	[%r31, 0x01e0], %f9
	.word 0x93d02032  ! 79: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_8_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_8_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfc30ea0a6a3887bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e04a  ! 84: STQF_I	-	%f9, [0x004a, %r31]
memptr_8_51:
	set user_data_start, %r31
	.word 0x8581201a  ! 85: WRCCR_I	wr	%r4, 0x001a, %ccr
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_8_52:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xe0b2c2274147251f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_8_54:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_55:
	nop
	setx 0xfffffa4efffff001, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd2800c60  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
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
    brnz %r10, cwq_8_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_56
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
cwq_8_56:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 93: RDPC	rd	%pc, %r13
brcommon3_8_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe0f0  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x00f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe09fe000  ! 94: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
splash_lsu_8_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x6a6fb0b4, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d920005  ! 96: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
ibp_8_60:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe000  ! 97: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0xc19fd920  ! 98: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, cwq_8_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_61
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
cwq_8_61:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 99: RDPC	rd	%pc, %r8
	.word 0xdb37e09c  ! 100: STQF_I	-	%f13, [0x009c, %r31]
iaw_8_62:
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
iaw_startwait8_62:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_62
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_62:
    brnz %r16, iaw_wait8_62
    ld [%r23], %r16
    ba iaw_startwait8_62
    mov 0x8, %r16
continue_iaw_8_62:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_62:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_62
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_62:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_62
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_62:
	mov 0x38, %r18
iaw4_8_62:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a289a3  ! 101: FDIVs	fdivs	%f10, %f3, %f8
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_8_64:
    set user_data_start, %o7
	.word 0x93902005  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_8_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xd8e50aa5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x45d4437d, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_8_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 106: FDIVs	fdivs	%f0, %f4, %f6
ibp_8_68:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a309b1  ! 107: FDIVs	fdivs	%f12, %f17, %f18
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_8_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x21fb51e43fba7450, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 110: CASA_R	casa	[%r31] %asi, %r19, %r11
	.word 0xe1bfe180  ! 111: STDFA_I	stda	%f16, [0x0180, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_72:
	rd %pc, %r12
	add %r12, (donretarg_8_72-donret_8_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x1500 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb97, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	retry
donretarg_8_72:
	.word 0x97a509d0  ! 112: FDIVd	fdivd	%f20, %f16, %f42
ibp_8_73:
	nop
	.word 0xd31fe060  ! 113: LDDF_I	ldd	[%r31, 0x0060], %f9
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
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8d90292f  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x092f, %pstate
	.word 0x87802082  ! 116: WRASI_I	wr	%r0, 0x0082, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_76) + 48, 16, 16)) -> intp(1,0,22)
#else
	setx 0xdf2013c9df9adf58, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_8_77:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa7a409c5  ! 118: FDIVd	fdivd	%f16, %f36, %f50
	.word 0x91d02032  ! 119: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_8_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d908001  ! 120: WRPR_WSTATE_R	wrpr	%r2, %r1, %wstate
ibp_8_79:
	nop
	.word 0xe19fe100  ! 121: LDDFA_I	ldda	[%r31, 0x0100], %f16
ibp_8_80:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1702f2f  ! 122: POPC_I	popc	0x0f2f, %r16
	.word 0x8d802000  ! 123: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_8_81:
	ta T_CHANGE_NONHPRIV
	.word 0x22cc4001  ! 1: BRZ	brz,a,pt	%r17,<label_0xc4001>
	.word 0x819836cd  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16cd, %hpstate
ibp_8_82:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc009  ! 125: STDF_R	std	%f8, [%r9, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_83:
	rd %pc, %r12
	add %r12, (donretarg_8_83-donret_8_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e98e00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9cb, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_8_83:
	.word 0x3c800001  ! 126: BPOS	bpos,a	<label_0x1>
iaw_8_84:
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
iaw_startwait8_84:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_84
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_84:
    brnz %r16, iaw_wait8_84
    ld [%r23], %r16
    ba iaw_startwait8_84
    mov 0x8, %r16
continue_iaw_8_84:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_84:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_84
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_84:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_84
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_84:
	mov 0x38, %r18
iaw2_8_84:
	rdpr %tba, %r19
	mov 0x11,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd09fc033  ! 127: LDDA_R	ldda	[%r31, %r19] 0x01, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_8_85:
	set 0x60340000, %r31
	.word 0x85847284  ! 130: WRCCR_I	wr	%r17, 0x1284, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_8_86:
	nop
	.word 0xe19fde00  ! 132: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9a00174  ! 133: FABSq	dis not found

	.word 0xdad7e130  ! 134: LDSHA_I	ldsha	[%r31, + 0x0130] %asi, %r13
	fblg skip_8_88
	bl  	 skip_8_88
.align 1024
skip_8_88:
	.word 0x39400001  ! 135: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 136: FDIVs	fdivs	%f0, %f4, %f8
br_badelay2_8_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa3b44311  ! 137: ALIGNADDRESS	alignaddr	%r17, %r17, %r17
	.word 0xe137e05a  ! 138: STQF_I	-	%f16, [0x005a, %r31]
fpinit_8_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 139: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d90382e  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x182e, %pstate
ibp_8_93:
	nop
	.word 0xc3ec8022  ! 141: PREFETCHA_R	prefetcha	[%r18, %r2] 0x01, #one_read
	.word 0x9ba000cb  ! 142: FNEGd	fnegd	%f42, %f44
    set 0x3e79, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b487d2  ! 143: PDIST	pdistn	%d18, %d18, %d10
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 144: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_8_95:
	set 0x60340000, %r31
	.word 0x8584275f  ! 146: WRCCR_I	wr	%r16, 0x075f, %ccr
dvapa_8_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf6f, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6dfc033  ! 147: LDXA_R	ldxa	[%r31, %r19] 0x01, %r19
splash_decr_8_97:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7808013  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r19, %-
	.word 0xe637e0b8  ! 149: STH_I	sth	%r19, [%r31 + 0x00b8]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_98) + 40, 16, 16)) -> intp(0,0,26)
#else
	setx 0x85373312c419a067, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7c0570486605b9d5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800bc0  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	.word 0xe62fe02a  ! 153: STB_I	stb	%r19, [%r31 + 0x002a]
mondo_8_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 154: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x9b50c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_8_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe3148009  ! 1: LDQF_R	-	[%r18, %r9], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd920  ! 157: STDFA_R	stda	%f0, [%r0, %r31]
tagged_8_102:
	tsubcctv %r19, 0x12c0, %r2
	.word 0xd407e054  ! 158: LDUW_I	lduw	[%r31 + 0x0054], %r10
splash_cmpr_8_103:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c031  ! 160: CASA_I	casa	[%r31] 0x 1, %r17, %r10
br_longdelay2_8_104:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87afca51  ! 161: FCMPd	fcmpd	%fcc<n>, %f62, %f48
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
    brnz %r10, cwq_8_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_105
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
cwq_8_105:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 162: RDPC	rd	%pc, %r19
splash_hpstate_8_106:
	ta T_CHANGE_NONHPRIV
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x81982dc4  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc4, %hpstate
trapasi_8_107:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4c04b40  ! 164: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r10
	.word 0xe1bfe080  ! 165: STDFA_I	stda	%f16, [0x0080, %r31]
splash_hpstate_8_108:
	ta T_CHANGE_NONHPRIV
	.word 0x8198355d  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x155d, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd43fe020  ! 169: STD_I	std	%r10, [%r31 + 0x0020]
jmptr_8_109:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_110:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
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
	.word 0xe1bfdb60  ! 173: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd51fe168  ! 174: LDDF_I	ldd	[%r31, 0x0168], %f10
	.word 0xd44fe100  ! 175: LDSB_I	ldsb	[%r31 + 0x0100], %r10
	.word 0x91924011  ! 176: WRPR_PIL_R	wrpr	%r9, %r17, %pil
trapasi_8_113:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d04980  ! 177: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r10
intveclr_8_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf4a6c275e792f059, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_8_115:
	nop
	.word 0xc19fe000  ! 179: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_8_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_116
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
cwq_8_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 181: RDPC	rd	%pc, %r16
splash_cmpr_8_117:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 182: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_8_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdb0450b78dcbb1ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe0a0  ! 184: LDXA_I	ldxa	[%r31, + 0x00a0] %asi, %r16
intveclr_8_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1442cbfd995c1bc2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_120) + 8, 16, 16)) -> intp(3,0,13)
#else
	setx 0xd6411c2f9f5b8a7c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x15b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb447d4  ! 187: PDIST	pdistn	%d48, %d20, %d44
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_8_121:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7844014  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
	.word 0xda97e040  ! 190: LDUHA_I	lduha	[%r31, + 0x0040] %asi, %r13
	.word 0x879ce921  ! 191: WRHPR_HINTP_I	wrhpr	%r19, 0x0921, %hintp
	.word 0x83d02035  ! 192: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_decr_8_122:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa781c00c  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r12, %-
dvapa_8_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf93, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91a289a8  ! 194: FDIVs	fdivs	%f10, %f8, %f8
brcommon3_8_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd29fc034  ! 195: LDDA_R	ldda	[%r31, %r20] 0x01, %r9
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_8_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdda, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3b247d4  ! 197: PDIST	pdistn	%d40, %d20, %d48
memptr_8_126:
	set user_data_start, %r31
	.word 0x8584a624  ! 198: WRCCR_I	wr	%r18, 0x0624, %ccr
iaw_8_127:
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
iaw_startwait8_127:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_127
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_127:
    brnz %r16, iaw_wait8_127
    ld [%r23], %r16
    ba iaw_startwait8_127
    mov 0x8, %r16
continue_iaw_8_127:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_127
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_127:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_127
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_127:
	mov 0x38, %r18
iaw4_8_127:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe160  ! 199: LDDFA_I	ldda	[%r31, 0x0160], %f16
trapasi_8_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0904e60  ! 200: LDUHA_R	lduha	[%r1, %r0] 0x73, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_129:
	ta	T_CHANGE_NONHPRIV	! macro
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe19fda00  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe0800b20  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 5: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x22c98001  ! 1: BRZ	brz,a,pt	%r6,<label_0x98001>
	.word 0x8d90359d  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x159d, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_2) + 8, 16, 16)) -> intp(6,0,12)
#else
	setx 0xf9022915486c79ce, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_4_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x78ad10a6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
	.word 0xa7814008  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r8, %-
fpinit_4_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8366f  ! 13: PREFETCHA_I	prefetcha	[%r0, + 0xfffff66f] %asi, #one_read
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879a800a  ! 15: WRHPR_HINTP_R	wrhpr	%r10, %r10, %hintp
	.word 0x95703fd4  ! 16: POPC_I	popc	0x1fd4, %r10
	.word 0x87802058  ! 17: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa5a1c9a9  ! 18: FDIVs	fdivs	%f7, %f9, %f18
	.word 0xa5a00169  ! 19: FABSq	dis not found

	.word 0xe49fe000  ! 20: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r18
	.word 0xe44fe0e0  ! 21: LDSB_I	ldsb	[%r31 + 0x00e0], %r18
memptr_4_8:
	set 0x60540000, %r31
	.word 0x85806023  ! 22: WRCCR_I	wr	%r1, 0x0023, %ccr
splash_tba_4_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
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
	.word 0x91414000  ! 24: RDPC	rd	%pc, %r8
	.word 0x8d9029db  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x09db, %pstate
brcommon1_4_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702020  ! 1: POPC_I	popc	0x0020, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a309d0  ! 26: FDIVd	fdivd	%f12, %f16, %f50
intveclr_4_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0154e99635e15282, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_4_14:
	nop
	ta T_CHANGE_HPRIV
	set 0xa1d50679, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 29: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_4_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d1  ! 1: PDIST	pdistn	%d62, %d48, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87a9ca54  ! 30: FCMPd	fcmpd	%fcc<n>, %f38, %f20
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_4_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_4_18:
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
ibp_startwait4_18:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_18
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_18:
    brnz %r16, ibp_wait4_18
    ld [%r23], %r16
    ba ibp_startwait4_18
    mov 0x4, %r16
continue_ibp_4_18:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_18:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_18
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_18:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_18
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_18:
    best_set_reg(0x00000050d0c00e5b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd1e7e012  ! 33: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e1d8  ! 35: LDSWA_I	ldswa	[%r31, + 0x01d8] %asi, %r8
ibp_4_19:
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
ibp_startwait4_19:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_19
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_19:
    brnz %r16, ibp_wait4_19
    ld [%r23], %r16
    ba ibp_startwait4_19
    mov 0x4, %r16
continue_ibp_4_19:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_19:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_19
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_19:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_19
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_19:
    best_set_reg(0x0000004099ce5b7c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc32fc012  ! 36: STXFSR_R	st-sfr	%f1, [%r18, %r31]
splash_cmpr_4_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc19fe0a0  ! 38: LDDFA_I	ldda	[%r31, 0x00a0], %f0
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
    brnz %r10, cwq_4_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_21
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
cwq_4_21:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 39: RDPC	rd	%pc, %r18
unsupttte_4_22:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3b2c48a  ! 40: FCMPLE32	fcmple32	%d42, %d10, %r17
jmptr_4_23:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe168  ! 43: LDXA_I	ldxa	[%r31, + 0x0168] %asi, %r19
	.word 0x93a489d1  ! 44: FDIVd	fdivd	%f18, %f48, %f40
	bvc  	 skip_4_25
	bge,a	 skip_4_25
.align 128
skip_4_25:
	.word 0xc3686eb9  ! 45: PREFETCH_I	prefetch	[%r1 + 0x0eb9], #one_read
br_longdelay4_4_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	setx 0x2329f954f38dfa3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte_4_28:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5b44490  ! 48: FCMPLE32	fcmple32	%d48, %d16, %r18
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_4_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc8ec7450355b0864, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d914012  ! 51: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0xe63fe071  ! 52: STD_I	std	%r19, [%r31 + 0x0071]
	.word 0xa780797d  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x197d, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d903508  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1508, %pstate
splash_tba_4_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
unsupttte_4_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1a489aa  ! 57: FDIVs	fdivs	%f18, %f10, %f16
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_4_35:
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
ibp_startwait4_35:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_35
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_35:
    brnz %r16, ibp_wait4_35
    ld [%r23], %r16
    ba ibp_startwait4_35
    mov 0x4, %r16
continue_ibp_4_35:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_35:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_35
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_35:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_35
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_35:
    best_set_reg(0x00000050f0db7c7a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe89fc02d  ! 59: LDDA_R	ldda	[%r31, %r13] 0x01, %r20
	.word 0xe8cfe178  ! 60: LDSBA_I	ldsba	[%r31, + 0x0178] %asi, %r20
	.word 0x87a98a52  ! 61: FCMPd	fcmpd	%fcc<n>, %f6, %f18
ceter_4_37:
    nop
    ta T_CHANGE_HPRIV
    mov 2, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 62: RDTICK	rd	%tick, %r10
	.word 0xd2dfc02d  ! 63: LDXA_R	ldxa	[%r31, %r13] 0x01, %r9
mondo_4_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d920011  ! 64: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	fble skip_4_40
	bl,a	 skip_4_40
.align 2048
skip_4_40:
	.word 0xc36fe14d  ! 65: PREFETCH_I	prefetch	[%r31 + 0x014d], #one_read
fpinit_4_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 66: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_42:
	rd %pc, %r12
	add %r12, (donretarg_4_42-donret_4_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008bf800 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f74, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_42:
	.word 0xd26fe1a5  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x01a5]
ibp_4_43:
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
ibp_startwait4_43:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_43
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_43:
    brnz %r16, ibp_wait4_43
    ld [%r23], %r16
    ba ibp_startwait4_43
    mov 0x4, %r16
continue_ibp_4_43:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_43:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_43
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_43:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_43
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_43:
    best_set_reg(0x0000004002fc7aa0,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa5a289b3  ! 68: FDIVs	fdivs	%f10, %f19, %f18
splash_tba_4_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_4_45:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe078  ! 71: LDXA_I	ldxa	[%r31, + 0x0078] %asi, %r19
	.word 0xe737e1f1  ! 72: STQF_I	-	%f19, [0x01f1, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x244b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b087d4  ! 74: PDIST	pdistn	%d2, %d20, %d50
	.word 0xd22fe180  ! 75: STB_I	stb	%r9, [%r31 + 0x0180]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9193400c  ! 77: WRPR_PIL_R	wrpr	%r13, %r12, %pil
	.word 0xd2bfc02c  ! 78: STDA_R	stda	%r9, [%r31 + %r12] 0x01
	.word 0x93d02033  ! 79: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_4_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe7880972600a6208, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e160  ! 84: STQF_I	-	%f9, [0x0160, %r31]
memptr_4_51:
	set user_data_start, %r31
	.word 0x85817319  ! 85: WRCCR_I	wr	%r5, 0x1319, %ccr
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 86: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_4_52:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xbcec3ee8a5f7afa8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_4_54:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_55:
	nop
	setx 0xfffff719fffff072, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd2800a80  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
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
    brnz %r10, cwq_4_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_56
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
cwq_4_56:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 93: RDPC	rd	%pc, %r12
brcommon3_4_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe1f0  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x01f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe11fc011  ! 94: LDDF_R	ldd	[%r31, %r17], %f16
splash_lsu_4_58:
	nop
	ta T_CHANGE_HPRIV
	set 0xe3dc0ee9, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d914014  ! 96: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
ibp_4_60:
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
ibp_startwait4_60:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_60
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_60:
    brnz %r16, ibp_wait4_60
    ld [%r23], %r16
    ba ibp_startwait4_60
    mov 0x4, %r16
continue_ibp_4_60:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_60:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_60
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_60:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_60
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_60:
    best_set_reg(0x000000402cfaa0f7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 97: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fc2c0  ! 98: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, cwq_4_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_61
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
cwq_4_61:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 99: RDPC	rd	%pc, %r12
	.word 0xdb37e174  ! 100: STQF_I	-	%f13, [0x0174, %r31]
	.word 0xa1a049a5  ! 101: FDIVs	fdivs	%f1, %f5, %f16
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_4_64:
    set user_data_start, %o7
	.word 0x93902001  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_4_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x8b6f95b4, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x36db950a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_4_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 106: FDIVs	fdivs	%f0, %f4, %f4
ibp_4_68:
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
ibp_startwait4_68:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_68
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_68:
    brnz %r16, ibp_wait4_68
    ld [%r23], %r16
    ba ibp_startwait4_68
    mov 0x4, %r16
continue_ibp_4_68:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_68:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_68
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_68:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_68
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_68:
    best_set_reg(0x00000040d9e0f7b7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a4c9d3  ! 107: FDIVd	fdivd	%f50, %f50, %f20
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_4_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x77abbaa2aadd7513, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 110: CASA_R	casa	[%r31] %asi, %r17, %r11
	.word 0xc1bfe0e0  ! 111: STDFA_I	stda	%f0, [0x00e0, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_72:
	rd %pc, %r12
	add %r12, (donretarg_4_72-donret_4_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00422500 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x171f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_72:
	.word 0x9ba2c9d0  ! 112: FDIVd	fdivd	%f42, %f16, %f44
ibp_4_73:
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
ibp_startwait4_73:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_73
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_73:
    brnz %r16, ibp_wait4_73
    ld [%r23], %r16
    ba ibp_startwait4_73
    mov 0x4, %r16
continue_ibp_4_73:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_73:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_73
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_73:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_73
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_73:
    best_set_reg(0x00000050a3f7b7e4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd23fe080  ! 113: STD_I	std	%r9, [%r31 + 0x0080]
	.word 0xc1bfe1c0  ! 114: STDFA_I	stda	%f0, [0x01c0, %r31]
	.word 0x8d9038ef  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x18ef, %pstate
	.word 0x8780208b  ! 116: WRASI_I	wr	%r0, 0x008b, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_76) + 0, 16, 16)) -> intp(0,0,21)
#else
	setx 0xfec32658d7f71aa3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_4_77:
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
ibp_startwait4_77:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_77
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_77:
    brnz %r16, ibp_wait4_77
    ld [%r23], %r16
    ba ibp_startwait4_77
    mov 0x4, %r16
continue_ibp_4_77:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_77:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_77
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_77:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_77
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_77:
    best_set_reg(0x00000040d0f7e476,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3b4c493  ! 118: FCMPLE32	fcmple32	%d50, %d50, %r17
	.word 0x93d02033  ! 119: Tcc_I	tne	icc_or_xcc, %r0 + 51
mondo_4_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 120: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
ibp_4_79:
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
ibp_startwait4_79:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_79
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_79:
    brnz %r16, ibp_wait4_79
    ld [%r23], %r16
    ba ibp_startwait4_79
    mov 0x4, %r16
continue_ibp_4_79:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_79:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_79
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_79:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_79
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_79:
    best_set_reg(0x00000050d6e476cd,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfda00  ! 121: STDFA_R	stda	%f16, [%r0, %r31]
ibp_4_80:
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
ibp_startwait4_80:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_80
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_80:
    brnz %r16, ibp_wait4_80
    ld [%r23], %r16
    ba ibp_startwait4_80
    mov 0x4, %r16
continue_ibp_4_80:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_80:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_80
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_80:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_80
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_80:
    best_set_reg(0x00000050a4f6cd3f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87acca51  ! 122: FCMPd	fcmpd	%fcc<n>, %f50, %f48
	.word 0x8d802004  ! 123: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_4_81:
	ta T_CHANGE_NONHPRIV
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81983b3d  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b3d, %hpstate
ibp_4_82:
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
ibp_startwait4_82:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_82
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_82:
    brnz %r16, ibp_wait4_82
    ld [%r23], %r16
    ba ibp_startwait4_82
    mov 0x4, %r16
continue_ibp_4_82:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_82:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_82
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_82:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_82
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_82:
    best_set_reg(0x00000040becd3f62,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc012  ! 125: STDF_R	std	%f8, [%r18, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_83:
	rd %pc, %r12
	add %r12, (donretarg_4_83-donret_4_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000c9200 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8e5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_83:
	.word 0x23400001  ! 126: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0xd09fc02a  ! 127: LDDA_R	ldda	[%r31, %r10] 0x01, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_4_85:
	set 0x60340000, %r31
	.word 0x85842477  ! 130: WRCCR_I	wr	%r16, 0x0477, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_4_86:
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
ibp_startwait4_86:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_86
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_86:
    brnz %r16, ibp_wait4_86
    ld [%r23], %r16
    ba ibp_startwait4_86
    mov 0x4, %r16
continue_ibp_4_86:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_86:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_86
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_86:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_86
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_86:
    best_set_reg(0x00000040e5ff62fd,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfd920  ! 132: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa5a0016a  ! 133: FABSq	dis not found

	.word 0xdad7e1e8  ! 134: LDSHA_I	ldsha	[%r31, + 0x01e8] %asi, %r13
	brgez,pt  	%r11, skip_4_88
	brz,a,pn	%r2, skip_4_88
.align 1024
skip_4_88:
	.word 0x39400001  ! 135: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 136: FDIVs	fdivs	%f0, %f4, %f6
br_badelay2_4_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa9b14312  ! 137: ALIGNADDRESS	alignaddr	%r5, %r18, %r20
	.word 0xe137e16c  ! 138: STQF_I	-	%f16, [0x016c, %r31]
fpinit_4_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8273e  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x073e] %asi, #one_read
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903591  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x1591, %pstate
ibp_4_93:
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
ibp_startwait4_93:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_93
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_93:
    brnz %r16, ibp_wait4_93
    ld [%r23], %r16
    ba ibp_startwait4_93
    mov 0x4, %r16
continue_ibp_4_93:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_93:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_93
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_93:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_93
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_93:
    best_set_reg(0x000000503ee2fdf4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa570394d  ! 141: POPC_I	popc	0x194d, %r18
	.word 0xa9a000d2  ! 142: FNEGd	fnegd	%f18, %f20
    set 0x3309, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b487c6  ! 143: PDIST	pdistn	%d18, %d6, %d16
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_4_95:
	set 0x60540000, %r31
	.word 0x8584ec62  ! 146: WRCCR_I	wr	%r19, 0x0c62, %ccr
dvapa_4_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc12, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc029  ! 147: STDA_R	stda	%r19, [%r31 + %r9] 0x01
	.word 0xa780c011  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r17, %-
	.word 0xe637e132  ! 149: STH_I	sth	%r19, [%r31 + 0x0132]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_98) + 8, 16, 16)) -> intp(4,0,3)
#else
	setx 0x6ba502414ded985a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0x85b7a9dd4d6ba59a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800b80  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r19
	.word 0xe62fe0ca  ! 153: STB_I	stb	%r19, [%r31 + 0x00ca]
mondo_4_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 154: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x9550c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_4_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91b7c70a  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f10, %d8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe040  ! 157: STDFA_I	stda	%f16, [0x0040, %r31]
tagged_4_102:
	tsubcctv %r16, 0x1543, %r9
	.word 0xd407e08c  ! 158: LDUW_I	lduw	[%r31 + 0x008c], %r10
splash_cmpr_4_103:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c031  ! 160: CASA_I	casa	[%r31] 0x 1, %r17, %r10
br_longdelay2_4_104:
	.word 0x26c88001  ! 1: BRLZ	brlz,a,pt	%r2,<label_0x88001>
	.word 0x95b7c4c9  ! 161: FCMPNE32	fcmpne32	%d62, %d40, %r10
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
    brnz %r10, cwq_4_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_105
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
cwq_4_105:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 162: RDPC	rd	%pc, %r12
splash_hpstate_4_106:
	ta T_CHANGE_NONHPRIV
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982d4d  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4d, %hpstate
trapasi_4_107:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4884b40  ! 164: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r10
	.word 0xe1bfe040  ! 165: STDFA_I	stda	%f16, [0x0040, %r31]
splash_hpstate_4_108:
	ta T_CHANGE_NONHPRIV
	.word 0x8198358f  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x158f, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd43fe1c8  ! 169: STD_I	std	%r10, [%r31 + 0x01c8]
jmptr_4_109:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_4_110:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xc1bfdb60  ! 173: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd51fe0c8  ! 174: LDDF_I	ldd	[%r31, 0x00c8], %f10
	.word 0xd44fe1d8  ! 175: LDSB_I	ldsb	[%r31 + 0x01d8], %r10
	.word 0x91930011  ! 176: WRPR_PIL_R	wrpr	%r12, %r17, %pil
trapasi_4_113:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4c04980  ! 177: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r10
intveclr_4_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0x095dec9c3a4abbf3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_4_115:
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
ibp_startwait4_115:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_115
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_115:
    brnz %r16, ibp_wait4_115
    ld [%r23], %r16
    ba ibp_startwait4_115
    mov 0x4, %r16
continue_ibp_4_115:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_115:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_115
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_115:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_115
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_115:
    best_set_reg(0x00000050b8fdf4b9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fdf20  ! 179: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_4_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_116
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
cwq_4_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 181: RDPC	rd	%pc, %r17
splash_cmpr_4_117:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 182: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_4_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf328ca06fab28c5e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe170  ! 184: LDXA_I	ldxa	[%r31, + 0x0170] %asi, %r16
intveclr_4_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc3695fcfd4e2f50e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_120) + 24, 16, 16)) -> intp(0,0,21)
#else
	setx 0xd546744c3377672d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x23d7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b407c7  ! 187: PDIST	pdistn	%d16, %d38, %d48
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7844006  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r6, %-
	.word 0xda97e158  ! 190: LDUHA_I	lduha	[%r31, + 0x0158] %asi, %r13
	.word 0x879c2573  ! 191: WRHPR_HINTP_I	wrhpr	%r16, 0x0573, %hintp
	.word 0x83d020b4  ! 192: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xa7810006  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r6, %-
dvapa_4_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xed8, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b18481  ! 194: FCMPLE32	fcmple32	%d6, %d32, %r11
brcommon3_4_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd33fc014  ! 195: STDF_R	std	%f9, [%r20, %r31]
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_4_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0x873, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a90a46  ! 197: FCMPd	fcmpd	%fcc<n>, %f4, %f6
memptr_4_126:
	set user_data_start, %r31
	.word 0x8580bf35  ! 198: WRCCR_I	wr	%r2, 0x1f35, %ccr
	.word 0xc19fdb60  ! 199: LDDFA_R	ldda	[%r31, %r0], %f0
trapasi_4_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0d84e60  ! 200: LDXA_R	ldxa	[%r1, %r0] 0x73, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_129:
	ta	T_CHANGE_NONHPRIV	! macro
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe19fde00  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe08008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 5: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031ef  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x11ef, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_2) + 48, 16, 16)) -> intp(6,0,27)
#else
	setx 0x70fc39ac9a3a3da7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_2_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xaa472341, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
splash_decr_2_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7850001  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r1, %-
fpinit_2_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 13: FDIVs	fdivs	%f0, %f4, %f4
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 14: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879b4012  ! 15: WRHPR_HINTP_R	wrhpr	%r13, %r18, %hintp
	.word 0x977020fa  ! 16: POPC_I	popc	0x00fa, %r11
	.word 0x87802058  ! 17: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x95702c74  ! 18: POPC_I	popc	0x0c74, %r10
	.word 0xa1a00170  ! 19: FABSq	dis not found

	.word 0xe49fe178  ! 20: LDDA_I	ldda	[%r31, + 0x0178] %asi, %r18
	.word 0xe44fe0b8  ! 21: LDSB_I	ldsb	[%r31 + 0x00b8], %r18
memptr_2_8:
	set 0x60140000, %r31
	.word 0x8580b6ec  ! 22: WRCCR_I	wr	%r2, 0x16ec, %ccr
splash_tba_2_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
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
	.word 0xa1414000  ! 24: RDPC	rd	%pc, %r16
	.word 0x8d903639  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1639, %pstate
brcommon1_2_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702160  ! 1: POPC_I	popc	0x0160, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9170302d  ! 26: POPC_I	popc	0x102d, %r8
intveclr_2_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1c3063cbafe5e15d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_14:
	nop
	ta T_CHANGE_HPRIV
	set 0x6feba5a1, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_2_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c9  ! 1: PDIST	pdistn	%d62, %d40, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f802c3e  ! 30: SIR	sir	0x0c3e
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_2_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_2_18:
	nop
	.word 0x9f8020d0  ! 33: SIR	sir	0x00d0
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e1c0  ! 35: LDSWA_I	ldswa	[%r31, + 0x01c0] %asi, %r8
ibp_2_19:
	nop
	.word 0xd097c028  ! 36: LDUHA_R	lduha	[%r31, %r8] 0x01, %r8
splash_cmpr_2_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc19fe020  ! 38: LDDFA_I	ldda	[%r31, 0x0020], %f0
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
    brnz %r10, cwq_2_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_21
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
cwq_2_21:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 39: RDPC	rd	%pc, %r19
unsupttte_2_22:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e84030  ! 40: PREFETCHA_R	prefetcha	[%r1, %r16] 0x01, #one_read
jmptr_2_23:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe098  ! 43: LDXA_I	ldxa	[%r31, + 0x0098] %asi, %r19
	.word 0xa7b24482  ! 44: FCMPLE32	fcmple32	%d40, %d2, %r19
	fbug,a,pn	%fcc0,  skip_2_25
	fbule skip_2_25
.align 128
skip_2_25:
	.word 0xa3b104d1  ! 45: FCMPNE32	fcmpne32	%d4, %d48, %r17
br_longdelay4_2_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	setx 0xe5c6b96d0b0dfe0e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte_2_28:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1b50487  ! 48: FCMPLE32	fcmple32	%d20, %d38, %r16
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_2_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0x41f8db6d3f7b0ecc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94c012  ! 51: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xe63fe073  ! 52: STD_I	std	%r19, [%r31 + 0x0073]
	.word 0xa784734a  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x134a, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x8d9032a9  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x12a9, %pstate
splash_tba_2_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
unsupttte_2_33:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ab0a4d  ! 57: FCMPd	fcmpd	%fcc<n>, %f12, %f44
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_2_35:
	nop
	.word 0xe9e7e00c  ! 59: CASA_R	casa	[%r31] %asi, %r12, %r20
	.word 0xe8cfe158  ! 60: LDSBA_I	ldsba	[%r31, + 0x0158] %asi, %r20
	.word 0x97b0c481  ! 61: FCMPLE32	fcmple32	%d34, %d32, %r11
ceter_2_37:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 62: RDTICK	rd	%tick, %r11
	.word 0xd31fe110  ! 63: LDDF_I	ldd	[%r31, 0x0110], %f9
mondo_2_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 64: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	ble,a	 skip_2_40
	fbug skip_2_40
.align 2048
skip_2_40:
	.word 0xc32fc000  ! 65: STXFSR_R	st-sfr	%f1, [%r0, %r31]
fpinit_2_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83972  ! 66: PREFETCHA_I	prefetcha	[%r0, + 0xfffff972] %asi, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_42:
	rd %pc, %r12
	add %r12, (donretarg_2_42-donret_2_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00525d00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c9b, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_42:
	.word 0xd26fe001  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x0001]
ibp_2_43:
	nop
	.word 0xa7a209a1  ! 68: FDIVs	fdivs	%f8, %f1, %f19
splash_tba_2_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_2_45:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe0d0  ! 71: LDXA_I	ldxa	[%r31, + 0x00d0] %asi, %r19
	.word 0xe737e1b8  ! 72: STQF_I	-	%f19, [0x01b8, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x2088, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407c4  ! 74: PDIST	pdistn	%d16, %d4, %d44
	.word 0xd22fe14e  ! 75: STB_I	stb	%r9, [%r31 + 0x014e]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9194c010  ! 77: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0xd2dfc029  ! 78: LDXA_R	ldxa	[%r31, %r9] 0x01, %r9
	.word 0x91d020b5  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_2_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb0ca4ba384ea2cdc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e1e2  ! 84: STQF_I	-	%f9, [0x01e2, %r31]
memptr_2_51:
	set user_data_start, %r31
	.word 0x8583638d  ! 85: WRCCR_I	wr	%r13, 0x038d, %ccr
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_2_52:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x26c829ce6d02c3c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_2_54:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_55:
	nop
	setx 0xfffff3c4fffffe4a, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd28008a0  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
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
    brnz %r10, cwq_2_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_56
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
cwq_2_56:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 93: RDPC	rd	%pc, %r10
brcommon3_2_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe170  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x0170]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc012  ! 94: STXFSR_R	st-sfr	%f1, [%r18, %r31]
splash_lsu_2_58:
	nop
	ta T_CHANGE_HPRIV
	set 0xca3837ae, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d90c011  ! 96: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
ibp_2_60:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 97: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fc3e0  ! 98: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, cwq_2_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_61
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
cwq_2_61:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 99: RDPC	rd	%pc, %r18
	.word 0xdb37e064  ! 100: STQF_I	-	%f13, [0x0064, %r31]
	.word 0x87ab4a46  ! 101: FCMPd	fcmpd	%fcc<n>, %f44, %f6
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_2_64:
    set user_data_start, %o7
	.word 0x93902006  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_2_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x0ebf7d1f, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xace73cc6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_2_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82fe8  ! 106: PREFETCHA_I	prefetcha	[%r0, + 0x0fe8] %asi, #one_read
ibp_2_68:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0032  ! 107: PREFETCHA_R	prefetcha	[%r16, %r18] 0x01, #one_read
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_2_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x10332766f4e81f17, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 110: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xe1bfe160  ! 111: STDFA_I	stda	%f16, [0x0160, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_72:
	rd %pc, %r12
	add %r12, (donretarg_2_72-donret_2_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f42800 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe95, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2ac90001  ! 1: BRNZ	brnz,a,pt	%r4,<label_0x90001>
	retry
donretarg_2_72:
	.word 0x93a0c9d4  ! 112: FDIVd	fdivd	%f34, %f20, %f40
ibp_2_73:
	nop
	.word 0xd297c029  ! 113: LDUHA_R	lduha	[%r31, %r9] 0x01, %r9
	.word 0xe1bfe120  ! 114: STDFA_I	stda	%f16, [0x0120, %r31]
	.word 0x8d903d55  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1d55, %pstate
	.word 0x87802082  ! 116: WRASI_I	wr	%r0, 0x0082, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_76) + 16, 16, 16)) -> intp(4,0,25)
#else
	setx 0xbc94eb1716237f30, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_2_77:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ecc028  ! 118: PREFETCHA_R	prefetcha	[%r19, %r8] 0x01, #one_read
	.word 0x91d02034  ! 119: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_2_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d90c005  ! 120: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
ibp_2_79:
	nop
	.word 0xc1bfe180  ! 121: STDFA_I	stda	%f0, [0x0180, %r31]
ibp_2_80:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1a049c7  ! 122: FDIVd	fdivd	%f32, %f38, %f16
	.word 0x8d802004  ! 123: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_2_81:
	ta T_CHANGE_NONHPRIV
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81983387  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1387, %hpstate
ibp_2_82:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc028  ! 125: LDXA_R	ldxa	[%r31, %r8] 0x01, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_83:
	rd %pc, %r12
	add %r12, (donretarg_2_83-donret_2_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a21000 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf15, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_83:
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc00b  ! 127: STXFSR_R	st-sfr	%f1, [%r11, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_2_85:
	set 0x60740000, %r31
	.word 0x8580f85b  ! 130: WRCCR_I	wr	%r3, 0x185b, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_2_86:
	nop
	.word 0xe19fe0e0  ! 132: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xa9a00174  ! 133: FABSq	dis not found

	.word 0xdad7e100  ! 134: LDSHA_I	ldsha	[%r31, + 0x0100] %asi, %r13
	bg,a	 skip_2_88
	bneg  	 skip_2_88
.align 1024
skip_2_88:
	.word 0x9f80273e  ! 135: SIR	sir	0x073e
fpinit_2_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 136: FCMPd	fcmpd	%fcc<n>, %f0, %f4
br_badelay2_2_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b18305  ! 137: ALIGNADDRESS	alignaddr	%r6, %r5, %r9
	.word 0xe137e066  ! 138: STQF_I	-	%f16, [0x0066, %r31]
fpinit_2_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 139: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c70  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x1c70, %pstate
ibp_2_93:
	nop
	.word 0xa7703859  ! 141: POPC_I	popc	0x1859, %r19
	.word 0xa7a000d1  ! 142: FNEGd	fnegd	%f48, %f50
    set 0x163, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b307c6  ! 143: PDIST	pdistn	%d12, %d6, %d12
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 144: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_2_95:
	set 0x60340000, %r31
	.word 0x8584bc63  ! 146: WRCCR_I	wr	%r18, 0x1c63, %ccr
dvapa_2_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8f3, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fe150  ! 147: LDDA_I	ldda	[%r31, + 0x0150] %asi, %r19
splash_decr_2_97:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7804013  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r19, %-
	.word 0xe637e0f2  ! 149: STH_I	sth	%r19, [%r31 + 0x00f2]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_98) + 16, 16, 16)) -> intp(0,0,23)
#else
	setx 0xde03745a0a60370f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe9d1cb5d876509a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe68008a0  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe62fe146  ! 153: STB_I	stb	%r19, [%r31 + 0x0146]
mondo_2_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d934010  ! 154: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0xa150c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_2_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd5148012  ! 1: LDQF_R	-	[%r18, %r18], %f10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe000  ! 157: LDDFA_I	ldda	[%r31, 0x0000], %f16
tagged_2_102:
	tsubcctv %r16, 0x1b66, %r16
	.word 0xd407e050  ! 158: LDUW_I	lduw	[%r31 + 0x0050], %r10
splash_cmpr_2_103:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 159: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c02b  ! 160: CASA_I	casa	[%r31] 0x 1, %r11, %r10
br_longdelay2_2_104:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a7c9d4  ! 161: FDIVd	fdivd	%f62, %f20, %f10
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
    brnz %r10, cwq_2_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_105
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
cwq_2_105:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 162: RDPC	rd	%pc, %r17
splash_hpstate_2_106:
	ta T_CHANGE_NONHPRIV
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8198339c  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x139c, %hpstate
trapasi_2_107:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4d04b40  ! 164: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r10
	.word 0xe1bfe1e0  ! 165: STDFA_I	stda	%f16, [0x01e0, %r31]
splash_hpstate_2_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d05  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 167: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd43fe0e8  ! 169: STD_I	std	%r10, [%r31 + 0x00e8]
jmptr_2_109:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_110:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xc19fd920  ! 173: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd51fe118  ! 174: LDDF_I	ldd	[%r31, 0x0118], %f10
	.word 0xd44fe0e0  ! 175: LDSB_I	ldsb	[%r31 + 0x00e0], %r10
	.word 0x91924004  ! 176: WRPR_PIL_R	wrpr	%r9, %r4, %pil
trapasi_2_113:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4904980  ! 177: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r10
intveclr_2_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6eb5656978bd07b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_2_115:
	nop
	.word 0xc1bfdc00  ! 179: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_2_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_116
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
cwq_2_116:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 181: RDPC	rd	%pc, %r13
splash_cmpr_2_117:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 182: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_2_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1b925fce746aaf7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe098  ! 184: LDXA_I	ldxa	[%r31, + 0x0098] %asi, %r16
intveclr_2_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2595ad93bce9ce0b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_120) + 48, 16, 16)) -> intp(2,0,11)
#else
	setx 0x81a1f04261a0f8fc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x75f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b447d3  ! 187: PDIST	pdistn	%d48, %d50, %d48
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_2_121:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7848004  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
	.word 0xda97e040  ! 190: LDUHA_I	lduha	[%r31, + 0x0040] %asi, %r13
	.word 0x8799213a  ! 191: WRHPR_HINTP_I	wrhpr	%r4, 0x013a, %hintp
	.word 0x91d02033  ! 192: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_decr_2_122:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa783000d  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r13, %-
dvapa_2_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaba, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f8039e0  ! 194: SIR	sir	0x19e0
brcommon3_2_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd2bfc02c  ! 195: STDA_R	stda	%r9, [%r31 + %r12] 0x01
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_2_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfa5, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9b7032be  ! 197: POPC_I	popc	0x12be, %r13
memptr_2_126:
	set user_data_start, %r31
	.word 0x85852469  ! 198: WRCCR_I	wr	%r20, 0x0469, %ccr
	.word 0xc1bfe000  ! 199: STDFA_I	stda	%f0, [0x0000, %r31]
trapasi_2_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0d04e60  ! 200: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_129:
	ta	T_CHANGE_NONHPRIV	! macro
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
	.word 0xe08008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe19fda00  ! 2: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe08008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x89800011  ! 4: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 5: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d903e3f  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x1e3f, %pstate
	.word 0xe0bfc020  ! 7: STDA_R	stda	%r16, [%r31 + %r0] 0x01
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_2) + 16, 16, 16)) -> intp(3,0,21)
#else
	setx 0x864829281e011335, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_2:
	.word 0x39400001  ! 8: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc000  ! 9: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_lsu_1_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x7a439636, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a780001  ! 11: BPCS	<illegal instruction>
splash_decr_1_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7828004  ! 12: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r4, %-
fpinit_1_5:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 13: FDIVs	fdivs	%f0, %f4, %f8
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879cc012  ! 15: WRHPR_HINTP_R	wrhpr	%r19, %r18, %hintp
	.word 0xa7703f5a  ! 16: POPC_I	popc	0x1f5a, %r19
	.word 0x8780201c  ! 17: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xc3e9002a  ! 18: PREFETCHA_R	prefetcha	[%r4, %r10] 0x01, #one_read
	.word 0xa5a00174  ! 19: FABSq	dis not found

	.word 0xe49fe1f0  ! 20: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r18
	.word 0xe44fe158  ! 21: LDSB_I	ldsb	[%r31 + 0x0158], %r18
memptr_1_8:
	set 0x60140000, %r31
	.word 0x8582ab00  ! 22: WRCCR_I	wr	%r10, 0x0b00, %ccr
splash_tba_1_9:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 23: WRPR_TBA_R	wrpr	%r0, %r12, %tba
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
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
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
	.word 0xa1414000  ! 24: RDPC	rd	%pc, %r16
	.word 0x8d9033bd  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x13bd, %pstate
brcommon1_1_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa1702040  ! 1: POPC_I	popc	0x0040, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9a189a1  ! 26: FDIVs	fdivs	%f6, %f1, %f20
intveclr_1_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x12d34a0fa10bc542, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_14:
	nop
	ta T_CHANGE_HPRIV
	set 0x911b5386, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_15:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 29: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
brcommon1_1_16:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d2  ! 1: PDIST	pdistn	%d62, %d18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91702d27  ! 30: POPC_I	popc	0x0d27, %r8
	.word 0xd03fc000  ! 31: STD_R	std	%r8, [%r31 + %r0]
splash_tba_1_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_1_18:
	nop
	.word 0xd09fc02b  ! 33: LDDA_R	ldda	[%r31, %r11] 0x01, %r8
	.word 0xd127c000  ! 34: STF_R	st	%f8, [%r0, %r31]
	.word 0xd0c7e118  ! 35: LDSWA_I	ldswa	[%r31, + 0x0118] %asi, %r8
ibp_1_19:
	nop
	.word 0xd0bfc02b  ! 36: STDA_R	stda	%r8, [%r31 + %r11] 0x01
splash_cmpr_1_20:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc19fe000  ! 38: LDDFA_I	ldda	[%r31, 0x0000], %f0
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
    brnz %r10, cwq_1_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_21
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
cwq_1_21:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 39: RDPC	rd	%pc, %r8
	.word 0xc3eb0024  ! 40: PREFETCHA_R	prefetcha	[%r12, %r4] 0x01, #one_read
jmptr_1_23:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7508000  ! 42: RDPR_TSTATE	<illegal instruction>
	.word 0xe6dfe0c0  ! 43: LDXA_I	ldxa	[%r31, + 0x00c0] %asi, %r19
	.word 0x95a109c9  ! 44: FDIVd	fdivd	%f4, %f40, %f10
	.word 0x9f80217f  ! 45: SIR	sir	0x017f
br_longdelay4_1_26:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 46: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	setx 0xbe6d4826d4c92419, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_27:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7b44493  ! 48: FCMPLE32	fcmple32	%d48, %d50, %r19
	.word 0xe677c000  ! 49: STX_R	stx	%r19, [%r31 + %r0]
intveclr_1_29:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe19ffcc836aa4d81, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 50: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_30:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d948011  ! 51: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0xe63fe138  ! 52: STD_I	std	%r19, [%r31 + 0x0138]
	.word 0xa784720a  ! 53: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x120a, %-
	.word 0xe71fc000  ! 54: LDDF_R	ldd	[%r31, %r0], %f19
	.word 0x2accc001  ! 1: BRNZ	brnz,a,pt	%r19,<label_0xcc001>
	.word 0x8d9029a3  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x09a3, %pstate
splash_tba_1_32:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 56: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a409d3  ! 57: FDIVd	fdivd	%f16, %f50, %f20
	.word 0x89800011  ! 58: WRTICK_R	wr	%r0, %r17, %tick
ibp_1_35:
	nop
	.word 0xc32fc00b  ! 59: STXFSR_R	st-sfr	%f1, [%r11, %r31]
	.word 0xe8cfe008  ! 60: LDSBA_I	ldsba	[%r31, + 0x0008] %asi, %r20
	.word 0x9ba209b3  ! 61: FDIVs	fdivs	%f8, %f19, %f13
ceter_1_37:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 62: RDTICK	rd	%tick, %r9
	.word 0xd31fe040  ! 63: LDDF_I	ldd	[%r31, 0x0040], %f9
mondo_1_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d920004  ! 64: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
	.word 0xc30fc000  ! 65: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_1_41:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 66: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_42:
	rd %pc, %r12
	add %r12, (donretarg_1_42-donret_1_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0091d700 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_42:
	.word 0xd26fe055  ! 67: LDSTUB_I	ldstub	%r9, [%r31 + 0x0055]
ibp_1_43:
	nop
	.word 0xc3ed0032  ! 68: PREFETCHA_R	prefetcha	[%r20, %r18] 0x01, #one_read
splash_tba_1_44:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
jmptr_1_45:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 70: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6dfe0a8  ! 71: LDXA_I	ldxa	[%r31, + 0x00a8] %asi, %r19
	.word 0xe737e098  ! 72: STQF_I	-	%f19, [0x0098, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 73: LDX_R	ldx	[%r31 + %r0], %r19
    set 0x27e9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7d4  ! 74: PDIST	pdistn	%d50, %d20, %d40
	.word 0xd22fe158  ! 75: STB_I	stb	%r9, [%r31 + 0x0158]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd25fc000  ! 76: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x9194c014  ! 77: WRPR_PIL_R	wrpr	%r19, %r20, %pil
	.word 0xd33fc00c  ! 78: STDF_R	std	%f9, [%r12, %r31]
	.word 0x91d020b5  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x89800011  ! 80: WRTICK_R	wr	%r0, %r17, %tick
splash_tba_1_49:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 81: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_50:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc6abd848c920c73c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 82: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd25fc000  ! 83: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd337e1ac  ! 84: STQF_I	-	%f9, [0x01ac, %r31]
memptr_1_51:
	set user_data_start, %r31
	.word 0x8581646f  ! 85: WRCCR_I	wr	%r5, 0x046f, %ccr
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd327c000  ! 87: STF_R	st	%f9, [%r0, %r31]
jmptr_1_52:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 88: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x7edcfa3ff8215ece, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_53:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_1_54:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_55:
	nop
	setx 0xfffff549fffffd38, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd28008a0  ! 92: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
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
    brnz %r10, cwq_1_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_56
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
cwq_1_56:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 93: RDPC	rd	%pc, %r16
brcommon3_1_57:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06fe0a0  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0x00a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe09fc030  ! 94: LDDA_R	ldda	[%r31, %r16] 0x01, %r16
splash_lsu_1_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x7d51e587, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d950013  ! 96: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
ibp_1_60:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fda00  ! 97: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fda00  ! 98: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, cwq_1_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_61
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
cwq_1_61:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 99: RDPC	rd	%pc, %r13
	.word 0xdb37e140  ! 100: STQF_I	-	%f13, [0x0140, %r31]
	.word 0xc3eb4024  ! 101: PREFETCHA_R	prefetcha	[%r13, %r4] 0x01, #one_read
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
cwp_1_64:
    set user_data_start, %o7
	.word 0x93902007  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_1_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x8ae569f7, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 104: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x44754d2a, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 105: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_1_67:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 106: FDIVs	fdivs	%f0, %f4, %f4
ibp_1_68:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97a409a4  ! 107: FDIVs	fdivs	%f16, %f4, %f11
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 108: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_1_70:
	nop
	ta T_CHANGE_HPRIV
	setx 0x003f33467c26414a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_71
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_71:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 110: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0xc1bfe160  ! 111: STDFA_I	stda	%f0, [0x0160, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_72:
	rd %pc, %r12
	add %r12, (donretarg_1_72-donret_1_72), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0045b400 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd8c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	retry
donretarg_1_72:
	.word 0x93a449c8  ! 112: FDIVd	fdivd	%f48, %f8, %f40
ibp_1_73:
	nop
	.word 0xd2dfc034  ! 113: LDXA_R	ldxa	[%r31, %r20] 0x01, %r9
	.word 0xc19fe180  ! 114: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0x8d903e8d  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x1e8d, %pstate
	.word 0x8780201c  ! 116: WRASI_I	wr	%r0, 0x001c, %asi
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_76) + 8, 16, 16)) -> intp(6,0,12)
#else
	setx 0x2c0eea58c154aa2a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_76:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_1_77:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97b487d1  ! 118: PDIST	pdistn	%d18, %d48, %d42
	.word 0x93d02032  ! 119: Tcc_I	tne	icc_or_xcc, %r0 + 50
mondo_1_78:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d92c004  ! 120: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
ibp_1_79:
	nop
	.word 0xc19fda00  ! 121: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_1_80:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x91a2c9c2  ! 122: FDIVd	fdivd	%f42, %f2, %f8
	.word 0x8d802004  ! 123: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_1_81:
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982497  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0497, %hpstate
ibp_1_82:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00a  ! 125: STXFSR_R	st-sfr	%f1, [%r10, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_83:
	rd %pc, %r12
	add %r12, (donretarg_1_83-donret_1_83+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008d6600 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d55, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x24cc4001  ! 1: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	done
donretarg_1_83:
	.word 0x3a800001  ! 126: BCC	bcc,a	<label_0x1>
	.word 0xd09fc033  ! 127: LDDA_R	ldda	[%r31, %r19] 0x01, %r8
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 128: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x24800001  ! 129: BLE	ble,a	<label_0x1>
memptr_1_85:
	set 0x60740000, %r31
	.word 0x85846102  ! 130: WRCCR_I	wr	%r17, 0x0102, %ccr
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
ibp_1_86:
	nop
	.word 0xc19fd960  ! 132: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9ba00165  ! 133: FABSq	dis not found

	.word 0xdad7e010  ! 134: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x93a0c9c6  ! 135: FDIVd	fdivd	%f34, %f6, %f40
fpinit_1_89:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 136: FDIVd	fdivd	%f0, %f4, %f6
br_badelay2_1_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa1b28310  ! 137: ALIGNADDRESS	alignaddr	%r10, %r16, %r16
	.word 0xe137e09c  ! 138: STQF_I	-	%f16, [0x009c, %r31]
fpinit_1_91:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8273e  ! 139: PREFETCHA_I	prefetcha	[%r0, + 0x073e] %asi, #one_read
	.word 0x2cc9c001  ! 1: BRGZ	brgz,a,pt	%r7,<label_0x9c001>
	.word 0x8d903fe4  ! 140: WRPR_PSTATE_I	wrpr	%r0, 0x1fe4, %pstate
ibp_1_93:
	nop
	.word 0x9ba4c9a7  ! 141: FDIVs	fdivs	%f19, %f7, %f13
	.word 0x99a000c6  ! 142: FNEGd	fnegd	%f6, %f12
    set 0x15e3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b207cc  ! 143: PDIST	pdistn	%d8, %d12, %d50
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 144: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_94:
	ta	T_CHANGE_NONPRIV	! macro
memptr_1_95:
	set 0x60140000, %r31
	.word 0x8584fc0f  ! 146: WRCCR_I	wr	%r19, 0x1c0f, %ccr
dvapa_1_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfd1, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fe060  ! 147: LDDA_I	ldda	[%r31, + 0x0060] %asi, %r19
splash_decr_1_97:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7850008  ! 148: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r8, %-
	.word 0xe637e1f0  ! 149: STH_I	sth	%r19, [%r31 + 0x01f0]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_98) + 48, 16, 16)) -> intp(0,0,21)
#else
	setx 0xac86ccda092db929, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_98:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_99:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf1afd04ecaf253ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 151: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6800be0  ! 152: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r19
	.word 0xe62fe0bd  ! 153: STB_I	stb	%r19, [%r31 + 0x00bd]
mondo_1_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 154: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0x9150c000  ! 155: RDPR_TT	<illegal instruction>
	.word 0x3a800001  ! 156: BCC	bcc,a	<label_0x1>
brcommon2_1_101:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91b7c713  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f19, %d8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe160  ! 157: STDFA_I	stda	%f16, [0x0160, %r31]
tagged_1_102:
	tsubcctv %r18, 0x15dc, %r5
	.word 0xd407e12c  ! 158: LDUW_I	lduw	[%r31 + 0x012c], %r10
splash_cmpr_1_103:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 159: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd5e7c031  ! 160: CASA_I	casa	[%r31] 0x 1, %r17, %r10
br_longdelay2_1_104:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_1_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_105
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
cwq_1_105:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 162: RDPC	rd	%pc, %r10
splash_hpstate_1_106:
	ta T_CHANGE_NONHPRIV
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x81982e5f  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5f, %hpstate
trapasi_1_107:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xd4d84b40  ! 164: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r10
	.word 0xe1bfe160  ! 165: STDFA_I	stda	%f16, [0x0160, %r31]
splash_hpstate_1_108:
	ta T_CHANGE_NONHPRIV
	.word 0x81983acf  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1acf, %hpstate
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 168: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd43fe121  ! 169: STD_I	std	%r10, [%r31 + 0x0121]
jmptr_1_109:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_110:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 172: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xe1bfdc00  ! 173: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd51fe128  ! 174: LDDF_I	ldd	[%r31, 0x0128], %f10
	.word 0xd44fe1d8  ! 175: LDSB_I	ldsb	[%r31 + 0x01d8], %r10
	.word 0x91948014  ! 176: WRPR_PIL_R	wrpr	%r18, %r20, %pil
trapasi_1_113:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d04980  ! 177: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r10
intveclr_1_114:
	nop
	ta T_CHANGE_HPRIV
	setx 0x998579d80d5b64ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 178: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_1_115:
	nop
	.word 0xc19fe180  ! 179: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_1_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_116
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
cwq_1_116:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 181: RDPC	rd	%pc, %r16
splash_cmpr_1_117:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 182: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_1_118:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1df994f9eeae4ceb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 183: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfe088  ! 184: LDXA_I	ldxa	[%r31, + 0x0088] %asi, %r16
intveclr_1_119:
	nop
	ta T_CHANGE_HPRIV
	setx 0x32df799cac974275, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 185: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_120) + 8, 16, 16)) -> intp(5,0,30)
#else
	setx 0xb0b3ff9d3514afbc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_120:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    set 0x13ff, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb1c7cb  ! 187: PDIST	pdistn	%d38, %d42, %d44
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_1_121:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7844009  ! 189: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r9, %-
	.word 0xda97e058  ! 190: LDUHA_I	lduha	[%r31, + 0x0058] %asi, %r13
	.word 0x879b638f  ! 191: WRHPR_HINTP_I	wrhpr	%r13, 0x038f, %hintp
	.word 0x91d020b5  ! 192: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_decr_1_122:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7844010  ! 193: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r16, %-
dvapa_1_123:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8d8, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93a4c9a2  ! 194: FDIVs	fdivs	%f19, %f2, %f9
brcommon3_1_124:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd23fe0a0  ! 195: STD_I	std	%r9, [%r31 + 0x00a0]
	.word 0xc30fc000  ! 196: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
dvapa_1_125:
	nop
	ta T_CHANGE_HPRIV
	mov 0xde4, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b4c7c1  ! 197: PDIST	pdistn	%d50, %d32, %d16
memptr_1_126:
	set user_data_start, %r31
	.word 0x8584f50f  ! 198: WRCCR_I	wr	%r19, 0x150f, %ccr
	.word 0xc19fda00  ! 199: LDDFA_R	ldda	[%r31, %r0], %f0
trapasi_1_128:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0c04e60  ! 200: LDSWA_R	ldswa	[%r1, %r0] 0x73, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_129:
	ta	T_CHANGE_NONHPRIV	! macro
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

	.xword	0x3dc5d6a075f93f25
	.xword	0xd95195e8d5fa3106
	.xword	0xebc1e15e8656080a
	.xword	0x995dd1ab4c15ef75
	.xword	0xd3429f94cbf9df37
	.xword	0x5011c46d098cd1d1
	.xword	0xcd2c3152b16c3d2a
	.xword	0x71cac2f4df1f170e
	.xword	0xadd4e29f8ba3072d
	.xword	0xb87ecd88731b723e
	.xword	0x9857f8f38d935b6a
	.xword	0x3fd49c272adf35a8
	.xword	0x1577c508becb9c4a
	.xword	0x69919cae37b9e537
	.xword	0xafd796fa0ee25e33
	.xword	0x4f5994d14d04cf3f
	.xword	0x4cab6273a1ce6e29
	.xword	0x98ea410ecbb5b1be
	.xword	0x7f945928e81009ab
	.xword	0xce5a2282410ed932
	.xword	0x142427fc0fb9d0ba
	.xword	0x4f4312662ca0a124
	.xword	0xb0876124e7fdbef6
	.xword	0x9c5009e273ab445d
	.xword	0xef6cd964e0a31091
	.xword	0x929117a1c26a1a4a
	.xword	0x58f11e246cb0ac38
	.xword	0xe908434ae0ad3afb
	.xword	0xfceaf9b50b2fc57b
	.xword	0x7502e6634880f575
	.xword	0x3f0a4911f5d17a34
	.xword	0xd17e1c5618a2523e
	.xword	0xefbd44bc114a6b72
	.xword	0xa50cc98d70cb9cb3
	.xword	0xca58704cb2b1a90e
	.xword	0x4a6c151cebba117e
	.xword	0x9d0118ffdb1c828b
	.xword	0xe5728c746185719f
	.xword	0xe52a7cb8316f88c7
	.xword	0x4b97276eb35bb6c2
	.xword	0x8b443d0b1473e1a7
	.xword	0x3f56ce59beebda27
	.xword	0xf3951387254b99b8
	.xword	0x258fdee76bb94c01
	.xword	0xb9a2443feb0b4d03
	.xword	0xadc6ccc7fcad6201
	.xword	0x2447040d672ffd64
	.xword	0x6c71f84ee89ecb3b
	.xword	0x8cc3f377f19d15bc
	.xword	0x2a658567e05c6df3
	.xword	0xf60c49076a2ff4c3
	.xword	0xacb34b7bcbe758c2
	.xword	0x641a36a24efcb531
	.xword	0x5d38ea62545fd979
	.xword	0xeb479a9d21e541ab
	.xword	0xdf26006951722f80
	.xword	0x4d2d3959870a51cd
	.xword	0xe960cbccd4352ac6
	.xword	0x49ed5d335634b99d
	.xword	0xee44906c9aadacfe
	.xword	0x1ee279a79ce6bca8
	.xword	0x8d936ffa42ffd86e
	.xword	0x6194e8184bcfa7cc
	.xword	0x301466557cc1609b
	.xword	0x1a611cd9d1da663d
	.xword	0x19f0b11d6dcd4ff7
	.xword	0x0ec0d65012b7e02e
	.xword	0x67370eb28d13f9b0
	.xword	0x00ffdb1037fcab57
	.xword	0x136fa0573ed11f91
	.xword	0xd5013599f6ee32a2
	.xword	0xd2a4892d49e3e0a0
	.xword	0x6ff37df74232a26f
	.xword	0x7156636f79ffc217
	.xword	0x20f2b1a7b7a80a01
	.xword	0x543cb05b351ef590
	.xword	0x9065738df05fa371
	.xword	0x59ad8cc8c0e5fdf9
	.xword	0xc33355e0699f12a5
	.xword	0x9869ce87fb358c2e
	.xword	0xdc432e270ee2035a
	.xword	0xc8a78454dae5d5e7
	.xword	0xad76a55af8b18f63
	.xword	0xcd2768687a8ef6f9
	.xword	0x1139ea3e0573cc1c
	.xword	0xe0ee152f5bb16a50
	.xword	0xc457a382cfb8140c
	.xword	0x284317150ba56810
	.xword	0x2a095b9101944cbb
	.xword	0xe3e2042b0668afad
	.xword	0x68e7153c594b5480
	.xword	0x9038519de8867fe8
	.xword	0x0fbab1bbbf510d2c
	.xword	0xd513be9895bcc929
	.xword	0xeb950d9cf9d29ff7
	.xword	0xc7e529766bfd0dfa
	.xword	0x0d2367a92cab515e
	.xword	0x46e4babd4b375840
	.xword	0xd82c7f1fb3e0d133
	.xword	0xda4dbe272c23871d
	.xword	0x75c4cfc86379cdcd
	.xword	0x553e563b2262a318
	.xword	0x2785865349190a3b
	.xword	0x0a66438622639591
	.xword	0xc9115aaf9083f0fb
	.xword	0xc65f52a220366326
	.xword	0xb38a7d9e668f3272
	.xword	0x449f683736b26c2d
	.xword	0xf8763dd56e147dc9
	.xword	0x28e2f477f28e9bc9
	.xword	0x40a8773812fcc048
	.xword	0xaa766c60ac67e7ec
	.xword	0xf6e1ae094faf9d4c
	.xword	0x0f0be3e2a3b25528
	.xword	0x79f1e5152714961e
	.xword	0xc8e9567536e8f081
	.xword	0x14dc47d135534d64
	.xword	0xee6f38457b4ba293
	.xword	0x11ff93e8fb0a2c0d
	.xword	0x981a76e6f57a4e5f
	.xword	0xfa4f03616b8c9cb6
	.xword	0x5610ca22df8a9683
	.xword	0x66bf7a928287fef0
	.xword	0xbad5dc7c0031e7da
	.xword	0xac3d1117e1d84119
	.xword	0x8774460638d191c2
	.xword	0x7f128a56c0f7000b
	.xword	0x18c0c8828e8d3060
	.xword	0xc0dab0de909a906c
	.xword	0xf323f839f1a54521
	.xword	0x87e0c6a61df7aae0
	.xword	0x7ebcededec77d584
	.xword	0x9df2ea0232e33a73
	.xword	0x5e0a65b89d66da9a
	.xword	0x3668f4c279196fb1
	.xword	0x2a1f77346bc74bdf
	.xword	0x414a365ce8a7ba06
	.xword	0x959c425ef0512d98
	.xword	0x5a1f5d474a33517e
	.xword	0xc1cc8dfaf596406a
	.xword	0xd6be8c8fa2610088
	.xword	0x8c936c0c739e0471
	.xword	0xbbce96f29d275f37
	.xword	0xa9fd11de30db562e
	.xword	0xb49701e6f08bc5a4
	.xword	0x84b5e86b0ded84db
	.xword	0x65510e7c2ef135ca
	.xword	0xeaa57a11873a23a4
	.xword	0x8ac2b534337cc2db
	.xword	0x8950f55eccef72a5
	.xword	0xdb2337fa20395b52
	.xword	0x9b9c8da0b53a4f1d
	.xword	0xe5f47ad41137cef1
	.xword	0xea9011400707df0f
	.xword	0xbf7852bcbcc1d943
	.xword	0xd0e1cd39f7c4b011
	.xword	0x121a3ad9b0b7d678
	.xword	0xf1661d6ca9f90f60
	.xword	0x1e76a96257ec1a38
	.xword	0x9a24d9600364f27e
	.xword	0x8efeb6756e241f7d
	.xword	0x517b8610dcfcbd1c
	.xword	0x496e9bf37c551ae8
	.xword	0x76eec375b9d149e9
	.xword	0x4d7941a08dc7ecba
	.xword	0xd31c21b4ad42c797
	.xword	0x1d86131179dfd534
	.xword	0x8933fc10810db69f
	.xword	0x9843237c36eb95db
	.xword	0x105789fd9841411c
	.xword	0x42a07d6ec62860ab
	.xword	0x3aa32e0ce492d63c
	.xword	0x34f0ca3185f8ab52
	.xword	0xf100946f144b3e3e
	.xword	0x76da371202115795
	.xword	0x1639afa4eae09577
	.xword	0xf9c3d3e45f7ab30b
	.xword	0xdba3055f77d6b1af
	.xword	0xff446703d7d25daf
	.xword	0x61f01a0fb214905e
	.xword	0xae4a8dc62d48d7d4
	.xword	0x93f037342dbbdc82
	.xword	0x15618f1534e7b0da
	.xword	0x04f8c2cc5c36f91a
	.xword	0x2925e917480461c0
	.xword	0xb73c9f8d4fb99e4c
	.xword	0xc362de628a11998a
	.xword	0x33d74240aca8b54c
	.xword	0xa2377b60a6c5a2af
	.xword	0x83480ba8eea6c986
	.xword	0x3900f5d4fbb00f08
	.xword	0x504c4ecc4db30290
	.xword	0x035167316eb7d43d
	.xword	0x956bbc254cf0b7e9
	.xword	0x87e699767cc629f5
	.xword	0xe041c75a6c74b56c
	.xword	0x4262f5b035814cc9
	.xword	0xc3611234002ae98d
	.xword	0x0539d5e88c71a103
	.xword	0xdd2ffbffe8d970a4
	.xword	0x63fc37771197e327
	.xword	0x00db8f5417e4fc12
	.xword	0xf3d851d1362b1212
	.xword	0x4e5ee9ba26d3764e
	.xword	0x61f504d36faf6bbb
	.xword	0xd51147ef6788b9c0
	.xword	0xe11d88a058bb6b04
	.xword	0x42d07f04631a9e74
	.xword	0x00c6edb4a963078b
	.xword	0x16883314ba6d7873
	.xword	0x91dd048f29854661
	.xword	0x25646f06c058c4af
	.xword	0xff41195bea2784fc
	.xword	0x6b4cdb4f829952dc
	.xword	0x2b993dece48be54e
	.xword	0x88b1df077d4b66c7
	.xword	0xd311df76b9a3449c
	.xword	0x8cbdb0c531e9ec9e
	.xword	0x7fa20f58910ca12a
	.xword	0xa0fc5d2183dbdc2e
	.xword	0x8a727ee6c454f506
	.xword	0x6cb0a9e91a9834ee
	.xword	0xdb7266afe89be053
	.xword	0x4058b48a2fcd0065
	.xword	0xd5d81996c594c499
	.xword	0xfcd61e8b366e6bb5
	.xword	0xe958391d7af226d7
	.xword	0x6f13616f4b1ecf9d
	.xword	0x6cde6d21865684d2
	.xword	0x67eb467b4b3074eb
	.xword	0xfd0f6af4d60369ba
	.xword	0xb179d56ca323de3b
	.xword	0xa6d79eb566a93a41
	.xword	0x73edcdc465021a82
	.xword	0x0d91122df8d40d8f
	.xword	0x9099b6a053a48687
	.xword	0x72a042cdddf3887f
	.xword	0x700e4583ba578a1c
	.xword	0x14322618b27b8f87
	.xword	0x615d5041d3a797c9
	.xword	0xacf09b67dec65a1c
	.xword	0xed38c2c0c09b34bb
	.xword	0xe8408e4b8ec01204
	.xword	0x8d6ec44fc49bd181
	.xword	0xdb4ce594ebf66c5a
	.xword	0x0decad08b9539561
	.xword	0x5a02a0ef950a1fa0
	.xword	0x6a903db6e39628b4
	.xword	0x6882bbd8b76fae8a
	.xword	0xca3c636411fb04e5
	.xword	0xdb6c913fd532ba6f
	.xword	0x544508694ea8ddf4
	.xword	0xca477de45eceb4ae
	.xword	0x044d9e156092555d
	.xword	0xec94a8e9ff599971
	.xword	0xb8eeaf6ec83d02ac

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
	TTE_CV	 = 0,
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
	TTE_CV	 = 1,
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
	TTE_CV	 = 0,
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
	TTE_CP	 = 1,
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
	TTE_NFO	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
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
	TTE_CV	 = 0,
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
	.xword	0x9e77ee7f704e3adb
	.xword	0xac6d590e44408197
	.xword	0x5a1aa8a80e6e6de0
	.xword	0x5a39354fb4c3c01e
	.xword	0x86166615052aac64
	.xword	0x8149d81174c1f9b3
	.xword	0x601baea331e12ffd
	.xword	0x4cdaf2a080fe1eac
	.xword	0x8042e608ccc7156a
	.xword	0x711148b9c41272c9
	.xword	0x25dc88eca0327e7b
	.xword	0xea6663fd7ef53f80
	.xword	0x94ac7d676e75015a
	.xword	0x63e57a3c70edaddf
	.xword	0x4cf263a216a9a2d3
	.xword	0xe5dfa39fc2ad9e23
	.xword	0x06719d8adfb5c3b2
	.xword	0x5c9d4f9e85f9f825
	.xword	0x025da98a332688b3
	.xword	0xd3ae867de122376c
	.xword	0x5a7e277e0543a9cd
	.xword	0x54c54327c286e9bb
	.xword	0x36073b9ef40246e3
	.xword	0xc5dd0b2787140497
	.xword	0x6ba7a109169ae962
	.xword	0xd882236166c84f77
	.xword	0x87b8d90f4cf628d8
	.xword	0x6c822e2856382d94
	.xword	0xe7aebf6fcce8f616
	.xword	0x77091ede64b86a51
	.xword	0x853d810d7e19e3fa
	.xword	0xef65f7a83d6ac9cb



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
	.xword	0x92a8f8fe4a6a939e
	.xword	0x3c4c92c9f6ebeda8
	.xword	0x1cda48aadb472f57
	.xword	0x773664ff3b90fcd2
	.xword	0x1f005f406d045bf4
	.xword	0xd454e1d1a17e24bb
	.xword	0x144cf830e9d3d833
	.xword	0x8ff11464fcd6d164
	.xword	0x770bddf6a1a7ff75
	.xword	0x55870209d88c58e9
	.xword	0xfda94d75d09e2598
	.xword	0x36851818583c7597
	.xword	0x3571a0fe19c972af
	.xword	0xa33ecb849ed5452c
	.xword	0x504f96d7b161999c
	.xword	0x4eb0fa4f8f68d5ea
	.xword	0xdc6676b71d11bef9
	.xword	0x518eedbf6b719c58
	.xword	0x0b0db53b3eda03eb
	.xword	0xe44eeab3c4880bf2
	.xword	0x3ddd40fc4ab20669
	.xword	0x1d3408e50480e54f
	.xword	0xa67cb2d9da7041dd
	.xword	0x0e3f181241ab6cf0
	.xword	0x267544e03db946a8
	.xword	0xcf29c71dd296560b
	.xword	0x0559f5d070aadaec
	.xword	0x6e13ccc1627f5ef7
	.xword	0x93cddef3656ee1ba
	.xword	0x43732b6e688968bf
	.xword	0x31569bd1adb11161
	.xword	0xdc9da0b97376a03f



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
	TTE_Size	 = 0,
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	TTE_Size	 = 0,
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
	Name	 = .MyDATA_2,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_2,
	hypervisor
}

.data
	.xword	0x5caa17143d80488c
	.xword	0x798a87103de99cea
	.xword	0x97f90bea7d04cc7a
	.xword	0xf5f94e9c6d4a3b4b
	.xword	0x179c1b2b4978e43e
	.xword	0xf517942fe1e1d86b
	.xword	0xeb1ac73349171b6d
	.xword	0x9d6e3979df75f8f0
	.xword	0x252cfa8921d7a7c7
	.xword	0x4ca0d98a2d01fa3e
	.xword	0xed18fdf8d3e31cd3
	.xword	0xaf5b211bd16f1891
	.xword	0x40f20af96c900cc9
	.xword	0x5f0bbdc9eb8c5ae4
	.xword	0x57584b9194f38e1e
	.xword	0xfff540871fdf8ce6
	.xword	0xa44ba3dd7ea8ceaf
	.xword	0xdfddafd8a1bd232f
	.xword	0xf172efd30a8a3d50
	.xword	0x1c5e0093723abde3
	.xword	0xca335b90e865bf43
	.xword	0x261f7b0c39a4a1eb
	.xword	0xb3112a05caf0353f
	.xword	0xef7f2d4e1c22b7b1
	.xword	0x9ac6e82ebdd76dc7
	.xword	0xd01c28529a2b96db
	.xword	0x1b03818db740a62b
	.xword	0xf3d2c90679623c8d
	.xword	0x1b86227bf401afe5
	.xword	0x6e8893805336905b
	.xword	0x90f2d82094811372
	.xword	0xbd5ffcf4623a9b77



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
	TTE_Size	 = 3,
	TTE_NFO	 = 1,
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


attr_data {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 5,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	.xword	0xc41c3c41fd49c05e
	.xword	0x8e38d39fba826ef1
	.xword	0x72caf50c13b85b36
	.xword	0xd31663a741386132
	.xword	0x85c0a9027ce27e6d
	.xword	0x7191abd594beff85
	.xword	0xf3dd6559cc8e24b6
	.xword	0x9b9cfff64f8efc3b
	.xword	0xd75454595850fa1e
	.xword	0x3ad0259faf35ee66
	.xword	0xc250474aff6a0840
	.xword	0x4ab61a39426cdd24
	.xword	0x377896d4a92b9fac
	.xword	0xe82a8056d3e7ffe1
	.xword	0x1b0d0dfddbdcc915
	.xword	0xc90f57fc0453d9c6
	.xword	0x886ec4a5b607e80b
	.xword	0x36d02d80e03b5434
	.xword	0x62d978d6907714a4
	.xword	0x7db376b848f36ed1
	.xword	0xe4611a2fa8993908
	.xword	0x2cbaca15065bc58d
	.xword	0x40639a747fa8e07c
	.xword	0x307c6404ed193c20
	.xword	0x49806f05531fe453
	.xword	0x12064ebfc96affc4
	.xword	0x4b842ceed9ec5bd9
	.xword	0xe60bc6e281ca2e97
	.xword	0x19b4cfa4aa7e66d2
	.xword	0xc3b3d7dc0d1a722f
	.xword	0xc7dc438a820a28e1
	.xword	0xc58457beb374bf9f





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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f6
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
	TTE_W	 = 0
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f8
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
	TTE_Size	 = 0,
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

.text
nuff_said_2:
	fdivd %f0, %f4, %f6
	jmpl %r27+8, %r0
	fdivs %f0, %f4, %f6



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f4
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
	TTE_P	 = 0,
	TTE_W	 = 1,
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
