/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_fcrand05_ind_04.s
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
	mov 0xb3, %r14
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
	mov 0x31, %r14
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
	mov 0x32, %r14
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
	mov 0xb1, %r14
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
	mov 0x33, %r14
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
	mov 0x35, %r14
	mov 0x31, %r30
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
	.word 0xc32fc000  ! 1: STXFSR_R	st-sfr	%f1, [%r0, %r31]
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
mondo_80_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d92c00d  ! 1: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
trapasi_80_1:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 2: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
splash_cmpr_80_2:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 3: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_80_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_80_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 6: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa7850014  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r20, %-
	.word 0xd07fe0b0  ! 8: SWAP_I	swap	%r8, [%r31 + 0x00b0]
	.word 0x91904010  ! 9: WRPR_PIL_R	wrpr	%r1, %r16, %pil
brcommon3_80_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd03fe000  ! 10: STD_I	std	%r8, [%r31 + 0x0000]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_8:
	rd %pc, %r12
	add %r12, (donretarg_80_8-donret_80_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0092ca00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1417, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	retry
donretarg_80_8:
	.word 0xd06fe014  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x0014]
	.word 0xab81c012  ! 12: WR_CLEAR_SOFTINT_R	wr	%r7, %r18, %clear_softint
dvapa_80_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xca6, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc010  ! 13: STDF_R	std	%f8, [%r16, %r31]
	.word 0xa569c012  ! 14: SDIVX_R	sdivx	%r7, %r18, %r18
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
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
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
	.word 0xa5414000  ! 15: RDPC	rd	%pc, %r18
	.word 0xe4800b00  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
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
    brnz %r10, sma_80_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 17: CASA_R	casa	[%r31] %asi, %r10, %r18
brcommon1_80_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe130  ! 1: STXFSR_I	st-sfr	%f1, [0x0130, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f80331e  ! 18: SIR	sir	0x131e
	.word 0x8d903e59  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1e59, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_14) + 48, 16, 16)) -> intp(3,0,20)
#else
	setx 0x2688d882048f6a47, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_80_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7848010  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
intveclr_80_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0x61580084731c4428, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_80_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4884980  ! 24: LDUBA_R	lduba	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_80_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa33aab48b39152ad, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbea28413cd48f76c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_80_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe150  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x0150]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd53fc013  ! 30: STDF_R	std	%f10, [%r19, %r31]
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
    brnz %r10, cwq_80_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_23
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
cwq_80_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 31: RDPC	rd	%pc, %r19
	.word 0x879c31ac  ! 32: WRHPR_HINTP_I	wrhpr	%r16, 0x11ac, %hintp
	.word 0xd497e078  ! 33: LDUHA_I	lduha	[%r31, + 0x0078] %asi, %r10
	.word 0xd43fe090  ! 34: STD_I	std	%r10, [%r31 + 0x0090]
splash_lsu_80_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xddd72f15, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7804005  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r5, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_27:
	rd %pc, %r12
	add %r12, (donretarg_80_27-donret_80_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001f2c00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x151d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	done
donretarg_80_27:
	.word 0x32800001  ! 37: BNE	bne,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_28) + 8, 16, 16)) -> intp(2,0,4)
#else
	setx 0xb1ea8dce9e2f0c79, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91934014  ! 39: WRPR_PIL_R	wrpr	%r13, %r20, %pil
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
    brnz %r10, sma_80_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 40: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0xd497e160  ! 41: LDUHA_I	lduha	[%r31, + 0x0160] %asi, %r10
	.word 0x8d802004  ! 42: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_80_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf0ce3d3296ff8841, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7840009  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r9, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_80_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 46: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_80_36:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982717  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0717, %hpstate
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
    brnz %r10, cwq_80_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_37
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
cwq_80_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 49: RDPC	rd	%pc, %r20
splash_hpstate_80_38:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d97  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
	fbge,a,pn	%fcc0,  skip_80_39
	.word 0x9f8023c9  ! 1: SIR	sir	0x03c9
.align 2048
skip_80_39:
	.word 0xe43fc000  ! 51: STD_R	std	%r18, [%r31 + %r0]
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 52: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_80_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 53: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0xfff5000bd8866e15, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_80_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4904e60  ! 55: LDUHA_R	lduha	[%r1, %r0] 0x73, %r18
memptr_80_43:
	set 0x60140000, %r31
	.word 0x8582fe45  ! 56: WRCCR_I	wr	%r11, 0x1e45, %ccr
memptr_80_44:
	set 0x60540000, %r31
	.word 0x8584f9f5  ! 57: WRCCR_I	wr	%r19, 0x19f5, %ccr
	.word 0xa9a44d33  ! 58: FsMULd	fsmuld	%f17, %f50, %f20
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_45:
	rd %pc, %r12
	add %r12, (donretarg_80_45-donret_80_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c0a700 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x757, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_45:
	.word 0xd4ffe07c  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x007c] %asi
	.word 0x9b703eb3  ! 60: POPC_I	popc	0x1eb3, %r13
splash_tba_80_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_80_48:
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
ibp_startwait80_48:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_48
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_48:
    brnz %r16, ibp_wait80_48
    ld [%r23], %r16
    ba ibp_startwait80_48
    mov 0x80, %r16
continue_ibp_80_48:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_48:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_48
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_48:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_48
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_48:
    best_set_reg(0x00000050a2c000a1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a449ad  ! 62: FDIVs	fdivs	%f17, %f13, %f20
	.word 0xa7450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r19
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe0e0  ! 65: LDDF_I	ldd	[%r31, 0x00e0], %f11
memptr_80_49:
	set 0x60740000, %r31
	.word 0x8582fbca  ! 66: WRCCR_I	wr	%r11, 0x1bca, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
	.word 0x99b0c489  ! 68: FCMPLE32	fcmple32	%d34, %d40, %r12
	.word 0xdb1fe1d0  ! 69: LDDF_I	ldd	[%r31, 0x01d0], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_80_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaf5, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93b0c7c7  ! 71: PDIST	pdistn	%d34, %d38, %d40
splash_cmpr_80_52:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 72: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_80_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5be0f0a777752914, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_80_54:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 75: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_56) + 0, 16, 16)) -> intp(3,0,30)
#else
	setx 0xb1237167ded0480e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_80_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x1c4cf68f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_80_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802004  ! 80: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd45fe038  ! 81: LDX_I	ldx	[%r31 + 0x0038], %r10
br_badelay1_80_60:
	.word 0xd43fc013  ! 1: STD_R	std	%r10, [%r31 + %r19]
	.word 0xe732c00a  ! 1: STQF_R	-	%f19, [%r10, %r11]
	.word 0x87afca52  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f18
	normalw
	.word 0x97458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r11
mondo_80_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94800a  ! 83: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_80_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_62
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
cwq_80_62:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 85: RDPC	rd	%pc, %r10
pmu_80_63:
	nop
	setx 0xfffff14dffffffb5, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_80_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_80_65:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 88: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_80_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x68a345f7, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_80_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_67
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
cwq_80_67:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 91: RDPC	rd	%pc, %r13
	.word 0xd827e171  ! 92: STW_I	stw	%r12, [%r31 + 0x0171]
splash_tba_80_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x3cd0d7ed52365564, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802004  ! 96: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd91fc008  ! 97: LDDF_R	ldd	[%r31, %r8], %f12
splash_cmpr_80_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_80_72:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 100: RDTICK	rd	%tick, %r11
	.word 0x2aca0001  ! 1: BRNZ	brnz,a,pt	%r8,<label_0xa0001>
	.word 0x8d9032a5  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x12a5, %pstate
intveclr_80_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x166ea9e8d9b81fc1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_80_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 103: FCMPd	fcmpd	%fcc<n>, %f0, %f4
jmptr_80_76:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_80_77:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_80_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 106: CASA_R	casa	[%r31] %asi, %r12, %r20
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
    brnz %r10, sma_80_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 107: CASA_R	casa	[%r31] %asi, %r17, %r20
splash_cmpr_80_80:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 108: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_80_81:
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
ibp_startwait80_81:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_81
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_81:
    brnz %r16, ibp_wait80_81
    ld [%r23], %r16
    ba ibp_startwait80_81
    mov 0x80, %r16
continue_ibp_80_81:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_81:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_81
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_81:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_81
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_81:
    best_set_reg(0x000000403bc0a1f3,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe140  ! 109: STDFA_I	stda	%f16, [0x0140, %r31]
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87ad0ad4  ! 111: FCMPEd	fcmped	%fcc<n>, %f20, %f20
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
    brnz %r10, cwq_80_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_82
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
cwq_80_82:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 112: RDPC	rd	%pc, %r16
cwp_80_83:
    set user_data_start, %o7
	.word 0x93902000  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa4dc400d  ! 114: SMULcc_R	smulcc 	%r17, %r13, %r18
	.word 0x8d802000  ! 115: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_80_84:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c044a0  ! 116: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r18
	.word 0x8d802000  ! 117: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_80_85:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 118: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
	.word 0x9353c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_80_86:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8198269d  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069d, %hpstate
intveclr_80_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdba252d8e0cad1b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e0d0  ! 122: STQF_I	-	%f20, [0x00d0, %r31]
	.word 0x98c0a169  ! 123: ADDCcc_I	addccc 	%r2, 0x0169, %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_88) + 32, 16, 16)) -> intp(4,0,28)
#else
	setx 0x7594493668d35cd4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_80_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8904e60  ! 125: LDUHA_R	lduha	[%r1, %r0] 0x73, %r20
trapasi_80_90:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xe88844a0  ! 126: LDUBA_R	lduba	[%r1, %r0] 0x25, %r20
	ble,a	 skip_80_91
	.word 0xa5b444d3  ! 1: FCMPNE32	fcmpne32	%d48, %d50, %r18
.align 512
skip_80_91:
	.word 0x91a1c9cb  ! 127: FDIVd	fdivd	%f38, %f42, %f8
intveclr_80_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc367019ef9895155, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_80_93:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd0904a00  ! 129: LDUHA_R	lduha	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe19fc3e0  ! 131: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e088  ! 133: LDQFA_I	-	[%r31, 0x0088], %f8
dvapa_80_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x808, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91702c55  ! 134: POPC_I	popc	0x0c55, %r8
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802082  ! 137: WRASI_I	wr	%r0, 0x0082, %asi
memptr_80_97:
	set 0x60740000, %r31
	.word 0x858475f4  ! 138: WRCCR_I	wr	%r17, 0x15f4, %ccr
splash_cmpr_80_98:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87a90a22  ! 140: FCMPs	fcmps	%fcc<n>, %f4, %f2
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e140  ! 142: LDSWA_I	ldswa	[%r31, + 0x0140] %asi, %r8
splash_tba_80_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_80_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_101:
	.word 0x8f902000  ! 144: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_102:
	rd %pc, %r12
	add %r12, (donretarg_80_102-donret_80_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eefe00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdef, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2cc8c001  ! 1: BRGZ	brgz,a,pt	%r3,<label_0x8c001>
	retry
donretarg_80_102:
	.word 0x36800001  ! 145: BGE	bge,a	<label_0x1>
	.word 0xd097c02b  ! 146: LDUHA_R	lduha	[%r31, %r11] 0x01, %r8
	.word 0x83d02035  ! 147: Tcc_I	te	icc_or_xcc, %r0 + 53
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
    brnz %r10, cwq_80_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_104
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
cwq_80_104:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 148: RDPC	rd	%pc, %r10
mondo_80_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 149: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xe19fe0c0  ! 150: LDDFA_I	ldda	[%r31, 0x00c0], %f16
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
    brnz %r10, cwq_80_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_106
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
cwq_80_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 151: RDPC	rd	%pc, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_108) + 56, 16, 16)) -> intp(1,0,5)
#else
	setx 0x17201d171fcd23cd, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9039be  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x19be, %pstate
dvapa_80_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdfa, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7a489b2  ! 155: FDIVs	fdivs	%f18, %f18, %f19
	.word 0xd0800b40  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_80_112:
	set 0x60140000, %r31
	.word 0x8584bab2  ! 158: WRCCR_I	wr	%r18, 0x1ab2, %ccr
	.word 0x964c8014  ! 159: MULX_R	mulx 	%r18, %r20, %r11
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
    brnz %r10, sma_80_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00a  ! 160: CASA_R	casa	[%r31] %asi, %r10, %r17
ibp_80_114:
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
ibp_startwait80_114:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_114
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_114:
    brnz %r16, ibp_wait80_114
    ld [%r23], %r16
    ba ibp_startwait80_114
    mov 0x80, %r16
continue_ibp_80_114:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_114:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_114
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_114:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_114
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_114:
    best_set_reg(0x000000502ae1f368,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x95b447c9  ! 161: PDIST	pdistn	%d48, %d40, %d10
memptr_80_115:
	set 0x60140000, %r31
	.word 0x8580a18b  ! 162: WRCCR_I	wr	%r2, 0x018b, %ccr
splash_tba_80_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9248c001  ! 164: MULX_R	mulx 	%r3, %r1, %r9
	.word 0x91d020b2  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 178
ibp_80_117:
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
ibp_startwait80_117:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_117
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_117:
    brnz %r16, ibp_wait80_117
    ld [%r23], %r16
    ba ibp_startwait80_117
    mov 0x80, %r16
continue_ibp_80_117:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_117:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_117
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_117:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_117
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_117:
    best_set_reg(0x0000004002f3688b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91b0848a  ! 166: FCMPLE32	fcmple32	%d2, %d10, %r8
brcommon2_80_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x93a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe1e0  ! 167: LDDFA_I	ldda	[%r31, 0x01e0], %f16
	.word 0xd027e1b8  ! 168: STW_I	stw	%r8, [%r31 + 0x01b8]
ibp_80_119:
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
ibp_startwait80_119:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_119
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_119:
    brnz %r16, ibp_wait80_119
    ld [%r23], %r16
    ba ibp_startwait80_119
    mov 0x80, %r16
continue_ibp_80_119:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_119:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_119
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_119:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_119
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_119:
    best_set_reg(0x0000004024e88b71,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a1c9aa  ! 169: FDIVs	fdivs	%f7, %f10, %f19
	.word 0x91520000  ! 170: RDPR_PIL	rdpr	%pil, %r8
mondo_80_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d948010  ! 171: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0x8d802000  ! 172: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe08fe048  ! 173: LDUBA_I	lduba	[%r31, + 0x0048] %asi, %r16
	setx 0xd26e5e523001acf3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x92c4e348  ! 175: ADDCcc_I	addccc 	%r19, 0x0348, %r9
ibp_80_122:
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
ibp_startwait80_122:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_122
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_122:
    brnz %r16, ibp_wait80_122
    ld [%r23], %r16
    ba ibp_startwait80_122
    mov 0x80, %r16
continue_ibp_80_122:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_122:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_122
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_122:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_122
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_122:
    best_set_reg(0x000000403acb7184,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fe140  ! 176: LDDFA_I	ldda	[%r31, 0x0140], %f16
ibp_80_123:
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
ibp_startwait80_123:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_123
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_123:
    brnz %r16, ibp_wait80_123
    ld [%r23], %r16
    ba ibp_startwait80_123
    mov 0x80, %r16
continue_ibp_80_123:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_123:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_123
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_123:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_123
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_123:
    best_set_reg(0x00000040ecf184ab,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fde00  ! 177: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_80_124:
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
ibp_startwait80_124:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_124
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_124:
    brnz %r16, ibp_wait80_124
    ld [%r23], %r16
    ba ibp_startwait80_124
    mov 0x80, %r16
continue_ibp_80_124:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_124:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_124
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_124:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_124
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_124:
    best_set_reg(0x0000004011c4ab95,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa3a189ad  ! 178: FDIVs	fdivs	%f6, %f13, %f17
	.word 0xe897e088  ! 179: LDUHA_I	lduha	[%r31, + 0x0088] %asi, %r20
fpinit_80_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8234d  ! 180: PREFETCHA_I	prefetcha	[%r0, + 0x034d] %asi, #one_read
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_80_127:
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
ibp_startwait80_127:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_127
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_127:
    brnz %r16, ibp_wait80_127
    ld [%r23], %r16
    ba ibp_startwait80_127
    mov 0x80, %r16
continue_ibp_80_127:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_127
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_127:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_127
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_127:
    best_set_reg(0x000000401aeb9583,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fda00  ! 182: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_128) + 40, 16, 16)) -> intp(2,0,2)
#else
	setx 0xf92fe1a57c80c80f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x038d913809b58a44, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_80_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa07, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe140  ! 185: STDFA_I	stda	%f16, [0x0140, %r31]
mondo_80_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d91c013  ! 186: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_80_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d948006  ! 188: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
mondo_80_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 189: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
memptr_80_134:
	set 0x60140000, %r31
	.word 0x858072cb  ! 190: WRCCR_I	wr	%r1, 0x12cb, %ccr
splash_hpstate_80_135:
	.word 0x819828d5  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_80_136:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81983599  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1599, %hpstate
splash_hpstate_80_137:
	ta T_CHANGE_NONHPRIV
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x819826c7  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c7, %hpstate
	.word 0xc19fd920  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_80_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x354d5c80b16d75c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_80_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950009  ! 199: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
splash_lsu_80_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xde22e983, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_80_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_143:
	.word 0x8f902000  ! 201: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
mondo_40_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d94000a  ! 1: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
trapasi_40_1:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xd0c044a0  ! 2: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r8
splash_cmpr_40_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 3: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_40_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_3:
	.word 0x8f902002  ! 4: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_40_4:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 6: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_decr_40_5:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa784400d  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r13, %-
	.word 0xd07fe1b0  ! 8: SWAP_I	swap	%r8, [%r31 + 0x01b0]
	.word 0x91918012  ! 9: WRPR_PIL_R	wrpr	%r6, %r18, %pil
brcommon3_40_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd1e7e010  ! 10: CASA_R	casa	[%r31] %asi, %r16, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_8:
	rd %pc, %r12
	add %r12, (donretarg_40_8-donret_40_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00481100 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_8:
	.word 0xd06fe0e0  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x00e0]
	.word 0xab820001  ! 12: WR_CLEAR_SOFTINT_R	wr	%r8, %r1, %clear_softint
dvapa_40_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0x96f, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd09fe150  ! 13: LDDA_I	ldda	[%r31, + 0x0150] %asi, %r8
	.word 0xa96c400c  ! 14: SDIVX_R	sdivx	%r17, %r12, %r20
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
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
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
	.word 0x97414000  ! 15: RDPC	rd	%pc, %r11
	.word 0xe48008a0  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_40_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 17: CASA_R	casa	[%r31] %asi, %r13, %r18
brcommon1_40_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe060  ! 1: STXFSR_I	st-sfr	%f1, [0x0060, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f802d3e  ! 18: SIR	sir	0x0d3e
	.word 0x8d902c23  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x0c23, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_14) + 0, 16, 16)) -> intp(2,0,1)
#else
	setx 0x2c4d904b047dff01, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_40_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_40_16:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7814005  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r5, %-
intveclr_40_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf22e6f8c142fbb71, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_40_18:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d84980  ! 24: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_40_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3ed7c2ca3b5596f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x34bbf0f2b6f2e9ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_40_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe020  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x0020]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd4bfc030  ! 30: STDA_R	stda	%r10, [%r31 + %r16] 0x01
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
    brnz %r10, cwq_40_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_23
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
cwq_40_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 31: RDPC	rd	%pc, %r19
	.word 0x879c6c67  ! 32: WRHPR_HINTP_I	wrhpr	%r17, 0x0c67, %hintp
	.word 0xd497e0f0  ! 33: LDUHA_I	lduha	[%r31, + 0x00f0] %asi, %r10
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
	add %r19, (16+1), %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd49fc02d  ! 34: LDDA_R	ldda	[%r31, %r13] 0x01, %r10
splash_lsu_40_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x56747e16, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_decr_40_26:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7844005  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r5, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_27:
	rd %pc, %r12
	add %r12, (donretarg_40_27-donret_40_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001bc200 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	done
donretarg_40_27:
	.word 0x2d400001  ! 37: FBPG	fbg,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_28) + 0, 16, 16)) -> intp(3,0,23)
#else
	setx 0x753f4b57a2ed427d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91940007  ! 39: WRPR_PIL_R	wrpr	%r16, %r7, %pil
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
    brnz %r10, sma_40_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00d  ! 40: CASA_R	casa	[%r31] %asi, %r13, %r10
	.word 0xd497e1a0  ! 41: LDUHA_I	lduha	[%r31, + 0x01a0] %asi, %r10
	.word 0x8d802004  ! 42: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_40_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2a61f97cf4864315, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_40_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa781000c  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r12, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_40_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 46: FDIVd	fdivd	%f0, %f4, %f4
invtsb_40_35:
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
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_40_36:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x81983195  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1195, %hpstate
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
    brnz %r10, cwq_40_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_37
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
cwq_40_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 49: RDPC	rd	%pc, %r16
splash_hpstate_40_38:
	ta T_CHANGE_NONHPRIV
	.word 0x8198228c  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
	.word 0xc30fc000  ! 51: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 52: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_40_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 53: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x1926925dbef8bac5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_40_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4c84e60  ! 55: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r18
memptr_40_43:
	set 0x60340000, %r31
	.word 0x85852baf  ! 56: WRCCR_I	wr	%r20, 0x0baf, %ccr
memptr_40_44:
	set 0x60340000, %r31
	.word 0x85833b79  ! 57: WRCCR_I	wr	%r12, 0x1b79, %ccr
	.word 0xa1a48d33  ! 58: FsMULd	fsmuld	%f18, %f50, %f16
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_45:
	rd %pc, %r12
	add %r12, (donretarg_40_45-donret_40_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b78a00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1706, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_45:
	.word 0xd4ffe126  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x0126] %asi
iaw_40_46:
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
iaw_startwait40_46:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_46
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_46:
    brnz %r16, iaw_wait40_46
    ld [%r23], %r16
    ba iaw_startwait40_46
    mov 0x40, %r16
continue_iaw_40_46:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_46:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_46
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_46:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_46
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_46:
	mov 0x38, %r18
iaw4_40_46:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91702cb7  ! 60: POPC_I	popc	0x0cb7, %r8
splash_tba_40_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_40_48:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9ba509d4  ! 62: FDIVd	fdivd	%f20, %f20, %f44
	.word 0x97450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe1f0  ! 65: LDDF_I	ldd	[%r31, 0x01f0], %f11
memptr_40_49:
	set 0x60540000, %r31
	.word 0x85847554  ! 66: WRCCR_I	wr	%r17, 0x1554, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
iaw_40_50:
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
iaw_startwait40_50:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_50
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_50:
    brnz %r16, iaw_wait40_50
    ld [%r23], %r16
    ba iaw_startwait40_50
    mov 0x40, %r16
continue_iaw_40_50:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_50:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_50
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_50:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_50
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_50:
	mov 0x38, %r18
iaw1_40_50:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87a8ca4c  ! 68: FCMPd	fcmpd	%fcc<n>, %f34, %f12
	.word 0xdb1fe1b0  ! 69: LDDF_I	ldd	[%r31, 0x01b0], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_40_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0x977, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3702e41  ! 71: POPC_I	popc	0x0e41, %r17
splash_cmpr_40_52:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 72: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_40_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1440f3fe669fec96, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_40_54:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d90c003  ! 75: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_56) + 48, 16, 16)) -> intp(3,0,27)
#else
	setx 0xe03d9dede4a035d2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_40_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x8dcfcb9f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_40_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8780204f  ! 80: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd45fe1d0  ! 81: LDX_I	ldx	[%r31 + 0x01d0], %r10
br_badelay1_40_60:
	.word 0xd43fc011  ! 1: STD_R	std	%r10, [%r31 + %r17]
	.word 0xe7320006  ! 1: STQF_R	-	%f19, [%r6, %r8]
	.word 0xa9a7c9c9  ! 1: FDIVd	fdivd	%f62, %f40, %f20
	normalw
	.word 0x95458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r10
mondo_40_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 83: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_40_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_62
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
cwq_40_62:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 85: RDPC	rd	%pc, %r13
pmu_40_63:
	nop
	setx 0xfffff671fffffd8d, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_40_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_40_65:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 88: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_40_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xc3c39744, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_40_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_67
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
cwq_40_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 91: RDPC	rd	%pc, %r18
	.word 0xd827e17c  ! 92: STW_I	stw	%r12, [%r31 + 0x017c]
splash_tba_40_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xf6b1512f3758253a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802004  ! 96: WRFPRS_I	wr	%r0, 0x0004, %fprs
iaw_40_70:
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
iaw_startwait40_70:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_70
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_70:
    brnz %r16, iaw_wait40_70
    ld [%r23], %r16
    ba iaw_startwait40_70
    mov 0x40, %r16
continue_iaw_40_70:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_70:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_70
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_70:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_70
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_70:
	mov 0x38, %r18
iaw4_40_70:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd89fe040  ! 97: LDDA_I	ldda	[%r31, + 0x0040] %asi, %r12
splash_cmpr_40_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_40_72:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 100: RDTICK	rd	%tick, %r9
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ffb  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x1ffb, %pstate
intveclr_40_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x099f503ea75fec4c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_40_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 103: FDIVs	fdivs	%f0, %f4, %f6
jmptr_40_76:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_40_77:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_40_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e009  ! 106: CASA_R	casa	[%r31] %asi, %r9, %r20
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
    brnz %r10, sma_40_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 107: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_40_80:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 108: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_40_81:
	nop
	.word 0xe1bfe000  ! 109: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87accad2  ! 111: FCMPEd	fcmped	%fcc<n>, %f50, %f18
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
    brnz %r10, cwq_40_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_82
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
cwq_40_82:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 112: RDPC	rd	%pc, %r8
cwp_40_83:
    set user_data_start, %o7
	.word 0x93902005  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x98d98010  ! 114: SMULcc_R	smulcc 	%r6, %r16, %r12
	.word 0x8d802004  ! 115: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_40_84:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4d044a0  ! 116: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r18
	.word 0x8d802000  ! 117: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_40_85:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 118: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
	.word 0xa553c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_40_86:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x81983c37  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c37, %hpstate
intveclr_40_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaa8ab0fc2c50f98d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e0aa  ! 122: STQF_I	-	%f20, [0x00aa, %r31]
	.word 0xa4c4b743  ! 123: ADDCcc_I	addccc 	%r18, 0xfffff743, %r18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_88) + 40, 16, 16)) -> intp(1,0,14)
#else
	setx 0x220265e2c2003450, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_40_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8c04e60  ! 125: LDSWA_R	ldswa	[%r1, %r0] 0x73, %r20
trapasi_40_90:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xe8c844a0  ! 126: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r20
	.word 0x95a509d0  ! 127: FDIVd	fdivd	%f20, %f16, %f10
intveclr_40_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x905b3541e783d15b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_40_93:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d84a00  ! 129: LDXA_R	ldxa	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fc2c0  ! 131: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e1d0  ! 133: LDQFA_I	-	[%r31, 0x01d0], %f8
dvapa_40_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x90d, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb4032  ! 134: PREFETCHA_R	prefetcha	[%r13, %r18] 0x01, #one_read
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 137: WRASI_I	wr	%r0, 0x001c, %asi
memptr_40_97:
	set 0x60340000, %r31
	.word 0x8581a1f6  ! 138: WRCCR_I	wr	%r6, 0x01f6, %ccr
splash_cmpr_40_98:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87ac8a2b  ! 140: FCMPs	fcmps	%fcc<n>, %f18, %f11
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e168  ! 142: LDSWA_I	ldswa	[%r31, + 0x0168] %asi, %r8
splash_tba_40_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_40_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_101:
	.word 0x8f902000  ! 144: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_102:
	rd %pc, %r12
	add %r12, (donretarg_40_102-donret_40_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x6000 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf4a, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	retry
donretarg_40_102:
	.word 0x24800001  ! 145: BLE	ble,a	<label_0x1>
iaw_40_103:
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
iaw_startwait40_103:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_103
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_103:
    brnz %r16, iaw_wait40_103
    ld [%r23], %r16
    ba iaw_startwait40_103
    mov 0x40, %r16
continue_iaw_40_103:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_103:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_103
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_103:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_103
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_103:
	mov 0x38, %r18
iaw4_40_103:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 146: CASA_R	casa	[%r31] %asi, %r20, %r8
	.word 0x91d02034  ! 147: Tcc_I	ta	icc_or_xcc, %r0 + 52
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
    brnz %r10, cwq_40_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_104
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
cwq_40_104:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 148: RDPC	rd	%pc, %r9
mondo_40_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d914010  ! 149: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0xc19fe1a0  ! 150: LDDFA_I	ldda	[%r31, 0x01a0], %f0
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
    brnz %r10, cwq_40_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_106
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
cwq_40_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 151: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_108) + 24, 16, 16)) -> intp(5,0,29)
#else
	setx 0x6ef837b9ec5e09c7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033ed  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x13ed, %pstate
dvapa_40_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0x94f, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91b44490  ! 155: FCMPLE32	fcmple32	%d48, %d16, %r8
	.word 0xd08008a0  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_40_112:
	set 0x60540000, %r31
	.word 0x8584fa1c  ! 158: WRCCR_I	wr	%r19, 0x1a1c, %ccr
	.word 0xa24d0012  ! 159: MULX_R	mulx 	%r20, %r18, %r17
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
    brnz %r10, sma_40_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 160: CASA_R	casa	[%r31] %asi, %r8, %r17
ibp_40_114:
	nop
	.word 0xa7a189c7  ! 161: FDIVd	fdivd	%f6, %f38, %f50
memptr_40_115:
	set 0x60740000, %r31
	.word 0x8582e699  ! 162: WRCCR_I	wr	%r11, 0x0699, %ccr
splash_tba_40_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x904d0010  ! 164: MULX_R	mulx 	%r20, %r16, %r8
	.word 0x93d02035  ! 165: Tcc_I	tne	icc_or_xcc, %r0 + 53
ibp_40_117:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec4025  ! 166: PREFETCHA_R	prefetcha	[%r17, %r5] 0x01, #one_read
brcommon2_40_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe150  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0150], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe000  ! 167: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xd027e189  ! 168: STW_I	stw	%r8, [%r31 + 0x0189]
ibp_40_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x997038d6  ! 169: POPC_I	popc	0x18d6, %r12
	.word 0xa9520000  ! 170: RDPR_PIL	rdpr	%pil, %r20
mondo_40_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94c011  ! 171: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x8d802004  ! 172: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe08fe0c8  ! 173: LDUBA_I	lduba	[%r31, + 0x00c8] %asi, %r16
	setx 0x837e61c552c2e108, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa4c16829  ! 175: ADDCcc_I	addccc 	%r5, 0x0829, %r18
ibp_40_122:
	nop
	.word 0xe1bfe0a0  ! 176: STDFA_I	stda	%f16, [0x00a0, %r31]
ibp_40_123:
	nop
	.word 0xc19fe000  ! 177: LDDFA_I	ldda	[%r31, 0x0000], %f0
ibp_40_124:
	nop
	.word 0xa7b287c2  ! 178: PDIST	pdistn	%d10, %d2, %d50
	.word 0xe897e160  ! 179: LDUHA_I	lduha	[%r31, + 0x0160] %asi, %r20
fpinit_40_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 180: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_40_127:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc3e0  ! 182: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_128) + 8, 16, 16)) -> intp(2,0,3)
#else
	setx 0x508eaee153d49400, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x13592f1344993101, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_40_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd5f, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe040  ! 185: LDDFA_I	ldda	[%r31, 0x0040], %f0
mondo_40_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d928006  ! 186: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_40_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92800c  ! 188: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
mondo_40_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 189: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
memptr_40_134:
	set 0x60140000, %r31
	.word 0x85837efb  ! 190: WRCCR_I	wr	%r13, 0x1efb, %ccr
splash_hpstate_40_135:
	.word 0x81983b07  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b07, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_40_136:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x819837c7  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17c7, %hpstate
splash_hpstate_40_137:
	ta T_CHANGE_NONHPRIV
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	.word 0x8198229b  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029b, %hpstate
	.word 0xc19fc3e0  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_40_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc69acc4f6964099c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_40_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d90c012  ! 199: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
splash_lsu_40_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x76ed3aaf, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_40_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_143:
	.word 0x8f902000  ! 201: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
mondo_20_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d93400b  ! 1: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
trapasi_20_1:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xd0c844a0  ! 2: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r8
splash_cmpr_20_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 3: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_20_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_3:
	.word 0x8f902001  ! 4: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_20_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 6: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa782c001  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r1, %-
	.word 0xd07fe1c0  ! 8: SWAP_I	swap	%r8, [%r31 + 0x01c0]
	.word 0x9190c00c  ! 9: WRPR_PIL_R	wrpr	%r3, %r12, %pil
brcommon3_20_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd0bfc033  ! 10: STDA_R	stda	%r8, [%r31 + %r19] 0x01
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_8:
	rd %pc, %r12
	add %r12, (donretarg_20_8-donret_20_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002c9d00 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x175f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	retry
donretarg_20_8:
	.word 0xd06fe10d  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x010d]
	.word 0xab844014  ! 12: WR_CLEAR_SOFTINT_R	wr	%r17, %r20, %clear_softint
dvapa_20_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc05, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd097c032  ! 13: LDUHA_R	lduha	[%r31, %r18] 0x01, %r8
	.word 0xa16cc013  ! 14: SDIVX_R	sdivx	%r19, %r19, %r16
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
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
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
	.word 0x97414000  ! 15: RDPC	rd	%pc, %r11
	.word 0xe4800c80  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
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
    brnz %r10, sma_20_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 17: CASA_R	casa	[%r31] %asi, %r11, %r18
brcommon1_20_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe120  ! 1: STXFSR_I	st-sfr	%f1, [0x0120, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1b04493  ! 18: FCMPLE32	fcmple32	%d32, %d50, %r16
	.word 0x8d903b13  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1b13, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_14) + 8, 16, 16)) -> intp(4,0,20)
#else
	setx 0x43ecbd852ac9bcef, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_20_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7808011  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r17, %-
intveclr_20_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb88a470f2d06922e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_20_18:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d04980  ! 24: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_20_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd0fed285229a538d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8afe3cee83ea1e98, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_20_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe110  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x0110]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd49fe1f0  ! 30: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r10
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
    brnz %r10, cwq_20_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_23
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
cwq_20_23:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 31: RDPC	rd	%pc, %r13
	.word 0x8799e3f8  ! 32: WRHPR_HINTP_I	wrhpr	%r7, 0x03f8, %hintp
	.word 0xd497e038  ! 33: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r10
	.word 0xd497c02c  ! 34: LDUHA_R	lduha	[%r31, %r12] 0x01, %r10
splash_lsu_20_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x8340b3d6, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa784000d  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r13, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_27:
	rd %pc, %r12
	add %r12, (donretarg_20_27-donret_20_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00140a00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfd7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	done
donretarg_20_27:
	.word 0x2a800001  ! 37: BCS	bcs,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_28) + 24, 16, 16)) -> intp(6,0,8)
#else
	setx 0x0cc941411927058a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91944011  ! 39: WRPR_PIL_R	wrpr	%r17, %r17, %pil
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
    brnz %r10, sma_20_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e011  ! 40: CASA_R	casa	[%r31] %asi, %r17, %r10
	.word 0xd497e110  ! 41: LDUHA_I	lduha	[%r31, + 0x0110] %asi, %r10
	.word 0x8d802000  ! 42: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_20_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe0388dd9a4b48192, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7848012  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_20_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82af6  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0x0af6] %asi, #one_read
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_20_36:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x81982e1b  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1b, %hpstate
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
    brnz %r10, cwq_20_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_37
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
cwq_20_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 49: RDPC	rd	%pc, %r19
splash_hpstate_20_38:
	ta T_CHANGE_NONHPRIV
	.word 0x819830d7  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x10d7, %hpstate
	brlz,a,pn	%r16, skip_20_39
	.word 0x87ac8a4c  ! 1: FCMPd	fcmpd	%fcc<n>, %f18, %f12
.align 2048
skip_20_39:
	.word 0xe43fc000  ! 51: STD_R	std	%r18, [%r31 + %r0]
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_20_40:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 53: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x5a3e4b4e47097c47, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_20_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4d04e60  ! 55: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r18
memptr_20_43:
	set 0x60140000, %r31
	.word 0x8581615b  ! 56: WRCCR_I	wr	%r5, 0x015b, %ccr
memptr_20_44:
	set 0x60740000, %r31
	.word 0x8584fbe3  ! 57: WRCCR_I	wr	%r19, 0x1be3, %ccr
	.word 0x95a18d29  ! 58: FsMULd	fsmuld	%f6, %f40, %f10
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_45:
	rd %pc, %r12
	add %r12, (donretarg_20_45-donret_20_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0065fd00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16d4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_45:
	.word 0xd4ffe1a0  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x01a0] %asi
	.word 0x95702c8b  ! 60: POPC_I	popc	0x0c8b, %r10
splash_tba_20_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_20_48:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1a289d2  ! 62: FDIVd	fdivd	%f10, %f18, %f16
	.word 0x95450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe070  ! 65: LDDF_I	ldd	[%r31, 0x0070], %f11
memptr_20_49:
	set 0x60740000, %r31
	.word 0x85846b79  ! 66: WRCCR_I	wr	%r17, 0x0b79, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
	.word 0x97703bda  ! 68: POPC_I	popc	0x1bda, %r11
	.word 0xdb1fe028  ! 69: LDDF_I	ldd	[%r31, 0x0028], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_20_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc87, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac0a53  ! 71: FCMPd	fcmpd	%fcc<n>, %f16, %f50
splash_cmpr_20_52:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 72: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_20_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x191c13d8bc0af6f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_20_54:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 75: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_56) + 8, 16, 16)) -> intp(4,0,6)
#else
	setx 0xbbcf192329cec6b8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_20_58:
	nop
	ta T_CHANGE_HPRIV
	set 0xa206dbec, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_20_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8780208b  ! 80: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xd45fe0d0  ! 81: LDX_I	ldx	[%r31 + 0x00d0], %r10
br_badelay1_20_60:
	.word 0xd43fc008  ! 1: STD_R	std	%r10, [%r31 + %r8]
	.word 0xe730c012  ! 1: STQF_R	-	%f19, [%r18, %r3]
	.word 0xa9b7c4d3  ! 1: FCMPNE32	fcmpne32	%d62, %d50, %r20
	normalw
	.word 0xa7458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r19
mondo_20_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d948007  ! 83: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_20_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_62
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
cwq_20_62:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 85: RDPC	rd	%pc, %r13
pmu_20_63:
	nop
	setx 0xfffffe66fffff6ad, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_20_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_20_65:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 88: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_20_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xad0129f5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_20_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_67
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
cwq_20_67:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 91: RDPC	rd	%pc, %r11
	.word 0xd827e041  ! 92: STW_I	stw	%r12, [%r31 + 0x0041]
splash_tba_20_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x81cedefee082d2c7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802000  ! 96: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd9e7e009  ! 97: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_20_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_20_72:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 100: RDTICK	rd	%tick, %r12
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902e6d  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x0e6d, %pstate
intveclr_20_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x27c53966f2b2febb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_20_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 103: FDIVs	fdivs	%f0, %f4, %f6
jmptr_20_76:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_77:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_20_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 106: CASA_R	casa	[%r31] %asi, %r20, %r20
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
    brnz %r10, sma_20_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 107: CASA_R	casa	[%r31] %asi, %r13, %r20
splash_cmpr_20_80:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 108: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_20_81:
	nop
	.word 0xc1bfc3e0  ! 109: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87ac0ad4  ! 111: FCMPEd	fcmped	%fcc<n>, %f16, %f20
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
    brnz %r10, cwq_20_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_82
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
cwq_20_82:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 112: RDPC	rd	%pc, %r13
cwp_20_83:
    set user_data_start, %o7
	.word 0x93902004  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa6dc800c  ! 114: SMULcc_R	smulcc 	%r18, %r12, %r19
	.word 0x8d802004  ! 115: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_20_84:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c044a0  ! 116: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r18
	.word 0x8d802004  ! 117: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_20_85:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 118: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
	.word 0x9153c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_20_86:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81983517  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1517, %hpstate
intveclr_20_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0xad5b10ca50279aae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e01c  ! 122: STQF_I	-	%f20, [0x001c, %r31]
	.word 0xa4c5244c  ! 123: ADDCcc_I	addccc 	%r20, 0x044c, %r18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_88) + 0, 16, 16)) -> intp(3,0,8)
#else
	setx 0x1c091018cbb37d71, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_20_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8c84e60  ! 125: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r20
trapasi_20_90:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe8c844a0  ! 126: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r20
	fbug skip_20_91
	.word 0xc36c7328  ! 1: PREFETCH_I	prefetch	[%r17 + 0xfffff328], #one_read
.align 512
skip_20_91:
	.word 0x9f8039ac  ! 127: SIR	sir	0x19ac
intveclr_20_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8c8cad755fada476, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_20_93:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d04a00  ! 129: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe19fc2c0  ! 131: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e150  ! 133: LDQFA_I	-	[%r31, 0x0150], %f8
dvapa_20_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x973, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87aa0a54  ! 134: FCMPd	fcmpd	%fcc<n>, %f8, %f20
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 137: WRASI_I	wr	%r0, 0x0088, %asi
memptr_20_97:
	set 0x60740000, %r31
	.word 0x8580e0fe  ! 138: WRCCR_I	wr	%r3, 0x00fe, %ccr
splash_cmpr_20_98:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87ad0a33  ! 140: FCMPs	fcmps	%fcc<n>, %f20, %f19
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e1f0  ! 142: LDSWA_I	ldswa	[%r31, + 0x01f0] %asi, %r8
splash_tba_20_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_20_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_101:
	.word 0x8f902000  ! 144: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_102:
	rd %pc, %r12
	add %r12, (donretarg_20_102-donret_20_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008df400 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c06, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_102:
	.word 0x36800001  ! 145: BGE	bge,a	<label_0x1>
	.word 0xd09fc034  ! 146: LDDA_R	ldda	[%r31, %r20] 0x01, %r8
	.word 0x93d020b4  ! 147: Tcc_I	tne	icc_or_xcc, %r0 + 180
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
    brnz %r10, cwq_20_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_104
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
cwq_20_104:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 148: RDPC	rd	%pc, %r17
mondo_20_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d920014  ! 149: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0xc19fe1a0  ! 150: LDDFA_I	ldda	[%r31, 0x01a0], %f0
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
    brnz %r10, cwq_20_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_106
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
cwq_20_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 151: RDPC	rd	%pc, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_108) + 48, 16, 16)) -> intp(7,0,18)
#else
	setx 0xb37e8ac57c781a7f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e62  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1e62, %pstate
dvapa_20_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbb6, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5b187c8  ! 155: PDIST	pdistn	%d6, %d8, %d18
	.word 0xd08008a0  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_20_112:
	set 0x60140000, %r31
	.word 0x858239d1  ! 158: WRCCR_I	wr	%r8, 0x19d1, %ccr
	.word 0xa64cc011  ! 159: MULX_R	mulx 	%r19, %r17, %r19
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
    brnz %r10, sma_20_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 160: CASA_R	casa	[%r31] %asi, %r20, %r17
ibp_20_114:
	nop
	.word 0xa3b4c7ca  ! 161: PDIST	pdistn	%d50, %d10, %d48
memptr_20_115:
	set 0x60740000, %r31
	.word 0x85852e4d  ! 162: WRCCR_I	wr	%r20, 0x0e4d, %ccr
splash_tba_20_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa04d0009  ! 164: MULX_R	mulx 	%r20, %r9, %r16
	.word 0x91d020b2  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 178
ibp_20_117:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x95b1c7c3  ! 166: PDIST	pdistn	%d38, %d34, %d10
brcommon2_20_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa3a0c9d3  ! 1: FDIVd	fdivd	%f34, %f50, %f48
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdf20  ! 167: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd027e00c  ! 168: STW_I	stw	%r8, [%r31 + 0x000c]
ibp_20_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5b10494  ! 169: FCMPLE32	fcmple32	%d4, %d20, %r18
	.word 0xa5520000  ! 170: RDPR_PIL	<illegal instruction>
mondo_20_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d91c003  ! 171: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
	.word 0x8d802004  ! 172: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe08fe0e8  ! 173: LDUBA_I	lduba	[%r31, + 0x00e8] %asi, %r16
	setx 0x838184cb49d2d9a9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa8c467f6  ! 175: ADDCcc_I	addccc 	%r17, 0x07f6, %r20
ibp_20_122:
	nop
	.word 0xe1bfda00  ! 176: STDFA_R	stda	%f16, [%r0, %r31]
ibp_20_123:
	nop
	.word 0xe19fdf20  ! 177: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_20_124:
	nop
	.word 0xa1b4c492  ! 178: FCMPLE32	fcmple32	%d50, %d18, %r16
	.word 0xe897e0d8  ! 179: LDUHA_I	lduha	[%r31, + 0x00d8] %asi, %r20
fpinit_20_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8234d  ! 180: PREFETCHA_I	prefetcha	[%r0, + 0x034d] %asi, #one_read
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_20_127:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1e0  ! 182: STDFA_I	stda	%f16, [0x01e0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_128) + 8, 16, 16)) -> intp(2,0,28)
#else
	setx 0x469c3958fb297135, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x65ebb5b1d57c57c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_20_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd43, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 185: STDFA_R	stda	%f16, [%r0, %r31]
mondo_20_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d924014  ! 186: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_20_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94000a  ! 188: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
mondo_20_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 189: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
memptr_20_134:
	set 0x60740000, %r31
	.word 0x85812e98  ! 190: WRCCR_I	wr	%r4, 0x0e98, %ccr
splash_hpstate_20_135:
	.word 0x81982197  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0197, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_20_136:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x81983cd3  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd3, %hpstate
splash_hpstate_20_137:
	ta T_CHANGE_NONHPRIV
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x819826cd  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cd, %hpstate
	.word 0xe19fdf20  ! 195: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_20_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xba32bbf6c6a5de02, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_20_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d904010  ! 199: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
splash_lsu_20_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xe35abed7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_20_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_143:
	.word 0x8f902000  ! 201: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
mondo_10_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d948009  ! 1: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
trapasi_10_1:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xd09044a0  ! 2: LDUHA_R	lduha	[%r1, %r0] 0x25, %r8
splash_cmpr_10_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 3: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_10_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_10_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 6: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_decr_10_5:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa784c002  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r2, %-
	.word 0xd07fe110  ! 8: SWAP_I	swap	%r8, [%r31 + 0x0110]
	.word 0x91940012  ! 9: WRPR_PIL_R	wrpr	%r16, %r18, %pil
brcommon3_10_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd09fe0d0  ! 10: LDDA_I	ldda	[%r31, + 0x00d0] %asi, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_8:
	rd %pc, %r12
	add %r12, (donretarg_10_8-donret_10_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0008ff00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1656, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	retry
donretarg_10_8:
	.word 0xd06fe197  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x0197]
	.word 0xab850011  ! 12: WR_CLEAR_SOFTINT_R	wr	%r20, %r17, %clear_softint
dvapa_10_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa2d, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc029  ! 13: LDXA_R	ldxa	[%r31, %r9] 0x01, %r8
	.word 0x93698003  ! 14: SDIVX_R	sdivx	%r6, %r3, %r9
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
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
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
	.word 0x99414000  ! 15: RDPC	rd	%pc, %r12
	.word 0xe48008a0  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_10_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 17: CASA_R	casa	[%r31] %asi, %r8, %r18
brcommon1_10_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe110  ! 1: STXFSR_I	st-sfr	%f1, [0x0110, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a4c9a4  ! 18: FDIVs	fdivs	%f19, %f4, %f19
	.word 0x8d903423  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1423, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_14) + 32, 16, 16)) -> intp(3,0,29)
#else
	setx 0xb51fbd144ea5b6dc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_10_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_10_16:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa784c012  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
intveclr_10_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0x876746f5f5fe173d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_10_18:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d84980  ! 24: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_10_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf8e55f906a2f689b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x186c4077fc5a0c23, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_10_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe1c0  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x01c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd5e7e00a  ! 30: CASA_R	casa	[%r31] %asi, %r10, %r10
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
    brnz %r10, cwq_10_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_23
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
cwq_10_23:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 31: RDPC	rd	%pc, %r8
	.word 0x879cb7d8  ! 32: WRHPR_HINTP_I	wrhpr	%r18, 0x17d8, %hintp
	.word 0xd497e030  ! 33: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0xd4bfc032  ! 34: STDA_R	stda	%r10, [%r31 + %r18] 0x01
splash_lsu_10_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x999e764d, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_decr_10_26:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7850013  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r19, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_27:
	rd %pc, %r12
	add %r12, (donretarg_10_27-donret_10_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00363f00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe03, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_27:
	.word 0x2e800001  ! 37: BVS	bvs,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_28) + 0, 16, 16)) -> intp(2,0,25)
#else
	setx 0x9b4e334f8233e9a9, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91928001  ! 39: WRPR_PIL_R	wrpr	%r10, %r1, %pil
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
    brnz %r10, sma_10_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e011  ! 40: CASA_R	casa	[%r31] %asi, %r17, %r10
	.word 0xd497e1d8  ! 41: LDUHA_I	lduha	[%r31, + 0x01d8] %asi, %r10
	.word 0x8d802000  ! 42: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_10_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4c84d31fdd5c2d63, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_10_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa784c012  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_10_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 46: FCMPd	fcmpd	%fcc<n>, %f0, %f4
invtsb_10_35:
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
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_10_36:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982c4d  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4d, %hpstate
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
    brnz %r10, cwq_10_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_37
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
cwq_10_37:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 49: RDPC	rd	%pc, %r9
splash_hpstate_10_38:
	ta T_CHANGE_NONHPRIV
	.word 0x81983ede  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ede, %hpstate
	fbule skip_10_39
	brlez,pt  	%r17, skip_10_39
.align 2048
skip_10_39:
	.word 0xc30fc000  ! 51: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_10_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 53: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x7631a3a80239bbcd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_10_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4c04e60  ! 55: LDSWA_R	ldswa	[%r1, %r0] 0x73, %r18
memptr_10_43:
	set 0x60540000, %r31
	.word 0x8582ef41  ! 56: WRCCR_I	wr	%r11, 0x0f41, %ccr
memptr_10_44:
	set 0x60740000, %r31
	.word 0x85837abe  ! 57: WRCCR_I	wr	%r13, 0x1abe, %ccr
	.word 0x95a50d26  ! 58: FsMULd	fsmuld	%f20, %f6, %f10
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_45:
	rd %pc, %r12
	add %r12, (donretarg_10_45-donret_10_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00466200 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_45:
	.word 0xd4ffe088  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x0088] %asi
	.word 0x97b147c2  ! 60: PDIST	pdistn	%d36, %d2, %d42
splash_tba_10_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_10_48:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99b507d4  ! 62: PDIST	pdistn	%d20, %d20, %d12
	.word 0xa1450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r16
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe1b0  ! 65: LDDF_I	ldd	[%r31, 0x01b0], %f11
memptr_10_49:
	set 0x60140000, %r31
	.word 0x8584fefa  ! 66: WRCCR_I	wr	%r19, 0x1efa, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
	.word 0xa7b407c9  ! 68: PDIST	pdistn	%d16, %d40, %d50
	.word 0xdb1fe110  ! 69: LDDF_I	ldd	[%r31, 0x0110], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_10_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcb3, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa9b447d0  ! 71: PDIST	pdistn	%d48, %d16, %d20
splash_cmpr_10_52:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 72: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_10_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdb225f78ed175b30, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_10_54:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 75: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_56) + 24, 16, 16)) -> intp(0,0,20)
#else
	setx 0xd6dbecae64da1f3d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_10_58:
	nop
	ta T_CHANGE_HPRIV
	set 0xbc8bd185, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_10_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802080  ! 80: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd45fe1e8  ! 81: LDX_I	ldx	[%r31 + 0x01e8], %r10
br_badelay1_10_60:
	.word 0xc36fe080  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0080], #one_read
	.word 0xe1348011  ! 1: STQF_R	-	%f16, [%r17, %r18]
	.word 0xc36fe110  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0110], #one_read
	normalw
	.word 0x99458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r12
mondo_10_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90c001  ! 83: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_10_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_62
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
cwq_10_62:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 85: RDPC	rd	%pc, %r19
pmu_10_63:
	nop
	setx 0xfffff765fffff25d, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_10_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_10_65:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 88: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_10_66:
	nop
	ta T_CHANGE_HPRIV
	set 0x462e8799, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_10_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_67
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
cwq_10_67:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 91: RDPC	rd	%pc, %r13
	.word 0xd827e094  ! 92: STW_I	stw	%r12, [%r31 + 0x0094]
splash_tba_10_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xdeb18d481db1121a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802004  ! 96: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd8bfc032  ! 97: STDA_R	stda	%r12, [%r31 + %r18] 0x01
splash_cmpr_10_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_10_72:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 100: RDTICK	rd	%tick, %r16
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90380c  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x180c, %pstate
intveclr_10_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf86358d97cf2f97e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_10_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 103: FDIVs	fdivs	%f0, %f4, %f8
jmptr_10_76:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_77:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_10_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 106: CASA_R	casa	[%r31] %asi, %r13, %r20
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
    brnz %r10, sma_10_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 107: CASA_R	casa	[%r31] %asi, %r13, %r20
splash_cmpr_10_80:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 108: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_10_81:
	nop
	.word 0xe1bfc3e0  ! 109: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe8800c20  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r20
	.word 0x87aa0ad2  ! 111: FCMPEd	fcmped	%fcc<n>, %f8, %f18
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
    brnz %r10, cwq_10_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_82
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
cwq_10_82:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 112: RDPC	rd	%pc, %r8
cwp_10_83:
    set user_data_start, %o7
	.word 0x93902005  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9adb0010  ! 114: SMULcc_R	smulcc 	%r12, %r16, %r13
	.word 0x8d802000  ! 115: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_10_84:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c844a0  ! 116: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r18
	.word 0x8d802004  ! 117: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_10_85:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c844a0  ! 118: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r18
	.word 0xa753c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_10_86:
	.word 0x2ec90001  ! 1: BRGEZ	brgez,a,pt	%r4,<label_0x90001>
	.word 0x81983ddd  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ddd, %hpstate
intveclr_10_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0x194e9ae2dbbf6817, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e19c  ! 122: STQF_I	-	%f20, [0x019c, %r31]
	.word 0x9ac0621d  ! 123: ADDCcc_I	addccc 	%r1, 0x021d, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_88) + 24, 16, 16)) -> intp(4,0,6)
#else
	setx 0x041c71904cee2c82, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_10_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8884e60  ! 125: LDUBA_R	lduba	[%r1, %r0] 0x73, %r20
trapasi_10_90:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe8c844a0  ! 126: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r20
	brlez,pn  	%r13, skip_10_91
	.word 0xa5a509c1  ! 1: FDIVd	fdivd	%f20, %f32, %f18
.align 512
skip_10_91:
	.word 0x87a9ca52  ! 127: FCMPd	fcmpd	%fcc<n>, %f38, %f18
intveclr_10_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x59e4a1092662fc0f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_10_93:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd0884a00  ! 129: LDUBA_R	lduba	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fd920  ! 131: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e1c0  ! 133: LDQFA_I	-	[%r31, 0x01c0], %f8
dvapa_10_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd2d, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87aa8a46  ! 134: FCMPd	fcmpd	%fcc<n>, %f10, %f6
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802082  ! 137: WRASI_I	wr	%r0, 0x0082, %asi
memptr_10_97:
	set 0x60740000, %r31
	.word 0x858429da  ! 138: WRCCR_I	wr	%r16, 0x09da, %ccr
splash_cmpr_10_98:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87ac8a34  ! 140: FCMPs	fcmps	%fcc<n>, %f18, %f20
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e1d0  ! 142: LDSWA_I	ldswa	[%r31, + 0x01d0] %asi, %r8
splash_tba_10_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_10_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_101:
	.word 0x8f902002  ! 144: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_102:
	rd %pc, %r12
	add %r12, (donretarg_10_102-donret_10_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004ca300 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c83, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x26cc8001  ! 1: BRLZ	brlz,a,pt	%r18,<label_0xc8001>
	retry
donretarg_10_102:
	.word 0x24cc0001  ! 145: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xd13fc008  ! 146: STDF_R	std	%f8, [%r8, %r31]
	.word 0x91d020b2  ! 147: Tcc_I	ta	icc_or_xcc, %r0 + 178
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
    brnz %r10, cwq_10_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_104
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
cwq_10_104:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 148: RDPC	rd	%pc, %r12
mondo_10_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 149: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0xe19fe000  ! 150: LDDFA_I	ldda	[%r31, 0x0000], %f16
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
    brnz %r10, cwq_10_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_106
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
cwq_10_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 151: RDPC	rd	%pc, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_108) + 56, 16, 16)) -> intp(7,0,13)
#else
	setx 0xc86c75b8bab69b14, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902845  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0845, %pstate
dvapa_10_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaa2, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b307cb  ! 155: PDIST	pdistn	%d12, %d42, %d16
	.word 0xd0800b00  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_10_112:
	set 0x60340000, %r31
	.word 0x858473e6  ! 158: WRCCR_I	wr	%r17, 0x13e6, %ccr
	.word 0x904c0011  ! 159: MULX_R	mulx 	%r16, %r17, %r8
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
    brnz %r10, sma_10_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 160: CASA_R	casa	[%r31] %asi, %r19, %r17
ibp_10_114:
	nop
	.word 0x97b407d3  ! 161: PDIST	pdistn	%d16, %d50, %d42
memptr_10_115:
	set 0x60340000, %r31
	.word 0x858537ee  ! 162: WRCCR_I	wr	%r20, 0x17ee, %ccr
splash_tba_10_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa04d0002  ! 164: MULX_R	mulx 	%r20, %r2, %r16
	.word 0x83d020b2  ! 165: Tcc_I	te	icc_or_xcc, %r0 + 178
ibp_10_117:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x997022e4  ! 166: POPC_I	popc	0x02e4, %r12
brcommon2_10_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe1d0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x01d0], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfdf20  ! 167: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd027e0e4  ! 168: STW_I	stw	%r8, [%r31 + 0x00e4]
ibp_10_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x91b207d2  ! 169: PDIST	pdistn	%d8, %d18, %d8
	.word 0xa9520000  ! 170: RDPR_PIL	<illegal instruction>
mondo_10_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d920011  ! 171: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0x8d802000  ! 172: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe08fe120  ! 173: LDUBA_I	lduba	[%r31, + 0x0120] %asi, %r16
	setx 0x2a3b67a9bed1f95a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6c4acf5  ! 175: ADDCcc_I	addccc 	%r18, 0x0cf5, %r19
ibp_10_122:
	nop
	.word 0xc19fc2c0  ! 176: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_10_123:
	nop
	.word 0xc1bfe1a0  ! 177: STDFA_I	stda	%f0, [0x01a0, %r31]
ibp_10_124:
	nop
	.word 0x93a249ad  ! 178: FDIVs	fdivs	%f9, %f13, %f9
	.word 0xe897e198  ! 179: LDUHA_I	lduha	[%r31, + 0x0198] %asi, %r20
fpinit_10_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 180: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_10_127:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe0a0  ! 182: LDDFA_I	ldda	[%r31, 0x00a0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_128) + 8, 16, 16)) -> intp(2,0,17)
#else
	setx 0x73c2a68dee3df29b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x565487b04a090099, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_10_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb4d, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 185: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_10_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d950011  ! 186: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_10_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 188: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
mondo_10_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d930006  ! 189: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
memptr_10_134:
	set 0x60540000, %r31
	.word 0x8584ab26  ! 190: WRCCR_I	wr	%r18, 0x0b26, %ccr
splash_hpstate_10_135:
	.word 0x8198265d  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065d, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_10_136:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81983687  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1687, %hpstate
splash_hpstate_10_137:
	ta T_CHANGE_NONHPRIV
	.word 0x26ccc001  ! 1: BRLZ	brlz,a,pt	%r19,<label_0xcc001>
	.word 0x8198369f  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x169f, %hpstate
	.word 0xc19fc3e0  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_10_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd1460ccee7748824, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_10_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d950002  ! 199: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
splash_lsu_10_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x9b552d31, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_10_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_143:
	.word 0x8f902000  ! 201: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_8:
    setx 0x4c86dd6f862720e2, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
setup_spu_8:
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

unlock_sync_thds_8:
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
mondo_8_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d940007  ! 1: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
trapasi_8_1:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 2: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
splash_cmpr_8_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 3: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_8_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_8_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 6: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa7808011  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r17, %-
	.word 0xd07fe0a0  ! 8: SWAP_I	swap	%r8, [%r31 + 0x00a0]
cmp_8_6:
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
    xor %r9, 0x8, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x8, %r9         ! My core mask
#endif
    mov 0x8, %r10
cmp_startwait8_6:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_6
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_6:
    brnz,a %r10, cmp_wait8_6
    ld [%r23], %r10
    ba cmp_startwait8_6
    mov 0x8, %r10
continue_cmp_8_6:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_6
    mov 0x91, %r17
    best_set_reg(0xd7a94bdd9442d9de, %r16, %r17)
cmp_multi_core_8_6:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940001  ! 9: WRPR_PIL_R	wrpr	%r16, %r1, %pil
brcommon3_8_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c034  ! 1: CASA_I	casa	[%r31] 0x 1, %r20, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fe130  ! 10: LDDF_I	ldd	[%r31, 0x0130], %f8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_8:
	rd %pc, %r12
	add %r12, (donretarg_8_8-donret_8_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aad200 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1715, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_8:
	.word 0xd06fe052  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x0052]
	.word 0xab84400b  ! 12: WR_CLEAR_SOFTINT_R	wr	%r17, %r11, %clear_softint
dvapa_8_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbed, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd11fc010  ! 13: LDDF_R	ldd	[%r31, %r16], %f8
	.word 0x976cc001  ! 14: SDIVX_R	sdivx	%r19, %r1, %r11
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
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
	.word 0xa7414000  ! 15: RDPC	rd	%pc, %r19
	.word 0xe48008a0  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_8_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 17: CASA_R	casa	[%r31] %asi, %r20, %r18
brcommon1_8_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe080  ! 1: STXFSR_I	st-sfr	%f1, [0x0080, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99a409b3  ! 18: FDIVs	fdivs	%f16, %f19, %f12
	.word 0x8d903245  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1245, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_14) + 56, 16, 16)) -> intp(6,0,22)
#else
	setx 0x2fb23786899a5187, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_8_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7840002  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r2, %-
intveclr_8_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9cf14fff4193a079, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_8_18:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4904980  ! 24: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_8_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xae3130f017b8e059, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3bbf97facf9f37f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_8_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe0a0  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x00a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc00c  ! 30: STXFSR_R	st-sfr	%f1, [%r12, %r31]
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
    brnz %r10, cwq_8_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_23
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
cwq_8_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 31: RDPC	rd	%pc, %r20
	.word 0x87992213  ! 32: WRHPR_HINTP_I	wrhpr	%r4, 0x0213, %hintp
	.word 0xd497e1d0  ! 33: LDUHA_I	lduha	[%r31, + 0x01d0] %asi, %r10
	.word 0xd497c028  ! 34: LDUHA_R	lduha	[%r31, %r8] 0x01, %r10
splash_lsu_8_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xc768e570, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7814012  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r18, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_27:
	rd %pc, %r12
	add %r12, (donretarg_8_27-donret_8_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009c0e00 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x206, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_27:
	.word 0x30800001  ! 37: BA	ba,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_28) + 56, 16, 16)) -> intp(2,0,27)
#else
	setx 0xf27266e7df779f87, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_8_29:
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
    xor %r9, 0x8, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x8, %r9         ! My core mask
#endif
    mov 0x8, %r10
cmp_startwait8_29:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_29
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_29:
    brnz,a %r10, cmp_wait8_29
    ld [%r23], %r10
    ba cmp_startwait8_29
    mov 0x8, %r10
continue_cmp_8_29:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_29
    mov 0xb7, %r17
    best_set_reg(0xf7cf6a154f71efd2, %r16, %r17)
cmp_multi_core_8_29:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908003  ! 39: WRPR_PIL_R	wrpr	%r2, %r3, %pil
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
    brnz %r10, sma_8_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 40: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0xd497e0d8  ! 41: LDUHA_I	lduha	[%r31, + 0x00d8] %asi, %r10
	.word 0x8d802000  ! 42: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_8_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2361367764b040a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa780c012  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r18, %-
cerer_8_33:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x6de2db0f7cc8a650, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_8_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82af6  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0x0af6] %asi, #one_read
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_8_36:
	.word 0x22cc8001  ! 1: BRZ	brz,a,pt	%r18,<label_0xc8001>
	.word 0x81983ce6  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ce6, %hpstate
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
    brnz %r10, cwq_8_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_37
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
cwq_8_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 49: RDPC	rd	%pc, %r19
splash_hpstate_8_38:
	ta T_CHANGE_NONHPRIV
	.word 0x81983595  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1595, %hpstate
	.word 0xc32fc000  ! 51: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 52: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_8_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 53: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0xdfe431d6382ef44f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_8_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4d04e60  ! 55: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r18
memptr_8_43:
	set 0x60340000, %r31
	.word 0x858170b2  ! 56: WRCCR_I	wr	%r5, 0x10b2, %ccr
memptr_8_44:
	set 0x60340000, %r31
	.word 0x8582a306  ! 57: WRCCR_I	wr	%r10, 0x0306, %ccr
	.word 0x97a4cd33  ! 58: FsMULd	fsmuld	%f19, %f50, %f42
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_45:
	rd %pc, %r12
	add %r12, (donretarg_8_45-donret_8_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b34100 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1056, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_45:
	.word 0xd4ffe1d5  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x01d5] %asi
	.word 0x95a0c9a7  ! 60: FDIVs	fdivs	%f3, %f7, %f10
splash_tba_8_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_8_48:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9ba509a4  ! 62: FDIVs	fdivs	%f20, %f4, %f13
	.word 0x97450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe0c0  ! 65: LDDF_I	ldd	[%r31, 0x00c0], %f11
memptr_8_49:
	set 0x60340000, %r31
	.word 0x8584b3e7  ! 66: WRCCR_I	wr	%r18, 0x13e7, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
	.word 0xa3a089d0  ! 68: FDIVd	fdivd	%f2, %f16, %f48
	.word 0xdb1fe170  ! 69: LDDF_I	ldd	[%r31, 0x0170], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_8_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb27, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x977031a8  ! 71: POPC_I	popc	0x11a8, %r11
splash_cmpr_8_52:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 72: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_8_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0e9e47bc5914f12e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_8_54:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950003  ! 75: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_56) + 40, 16, 16)) -> intp(0,0,5)
#else
	setx 0x6dc7051a0fc396d7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tick_8_57:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x51f6dfee87596c5a, %r16, %r17)
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_8_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x8b6d3a42, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_8_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x8780208b  ! 80: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xd45fe060  ! 81: LDX_I	ldx	[%r31 + 0x0060], %r10
br_badelay1_8_60:
	.word 0xc36fe0b0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x00b0], #one_read
	.word 0xe3334012  ! 1: STQF_R	-	%f17, [%r18, %r13]
	.word 0xa9a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f20
	normalw
	.word 0x91458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r8
mondo_8_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d918013  ! 83: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_8_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_62
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
cwq_8_62:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 85: RDPC	rd	%pc, %r19
pmu_8_63:
	nop
	setx 0xfffff1d9fffffe37, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_8_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_8_65:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 88: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_8_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xe5784d0b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_8_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_67
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
cwq_8_67:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 91: RDPC	rd	%pc, %r17
	.word 0xd827e020  ! 92: STW_I	stw	%r12, [%r31 + 0x0020]
splash_tba_8_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x12c02065f94310d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802004  ! 96: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd91fc009  ! 97: LDDF_R	ldd	[%r31, %r9], %f12
splash_cmpr_8_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_8_72:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x91410000  ! 100: RDTICK	rd	%tick, %r8
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d902afb  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x0afb, %pstate
intveclr_8_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc3aaadb71dd01104, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_8_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 103: FCMPLE32	fcmple32	%d0, %d4, %r4
jmptr_8_76:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_77:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_8_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 106: CASA_R	casa	[%r31] %asi, %r12, %r20
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
    brnz %r10, sma_8_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r20
splash_cmpr_8_80:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 108: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_8_81:
	nop
	.word 0xc19fda00  ! 109: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87ab4ac3  ! 111: FCMPEd	fcmped	%fcc<n>, %f44, %f34
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
    brnz %r10, cwq_8_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_82
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
cwq_8_82:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 112: RDPC	rd	%pc, %r8
cwp_8_83:
    set user_data_start, %o7
	.word 0x93902006  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9add0013  ! 114: SMULcc_R	smulcc 	%r20, %r19, %r13
	.word 0x8d802000  ! 115: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_8_84:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c044a0  ! 116: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r18
	.word 0x8d802004  ! 117: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_8_85:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4d844a0  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x25, %r18
	.word 0xa753c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_8_86:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982e27  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e27, %hpstate
intveclr_8_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaee0c7ecebb31252, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e08e  ! 122: STQF_I	-	%f20, [0x008e, %r31]
	.word 0x96c0ac30  ! 123: ADDCcc_I	addccc 	%r2, 0x0c30, %r11
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_88) + 48, 16, 16)) -> intp(3,0,7)
#else
	setx 0x1bcb2fc383e5a8e6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_8_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8904e60  ! 125: LDUHA_R	lduha	[%r1, %r0] 0x73, %r20
trapasi_8_90:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe8c844a0  ! 126: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r20
	.word 0x9f802e3b  ! 127: SIR	sir	0x0e3b
intveclr_8_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc3cdfcebb261f1d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_8_93:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d84a00  ! 129: LDXA_R	ldxa	[%r1, %r0] 0x50, %r8
splash_tick_8_94:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x454a5339d00033b1, %r16, %r17)
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fd920  ! 131: LDDFA_R	ldda	[%r31, %r0], %f0
splash_tick_8_95:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xc8d63bb8fd88b816, %r16, %r17)
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e1d8  ! 133: LDQFA_I	-	[%r31, 0x01d8], %f8
dvapa_8_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd17, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a98a48  ! 134: FCMPd	fcmpd	%fcc<n>, %f6, %f8
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 136: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 137: WRASI_I	wr	%r0, 0x0014, %asi
memptr_8_97:
	set 0x60740000, %r31
	.word 0x85846869  ! 138: WRCCR_I	wr	%r17, 0x0869, %ccr
splash_cmpr_8_98:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87a98a30  ! 140: FCMPs	fcmps	%fcc<n>, %f6, %f16
splash_tick_8_99:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xaacc6ba37ae1e59e, %r16, %r17)
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e020  ! 142: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
splash_tba_8_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_8_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_101:
	.word 0x8f902000  ! 144: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_102:
	rd %pc, %r12
	add %r12, (donretarg_8_102-donret_8_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ae8b00 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a0e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_102:
	.word 0x24cc0001  ! 145: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xd13fc012  ! 146: STDF_R	std	%f8, [%r18, %r31]
	.word 0x93d02032  ! 147: Tcc_I	tne	icc_or_xcc, %r0 + 50
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
    brnz %r10, cwq_8_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_104
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
cwq_8_104:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 148: RDPC	rd	%pc, %r13
mondo_8_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d940003  ! 149: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0xe19fe1c0  ! 150: LDDFA_I	ldda	[%r31, 0x01c0], %f16
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
    brnz %r10, cwq_8_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_106
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
cwq_8_106:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 151: RDPC	rd	%pc, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_108) + 56, 16, 16)) -> intp(2,0,12)
#else
	setx 0x927848728860a302, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90395f  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x195f, %pstate
dvapa_8_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0x885, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3e98034  ! 155: PREFETCHA_R	prefetcha	[%r6, %r20] 0x01, #one_read
	.word 0xd0800c20  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
splash_tick_8_111:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x3b973eeda1a0cd60, %r16, %r17)
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_8_112:
	set 0x60140000, %r31
	.word 0x858466a4  ! 158: WRCCR_I	wr	%r17, 0x06a4, %ccr
	.word 0xa44c0014  ! 159: MULX_R	mulx 	%r16, %r20, %r18
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
    brnz %r10, sma_8_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00c  ! 160: CASA_R	casa	[%r31] %asi, %r12, %r17
ibp_8_114:
	nop
	.word 0x95a489a1  ! 161: FDIVs	fdivs	%f18, %f1, %f10
memptr_8_115:
	set 0x60140000, %r31
	.word 0x8582bdb5  ! 162: WRCCR_I	wr	%r10, 0x1db5, %ccr
splash_tba_8_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x904cc011  ! 164: MULX_R	mulx 	%r19, %r17, %r8
	.word 0x93d020b2  ! 165: Tcc_I	tne	icc_or_xcc, %r0 + 178
ibp_8_117:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87ac0a4a  ! 166: FCMPd	fcmpd	%fcc<n>, %f16, %f10
brcommon2_8_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x93a2c9cc  ! 1: FDIVd	fdivd	%f42, %f12, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe080  ! 167: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0xd027e008  ! 168: STW_I	stw	%r8, [%r31 + 0x0008]
ibp_8_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x93a349d4  ! 169: FDIVd	fdivd	%f44, %f20, %f40
	.word 0x97520000  ! 170: RDPR_PIL	<illegal instruction>
mondo_8_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d914010  ! 171: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x8d802004  ! 172: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe08fe1c8  ! 173: LDUBA_I	lduba	[%r31, + 0x01c8] %asi, %r16
	setx 0x322e59371714e18b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x90c22128  ! 175: ADDCcc_I	addccc 	%r8, 0x0128, %r8
ibp_8_122:
	nop
	.word 0xe19fda00  ! 176: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_8_123:
	nop
	.word 0xe1bfe140  ! 177: STDFA_I	stda	%f16, [0x0140, %r31]
ibp_8_124:
	nop
	.word 0x99a089d1  ! 178: FDIVd	fdivd	%f2, %f48, %f12
	.word 0xe897e0d8  ! 179: LDUHA_I	lduha	[%r31, + 0x00d8] %asi, %r20
fpinit_8_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 180: FCMPd	fcmpd	%fcc<n>, %f0, %f4
cerer_8_126:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xe3098fa23c32bb39, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_8_127:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd920  ! 182: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_128) + 32, 16, 16)) -> intp(7,0,11)
#else
	setx 0x6004b2e17b346700, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0xda51725376dcd3c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_8_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd56, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe1e0  ! 185: LDDFA_I	ldda	[%r31, 0x01e0], %f16
mondo_8_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d944004  ! 186: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_8_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d924003  ! 188: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
mondo_8_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 189: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
memptr_8_134:
	set 0x60740000, %r31
	.word 0x8581e630  ! 190: WRCCR_I	wr	%r7, 0x0630, %ccr
splash_hpstate_8_135:
	.word 0x81982645  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0645, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_8_136:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982d85  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d85, %hpstate
splash_hpstate_8_137:
	ta T_CHANGE_NONHPRIV
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x819832d5  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x12d5, %hpstate
	.word 0xc19fd920  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
splash_tick_8_138:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x821fa3c98b35abd9, %r16, %r17)
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_8_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x95f17fb0c53e39f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tick_8_140:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xd31a2067df565145, %r16, %r17)
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_8_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92400b  ! 199: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
splash_lsu_8_142:
	nop
	ta T_CHANGE_HPRIV
	set 0x64c0b741, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_8_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_143:
	.word 0x8f902001  ! 201: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cmpenall_8_144:
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
cmpenall_startwait8_144:
    mov 0x8, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_8_144
    nop
cmpenall_wait8_144:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait8_144
    nop
    ba,a cmpenall_startwait8_144
continue_cmpenall_8_144:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_8_144:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_8_144
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_8_144:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_8_144
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
fork_lbl_0_3:
    ta T_CHANGE_NONHPRIV 
mondo_4_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d92c002  ! 1: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
trapasi_4_1:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xd0d844a0  ! 2: LDXA_R	ldxa	[%r1, %r0] 0x25, %r8
splash_cmpr_4_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 3: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_4_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_3:
	.word 0x8f902002  ! 4: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_4_4:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 6: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_decr_4_5:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa781800c  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r12, %-
	.word 0xd07fe100  ! 8: SWAP_I	swap	%r8, [%r31 + 0x0100]
	.word 0x9192c013  ! 9: WRPR_PIL_R	wrpr	%r11, %r19, %pil
brcommon3_4_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd09fe140  ! 10: LDDA_I	ldda	[%r31, + 0x0140] %asi, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_8:
	rd %pc, %r12
	add %r12, (donretarg_4_8-donret_4_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007c4500 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x89f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_8:
	.word 0xd06fe032  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x0032]
	.word 0xab834007  ! 12: WR_CLEAR_SOFTINT_R	wr	%r13, %r7, %clear_softint
dvapa_4_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdd7, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0bfc031  ! 13: STDA_R	stda	%r8, [%r31 + %r17] 0x01
	.word 0x996cc014  ! 14: SDIVX_R	sdivx	%r19, %r20, %r12
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
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
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
	.word 0xa7414000  ! 15: RDPC	rd	%pc, %r19
	.word 0xe4800a60  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
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
    brnz %r10, sma_4_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 17: CASA_R	casa	[%r31] %asi, %r17, %r18
brcommon1_4_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1f0  ! 1: STXFSR_I	st-sfr	%f1, [0x01f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a449b3  ! 18: FDIVs	fdivs	%f17, %f19, %f10
	.word 0x8d903e02  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1e02, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_14) + 0, 16, 16)) -> intp(3,0,17)
#else
	setx 0xa252469fdb393f68, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_4_16:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa780c014  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r20, %-
intveclr_4_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6d789572559bfb81, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_4_18:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4c84980  ! 24: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_4_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbd6834d35bdedf93, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2dfc56647ad0ae96, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_4_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe1a0  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x01a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd51fc009  ! 30: LDDF_R	ldd	[%r31, %r9], %f10
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
    brnz %r10, cwq_4_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_23
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
cwq_4_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 31: RDPC	rd	%pc, %r17
	.word 0x879c702f  ! 32: WRHPR_HINTP_I	wrhpr	%r17, 0x102f, %hintp
	.word 0xd497e160  ! 33: LDUHA_I	lduha	[%r31, + 0x0160] %asi, %r10
	.word 0xd497c02d  ! 34: LDUHA_R	lduha	[%r31, %r13] 0x01, %r10
splash_lsu_4_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xdc15ecb3, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_decr_4_26:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7828012  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r18, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_27:
	rd %pc, %r12
	add %r12, (donretarg_4_27-donret_4_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00426b00 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x157, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_27:
	.word 0x36800001  ! 37: BGE	bge,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_28) + 16, 16, 16)) -> intp(1,0,9)
#else
	setx 0x1c8a08cda6eeee43, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91908014  ! 39: WRPR_PIL_R	wrpr	%r2, %r20, %pil
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
    brnz %r10, sma_4_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e014  ! 40: CASA_R	casa	[%r31] %asi, %r20, %r10
	.word 0xd497e178  ! 41: LDUHA_I	lduha	[%r31, + 0x0178] %asi, %r10
	.word 0x8d802004  ! 42: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_4_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0x12b90a46957ad602, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_4_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7844011  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r17, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_4_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 46: FCMPLE32	fcmple32	%d0, %d4, %r4
invtsb_4_35:
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
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_4_36:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x81982cb7  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cb7, %hpstate
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
    brnz %r10, cwq_4_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_37
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
cwq_4_37:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 49: RDPC	rd	%pc, %r10
splash_hpstate_4_38:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d5e  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0xc30fc000  ! 51: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 53: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0xea6365cef7f86888, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_4_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4904e60  ! 55: LDUHA_R	lduha	[%r1, %r0] 0x73, %r18
memptr_4_43:
	set 0x60340000, %r31
	.word 0x8580657d  ! 56: WRCCR_I	wr	%r1, 0x057d, %ccr
memptr_4_44:
	set 0x60740000, %r31
	.word 0x8584ffe6  ! 57: WRCCR_I	wr	%r19, 0x1fe6, %ccr
	.word 0x95a48d23  ! 58: FsMULd	fsmuld	%f18, %f34, %f10
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_45:
	rd %pc, %r12
	add %r12, (donretarg_4_45-donret_4_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c64800 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e49, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_45:
	.word 0xd4ffe0c0  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x00c0] %asi
	.word 0xa1702e10  ! 60: POPC_I	popc	0x0e10, %r16
splash_tba_4_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_4_48:
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
ibp_startwait4_48:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_48
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_48:
    brnz %r16, ibp_wait4_48
    ld [%r23], %r16
    ba ibp_startwait4_48
    mov 0x4, %r16
continue_ibp_4_48:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_48:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_48
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_48:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_48
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_48:
    best_set_reg(0x00000040e3c00a1f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a409b1  ! 62: FDIVs	fdivs	%f16, %f17, %f18
	.word 0x95450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe048  ! 65: LDDF_I	ldd	[%r31, 0x0048], %f11
memptr_4_49:
	set 0x60740000, %r31
	.word 0x85843837  ! 66: WRCCR_I	wr	%r16, 0x1837, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
	.word 0x93b447d4  ! 68: PDIST	pdistn	%d48, %d20, %d40
	.word 0xdb1fe0e0  ! 69: LDDF_I	ldd	[%r31, 0x00e0], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_4_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb6e, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b24491  ! 71: FCMPLE32	fcmple32	%d40, %d48, %r16
splash_cmpr_4_52:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 72: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_4_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8f44a743f2243170, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_4_54:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 75: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_56) + 0, 16, 16)) -> intp(5,0,16)
#else
	setx 0xd4a372d9ec0c4dc1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_4_58:
	nop
	ta T_CHANGE_HPRIV
	set 0x2e2a2731, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_4_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802020  ! 80: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd45fe1b8  ! 81: LDX_I	ldx	[%r31 + 0x01b8], %r10
br_badelay1_4_60:
	.word 0xd43fc014  ! 1: STD_R	std	%r10, [%r31 + %r20]
	.word 0xe9334010  ! 1: STQF_R	-	%f20, [%r16, %r13]
	.word 0xc36fe160  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0160], #one_read
	normalw
	.word 0x97458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r11
mondo_4_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d924013  ! 83: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_4_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_62
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
cwq_4_62:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 85: RDPC	rd	%pc, %r20
pmu_4_63:
	nop
	setx 0xfffffdf9fffff369, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_4_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_4_65:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 88: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_4_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xd49902f1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_4_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_67
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
cwq_4_67:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 91: RDPC	rd	%pc, %r8
	.word 0xd827e1ac  ! 92: STW_I	stw	%r12, [%r31 + 0x01ac]
splash_tba_4_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x8fb7eeadd65bb919, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802000  ! 96: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc32fc013  ! 97: STXFSR_R	st-sfr	%f1, [%r19, %r31]
splash_cmpr_4_71:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_4_72:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 100: RDTICK	rd	%tick, %r16
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033e9  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x13e9, %pstate
intveclr_4_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7003c9ee6ff142ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_4_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e831a8  ! 103: PREFETCHA_I	prefetcha	[%r0, + 0xfffff1a8] %asi, #one_read
jmptr_4_76:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_4_77:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_4_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 106: CASA_R	casa	[%r31] %asi, %r10, %r20
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
    brnz %r10, sma_4_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 107: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_4_80:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 108: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_4_81:
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
ibp_startwait4_81:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_81
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_81:
    brnz %r16, ibp_wait4_81
    ld [%r23], %r16
    ba ibp_startwait4_81
    mov 0x4, %r16
continue_ibp_4_81:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_81:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_81
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_81:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_81
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_81:
    best_set_reg(0x0000004026ca1f36,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fe120  ! 109: LDDFA_I	ldda	[%r31, 0x0120], %f0
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87aa8ad0  ! 111: FCMPEd	fcmped	%fcc<n>, %f10, %f16
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
    brnz %r10, cwq_4_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_82
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
cwq_4_82:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 112: RDPC	rd	%pc, %r13
cwp_4_83:
    set user_data_start, %o7
	.word 0x93902000  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x94da4012  ! 114: SMULcc_R	smulcc 	%r9, %r18, %r10
	.word 0x8d802004  ! 115: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_4_84:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c844a0  ! 116: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r18
	.word 0x8d802000  ! 117: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_4_85:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe4d844a0  ! 118: LDXA_R	ldxa	[%r1, %r0] 0x25, %r18
	.word 0xa953c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_4_86:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x819827d5  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d5, %hpstate
intveclr_4_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0x65009caae4ff9a29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e09c  ! 122: STQF_I	-	%f20, [0x009c, %r31]
	.word 0x94c52afb  ! 123: ADDCcc_I	addccc 	%r20, 0x0afb, %r10
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_88) + 16, 16, 16)) -> intp(2,0,13)
#else
	setx 0x88c758faecb5d816, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_4_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8c84e60  ! 125: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r20
trapasi_4_90:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xe88844a0  ! 126: LDUBA_R	lduba	[%r1, %r0] 0x25, %r20
	.word 0xc36d2790  ! 127: PREFETCH_I	prefetch	[%r20 + 0x0790], #one_read
intveclr_4_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0f751dd29753ae60, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_4_93:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d84a00  ! 129: LDXA_R	ldxa	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe19fdf20  ! 131: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e0e0  ! 133: LDQFA_I	-	[%r31, 0x00e0], %f8
dvapa_4_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8a1, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ad0a41  ! 134: FCMPd	fcmpd	%fcc<n>, %f20, %f32
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 137: WRASI_I	wr	%r0, 0x0088, %asi
memptr_4_97:
	set 0x60540000, %r31
	.word 0x858335b9  ! 138: WRCCR_I	wr	%r12, 0x15b9, %ccr
splash_cmpr_4_98:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87aa4a28  ! 140: FCMPs	fcmps	%fcc<n>, %f9, %f8
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e160  ! 142: LDSWA_I	ldswa	[%r31, + 0x0160] %asi, %r8
splash_tba_4_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_4_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_101:
	.word 0x8f902000  ! 144: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_102:
	rd %pc, %r12
	add %r12, (donretarg_4_102-donret_4_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0080ec00 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e8d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	retry
donretarg_4_102:
	.word 0x25400001  ! 145: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd09fe130  ! 146: LDDA_I	ldda	[%r31, + 0x0130] %asi, %r8
	.word 0x91d02033  ! 147: Tcc_I	ta	icc_or_xcc, %r0 + 51
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
    brnz %r10, cwq_4_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_104
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
cwq_4_104:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 148: RDPC	rd	%pc, %r12
mondo_4_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d940009  ! 149: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
	.word 0xc19fe1a0  ! 150: LDDFA_I	ldda	[%r31, 0x01a0], %f0
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
    brnz %r10, cwq_4_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_106
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
cwq_4_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 151: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_108) + 0, 16, 16)) -> intp(2,0,8)
#else
	setx 0x64dcb04be01468c6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903491  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1491, %pstate
dvapa_4_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf83, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99b1c7c9  ! 155: PDIST	pdistn	%d38, %d40, %d12
	.word 0xd08008a0  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_4_112:
	set 0x60740000, %r31
	.word 0x8581e870  ! 158: WRCCR_I	wr	%r7, 0x0870, %ccr
	.word 0xa64a400b  ! 159: MULX_R	mulx 	%r9, %r11, %r19
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
    brnz %r10, sma_4_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 160: CASA_R	casa	[%r31] %asi, %r16, %r17
ibp_4_114:
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
ibp_startwait4_114:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_114
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_114:
    brnz %r16, ibp_wait4_114
    ld [%r23], %r16
    ba ibp_startwait4_114
    mov 0x4, %r16
continue_ibp_4_114:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_114:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_114
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_114:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_114
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_114:
    best_set_reg(0x00000050acdf3688,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x99b2048d  ! 161: FCMPLE32	fcmple32	%d8, %d44, %r12
memptr_4_115:
	set 0x60540000, %r31
	.word 0x858420a4  ! 162: WRCCR_I	wr	%r16, 0x00a4, %ccr
splash_tba_4_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa24c0009  ! 164: MULX_R	mulx 	%r16, %r9, %r17
	.word 0x91d020b4  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 180
ibp_4_117:
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
ibp_startwait4_117:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_117
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_117:
    brnz %r16, ibp_wait4_117
    ld [%r23], %r16
    ba ibp_startwait4_117
    mov 0x4, %r16
continue_ibp_4_117:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_117:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_117
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_117:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_117
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_117:
    best_set_reg(0x00000050b5f688b7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a0c9a6  ! 166: FDIVs	fdivs	%f3, %f6, %f16
brcommon2_4_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe150  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0150], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe140  ! 167: STDFA_I	stda	%f0, [0x0140, %r31]
	.word 0xd027e10c  ! 168: STW_I	stw	%r8, [%r31 + 0x010c]
ibp_4_119:
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
ibp_startwait4_119:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_119
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_119:
    brnz %r16, ibp_wait4_119
    ld [%r23], %r16
    ba ibp_startwait4_119
    mov 0x4, %r16
continue_ibp_4_119:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_119:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_119
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_119:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_119
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_119:
    best_set_reg(0x00000040e4c8b718,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3ecc028  ! 169: PREFETCHA_R	prefetcha	[%r19, %r8] 0x01, #one_read
	.word 0x99520000  ! 170: RDPR_PIL	<illegal instruction>
mondo_4_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d940012  ! 171: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x8d802000  ! 172: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe08fe090  ! 173: LDUBA_I	lduba	[%r31, + 0x0090] %asi, %r16
	setx 0x06c9d60a9086f8c2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0c325e9  ! 175: ADDCcc_I	addccc 	%r12, 0x05e9, %r16
ibp_4_122:
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
ibp_startwait4_122:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_122
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_122:
    brnz %r16, ibp_wait4_122
    ld [%r23], %r16
    ba ibp_startwait4_122
    mov 0x4, %r16
continue_ibp_4_122:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_122:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_122
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_122:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_122
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_122:
    best_set_reg(0x00000050b0f7184a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfd920  ! 176: STDFA_R	stda	%f16, [%r0, %r31]
ibp_4_123:
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
ibp_startwait4_123:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_123
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_123:
    brnz %r16, ibp_wait4_123
    ld [%r23], %r16
    ba ibp_startwait4_123
    mov 0x4, %r16
continue_ibp_4_123:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_123:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_123
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_123:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_123
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_123:
    best_set_reg(0x0000005086d84ab9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe120  ! 177: STDFA_I	stda	%f16, [0x0120, %r31]
ibp_4_124:
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
ibp_startwait4_124:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_124
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_124:
    brnz %r16, ibp_wait4_124
    ld [%r23], %r16
    ba ibp_startwait4_124
    mov 0x4, %r16
continue_ibp_4_124:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_124:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_124
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_124:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_124
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_124:
    best_set_reg(0x0000004018cab958,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa570234d  ! 178: POPC_I	popc	0x034d, %r18
	.word 0xe897e130  ! 179: LDUHA_I	lduha	[%r31, + 0x0130] %asi, %r20
fpinit_4_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 180: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_4_127:
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
ibp_startwait4_127:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_127
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_127:
    brnz %r16, ibp_wait4_127
    ld [%r23], %r16
    ba ibp_startwait4_127
    mov 0x4, %r16
continue_ibp_4_127:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_127
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_127:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_127
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_127:
    best_set_reg(0x000000402af95832,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 182: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_128) + 24, 16, 16)) -> intp(4,0,2)
#else
	setx 0xf91b499fa7713c3d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x299d9240055f898e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_4_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc4b, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0a0  ! 185: STDFA_I	stda	%f16, [0x00a0, %r31]
mondo_4_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d910012  ! 186: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_4_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944004  ! 188: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
mondo_4_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d91c00c  ! 189: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
memptr_4_134:
	set 0x60540000, %r31
	.word 0x85832b67  ! 190: WRCCR_I	wr	%r12, 0x0b67, %ccr
splash_hpstate_4_135:
	.word 0x81982355  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_4_136:
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	.word 0x81983621  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1621, %hpstate
splash_hpstate_4_137:
	ta T_CHANGE_NONHPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81983649  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1649, %hpstate
	.word 0xe19fc2c0  ! 195: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_4_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd5d1d2cec309d7de, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_4_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d920003  ! 199: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
splash_lsu_4_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xc53e1b37, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_143:
	.word 0x8f902000  ! 201: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
mondo_2_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d908014  ! 1: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
trapasi_2_1:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xd0c044a0  ! 2: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r8
splash_cmpr_2_2:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 3: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_2_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_3:
	.word 0x8f902000  ! 4: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_2_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 6: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa780400d  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r13, %-
	.word 0xd07fe1f0  ! 8: SWAP_I	swap	%r8, [%r31 + 0x01f0]
	.word 0x91948013  ! 9: WRPR_PIL_R	wrpr	%r18, %r19, %pil
brcommon3_2_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd0dfc030  ! 10: LDXA_R	ldxa	[%r31, %r16] 0x01, %r8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_8:
	rd %pc, %r12
	add %r12, (donretarg_2_8-donret_2_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006ee500 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x40d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2acc4001  ! 1: BRNZ	brnz,a,pt	%r17,<label_0xc4001>
	retry
donretarg_2_8:
	.word 0xd06fe067  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x0067]
	.word 0xab85000d  ! 12: WR_CLEAR_SOFTINT_R	wr	%r20, %r13, %clear_softint
dvapa_2_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd75, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 13: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xa36cc00b  ! 14: SDIVX_R	sdivx	%r19, %r11, %r17
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
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
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
	.word 0xa7414000  ! 15: RDPC	rd	%pc, %r19
	.word 0xe48008a0  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_2_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 17: CASA_R	casa	[%r31] %asi, %r8, %r18
brcommon1_2_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe110  ! 1: STXFSR_I	st-sfr	%f1, [0x0110, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95b507cc  ! 18: PDIST	pdistn	%d20, %d12, %d10
	.word 0x8d902362  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x0362, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_14) + 16, 16, 16)) -> intp(7,0,21)
#else
	setx 0x749c04fea047b3eb, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7840001  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r1, %-
intveclr_2_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7af512ed7279d275, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_2_18:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4d04980  ! 24: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_2_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0c78a35c9016e8a5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbea37a61d9fc410e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_2_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe060  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x0060]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd4bfc031  ! 30: STDA_R	stda	%r10, [%r31 + %r17] 0x01
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
    brnz %r10, cwq_2_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_23
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
cwq_2_23:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 31: RDPC	rd	%pc, %r20
	.word 0x879c7a19  ! 32: WRHPR_HINTP_I	wrhpr	%r17, 0x1a19, %hintp
	.word 0xd497e040  ! 33: LDUHA_I	lduha	[%r31, + 0x0040] %asi, %r10
iaw_2_24:
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
iaw_startwait2_24:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_24
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_24:
    brnz %r16, iaw_wait2_24
    ld [%r23], %r16
    ba iaw_startwait2_24
    mov 0x2, %r16
continue_iaw_2_24:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_24:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_24
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_24:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_2_24
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_24:
	mov 0x38, %r18
iaw0_2_24:
	rd %pc, %r19
	add %r19, (16+1), %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc011  ! 34: STXFSR_R	st-sfr	%f1, [%r17, %r31]
splash_lsu_2_25:
	nop
	ta T_CHANGE_HPRIV
	set 0xa354933a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa780c014  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r20, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_27:
	rd %pc, %r12
	add %r12, (donretarg_2_27-donret_2_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e83b00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x84f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_27:
	.word 0x28800001  ! 37: BLEU	bleu,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_28) + 0, 16, 16)) -> intp(7,0,6)
#else
	setx 0xeaaed28d61ad439c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91924014  ! 39: WRPR_PIL_R	wrpr	%r9, %r20, %pil
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
    brnz %r10, sma_2_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e009  ! 40: CASA_R	casa	[%r31] %asi, %r9, %r10
	.word 0xd497e0a0  ! 41: LDUHA_I	lduha	[%r31, + 0x00a0] %asi, %r10
	.word 0x8d802000  ! 42: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_2_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0x809b850e130b263a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7840010  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_2_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82af6  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0x0af6] %asi, #one_read
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_2_36:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x819822cb  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cb, %hpstate
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
    brnz %r10, cwq_2_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_37
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
cwq_2_37:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 49: RDPC	rd	%pc, %r13
splash_hpstate_2_38:
	ta T_CHANGE_NONHPRIV
	.word 0x819836d4  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16d4, %hpstate
	fbe skip_2_39
	.word 0x87ac8a43  ! 1: FCMPd	fcmpd	%fcc<n>, %f18, %f34
.align 2048
skip_2_39:
	.word 0xc36fe0e0  ! 51: PREFETCH_I	prefetch	[%r31 + 0x00e0], #one_read
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 53: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x63f0e0d6b55a2d92, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_2_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4884e60  ! 55: LDUBA_R	lduba	[%r1, %r0] 0x73, %r18
memptr_2_43:
	set 0x60340000, %r31
	.word 0x8582670c  ! 56: WRCCR_I	wr	%r9, 0x070c, %ccr
memptr_2_44:
	set 0x60740000, %r31
	.word 0x85817a8c  ! 57: WRCCR_I	wr	%r5, 0x1a8c, %ccr
	.word 0x9ba50d2d  ! 58: FsMULd	fsmuld	%f20, %f44, %f44
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_45:
	rd %pc, %r12
	add %r12, (donretarg_2_45-donret_2_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00999800 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xedd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_45:
	.word 0xd4ffe1bc  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x01bc] %asi
iaw_2_46:
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
iaw_startwait2_46:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_46
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_46:
    brnz %r16, iaw_wait2_46
    ld [%r23], %r16
    ba iaw_startwait2_46
    mov 0x2, %r16
continue_iaw_2_46:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_46:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_46
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_46:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_2_46
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_46:
	mov 0x38, %r18
iaw4_2_46:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a48  ! 60: FCMPd	fcmpd	%fcc<n>, %f48, %f8
splash_tba_2_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_2_48:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87ac8a52  ! 62: FCMPd	fcmpd	%fcc<n>, %f18, %f18
	.word 0xa3450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe168  ! 65: LDDF_I	ldd	[%r31, 0x0168], %f11
memptr_2_49:
	set 0x60740000, %r31
	.word 0x85836ab9  ! 66: WRCCR_I	wr	%r13, 0x0ab9, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
iaw_2_50:
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
iaw_startwait2_50:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_50
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_50:
    brnz %r16, iaw_wait2_50
    ld [%r23], %r16
    ba iaw_startwait2_50
    mov 0x2, %r16
continue_iaw_2_50:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_50:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_50
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_50:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_2_50
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_50:
	mov 0x38, %r18
iaw1_2_50:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9bb487d0  ! 68: PDIST	pdistn	%d18, %d16, %d44
	.word 0xdb1fe008  ! 69: LDDF_I	ldd	[%r31, 0x0008], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_2_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfaf, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5a189c6  ! 71: FDIVd	fdivd	%f6, %f6, %f18
splash_cmpr_2_52:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 72: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_2_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x56c382e8012324e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_2_54:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d918003  ! 75: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_56) + 48, 16, 16)) -> intp(1,0,7)
#else
	setx 0x58955131797c20a3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_2_58:
	nop
	ta T_CHANGE_HPRIV
	set 0xd11fa03a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_2_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802058  ! 80: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd45fe128  ! 81: LDX_I	ldx	[%r31 + 0x0128], %r10
br_badelay1_2_60:
	.word 0xc36fe070  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0070], #one_read
	.word 0xe9344003  ! 1: STQF_R	-	%f20, [%r3, %r17]
	.word 0xa9a7c9d1  ! 1: FDIVd	fdivd	%f62, %f48, %f20
	normalw
	.word 0x91458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r8
mondo_2_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d904013  ! 83: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_2_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_62
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
cwq_2_62:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 85: RDPC	rd	%pc, %r13
pmu_2_63:
	nop
	setx 0xfffffd69fffff61a, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_2_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_2_65:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 88: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_2_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xcc71382d, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_2_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_67
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
cwq_2_67:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 91: RDPC	rd	%pc, %r10
	.word 0xd827e1c0  ! 92: STW_I	stw	%r12, [%r31 + 0x01c0]
splash_tba_2_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xb3666800f8d54075, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802000  ! 96: WRFPRS_I	wr	%r0, 0x0000, %fprs
iaw_2_70:
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
iaw_startwait2_70:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_70
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_70:
    brnz %r16, iaw_wait2_70
    ld [%r23], %r16
    ba iaw_startwait2_70
    mov 0x2, %r16
continue_iaw_2_70:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_70:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_70
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_70:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_2_70
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_70:
	mov 0x38, %r18
iaw4_2_70:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd83fe080  ! 97: STD_I	std	%r12, [%r31 + 0x0080]
splash_cmpr_2_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_2_72:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 100: RDTICK	rd	%tick, %r13
	.word 0x2ccd0001  ! 1: BRGZ	brgz,a,pt	%r20,<label_0xd0001>
	.word 0x8d903175  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x1175, %pstate
intveclr_2_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc9ab9ffcedddc9b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_2_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 103: FDIVs	fdivs	%f0, %f4, %f6
jmptr_2_76:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_77:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_2_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 106: CASA_R	casa	[%r31] %asi, %r17, %r20
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
    brnz %r10, sma_2_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 107: CASA_R	casa	[%r31] %asi, %r12, %r20
splash_cmpr_2_80:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 108: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_2_81:
	nop
	.word 0xe1bfe100  ! 109: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87aa4ad0  ! 111: FCMPEd	fcmped	%fcc<n>, %f40, %f16
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
    brnz %r10, cwq_2_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_82
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
cwq_2_82:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 112: RDPC	rd	%pc, %r9
cwp_2_83:
    set user_data_start, %o7
	.word 0x93902001  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x90dc0011  ! 114: SMULcc_R	smulcc 	%r16, %r17, %r8
	.word 0x8d802000  ! 115: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_2_84:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe48844a0  ! 116: LDUBA_R	lduba	[%r1, %r0] 0x25, %r18
	.word 0x8d802004  ! 117: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_2_85:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 118: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
	.word 0x9753c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_2_86:
	.word 0x22ca0001  ! 1: BRZ	brz,a,pt	%r8,<label_0xa0001>
	.word 0x819822d5  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d5, %hpstate
intveclr_2_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfc7d9d5fa4eaff96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e0c9  ! 122: STQF_I	-	%f20, [0x00c9, %r31]
	.word 0x9ac4eb10  ! 123: ADDCcc_I	addccc 	%r19, 0x0b10, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_88) + 0, 16, 16)) -> intp(2,0,20)
#else
	setx 0xe9ff13302e336074, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_2_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8d04e60  ! 125: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r20
trapasi_2_90:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe89044a0  ! 126: LDUHA_R	lduha	[%r1, %r0] 0x25, %r20
	fbuge,a,pn	%fcc0,  skip_2_91
	.word 0x9f803f18  ! 1: SIR	sir	0x1f18
.align 512
skip_2_91:
	.word 0x87a9ca52  ! 127: FCMPd	fcmpd	%fcc<n>, %f38, %f18
intveclr_2_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x362894d849e421b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_2_93:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d04a00  ! 129: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe19fc2c0  ! 131: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e1b8  ! 133: LDQFA_I	-	[%r31, 0x01b8], %f8
dvapa_2_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb52, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea802c  ! 134: PREFETCHA_R	prefetcha	[%r10, %r12] 0x01, #one_read
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 136: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 137: WRASI_I	wr	%r0, 0x001c, %asi
memptr_2_97:
	set 0x60340000, %r31
	.word 0x8580f984  ! 138: WRCCR_I	wr	%r3, 0x1984, %ccr
splash_cmpr_2_98:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 139: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87ad0a28  ! 140: FCMPs	fcmps	%fcc<n>, %f20, %f8
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e078  ! 142: LDSWA_I	ldswa	[%r31, + 0x0078] %asi, %r8
splash_tba_2_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_2_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_101:
	.word 0x8f902000  ! 144: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_102:
	rd %pc, %r12
	add %r12, (donretarg_2_102-donret_2_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0078c600 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd1e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_102:
	.word 0x3e800001  ! 145: BVC	bvc,a	<label_0x1>
iaw_2_103:
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
iaw_startwait2_103:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_103
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_103:
    brnz %r16, iaw_wait2_103
    ld [%r23], %r16
    ba iaw_startwait2_103
    mov 0x2, %r16
continue_iaw_2_103:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_103:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_2_103
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_103:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_2_103
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_103:
	mov 0x38, %r18
iaw4_2_103:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc008  ! 146: STDF_R	std	%f8, [%r8, %r31]
	.word 0x91d02032  ! 147: Tcc_I	ta	icc_or_xcc, %r0 + 50
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
    brnz %r10, cwq_2_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_104
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
cwq_2_104:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 148: RDPC	rd	%pc, %r8
mondo_2_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d930005  ! 149: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0xc19fe060  ! 150: LDDFA_I	ldda	[%r31, 0x0060], %f0
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
    brnz %r10, cwq_2_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_106
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
cwq_2_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 151: RDPC	rd	%pc, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_108) + 56, 16, 16)) -> intp(2,0,2)
#else
	setx 0xa33c94c012e9af27, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e5d  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
dvapa_2_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0x89f, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91a309a9  ! 155: FDIVs	fdivs	%f12, %f9, %f8
	.word 0xd0800b80  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_2_112:
	set 0x60540000, %r31
	.word 0x85847ad3  ! 158: WRCCR_I	wr	%r17, 0x1ad3, %ccr
	.word 0x984c0003  ! 159: MULX_R	mulx 	%r16, %r3, %r12
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
    brnz %r10, sma_2_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 160: CASA_R	casa	[%r31] %asi, %r20, %r17
ibp_2_114:
	nop
	.word 0xc3e94032  ! 161: PREFETCHA_R	prefetcha	[%r5, %r18] 0x01, #one_read
memptr_2_115:
	set 0x60740000, %r31
	.word 0x8582b65c  ! 162: WRCCR_I	wr	%r10, 0x165c, %ccr
splash_tba_2_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9a4d0010  ! 164: MULX_R	mulx 	%r20, %r16, %r13
	.word 0x91d02033  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 51
ibp_2_117:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x95b487c2  ! 166: PDIST	pdistn	%d18, %d2, %d10
brcommon2_2_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91a189c4  ! 1: FDIVd	fdivd	%f6, %f4, %f8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe080  ! 167: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xd027e164  ! 168: STW_I	stw	%r8, [%r31 + 0x0164]
ibp_2_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3b40489  ! 169: FCMPLE32	fcmple32	%d16, %d40, %r17
	.word 0x99520000  ! 170: RDPR_PIL	<illegal instruction>
mondo_2_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d92000b  ! 171: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0x8d802004  ! 172: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe08fe1d0  ! 173: LDUBA_I	lduba	[%r31, + 0x01d0] %asi, %r16
	setx 0xcab83f55efe5a54b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x92c4bc2b  ! 175: ADDCcc_I	addccc 	%r18, 0xfffffc2b, %r9
ibp_2_122:
	nop
	.word 0xe1bfd920  ! 176: STDFA_R	stda	%f16, [%r0, %r31]
ibp_2_123:
	nop
	.word 0xc19fdc00  ! 177: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_2_124:
	nop
	.word 0x97b4c489  ! 178: FCMPLE32	fcmple32	%d50, %d40, %r11
	.word 0xe897e188  ! 179: LDUHA_I	lduha	[%r31, + 0x0188] %asi, %r20
fpinit_2_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 180: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_2_127:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 182: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_128) + 16, 16, 16)) -> intp(7,0,4)
#else
	setx 0x2b57968a8473b60e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2fa5885207d31795, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_2_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb1f, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe060  ! 185: LDDFA_I	ldda	[%r31, 0x0060], %f0
mondo_2_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 186: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_2_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 188: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
mondo_2_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 189: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
memptr_2_134:
	set 0x60340000, %r31
	.word 0x8584e2b7  ! 190: WRCCR_I	wr	%r19, 0x02b7, %ccr
splash_hpstate_2_135:
	.word 0x81982cc1  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc1, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_2_136:
	.word 0x22c94001  ! 1: BRZ	brz,a,pt	%r5,<label_0x94001>
	.word 0x81982495  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0495, %hpstate
splash_hpstate_2_137:
	ta T_CHANGE_NONHPRIV
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8198341f  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x141f, %hpstate
	.word 0xe19fdf20  ! 195: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_2_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf4ae4251d6a29a3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_2_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d924004  ! 199: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
splash_lsu_2_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xee8170d9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_143:
	.word 0x8f902000  ! 201: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
mondo_1_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d934013  ! 1: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
trapasi_1_1:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xd0c844a0  ! 2: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r8
splash_cmpr_1_2:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 3: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
change_to_randtl_1_3:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_3:
	.word 0x8f902001  ! 4: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd077c000  ! 5: STX_R	stx	%r8, [%r31 + %r0]
splash_cmpr_1_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 6: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_decr_1_5:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7850013  ! 7: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r19, %-
	.word 0xd07fe160  ! 8: SWAP_I	swap	%r8, [%r31 + 0x0160]
	.word 0x91948005  ! 9: WRPR_PIL_R	wrpr	%r18, %r5, %pil
brcommon3_1_7:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd1e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fc008  ! 10: LDDF_R	ldd	[%r31, %r8], %f8
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_8:
	rd %pc, %r12
	add %r12, (donretarg_1_8-donret_1_8), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f3f200 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d99, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	retry
donretarg_1_8:
	.word 0xd06fe16b  ! 11: LDSTUB_I	ldstub	%r8, [%r31 + 0x016b]
	.word 0xab808012  ! 12: WR_CLEAR_SOFTINT_R	wr	%r2, %r18, %clear_softint
dvapa_1_9:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf10, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd03fe0e0  ! 13: STD_I	std	%r8, [%r31 + 0x00e0]
	.word 0x9169c004  ! 14: SDIVX_R	sdivx	%r7, %r4, %r8
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
	.word 0xa5414000  ! 15: RDPC	rd	%pc, %r18
	.word 0xe4800ac0  ! 16: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
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
    brnz %r10, sma_1_11
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_11:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 17: CASA_R	casa	[%r31] %asi, %r18, %r18
brcommon1_1_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe0a0  ! 1: STXFSR_I	st-sfr	%f1, [0x00a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ec4025  ! 18: PREFETCHA_R	prefetcha	[%r17, %r5] 0x01, #one_read
	.word 0x8d9035c9  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x15c9, %pstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_14) + 56, 16, 16)) -> intp(2,0,27)
#else
	setx 0xbdfe4c1506ba6719, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_14:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_15:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 21: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_1_16:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7830006  ! 22: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r6, %-
intveclr_1_17:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9de4e82df974a214, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 23: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_1_18:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xd4c04980  ! 24: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd45fc000  ! 25: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_19:
	ta	T_CHANGE_NONPRIV	! macro
intveclr_1_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaffaf2ea34e41731, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 27: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8224f39556f4a914, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd45fc000  ! 29: LDX_R	ldx	[%r31 + %r0], %r10
brcommon3_1_22:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd46fe180  ! 1: LDSTUB_I	ldstub	%r10, [%r31 + 0x0180]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd49fe1a0  ! 30: LDDA_I	ldda	[%r31, + 0x01a0] %asi, %r10
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
    brnz %r10, cwq_1_23
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_23
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
cwq_1_23:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 31: RDPC	rd	%pc, %r10
	.word 0x8799aaf6  ! 32: WRHPR_HINTP_I	wrhpr	%r6, 0x0af6, %hintp
	.word 0xd497e170  ! 33: LDUHA_I	lduha	[%r31, + 0x0170] %asi, %r10
	.word 0xd4bfc02c  ! 34: STDA_R	stda	%r10, [%r31 + %r12] 0x01
splash_lsu_1_25:
	nop
	ta T_CHANGE_HPRIV
	set 0x73c2d9bc, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 35: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_decr_1_26:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7840011  ! 36: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_27:
	rd %pc, %r12
	add %r12, (donretarg_1_27-donret_1_27), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0019f700 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd8f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_27:
	.word 0x24800001  ! 37: BLE	ble,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_28) + 16, 16, 16)) -> intp(3,0,10)
#else
	setx 0x6cac0d5aef295d27, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_28:
	.word 0x39400001  ! 38: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9194000b  ! 39: WRPR_PIL_R	wrpr	%r16, %r11, %pil
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
    brnz %r10, sma_1_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 40: CASA_R	casa	[%r31] %asi, %r8, %r10
	.word 0xd497e1f8  ! 41: LDUHA_I	lduha	[%r31, + 0x01f8] %asi, %r10
	.word 0x8d802004  ! 42: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_1_31:
	nop
	ta T_CHANGE_HPRIV
	setx 0x86677fb4054a9e47, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_1_32:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r0, [%r1] 0x45
	.word 0xa7844012  ! 44: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r18, %-
	.word 0x8143e011  ! 45: MEMBAR	membar	#LoadLoad | #Lookaside 
fpinit_1_34:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 46: FDIVs	fdivs	%f0, %f4, %f4
invtsb_1_35:
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
	.word 0x29800001  ! 47: FBL	fbl,a	<label_0x1>
splash_hpstate_1_36:
	.word 0x26ca0001  ! 1: BRLZ	brlz,a,pt	%r8,<label_0xa0001>
	.word 0x81983ec7  ! 48: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec7, %hpstate
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
    brnz %r10, cwq_1_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_37
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
cwq_1_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 49: RDPC	rd	%pc, %r18
splash_hpstate_1_38:
	ta T_CHANGE_NONHPRIV
	.word 0x81983915  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1915, %hpstate
	.word 0xe43fc000  ! 51: STD_R	std	%r18, [%r31 + %r0]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 52: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_40:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 53: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x8e6e59886d00a267, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_41:
	.word 0x39400001  ! 54: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_1_42:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe4c04e60  ! 55: LDSWA_R	ldswa	[%r1, %r0] 0x73, %r18
memptr_1_43:
	set 0x60340000, %r31
	.word 0x8584601d  ! 56: WRCCR_I	wr	%r17, 0x001d, %ccr
memptr_1_44:
	set 0x60540000, %r31
	.word 0x858129bc  ! 57: WRCCR_I	wr	%r4, 0x09bc, %ccr
	.word 0x95a14d29  ! 58: FsMULd	fsmuld	%f5, %f40, %f10
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_45:
	rd %pc, %r12
	add %r12, (donretarg_1_45-donret_1_45+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b58000 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15d3, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_45:
	.word 0xd4ffe1d8  ! 59: SWAPA_I	swapa	%r10, [%r31 + 0x01d8] %asi
	.word 0x97703ed3  ! 60: POPC_I	popc	0x1ed3, %r11
splash_tba_1_47:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 61: WRPR_TBA_R	wrpr	%r0, %r12, %tba
ibp_1_48:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x91a509b2  ! 62: FDIVs	fdivs	%f20, %f18, %f8
	.word 0x97450000  ! 63: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xd677c000  ! 64: STX_R	stx	%r11, [%r31 + %r0]
	.word 0xd71fe018  ! 65: LDDF_I	ldd	[%r31, 0x0018], %f11
memptr_1_49:
	set 0x60340000, %r31
	.word 0x85812086  ! 66: WRCCR_I	wr	%r4, 0x0086, %ccr
	.word 0x81b01021  ! 67: SIAM	siam	1
	.word 0x87ab0a45  ! 68: FCMPd	fcmpd	%fcc<n>, %f12, %f36
	.word 0xdb1fe018  ! 69: LDDF_I	ldd	[%r31, 0x0018], %f13
	.word 0x36780001  ! 70: BPGE	<illegal instruction>
dvapa_1_51:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd6b, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95b34490  ! 71: FCMPLE32	fcmple32	%d44, %d16, %r10
splash_cmpr_1_52:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 72: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
intveclr_1_53:
	nop
	ta T_CHANGE_HPRIV
	setx 0x39ff3ea4d4e23e7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_1_54:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 74: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_55:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d950010  ! 75: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_56) + 8, 16, 16)) -> intp(1,0,4)
#else
	setx 0xbb50c03c2cf0ec2c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_56:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 77: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_1_58:
	nop
	ta T_CHANGE_HPRIV
	set 0xa1a04c63, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_1_59:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 79: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87802055  ! 80: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd45fe080  ! 81: LDX_I	ldx	[%r31 + 0x0080], %r10
br_badelay1_1_60:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe932c008  ! 1: STQF_R	-	%f20, [%r8, %r11]
	.word 0xe9e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r20
	normalw
	.word 0xa5458000  ! 82: RD_SOFTINT_REG	rd	%softint, %r18
mondo_1_61:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 83: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r18
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
    brnz %r10, cwq_1_62
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_62
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
cwq_1_62:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 85: RDPC	rd	%pc, %r9
pmu_1_63:
	nop
	setx 0xfffffb74ffffffce, %g1, %g7
	.word 0xa3800007  ! 86: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_1_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 87: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_cmpr_1_65:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 88: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_1_66:
	nop
	ta T_CHANGE_HPRIV
	set 0xd624109e, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc30fc000  ! 90: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_1_67
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_67
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
cwq_1_67:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 91: RDPC	rd	%pc, %r12
	.word 0xd827e0ac  ! 92: STW_I	stw	%r12, [%r31 + 0x00ac]
splash_tba_1_68:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 93: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x101bed930ff1a1fa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_69:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd85fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802000  ! 96: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd91fc011  ! 97: LDDF_R	ldd	[%r31, %r17], %f12
splash_cmpr_1_71:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
ceter_1_72:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 100: RDTICK	rd	%tick, %r20
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d21  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x1d21, %pstate
intveclr_1_74:
	nop
	ta T_CHANGE_HPRIV
	setx 0x08accab1faf7cbc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 102: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_1_75:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 103: FDIVd	fdivd	%f0, %f4, %f8
jmptr_1_76:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 104: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_77:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 105: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, sma_1_78
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_78:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 106: CASA_R	casa	[%r31] %asi, %r20, %r20
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
    brnz %r10, sma_1_79
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_79:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 107: CASA_R	casa	[%r31] %asi, %r13, %r20
splash_cmpr_1_80:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 108: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_1_81:
	nop
	.word 0xe1bfc3e0  ! 109: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87aa0ad4  ! 111: FCMPEd	fcmped	%fcc<n>, %f8, %f20
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
    brnz %r10, cwq_1_82
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_82
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
cwq_1_82:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 112: RDPC	rd	%pc, %r13
cwp_1_83:
    set user_data_start, %o7
	.word 0x93902004  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa4dc800d  ! 114: SMULcc_R	smulcc 	%r18, %r13, %r18
	.word 0x8d802004  ! 115: WRFPRS_I	wr	%r0, 0x0004, %fprs
trapasi_1_84:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe49044a0  ! 116: LDUHA_R	lduha	[%r1, %r0] 0x25, %r18
	.word 0x8d802000  ! 117: WRFPRS_I	wr	%r0, 0x0000, %fprs
trapasi_1_85:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xe4c044a0  ! 118: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r18
	.word 0xa953c000  ! 119: RDPR_FQ	<illegal instruction>
splash_hpstate_1_86:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x81982c97  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c97, %hpstate
intveclr_1_87:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcdffff1725a4290b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 121: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe937e08c  ! 122: STQF_I	-	%f20, [0x008c, %r31]
	.word 0xa8c1757a  ! 123: ADDCcc_I	addccc 	%r5, 0xfffff57a, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_88) + 32, 16, 16)) -> intp(0,0,16)
#else
	setx 0x915fd2453dd39c1f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_88:
	.word 0x39400001  ! 124: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_1_89:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe8d84e60  ! 125: LDXA_R	ldxa	[%r1, %r0] 0x73, %r20
trapasi_1_90:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xe89044a0  ! 126: LDUHA_R	lduha	[%r1, %r0] 0x25, %r20
	.word 0x91a0c9c2  ! 127: FDIVd	fdivd	%f34, %f2, %f8
intveclr_1_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9753899e58325aa4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 128: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
trapasi_1_93:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd0d84a00  ! 129: LDXA_R	ldxa	[%r1, %r0] 0x50, %r8
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fc2c0  ! 131: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 132: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd197e050  ! 133: LDQFA_I	-	[%r31, 0x0050], %f8
dvapa_1_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb41, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80220f  ! 134: SIR	sir	0x020f
	.word 0xd13fc000  ! 135: STDF_R	std	%f8, [%r0, %r31]
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 136: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802083  ! 137: WRASI_I	wr	%r0, 0x0083, %asi
memptr_1_97:
	set 0x60540000, %r31
	.word 0x8581738d  ! 138: WRCCR_I	wr	%r5, 0x138d, %ccr
splash_cmpr_1_98:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 139: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87ab4a33  ! 140: FCMPs	fcmps	%fcc<n>, %f13, %f19
	.word 0x89800011  ! 141: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd0c7e0d0  ! 142: LDSWA_I	ldswa	[%r31, + 0x00d0] %asi, %r8
splash_tba_1_100:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 143: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_1_101:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_101:
	.word 0x8f902001  ! 144: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_102:
	rd %pc, %r12
	add %r12, (donretarg_1_102-donret_1_102+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00776600 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb3, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_102:
	.word 0x2cca4001  ! 145: BRGZ	brgz,a,pt	%r9,<label_0xa4001>
	.word 0xd03fe0c0  ! 146: STD_I	std	%r8, [%r31 + 0x00c0]
	.word 0x91d02034  ! 147: Tcc_I	ta	icc_or_xcc, %r0 + 52
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
    brnz %r10, cwq_1_104
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_104
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
cwq_1_104:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 148: RDPC	rd	%pc, %r10
mondo_1_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 149: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0xe19fe180  ! 150: LDDFA_I	ldda	[%r31, 0x0180], %f16
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
    brnz %r10, cwq_1_106
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_106
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
cwq_1_106:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 151: RDPC	rd	%pc, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_107:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_108) + 40, 16, 16)) -> intp(7,0,4)
#else
	setx 0x3e7cabb3955958ac, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_108:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031e9  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x11e9, %pstate
dvapa_1_110:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd71, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ed002d  ! 155: PREFETCHA_R	prefetcha	[%r20, %r13] 0x01, #one_read
	.word 0xd0800a80  ! 156: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
	.word 0x89800011  ! 157: WRTICK_R	wr	%r0, %r17, %tick
memptr_1_112:
	set 0x60740000, %r31
	.word 0x85846682  ! 158: WRCCR_I	wr	%r17, 0x0682, %ccr
	.word 0xa24a0004  ! 159: MULX_R	mulx 	%r8, %r4, %r17
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
    brnz %r10, sma_1_113
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_113:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 160: CASA_R	casa	[%r31] %asi, %r11, %r17
ibp_1_114:
	nop
	.word 0x93b407c2  ! 161: PDIST	pdistn	%d16, %d2, %d40
memptr_1_115:
	set 0x60340000, %r31
	.word 0x85843544  ! 162: WRCCR_I	wr	%r16, 0x1544, %ccr
splash_tba_1_116:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 163: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x964d000a  ! 164: MULX_R	mulx 	%r20, %r10, %r11
	.word 0x93d02035  ! 165: Tcc_I	tne	icc_or_xcc, %r0 + 53
ibp_1_117:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97b48491  ! 166: FCMPLE32	fcmple32	%d18, %d48, %r11
brcommon2_1_118:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe1b0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x01b0], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1e0  ! 167: STDFA_I	stda	%f0, [0x01e0, %r31]
	.word 0xd027e189  ! 168: STW_I	stw	%r8, [%r31 + 0x0189]
ibp_1_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x93b307d2  ! 169: PDIST	pdistn	%d12, %d18, %d40
	.word 0xa1520000  ! 170: RDPR_PIL	<illegal instruction>
mondo_1_120:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d91c011  ! 171: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	.word 0x8d802004  ! 172: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe08fe1d8  ! 173: LDUBA_I	lduba	[%r31, + 0x01d8] %asi, %r16
	setx 0x3ae453699b68cccb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_121:
	.word 0x39400001  ! 174: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6c1623a  ! 175: ADDCcc_I	addccc 	%r5, 0x023a, %r19
ibp_1_122:
	nop
	.word 0xe19fc2c0  ! 176: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_1_123:
	nop
	.word 0xe1bfd960  ! 177: STDFA_R	stda	%f16, [%r0, %r31]
ibp_1_124:
	nop
	.word 0xa9a489d2  ! 178: FDIVd	fdivd	%f18, %f18, %f20
	.word 0xe897e0b8  ! 179: LDUHA_I	lduha	[%r31, + 0x00b8] %asi, %r20
fpinit_1_125:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 180: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x8143e011  ! 181: MEMBAR	membar	#LoadLoad | #Lookaside 
ibp_1_127:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe180  ! 182: LDDFA_I	ldda	[%r31, 0x0180], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_128) + 40, 16, 16)) -> intp(5,0,10)
#else
	setx 0x22e7d8466a24ec6a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_128:
	.word 0x39400001  ! 183: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_129:
	nop
	ta T_CHANGE_HPRIV
	setx 0x797dfba07cde78da, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_1_130:
	nop
	ta T_CHANGE_HPRIV
	mov 0x926, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 185: STDFA_I	stda	%f0, [0x00a0, %r31]
mondo_1_131:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d94c005  ! 186: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0xe877c000  ! 187: STX_R	stx	%r20, [%r31 + %r0]
mondo_1_132:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d930013  ! 188: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
mondo_1_133:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 189: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
memptr_1_134:
	set 0x60140000, %r31
	.word 0x85827434  ! 190: WRCCR_I	wr	%r9, 0x1434, %ccr
splash_hpstate_1_135:
	.word 0x8198200b  ! 191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000b, %hpstate
	.word 0xe937c000  ! 192: STQF_R	-	%f20, [%r0, %r31]
splash_hpstate_1_136:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x81983f15  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f15, %hpstate
splash_hpstate_1_137:
	ta T_CHANGE_NONHPRIV
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81983f84  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f84, %hpstate
	.word 0xc19fdc00  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 196: WRTICK_R	wr	%r0, %r17, %tick
intveclr_1_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2ff17e43e32144bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 198: WRTICK_R	wr	%r0, %r17, %tick
mondo_1_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d930014  ! 199: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
splash_lsu_1_142:
	nop
	ta T_CHANGE_HPRIV
	set 0xa6f6ed21, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_143:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_143:
	.word 0x8f902001  ! 201: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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

	.xword	0x6a286ee2c39769f4
	.xword	0x718c24c69d3e506b
	.xword	0x2a84596b05d0eb82
	.xword	0xc64a5c30427b3903
	.xword	0x9631238ce933e105
	.xword	0x22ddbae185f75e0b
	.xword	0x38bcd6dddfc27ebd
	.xword	0x95857c6f48525454
	.xword	0x8d9fbefcee8f27ff
	.xword	0xd0b80d9edbccae6a
	.xword	0x3f36c4c72d54a8a1
	.xword	0x463788d2ad343ef4
	.xword	0x5b7f2fc0f44a96aa
	.xword	0x36a397e60fde61be
	.xword	0x207101c051eeec97
	.xword	0x03799b6c9dc6f096
	.xword	0x2849aec93e610264
	.xword	0x0a62c61d5c453a83
	.xword	0x245b02fa336a63cc
	.xword	0xf6f5a233bff0e694
	.xword	0xcc410f846988605d
	.xword	0x6e30e42ad3d77183
	.xword	0xde6a1665b01c2448
	.xword	0x60aab2c7b860f1a4
	.xword	0x42622f2d96beb4d6
	.xword	0xf11388a5f11d5ae4
	.xword	0xf90577720215f29b
	.xword	0x16b52b19a0f8f65d
	.xword	0x1254aacefda0eadb
	.xword	0xa63c6041fb2f0953
	.xword	0x4700f61cc7eb5c22
	.xword	0x3d638dbcae53c74f
	.xword	0xecc6a5a66e340564
	.xword	0x186bcfcd9a44c99b
	.xword	0xce31fb70faaeb9bf
	.xword	0x5be05493d63563d7
	.xword	0x06bb5eb0432ba665
	.xword	0x7030d9cd3f80a451
	.xword	0x0291aa948d5d50c4
	.xword	0x1068166719b63b10
	.xword	0xd11d16aa3029d910
	.xword	0x1e92b22d0b7a11c6
	.xword	0xbbf91bc56177d896
	.xword	0xe18cc6a85d16f329
	.xword	0x061f0219bf070812
	.xword	0xeeaf7742c665d513
	.xword	0x0dfcfca7e94eec3e
	.xword	0xe82888980200a82b
	.xword	0x8d9ff8e879c3e0f1
	.xword	0xa3b5073f57e4ae6e
	.xword	0xbf97354feaceedd2
	.xword	0x1602eaf78a859f2a
	.xword	0x2514132d6c9f59d1
	.xword	0xc1e3989a905afe11
	.xword	0x3eea541a12bb86db
	.xword	0x492c2041f57ab62c
	.xword	0x5d038da13634debb
	.xword	0x08791f4816a6bb50
	.xword	0x73bd250e07f72bb8
	.xword	0xc3a6ff7428486a15
	.xword	0x80d76d97a92016d0
	.xword	0x565e0fa87820e4d6
	.xword	0x620a31156fc954b1
	.xword	0xdc3471579ce19b34
	.xword	0x780a7e5bb2ebec59
	.xword	0xf4c14fe9867ec3d0
	.xword	0x3662197dbf1a2b24
	.xword	0x671c38f7347ecd7c
	.xword	0x4782f190a1070fc3
	.xword	0xb47afba32af98abe
	.xword	0x2c0b3fdf55d85061
	.xword	0x998e12a9af4531f9
	.xword	0x8ed2c675deea8d2c
	.xword	0xf8b77d3299b0f483
	.xword	0xc60fe8d5b525d4ad
	.xword	0x2fc3d86a9d8848a3
	.xword	0x2b53acf77f80a32e
	.xword	0xd9cc299607ef85df
	.xword	0x0412f80f46c8a092
	.xword	0xfc40b97b35d8e3b7
	.xword	0xbc23ae73c3978a50
	.xword	0x01696986b6c2a14b
	.xword	0xd2d5ad11f11a6dd3
	.xword	0x5b5796c95f5dea18
	.xword	0x9e5b5a00c078d360
	.xword	0x509c9c9714e7f851
	.xword	0xe1bab6b84e8ac959
	.xword	0xb87e915d452c4da6
	.xword	0xbfa61619d0397fae
	.xword	0x3ccc13de3345be64
	.xword	0x5dfc19060645787e
	.xword	0xa1169d88d8160b56
	.xword	0x0cdb758854aa499a
	.xword	0x26b156dbc9ceeed0
	.xword	0xf7cea0914f06f438
	.xword	0xd2fc90745149519c
	.xword	0xf6f4b905825147bb
	.xword	0x6d46ed9effc97ed1
	.xword	0x488c039931e55dad
	.xword	0xa4b4ed9314817fdb
	.xword	0x0b6a9bb16cdede9f
	.xword	0x58eefd9ae5c826ba
	.xword	0x40b3a0dfac3f9cdb
	.xword	0x53006527fef25000
	.xword	0xc544e7213432ede1
	.xword	0xa912e5ba8e51fef2
	.xword	0x9a2af56304b2abf4
	.xword	0xd87c325043d643f8
	.xword	0x2fca5255eaee0974
	.xword	0x8b6431e4e33d0875
	.xword	0x4e8ebecc435b0d61
	.xword	0xca4267be5630bd66
	.xword	0xf8f8251859a49702
	.xword	0x1198f6f6f9b4cdbd
	.xword	0xcea6eb01a4bf9681
	.xword	0xee7a186e2a5ed34e
	.xword	0xa3054b7a14cf15ed
	.xword	0x641e00c59d5a56f1
	.xword	0x51015c2d1eae587d
	.xword	0xe51b280d3204567f
	.xword	0x62c1aadcebdb0392
	.xword	0x7c7205346289ebc6
	.xword	0xe8fe059ee89f247f
	.xword	0x64de602c5caa8550
	.xword	0xaf383d90227fbf01
	.xword	0x01241c6757bf50fe
	.xword	0x43eb9688f28092b9
	.xword	0x96473c2fb39626eb
	.xword	0x78b1afd1bb895921
	.xword	0xb3b61a881522371a
	.xword	0x656573c3154b67b3
	.xword	0x16e5004ccab71f5b
	.xword	0x57994d171d07d41e
	.xword	0xeaf2ec9e5dd0e510
	.xword	0x30aeb22fcf181aea
	.xword	0x377fd8b753af3431
	.xword	0x4b91ea9ebf3061d6
	.xword	0xbbe3914eb420a925
	.xword	0xaeaf32d72a0345a2
	.xword	0xefd3d441969d787e
	.xword	0x8e81363eca1497aa
	.xword	0x28568250cdd5871e
	.xword	0x6f1cb1ee4eb31b09
	.xword	0xd0ffd4ee65351fbc
	.xword	0x2c2a267b26ec57fd
	.xword	0x51670adff08d6a1b
	.xword	0x705ecd3140685b99
	.xword	0xa349429924448009
	.xword	0x3a97547fd5bfc1a7
	.xword	0x03c3a9f7b7ab260b
	.xword	0xb3a2fd3fb10b62b7
	.xword	0x1cbb514364edc1f1
	.xword	0x50bd9ac303cc04fb
	.xword	0xb76a59ef1323ca3f
	.xword	0xd9ef9e4296cd93b5
	.xword	0x9fe960dad7d8697b
	.xword	0x5d665d497bd68ff7
	.xword	0xf80557b752e2593d
	.xword	0x582f608b5dc1aac9
	.xword	0x182dca6a0c9a68c2
	.xword	0x0838daa91923adff
	.xword	0x4c5c7a786c58e201
	.xword	0x39b25fe7f6652b82
	.xword	0xa10f7a40d4e24e6b
	.xword	0x4e7a2c6e27df4fd7
	.xword	0x096f81a21dfd3541
	.xword	0x2a4fdf5faaa9e4e4
	.xword	0x959894c0539ac789
	.xword	0x3ea7503fe2323382
	.xword	0x8d777db092b5c363
	.xword	0xdd47d18a3983a268
	.xword	0x1fac7f1d6d005f73
	.xword	0x93fcaa51e98a4bc4
	.xword	0x9174e5c0f0d767e1
	.xword	0x2c0a95efb773d0fb
	.xword	0x3ff3a8d5e14a0163
	.xword	0xc1ed190a86c789e6
	.xword	0x14b53153bef04233
	.xword	0x81e5c9e9d6ed4332
	.xword	0xebe4e7e381643cc3
	.xword	0x3f5451b7ad53abe4
	.xword	0xfcf2b4695c295702
	.xword	0x4d33bdd2cd206711
	.xword	0x3ffaf01fb3105f91
	.xword	0x3d32616558e6326b
	.xword	0x34edc803559e3953
	.xword	0x3f35cb12d5cc5441
	.xword	0x1ba55efe4326c430
	.xword	0xaed6c13b1da87b7f
	.xword	0xa90cbc17e4405986
	.xword	0x070d17002c21cadf
	.xword	0xe52eddb83ad27bb0
	.xword	0xc195c603b6ea7a7f
	.xword	0xf42c6ad8046cab23
	.xword	0x42795797ffc98605
	.xword	0x61cdbb69f6f76de3
	.xword	0x46a21466a48776c3
	.xword	0xa5dcd8a46ed558da
	.xword	0x7f16aeca3b2e0b85
	.xword	0xf19ec643cc00d8d6
	.xword	0x720c2b4b8551392c
	.xword	0x9cffb0c0492c0df2
	.xword	0xa352a1e6f2443314
	.xword	0x0609910f66ed0c1b
	.xword	0x483e7da1e9b9284d
	.xword	0xcab2476105b2a6a0
	.xword	0x3e2a956cf8a413f0
	.xword	0xe17d9239e8b6377b
	.xword	0xac88cc0da4a3ca26
	.xword	0xe8debac172dc4d2a
	.xword	0xe6288d14c7a4798b
	.xword	0x9e35d6d90ad5c9eb
	.xword	0x310bdfbcf7ee1d4a
	.xword	0x140c6315ef391374
	.xword	0x53f6db70d7ed8070
	.xword	0x44b3aa9cc94af85e
	.xword	0x4843f958a36e22bb
	.xword	0x273df5a83f7a8207
	.xword	0xbd040b1e27fcfe35
	.xword	0x8183600d1c817e3e
	.xword	0x48c8a0e192f64fc4
	.xword	0xf1e26b24d1c58f5d
	.xword	0x858bfade7b58f907
	.xword	0x29e1641a46d8617e
	.xword	0x9c27fd76f5fef242
	.xword	0x89680ebb110e53af
	.xword	0x81611ca69979fe03
	.xword	0xd527d137d04a0e51
	.xword	0xeb472e06e3e8364e
	.xword	0xad82cfe5270058a8
	.xword	0x419893877ab020fc
	.xword	0x43789bc4133c9736
	.xword	0xe6a2491f802d06ba
	.xword	0xa714dfd16be18941
	.xword	0x44b6501b15f461fe
	.xword	0x291be31aab50261c
	.xword	0xc5afbcc52ed2e45e
	.xword	0x51ecc7e93a2e641c
	.xword	0x9fa126568b4f2402
	.xword	0x51158dbbc475b7b3
	.xword	0xf778b9838b513b9e
	.xword	0x7dad1a5052d1223d
	.xword	0xf253f450bfcaf3a1
	.xword	0x24dc65f56046128b
	.xword	0x9866ff8098023f42
	.xword	0xceec18a49875634c
	.xword	0xbac6aaf9c65b8c15
	.xword	0xc24c175e70246fd9
	.xword	0x42eacf1171738277
	.xword	0x7879dd0f0fdba427
	.xword	0xe18fe0a874caa0d3
	.xword	0x19785459fe1aa0da
	.xword	0x6ea074d62de95820
	.xword	0x81829f2a5cf86afb
	.xword	0x68e33ec778185b45
	.xword	0xe0b9ad689932f522

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
	TTE_CP	 = 0,
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
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
	TTE_W	 = 0,
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
	TTE_Size	 = 0,
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


attr_data {
	Name	 = .MyDATA_0,
	RA	 = 0x0000000170100000,
	PA	 = ra2pa(0x0000000170100000,0),
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
	.xword	0xca284d3a64b556f2
	.xword	0xa2c79d0fc5782815
	.xword	0xecb3732de43d69c4
	.xword	0xc67dfc5f871af7b5
	.xword	0x31c7547f63873a65
	.xword	0x860ad761d65604d4
	.xword	0x05deb18b68996258
	.xword	0xe4bf5de864c7f207
	.xword	0x7e4c721a3069c5c1
	.xword	0xfc3bddd9c376b496
	.xword	0x59f0ada3219e6701
	.xword	0xa6a4a6f1300d1e3e
	.xword	0x5fb565f71c1d5674
	.xword	0xab0b294a2b27dcd7
	.xword	0x42ccfa45b4ec9a2e
	.xword	0x1bdfb5d061d3c617
	.xword	0x16b53bdd427eef79
	.xword	0x74ef17cbf15bfac8
	.xword	0xbce567f7cd4724c6
	.xword	0xe045a8a5caca2eca
	.xword	0xb38493401a00c4c2
	.xword	0xc033e77755d04c7b
	.xword	0x063da9a4b423efe5
	.xword	0xbfd7904a3b2219d9
	.xword	0x09388ea7c5583211
	.xword	0xda1d794167f061a6
	.xword	0xe077b5a6ba20c7d1
	.xword	0x83238cb6611073b0
	.xword	0xb235096f350b895a
	.xword	0x3c967d224c7c375c
	.xword	0x89ddfa7654f21e5a
	.xword	0x13b761c601b064b2



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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
	TTE_Size	 = 1,
	TTE_NFO	 = 1,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	.xword	0xdeb0c4bab33237f3
	.xword	0x3df5b50228e176b1
	.xword	0x0d0101a6fbdc8be0
	.xword	0x4a0d0822ab310d97
	.xword	0xde05fae4b1d4a2a2
	.xword	0x633b29b354ed8b26
	.xword	0x5a66e17827a987c6
	.xword	0xc38fd9c7bc13aa8c
	.xword	0x4981c6838c6c2d0f
	.xword	0xf8aca712ae668f58
	.xword	0x9f6fc46144939364
	.xword	0xa195cf68ea8ddbf6
	.xword	0x86ca0dd7cdceea04
	.xword	0x0ba83bfe0ca46be1
	.xword	0x0ae91d9a9e8d700b
	.xword	0x561196db5c534e7b
	.xword	0x775a9b0a8eceab7c
	.xword	0x9075f9b94b495798
	.xword	0x5f80705df26f3de2
	.xword	0x471fdfaf889ee875
	.xword	0xa450ad3044db5fb1
	.xword	0x45ac4676dd4da732
	.xword	0xfb8021a8d571a9fb
	.xword	0x990c402ce49e2856
	.xword	0x2437fd7339ba92db
	.xword	0x7f3c823fed3540ce
	.xword	0x2fd7002178b9fc93
	.xword	0x1e9d4cdb1b5149e8
	.xword	0x35e92ebe3d49bf4b
	.xword	0x851022cf28a253d3
	.xword	0x117ae3d44359d2fd
	.xword	0xe87fb5bcb3223af5



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
	.xword	0xaf8fbd0bc9b1fd84
	.xword	0xbf145d66dcf463e4
	.xword	0xaa7df9885fd95710
	.xword	0xbb3ec882e1cb8bfd
	.xword	0x719e0a72189d3eb3
	.xword	0x0f25172b906a3ef3
	.xword	0x80bf0c9d896b3236
	.xword	0xd6be08a7d81014d8
	.xword	0xef7e507ddd8afa2f
	.xword	0xc210b4bed9794c60
	.xword	0xdd89c7c32246f49c
	.xword	0xa37bb24c4e87d1cb
	.xword	0xc7380ed189bcf6f8
	.xword	0x20c0326471811d33
	.xword	0x39d25b4ab2dc6b06
	.xword	0xaee2166058264e41
	.xword	0x2df1b411333c29aa
	.xword	0xddbd0384d159385a
	.xword	0xbe89c0ec4741c1cf
	.xword	0xce6d72c045785f32
	.xword	0x9d53e611ec24ea6f
	.xword	0x5d0976c090c101b7
	.xword	0xda094414992d7991
	.xword	0xebce2607533512bb
	.xword	0xcac8efdd328cce21
	.xword	0xc93863b8448e238c
	.xword	0x9d868affd76d7c70
	.xword	0xaa89341f9677847d
	.xword	0x6829ce00d59e2120
	.xword	0xd92961e2dd29e58a
	.xword	0x96b8c33d029ab3e7
	.xword	0xdec77343df1e5bf4



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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	TTE_Size	 = 3,
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
	.xword	0x819f79378ce0d5ab
	.xword	0x6d4052498cf634b8
	.xword	0x4b6244c53e7c4a5d
	.xword	0x0e4c8087e38f2f2e
	.xword	0x9bce351a6f478b52
	.xword	0x04c53c6e269f33d8
	.xword	0x8e64b560f80744bd
	.xword	0x8782c3853f24ac50
	.xword	0xde99283f9a2d680e
	.xword	0x4369d9e9ee9ac013
	.xword	0xcd55be343dbf3af4
	.xword	0xe448670a9bf17784
	.xword	0x68d7903bf7170ba8
	.xword	0x503dbd6d8115e9ed
	.xword	0x8c56e34f05fbb79f
	.xword	0x9d29638e122c00b3
	.xword	0xa6cdc4662f64157d
	.xword	0xaba735264a1d0a32
	.xword	0x53542d305f69473e
	.xword	0x2300ae2bbf4b8e45
	.xword	0x5cf373ab307b3342
	.xword	0x3245e9dfefcd6903
	.xword	0xf764f78580f25707
	.xword	0x1b845510e722eee0
	.xword	0xc5f3ac1b3590da9a
	.xword	0xc79a6fd48fc758f4
	.xword	0x6a542f62ddf59241
	.xword	0x0f9164a93b668a99
	.xword	0x2c618ce787b3842d
	.xword	0x45787f16cd2785ea
	.xword	0xc0f467abb8962462
	.xword	0x963ec4781ca1b30d





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
nuff_said_0:
	fdivd %f0, %f4, %f8
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
	TTE_W	 = 0
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f6
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
	TTE_Size	 = 3,
	TTE_NFO	 = 0,
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f6
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
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f4
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f8





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
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	TTE_Size	 = 3,
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
