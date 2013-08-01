/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_fcrand05_ind_23.s
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
	mov 0xb4, %r14
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
	mov 0xb3, %r14
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
	mov 0xb5, %r14
	mov 0xb4, %r30
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
	mov 0x35, %r14
	mov 0xb4, %r30
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
	.word 0x9f802d5d  ! 1: SIR	sir	0x0d5d
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
    ta T_CHANGE_NONHPRIV 
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_0:
	rd %pc, %r12
	add %r12, (donretarg_80_0-donret_80_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00795100 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe9e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_80_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_2:
	.word 0x8f902001  ! 2: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xdadfe0b0  ! 3: LDXA_I	ldxa	[%r31, + 0x00b0] %asi, %r13
	.word 0xda800c60  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
ibp_80_3:
	nop
	.word 0xc19fe020  ! 5: LDDFA_I	ldda	[%r31, 0x0020], %f0
intveclr_80_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4d22be5416d87072, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xaf3edb6d83fa4a58, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_80_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_80_7:
	set 0x60140000, %r31
	.word 0x858223b7  ! 9: WRCCR_I	wr	%r8, 0x03b7, %ccr
	.word 0xa1902006  ! 10: WRPR_GL_I	wrpr	%r0, 0x0006, %-
fpinit_80_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 11: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xda8008a0  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_80_9:
	nop
	.word 0x87aa8a54  ! 13: FCMPd	fcmpd	%fcc<n>, %f10, %f20
memptr_80_10:
	set 0x60340000, %r31
	.word 0x85853084  ! 14: WRCCR_I	wr	%r20, 0x1084, %ccr
pmu_80_11:
	nop
	setx 0xffffffa6fffff338, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe130  ! 16: LDD_I	ldd	[%r31 + 0x0130], %r18
	.word 0xe49fc400  ! 17: LDDA_R	ldda	[%r31, %r0] 0x20, %r18
brcommon2_80_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x99a00545  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfd960  ! 18: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_80_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbcd413aaf76ff735, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xca26d114fbccc122, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_15:
	nop
	setx 0xfffff6dcfffff818, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	brlz,a,pn	%r20, skip_80_16
	fbug skip_80_16
.align 128
skip_80_16:
	.word 0x9f8039bb  ! 22: SIR	sir	0x19bb
	.word 0x9a6a72bd  ! 23: UDIVX_I	udivx 	%r9, 0xfffff2bd, %r13
dvapa_80_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe09, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fe170  ! 24: LDDA_I	ldda	[%r31, + 0x0170] %asi, %r19
splash_htba_80_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e0b0  ! 26: LDQFA_I	-	[%r31, 0x00b0], %f19
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d903923  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1923, %pstate
	.word 0x996c0011  ! 28: SDIVX_R	sdivx	%r16, %r17, %r12
splash_hpstate_80_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81982c03  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c03, %hpstate
intveclr_80_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdb56c1cfecc66228, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_22) + 24, 16, 16)) -> intp(4,0,4)
#else
	setx 0x7227f8c5a8b98cda, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_80_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_80_24:
	nop
	ta T_CHANGE_HPRIV
	set 0x97b551c2, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_25:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x81982447  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0447, %hpstate
pmu_80_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff90bfffff2d4, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
iaw_80_27:
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
iaw_startwait80_27:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_27
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_27:
    brnz %r16, iaw_wait80_27
    ld [%r23], %r16
    ba iaw_startwait80_27
    mov 0x80, %r16
continue_iaw_80_27:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_27:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_27
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_27:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_27
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_27:
	mov 0x38, %r18
iaw1_80_27:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5b44482  ! 36: FCMPLE32	fcmple32	%d48, %d2, %r18
jmptr_80_28:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_80_29:
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
iaw_startwait80_29:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_29
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_29:
    brnz %r16, iaw_wait80_29
    ld [%r23], %r16
    ba iaw_startwait80_29
    mov 0x80, %r16
continue_iaw_80_29:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_29:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_29
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_29:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_29
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_29:
	mov 0x38, %r18
iaw3_80_29:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a249a7  ! 38: FDIVs	fdivs	%f9, %f7, %f8
intveclr_80_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe7d6b93748ad582a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_80_31:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fe080  ! 40: LDDF_I	ldd	[%r31, 0x0080], %f13
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 41: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_80_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb995aed9ea0fc12a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_80_33:
	nop
	.word 0xa9a409c7  ! 43: FDIVd	fdivd	%f16, %f38, %f20
	.word 0xa190200c  ! 44: WRPR_GL_I	wrpr	%r0, 0x000c, %-
fpinit_80_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 45: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x91928008  ! 46: WRPR_PIL_R	wrpr	%r10, %r8, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_36:
	rd %pc, %r12
	add %r12, (donretarg_80_36-donret_80_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00384700 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7d7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	retry
donretarg_80_36:
	.word 0xe26fe19b  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x019b]
	.word 0xc19fde00  ! 48: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_80_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_37:
	.word 0x8f902001  ! 49: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	fbn,a,pn	%fcc0,  skip_80_38
	fbuge skip_80_38
.align 1024
skip_80_38:
	.word 0xc30fc000  ! 51: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
intveclr_80_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0xebc2921c4f88fa90, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8029d4  ! 53: SIR	sir	0x09d4
	.word 0xe337e0a0  ! 54: STQF_I	-	%f17, [0x00a0, %r31]
dvapa_80_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfd5, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fda00  ! 55: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe22fe12c  ! 56: STB_I	stb	%r17, [%r31 + 0x012c]
	setx 0xc6080da61f194efc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_80_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a249d4  ! 1: FDIVd	fdivd	%f40, %f20, %f50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe020  ! 58: STDFA_I	stda	%f0, [0x0020, %r31]
jmptr_80_43:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_80_44:
	set 0x60340000, %r31
	.word 0x8584a1f1  ! 60: WRCCR_I	wr	%r18, 0x01f1, %ccr
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
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
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
	.word 0xa1414000  ! 61: RDPC	rd	%pc, %r16
fpinit_80_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b0c  ! 62: PREFETCHA_I	prefetcha	[%r0, + 0x0b0c] %asi, #one_read
	.word 0x83d020b2  ! 63: Tcc_I	te	icc_or_xcc, %r0 + 178
iaw_80_47:
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
iaw_startwait80_47:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_47
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_47:
    brnz %r16, iaw_wait80_47
    ld [%r23], %r16
    ba iaw_startwait80_47
    mov 0x80, %r16
continue_iaw_80_47:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_47:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_47
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_47:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_47
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_47:
	mov 0x38, %r18
iaw4_80_47:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3a189d2  ! 64: FDIVd	fdivd	%f6, %f18, %f48
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
    brnz %r10, sma_80_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 65: CASA_R	casa	[%r31] %asi, %r12, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e1f0  ! 67: STQF_I	-	%f18, [0x01f0, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_80_50:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c844a0  ! 69: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r18
splash_tba_80_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_80_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe48, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc034  ! 71: LDXA_R	ldxa	[%r31, %r20] 0x01, %r18
	.word 0xa348c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r17
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
    brnz %r10, sma_80_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 73: CASA_R	casa	[%r31] %asi, %r8, %r20
mondo_80_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914008  ! 74: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
intveclr_80_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2aef72c487d4cbf6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e16e  ! 76: STQF_I	-	%f20, [0x016e, %r31]
splash_hpstate_80_56:
	ta T_CHANGE_NONHPRIV
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8198275d  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
br_badelay3_80_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a509d1  ! 1: FDIVd	fdivd	%f20, %f48, %f42
	.word 0xa3a48831  ! 78: FADDs	fadds	%f18, %f17, %f17
br_longdelay1_80_58:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 79: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
splash_lsu_80_59:
	nop
	ta T_CHANGE_HPRIV
	set 0xe491e5c8, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91b2c58b  ! 81: FCMPGT32	fcmpgt32	%d42, %d42, %r8
dvapa_80_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc73, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 82: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x9b45c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xa1902006  ! 85: WRPR_GL_I	wrpr	%r0, 0x0006, %-
trapasi_80_62:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8c84b40  ! 86: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r20
brcommon3_80_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e020  ! 1: STQF_I	-	%f20, [0x0020, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe89fc032  ! 87: LDDA_R	ldda	[%r31, %r18] 0x01, %r20
memptr_80_64:
	set 0x60540000, %r31
	.word 0x85816911  ! 88: WRCCR_I	wr	%r5, 0x0911, %ccr
brcommon1_80_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c8  ! 1: PDIST	pdistn	%d62, %d8, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93b2c490  ! 89: FCMPLE32	fcmple32	%d42, %d16, %r9
	.word 0xa2c26f73  ! 90: ADDCcc_I	addccc 	%r9, 0x0f73, %r17
fpinit_80_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 91: FDIVs	fdivs	%f0, %f4, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_67:
	rd %pc, %r12
	add %r12, (donretarg_80_67-donret_80_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006d7500 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c47, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_67:
	.word 0xa1a509cb  ! 92: FDIVd	fdivd	%f20, %f42, %f16
change_to_randtl_80_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x10c4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b407d3  ! 94: PDIST	pdistn	%d16, %d50, %d10
iaw_80_69:
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
iaw_startwait80_69:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_69
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_69:
    brnz %r16, iaw_wait80_69
    ld [%r23], %r16
    ba iaw_startwait80_69
    mov 0x80, %r16
continue_iaw_80_69:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_69:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_69
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_69:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_69
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_69:
	mov 0x38, %r18
iaw3_80_69:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc028  ! 95: LDXA_R	ldxa	[%r31, %r8] 0x01, %r13
splash_tba_80_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x863c117bf39a692e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_80_72:
	set user_data_start, %r31
	.word 0x8580f58a  ! 98: WRCCR_I	wr	%r3, 0x158a, %ccr
fpinit_80_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 99: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_80_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4c33ab44b3a834b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_75:
	rd %pc, %r12
	add %r12, (donretarg_80_75-donret_80_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b60f00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4dc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_75:
	.word 0xa7a509d2  ! 101: FDIVd	fdivd	%f20, %f18, %f50
	.word 0x81da8013  ! 102: FLUSH_R	flush
ibp_80_76:
	nop
	.word 0xc19fd960  ! 103: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe89fe188  ! 104: LDDA_I	ldda	[%r31, + 0x0188] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_77:
	rd %pc, %r12
	add %r12, (donretarg_80_77-donret_80_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004ec500 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1fdd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_77:
	.word 0xa5a149c1  ! 105: FDIVd	fdivd	%f36, %f32, %f18
	.word 0x8d903841  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x1841, %pstate
	.word 0xa553c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab85340a  ! 108: WR_CLEAR_SOFTINT_I	wr	%r20, 0x140a, %clear_softint
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xc1bfdc00  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay3_80_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbf4c9c47	! Random illegal ?
	.word 0xa7a00550  ! 1: FSQRTd	fsqrt	
	.word 0x97a4c82d  ! 111: FADDs	fadds	%f19, %f13, %f11
ibp_80_81:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd897c031  ! 112: LDUHA_R	lduha	[%r31, %r17] 0x01, %r12
memptr_80_82:
	set 0x60740000, %r31
	.word 0x8580fa48  ! 113: WRCCR_I	wr	%r3, 0x1a48, %ccr
mondo_80_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944011  ! 114: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xa5508000  ! 115: RDPR_TSTATE	rdpr	%tstate, %r18
splash_lsu_80_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x8af9f44b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_85:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 117: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_80_86:
	ta T_CHANGE_NONHPRIV
	.word 0x8198345e  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x145e, %hpstate
	.word 0xa190200b  ! 119: WRPR_GL_I	wrpr	%r0, 0x000b, %-
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
    brnz %r10, sma_80_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 120: CASA_R	casa	[%r31] %asi, %r18, %r16
mondo_80_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94000b  ! 121: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
splash_lsu_80_89:
	nop
	ta T_CHANGE_HPRIV
	set 0xe523137c, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_80_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1e7e014  ! 123: CASA_R	casa	[%r31] %asi, %r20, %r16
dvapa_80_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbc8, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfda00  ! 124: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
iaw_80_92:
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
iaw_startwait80_92:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_92
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_92:
    brnz %r16, iaw_wait80_92
    ld [%r23], %r16
    ba iaw_startwait80_92
    mov 0x80, %r16
continue_iaw_80_92:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_92:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_92
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_92:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_92
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_92:
	mov 0x38, %r18
iaw2_80_92:
	rdpr %tba, %r19
	mov 0x102,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe097c028  ! 126: LDUHA_R	lduha	[%r31, %r8] 0x01, %r16
	setx 0xf00effcf728451af, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 128: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe0d7e178  ! 129: LDSHA_I	ldsha	[%r31, + 0x0178] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_94) + 48, 16, 16)) -> intp(3,0,14)
#else
	setx 0x0e3c767779353b92, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 131: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902613  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x0613, %pstate
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903abe  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x1abe, %pstate
	setx 0x44c545a7a579f8dd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_80_99:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec4032  ! 136: PREFETCHA_R	prefetcha	[%r17, %r18] 0x01, #one_read
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_80_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_101:
	.word 0x8f902000  ! 138: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_80_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe038  ! 140: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_103:
	rd %pc, %r12
	add %r12, (donretarg_80_103-donret_80_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fc4600 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdc7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_80_103:
	.word 0xe86fe176  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x0176]
trapasi_80_104:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8d84b60  ! 142: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r20
fpinit_80_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 143: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_80_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_107:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_80_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9cb, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe89fe0d0  ! 146: LDDA_I	ldda	[%r31, + 0x00d0] %asi, %r20
	setx 0xffb3421e31543a02, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe1b8  ! 148: LDSBA_I	ldsba	[%r31, + 0x01b8] %asi, %r20
	.word 0xa7810011  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r17, %-
iaw_80_111:
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
iaw_startwait80_111:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_111
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_111:
    brnz %r16, iaw_wait80_111
    ld [%r23], %r16
    ba iaw_startwait80_111
    mov 0x80, %r16
continue_iaw_80_111:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_111:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_111
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_111:
	mov 0x38, %r18
iaw4_80_111:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe83fe060  ! 150: STD_I	std	%r20, [%r31 + 0x0060]
br_longdelay3_80_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93a00552  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe1a0  ! 153: LDDFA_I	ldda	[%r31, 0x01a0], %f0
splash_cmpr_80_113:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 154: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x879c4011  ! 155: WRHPR_HINTP_R	wrhpr	%r17, %r17, %hintp
	.word 0x91910004  ! 156: WRPR_PIL_R	wrpr	%r4, %r4, %pil
ibp_80_115:
	nop
	.word 0xd697c02a  ! 157: LDUHA_R	lduha	[%r31, %r10] 0x01, %r11
fpinit_80_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 158: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_117:
	rd %pc, %r12
	add %r12, (donretarg_80_117-donret_80_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e75d00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d42, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_117:
	.word 0xd6ffe0bc  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x00bc] %asi
	.word 0xd6dfe1c8  ! 160: LDXA_I	ldxa	[%r31, + 0x01c8] %asi, %r11
jmptr_80_118:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_80_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc3b, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3e8c031  ! 162: PREFETCHA_R	prefetcha	[%r3, %r17] 0x01, #one_read
	.word 0xa980800b  ! 163: WR_SET_SOFTINT_R	wr	%r2, %r11, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_120:
	rd %pc, %r12
	add %r12, (donretarg_80_120-donret_80_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005fc200 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e8d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_120:
	.word 0xa3a089d3  ! 164: FDIVd	fdivd	%f2, %f50, %f48
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
    brnz %r10, sma_80_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 165: CASA_R	casa	[%r31] %asi, %r12, %r20
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d903243  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x1243, %pstate
	.word 0x8d802000  ! 167: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x1b4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b047d4  ! 169: PDIST	pdistn	%d32, %d20, %d10
iaw_80_124:
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
iaw_startwait80_124:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_124
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_124:
    brnz %r16, iaw_wait80_124
    ld [%r23], %r16
    ba iaw_startwait80_124
    mov 0x80, %r16
continue_iaw_80_124:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_124:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_124
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_124:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_124
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_124:
	mov 0x38, %r18
iaw2_80_124:
	rdpr %tba, %r19
	mov 0x21,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe1b0  ! 170: STD_I	std	%r16, [%r31 + 0x01b0]
splash_hpstate_80_125:
	.word 0x81983d80  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d80, %hpstate
memptr_80_126:
	set user_data_start, %r31
	.word 0x85847cbd  ! 172: WRCCR_I	wr	%r17, 0x1cbd, %ccr
	.word 0x8d903897  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1897, %pstate
splash_cmpr_80_128:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 174: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	bneg  	 skip_80_129
	bge,a	 skip_80_129
.align 512
skip_80_129:
	.word 0xe03fc000  ! 175: STD_R	std	%r16, [%r31 + %r0]
brcommon2_80_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a509ca  ! 1: FDIVd	fdivd	%f20, %f10, %f50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1a0  ! 176: STDFA_I	stda	%f0, [0x01a0, %r31]
splash_cmpr_80_131:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 177: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_80_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_80_135:
	set user_data_start, %r31
	.word 0x858123b3  ! 182: WRCCR_I	wr	%r4, 0x03b3, %ccr
memptr_80_136:
	set 0x60740000, %r31
	.word 0x85837ece  ! 183: WRCCR_I	wr	%r13, 0x1ece, %ccr
	.word 0xe677e1a5  ! 184: STX_I	stx	%r19, [%r31 + 0x01a5]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_80_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 186: FCMPLE32	fcmple32	%d0, %d4, %r6
iaw_80_139:
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
iaw_startwait80_139:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_139
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_139:
    brnz %r16, iaw_wait80_139
    ld [%r23], %r16
    ba iaw_startwait80_139
    mov 0x80, %r16
continue_iaw_80_139:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_139:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_139
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_139:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_139
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_139:
	mov 0x38, %r18
iaw1_80_139:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe060  ! 187: STDFA_I	stda	%f0, [0x0060, %r31]
fpinit_80_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 188: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ceter_80_141:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 189: RDTICK	rd	%tick, %r18
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802000  ! 191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_142:
	rd %pc, %r12
	add %r12, (donretarg_80_142-donret_80_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0093f000 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1383, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_142:
	.word 0xd2ffe114  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x0114] %asi
	.word 0x87984014  ! 193: WRHPR_HINTP_R	wrhpr	%r1, %r20, %hintp
splash_cmpr_80_143:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 194: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_80_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_144
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
cwq_80_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 195: RDPC	rd	%pc, %r8
br_badelay2_80_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f10, %f8
	.word 0x95b1c310  ! 196: ALIGNADDRESS	alignaddr	%r7, %r16, %r10
splash_tba_80_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe150  ! 200: LDD_I	ldd	[%r31 + 0x0150], %r8
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
    brnz %r10, cwq_80_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_147
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
cwq_80_147:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 201: RDPC	rd	%pc, %r8
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
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_0:
	rd %pc, %r12
	add %r12, (donretarg_40_0-donret_40_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005ec500 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15d4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_40_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_2:
	.word 0x8f902000  ! 2: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xdadfe1e0  ! 3: LDXA_I	ldxa	[%r31, + 0x01e0] %asi, %r13
	.word 0xda800c40  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r13
ibp_40_3:
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
ibp_startwait40_3:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_3
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_3:
    brnz %r16, ibp_wait40_3
    ld [%r23], %r16
    ba ibp_startwait40_3
    mov 0x40, %r16
continue_ibp_40_3:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_3:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_3
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_3:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_3
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_3:
    best_set_reg(0x00000050f6c000e8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfdf20  ! 5: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_40_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbbe7b6060009f819, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x8eecbae84e27052d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_40_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_40_7:
	set 0x60540000, %r31
	.word 0x8582a469  ! 9: WRCCR_I	wr	%r10, 0x0469, %ccr
	.word 0xa1902000  ! 10: WRPR_GL_I	wrpr	%r0, 0x0000, %-
fpinit_40_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 11: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xda800ba0  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r13
ibp_40_9:
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
ibp_startwait40_9:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_9
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_9:
    brnz %r16, ibp_wait40_9
    ld [%r23], %r16
    ba ibp_startwait40_9
    mov 0x40, %r16
continue_ibp_40_9:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_9:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_9
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_9:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_9
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_9:
    best_set_reg(0x000000401ac0e8ce,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x97a489d3  ! 13: FDIVd	fdivd	%f18, %f50, %f42
memptr_40_10:
	set 0x60140000, %r31
	.word 0x85843a19  ! 14: WRCCR_I	wr	%r16, 0x1a19, %ccr
pmu_40_11:
	nop
	setx 0xfffff171fffff132, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe0f8  ! 16: LDD_I	ldd	[%r31 + 0x00f8], %r18
	.word 0xe49fdd40  ! 17: LDDA_R	ldda	[%r31, %r0] 0xea, %r18
brcommon2_40_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe170  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0170], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe1e0  ! 18: STDFA_I	stda	%f16, [0x01e0, %r31]
intveclr_40_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x329d09d4d2847369, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2a2b550d5bdd4a40, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_15:
	nop
	setx 0xfffff716fffff2ce, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbge,a,pn	%fcc0,  skip_40_16
	bn  	 skip_40_16
.align 128
skip_40_16:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x946cb8e1  ! 23: UDIVX_I	udivx 	%r18, 0xfffff8e1, %r10
dvapa_40_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0x91e, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6dfc032  ! 24: LDXA_R	ldxa	[%r31, %r18] 0x01, %r19
splash_htba_40_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e0f8  ! 26: LDQFA_I	-	[%r31, 0x00f8], %f19
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903d13  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1d13, %pstate
	.word 0x936ac011  ! 28: SDIVX_R	sdivx	%r11, %r17, %r9
splash_hpstate_40_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81983f4b  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4b, %hpstate
intveclr_40_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xff2941297601eb28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_22) + 24, 16, 16)) -> intp(6,0,0)
#else
	setx 0x79e3224db029c39c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_40_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_40_24:
	nop
	ta T_CHANGE_HPRIV
	set 0x3a9a8c70, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_25:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8198359d  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x159d, %hpstate
pmu_40_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffea6fffff4b4, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a409b1  ! 36: FDIVs	fdivs	%f16, %f17, %f10
jmptr_40_28:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x87ac8a53  ! 38: FCMPd	fcmpd	%fcc<n>, %f18, %f50
intveclr_40_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0x126ba7fdfea5e090, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_40_31:
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
ibp_startwait40_31:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_31
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_31:
    brnz %r16, ibp_wait40_31
    ld [%r23], %r16
    ba ibp_startwait40_31
    mov 0x40, %r16
continue_ibp_40_31:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_31:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_31
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_31:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_31
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_31:
    best_set_reg(0x00000050c8e8ce07,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc033  ! 40: STDA_R	stda	%r13, [%r31 + %r19] 0x01
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 41: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_40_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9e3ffe8ae6aa1468, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_40_33:
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
ibp_startwait40_33:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_33
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_33:
    brnz %r16, ibp_wait40_33
    ld [%r23], %r16
    ba ibp_startwait40_33
    mov 0x40, %r16
continue_ibp_40_33:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_33:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_33
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_33:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_33
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_33:
    best_set_reg(0x00000050ccce07ca,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa9b4c7d2  ! 43: PDIST	pdistn	%d50, %d18, %d20
	.word 0xa190200f  ! 44: WRPR_GL_I	wrpr	%r0, 0x000f, %-
fpinit_40_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 45: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91940001  ! 46: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_36:
	rd %pc, %r12
	add %r12, (donretarg_40_36-donret_40_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f91000 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x687, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_36:
	.word 0xe26fe0d6  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x00d6]
	.word 0xc19fd920  ! 48: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_40_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_37:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	brlz,pn  	%r18, skip_40_38
	.word 0x87aa0a48  ! 1: FCMPd	fcmpd	%fcc<n>, %f8, %f8
.align 1024
skip_40_38:
	.word 0xe23fc000  ! 51: STD_R	std	%r17, [%r31 + %r0]
intveclr_40_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x02e986b5e8863778, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80372e  ! 53: SIR	sir	0x172e
	.word 0xe337e1f0  ! 54: STQF_I	-	%f17, [0x01f0, %r31]
dvapa_40_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0xed6, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe140  ! 55: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xe22fe196  ! 56: STB_I	stb	%r17, [%r31 + 0x0196]
	setx 0xe7f82cab072127d2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_40_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc013  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 58: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_40_43:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_40_44:
	set 0x60740000, %r31
	.word 0x85853367  ! 60: WRCCR_I	wr	%r20, 0x1367, %ccr
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
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
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
	.word 0xa9414000  ! 61: RDPC	rd	%pc, %r20
fpinit_40_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 62: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x93d020b5  ! 63: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xa1b047d1  ! 64: PDIST	pdistn	%d32, %d48, %d16
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
    brnz %r10, sma_40_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 65: CASA_R	casa	[%r31] %asi, %r10, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e088  ! 67: STQF_I	-	%f18, [0x0088, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_40_50:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 69: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
splash_tba_40_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_40_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdce, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe49fe190  ! 71: LDDA_I	ldda	[%r31, + 0x0190] %asi, %r18
	.word 0x9548c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r10
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
    brnz %r10, sma_40_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 73: CASA_R	casa	[%r31] %asi, %r11, %r20
mondo_40_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91800b  ! 74: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
intveclr_40_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfd86b6ae9a88f663, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e03a  ! 76: STQF_I	-	%f20, [0x003a, %r31]
splash_hpstate_40_56:
	ta T_CHANGE_NONHPRIV
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8198358f  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x158f, %hpstate
br_badelay3_40_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa9a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f20
	.word 0xa5a44832  ! 78: FADDs	fadds	%f17, %f18, %f18
br_longdelay1_40_58:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 79: SAVE_R	save	%r31, %r0, %r31
splash_lsu_40_59:
	nop
	ta T_CHANGE_HPRIV
	set 0x7bf6a65d, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3b28594  ! 81: FCMPGT32	fcmpgt32	%d10, %d20, %r17
dvapa_40_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeda, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd51fc00b  ! 82: LDDF_R	ldd	[%r31, %r11], %f10
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa345c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xa1902002  ! 85: WRPR_GL_I	wrpr	%r0, 0x0002, %-
trapasi_40_62:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8d04b40  ! 86: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r20
brcommon3_40_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e1c0  ! 1: STQF_I	-	%f20, [0x01c0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc010  ! 87: STXFSR_R	st-sfr	%f1, [%r16, %r31]
memptr_40_64:
	set 0x60540000, %r31
	.word 0x85816633  ! 88: WRCCR_I	wr	%r5, 0x0633, %ccr
brcommon1_40_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d3  ! 1: PDIST	pdistn	%d62, %d50, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99a4c9d3  ! 89: FDIVd	fdivd	%f50, %f50, %f12
	.word 0xa8c179b2  ! 90: ADDCcc_I	addccc 	%r5, 0xfffff9b2, %r20
fpinit_40_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 91: FCMPLE32	fcmple32	%d0, %d4, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_67:
	rd %pc, %r12
	add %r12, (donretarg_40_67-donret_40_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00425800 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x77f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_40_67:
	.word 0xa1a2c9ca  ! 92: FDIVd	fdivd	%f42, %f10, %f16
change_to_randtl_40_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x2159, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b207d4  ! 94: PDIST	pdistn	%d8, %d20, %d8
	.word 0xda9fe010  ! 95: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r13
splash_tba_40_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x3d1f75cdca9ae9a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_72:
	set user_data_start, %r31
	.word 0x8584eeac  ! 98: WRCCR_I	wr	%r19, 0x0eac, %ccr
fpinit_40_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 99: FDIVs	fdivs	%f0, %f4, %f6
intveclr_40_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0xceb5bf0d12d465ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_75:
	rd %pc, %r12
	add %r12, (donretarg_40_75-donret_40_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0068af00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x385, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_75:
	.word 0xa7a2c9d0  ! 101: FDIVd	fdivd	%f42, %f16, %f50
	.word 0x81dd0013  ! 102: FLUSH_R	flush
ibp_40_76:
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
ibp_startwait40_76:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_76
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_76:
    brnz %r16, ibp_wait40_76
    ld [%r23], %r16
    ba ibp_startwait40_76
    mov 0x40, %r16
continue_ibp_40_76:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_76:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_76
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_76:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_76
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_76:
    best_set_reg(0x000000403dc7cad8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fe140  ! 103: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xe89fe0f0  ! 104: LDDA_I	ldda	[%r31, + 0x00f0] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_77:
	rd %pc, %r12
	add %r12, (donretarg_40_77-donret_40_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006d3700 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c96, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_77:
	.word 0xa7a4c9c9  ! 105: FDIVd	fdivd	%f50, %f40, %f50
	.word 0x8d903ca4  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x1ca4, %pstate
	.word 0x9953c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab84fcd8  ! 108: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1cd8, %clear_softint
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xc1bfda00  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay3_40_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa34bade1	! Random illegal ?
	.word 0xa7a00546  ! 1: FSQRTd	fsqrt	
	.word 0xa3a28831  ! 111: FADDs	fadds	%f10, %f17, %f17
ibp_40_81:
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
ibp_startwait40_81:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_81
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_81:
    brnz %r16, ibp_wait40_81
    ld [%r23], %r16
    ba ibp_startwait40_81
    mov 0x40, %r16
continue_ibp_40_81:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_81:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_81
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_81:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_81
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_81:
    best_set_reg(0x00000040a5cad8b9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc011  ! 112: STDF_R	std	%f12, [%r17, %r31]
memptr_40_82:
	set 0x60740000, %r31
	.word 0x85853f4d  ! 113: WRCCR_I	wr	%r20, 0x1f4d, %ccr
mondo_40_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d920014  ! 114: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0x9b508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_40_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x67fda055, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_85:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 117: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_40_86:
	ta T_CHANGE_NONHPRIV
	.word 0x81983485  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1485, %hpstate
	.word 0xa1902002  ! 119: WRPR_GL_I	wrpr	%r0, 0x0002, %-
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
    brnz %r10, sma_40_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 120: CASA_R	casa	[%r31] %asi, %r9, %r16
mondo_40_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d910005  ! 121: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
splash_lsu_40_89:
	nop
	ta T_CHANGE_HPRIV
	set 0xbc5c7b7e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_40_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc014  ! 123: STXFSR_R	st-sfr	%f1, [%r20, %r31]
dvapa_40_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaf9, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe160  ! 124: LDDFA_I	ldda	[%r31, 0x0160], %f16
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
	.word 0xe0dfc032  ! 126: LDXA_R	ldxa	[%r31, %r18] 0x01, %r16
	setx 0x2ccb201f1e6c9ca4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0d7e018  ! 129: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_94) + 24, 16, 16)) -> intp(2,0,4)
#else
	setx 0xc461ae272473dd11, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 131: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90306f  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x106f, %pstate
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903903  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x1903, %pstate
	setx 0xdf9f3de2ab403e18, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_40_99:
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
ibp_startwait40_99:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_99
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_99:
    brnz %r16, ibp_wait40_99
    ld [%r23], %r16
    ba ibp_startwait40_99
    mov 0x40, %r16
continue_ibp_40_99:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_99:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_99
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_99:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_99
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_99:
    best_set_reg(0x0000005034d8b98e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3e98024  ! 136: PREFETCHA_R	prefetcha	[%r6, %r4] 0x01, #one_read
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_40_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_101:
	.word 0x8f902001  ! 138: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_40_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe100  ! 140: LDSBA_I	ldsba	[%r31, + 0x0100] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_103:
	rd %pc, %r12
	add %r12, (donretarg_40_103-donret_40_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e4ed00 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x125f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_103:
	.word 0xe86fe07d  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x007d]
trapasi_40_104:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8c04b60  ! 142: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r20
fpinit_40_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 143: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_40_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_107:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_40_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa88, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe897c032  ! 146: LDUHA_R	lduha	[%r31, %r18] 0x01, %r20
	setx 0xf03cd93033b22db3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe060  ! 148: LDSBA_I	ldsba	[%r31, + 0x0060] %asi, %r20
	.word 0xa784400b  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r11, %-
	.word 0xe91fe060  ! 150: LDDF_I	ldd	[%r31, 0x0060], %f20
br_longdelay3_40_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa1a00552  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe000  ! 153: LDDFA_I	ldda	[%r31, 0x0000], %f0
splash_cmpr_40_113:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 154: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x879b4005  ! 155: WRHPR_HINTP_R	wrhpr	%r13, %r5, %hintp
	.word 0x9194800c  ! 156: WRPR_PIL_R	wrpr	%r18, %r12, %pil
ibp_40_115:
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
ibp_startwait40_115:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_115
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_115:
    brnz %r16, ibp_wait40_115
    ld [%r23], %r16
    ba ibp_startwait40_115
    mov 0x40, %r16
continue_ibp_40_115:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_115:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_115
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_115:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_40_115
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_115:
    best_set_reg(0x00000050bcf98e1e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd73fc012  ! 157: STDF_R	std	%f11, [%r18, %r31]
fpinit_40_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 158: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_117:
	rd %pc, %r12
	add %r12, (donretarg_40_117-donret_40_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00617000 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_117:
	.word 0xd6ffe0c4  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x00c4] %asi
	.word 0xd6dfe1e8  ! 160: LDXA_I	ldxa	[%r31, + 0x01e8] %asi, %r11
jmptr_40_118:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_40_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeb2, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5b44490  ! 162: FCMPLE32	fcmple32	%d48, %d16, %r18
	.word 0xa982800b  ! 163: WR_SET_SOFTINT_R	wr	%r10, %r11, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_120:
	rd %pc, %r12
	add %r12, (donretarg_40_120-donret_40_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00db4300 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc8c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_120:
	.word 0x91a309c6  ! 164: FDIVd	fdivd	%f12, %f6, %f8
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
    brnz %r10, sma_40_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 165: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d9034ac  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x14ac, %pstate
	.word 0x8d802000  ! 167: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x2cd8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b047d1  ! 169: PDIST	pdistn	%d32, %d48, %d20
	.word 0xe11fe1a0  ! 170: LDDF_I	ldd	[%r31, 0x01a0], %f16
splash_hpstate_40_125:
	.word 0x81983bad  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bad, %hpstate
memptr_40_126:
	set user_data_start, %r31
	.word 0x8582bff0  ! 172: WRCCR_I	wr	%r10, 0x1ff0, %ccr
	.word 0x8d903165  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1165, %pstate
splash_cmpr_40_128:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 174: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	bgu,a	 skip_40_129
	fbge,a,pn	%fcc0,  skip_40_129
.align 512
skip_40_129:
	.word 0xe1e7c020  ! 175: CASA_I	casa	[%r31] 0x 1, %r0, %r16
brcommon2_40_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1b7c70a  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f10, %d16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe180  ! 176: LDDFA_I	ldda	[%r31, 0x0180], %f0
splash_cmpr_40_131:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 177: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_40_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_40_135:
	set user_data_start, %r31
	.word 0x8584b0f9  ! 182: WRCCR_I	wr	%r18, 0x10f9, %ccr
memptr_40_136:
	set 0x60540000, %r31
	.word 0x8581ffbc  ! 183: WRCCR_I	wr	%r7, 0x1fbc, %ccr
	.word 0xe677e1d2  ! 184: STX_I	stx	%r19, [%r31 + 0x01d2]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_40_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 186: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xe19fc3e0  ! 187: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_40_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 188: FDIVs	fdivs	%f0, %f4, %f8
ceter_40_141:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa7410000  ! 189: RDTICK	rd	%tick, %r19
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802000  ! 191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_142:
	rd %pc, %r12
	add %r12, (donretarg_40_142-donret_40_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c4af00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x170e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_142:
	.word 0xd2ffe0d7  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x00d7] %asi
	.word 0x879d0014  ! 193: WRHPR_HINTP_R	wrhpr	%r20, %r20, %hintp
splash_cmpr_40_143:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 194: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_40_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_144
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
cwq_40_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 195: RDPC	rd	%pc, %r18
br_badelay2_40_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f8, %f16
	.word 0xa5b34308  ! 196: ALIGNADDRESS	alignaddr	%r13, %r8, %r18
splash_tba_40_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe098  ! 200: LDD_I	ldd	[%r31 + 0x0098], %r8
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
    brnz %r10, cwq_40_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_147
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
cwq_40_147:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 201: RDPC	rd	%pc, %r20
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
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_0:
	rd %pc, %r12
	add %r12, (donretarg_20_0-donret_20_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b1c100 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a9b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_20_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_2:
	.word 0x8f902000  ! 2: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xdadfe190  ! 3: LDXA_I	ldxa	[%r31, + 0x0190] %asi, %r13
	.word 0xda8008a0  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_20_3:
	nop
	.word 0xc1bfd960  ! 5: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_20_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc6b47d022990d544, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xa4dbb4b8c8b58049, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_20_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_20_7:
	set 0x60540000, %r31
	.word 0x858130df  ! 9: WRCCR_I	wr	%r4, 0x10df, %ccr
	.word 0xa1902006  ! 10: WRPR_GL_I	wrpr	%r0, 0x0006, %-
fpinit_20_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 11: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xda800b80  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r13
ibp_20_9:
	nop
	.word 0x87a88a49  ! 13: FCMPd	fcmpd	%fcc<n>, %f2, %f40
memptr_20_10:
	set 0x60340000, %r31
	.word 0x8584b0dc  ! 14: WRCCR_I	wr	%r18, 0x10dc, %ccr
pmu_20_11:
	nop
	setx 0xfffffe12fffffc72, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe1f8  ! 16: LDD_I	ldd	[%r31 + 0x01f8], %r18
	.word 0xe49fc2c0  ! 17: LDDA_R	ldda	[%r31, %r0] 0x16, %r18
brcommon2_20_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x97a00552  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe160  ! 18: STDFA_I	stda	%f0, [0x0160, %r31]
intveclr_20_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xec1e8ef65a2a1267, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5b7879ef02cb3b8b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_15:
	nop
	setx 0xfffff216fffff1db, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc368bd58  ! 22: PREFETCH_I	prefetch	[%r2 + 0xfffffd58], #one_read
	.word 0xa66c6ca4  ! 23: UDIVX_I	udivx 	%r17, 0x0ca4, %r19
dvapa_20_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeb9, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc031  ! 24: STDA_R	stda	%r19, [%r31 + %r17] 0x01
splash_htba_20_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e080  ! 26: LDQFA_I	-	[%r31, 0x0080], %f19
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d903a89  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1a89, %pstate
	.word 0x9969c010  ! 28: SDIVX_R	sdivx	%r7, %r16, %r12
splash_hpstate_20_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d04  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
intveclr_20_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x71e13f786a2b7825, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_22) + 40, 16, 16)) -> intp(5,0,30)
#else
	setx 0x7552560800a84ebc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_20_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_20_24:
	nop
	ta T_CHANGE_HPRIV
	set 0x1386ad37, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_25:
	.word 0x22cc4001  ! 1: BRZ	brz,a,pt	%r17,<label_0xc4001>
	.word 0x81982e41  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
pmu_20_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff928fffff0b6, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a049a5  ! 36: FDIVs	fdivs	%f1, %f5, %f16
jmptr_20_28:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa1a049a6  ! 38: FDIVs	fdivs	%f1, %f6, %f16
intveclr_20_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2d433e280fe520ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_20_31:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 40: CASA_R	casa	[%r31] %asi, %r20, %r13
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 41: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_20_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf28810c191ad117, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_20_33:
	nop
	.word 0xa1b2c481  ! 43: FCMPLE32	fcmple32	%d42, %d32, %r16
	.word 0xa1902006  ! 44: WRPR_GL_I	wrpr	%r0, 0x0006, %-
fpinit_20_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 45: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x91904007  ! 46: WRPR_PIL_R	wrpr	%r1, %r7, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_36:
	rd %pc, %r12
	add %r12, (donretarg_20_36-donret_20_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eec300 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1717, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	retry
donretarg_20_36:
	.word 0xe26fe15f  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x015f]
	.word 0xc19fda00  ! 48: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_20_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_37:
	.word 0x8f902002  ! 49: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe3e7c020  ! 51: CASA_I	casa	[%r31] 0x 1, %r0, %r17
intveclr_20_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x58def17e72eb78c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x87afca52  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f18
	.word 0x9f803f3b  ! 53: SIR	sir	0x1f3b
	.word 0xe337e022  ! 54: STQF_I	-	%f17, [0x0022, %r31]
dvapa_20_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8fd, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe100  ! 55: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0xe22fe19a  ! 56: STB_I	stb	%r17, [%r31 + 0x019a]
	setx 0x67afc26bdf814b5f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_20_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a509c5  ! 1: FDIVd	fdivd	%f20, %f36, %f20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe100  ! 58: LDDFA_I	ldda	[%r31, 0x0100], %f16
jmptr_20_43:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_20_44:
	set 0x60140000, %r31
	.word 0x8582fad9  ! 60: WRCCR_I	wr	%r11, 0x1ad9, %ccr
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
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
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
	.word 0x99414000  ! 61: RDPC	rd	%pc, %r12
fpinit_20_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 62: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x93d02034  ! 63: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93a509cb  ! 64: FDIVd	fdivd	%f20, %f42, %f40
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
    brnz %r10, sma_20_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 65: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e029  ! 67: STQF_I	-	%f18, [0x0029, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_20_50:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4d044a0  ! 69: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r18
splash_tba_20_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_20_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb45, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc02d  ! 71: LDXA_R	ldxa	[%r31, %r13] 0x01, %r18
	.word 0xa948c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r20
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
    brnz %r10, sma_20_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 73: CASA_R	casa	[%r31] %asi, %r18, %r20
mondo_20_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 74: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
intveclr_20_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6af123bcb2ed29e2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e1c8  ! 76: STQF_I	-	%f20, [0x01c8, %r31]
splash_hpstate_20_56:
	ta T_CHANGE_NONHPRIV
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982d4d  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4d, %hpstate
br_badelay3_20_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a209d3  ! 1: FDIVd	fdivd	%f8, %f50, %f16
	.word 0x95a14823  ! 78: FADDs	fadds	%f5, %f3, %f10
br_longdelay1_20_58:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0xbfe7c000  ! 79: SAVE_R	save	%r31, %r0, %r31
splash_lsu_20_59:
	nop
	ta T_CHANGE_HPRIV
	set 0xcc0bb27e, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7b50585  ! 81: FCMPGT32	fcmpgt32	%d20, %d36, %r19
dvapa_20_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa89, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd497c030  ! 82: LDUHA_R	lduha	[%r31, %r16] 0x01, %r10
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa145c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xa190200f  ! 85: WRPR_GL_I	wrpr	%r0, 0x000f, %-
trapasi_20_62:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8c04b40  ! 86: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r20
brcommon3_20_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e1d0  ! 1: STQF_I	-	%f20, [0x01d0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe91fe0a0  ! 87: LDDF_I	ldd	[%r31, 0x00a0], %f20
memptr_20_64:
	set 0x60740000, %r31
	.word 0x8581368b  ! 88: WRCCR_I	wr	%r4, 0x168b, %ccr
brcommon1_20_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7cd  ! 1: PDIST	pdistn	%d62, %d44, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7b44491  ! 89: FCMPLE32	fcmple32	%d48, %d48, %r19
	.word 0xa2c4b1ed  ! 90: ADDCcc_I	addccc 	%r18, 0xfffff1ed, %r17
fpinit_20_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 91: FDIVs	fdivs	%f0, %f4, %f6
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_67:
	rd %pc, %r12
	add %r12, (donretarg_20_67-donret_20_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aed500 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10d1, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_20_67:
	.word 0xa9a489d1  ! 92: FDIVd	fdivd	%f18, %f48, %f20
change_to_randtl_20_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0xc1d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b507d3  ! 94: PDIST	pdistn	%d20, %d50, %d16
	.word 0xda9fe1b0  ! 95: LDDA_I	ldda	[%r31, + 0x01b0] %asi, %r13
splash_tba_20_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x1c3e6f9f4812fb7a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_20_72:
	set user_data_start, %r31
	.word 0x85853a29  ! 98: WRCCR_I	wr	%r20, 0x1a29, %ccr
fpinit_20_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 99: FDIVd	fdivd	%f0, %f4, %f8
intveclr_20_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x454b94f7c2709d8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_75:
	rd %pc, %r12
	add %r12, (donretarg_20_75-donret_20_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008a7100 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1257, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_75:
	.word 0xa5a489d3  ! 101: FDIVd	fdivd	%f18, %f50, %f18
	.word 0x81dd0014  ! 102: FLUSH_R	flush
ibp_20_76:
	nop
	.word 0xe19fe180  ! 103: LDDFA_I	ldda	[%r31, 0x0180], %f16
	.word 0xe89fe090  ! 104: LDDA_I	ldda	[%r31, + 0x0090] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_77:
	rd %pc, %r12
	add %r12, (donretarg_20_77-donret_20_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c3aa00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc96, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_77:
	.word 0xa1a489d3  ! 105: FDIVd	fdivd	%f18, %f50, %f16
	.word 0x8d90317b  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x117b, %pstate
	.word 0xa353c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab842312  ! 108: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0312, %clear_softint
invtsb_20_79:
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
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xc1bfdb60  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay3_20_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb971c313	! Random illegal ?
	.word 0x9ba00551  ! 1: FSQRTd	fsqrt	
	.word 0x99a4882d  ! 111: FADDs	fadds	%f18, %f13, %f12
ibp_20_81:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd897c033  ! 112: LDUHA_R	lduha	[%r31, %r19] 0x01, %r12
memptr_20_82:
	set 0x60740000, %r31
	.word 0x8584fc12  ! 113: WRCCR_I	wr	%r19, 0x1c12, %ccr
mondo_20_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d91000b  ! 114: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0x93508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_20_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x66e7f617, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_85:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 117: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_20_86:
	ta T_CHANGE_NONHPRIV
	.word 0x81983f4f  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4f, %hpstate
	.word 0xa1902000  ! 119: WRPR_GL_I	wrpr	%r0, 0x0000, %-
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
    brnz %r10, sma_20_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 120: CASA_R	casa	[%r31] %asi, %r8, %r16
mondo_20_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d91400c  ! 121: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
splash_lsu_20_89:
	nop
	ta T_CHANGE_HPRIV
	set 0x07d2cb45, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_20_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe03fe1d0  ! 123: STD_I	std	%r16, [%r31 + 0x01d0]
dvapa_20_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8aa, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd920  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
	.word 0xe13fc00c  ! 126: STDF_R	std	%f16, [%r12, %r31]
	setx 0x8735f19c2bee026f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0d7e0f8  ! 129: LDSHA_I	ldsha	[%r31, + 0x00f8] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_94) + 24, 16, 16)) -> intp(3,0,4)
#else
	setx 0x1a2a9884b1a8f4b7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 131: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9033fb  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x13fb, %pstate
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d9035d3  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x15d3, %pstate
	setx 0x997f939c2dd01847, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_20_99:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x91a1c9d1  ! 136: FDIVd	fdivd	%f38, %f48, %f8
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_20_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_101:
	.word 0x8f902001  ! 138: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_20_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe0f8  ! 140: LDSBA_I	ldsba	[%r31, + 0x00f8] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_103:
	rd %pc, %r12
	add %r12, (donretarg_20_103-donret_20_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ca1e00 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ecc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_20_103:
	.word 0xe86fe076  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x0076]
trapasi_20_104:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8c84b60  ! 142: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r20
fpinit_20_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 143: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_20_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_107:
	.word 0x8f902001  ! 145: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
dvapa_20_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0x869, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc02b  ! 146: STDA_R	stda	%r20, [%r31 + %r11] 0x01
	setx 0x31aec3048d8f06e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe020  ! 148: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
splash_decr_20_110:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7848012  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0xe93fc014  ! 150: STDF_R	std	%f20, [%r20, %r31]
br_longdelay3_20_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93a00553  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe060  ! 153: LDDFA_I	ldda	[%r31, 0x0060], %f0
splash_cmpr_20_113:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 154: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x879d0011  ! 155: WRHPR_HINTP_R	wrhpr	%r20, %r17, %hintp
	.word 0x91920010  ! 156: WRPR_PIL_R	wrpr	%r8, %r16, %pil
ibp_20_115:
	nop
	.word 0xd6dfc030  ! 157: LDXA_R	ldxa	[%r31, %r16] 0x01, %r11
fpinit_20_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 158: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_117:
	rd %pc, %r12
	add %r12, (donretarg_20_117-donret_20_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009b3e00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17d7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_117:
	.word 0xd6ffe084  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x0084] %asi
	.word 0xd6dfe0c0  ! 160: LDXA_I	ldxa	[%r31, + 0x00c0] %asi, %r11
jmptr_20_118:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_20_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf43, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac0a4d  ! 162: FCMPd	fcmpd	%fcc<n>, %f16, %f44
	.word 0xa9844012  ! 163: WR_SET_SOFTINT_R	wr	%r17, %r18, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_120:
	rd %pc, %r12
	add %r12, (donretarg_20_120-donret_20_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009f5000 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xec, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_120:
	.word 0xa5a449d2  ! 164: FDIVd	fdivd	%f48, %f18, %f18
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
    brnz %r10, sma_20_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e009  ! 165: CASA_R	casa	[%r31] %asi, %r9, %r20
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90288e  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x088e, %pstate
	.word 0x8d802004  ! 167: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x35ff, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b487d3  ! 169: PDIST	pdistn	%d18, %d50, %d42
	.word 0xe1e7e014  ! 170: CASA_R	casa	[%r31] %asi, %r20, %r16
splash_hpstate_20_125:
	.word 0x81982fde  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fde, %hpstate
memptr_20_126:
	set user_data_start, %r31
	.word 0x85846512  ! 172: WRCCR_I	wr	%r17, 0x0512, %ccr
	.word 0x8d903f5f  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1f5f, %pstate
splash_cmpr_20_128:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 174: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe03fc000  ! 175: STD_R	std	%r16, [%r31 + %r0]
brcommon2_20_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91a2c9c1  ! 1: FDIVd	fdivd	%f42, %f32, %f8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfdf20  ! 176: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_20_131:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 177: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_20_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_20_135:
	set user_data_start, %r31
	.word 0x8584eaea  ! 182: WRCCR_I	wr	%r19, 0x0aea, %ccr
memptr_20_136:
	set 0x60340000, %r31
	.word 0x8584346a  ! 183: WRCCR_I	wr	%r16, 0x146a, %ccr
	.word 0xe677e1f8  ! 184: STX_I	stx	%r19, [%r31 + 0x01f8]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_20_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 186: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe19fda00  ! 187: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_20_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82060  ! 188: PREFETCHA_I	prefetcha	[%r0, + 0x0060] %asi, #one_read
ceter_20_141:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 189: RDTICK	rd	%tick, %r12
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802000  ! 191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_142:
	rd %pc, %r12
	add %r12, (donretarg_20_142-donret_20_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003bd400 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x557, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_142:
	.word 0xd2ffe1b4  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x01b4] %asi
	.word 0x879c800d  ! 193: WRHPR_HINTP_R	wrhpr	%r18, %r13, %hintp
splash_cmpr_20_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 194: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_20_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_144
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
cwq_20_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 195: RDPC	rd	%pc, %r8
br_badelay2_20_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f18, %f0, %f0
	.word 0x9bb50311  ! 196: ALIGNADDRESS	alignaddr	%r20, %r17, %r13
splash_tba_20_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe070  ! 200: LDD_I	ldd	[%r31 + 0x0070], %r8
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
    brnz %r10, cwq_20_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_147
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
cwq_20_147:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 201: RDPC	rd	%pc, %r11
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
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_0:
	rd %pc, %r12
	add %r12, (donretarg_10_0-donret_10_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ae6d00 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x681, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_10_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_2:
	.word 0x8f902000  ! 2: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xdadfe068  ! 3: LDXA_I	ldxa	[%r31, + 0x0068] %asi, %r13
	.word 0xda8008a0  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_10_3:
	nop
	.word 0xe1bfdb60  ! 5: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_10_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0x501baaabd52a5a5c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x206dd461e89224df, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_10_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_10_7:
	set 0x60340000, %r31
	.word 0x8582275b  ! 9: WRCCR_I	wr	%r8, 0x075b, %ccr
	.word 0xa1902000  ! 10: WRPR_GL_I	wrpr	%r0, 0x0000, %-
fpinit_10_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 11: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xda800ae0  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r13
ibp_10_9:
	nop
	.word 0x99b14487  ! 13: FCMPLE32	fcmple32	%d36, %d38, %r12
memptr_10_10:
	set 0x60340000, %r31
	.word 0x8584241d  ! 14: WRCCR_I	wr	%r16, 0x041d, %ccr
pmu_10_11:
	nop
	setx 0xfffff0bcfffff2c6, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe198  ! 16: LDD_I	ldd	[%r31 + 0x0198], %r18
	.word 0xe49fd000  ! 17: LDDA_R	ldda	[%r31, %r0] 0x80, %r18
brcommon2_10_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe050  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0050], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe080  ! 18: STDFA_I	stda	%f0, [0x0080, %r31]
intveclr_10_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xccfd45de227d2fec, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7f72d6da01143edf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_15:
	nop
	setx 0xfffff29dfffffbdc, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802030  ! 22: SIR	sir	0x0030
	.word 0xa86a32be  ! 23: UDIVX_I	udivx 	%r8, 0xfffff2be, %r20
dvapa_10_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbf5, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc010  ! 24: STXFSR_R	st-sfr	%f1, [%r16, %r31]
splash_htba_10_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e0f8  ! 26: LDQFA_I	-	[%r31, 0x00f8], %f19
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d903c12  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1c12, %pstate
	.word 0xa7684003  ! 28: SDIVX_R	sdivx	%r1, %r3, %r19
splash_hpstate_10_20:
	ta T_CHANGE_NONHPRIV
	.word 0x8198367d  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x167d, %hpstate
intveclr_10_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc9769463a05107ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_22) + 32, 16, 16)) -> intp(0,0,16)
#else
	setx 0x69a6b5b5cc119b72, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_10_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_10_24:
	nop
	ta T_CHANGE_HPRIV
	set 0xafe14118, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_25:
	.word 0x24cc8001  ! 1: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x81983c1e  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1e, %hpstate
pmu_10_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdbffffffb29, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91b14492  ! 36: FCMPLE32	fcmple32	%d36, %d18, %r8
jmptr_10_28:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x917021ae  ! 38: POPC_I	popc	0x01ae, %r8
intveclr_10_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfa2a5051787132b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_10_31:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9f8020a0  ! 40: SIR	sir	0x00a0
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 41: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_10_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x79837df574658ce0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_10_33:
	nop
	.word 0xa1b487c2  ! 43: PDIST	pdistn	%d18, %d2, %d16
	.word 0xa1902007  ! 44: WRPR_GL_I	wrpr	%r0, 0x0007, %-
fpinit_10_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 45: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x91924013  ! 46: WRPR_PIL_R	wrpr	%r9, %r19, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_36:
	rd %pc, %r12
	add %r12, (donretarg_10_36-donret_10_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00016c00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x694, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_36:
	.word 0xe26fe018  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x0018]
	.word 0xc19fc2c0  ! 48: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_10_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_37:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc30fc000  ! 51: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
intveclr_10_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x21fee4718849c1c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc3efc033  ! 1: PREFETCHA_R	prefetcha	[%r31, %r19] 0x01, #one_read
	.word 0x9f802eea  ! 53: SIR	sir	0x0eea
	.word 0xe337e040  ! 54: STQF_I	-	%f17, [0x0040, %r31]
dvapa_10_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd72, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe160  ! 55: LDDFA_I	ldda	[%r31, 0x0160], %f16
	.word 0xe22fe074  ! 56: STB_I	stb	%r17, [%r31 + 0x0074]
	setx 0x48367d6eef3fcbaf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_10_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc009  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe1a0  ! 58: STDFA_I	stda	%f16, [0x01a0, %r31]
jmptr_10_43:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_10_44:
	set 0x60140000, %r31
	.word 0x85846b13  ! 60: WRCCR_I	wr	%r17, 0x0b13, %ccr
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
	.word 0xa3414000  ! 61: RDPC	rd	%pc, %r17
fpinit_10_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 62: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x91d02035  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa7703953  ! 64: POPC_I	popc	0x1953, %r19
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
    brnz %r10, sma_10_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 65: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e010  ! 67: STQF_I	-	%f18, [0x0010, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_10_50:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4d044a0  ! 69: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r18
splash_tba_10_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_10_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ea, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc008  ! 71: LDDF_R	ldd	[%r31, %r8], %f18
	.word 0x9948c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r12
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
    brnz %r10, sma_10_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 73: CASA_R	casa	[%r31] %asi, %r20, %r20
mondo_10_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d928001  ! 74: WRPR_WSTATE_R	wrpr	%r10, %r1, %wstate
intveclr_10_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf3beb0eb20239276, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e1e3  ! 76: STQF_I	-	%f20, [0x01e3, %r31]
splash_hpstate_10_56:
	ta T_CHANGE_NONHPRIV
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x81983b1f  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b1f, %hpstate
br_badelay3_10_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x99a349c6  ! 1: FDIVd	fdivd	%f44, %f6, %f12
	.word 0x95a44823  ! 78: FADDs	fadds	%f17, %f3, %f10
br_longdelay1_10_58:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 79: SAVE_R	save	%r31, %r0, %r31
splash_lsu_10_59:
	nop
	ta T_CHANGE_HPRIV
	set 0xc59a6c0d, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7b30594  ! 81: FCMPGT32	fcmpgt32	%d12, %d20, %r19
dvapa_10_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd8d, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd51fe1b0  ! 82: LDDF_I	ldd	[%r31, 0x01b0], %f10
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x9345c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xa1902002  ! 85: WRPR_GL_I	wrpr	%r0, 0x0002, %-
trapasi_10_62:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8904b40  ! 86: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r20
brcommon3_10_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e040  ! 1: STQF_I	-	%f20, [0x0040, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe83fe0c0  ! 87: STD_I	std	%r20, [%r31 + 0x00c0]
memptr_10_64:
	set 0x60140000, %r31
	.word 0x8580b873  ! 88: WRCCR_I	wr	%r2, 0x1873, %ccr
brcommon1_10_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d2  ! 1: PDIST	pdistn	%d62, %d18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f802cf7  ! 89: SIR	sir	0x0cf7
	.word 0x9ac52c10  ! 90: ADDCcc_I	addccc 	%r20, 0x0c10, %r13
fpinit_10_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 91: FDIVd	fdivd	%f0, %f4, %f6
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_67:
	rd %pc, %r12
	add %r12, (donretarg_10_67-donret_10_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00311400 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1856, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_67:
	.word 0x9ba249d2  ! 92: FDIVd	fdivd	%f40, %f18, %f44
change_to_randtl_10_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x3ed6, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b047d3  ! 94: PDIST	pdistn	%d32, %d50, %d18
	.word 0xdb1fc010  ! 95: LDDF_R	ldd	[%r31, %r16], %f13
splash_tba_10_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x792f17feabc46a08, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_72:
	set user_data_start, %r31
	.word 0x8581f244  ! 98: WRCCR_I	wr	%r7, 0x1244, %ccr
fpinit_10_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8279c  ! 99: PREFETCHA_I	prefetcha	[%r0, + 0x079c] %asi, #one_read
intveclr_10_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc43efc0885ad3106, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_75:
	rd %pc, %r12
	add %r12, (donretarg_10_75-donret_10_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f12000 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe0e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_75:
	.word 0xa7a489d2  ! 101: FDIVd	fdivd	%f18, %f18, %f50
	.word 0x81dc8010  ! 102: FLUSH_R	flush
ibp_10_76:
	nop
	.word 0xe1bfe1a0  ! 103: STDFA_I	stda	%f16, [0x01a0, %r31]
	.word 0xe89fe068  ! 104: LDDA_I	ldda	[%r31, + 0x0068] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_77:
	rd %pc, %r12
	add %r12, (donretarg_10_77-donret_10_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c46800 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x190f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_77:
	.word 0xa7a509cb  ! 105: FDIVd	fdivd	%f20, %f42, %f50
	.word 0x8d90352b  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x152b, %pstate
	.word 0xa153c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab827205  ! 108: WR_CLEAR_SOFTINT_I	wr	%r9, 0x1205, %clear_softint
invtsb_10_79:
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
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xe1bfde00  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
br_badelay3_10_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8f72162f	! Random illegal ?
	.word 0x95a00553  ! 1: FSQRTd	fsqrt	
	.word 0xa9a0c831  ! 111: FADDs	fadds	%f3, %f17, %f20
ibp_10_81:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd897c031  ! 112: LDUHA_R	lduha	[%r31, %r17] 0x01, %r12
memptr_10_82:
	set 0x60140000, %r31
	.word 0x85833b25  ! 113: WRCCR_I	wr	%r12, 0x1b25, %ccr
mondo_10_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d924010  ! 114: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0xa7508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_10_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x036217d2, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_85:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 117: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_10_86:
	ta T_CHANGE_NONHPRIV
	.word 0x8198318b  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x118b, %hpstate
	.word 0xa1902000  ! 119: WRPR_GL_I	wrpr	%r0, 0x0000, %-
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
    brnz %r10, sma_10_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 120: CASA_R	casa	[%r31] %asi, %r19, %r16
mondo_10_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d930008  ! 121: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
splash_lsu_10_89:
	nop
	ta T_CHANGE_HPRIV
	set 0xe935f128, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_10_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c034  ! 1: CASA_I	casa	[%r31] 0x 1, %r20, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1e7e00c  ! 123: CASA_R	casa	[%r31] %asi, %r12, %r16
dvapa_10_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ac, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe000  ! 124: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
	.word 0xe0dfc02a  ! 126: LDXA_R	ldxa	[%r31, %r10] 0x01, %r16
	setx 0x7691c25e45c1ddf4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 128: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe0d7e0f0  ! 129: LDSHA_I	ldsha	[%r31, + 0x00f0] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_94) + 16, 16, 16)) -> intp(3,0,19)
#else
	setx 0xf827136e1e7e96a3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 131: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d903548  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x1548, %pstate
	.word 0x2acc0001  ! 1: BRNZ	brnz,a,pt	%r16,<label_0xc0001>
	.word 0x8d903b95  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x1b95, %pstate
	setx 0xf4bb5a393fd2e6e7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_10_99:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9bb40489  ! 136: FCMPLE32	fcmple32	%d16, %d40, %r13
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_10_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_101:
	.word 0x8f902002  ! 138: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_10_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe098  ! 140: LDSBA_I	ldsba	[%r31, + 0x0098] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_103:
	rd %pc, %r12
	add %r12, (donretarg_10_103-donret_10_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004f8300 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f09, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_103:
	.word 0xe86fe02c  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x002c]
trapasi_10_104:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8c04b60  ! 142: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r20
fpinit_10_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 143: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_10_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_107:
	.word 0x8f902001  ! 145: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
dvapa_10_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd81, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe83fe1c0  ! 146: STD_I	std	%r20, [%r31 + 0x01c0]
	setx 0x426f2cf05ab84827, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe190  ! 148: LDSBA_I	ldsba	[%r31, + 0x0190] %asi, %r20
splash_decr_10_110:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7848013  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r19, %-
	.word 0xe93fc014  ! 150: STDF_R	std	%f20, [%r20, %r31]
br_longdelay3_10_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa7a00546  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe180  ! 153: LDDFA_I	ldda	[%r31, 0x0180], %f0
splash_cmpr_10_113:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 154: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x879c8011  ! 155: WRHPR_HINTP_R	wrhpr	%r18, %r17, %hintp
	.word 0x9194c006  ! 156: WRPR_PIL_R	wrpr	%r19, %r6, %pil
ibp_10_115:
	nop
	.word 0xd71fc014  ! 157: LDDF_R	ldd	[%r31, %r20], %f11
fpinit_10_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 158: FDIVd	fdivd	%f0, %f4, %f6
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_117:
	rd %pc, %r12
	add %r12, (donretarg_10_117-donret_10_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f30a00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f49, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_117:
	.word 0xd6ffe0a4  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x00a4] %asi
	.word 0xd6dfe0b0  ! 160: LDXA_I	ldxa	[%r31, + 0x00b0] %asi, %r11
jmptr_10_118:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_10_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd2a, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87acca54  ! 162: FCMPd	fcmpd	%fcc<n>, %f50, %f20
	.word 0xa9840014  ! 163: WR_SET_SOFTINT_R	wr	%r16, %r20, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_120:
	rd %pc, %r12
	add %r12, (donretarg_10_120-donret_10_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005f0d00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa8e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_120:
	.word 0x91a349d4  ! 164: FDIVd	fdivd	%f44, %f20, %f8
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
    brnz %r10, sma_10_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 165: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d903644  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x1644, %pstate
	.word 0x8d802000  ! 167: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x191a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b487c2  ! 169: PDIST	pdistn	%d18, %d2, %d48
	.word 0xe1e7e008  ! 170: CASA_R	casa	[%r31] %asi, %r8, %r16
splash_hpstate_10_125:
	.word 0x81982605  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
memptr_10_126:
	set user_data_start, %r31
	.word 0x8585399c  ! 172: WRCCR_I	wr	%r20, 0x199c, %ccr
	.word 0x8d90202b  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x002b, %pstate
splash_cmpr_10_128:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 174: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc32fc000  ! 175: STXFSR_R	st-sfr	%f1, [%r0, %r31]
brcommon2_10_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1b7c712  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f18, %d16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfda00  ! 176: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_10_131:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 177: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_10_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_10_135:
	set user_data_start, %r31
	.word 0x8584f95b  ! 182: WRCCR_I	wr	%r19, 0x195b, %ccr
memptr_10_136:
	set 0x60340000, %r31
	.word 0x8581a7c6  ! 183: WRCCR_I	wr	%r6, 0x07c6, %ccr
	.word 0xe677e0f2  ! 184: STX_I	stx	%r19, [%r31 + 0x00f2]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_10_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 186: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xe1bfc3e0  ! 187: STDFA_R	stda	%f16, [%r0, %r31]
fpinit_10_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 188: FDIVs	fdivs	%f0, %f4, %f8
ceter_10_141:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 189: RDTICK	rd	%tick, %r11
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802004  ! 191: WRFPRS_I	wr	%r0, 0x0004, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_142:
	rd %pc, %r12
	add %r12, (donretarg_10_142-donret_10_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00151b00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x41f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_142:
	.word 0xd2ffe0c0  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x00c0] %asi
	.word 0x879a800d  ! 193: WRHPR_HINTP_R	wrhpr	%r10, %r13, %hintp
splash_cmpr_10_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 194: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_10_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_144
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
cwq_10_144:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 195: RDPC	rd	%pc, %r11
br_badelay2_10_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f24, %f24
	.word 0xa1b34304  ! 196: ALIGNADDRESS	alignaddr	%r13, %r4, %r16
splash_tba_10_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe1d8  ! 200: LDD_I	ldd	[%r31 + 0x01d8], %r8
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
    brnz %r10, cwq_10_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_147
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
cwq_10_147:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 201: RDPC	rd	%pc, %r17
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
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_0:
	rd %pc, %r12
	add %r12, (donretarg_8_0-donret_8_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009e6200 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x31d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_8_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_2:
	.word 0x8f902000  ! 2: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xdadfe0c0  ! 3: LDXA_I	ldxa	[%r31, + 0x00c0] %asi, %r13
	.word 0xda800c20  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r13
ibp_8_3:
	nop
	.word 0xe19fe080  ! 5: LDDFA_I	ldda	[%r31, 0x0080], %f16
intveclr_8_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf863df169459b59c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x00d53de225ae8e71, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_8_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_8_7:
	set 0x60740000, %r31
	.word 0x8584f3f4  ! 9: WRCCR_I	wr	%r19, 0x13f4, %ccr
	.word 0xa1902001  ! 10: WRPR_GL_I	wrpr	%r0, 0x0001, %-
fpinit_8_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 11: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xda800bc0  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
ibp_8_9:
	nop
	.word 0xc3ec8031  ! 13: PREFETCHA_R	prefetcha	[%r18, %r17] 0x01, #one_read
memptr_8_10:
	set 0x60140000, %r31
	.word 0x85826e59  ! 14: WRCCR_I	wr	%r9, 0x0e59, %ccr
pmu_8_11:
	nop
	setx 0xfffff3f7fffff2ca, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe100  ! 16: LDD_I	ldd	[%r31 + 0x0100], %r18
	.word 0xe49fc240  ! 17: LDDA_R	ldda	[%r31, %r0] 0x12, %r18
brcommon2_8_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa3a00554  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe120  ! 18: STDFA_I	stda	%f16, [0x0120, %r31]
intveclr_8_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf5cae19956b593d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaf872a307924635d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_15:
	nop
	setx 0xfffffe41fffffbc4, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x24cd0001  ! 22: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0x926aaf34  ! 23: UDIVX_I	udivx 	%r10, 0x0f34, %r9
dvapa_8_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa05, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c031  ! 24: LDUHA_R	lduha	[%r31, %r17] 0x01, %r19
splash_htba_8_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e0d0  ! 26: LDQFA_I	-	[%r31, 0x00d0], %f19
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032a7  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x12a7, %pstate
	.word 0x91694013  ! 28: SDIVX_R	sdivx	%r5, %r19, %r8
splash_hpstate_8_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81983447  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1447, %hpstate
intveclr_8_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x82c13c9d580c5c82, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_22) + 32, 16, 16)) -> intp(1,0,28)
#else
	setx 0x4da1055b0f33ea5c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_8_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_8_24:
	nop
	ta T_CHANGE_HPRIV
	set 0xf9baea89, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_25:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81983707  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1707, %hpstate
pmu_8_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7cafffff35f, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87a8ca52  ! 36: FCMPd	fcmpd	%fcc<n>, %f34, %f18
jmptr_8_28:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x87ac4a44  ! 38: FCMPd	fcmpd	%fcc<n>, %f48, %f4
intveclr_8_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0x11f65b22150c9fe2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_8_31:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc029  ! 40: LDXA_R	ldxa	[%r31, %r9] 0x01, %r13
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 41: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_8_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9c48209855c4d309, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_8_33:
	nop
	.word 0xa5a4c9ac  ! 43: FDIVs	fdivs	%f19, %f12, %f18
	.word 0xa190200c  ! 44: WRPR_GL_I	wrpr	%r0, 0x000c, %-
fpinit_8_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 45: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91948012  ! 46: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_36:
	rd %pc, %r12
	add %r12, (donretarg_8_36-donret_8_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c57200 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_36:
	.word 0xe26fe12e  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x012e]
	.word 0xe19fc3e0  ! 48: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_8_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_37:
	.word 0x8f902002  ! 49: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc32fc000  ! 51: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_8_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x188a3fe8433d3d6d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803b4b  ! 53: SIR	sir	0x1b4b
	.word 0xe337e154  ! 54: STQF_I	-	%f17, [0x0154, %r31]
dvapa_8_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa26, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0c0  ! 55: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0xe22fe110  ! 56: STB_I	stb	%r17, [%r31 + 0x0110]
	setx 0x38a5db3b1649d20f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_8_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x95a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe120  ! 58: LDDFA_I	ldda	[%r31, 0x0120], %f16
jmptr_8_43:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_8_44:
	set 0x60740000, %r31
	.word 0x8580673f  ! 60: WRCCR_I	wr	%r1, 0x073f, %ccr
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
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
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
	.word 0x97414000  ! 61: RDPC	rd	%pc, %r11
fpinit_8_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 62: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x91d020b3  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x99a309c1  ! 64: FDIVd	fdivd	%f12, %f32, %f12
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
    brnz %r10, sma_8_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 65: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e1f0  ! 67: STQF_I	-	%f18, [0x01f0, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_8_50:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 69: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
splash_tba_8_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_8_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8fe, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fe0d0  ! 71: LDDF_I	ldd	[%r31, 0x00d0], %f18
	.word 0x9148c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r8
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
    brnz %r10, sma_8_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 73: CASA_R	casa	[%r31] %asi, %r17, %r20
mondo_8_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d90c004  ! 74: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
intveclr_8_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe4ac3efa6d5ca76a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e101  ! 76: STQF_I	-	%f20, [0x0101, %r31]
splash_hpstate_8_56:
	ta T_CHANGE_NONHPRIV
	.word 0x24c94001  ! 1: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
	.word 0x81982489  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0489, %hpstate
br_badelay3_8_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa9a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f20
	.word 0x91a50825  ! 78: FADDs	fadds	%f20, %f5, %f8
br_longdelay1_8_58:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 79: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_8_59:
	nop
	ta T_CHANGE_HPRIV
	set 0x4a6d986e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95b20592  ! 81: FCMPGT32	fcmpgt32	%d8, %d18, %r10
dvapa_8_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xae8, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd4dfc034  ! 82: LDXA_R	ldxa	[%r31, %r20] 0x01, %r10
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa145c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xa1902000  ! 85: WRPR_GL_I	wrpr	%r0, 0x0000, %-
trapasi_8_62:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8904b40  ! 86: LDUHA_R	lduha	[%r1, %r0] 0x5a, %r20
brcommon3_8_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e1d0  ! 1: STQF_I	-	%f20, [0x01d0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe89fc030  ! 87: LDDA_R	ldda	[%r31, %r16] 0x01, %r20
memptr_8_64:
	set 0x60540000, %r31
	.word 0x8584b954  ! 88: WRCCR_I	wr	%r18, 0x1954, %ccr
brcommon1_8_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d3  ! 1: PDIST	pdistn	%d62, %d50, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8031a6  ! 89: SIR	sir	0x11a6
	.word 0x96c2227c  ! 90: ADDCcc_I	addccc 	%r8, 0x027c, %r11
fpinit_8_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e820e7  ! 91: PREFETCHA_I	prefetcha	[%r0, + 0x00e7] %asi, #one_read
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_67:
	rd %pc, %r12
	add %r12, (donretarg_8_67-donret_8_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0013c100 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1fc4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_67:
	.word 0xa1a489c7  ! 92: FDIVd	fdivd	%f18, %f38, %f16
change_to_randtl_8_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x36f5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb4c7d1  ! 94: PDIST	pdistn	%d50, %d48, %d44
	.word 0xdadfc034  ! 95: LDXA_R	ldxa	[%r31, %r20] 0x01, %r13
splash_tba_8_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x7d02c9fa812ffb9b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_72:
	set user_data_start, %r31
	.word 0x8585214e  ! 98: WRCCR_I	wr	%r20, 0x014e, %ccr
fpinit_8_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 99: FDIVs	fdivs	%f0, %f4, %f8
intveclr_8_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x50b80d86aa895d7c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_75:
	rd %pc, %r12
	add %r12, (donretarg_8_75-donret_8_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a50600 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf85, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_75:
	.word 0xa5a4c9c8  ! 101: FDIVd	fdivd	%f50, %f8, %f18
	.word 0x81dc400b  ! 102: FLUSH_R	flush
ibp_8_76:
	nop
	.word 0xe1bfdc00  ! 103: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe89fe008  ! 104: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_77:
	rd %pc, %r12
	add %r12, (donretarg_8_77-donret_8_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a2dd00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e4d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_77:
	.word 0x93a509c4  ! 105: FDIVd	fdivd	%f20, %f4, %f40
	.word 0x8d902e1f  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x0e1f, %pstate
	.word 0x9353c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab8326c7  ! 108: WR_CLEAR_SOFTINT_I	wr	%r12, 0x06c7, %clear_softint
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xc1bfd920  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay3_8_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf54c4cb2	! Random illegal ?
	.word 0x91a00547  ! 1: FSQRTd	fsqrt	
	.word 0x93a2c82a  ! 111: FADDs	fadds	%f11, %f10, %f9
ibp_8_81:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc008  ! 112: STDF_R	std	%f12, [%r8, %r31]
memptr_8_82:
	set 0x60140000, %r31
	.word 0x858520b9  ! 113: WRCCR_I	wr	%r20, 0x00b9, %ccr
mondo_8_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d93400b  ! 114: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	.word 0x91508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_8_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x105ec14c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_85:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 117: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_8_86:
	ta T_CHANGE_NONHPRIV
	.word 0x8198200d  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	.word 0xa1902000  ! 119: WRPR_GL_I	wrpr	%r0, 0x0000, %-
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
    brnz %r10, sma_8_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 120: CASA_R	casa	[%r31] %asi, %r8, %r16
mondo_8_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94400a  ! 121: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
splash_lsu_8_89:
	nop
	ta T_CHANGE_HPRIV
	set 0xecefea66, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_8_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe0dfc02c  ! 123: LDXA_R	ldxa	[%r31, %r12] 0x01, %r16
dvapa_8_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd84, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe0a0  ! 124: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
	.word 0xe1e7e00a  ! 126: CASA_R	casa	[%r31] %asi, %r10, %r16
	setx 0x7bbf4d0134d41364, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0d7e1c8  ! 129: LDSHA_I	ldsha	[%r31, + 0x01c8] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_94) + 40, 16, 16)) -> intp(2,0,30)
#else
	setx 0x0bf97cedba6cebcb, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 131: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d903770  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x1770, %pstate
	.word 0x22ccc001  ! 1: BRZ	brz,a,pt	%r19,<label_0xcc001>
	.word 0x8d903f9f  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x1f9f, %pstate
	setx 0x412ee7f06b8c783b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_8_99:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97b4c494  ! 136: FCMPLE32	fcmple32	%d50, %d20, %r11
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_8_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_101:
	.word 0x8f902000  ! 138: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_8_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe100  ! 140: LDSBA_I	ldsba	[%r31, + 0x0100] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_103:
	rd %pc, %r12
	add %r12, (donretarg_8_103-donret_8_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d65200 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1bef, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2acb4001  ! 1: BRNZ	brnz,a,pt	%r13,<label_0xb4001>
	done
donretarg_8_103:
	.word 0xe86fe1ad  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x01ad]
trapasi_8_104:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8904b60  ! 142: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r20
fpinit_8_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 143: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_8_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_107:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_8_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc60, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe93fc009  ! 146: STDF_R	std	%f20, [%r9, %r31]
	setx 0x5cc72336c3a63858, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe068  ! 148: LDSBA_I	ldsba	[%r31, + 0x0068] %asi, %r20
	.word 0xa7848004  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
	.word 0xe83fe160  ! 150: STD_I	std	%r20, [%r31 + 0x0160]
br_longdelay3_8_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa9a00551  ! 152: FSQRTd	fsqrt	
	.word 0xe19fe100  ! 153: LDDFA_I	ldda	[%r31, 0x0100], %f16
splash_cmpr_8_113:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 154: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8798c005  ! 155: WRHPR_HINTP_R	wrhpr	%r3, %r5, %hintp
	.word 0x91914005  ! 156: WRPR_PIL_R	wrpr	%r5, %r5, %pil
ibp_8_115:
	nop
	.word 0xd6dfc029  ! 157: LDXA_R	ldxa	[%r31, %r9] 0x01, %r11
fpinit_8_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 158: FCMPLE32	fcmple32	%d0, %d4, %r4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_117:
	rd %pc, %r12
	add %r12, (donretarg_8_117-donret_8_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00997600 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16d5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_117:
	.word 0xd6ffe1a8  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x01a8] %asi
	.word 0xd6dfe000  ! 160: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
jmptr_8_118:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_8_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfeb, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9bb287cc  ! 162: PDIST	pdistn	%d10, %d12, %d44
	.word 0xa984c006  ! 163: WR_SET_SOFTINT_R	wr	%r19, %r6, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_120:
	rd %pc, %r12
	add %r12, (donretarg_8_120-donret_8_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ba8200 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x685, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_120:
	.word 0xa1a209c1  ! 164: FDIVd	fdivd	%f8, %f32, %f16
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
    brnz %r10, sma_8_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 165: CASA_R	casa	[%r31] %asi, %r12, %r20
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9030bd  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x10bd, %pstate
	.word 0x8d802004  ! 167: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x289d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b4c7d1  ! 169: PDIST	pdistn	%d50, %d48, %d12
	.word 0xe09fc032  ! 170: LDDA_R	ldda	[%r31, %r18] 0x01, %r16
splash_hpstate_8_125:
	.word 0x81983f5e  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f5e, %hpstate
memptr_8_126:
	set user_data_start, %r31
	.word 0x8584648c  ! 172: WRCCR_I	wr	%r17, 0x048c, %ccr
	.word 0x8d903d4e  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1d4e, %pstate
splash_cmpr_8_128:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 174: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe03fc000  ! 175: STD_R	std	%r16, [%r31 + %r0]
brcommon2_8_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x95a1c9cd  ! 1: FDIVd	fdivd	%f38, %f44, %f10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fda00  ! 176: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_8_131:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 177: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_8_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_8_135:
	set user_data_start, %r31
	.word 0x8582eab4  ! 182: WRCCR_I	wr	%r11, 0x0ab4, %ccr
memptr_8_136:
	set 0x60540000, %r31
	.word 0x85833651  ! 183: WRCCR_I	wr	%r12, 0x1651, %ccr
	.word 0xe677e018  ! 184: STX_I	stx	%r19, [%r31 + 0x0018]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_8_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 186: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xc19fd920  ! 187: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_8_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 188: FDIVd	fdivd	%f0, %f4, %f4
ceter_8_141:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 189: RDTICK	rd	%tick, %r11
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802000  ! 191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_142:
	rd %pc, %r12
	add %r12, (donretarg_8_142-donret_8_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000c2d00 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ccd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_142:
	.word 0xd2ffe070  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x0070] %asi
	.word 0x8799c010  ! 193: WRHPR_HINTP_R	wrhpr	%r7, %r16, %hintp
splash_cmpr_8_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 194: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_8_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_144
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
cwq_8_144:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 195: RDPC	rd	%pc, %r8
br_badelay2_8_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f16, %f16, %f20
	.word 0x93b18309  ! 196: ALIGNADDRESS	alignaddr	%r6, %r9, %r9
splash_tba_8_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe0d0  ! 200: LDD_I	ldd	[%r31 + 0x00d0], %r8
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
    brnz %r10, cwq_8_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_147
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
cwq_8_147:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 201: RDPC	rd	%pc, %r17
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
    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_4:
    setx 0x7fefdd66824f7eda, %r1, %r28
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
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_0:
	rd %pc, %r12
	add %r12, (donretarg_4_0-donret_4_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0052fc00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x605, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_4_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_2:
	.word 0x8f902001  ! 2: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xdadfe100  ! 3: LDXA_I	ldxa	[%r31, + 0x0100] %asi, %r13
	.word 0xda8008a0  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_4_3:
	nop
	.word 0xc1bfc3e0  ! 5: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_4_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5bacf2c7890fe3dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x273eeef78e6d1883, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_4_7:
	set 0x60340000, %r31
	.word 0x8584fd2e  ! 9: WRCCR_I	wr	%r19, 0x1d2e, %ccr
	.word 0xa1902008  ! 10: WRPR_GL_I	wrpr	%r0, 0x0008, %-
fpinit_4_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 11: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xda800c40  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r13
ibp_4_9:
	nop
	.word 0xa3b48482  ! 13: FCMPLE32	fcmple32	%d18, %d2, %r17
memptr_4_10:
	set 0x60740000, %r31
	.word 0x85817c78  ! 14: WRCCR_I	wr	%r5, 0x1c78, %ccr
pmu_4_11:
	nop
	setx 0xffffffc9fffff061, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe038  ! 16: LDD_I	ldd	[%r31 + 0x0038], %r18
	.word 0xe49fd100  ! 17: LDDA_R	ldda	[%r31, %r0] 0x88, %r18
brcommon2_4_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe1d0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x01d0], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe000  ! 18: STDFA_I	stda	%f0, [0x0000, %r31]
intveclr_4_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x88989ba41aff1eec, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe3d8e3cbea42a978, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_15:
	nop
	setx 0xfffffea4fffff2a2, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a509c6  ! 22: FDIVd	fdivd	%f20, %f6, %f50
	.word 0xa06cab9e  ! 23: UDIVX_I	udivx 	%r18, 0x0b9e, %r16
dvapa_4_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8b0, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc034  ! 24: LDDA_R	ldda	[%r31, %r20] 0x01, %r19
splash_htba_4_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e1c8  ! 26: LDQFA_I	-	[%r31, 0x01c8], %f19
	.word 0x24cc0001  ! 1: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0x8d903e1b  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x1e1b, %pstate
	.word 0x95698007  ! 28: SDIVX_R	sdivx	%r6, %r7, %r10
splash_hpstate_4_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81982484  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0484, %hpstate
intveclr_4_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x466dce633b0eadce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_22) + 56, 16, 16)) -> intp(0,0,3)
#else
	setx 0xe84b506813572d47, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_24:
	nop
	ta T_CHANGE_HPRIV
	set 0xb7e89ded, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_25:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x81983c8a  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c8a, %hpstate
pmu_4_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff92efffff73e, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
iaw_4_27:
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
iaw_startwait4_27:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_27
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_27:
    brnz %r16, iaw_wait4_27
    ld [%r23], %r16
    ba iaw_startwait4_27
    mov 0x4, %r16
continue_iaw_4_27:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_27:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_27
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_27:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_27
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_27:
	mov 0x38, %r18
iaw1_4_27:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea802c  ! 36: PREFETCHA_R	prefetcha	[%r10, %r12] 0x01, #one_read
jmptr_4_28:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_4_29:
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
iaw_startwait4_29:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_29
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_29:
    brnz %r16, iaw_wait4_29
    ld [%r23], %r16
    ba iaw_startwait4_29
    mov 0x4, %r16
continue_iaw_4_29:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_29:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_29
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_29:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_29
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_29:
	mov 0x38, %r18
iaw3_4_29:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1b4c7c8  ! 38: PDIST	pdistn	%d50, %d8, %d16
intveclr_4_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3a2db0c3b3d175c5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_4_31:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9f802010  ! 40: SIR	sir	0x0010
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 41: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x76e78afb1e688e45, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_4_33:
	nop
	.word 0xa3b50494  ! 43: FCMPLE32	fcmple32	%d20, %d20, %r17
	.word 0xa1902009  ! 44: WRPR_GL_I	wrpr	%r0, 0x0009, %-
fpinit_4_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 45: FCMPd	fcmpd	%fcc<n>, %f0, %f4
cmp_4_35:
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
cmp_startwait4_35:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_35
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_35:
    brnz,a %r10, cmp_wait4_35
    ld [%r23], %r10
    ba cmp_startwait4_35
    mov 0x4, %r10
continue_cmp_4_35:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_35
    mov 0xa1, %r17
    best_set_reg(0x06a3c23c94698eb5, %r16, %r17)
cmp_multi_core_4_35:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9191c006  ! 46: WRPR_PIL_R	wrpr	%r7, %r6, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_36:
	rd %pc, %r12
	add %r12, (donretarg_4_36-donret_4_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bbb100 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x254, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	retry
donretarg_4_36:
	.word 0xe26fe03b  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x003b]
	.word 0xc19fd920  ! 48: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_4_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_37:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe23fc000  ! 51: STD_R	std	%r17, [%r31 + %r0]
intveclr_4_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf8aac57dc67a0474, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80296c  ! 53: SIR	sir	0x096c
	.word 0xe337e010  ! 54: STQF_I	-	%f17, [0x0010, %r31]
dvapa_4_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8c5, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe0e0  ! 55: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xe22fe11f  ! 56: STB_I	stb	%r17, [%r31 + 0x011f]
	setx 0xa13eb739c981f3bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_4_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc013  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 58: LDDFA_R	ldda	[%r31, %r0], %f16
jmptr_4_43:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_4_44:
	set 0x60740000, %r31
	.word 0x8580b4ec  ! 60: WRCCR_I	wr	%r2, 0x14ec, %ccr
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
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
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
	.word 0xa5414000  ! 61: RDPC	rd	%pc, %r18
fpinit_4_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 62: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x91d020b3  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 179
iaw_4_47:
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
iaw_startwait4_47:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_47
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_47:
    brnz %r16, iaw_wait4_47
    ld [%r23], %r16
    ba iaw_startwait4_47
    mov 0x4, %r16
continue_iaw_4_47:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_47:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_47
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_47:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_47
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_47:
	mov 0x38, %r18
iaw4_4_47:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9bb507d2  ! 64: PDIST	pdistn	%d20, %d18, %d44
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
    brnz %r10, sma_4_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 65: CASA_R	casa	[%r31] %asi, %r11, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e084  ! 67: STQF_I	-	%f18, [0x0084, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_4_50:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 69: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
splash_tba_4_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_4_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa1f, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fe110  ! 71: LDDF_I	ldd	[%r31, 0x0110], %f18
	.word 0x9548c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r10
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
    brnz %r10, sma_4_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 73: CASA_R	casa	[%r31] %asi, %r20, %r20
mondo_4_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950011  ! 74: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
intveclr_4_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0x240b9c2bf8b41be0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e1d0  ! 76: STQF_I	-	%f20, [0x01d0, %r31]
splash_hpstate_4_56:
	ta T_CHANGE_NONHPRIV
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81982e1d  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1d, %hpstate
br_badelay3_4_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x95a289c5  ! 1: FDIVd	fdivd	%f10, %f36, %f10
	.word 0xa3a08829  ! 78: FADDs	fadds	%f2, %f9, %f17
br_longdelay1_4_58:
	.word 0x2ccb4001  ! 1: BRGZ	brgz,a,pt	%r13,<label_0xb4001>
	.word 0xbfe7c000  ! 79: SAVE_R	save	%r31, %r0, %r31
splash_lsu_4_59:
	nop
	ta T_CHANGE_HPRIV
	set 0x9b322b0d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5b50594  ! 81: FCMPGT32	fcmpgt32	%d20, %d20, %r18
dvapa_4_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdee, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd4bfc028  ! 82: STDA_R	stda	%r10, [%r31 + %r8] 0x01
cerer_4_61:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x22aae48be2065889, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa345c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xa1902007  ! 85: WRPR_GL_I	wrpr	%r0, 0x0007, %-
trapasi_4_62:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8d84b40  ! 86: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r20
brcommon3_4_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e0f0  ! 1: STQF_I	-	%f20, [0x00f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe897c030  ! 87: LDUHA_R	lduha	[%r31, %r16] 0x01, %r20
memptr_4_64:
	set 0x60340000, %r31
	.word 0x85847b7e  ! 88: WRCCR_I	wr	%r17, 0x1b7e, %ccr
brcommon1_4_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d2  ! 1: PDIST	pdistn	%d62, %d18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93b44494  ! 89: FCMPLE32	fcmple32	%d48, %d20, %r9
	.word 0xa0c4e17b  ! 90: ADDCcc_I	addccc 	%r19, 0x017b, %r16
fpinit_4_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 91: FDIVs	fdivs	%f0, %f4, %f6
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_67:
	rd %pc, %r12
	add %r12, (donretarg_4_67-donret_4_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0024c800 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7da, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_67:
	.word 0x9ba449d4  ! 92: FDIVd	fdivd	%f48, %f20, %f44
change_to_randtl_4_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0xf31, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b487c3  ! 94: PDIST	pdistn	%d18, %d34, %d18
iaw_4_69:
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
iaw_startwait4_69:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_69
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_69:
    brnz %r16, iaw_wait4_69
    ld [%r23], %r16
    ba iaw_startwait4_69
    mov 0x4, %r16
continue_iaw_4_69:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_69:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_69
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_69:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_69
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_69:
	mov 0x38, %r18
iaw3_4_69:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fe1e0  ! 95: LDDF_I	ldd	[%r31, 0x01e0], %f13
splash_tba_4_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x2861dc4cf2002207, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_72:
	set user_data_start, %r31
	.word 0x85852c8b  ! 98: WRCCR_I	wr	%r20, 0x0c8b, %ccr
fpinit_4_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 99: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_4_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9a27d95d448b2451, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_75:
	rd %pc, %r12
	add %r12, (donretarg_4_75-donret_4_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008d2e00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x140e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_75:
	.word 0x97a509c7  ! 101: FDIVd	fdivd	%f20, %f38, %f42
	.word 0x81d9c002  ! 102: FLUSH_R	flush
ibp_4_76:
	nop
	.word 0xc19fe1a0  ! 103: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	.word 0xe89fe138  ! 104: LDDA_I	ldda	[%r31, + 0x0138] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_77:
	rd %pc, %r12
	add %r12, (donretarg_4_77-donret_4_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a6db00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1719, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_77:
	.word 0xa5a289c7  ! 105: FDIVd	fdivd	%f10, %f38, %f18
	.word 0x8d90254f  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x054f, %pstate
	.word 0x9153c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab842ca4  ! 108: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0ca4, %clear_softint
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xe1bfc2c0  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
br_badelay3_4_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8546610f	! Random illegal ?
	.word 0x9ba00542  ! 1: FSQRTd	fsqrt	
	.word 0x9ba44833  ! 111: FADDs	fadds	%f17, %f19, %f13
ibp_4_81:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc010  ! 112: LDDF_R	ldd	[%r31, %r16], %f12
memptr_4_82:
	set 0x60140000, %r31
	.word 0x858431e7  ! 113: WRCCR_I	wr	%r16, 0x11e7, %ccr
mondo_4_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d908011  ! 114: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0x9b508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_4_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x9e38048c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_85:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 117: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_4_86:
	ta T_CHANGE_NONHPRIV
	.word 0x819825cc  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cc, %hpstate
	.word 0xa190200d  ! 119: WRPR_GL_I	wrpr	%r0, 0x000d, %-
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
    brnz %r10, sma_4_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 120: CASA_R	casa	[%r31] %asi, %r19, %r16
mondo_4_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d934013  ! 121: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
splash_lsu_4_89:
	nop
	ta T_CHANGE_HPRIV
	set 0x1c46ea60, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_4_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe13fc013  ! 123: STDF_R	std	%f16, [%r19, %r31]
dvapa_4_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb99, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe180  ! 124: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
iaw_4_92:
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
iaw_startwait4_92:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_92
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_92:
    brnz %r16, iaw_wait4_92
    ld [%r23], %r16
    ba iaw_startwait4_92
    mov 0x4, %r16
continue_iaw_4_92:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_92:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_92
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_92:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_92
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_92:
	mov 0x38, %r18
iaw2_4_92:
	rdpr %tba, %r19
	mov 0x11,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe097c02d  ! 126: LDUHA_R	lduha	[%r31, %r13] 0x01, %r16
	setx 0x4272fa7f0dfac2ab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 128: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe0d7e1f0  ! 129: LDSHA_I	ldsha	[%r31, + 0x01f0] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_94) + 0, 16, 16)) -> intp(7,0,10)
#else
	setx 0x44519f205b38e50f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 131: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d903143  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x1143, %pstate
	.word 0x24c9c001  ! 1: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
	.word 0x8d903579  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x1579, %pstate
	setx 0xb5188cd409d187dd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_4_99:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x95a489d4  ! 136: FDIVd	fdivd	%f18, %f20, %f10
splash_tick_4_100:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x3989f23fd226b52b, %r16, %r17)
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_4_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_101:
	.word 0x8f902001  ! 138: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_4_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe028  ! 140: LDSBA_I	ldsba	[%r31, + 0x0028] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_103:
	rd %pc, %r12
	add %r12, (donretarg_4_103-donret_4_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001c8b00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa4e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_103:
	.word 0xe86fe00c  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x000c]
trapasi_4_104:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8884b60  ! 142: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r20
fpinit_4_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 143: FDIVs	fdivs	%f0, %f4, %f6
splash_tick_4_106:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x444527697419a28a, %r16, %r17)
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_4_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_107:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_4_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0x82b, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e009  ! 146: CASA_R	casa	[%r31] %asi, %r9, %r20
	setx 0xa8a7877781431a6a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe0d0  ! 148: LDSBA_I	ldsba	[%r31, + 0x00d0] %asi, %r20
	.word 0xa782c009  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r9, %-
iaw_4_111:
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
iaw_startwait4_111:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_111
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_111:
    brnz %r16, iaw_wait4_111
    ld [%r23], %r16
    ba iaw_startwait4_111
    mov 0x4, %r16
continue_iaw_4_111:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_111:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_111
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_111:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_111
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_111:
	mov 0x38, %r18
iaw4_4_111:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe8dfc034  ! 150: LDXA_R	ldxa	[%r31, %r20] 0x01, %r20
br_longdelay3_4_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x9ba00552  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe020  ! 153: LDDFA_I	ldda	[%r31, 0x0020], %f0
splash_cmpr_4_113:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 154: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x879c4008  ! 155: WRHPR_HINTP_R	wrhpr	%r17, %r8, %hintp
cmp_4_114:
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
cmp_startwait4_114:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_114
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_114:
    brnz,a %r10, cmp_wait4_114
    ld [%r23], %r10
    ba cmp_startwait4_114
    mov 0x4, %r10
continue_cmp_4_114:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_114
    mov 0xbe, %r17
    best_set_reg(0x9a6631d8a2150899, %r16, %r17)
cmp_multi_core_4_114:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9190c012  ! 156: WRPR_PIL_R	wrpr	%r3, %r18, %pil
ibp_4_115:
	nop
	.word 0x9f8021e0  ! 157: SIR	sir	0x01e0
fpinit_4_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 158: FCMPLE32	fcmple32	%d0, %d4, %r4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_117:
	rd %pc, %r12
	add %r12, (donretarg_4_117-donret_4_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00585000 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x84, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_117:
	.word 0xd6ffe1e4  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x01e4] %asi
	.word 0xd6dfe0e8  ! 160: LDXA_I	ldxa	[%r31, + 0x00e8] %asi, %r11
jmptr_4_118:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_4_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc66, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7a4c9ab  ! 162: FDIVs	fdivs	%f19, %f11, %f19
	.word 0xa9818006  ! 163: WR_SET_SOFTINT_R	wr	%r6, %r6, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_120:
	rd %pc, %r12
	add %r12, (donretarg_4_120-donret_4_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00732a00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd97, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_120:
	.word 0xa5a509c4  ! 164: FDIVd	fdivd	%f20, %f4, %f18
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
    brnz %r10, sma_4_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 165: CASA_R	casa	[%r31] %asi, %r8, %r20
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e99  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x0e99, %pstate
	.word 0x8d802000  ! 167: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tick_4_123:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xff1f0c1fd97634cd, %r16, %r17)
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x1fb1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b4c7d4  ! 169: PDIST	pdistn	%d50, %d20, %d20
iaw_4_124:
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
iaw_startwait4_124:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_124
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_124:
    brnz %r16, iaw_wait4_124
    ld [%r23], %r16
    ba iaw_startwait4_124
    mov 0x4, %r16
continue_iaw_4_124:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_124:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_124
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_124:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_124
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_124:
	mov 0x38, %r18
iaw2_4_124:
	rdpr %tba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe11fe1d0  ! 170: LDDF_I	ldd	[%r31, 0x01d0], %f16
splash_hpstate_4_125:
	.word 0x81983307  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1307, %hpstate
memptr_4_126:
	set user_data_start, %r31
	.word 0x85852cd7  ! 172: WRCCR_I	wr	%r20, 0x0cd7, %ccr
	.word 0x8d902a73  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0a73, %pstate
splash_cmpr_4_128:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 174: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc32fc000  ! 175: STXFSR_R	st-sfr	%f1, [%r0, %r31]
brcommon2_4_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1b7c70c  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f12, %d16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe160  ! 176: LDDFA_I	ldda	[%r31, 0x0160], %f16
splash_cmpr_4_131:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 177: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_4_132:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_tick_4_133:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xc4e6505492b3b4cb, %r16, %r17)
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
splash_tick_4_134:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x746da9e359ee7079, %r16, %r17)
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_4_135:
	set user_data_start, %r31
	.word 0x8582fdc8  ! 182: WRCCR_I	wr	%r11, 0x1dc8, %ccr
memptr_4_136:
	set 0x60540000, %r31
	.word 0x85806315  ! 183: WRCCR_I	wr	%r1, 0x0315, %ccr
	.word 0xe677e0e8  ! 184: STX_I	stx	%r19, [%r31 + 0x00e8]
splash_tick_4_137:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xae986acf34763caf, %r16, %r17)
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_4_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82060  ! 186: PREFETCHA_I	prefetcha	[%r0, + 0x0060] %asi, #one_read
iaw_4_139:
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
iaw_startwait4_139:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_139
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_139:
    brnz %r16, iaw_wait4_139
    ld [%r23], %r16
    ba iaw_startwait4_139
    mov 0x4, %r16
continue_iaw_4_139:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_139:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_139
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_139:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_4_139
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_139:
	mov 0x38, %r18
iaw1_4_139:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc2c0  ! 187: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_4_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 188: FDIVs	fdivs	%f0, %f4, %f8
ceter_4_141:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 189: RDTICK	rd	%tick, %r11
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802000  ! 191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_142:
	rd %pc, %r12
	add %r12, (donretarg_4_142-donret_4_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00929300 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xec5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_142:
	.word 0xd2ffe0ce  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x00ce] %asi
	.word 0x87998008  ! 193: WRHPR_HINTP_R	wrhpr	%r6, %r8, %hintp
splash_cmpr_4_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 194: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_4_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_144
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
cwq_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 195: RDPC	rd	%pc, %r17
br_badelay2_4_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f24, %f10, %f28
	.word 0x9bb28303  ! 196: ALIGNADDRESS	alignaddr	%r10, %r3, %r13
splash_tba_4_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe170  ! 200: LDD_I	ldd	[%r31 + 0x0170], %r8
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
    brnz %r10, cwq_4_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_147
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
cwq_4_147:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 201: RDPC	rd	%pc, %r20
cmpenall_4_148:
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
cmpenall_startwait4_148:
    mov 0x4, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_4_148
    nop
cmpenall_wait4_148:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait4_148
    nop
    ba,a cmpenall_startwait4_148
continue_cmpenall_4_148:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_4_148:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_4_148
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_4_148:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_4_148
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
fork_lbl_0_2:
    ta T_CHANGE_NONHPRIV 
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_0:
	rd %pc, %r12
	add %r12, (donretarg_2_0-donret_2_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0058a700 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x757, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_0:
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_2_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_2:
	.word 0x8f902000  ! 2: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xdadfe0e8  ! 3: LDXA_I	ldxa	[%r31, + 0x00e8] %asi, %r13
	.word 0xda8008a0  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_2_3:
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
ibp_startwait2_3:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_3
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_3:
    brnz %r16, ibp_wait2_3
    ld [%r23], %r16
    ba ibp_startwait2_3
    mov 0x2, %r16
continue_ibp_2_3:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_3:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_3
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_3:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_3
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_3:
    best_set_reg(0x000000508ec00e8c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fc3e0  ! 5: LDDFA_R	ldda	[%r31, %r0], %f16
intveclr_2_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0xac425e28d9b36fd0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x375762e49f40e586, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_2_7:
	set 0x60140000, %r31
	.word 0x858238ff  ! 9: WRCCR_I	wr	%r8, 0x18ff, %ccr
	.word 0xa1902000  ! 10: WRPR_GL_I	wrpr	%r0, 0x0000, %-
fpinit_2_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 11: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xda8008a0  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_2_9:
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
ibp_startwait2_9:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_9
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_9:
    brnz %r16, ibp_wait2_9
    ld [%r23], %r16
    ba ibp_startwait2_9
    mov 0x2, %r16
continue_ibp_2_9:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_9:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_9
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_9:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_9
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_9:
    best_set_reg(0x00000050fdce8ce0,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa5a4c9d0  ! 13: FDIVd	fdivd	%f50, %f16, %f18
memptr_2_10:
	set 0x60340000, %r31
	.word 0x8580f3b9  ! 14: WRCCR_I	wr	%r3, 0x13b9, %ccr
pmu_2_11:
	nop
	setx 0xfffff10efffffd4c, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe070  ! 16: LDD_I	ldd	[%r31 + 0x0070], %r18
	.word 0xe49fdc40  ! 17: LDDA_R	ldda	[%r31, %r0] 0xe2, %r18
brcommon2_2_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a0054a  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 18: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_2_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa101bea1b58f3db5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x04e44105e0f8081f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_15:
	nop
	setx 0xfffffcf5fffffb9b, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbu skip_2_16
	fble skip_2_16
.align 128
skip_2_16:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x926cf74a  ! 23: UDIVX_I	udivx 	%r19, 0xfffff74a, %r9
dvapa_2_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0x90c, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6dfc02c  ! 24: LDXA_R	ldxa	[%r31, %r12] 0x01, %r19
splash_htba_2_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e110  ! 26: LDQFA_I	-	[%r31, 0x0110], %f19
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8d90376b  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x176b, %pstate
	.word 0x99690011  ! 28: SDIVX_R	sdivx	%r4, %r17, %r12
splash_hpstate_2_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81983e1d  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e1d, %hpstate
intveclr_2_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd9b53ec0b06db237, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_22) + 40, 16, 16)) -> intp(0,0,19)
#else
	setx 0x3957d4fd7c263f49, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_24:
	nop
	ta T_CHANGE_HPRIV
	set 0xf816ed52, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_25:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81982586  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0586, %hpstate
pmu_2_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff601fffff7ee, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc3ec4032  ! 36: PREFETCHA_R	prefetcha	[%r17, %r18] 0x01, #one_read
jmptr_2_28:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9ba1c9d3  ! 38: FDIVd	fdivd	%f38, %f50, %f44
intveclr_2_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf6f32db33da4c764, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_2_31:
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
ibp_startwait2_31:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_31
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_31:
    brnz %r16, ibp_wait2_31
    ld [%r23], %r16
    ba ibp_startwait2_31
    mov 0x2, %r16
continue_ibp_2_31:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_31:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_31
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_31:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_31
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_31:
    best_set_reg(0x0000004002cce07c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 40: CASA_R	casa	[%r31] %asi, %r19, %r13
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 41: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_2_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6dc779372b752dd5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_2_33:
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
ibp_startwait2_33:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_33
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_33:
    brnz %r16, ibp_wait2_33
    ld [%r23], %r16
    ba ibp_startwait2_33
    mov 0x2, %r16
continue_ibp_2_33:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_33:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_33
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_33:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_33
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_33:
    best_set_reg(0x00000040ade07cad,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc3e9802b  ! 43: PREFETCHA_R	prefetcha	[%r6, %r11] 0x01, #one_read
	.word 0xa190200f  ! 44: WRPR_GL_I	wrpr	%r0, 0x000f, %-
fpinit_2_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e821ae  ! 45: PREFETCHA_I	prefetcha	[%r0, + 0x01ae] %asi, #one_read
	.word 0x9192c012  ! 46: WRPR_PIL_R	wrpr	%r11, %r18, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_36:
	rd %pc, %r12
	add %r12, (donretarg_2_36-donret_2_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dd4e00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x158d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	retry
donretarg_2_36:
	.word 0xe26fe104  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x0104]
	.word 0xe19fd920  ! 48: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_2_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_37:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	bpos,a	 skip_2_38
	fbuge,a,pn	%fcc0,  skip_2_38
.align 1024
skip_2_38:
	.word 0xc32fc000  ! 51: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_2_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7ad0cf070fc0e5d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a7c9b4  ! 1: FDIVs	fdivs	%f31, %f20, %f17
	.word 0x9f802742  ! 53: SIR	sir	0x0742
	.word 0xe337e1ff  ! 54: STQF_I	-	%f17, [0x01ff, %r31]
dvapa_2_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0x814, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe120  ! 55: LDDFA_I	ldda	[%r31, 0x0120], %f16
	.word 0xe22fe16e  ! 56: STB_I	stb	%r17, [%r31 + 0x016e]
	setx 0x0c2bde66e9308b24, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_2_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91a2c9cc  ! 1: FDIVd	fdivd	%f42, %f12, %f8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe020  ! 58: STDFA_I	stda	%f16, [0x0020, %r31]
jmptr_2_43:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_2_44:
	set 0x60140000, %r31
	.word 0x85842db0  ! 60: WRCCR_I	wr	%r16, 0x0db0, %ccr
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
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
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
	.word 0xa3414000  ! 61: RDPC	rd	%pc, %r17
fpinit_2_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 62: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x83d020b2  ! 63: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xa5b047c3  ! 64: PDIST	pdistn	%d32, %d34, %d18
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
    brnz %r10, sma_2_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 65: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e094  ! 67: STQF_I	-	%f18, [0x0094, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_2_50:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c844a0  ! 69: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r18
splash_tba_2_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_2_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8dc, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc033  ! 71: LDXA_R	ldxa	[%r31, %r19] 0x01, %r18
	.word 0x9b48c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r13
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
    brnz %r10, sma_2_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 73: CASA_R	casa	[%r31] %asi, %r16, %r20
mondo_2_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c009  ! 74: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
intveclr_2_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0x50b2068a5fe06a9a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e10c  ! 76: STQF_I	-	%f20, [0x010c, %r31]
splash_hpstate_2_56:
	ta T_CHANGE_NONHPRIV
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8198350d  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x150d, %hpstate
br_badelay3_2_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a1c9cb  ! 1: FDIVd	fdivd	%f38, %f42, %f42
	.word 0xa3a08828  ! 78: FADDs	fadds	%f2, %f8, %f17
br_longdelay1_2_58:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 79: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
splash_lsu_2_59:
	nop
	ta T_CHANGE_HPRIV
	set 0x43b58cf7, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3b1c594  ! 81: FCMPGT32	fcmpgt32	%d38, %d20, %r17
dvapa_2_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd85, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd53fc009  ! 82: STDF_R	std	%f10, [%r9, %r31]
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa145c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xa1902008  ! 85: WRPR_GL_I	wrpr	%r0, 0x0008, %-
trapasi_2_62:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8884b40  ! 86: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r20
brcommon3_2_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e1b0  ! 1: STQF_I	-	%f20, [0x01b0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe897c033  ! 87: LDUHA_R	lduha	[%r31, %r19] 0x01, %r20
memptr_2_64:
	set 0x60540000, %r31
	.word 0x8584b50f  ! 88: WRCCR_I	wr	%r18, 0x150f, %ccr
brcommon1_2_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d2  ! 1: PDIST	pdistn	%d62, %d18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9b2048b  ! 89: FCMPLE32	fcmple32	%d8, %d42, %r20
	.word 0xa0c2b928  ! 90: ADDCcc_I	addccc 	%r10, 0xfffff928, %r16
fpinit_2_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 91: FDIVd	fdivd	%f0, %f4, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_67:
	rd %pc, %r12
	add %r12, (donretarg_2_67-donret_2_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006dd300 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x649, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_67:
	.word 0x97a449d2  ! 92: FDIVd	fdivd	%f48, %f18, %f42
change_to_randtl_2_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x2514, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b487d1  ! 94: PDIST	pdistn	%d18, %d48, %d40
	.word 0xdb1fc00a  ! 95: LDDF_R	ldd	[%r31, %r10], %f13
splash_tba_2_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x74742c75b0575d2f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_72:
	set user_data_start, %r31
	.word 0x85816790  ! 98: WRCCR_I	wr	%r5, 0x0790, %ccr
fpinit_2_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 99: FCMPLE32	fcmple32	%d0, %d4, %r8
intveclr_2_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7dd5e5324b93bd99, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_75:
	rd %pc, %r12
	add %r12, (donretarg_2_75-donret_2_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006d6500 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b53, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_75:
	.word 0xa7a089c8  ! 101: FDIVd	fdivd	%f2, %f8, %f50
	.word 0x81db0011  ! 102: FLUSH_R	flush
ibp_2_76:
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
ibp_startwait2_76:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_76
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_76:
    brnz %r16, ibp_wait2_76
    ld [%r23], %r16
    ba ibp_startwait2_76
    mov 0x2, %r16
continue_ibp_2_76:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_76:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_76
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_76:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_76
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_76:
    best_set_reg(0x0000005025fcad8b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfd960  ! 103: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe89fe008  ! 104: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_77:
	rd %pc, %r12
	add %r12, (donretarg_2_77-donret_2_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f51300 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_77:
	.word 0xa3a289c8  ! 105: FDIVd	fdivd	%f10, %f8, %f48
	.word 0x8d90353b  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x153b, %pstate
	.word 0xa753c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab82f172  ! 108: WR_CLEAR_SOFTINT_I	wr	%r11, 0x1172, %clear_softint
invtsb_2_79:
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
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xe1bfd920  ! 110: STDFA_R	stda	%f16, [%r0, %r31]
br_badelay3_2_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8372161b	! Random illegal ?
	.word 0x95a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa7a44830  ! 111: FADDs	fadds	%f17, %f16, %f19
ibp_2_81:
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
ibp_startwait2_81:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_81
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_81:
    brnz %r16, ibp_wait2_81
    ld [%r23], %r16
    ba ibp_startwait2_81
    mov 0x2, %r16
continue_ibp_2_81:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_81:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_81
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_81:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_81
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_81:
    best_set_reg(0x000000409fed8b98,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd83fe0a0  ! 112: STD_I	std	%r12, [%r31 + 0x00a0]
memptr_2_82:
	set 0x60740000, %r31
	.word 0x8580f679  ! 113: WRCCR_I	wr	%r3, 0x1679, %ccr
mondo_2_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950005  ! 114: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x93508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_2_84:
	nop
	ta T_CHANGE_HPRIV
	set 0xc4e1f330, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_85:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 117: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_2_86:
	ta T_CHANGE_NONHPRIV
	.word 0x819836a7  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16a7, %hpstate
	.word 0xa190200a  ! 119: WRPR_GL_I	wrpr	%r0, 0x000a, %-
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
    brnz %r10, sma_2_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 120: CASA_R	casa	[%r31] %asi, %r19, %r16
mondo_2_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d908011  ! 121: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
splash_lsu_2_89:
	nop
	ta T_CHANGE_HPRIV
	set 0x23b884e1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_2_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe09fc02c  ! 123: LDDA_R	ldda	[%r31, %r12] 0x01, %r16
dvapa_2_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdd9, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe0e0  ! 124: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
	.word 0xe0dfc02b  ! 126: LDXA_R	ldxa	[%r31, %r11] 0x01, %r16
	setx 0x02b24c82fcffa8e4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 128: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe0d7e0c0  ! 129: LDSHA_I	ldsha	[%r31, + 0x00c0] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_94) + 16, 16, 16)) -> intp(1,0,26)
#else
	setx 0xa36004d068c512be, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 131: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d903c3b  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x1c3b, %pstate
	.word 0x2acb0001  ! 1: BRNZ	brnz,a,pt	%r12,<label_0xb0001>
	.word 0x8d9035e9  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x15e9, %pstate
	setx 0x1bd5ff1db04753f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_2_99:
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
ibp_startwait2_99:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_99
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_99:
    brnz %r16, ibp_wait2_99
    ld [%r23], %r16
    ba ibp_startwait2_99
    mov 0x2, %r16
continue_ibp_2_99:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_99:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_99
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_99:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_99
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_99:
    best_set_reg(0x00000040bccb98e1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9bb307c2  ! 136: PDIST	pdistn	%d12, %d2, %d44
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_2_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_101:
	.word 0x8f902000  ! 138: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_2_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe0e8  ! 140: LDSBA_I	ldsba	[%r31, + 0x00e8] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_103:
	rd %pc, %r12
	add %r12, (donretarg_2_103-donret_2_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001ea200 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1105, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
donretarg_2_103:
	.word 0xe86fe12c  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x012c]
trapasi_2_104:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8d04b60  ! 142: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r20
fpinit_2_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 143: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_2_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_107:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_2_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd50, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 146: CASA_R	casa	[%r31] %asi, %r17, %r20
	setx 0x940801b25b510a7a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe0a8  ! 148: LDSBA_I	ldsba	[%r31, + 0x00a8] %asi, %r20
splash_decr_2_110:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa781c00c  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r12, %-
	.word 0xe89fe1c0  ! 150: LDDA_I	ldda	[%r31, + 0x01c0] %asi, %r20
br_longdelay3_2_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902002  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x99a00553  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe080  ! 153: LDDFA_I	ldda	[%r31, 0x0080], %f0
splash_cmpr_2_113:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 154: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87990011  ! 155: WRHPR_HINTP_R	wrhpr	%r4, %r17, %hintp
	.word 0x91920012  ! 156: WRPR_PIL_R	wrpr	%r8, %r18, %pil
ibp_2_115:
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
ibp_startwait2_115:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_115
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_115:
    brnz %r16, ibp_wait2_115
    ld [%r23], %r16
    ba ibp_startwait2_115
    mov 0x2, %r16
continue_ibp_2_115:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_115:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_115
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_115:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_2_115
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_115:
    best_set_reg(0x0000005081d8e1e7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd71fc00b  ! 157: LDDF_R	ldd	[%r31, %r11], %f11
fpinit_2_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 158: FDIVd	fdivd	%f0, %f4, %f6
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_117:
	rd %pc, %r12
	add %r12, (donretarg_2_117-donret_2_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00830100 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_117:
	.word 0xd6ffe175  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x0175] %asi
	.word 0xd6dfe0d8  ! 160: LDXA_I	ldxa	[%r31, + 0x00d8] %asi, %r11
jmptr_2_118:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_2_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9b7, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97702206  ! 162: POPC_I	popc	0x0206, %r11
	.word 0xa9848011  ! 163: WR_SET_SOFTINT_R	wr	%r18, %r17, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_120:
	rd %pc, %r12
	add %r12, (donretarg_2_120-donret_2_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d47800 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1805, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_120:
	.word 0x9ba0c9d3  ! 164: FDIVd	fdivd	%f34, %f50, %f44
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
    brnz %r10, sma_2_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 165: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037ec  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x17ec, %pstate
	.word 0x8d802004  ! 167: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x166c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b447d2  ! 169: PDIST	pdistn	%d48, %d18, %d40
	.word 0xe11fe0b0  ! 170: LDDF_I	ldd	[%r31, 0x00b0], %f16
splash_hpstate_2_125:
	.word 0x81982c37  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c37, %hpstate
memptr_2_126:
	set user_data_start, %r31
	.word 0x8583381d  ! 172: WRCCR_I	wr	%r12, 0x181d, %ccr
	.word 0x8d903018  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1018, %pstate
splash_cmpr_2_128:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 174: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	bcs,a	 skip_2_129
	brgez,a,pt	%r11, skip_2_129
.align 512
skip_2_129:
	.word 0xc30fc000  ! 175: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon2_2_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a509d1  ! 1: FDIVd	fdivd	%f20, %f48, %f50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 176: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_2_131:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 177: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_2_132:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_2_135:
	set user_data_start, %r31
	.word 0x8584b1f8  ! 182: WRCCR_I	wr	%r18, 0x11f8, %ccr
memptr_2_136:
	set 0x60140000, %r31
	.word 0x85832ff9  ! 183: WRCCR_I	wr	%r12, 0x0ff9, %ccr
	.word 0xe677e098  ! 184: STX_I	stx	%r19, [%r31 + 0x0098]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_2_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 186: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xe1bfda00  ! 187: STDFA_R	stda	%f16, [%r0, %r31]
fpinit_2_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 188: FDIVd	fdivd	%f0, %f4, %f8
ceter_2_141:
    nop
    ta T_CHANGE_HPRIV
    mov 4, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 189: RDTICK	rd	%tick, %r10
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802004  ! 191: WRFPRS_I	wr	%r0, 0x0004, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_142:
	rd %pc, %r12
	add %r12, (donretarg_2_142-donret_2_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006df400 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x60d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_142:
	.word 0xd2ffe16c  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x016c] %asi
	.word 0x879cc010  ! 193: WRHPR_HINTP_R	wrhpr	%r19, %r16, %hintp
splash_cmpr_2_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 194: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_2_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_144
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
cwq_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 195: RDPC	rd	%pc, %r20
br_badelay2_2_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f28, %f12
	.word 0xa3b40308  ! 196: ALIGNADDRESS	alignaddr	%r16, %r8, %r17
splash_tba_2_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe060  ! 200: LDD_I	ldd	[%r31 + 0x0060], %r8
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
    brnz %r10, cwq_2_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_147
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
cwq_2_147:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 201: RDPC	rd	%pc, %r12
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
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_0:
	rd %pc, %r12
	add %r12, (donretarg_1_0-donret_1_0), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002fc000 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x155f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_0:
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_1:
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_1_2:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_2:
	.word 0x8f902000  ! 2: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xdadfe080  ! 3: LDXA_I	ldxa	[%r31, + 0x0080] %asi, %r13
	.word 0xda8008a0  ! 4: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
ibp_1_3:
	nop
	.word 0xe1bfe160  ! 5: STDFA_I	stda	%f16, [0x0160, %r31]
intveclr_1_4:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe26e80d51eb7e984, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 6: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xef5f9ac016ba4b29, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_5:
	.word 0x39400001  ! 7: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_6:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
memptr_1_7:
	set 0x60340000, %r31
	.word 0x85853afa  ! 9: WRCCR_I	wr	%r20, 0x1afa, %ccr
	.word 0xa190200f  ! 10: WRPR_GL_I	wrpr	%r0, 0x000f, %-
fpinit_1_8:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 11: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xda800c60  ! 12: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
ibp_1_9:
	nop
	.word 0x87acca46  ! 13: FCMPd	fcmpd	%fcc<n>, %f50, %f6
memptr_1_10:
	set 0x60340000, %r31
	.word 0x858524bb  ! 14: WRCCR_I	wr	%r20, 0x04bb, %ccr
pmu_1_11:
	nop
	setx 0xfffff8dafffff6b5, %g1, %g7
	.word 0xa3800007  ! 15: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe41fe0e0  ! 16: LDD_I	ldd	[%r31 + 0x00e0], %r18
	.word 0xe49fc280  ! 17: LDDA_R	ldda	[%r31, %r0] 0x14, %r18
brcommon2_1_12:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe1c0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x01c0], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe040  ! 18: LDDFA_I	ldda	[%r31, 0x0040], %f16
intveclr_1_13:
	nop
	ta T_CHANGE_HPRIV
	setx 0x19f17f14ded04f1e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 19: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb14c6824a43143be, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_15:
	nop
	setx 0xfffffaaefffff2ed, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	bge,a	 skip_1_16
	brgz,pt  	%r16, skip_1_16
.align 128
skip_1_16:
	.word 0x95a449c4  ! 22: FDIVd	fdivd	%f48, %f4, %f10
	.word 0xa66aa3e8  ! 23: UDIVX_I	udivx 	%r10, 0x03e8, %r19
dvapa_1_17:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa23, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e009  ! 24: CASA_R	casa	[%r31] %asi, %r9, %r19
splash_htba_1_18:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe797e020  ! 26: LDQFA_I	-	[%r31, 0x0020], %f19
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d9032e1  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x12e1, %pstate
	.word 0x936c0012  ! 28: SDIVX_R	sdivx	%r16, %r18, %r9
splash_hpstate_1_20:
	ta T_CHANGE_NONHPRIV
	.word 0x81983ecd  ! 29: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ecd, %hpstate
intveclr_1_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8e15e0e3206e6dc1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 30: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_22) + 8, 16, 16)) -> intp(6,0,17)
#else
	setx 0xcd0f9e808c98fa69, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_22:
	.word 0x39400001  ! 31: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_23:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 32: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_24:
	nop
	ta T_CHANGE_HPRIV
	set 0x9c81e27a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_25:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x81983d0f  ! 34: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d0f, %hpstate
pmu_1_26:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2b5fffffbd8, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a349b0  ! 36: FDIVs	fdivs	%f13, %f16, %f19
jmptr_1_28:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3eb4021  ! 38: PREFETCHA_R	prefetcha	[%r13, %r1] 0x01, #one_read
intveclr_1_30:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd6ec7f1fcf8c523b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 39: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_1_31:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xda97c032  ! 40: LDUHA_R	lduha	[%r31, %r18] 0x01, %r13
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 41: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x78f751fd704fdde6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 42: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_1_33:
	nop
	.word 0xa3a489c4  ! 43: FDIVd	fdivd	%f18, %f4, %f48
	.word 0xa190200b  ! 44: WRPR_GL_I	wrpr	%r0, 0x000b, %-
fpinit_1_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 45: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x91948011  ! 46: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_36:
	rd %pc, %r12
	add %r12, (donretarg_1_36-donret_1_36+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fc6800 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10c8, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	retry
donretarg_1_36:
	.word 0xe26fe0e1  ! 47: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e1]
	.word 0xc19fd960  ! 48: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_1_37:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_37:
	.word 0x8f902002  ! 49: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 50: WRFPRS_I	wr	%r0, 0x0000, %fprs
	fbug skip_1_38
	.word 0x9f80264d  ! 1: SIR	sir	0x064d
.align 1024
skip_1_38:
	.word 0xc36fe13c  ! 51: PREFETCH_I	prefetch	[%r31 + 0x013c], #one_read
intveclr_1_39:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9c8d66ca51db2278, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802701  ! 53: SIR	sir	0x0701
	.word 0xe337e1c2  ! 54: STQF_I	-	%f17, [0x01c2, %r31]
dvapa_1_40:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfd0, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 55: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe22fe15e  ! 56: STB_I	stb	%r17, [%r31 + 0x015e]
	setx 0x6c6e2a4abbfe5965, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_41:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_1_42:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc014  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdf20  ! 58: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_1_43:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 59: JMPL_R	jmpl	%r27 + %r0, %r27
memptr_1_44:
	set 0x60340000, %r31
	.word 0x8581eb0c  ! 60: WRCCR_I	wr	%r7, 0x0b0c, %ccr
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
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
	.word 0x91414000  ! 61: RDPC	rd	%pc, %r8
fpinit_1_46:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b0c  ! 62: PREFETCHA_I	prefetcha	[%r0, + 0x0b0c] %asi, #one_read
	.word 0x91d020b3  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87ad0a53  ! 64: FCMPd	fcmpd	%fcc<n>, %f20, %f50
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
    brnz %r10, sma_1_48
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_48:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 65: CASA_R	casa	[%r31] %asi, %r10, %r18
	.word 0x81510000  ! 66: RDPR_TICK	rdpr	%tick, %r0
	.word 0xe537e010  ! 67: STQF_I	-	%f18, [0x0010, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_49:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_1_50:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c044a0  ! 69: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r18
splash_tba_1_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 70: WRPR_TBA_R	wrpr	%r0, %r12, %tba
dvapa_1_52:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcaa, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe497c02a  ! 71: LDUHA_R	lduha	[%r31, %r10] 0x01, %r18
	.word 0xa948c000  ! 72: RDHPR_HINTP	rdhpr	%hintp, %r20
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
    brnz %r10, sma_1_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_53:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 73: CASA_R	casa	[%r31] %asi, %r19, %r20
mondo_1_54:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d904012  ! 74: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
intveclr_1_55:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6ad068aa8b8ead3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 75: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e0b9  ! 76: STQF_I	-	%f20, [0x00b9, %r31]
splash_hpstate_1_56:
	ta T_CHANGE_NONHPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x819828c9  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c9, %hpstate
br_badelay3_1_57:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa3a509c4  ! 1: FDIVd	fdivd	%f20, %f4, %f48
	.word 0x93a34832  ! 78: FADDs	fadds	%f13, %f18, %f9
br_longdelay1_1_58:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 79: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_1_59:
	nop
	ta T_CHANGE_HPRIV
	set 0x08176f9f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 80: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95b0c590  ! 81: FCMPGT32	fcmpgt32	%d34, %d16, %r10
dvapa_1_60:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9a0, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd4bfc029  ! 82: STDA_R	stda	%r10, [%r31 + %r9] 0x01
	.word 0x8143e011  ! 83: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa945c000  ! 84: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xa1902000  ! 85: WRPR_GL_I	wrpr	%r0, 0x0000, %-
trapasi_1_62:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8c04b40  ! 86: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r20
brcommon3_1_63:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe937e0a0  ! 1: STQF_I	-	%f20, [0x00a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe8dfc02d  ! 87: LDXA_R	ldxa	[%r31, %r13] 0x01, %r20
memptr_1_64:
	set 0x60540000, %r31
	.word 0x8580a28a  ! 88: WRCCR_I	wr	%r2, 0x028a, %ccr
brcommon1_1_65:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7d3  ! 1: PDIST	pdistn	%d62, %d50, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ab0a47  ! 89: FCMPd	fcmpd	%fcc<n>, %f12, %f38
	.word 0x90c460e7  ! 90: ADDCcc_I	addccc 	%r17, 0x00e7, %r8
fpinit_1_66:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 91: FDIVs	fdivs	%f0, %f4, %f6
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_67:
	rd %pc, %r12
	add %r12, (donretarg_1_67-donret_1_67), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fc5800 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c55, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_1_67:
	.word 0x9ba4c9d3  ! 92: FDIVd	fdivd	%f50, %f50, %f44
change_to_randtl_1_68:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_68:
	.word 0x8f902000  ! 93: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0xb10, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407c2  ! 94: PDIST	pdistn	%d16, %d2, %d44
	.word 0xc32fc010  ! 95: STXFSR_R	st-sfr	%f1, [%r16, %r31]
splash_tba_1_70:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 96: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xb8605065216d8066, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_71:
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_72:
	set user_data_start, %r31
	.word 0x8582279c  ! 98: WRCCR_I	wr	%r8, 0x079c, %ccr
fpinit_1_73:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 99: FCMPLE32	fcmple32	%d0, %d4, %r6
intveclr_1_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe7c4f37e63ec30a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 100: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_75:
	rd %pc, %r12
	add %r12, (donretarg_1_75-donret_1_75+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a38800 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x169d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_75:
	.word 0xa9a189d2  ! 101: FDIVd	fdivd	%f6, %f18, %f20
	.word 0x81dd0010  ! 102: FLUSH_R	flush
ibp_1_76:
	nop
	.word 0xe19fe140  ! 103: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xe89fe0c0  ! 104: LDDA_I	ldda	[%r31, + 0x00c0] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_77:
	rd %pc, %r12
	add %r12, (donretarg_1_77-donret_1_77+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00da8a00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a1b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_77:
	.word 0x95a209d0  ! 105: FDIVd	fdivd	%f8, %f16, %f10
	.word 0x8d9029d5  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x09d5, %pstate
	.word 0xa753c000  ! 107: RDPR_FQ	<illegal instruction>
	.word 0xab843044  ! 108: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1044, %clear_softint
	.word 0x29800001  ! 109: FBL	fbl,a	<label_0x1>
	.word 0xc1bfc2c0  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay3_1_80:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xab799a7a	! Random illegal ?
	.word 0xa3a00553  ! 1: FSQRTd	fsqrt	
	.word 0x99a44834  ! 111: FADDs	fadds	%f17, %f20, %f12
ibp_1_81:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd91fe120  ! 112: LDDF_I	ldd	[%r31, 0x0120], %f12
memptr_1_82:
	set 0x60740000, %r31
	.word 0x8581f367  ! 113: WRCCR_I	wr	%r7, 0x1367, %ccr
mondo_1_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91c004  ! 114: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0xa1508000  ! 115: RDPR_TSTATE	<illegal instruction>
splash_lsu_1_84:
	nop
	ta T_CHANGE_HPRIV
	set 0x3e7bf9fb, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 116: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_85:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 117: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_1_86:
	ta T_CHANGE_NONHPRIV
	.word 0x8198258d  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058d, %hpstate
	.word 0xa190200a  ! 119: WRPR_GL_I	wrpr	%r0, 0x000a, %-
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
    brnz %r10, sma_1_87
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 120: CASA_R	casa	[%r31] %asi, %r16, %r16
mondo_1_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d94c005  ! 121: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
splash_lsu_1_89:
	nop
	ta T_CHANGE_HPRIV
	set 0x4eee0bed, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 122: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_1_90:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe1e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc010  ! 123: STXFSR_R	st-sfr	%f1, [%r16, %r31]
dvapa_1_91:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc61, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe160  ! 124: LDDFA_I	ldda	[%r31, 0x0160], %f16
	.word 0xe137c000  ! 125: STQF_R	-	%f16, [%r0, %r31]
	.word 0xe0bfc030  ! 126: STDA_R	stda	%r16, [%r31 + %r16] 0x01
	setx 0x07bd15b10a0df980, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_93:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0d7e148  ! 129: LDSHA_I	ldsha	[%r31, + 0x0148] %asi, %r16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_94) + 0, 16, 16)) -> intp(5,0,13)
#else
	setx 0x870e68e91e099fad, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_94:
	.word 0x39400001  ! 130: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 131: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90302d  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x102d, %pstate
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903731  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x1731, %pstate
	setx 0x7896aafee640e807, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_98:
	ta	T_CHANGE_NONHPRIV	! macro
ibp_1_99:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa9b4c490  ! 136: FCMPLE32	fcmple32	%d50, %d16, %r20
	.word 0x89800011  ! 137: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_1_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_101:
	.word 0x8f902000  ! 138: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_1_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe8cfe1d0  ! 140: LDSBA_I	ldsba	[%r31, + 0x01d0] %asi, %r20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_103:
	rd %pc, %r12
	add %r12, (donretarg_1_103-donret_1_103), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003f5900 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f95, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_103:
	.word 0xe86fe086  ! 141: LDSTUB_I	ldstub	%r20, [%r31 + 0x0086]
trapasi_1_104:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xe8c84b60  ! 142: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r20
fpinit_1_105:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 143: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x89800011  ! 144: WRTICK_R	wr	%r0, %r17, %tick
change_to_randtl_1_107:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_107:
	.word 0x8f902000  ! 145: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
dvapa_1_108:
	nop
	ta T_CHANGE_HPRIV
	mov 0xec4, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 146: CASA_R	casa	[%r31] %asi, %r18, %r20
	setx 0xec8ebab6cb6f3b6b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_109:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8cfe1a0  ! 148: LDSBA_I	ldsba	[%r31, + 0x01a0] %asi, %r20
	.word 0xa7828003  ! 149: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r3, %-
	.word 0xe93fc014  ! 150: STDF_R	std	%f20, [%r20, %r31]
br_longdelay3_1_112:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 151: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x97a00542  ! 152: FSQRTd	fsqrt	
	.word 0xc19fe140  ! 153: LDDFA_I	ldda	[%r31, 0x0140], %f0
splash_cmpr_1_113:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 154: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x879b0005  ! 155: WRHPR_HINTP_R	wrhpr	%r12, %r5, %hintp
	.word 0x9194000b  ! 156: WRPR_PIL_R	wrpr	%r16, %r11, %pil
ibp_1_115:
	nop
	.word 0xc32fc010  ! 157: STXFSR_R	st-sfr	%f1, [%r16, %r31]
fpinit_1_116:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 158: FDIVd	fdivd	%f0, %f4, %f4
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_117:
	rd %pc, %r12
	add %r12, (donretarg_1_117-donret_1_117), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00192600 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a49, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_117:
	.word 0xd6ffe1e4  ! 159: SWAPA_I	swapa	%r11, [%r31 + 0x01e4] %asi
	.word 0xd6dfe1a8  ! 160: LDXA_I	ldxa	[%r31, + 0x01a8] %asi, %r11
jmptr_1_118:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 161: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_1_119:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb01, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5702ddc  ! 162: POPC_I	popc	0x0ddc, %r18
	.word 0xa9850012  ! 163: WR_SET_SOFTINT_R	wr	%r20, %r18, %set_softint
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_120:
	rd %pc, %r12
	add %r12, (donretarg_1_120-donret_1_120+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e19100 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d46, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_120:
	.word 0xa9a449d4  ! 164: FDIVd	fdivd	%f48, %f20, %f20
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
    brnz %r10, sma_1_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_121:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 165: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8d903165  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x1165, %pstate
	.word 0x8d802000  ! 167: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89800011  ! 168: WRTICK_R	wr	%r0, %r17, %tick
    set 0x2b40, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b407d2  ! 169: PDIST	pdistn	%d16, %d18, %d16
	.word 0xe1e7e008  ! 170: CASA_R	casa	[%r31] %asi, %r8, %r16
splash_hpstate_1_125:
	.word 0x81982d0b  ! 171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0b, %hpstate
memptr_1_126:
	set user_data_start, %r31
	.word 0x8584a633  ! 172: WRCCR_I	wr	%r18, 0x0633, %ccr
	.word 0x8d903373  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1373, %pstate
splash_cmpr_1_128:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 174: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	brnz,pn  	%r18, skip_1_129
	bvc  	 skip_1_129
.align 512
skip_1_129:
	.word 0xc30fc000  ! 175: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon2_1_130:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1b7c708  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f8, %d16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1a0  ! 176: STDFA_I	stda	%f0, [0x01a0, %r31]
splash_cmpr_1_131:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 177: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_1_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 179: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x89800011  ! 180: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe737c000  ! 181: STQF_R	-	%f19, [%r0, %r31]
memptr_1_135:
	set user_data_start, %r31
	.word 0x8584e960  ! 182: WRCCR_I	wr	%r19, 0x0960, %ccr
memptr_1_136:
	set 0x60340000, %r31
	.word 0x8584e060  ! 183: WRCCR_I	wr	%r19, 0x0060, %ccr
	.word 0xe677e140  ! 184: STX_I	stx	%r19, [%r31 + 0x0140]
	.word 0x89800011  ! 185: WRTICK_R	wr	%r0, %r17, %tick
fpinit_1_138:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 186: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xc1bfe1c0  ! 187: STDFA_I	stda	%f0, [0x01c0, %r31]
fpinit_1_140:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 188: FDIVd	fdivd	%f0, %f4, %f4
ceter_1_141:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 189: RDTICK	rd	%tick, %r9
	.word 0xd277c000  ! 190: STX_R	stx	%r9, [%r31 + %r0]
	.word 0x8d802000  ! 191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_142:
	rd %pc, %r12
	add %r12, (donretarg_1_142-donret_1_142+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a33600 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd85, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_142:
	.word 0xd2ffe1e8  ! 192: SWAPA_I	swapa	%r9, [%r31 + 0x01e8] %asi
	.word 0x87998010  ! 193: WRHPR_HINTP_R	wrhpr	%r6, %r16, %hintp
splash_cmpr_1_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 194: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_1_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_144
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
cwq_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 195: RDPC	rd	%pc, %r20
br_badelay2_1_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f4, %f20
	.word 0x91b20309  ! 196: ALIGNADDRESS	alignaddr	%r8, %r9, %r8
splash_tba_1_146:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd05fc000  ! 198: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x81460000  ! 199: RD_STICK_REG	stbar
	.word 0xd01fe1c8  ! 200: LDD_I	ldd	[%r31 + 0x01c8], %r8
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
    brnz %r10, cwq_1_147
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_147
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
cwq_1_147:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 201: RDPC	rd	%pc, %r9
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

	.xword	0x0af1724c46ca53d4
	.xword	0x7844e5c7d62fd766
	.xword	0xdac0281b78099bd4
	.xword	0x2fd2327d95d4127f
	.xword	0x7f9707458ed02e3f
	.xword	0x2e16234e27c325fd
	.xword	0xe403b3669fc69ae9
	.xword	0x40a0dce85af1634f
	.xword	0xc87839ab0bf13394
	.xword	0x96fee66d66c10122
	.xword	0xc470186f2e4b1f70
	.xword	0x69d76aa4bb339712
	.xword	0x897e35ba9dbc14a4
	.xword	0xc8cf333ccac7c69d
	.xword	0xa29ffb0591403ad2
	.xword	0x8831ec4c5698d3c7
	.xword	0x23d7d08bb80d3a63
	.xword	0x9bdcf5511324ce0e
	.xword	0x4f9277edd2dbdccf
	.xword	0x6064ee8b9a904433
	.xword	0xef44462c755b1457
	.xword	0xf7a2347f596b33fe
	.xword	0x1fca39cbd2a9a3b4
	.xword	0xd86b2fc9c058b99d
	.xword	0xb67704fbe905da81
	.xword	0x8ccd2ab1ddaa27b6
	.xword	0x3116bdbcc6a467de
	.xword	0xd741163eaece4083
	.xword	0x88a80f140ea2c55c
	.xword	0xaea6bc663b5056af
	.xword	0xe642740c2e4eeaa5
	.xword	0xe716cfff457b565a
	.xword	0x8827e42fbd82bd90
	.xword	0x97d17b3bbfc79016
	.xword	0xad9b6192b9d7e210
	.xword	0xd8589ebd45d5edf2
	.xword	0x0e77946dcbd3c935
	.xword	0xf0af16a6acc0dec1
	.xword	0xd57350e1d5445962
	.xword	0x93ff4f4264fa841b
	.xword	0xb9ab87025abba096
	.xword	0x16d4bb6c13a46708
	.xword	0xf404513c6cb0551a
	.xword	0xcd9861459e906c09
	.xword	0xff6c118d63cda3b2
	.xword	0x33542527d5d8da87
	.xword	0x647684cc5034d40f
	.xword	0xecab1a23d3a19355
	.xword	0xb01b0b4663f1fa60
	.xword	0xb3ec20c115ad9992
	.xword	0x7d45a74dd8481f30
	.xword	0x5a64545eec1b137a
	.xword	0x2ff07ca79152ce9b
	.xword	0xd1e0c598c0c0d6b4
	.xword	0x560c2ace1a1a136c
	.xword	0xb9052270561885b4
	.xword	0x95e9177fc11d6812
	.xword	0x56a7bcd6323634fb
	.xword	0x117683477a0e2012
	.xword	0xbcf4bc3af8ef3216
	.xword	0x8bb9750431d43bf7
	.xword	0x70caefee95a27645
	.xword	0x2c35c1619b0b9c28
	.xword	0xc494e975aa347d46
	.xword	0x45673f398e8e5bb6
	.xword	0x4ec80cc384096303
	.xword	0x3617b15919926015
	.xword	0xf63ad8f6ac1a8d1d
	.xword	0x050f4e9d2b812801
	.xword	0xe69470986bdaa11b
	.xword	0xaff1250cbfa618b3
	.xword	0x9f1d4345a776fb72
	.xword	0x9310ea74bcc3c354
	.xword	0x175a614fab9e41b3
	.xword	0xf60bcadd216fc552
	.xword	0x854569858824f115
	.xword	0x8d4c99a5c993ecc1
	.xword	0xf177d96c09d02e1d
	.xword	0x7d8f639177fcda00
	.xword	0xcd1f52120c7b4616
	.xword	0x30b3857e80784b5e
	.xword	0x9ebcbcefc0eacb2b
	.xword	0x7ac774cf2d6edb9d
	.xword	0x173118199c39ff3e
	.xword	0x2b3147f57da6e51a
	.xword	0xe01e0ebdd0b36d0a
	.xword	0xe533908e7b01eb58
	.xword	0x54ad3d495effa0c7
	.xword	0x73c5148262d6a62c
	.xword	0x3a7db5db36241871
	.xword	0xda5170537e242598
	.xword	0x69790c7cb9a53d9d
	.xword	0x9e5c8ca93a9d58ec
	.xword	0xb1074dfba8a05193
	.xword	0x4d1bc5d35961bb11
	.xword	0x217d923220bf990f
	.xword	0x8d979a3c85a7517b
	.xword	0xdf80d051d29fcfab
	.xword	0x4cf9b027b7fe5777
	.xword	0x43c14985c8bd18fa
	.xword	0x0426940d357be6b0
	.xword	0xd1fd2064598d290b
	.xword	0xb990eab305333122
	.xword	0x29da1ce06c3ac58a
	.xword	0x5c7bc2cf6e1c6f59
	.xword	0xe0931b664f879030
	.xword	0x508c90c28b8552a4
	.xword	0xe74ed1656ff0751f
	.xword	0x5c186179ed4d8420
	.xword	0xeac11e92a0fad02e
	.xword	0x33b27b121803bf01
	.xword	0x22a50507d409e794
	.xword	0x6a1a2f14270acc12
	.xword	0xd23d467a82daa03c
	.xword	0x7470e53871dabe45
	.xword	0x735a36d745bd3047
	.xword	0x85b85dff7b086e6d
	.xword	0x3af893e900cbe8c8
	.xword	0xf61815c1f0606feb
	.xword	0x65c6e2dd305d1396
	.xword	0x782ceebd0eb50db4
	.xword	0x9012f4282e379e9c
	.xword	0x20a9fe04f871a7cd
	.xword	0xc9564ccc91025a7f
	.xword	0x015aa33b8e2c7248
	.xword	0x0e5ec667feffb674
	.xword	0x3e8a350cc5873022
	.xword	0x1940f05b801be30e
	.xword	0x747a6f238e9cd058
	.xword	0x6572129d56cf6215
	.xword	0xf989860b6d5ae83b
	.xword	0x4d16c7ff344ee0d6
	.xword	0xe29728e89f77d645
	.xword	0x31e6c54511e30a27
	.xword	0x930a46a4d67aa998
	.xword	0x35bf55bc3df2fdaf
	.xword	0xc70be9130277bf30
	.xword	0x14c2c8cd0a33a75a
	.xword	0x0d8f9ca01f882716
	.xword	0x0267642f41dd525c
	.xword	0x8771b8af132f2c9a
	.xword	0x7b1aff51775c59ce
	.xword	0x7c784a76d0e284aa
	.xword	0x21ae224dad900e27
	.xword	0xb52f2e8e2b8fb37c
	.xword	0xa50e430ec39d0d7e
	.xword	0x8aba5e16be175434
	.xword	0xf2f29fdde5400d84
	.xword	0x45d6077119079324
	.xword	0x132375da005851be
	.xword	0xb096d6cda760e3fc
	.xword	0xee6196f9b2770ade
	.xword	0x83e643b99e7a6e1d
	.xword	0x04ec00293d0291e4
	.xword	0x13fa4a6ec816db29
	.xword	0x6a92cbd691b6e1ea
	.xword	0x4bf2d7dbdecff465
	.xword	0x2c1a90b8b4fc03b3
	.xword	0x68771e0a011a7a9d
	.xword	0x9f0756991ce82cfe
	.xword	0xc21f014ffb1bcb8d
	.xword	0x5188f9ffb9a17eb9
	.xword	0xdcd01298d05d0507
	.xword	0xee72e46dd7084f93
	.xword	0xc696ca21be01c189
	.xword	0x29dc6b5611f12693
	.xword	0xdabcca1fbe133b04
	.xword	0xaf8f72081f121a1b
	.xword	0x7febd5dea2e3bba0
	.xword	0xa0255127f9810dec
	.xword	0xf12281288f86ba28
	.xword	0x5604c0619a940a0d
	.xword	0x723a46820695bb84
	.xword	0xe4f19b9de0147072
	.xword	0x0c63bb80c550087a
	.xword	0xb35e41decb046a7f
	.xword	0x35b5ff570776444f
	.xword	0x27f1337f1bff0b3b
	.xword	0x74a3625b8bf5dba9
	.xword	0x1c02406bcca5fe69
	.xword	0xce8670e041f01fb0
	.xword	0x5a9de66a9c48e8e0
	.xword	0xae2ed5dc3b7ab9c2
	.xword	0x5d107f25dfe95e98
	.xword	0x0ba386f62b293f2b
	.xword	0x405b8c58e9d911d5
	.xword	0xdbd68bf67befbda4
	.xword	0x6db41b073498939f
	.xword	0xce4e37561f142a46
	.xword	0x09b35de4923c4d05
	.xword	0x8ffbf8085eb9f9a8
	.xword	0x87a503371044949e
	.xword	0xc45cc4defd3559c8
	.xword	0x3352b46b077c7242
	.xword	0x1a1dfe9ed944d185
	.xword	0x418ad3f6252a1576
	.xword	0xcae8219b9914812c
	.xword	0x9fb8be7adc726f04
	.xword	0x9916d735016c8526
	.xword	0x5dc8037b8b509656
	.xword	0x3950bb3b0887b65f
	.xword	0x24a547275b1c23a3
	.xword	0x0bc302b07c1877ab
	.xword	0x2cb78b9ef2a19776
	.xword	0x5be4f28fb1322a78
	.xword	0xde5ab8764cb3c2ab
	.xword	0x611e7f3b14085c4e
	.xword	0x85fef73e1cae9adc
	.xword	0x58d9cba648648172
	.xword	0xfa65d8f003c4fadb
	.xword	0x6cbce50b1344d08a
	.xword	0x77cf616cbf851979
	.xword	0x657de0f77a811197
	.xword	0xfbd6f92cb8be3393
	.xword	0xe9c5000975e2cc48
	.xword	0xe046494a921108ff
	.xword	0x59402bfc4c4860a7
	.xword	0x3bdd376e92d7378a
	.xword	0x4d3f112c9abf0668
	.xword	0x00d68c1979f6439d
	.xword	0x5539e5f4824661a4
	.xword	0x54d00ef2042b9009
	.xword	0xcf5ab2efabe1f982
	.xword	0x6cbba1c391cc2f38
	.xword	0xca0135d5030b73b9
	.xword	0xfb06ce83d9ee5ecb
	.xword	0x323cdb9ebc5451b3
	.xword	0xf5422f981651b904
	.xword	0xe9d2427e6dbd1760
	.xword	0xfd0e5a35d579b130
	.xword	0x462f76a8f26b4a1a
	.xword	0xd3d8f5740b843299
	.xword	0x51dac289875d5c33
	.xword	0x7f0bd969aabe1d3a
	.xword	0x4792a88db3cd49bd
	.xword	0x65114b18d5b6398f
	.xword	0x0a507cec54f73948
	.xword	0xd0d0a151ae433415
	.xword	0xd218edc4ff9b396b
	.xword	0xedbb76f411e9a4a7
	.xword	0x84cb6f0ab483ba21
	.xword	0x2ed1af68801e7413
	.xword	0x96c43b0a43e66fad
	.xword	0x27a3ebb424510f65
	.xword	0xb490139cb461b609
	.xword	0xe76af9a7f8959d43
	.xword	0x93f572a49b9b8182
	.xword	0xe1cde640ed889e45
	.xword	0xe26c55a6a45bd2cc
	.xword	0x0af6237a665e68e1
	.xword	0x18c8c0cedbad2830
	.xword	0x5ce8f65b4351980a
	.xword	0x3c353236e57cebf6
	.xword	0xc60d17ff942a2447
	.xword	0xf697a47039a3148e
	.xword	0x587845c09ce84901

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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	TTE_CP	 = 0,
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
	TTE_W	 = 0,
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	.xword	0x2b05d14386ce19f0
	.xword	0xd5b84c8f2a667056
	.xword	0x338d088015fd7339
	.xword	0xdff8eddebad41434
	.xword	0xa1959c8c4b593415
	.xword	0xb77790a5c783085e
	.xword	0x438f30a4fbc5eefd
	.xword	0x433ffa5f660bdc21
	.xword	0x4ea70e6d2440059d
	.xword	0x86bbc7ac3cfcc49c
	.xword	0xc21b32a769b1aae9
	.xword	0x5e48708ba07feb32
	.xword	0x00d4be16fb9e2995
	.xword	0x32e100a963ca1f0b
	.xword	0xa7be76a342f1ea3f
	.xword	0x6e3e0d898d34b499
	.xword	0x8b6f1f95e4265e97
	.xword	0xc87a03ccba7ad49d
	.xword	0xc307174178a2dd33
	.xword	0xcb5c2cd7da7d9241
	.xword	0x2ce0e23e0615e1f5
	.xword	0x137c60bbbe21f766
	.xword	0xd98a3ca3efc0ac69
	.xword	0xac819a592f4f9fd5
	.xword	0x57a9b5dadd13c34e
	.xword	0x6ba91bfdb2396c5d
	.xword	0x2878353344f08496
	.xword	0x60b71978ec499505
	.xword	0x59a77cfeac08cc8d
	.xword	0xc9fae343cdfaae92
	.xword	0x7e9c9774e730eff1
	.xword	0x73a405c3c1d47060



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
	TTE_Size	 = 1,
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
	TTE_Size	 = 5,
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
	.xword	0xe07d0a53daf5f3ae
	.xword	0x9b921452e3ae4b19
	.xword	0x18e5ec0b581c899d
	.xword	0xccbc19d7334e8680
	.xword	0xfc9a02f1b42f9195
	.xword	0x1d57cbb1e1e5b5f3
	.xword	0xda413b9b2e42cbc1
	.xword	0xe1ae046bcba31347
	.xword	0xb6b29d2a7a24b960
	.xword	0xbb1ac3674ed4a7da
	.xword	0x0ea9bd27cb2fed3c
	.xword	0x456a74416fda2217
	.xword	0x13b42037975de273
	.xword	0xdfe5129103dbc87d
	.xword	0xb095c8dc0ac2efe9
	.xword	0x66205b28c3a83b58
	.xword	0x1b0bf011d4f9bb53
	.xword	0xf204b6ac264f6384
	.xword	0x57c74f572bf8ddea
	.xword	0x316b833668883261
	.xword	0x88ccc3020e87ae61
	.xword	0x1bdd2aeb1340c0bb
	.xword	0xa45dea83906fd20e
	.xword	0x3287135246009223
	.xword	0xb5ff75cf86d79b65
	.xword	0xfa28fd29780f608c
	.xword	0x7d8ac5dfc78c0b59
	.xword	0xe75644668a48c671
	.xword	0x96a6efe405d8e1c9
	.xword	0x0a6a6e580f364be8
	.xword	0x237eb6743705cbbf
	.xword	0xbb5d69894560ef5d



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
	TTE_NFO	 = 0,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 0,
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
	TTE_Size	 = 3,
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
	.xword	0xe53848abd18ec5c3
	.xword	0x31f77e910fa928db
	.xword	0xe8e1cc93af9d99d5
	.xword	0x4da3c87f4ff9b9f6
	.xword	0xe411f56b73a298b1
	.xword	0x3ae0a62435e7f412
	.xword	0x40f1668c0e333781
	.xword	0x126819b9d2b40224
	.xword	0x3c6eb514014297a8
	.xword	0xab3274d43e0c4a36
	.xword	0x811bbfc9b2fdc66e
	.xword	0x56b968edf7b6dcf4
	.xword	0x48f0882776aba194
	.xword	0xb1a795e8c1ed16b3
	.xword	0x8edf6b01d1f68dc9
	.xword	0x84d16bcc44daa1c3
	.xword	0xf2978bbf5e7782e6
	.xword	0x186007ad15605513
	.xword	0xe25cbeddc7a9a1ff
	.xword	0xc53311b0d4217060
	.xword	0xf4b916f6b1417a22
	.xword	0x5e0de2458fec7c89
	.xword	0xf780da2afe2e2cba
	.xword	0xa8e0a18c6f461b18
	.xword	0x19b080a7ae154345
	.xword	0xcd25ab730aa31afc
	.xword	0xbf4bd459f7777b00
	.xword	0xe7ac0e0c703879ea
	.xword	0xe1dca87c193c8fb4
	.xword	0x392b28cb130a4876
	.xword	0xe1d74500c4ff06b9
	.xword	0x014b8d46e6f1c279



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
	TTE_Size	 = 5,
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
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
	.xword	0x3aaa7d4e39604a13
	.xword	0x78b1c196c77fc22c
	.xword	0xe9557669e277520e
	.xword	0x8f85239ea4bfc0d0
	.xword	0x79d40070f1c252a2
	.xword	0x96a00ba468c8a404
	.xword	0x2b32ea5fc33e0586
	.xword	0xfebf3b9a08910d22
	.xword	0x6e65ffc2ca8d98dd
	.xword	0x988b8627eb933fda
	.xword	0xac942299cc04d427
	.xword	0xdddb288dcbc44981
	.xword	0xf15c6eeee037fca9
	.xword	0xa69184309e002508
	.xword	0x51c49e91e6c61d42
	.xword	0x0d3f3b7162f1a385
	.xword	0x630a992f710f54a0
	.xword	0xde08dda21f1624f8
	.xword	0x2b0f4e3022ddcce9
	.xword	0xe35f508cbcd658d7
	.xword	0x62a5356b8919c91f
	.xword	0x69babe49deeb10f3
	.xword	0xf37f200c4b4a872a
	.xword	0xe226fcfb5018b9ad
	.xword	0x6d3b743e5f3d0bd6
	.xword	0x0ece1ac932a7902a
	.xword	0x1d655523856c45b1
	.xword	0x76dd0841561b3bab
	.xword	0x0fa03a7059ea88dc
	.xword	0xde731d5639a4c2a3
	.xword	0xc9342b3d3a5893a9
	.xword	0xbebc5782b3875a87





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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f4
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
	TTE_P	 = 1,
	TTE_W	 = 1
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
	TTE_Size	 = 0,
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
nuff_said_3:
	fdivs %f0, %f4, %f6
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
