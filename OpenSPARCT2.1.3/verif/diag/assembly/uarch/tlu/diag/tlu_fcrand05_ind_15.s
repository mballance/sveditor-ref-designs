/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_fcrand05_ind_15.s
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
	mov 0x34, %r14
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
	mov 0x30, %r14
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
	mov 0xb2, %r14
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
	mov 0xb0, %r14
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
	.word 0xc36fe1eb  ! 1: PREFETCH_I	prefetch	[%r31 + 0x01eb], #one_read
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
    setx 0xc7ff2d486581d478, %r1, %r28
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
splash_lsu_80_0:
	nop
	ta T_CHANGE_HPRIV
	set 0x7030b4a6, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_80_1:
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
ibp_startwait80_1:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_1
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_1:
    brnz %r16, ibp_wait80_1
    ld [%r23], %r16
    ba ibp_startwait80_1
    mov 0x80, %r16
continue_ibp_80_1:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_1:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_1
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_1:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_1
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_1:
    best_set_reg(0x00000040c9c00097,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe040  ! 1: LDDFA_I	ldda	[%r31, 0x0040], %f0
splash_lsu_80_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xfba2e3dd, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xa4b3eeb6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e060  ! 4: STX_I	stx	%r17, [%r31 + 0x0060]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x93d020b4  ! 6: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_tick_80_4:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x6c9acb8405f1bea3, %r16, %r17)
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_80_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe2800c20  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0xe23fc000  ! 10: STD_R	std	%r17, [%r31 + %r0]
splash_hpstate_80_7:
	ta T_CHANGE_NONHPRIV
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x819835cd  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15cd, %hpstate
	.word 0x9ba409a1  ! 12: FDIVs	fdivs	%f16, %f1, %f13
	.word 0xd48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	setx 0x4f1ed9c7108ca24d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_80_10:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d84a00  ! 15: LDXA_R	ldxa	[%r1, %r0] 0x50, %r10
ibp_80_11:
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
ibp_startwait80_11:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_11
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_11:
    brnz %r16, ibp_wait80_11
    ld [%r23], %r16
    ba ibp_startwait80_11
    mov 0x80, %r16
continue_ibp_80_11:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_11:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_11
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_11:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_11
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_11:
    best_set_reg(0x00000040e7c0976f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x91a0c9b3  ! 16: FDIVs	fdivs	%f3, %f19, %f8
	.word 0xe69fc380  ! 17: LDDA_R	ldda	[%r31, %r0] 0x1c, %r19
brcommon3_80_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e0c0  ! 1: STQF_I	-	%f19, [0x00c0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe71fe1d0  ! 18: LDDF_I	ldd	[%r31, 0x01d0], %f19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_80_13:
	.word 0x8198319d  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x119d, %hpstate
intveclr_80_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdcec39f8249a4419, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_80_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_15
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
cwq_80_15:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 22: RDPC	rd	%pc, %r19
	.word 0xd8d7e0c0  ! 23: LDSHA_I	ldsha	[%r31, + 0x00c0] %asi, %r12
	.word 0xe19fda00  ! 24: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_16) + 32, 16, 16)) -> intp(0,0,5)
#else
	setx 0x691813c27f2b41c8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_80_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb182c004  ! 28: WR_STICK_REG_R	wr	%r11, %r4, %-
	.word 0xd877e150  ! 29: STX_I	stx	%r12, [%r31 + 0x0150]
tagged_80_18:
	tsubcctv %r12, 0x1fa8, %r19
	.word 0xd807e03c  ! 30: LDUW_I	lduw	[%r31 + 0x003c], %r12
splash_tick_80_19:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x7d443303f193c292, %r16, %r17)
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_80_20:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d04b60  ! 32: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r12
fpinit_80_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 33: FDIVd	fdivd	%f0, %f4, %f6
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
    brnz %r10, cwq_80_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_22
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
cwq_80_22:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 34: RDPC	rd	%pc, %r16
jmptr_80_23:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_24:
	rd %pc, %r12
	add %r12, (donretarg_80_24-donret_80_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00621000 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf47, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_24:
	.word 0xd66fe12f  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x012f]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_25:
	rd %pc, %r12
	add %r12, (donretarg_80_25-donret_80_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006a0600 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f15, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_25:
	.word 0x3d400001  ! 37: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
fpinit_80_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 38: FDIVs	fdivs	%f0, %f4, %f4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_80_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d92c013  ! 41: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
ibp_80_28:
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
ibp_startwait80_28:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_28
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_28:
    brnz %r16, ibp_wait80_28
    ld [%r23], %r16
    ba ibp_startwait80_28
    mov 0x80, %r16
continue_ibp_80_28:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_28:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_28
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_28:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_28
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_28:
    best_set_reg(0x00000040cfd76f0c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc014  ! 42: LDDF_R	ldd	[%r31, %r20], %f11
fpinit_80_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 43: FDIVs	fdivs	%f0, %f4, %f4
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
    brnz %r10, cwq_80_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_30
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
cwq_80_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 44: RDPC	rd	%pc, %r18
	.word 0xe4dfe0d0  ! 45: LDXA_I	ldxa	[%r31, + 0x00d0] %asi, %r18
	.word 0x87a84a52  ! 46: FCMPd	fcmpd	%fcc<n>, %f32, %f18
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
    best_set_reg(0x0000004015ef0ce8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa3b48485  ! 47: FCMPLE32	fcmple32	%d18, %d36, %r17
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
	.word 0xe5e7e00a  ! 48: CASA_R	casa	[%r31] %asi, %r10, %r18
change_to_randtl_80_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfdc00  ! 50: STDFA_R	stda	%f16, [%r0, %r31]
pmu_80_35:
	nop
	setx 0xfffffdfdfffff2cd, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_36:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 52: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_37:
	rd %pc, %r12
	add %r12, (donretarg_80_37-donret_80_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004b6000 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd95, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_37:
	.word 0xe4ffe15d  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x015d] %asi
	.word 0xa5508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_80_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1b0  ! 1: STXFSR_I	st-sfr	%f1, [0x01b0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a2c9d2  ! 55: FDIVd	fdivd	%f42, %f18, %f50
trapasi_80_39:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c04980  ! 56: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_80_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00c  ! 57: CASA_R	casa	[%r31] %asi, %r12, %r12
	.word 0xd83fc000  ! 58: STD_R	std	%r12, [%r31 + %r0]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_42:
	rd %pc, %r12
	add %r12, (donretarg_80_42-donret_80_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0071b000 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x24cd0001  ! 1: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	retry
donretarg_80_42:
	.word 0xd86fe131  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x0131]
	.word 0x97a489ac  ! 60: FDIVs	fdivs	%f18, %f12, %f11
splash_hpstate_80_44:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8198354f  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x154f, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_45:
	rd %pc, %r12
	add %r12, (donretarg_80_45-donret_80_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001db900 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa4d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_45:
	.word 0x27400001  ! 62: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xe0c7e020  ! 63: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
trapasi_80_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0c84e60  ! 64: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r16
jmptr_80_47:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_48:
	nop
	setx 0xfffffaa1fffffb26, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_80_49:
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
ibp_startwait80_49:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_49
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_49:
    brnz %r16, ibp_wait80_49
    ld [%r23], %r16
    ba ibp_startwait80_49
    mov 0x80, %r16
continue_ibp_80_49:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_49:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_49
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_49:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_49
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_49:
    best_set_reg(0x0000004000cce802,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9f802190  ! 67: SIR	sir	0x0190
fpinit_80_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 68: FDIVs	fdivs	%f0, %f4, %f8
splash_tba_80_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800ae0  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r16
	.word 0xa17038f0  ! 72: POPC_I	popc	0x18f0, %r16
	.word 0xd48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
fpinit_80_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 74: FDIVd	fdivd	%f0, %f4, %f8
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
    brnz %r10, cwq_80_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_54
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
cwq_80_54:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 75: RDPC	rd	%pc, %r8
cmp_80_55:
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
cmp_startwait80_55:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_55
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_55:
    brnz,a %r10, cmp_wait80_55
    ld [%r23], %r10
    ba cmp_startwait80_55
    mov 0x80, %r10
continue_cmp_80_55:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_55
    mov 0x6b, %r17
    best_set_reg(0xf41a1a79d922006d, %r16, %r17)
cmp_multi_core_80_55:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91920009  ! 76: WRPR_PIL_R	wrpr	%r8, %r9, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_56) + 24, 16, 16)) -> intp(4,0,0)
#else
	setx 0x1a3a2bbd98cd655c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0x290b7689cabf06e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe011  ! 79: STDA_I	stda	%r11, [%r31 + 0x0011] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_80_58:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 81: RDTICK	rd	%tick, %r17
brcommon3_80_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe170  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0170]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd71fe1e0  ! 82: LDDF_I	ldd	[%r31, 0x01e0], %f11
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
jmptr_80_60:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x9e1e5c263ed5421c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x93414000  ! 86: RDPC	rd	%pc, %r9
	.word 0xe2800b00  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
ibp_80_63:
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
ibp_startwait80_63:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_63
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_63:
    brnz %r16, ibp_wait80_63
    ld [%r23], %r16
    ba ibp_startwait80_63
    mov 0x80, %r16
continue_ibp_80_63:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_63:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_63
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_63:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_63
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_63:
    best_set_reg(0x0000004083e8020d,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fe040  ! 88: LDDFA_I	ldda	[%r31, 0x0040], %f16
ibp_80_64:
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
ibp_startwait80_64:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_64
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_64:
    brnz %r16, ibp_wait80_64
    ld [%r23], %r16
    ba ibp_startwait80_64
    mov 0x80, %r16
continue_ibp_80_64:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_64:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_64
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_64:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_64
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_64:
    best_set_reg(0x00000040b5c20da5,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe31fe0d0  ! 89: LDDF_I	ldd	[%r31, 0x00d0], %f17
jmptr_80_65:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe162  ! 91: STB_I	stb	%r17, [%r31 + 0x0162]
	.word 0xc19fde00  ! 92: LDDFA_R	ldda	[%r31, %r0], %f0
splash_tick_80_66:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x77f289edbc5c8786, %r16, %r17)
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c02b  ! 94: CASA_I	casa	[%r31] 0x 1, %r11, %r17
	setx 0x20ea68bf6fef8fb0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_80_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d92c00a  ! 97: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
fpinit_80_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 98: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa190200d  ! 99: WRPR_GL_I	wrpr	%r0, 0x000d, %-
mondo_80_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 100: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_71:
	ta	T_CHANGE_NONHPRIV	! macro
splash_tick_80_72:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x49c123958a8eba26, %r16, %r17)
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 103: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_80_73:
	ta T_CHANGE_NONHPRIV
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x819836b5  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16b5, %hpstate
splash_hpstate_80_74:
	ta T_CHANGE_NONHPRIV
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	.word 0x8198389d  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x189d, %hpstate
cmp_80_75:
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
cmp_startwait80_75:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_75
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_75:
    brnz,a %r10, cmp_wait80_75
    ld [%r23], %r10
    ba cmp_startwait80_75
    mov 0x80, %r10
continue_cmp_80_75:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_75
    mov 0xce, %r17
    best_set_reg(0x15378feeee0ad93c, %r16, %r17)
cmp_multi_core_80_75:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9194c010  ! 106: WRPR_PIL_R	wrpr	%r19, %r16, %pil
trapasi_80_76:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2c04b40  ! 107: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r17
mondo_80_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d920001  ! 108: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
dvapa_80_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0x97e, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5a1c9d0  ! 109: FDIVd	fdivd	%f38, %f16, %f18
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
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
    best_set_reg(0x0000005008cda553,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe71fe0c0  ! 111: LDDF_I	ldd	[%r31, 0x00c0], %f19
splash_lsu_80_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x1c2134bb, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_80_81:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_80_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd30adb5c17b37dc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb8635350486402b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 116: WRPR_GL_I	wrpr	%r0, 0x0005, %-
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
    brnz %r10, cwq_80_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_84
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
cwq_80_84:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 117: RDPC	rd	%pc, %r9
fpinit_80_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 118: FCMPd	fcmpd	%fcc<n>, %f0, %f4
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
    best_set_reg(0x0000005006e55359,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd31fe070  ! 119: LDDF_I	ldd	[%r31, 0x0070], %f9
	setx 0x11495e0cdec2bb9d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_88) + 0, 16, 16)) -> intp(0,0,16)
#else
	setx 0x2e83b9a978ff9b8b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tick_80_89:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xce97839a1f0dca6c, %r16, %r17)
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x99b2c4d1  ! 123: FCMPNE32	fcmpne32	%d42, %d48, %r12
mondo_80_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d90c012  ! 124: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x8d802004  ! 125: WRFPRS_I	wr	%r0, 0x0004, %fprs
ibp_80_92:
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
ibp_startwait80_92:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_92
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_92:
    brnz %r16, ibp_wait80_92
    ld [%r23], %r16
    ba ibp_startwait80_92
    mov 0x80, %r16
continue_ibp_80_92:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_92:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_92
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_92:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_92
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_92:
    best_set_reg(0x000000508bd35957,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3ecc02a  ! 126: PREFETCHA_R	prefetcha	[%r19, %r10] 0x01, #one_read
	.word 0x8d802004  ! 127: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 128: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91a509aa  ! 129: FDIVs	fdivs	%f20, %f10, %f8
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_80_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 131: FCMPLE32	fcmple32	%d0, %d4, %r8
intveclr_80_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb7d3e9af8fad6c99, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb50526e1a23d80d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x819f19acb4da980c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_80_98:
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
cmp_startwait80_98:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_98
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_98:
    brnz,a %r10, cmp_wait80_98
    ld [%r23], %r10
    ba cmp_startwait80_98
    mov 0x80, %r10
continue_cmp_80_98:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_98
    mov 0x97, %r17
    best_set_reg(0x289ccc438951c163, %r16, %r17)
cmp_multi_core_80_98:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91944005  ! 135: WRPR_PIL_R	wrpr	%r17, %r5, %pil
cmp_80_99:
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
cmp_startwait80_99:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_80_99
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait80_99:
    brnz,a %r10, cmp_wait80_99
    ld [%r23], %r10
    ba cmp_startwait80_99
    mov 0x80, %r10
continue_cmp_80_99:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_80_99
    mov 0x78, %r17
    best_set_reg(0xfa96086abacd60b6, %r16, %r17)
cmp_multi_core_80_99:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a0016a  ! 136: FABSq	dis not found

mondo_80_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d944012  ! 137: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
splash_cmpr_80_101:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 138: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc32fc000  ! 139: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_80_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc7db102bf261e2d3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa78530e0  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x10e0, %-
	.word 0x91d020b5  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 181
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
    mov 6, %r17
    best_set_reg(0x195992ac7133d30b, %r16, %r17)
cmp_multi_core_80_104:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x99a00170  ! 143: FABSq	dis not found

splash_cmpr_80_105:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 144: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_80_106:
    set user_data_start, %o7
	.word 0x93902004  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_80_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944009  ! 146: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
brcommon3_80_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe0f0  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x00f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe897c032  ! 147: LDUHA_R	lduha	[%r31, %r18] 0x01, %r20
ibp_80_109:
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
ibp_startwait80_109:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_109
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_109:
    brnz %r16, ibp_wait80_109
    ld [%r23], %r16
    ba ibp_startwait80_109
    mov 0x80, %r16
continue_ibp_80_109:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_109:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_109
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_109:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_109
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_109:
    best_set_reg(0x00000040c0d95790,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa1a449aa  ! 148: FDIVs	fdivs	%f17, %f10, %f16
trapasi_80_110:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 149: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
	setx 0xd9b28fd21a68638b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 151: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_80_113:
	nop
	ta T_CHANGE_HPRIV
	set 0x434acde1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_80_114:
	nop
	ta T_CHANGE_HPRIV
	set 0x772ea67f, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_115:
	nop
	setx 0xfffffda8fffffc77, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_116) + 56, 16, 16)) -> intp(5,0,17)
#else
	setx 0xa8d44594dc2c461c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa984c001  ! 157: WR_SET_SOFTINT_R	wr	%r19, %r1, %set_softint
	.word 0x95a409c6  ! 158: FDIVd	fdivd	%f16, %f6, %f10
	.word 0x9bb08593  ! 159: FCMPGT32	fcmpgt32	%d2, %d50, %r13
cerer_80_118:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x57582495ff4edd52, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_80_119:
	ta T_CHANGE_NONHPRIV
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x81983f9d  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f9d, %hpstate
	.word 0x8d90339e  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x139e, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc19fdb60  ! 164: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x8dac5c481152a52d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x00000040e5d79093,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfd920  ! 166: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_80_123:
	nop
	ta T_CHANGE_HPRIV
	set 0x4eb5b762, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_80_124:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_80_125:
	rd %pc, %r12
	add %r12, (donretarg_80_125-donret_80_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003b8500 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1bdb, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_80_125:
	.word 0x3a800001  ! 170: BCC	bcc,a	<label_0x1>
	.word 0xc19fe040  ! 171: LDDFA_I	ldda	[%r31, 0x0040], %f0
trapasi_80_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0884e60  ! 172: LDUBA_R	lduba	[%r1, %r0] 0x73, %r8
splash_tick_80_128:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x34d7dedc8c6def3b, %r16, %r17)
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_80_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 174: FDIVd	fdivd	%f0, %f4, %f8
splash_tick_80_130:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x123f23cb3496f922, %r16, %r17)
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e0fc  ! 176: STF_I	st	%f8, [0x00fc, %r31]
splash_tick_80_131:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xc560eced460ee0c5, %r16, %r17)
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e008  ! 178: STX_I	stx	%r8, [%r31 + 0x0008]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_132) + 56, 16, 16)) -> intp(1,0,30)
#else
	setx 0x29b2bc46f262fa4b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8780208a  ! 180: WRASI_I	wr	%r0, 0x008a, %asi
	setx 0xd62686ce7e4a868e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e1af  ! 182: STH_I	sth	%r8, [%r31 + 0x01af]
	.word 0xd0dfc034  ! 183: LDXA_R	ldxa	[%r31, %r20] 0x01, %r8
br_badelay2_80_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa5b04306  ! 184: ALIGNADDRESS	alignaddr	%r1, %r6, %r18
splash_tba_80_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_80_137:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe2d04a00  ! 186: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r17
ceter_80_138:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 187: RDTICK	rd	%tick, %r12
intveclr_80_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x932865ec282a38d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_80_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe310c00b  ! 1: LDQF_R	-	[%r3, %r11], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe080  ! 189: LDDFA_I	ldda	[%r31, 0x0080], %f16
trapasi_80_141:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6d84b40  ! 190: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r19
ibp_80_142:
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
ibp_startwait80_142:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_142
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_142:
    brnz %r16, ibp_wait80_142
    ld [%r23], %r16
    ba ibp_startwait80_142
    mov 0x80, %r16
continue_ibp_80_142:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_142:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_142
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_142:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_142
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_142:
    best_set_reg(0x0000004036d093ab,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa5b507d4  ! 191: PDIST	pdistn	%d20, %d20, %d18
	.word 0xd737e1b0  ! 192: STQF_I	-	%f11, [0x01b0, %r31]
splash_cmpr_80_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 193: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_80_144:
	tsubcctv %r16, 0x1910, %r17
	.word 0xd607e1a8  ! 194: LDUW_I	lduw	[%r31 + 0x01a8], %r11
	.word 0xa6ab4011  ! 195: ANDNcc_R	andncc 	%r13, %r17, %r19
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_80_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc7c99c3341c60889, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_80_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa44, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a1c9ca  ! 198: FDIVd	fdivd	%f38, %f10, %f12
ibp_80_147:
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
ibp_startwait80_147:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_147
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_147:
    brnz %r16, ibp_wait80_147
    ld [%r23], %r16
    ba ibp_startwait80_147
    mov 0x80, %r16
continue_ibp_80_147:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_147:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_147
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_147:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_80_147
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_147:
    best_set_reg(0x00000050c8d3ab9c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd83fe1c0  ! 199: STD_I	std	%r12, [%r31 + 0x01c0]
splash_tick_80_148:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x30f5a49016a185de, %r16, %r17)
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_80_149:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
cmpenall_80_150:
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
cmpenall_startwait80_150:
    mov 0x80, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_80_150
    nop
cmpenall_wait80_150:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait80_150
    nop
    ba,a cmpenall_startwait80_150
continue_cmpenall_80_150:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_80_150:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_80_150
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_80_150:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_80_150
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
splash_lsu_40_0:
	nop
	ta T_CHANGE_HPRIV
	set 0x936250c0, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_40_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0a0  ! 1: STDFA_I	stda	%f16, [0x00a0, %r31]
splash_lsu_40_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x25f8dbd1, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x17d237a3, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e034  ! 4: STX_I	stx	%r17, [%r31 + 0x0034]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x83d020b2  ! 6: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_40_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe2800c00  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
	.word 0xc30fc000  ! 10: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_hpstate_40_7:
	ta T_CHANGE_NONHPRIV
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x819828cd  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
	.word 0x87ac8a53  ! 12: FCMPd	fcmpd	%fcc<n>, %f18, %f50
	.word 0xd48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	setx 0xfbe593763ffa76cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_40_10:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4884a00  ! 15: LDUBA_R	lduba	[%r1, %r0] 0x50, %r10
ibp_40_11:
	nop
	.word 0xc3eac02a  ! 16: PREFETCHA_R	prefetcha	[%r11, %r10] 0x01, #one_read
	.word 0xe69fc380  ! 17: LDDA_R	ldda	[%r31, %r0] 0x1c, %r19
brcommon3_40_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e1f0  ! 1: STQF_I	-	%f19, [0x01f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe69fc02b  ! 18: LDDA_R	ldda	[%r31, %r11] 0x01, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_40_13:
	.word 0x81982507  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0507, %hpstate
intveclr_40_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4dc4390214bcd865, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_40_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_15
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
cwq_40_15:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 22: RDPC	rd	%pc, %r8
	.word 0xd8d7e028  ! 23: LDSHA_I	ldsha	[%r31, + 0x0028] %asi, %r12
	.word 0xe19fc3e0  ! 24: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_16) + 16, 16, 16)) -> intp(4,0,11)
#else
	setx 0xf24212a1b07a9edc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_40_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb1850007  ! 28: WR_STICK_REG_R	wr	%r20, %r7, %-
	.word 0xd877e0c8  ! 29: STX_I	stx	%r12, [%r31 + 0x00c8]
tagged_40_18:
	tsubcctv %r0, 0x16fa, %r8
	.word 0xd807e0b4  ! 30: LDUW_I	lduw	[%r31 + 0x00b4], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_40_20:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
fpinit_40_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 33: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
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
    brnz %r10, cwq_40_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_22
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
cwq_40_22:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 34: RDPC	rd	%pc, %r19
jmptr_40_23:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_24:
	rd %pc, %r12
	add %r12, (donretarg_40_24-donret_40_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007f8100 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e8e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_24:
	.word 0xd66fe018  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x0018]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_25:
	rd %pc, %r12
	add %r12, (donretarg_40_25-donret_40_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007faa00 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xddd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_25:
	.word 0x26800001  ! 37: BL	bl,a	<label_0x1>
fpinit_40_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 38: FDIVs	fdivs	%f0, %f4, %f4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_40_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91400c  ! 41: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
ibp_40_28:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd697c028  ! 42: LDUHA_R	lduha	[%r31, %r8] 0x01, %r11
fpinit_40_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 43: FDIVs	fdivs	%f0, %f4, %f6
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
    brnz %r10, cwq_40_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_30
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
cwq_40_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 44: RDPC	rd	%pc, %r19
	.word 0xe4dfe060  ! 45: LDXA_I	ldxa	[%r31, + 0x0060] %asi, %r18
iaw_40_31:
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
iaw_startwait40_31:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_31
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_31:
    brnz %r16, iaw_wait40_31
    ld [%r23], %r16
    ba iaw_startwait40_31
    mov 0x40, %r16
continue_iaw_40_31:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_31:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_31
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_31:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_31
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_31:
	mov 0x38, %r18
iaw4_40_31:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a4c9b0  ! 46: FDIVs	fdivs	%f19, %f16, %f19
ibp_40_32:
	nop
	.word 0x95a449b2  ! 47: FDIVs	fdivs	%f17, %f18, %f10
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
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 48: CASA_R	casa	[%r31] %asi, %r16, %r18
change_to_randtl_40_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc1bfdb60  ! 50: STDFA_R	stda	%f0, [%r0, %r31]
pmu_40_35:
	nop
	setx 0xfffffd3dfffff54e, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_36:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 52: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_37:
	rd %pc, %r12
	add %r12, (donretarg_40_37-donret_40_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b7da00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd0d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_37:
	.word 0xe4ffe00c  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x000c] %asi
	.word 0x91508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_40_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe100  ! 1: STXFSR_I	st-sfr	%f1, [0x0100, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93b187c3  ! 55: PDIST	pdistn	%d6, %d34, %d40
trapasi_40_39:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 56: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_40_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 57: CASA_R	casa	[%r31] %asi, %r9, %r12
	.word 0xd9e7c020  ! 58: CASA_I	casa	[%r31] 0x 1, %r0, %r12
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_42:
	rd %pc, %r12
	add %r12, (donretarg_40_42-donret_40_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00617200 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d0b, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x26ccc001  ! 1: BRLZ	brlz,a,pt	%r19,<label_0xcc001>
	retry
donretarg_40_42:
	.word 0xd86fe192  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x0192]
	.word 0xc3ea802b  ! 60: PREFETCHA_R	prefetcha	[%r10, %r11] 0x01, #one_read
splash_hpstate_40_44:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81983714  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1714, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_45:
	rd %pc, %r12
	add %r12, (donretarg_40_45-donret_40_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00528200 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d9b, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	done
donretarg_40_45:
	.word 0x25400001  ! 62: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0c7e160  ! 63: LDSWA_I	ldswa	[%r31, + 0x0160] %asi, %r16
trapasi_40_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0904e60  ! 64: LDUHA_R	lduha	[%r1, %r0] 0x73, %r16
jmptr_40_47:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_48:
	nop
	setx 0xfffff486fffffaf4, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_49:
	nop
	.word 0xe09fc02d  ! 67: LDDA_R	ldda	[%r31, %r13] 0x01, %r16
fpinit_40_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 68: FCMPLE32	fcmple32	%d0, %d4, %r4
splash_tba_40_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe08008a0  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
iaw_40_52:
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
iaw_startwait40_52:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_52
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_52:
    brnz %r16, iaw_wait40_52
    ld [%r23], %r16
    ba iaw_startwait40_52
    mov 0x40, %r16
continue_iaw_40_52:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_52:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_52
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_52:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_52
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_52:
	mov 0x38, %r18
iaw2_40_52:
	rdpr %tba, %r19
	mov 0x221,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3eac031  ! 72: PREFETCHA_R	prefetcha	[%r11, %r17] 0x01, #one_read
	.word 0xd4800aa0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
fpinit_40_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e838fc  ! 74: PREFETCHA_I	prefetcha	[%r0, + 0xfffff8fc] %asi, #one_read
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
    brnz %r10, cwq_40_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_54
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
cwq_40_54:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 75: RDPC	rd	%pc, %r11
	.word 0x91918007  ! 76: WRPR_PIL_R	wrpr	%r6, %r7, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_56) + 8, 16, 16)) -> intp(7,0,22)
#else
	setx 0x5580c9a66e2d7519, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0x078e48fe4550a1a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe07e  ! 79: STDA_I	stda	%r11, [%r31 + 0x007e] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_40_58:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 81: RDTICK	rd	%tick, %r12
brcommon3_40_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe060  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0060]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6dfc029  ! 82: LDXA_R	ldxa	[%r31, %r9] 0x01, %r11
	.word 0xd6800b40  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
jmptr_40_60:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x2ed6eccf3309c14d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
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
	.word 0x91414000  ! 86: RDPC	rd	%pc, %r8
	.word 0xe2800c00  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
ibp_40_63:
	nop
	.word 0xe1bfdc00  ! 88: STDFA_R	stda	%f16, [%r0, %r31]
ibp_40_64:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe23fe170  ! 89: STD_I	std	%r17, [%r31 + 0x0170]
jmptr_40_65:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe14e  ! 91: STB_I	stb	%r17, [%r31 + 0x014e]
	.word 0xe19fdb60  ! 92: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c029  ! 94: CASA_I	casa	[%r31] 0x 1, %r9, %r17
	setx 0x0ae668796717d539, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_40_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 97: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
fpinit_40_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e838fc  ! 98: PREFETCHA_I	prefetcha	[%r0, + 0xfffff8fc] %asi, #one_read
	.word 0xa190200b  ! 99: WRPR_GL_I	wrpr	%r0, 0x000b, %-
mondo_40_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d950013  ! 100: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 103: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_40_73:
	ta T_CHANGE_NONHPRIV
	.word 0x26cc8001  ! 1: BRLZ	brlz,a,pt	%r18,<label_0xc8001>
	.word 0x81983cd9  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd9, %hpstate
splash_hpstate_40_74:
	ta T_CHANGE_NONHPRIV
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8198241f  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041f, %hpstate
	.word 0x91940009  ! 106: WRPR_PIL_R	wrpr	%r16, %r9, %pil
trapasi_40_76:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2884b40  ! 107: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r17
mondo_40_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 108: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
dvapa_40_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbcd, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac0a50  ! 109: FCMPd	fcmpd	%fcc<n>, %f16, %f16
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
ibp_40_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc031  ! 111: STDA_R	stda	%r19, [%r31 + %r17] 0x01
splash_lsu_40_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xbf75df30, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_40_81:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_40_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0x129af77259145d8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8779259e69d4e36b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 116: WRPR_GL_I	wrpr	%r0, 0x0008, %-
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
    brnz %r10, cwq_40_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_84
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
cwq_40_84:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 117: RDPC	rd	%pc, %r12
fpinit_40_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 118: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ibp_40_86:
	nop
	.word 0xd31fc012  ! 119: LDDF_R	ldd	[%r31, %r18], %f9
	setx 0x189aec28c6ebad25, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_88) + 56, 16, 16)) -> intp(6,0,16)
#else
	setx 0xd9e61c95a2f03103, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x9bb404d4  ! 123: FCMPNE32	fcmpne32	%d16, %d20, %r13
mondo_40_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d930005  ! 124: WRPR_WSTATE_R	wrpr	%r12, %r5, %wstate
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
ibp_40_92:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3b40494  ! 126: FCMPLE32	fcmple32	%d16, %d20, %r17
	.word 0x8d802004  ! 127: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa5a149b3  ! 129: FDIVs	fdivs	%f5, %f19, %f18
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_40_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 131: FCMPLE32	fcmple32	%d0, %d4, %r8
intveclr_40_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0xec466caa0462415f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0x01426cd7764a228f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x3a700460d1da9f09, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9194c012  ! 135: WRPR_PIL_R	wrpr	%r19, %r18, %pil
	.word 0xa1a00174  ! 136: FABSq	dis not found

mondo_40_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d924010  ! 137: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
splash_cmpr_40_101:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 138: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc32fc000  ! 139: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_40_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1e68394873cf2534, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa782e08f  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x008f, %-
	.word 0x83d020b4  ! 142: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xa7a00171  ! 143: FABSq	dis not found

splash_cmpr_40_105:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 144: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_40_106:
    set user_data_start, %o7
	.word 0x93902000  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_40_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950011  ! 146: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
brcommon3_40_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe130  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0130]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe83fe040  ! 147: STD_I	std	%r20, [%r31 + 0x0040]
ibp_40_109:
	nop
	.word 0xc3ec802d  ! 148: PREFETCHA_R	prefetcha	[%r18, %r13] 0x01, #one_read
trapasi_40_110:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 149: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
	setx 0xb1c4310a51440d6f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 151: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_40_113:
	nop
	ta T_CHANGE_HPRIV
	set 0x99c6f028, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_40_114:
	nop
	ta T_CHANGE_HPRIV
	set 0x970eee2c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_115:
	nop
	setx 0xfffff8abfffff176, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_116) + 8, 16, 16)) -> intp(4,0,0)
#else
	setx 0x81cf3dbc13be8fea, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa984000a  ! 157: WR_SET_SOFTINT_R	wr	%r16, %r10, %set_softint
iaw_40_117:
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
iaw_startwait40_117:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_117
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_117:
    brnz %r16, iaw_wait40_117
    ld [%r23], %r16
    ba iaw_startwait40_117
    mov 0x40, %r16
continue_iaw_40_117:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_117:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_117
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_117:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_117
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_117:
	mov 0x38, %r18
iaw3_40_117:
	setx vahole_target1, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9bb40484  ! 158: FCMPLE32	fcmple32	%d16, %d4, %r13
	.word 0x91b0c583  ! 159: FCMPGT32	fcmpgt32	%d34, %d34, %r8
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_40_119:
	ta T_CHANGE_NONHPRIV
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x81983f4c  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f4c, %hpstate
	.word 0x8d902cef  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x0cef, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe19fdf20  ! 164: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x804dafbdb802c7f5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_40_122:
	nop
	.word 0xe1bfe040  ! 166: STDFA_I	stda	%f16, [0x0040, %r31]
splash_lsu_40_123:
	nop
	ta T_CHANGE_HPRIV
	set 0x98c5ffdd, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_40_124:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_40_125:
	rd %pc, %r12
	add %r12, (donretarg_40_125-donret_40_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00094700 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x26cac001  ! 1: BRLZ	brlz,a,pt	%r11,<label_0xac001>
	done
donretarg_40_125:
	.word 0x2b400001  ! 170: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
iaw_40_126:
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
iaw_startwait40_126:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_126
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_126:
    brnz %r16, iaw_wait40_126
    ld [%r23], %r16
    ba iaw_startwait40_126
    mov 0x40, %r16
continue_iaw_40_126:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_126:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_126
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_126:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_126
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_126:
	mov 0x38, %r18
iaw4_40_126:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe1e0  ! 171: LDDFA_I	ldda	[%r31, 0x01e0], %f16
trapasi_40_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0884e60  ! 172: LDUBA_R	lduba	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_40_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 174: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e079  ! 176: STF_I	st	%f8, [0x0079, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e0c8  ! 178: STX_I	stx	%r8, [%r31 + 0x00c8]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_132) + 32, 16, 16)) -> intp(3,0,4)
#else
	setx 0x1084dbd5eb6f9289, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 180: WRASI_I	wr	%r0, 0x0055, %asi
	setx 0x4558910f9a108296, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e1dd  ! 182: STH_I	sth	%r8, [%r31 + 0x01dd]
iaw_40_134:
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
iaw_startwait40_134:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_134
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_134:
    brnz %r16, iaw_wait40_134
    ld [%r23], %r16
    ba iaw_startwait40_134
    mov 0x40, %r16
continue_iaw_40_134:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_134:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_40_134
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_134:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_40_134
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_134:
	mov 0x38, %r18
iaw4_40_134:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc011  ! 183: STXFSR_R	st-sfr	%f1, [%r17, %r31]
br_badelay2_40_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x95b4c30c  ! 184: ALIGNADDRESS	alignaddr	%r19, %r12, %r10
splash_tba_40_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_40_137:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe2d04a00  ! 186: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r17
ceter_40_138:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 187: RDTICK	rd	%tick, %r9
intveclr_40_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7ce2610323e7410f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_40_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe000  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0000], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfda00  ! 189: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_40_141:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6c84b40  ! 190: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r19
ibp_40_142:
	nop
	.word 0xa1b4c7c9  ! 191: PDIST	pdistn	%d50, %d40, %d16
	.word 0xd737e080  ! 192: STQF_I	-	%f11, [0x0080, %r31]
splash_cmpr_40_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 193: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_40_144:
	tsubcctv %r9, 0x115b, %r16
	.word 0xd607e0a0  ! 194: LDUW_I	lduw	[%r31 + 0x00a0], %r11
	.word 0x98a84011  ! 195: ANDNcc_R	andncc 	%r1, %r17, %r12
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_40_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2b96e476bc98957a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_40_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc89, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95b307d2  ! 198: PDIST	pdistn	%d12, %d18, %d10
ibp_40_147:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc00c  ! 199: STDF_R	std	%f12, [%r12, %r31]
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_40_149:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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
splash_lsu_20_0:
	nop
	ta T_CHANGE_HPRIV
	set 0x55bf3c27, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_20_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd960  ! 1: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_20_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x07a854a2, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xf98c1f36, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e108  ! 4: STX_I	stx	%r17, [%r31 + 0x0108]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x91d02035  ! 6: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_20_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe28008a0  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	bpos,a	 skip_20_6
	.word 0x87acca52  ! 1: FCMPd	fcmpd	%fcc<n>, %f50, %f18
.align 512
skip_20_6:
	.word 0xc30fc000  ! 10: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_hpstate_20_7:
	ta T_CHANGE_NONHPRIV
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8198271e  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071e, %hpstate
unsupttte_20_8:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95b1048a  ! 12: FCMPLE32	fcmple32	%d4, %d10, %r10
	.word 0xd4800ba0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	setx 0x6fbcced8510a02da, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_20_10:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d04a00  ! 15: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r10
ibp_20_11:
	nop
	.word 0xa3b207c3  ! 16: PDIST	pdistn	%d8, %d34, %d48
	.word 0xe69fc3c0  ! 17: LDDA_R	ldda	[%r31, %r0] 0x1e, %r19
brcommon3_20_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e1c0  ! 1: STQF_I	-	%f19, [0x01c0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe69fc02d  ! 18: LDDA_R	ldda	[%r31, %r13] 0x01, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_20_13:
	.word 0x81982e46  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e46, %hpstate
intveclr_20_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb516a589d6d27700, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_20_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_15
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
cwq_20_15:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 22: RDPC	rd	%pc, %r8
	.word 0xd8d7e0d8  ! 23: LDSHA_I	ldsha	[%r31, + 0x00d8] %asi, %r12
	.word 0xc19fde00  ! 24: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_16) + 24, 16, 16)) -> intp(1,0,1)
#else
	setx 0xfa1bdc7492862075, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_20_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb1850014  ! 28: WR_STICK_REG_R	wr	%r20, %r20, %-
	.word 0xd877e01c  ! 29: STX_I	stx	%r12, [%r31 + 0x001c]
tagged_20_18:
	tsubcctv %r8, 0x173c, %r13
	.word 0xd807e190  ! 30: LDUW_I	lduw	[%r31 + 0x0190], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_20_20:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
fpinit_20_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 33: FCMPd	fcmpd	%fcc<n>, %f0, %f4
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
    brnz %r10, cwq_20_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_22
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
cwq_20_22:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 34: RDPC	rd	%pc, %r20
jmptr_20_23:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_24:
	rd %pc, %r12
	add %r12, (donretarg_20_24-donret_20_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004cae00 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11c5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_24:
	.word 0xd66fe06d  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x006d]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_25:
	rd %pc, %r12
	add %r12, (donretarg_20_25-donret_20_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00166400 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x78f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_25:
	.word 0x2ac98001  ! 37: BRNZ	brnz,a,pt	%r6,<label_0x98001>
fpinit_20_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 38: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_20_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d940014  ! 41: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
ibp_20_28:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc00a  ! 42: LDDF_R	ldd	[%r31, %r10], %f11
fpinit_20_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 43: FDIVs	fdivs	%f0, %f4, %f8
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
    brnz %r10, cwq_20_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_30
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
cwq_20_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 44: RDPC	rd	%pc, %r19
	.word 0xe4dfe1f0  ! 45: LDXA_I	ldxa	[%r31, + 0x01f0] %asi, %r18
	.word 0xa5b10485  ! 46: FCMPLE32	fcmple32	%d4, %d36, %r18
ibp_20_32:
	nop
	.word 0xa3a409b3  ! 47: FDIVs	fdivs	%f16, %f19, %f17
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 48: CASA_R	casa	[%r31] %asi, %r10, %r18
change_to_randtl_20_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfd920  ! 50: STDFA_R	stda	%f16, [%r0, %r31]
pmu_20_35:
	nop
	setx 0xfffffdeafffffb3f, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_36:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 52: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_37:
	rd %pc, %r12
	add %r12, (donretarg_20_37-donret_20_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00707800 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x867, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_37:
	.word 0xe4ffe1df  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x01df] %asi
	.word 0x99508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_20_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1a0  ! 1: STXFSR_I	st-sfr	%f1, [0x01a0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93b10493  ! 55: FCMPLE32	fcmple32	%d4, %d50, %r9
trapasi_20_39:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 56: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_20_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 57: CASA_R	casa	[%r31] %asi, %r9, %r12
	bcs,a	 skip_20_41
	brlez,pn  	%r3, skip_20_41
.align 128
skip_20_41:
	.word 0xc30fc000  ! 58: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_42:
	rd %pc, %r12
	add %r12, (donretarg_20_42-donret_20_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x4000 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dcc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_42:
	.word 0xd86fe08a  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x008a]
unsupttte_20_43:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba449b0  ! 60: FDIVs	fdivs	%f17, %f16, %f13
splash_hpstate_20_44:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81982d56  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d56, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_45:
	rd %pc, %r12
	add %r12, (donretarg_20_45-donret_20_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00340500 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f0d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_45:
	.word 0x22800001  ! 62: BE	be,a	<label_0x1>
	.word 0xe0c7e140  ! 63: LDSWA_I	ldswa	[%r31, + 0x0140] %asi, %r16
trapasi_20_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0d84e60  ! 64: LDXA_R	ldxa	[%r1, %r0] 0x73, %r16
jmptr_20_47:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_48:
	nop
	setx 0xfffff10afffff17a, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_49:
	nop
	.word 0xe11fe1b0  ! 67: LDDF_I	ldd	[%r31, 0x01b0], %f16
fpinit_20_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 68: FDIVs	fdivs	%f0, %f4, %f6
splash_tba_20_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe08008a0  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x87a90a41  ! 72: FCMPd	fcmpd	%fcc<n>, %f4, %f32
	.word 0xd48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
fpinit_20_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 74: FDIVs	fdivs	%f0, %f4, %f4
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
    brnz %r10, cwq_20_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_54
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
cwq_20_54:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 75: RDPC	rd	%pc, %r20
	.word 0x91944003  ! 76: WRPR_PIL_R	wrpr	%r17, %r3, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_56) + 40, 16, 16)) -> intp(5,0,9)
#else
	setx 0x6f6804d224b37b79, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0x54ecd2e4354ab22c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe042  ! 79: STDA_I	stda	%r11, [%r31 + 0x0042] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_20_58:
    nop
    ta T_CHANGE_HPRIV
    mov 4, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa7410000  ! 81: RDTICK	rd	%tick, %r19
brcommon3_20_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe080  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0080]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd73fc013  ! 82: STDF_R	std	%f11, [%r19, %r31]
	.word 0xd6800a80  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
jmptr_20_60:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x96d5867ee4d39cae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x93414000  ! 86: RDPC	rd	%pc, %r9
	.word 0xe28008a0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_20_63:
	nop
	.word 0xe19fd920  ! 88: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_20_64:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc008  ! 89: LDDF_R	ldd	[%r31, %r8], %f17
jmptr_20_65:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe190  ! 91: STB_I	stb	%r17, [%r31 + 0x0190]
	.word 0xe19fda00  ! 92: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c02c  ! 94: CASA_I	casa	[%r31] 0x 1, %r12, %r17
	setx 0xa49e4d0d6dd8fd7b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_20_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d930001  ! 97: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
fpinit_20_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 98: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xa190200c  ! 99: WRPR_GL_I	wrpr	%r0, 0x000c, %-
mondo_20_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d948007  ! 100: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 103: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_20_73:
	ta T_CHANGE_NONHPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81983c85  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c85, %hpstate
splash_hpstate_20_74:
	ta T_CHANGE_NONHPRIV
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81983854  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1854, %hpstate
	.word 0x91928012  ! 106: WRPR_PIL_R	wrpr	%r10, %r18, %pil
trapasi_20_76:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2c04b40  ! 107: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r17
mondo_20_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d940012  ! 108: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
dvapa_20_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0xed6, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99702f6c  ! 109: POPC_I	popc	0x0f6c, %r12
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
ibp_20_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe63fe010  ! 111: STD_I	std	%r19, [%r31 + 0x0010]
splash_lsu_20_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x1bb14304, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_20_81:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_20_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0x18727d53ad2513e4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe4f9bd460a47d16c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 116: WRPR_GL_I	wrpr	%r0, 0x000e, %-
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
    brnz %r10, cwq_20_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_84
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
cwq_20_84:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 117: RDPC	rd	%pc, %r20
fpinit_20_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 118: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ibp_20_86:
	nop
	.word 0xd2dfc02b  ! 119: LDXA_R	ldxa	[%r31, %r11] 0x01, %r9
	setx 0xc226b13b0fb9d25d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_88) + 48, 16, 16)) -> intp(6,0,21)
#else
	setx 0x276036746bc221df, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	brgez,pt  	%r5, skip_20_90
	.word 0x97b504c6  ! 1: FCMPNE32	fcmpne32	%d20, %d6, %r11
.align 512
skip_20_90:
	.word 0x93a449d2  ! 123: FDIVd	fdivd	%f48, %f18, %f40
mondo_20_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d91c009  ! 124: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	.word 0x8d802004  ! 125: WRFPRS_I	wr	%r0, 0x0004, %fprs
ibp_20_92:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa7b14486  ! 126: FCMPLE32	fcmple32	%d36, %d6, %r19
	.word 0x8d802000  ! 127: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
unsupttte_20_93:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e90032  ! 129: PREFETCHA_R	prefetcha	[%r4, %r18] 0x01, #one_read
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 130: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_20_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e821f5  ! 131: PREFETCHA_I	prefetcha	[%r0, + 0x01f5] %asi, #one_read
intveclr_20_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb99ce69a84dff5f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2c3ccaee6cd6dda7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x85b3c1a4bad8dfad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91950003  ! 135: WRPR_PIL_R	wrpr	%r20, %r3, %pil
	.word 0x97a00162  ! 136: FABSq	dis not found

mondo_20_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 137: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
splash_cmpr_20_101:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 138: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	fbule skip_20_102
	ble,a	 skip_20_102
.align 1024
skip_20_102:
	.word 0xd1e7c020  ! 139: CASA_I	casa	[%r31] 0x 1, %r0, %r8
intveclr_20_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0x275098111137be50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa781299a  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x099a, %-
	.word 0x91d02034  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99a00174  ! 143: FABSq	dis not found

splash_cmpr_20_105:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 144: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_20_106:
    set user_data_start, %o7
	.word 0x93902006  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_20_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d934012  ! 146: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
brcommon3_20_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe160  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0160]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe8bfc031  ! 147: STDA_R	stda	%r20, [%r31 + %r17] 0x01
ibp_20_109:
	nop
	.word 0xc3ec8023  ! 148: PREFETCHA_R	prefetcha	[%r18, %r3] 0x01, #one_read
trapasi_20_110:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 149: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
	setx 0xb083fa0e4b150eb7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 151: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_20_113:
	nop
	ta T_CHANGE_HPRIV
	set 0xae8e5198, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_20_114:
	nop
	ta T_CHANGE_HPRIV
	set 0xdd1dae24, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_115:
	nop
	setx 0xfffffc82fffff5b8, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_116) + 16, 16, 16)) -> intp(2,0,22)
#else
	setx 0x0fd9cff6bb6d38db, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9810004  ! 157: WR_SET_SOFTINT_R	wr	%r4, %r4, %set_softint
	.word 0xa5702c7a  ! 158: POPC_I	popc	0x0c7a, %r18
	.word 0xa7b40591  ! 159: FCMPGT32	fcmpgt32	%d16, %d48, %r19
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_20_119:
	ta T_CHANGE_NONHPRIV
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81982456  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	.word 0x8d903bab  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x1bab, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 163: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc19fdb60  ! 164: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x0e7cf7561ecd5462, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_20_122:
	nop
	.word 0xe1bfc2c0  ! 166: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_20_123:
	nop
	ta T_CHANGE_HPRIV
	set 0xda1456a8, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_20_124:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_125:
	rd %pc, %r12
	add %r12, (donretarg_20_125-donret_20_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0020b600 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe13, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_125:
	.word 0x3f400001  ! 170: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe1a0  ! 171: LDDFA_I	ldda	[%r31, 0x01a0], %f16
trapasi_20_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0d84e60  ! 172: LDXA_R	ldxa	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_20_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 174: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e0c5  ! 176: STF_I	st	%f8, [0x00c5, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e12a  ! 178: STX_I	stx	%r8, [%r31 + 0x012a]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_132) + 56, 16, 16)) -> intp(0,0,30)
#else
	setx 0x459a1e596e21e8d3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 180: WRASI_I	wr	%r0, 0x0004, %asi
	setx 0x1b8d62c696426fff, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e18c  ! 182: STH_I	sth	%r8, [%r31 + 0x018c]
	.word 0xd13fc008  ! 183: STDF_R	std	%f8, [%r8, %r31]
br_badelay2_20_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x93b44303  ! 184: ALIGNADDRESS	alignaddr	%r17, %r3, %r9
splash_tba_20_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_20_137:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe2d04a00  ! 186: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r17
ceter_20_138:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 187: RDTICK	rd	%tick, %r17
intveclr_20_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1134e3a8163b14ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_20_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd9148011  ! 1: LDQF_R	-	[%r18, %r17], %f12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc3e0  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_20_141:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6884b40  ! 190: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r19
ibp_20_142:
	nop
	.word 0xa9a4c9cd  ! 191: FDIVd	fdivd	%f50, %f44, %f20
	.word 0xd737e193  ! 192: STQF_I	-	%f11, [0x0193, %r31]
splash_cmpr_20_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 193: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_20_144:
	tsubcctv %r20, 0x19ca, %r18
	.word 0xd607e104  ! 194: LDUW_I	lduw	[%r31 + 0x0104], %r11
	.word 0xa2ad0008  ! 195: ANDNcc_R	andncc 	%r20, %r8, %r17
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_20_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5ec3de86a60cae63, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_20_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb0c, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9bb50491  ! 198: FCMPLE32	fcmple32	%d20, %d48, %r13
ibp_20_147:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd897c034  ! 199: LDUHA_R	lduha	[%r31, %r20] 0x01, %r12
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_20_149:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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
splash_lsu_10_0:
	nop
	ta T_CHANGE_HPRIV
	set 0xd0f40ecb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_10_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe080  ! 1: STDFA_I	stda	%f0, [0x0080, %r31]
splash_lsu_10_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xfdea7bd1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xf89866ae, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e18c  ! 4: STX_I	stx	%r17, [%r31 + 0x018c]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x93d020b2  ! 6: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_10_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe2800c80  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r17
	.word 0xe23fc000  ! 10: STD_R	std	%r17, [%r31 + %r0]
splash_hpstate_10_7:
	ta T_CHANGE_NONHPRIV
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81982795  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
	.word 0x87acca4a  ! 12: FCMPd	fcmpd	%fcc<n>, %f50, %f10
	.word 0xd4800b20  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
	setx 0x2f7198157593a5b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_10_10:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d04a00  ! 15: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r10
ibp_10_11:
	nop
	.word 0x87a88a54  ! 16: FCMPd	fcmpd	%fcc<n>, %f2, %f20
	.word 0xe69fc540  ! 17: LDDA_R	ldda	[%r31, %r0] 0x2a, %r19
brcommon3_10_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e050  ! 1: STQF_I	-	%f19, [0x0050, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe71fe0c0  ! 18: LDDF_I	ldd	[%r31, 0x00c0], %f19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_10_13:
	.word 0x81983c4d  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c4d, %hpstate
intveclr_10_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc285ed67f257ba85, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_10_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_15
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
cwq_10_15:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 22: RDPC	rd	%pc, %r13
	.word 0xd8d7e0f0  ! 23: LDSHA_I	ldsha	[%r31, + 0x00f0] %asi, %r12
	.word 0xc19fd960  ! 24: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_16) + 56, 16, 16)) -> intp(1,0,28)
#else
	setx 0x2334cfdbfab63caf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_10_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb1828010  ! 28: WR_STICK_REG_R	wr	%r10, %r16, %-
	.word 0xd877e034  ! 29: STX_I	stx	%r12, [%r31 + 0x0034]
tagged_10_18:
	tsubcctv %r12, 0x171e, %r17
	.word 0xd807e118  ! 30: LDUW_I	lduw	[%r31 + 0x0118], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_10_20:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
fpinit_10_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 33: FCMPLE32	fcmple32	%d0, %d4, %r8
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
    brnz %r10, cwq_10_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_22
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
cwq_10_22:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 34: RDPC	rd	%pc, %r16
jmptr_10_23:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_24:
	rd %pc, %r12
	add %r12, (donretarg_10_24-donret_10_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f5cf00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6d7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_24:
	.word 0xd66fe0a4  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x00a4]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_25:
	rd %pc, %r12
	add %r12, (donretarg_10_25-donret_10_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0013fc00 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x174d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_25:
	.word 0x3e800001  ! 37: BVC	bvc,a	<label_0x1>
fpinit_10_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 38: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_10_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d928010  ! 41: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
ibp_10_28:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc031  ! 42: LDXA_R	ldxa	[%r31, %r17] 0x01, %r11
fpinit_10_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 43: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
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
    brnz %r10, cwq_10_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_30
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
cwq_10_30:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 44: RDPC	rd	%pc, %r12
	.word 0xe4dfe130  ! 45: LDXA_I	ldxa	[%r31, + 0x0130] %asi, %r18
	.word 0x95b4c491  ! 46: FCMPLE32	fcmple32	%d50, %d48, %r10
ibp_10_32:
	nop
	.word 0x99b4c490  ! 47: FCMPLE32	fcmple32	%d50, %d16, %r12
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 48: CASA_R	casa	[%r31] %asi, %r8, %r18
change_to_randtl_10_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfdc00  ! 50: STDFA_R	stda	%f16, [%r0, %r31]
pmu_10_35:
	nop
	setx 0xfffff31efffff220, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_36:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 52: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_37:
	rd %pc, %r12
	add %r12, (donretarg_10_37-donret_10_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004fc600 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d4f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_37:
	.word 0xe4ffe055  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x0055] %asi
	.word 0x95508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_10_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1f0  ! 1: STXFSR_I	st-sfr	%f1, [0x01f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95b4c7c5  ! 55: PDIST	pdistn	%d50, %d36, %d10
trapasi_10_39:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c04980  ! 56: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_10_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 57: CASA_R	casa	[%r31] %asi, %r18, %r12
	.word 0xc32fc000  ! 58: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_42:
	rd %pc, %r12
	add %r12, (donretarg_10_42-donret_10_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0006be00 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa87, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	retry
donretarg_10_42:
	.word 0xd86fe0af  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x00af]
	.word 0x99b4c485  ! 60: FCMPLE32	fcmple32	%d50, %d36, %r12
splash_hpstate_10_44:
	.word 0x26cc4001  ! 1: BRLZ	brlz,a,pt	%r17,<label_0xc4001>
	.word 0x81983f41  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f41, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_45:
	rd %pc, %r12
	add %r12, (donretarg_10_45-donret_10_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00748100 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x71b, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_10_45:
	.word 0x37400001  ! 62: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0xe0c7e0f8  ! 63: LDSWA_I	ldswa	[%r31, + 0x00f8] %asi, %r16
trapasi_10_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0884e60  ! 64: LDUBA_R	lduba	[%r1, %r0] 0x73, %r16
jmptr_10_47:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_48:
	nop
	setx 0xfffffd67fffff3f8, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_49:
	nop
	.word 0xe1e7e011  ! 67: CASA_R	casa	[%r31] %asi, %r17, %r16
fpinit_10_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 68: FCMPLE32	fcmple32	%d0, %d4, %r8
splash_tba_10_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800c20  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
	.word 0xa7b507d1  ! 72: PDIST	pdistn	%d20, %d48, %d50
	.word 0xd4800b00  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r10
fpinit_10_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e838fc  ! 74: PREFETCHA_I	prefetcha	[%r0, + 0xfffff8fc] %asi, #one_read
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
    brnz %r10, cwq_10_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_54
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
cwq_10_54:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 75: RDPC	rd	%pc, %r20
	.word 0x91944010  ! 76: WRPR_PIL_R	wrpr	%r17, %r16, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_56) + 32, 16, 16)) -> intp(6,0,12)
#else
	setx 0x5095d35bccee1e24, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe05fbe75fb15334b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe0e0  ! 79: STDA_I	stda	%r11, [%r31 + 0x00e0] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_10_58:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 81: RDTICK	rd	%tick, %r12
brcommon3_10_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe000  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0000]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd63fe130  ! 82: STD_I	std	%r11, [%r31 + 0x0130]
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
jmptr_10_60:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x94dbeb338d022355, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
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
	.word 0xa5414000  ! 86: RDPC	rd	%pc, %r18
	.word 0xe28008a0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_10_63:
	nop
	.word 0xe1bfc3e0  ! 88: STDFA_R	stda	%f16, [%r0, %r31]
ibp_10_64:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc031  ! 89: LDXA_R	ldxa	[%r31, %r17] 0x01, %r17
jmptr_10_65:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe0d2  ! 91: STB_I	stb	%r17, [%r31 + 0x00d2]
	.word 0xe19fdb60  ! 92: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c02c  ! 94: CASA_I	casa	[%r31] 0x 1, %r12, %r17
	setx 0x8e43724a842a4de0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_10_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d94400a  ! 97: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
fpinit_10_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 98: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa1902008  ! 99: WRPR_GL_I	wrpr	%r0, 0x0008, %-
mondo_10_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d90c014  ! 100: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 103: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_10_73:
	ta T_CHANGE_NONHPRIV
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81983383  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1383, %hpstate
splash_hpstate_10_74:
	ta T_CHANGE_NONHPRIV
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x81983dc5  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dc5, %hpstate
	.word 0x91934004  ! 106: WRPR_PIL_R	wrpr	%r13, %r4, %pil
trapasi_10_76:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2884b40  ! 107: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r17
mondo_10_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950013  ! 108: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
dvapa_10_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcec, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87aaca50  ! 109: FCMPd	fcmpd	%fcc<n>, %f42, %f16
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
ibp_10_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc012  ! 111: LDDF_R	ldd	[%r31, %r18], %f19
splash_lsu_10_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xcf34f9d2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_10_81:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_10_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0x674a23f08b643e18, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa9581f887c6b083b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 116: WRPR_GL_I	wrpr	%r0, 0x0003, %-
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
    brnz %r10, cwq_10_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_84
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
cwq_10_84:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 117: RDPC	rd	%pc, %r19
fpinit_10_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 118: FCMPLE32	fcmple32	%d0, %d4, %r4
ibp_10_86:
	nop
	.word 0xd297c02b  ! 119: LDUHA_R	lduha	[%r31, %r11] 0x01, %r9
	setx 0xdb83798a2307b056, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_88) + 8, 16, 16)) -> intp(7,0,26)
#else
	setx 0xfb3390d5aea4784d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x87ac4a52  ! 123: FCMPd	fcmpd	%fcc<n>, %f48, %f18
mondo_10_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 124: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0x8d802004  ! 125: WRFPRS_I	wr	%r0, 0x0004, %fprs
ibp_10_92:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb0032  ! 126: PREFETCHA_R	prefetcha	[%r12, %r18] 0x01, #one_read
	.word 0x8d802000  ! 127: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1a449c7  ! 129: FDIVd	fdivd	%f48, %f38, %f16
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 130: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_10_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 131: FDIVd	fdivd	%f0, %f4, %f6
intveclr_10_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2ec129822fbe617d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5320ff67f3aa8d8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x2b1a34fec1345541, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91908013  ! 135: WRPR_PIL_R	wrpr	%r2, %r19, %pil
	.word 0x9ba00164  ! 136: FABSq	dis not found

mondo_10_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d910012  ! 137: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
splash_cmpr_10_101:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 138: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc32fc000  ! 139: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_10_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc7e442c6e8f53d70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7823c36  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r8, 0x1c36, %-
	.word 0x91d020b4  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa9a00163  ! 143: FABSq	dis not found

splash_cmpr_10_105:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 144: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_10_106:
    set user_data_start, %o7
	.word 0x93902004  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
mondo_10_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d91c013  ! 146: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
brcommon3_10_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe1c0  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x01c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe897c034  ! 147: LDUHA_R	lduha	[%r31, %r20] 0x01, %r20
ibp_10_109:
	nop
	.word 0xa3702a2b  ! 148: POPC_I	popc	0x0a2b, %r17
trapasi_10_110:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 149: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
	setx 0x2b4fe3eaf7327b21, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 151: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_10_113:
	nop
	ta T_CHANGE_HPRIV
	set 0xb22609fa, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_10_114:
	nop
	ta T_CHANGE_HPRIV
	set 0x61c2aae2, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_115:
	nop
	setx 0xfffffe04fffff8f9, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_116) + 0, 16, 16)) -> intp(5,0,9)
#else
	setx 0x160783471cd8993f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9840008  ! 157: WR_SET_SOFTINT_R	wr	%r16, %r8, %set_softint
	.word 0x87ac0a52  ! 158: FCMPd	fcmpd	%fcc<n>, %f16, %f18
	.word 0x99b4c58c  ! 159: FCMPGT32	fcmpgt32	%d50, %d12, %r12
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_10_119:
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81983790  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1790, %hpstate
	.word 0x8d9032a8  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x12a8, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc19fd920  ! 164: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xc361d10349e40a55, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_10_122:
	nop
	.word 0xe19fc3e0  ! 166: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_10_123:
	nop
	ta T_CHANGE_HPRIV
	set 0xdd96a311, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_10_124:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_125:
	rd %pc, %r12
	add %r12, (donretarg_10_125-donret_10_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c78800 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4c7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_125:
	.word 0x33400001  ! 170: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xc19fe160  ! 171: LDDFA_I	ldda	[%r31, 0x0160], %f0
trapasi_10_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0d04e60  ! 172: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_10_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 174: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e015  ! 176: STF_I	st	%f8, [0x0015, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e120  ! 178: STX_I	stx	%r8, [%r31 + 0x0120]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_132) + 56, 16, 16)) -> intp(5,0,31)
#else
	setx 0xe3ce404f2df6d6e8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 180: WRASI_I	wr	%r0, 0x0088, %asi
	setx 0xa6ffde0eb0eee268, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e1ee  ! 182: STH_I	sth	%r8, [%r31 + 0x01ee]
	.word 0xd11fe050  ! 183: LDDF_I	ldd	[%r31, 0x0050], %f8
br_badelay2_10_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa5b18302  ! 184: ALIGNADDRESS	alignaddr	%r6, %r2, %r18
splash_tba_10_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_10_137:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe2884a00  ! 186: LDUBA_R	lduba	[%r1, %r0] 0x50, %r17
ceter_10_138:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 187: RDTICK	rd	%tick, %r18
intveclr_10_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc32d1ef2ec15eef7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_10_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe170  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0170], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe060  ! 189: LDDFA_I	ldda	[%r31, 0x0060], %f16
trapasi_10_141:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6d04b40  ! 190: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r19
ibp_10_142:
	nop
	.word 0x97a309b0  ! 191: FDIVs	fdivs	%f12, %f16, %f11
	.word 0xd737e110  ! 192: STQF_I	-	%f11, [0x0110, %r31]
splash_cmpr_10_143:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 193: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_10_144:
	tsubcctv %r18, 0x150e, %r19
	.word 0xd607e042  ! 194: LDUW_I	lduw	[%r31 + 0x0042], %r11
	.word 0xa8aa4014  ! 195: ANDNcc_R	andncc 	%r9, %r20, %r20
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_10_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0e8ba1423f0fefba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_10_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xebc, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b407c5  ! 198: PDIST	pdistn	%d16, %d36, %d16
ibp_10_147:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9f8021f0  ! 199: SIR	sir	0x01f0
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_10_149:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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
splash_lsu_8_0:
	nop
	ta T_CHANGE_HPRIV
	set 0x8a53fd6e, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_8_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe160  ! 1: LDDFA_I	ldda	[%r31, 0x0160], %f16
splash_lsu_8_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x63554d4b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x4b1def93, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e0a0  ! 4: STX_I	stx	%r17, [%r31 + 0x00a0]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x91d02033  ! 6: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_8_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe28008a0  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	bcs  	 skip_8_6
	.word 0x9bb504c2  ! 1: FCMPNE32	fcmpne32	%d20, %d2, %r13
.align 512
skip_8_6:
	.word 0xe23fc000  ! 10: STD_R	std	%r17, [%r31 + %r0]
splash_hpstate_8_7:
	ta T_CHANGE_NONHPRIV
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x81982e8b  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
unsupttte_8_8:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x91a509a5  ! 12: FDIVs	fdivs	%f20, %f5, %f8
	.word 0xd4800a60  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
	setx 0x276ffeba4efad39b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_8_10:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d04a00  ! 15: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r10
ibp_8_11:
	nop
	.word 0xa9b50492  ! 16: FCMPLE32	fcmple32	%d20, %d18, %r20
	.word 0xe69fd100  ! 17: LDDA_R	ldda	[%r31, %r0] 0x88, %r19
brcommon3_8_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e0e0  ! 1: STQF_I	-	%f19, [0x00e0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc00c  ! 18: STXFSR_R	st-sfr	%f1, [%r12, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_8_13:
	.word 0x81983a45  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a45, %hpstate
intveclr_8_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbc18c7a036bf2cc1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_8_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_15
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
cwq_8_15:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 22: RDPC	rd	%pc, %r12
	.word 0xd8d7e058  ! 23: LDSHA_I	ldsha	[%r31, + 0x0058] %asi, %r12
	.word 0xe19fdf20  ! 24: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_16) + 48, 16, 16)) -> intp(6,0,18)
#else
	setx 0x6aaa7dbeb9291941, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_8_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb1804013  ! 28: WR_STICK_REG_R	wr	%r1, %r19, %-
	.word 0xd877e04c  ! 29: STX_I	stx	%r12, [%r31 + 0x004c]
tagged_8_18:
	tsubcctv %r20, 0x16e7, %r12
	.word 0xd807e1d2  ! 30: LDUW_I	lduw	[%r31 + 0x01d2], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_8_20:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 32: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
fpinit_8_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 33: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
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
    brnz %r10, cwq_8_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_22
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
cwq_8_22:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 34: RDPC	rd	%pc, %r18
jmptr_8_23:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_24:
	rd %pc, %r12
	add %r12, (donretarg_8_24-donret_8_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bb2900 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd3d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_24:
	.word 0xd66fe115  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x0115]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_25:
	rd %pc, %r12
	add %r12, (donretarg_8_25-donret_8_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b67c00 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd81, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_25:
	.word 0x24800001  ! 37: BLE	ble,a	<label_0x1>
fpinit_8_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 38: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_8_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d90c007  ! 41: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
ibp_8_28:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc008  ! 42: STXFSR_R	st-sfr	%f1, [%r8, %r31]
fpinit_8_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 43: FDIVd	fdivd	%f0, %f4, %f8
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
    brnz %r10, cwq_8_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_30
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
cwq_8_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 44: RDPC	rd	%pc, %r16
	.word 0xe4dfe1d0  ! 45: LDXA_I	ldxa	[%r31, + 0x01d0] %asi, %r18
iaw_8_31:
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
iaw_startwait8_31:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_31
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_31:
    brnz %r16, iaw_wait8_31
    ld [%r23], %r16
    ba iaw_startwait8_31
    mov 0x8, %r16
continue_iaw_8_31:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_31:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_31
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_31:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_31
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_31:
	mov 0x38, %r18
iaw4_8_31:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9b507d1  ! 46: PDIST	pdistn	%d20, %d48, %d20
ibp_8_32:
	nop
	.word 0x9bb447d4  ! 47: PDIST	pdistn	%d48, %d20, %d44
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
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 48: CASA_R	casa	[%r31] %asi, %r12, %r18
change_to_randtl_8_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfdc00  ! 50: STDFA_R	stda	%f16, [%r0, %r31]
pmu_8_35:
	nop
	setx 0xfffff072fffff6f8, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_36:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 52: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_37:
	rd %pc, %r12
	add %r12, (donretarg_8_37-donret_8_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0001b000 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x814, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_37:
	.word 0xe4ffe0b6  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x00b6] %asi
	.word 0xa3508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_8_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe0d0  ! 1: STXFSR_I	st-sfr	%f1, [0x00d0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87a8ca4b  ! 55: FCMPd	fcmpd	%fcc<n>, %f34, %f42
trapasi_8_39:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 56: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_8_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 57: CASA_R	casa	[%r31] %asi, %r18, %r12
	bvs  	 skip_8_41
	brlez,a,pn	%r1, skip_8_41
.align 128
skip_8_41:
	.word 0xc32fc000  ! 58: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_42:
	rd %pc, %r12
	add %r12, (donretarg_8_42-donret_8_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f99500 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3f5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_42:
	.word 0xd86fe0a4  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x00a4]
unsupttte_8_43:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ac0a51  ! 60: FCMPd	fcmpd	%fcc<n>, %f16, %f48
splash_hpstate_8_44:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8198368f  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x168f, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_45:
	rd %pc, %r12
	add %r12, (donretarg_8_45-donret_8_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ba2c00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe04, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_8_45:
	.word 0x39400001  ! 62: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe0c7e1e8  ! 63: LDSWA_I	ldswa	[%r31, + 0x01e8] %asi, %r16
trapasi_8_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0d84e60  ! 64: LDXA_R	ldxa	[%r1, %r0] 0x73, %r16
jmptr_8_47:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_48:
	nop
	setx 0xfffff870fffff293, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_49:
	nop
	.word 0xe0bfc031  ! 67: STDA_R	stda	%r16, [%r31 + %r17] 0x01
fpinit_8_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a17  ! 68: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa17] %asi, #one_read
splash_tba_8_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe08008a0  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
iaw_8_52:
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
iaw_startwait8_52:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_52
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_52:
    brnz %r16, iaw_wait8_52
    ld [%r23], %r16
    ba iaw_startwait8_52
    mov 0x8, %r16
continue_iaw_8_52:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_52:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_52
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_52:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_52
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_52:
	mov 0x38, %r18
iaw2_8_52:
	rdpr %tba, %r19
	mov 0x102,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87a94a41  ! 72: FCMPd	fcmpd	%fcc<n>, %f36, %f32
	.word 0xd48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
fpinit_8_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 74: FDIVs	fdivs	%f0, %f4, %f4
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
    brnz %r10, cwq_8_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_54
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
cwq_8_54:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 75: RDPC	rd	%pc, %r16
	.word 0x91948008  ! 76: WRPR_PIL_R	wrpr	%r18, %r8, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_56) + 0, 16, 16)) -> intp(3,0,21)
#else
	setx 0x95195b5c57cee337, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0d33a79149370dad, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe102  ! 79: STDA_I	stda	%r11, [%r31 + 0x0102] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_8_58:
    nop
    ta T_CHANGE_HPRIV
    mov 2, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa7410000  ! 81: RDTICK	rd	%tick, %r19
brcommon3_8_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe190  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0190]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6dfc02c  ! 82: LDXA_R	ldxa	[%r31, %r12] 0x01, %r11
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
jmptr_8_60:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x596153fbfececba2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
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
	.word 0xa1414000  ! 86: RDPC	rd	%pc, %r16
	.word 0xe28008a0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_8_63:
	nop
	.word 0xc19fd960  ! 88: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_8_64:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc014  ! 89: STXFSR_R	st-sfr	%f1, [%r20, %r31]
jmptr_8_65:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe120  ! 91: STB_I	stb	%r17, [%r31 + 0x0120]
	.word 0xe19fd960  ! 92: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c032  ! 94: CASA_I	casa	[%r31] 0x 1, %r18, %r17
	setx 0x85a258b78ed6c205, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_8_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d940013  ! 97: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
fpinit_8_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 98: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xa190200a  ! 99: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_8_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d924010  ! 100: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 103: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_8_73:
	ta T_CHANGE_NONHPRIV
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x819824c5  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
splash_hpstate_8_74:
	ta T_CHANGE_NONHPRIV
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x81983de3  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1de3, %hpstate
	.word 0x91948010  ! 106: WRPR_PIL_R	wrpr	%r18, %r16, %pil
trapasi_8_76:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2d04b40  ! 107: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r17
mondo_8_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d940003  ! 108: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
dvapa_8_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0xba7, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7b50490  ! 109: FCMPLE32	fcmple32	%d20, %d16, %r19
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
ibp_8_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe63fe010  ! 111: STD_I	std	%r19, [%r31 + 0x0010]
splash_lsu_8_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xcfbcd78e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_8_81:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_8_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4e2796d5e5a3ae3e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8eb71397b8d9ad9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 116: WRPR_GL_I	wrpr	%r0, 0x0007, %-
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
    brnz %r10, cwq_8_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_84
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
cwq_8_84:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 117: RDPC	rd	%pc, %r20
fpinit_8_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 118: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ibp_8_86:
	nop
	.word 0xd31fc008  ! 119: LDDF_R	ldd	[%r31, %r8], %f9
	setx 0xd283f90ade138fa9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_88) + 0, 16, 16)) -> intp(1,0,19)
#else
	setx 0x4c4d84109257dadf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	fbug,a,pn	%fcc0,  skip_8_90
	.word 0x9f802ead  ! 1: SIR	sir	0x0ead
.align 512
skip_8_90:
	.word 0xa5b2c4c7  ! 123: FCMPNE32	fcmpne32	%d42, %d38, %r18
mondo_8_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d91c009  ! 124: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
ibp_8_92:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99b24493  ! 126: FCMPLE32	fcmple32	%d40, %d50, %r12
	.word 0x8d802000  ! 127: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
unsupttte_8_93:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1b20485  ! 129: FCMPLE32	fcmple32	%d8, %d36, %r16
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 130: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_8_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 131: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_8_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3be9ed00b7939d63, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2ef9667a5c2c6c2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x205ee3b72fe184b3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9191400b  ! 135: WRPR_PIL_R	wrpr	%r5, %r11, %pil
	.word 0xa7a00172  ! 136: FABSq	dis not found

mondo_8_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d91c007  ! 137: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
splash_cmpr_8_101:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 138: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	brlez,a,pt	%r16, skip_8_102
	fbe skip_8_102
.align 1024
skip_8_102:
	.word 0xc36fe1ad  ! 139: PREFETCH_I	prefetch	[%r31 + 0x01ad], #one_read
intveclr_8_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0x42276caf4ce3c08b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7853d24  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x1d24, %-
	.word 0x93d02033  ! 142: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x99a00172  ! 143: FABSq	dis not found

splash_cmpr_8_105:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 144: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_8_106:
    set user_data_start, %o7
	.word 0x93902003  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
mondo_8_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94400b  ! 146: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
brcommon3_8_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe020  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0020]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe89fe100  ! 147: LDDA_I	ldda	[%r31, + 0x0100] %asi, %r20
ibp_8_109:
	nop
	.word 0xa3a4c9ac  ! 148: FDIVs	fdivs	%f19, %f12, %f17
trapasi_8_110:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4d04a00  ! 149: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r10
	setx 0xdb1fe55e50626c32, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 151: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_8_113:
	nop
	ta T_CHANGE_HPRIV
	set 0x423b831d, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_8_114:
	nop
	ta T_CHANGE_HPRIV
	set 0x6ce1f5a4, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_115:
	nop
	setx 0xffffff17fffff334, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_116) + 0, 16, 16)) -> intp(1,0,27)
#else
	setx 0x3cfea2ed75139897, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9848014  ! 157: WR_SET_SOFTINT_R	wr	%r18, %r20, %set_softint
iaw_8_117:
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
iaw_startwait8_117:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_117
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_117:
    brnz %r16, iaw_wait8_117
    ld [%r23], %r16
    ba iaw_startwait8_117
    mov 0x8, %r16
continue_iaw_8_117:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_117:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_117
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_117:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_117
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_117:
	mov 0x38, %r18
iaw3_8_117:
	setx vahole_target1, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb4030  ! 158: PREFETCHA_R	prefetcha	[%r13, %r16] 0x01, #one_read
	.word 0x95b18587  ! 159: FCMPGT32	fcmpgt32	%d6, %d38, %r10
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_8_119:
	ta T_CHANGE_NONHPRIV
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81982784  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0784, %hpstate
	.word 0x8d9035dc  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x15dc, %pstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 163: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe19fdc00  ! 164: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x27b55911f2deb5fc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_8_122:
	nop
	.word 0xe19fe080  ! 166: LDDFA_I	ldda	[%r31, 0x0080], %f16
splash_lsu_8_123:
	nop
	ta T_CHANGE_HPRIV
	set 0x4e8c309b, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_8_124:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_125:
	rd %pc, %r12
	add %r12, (donretarg_8_125-donret_8_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004fef00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c67, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x22ca0001  ! 1: BRZ	brz,a,pt	%r8,<label_0xa0001>
	done
donretarg_8_125:
	.word 0x3c800001  ! 170: BPOS	bpos,a	<label_0x1>
iaw_8_126:
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
iaw_startwait8_126:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_126
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_126:
    brnz %r16, iaw_wait8_126
    ld [%r23], %r16
    ba iaw_startwait8_126
    mov 0x8, %r16
continue_iaw_8_126:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_126:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_126
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_126:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_126
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_126:
	mov 0x38, %r18
iaw4_8_126:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdc00  ! 171: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_8_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0c84e60  ! 172: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_8_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 174: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e0e0  ! 176: STF_I	st	%f8, [0x00e0, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e108  ! 178: STX_I	stx	%r8, [%r31 + 0x0108]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_132) + 24, 16, 16)) -> intp(6,0,8)
#else
	setx 0xe7c408ea685c780f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 180: WRASI_I	wr	%r0, 0x0020, %asi
	setx 0xc884960117177774, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e1c8  ! 182: STH_I	sth	%r8, [%r31 + 0x01c8]
iaw_8_134:
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
iaw_startwait8_134:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_8_134
    mov (~0x8&0xf), %r16
    ld [%r23], %r16
iaw_wait8_134:
    brnz %r16, iaw_wait8_134
    ld [%r23], %r16
    ba iaw_startwait8_134
    mov 0x8, %r16
continue_iaw_8_134:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_8_134:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_8_134
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_8_134:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_8_134
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit8_134:
	mov 0x38, %r18
iaw4_8_134:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd11fe120  ! 183: LDDF_I	ldd	[%r31, 0x0120], %f8
br_badelay2_8_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa1b10306  ! 184: ALIGNADDRESS	alignaddr	%r4, %r6, %r16
splash_tba_8_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_8_137:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe2884a00  ! 186: LDUBA_R	lduba	[%r1, %r0] 0x50, %r17
ceter_8_138:
    nop
    ta T_CHANGE_HPRIV
    mov 4, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 187: RDTICK	rd	%tick, %r10
intveclr_8_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x063e5dd80cecd6f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_8_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe5148009  ! 1: LDQF_R	-	[%r18, %r9], %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe1e0  ! 189: STDFA_I	stda	%f16, [0x01e0, %r31]
trapasi_8_141:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6d04b40  ! 190: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r19
ibp_8_142:
	nop
	.word 0x93b40493  ! 191: FCMPLE32	fcmple32	%d16, %d50, %r9
	.word 0xd737e1f0  ! 192: STQF_I	-	%f11, [0x01f0, %r31]
splash_cmpr_8_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 193: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_8_144:
	tsubcctv %r10, 0x10ba, %r13
	.word 0xd607e0fd  ! 194: LDUW_I	lduw	[%r31 + 0x00fd], %r11
	.word 0x9aac0011  ! 195: ANDNcc_R	andncc 	%r16, %r17, %r13
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_8_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5b0f7b1652a0af94, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_8_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbd0, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a409c4  ! 198: FDIVd	fdivd	%f16, %f4, %f12
ibp_8_147:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 199: CASA_R	casa	[%r31] %asi, %r13, %r12
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_8_149:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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
splash_lsu_4_0:
	nop
	ta T_CHANGE_HPRIV
	set 0xc616ea7b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_4_1:
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
ibp_startwait4_1:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_1
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_1:
    brnz %r16, ibp_wait4_1
    ld [%r23], %r16
    ba ibp_startwait4_1
    mov 0x4, %r16
continue_ibp_4_1:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_1:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_1
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_1:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_1
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_1:
    best_set_reg(0x0000004084c00976,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe0a0  ! 1: LDDFA_I	ldda	[%r31, 0x00a0], %f0
splash_lsu_4_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x0d9c3658, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x9d82a173, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e1c4  ! 4: STX_I	stx	%r17, [%r31 + 0x01c4]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x91d020b3  ! 6: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_4_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe2800c80  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r17
	bg  	 skip_4_6
	.word 0x9f802676  ! 1: SIR	sir	0x0676
.align 512
skip_4_6:
	.word 0xc36fe1a0  ! 10: PREFETCH_I	prefetch	[%r31 + 0x01a0], #one_read
splash_hpstate_4_7:
	ta T_CHANGE_NONHPRIV
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x819826dd  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dd, %hpstate
unsupttte_4_8:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a409b1  ! 12: FDIVs	fdivs	%f16, %f17, %f10
	.word 0xd4800a80  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	setx 0xa641a1f2d327cdda, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_4_10:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 15: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
ibp_4_11:
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
ibp_startwait4_11:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_11
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_11:
    brnz %r16, ibp_wait4_11
    ld [%r23], %r16
    ba ibp_startwait4_11
    mov 0x4, %r16
continue_ibp_4_11:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_11:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_11
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_11:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_11
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_11:
    best_set_reg(0x00000050f2c976f0,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc3ecc033  ! 16: PREFETCHA_R	prefetcha	[%r19, %r19] 0x01, #one_read
	.word 0xe69fd140  ! 17: LDDA_R	ldda	[%r31, %r0] 0x8a, %r19
brcommon3_4_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e130  ! 1: STQF_I	-	%f19, [0x0130, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe73fc014  ! 18: STDF_R	std	%f19, [%r20, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_4_13:
	.word 0x819837b1  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17b1, %hpstate
intveclr_4_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe1b32b646a2ea56a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_4_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_15
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
cwq_4_15:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 22: RDPC	rd	%pc, %r11
	.word 0xd8d7e010  ! 23: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
	.word 0xc19fd960  ! 24: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_16) + 16, 16, 16)) -> intp(3,0,1)
#else
	setx 0xf5c4d9489115393b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_4_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb1820012  ! 28: WR_STICK_REG_R	wr	%r8, %r18, %-
	.word 0xd877e010  ! 29: STX_I	stx	%r12, [%r31 + 0x0010]
tagged_4_18:
	tsubcctv %r19, 0x139b, %r17
	.word 0xd807e1c0  ! 30: LDUW_I	lduw	[%r31 + 0x01c0], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_4_20:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8884b60  ! 32: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r12
fpinit_4_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 33: FCMPd	fcmpd	%fcc<n>, %f0, %f4
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
    brnz %r10, cwq_4_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_22
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
cwq_4_22:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 34: RDPC	rd	%pc, %r19
jmptr_4_23:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_24:
	rd %pc, %r12
	add %r12, (donretarg_4_24-donret_4_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003af600 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf1d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_24:
	.word 0xd66fe019  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x0019]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_25:
	rd %pc, %r12
	add %r12, (donretarg_4_25-donret_4_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00761700 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f9a, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_25:
	.word 0x2acc0001  ! 37: BRNZ	brnz,a,pt	%r16,<label_0xc0001>
fpinit_4_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 38: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_4_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914010  ! 41: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
ibp_4_28:
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
ibp_startwait4_28:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_28
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_28:
    brnz %r16, ibp_wait4_28
    ld [%r23], %r16
    ba ibp_startwait4_28
    mov 0x4, %r16
continue_ibp_4_28:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_28:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_28
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_28:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_28
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_28:
    best_set_reg(0x0000005080f6f0ce,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd63fe160  ! 42: STD_I	std	%r11, [%r31 + 0x0160]
fpinit_4_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 43: FCMPLE32	fcmple32	%d0, %d4, %r6
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
    brnz %r10, cwq_4_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_30
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
cwq_4_30:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 44: RDPC	rd	%pc, %r12
	.word 0xe4dfe038  ! 45: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r18
	.word 0xa9a289a8  ! 46: FDIVs	fdivs	%f10, %f8, %f20
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
    best_set_reg(0x00000040d8f0ce80,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa5a449a5  ! 47: FDIVs	fdivs	%f17, %f5, %f18
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
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 48: CASA_R	casa	[%r31] %asi, %r10, %r18
change_to_randtl_4_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc1bfdf20  ! 50: STDFA_R	stda	%f0, [%r0, %r31]
pmu_4_35:
	nop
	setx 0xfffffa7ffffff9a2, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_36:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 52: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_37:
	rd %pc, %r12
	add %r12, (donretarg_4_37-donret_4_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a2f900 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7cd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_37:
	.word 0xe4ffe06c  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x006c] %asi
	.word 0xa5508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_4_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe010  ! 1: STXFSR_I	st-sfr	%f1, [0x0010, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ad0a52  ! 55: FCMPd	fcmpd	%fcc<n>, %f20, %f18
trapasi_4_39:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 56: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_4_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 57: CASA_R	casa	[%r31] %asi, %r9, %r12
	ba  	 skip_4_41
	.word 0x9f8020a6  ! 1: SIR	sir	0x00a6
.align 128
skip_4_41:
	.word 0xd83fc000  ! 58: STD_R	std	%r12, [%r31 + %r0]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_42:
	rd %pc, %r12
	add %r12, (donretarg_4_42-donret_4_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00429a00 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe50, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_42:
	.word 0xd86fe04c  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x004c]
unsupttte_4_43:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1a489ab  ! 60: FDIVs	fdivs	%f18, %f11, %f16
splash_hpstate_4_44:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81983f3f  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f3f, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_45:
	rd %pc, %r12
	add %r12, (donretarg_4_45-donret_4_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00265b00 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_45:
	.word 0x33400001  ! 62: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xe0c7e048  ! 63: LDSWA_I	ldswa	[%r31, + 0x0048] %asi, %r16
trapasi_4_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0904e60  ! 64: LDUHA_R	lduha	[%r1, %r0] 0x73, %r16
jmptr_4_47:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_48:
	nop
	setx 0xfffff71bfffffb0f, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_4_49:
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
ibp_startwait4_49:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_49
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_49:
    brnz %r16, ibp_wait4_49
    ld [%r23], %r16
    ba ibp_startwait4_49
    mov 0x4, %r16
continue_ibp_4_49:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_49:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_49
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_49:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_49
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_49:
    best_set_reg(0x000000401dce8020,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1e7e011  ! 67: CASA_R	casa	[%r31] %asi, %r17, %r16
fpinit_4_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 68: FDIVs	fdivs	%f0, %f4, %f4
splash_tba_4_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800a60  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
	.word 0xc3ea002a  ! 72: PREFETCHA_R	prefetcha	[%r8, %r10] 0x01, #one_read
	.word 0xd4800c40  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
fpinit_4_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 74: FDIVd	fdivd	%f0, %f4, %f6
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
    brnz %r10, cwq_4_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_54
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
cwq_4_54:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 75: RDPC	rd	%pc, %r19
	.word 0x91910014  ! 76: WRPR_PIL_R	wrpr	%r4, %r20, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_56) + 32, 16, 16)) -> intp(6,0,13)
#else
	setx 0x583f040fe073dde4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0xffcb66486bf005a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe078  ! 79: STDA_I	stda	%r11, [%r31 + 0x0078] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_4_58:
    nop
    ta T_CHANGE_HPRIV
    mov 2, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 81: RDTICK	rd	%tick, %r17
brcommon3_4_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe1e0  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x01e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc013  ! 82: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
jmptr_4_60:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x451b753051352d1e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
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
	.word 0xa1414000  ! 86: RDPC	rd	%pc, %r16
	.word 0xe2800ba0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r17
ibp_4_63:
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
ibp_startwait4_63:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_63
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_63:
    brnz %r16, ibp_wait4_63
    ld [%r23], %r16
    ba ibp_startwait4_63
    mov 0x4, %r16
continue_ibp_4_63:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_63:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_63
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_63:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_63
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_63:
    best_set_reg(0x00000050fbc020da,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fd920  ! 88: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_4_64:
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
ibp_startwait4_64:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_64
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_64:
    brnz %r16, ibp_wait4_64
    ld [%r23], %r16
    ba ibp_startwait4_64
    mov 0x4, %r16
continue_ibp_4_64:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_64:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_64
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_64:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_64
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_64:
    best_set_reg(0x00000040a7e0da55,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe31fe050  ! 89: LDDF_I	ldd	[%r31, 0x0050], %f17
jmptr_4_65:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe013  ! 91: STB_I	stb	%r17, [%r31 + 0x0013]
	.word 0xe19fde00  ! 92: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c028  ! 94: CASA_I	casa	[%r31] 0x 1, %r8, %r17
	setx 0x3cd5dc78fb725786, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_4_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92800c  ! 97: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
fpinit_4_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e838fc  ! 98: PREFETCHA_I	prefetcha	[%r0, + 0xfffff8fc] %asi, #one_read
	.word 0xa190200a  ! 99: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_4_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948013  ! 100: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802004  ! 103: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_hpstate_4_73:
	ta T_CHANGE_NONHPRIV
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81983c55  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c55, %hpstate
splash_hpstate_4_74:
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982c16  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c16, %hpstate
	.word 0x9191c014  ! 106: WRPR_PIL_R	wrpr	%r7, %r20, %pil
trapasi_4_76:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2d84b40  ! 107: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r17
mondo_4_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d920011  ! 108: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
dvapa_4_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0x814, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b48482  ! 109: FCMPLE32	fcmple32	%d18, %d2, %r16
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
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
    best_set_reg(0x00000040acda5535,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02a  ! 111: LDUHA_R	lduha	[%r31, %r10] 0x01, %r19
splash_lsu_4_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x67ae7911, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_4_81:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_4_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3d30bd0caf0a6c19, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0x615c403dbf4ef8aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 116: WRPR_GL_I	wrpr	%r0, 0x0009, %-
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
    brnz %r10, cwq_4_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_84
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
cwq_4_84:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 117: RDPC	rd	%pc, %r9
fpinit_4_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 118: FCMPd	fcmpd	%fcc<n>, %f0, %f4
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
    best_set_reg(0x000000508ad53595,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd23fe150  ! 119: STD_I	std	%r9, [%r31 + 0x0150]
	setx 0x58e1f8d560c7e679, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_88) + 32, 16, 16)) -> intp(1,0,9)
#else
	setx 0x54b6c1fb5aa12401, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	bleu  	 skip_4_90
	.word 0xc36b650a  ! 1: PREFETCH_I	prefetch	[%r13 + 0x050a], #one_read
.align 512
skip_4_90:
	.word 0xa7a249d4  ! 123: FDIVd	fdivd	%f40, %f20, %f50
mondo_4_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d934014  ! 124: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
ibp_4_92:
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
ibp_startwait4_92:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_92
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_92:
    brnz %r16, ibp_wait4_92
    ld [%r23], %r16
    ba ibp_startwait4_92
    mov 0x4, %r16
continue_ibp_4_92:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_92:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_92
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_92:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_92
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_92:
    best_set_reg(0x00000050a0f59579,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a149a9  ! 126: FDIVs	fdivs	%f5, %f9, %f18
	.word 0x8d802000  ! 127: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
unsupttte_4_93:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ed002b  ! 129: PREFETCHA_R	prefetcha	[%r20, %r11] 0x01, #one_read
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 130: Tcc_R	tne	icc_or_xcc, %r0 + %r30
fpinit_4_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e821f5  ! 131: PREFETCHA_I	prefetcha	[%r0, + 0x01f5] %asi, #one_read
intveclr_4_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3e3f87dd611b9cbf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0xac9d6f3bbcf64e94, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xb7d1cecc9cb5b7e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91910002  ! 135: WRPR_PIL_R	wrpr	%r4, %r2, %pil
	.word 0xa3a00164  ! 136: FABSq	dis not found

mondo_4_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d910010  ! 137: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
splash_cmpr_4_101:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 138: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	brnz,a,pn	%r16, skip_4_102
	fbue skip_4_102
.align 1024
skip_4_102:
	.word 0xc36fe01e  ! 139: PREFETCH_I	prefetch	[%r31 + 0x001e], #one_read
intveclr_4_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3240def71a5b1ecb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa784f1d6  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x11d6, %-
	.word 0x91d020b5  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa9a0016a  ! 143: FABSq	dis not found

splash_cmpr_4_105:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 144: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_4_106:
    set user_data_start, %o7
	.word 0x93902002  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
mondo_4_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94800b  ! 146: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
brcommon3_4_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe150  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0150]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe93fc011  ! 147: STDF_R	std	%f20, [%r17, %r31]
ibp_4_109:
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
ibp_startwait4_109:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_109
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_109:
    brnz %r16, ibp_wait4_109
    ld [%r23], %r16
    ba ibp_startwait4_109
    mov 0x4, %r16
continue_ibp_4_109:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_109:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_109
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_109:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_109
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_109:
    best_set_reg(0x000000401bd57909,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9bb4c494  ! 148: FCMPLE32	fcmple32	%d50, %d20, %r13
trapasi_4_110:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c84a00  ! 149: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r10
	setx 0x5475388e794f4a54, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 151: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_4_113:
	nop
	ta T_CHANGE_HPRIV
	set 0x2d7418bd, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_4_114:
	nop
	ta T_CHANGE_HPRIV
	set 0xb5bcfb7f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_115:
	nop
	setx 0xfffffdeefffff326, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_116) + 40, 16, 16)) -> intp(2,0,11)
#else
	setx 0x12246480f1967c19, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa982c009  ! 157: WR_SET_SOFTINT_R	wr	%r11, %r9, %set_softint
	.word 0x95a409d1  ! 158: FDIVd	fdivd	%f16, %f48, %f10
	.word 0xa5b4858c  ! 159: FCMPGT32	fcmpgt32	%d18, %d12, %r18
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_4_119:
	ta T_CHANGE_NONHPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982d4b  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4b, %hpstate
	.word 0x8d902ecb  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe19fdf20  ! 164: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0xbcbe96501fb2db24, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x0000005004f9093a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfe1c0  ! 166: STDFA_I	stda	%f0, [0x01c0, %r31]
splash_lsu_4_123:
	nop
	ta T_CHANGE_HPRIV
	set 0xe0ef2807, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_4_124:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_4_125:
	rd %pc, %r12
	add %r12, (donretarg_4_125-donret_4_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fd7900 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cbf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_4_125:
	.word 0x2b400001  ! 170: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd960  ! 171: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_4_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0c84e60  ! 172: LDSBA_R	ldsba	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_4_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 174: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e162  ! 176: STF_I	st	%f8, [0x0162, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e130  ! 178: STX_I	stx	%r8, [%r31 + 0x0130]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_132) + 0, 16, 16)) -> intp(5,0,15)
#else
	setx 0x363a4593a84fd42a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 180: WRASI_I	wr	%r0, 0x0010, %asi
	setx 0x0f889128b8fba923, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e167  ! 182: STH_I	sth	%r8, [%r31 + 0x0167]
	.word 0xd11fc00d  ! 183: LDDF_R	ldd	[%r31, %r13], %f8
br_badelay2_4_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa5b14312  ! 184: ALIGNADDRESS	alignaddr	%r5, %r18, %r18
splash_tba_4_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_4_137:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe2d04a00  ! 186: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r17
ceter_4_138:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 187: RDTICK	rd	%tick, %r20
intveclr_4_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfb1c179d3985217d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_4_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe080  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0080], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fde00  ! 189: LDDFA_R	ldda	[%r31, %r0], %f0
trapasi_4_141:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6c84b40  ! 190: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r19
ibp_4_142:
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
ibp_startwait4_142:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_142
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_142:
    brnz %r16, ibp_wait4_142
    ld [%r23], %r16
    ba ibp_startwait4_142
    mov 0x4, %r16
continue_ibp_4_142:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_142:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_142
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_142:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_142
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_142:
    best_set_reg(0x00000040f5c93ab9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa9b107c7  ! 191: PDIST	pdistn	%d4, %d38, %d20
	.word 0xd737e1b8  ! 192: STQF_I	-	%f11, [0x01b8, %r31]
splash_cmpr_4_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 193: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_4_144:
	tsubcctv %r18, 0x19c8, %r9
	.word 0xd607e027  ! 194: LDUW_I	lduw	[%r31 + 0x0027], %r11
	.word 0xa4ac8003  ! 195: ANDNcc_R	andncc 	%r18, %r3, %r18
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_4_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd8e5ed017dca51d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_4_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0x837, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f803903  ! 198: SIR	sir	0x1903
ibp_4_147:
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
ibp_startwait4_147:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_147
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_147:
    brnz %r16, ibp_wait4_147
    ld [%r23], %r16
    ba ibp_startwait4_147
    mov 0x4, %r16
continue_ibp_4_147:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_147:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_4_147
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_147:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_ibp_4_147
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_147:
    best_set_reg(0x00000040a4fab9cf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc013  ! 199: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_4_149:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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
splash_lsu_2_0:
	nop
	ta T_CHANGE_HPRIV
	set 0x65c8cb24, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_2_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0e0  ! 1: STDFA_I	stda	%f16, [0x00e0, %r31]
splash_lsu_2_2:
	nop
	ta T_CHANGE_HPRIV
	set 0xdf91d7a4, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_3:
	nop
	ta T_CHANGE_HPRIV
	set 0x3ed4c6f5, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e168  ! 4: STX_I	stx	%r17, [%r31 + 0x0168]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x93d02034  ! 6: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_2_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe2800c80  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r17
	fbe skip_2_6
	.word 0xc36a3554  ! 1: PREFETCH_I	prefetch	[%r8 + 0xfffff554], #one_read
.align 512
skip_2_6:
	.word 0xc36fe09f  ! 10: PREFETCH_I	prefetch	[%r31 + 0x009f], #one_read
splash_hpstate_2_7:
	ta T_CHANGE_NONHPRIV
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x81983c17  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c17, %hpstate
unsupttte_2_8:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87acca4d  ! 12: FCMPd	fcmpd	%fcc<n>, %f50, %f44
	.word 0xd48008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	setx 0x61d59d1873d7d0b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_2_10:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c84a00  ! 15: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r10
ibp_2_11:
	nop
	.word 0xa5b4c485  ! 16: FCMPLE32	fcmple32	%d50, %d36, %r18
	.word 0xe69fdd40  ! 17: LDDA_R	ldda	[%r31, %r0] 0xea, %r19
brcommon3_2_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e070  ! 1: STQF_I	-	%f19, [0x0070, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc012  ! 18: STXFSR_R	st-sfr	%f1, [%r18, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_2_13:
	.word 0x819837d7  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17d7, %hpstate
intveclr_2_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x251890d689e677cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_2_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_15
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
cwq_2_15:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 22: RDPC	rd	%pc, %r12
	.word 0xd8d7e0d0  ! 23: LDSHA_I	ldsha	[%r31, + 0x00d0] %asi, %r12
	.word 0xc19fc2c0  ! 24: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_16) + 40, 16, 16)) -> intp(7,0,3)
#else
	setx 0x3f274d394039f261, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_2_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb184c014  ! 28: WR_STICK_REG_R	wr	%r19, %r20, %-
	.word 0xd877e08a  ! 29: STX_I	stx	%r12, [%r31 + 0x008a]
tagged_2_18:
	tsubcctv %r8, 0x14a2, %r12
	.word 0xd807e186  ! 30: LDUW_I	lduw	[%r31 + 0x0186], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_2_20:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8904b60  ! 32: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r12
fpinit_2_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 33: FCMPLE32	fcmple32	%d0, %d4, %r6
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
    brnz %r10, cwq_2_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_22
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
cwq_2_22:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 34: RDPC	rd	%pc, %r8
jmptr_2_23:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_24:
	rd %pc, %r12
	add %r12, (donretarg_2_24-donret_2_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008f7400 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f8f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_24:
	.word 0xd66fe03a  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x003a]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_25:
	rd %pc, %r12
	add %r12, (donretarg_2_25-donret_2_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005d9d00 | (0x55 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1705, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_25:
	.word 0x21400001  ! 37: FBPN	fbn,a,pn	%fcc0, <label_0x1>
fpinit_2_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 38: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_2_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d94800c  ! 41: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
ibp_2_28:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd63fe0d0  ! 42: STD_I	std	%r11, [%r31 + 0x00d0]
fpinit_2_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 43: FDIVs	fdivs	%f0, %f4, %f4
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
    brnz %r10, cwq_2_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_30
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
cwq_2_30:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 44: RDPC	rd	%pc, %r13
	.word 0xe4dfe038  ! 45: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r18
	.word 0xa5a349a4  ! 46: FDIVs	fdivs	%f13, %f4, %f18
ibp_2_32:
	nop
	.word 0xc3ec402b  ! 47: PREFETCHA_R	prefetcha	[%r17, %r11] 0x01, #one_read
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
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 48: CASA_R	casa	[%r31] %asi, %r16, %r18
change_to_randtl_2_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc1bfc2c0  ! 50: STDFA_R	stda	%f0, [%r0, %r31]
pmu_2_35:
	nop
	setx 0xfffffc81ffffffae, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_36:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 52: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_37:
	rd %pc, %r12
	add %r12, (donretarg_2_37-donret_2_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00143500 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x48d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_37:
	.word 0xe4ffe034  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x0034] %asi
	.word 0x91508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_2_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe1c0  ! 1: STXFSR_I	st-sfr	%f1, [0x01c0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99b187c7  ! 55: PDIST	pdistn	%d6, %d38, %d12
trapasi_2_39:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8904980  ! 56: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_2_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 57: CASA_R	casa	[%r31] %asi, %r17, %r12
	fbu,a,pn	%fcc0,  skip_2_41
	fbuge,a,pn	%fcc0,  skip_2_41
.align 128
skip_2_41:
	.word 0xd83fc000  ! 58: STD_R	std	%r12, [%r31 + %r0]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_42:
	rd %pc, %r12
	add %r12, (donretarg_2_42-donret_2_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f7ec00 | (32 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x67d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_42:
	.word 0xd86fe1e5  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x01e5]
unsupttte_2_43:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aa4a45  ! 60: FCMPd	fcmpd	%fcc<n>, %f40, %f36
splash_hpstate_2_44:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x81982c1b  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1b, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_45:
	rd %pc, %r12
	add %r12, (donretarg_2_45-donret_2_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0016a300 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x22cc4001  ! 1: BRZ	brz,a,pt	%r17,<label_0xc4001>
	done
donretarg_2_45:
	.word 0x28800001  ! 62: BLEU	bleu,a	<label_0x1>
	.word 0xe0c7e0c0  ! 63: LDSWA_I	ldswa	[%r31, + 0x00c0] %asi, %r16
trapasi_2_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0d04e60  ! 64: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r16
jmptr_2_47:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_48:
	nop
	setx 0xfffff078fffff8e8, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_49:
	nop
	.word 0xe13fc00d  ! 67: STDF_R	std	%f16, [%r13, %r31]
fpinit_2_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 68: FDIVs	fdivs	%f0, %f4, %f6
splash_tba_2_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800aa0  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r16
	.word 0x957038fc  ! 72: POPC_I	popc	0x18fc, %r10
	.word 0xd48008a0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
fpinit_2_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 74: FCMPLE32	fcmple32	%d0, %d4, %r4
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
    brnz %r10, cwq_2_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_54
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
cwq_2_54:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 75: RDPC	rd	%pc, %r18
	.word 0x91944014  ! 76: WRPR_PIL_R	wrpr	%r17, %r20, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_56) + 56, 16, 16)) -> intp(3,0,25)
#else
	setx 0xa5aaa5d43a45e7d5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1e64516ffe5d485c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe0d9  ! 79: STDA_I	stda	%r11, [%r31 + 0x00d9] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_2_58:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 81: RDTICK	rd	%tick, %r10
brcommon3_2_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe060  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0060]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc009  ! 82: STXFSR_R	st-sfr	%f1, [%r9, %r31]
	.word 0xd68008a0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
jmptr_2_60:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x9334c7222a8a4a4a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
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
	.word 0x99414000  ! 86: RDPC	rd	%pc, %r12
	.word 0xe2800a80  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r17
ibp_2_63:
	nop
	.word 0xc19fe120  ! 88: LDDFA_I	ldda	[%r31, 0x0120], %f0
ibp_2_64:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9f802050  ! 89: SIR	sir	0x0050
jmptr_2_65:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe094  ! 91: STB_I	stb	%r17, [%r31 + 0x0094]
	.word 0xe19fdf20  ! 92: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c02a  ! 94: CASA_I	casa	[%r31] 0x 1, %r10, %r17
	setx 0x701b4b36bafdfec7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_2_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d94c008  ! 97: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
fpinit_2_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 98: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa1902009  ! 99: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_2_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d914011  ! 100: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 103: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_2_73:
	ta T_CHANGE_NONHPRIV
	.word 0x26ccc001  ! 1: BRLZ	brlz,a,pt	%r19,<label_0xcc001>
	.word 0x8198260e  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
splash_hpstate_2_74:
	ta T_CHANGE_NONHPRIV
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x81983ec9  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ec9, %hpstate
	.word 0x91920010  ! 106: WRPR_PIL_R	wrpr	%r8, %r16, %pil
trapasi_2_76:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2884b40  ! 107: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r17
mondo_2_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d90c001  ! 108: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
dvapa_2_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0x966, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7a449c5  ! 109: FDIVd	fdivd	%f48, %f36, %f50
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
ibp_2_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe71fe070  ! 111: LDDF_I	ldd	[%r31, 0x0070], %f19
splash_lsu_2_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x930b4679, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_2_81:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_2_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe09374724f79d520, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7094fc7fd7490b12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 116: WRPR_GL_I	wrpr	%r0, 0x000d, %-
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
    brnz %r10, cwq_2_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_84
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
cwq_2_84:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 117: RDPC	rd	%pc, %r20
fpinit_2_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8390a  ! 118: PREFETCHA_I	prefetcha	[%r0, + 0xfffff90a] %asi, #one_read
ibp_2_86:
	nop
	.word 0xc32fc011  ! 119: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	setx 0x0e37359b8589ab58, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_88) + 32, 16, 16)) -> intp(1,0,21)
#else
	setx 0x9e8dd2df7b442c1b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	fbule skip_2_90
	.word 0x87aa8a51  ! 1: FCMPd	fcmpd	%fcc<n>, %f10, %f48
.align 512
skip_2_90:
	.word 0x39400001  ! 123: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d92c001  ! 124: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
ibp_2_92:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x977021f5  ! 126: POPC_I	popc	0x01f5, %r11
	.word 0x8d802004  ! 127: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 128: WRFPRS_I	wr	%r0, 0x0000, %fprs
unsupttte_2_93:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9bb48490  ! 129: FCMPLE32	fcmple32	%d18, %d16, %r13
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 130: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_2_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 131: FDIVd	fdivd	%f0, %f4, %f4
intveclr_2_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa569d870f72a4132, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf81053f5320ae7ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x5a2ab0c642e4d53c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91914004  ! 135: WRPR_PIL_R	wrpr	%r5, %r4, %pil
	.word 0xa1a00173  ! 136: FABSq	dis not found

mondo_2_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 137: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
splash_cmpr_2_101:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 138: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	fbul,a,pn	%fcc0,  skip_2_102
	bcc  	 skip_2_102
.align 1024
skip_2_102:
	.word 0xc36fe127  ! 139: PREFETCH_I	prefetch	[%r31 + 0x0127], #one_read
intveclr_2_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0x22cb133fc5e33600, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa781bf12  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x1f12, %-
	.word 0x83d020b5  ! 142: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x93a00174  ! 143: FABSq	dis not found

splash_cmpr_2_105:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 144: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_2_106:
    set user_data_start, %o7
	.word 0x93902006  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
mondo_2_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 146: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
brcommon3_2_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe020  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0020]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe9e7e013  ! 147: CASA_R	casa	[%r31] %asi, %r19, %r20
ibp_2_109:
	nop
	.word 0xc3eac034  ! 148: PREFETCHA_R	prefetcha	[%r11, %r20] 0x01, #one_read
trapasi_2_110:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4884a00  ! 149: LDUBA_R	lduba	[%r1, %r0] 0x50, %r10
	setx 0x7c49be461b761cbb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_112:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 151: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_2_113:
	nop
	ta T_CHANGE_HPRIV
	set 0xc4f5295f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_2_114:
	nop
	ta T_CHANGE_HPRIV
	set 0x941c5f72, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_115:
	nop
	setx 0xfffff61cfffff567, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_116) + 24, 16, 16)) -> intp(5,0,22)
#else
	setx 0x7d654b5c5f038f86, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9848012  ! 157: WR_SET_SOFTINT_R	wr	%r18, %r18, %set_softint
	.word 0xa5a109a6  ! 158: FDIVs	fdivs	%f4, %f6, %f18
	.word 0x9bb44591  ! 159: FCMPGT32	fcmpgt32	%d48, %d48, %r13
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_2_119:
	ta T_CHANGE_NONHPRIV
	.word 0x2accc001  ! 1: BRNZ	brnz,a,pt	%r19,<label_0xcc001>
	.word 0x81983f84  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f84, %hpstate
	.word 0x8d90305e  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x105e, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe19fda00  ! 164: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0xb514b1c65dea9ed7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_2_122:
	nop
	.word 0xc1bfd960  ! 166: STDFA_R	stda	%f0, [%r0, %r31]
splash_lsu_2_123:
	nop
	ta T_CHANGE_HPRIV
	set 0x64f54083, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_2_124:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_125:
	rd %pc, %r12
	add %r12, (donretarg_2_125-donret_2_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00441200 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x947, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_2_125:
	.word 0x39400001  ! 170: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fdf20  ! 171: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_2_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0904e60  ! 172: LDUHA_R	lduha	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_2_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 174: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e038  ! 176: STF_I	st	%f8, [0x0038, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e0ac  ! 178: STX_I	stx	%r8, [%r31 + 0x00ac]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_132) + 24, 16, 16)) -> intp(3,0,19)
#else
	setx 0x83f20cb05f9ddcb6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 180: WRASI_I	wr	%r0, 0x0010, %asi
	setx 0x86f4730f09cdf14d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e18e  ! 182: STH_I	sth	%r8, [%r31 + 0x018e]
	.word 0xd1e7e00d  ! 183: CASA_R	casa	[%r31] %asi, %r13, %r8
br_badelay2_2_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x95b24301  ! 184: ALIGNADDRESS	alignaddr	%r9, %r1, %r10
splash_tba_2_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_2_137:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe2c04a00  ! 186: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r17
ceter_2_138:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 187: RDTICK	rd	%tick, %r13
intveclr_2_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0x924eefbd1721eb52, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_2_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe714c005  ! 1: LDQF_R	-	[%r19, %r5], %f19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe0a0  ! 189: LDDFA_I	ldda	[%r31, 0x00a0], %f0
trapasi_2_141:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6c84b40  ! 190: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r19
ibp_2_142:
	nop
	.word 0xa3a409a8  ! 191: FDIVs	fdivs	%f16, %f8, %f17
	.word 0xd737e0ec  ! 192: STQF_I	-	%f11, [0x00ec, %r31]
splash_cmpr_2_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 193: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_2_144:
	tsubcctv %r18, 0x17b9, %r10
	.word 0xd607e0ea  ! 194: LDUW_I	lduw	[%r31 + 0x00ea], %r11
	.word 0xa0ab4007  ! 195: ANDNcc_R	andncc 	%r13, %r7, %r16
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_2_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0x080883bacdc74b63, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_2_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb97, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b04494  ! 198: FCMPLE32	fcmple32	%d32, %d20, %r11
ibp_2_147:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd897c02a  ! 199: LDUHA_R	lduha	[%r31, %r10] 0x01, %r12
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_2_149:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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
splash_lsu_1_0:
	nop
	ta T_CHANGE_HPRIV
	set 0xb66c0f73, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
ibp_1_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdb60  ! 1: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_1_2:
	nop
	ta T_CHANGE_HPRIV
	set 0x80a4947e, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 2: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_3:
	nop
	ta T_CHANGE_HPRIV
	set 0xb72cd82b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 3: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe277e0a8  ! 4: STX_I	stx	%r17, [%r31 + 0x00a8]
	.word 0x30780001  ! 5: BPA	<illegal instruction>
	.word 0x91d020b4  ! 6: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x89800011  ! 7: WRTICK_R	wr	%r0, %r17, %tick
splash_htba_1_5:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 8: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe2800c40  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r17
	.word 0xc32fc000  ! 10: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_hpstate_1_7:
	ta T_CHANGE_NONHPRIV
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x81982185  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	.word 0xc3e9c030  ! 12: PREFETCHA_R	prefetcha	[%r7, %r16] 0x01, #one_read
	.word 0xd4800c80  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	setx 0x5b65c7308db317d3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_9:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
trapasi_1_10:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 15: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
ibp_1_11:
	nop
	.word 0xa7b0c7cd  ! 16: PDIST	pdistn	%d34, %d44, %d50
	.word 0xe69fc2c0  ! 17: LDDA_R	ldda	[%r31, %r0] 0x16, %r19
brcommon3_1_12:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe737e0b0  ! 1: STQF_I	-	%f19, [0x00b0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc00b  ! 18: STXFSR_R	st-sfr	%f1, [%r11, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 19: LDX_R	ldx	[%r31 + %r0], %r19
splash_hpstate_1_13:
	.word 0x819829d7  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d7, %hpstate
intveclr_1_14:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0ab9a60f3c906aef, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 21: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_1_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_15
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
cwq_1_15:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 22: RDPC	rd	%pc, %r12
	.word 0xd8d7e158  ! 23: LDSHA_I	ldsha	[%r31, + 0x0158] %asi, %r12
	.word 0xc19fda00  ! 24: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_16) + 16, 16, 16)) -> intp(2,0,20)
#else
	setx 0x8ccf44bd0a50b5c4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_16:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tba_1_17:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 26: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd85fc000  ! 27: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xb180c00a  ! 28: WR_STICK_REG_R	wr	%r3, %r10, %-
	.word 0xd877e198  ! 29: STX_I	stx	%r12, [%r31 + 0x0198]
tagged_1_18:
	tsubcctv %r20, 0x1fb4, %r20
	.word 0xd807e1bb  ! 30: LDUW_I	lduw	[%r31 + 0x01bb], %r12
	.word 0x89800011  ! 31: WRTICK_R	wr	%r0, %r17, %tick
trapasi_1_20:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8884b60  ! 32: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r12
fpinit_1_21:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83df7  ! 33: PREFETCHA_I	prefetcha	[%r0, + 0xfffffdf7] %asi, #one_read
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
    brnz %r10, cwq_1_22
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_22
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
cwq_1_22:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 34: RDPC	rd	%pc, %r11
jmptr_1_23:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 35: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_24:
	rd %pc, %r12
	add %r12, (donretarg_1_24-donret_1_24+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00432600 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x140c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_24:
	.word 0xd66fe05b  ! 36: LDSTUB_I	ldstub	%r11, [%r31 + 0x005b]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_25:
	rd %pc, %r12
	add %r12, (donretarg_1_25-donret_1_25+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009d9d00 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_25:
	.word 0x3c800001  ! 37: BPOS	bpos,a	<label_0x1>
fpinit_1_26:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 38: FDIVd	fdivd	%f0, %f4, %f4
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd65fc000  ! 39: LDX_R	ldx	[%r31 + %r0], %r11
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd65fc000  ! 40: LDX_R	ldx	[%r31 + %r0], %r11
mondo_1_27:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d928006  ! 41: WRPR_WSTATE_R	wrpr	%r10, %r6, %wstate
ibp_1_28:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 42: CASA_R	casa	[%r31] %asi, %r18, %r11
fpinit_1_29:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 43: FDIVd	fdivd	%f0, %f4, %f4
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
    brnz %r10, cwq_1_30
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_30
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
cwq_1_30:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 44: RDPC	rd	%pc, %r18
	.word 0xe4dfe128  ! 45: LDXA_I	ldxa	[%r31, + 0x0128] %asi, %r18
	.word 0xa9703a17  ! 46: POPC_I	popc	0x1a17, %r20
ibp_1_32:
	nop
	.word 0x87acca45  ! 47: FCMPd	fcmpd	%fcc<n>, %f50, %f36
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
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_33:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 48: CASA_R	casa	[%r31] %asi, %r20, %r18
change_to_randtl_1_34:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_34:
	.word 0x8f902000  ! 49: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe1bfd960  ! 50: STDFA_R	stda	%f16, [%r0, %r31]
pmu_1_35:
	nop
	setx 0xffffff59fffffe68, %g1, %g7
	.word 0xa3800007  ! 51: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_36:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 52: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_37:
	rd %pc, %r12
	add %r12, (donretarg_1_37-donret_1_37), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0041db00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x190d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_37:
	.word 0xe4ffe0d2  ! 53: SWAPA_I	swapa	%r18, [%r31 + 0x00d2] %asi
	.word 0xa1508000  ! 54: RDPR_TSTATE	<illegal instruction>
brcommon1_1_38:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe110  ! 1: STXFSR_I	st-sfr	%f1, [0x0110, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87a88a52  ! 55: FCMPd	fcmpd	%fcc<n>, %f2, %f18
trapasi_1_39:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 56: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
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
    brnz %r10, sma_1_40
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_40:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 57: CASA_R	casa	[%r31] %asi, %r20, %r12
	.word 0xc32fc000  ! 58: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_42:
	rd %pc, %r12
	add %r12, (donretarg_1_42-donret_1_42+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0050bb00 | (0x82 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x19bf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	retry
donretarg_1_42:
	.word 0xd86fe137  ! 59: LDSTUB_I	ldstub	%r12, [%r31 + 0x0137]
	.word 0x87ad0a47  ! 60: FCMPd	fcmpd	%fcc<n>, %f20, %f38
splash_hpstate_1_44:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x819834e5  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x14e5, %hpstate
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_45:
	rd %pc, %r12
	add %r12, (donretarg_1_45-donret_1_45), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ac3400 | (28 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x150d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_1_45:
	.word 0x30800001  ! 62: BA	ba,a	<label_0x1>
	.word 0xe0c7e100  ! 63: LDSWA_I	ldswa	[%r31, + 0x0100] %asi, %r16
trapasi_1_46:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xe0904e60  ! 64: LDUHA_R	lduha	[%r1, %r0] 0x73, %r16
jmptr_1_47:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 65: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_48:
	nop
	setx 0xfffff63effffffa7, %g1, %g7
	.word 0xa3800007  ! 66: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_49:
	nop
	.word 0xe03fe190  ! 67: STD_I	std	%r16, [%r31 + 0x0190]
fpinit_1_50:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 68: FDIVs	fdivs	%f0, %f4, %f6
splash_tba_1_51:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe05fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800c00  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r16
	.word 0xc3eac025  ! 72: PREFETCHA_R	prefetcha	[%r11, %r5] 0x01, #one_read
	.word 0xd4800ba0  ! 73: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
fpinit_1_53:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 74: FDIVd	fdivd	%f0, %f4, %f6
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
    brnz %r10, cwq_1_54
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_54
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
cwq_1_54:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 75: RDPC	rd	%pc, %r11
	.word 0x9194c011  ! 76: WRPR_PIL_R	wrpr	%r19, %r17, %pil
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_56) + 16, 16, 16)) -> intp(4,0,18)
#else
	setx 0xe5383b1b5b8f62b4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_56:
	.word 0x39400001  ! 77: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_57:
	nop
	ta T_CHANGE_HPRIV
	setx 0x78963398d1041c06, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 78: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd6bfe1c0  ! 79: STDA_I	stda	%r11, [%r31 + 0x01c0] %asi
	.word 0xd737c000  ! 80: STQF_R	-	%f11, [%r0, %r31]
ceter_1_58:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 81: RDTICK	rd	%tick, %r11
brcommon3_1_59:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd66fe130  ! 1: LDSTUB_I	ldstub	%r11, [%r31 + 0x0130]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6dfc031  ! 82: LDXA_R	ldxa	[%r31, %r17] 0x01, %r11
	.word 0xd6800bc0  ! 83: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
jmptr_1_60:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 84: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xecb470fa9d13d3d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_61:
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0xa3414000  ! 86: RDPC	rd	%pc, %r17
	.word 0xe28008a0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
ibp_1_63:
	nop
	.word 0xe19fe080  ! 88: LDDFA_I	ldda	[%r31, 0x0080], %f16
ibp_1_64:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e012  ! 89: CASA_R	casa	[%r31] %asi, %r18, %r17
jmptr_1_65:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 90: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe22fe12d  ! 91: STB_I	stb	%r17, [%r31 + 0x012d]
	.word 0xc19fda00  ! 92: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x89800011  ! 93: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe3e7c029  ! 94: CASA_I	casa	[%r31] 0x 1, %r9, %r17
	setx 0x56cdfc7141f28ee1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_67:
	.word 0x39400001  ! 95: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe25fc000  ! 96: LDX_R	ldx	[%r31 + %r0], %r17
mondo_1_68:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 97: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
fpinit_1_69:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 98: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xa190200a  ! 99: WRPR_GL_I	wrpr	%r0, 0x000a, %-
mondo_1_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d934004  ! 100: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_71:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 102: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8d802000  ! 103: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_hpstate_1_73:
	ta T_CHANGE_NONHPRIV
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982c48  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c48, %hpstate
splash_hpstate_1_74:
	ta T_CHANGE_NONHPRIV
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x81983a5e  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5e, %hpstate
	.word 0x9194400d  ! 106: WRPR_PIL_R	wrpr	%r17, %r13, %pil
trapasi_1_76:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xe2c04b40  ! 107: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r17
mondo_1_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d920013  ! 108: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
dvapa_1_78:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe66, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80390a  ! 109: SIR	sir	0x190a
	.word 0xe727c000  ! 110: STF_R	st	%f19, [%r0, %r31]
ibp_1_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc034  ! 111: STDA_R	stda	%r19, [%r31 + %r20] 0x01
splash_lsu_1_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xfc4d8d8e, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 112: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_1_81:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 113: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_1_82:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe53e97973e365605, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 114: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_83:
	nop
	ta T_CHANGE_HPRIV
	setx 0x86a131d9e3f904a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 115: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 116: WRPR_GL_I	wrpr	%r0, 0x0002, %-
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
    brnz %r10, cwq_1_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_84
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
cwq_1_84:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 117: RDPC	rd	%pc, %r9
fpinit_1_85:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 118: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ibp_1_86:
	nop
	.word 0xd23fe050  ! 119: STD_I	std	%r9, [%r31 + 0x0050]
	setx 0xbe1366211319f2fd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_87:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_88) + 40, 16, 16)) -> intp(2,0,9)
#else
	setx 0x1e1d76113ed1f2ca, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_88:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 122: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x91a509d3  ! 123: FDIVd	fdivd	%f20, %f50, %f8
mondo_1_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 124: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
ibp_1_92:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87acca43  ! 126: FCMPd	fcmpd	%fcc<n>, %f50, %f34
	.word 0x8d802004  ! 127: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802004  ! 128: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x95a209b3  ! 129: FDIVs	fdivs	%f8, %f19, %f10
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_1_94:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e821f5  ! 131: PREFETCHA_I	prefetcha	[%r0, + 0x01f5] %asi, #one_read
intveclr_1_95:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaa831cc36299870f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 132: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_96:
	nop
	ta T_CHANGE_HPRIV
	setx 0x18248dded07258ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 133: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x65af5419e612beaf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_97:
	.word 0x39400001  ! 134: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91940010  ! 135: WRPR_PIL_R	wrpr	%r16, %r16, %pil
	.word 0x91a00173  ! 136: FABSq	dis not found

mondo_1_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d91000c  ! 137: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
splash_cmpr_1_101:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 138: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc32fc000  ! 139: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_1_103:
	nop
	ta T_CHANGE_HPRIV
	setx 0x10a61606d364af52, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 140: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa780e499  ! 141: WR_GRAPHICS_STATUS_REG_I	wr	%r3, 0x0499, %-
	.word 0x91d020b3  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa9a0016c  ! 143: FABSq	dis not found

splash_cmpr_1_105:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 144: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
cwp_1_106:
    set user_data_start, %o7
	.word 0x93902007  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
mondo_1_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d92000a  ! 146: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
brcommon3_1_108:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe110  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0110]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe83fe100  ! 147: STD_I	std	%r20, [%r31 + 0x0100]
ibp_1_109:
	nop
	.word 0x95a509b1  ! 148: FDIVs	fdivs	%f20, %f17, %f10
trapasi_1_110:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd4c04a00  ! 149: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r10
	setx 0xe80d12028348b6fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_111:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_112:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 151: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_1_113:
	nop
	ta T_CHANGE_HPRIV
	set 0x63e38e5c, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81510000  ! 153: RDPR_TICK	rdpr	%tick, %r0
splash_lsu_1_114:
	nop
	ta T_CHANGE_HPRIV
	set 0x2a265a05, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 154: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_115:
	nop
	setx 0xfffff0f6fffff260, %g1, %g7
	.word 0xa3800007  ! 155: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_116) + 32, 16, 16)) -> intp(7,0,28)
#else
	setx 0xe06488c6015a8d22, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_116:
	.word 0x39400001  ! 156: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa984800b  ! 157: WR_SET_SOFTINT_R	wr	%r18, %r11, %set_softint
	.word 0xa9703389  ! 158: POPC_I	popc	0x1389, %r20
	.word 0x91b24591  ! 159: FCMPGT32	fcmpgt32	%d40, %d48, %r8
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 160: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_hpstate_1_119:
	ta T_CHANGE_NONHPRIV
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81982647  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
	.word 0x8d9035eb  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x15eb, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe19fd960  ! 164: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x603d4a5673d0a5fe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_121:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_1_122:
	nop
	.word 0xe1bfdb60  ! 166: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_1_123:
	nop
	ta T_CHANGE_HPRIV
	set 0x05380d76, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 168: LDX_R	ldx	[%r31 + %r0], %r8
jmptr_1_124:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 169: JMPL_R	jmpl	%r27 + %r0, %r27
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_125:
	rd %pc, %r12
	add %r12, (donretarg_1_125-donret_1_125), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00029400 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 30, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_125:
	.word 0x20800001  ! 170: BN	bn,a	<label_0x1>
	.word 0xc1bfdb60  ! 171: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_1_127:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x73) 
	.word 0xd0d04e60  ! 172: LDSHA_R	ldsha	[%r1, %r0] 0x73, %r8
	.word 0x89800011  ! 173: WRTICK_R	wr	%r0, %r17, %tick
fpinit_1_129:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83389  ! 174: PREFETCHA_I	prefetcha	[%r0, + 0xfffff389] %asi, #one_read
	.word 0x89800011  ! 175: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd127e13c  ! 176: STF_I	st	%f8, [0x013c, %r31]
	.word 0x89800011  ! 177: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd077e020  ! 178: STX_I	stx	%r8, [%r31 + 0x0020]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_132) + 24, 16, 16)) -> intp(5,0,28)
#else
	setx 0x2eb71e3a4b1aedd4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_132:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 180: WRASI_I	wr	%r0, 0x0016, %asi
	setx 0xbaee2abb4b2108cd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_133:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd037e1c2  ! 182: STH_I	sth	%r8, [%r31 + 0x01c2]
	.word 0xd1e7e012  ! 183: CASA_R	casa	[%r31] %asi, %r18, %r8
br_badelay2_1_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa3b2830c  ! 184: ALIGNADDRESS	alignaddr	%r10, %r12, %r17
splash_tba_1_136:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 185: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_1_137:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe2c04a00  ! 186: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r17
ceter_1_138:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 187: RDTICK	rd	%tick, %r20
intveclr_1_139:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa276110d620065d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_1_140:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe0b0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x00b0], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fd920  ! 189: LDDFA_R	ldda	[%r31, %r0], %f0
trapasi_1_141:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xe6d84b40  ! 190: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r19
ibp_1_142:
	nop
	.word 0x97a4c9b1  ! 191: FDIVs	fdivs	%f19, %f17, %f11
	.word 0xd737e0c4  ! 192: STQF_I	-	%f11, [0x00c4, %r31]
splash_cmpr_1_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 193: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
tagged_1_144:
	tsubcctv %r18, 0x13b4, %r20
	.word 0xd607e179  ! 194: LDUW_I	lduw	[%r31 + 0x0179], %r11
	.word 0x94ac0011  ! 195: ANDNcc_R	andncc 	%r16, %r17, %r10
	.word 0xd4bfc020  ! 196: STDA_R	stda	%r10, [%r31 + %r0] 0x01
intveclr_1_145:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb5948b680b28adbd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_1_146:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdd2, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a4c9a2  ! 198: FDIVs	fdivs	%f19, %f2, %f12
ibp_1_147:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc034  ! 199: LDXA_R	ldxa	[%r31, %r20] 0x01, %r12
	.word 0x89800011  ! 200: WRTICK_R	wr	%r0, %r17, %tick
jmptr_1_149:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 201: JMPL_R	jmpl	%r27 + %r0, %r27
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

	.xword	0xdac509ef556d457e
	.xword	0x31cb8de032a5a2c9
	.xword	0xc19eacb85f3079ce
	.xword	0xb059b3252b1d30c4
	.xword	0x3a0d6b47fba8e2b7
	.xword	0x19e6710f72de70c5
	.xword	0x0c4b41af490cd716
	.xword	0x819eb8f859893f5a
	.xword	0xe5599b7717b1b4d8
	.xword	0xd10a81f889cacf6c
	.xword	0xce8906021275795d
	.xword	0x7feca4e426f3ceb9
	.xword	0x40695a194bf44a23
	.xword	0x10d3b845c2938249
	.xword	0x04192b96095341dc
	.xword	0xe9a3cb084cb9d8f1
	.xword	0xc8d4624fbeeb5ab2
	.xword	0x6d52d1737977a7b3
	.xword	0x3c778a397b926073
	.xword	0x34b73be7d6b69aa4
	.xword	0xc113488d6940ad0a
	.xword	0xb8ddec3b3a386f3e
	.xword	0xb89c4ff25183fefe
	.xword	0xcbb8749b93559108
	.xword	0x822d47954274550e
	.xword	0x5b1cb1e71886a734
	.xword	0xa7f307fb7c3a538a
	.xword	0x8a0866fb286df290
	.xword	0xdef36f5b241e0d48
	.xword	0x4be7808b83d223f4
	.xword	0xba7b3eb60591e494
	.xword	0xd5700b6db4e12274
	.xword	0xbc133158d544309e
	.xword	0xcfabcf1e76c52129
	.xword	0xfd89c860765d3db1
	.xword	0x05c195a9d6d10142
	.xword	0x77cb7e3d0e72563d
	.xword	0x8603d06de17e0fd0
	.xword	0x659f2b374da986e9
	.xword	0x42dc45a93191b7b8
	.xword	0x8ee3b369a09a0eb6
	.xword	0x4475c709a1e05e5a
	.xword	0xb33d4224bba76611
	.xword	0x285985ebbd35cafe
	.xword	0x38ac03406fcb3442
	.xword	0x9117a6347c4e78ac
	.xword	0xad3f43162ce20f4b
	.xword	0x064c8f2e50cec4d2
	.xword	0x799157b58ffe8937
	.xword	0x3b99575dda1c87a8
	.xword	0xc33f24c698e9f221
	.xword	0x691f4e4a92bb952f
	.xword	0xfa8e4caf6a00832b
	.xword	0x54ce435b6873703a
	.xword	0x4a4762705f3e5581
	.xword	0x4c2697b2c963f2f1
	.xword	0x2efd2500178df9b8
	.xword	0x42483e04d9cdbb36
	.xword	0x49bd9d6ddcfe1372
	.xword	0xc267cd78eb9fb5d0
	.xword	0x2cba490ea0083d30
	.xword	0x4f996db2c5ca6276
	.xword	0x008802f46228f28e
	.xword	0xc6f7324ee5e08d49
	.xword	0x7782ee2ab541a5b1
	.xword	0xb9d51512eb8fb99a
	.xword	0x53d38ffa6f95268d
	.xword	0x85f8129a865050a4
	.xword	0xfc26c56933bb63d6
	.xword	0x58f0d475014b21ca
	.xword	0x6f88eb90e322bbac
	.xword	0x803bb5ec79562cd7
	.xword	0x9dc5d15687e51e72
	.xword	0x903d5ef43522edcb
	.xword	0x05d22357b5ded22a
	.xword	0x86bb5d040b51c7b4
	.xword	0x3819c767e2af8060
	.xword	0x07720246e4c6c917
	.xword	0xcc1d7d045d0b39b2
	.xword	0x40d2a1b96fdca589
	.xword	0x6cdaa264929d484a
	.xword	0xb7e245006bb7a216
	.xword	0x90990e7b96c9a4b6
	.xword	0x97aa070f8028c67b
	.xword	0x7de77861888780fc
	.xword	0xdf83c63e6cd56d38
	.xword	0xe8e818aca03b39e5
	.xword	0x916f891f79d3f31d
	.xword	0x389081bb82bb606b
	.xword	0xa662a8231c670fcb
	.xword	0x7290ecea1b27bb36
	.xword	0x529fa5d9156e8153
	.xword	0x28d992bf6d09776e
	.xword	0x9164ffc307e81c98
	.xword	0xb04ce2d638b281f6
	.xword	0xdea2765305285d2c
	.xword	0xb6ddbc0e57643121
	.xword	0x5a01058bce26ee07
	.xword	0x9bab57cbaba5fdde
	.xword	0xa69094eea2f1b7d3
	.xword	0x92a794275cd1d3a9
	.xword	0x11ca21964e1a5747
	.xword	0x5a8c9d4619cdea2d
	.xword	0xa87f8d471c9405f4
	.xword	0x1447b81d260ffd87
	.xword	0x253b6b39ad314cf8
	.xword	0x80a6b3b0d294d2c6
	.xword	0x6f33b24da0da0b6f
	.xword	0xd22d9474dc67b788
	.xword	0xe44c2e40b267b002
	.xword	0xb1a15c532c46cdee
	.xword	0x70a63ed5082df9ff
	.xword	0x32d27e8d518f0403
	.xword	0x1eb22216db839c90
	.xword	0x482090dc0942732c
	.xword	0xd0c87f2b3e938999
	.xword	0x7b63079d67baf411
	.xword	0xd8f257b4d59a0d7f
	.xword	0x774db739901b7418
	.xword	0x651e3174dfc450ab
	.xword	0x508f7a0e07e8e1b3
	.xword	0xfac9fd3f60091199
	.xword	0x81758ab4f322d189
	.xword	0x5dfcf9ad57bf0292
	.xword	0x9a8c031a843f0910
	.xword	0x1a3ca000418a9262
	.xword	0x7156491c5e10ee69
	.xword	0x36d97fb7b6825af6
	.xword	0x75e25591e46ca030
	.xword	0x0e7d9ae138812428
	.xword	0xbdc5eb4cf896fae2
	.xword	0xb8a2fcf667097c8c
	.xword	0x3dff32a6264128ba
	.xword	0x0968320cc6e509eb
	.xword	0x7a9b2e0adfff9d74
	.xword	0xf2249b9eb5fb687c
	.xword	0x26358772d34cd390
	.xword	0x2a3f61e27fafaa56
	.xword	0xf8e304bed5b98328
	.xword	0x8901f86463d57696
	.xword	0xbd16d18d2ea55d6a
	.xword	0x8e8a67e132f939bc
	.xword	0xf1041d4939c4d03a
	.xword	0xd5dcfdbc70ddf6b4
	.xword	0xa7d41dfc0872efe7
	.xword	0x83fe2b8f0724a4ae
	.xword	0xd6f59ccb40d1563b
	.xword	0x246824cc3329f4a9
	.xword	0x698b63311e328e71
	.xword	0x615f02e0ae6e6f13
	.xword	0x09dd043cb71b444a
	.xword	0xeb9b6ecdc6513b59
	.xword	0x38faa0131c8deaca
	.xword	0xfb674f66e87e0afe
	.xword	0x0e5efa0cfdd1d2e9
	.xword	0x7b8458da77365005
	.xword	0x92ea4ee75d882c03
	.xword	0xabf4172ba820bde0
	.xword	0xdb44bd5ee2f57997
	.xword	0x41660d36fc1aac0e
	.xword	0x7060367c64e1bf09
	.xword	0x7ffa73c7f65e54a8
	.xword	0x0920a766111264c7
	.xword	0xf3bfa254710f9c3e
	.xword	0xe134813b561c136a
	.xword	0xf0850a1dac551378
	.xword	0x41af9ab709375cb2
	.xword	0x1d04f605eb49e3a1
	.xword	0x5f0e5cb6033e8d59
	.xword	0xd87b2826d8998b7f
	.xword	0x23105a05c8eb695d
	.xword	0x1f464f209bca306a
	.xword	0x45a50438d92b3b1b
	.xword	0x0d7e93f049a8eb5d
	.xword	0x6f5b1d26b51b8f72
	.xword	0xd95d1db689d1a7bc
	.xword	0x0f0171995a93d56d
	.xword	0xa3bbcd7fa496d715
	.xword	0x188e76e6708d1318
	.xword	0x7418769134daa56d
	.xword	0x0c9a7d6f574e376f
	.xword	0xd02a2c4678207a37
	.xword	0x58174b637e7bb707
	.xword	0x36584bf40626bc56
	.xword	0x8242b6cc60236a35
	.xword	0xc0c4e2a3f9d0b303
	.xword	0x2a1f5b8ce0d5656d
	.xword	0xafc27df13ce7031f
	.xword	0x40d5e4f08702b90b
	.xword	0xd378252a2d212b2e
	.xword	0x778b926ae92692c8
	.xword	0xad37f85ab5bbe1f3
	.xword	0xc81c9fcf187e8992
	.xword	0x5e8e1baf727d1110
	.xword	0xdf20c4e64fa43d16
	.xword	0x30f057064cf56b94
	.xword	0x7617b4fb341070d9
	.xword	0x19b2c70d50591317
	.xword	0x76981259f0d31f03
	.xword	0xb07704f5ed9b8e34
	.xword	0xf975d63928973045
	.xword	0x426a4b34d58d9960
	.xword	0x4cc8b57ebced2789
	.xword	0x0c6e97dfee43edaa
	.xword	0x04a866c55e3c1659
	.xword	0x8475da0559713750
	.xword	0x6567b22ea00f7027
	.xword	0x61a385741eff7bab
	.xword	0x10e0e6a839c1b158
	.xword	0x23022aeb22effd4d
	.xword	0x17aa4da9f8de3b09
	.xword	0x282ff2c8e12c11cf
	.xword	0x70b7a000b31cdb58
	.xword	0xc416ae015b5f7f22
	.xword	0x368d79468431ff34
	.xword	0xdf88545470a3c7aa
	.xword	0x4f58d08f6933c4a6
	.xword	0xdaeb30b763a5533e
	.xword	0xb84bebf0dbdeacff
	.xword	0x470d79823d8724e1
	.xword	0xca7813c314d92ea2
	.xword	0xf7ec58aa50c43dfc
	.xword	0xb5d8aabd3373e419
	.xword	0x07bd9cea0eb7a668
	.xword	0x5648b3a254801193
	.xword	0x099936d05a277807
	.xword	0x39b2882254723e81
	.xword	0x04b03c25b5e35281
	.xword	0x67d62e7839e72368
	.xword	0xa5d99006a2639b07
	.xword	0x9bd71ba752330b37
	.xword	0x60060f2e16302189
	.xword	0xb151a4750f06a897
	.xword	0x71496b395790adf7
	.xword	0x5f4b51ba4d5e96e9
	.xword	0xf17653d0aecba662
	.xword	0x02a84035c93f91b7
	.xword	0x39a0f39e22026c19
	.xword	0x4d49286071aa2ab9
	.xword	0x5774430606153900
	.xword	0xea48ba117ddd4938
	.xword	0x609e4f4fcf409888
	.xword	0x91c7365479868f12
	.xword	0x02547e1d9401d906
	.xword	0x0e2039c7dfb085a6
	.xword	0xba501c839eda643f
	.xword	0x1e7fd6f90711267b
	.xword	0x3715b3b3326991c8
	.xword	0x6f4df483cb247095
	.xword	0x6b97050a28c92600
	.xword	0xe56e0313d224f983
	.xword	0x3a17355418e8993d
	.xword	0x7c5ff24f422929bd
	.xword	0x9adb73d0c28727ef
	.xword	0x7e202e4ab76c59f0
	.xword	0x79b2134e55614b7c

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
	TTE_CP	 = 1,
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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
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
	TTE_CV	 = 0,
	TTE_E	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	TTE_IE	 = 1,
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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0,
	TTE_X	 = 1
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
	TTE_Size	 = 0,
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
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0xadbcb9fe0db522ee
	.xword	0x82321168769a579d
	.xword	0x559b7899738a5961
	.xword	0x75592c2dad7325d4
	.xword	0x9ba274ced70cbb23
	.xword	0x856363950d962008
	.xword	0x15c08e97f1c59780
	.xword	0xa28b4e649dcc362f
	.xword	0xa836e39947cefc87
	.xword	0x8a9692e17740a02f
	.xword	0x9b1ca9737df988d2
	.xword	0xe03936ff494e5bde
	.xword	0x21b2a981306f4452
	.xword	0xb5bd42dbfa2a1b0a
	.xword	0x188c36e9794c1d6a
	.xword	0xba303a0fa0779bae
	.xword	0x754b09e7f01c797e
	.xword	0x7c9447ea411af73f
	.xword	0x63dd08f7cd3fe7af
	.xword	0x1910e9bfeebf4c83
	.xword	0x72acc2784c4b1d17
	.xword	0x8f307241e553b7e7
	.xword	0xa7d8ae7509cfd651
	.xword	0xcff820132719aec7
	.xword	0xe7cb9f367c9f02ee
	.xword	0xa3e279d4d2371c26
	.xword	0xc5ed9f3dce76af51
	.xword	0x47a57ad2fddc786a
	.xword	0xc1febd9f87e7a587
	.xword	0x87dd5df641b8baf9
	.xword	0x07eb8b09dbf4fdd3
	.xword	0x5c0456b242092454



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
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
	TTE_V	 = 1,
	TTE_Size	 = 1,
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
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0x3bf5143990fa3374
	.xword	0x6a9656c8329be568
	.xword	0xf3b0825fe9958db6
	.xword	0xac3f198721d31667
	.xword	0x80884eceba38392d
	.xword	0x2691311b81d578e3
	.xword	0x36f5154d7849e5d0
	.xword	0x56b388afbba14f1e
	.xword	0x126107f5095980d0
	.xword	0xa2bb9476d451cd33
	.xword	0x4a1b5e2fabb4071e
	.xword	0x41a45752651b7587
	.xword	0x8cecba2a7d0d0712
	.xword	0xba2da4b82c3dd891
	.xword	0x04cf6722684545d5
	.xword	0xbfadb713c0fce376
	.xword	0xc381681a0f742911
	.xword	0xe62056826625b722
	.xword	0xf517952e0591cc71
	.xword	0xe7e4649071a5ca2d
	.xword	0x2efd4cb11d4ee96c
	.xword	0x13bd653ae95a7a6e
	.xword	0x4de729fc0ea4cccc
	.xword	0x341871faac9d725e
	.xword	0x3cff2d45e08a2c9f
	.xword	0x48224df08077b262
	.xword	0xdeb2a0e421801500
	.xword	0x960283c561058dc6
	.xword	0x24b9b5043adcec3b
	.xword	0x8c92375ab5e69e75
	.xword	0xcdf453f8e1efd19b
	.xword	0xefc916916edfa184



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
	.xword	0xc6fd48ec592b4fd3
	.xword	0xec2bc93de76aa86b
	.xword	0x8114370878c84b6c
	.xword	0x4a6b52c1c6c29a0b
	.xword	0x485e6503c0a3e4b5
	.xword	0xdc473d67293cbc2e
	.xword	0xc21806a6a8d7f130
	.xword	0x69a6f7c67ae14024
	.xword	0x85f3a2c0474b8533
	.xword	0xfeaa946e188c884b
	.xword	0xd5f04b08abe683c0
	.xword	0x5f7e31cb39c66470
	.xword	0x0d00ed55173845c2
	.xword	0x341a27672ca98a5c
	.xword	0x574c48dc185f8aa4
	.xword	0x8079332bc931c0fa
	.xword	0x6c4de8fbc91c9714
	.xword	0x618132a839086f23
	.xword	0x105b8d83d5071e9b
	.xword	0xc24376a21338b583
	.xword	0xc4f35e78a0770f00
	.xword	0x1b661f9a6858dbda
	.xword	0xec166d22d2420ccb
	.xword	0x6449aacf49909218
	.xword	0x454ad3a048bae494
	.xword	0x24cc85c46879d0c0
	.xword	0xb8e92fdec3d9a27e
	.xword	0x4c122023c227cf78
	.xword	0x29546c611364cb6d
	.xword	0xdb3fcb1dce606d86
	.xword	0xce891ce0eb58cf34
	.xword	0x6fe50a00bb270220



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
	TTE_Size	 = 3,
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
	.xword	0x8e39c2008ffac6ee
	.xword	0x1446f94751185c7e
	.xword	0x714db9f489be51e9
	.xword	0xceb1a02a689fa5d8
	.xword	0xc826e1be1e2bfb8d
	.xword	0x0b359b3c3b74e428
	.xword	0x9c6ef73e70fed9b6
	.xword	0x038e5bc0aa292df7
	.xword	0x8f781736ef4d51b3
	.xword	0x4fa7e19307036507
	.xword	0xc960c8a09c8c4930
	.xword	0x35f043c639fa0893
	.xword	0x4c5a637831ffeb24
	.xword	0x09e2eb04bf9335dd
	.xword	0xff94ce0c9f76378a
	.xword	0x8cebfd1fcac0357e
	.xword	0x79d4b780c97bdc42
	.xword	0xda57435a582dee0c
	.xword	0xb755994cfd10c589
	.xword	0xb0f04ad165efdb89
	.xword	0xaa6e3c09bdeddc16
	.xword	0xf9ef5a46db47dc71
	.xword	0x362a1093fa403046
	.xword	0xf9e6365b00c84ff8
	.xword	0x8c458c39777c54c1
	.xword	0x125aaa9c072562dd
	.xword	0xd7d8003fe608b85e
	.xword	0x6025cee34a16369b
	.xword	0x03569d84dbf872d3
	.xword	0x10ae1fe769533687
	.xword	0x770681e808785463
	.xword	0x41d0b3b459feda7c





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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f4
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
	TTE_W	 = 0
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f8
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f4



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
	TTE_IE	 = 1,
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
