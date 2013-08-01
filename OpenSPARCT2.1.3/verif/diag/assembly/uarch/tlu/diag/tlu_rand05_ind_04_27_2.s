/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_04_27_2.s
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

#d
# 441 "diag.j"
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
# 707 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 722 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 748 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 764 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 780 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done;
# 786 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
# 792 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    done;
# 802 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 455 "diag.j"
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

#include "hboot.s"
# 522 "diag.j"
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
	mov 0xb4, %r14
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
	mov 0x34, %r14
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
	mov 0xb3, %r14
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
	mov 0xb0, %r14
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
	mov 0xb0, %r14
	mov 0xb5, %r30
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
	.word 0x24ca8001  ! 1: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
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
vahole_80_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc008  ! 1: STXFSR_R	st-sfr	%f1, [%r8, %r31]
jmptr_80_1:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xc1bfdc00  ! 4: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_80_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 5: CASA_R	casa	[%r31] %asi, %r19, %r18
vahole_80_3:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x99a209ad  ! 6: FDIVs	fdivs	%f8, %f13, %f12
	.word 0xc19fe160  ! 7: LDDFA_I	ldda	[%r31, 0x0160], %f0
ibp_80_4:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc3e0  ! 8: STDFA_R	stda	%f0, [%r0, %r31]
iaw_80_5:
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
iaw_startwait80_5:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_5
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_5:
    brnz %r16, iaw_wait80_5
    ld [%r23], %r16
    ba iaw_startwait80_5
    mov 0x80, %r16
continue_iaw_80_5:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_5:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_5
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_5:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_5
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_5:
	mov 0x38, %r18
iaw3_80_5:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 9: STDFA_R	stda	%f16, [%r0, %r31]
pmu_80_6:
	nop
	setx 0xfffff76afffff3cd, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_80_7:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdb60  ! 11: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f8024e5  ! 12: SIR	sir	0x04e5
brcommon1_80_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ec4030  ! 13: PREFETCHA_R	prefetcha	[%r17, %r16] 0x01, #one_read
	.word 0xa9540000  ! 14: RDPR_GL	rdpr	%-, %r20
splash_lsu_80_9:
	nop
	ta T_CHANGE_HPRIV
	set 0x79d8a39a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe0bc  ! 16: STB_I	stb	%r20, [%r31 + 0x00bc]
pmu_80_10:
	nop
	setx 0xfffff2b6fffffa27, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8039b8  ! 18: SIR	sir	0x19b8
	.word 0x8d903b09  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1b09, %pstate
dvapa_80_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf3f, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 20: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_80_13:
	nop
	setx 0x454ed6ca9f890e1b, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_80_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_14-donret_80_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001c83c7 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfd6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_80_14:
	.word 0xa5a409d2  ! 22: FDIVd	fdivd	%f16, %f18, %f18
trapasi_80_15:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdad04a00  ! 23: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r13
dvapa_80_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb92, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc02c  ! 24: LDXA_R	ldxa	[%r31, %r12] 0x01, %r13
	.word 0x8d802004  ! 25: WRFPRS_I	wr	%r0, 0x0004, %fprs
	bleu  	 skip_80_17
	fbug,a,pn	%fcc0,  skip_80_17
.align 512
skip_80_17:
	.word 0xdbe7c020  ! 26: CASA_I	casa	[%r31] 0x 1, %r0, %r13
splash_cmpr_80_18:
	nop
	setx 0x7d994b109efc7993, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_80_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0xca15c265018d59e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2db04a7778453a7c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 30: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x93a00174  ! 31: FABSq	dis not found

memptr_80_23:
	set 0x60740000, %r31
	.word 0x8581f398  ! 32: WRCCR_I	wr	%r7, 0x1398, %ccr
splash_tba_80_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe118  ! 34: LDX_I	ldx	[%r31 + 0x0118], %r18
	.word 0x9f803a95  ! 35: SIR	sir	0x1a95
mondo_80_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d91c001  ! 36: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
donret_80_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_26-donret_80_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0035c449 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x91f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_26:
	.word 0xe46fe1a4  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x01a4]
donret_80_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_27-donret_80_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001c3793 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x97, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_27:
	.word 0xe46fe1c5  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x01c5]
	.word 0x9194c002  ! 39: WRPR_PIL_R	wrpr	%r19, %r2, %pil
pmu_80_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdadfffffc1b, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbne,a,pn	%fcc0,  skip_80_30
	fbn skip_80_30
.align 1024
skip_80_30:
	.word 0xc36fe13e  ! 41: PREFETCH_I	prefetch	[%r31 + 0x013e], #one_read
splash_tba_80_31:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_80_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf8f3c096afb2e099, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e0f0  ! 44: LDUHA_I	lduha	[%r31, + 0x00f0] %asi, %r18
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa981c00d  ! 46: WR_SET_SOFTINT_R	wr	%r7, %r13, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_33:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 47: RDPC	rd	%pc, %r8
tagged_80_34:
	tsubcctv %r7, 0x15b6, %r18
	.word 0xe807e0b2  ! 48: LDUW_I	lduw	[%r31 + 0x00b2], %r20
splash_lsu_80_35:
	nop
	ta T_CHANGE_HPRIV
	set 0x10060c22, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_80_36:
	nop
	.word 0x9f803105  ! 50: SIR	sir	0x1105
	.word 0xa9a00166  ! 51: FABSq	dis not found

intveclr_80_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0x26aae8b775bbaec4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 53: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
pmu_80_40:
	nop
	setx 0xfffff68ffffff017, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_80_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f7, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0c0  ! 55: STDFA_I	stda	%f0, [0x00c0, %r31]
pmu_80_42:
	nop
	setx 0xfffff91ffffffc3f, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_80_43:
	taddcctv %r1, 0x1ae7, %r17
	.word 0xe807e090  ! 57: LDUW_I	lduw	[%r31 + 0x0090], %r20
splash_lsu_80_44:
	nop
	ta T_CHANGE_HPRIV
	set 0x8958f27f, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_80_45:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xe8d044a0  ! 59: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r20
	.word 0xa7a4c9a8  ! 60: FDIVs	fdivs	%f19, %f8, %f19
jmptr_80_46:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	brz,pt  	%r19, skip_80_47
	fbuge skip_80_47
.align 1024
skip_80_47:
	.word 0xc32fc000  ! 62: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_cmpr_80_48:
	nop
	setx 0x72d3071e881f331c, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_80_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c009  ! 65: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
donret_80_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_51-donret_80_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00853a1b | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_51:
	.word 0xa3a449d0  ! 66: FDIVd	fdivd	%f48, %f16, %f48
brcommon1_80_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac4a47  ! 67: FCMPd	fcmpd	%fcc<n>, %f48, %f38
jmptr_80_53:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_80_54:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_80_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4c84e40  ! 70: LDSBA_R	ldsba	[%r1, %r0] 0x72, %r10
pmu_80_56:
	nop
	setx 0xfffff6c9fffff3ab, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_80_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_57-donret_80_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00035191 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe57, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_57:
	.word 0xd4ffe011  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x0011] %asi
brcommon1_80_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c02b  ! 1: CASA_I	casa	[%r31] 0x 1, %r11, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8035cc  ! 73: SIR	sir	0x15cc
	.word 0xe1bfe080  ! 74: STDFA_I	stda	%f16, [0x0080, %r31]
dvapa_80_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0xba9, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc033  ! 75: STDA_R	stda	%r16, [%r31 + %r19] 0x01
donret_80_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_60-donret_80_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d24bf1 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc9c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_60:
	.word 0xe06fe07f  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x007f]
	.word 0x8d9031f7  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x11f7, %pstate
	.word 0xe19fe000  ! 78: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_80_62:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
vahole_80_63:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe11fc013  ! 81: LDDF_R	ldd	[%r31, %r19], %f16
	bleu  	 skip_80_64
	.word 0x87a94a48  ! 1: FCMPd	fcmpd	%fcc<n>, %f36, %f8
.align 2048
skip_80_64:
	.word 0x24c94001  ! 82: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
	.word 0x87802088  ! 83: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe6dfe098  ! 84: LDXA_I	ldxa	[%r31, + 0x0098] %asi, %r19
splash_lsu_80_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x86bdba37, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 86: WRASI_I	wr	%r0, 0x008b, %asi
pmu_80_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff35bfffff012, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5d7e38bb95daa400, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 89: RDPC	rd	%pc, %r20
brcommon3_80_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe49fc02d  ! 90: LDDA_R	ldda	[%r31, %r13] 0x01, %r18
pmu_80_70:
	nop
	setx 0xfffff3abfffffa0a, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91940012  ! 92: WRPR_PIL_R	wrpr	%r16, %r18, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_80_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940013  ! 94: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
    set 0x3675, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b507c6  ! 95: PDIST	pdistn	%d20, %d6, %d48
vahole_80_73:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa9703fca  ! 96: POPC_I	popc	0x1fca, %r20
splash_tba_80_74:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_80_75:
    set user_data_start, %o7
	.word 0x93902003  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa9a34d33  ! 99: FsMULd	fsmuld	%f13, %f50, %f20
dvapa_80_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0xffc, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8bfc02a  ! 100: STDA_R	stda	%r12, [%r31 + %r10] 0x01
	.word 0xd847e1f8  ! 101: LDSW_I	ldsw	[%r31 + 0x01f8], %r12
mondo_80_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d950010  ! 102: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0x93540000  ! 103: RDPR_GL	rdpr	%-, %r9
	.word 0x9ba00161  ! 104: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_80_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d904003  ! 106: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
	setx 0xb0a24b65d6e0c5bd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe140  ! 108: STDFA_I	stda	%f0, [0x0140, %r31]
splash_cmpr_80_82:
	nop
	setx 0x87e600f5ba422b2c, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_80_83:
	nop
	setx 0xfffff159fffffa2f, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa782b312  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r10, 0x1312, %-
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
    brnz %r10, sma_80_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 112: CASA_R	casa	[%r31] %asi, %r8, %r20
fpinit_80_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 113: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_86:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 114: RDPC	rd	%pc, %r8
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
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 115: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa9818012  ! 116: WR_SET_SOFTINT_R	wr	%r6, %r18, %set_softint
vahole_80_88:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9b703d6b  ! 117: POPC_I	popc	0x1d6b, %r13
vahole_80_89:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 118: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91918010  ! 119: WRPR_PIL_R	wrpr	%r6, %r16, %pil
	.word 0x87802088  ! 120: WRASI_I	wr	%r0, 0x0088, %asi
pmu_80_91:
	nop
	setx 0xfffff7ccffffff01, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd68008a0  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_80_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd240e4d94c84d24f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_80_93:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fdc00  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd69fe1d8  ! 125: LDDA_I	ldda	[%r31, + 0x01d8] %asi, %r11
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
    bne,a wait_for_stat_80_94
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_94:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_94
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_94:
	mov 0x38, %r18
iaw3_80_94:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0c0  ! 126: STDFA_I	stda	%f0, [0x00c0, %r31]
fpinit_80_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 127: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xd6800c40  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_96:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 129: RDPC	rd	%pc, %r12
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_80_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff997fffff25c, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_80_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_80_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d920011  ! 134: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
jmptr_80_100:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	bpos  	 skip_80_101
	fbuge,a,pn	%fcc0,  skip_80_101
.align 1024
skip_80_101:
	.word 0xc36fe042  ! 136: PREFETCH_I	prefetch	[%r31 + 0x0042], #one_read
	.word 0x93a0016c  ! 137: FABSq	dis not found

	.word 0x91d02033  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd8cfe100  ! 139: LDSBA_I	ldsba	[%r31, + 0x0100] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_103:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 140: RDPC	rd	%pc, %r10
	.word 0x8d903dd9  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1dd9, %pstate
donret_80_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_105-donret_80_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00539e4d | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x946, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_105:
	.word 0xe66fe19b  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x019b]
fpinit_80_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 143: FDIVd	fdivd	%f0, %f4, %f8
donret_80_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_107-donret_80_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0097adf9 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x56, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_107:
	.word 0x99a189c2  ! 144: FDIVd	fdivd	%f6, %f2, %f12
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
    brnz %r10, sma_80_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r10
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 146: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_80_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_80_110:
	nop
	.word 0xc19fd920  ! 148: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_80_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 149: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0x8d802004  ! 150: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90316d  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x116d, %pstate
	fbue skip_80_113
	fbul,a,pn	%fcc0,  skip_80_113
.align 32
skip_80_113:
	.word 0xd43fc000  ! 152: STD_R	std	%r10, [%r31 + %r0]
splash_hpstate_80_114:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982a4c  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4c, %hpstate
cwp_80_115:
    set user_data_start, %o7
	.word 0x93902000  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9adac013  ! 155: SMULcc_R	smulcc 	%r11, %r19, %r13
	.word 0x9192400b  ! 156: WRPR_PIL_R	wrpr	%r9, %r11, %pil
vahole_80_117:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe180  ! 157: STDFA_I	stda	%f16, [0x0180, %r31]
vahole_80_118:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe180  ! 158: STDFA_I	stda	%f16, [0x0180, %r31]
iaw_80_119:
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
iaw_startwait80_119:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_119
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_119:
    brnz %r16, iaw_wait80_119
    ld [%r23], %r16
    ba iaw_startwait80_119
    mov 0x80, %r16
continue_iaw_80_119:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_119:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_119
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_119:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_119
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_119:
	mov 0x38, %r18
iaw4_80_119:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3e9c031  ! 159: PREFETCHA_R	prefetcha	[%r7, %r17] 0x01, #one_read
ibp_80_120:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe09fc031  ! 160: LDDA_R	ldda	[%r31, %r17] 0x01, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_121:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 161: RDPC	rd	%pc, %r10
	.word 0xa9a00168  ! 162: FABSq	dis not found

	.word 0xe19fe000  ! 163: LDDFA_I	ldda	[%r31, 0x0000], %f16
mondo_80_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 164: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
splash_tba_80_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
vahole_80_125:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe0c0  ! 166: STDFA_I	stda	%f16, [0x00c0, %r31]
trapasi_80_126:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2d84b60  ! 167: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r9
ibp_80_127:
	nop
	.word 0xd31fc014  ! 168: LDDF_R	ldd	[%r31, %r20], %f9
donret_80_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_128-donret_80_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000cebe5 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2c5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_128:
	.word 0xd2ffe154  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x0154] %asi
jmptr_80_129:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_80_130:
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
iaw_startwait80_130:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_130
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_130:
    brnz %r16, iaw_wait80_130
    ld [%r23], %r16
    ba iaw_startwait80_130
    mov 0x80, %r16
continue_iaw_80_130:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_130:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_130
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_130:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_130
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_130:
	mov 0x38, %r18
iaw1_80_130:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc010  ! 171: STXFSR_R	st-sfr	%f1, [%r16, %r31]
vahole_80_131:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3ec0026  ! 172: PREFETCHA_R	prefetcha	[%r16, %r6] 0x01, #one_read
	.word 0xe727e099  ! 173: STF_I	st	%f19, [0x0099, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_132:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 174: RDPC	rd	%pc, %r9
	.word 0x87802058  ! 175: WRASI_I	wr	%r0, 0x0058, %asi
donret_80_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_133-donret_80_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00143b2e | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x58c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
donretarg_80_133:
	.word 0xa9a509d1  ! 176: FDIVd	fdivd	%f20, %f48, %f20
	.word 0xa9500000  ! 177: RDPR_TPC	rdpr	%tpc, %r20
br_badelay2_80_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f16, %f16
	.word 0xa9b50311  ! 178: ALIGNADDRESS	alignaddr	%r20, %r17, %r20
	setx 0x00109bdb032b9757, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbne,a,pn	%fcc0,  skip_80_136
	fbuge skip_80_136
.align 128
skip_80_136:
	.word 0xc30fc000  ! 180: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x9b500000  ! 181: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xda8008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_80_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xad1be24885983fc6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
dvapa_80_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb93, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00d  ! 186: CASA_R	casa	[%r31] %asi, %r13, %r13
donret_80_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_139-donret_80_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0022d9e4 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd15, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_80_139:
	.word 0xdaffe052  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x0052] %asi
	brz,a,pt	%r19, skip_80_140
	bg,a	 skip_80_140
.align 512
skip_80_140:
	.word 0x9f802cac  ! 188: SIR	sir	0x0cac
memptr_80_141:
	set user_data_start, %r31
	.word 0x858527f0  ! 189: WRCCR_I	wr	%r20, 0x07f0, %ccr
dvapa_80_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0x982, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3e8c031  ! 190: PREFETCHA_R	prefetcha	[%r3, %r17] 0x01, #one_read
dvapa_80_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfe4, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc010  ! 191: LDDF_R	ldd	[%r31, %r16], %f19
fpinit_80_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82620  ! 192: PREFETCHA_I	prefetcha	[%r0, + 0x0620] %asi, #one_read
	.word 0xa068c002  ! 193: UDIVX_R	udivx 	%r3, %r2, %r16
donret_80_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_145-donret_80_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b99bf4 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_145:
	.word 0xe6ffe07a  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x007a] %asi
	.word 0x91924013  ! 195: WRPR_PIL_R	wrpr	%r9, %r19, %pil
	.word 0x91910013  ! 196: WRPR_PIL_R	wrpr	%r4, %r19, %pil
iaw_80_148:
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
iaw_startwait80_148:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_148
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_148:
    brnz %r16, iaw_wait80_148
    ld [%r23], %r16
    ba iaw_startwait80_148
    mov 0x80, %r16
continue_iaw_80_148:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_148:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_148
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_148:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_148
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_148:
	mov 0x38, %r18
iaw2_80_148:
	rdpr %tba, %r19
	mov 0x21,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa3b4c48c  ! 197: FCMPLE32	fcmple32	%d50, %d12, %r17
	.word 0x9f8030b4  ! 198: SIR	sir	0x10b4
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802014  ! 200: WRASI_I	wr	%r0, 0x0014, %asi
splash_hpstate_80_149:
	ta T_CHANGE_NONHPRIV
	.word 0x8198238e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038e, %hpstate
	.word 0xe697e048  ! 202: LDUHA_I	lduha	[%r31, + 0x0048] %asi, %r19
dvapa_80_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe08, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe63fede6  ! 203: STD_I	std	%r19, [%r31 + 0x0de6]
	.word 0xa7830013  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r19, %-
brcommon2_80_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x93a2c9d1  ! 1: FDIVd	fdivd	%f42, %f48, %f40
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fd920  ! 205: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa5454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xe897e008  ! 207: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r20
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
    brnz %r10, sma_80_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 208: CASA_R	casa	[%r31] %asi, %r11, %r20
vahole_80_154:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fda00  ! 209: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_80_155:
	nop
	ta T_CHANGE_HPRIV
	set 0xa8b756e4, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_156:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x819826ec  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ec, %hpstate
fpinit_80_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 212: FDIVs	fdivs	%f0, %f4, %f4
splash_tba_80_158:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_80_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0x21e46535b70770fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 215: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
iaw_80_161:
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
iaw_startwait80_161:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_161
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_161:
    brnz %r16, iaw_wait80_161
    ld [%r23], %r16
    ba iaw_startwait80_161
    mov 0x80, %r16
continue_iaw_80_161:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_161:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_161
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_161:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_161
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_161:
	mov 0x38, %r18
iaw1_80_161:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 216: STDFA_R	stda	%f0, [%r0, %r31]
pmu_80_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff88efffffcf9, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_80_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_163-donret_80_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00890b8e | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb95, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	done
donretarg_80_163:
	.word 0xa1a409d2  ! 218: FDIVd	fdivd	%f16, %f18, %f16
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r17
vahole_80_164:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe43fede6  ! 221: STD_I	std	%r18, [%r31 + 0x0de6]
ibp_80_165:
	nop
	.word 0xe4dfc030  ! 222: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
dvapa_80_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8bb, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1c0  ! 223: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xe44fe170  ! 224: LDSB_I	ldsb	[%r31 + 0x0170], %r18
mondo_80_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d928014  ! 225: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0xa0840004  ! 226: ADDcc_R	addcc 	%r16, %r4, %r16
iaw_80_168:
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
iaw_startwait80_168:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_168
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_168:
    brnz %r16, iaw_wait80_168
    ld [%r23], %r16
    ba iaw_startwait80_168
    mov 0x80, %r16
continue_iaw_80_168:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_168:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_168
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_168:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_168
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_168:
	mov 0x38, %r18
iaw0_80_168:
	rd %pc, %r19
	add %r19, (16+1), %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc030  ! 227: LDXA_R	ldxa	[%r31, %r16] 0x01, %r13
vahole_80_169:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa170243c  ! 228: POPC_I	popc	0x043c, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_170:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 229: RDPC	rd	%pc, %r16
vahole_80_171:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc010  ! 230: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	.word 0x9193400c  ! 231: WRPR_PIL_R	wrpr	%r13, %r12, %pil
pmu_80_173:
	nop
	setx 0xfffffeaefffff28c, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
iaw_80_174:
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
iaw_startwait80_174:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_174
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_174:
    brnz %r16, iaw_wait80_174
    ld [%r23], %r16
    ba iaw_startwait80_174
    mov 0x80, %r16
continue_iaw_80_174:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_174:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_174
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_174:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_174
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_174:
	mov 0x38, %r18
iaw3_80_174:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd09fc028  ! 233: LDDA_R	ldda	[%r31, %r8] 0x01, %r8
	.word 0x97694007  ! 234: SDIVX_R	sdivx	%r5, %r7, %r11
splash_cmpr_80_175:
	nop
	setx 0x37c1b9020eed8b38, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_176) + 56, 16, 16)) -> intp(1,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_176)&0xffffffff)  + 56, 16, 16)) -> intp(1,0,29)
#else
	setx 0x6f99056235f1f722, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_80_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcb9, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdc00  ! 237: STDFA_R	stda	%f16, [%r0, %r31]
vahole_80_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fde00  ! 238: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_80_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 239: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_80_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d914006  ! 240: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
vahole_80_181:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfda00  ! 241: STDFA_R	stda	%f0, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_182) + 32, 16, 16)) -> intp(5,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_182)&0xffffffff)  + 32, 16, 16)) -> intp(5,0,0)
#else
	setx 0x3f5b99ad6fdf2cfb, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4800bc0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r18
intveclr_80_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf7bd5121c7188f28, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_80_184:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4dfc02a  ! 245: LDXA_R	ldxa	[%r31, %r10] 0x01, %r18
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
    brnz %r10, sma_80_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 246: CASA_R	casa	[%r31] %asi, %r17, %r18
fpinit_80_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 247: FCMPLE32	fcmple32	%d0, %d4, %r6
vahole_80_187:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe49fc028  ! 248: LDDA_R	ldda	[%r31, %r8] 0x01, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_80_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xdb12c014  ! 1: LDQF_R	-	[%r11, %r20], %f13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1c0  ! 250: STDFA_I	stda	%f0, [0x01c0, %r31]
mondo_80_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 251: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	setx 0x4c263b67ab4f4304, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_80_192:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc013  ! 253: STXFSR_R	st-sfr	%f1, [%r19, %r31]
ibp_80_193:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 254: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xab842ed1  ! 255: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0ed1, %clear_softint
splash_lsu_80_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xafa34226, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 257: CASA_R	casa	[%r31] %asi, %r19, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_196) + 24, 16, 16)) -> intp(0,0,30)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_196)&0xffffffff)  + 24, 16, 16)) -> intp(0,0,30)
#else
	setx 0x04090a55925af412, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_80_197:
    nop
    rd %asi, %l3        ! save %asi
    ta T_CHANGE_HPRIV
    wr %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %asi
    mov 1, %l2
    sllx %l2, 63, %l2
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
    ta T_CHANGE_NONHPRIV
    wr %g0, %l3, %asi   !restore %asi
	.word 0xa5b4498d  ! 259: BSHUFFLE	fmovc32	%d48, %d44, %d18
	.word 0x9f802f77  ! 260: SIR	sir	0x0f77
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
    brnz %r10, sma_80_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 261: CASA_R	casa	[%r31] %asi, %r20, %r19
splash_tba_80_199:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_80_200:
	ta T_CHANGE_NONHPRIV
	.word 0x81982045  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
mondo_80_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d904012  ! 264: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
tagged_80_202:
	tsubcctv %r16, 0x1064, %r11
	.word 0xe607e0f4  ! 265: LDUW_I	lduw	[%r31 + 0x00f4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_80_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d928014  ! 267: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
splash_cmpr_80_204:
	nop
	setx 0xc82e1b91b159c9ea, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_80_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2d72ac66abe017e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e52  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0e52, %pstate
cwp_80_207:
    set user_data_start, %o7
	.word 0x93902002  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_208) + 48, 16, 16)) -> intp(4,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_208)&0xffffffff)  + 48, 16, 16)) -> intp(4,0,29)
#else
	setx 0x5bcb8977023a80f2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_80_209:
	nop
	.word 0x9ba489a5  ! 273: FDIVs	fdivs	%f18, %f5, %f13
mondo_80_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94800a  ! 274: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
ibp_80_211:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdb60  ! 275: STDFA_R	stda	%f0, [%r0, %r31]
splash_lsu_80_212:
	nop
	ta T_CHANGE_HPRIV
	set 0xdccee6b1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 277: Tcc_R	te	icc_or_xcc, %r0 + %r30
trapasi_80_213:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d84a00  ! 278: LDXA_R	ldxa	[%r1, %r0] 0x50, %r20
pmu_80_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff642ffffff9d, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
iaw_80_215:
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
iaw_startwait80_215:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_215
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_215:
    brnz %r16, iaw_wait80_215
    ld [%r23], %r16
    ba iaw_startwait80_215
    mov 0x80, %r16
continue_iaw_80_215:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_215:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_215
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_215:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_215
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_215:
	mov 0x38, %r18
iaw3_80_215:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fda00  ! 280: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_216) + 8, 16, 16)) -> intp(0,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_216)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,18)
#else
	setx 0xd2fdaec1533fd4ec, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_80_217:
	nop
	ta T_CHANGE_HPRIV
	set 0xdee832b8, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d920014  ! 283: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
vahole_80_219:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fdb60  ! 284: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_80_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d93000a  ! 285: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	brlez,a,pt	%r13, skip_80_221
	.word 0x9ba089d3  ! 1: FDIVd	fdivd	%f2, %f50, %f44
.align 512
skip_80_221:
	.word 0x87a98a45  ! 286: FCMPd	fcmpd	%fcc<n>, %f6, %f36
donret_80_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_222-donret_80_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cc7036 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_222:
	.word 0xe86fe09e  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x009e]
jmptr_80_223:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_80_224:
	nop
	setx 0x97423e68b20216d9, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_80_225:
	nop
	setx 0x5a634ff4428eaf11, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_80_226:
	nop
	setx 0xfffffe57fffff1f4, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff006fffff6a3, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d950003  ! 293: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0x87802080  ! 294: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1a00169  ! 295: FABSq	dis not found

donret_80_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_230-donret_80_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00795f87 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x606, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_80_230:
	.word 0xe66fe17d  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x017d]
vahole_80_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fde00  ! 297: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_232:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 298: RDPC	rd	%pc, %r18
trapasi_80_233:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 299: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
dvapa_80_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb66, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99a509ac  ! 300: FDIVs	fdivs	%f20, %f12, %f12
intveclr_80_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5288e605be61d7b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 302: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	setx 0x90ef3ab150edca6c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00162  ! 304: FABSq	dis not found

pmu_80_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff83fffff02d, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe5ffffffd9a, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_80_241:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe497c031  ! 307: LDUHA_R	lduha	[%r31, %r17] 0x01, %r18
splash_tba_80_242:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_80_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_243:
	.word 0x8f902002  ! 309: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802004  ! 310: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_80_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0x145d2e39eb03cca6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_80_245:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe100  ! 312: STDFA_I	stda	%f16, [0x0100, %r31]
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
    brnz %r10, sma_80_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 313: CASA_R	casa	[%r31] %asi, %r18, %r18
dvapa_80_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf0a, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3b10490  ! 314: FCMPLE32	fcmple32	%d4, %d16, %r17
unsupttte_80_248:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a349c1  ! 315: FDIVd	fdivd	%f44, %f32, %f42
ibp_80_249:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00c  ! 316: STXFSR_R	st-sfr	%f1, [%r12, %r31]
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_250) + 32, 16, 16)) -> intp(1,0,30)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_250)&0xffffffff)  + 32, 16, 16)) -> intp(1,0,30)
#else
	setx 0x1b9d42e77d877db6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_80_251:
	nop
	.word 0x9f803065  ! 319: SIR	sir	0x1065
vahole_80_252:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe140  ! 320: STDFA_I	stda	%f16, [0x0140, %r31]
	setx 0xeeab924cd8fc6eae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
dvapa_80_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0x841, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc010  ! 323: STDF_R	std	%f8, [%r16, %r31]
	.word 0x8d802004  ! 324: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_80_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7775f528131c225e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 326: CASA_R	casa	[%r31] %asi, %r9, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 327: RDPC	rd	%pc, %r20
ibp_80_258:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 328: STDFA_R	stda	%f16, [%r0, %r31]
fpinit_80_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 329: FDIVd	fdivd	%f0, %f4, %f6
vahole_80_260:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdb1fc011  ! 330: LDDF_R	ldd	[%r31, %r17], %f13
	.word 0xda8008a0  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa0d526e4  ! 332: UMULcc_I	umulcc 	%r20, 0x06e4, %r16
ibp_80_261:
	nop
	.word 0xa5702ed2  ! 333: POPC_I	popc	0x0ed2, %r18
mondo_80_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d908013  ! 334: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
mondo_80_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d944005  ! 335: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0x91524000  ! 336: RDPR_CWP	rdpr	%cwp, %r8
pmu_80_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff27dfffffe2e, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_80_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd0c, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc02a  ! 338: LDDA_R	ldda	[%r31, %r10] 0x01, %r9
splash_lsu_80_267:
	nop
	ta T_CHANGE_HPRIV
	set 0x59732db6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_80_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_80_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_269-donret_80_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e3fb79 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbd4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
donretarg_80_269:
	.word 0x91a289cb  ! 342: FDIVd	fdivd	%f10, %f42, %f8
ibp_80_270:
	nop
	.word 0xe19fdb60  ! 343: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80292a  ! 344: SIR	sir	0x092a
splash_hpstate_80_271:
	.word 0x8198251e  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051e, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_272:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 346: RDPC	rd	%pc, %r11
ibp_80_273:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc02d  ! 347: STDA_R	stda	%r13, [%r31 + %r13] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_274) + 0, 16, 16)) -> intp(5,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_274)&0xffffffff)  + 0, 16, 16)) -> intp(5,0,11)
#else
	setx 0x4febe027f1df4854, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9fdfffffa58, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_80_276:
	nop
	.word 0xdadfc032  ! 350: LDXA_R	ldxa	[%r31, %r18] 0x01, %r13
pmu_80_277:
	nop
	setx 0xfffffe18fffffff6, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x1da3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7c4  ! 352: PDIST	pdistn	%d50, %d4, %d48
dvapa_80_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa66, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9bb4c492  ! 353: FCMPLE32	fcmple32	%d50, %d18, %r13
	.word 0xe71fe0d0  ! 354: LDDF_I	ldd	[%r31, 0x00d0], %f19
pmu_80_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa33fffffcff, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_280) + 16, 16, 16)) -> intp(7,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_280)&0xffffffff)  + 16, 16, 16)) -> intp(7,0,3)
#else
	setx 0xeba71ed3ec95d83f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e048  ! 357: LDUHA_I	lduha	[%r31, + 0x0048] %asi, %r19
intveclr_80_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc5f44fa962d3fac8, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_80_282:
	nop
	setx 0xfffff219fffff1fd, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0xda86457fe54a01fb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x80+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_284:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 362: RDPC	rd	%pc, %r20
	.word 0xa7450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r19
intveclr_80_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe30f2e69dce05ce4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_80_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 365: FDIVs	fdivs	%f0, %f4, %f4
ibp_80_287:
	nop
	.word 0xa5702b98  ! 366: POPC_I	popc	0x0b98, %r18
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
    brnz %r10, sma_80_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 367: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0x8d802004  ! 368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	setx 0x9252d70a7a2ce99e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 370: CASA_R	casa	[%r31] %asi, %r19, %r18
donret_80_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_291-donret_80_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0071e489 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd4f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_80_291:
	.word 0xa1a409c6  ! 371: FDIVd	fdivd	%f16, %f6, %f16
	.word 0xab84333b  ! 372: WR_CLEAR_SOFTINT_I	wr	%r16, 0x133b, %clear_softint
	.word 0xd6800c80  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r11
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
    brnz %r10, sma_80_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 374: CASA_R	casa	[%r31] %asi, %r8, %r11
br_longdelay2_80_293:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x24cfc001  ! 375: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
dvapa_80_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0x825, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 376: CASA_R	casa	[%r31] %asi, %r20, %r11
splash_lsu_80_295:
	nop
	ta T_CHANGE_HPRIV
	set 0xb312396e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_80_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9c8  ! 1: FDIVd	fdivd	%f62, %f8, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1703543  ! 378: POPC_I	popc	0x1543, %r16
	.word 0x8d802004  ! 379: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_80_297:
	nop
	setx 0xf5e584803e94bf4f, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_298) + 56, 16, 16)) -> intp(6,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_298)&0xffffffff)  + 56, 16, 16)) -> intp(6,0,23)
#else
	setx 0x092d92b3bda230fc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9194800b  ! 382: WRPR_PIL_R	wrpr	%r18, %r11, %pil
splash_cmpr_80_300:
	nop
	setx 0x67404f11c0fc0427, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_80_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d940006  ! 385: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
	.word 0xd037e1c4  ! 386: STH_I	sth	%r8, [%r31 + 0x01c4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x4fde0c838e69d548, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00167  ! 389: FABSq	dis not found

donret_80_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_305-donret_80_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e317b | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa97, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_305:
	.word 0xe8ffe144  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0144] %asi
	.word 0xe897e0d0  ! 391: LDUHA_I	lduha	[%r31, + 0x00d0] %asi, %r20
	.word 0xe8d7e1d0  ! 392: LDSHA_I	ldsha	[%r31, + 0x01d0] %asi, %r20
pmu_80_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff993fffffd58, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_80_307:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdc00  ! 394: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_80_308:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8884b40  ! 395: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r20
trapasi_80_309:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8c04a00  ! 396: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r20
ibp_80_310:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe93fc013  ! 397: STDF_R	std	%f20, [%r19, %r31]
intveclr_80_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdf1594e079e3bea9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_80_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_80_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff82afffffd13, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
	.word 0xe49fc02a  ! 1: LDDA_R	ldda	[%r31, %r10] 0x01, %r18
jmptr_40_1:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xc1bfc2c0  ! 4: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_40_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 5: CASA_R	casa	[%r31] %asi, %r17, %r18
vahole_40_3:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa7b147d4  ! 6: PDIST	pdistn	%d36, %d20, %d50
	.word 0xc19fe160  ! 7: LDDFA_I	ldda	[%r31, 0x0160], %f0
ibp_40_4:
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
ibp_startwait40_4:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_4
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_4:
    brnz %r16, ibp_wait40_4
    ld [%r23], %r16
    ba ibp_startwait40_4
    mov 0x40, %r16
continue_ibp_40_4:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_4:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_4
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_4:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_4
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_4:
    best_set_reg(0x00000050c4c000c9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 8: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfc2c0  ! 9: STDFA_R	stda	%f16, [%r0, %r31]
pmu_40_6:
	nop
	setx 0xfffffc90fffffb12, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_7:
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
ibp_startwait40_7:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_7
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_7:
    brnz %r16, ibp_wait40_7
    ld [%r23], %r16
    ba ibp_startwait40_7
    mov 0x40, %r16
continue_ibp_40_7:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_7:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_7
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_7:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_7
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_7:
    best_set_reg(0x00000050c4c0c943,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdb60  ! 11: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f803e7b  ! 12: SIR	sir	0x1e7b
brcommon1_40_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9ba449b2  ! 13: FDIVs	fdivs	%f17, %f18, %f13
	.word 0x99540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_40_9:
	nop
	ta T_CHANGE_HPRIV
	set 0xdd3fd247, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe12c  ! 16: STB_I	stb	%r20, [%r31 + 0x012c]
pmu_40_10:
	nop
	setx 0xfffffcb7fffffadd, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803271  ! 18: SIR	sir	0x1271
	.word 0x8d902842  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x0842, %pstate
dvapa_40_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbb8, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc2c0  ! 20: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_40_13:
	nop
	setx 0xcab903d921959c5d, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_40_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_14-donret_40_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a188a4 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcc4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2ccc8001  ! 1: BRGZ	brgz,a,pt	%r18,<label_0xc8001>
	retry
donretarg_40_14:
	.word 0x91a489c2  ! 22: FDIVd	fdivd	%f18, %f2, %f8
trapasi_40_15:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
dvapa_40_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb3f, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc00c  ! 24: LDDF_R	ldd	[%r31, %r12], %f13
	.word 0x8d802004  ! 25: WRFPRS_I	wr	%r0, 0x0004, %fprs
	bl  	 skip_40_17
	bvc  	 skip_40_17
.align 512
skip_40_17:
	.word 0xc32fc000  ! 26: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_cmpr_40_18:
	nop
	setx 0xa51c0d3645969233, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_40_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0x894fbc79a9845ce0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x066d031d968fd9cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 30: CASA_R	casa	[%r31] %asi, %r17, %r13
	.word 0xa5a0016d  ! 31: FABSq	dis not found

memptr_40_23:
	set 0x60740000, %r31
	.word 0x8584adb1  ! 32: WRCCR_I	wr	%r18, 0x0db1, %ccr
splash_tba_40_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe1c0  ! 34: LDX_I	ldx	[%r31 + 0x01c0], %r18
	.word 0x9f802eeb  ! 35: SIR	sir	0x0eeb
mondo_40_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 36: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
donret_40_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_26-donret_40_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bf6220 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf4c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_26:
	.word 0xe46fe1e3  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x01e3]
donret_40_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_27-donret_40_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002ef766 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x185, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
donretarg_40_27:
	.word 0xe46fe0b7  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x00b7]
	.word 0x91928014  ! 39: WRPR_PIL_R	wrpr	%r10, %r20, %pil
pmu_40_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9c5fffff7f9, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	brz,pt  	%r19, skip_40_30
	bcs  	 skip_40_30
.align 1024
skip_40_30:
	.word 0xc32fc000  ! 41: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_tba_40_31:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_40_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x27e128132b33ef82, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e0c8  ! 44: LDUHA_I	lduha	[%r31, + 0x00c8] %asi, %r18
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9840006  ! 46: WR_SET_SOFTINT_R	wr	%r16, %r6, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_33:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 47: RDPC	rd	%pc, %r18
tagged_40_34:
	tsubcctv %r7, 0x1cfc, %r9
	.word 0xe807e13c  ! 48: LDUW_I	lduw	[%r31 + 0x013c], %r20
splash_lsu_40_35:
	nop
	ta T_CHANGE_HPRIV
	set 0xc51657fe, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_40_36:
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
ibp_startwait40_36:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_36
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_36:
    brnz %r16, ibp_wait40_36
    ld [%r23], %r16
    ba ibp_startwait40_36
    mov 0x40, %r16
continue_ibp_40_36:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_36:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_36
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_36:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_36
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_36:
    best_set_reg(0x00000050bec943bd,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe83ff105  ! 50: STD_I	std	%r20, [%r31 + 0xfffff105]
	.word 0xa3a00172  ! 51: FABSq	dis not found

intveclr_40_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0xef1be569201fd170, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d91c011  ! 53: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
pmu_40_40:
	nop
	setx 0xfffff212fffff10e, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_40_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe1b, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdc00  ! 55: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_40_42:
	nop
	setx 0xfffff981fffff4c2, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_40_43:
	taddcctv %r16, 0x1a21, %r2
	.word 0xe807e1bd  ! 57: LDUW_I	lduw	[%r31 + 0x01bd], %r20
splash_lsu_40_44:
	nop
	ta T_CHANGE_HPRIV
	set 0x1adc6873, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_40_45:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xe8d844a0  ! 59: LDXA_R	ldxa	[%r1, %r0] 0x25, %r20
	.word 0xa3a409a6  ! 60: FDIVs	fdivs	%f16, %f6, %f17
jmptr_40_46:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	fbo,a,pn	%fcc0,  skip_40_47
	.word 0x87acca54  ! 1: FCMPd	fcmpd	%fcc<n>, %f50, %f20
.align 1024
skip_40_47:
	.word 0xc32fc000  ! 62: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_cmpr_40_48:
	nop
	setx 0x9786c681c3d06cf3, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_40_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d92c012  ! 65: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
donret_40_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_51-donret_40_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007351ab | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_51:
	.word 0x9ba409d4  ! 66: FDIVd	fdivd	%f16, %f20, %f44
brcommon1_40_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac0a52  ! 67: FCMPd	fcmpd	%fcc<n>, %f16, %f18
jmptr_40_53:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_40_54:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_40_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 70: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
pmu_40_56:
	nop
	setx 0xfffff670fffff63f, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_40_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_57-donret_40_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e4ad7e | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7cc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_57:
	.word 0xd4ffe079  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x0079] %asi
brcommon1_40_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a409d0  ! 73: FDIVd	fdivd	%f16, %f16, %f10
	.word 0xe1bfe000  ! 74: STDFA_I	stda	%f16, [0x0000, %r31]
dvapa_40_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa81, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc011  ! 75: LDDF_R	ldd	[%r31, %r17], %f16
donret_40_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_60-donret_40_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fd0b57 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x99e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_60:
	.word 0xe06fe18f  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x018f]
	.word 0x8d902866  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x0866, %pstate
	.word 0xe19fe060  ! 78: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_40_62:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
vahole_40_63:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe097c02a  ! 81: LDUHA_R	lduha	[%r31, %r10] 0x01, %r16
	bne  	 skip_40_64
	.word 0xc36cfbe5  ! 1: PREFETCH_I	prefetch	[%r19 + 0xfffffbe5], #one_read
.align 2048
skip_40_64:
	.word 0xa5b044ca  ! 82: FCMPNE32	fcmpne32	%d32, %d10, %r18
	.word 0x87802089  ! 83: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe6dfe028  ! 84: LDXA_I	ldxa	[%r31, + 0x0028] %asi, %r19
splash_lsu_40_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xa078c412, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 86: WRASI_I	wr	%r0, 0x0020, %asi
pmu_40_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff38afffff2c7, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9c4dccaf06868a61, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_68:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 89: RDPC	rd	%pc, %r11
brcommon3_40_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4dfc030  ! 90: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
pmu_40_70:
	nop
	setx 0xfffffcc0fffffb64, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91950011  ! 92: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_40_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d940013  ! 94: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
    set 0x3fe2, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407d3  ! 95: PDIST	pdistn	%d16, %d50, %d44
vahole_40_73:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87a84a42  ! 96: FCMPd	fcmpd	%fcc<n>, %f32, %f2
splash_tba_40_74:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_40_75:
    set user_data_start, %o7
	.word 0x93902006  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99a50d24  ! 99: FsMULd	fsmuld	%f20, %f4, %f12
dvapa_40_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0x891, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 100: CASA_R	casa	[%r31] %asi, %r10, %r12
	.word 0xd847e1a0  ! 101: LDSW_I	ldsw	[%r31 + 0x01a0], %r12
mondo_40_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d92c014  ! 102: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xa3540000  ! 103: RDPR_GL	rdpr	%-, %r17
	.word 0xa7a00161  ! 104: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_40_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d918011  ! 106: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
	setx 0x6880d493858c4b61, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe120  ! 108: STDFA_I	stda	%f0, [0x0120, %r31]
splash_cmpr_40_82:
	nop
	setx 0x487417fa613e85e1, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_40_83:
	nop
	setx 0xfffff2f0fffffa2c, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7842048  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x0048, %-
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
    brnz %r10, sma_40_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 112: CASA_R	casa	[%r31] %asi, %r10, %r20
fpinit_40_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 113: FCMPLE32	fcmple32	%d0, %d4, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 114: RDPC	rd	%pc, %r19
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
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 115: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xa9808011  ! 116: WR_SET_SOFTINT_R	wr	%r2, %r17, %set_softint
vahole_40_88:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa3a049c4  ! 117: FDIVd	fdivd	%f32, %f4, %f48
vahole_40_89:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe0a0  ! 118: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0x91904012  ! 119: WRPR_PIL_R	wrpr	%r1, %r18, %pil
	.word 0x87802083  ! 120: WRASI_I	wr	%r0, 0x0083, %asi
pmu_40_91:
	nop
	setx 0xffffff3ffffffcb9, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd6800b80  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
intveclr_40_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8c8f9c8c5868da7f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_40_93:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe1e0  ! 124: STDFA_I	stda	%f0, [0x01e0, %r31]
	.word 0xd69fe118  ! 125: LDDA_I	ldda	[%r31, + 0x0118] %asi, %r11
	.word 0xe1bfe060  ! 126: STDFA_I	stda	%f16, [0x0060, %r31]
fpinit_40_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 127: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xd68008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_96:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 129: RDPC	rd	%pc, %r17
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_40_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeebfffff002, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_40_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_40_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d91400b  ! 134: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
jmptr_40_100:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	brnz,pt  	%r3, skip_40_101
	.word 0x93a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f40
.align 1024
skip_40_101:
	.word 0xc32fc000  ! 136: STXFSR_R	st-sfr	%f1, [%r0, %r31]
	.word 0x97a00173  ! 137: FABSq	dis not found

	.word 0x91d02033  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd8cfe1f8  ! 139: LDSBA_I	ldsba	[%r31, + 0x01f8] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_103:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 140: RDPC	rd	%pc, %r11
	.word 0x8d9027c8  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x07c8, %pstate
donret_40_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_105-donret_40_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007e4cec | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_105:
	.word 0xe66fe1e7  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x01e7]
fpinit_40_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 143: FDIVs	fdivs	%f0, %f4, %f4
donret_40_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_107-donret_40_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004fa13c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc8e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_107:
	.word 0xa7a1c9c8  ! 144: FDIVd	fdivd	%f38, %f8, %f50
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
    brnz %r10, sma_40_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00c  ! 145: CASA_R	casa	[%r31] %asi, %r12, %r10
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 146: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_40_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_40_110:
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
ibp_startwait40_110:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_110
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_110:
    brnz %r16, ibp_wait40_110
    ld [%r23], %r16
    ba ibp_startwait40_110
    mov 0x40, %r16
continue_ibp_40_110:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_110:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_110
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_110:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_110
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_110:
    best_set_reg(0x0000005010c3bd44,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fdf20  ! 148: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_40_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d95000c  ! 149: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0x8d802004  ! 150: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d903db4  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x1db4, %pstate
	brgez,pt  	%r8, skip_40_113
	brlez,pt  	%r13, skip_40_113
.align 32
skip_40_113:
	.word 0xc30fc000  ! 152: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_hpstate_40_114:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81982254  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0254, %hpstate
cwp_40_115:
    set user_data_start, %o7
	.word 0x93902000  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa6da8008  ! 155: SMULcc_R	smulcc 	%r10, %r8, %r19
	.word 0x91950014  ! 156: WRPR_PIL_R	wrpr	%r20, %r20, %pil
vahole_40_117:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdb60  ! 157: STDFA_R	stda	%f0, [%r0, %r31]
vahole_40_118:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe140  ! 158: STDFA_I	stda	%f0, [0x0140, %r31]
	.word 0xa1b1c491  ! 159: FCMPLE32	fcmple32	%d38, %d48, %r16
ibp_40_120:
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
ibp_startwait40_120:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_120
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_120:
    brnz %r16, ibp_wait40_120
    ld [%r23], %r16
    ba ibp_startwait40_120
    mov 0x40, %r16
continue_ibp_40_120:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_120:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_120
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_120:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_120
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_120:
    best_set_reg(0x00000050bffd440f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc030  ! 160: LDXA_R	ldxa	[%r31, %r16] 0x01, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_121:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 161: RDPC	rd	%pc, %r13
	.word 0x99a0016d  ! 162: FABSq	dis not found

	.word 0xc19fe120  ! 163: LDDFA_I	ldda	[%r31, 0x0120], %f0
mondo_40_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d950010  ! 164: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
splash_tba_40_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
vahole_40_125:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fc3e0  ! 166: LDDFA_R	ldda	[%r31, %r0], %f0
trapasi_40_126:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2d04b60  ! 167: LDSHA_R	ldsha	[%r1, %r0] 0x5b, %r9
ibp_40_127:
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
ibp_startwait40_127:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_127
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_127:
    brnz %r16, ibp_wait40_127
    ld [%r23], %r16
    ba ibp_startwait40_127
    mov 0x40, %r16
continue_ibp_40_127:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_127
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_127:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_127
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_127:
    best_set_reg(0x0000005001c40fcf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd29fc032  ! 168: LDDA_R	ldda	[%r31, %r18] 0x01, %r9
donret_40_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_128-donret_40_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d998df | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x845, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_128:
	.word 0xd2ffe139  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x0139] %asi
jmptr_40_129:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc32fc009  ! 171: STXFSR_R	st-sfr	%f1, [%r9, %r31]
vahole_40_131:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3ecc030  ! 172: PREFETCHA_R	prefetcha	[%r19, %r16] 0x01, #one_read
	.word 0xe727e1bd  ! 173: STF_I	st	%f19, [0x01bd, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_132:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 174: RDPC	rd	%pc, %r13
	.word 0x87802010  ! 175: WRASI_I	wr	%r0, 0x0010, %asi
donret_40_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_133-donret_40_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c855a1 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_133:
	.word 0x97a449d2  ! 176: FDIVd	fdivd	%f48, %f18, %f42
	.word 0x99500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_40_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f0, %f4
	.word 0x93b4c313  ! 178: ALIGNADDRESS	alignaddr	%r19, %r19, %r9
	setx 0x2ec924b95eb221cd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbule,a,pn	%fcc0,  skip_40_136
	.word 0x95a289c9  ! 1: FDIVd	fdivd	%f10, %f40, %f10
.align 128
skip_40_136:
	.word 0xc36fe0b2  ! 180: PREFETCH_I	prefetch	[%r31 + 0x00b2], #one_read
	.word 0xa3500000  ! 181: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xda8008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_40_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe2526dae86915ca0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 185: Tcc_R	te	icc_or_xcc, %r0 + %r30
dvapa_40_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc9a, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc009  ! 186: STXFSR_R	st-sfr	%f1, [%r9, %r31]
donret_40_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_139-donret_40_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ac70fa | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf8f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_40_139:
	.word 0xdaffe190  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x0190] %asi
	brlez,pt  	%r20, skip_40_140
	brgez,pt  	%r20, skip_40_140
.align 512
skip_40_140:
	.word 0x87ac4a52  ! 188: FCMPd	fcmpd	%fcc<n>, %f48, %f18
memptr_40_141:
	set user_data_start, %r31
	.word 0x85853c34  ! 189: WRCCR_I	wr	%r20, 0x1c34, %ccr
dvapa_40_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe15, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa9702620  ! 190: POPC_I	popc	0x0620, %r20
dvapa_40_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdea, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc02d  ! 191: LDDA_R	ldda	[%r31, %r13] 0x01, %r19
fpinit_40_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 192: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x9469c00c  ! 193: UDIVX_R	udivx 	%r7, %r12, %r10
donret_40_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_145-donret_40_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00764acf | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb0d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_40_145:
	.word 0xe6ffe160  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x0160] %asi
	.word 0x91940003  ! 195: WRPR_PIL_R	wrpr	%r16, %r3, %pil
	.word 0x91950003  ! 196: WRPR_PIL_R	wrpr	%r20, %r3, %pil
	.word 0xa9b087d1  ! 197: PDIST	pdistn	%d2, %d48, %d20
	.word 0x9f803377  ! 198: SIR	sir	0x1377
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802020  ! 200: WRASI_I	wr	%r0, 0x0020, %asi
splash_hpstate_40_149:
	ta T_CHANGE_NONHPRIV
	.word 0x81982095  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0095, %hpstate
	.word 0xe697e1e8  ! 202: LDUHA_I	lduha	[%r31, + 0x01e8] %asi, %r19
dvapa_40_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb74, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc008  ! 203: STDF_R	std	%f19, [%r8, %r31]
	.word 0xa7840010  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
brcommon2_40_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7b7c711  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f17, %d50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfdc00  ! 205: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa3454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xe897e130  ! 207: LDUHA_I	lduha	[%r31, + 0x0130] %asi, %r20
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
    brnz %r10, sma_40_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 208: CASA_R	casa	[%r31] %asi, %r13, %r20
vahole_40_154:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd960  ! 209: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_40_155:
	nop
	ta T_CHANGE_HPRIV
	set 0xa62f4cc1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_156:
	.word 0x2ec8c001  ! 1: BRGEZ	brgez,a,pt	%r3,<label_0x8c001>
	.word 0x81982db4  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0db4, %hpstate
fpinit_40_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 212: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_tba_40_158:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_40_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa8ece60f4978ce63, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d920011  ! 215: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xe19fd960  ! 216: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_40_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc60fffff59a, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_40_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_163-donret_40_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cacfa7 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_163:
	.word 0x95a249c3  ! 218: FDIVd	fdivd	%f40, %f34, %f10
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r16
vahole_40_164:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4bfc02a  ! 221: STDA_R	stda	%r18, [%r31 + %r10] 0x01
ibp_40_165:
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
ibp_startwait40_165:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_165
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_165:
    brnz %r16, ibp_wait40_165
    ld [%r23], %r16
    ba ibp_startwait40_165
    mov 0x40, %r16
continue_ibp_40_165:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_165:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_165
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_165:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_165
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_165:
    best_set_reg(0x00000050ebcfcf25,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9f802de6  ! 222: SIR	sir	0x0de6
dvapa_40_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0xadb, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 223: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe44fe178  ! 224: LDSB_I	ldsb	[%r31 + 0x0178], %r18
mondo_40_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 225: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x94808009  ! 226: ADDcc_R	addcc 	%r2, %r9, %r10
	.word 0xda97c02c  ! 227: LDUHA_R	lduha	[%r31, %r12] 0x01, %r13
vahole_40_169:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x95703372  ! 228: POPC_I	popc	0x1372, %r10
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_170:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 229: RDPC	rd	%pc, %r18
vahole_40_171:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd0bfc032  ! 230: STDA_R	stda	%r8, [%r31 + %r18] 0x01
	.word 0x91950006  ! 231: WRPR_PIL_R	wrpr	%r20, %r6, %pil
pmu_40_173:
	nop
	setx 0xfffffab0fffffe9f, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd13fc00b  ! 233: STDF_R	std	%f8, [%r11, %r31]
	.word 0x936d000b  ! 234: SDIVX_R	sdivx	%r20, %r11, %r9
splash_cmpr_40_175:
	nop
	setx 0xb455416a45eea12d, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_176) + 0, 16, 16)) -> intp(4,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_176)&0xffffffff)  + 0, 16, 16)) -> intp(4,0,6)
#else
	setx 0xc0bdfc4970f5c571, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_40_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc32, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 237: STDFA_R	stda	%f0, [%r0, %r31]
vahole_40_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe040  ! 238: STDFA_I	stda	%f0, [0x0040, %r31]
fpinit_40_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e828df  ! 239: PREFETCHA_I	prefetcha	[%r0, + 0x08df] %asi, #one_read
mondo_40_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d92c008  ! 240: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
vahole_40_181:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fc2c0  ! 241: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_182) + 8, 16, 16)) -> intp(3,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_182)&0xffffffff)  + 8, 16, 16)) -> intp(3,0,14)
#else
	setx 0xcfb232b6859ee624, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
intveclr_40_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0f82ed26d44ea5e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_40_184:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe49fc028  ! 245: LDDA_R	ldda	[%r31, %r8] 0x01, %r18
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
    brnz %r10, sma_40_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 246: CASA_R	casa	[%r31] %asi, %r10, %r18
fpinit_40_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 247: FCMPd	fcmpd	%fcc<n>, %f0, %f4
vahole_40_187:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc00a  ! 248: STXFSR_R	st-sfr	%f1, [%r10, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_40_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a7c9c8  ! 1: FDIVd	fdivd	%f62, %f8, %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdb60  ! 250: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_40_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d94400c  ! 251: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	setx 0x4405aa2c787b0a11, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_40_192:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe3e7e008  ! 253: CASA_R	casa	[%r31] %asi, %r8, %r17
ibp_40_193:
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
ibp_startwait40_193:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_193
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_193:
    brnz %r16, ibp_wait40_193
    ld [%r23], %r16
    ba ibp_startwait40_193
    mov 0x40, %r16
continue_ibp_40_193:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_193:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_193
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_193:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_193
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_193:
    best_set_reg(0x0000005005cf2587,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fda00  ! 254: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xab84303c  ! 255: WR_CLEAR_SOFTINT_I	wr	%r16, 0x103c, %clear_softint
splash_lsu_40_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x6007f5a8, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 257: CASA_R	casa	[%r31] %asi, %r16, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_196) + 32, 16, 16)) -> intp(0,0,2)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_196)&0xffffffff)  + 32, 16, 16)) -> intp(0,0,2)
#else
	setx 0x6c87f408e85c72c4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99b40993  ! 259: BSHUFFLE	fmovc32	%d16, %d50, %d12
	.word 0x9f8035f5  ! 260: SIR	sir	0x15f5
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
    brnz %r10, sma_40_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 261: CASA_R	casa	[%r31] %asi, %r11, %r19
splash_tba_40_199:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_40_200:
	ta T_CHANGE_NONHPRIV
	.word 0x81982186  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
mondo_40_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d910010  ! 264: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
tagged_40_202:
	tsubcctv %r20, 0x1c52, %r18
	.word 0xe607e08c  ! 265: LDUW_I	lduw	[%r31 + 0x008c], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_40_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d948011  ! 267: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
splash_cmpr_40_204:
	nop
	setx 0xdfcf2b754ccf89a2, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_40_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1c0faf570e9f2eaa, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d03  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1d03, %pstate
cwp_40_207:
    set user_data_start, %o7
	.word 0x93902000  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_208) + 40, 16, 16)) -> intp(2,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_208)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,5)
#else
	setx 0x3830a5d5db0446a9, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_40_209:
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
ibp_startwait40_209:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_209
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_209:
    brnz %r16, ibp_wait40_209
    ld [%r23], %r16
    ba ibp_startwait40_209
    mov 0x40, %r16
continue_ibp_40_209:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_209:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_209
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_209:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_209
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_209:
    best_set_reg(0x0000005007e58717,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x93a489a7  ! 273: FDIVs	fdivs	%f18, %f7, %f9
mondo_40_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d930011  ! 274: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
ibp_40_211:
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
ibp_startwait40_211:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_211
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_211:
    brnz %r16, ibp_wait40_211
    ld [%r23], %r16
    ba ibp_startwait40_211
    mov 0x40, %r16
continue_ibp_40_211:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_211:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_211
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_211:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_211
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_211:
    best_set_reg(0x00000050bac717a0,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe020  ! 275: STDFA_I	stda	%f16, [0x0020, %r31]
splash_lsu_40_212:
	nop
	ta T_CHANGE_HPRIV
	set 0xfd80733a, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 277: Tcc_R	tne	icc_or_xcc, %r0 + %r30
trapasi_40_213:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d84a00  ! 278: LDXA_R	ldxa	[%r1, %r0] 0x50, %r20
pmu_40_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff74cfffff76c, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfc3e0  ! 280: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_216) + 48, 16, 16)) -> intp(0,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_216)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,14)
#else
	setx 0x0878194385cb5fdf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_40_217:
	nop
	ta T_CHANGE_HPRIV
	set 0x6c19ccf1, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d920012  ! 283: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
vahole_40_219:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 284: STDFA_R	stda	%f16, [%r0, %r31]
mondo_40_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94c006  ! 285: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	fbug skip_40_221
	.word 0xc368fffd  ! 1: PREFETCH_I	prefetch	[%r3 + 0xfffffffd], #one_read
.align 512
skip_40_221:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_222-donret_40_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002999df | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_222:
	.word 0xe86fe05b  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x005b]
jmptr_40_223:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_40_224:
	nop
	setx 0x5c90247db4f23a32, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_40_225:
	nop
	setx 0x7fd39e6523a324b3, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_40_226:
	nop
	setx 0xfffff08cfffffa90, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffef5fffffbcb, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d950002  ! 293: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0x87802055  ! 294: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa5a00162  ! 295: FABSq	dis not found

donret_40_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_230-donret_40_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004641d6 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf47, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	retry
donretarg_40_230:
	.word 0xe66fe0de  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x00de]
vahole_40_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfde00  ! 297: STDFA_R	stda	%f16, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_232:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 298: RDPC	rd	%pc, %r16
trapasi_40_233:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xda8844a0  ! 299: LDUBA_R	lduba	[%r1, %r0] 0x25, %r13
dvapa_40_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb3b, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a109ad  ! 300: FDIVs	fdivs	%f4, %f13, %f17
intveclr_40_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x86ace55a93e6cd19, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d91c00d  ! 302: WRPR_WSTATE_R	wrpr	%r7, %r13, %wstate
	setx 0x554413fc24481202, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a0016c  ! 304: FABSq	dis not found

pmu_40_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff205fffff05a, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcd7fffff0f2, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_241:
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
ibp_startwait40_241:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_241
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_241:
    brnz %r16, ibp_wait40_241
    ld [%r23], %r16
    ba ibp_startwait40_241
    mov 0x40, %r16
continue_ibp_40_241:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_241:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_241
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_241:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_241
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_241:
    best_set_reg(0x000000503fd7a0cf,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe53fc008  ! 307: STDF_R	std	%f18, [%r8, %r31]
splash_tba_40_242:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_40_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_243:
	.word 0x8f902002  ! 309: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 310: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_40_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe816b966b3c82029, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_40_245:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fda00  ! 312: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_40_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 313: CASA_R	casa	[%r31] %asi, %r10, %r18
dvapa_40_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0x82a, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93702eb2  ! 314: POPC_I	popc	0x0eb2, %r9
unsupttte_40_248:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a509b1  ! 315: FDIVs	fdivs	%f20, %f17, %f12
ibp_40_249:
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
ibp_startwait40_249:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_249
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_249:
    brnz %r16, ibp_wait40_249
    ld [%r23], %r16
    ba ibp_startwait40_249
    mov 0x40, %r16
continue_ibp_40_249:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_249:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_249
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_249:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_249
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_249:
    best_set_reg(0x000000503ee0cf40,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd0bfc032  ! 316: STDA_R	stda	%r8, [%r31 + %r18] 0x01
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_250) + 8, 16, 16)) -> intp(7,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_250)&0xffffffff)  + 8, 16, 16)) -> intp(7,0,13)
#else
	setx 0x4bcbb00c933ce74d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_40_251:
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
ibp_startwait40_251:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_251
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_251:
    brnz %r16, ibp_wait40_251
    ld [%r23], %r16
    ba ibp_startwait40_251
    mov 0x40, %r16
continue_ibp_40_251:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_251:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_251
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_251:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_251
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_251:
    best_set_reg(0x00000050bccf4020,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd097c02d  ! 319: LDUHA_R	lduha	[%r31, %r13] 0x01, %r8
vahole_40_252:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fdf20  ! 320: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xce3c3e84c5f18732, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0800a60  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r8
dvapa_40_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8f2, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc00b  ! 323: STDF_R	std	%f8, [%r11, %r31]
	.word 0x8d802000  ! 324: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_40_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe0ddf71811e6990b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 326: CASA_R	casa	[%r31] %asi, %r10, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 327: RDPC	rd	%pc, %r19
ibp_40_258:
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
ibp_startwait40_258:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_258
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_258:
    brnz %r16, ibp_wait40_258
    ld [%r23], %r16
    ba ibp_startwait40_258
    mov 0x40, %r16
continue_ibp_40_258:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_258:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_258
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_258:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_258
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_258:
    best_set_reg(0x0000005031c020b6,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc3e0  ! 328: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_40_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 329: FDIVd	fdivd	%f0, %f4, %f4
vahole_40_260:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda3ff065  ! 330: STD_I	std	%r13, [%r31 + 0xfffff065]
	.word 0xda800be0  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r13
	.word 0x96d4fd56  ! 332: UMULcc_I	umulcc 	%r19, 0xfffffd56, %r11
ibp_40_261:
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
ibp_startwait40_261:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_261
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_261:
    brnz %r16, ibp_wait40_261
    ld [%r23], %r16
    ba ibp_startwait40_261
    mov 0x40, %r16
continue_ibp_40_261:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_261:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_261
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_261:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_261
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_261:
    best_set_reg(0x0000005017e0b6e2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc3ecc030  ! 333: PREFETCHA_R	prefetcha	[%r19, %r16] 0x01, #one_read
mondo_40_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d930014  ! 334: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
mondo_40_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d930007  ! 335: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	.word 0x97524000  ! 336: RDPR_CWP	rdpr	%cwp, %r11
pmu_40_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffefffffffff8, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_40_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc25, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c02d  ! 338: LDUHA_R	lduha	[%r31, %r13] 0x01, %r9
splash_lsu_40_267:
	nop
	ta T_CHANGE_HPRIV
	set 0xa5de1fb5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_40_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_40_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_269-donret_40_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009e692e | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x30d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x2acb0001  ! 1: BRNZ	brnz,a,pt	%r12,<label_0xb0001>
	done
donretarg_40_269:
	.word 0xa3a509c6  ! 342: FDIVd	fdivd	%f20, %f6, %f48
ibp_40_270:
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
ibp_startwait40_270:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_270
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_270:
    brnz %r16, ibp_wait40_270
    ld [%r23], %r16
    ba ibp_startwait40_270
    mov 0x40, %r16
continue_ibp_40_270:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_270:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_270
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_270:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_270
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_270:
    best_set_reg(0x00000050a8f6e250,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fdf20  ! 343: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f802633  ! 344: SIR	sir	0x0633
splash_hpstate_40_271:
	.word 0x81982a17  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_272:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 346: RDPC	rd	%pc, %r10
ibp_40_273:
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
ibp_startwait40_273:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_273
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_273:
    brnz %r16, ibp_wait40_273
    ld [%r23], %r16
    ba ibp_startwait40_273
    mov 0x40, %r16
continue_ibp_40_273:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_273:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_273
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_273:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_273
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_273:
    best_set_reg(0x00000050dbe250c9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc032  ! 347: STDA_R	stda	%r13, [%r31 + %r18] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_274) + 8, 16, 16)) -> intp(1,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_274)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,20)
#else
	setx 0x5741383d716fca9b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff6bfffffffe, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_276:
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
ibp_startwait40_276:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_276
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_276:
    brnz %r16, ibp_wait40_276
    ld [%r23], %r16
    ba ibp_startwait40_276
    mov 0x40, %r16
continue_ibp_40_276:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_276:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_276
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_276:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_276
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_276:
    best_set_reg(0x00000050cdd0c9a9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9f802a91  ! 350: SIR	sir	0x0a91
pmu_40_277:
	nop
	setx 0xfffff151fffff993, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x9e5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b1c7c3  ! 352: PDIST	pdistn	%d38, %d34, %d12
dvapa_40_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb75, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97a409a4  ! 353: FDIVs	fdivs	%f16, %f4, %f11
	.word 0xe71fe110  ! 354: LDDF_I	ldd	[%r31, 0x0110], %f19
pmu_40_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9cafffffb2d, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_280) + 40, 16, 16)) -> intp(6,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_280)&0xffffffff)  + 40, 16, 16)) -> intp(6,0,20)
#else
	setx 0xf65e6c0b577b814b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e030  ! 357: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r19
intveclr_40_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb8cae9a44106c778, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_40_282:
	nop
	setx 0xfffff686fffff4c8, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0x64532c127b7e79a5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x40+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_284:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 362: RDPC	rd	%pc, %r11
	.word 0x9b450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r13
intveclr_40_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1d98c16403d7d226, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_40_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 365: FDIVd	fdivd	%f0, %f4, %f6
ibp_40_287:
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
ibp_startwait40_287:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_287
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_287:
    brnz %r16, ibp_wait40_287
    ld [%r23], %r16
    ba ibp_startwait40_287
    mov 0x40, %r16
continue_ibp_40_287:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_287:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_287
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_287:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_287
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_287:
    best_set_reg(0x0000005030c9a910,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa1b207d1  ! 366: PDIST	pdistn	%d8, %d48, %d16
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
    brnz %r10, sma_40_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 367: CASA_R	casa	[%r31] %asi, %r12, %r18
	.word 0x8d802004  ! 368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	setx 0x72ba17ebbdb1c4f8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 370: CASA_R	casa	[%r31] %asi, %r17, %r18
donret_40_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_291-donret_40_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009e741a | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x116, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_40_291:
	.word 0xa3a049c3  ! 371: FDIVd	fdivd	%f32, %f34, %f48
	.word 0xab847649  ! 372: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1649, %clear_softint
	.word 0xd6800c00  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
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
    brnz %r10, sma_40_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e013  ! 374: CASA_R	casa	[%r31] %asi, %r19, %r11
br_longdelay2_40_293:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_40_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd84, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 376: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_lsu_40_295:
	nop
	ta T_CHANGE_HPRIV
	set 0xfb4e3fc4, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_40_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93a449b4  ! 378: FDIVs	fdivs	%f17, %f20, %f9
	.word 0x8d802004  ! 379: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_40_297:
	nop
	setx 0xe4c0a908dad5bf09, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_298) + 16, 16, 16)) -> intp(5,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_298)&0xffffffff)  + 16, 16, 16)) -> intp(5,0,21)
#else
	setx 0x4debfa2444db9a42, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91948010  ! 382: WRPR_PIL_R	wrpr	%r18, %r16, %pil
splash_cmpr_40_300:
	nop
	setx 0x8fe89f44a99a99bc, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_40_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d95000c  ! 385: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0xd037e1ca  ! 386: STH_I	sth	%r8, [%r31 + 0x01ca]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x947f1192e5b6a7cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00163  ! 389: FABSq	dis not found

donret_40_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_305-donret_40_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c9565c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_305:
	.word 0xe8ffe159  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0159] %asi
	.word 0xe897e008  ! 391: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r20
	.word 0xe8d7e050  ! 392: LDSHA_I	ldsha	[%r31, + 0x0050] %asi, %r20
pmu_40_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeaafffffe86, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_40_307:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfd960  ! 394: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_40_308:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8c84b40  ! 395: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r20
trapasi_40_309:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d84a00  ! 396: LDXA_R	ldxa	[%r1, %r0] 0x50, %r20
ibp_40_310:
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
ibp_startwait40_310:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_310
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_310:
    brnz %r16, ibp_wait40_310
    ld [%r23], %r16
    ba ibp_startwait40_310
    mov 0x40, %r16
continue_ibp_40_310:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_310:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_310
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_310:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_310
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_310:
    best_set_reg(0x000000503be910d3,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc02c  ! 397: STDA_R	stda	%r20, [%r31 + %r12] 0x01
intveclr_40_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc0aa259b1f9a30b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_40_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_40_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff6fefffff3fa, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
	setx vahole_target1, %r18, %r27
	.word 0xe49fc028  ! 1: LDDA_R	ldda	[%r31, %r8] 0x01, %r18
jmptr_20_1:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xc1bfd920  ! 4: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_20_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 5: CASA_R	casa	[%r31] %asi, %r19, %r18
	setx vahole_target2, %r18, %r27
	.word 0x87aa8a50  ! 6: FCMPd	fcmpd	%fcc<n>, %f10, %f16
	.word 0xe19fe120  ! 7: LDDFA_I	ldda	[%r31, 0x0120], %f16
ibp_20_4:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe1c0  ! 8: STDFA_I	stda	%f0, [0x01c0, %r31]
	.word 0xe1bfc2c0  ! 9: STDFA_R	stda	%f16, [%r0, %r31]
pmu_20_6:
	nop
	setx 0xfffffbc2fffff2a4, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_7:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe180  ! 11: STDFA_I	stda	%f16, [0x0180, %r31]
	.word 0x9f802032  ! 12: SIR	sir	0x0032
brcommon1_20_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87acca49  ! 13: FCMPd	fcmpd	%fcc<n>, %f50, %f40
	.word 0x99540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_20_9:
	nop
	ta T_CHANGE_HPRIV
	set 0xcb465b32, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe1a9  ! 16: STB_I	stb	%r20, [%r31 + 0x01a9]
pmu_20_10:
	nop
	setx 0xfffff148fffff5e4, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80386c  ! 18: SIR	sir	0x186c
	.word 0x8d902991  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x0991, %pstate
dvapa_20_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0x888, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 20: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_20_13:
	nop
	setx 0xae2deaea9a5cc814, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_20_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_14-donret_20_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0094cfdc | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8c5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_14:
	.word 0xa5a1c9c5  ! 22: FDIVd	fdivd	%f38, %f36, %f18
trapasi_20_15:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdac04a00  ! 23: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r13
dvapa_20_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8e3, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda3ff293  ! 24: STD_I	std	%r13, [%r31 + 0xfffff293]
	.word 0x8d802000  ! 25: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda3fc000  ! 26: STD_R	std	%r13, [%r31 + %r0]
splash_cmpr_20_18:
	nop
	setx 0x2dd5adbb6ef13e81, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_20_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0x84f2f10aca602d96, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xed566c52beea68dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 30: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0x91a00164  ! 31: FABSq	dis not found

memptr_20_23:
	set 0x60540000, %r31
	.word 0x8582b62f  ! 32: WRCCR_I	wr	%r10, 0x162f, %ccr
splash_tba_20_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe1e8  ! 34: LDX_I	ldx	[%r31 + 0x01e8], %r18
	.word 0x9f803d69  ! 35: SIR	sir	0x1d69
mondo_20_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d94000b  ! 36: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
donret_20_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_26-donret_20_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ef8db5 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_26:
	.word 0xe46fe1c6  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x01c6]
donret_20_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_27-donret_20_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c96453 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x217, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x22cc8001  ! 1: BRZ	brz,a,pt	%r18,<label_0xc8001>
	done
donretarg_20_27:
	.word 0xe46fe026  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x0026]
	.word 0x91904010  ! 39: WRPR_PIL_R	wrpr	%r1, %r16, %pil
pmu_20_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff113fffff049, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc32fc000  ! 41: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_tba_20_31:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_20_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x178b960c9b5fc6f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e178  ! 44: LDUHA_I	lduha	[%r31, + 0x0178] %asi, %r18
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 45: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9818005  ! 46: WR_SET_SOFTINT_R	wr	%r6, %r5, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_33:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 47: RDPC	rd	%pc, %r9
tagged_20_34:
	tsubcctv %r20, 0x1459, %r8
	.word 0xe807e1b4  ! 48: LDUW_I	lduw	[%r31 + 0x01b4], %r20
splash_lsu_20_35:
	nop
	ta T_CHANGE_HPRIV
	set 0x3f0126ed, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_20_36:
	nop
	.word 0x9f803105  ! 50: SIR	sir	0x1105
	.word 0x97a00166  ! 51: FABSq	dis not found

intveclr_20_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc8185a518183f55a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d940006  ! 53: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
pmu_20_40:
	nop
	setx 0xfffffaecfffff1b1, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_20_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xba6, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdf20  ! 55: STDFA_R	stda	%f16, [%r0, %r31]
pmu_20_42:
	nop
	setx 0xfffff54dfffff357, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_20_43:
	taddcctv %r7, 0x1084, %r20
	.word 0xe807e00c  ! 57: LDUW_I	lduw	[%r31 + 0x000c], %r20
splash_lsu_20_44:
	nop
	ta T_CHANGE_HPRIV
	set 0xcad323d7, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_20_45:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xe8d844a0  ! 59: LDXA_R	ldxa	[%r1, %r0] 0x25, %r20
	.word 0x95a409a1  ! 60: FDIVs	fdivs	%f16, %f1, %f10
jmptr_20_46:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc30fc000  ! 62: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_cmpr_20_48:
	nop
	setx 0xc200cb1524854531, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_20_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92800a  ! 65: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
donret_20_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_51-donret_20_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0027f6e4 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x154, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_51:
	.word 0x93a349d0  ! 66: FDIVd	fdivd	%f44, %f16, %f40
brcommon1_20_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3e8c033  ! 67: PREFETCHA_R	prefetcha	[%r3, %r19] 0x01, #one_read
jmptr_20_53:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_20_54:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_20_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4904e40  ! 70: LDUHA_R	lduha	[%r1, %r0] 0x72, %r10
pmu_20_56:
	nop
	setx 0xfffff266fffffbdd, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_20_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_57-donret_20_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fcadf9 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x18f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_57:
	.word 0xd4ffe098  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x0098] %asi
brcommon1_20_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9bb44494  ! 73: FCMPLE32	fcmple32	%d48, %d20, %r13
	.word 0xc1bfe0a0  ! 74: STDFA_I	stda	%f0, [0x00a0, %r31]
dvapa_20_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc6f, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe03ffb51  ! 75: STD_I	std	%r16, [%r31 + 0xfffffb51]
donret_20_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_60-donret_20_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00971d9c | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6d6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_60:
	.word 0xe06fe166  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x0166]
	.word 0x8d903a71  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x1a71, %pstate
	.word 0xc19fe120  ! 78: LDDFA_I	ldda	[%r31, 0x0120], %f0
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_20_62:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	setx vahole_target3, %r18, %r27
	.word 0xe11fc011  ! 81: LDDF_R	ldd	[%r31, %r17], %f16
	.word 0x24cc8001  ! 82: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x8780208b  ! 83: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xe6dfe060  ! 84: LDXA_I	ldxa	[%r31, + 0x0060] %asi, %r19
splash_lsu_20_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xd1edb6c2, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 86: WRASI_I	wr	%r0, 0x0004, %asi
pmu_20_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff521fffff326, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x89379be6a5d108a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_68:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 89: RDPC	rd	%pc, %r9
brcommon3_20_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe43ff0aa  ! 90: STD_I	std	%r18, [%r31 + 0xfffff0aa]
pmu_20_70:
	nop
	setx 0xfffffd55fffff87a, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9195000d  ! 92: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_20_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d91800d  ! 94: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
    set 0x371a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b287d2  ! 95: PDIST	pdistn	%d10, %d18, %d20
	setx vahole_target2, %r18, %r27
	.word 0x93a289d0  ! 96: FDIVd	fdivd	%f10, %f16, %f40
splash_tba_20_74:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_20_75:
    set user_data_start, %o7
	.word 0x93902001  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa5a08d28  ! 99: FsMULd	fsmuld	%f2, %f8, %f18
dvapa_20_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb10, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc012  ! 100: STDF_R	std	%f12, [%r18, %r31]
	.word 0xd847e060  ! 101: LDSW_I	ldsw	[%r31 + 0x0060], %r12
mondo_20_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950013  ! 102: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0xa5540000  ! 103: RDPR_GL	<illegal instruction>
	.word 0x91a00165  ! 104: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_20_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d914002  ! 106: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
	setx 0x1621d0d6137255ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe020  ! 108: STDFA_I	stda	%f0, [0x0020, %r31]
splash_cmpr_20_82:
	nop
	setx 0x669322877afe65ba, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_20_83:
	nop
	setx 0xfffff74ffffffc98, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa780fbdc  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r3, 0x1bdc, %-
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
    brnz %r10, sma_20_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 112: CASA_R	casa	[%r31] %asi, %r19, %r20
fpinit_20_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 113: FCMPLE32	fcmple32	%d0, %d4, %r6
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 114: RDPC	rd	%pc, %r20
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
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 115: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa984c009  ! 116: WR_SET_SOFTINT_R	wr	%r19, %r9, %set_softint
	setx vahole_target2, %r18, %r27
	.word 0x91a4c9a3  ! 117: FDIVs	fdivs	%f19, %f3, %f8
	setx vahole_target1, %r18, %r27
	.word 0xe1bfc2c0  ! 118: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91944006  ! 119: WRPR_PIL_R	wrpr	%r17, %r6, %pil
	.word 0x8780204f  ! 120: WRASI_I	wr	%r0, 0x004f, %asi
pmu_20_91:
	nop
	setx 0xfffffcb0fffff7dc, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd6800a80  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
intveclr_20_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc715ee4cf9bfad57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target0, %r18, %r27
	.word 0xe19fda00  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd69fe188  ! 125: LDDA_I	ldda	[%r31, + 0x0188] %asi, %r11
	.word 0xe1bfe020  ! 126: STDFA_I	stda	%f16, [0x0020, %r31]
fpinit_20_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 127: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xd6800a60  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_96:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 129: RDPC	rd	%pc, %r12
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_20_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff369ffffff33, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 132: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_20_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_20_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d944014  ! 134: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
jmptr_20_100:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd5e7c020  ! 136: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0x93a0016a  ! 137: FABSq	dis not found

	.word 0x91d02034  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd8cfe1d8  ! 139: LDSBA_I	ldsba	[%r31, + 0x01d8] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 140: RDPC	rd	%pc, %r16
	.word 0x8d902175  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0175, %pstate
donret_20_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_105-donret_20_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fef2af | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x654, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_105:
	.word 0xe66fe09e  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x009e]
fpinit_20_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 143: FCMPLE32	fcmple32	%d0, %d4, %r4
donret_20_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_107-donret_20_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000e41d4 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa9f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_107:
	.word 0xa5a089c3  ! 144: FDIVd	fdivd	%f2, %f34, %f18
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
    brnz %r10, sma_20_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e010  ! 145: CASA_R	casa	[%r31] %asi, %r16, %r10
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 146: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_20_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_20_110:
	nop
	.word 0xc1bfe1a0  ! 148: STDFA_I	stda	%f0, [0x01a0, %r31]
mondo_20_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d94800b  ! 149: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x8d802004  ! 150: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d903747  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x1747, %pstate
	.word 0xc36fe0d1  ! 152: PREFETCH_I	prefetch	[%r31 + 0x00d1], #one_read
splash_hpstate_20_114:
	.word 0x24c90001  ! 1: BRLEZ	brlez,a,pt	%r4,<label_0x90001>
	.word 0x81982b17  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
cwp_20_115:
    set user_data_start, %o7
	.word 0x93902007  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa4dd0012  ! 155: SMULcc_R	smulcc 	%r20, %r18, %r18
	.word 0x9194c012  ! 156: WRPR_PIL_R	wrpr	%r19, %r18, %pil
	setx vahole_target0, %r18, %r27
	.word 0xe1bfc2c0  ! 157: STDFA_R	stda	%f16, [%r0, %r31]
	setx vahole_target3, %r18, %r27
	.word 0xe1bfe0e0  ! 158: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xc3e9c023  ! 159: PREFETCHA_R	prefetcha	[%r7, %r3] 0x01, #one_read
ibp_20_120:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe09fc02c  ! 160: LDDA_R	ldda	[%r31, %r12] 0x01, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 161: RDPC	rd	%pc, %r19
	.word 0x99a00162  ! 162: FABSq	dis not found

	.word 0xc19fe140  ! 163: LDDFA_I	ldda	[%r31, 0x0140], %f0
mondo_20_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d930010  ! 164: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
splash_tba_20_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx vahole_target1, %r18, %r27
	.word 0xe19fc3e0  ! 166: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_20_126:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2904b60  ! 167: LDUHA_R	lduha	[%r1, %r0] 0x5b, %r9
ibp_20_127:
	nop
	.word 0xd3e7e00a  ! 168: CASA_R	casa	[%r31] %asi, %r10, %r9
donret_20_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_128-donret_20_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00586b43 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x706, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_128:
	.word 0xd2ffe1d1  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x01d1] %asi
jmptr_20_129:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd3e7e009  ! 171: CASA_R	casa	[%r31] %asi, %r9, %r9
	setx vahole_target3, %r18, %r27
	.word 0xa5b507cd  ! 172: PDIST	pdistn	%d20, %d44, %d18
	.word 0xe727e18f  ! 173: STF_I	st	%f19, [0x018f, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_132:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 174: RDPC	rd	%pc, %r8
	.word 0x87802055  ! 175: WRASI_I	wr	%r0, 0x0055, %asi
donret_20_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_133-donret_20_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002f9d1f | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc94, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_20_133:
	.word 0x93a489d2  ! 176: FDIVd	fdivd	%f18, %f18, %f40
	.word 0xa5500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_20_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f22, %f10
	.word 0xa1b10314  ! 178: ALIGNADDRESS	alignaddr	%r4, %r20, %r16
	setx 0x33d8ac5aba2f1800, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd5e7c020  ! 180: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0x91500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xda800b80  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_20_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xee05c58e0ba61856, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
dvapa_20_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf06, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc00a  ! 186: LDDF_R	ldd	[%r31, %r10], %f13
donret_20_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_139-donret_20_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00766b59 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xad4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	done
donretarg_20_139:
	.word 0xdaffe13f  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x013f] %asi
	.word 0x91b204c3  ! 188: FCMPNE32	fcmpne32	%d8, %d34, %r8
memptr_20_141:
	set user_data_start, %r31
	.word 0x8581ef12  ! 189: WRCCR_I	wr	%r7, 0x0f12, %ccr
dvapa_20_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe9e, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a089ca  ! 190: FDIVd	fdivd	%f2, %f10, %f48
dvapa_20_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xef3, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc02c  ! 191: STDA_R	stda	%r19, [%r31 + %r12] 0x01
fpinit_20_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 192: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x986d0009  ! 193: UDIVX_R	udivx 	%r20, %r9, %r12
donret_20_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_145-donret_20_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00edeeac | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_145:
	.word 0xe6ffe04c  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x004c] %asi
	.word 0x9195000d  ! 195: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	.word 0x9190c013  ! 196: WRPR_PIL_R	wrpr	%r3, %r19, %pil
	.word 0x87acca48  ! 197: FCMPd	fcmpd	%fcc<n>, %f50, %f8
	.word 0x9f803f02  ! 198: SIR	sir	0x1f02
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802014  ! 200: WRASI_I	wr	%r0, 0x0014, %asi
splash_hpstate_20_149:
	ta T_CHANGE_NONHPRIV
	.word 0x8198280d  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080d, %hpstate
	.word 0xe697e168  ! 202: LDUHA_I	lduha	[%r31, + 0x0168] %asi, %r19
dvapa_20_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8a6, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc010  ! 203: STXFSR_R	st-sfr	%f1, [%r16, %r31]
splash_decr_20_151:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa781c010  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r16, %-
brcommon2_20_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a489c3  ! 1: FDIVd	fdivd	%f18, %f34, %f50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe000  ! 205: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0x97454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe897e120  ! 207: LDUHA_I	lduha	[%r31, + 0x0120] %asi, %r20
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
    brnz %r10, sma_20_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 208: CASA_R	casa	[%r31] %asi, %r19, %r20
	setx vahole_target3, %r18, %r27
	.word 0xe19fda00  ! 209: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_20_155:
	nop
	ta T_CHANGE_HPRIV
	set 0x3d05cc51, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_156:
	.word 0x22c88001  ! 1: BRZ	brz,a,pt	%r2,<label_0x88001>
	.word 0x8198283f  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x083f, %hpstate
fpinit_20_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82de6  ! 212: PREFETCHA_I	prefetcha	[%r0, + 0x0de6] %asi, #one_read
splash_tba_20_158:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_20_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9926757b379a2955, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94c009  ! 215: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xc19fd920  ! 216: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_20_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff3e4fffffa8c, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_20_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_163-donret_20_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d1a841 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xecc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x2cca4001  ! 1: BRGZ	brgz,a,pt	%r9,<label_0xa4001>
	done
donretarg_20_163:
	.word 0xa3a049d1  ! 218: FDIVd	fdivd	%f32, %f48, %f48
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r9
	setx vahole_target3, %r18, %r27
	.word 0xe43fede6  ! 221: STD_I	std	%r18, [%r31 + 0x0de6]
ibp_20_165:
	nop
	.word 0xe43fede6  ! 222: STD_I	std	%r18, [%r31 + 0x0de6]
dvapa_20_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfac, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd920  ! 223: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe44fe048  ! 224: LDSB_I	ldsb	[%r31 + 0x0048], %r18
mondo_20_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d930002  ! 225: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
	.word 0x9a830014  ! 226: ADDcc_R	addcc 	%r12, %r20, %r13
	.word 0xdb3fc00d  ! 227: STDF_R	std	%f13, [%r13, %r31]
	setx vahole_target2, %r18, %r27
	.word 0x93b1c7d0  ! 228: PDIST	pdistn	%d38, %d16, %d40
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_170:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 229: RDPC	rd	%pc, %r18
	setx vahole_target0, %r18, %r27
	.word 0xd1e7e009  ! 230: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x91920001  ! 231: WRPR_PIL_R	wrpr	%r8, %r1, %pil
pmu_20_173:
	nop
	setx 0xfffff951fffff9b8, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc32fc012  ! 233: STXFSR_R	st-sfr	%f1, [%r18, %r31]
	.word 0xa16c4010  ! 234: SDIVX_R	sdivx	%r17, %r16, %r16
splash_cmpr_20_175:
	nop
	setx 0x04cb88ff5a75fd49, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_176) + 56, 16, 16)) -> intp(4,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_176)&0xffffffff)  + 56, 16, 16)) -> intp(4,0,15)
#else
	setx 0x36cfe7d7b64d3bb4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_20_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfda, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd920  ! 237: LDDFA_R	ldda	[%r31, %r0], %f0
	setx vahole_target3, %r18, %r27
	.word 0xe1bfd960  ! 238: STDFA_R	stda	%f16, [%r0, %r31]
fpinit_20_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 239: FDIVd	fdivd	%f0, %f4, %f4
mondo_20_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d920013  ! 240: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	setx vahole_target1, %r18, %r27
	.word 0xc1bfc2c0  ! 241: STDFA_R	stda	%f0, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_182) + 16, 16, 16)) -> intp(7,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_182)&0xffffffff)  + 16, 16, 16)) -> intp(7,0,10)
#else
	setx 0xd63cefba5b578891, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4800b40  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
intveclr_20_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1a8c4f921bec9a47, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe4bfc033  ! 245: STDA_R	stda	%r18, [%r31 + %r19] 0x01
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
    brnz %r10, sma_20_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 246: CASA_R	casa	[%r31] %asi, %r17, %r18
fpinit_20_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 247: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx vahole_target2, %r18, %r27
	.word 0xe49fc033  ! 248: LDDA_R	ldda	[%r31, %r19] 0x01, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_20_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe1124005  ! 1: LDQF_R	-	[%r9, %r5], %f16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd960  ! 250: STDFA_R	stda	%f0, [%r0, %r31]
mondo_20_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c010  ! 251: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	setx 0x6cdc12b7b32b8f24, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe33fc010  ! 253: STDF_R	std	%f17, [%r16, %r31]
ibp_20_193:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 254: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xab85203f  ! 255: WR_CLEAR_SOFTINT_I	wr	%r20, 0x003f, %clear_softint
splash_lsu_20_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x961a7825, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00c  ! 257: CASA_R	casa	[%r31] %asi, %r12, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_196) + 24, 16, 16)) -> intp(0,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_196)&0xffffffff)  + 24, 16, 16)) -> intp(0,0,22)
#else
	setx 0xaee74ac4a7108cd5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9bb48994  ! 259: BSHUFFLE	fmovc32	%d18, %d20, %d44
	.word 0x9f8025fa  ! 260: SIR	sir	0x05fa
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
    brnz %r10, sma_20_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 261: CASA_R	casa	[%r31] %asi, %r19, %r19
splash_tba_20_199:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_20_200:
	ta T_CHANGE_NONHPRIV
	.word 0x81982547  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0547, %hpstate
mondo_20_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d908011  ! 264: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
tagged_20_202:
	tsubcctv %r0, 0x11a5, %r13
	.word 0xe607e0ec  ! 265: LDUW_I	lduw	[%r31 + 0x00ec], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_20_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d944005  ! 267: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
splash_cmpr_20_204:
	nop
	setx 0x18706c6e8f0f4be5, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_20_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0xadf8a14383fbd933, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902171  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0171, %pstate
cwp_20_207:
    set user_data_start, %o7
	.word 0x93902006  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_208) + 0, 16, 16)) -> intp(3,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_208)&0xffffffff)  + 0, 16, 16)) -> intp(3,0,24)
#else
	setx 0x257100e237fab72c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_20_209:
	nop
	.word 0xc3eb0034  ! 273: PREFETCHA_R	prefetcha	[%r12, %r20] 0x01, #one_read
mondo_20_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d944010  ! 274: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
ibp_20_211:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe160  ! 275: STDFA_I	stda	%f0, [0x0160, %r31]
splash_lsu_20_212:
	nop
	ta T_CHANGE_HPRIV
	set 0xa9cd1b4c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 277: Tcc_R	te	icc_or_xcc, %r0 + %r30
trapasi_20_213:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d04a00  ! 278: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r20
pmu_20_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd2efffffeef, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfc3e0  ! 280: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_216) + 48, 16, 16)) -> intp(3,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_216)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,25)
#else
	setx 0x3f0f092e8be5ab1f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_20_217:
	nop
	ta T_CHANGE_HPRIV
	set 0x9cc6f9e9, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d91c002  ! 283: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	setx vahole_target0, %r18, %r27
	.word 0xc1bfe0e0  ! 284: STDFA_I	stda	%f0, [0x00e0, %r31]
mondo_20_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948007  ! 285: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	.word 0x87a88a41  ! 286: FCMPd	fcmpd	%fcc<n>, %f2, %f32
donret_20_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_222-donret_20_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004bb630 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xacf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_222:
	.word 0xe86fe149  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x0149]
jmptr_20_223:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_20_224:
	nop
	setx 0x9958b810bc4d7142, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_20_225:
	nop
	setx 0xca788a22e3f45d64, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_20_226:
	nop
	setx 0xfffff4fffffff2d7, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff6d3fffff23e, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d920013  ! 293: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0x8780204f  ! 294: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x99a00161  ! 295: FABSq	dis not found

donret_20_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_230-donret_20_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b49030 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbce, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	retry
donretarg_20_230:
	.word 0xe66fe143  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x0143]
	setx vahole_target2, %r18, %r27
	.word 0xc19fda00  ! 297: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_232:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 298: RDPC	rd	%pc, %r18
trapasi_20_233:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 299: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
dvapa_20_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0xca0, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b1c491  ! 300: FCMPLE32	fcmple32	%d38, %d48, %r11
intveclr_20_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb673664a8dbf9a6e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92c003  ! 302: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
	setx 0xf37cd914996a0b58, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00173  ! 304: FABSq	dis not found

pmu_20_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff61cfffff8b5, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb07fffff644, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_241:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 307: CASA_R	casa	[%r31] %asi, %r18, %r18
splash_tba_20_242:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_20_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_243:
	.word 0x8f902002  ! 309: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802004  ! 310: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_20_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd30313727b00a127, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe19fd960  ! 312: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_20_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 313: CASA_R	casa	[%r31] %asi, %r18, %r18
dvapa_20_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb76, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa9703f6c  ! 314: POPC_I	popc	0x1f6c, %r20
	.word 0xa3a509ad  ! 315: FDIVs	fdivs	%f20, %f13, %f17
ibp_20_249:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc013  ! 316: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_250) + 24, 16, 16)) -> intp(7,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_250)&0xffffffff)  + 24, 16, 16)) -> intp(7,0,13)
#else
	setx 0xc407df13ec00b503, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_20_251:
	nop
	.word 0xd11fc009  ! 319: LDDF_R	ldd	[%r31, %r9], %f8
	setx vahole_target2, %r18, %r27
	.word 0xc1bfc3e0  ! 320: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0x3348e0e5f71885c6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0800c00  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
dvapa_20_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0x85a, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd097c02c  ! 323: LDUHA_R	lduha	[%r31, %r12] 0x01, %r8
	.word 0x8d802004  ! 324: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_20_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0x94802f42ab0271d8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 326: CASA_R	casa	[%r31] %asi, %r12, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_257:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 327: RDPC	rd	%pc, %r8
ibp_20_258:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 328: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_20_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83065  ! 329: PREFETCHA_I	prefetcha	[%r0, + 0xfffff065] %asi, #one_read
	setx vahole_target1, %r18, %r27
	.word 0xdb1fc011  ! 330: LDDF_R	ldd	[%r31, %r17], %f13
	.word 0xda800b40  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
	.word 0x94d536a4  ! 332: UMULcc_I	umulcc 	%r20, 0xfffff6a4, %r10
ibp_20_261:
	nop
	.word 0x95a409aa  ! 333: FDIVs	fdivs	%f16, %f10, %f10
mondo_20_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c00a  ! 334: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
mondo_20_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d918013  ! 335: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0x9b524000  ! 336: RDPR_CWP	rdpr	%cwp, %r13
pmu_20_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff6f5fffff935, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_20_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc9c, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd31fc00c  ! 338: LDDF_R	ldd	[%r31, %r12], %f9
splash_lsu_20_267:
	nop
	ta T_CHANGE_HPRIV
	set 0xdb8847d4, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_20_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 341: Tcc_R	te	icc_or_xcc, %r0 + %r30
donret_20_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_269-donret_20_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00800bdc | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa16, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	done
donretarg_20_269:
	.word 0x9ba309c9  ! 342: FDIVd	fdivd	%f12, %f40, %f44
ibp_20_270:
	nop
	.word 0xc1bfe0e0  ! 343: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0x9f8030d4  ! 344: SIR	sir	0x10d4
splash_hpstate_20_271:
	.word 0x81982e4f  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4f, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_272:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 346: RDPC	rd	%pc, %r9
ibp_20_273:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xda3fea91  ! 347: STD_I	std	%r13, [%r31 + 0x0a91]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_274) + 48, 16, 16)) -> intp(4,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_274)&0xffffffff)  + 48, 16, 16)) -> intp(4,0,13)
#else
	setx 0x2300a8c7facc2632, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff591fffff2a3, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_276:
	nop
	.word 0xdb1fc008  ! 350: LDDF_R	ldd	[%r31, %r8], %f13
pmu_20_277:
	nop
	setx 0xfffffcaffffff63a, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x294d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b447d0  ! 352: PDIST	pdistn	%d48, %d16, %d16
dvapa_20_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8df, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f803a5d  ! 353: SIR	sir	0x1a5d
	.word 0xe71fe148  ! 354: LDDF_I	ldd	[%r31, 0x0148], %f19
pmu_20_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb41fffff451, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_280) + 16, 16, 16)) -> intp(6,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_280)&0xffffffff)  + 16, 16, 16)) -> intp(6,0,0)
#else
	setx 0x8d81d87ff240753e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e070  ! 357: LDUHA_I	lduha	[%r31, + 0x0070] %asi, %r19
intveclr_20_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0x16850d8614f53a36, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_20_282:
	nop
	setx 0xfffff791fffff247, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6d75cea46d0c0b16, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x20+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_284:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 362: RDPC	rd	%pc, %r10
	.word 0xa1450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r16
intveclr_20_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd81ef743b329b3cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_20_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 365: FCMPd	fcmpd	%fcc<n>, %f0, %f4
ibp_20_287:
	nop
	.word 0x93a309d3  ! 366: FDIVd	fdivd	%f12, %f50, %f40
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
    brnz %r10, sma_20_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 367: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0x8d802004  ! 368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	setx 0x91ef532057bd2f3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 370: CASA_R	casa	[%r31] %asi, %r19, %r18
donret_20_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_291-donret_20_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fdde97 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x754, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_291:
	.word 0xa3a509d3  ! 371: FDIVd	fdivd	%f20, %f50, %f48
	.word 0xab816a20  ! 372: WR_CLEAR_SOFTINT_I	wr	%r5, 0x0a20, %clear_softint
	.word 0xd68008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
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
    brnz %r10, sma_20_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00d  ! 374: CASA_R	casa	[%r31] %asi, %r13, %r11
br_longdelay2_20_293:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x24cfc001  ! 375: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
dvapa_20_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcb5, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd697c02b  ! 376: LDUHA_R	lduha	[%r31, %r11] 0x01, %r11
splash_lsu_20_295:
	nop
	ta T_CHANGE_HPRIV
	set 0x8c70ddeb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_20_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9cb  ! 1: FDIVd	fdivd	%f62, %f42, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac8a44  ! 378: FCMPd	fcmpd	%fcc<n>, %f18, %f4
	.word 0x8d802000  ! 379: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_20_297:
	nop
	setx 0x975a25b2b2ff8aed, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_298) + 24, 16, 16)) -> intp(0,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_298)&0xffffffff)  + 24, 16, 16)) -> intp(0,0,18)
#else
	setx 0x574b2b26108145ca, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91928012  ! 382: WRPR_PIL_R	wrpr	%r10, %r18, %pil
splash_cmpr_20_300:
	nop
	setx 0x1cbbeafffbcb8c77, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_20_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d92c004  ! 385: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0xd037e1f4  ! 386: STH_I	sth	%r8, [%r31 + 0x01f4]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x38c79e4fb61e6d7d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00172  ! 389: FABSq	dis not found

donret_20_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_305-donret_20_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ad24f7 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x99d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_305:
	.word 0xe8ffe0b7  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x00b7] %asi
	.word 0xe897e0b0  ! 391: LDUHA_I	lduha	[%r31, + 0x00b0] %asi, %r20
	.word 0xe8d7e168  ! 392: LDSHA_I	ldsha	[%r31, + 0x0168] %asi, %r20
pmu_20_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdb7fffff85f, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xc1bfe180  ! 394: STDFA_I	stda	%f0, [0x0180, %r31]
trapasi_20_308:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8c84b40  ! 395: LDSBA_R	ldsba	[%r1, %r0] 0x5a, %r20
trapasi_20_309:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d04a00  ! 396: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r20
ibp_20_310:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe89fc02d  ! 397: LDDA_R	ldda	[%r31, %r13] 0x01, %r20
intveclr_20_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf4ebaf505dc87dec, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_20_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_20_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbf4fffff071, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
	setx vahole_target1, %r18, %r27
	.word 0xe49fc028  ! 1: LDDA_R	ldda	[%r31, %r8] 0x01, %r18
jmptr_10_1:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xc1bfc3e0  ! 4: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_10_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 5: CASA_R	casa	[%r31] %asi, %r13, %r18
	setx vahole_target2, %r18, %r27
	.word 0xa3b507cc  ! 6: PDIST	pdistn	%d20, %d12, %d48
	.word 0xe19fe1e0  ! 7: LDDFA_I	ldda	[%r31, 0x01e0], %f16
ibp_10_4:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1c0  ! 8: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xc1bfe0e0  ! 9: STDFA_I	stda	%f0, [0x00e0, %r31]
pmu_10_6:
	nop
	setx 0xfffff501fffffb09, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_7:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe180  ! 11: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0x9f8036c4  ! 12: SIR	sir	0x16c4
brcommon1_10_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1a2c9a6  ! 13: FDIVs	fdivs	%f11, %f6, %f16
	.word 0x93540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_10_9:
	nop
	ta T_CHANGE_HPRIV
	set 0x4f3384ef, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe0ea  ! 16: STB_I	stb	%r20, [%r31 + 0x00ea]
pmu_10_10:
	nop
	setx 0xfffffe40fffff28c, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f802e26  ! 18: SIR	sir	0x0e26
	.word 0x8d902574  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x0574, %pstate
dvapa_10_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaec, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe100  ! 20: STDFA_I	stda	%f0, [0x0100, %r31]
splash_cmpr_10_13:
	nop
	setx 0x28dd8634752d74ee, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_10_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_14-donret_10_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0022a31a | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2ccb0001  ! 1: BRGZ	brgz,a,pt	%r12,<label_0xb0001>
	retry
donretarg_10_14:
	.word 0xa5a249d0  ! 22: FDIVd	fdivd	%f40, %f16, %f18
trapasi_10_15:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
dvapa_10_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8e6, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc032  ! 24: STDA_R	stda	%r13, [%r31 + %r18] 0x01
	.word 0x8d802000  ! 25: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdbe7c020  ! 26: CASA_I	casa	[%r31] 0x 1, %r0, %r13
splash_cmpr_10_18:
	nop
	setx 0x2fd2b603d39945b5, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_10_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd32d4d572206b18f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4829c580dbaeeaa1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 30: CASA_R	casa	[%r31] %asi, %r20, %r13
	.word 0x9ba00171  ! 31: FABSq	dis not found

memptr_10_23:
	set 0x60340000, %r31
	.word 0x85853fd0  ! 32: WRCCR_I	wr	%r20, 0x1fd0, %ccr
splash_tba_10_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe180  ! 34: LDX_I	ldx	[%r31 + 0x0180], %r18
	.word 0x9f802539  ! 35: SIR	sir	0x0539
mondo_10_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d914011  ! 36: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
donret_10_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_26-donret_10_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d0a67c | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_26:
	.word 0xe46fe096  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x0096]
donret_10_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_27-donret_10_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0023c20b | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x88c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_27:
	.word 0xe46fe074  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x0074]
	.word 0x9194c007  ! 39: WRPR_PIL_R	wrpr	%r19, %r7, %pil
pmu_10_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd37fffff50c, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc36fe129  ! 41: PREFETCH_I	prefetch	[%r31 + 0x0129], #one_read
splash_tba_10_31:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_10_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x136fd2874b545d25, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e0a8  ! 44: LDUHA_I	lduha	[%r31, + 0x00a8] %asi, %r18
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9840004  ! 46: WR_SET_SOFTINT_R	wr	%r16, %r4, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_33:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 47: RDPC	rd	%pc, %r18
tagged_10_34:
	tsubcctv %r12, 0x1366, %r17
	.word 0xe807e06c  ! 48: LDUW_I	lduw	[%r31 + 0x006c], %r20
splash_lsu_10_35:
	nop
	ta T_CHANGE_HPRIV
	set 0x0c8c21c2, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_10_36:
	nop
	.word 0xe91fc010  ! 50: LDDF_R	ldd	[%r31, %r16], %f20
	.word 0x95a00170  ! 51: FABSq	dis not found

intveclr_10_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0ebd555f1d26ce5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90c013  ! 53: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
pmu_10_40:
	nop
	setx 0xffffff50fffff361, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_10_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xff2, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0c0  ! 55: STDFA_I	stda	%f16, [0x00c0, %r31]
pmu_10_42:
	nop
	setx 0xfffffbb3fffff061, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_10_43:
	taddcctv %r20, 0x14a0, %r18
	.word 0xe807e0f0  ! 57: LDUW_I	lduw	[%r31 + 0x00f0], %r20
splash_lsu_10_44:
	nop
	ta T_CHANGE_HPRIV
	set 0xd486e460, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_10_45:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe8c844a0  ! 59: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r20
	.word 0xa7a409aa  ! 60: FDIVs	fdivs	%f16, %f10, %f19
jmptr_10_46:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc36fe104  ! 62: PREFETCH_I	prefetch	[%r31 + 0x0104], #one_read
splash_cmpr_10_48:
	nop
	setx 0xabe0589a340bb90a, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_10_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d948009  ! 65: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
donret_10_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_51-donret_10_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c58690 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x39d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_51:
	.word 0x95a089d4  ! 66: FDIVd	fdivd	%f2, %f20, %f10
brcommon1_10_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87a94a54  ! 67: FCMPd	fcmpd	%fcc<n>, %f36, %f20
jmptr_10_53:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_10_54:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_10_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 70: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
pmu_10_56:
	nop
	setx 0xffffff5ffffffe44, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_10_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_57-donret_10_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004afb98 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x84c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_57:
	.word 0xd4ffe0af  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x00af] %asi
brcommon1_10_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa57024b1  ! 73: POPC_I	popc	0x04b1, %r18
	.word 0xe1bfe060  ! 74: STDFA_I	stda	%f16, [0x0060, %r31]
dvapa_10_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0xee5, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 75: CASA_R	casa	[%r31] %asi, %r16, %r16
donret_10_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_60-donret_10_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0094f5b0 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_60:
	.word 0xe06fe1d2  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x01d2]
	.word 0x8d902166  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x0166, %pstate
	.word 0xe19fe0e0  ! 78: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_10_62:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	setx vahole_target3, %r18, %r27
	.word 0xe0dfc034  ! 81: LDXA_R	ldxa	[%r31, %r20] 0x01, %r16
	.word 0x9f8030aa  ! 82: SIR	sir	0x10aa
	.word 0x87802080  ! 83: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe6dfe1e0  ! 84: LDXA_I	ldxa	[%r31, + 0x01e0] %asi, %r19
splash_lsu_10_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xe8cc1b71, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 86: WRASI_I	wr	%r0, 0x0055, %asi
pmu_10_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff814fffff734, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x89e4680a7b3618e8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_68:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 89: RDPC	rd	%pc, %r9
brcommon3_10_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4bfc032  ! 90: STDA_R	stda	%r18, [%r31 + %r18] 0x01
pmu_10_70:
	nop
	setx 0xfffff861fffffb59, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91950012  ! 92: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_10_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d91c010  ! 94: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
    set 0x2025, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b347d3  ! 95: PDIST	pdistn	%d44, %d50, %d18
	setx vahole_target2, %r18, %r27
	.word 0x9ba0c9c3  ! 96: FDIVd	fdivd	%f34, %f34, %f44
splash_tba_10_74:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_10_75:
    set user_data_start, %o7
	.word 0x93902001  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa3a28d2d  ! 99: FsMULd	fsmuld	%f10, %f44, %f48
dvapa_10_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf93, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd89fc031  ! 100: LDDA_R	ldda	[%r31, %r17] 0x01, %r12
	.word 0xd847e1a8  ! 101: LDSW_I	ldsw	[%r31 + 0x01a8], %r12
mondo_10_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 102: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x95540000  ! 103: RDPR_GL	<illegal instruction>
	.word 0xa3a00172  ! 104: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_10_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91000a  ! 106: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
	setx 0x7a12e505a91d9b16, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe0c0  ! 108: STDFA_I	stda	%f0, [0x00c0, %r31]
splash_cmpr_10_82:
	nop
	setx 0xaeba85c2c080e781, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_10_83:
	nop
	setx 0xfffffa69fffff3f4, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7852849  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x0849, %-
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
    brnz %r10, sma_10_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e009  ! 112: CASA_R	casa	[%r31] %asi, %r9, %r20
fpinit_10_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83f42  ! 113: PREFETCHA_I	prefetcha	[%r0, + 0xffffff42] %asi, #one_read
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 114: RDPC	rd	%pc, %r18
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
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 115: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xa9848014  ! 116: WR_SET_SOFTINT_R	wr	%r18, %r20, %set_softint
	setx vahole_target2, %r18, %r27
	.word 0x99a309b0  ! 117: FDIVs	fdivs	%f12, %f16, %f12
	setx vahole_target1, %r18, %r27
	.word 0xe1bfdc00  ! 118: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9192c005  ! 119: WRPR_PIL_R	wrpr	%r11, %r5, %pil
	.word 0x87802082  ! 120: WRASI_I	wr	%r0, 0x0082, %asi
pmu_10_91:
	nop
	setx 0xfffff9a5fffff133, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd68008a0  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
intveclr_10_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9040a7ba62824fc5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target0, %r18, %r27
	.word 0xe19fdb60  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd69fe0c8  ! 125: LDDA_I	ldda	[%r31, + 0x00c8] %asi, %r11
	.word 0xe19fdf20  ! 126: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_10_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 127: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xd68008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_96:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 129: RDPC	rd	%pc, %r20
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_10_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4cefffff1c7, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_10_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_10_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d908010  ! 134: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
jmptr_10_100:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd5e7c020  ! 136: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0x91a00170  ! 137: FABSq	dis not found

	.word 0x91d020b5  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd8cfe158  ! 139: LDSBA_I	ldsba	[%r31, + 0x0158] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 140: RDPC	rd	%pc, %r16
	.word 0x8d902925  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0925, %pstate
donret_10_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_105-donret_10_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004be994 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x645, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_105:
	.word 0xe66fe11e  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x011e]
fpinit_10_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 143: FDIVd	fdivd	%f0, %f4, %f6
donret_10_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_107-donret_10_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f4df09 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xad4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_107:
	.word 0x99a0c9cb  ! 144: FDIVd	fdivd	%f34, %f42, %f12
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
    brnz %r10, sma_10_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 145: CASA_R	casa	[%r31] %asi, %r18, %r10
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 146: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_10_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_10_110:
	nop
	.word 0xc1bfc2c0  ! 148: STDFA_R	stda	%f0, [%r0, %r31]
mondo_10_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d950008  ! 149: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x8d802004  ! 150: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90279f  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x079f, %pstate
	.word 0xd43fc000  ! 152: STD_R	std	%r10, [%r31 + %r0]
splash_hpstate_10_114:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982f14  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f14, %hpstate
cwp_10_115:
    set user_data_start, %o7
	.word 0x93902005  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa6dcc014  ! 155: SMULcc_R	smulcc 	%r19, %r20, %r19
	.word 0x91928005  ! 156: WRPR_PIL_R	wrpr	%r10, %r5, %pil
	setx vahole_target0, %r18, %r27
	.word 0xe1bfc3e0  ! 157: STDFA_R	stda	%f16, [%r0, %r31]
	setx vahole_target3, %r18, %r27
	.word 0xe1bfde00  ! 158: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x93a149a8  ! 159: FDIVs	fdivs	%f5, %f8, %f9
ibp_10_120:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc009  ! 160: LDDF_R	ldd	[%r31, %r9], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_121:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 161: RDPC	rd	%pc, %r9
	.word 0x91a00174  ! 162: FABSq	dis not found

	.word 0xc19fe060  ! 163: LDDFA_I	ldda	[%r31, 0x0060], %f0
mondo_10_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d904004  ! 164: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
splash_tba_10_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx vahole_target1, %r18, %r27
	.word 0xe19fc3e0  ! 166: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_10_126:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2c04b60  ! 167: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r9
ibp_10_127:
	nop
	.word 0xd2bfc030  ! 168: STDA_R	stda	%r9, [%r31 + %r16] 0x01
donret_10_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_128-donret_10_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005d2416 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_128:
	.word 0xd2ffe074  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x0074] %asi
jmptr_10_129:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd31fc010  ! 171: LDDF_R	ldd	[%r31, %r16], %f9
	setx vahole_target3, %r18, %r27
	.word 0x9ba4c9a2  ! 172: FDIVs	fdivs	%f19, %f2, %f13
	.word 0xe727e000  ! 173: STF_I	st	%f19, [0x0000, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_132:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 174: RDPC	rd	%pc, %r13
	.word 0x87802058  ! 175: WRASI_I	wr	%r0, 0x0058, %asi
donret_10_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_133-donret_10_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f5b396 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x41f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
donretarg_10_133:
	.word 0x93a309d1  ! 176: FDIVd	fdivd	%f12, %f48, %f40
	.word 0xa1500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_10_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f4, %f24, %f16
	.word 0x93b4030d  ! 178: ALIGNADDRESS	alignaddr	%r16, %r13, %r9
	setx 0x7275509ceae968cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd5e7c020  ! 180: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0xa9500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xda800b60  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_10_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6a03c611fd943341, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
dvapa_10_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0x83e, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc02c  ! 186: LDDA_R	ldda	[%r31, %r12] 0x01, %r13
donret_10_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_139-donret_10_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c8fa50 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_10_139:
	.word 0xdaffe004  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x0004] %asi
	.word 0x24cc8001  ! 188: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
memptr_10_141:
	set user_data_start, %r31
	.word 0x8580e3bd  ! 189: WRCCR_I	wr	%r3, 0x03bd, %ccr
dvapa_10_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f4, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x99b4048a  ! 190: FCMPLE32	fcmple32	%d16, %d10, %r12
dvapa_10_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf29, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc028  ! 191: LDDA_R	ldda	[%r31, %r8] 0x01, %r19
fpinit_10_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 192: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x986c0010  ! 193: UDIVX_R	udivx 	%r16, %r16, %r12
donret_10_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_145-donret_10_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0070e3e2 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd8f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_10_145:
	.word 0xe6ffe1da  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x01da] %asi
	.word 0x91950007  ! 195: WRPR_PIL_R	wrpr	%r20, %r7, %pil
	.word 0x9194c003  ! 196: WRPR_PIL_R	wrpr	%r19, %r3, %pil
	.word 0xc3ea402c  ! 197: PREFETCHA_R	prefetcha	[%r9, %r12] 0x01, #one_read
	.word 0x9f803789  ! 198: SIR	sir	0x1789
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802055  ! 200: WRASI_I	wr	%r0, 0x0055, %asi
splash_hpstate_10_149:
	ta T_CHANGE_NONHPRIV
	.word 0x81982e96  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e96, %hpstate
	.word 0xe697e140  ! 202: LDUHA_I	lduha	[%r31, + 0x0140] %asi, %r19
dvapa_10_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0x904, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02a  ! 203: LDUHA_R	lduha	[%r31, %r10] 0x01, %r19
splash_decr_10_151:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7814003  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r3, %-
brcommon2_10_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7b7c70c  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f12, %d50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe1e0  ! 205: STDFA_I	stda	%f16, [0x01e0, %r31]
	.word 0x91454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xe897e070  ! 207: LDUHA_I	lduha	[%r31, + 0x0070] %asi, %r20
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
    brnz %r10, sma_10_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 208: CASA_R	casa	[%r31] %asi, %r17, %r20
	setx vahole_target3, %r18, %r27
	.word 0xe1bfc2c0  ! 209: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_10_155:
	nop
	ta T_CHANGE_HPRIV
	set 0xd1753b85, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_156:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982687  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
fpinit_10_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 212: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_tba_10_158:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_10_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0x60d8bf41a74abd42, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d948008  ! 215: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0xc19fdc00  ! 216: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_10_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff3c4fffff8d2, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_10_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_163-donret_10_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0039a1ce | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc97, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_163:
	.word 0xa9a309d0  ! 218: FDIVd	fdivd	%f12, %f16, %f20
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 219: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r11
	setx vahole_target3, %r18, %r27
	.word 0xe49fc033  ! 221: LDDA_R	ldda	[%r31, %r19] 0x01, %r18
ibp_10_165:
	nop
	.word 0xe5e7e013  ! 222: CASA_R	casa	[%r31] %asi, %r19, %r18
dvapa_10_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdb0, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd960  ! 223: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe44fe030  ! 224: LDSB_I	ldsb	[%r31 + 0x0030], %r18
mondo_10_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d948011  ! 225: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x96810002  ! 226: ADDcc_R	addcc 	%r4, %r2, %r11
	.word 0xdbe7e013  ! 227: CASA_R	casa	[%r31] %asi, %r19, %r13
	setx vahole_target2, %r18, %r27
	.word 0xa9a249a4  ! 228: FDIVs	fdivs	%f9, %f4, %f20
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_170:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 229: RDPC	rd	%pc, %r13
	setx vahole_target0, %r18, %r27
	.word 0xd11fc009  ! 230: LDDF_R	ldd	[%r31, %r9], %f8
	.word 0x91944007  ! 231: WRPR_PIL_R	wrpr	%r17, %r7, %pil
pmu_10_173:
	nop
	setx 0xfffff29efffff1b0, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd1e7e011  ! 233: CASA_R	casa	[%r31] %asi, %r17, %r8
	.word 0xa36c0008  ! 234: SDIVX_R	sdivx	%r16, %r8, %r17
splash_cmpr_10_175:
	nop
	setx 0x64b71702ce05267e, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_176) + 8, 16, 16)) -> intp(2,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_176)&0xffffffff)  + 8, 16, 16)) -> intp(2,0,25)
#else
	setx 0x1e9ea2c32640478c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_10_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0x814, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdb60  ! 237: LDDFA_R	ldda	[%r31, %r0], %f0
	setx vahole_target3, %r18, %r27
	.word 0xc19fdb60  ! 238: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_10_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 239: FCMPLE32	fcmple32	%d0, %d4, %r6
mondo_10_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d910014  ! 240: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	setx vahole_target1, %r18, %r27
	.word 0xe1bfd960  ! 241: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_182) + 48, 16, 16)) -> intp(6,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_182)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,24)
#else
	setx 0x7472af478c6c9be3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4800ae0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r18
intveclr_10_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5441d5d054ee539e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe4dfc02c  ! 245: LDXA_R	ldxa	[%r31, %r12] 0x01, %r18
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
    brnz %r10, sma_10_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 246: CASA_R	casa	[%r31] %asi, %r9, %r18
fpinit_10_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 247: FCMPLE32	fcmple32	%d0, %d4, %r6
	setx vahole_target2, %r18, %r27
	.word 0xc32fc010  ! 248: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_10_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a7c9d2  ! 1: FDIVd	fdivd	%f62, %f18, %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe020  ! 250: STDFA_I	stda	%f16, [0x0020, %r31]
mondo_10_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 251: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	setx 0xf07340765f16734b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe31fc012  ! 253: LDDF_R	ldd	[%r31, %r18], %f17
ibp_10_193:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe100  ! 254: STDFA_I	stda	%f0, [0x0100, %r31]
	.word 0xab8170ee  ! 255: WR_CLEAR_SOFTINT_I	wr	%r5, 0x10ee, %clear_softint
splash_lsu_10_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x87358f20, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00c  ! 257: CASA_R	casa	[%r31] %asi, %r12, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_196) + 56, 16, 16)) -> intp(5,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_196)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,7)
#else
	setx 0x44d784d044517702, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7b40992  ! 259: BSHUFFLE	fmovc32	%d16, %d18, %d50
	.word 0x9f8020f8  ! 260: SIR	sir	0x00f8
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
    brnz %r10, sma_10_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 261: CASA_R	casa	[%r31] %asi, %r19, %r19
splash_tba_10_199:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_10_200:
	ta T_CHANGE_NONHPRIV
	.word 0x81982415  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0415, %hpstate
mondo_10_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 264: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
tagged_10_202:
	tsubcctv %r19, 0x1105, %r10
	.word 0xe607e066  ! 265: LDUW_I	lduw	[%r31 + 0x0066], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_10_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92c005  ! 267: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
splash_cmpr_10_204:
	nop
	setx 0xfd52556832ab5d49, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_10_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x84a23934a865b67d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902123  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0123, %pstate
cwp_10_207:
    set user_data_start, %o7
	.word 0x93902000  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_208) + 32, 16, 16)) -> intp(2,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_208)&0xffffffff)  + 32, 16, 16)) -> intp(2,0,8)
#else
	setx 0x26e85a2c66bf5ce7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_10_209:
	nop
	.word 0x99b34493  ! 273: FCMPLE32	fcmple32	%d44, %d50, %r12
mondo_10_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d914004  ! 274: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
ibp_10_211:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe120  ! 275: STDFA_I	stda	%f16, [0x0120, %r31]
splash_lsu_10_212:
	nop
	ta T_CHANGE_HPRIV
	set 0x20b15f89, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 277: Tcc_R	ta	icc_or_xcc, %r0 + %r30
trapasi_10_213:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8904a00  ! 278: LDUHA_R	lduha	[%r1, %r0] 0x50, %r20
pmu_10_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff71efffff4fa, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe0c0  ! 280: STDFA_I	stda	%f16, [0x00c0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_216) + 0, 16, 16)) -> intp(2,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_216)&0xffffffff)  + 0, 16, 16)) -> intp(2,0,10)
#else
	setx 0xdbedf7621a80d7f6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_10_217:
	nop
	ta T_CHANGE_HPRIV
	set 0xe72154ad, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d91c010  ! 283: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	setx vahole_target0, %r18, %r27
	.word 0xe19fd960  ! 284: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_10_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94000b  ! 285: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0x24cac001  ! 286: BRLEZ	brlez,a,pt	%r11,<label_0xac001>
donret_10_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_222-donret_10_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0045e2f1 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x987, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_222:
	.word 0xe86fe0f3  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x00f3]
jmptr_10_223:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_10_224:
	nop
	setx 0xb837ed14e1b47d2e, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_10_225:
	nop
	setx 0x3f8d5d8869978889, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_10_226:
	nop
	setx 0xfffff48ffffff21d, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb08fffff252, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d92c004  ! 293: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0x8780204f  ! 294: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91a00173  ! 295: FABSq	dis not found

donret_10_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_230-donret_10_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003c96d3 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x594, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_230:
	.word 0xe66fe177  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x0177]
	setx vahole_target2, %r18, %r27
	.word 0xe19fd920  ! 297: LDDFA_R	ldda	[%r31, %r0], %f16
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_232:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 298: RDPC	rd	%pc, %r12
trapasi_10_233:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 299: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
dvapa_10_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc75, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5a4c9c3  ! 300: FDIVd	fdivd	%f50, %f34, %f18
intveclr_10_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7efdbf3956ea3889, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d920005  ! 302: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
	setx 0xa0078c3dda773196, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00172  ! 304: FABSq	dis not found

pmu_10_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff119fffffb57, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff418fffff0cf, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_241:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe49fc02d  ! 307: LDDA_R	ldda	[%r31, %r13] 0x01, %r18
splash_tba_10_242:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_10_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_243:
	.word 0x8f902002  ! 309: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 310: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_10_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb3ce3599a3951ac6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe1bfde00  ! 312: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_10_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 313: CASA_R	casa	[%r31] %asi, %r12, %r18
dvapa_10_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd62, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7a4c9d0  ! 314: FDIVd	fdivd	%f50, %f16, %f50
	.word 0xa9a309a2  ! 315: FDIVs	fdivs	%f12, %f2, %f20
ibp_10_249:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd11fc008  ! 316: LDDF_R	ldd	[%r31, %r8], %f8
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_250) + 32, 16, 16)) -> intp(0,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_250)&0xffffffff)  + 32, 16, 16)) -> intp(0,0,31)
#else
	setx 0xc1e0b9904b2b2fbf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_10_251:
	nop
	.word 0xc32fc010  ! 319: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	setx vahole_target2, %r18, %r27
	.word 0xc1bfd960  ! 320: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0xd554b73a4bfeb70a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
dvapa_10_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcc4, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc028  ! 323: LDXA_R	ldxa	[%r31, %r8] 0x01, %r8
	.word 0x8d802004  ! 324: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_10_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0xca6cfcbf36f50e02, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 326: CASA_R	casa	[%r31] %asi, %r19, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 327: RDPC	rd	%pc, %r18
ibp_10_258:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 328: STDFA_R	stda	%f16, [%r0, %r31]
fpinit_10_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 329: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx vahole_target1, %r18, %r27
	.word 0xdb1fc012  ! 330: LDDF_R	ldd	[%r31, %r18], %f13
	.word 0xda8008a0  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x90d53e9c  ! 332: UMULcc_I	umulcc 	%r20, 0xfffffe9c, %r8
ibp_10_261:
	nop
	.word 0x93b1c491  ! 333: FCMPLE32	fcmple32	%d38, %d48, %r9
mondo_10_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c008  ! 334: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
mondo_10_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d950003  ! 335: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xa9524000  ! 336: RDPR_CWP	rdpr	%cwp, %r20
pmu_10_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa19ffffff42, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_10_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcf2, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc00d  ! 338: STDF_R	std	%f9, [%r13, %r31]
splash_lsu_10_267:
	nop
	ta T_CHANGE_HPRIV
	set 0x0c57af9f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_10_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 341: Tcc_R	tne	icc_or_xcc, %r0 + %r30
donret_10_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_269-donret_10_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002d0251 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x397, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x24c94001  ! 1: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
	done
donretarg_10_269:
	.word 0xa1a1c9c4  ! 342: FDIVd	fdivd	%f38, %f4, %f16
ibp_10_270:
	nop
	.word 0xc1bfd920  ! 343: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f8037ae  ! 344: SIR	sir	0x17ae
splash_hpstate_10_271:
	.word 0x81982045  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_272:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 346: RDPC	rd	%pc, %r11
ibp_10_273:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xda97c031  ! 347: LDUHA_R	lduha	[%r31, %r17] 0x01, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_274) + 56, 16, 16)) -> intp(5,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_274)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,27)
#else
	setx 0x07192a0ddc5a0445, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff069fffff259, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_276:
	nop
	.word 0xda9fc034  ! 350: LDDA_R	ldda	[%r31, %r20] 0x01, %r13
pmu_10_277:
	nop
	setx 0xfffff54dfffff5cd, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x3376, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b407d1  ! 352: PDIST	pdistn	%d16, %d48, %d16
dvapa_10_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0x86c, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a189a2  ! 353: FDIVs	fdivs	%f6, %f2, %f17
	.word 0xe71fe068  ! 354: LDDF_I	ldd	[%r31, 0x0068], %f19
pmu_10_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff66dfffff5a3, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_280) + 56, 16, 16)) -> intp(3,0,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_280)&0xffffffff)  + 56, 16, 16)) -> intp(3,0,1)
#else
	setx 0x4cd15927da47b87e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e040  ! 357: LDUHA_I	lduha	[%r31, + 0x0040] %asi, %r19
intveclr_10_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe30e8c306fbaeb8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_10_282:
	nop
	setx 0xfffff4dffffff601, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb1f999914782f6af, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x10+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_284:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 362: RDPC	rd	%pc, %r10
	.word 0x97450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r11
intveclr_10_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0x31d4e1cfedda1792, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_10_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 365: FCMPLE32	fcmple32	%d0, %d4, %r8
ibp_10_287:
	nop
	.word 0x87aa4a49  ! 366: FCMPd	fcmpd	%fcc<n>, %f40, %f40
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
    brnz %r10, sma_10_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 367: CASA_R	casa	[%r31] %asi, %r11, %r18
	.word 0x8d802000  ! 368: WRFPRS_I	wr	%r0, 0x0000, %fprs
	setx 0xc928d0e1d9c39378, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 370: CASA_R	casa	[%r31] %asi, %r18, %r18
donret_10_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_291-donret_10_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e8d717 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa5f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_10_291:
	.word 0x99a309c4  ! 371: FDIVd	fdivd	%f12, %f4, %f12
	.word 0xab84fe53  ! 372: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1e53, %clear_softint
	.word 0xd6800b00  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r11
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
    brnz %r10, sma_10_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 374: CASA_R	casa	[%r31] %asi, %r8, %r11
br_longdelay2_10_293:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0xd7e7c030  ! 375: CASA_I	casa	[%r31] 0x 1, %r16, %r11
dvapa_10_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0x971, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc031  ! 376: LDXA_R	ldxa	[%r31, %r17] 0x01, %r11
splash_lsu_10_295:
	nop
	ta T_CHANGE_HPRIV
	set 0x59c4ada4, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_10_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9cc  ! 1: FDIVd	fdivd	%f62, %f12, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1b487c1  ! 378: PDIST	pdistn	%d18, %d32, %d16
	.word 0x8d802000  ! 379: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_10_297:
	nop
	setx 0x9c7e2151db230c14, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_298) + 32, 16, 16)) -> intp(2,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_298)&0xffffffff)  + 32, 16, 16)) -> intp(2,0,13)
#else
	setx 0x7d5056ad4828e8e5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91944014  ! 382: WRPR_PIL_R	wrpr	%r17, %r20, %pil
splash_cmpr_10_300:
	nop
	setx 0xd1ef5a9782be0b90, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_10_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d924011  ! 385: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0xd037e0ca  ! 386: STH_I	sth	%r8, [%r31 + 0x00ca]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0xbe994f2ba5f84384, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a00174  ! 389: FABSq	dis not found

donret_10_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_305-donret_10_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003bac9c | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x60e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	done
donretarg_10_305:
	.word 0xe8ffe11c  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x011c] %asi
	.word 0xe897e098  ! 391: LDUHA_I	lduha	[%r31, + 0x0098] %asi, %r20
	.word 0xe8d7e0f0  ! 392: LDSHA_I	ldsha	[%r31, + 0x00f0] %asi, %r20
pmu_10_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7e2fffff9a0, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe1bfde00  ! 394: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_10_308:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8d04b40  ! 395: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r20
trapasi_10_309:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8c84a00  ! 396: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r20
ibp_10_310:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 397: CASA_R	casa	[%r31] %asi, %r18, %r20
intveclr_10_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7b77ad22dd6977a5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_10_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_10_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2acfffff91a, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
	.word 0xe49fc032  ! 1: LDDA_R	ldda	[%r31, %r18] 0x01, %r18
jmptr_8_1:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xe1bfd920  ! 4: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_8_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r18
	setx vahole_target2, %r18, %r27
	.word 0x997024f4  ! 6: POPC_I	popc	0x04f4, %r12
	.word 0xc19fe080  ! 7: LDDFA_I	ldda	[%r31, 0x0080], %f0
ibp_8_4:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe120  ! 8: STDFA_I	stda	%f0, [0x0120, %r31]
	.word 0xe1bfd920  ! 9: STDFA_R	stda	%f16, [%r0, %r31]
pmu_8_6:
	nop
	setx 0xfffff0affffff54a, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_7:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdc00  ! 11: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80389c  ! 12: SIR	sir	0x189c
brcommon1_8_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a149aa  ! 13: FDIVs	fdivs	%f5, %f10, %f19
	.word 0x91540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_8_9:
	nop
	ta T_CHANGE_HPRIV
	set 0xbd2c8c95, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe1e6  ! 16: STB_I	stb	%r20, [%r31 + 0x01e6]
pmu_8_10:
	nop
	setx 0xfffffef2ffffffb2, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803dc8  ! 18: SIR	sir	0x1dc8
	.word 0x8d903430  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1430, %pstate
dvapa_8_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc02, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe000  ! 20: STDFA_I	stda	%f16, [0x0000, %r31]
splash_cmpr_8_13:
	nop
	setx 0x4e40792310aa0aae, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_8_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_14-donret_8_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00870d3f | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x707, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x2ccc8001  ! 1: BRGZ	brgz,a,pt	%r18,<label_0xc8001>
	retry
donretarg_8_14:
	.word 0x95a049c7  ! 22: FDIVd	fdivd	%f32, %f38, %f10
trapasi_8_15:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xda904a00  ! 23: LDUHA_R	lduha	[%r1, %r0] 0x50, %r13
dvapa_8_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0x862, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda3ff293  ! 24: STD_I	std	%r13, [%r31 + 0xfffff293]
	.word 0x8d802000  ! 25: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc32fc000  ! 26: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_cmpr_8_18:
	nop
	setx 0x3d2c53921ceab083, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_8_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0x98f28b15bd3c1b32, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x898c04cc518558a5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 30: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x97a00170  ! 31: FABSq	dis not found

memptr_8_23:
	set 0x60740000, %r31
	.word 0x8580be8c  ! 32: WRCCR_I	wr	%r2, 0x1e8c, %ccr
splash_tba_8_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe1f0  ! 34: LDX_I	ldx	[%r31 + 0x01f0], %r18
	.word 0x9f8021ed  ! 35: SIR	sir	0x01ed
mondo_8_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d92c00b  ! 36: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
donret_8_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_26-donret_8_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fae713 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x38e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_26:
	.word 0xe46fe0c4  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x00c4]
donret_8_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_27-donret_8_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00310678 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x416, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	done
donretarg_8_27:
	.word 0xe46fe162  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x0162]
	.word 0x9194c003  ! 39: WRPR_PIL_R	wrpr	%r19, %r3, %pil
pmu_8_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0b8fffff6fc, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc32fc000  ! 41: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_tba_8_31:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_8_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa09b6d9fc7e1c7ff, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e180  ! 44: LDUHA_I	lduha	[%r31, + 0x0180] %asi, %r18
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 45: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9818006  ! 46: WR_SET_SOFTINT_R	wr	%r6, %r6, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_33:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 47: RDPC	rd	%pc, %r17
tagged_8_34:
	tsubcctv %r11, 0x160a, %r19
	.word 0xe807e066  ! 48: LDUW_I	lduw	[%r31 + 0x0066], %r20
splash_lsu_8_35:
	nop
	ta T_CHANGE_HPRIV
	set 0x43fa041c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_8_36:
	nop
	.word 0x9f803105  ! 50: SIR	sir	0x1105
	.word 0x95a00168  ! 51: FABSq	dis not found

intveclr_8_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa458eba7281f0238, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 53: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
pmu_8_40:
	nop
	setx 0xfffff2d6fffffd0b, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_8_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdb6, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1e0  ! 55: STDFA_I	stda	%f16, [0x01e0, %r31]
pmu_8_42:
	nop
	setx 0xfffff39ffffff68d, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_8_43:
	taddcctv %r8, 0x1cc4, %r16
	.word 0xe807e104  ! 57: LDUW_I	lduw	[%r31 + 0x0104], %r20
splash_lsu_8_44:
	nop
	ta T_CHANGE_HPRIV
	set 0x2104917e, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_8_45:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe8d044a0  ! 59: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r20
	.word 0x91a509a9  ! 60: FDIVs	fdivs	%f20, %f9, %f8
jmptr_8_46:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc30fc000  ! 62: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_cmpr_8_48:
	nop
	setx 0xcd79850309d1d8db, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_8_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d92c005  ! 65: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
donret_8_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_51-donret_8_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f8a19c | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa8d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_51:
	.word 0x97a409cb  ! 66: FDIVd	fdivd	%f16, %f42, %f42
brcommon1_8_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93a309b2  ! 67: FDIVs	fdivs	%f12, %f18, %f9
jmptr_8_53:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_8_54:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_8_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d04e40  ! 70: LDSHA_R	ldsha	[%r1, %r0] 0x72, %r10
pmu_8_56:
	nop
	setx 0xfffff4b7fffffc26, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_8_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_57-donret_8_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d87ced | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_57:
	.word 0xd4ffe071  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x0071] %asi
brcommon1_8_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a109ad  ! 73: FDIVs	fdivs	%f4, %f13, %f19
	.word 0xe1bfe1c0  ! 74: STDFA_I	stda	%f16, [0x01c0, %r31]
dvapa_8_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9df, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe03ffb51  ! 75: STD_I	std	%r16, [%r31 + 0xfffffb51]
donret_8_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_60-donret_8_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0065614e | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x894, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_60:
	.word 0xe06fe14d  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x014d]
	.word 0x8d903d5b  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x1d5b, %pstate
	.word 0xc19fe040  ! 78: LDDFA_I	ldda	[%r31, 0x0040], %f0
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_8_62:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	setx vahole_target3, %r18, %r27
	.word 0xe0bfc02d  ! 81: STDA_R	stda	%r16, [%r31 + %r13] 0x01
	.word 0x87ac8a48  ! 82: FCMPd	fcmpd	%fcc<n>, %f18, %f8
	.word 0x8780208b  ! 83: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xe6dfe070  ! 84: LDXA_I	ldxa	[%r31, + 0x0070] %asi, %r19
splash_lsu_8_65:
	nop
	ta T_CHANGE_HPRIV
	set 0x95e44fff, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 86: WRASI_I	wr	%r0, 0x0088, %asi
pmu_8_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5c6ffffff26, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc09d7153f736ed03, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_68:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 89: RDPC	rd	%pc, %r12
brcommon3_8_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe4bfc02a  ! 90: STDA_R	stda	%r18, [%r31 + %r10] 0x01
pmu_8_70:
	nop
	setx 0xfffffd85fffff357, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91928003  ! 92: WRPR_PIL_R	wrpr	%r10, %r3, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_8_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94c014  ! 94: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
    set 0x1028, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407d4  ! 95: PDIST	pdistn	%d16, %d20, %d40
	setx vahole_target2, %r18, %r27
	.word 0x91b447d1  ! 96: PDIST	pdistn	%d48, %d48, %d8
splash_tba_8_74:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_8_75:
    set user_data_start, %o7
	.word 0x93902004  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91a1cd2b  ! 99: FsMULd	fsmuld	%f7, %f42, %f8
dvapa_8_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0x952, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 100: CASA_R	casa	[%r31] %asi, %r18, %r12
	.word 0xd847e008  ! 101: LDSW_I	ldsw	[%r31 + 0x0008], %r12
mondo_8_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d95000b  ! 102: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x97540000  ! 103: RDPR_GL	<illegal instruction>
	.word 0x9ba0016b  ! 104: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_8_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d944001  ! 106: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	setx 0x86767219b4955498, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe120  ! 108: STDFA_I	stda	%f0, [0x0120, %r31]
splash_cmpr_8_82:
	nop
	setx 0x39a8dc7aed15d1b0, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_8_83:
	nop
	setx 0xfffff690fffff406, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa785309d  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x109d, %-
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
    brnz %r10, sma_8_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 112: CASA_R	casa	[%r31] %asi, %r11, %r20
fpinit_8_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 113: FDIVd	fdivd	%f0, %f4, %f6
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 114: RDPC	rd	%pc, %r16
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
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 115: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0xa9848014  ! 116: WR_SET_SOFTINT_R	wr	%r18, %r20, %set_softint
	setx vahole_target2, %r18, %r27
	.word 0xc3e88030  ! 117: PREFETCHA_R	prefetcha	[%r2, %r16] 0x01, #one_read
	setx vahole_target1, %r18, %r27
	.word 0xc19fda00  ! 118: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91948011  ! 119: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	.word 0x87802083  ! 120: WRASI_I	wr	%r0, 0x0083, %asi
pmu_8_91:
	nop
	setx 0xfffff13cfffff937, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd6800ae0  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r11
intveclr_8_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x730e310d0df25be6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target0, %r18, %r27
	.word 0xe1bfe040  ! 124: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xd69fe040  ! 125: LDDA_I	ldda	[%r31, + 0x0040] %asi, %r11
	.word 0xc1bfc3e0  ! 126: STDFA_R	stda	%f0, [%r0, %r31]
fpinit_8_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 127: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xd68008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_96:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 129: RDPC	rd	%pc, %r8
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_8_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffcaffffff33, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_8_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_8_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d92c010  ! 134: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
jmptr_8_100:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc30fc000  ! 136: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0xa9a00171  ! 137: FABSq	dis not found

	.word 0x91d020b3  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd8cfe0f8  ! 139: LDSBA_I	ldsba	[%r31, + 0x00f8] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_103:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 140: RDPC	rd	%pc, %r10
	.word 0x8d902949  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0949, %pstate
donret_8_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_105-donret_8_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002d6a6d | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x45d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_105:
	.word 0xe66fe1f7  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x01f7]
fpinit_8_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d6b  ! 143: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd6b] %asi, #one_read
donret_8_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_107-donret_8_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00649221 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_107:
	.word 0xa7a409d4  ! 144: FDIVd	fdivd	%f16, %f20, %f50
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
    brnz %r10, sma_8_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 145: CASA_R	casa	[%r31] %asi, %r19, %r10
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 146: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_8_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_8_110:
	nop
	.word 0xe19fdc00  ! 148: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_8_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d91c004  ! 149: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0x8d802000  ! 150: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902f82  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x0f82, %pstate
	.word 0xd43fc000  ! 152: STD_R	std	%r10, [%r31 + %r0]
splash_hpstate_8_114:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x81982626  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0626, %hpstate
cwp_8_115:
    set user_data_start, %o7
	.word 0x93902000  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x92d88014  ! 155: SMULcc_R	smulcc 	%r2, %r20, %r9
	.word 0x91950014  ! 156: WRPR_PIL_R	wrpr	%r20, %r20, %pil
	setx vahole_target0, %r18, %r27
	.word 0xe1bfe0e0  ! 157: STDFA_I	stda	%f16, [0x00e0, %r31]
	setx vahole_target3, %r18, %r27
	.word 0xe1bfe160  ! 158: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0x99703c0f  ! 159: POPC_I	popc	0x1c0f, %r12
ibp_8_120:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe097c029  ! 160: LDUHA_R	lduha	[%r31, %r9] 0x01, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 161: RDPC	rd	%pc, %r19
	.word 0xa7a00174  ! 162: FABSq	dis not found

	.word 0xc19fe0a0  ! 163: LDDFA_I	ldda	[%r31, 0x00a0], %f0
mondo_8_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d914010  ! 164: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
splash_tba_8_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx vahole_target1, %r18, %r27
	.word 0xc1bfd920  ! 166: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_8_126:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2c84b60  ! 167: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r9
ibp_8_127:
	nop
	.word 0xd297c02d  ! 168: LDUHA_R	lduha	[%r31, %r13] 0x01, %r9
donret_8_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_128-donret_8_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008b3ccd | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x61d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_128:
	.word 0xd2ffe03c  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x003c] %asi
jmptr_8_129:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fc028  ! 171: LDDA_R	ldda	[%r31, %r8] 0x01, %r9
	setx vahole_target3, %r18, %r27
	.word 0xc3ec0027  ! 172: PREFETCHA_R	prefetcha	[%r16, %r7] 0x01, #one_read
	.word 0xe727e0b4  ! 173: STF_I	st	%f19, [0x00b4, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_132:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 174: RDPC	rd	%pc, %r19
	.word 0x87802014  ! 175: WRASI_I	wr	%r0, 0x0014, %asi
donret_8_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_133-donret_8_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003a7add | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb85, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_8_133:
	.word 0x93a189d0  ! 176: FDIVd	fdivd	%f6, %f16, %f40
	.word 0xa9500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_8_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f16, %f24
	.word 0x99b4c310  ! 178: ALIGNADDRESS	alignaddr	%r19, %r16, %r12
	setx 0x421886e1e219c30b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd5e7c020  ! 180: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0xa1500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xda800b20  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_8_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6580c64842e6aa3d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
dvapa_8_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0x851, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc02d  ! 186: STDA_R	stda	%r13, [%r31 + %r13] 0x01
donret_8_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_139-donret_8_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e34e45 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x816, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_139:
	.word 0xdaffe090  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x0090] %asi
	.word 0x99a509c4  ! 188: FDIVd	fdivd	%f20, %f4, %f12
memptr_8_141:
	set user_data_start, %r31
	.word 0x8584659f  ! 189: WRCCR_I	wr	%r17, 0x059f, %ccr
dvapa_8_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb81, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b4c486  ! 190: FCMPLE32	fcmple32	%d50, %d6, %r16
dvapa_8_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb41, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c032  ! 191: LDUHA_R	lduha	[%r31, %r18] 0x01, %r19
fpinit_8_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 192: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x926ac00d  ! 193: UDIVX_R	udivx 	%r11, %r13, %r9
donret_8_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_145-donret_8_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00176450 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb46, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_8_145:
	.word 0xe6ffe1b0  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x01b0] %asi
	.word 0x91950011  ! 195: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0x91950010  ! 196: WRPR_PIL_R	wrpr	%r20, %r16, %pil
	.word 0xa5a289b2  ! 197: FDIVs	fdivs	%f10, %f18, %f18
	.word 0x9f8028c6  ! 198: SIR	sir	0x08c6
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802020  ! 200: WRASI_I	wr	%r0, 0x0020, %asi
splash_hpstate_8_149:
	ta T_CHANGE_NONHPRIV
	.word 0x81982a4e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	.word 0xe697e108  ! 202: LDUHA_I	lduha	[%r31, + 0x0108] %asi, %r19
dvapa_8_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9d6, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 203: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0xa7818012  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r18, %-
brcommon2_8_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a509c3  ! 1: FDIVd	fdivd	%f20, %f34, %f50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0c0  ! 205: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0x97454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe897e170  ! 207: LDUHA_I	lduha	[%r31, + 0x0170] %asi, %r20
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
    brnz %r10, sma_8_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 208: CASA_R	casa	[%r31] %asi, %r11, %r20
	setx vahole_target3, %r18, %r27
	.word 0xe19fc3e0  ! 209: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_8_155:
	nop
	ta T_CHANGE_HPRIV
	set 0xef685986, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_156:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982474  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0474, %hpstate
fpinit_8_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 212: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_tba_8_158:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_8_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4a26e2386170ad01, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d904005  ! 215: WRPR_WSTATE_R	wrpr	%r1, %r5, %wstate
	.word 0xc19fc2c0  ! 216: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_8_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffdefffff205, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_8_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_163-donret_8_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0056fc30 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x38c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2acd0001  ! 1: BRNZ	brnz,a,pt	%r20,<label_0xd0001>
	done
donretarg_8_163:
	.word 0xa9a249c4  ! 218: FDIVd	fdivd	%f40, %f4, %f20
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r17
	setx vahole_target3, %r18, %r27
	.word 0xe5e7e011  ! 221: CASA_R	casa	[%r31] %asi, %r17, %r18
ibp_8_165:
	nop
	.word 0x9f802de6  ! 222: SIR	sir	0x0de6
dvapa_8_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa8a, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0e0  ! 223: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xe44fe048  ! 224: LDSB_I	ldsb	[%r31 + 0x0048], %r18
mondo_8_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d944007  ! 225: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0xa6844013  ! 226: ADDcc_R	addcc 	%r17, %r19, %r19
	.word 0xda3fede6  ! 227: STD_I	std	%r13, [%r31 + 0x0de6]
	setx vahole_target2, %r18, %r27
	.word 0x97a4c9c1  ! 228: FDIVd	fdivd	%f50, %f32, %f42
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_170:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 229: RDPC	rd	%pc, %r11
	setx vahole_target0, %r18, %r27
	.word 0xd03fe8df  ! 230: STD_I	std	%r8, [%r31 + 0x08df]
	.word 0x91948012  ! 231: WRPR_PIL_R	wrpr	%r18, %r18, %pil
pmu_8_173:
	nop
	setx 0xfffffdaefffffb5f, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd11fc00a  ! 233: LDDF_R	ldd	[%r31, %r10], %f8
	.word 0x95698005  ! 234: SDIVX_R	sdivx	%r6, %r5, %r10
splash_cmpr_8_175:
	nop
	setx 0xac35a1dbb78a9905, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_176) + 8, 16, 16)) -> intp(7,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_176)&0xffffffff)  + 8, 16, 16)) -> intp(7,0,14)
#else
	setx 0x24c036562776db0a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_8_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe8c, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fde00  ! 237: LDDFA_R	ldda	[%r31, %r0], %f16
	setx vahole_target3, %r18, %r27
	.word 0xc1bfde00  ! 238: STDFA_R	stda	%f0, [%r0, %r31]
fpinit_8_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 239: FDIVd	fdivd	%f0, %f4, %f6
mondo_8_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c002  ! 240: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	setx vahole_target1, %r18, %r27
	.word 0xc19fdf20  ! 241: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_182) + 8, 16, 16)) -> intp(2,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_182)&0xffffffff)  + 8, 16, 16)) -> intp(2,0,8)
#else
	setx 0x588901be0ca7c680, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
intveclr_8_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0xef6c5c1701e0bd3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe5e7e00a  ! 245: CASA_R	casa	[%r31] %asi, %r10, %r18
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
    brnz %r10, sma_8_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 246: CASA_R	casa	[%r31] %asi, %r18, %r18
fpinit_8_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 247: FDIVs	fdivs	%f0, %f4, %f8
	setx vahole_target2, %r18, %r27
	.word 0xe49fc032  ! 248: LDDA_R	ldda	[%r31, %r18] 0x01, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_8_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd1134007  ! 1: LDQF_R	-	[%r13, %r7], %f8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdf20  ! 250: STDFA_R	stda	%f16, [%r0, %r31]
mondo_8_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d934012  ! 251: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	setx 0x6de58235b5d8b330, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe2bfc033  ! 253: STDA_R	stda	%r17, [%r31 + %r19] 0x01
ibp_8_193:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe040  ! 254: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xab853a8f  ! 255: WR_CLEAR_SOFTINT_I	wr	%r20, 0x1a8f, %clear_softint
splash_lsu_8_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xa1164839, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e009  ! 257: CASA_R	casa	[%r31] %asi, %r9, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_196) + 56, 16, 16)) -> intp(2,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_196)&0xffffffff)  + 56, 16, 16)) -> intp(2,0,17)
#else
	setx 0x17850954e9f807aa, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_8_197:
    nop
    rd %asi, %l3        ! save %asi
    ta T_CHANGE_HPRIV
    wr %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %asi
    mov 1, %l2
    sllx %l2, 63, %l2
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
    ta T_CHANGE_NONHPRIV
    wr %g0, %l3, %asi   !restore %asi
	.word 0xa7b5098b  ! 259: BSHUFFLE	fmovc32	%d20, %d42, %d50
	.word 0x9f802be6  ! 260: SIR	sir	0x0be6
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
    brnz %r10, sma_8_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e008  ! 261: CASA_R	casa	[%r31] %asi, %r8, %r19
splash_tba_8_199:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_8_200:
	ta T_CHANGE_NONHPRIV
	.word 0x8198280f  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
mondo_8_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d948013  ! 264: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
tagged_8_202:
	tsubcctv %r19, 0x1d1d, %r3
	.word 0xe607e146  ! 265: LDUW_I	lduw	[%r31 + 0x0146], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_8_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d924003  ! 267: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
splash_cmpr_8_204:
	nop
	setx 0x17b242cbc3e6a6a3, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_8_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x095af3d59925da24, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902172  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0172, %pstate
cwp_8_207:
    set user_data_start, %o7
	.word 0x93902003  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_208) + 48, 16, 16)) -> intp(3,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_208)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,14)
#else
	setx 0xd9fa11086022ed34, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_8_209:
	nop
	.word 0xa1b4c493  ! 273: FCMPLE32	fcmple32	%d50, %d50, %r16
mondo_8_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d948008  ! 274: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
ibp_8_211:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdb60  ! 275: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_8_212:
	nop
	ta T_CHANGE_HPRIV
	set 0x6e1fbd3a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 277: Tcc_R	te	icc_or_xcc, %r0 + %r30
trapasi_8_213:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8c84a00  ! 278: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r20
pmu_8_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff06dfffffacd, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfe0a0  ! 280: STDFA_I	stda	%f16, [0x00a0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_216) + 8, 16, 16)) -> intp(3,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_216)&0xffffffff)  + 8, 16, 16)) -> intp(3,0,13)
#else
	setx 0x896038729c15b75c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_8_217:
	nop
	ta T_CHANGE_HPRIV
	set 0xc6076d6b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c002  ! 283: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	setx vahole_target0, %r18, %r27
	.word 0xe1bfe0e0  ! 284: STDFA_I	stda	%f16, [0x00e0, %r31]
mondo_8_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944014  ! 285: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x9f802401  ! 286: SIR	sir	0x0401
donret_8_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_222-donret_8_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007da84b | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe44, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_222:
	.word 0xe86fe01a  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x001a]
jmptr_8_223:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_8_224:
	nop
	setx 0xc617ffd8c39d5c8e, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_8_225:
	nop
	setx 0x0557e3bf86981435, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_8_226:
	nop
	setx 0xfffffa5efffff2f4, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff667ffffff72, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c001  ! 293: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	.word 0x87802055  ! 294: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x97a00165  ! 295: FABSq	dis not found

donret_8_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_230-donret_8_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0029f381 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_230:
	.word 0xe66fe0f1  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x00f1]
	setx vahole_target2, %r18, %r27
	.word 0xc19fdb60  ! 297: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_232:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 298: RDPC	rd	%pc, %r20
trapasi_8_233:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 299: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
dvapa_8_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8b4, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80394d  ! 300: SIR	sir	0x194d
intveclr_8_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x52e519d3699eaa44, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94000b  ! 302: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	setx 0xf8f3420ffe8fda1c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a0016d  ! 304: FABSq	dis not found

pmu_8_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff600fffff44b, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff291ffffffe7, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_241:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc034  ! 307: STDA_R	stda	%r18, [%r31 + %r20] 0x01
splash_tba_8_242:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_8_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_243:
	.word 0x8f902000  ! 309: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 310: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_8_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcfe700a0b58aec9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xc1bfdc00  ! 312: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_8_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 313: CASA_R	casa	[%r31] %asi, %r18, %r18
dvapa_8_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbce, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1703065  ! 314: POPC_I	popc	0x1065, %r16
	.word 0x93a449a5  ! 315: FDIVs	fdivs	%f17, %f5, %f9
ibp_8_249:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9f803065  ! 316: SIR	sir	0x1065
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_250) + 40, 16, 16)) -> intp(2,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_250)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,13)
#else
	setx 0xaefd45556d7843e8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_8_251:
	nop
	.word 0x9f803065  ! 319: SIR	sir	0x1065
	setx vahole_target2, %r18, %r27
	.word 0xc1bfe000  ! 320: STDFA_I	stda	%f0, [0x0000, %r31]
	setx 0xa5ec3cd90e56f0d6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0800bc0  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
dvapa_8_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf8c, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc011  ! 323: STDF_R	std	%f8, [%r17, %r31]
	.word 0x8d802000  ! 324: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_8_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7eefb16312e1e9b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 326: CASA_R	casa	[%r31] %asi, %r11, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_257:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 327: RDPC	rd	%pc, %r17
ibp_8_258:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe080  ! 328: STDFA_I	stda	%f0, [0x0080, %r31]
fpinit_8_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 329: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx vahole_target1, %r18, %r27
	.word 0xda3ff065  ! 330: STD_I	std	%r13, [%r31 + 0xfffff065]
	.word 0xda8008a0  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x96d47ab8  ! 332: UMULcc_I	umulcc 	%r17, 0xfffffab8, %r11
ibp_8_261:
	nop
	.word 0x93b24491  ! 333: FCMPLE32	fcmple32	%d40, %d48, %r9
mondo_8_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950004  ! 334: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
mondo_8_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 335: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xa3524000  ! 336: RDPR_CWP	<illegal instruction>
pmu_8_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe61fffff43f, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_8_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9eb, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc013  ! 338: STDF_R	std	%f9, [%r19, %r31]
splash_lsu_8_267:
	nop
	ta T_CHANGE_HPRIV
	set 0x3cdaff2b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_8_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 341: Tcc_R	te	icc_or_xcc, %r0 + %r30
donret_8_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_269-donret_8_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005c3944 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe56, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	done
donretarg_8_269:
	.word 0xa9a109d1  ! 342: FDIVd	fdivd	%f4, %f48, %f20
ibp_8_270:
	nop
	.word 0xc1bfe180  ! 343: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0x9f803776  ! 344: SIR	sir	0x1776
splash_hpstate_8_271:
	.word 0x819821dc  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 346: RDPC	rd	%pc, %r20
ibp_8_273:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00a  ! 347: CASA_R	casa	[%r31] %asi, %r10, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_274) + 24, 16, 16)) -> intp(3,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_274)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,25)
#else
	setx 0xcbb4568cc2f559f9, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff07afffff64e, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_276:
	nop
	.word 0xc32fc009  ! 350: STXFSR_R	st-sfr	%f1, [%r9, %r31]
pmu_8_277:
	nop
	setx 0xfffff13ffffff7fa, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x115c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b207d3  ! 352: PDIST	pdistn	%d8, %d50, %d40
dvapa_8_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc80, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9370379a  ! 353: POPC_I	popc	0x179a, %r9
	.word 0xe71fe180  ! 354: LDDF_I	ldd	[%r31, 0x0180], %f19
pmu_8_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffefbfffffa08, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_280) + 48, 16, 16)) -> intp(6,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_280)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,9)
#else
	setx 0x22bfd1122b169e90, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e1a0  ! 357: LDUHA_I	lduha	[%r31, + 0x01a0] %asi, %r19
intveclr_8_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8fc40b06e567a690, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_8_282:
	nop
	setx 0xfffff6c4fffffc41, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0x25ff2c9b5e2eac62, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x8+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_284:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 362: RDPC	rd	%pc, %r16
	.word 0xa3450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r17
intveclr_8_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0x008d11e8a29099ad, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_8_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 365: FDIVs	fdivs	%f0, %f4, %f4
ibp_8_287:
	nop
	.word 0x95a449c8  ! 366: FDIVd	fdivd	%f48, %f8, %f10
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
    brnz %r10, sma_8_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 367: CASA_R	casa	[%r31] %asi, %r18, %r18
	.word 0x8d802004  ! 368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	setx 0x091254e8f256722d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 370: CASA_R	casa	[%r31] %asi, %r19, %r18
donret_8_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_291-donret_8_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0040c27a | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc9f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	done
donretarg_8_291:
	.word 0x99a509d0  ! 371: FDIVd	fdivd	%f20, %f16, %f12
	.word 0xab847fe1  ! 372: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1fe1, %clear_softint
	.word 0xd68008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
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
    brnz %r10, sma_8_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e012  ! 374: CASA_R	casa	[%r31] %asi, %r18, %r11
br_longdelay2_8_293:
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x97a7c9ca  ! 375: FDIVd	fdivd	%f62, %f10, %f42
dvapa_8_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa76, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc031  ! 376: LDXA_R	ldxa	[%r31, %r17] 0x01, %r11
splash_lsu_8_295:
	nop
	ta T_CHANGE_HPRIV
	set 0x7a1657d2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_8_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9cb  ! 1: FDIVd	fdivd	%f62, %f42, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803214  ! 378: SIR	sir	0x1214
	.word 0x8d802004  ! 379: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_8_297:
	nop
	setx 0x48d73dde454692a5, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_298) + 8, 16, 16)) -> intp(5,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_298)&0xffffffff)  + 8, 16, 16)) -> intp(5,0,15)
#else
	setx 0x1d0e66188bbce231, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9194400c  ! 382: WRPR_PIL_R	wrpr	%r17, %r12, %pil
splash_cmpr_8_300:
	nop
	setx 0x75cfb9cc09f35d44, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_8_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d930011  ! 385: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0xd037e182  ! 386: STH_I	sth	%r8, [%r31 + 0x0182]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x03308d535a4517da, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a0016a  ! 389: FABSq	dis not found

donret_8_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_305-donret_8_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003eea37 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x847, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	done
donretarg_8_305:
	.word 0xe8ffe16e  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x016e] %asi
	.word 0xe897e010  ! 391: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0xe8d7e150  ! 392: LDSHA_I	ldsha	[%r31, + 0x0150] %asi, %r20
pmu_8_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff357fffff584, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe1bfe040  ! 394: STDFA_I	stda	%f16, [0x0040, %r31]
trapasi_8_308:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8d04b40  ! 395: LDSHA_R	ldsha	[%r1, %r0] 0x5a, %r20
trapasi_8_309:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d04a00  ! 396: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r20
ibp_8_310:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe89fc029  ! 397: LDDA_R	ldda	[%r31, %r9] 0x01, %r20
intveclr_8_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa982c923172ba1f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_8_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_8_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff928fffff9ae, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    setx 0x0b7168470089775c, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
setup_spu_4:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %l6

    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %l5				!# then end of CWQ region to LAST
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
	setx vahole_target1, %r18, %r27
	.word 0xe497c02c  ! 1: LDUHA_R	lduha	[%r31, %r12] 0x01, %r18
jmptr_4_1:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xe1bfc2c0  ! 4: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_4_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 5: CASA_R	casa	[%r31] %asi, %r17, %r18
	setx vahole_target2, %r18, %r27
	.word 0xa9a309a9  ! 6: FDIVs	fdivs	%f12, %f9, %f20
	.word 0xe19fe1c0  ! 7: LDDFA_I	ldda	[%r31, 0x01c0], %f16
ibp_4_4:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fda00  ! 8: LDDFA_R	ldda	[%r31, %r0], %f16
iaw_4_5:
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
iaw_startwait4_5:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_5
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_5:
    brnz %r16, iaw_wait4_5
    ld [%r23], %r16
    ba iaw_startwait4_5
    mov 0x4, %r16
continue_iaw_4_5:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_5:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_5
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_5:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_5
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_5:
	mov 0x38, %r18
iaw3_4_5:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe020  ! 9: STDFA_I	stda	%f16, [0x0020, %r31]
pmu_4_6:
	nop
	setx 0xffffff90fffffaef, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_4_7:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe000  ! 11: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0x9f8036c1  ! 12: SIR	sir	0x16c1
brcommon1_4_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a489aa  ! 13: FDIVs	fdivs	%f18, %f10, %f19
	.word 0xa7540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_4_9:
	nop
	ta T_CHANGE_HPRIV
	set 0xf236ee58, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe063  ! 16: STB_I	stb	%r20, [%r31 + 0x0063]
pmu_4_10:
	nop
	setx 0xfffff676fffff63a, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80397a  ! 18: SIR	sir	0x197a
	.word 0x8d903076  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1076, %pstate
dvapa_4_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xffe, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 20: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_4_13:
	nop
	setx 0xac48165d5e75bf31, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_4_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_14-donret_4_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cd574a | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x446, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_4_14:
	.word 0x9ba0c9d4  ! 22: FDIVd	fdivd	%f34, %f20, %f44
trapasi_4_15:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
dvapa_4_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbc9, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc029  ! 24: STDA_R	stda	%r13, [%r31 + %r9] 0x01
	.word 0x8d802004  ! 25: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xdbe7c020  ! 26: CASA_I	casa	[%r31] 0x 1, %r0, %r13
splash_cmpr_4_18:
	nop
	setx 0x2e17df1330594be1, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_4_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4b72d20da624d163, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd2e73c3e91ad1616, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r13
cmp_4_22:
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
cmp_startwait4_22:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_22
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_22:
    brnz,a %r10, cmp_wait4_22
    ld [%r23], %r10
    ba cmp_startwait4_22
    mov 0x4, %r10
continue_cmp_4_22:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_22
    mov 52, %r17
    best_set_reg(0xca51726d2f7ba96c, %r16, %r17)
cmp_multi_core_4_22:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa3a00173  ! 31: FABSq	dis not found

memptr_4_23:
	set 0x60340000, %r31
	.word 0x8581f7bb  ! 32: WRCCR_I	wr	%r7, 0x17bb, %ccr
splash_tba_4_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe150  ! 34: LDX_I	ldx	[%r31 + 0x0150], %r18
	.word 0x9f803192  ! 35: SIR	sir	0x1192
mondo_4_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 36: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
donret_4_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_26-donret_4_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0046fb7b | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 23, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_26:
	.word 0xe46fe086  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x0086]
donret_4_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_27-donret_4_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d61de1 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x85c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	done
donretarg_4_27:
	.word 0xe46fe119  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x0119]
cmp_4_28:
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
cmp_startwait4_28:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_28
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_28:
    brnz,a %r10, cmp_wait4_28
    ld [%r23], %r10
    ba cmp_startwait4_28
    mov 0x4, %r10
continue_cmp_4_28:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_28
    mov 40, %r17
    best_set_reg(0x6e19ad6427e8ab6f, %r16, %r17)
cmp_multi_core_4_28:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91930011  ! 39: WRPR_PIL_R	wrpr	%r12, %r17, %pil
pmu_4_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff74dfffff480, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc32fc000  ! 41: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_tba_4_31:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0xddc19fb703e143f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e1f0  ! 44: LDUHA_I	lduha	[%r31, + 0x01f0] %asi, %r18
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 45: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9804011  ! 46: WR_SET_SOFTINT_R	wr	%r1, %r17, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_33:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 47: RDPC	rd	%pc, %r19
tagged_4_34:
	tsubcctv %r3, 0x14ed, %r17
	.word 0xe807e1cc  ! 48: LDUW_I	lduw	[%r31 + 0x01cc], %r20
splash_lsu_4_35:
	nop
	ta T_CHANGE_HPRIV
	set 0x674f8bc6, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_4_36:
	nop
	.word 0x9f803105  ! 50: SIR	sir	0x1105
cmp_4_37:
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
cmp_startwait4_37:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_37
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_37:
    brnz,a %r10, cmp_wait4_37
    ld [%r23], %r10
    ba cmp_startwait4_37
    mov 0x4, %r10
continue_cmp_4_37:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_37
    mov 0x79, %r17
    best_set_reg(0x890cce537194423a, %r16, %r17)
cmp_multi_core_4_37:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa7a00164  ! 51: FABSq	dis not found

intveclr_4_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1b3f5efce02f5ba5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d908013  ! 53: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
pmu_4_40:
	nop
	setx 0xfffffae1fffff345, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_4_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xede, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdc00  ! 55: STDFA_R	stda	%f16, [%r0, %r31]
pmu_4_42:
	nop
	setx 0xfffffba4fffff2e5, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_4_43:
	taddcctv %r18, 0x1f81, %r16
	.word 0xe807e0f4  ! 57: LDUW_I	lduw	[%r31 + 0x00f4], %r20
splash_lsu_4_44:
	nop
	ta T_CHANGE_HPRIV
	set 0x8eac52ba, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_4_45:
	nop
	mov 0x3d0, %r1 	! (VA for ASI 0x25) 
	.word 0xe8d044a0  ! 59: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r20
	.word 0xa1a2c9b2  ! 60: FDIVs	fdivs	%f11, %f18, %f16
jmptr_4_46:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd23fc000  ! 62: STD_R	std	%r9, [%r31 + %r0]
splash_cmpr_4_48:
	nop
	setx 0x99b8a69051177e29, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_4_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 65: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
donret_4_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_51-donret_4_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e73934 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x707, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_51:
	.word 0x97a4c9d1  ! 66: FDIVd	fdivd	%f50, %f48, %f42
brcommon1_4_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9a189c8  ! 67: FDIVd	fdivd	%f6, %f8, %f20
jmptr_4_53:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_4_54:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_4_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4884e40  ! 70: LDUBA_R	lduba	[%r1, %r0] 0x72, %r10
pmu_4_56:
	nop
	setx 0xfffff1b6fffffa1f, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_57-donret_4_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002046b1 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_57:
	.word 0xd4ffe054  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x0054] %asi
brcommon1_4_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a449b0  ! 73: FDIVs	fdivs	%f17, %f16, %f10
	.word 0xc1bfe020  ! 74: STDFA_I	stda	%f0, [0x0020, %r31]
dvapa_4_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd72, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc033  ! 75: LDXA_R	ldxa	[%r31, %r19] 0x01, %r16
donret_4_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_60-donret_4_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b156f4 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x95, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_60:
	.word 0xe06fe017  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x0017]
	.word 0x8d9028da  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0xe19fe1c0  ! 78: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_4_62:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	setx vahole_target3, %r18, %r27
	.word 0xe11fc00b  ! 81: LDDF_R	ldd	[%r31, %r11], %f16
	.word 0x24ca4001  ! 82: BRLEZ	brlez,a,pt	%r9,<label_0xa4001>
	.word 0x87802014  ! 83: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe6dfe060  ! 84: LDXA_I	ldxa	[%r31, + 0x0060] %asi, %r19
splash_lsu_4_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xbdedf1d6, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208a  ! 86: WRASI_I	wr	%r0, 0x008a, %asi
pmu_4_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb08fffffa38, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9685c30746876693, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 89: RDPC	rd	%pc, %r18
brcommon3_4_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe497c028  ! 90: LDUHA_R	lduha	[%r31, %r8] 0x01, %r18
pmu_4_70:
	nop
	setx 0xfffff25cfffff3fe, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_4_71:
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
cmp_startwait4_71:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_71
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_71:
    brnz,a %r10, cmp_wait4_71
    ld [%r23], %r10
    ba cmp_startwait4_71
    mov 0x4, %r10
continue_cmp_4_71:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_71
    mov 0x7a, %r17
    best_set_reg(0xf1a17ba2cbfa2296, %r16, %r17)
cmp_multi_core_4_71:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908010  ! 92: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_4_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d91800c  ! 94: WRPR_WSTATE_R	wrpr	%r6, %r12, %wstate
    set 0xba8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b487cb  ! 95: PDIST	pdistn	%d18, %d42, %d20
	setx vahole_target2, %r18, %r27
	.word 0x9bb447ca  ! 96: PDIST	pdistn	%d48, %d10, %d44
splash_tba_4_74:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_4_75:
    set user_data_start, %o7
	.word 0x93902004  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1a2cd30  ! 99: FsMULd	fsmuld	%f11, %f16, %f16
dvapa_4_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8d8, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd83fffca  ! 100: STD_I	std	%r12, [%r31 + 0xffffffca]
	.word 0xd847e088  ! 101: LDSW_I	ldsw	[%r31 + 0x0088], %r12
mondo_4_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d950001  ! 102: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0x99540000  ! 103: RDPR_GL	<illegal instruction>
cmp_4_78:
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
cmp_startwait4_78:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_78
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_78:
    brnz,a %r10, cmp_wait4_78
    ld [%r23], %r10
    ba cmp_startwait4_78
    mov 0x4, %r10
continue_cmp_4_78:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_78
    mov 0xcf, %r17
    best_set_reg(0xf85e8804403391a2, %r16, %r17)
cmp_multi_core_4_78:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x93a0016a  ! 104: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_4_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92800a  ! 106: WRPR_WSTATE_R	wrpr	%r10, %r10, %wstate
	setx 0x05fffc650aa904a0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe140  ! 108: STDFA_I	stda	%f16, [0x0140, %r31]
splash_cmpr_4_82:
	nop
	setx 0x24e3fb5dbf7673fa, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_4_83:
	nop
	setx 0xfffff3bbfffff6bc, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7842e43  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x0e43, %-
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
    brnz %r10, sma_4_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 112: CASA_R	casa	[%r31] %asi, %r13, %r20
fpinit_4_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83f42  ! 113: PREFETCHA_I	prefetcha	[%r0, + 0xffffff42] %asi, #one_read
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 114: RDPC	rd	%pc, %r19
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 115: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0xa980c004  ! 116: WR_SET_SOFTINT_R	wr	%r3, %r4, %set_softint
	setx vahole_target2, %r18, %r27
	.word 0x97b44483  ! 117: FCMPLE32	fcmple32	%d48, %d34, %r11
	setx vahole_target1, %r18, %r27
	.word 0xe1bfd920  ! 118: STDFA_R	stda	%f16, [%r0, %r31]
cmp_4_90:
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
cmp_startwait4_90:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_90
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_90:
    brnz,a %r10, cmp_wait4_90
    ld [%r23], %r10
    ba cmp_startwait4_90
    mov 0x4, %r10
continue_cmp_4_90:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_90
    mov 0x4f, %r17
    best_set_reg(0x1e2de543d6ac39c9, %r16, %r17)
cmp_multi_core_4_90:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9190c001  ! 119: WRPR_PIL_R	wrpr	%r3, %r1, %pil
	.word 0x87802082  ! 120: WRASI_I	wr	%r0, 0x0082, %asi
pmu_4_91:
	nop
	setx 0xfffff2d6fffff468, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd6800c80  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r11
intveclr_4_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0xebbadff6e57364cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target0, %r18, %r27
	.word 0xe1bfe0a0  ! 124: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xd69fe0e8  ! 125: LDDA_I	ldda	[%r31, + 0x00e8] %asi, %r11
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
    bne,a wait_for_stat_4_94
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_94:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_94
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_94:
	mov 0x38, %r18
iaw3_4_94:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 126: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_4_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d6b  ! 127: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd6b] %asi, #one_read
	.word 0xd6800a80  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_96:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 129: RDPC	rd	%pc, %r19
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_4_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc99fffff290, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_4_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_4_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 134: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
jmptr_4_100:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc30fc000  ! 136: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
cmp_4_102:
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
cmp_startwait4_102:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_102
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_102:
    brnz,a %r10, cmp_wait4_102
    ld [%r23], %r10
    ba cmp_startwait4_102
    mov 0x4, %r10
continue_cmp_4_102:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_102
    mov 35, %r17
    best_set_reg(0xab6e3784b3b0c2e9, %r16, %r17)
cmp_multi_core_4_102:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x99a00169  ! 137: FABSq	dis not found

	.word 0x91d020b5  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd8cfe0b0  ! 139: LDSBA_I	ldsba	[%r31, + 0x00b0] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 140: RDPC	rd	%pc, %r17
	.word 0x8d902d0c  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x0d0c, %pstate
donret_4_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_105-donret_4_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a56a8b | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x797, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_105:
	.word 0xe66fe123  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x0123]
fpinit_4_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 143: FCMPLE32	fcmple32	%d0, %d4, %r6
donret_4_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_107-donret_4_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b8c2f4 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_107:
	.word 0xa1a0c9c2  ! 144: FDIVd	fdivd	%f34, %f2, %f16
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
    brnz %r10, sma_4_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e014  ! 145: CASA_R	casa	[%r31] %asi, %r20, %r10
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 146: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_4_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_4_110:
	nop
	.word 0xc1bfe120  ! 148: STDFA_I	stda	%f0, [0x0120, %r31]
mondo_4_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d924003  ! 149: WRPR_WSTATE_R	wrpr	%r9, %r3, %wstate
	.word 0x8d802000  ! 150: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d903a95  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x1a95, %pstate
	.word 0xc36fe0e0  ! 152: PREFETCH_I	prefetch	[%r31 + 0x00e0], #one_read
splash_hpstate_4_114:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8198245f  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
cwp_4_115:
    set user_data_start, %o7
	.word 0x93902007  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x94dc8013  ! 155: SMULcc_R	smulcc 	%r18, %r19, %r10
cmp_4_116:
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
cmp_startwait4_116:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_116
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_116:
    brnz,a %r10, cmp_wait4_116
    ld [%r23], %r10
    ba cmp_startwait4_116
    mov 0x4, %r10
continue_cmp_4_116:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_116
    mov 0x9f, %r17
    best_set_reg(0x5585cc0aff207fe3, %r16, %r17)
cmp_multi_core_4_116:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91948012  ! 156: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	setx vahole_target0, %r18, %r27
	.word 0xc1bfe1a0  ! 157: STDFA_I	stda	%f0, [0x01a0, %r31]
	setx vahole_target3, %r18, %r27
	.word 0xc1bfe160  ! 158: STDFA_I	stda	%f0, [0x0160, %r31]
iaw_4_119:
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
iaw_startwait4_119:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_119
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_119:
    brnz %r16, iaw_wait4_119
    ld [%r23], %r16
    ba iaw_startwait4_119
    mov 0x4, %r16
continue_iaw_4_119:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_119:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_119
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_119:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_119
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_119:
	mov 0x38, %r18
iaw4_4_119:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a4c9b4  ! 159: FDIVs	fdivs	%f19, %f20, %f16
ibp_4_120:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe097c031  ! 160: LDUHA_R	lduha	[%r31, %r17] 0x01, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_121:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 161: RDPC	rd	%pc, %r11
cmp_4_122:
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
cmp_startwait4_122:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_122
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_122:
    brnz,a %r10, cmp_wait4_122
    ld [%r23], %r10
    ba cmp_startwait4_122
    mov 0x4, %r10
continue_cmp_4_122:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_122
    mov 0x80, %r17
    best_set_reg(0xc248c4cc98ae5134, %r16, %r17)
cmp_multi_core_4_122:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a00170  ! 162: FABSq	dis not found

	.word 0xe19fe0c0  ! 163: LDDFA_I	ldda	[%r31, 0x00c0], %f16
mondo_4_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d934013  ! 164: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
splash_tba_4_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx vahole_target1, %r18, %r27
	.word 0xe19fdb60  ! 166: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_4_126:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2c04b60  ! 167: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r9
ibp_4_127:
	nop
	.word 0xd2bfc02a  ! 168: STDA_R	stda	%r9, [%r31 + %r10] 0x01
donret_4_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_128-donret_4_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0064ae8a | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3cf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_128:
	.word 0xd2ffe1fc  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x01fc] %asi
jmptr_4_129:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_4_130:
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
iaw_startwait4_130:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_130
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_130:
    brnz %r16, iaw_wait4_130
    ld [%r23], %r16
    ba iaw_startwait4_130
    mov 0x4, %r16
continue_iaw_4_130:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_130:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_130
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_130:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_130
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_130:
	mov 0x38, %r18
iaw1_4_130:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00c  ! 171: STXFSR_R	st-sfr	%f1, [%r12, %r31]
	setx vahole_target3, %r18, %r27
	.word 0xa3a449d1  ! 172: FDIVd	fdivd	%f48, %f48, %f48
	.word 0xe727e1c8  ! 173: STF_I	st	%f19, [0x01c8, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_132:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 174: RDPC	rd	%pc, %r9
	.word 0x87802083  ! 175: WRASI_I	wr	%r0, 0x0083, %asi
donret_4_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_133-donret_4_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00101e21 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_133:
	.word 0xa7a4c9d2  ! 176: FDIVd	fdivd	%f50, %f18, %f50
	.word 0xa7500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_4_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f26, %f2
	.word 0x9bb4c309  ! 178: ALIGNADDRESS	alignaddr	%r19, %r9, %r13
	setx 0xb24514680ec153dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36fe0b4  ! 180: PREFETCH_I	prefetch	[%r31 + 0x00b4], #one_read
	.word 0xa5500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xda800c00  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_4_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4f60545a14ec2651, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
dvapa_4_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd31, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc009  ! 186: STXFSR_R	st-sfr	%f1, [%r9, %r31]
donret_4_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_139-donret_4_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fcebab | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x645, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_139:
	.word 0xdaffe020  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x0020] %asi
	.word 0x9f803d21  ! 188: SIR	sir	0x1d21
memptr_4_141:
	set user_data_start, %r31
	.word 0x8580ae7d  ! 189: WRCCR_I	wr	%r2, 0x0e7d, %ccr
dvapa_4_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeb2, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a449d4  ! 190: FDIVd	fdivd	%f48, %f20, %f48
dvapa_4_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd04, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc00b  ! 191: STDF_R	std	%f19, [%r11, %r31]
fpinit_4_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 192: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xa66ac002  ! 193: UDIVX_R	udivx 	%r11, %r2, %r19
donret_4_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_145-donret_4_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ad7905 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc1e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_4_145:
	.word 0xe6ffe010  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x0010] %asi
cmp_4_146:
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
cmp_startwait4_146:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_146
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_146:
    brnz,a %r10, cmp_wait4_146
    ld [%r23], %r10
    ba cmp_startwait4_146
    mov 0x4, %r10
continue_cmp_4_146:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_146
    mov 0x90, %r17
    best_set_reg(0xcc0805518aef2600, %r16, %r17)
cmp_multi_core_4_146:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9190400c  ! 195: WRPR_PIL_R	wrpr	%r1, %r12, %pil
cmp_4_147:
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
cmp_startwait4_147:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_147
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_147:
    brnz,a %r10, cmp_wait4_147
    ld [%r23], %r10
    ba cmp_startwait4_147
    mov 0x4, %r10
continue_cmp_4_147:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_147
    mov 22, %r17
    best_set_reg(0x388131eac9052441, %r16, %r17)
cmp_multi_core_4_147:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91948013  ! 196: WRPR_PIL_R	wrpr	%r18, %r19, %pil
iaw_4_148:
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
iaw_startwait4_148:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_148
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_148:
    brnz %r16, iaw_wait4_148
    ld [%r23], %r16
    ba iaw_startwait4_148
    mov 0x4, %r16
continue_iaw_4_148:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_148:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_148
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_148:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_148
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_148:
	mov 0x38, %r18
iaw2_4_148:
	rdpr %tba, %r19
	mov 0x320,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87a88a4d  ! 197: FCMPd	fcmpd	%fcc<n>, %f2, %f44
	.word 0x9f803fbb  ! 198: SIR	sir	0x1fbb
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802058  ! 200: WRASI_I	wr	%r0, 0x0058, %asi
splash_hpstate_4_149:
	ta T_CHANGE_NONHPRIV
	.word 0x819824df  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04df, %hpstate
	.word 0xe697e0e0  ! 202: LDUHA_I	lduha	[%r31, + 0x00e0] %asi, %r19
dvapa_4_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfa5, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe63fede6  ! 203: STD_I	std	%r19, [%r31 + 0x0de6]
	.word 0xa7830012  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r18, %-
brcommon2_4_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7b7c70d  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f13, %d50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdc00  ! 205: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x99454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xe897e138  ! 207: LDUHA_I	lduha	[%r31, + 0x0138] %asi, %r20
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
    brnz %r10, sma_4_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 208: CASA_R	casa	[%r31] %asi, %r18, %r20
	setx vahole_target3, %r18, %r27
	.word 0xe1bfe020  ! 209: STDFA_I	stda	%f16, [0x0020, %r31]
splash_lsu_4_155:
	nop
	ta T_CHANGE_HPRIV
	set 0xf905f5dc, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_156:
	.word 0x24ca4001  ! 1: BRLEZ	brlez,a,pt	%r9,<label_0xa4001>
	.word 0x819821ef  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ef, %hpstate
fpinit_4_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82de6  ! 212: PREFETCHA_I	prefetcha	[%r0, + 0x0de6] %asi, #one_read
splash_tba_4_158:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb7c661ecfeaca0a7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d950001  ! 215: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
iaw_4_161:
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
iaw_startwait4_161:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_161
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_161:
    brnz %r16, iaw_wait4_161
    ld [%r23], %r16
    ba iaw_startwait4_161
    mov 0x4, %r16
continue_iaw_4_161:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_161:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_161
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_161:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_161
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_161:
	mov 0x38, %r18
iaw1_4_161:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc3e0  ! 216: STDFA_R	stda	%f0, [%r0, %r31]
pmu_4_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeccfffff9e2, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_163-donret_4_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000c6a68 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbc6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_4_163:
	.word 0x9ba189c8  ! 218: FDIVd	fdivd	%f6, %f8, %f44
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r19
	setx vahole_target3, %r18, %r27
	.word 0xc32fc00a  ! 221: STXFSR_R	st-sfr	%f1, [%r10, %r31]
ibp_4_165:
	nop
	.word 0xc32fc00a  ! 222: STXFSR_R	st-sfr	%f1, [%r10, %r31]
dvapa_4_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd2a, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdf20  ! 223: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe44fe000  ! 224: LDSB_I	ldsb	[%r31 + 0x0000], %r18
mondo_4_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d914009  ! 225: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
	.word 0x94850014  ! 226: ADDcc_R	addcc 	%r20, %r20, %r10
iaw_4_168:
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
iaw_startwait4_168:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_168
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_168:
    brnz %r16, iaw_wait4_168
    ld [%r23], %r16
    ba iaw_startwait4_168
    mov 0x4, %r16
continue_iaw_4_168:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_168:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_168
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_168:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_168
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_168:
	mov 0x38, %r18
iaw0_4_168:
	rd %pc, %r19
	add %r19, (16+1), %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc02d  ! 227: STDA_R	stda	%r13, [%r31 + %r13] 0x01
	setx vahole_target2, %r18, %r27
	.word 0xa17028df  ! 228: POPC_I	popc	0x08df, %r16
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_170:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 229: RDPC	rd	%pc, %r10
	setx vahole_target0, %r18, %r27
	.word 0xd03fe8df  ! 230: STD_I	std	%r8, [%r31 + 0x08df]
cmp_4_172:
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
cmp_startwait4_172:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_172
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_172:
    brnz,a %r10, cmp_wait4_172
    ld [%r23], %r10
    ba cmp_startwait4_172
    mov 0x4, %r10
continue_cmp_4_172:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_172
    mov 0xc6, %r17
    best_set_reg(0xd461a59b9cb3e762, %r16, %r17)
cmp_multi_core_4_172:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91930012  ! 231: WRPR_PIL_R	wrpr	%r12, %r18, %pil
pmu_4_173:
	nop
	setx 0xfffffee2fffff907, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
iaw_4_174:
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
iaw_startwait4_174:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_174
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_174:
    brnz %r16, iaw_wait4_174
    ld [%r23], %r16
    ba iaw_startwait4_174
    mov 0x4, %r16
continue_iaw_4_174:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_174:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_174
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_174:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_174
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_174:
	mov 0x38, %r18
iaw3_4_174:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd097c029  ! 233: LDUHA_R	lduha	[%r31, %r9] 0x01, %r8
	.word 0xa16c8010  ! 234: SDIVX_R	sdivx	%r18, %r16, %r16
splash_cmpr_4_175:
	nop
	setx 0x908c5fd0444df8f8, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_176) + 16, 16, 16)) -> intp(4,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_176)&0xffffffff)  + 16, 16, 16)) -> intp(4,0,7)
#else
	setx 0x18fe9551b90ff81f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_4_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf3b, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe000  ! 237: STDFA_I	stda	%f0, [0x0000, %r31]
	setx vahole_target3, %r18, %r27
	.word 0xc1bfd920  ! 238: STDFA_R	stda	%f0, [%r0, %r31]
fpinit_4_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 239: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_4_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d914005  ! 240: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
	setx vahole_target1, %r18, %r27
	.word 0xc19fdf20  ! 241: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_182) + 32, 16, 16)) -> intp(2,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_182)&0xffffffff)  + 32, 16, 16)) -> intp(2,0,21)
#else
	setx 0xb7e3429c6e25c964, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
intveclr_4_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf7b15643b8acdf9e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe43fe8df  ! 245: STD_I	std	%r18, [%r31 + 0x08df]
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
    brnz %r10, sma_4_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 246: CASA_R	casa	[%r31] %asi, %r12, %r18
fpinit_4_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 247: FDIVs	fdivs	%f0, %f4, %f8
	setx vahole_target2, %r18, %r27
	.word 0xe49fc02a  ! 248: LDDA_R	ldda	[%r31, %r10] 0x01, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_4_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a7c9d1  ! 1: FDIVd	fdivd	%f62, %f48, %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfda00  ! 250: STDFA_R	stda	%f0, [%r0, %r31]
mondo_4_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d92000b  ! 251: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	setx 0x67d6624c9950cc8d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xe33fc00a  ! 253: STDF_R	std	%f17, [%r10, %r31]
ibp_4_193:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd920  ! 254: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xab81f929  ! 255: WR_CLEAR_SOFTINT_I	wr	%r7, 0x1929, %clear_softint
splash_lsu_4_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xfd126a9e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 257: CASA_R	casa	[%r31] %asi, %r19, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_196) + 16, 16, 16)) -> intp(1,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_196)&0xffffffff)  + 16, 16, 16)) -> intp(1,0,6)
#else
	setx 0x567080e2941a9336, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5b5098d  ! 259: BSHUFFLE	fmovc32	%d20, %d44, %d18
	.word 0x9f803372  ! 260: SIR	sir	0x1372
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
    brnz %r10, sma_4_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 261: CASA_R	casa	[%r31] %asi, %r17, %r19
splash_tba_4_199:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_4_200:
	ta T_CHANGE_NONHPRIV
	.word 0x81982515  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0515, %hpstate
mondo_4_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d93000d  ! 264: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
tagged_4_202:
	tsubcctv %r17, 0x110b, %r10
	.word 0xe607e01c  ! 265: LDUW_I	lduw	[%r31 + 0x001c], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_4_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d908013  ! 267: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
splash_cmpr_4_204:
	nop
	setx 0xb37b8523a7cbacfe, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_4_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x61aa35b311422547, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902689  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
cwp_4_207:
    set user_data_start, %o7
	.word 0x93902000  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_208) + 40, 16, 16)) -> intp(2,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_208)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,16)
#else
	setx 0x9b6389eb6170a752, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_4_209:
	nop
	.word 0x9ba509c5  ! 273: FDIVd	fdivd	%f20, %f36, %f44
mondo_4_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d928004  ! 274: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
ibp_4_211:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfda00  ! 275: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_4_212:
	nop
	ta T_CHANGE_HPRIV
	set 0x54cc255c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 277: Tcc_R	ta	icc_or_xcc, %r0 + %r30
trapasi_4_213:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8884a00  ! 278: LDUBA_R	lduba	[%r1, %r0] 0x50, %r20
pmu_4_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8dffffffe2b, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
iaw_4_215:
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
iaw_startwait4_215:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_215
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_215:
    brnz %r16, iaw_wait4_215
    ld [%r23], %r16
    ba iaw_startwait4_215
    mov 0x4, %r16
continue_iaw_4_215:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_215:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_215
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_215:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_215
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_215:
	mov 0x38, %r18
iaw3_4_215:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 280: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_216) + 32, 16, 16)) -> intp(4,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_216)&0xffffffff)  + 32, 16, 16)) -> intp(4,0,13)
#else
	setx 0x23b5648afb1111d1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_217:
	nop
	ta T_CHANGE_HPRIV
	set 0xba702a4c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d948002  ! 283: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	setx vahole_target0, %r18, %r27
	.word 0xc1bfdf20  ! 284: STDFA_R	stda	%f0, [%r0, %r31]
mondo_4_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 285: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	.word 0x9f803262  ! 286: SIR	sir	0x1262
donret_4_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_222-donret_4_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005a9101 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x507, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_222:
	.word 0xe86fe140  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x0140]
jmptr_4_223:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_4_224:
	nop
	setx 0xbc0af9c137e84021, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_4_225:
	nop
	setx 0x244186072a12e8c7, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_4_226:
	nop
	setx 0xffffff46fffffcc4, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff64dfffffc43, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 293: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0x87802014  ! 294: WRASI_I	wr	%r0, 0x0014, %asi
cmp_4_229:
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
cmp_startwait4_229:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_229
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_229:
    brnz,a %r10, cmp_wait4_229
    ld [%r23], %r10
    ba cmp_startwait4_229
    mov 0x4, %r10
continue_cmp_4_229:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_229
    mov 0xeb, %r17
    best_set_reg(0xc737a944cfdcfcb5, %r16, %r17)
cmp_multi_core_4_229:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00169  ! 295: FABSq	dis not found

donret_4_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_230-donret_4_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006f845b | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x44d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	retry
donretarg_4_230:
	.word 0xe66fe1b9  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x01b9]
	setx vahole_target2, %r18, %r27
	.word 0xc19fde00  ! 297: LDDFA_R	ldda	[%r31, %r0], %f0
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_232:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 298: RDPC	rd	%pc, %r13
trapasi_4_233:
	nop
	mov 0x3d8, %r1 	! (VA for ASI 0x25) 
	.word 0xda8844a0  ! 299: LDUBA_R	lduba	[%r1, %r0] 0x25, %r13
dvapa_4_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0x869, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a189c8  ! 300: FDIVd	fdivd	%f6, %f8, %f48
intveclr_4_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x08c00246f0938b5c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d934005  ! 302: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
	setx 0x014dae02e40eb315, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_4_238:
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
cmp_startwait4_238:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_238
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_238:
    brnz,a %r10, cmp_wait4_238
    ld [%r23], %r10
    ba cmp_startwait4_238
    mov 0x4, %r10
continue_cmp_4_238:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_238
    mov 0xd1, %r17
    best_set_reg(0x3bf199c1fffc5210, %r16, %r17)
cmp_multi_core_4_238:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9ba00162  ! 304: FABSq	dis not found

pmu_4_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd22fffff85d, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd83fffffa08, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_4_241:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe497c033  ! 307: LDUHA_R	lduha	[%r31, %r19] 0x01, %r18
splash_tba_4_242:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_4_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_243:
	.word 0x8f902002  ! 309: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 310: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_4_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0xeee00aa1b4912ae9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xc1bfc3e0  ! 312: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_4_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 313: CASA_R	casa	[%r31] %asi, %r13, %r18
dvapa_4_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc21, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5a309b0  ! 314: FDIVs	fdivs	%f12, %f16, %f18
	.word 0x87a9ca54  ! 315: FCMPd	fcmpd	%fcc<n>, %f38, %f20
ibp_4_249:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd03ff065  ! 316: STD_I	std	%r8, [%r31 + 0xfffff065]
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_250) + 48, 16, 16)) -> intp(7,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_250)&0xffffffff)  + 48, 16, 16)) -> intp(7,0,6)
#else
	setx 0xb16a7430ff1877c7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_4_251:
	nop
	.word 0xd0bfc028  ! 319: STDA_R	stda	%r8, [%r31 + %r8] 0x01
	setx vahole_target2, %r18, %r27
	.word 0xc1bfe0a0  ! 320: STDFA_I	stda	%f0, [0x00a0, %r31]
	setx 0x2d8c747106718213, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
dvapa_4_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0x80f, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd03ff065  ! 323: STD_I	std	%r8, [%r31 + 0xfffff065]
	.word 0x8d802000  ! 324: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_4_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe0c4d8095e130f3e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 326: CASA_R	casa	[%r31] %asi, %r16, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_257:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 327: RDPC	rd	%pc, %r11
ibp_4_258:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe020  ! 328: STDFA_I	stda	%f0, [0x0020, %r31]
fpinit_4_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 329: FCMPLE32	fcmple32	%d0, %d4, %r6
	setx vahole_target1, %r18, %r27
	.word 0xdb1fc010  ! 330: LDDF_R	ldd	[%r31, %r16], %f13
	.word 0xda8008a0  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x96d27170  ! 332: UMULcc_I	umulcc 	%r9, 0xfffff170, %r11
ibp_4_261:
	nop
	.word 0x87a8ca50  ! 333: FCMPd	fcmpd	%fcc<n>, %f34, %f16
mondo_4_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d918011  ! 334: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
mondo_4_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 335: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
cerer_4_264:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x8e534e9fd1d052eb, %r16, %r17)
    sethi %hi(0x20008000), %r16   ! Set ITTM/DTTM
    sllx %r16, 32, %r16
    or %r16, %r17, %r17
    mov 0x10, %r16
    stxa %r17, [%r16]0x4c
	.word 0x91524000  ! 336: RDPR_CWP	<illegal instruction>
pmu_4_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff951fffff04f, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_4_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa1c, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r9
splash_lsu_4_267:
	nop
	ta T_CHANGE_HPRIV
	set 0x43ef3e8f, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_4_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_4_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_269-donret_4_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002c7ffe | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb0e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_269:
	.word 0xa5a4c9c8  ! 342: FDIVd	fdivd	%f50, %f8, %f18
ibp_4_270:
	nop
	.word 0xc19fda00  ! 343: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f80246b  ! 344: SIR	sir	0x046b
splash_hpstate_4_271:
	.word 0x81982e47  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_272:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 346: RDPC	rd	%pc, %r8
ibp_4_273:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 347: CASA_R	casa	[%r31] %asi, %r8, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_274) + 24, 16, 16)) -> intp(5,0,2)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_274)&0xffffffff)  + 24, 16, 16)) -> intp(5,0,2)
#else
	setx 0x7b8aa93c2571c083, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbbbfffff829, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_4_276:
	nop
	.word 0x9f802a91  ! 350: SIR	sir	0x0a91
pmu_4_277:
	nop
	setx 0xfffff3c4fffffb4c, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x1285, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b187d0  ! 352: PDIST	pdistn	%d6, %d16, %d16
dvapa_4_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc11, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a409b0  ! 353: FDIVs	fdivs	%f16, %f16, %f17
	.word 0xe71fe100  ! 354: LDDF_I	ldd	[%r31, 0x0100], %f19
pmu_4_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa77fffff65a, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_280) + 24, 16, 16)) -> intp(6,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_280)&0xffffffff)  + 24, 16, 16)) -> intp(6,0,23)
#else
	setx 0xc000718fb9b9f497, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e198  ! 357: LDUHA_I	lduha	[%r31, + 0x0198] %asi, %r19
intveclr_4_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0x36148e6b01ceabdc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_4_282:
	nop
	setx 0xfffffbf8fffff9f8, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa1a111ac77cc6147, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x4+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_284:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 362: RDPC	rd	%pc, %r16
	.word 0x9b450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r13
intveclr_4_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0x40f6a921ef7afe12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_4_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 365: FDIVs	fdivs	%f0, %f4, %f6
ibp_4_287:
	nop
	.word 0xc3ed0025  ! 366: PREFETCHA_R	prefetcha	[%r20, %r5] 0x01, #one_read
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
    brnz %r10, sma_4_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 367: CASA_R	casa	[%r31] %asi, %r20, %r18
	.word 0x8d802000  ! 368: WRFPRS_I	wr	%r0, 0x0000, %fprs
	setx 0x9137a4ebafda787c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 370: CASA_R	casa	[%r31] %asi, %r20, %r18
donret_4_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_291-donret_4_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0062ff43 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_4_291:
	.word 0x91a209d3  ! 371: FDIVd	fdivd	%f8, %f50, %f8
	.word 0xab842a5a  ! 372: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0a5a, %clear_softint
	.word 0xd6800be0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r11
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
    brnz %r10, sma_4_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00a  ! 374: CASA_R	casa	[%r31] %asi, %r10, %r11
br_longdelay2_4_293:
	.word 0x2aca0001  ! 1: BRNZ	brnz,a,pt	%r8,<label_0xa0001>
	.word 0xc36ff2e3  ! 375: PREFETCH_I	prefetch	[%r31 + 0xfffff2e3], #one_read
dvapa_4_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa7c, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc00b  ! 376: LDDF_R	ldd	[%r31, %r11], %f11
splash_lsu_4_295:
	nop
	ta T_CHANGE_HPRIV
	set 0xb4a5fae5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_4_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9cb  ! 1: FDIVd	fdivd	%f62, %f42, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9170311f  ! 378: POPC_I	popc	0x111f, %r8
	.word 0x8d802004  ! 379: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_4_297:
	nop
	setx 0xadba537871e52668, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_298) + 0, 16, 16)) -> intp(0,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_298)&0xffffffff)  + 0, 16, 16)) -> intp(0,0,26)
#else
	setx 0x53d0e6b08de532c7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_4_299:
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
cmp_startwait4_299:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_299
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_299:
    brnz,a %r10, cmp_wait4_299
    ld [%r23], %r10
    ba cmp_startwait4_299
    mov 0x4, %r10
continue_cmp_4_299:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_299
    mov 0x65, %r17
    best_set_reg(0x7265519d48830e5b, %r16, %r17)
cmp_multi_core_4_299:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9194c014  ! 382: WRPR_PIL_R	wrpr	%r19, %r20, %pil
splash_cmpr_4_300:
	nop
	setx 0xdb906bd3dcd0de16, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_4_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d930007  ! 385: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
	.word 0xd037e087  ! 386: STH_I	sth	%r8, [%r31 + 0x0087]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x0eee5ccee19f7d71, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_4_304:
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
cmp_startwait4_304:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_304
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_304:
    brnz,a %r10, cmp_wait4_304
    ld [%r23], %r10
    ba cmp_startwait4_304
    mov 0x4, %r10
continue_cmp_4_304:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_304
    mov 0xb4, %r17
    best_set_reg(0x2279c6e22161ce73, %r16, %r17)
cmp_multi_core_4_304:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91a00170  ! 389: FABSq	dis not found

donret_4_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_305-donret_4_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d7bb70 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x505, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_305:
	.word 0xe8ffe008  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0008] %asi
	.word 0xe897e080  ! 391: LDUHA_I	lduha	[%r31, + 0x0080] %asi, %r20
	.word 0xe8d7e1d0  ! 392: LDSHA_I	ldsha	[%r31, + 0x01d0] %asi, %r20
pmu_4_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff478fffff4fe, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe1bfe0a0  ! 394: STDFA_I	stda	%f16, [0x00a0, %r31]
trapasi_4_308:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8c04b40  ! 395: LDSWA_R	ldswa	[%r1, %r0] 0x5a, %r20
trapasi_4_309:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8904a00  ! 396: LDUHA_R	lduha	[%r1, %r0] 0x50, %r20
ibp_4_310:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe89fc02c  ! 397: LDDA_R	ldda	[%r31, %r12] 0x01, %r20
intveclr_4_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd3287d679fb0c350, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_4_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_4_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff339fffffcad, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmpenall_4_314:
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
cmpenall_startwait4_314:
    mov 0x4, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_4_314
    nop
cmpenall_wait4_314:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait4_314
    nop
    ba,a cmpenall_startwait4_314
continue_cmpenall_4_314:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_4_314:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_4_314
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_4_314:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_4_314
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
vahole_2_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc011  ! 1: STXFSR_R	st-sfr	%f1, [%r17, %r31]
jmptr_2_1:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xc1bfd920  ! 4: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_2_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 5: CASA_R	casa	[%r31] %asi, %r9, %r18
vahole_2_3:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa7b447d3  ! 6: PDIST	pdistn	%d48, %d50, %d50
	.word 0xc19fe120  ! 7: LDDFA_I	ldda	[%r31, 0x0120], %f0
ibp_2_4:
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
ibp_startwait2_4:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_4
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_4:
    brnz %r16, ibp_wait2_4
    ld [%r23], %r16
    ba ibp_startwait2_4
    mov 0x2, %r16
continue_ibp_2_4:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_4:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_4
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_4:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_4
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_4:
    best_set_reg(0x0000005016c00c94,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 8: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe1bfe1e0  ! 9: STDFA_I	stda	%f16, [0x01e0, %r31]
pmu_2_6:
	nop
	setx 0xfffff2d9ffffffdf, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_7:
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
ibp_startwait2_7:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_7
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_7:
    brnz %r16, ibp_wait2_7
    ld [%r23], %r16
    ba ibp_startwait2_7
    mov 0x2, %r16
continue_ibp_2_7:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_7:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_7
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_7:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_7
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_7:
    best_set_reg(0x00000050dfcc943b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1e0  ! 11: STDFA_I	stda	%f16, [0x01e0, %r31]
	.word 0x9f8027f7  ! 12: SIR	sir	0x07f7
brcommon1_2_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9ba509b1  ! 13: FDIVs	fdivs	%f20, %f17, %f13
	.word 0xa1540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_2_9:
	nop
	ta T_CHANGE_HPRIV
	set 0x03966933, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe13d  ! 16: STB_I	stb	%r20, [%r31 + 0x013d]
pmu_2_10:
	nop
	setx 0xfffffe25fffffabd, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80342c  ! 18: SIR	sir	0x142c
	.word 0x8d903800  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x1800, %pstate
dvapa_2_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xea5, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd960  ! 20: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_2_13:
	nop
	setx 0x194ffaeb1e1587bf, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_2_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_14-donret_2_14-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0054f59c | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x306, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	retry
donretarg_2_14:
	.word 0x99a189d4  ! 22: FDIVd	fdivd	%f6, %f20, %f12
trapasi_2_15:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xdad84a00  ! 23: LDXA_R	ldxa	[%r1, %r0] 0x50, %r13
dvapa_2_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0xebc, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc014  ! 24: STDF_R	std	%f13, [%r20, %r31]
	.word 0x8d802004  ! 25: WRFPRS_I	wr	%r0, 0x0004, %fprs
	brlez,pt  	%r18, skip_2_17
	fbul,a,pn	%fcc0,  skip_2_17
.align 512
skip_2_17:
	.word 0xc36fe1f3  ! 26: PREFETCH_I	prefetch	[%r31 + 0x01f3], #one_read
splash_cmpr_2_18:
	nop
	setx 0x22df0ab1eb266f7c, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_2_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0x73d80c63c1ab2b9a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe33d40e081d11e39, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00d  ! 30: CASA_R	casa	[%r31] %asi, %r13, %r13
	.word 0xa3a00174  ! 31: FABSq	dis not found

memptr_2_23:
	set 0x60740000, %r31
	.word 0x85852d28  ! 32: WRCCR_I	wr	%r20, 0x0d28, %ccr
splash_tba_2_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe0b0  ! 34: LDX_I	ldx	[%r31 + 0x00b0], %r18
	.word 0x9f802891  ! 35: SIR	sir	0x0891
mondo_2_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d93000a  ! 36: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
donret_2_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_26-donret_2_26-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009be317 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x585, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_26:
	.word 0xe46fe018  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x0018]
donret_2_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_27-donret_2_27-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0034d6a4 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x61f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_27:
	.word 0xe46fe012  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x0012]
	.word 0x91948006  ! 39: WRPR_PIL_R	wrpr	%r18, %r6, %pil
pmu_2_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2a8fffff7c1, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	bl,a	 skip_2_30
	ble  	 skip_2_30
.align 1024
skip_2_30:
	.word 0xe5e7c020  ! 41: CASA_I	casa	[%r31] 0x 1, %r0, %r18
splash_tba_2_31:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2f03081a2cdcb783, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e1e8  ! 44: LDUHA_I	lduha	[%r31, + 0x01e8] %asi, %r18
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa984400a  ! 46: WR_SET_SOFTINT_R	wr	%r17, %r10, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_33:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 47: RDPC	rd	%pc, %r16
tagged_2_34:
	tsubcctv %r19, 0x1c50, %r11
	.word 0xe807e014  ! 48: LDUW_I	lduw	[%r31 + 0x0014], %r20
splash_lsu_2_35:
	nop
	ta T_CHANGE_HPRIV
	set 0xba4bc5d5, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_2_36:
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
ibp_startwait2_36:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_36
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_36:
    brnz %r16, ibp_wait2_36
    ld [%r23], %r16
    ba ibp_startwait2_36
    mov 0x2, %r16
continue_ibp_2_36:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_36:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_36
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_36:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_36
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_36:
    best_set_reg(0x0000005005d43bd4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe897c02b  ! 50: LDUHA_R	lduha	[%r31, %r11] 0x01, %r20
	.word 0xa9a00172  ! 51: FABSq	dis not found

intveclr_2_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0x175c89ee02639c92, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d92800b  ! 53: WRPR_WSTATE_R	wrpr	%r10, %r11, %wstate
pmu_2_40:
	nop
	setx 0xfffffe80fffff024, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_2_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xad4, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe140  ! 55: STDFA_I	stda	%f16, [0x0140, %r31]
pmu_2_42:
	nop
	setx 0xfffff677fffff15e, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_2_43:
	taddcctv %r1, 0x107f, %r20
	.word 0xe807e17d  ! 57: LDUW_I	lduw	[%r31 + 0x017d], %r20
splash_lsu_2_44:
	nop
	ta T_CHANGE_HPRIV
	set 0x590d04eb, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_2_45:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xe8c844a0  ! 59: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r20
	.word 0xa5a449b0  ! 60: FDIVs	fdivs	%f17, %f16, %f18
jmptr_2_46:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	fbuge skip_2_47
	.word 0x91b084ca  ! 1: FCMPNE32	fcmpne32	%d2, %d10, %r8
.align 1024
skip_2_47:
	.word 0xc30fc000  ! 62: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_cmpr_2_48:
	nop
	setx 0x881d3b9df1d18188, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_2_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 65: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
donret_2_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_51-donret_2_51-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c699bb | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x24f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_51:
	.word 0xa1a109d4  ! 66: FDIVd	fdivd	%f4, %f20, %f16
brcommon1_2_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa5b3048d  ! 67: FCMPLE32	fcmple32	%d12, %d44, %r18
jmptr_2_53:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_2_54:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_2_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4904e40  ! 70: LDUHA_R	lduha	[%r1, %r0] 0x72, %r10
pmu_2_56:
	nop
	setx 0xfffff65cfffffd34, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_57-donret_2_57-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e999a8 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 23, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_57:
	.word 0xd4ffe14c  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x014c] %asi
brcommon1_2_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1b40490  ! 73: FCMPLE32	fcmple32	%d16, %d16, %r16
	.word 0xe1bfe140  ! 74: STDFA_I	stda	%f16, [0x0140, %r31]
dvapa_2_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0x89d, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc032  ! 75: STDA_R	stda	%r16, [%r31 + %r18] 0x01
donret_2_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_60-donret_2_60-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bfe1a0 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_60:
	.word 0xe06fe07c  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x007c]
	.word 0x8d9023a9  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x03a9, %pstate
	.word 0xc19fe180  ! 78: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_2_62:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
vahole_2_63:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe097c033  ! 81: LDUHA_R	lduha	[%r31, %r19] 0x01, %r16
	fblg skip_2_64
	fbuge,a,pn	%fcc0,  skip_2_64
.align 2048
skip_2_64:
	.word 0x87a84a43  ! 82: FCMPd	fcmpd	%fcc<n>, %f32, %f34
	.word 0x87802089  ! 83: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe6dfe140  ! 84: LDXA_I	ldxa	[%r31, + 0x0140] %asi, %r19
splash_lsu_2_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xbf2d4fff, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780208b  ! 86: WRASI_I	wr	%r0, 0x008b, %asi
pmu_2_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff99cfffff7e9, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4778aee9be5c862b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 89: RDPC	rd	%pc, %r16
brcommon3_2_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe5e7e00c  ! 90: CASA_R	casa	[%r31] %asi, %r12, %r18
pmu_2_70:
	nop
	setx 0xfffff02ffffff385, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9194400c  ! 92: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_2_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 94: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
    set 0x1c72, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b407c5  ! 95: PDIST	pdistn	%d16, %d36, %d48
vahole_2_73:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x95b0c7ca  ! 96: PDIST	pdistn	%d34, %d10, %d10
splash_tba_2_74:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_2_75:
    set user_data_start, %o7
	.word 0x93902005  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99a14d31  ! 99: FsMULd	fsmuld	%f5, %f48, %f12
dvapa_2_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0xac7, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc02b  ! 100: LDXA_R	ldxa	[%r31, %r11] 0x01, %r12
	.word 0xd847e048  ! 101: LDSW_I	ldsw	[%r31 + 0x0048], %r12
mondo_2_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d92c014  ! 102: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xa9540000  ! 103: RDPR_GL	<illegal instruction>
	.word 0x97a00170  ! 104: FABSq	dis not found

	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_2_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d904008  ! 106: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
	setx 0xccca1e52d5ae1567, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe020  ! 108: STDFA_I	stda	%f16, [0x0020, %r31]
splash_cmpr_2_82:
	nop
	setx 0x9db3d4ac83dfb6ff, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_2_83:
	nop
	setx 0xfffff064fffff14d, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa785212c  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x012c, %-
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
    brnz %r10, sma_2_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 112: CASA_R	casa	[%r31] %asi, %r11, %r20
fpinit_2_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 113: FDIVd	fdivd	%f0, %f4, %f6
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_86:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 114: RDPC	rd	%pc, %r9
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
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 115: CASA_R	casa	[%r31] %asi, %r12, %r18
	.word 0xa981000c  ! 116: WR_SET_SOFTINT_R	wr	%r4, %r12, %set_softint
vahole_2_88:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87a88a51  ! 117: FCMPd	fcmpd	%fcc<n>, %f2, %f48
vahole_2_89:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe040  ! 118: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0x9190c00d  ! 119: WRPR_PIL_R	wrpr	%r3, %r13, %pil
	.word 0x87802083  ! 120: WRASI_I	wr	%r0, 0x0083, %asi
pmu_2_91:
	nop
	setx 0xfffffb18fffff9bb, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd6800a60  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
intveclr_2_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3eba91aefc263adf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_2_93:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfde00  ! 124: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd69fe0f0  ! 125: LDDA_I	ldda	[%r31, + 0x00f0] %asi, %r11
	.word 0xe1bfe1a0  ! 126: STDFA_I	stda	%f16, [0x01a0, %r31]
fpinit_2_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d6b  ! 127: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd6b] %asi, #one_read
	.word 0xd68008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_96:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 129: RDPC	rd	%pc, %r12
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_2_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff785fffff285, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 132: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_2_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_2_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940013  ! 134: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
jmptr_2_100:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	bneg,a	 skip_2_101
	fbuge,a,pn	%fcc0,  skip_2_101
.align 1024
skip_2_101:
	.word 0xc36fe051  ! 136: PREFETCH_I	prefetch	[%r31 + 0x0051], #one_read
	.word 0xa5a00174  ! 137: FABSq	dis not found

	.word 0x93d020b4  ! 138: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xd8cfe1e8  ! 139: LDSBA_I	ldsba	[%r31, + 0x01e8] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 140: RDPC	rd	%pc, %r18
	.word 0x8d903019  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1019, %pstate
donret_2_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_105-donret_2_105-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a1c9f8 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x407, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_105:
	.word 0xe66fe1dd  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x01dd]
fpinit_2_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 143: FCMPd	fcmpd	%fcc<n>, %f0, %f4
donret_2_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_107-donret_2_107-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0025e78c | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd97, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_107:
	.word 0x91a189d3  ! 144: FDIVd	fdivd	%f6, %f50, %f8
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
    brnz %r10, sma_2_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 145: CASA_R	casa	[%r31] %asi, %r10, %r10
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 146: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_2_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_2_110:
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
ibp_startwait2_110:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_110
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_110:
    brnz %r16, ibp_wait2_110
    ld [%r23], %r16
    ba ibp_startwait2_110
    mov 0x2, %r16
continue_ibp_2_110:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_110:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_110
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_110:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_110
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_110:
    best_set_reg(0x00000050defbd440,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfe160  ! 148: STDFA_I	stda	%f0, [0x0160, %r31]
mondo_2_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 149: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x8d802004  ! 150: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902d08  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x0d08, %pstate
	brlz,pt  	%r16, skip_2_113
	fbne,a,pn	%fcc0,  skip_2_113
.align 32
skip_2_113:
	.word 0xc36fe17b  ! 152: PREFETCH_I	prefetch	[%r31 + 0x017b], #one_read
splash_hpstate_2_114:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x81982207  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0207, %hpstate
cwp_2_115:
    set user_data_start, %o7
	.word 0x93902000  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x92d8c011  ! 155: SMULcc_R	smulcc 	%r3, %r17, %r9
	.word 0x9194c014  ! 156: WRPR_PIL_R	wrpr	%r19, %r20, %pil
vahole_2_117:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfd960  ! 157: STDFA_R	stda	%f0, [%r0, %r31]
vahole_2_118:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe000  ! 158: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0x87ac8a53  ! 159: FCMPd	fcmpd	%fcc<n>, %f18, %f50
ibp_2_120:
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
ibp_startwait2_120:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_120
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_120:
    brnz %r16, ibp_wait2_120
    ld [%r23], %r16
    ba ibp_startwait2_120
    mov 0x2, %r16
continue_ibp_2_120:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_120:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_120
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_120:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_120
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_120:
    best_set_reg(0x000000503dd440fc,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe13fc012  ! 160: STDF_R	std	%f16, [%r18, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_121:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 161: RDPC	rd	%pc, %r11
	.word 0x99a00172  ! 162: FABSq	dis not found

	.word 0xe19fe000  ! 163: LDDFA_I	ldda	[%r31, 0x0000], %f16
mondo_2_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d950005  ! 164: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
splash_tba_2_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
vahole_2_125:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 166: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_2_126:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2c84b60  ! 167: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r9
ibp_2_127:
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
ibp_startwait2_127:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_127
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_127:
    brnz %r16, ibp_wait2_127
    ld [%r23], %r16
    ba ibp_startwait2_127
    mov 0x2, %r16
continue_ibp_2_127:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_127:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_127
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_127:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_127
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_127:
    best_set_reg(0x000000501fc0fcf2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd297c02c  ! 168: LDUHA_R	lduha	[%r31, %r12] 0x01, %r9
donret_2_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_128-donret_2_128-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005f1218 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe1e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_128:
	.word 0xd2ffe10a  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x010a] %asi
jmptr_2_129:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2bfc029  ! 171: STDA_R	stda	%r9, [%r31 + %r9] 0x01
vahole_2_131:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa9b507d2  ! 172: PDIST	pdistn	%d20, %d18, %d20
	.word 0xe727e007  ! 173: STF_I	st	%f19, [0x0007, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_132:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 174: RDPC	rd	%pc, %r8
	.word 0x87802014  ! 175: WRASI_I	wr	%r0, 0x0014, %asi
donret_2_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_133-donret_2_133-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cf647e | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x657, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_133:
	.word 0xa7a309cc  ! 176: FDIVd	fdivd	%f12, %f12, %f50
	.word 0xa3500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_2_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f6, %f26
	.word 0x9bb2430c  ! 178: ALIGNADDRESS	alignaddr	%r9, %r12, %r13
	setx 0x74e975fd6d6aea3e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbue,a,pn	%fcc0,  skip_2_136
	brlez,a,pt	%r18, skip_2_136
.align 128
skip_2_136:
	.word 0xd5e7c020  ! 180: CASA_I	casa	[%r31] 0x 1, %r0, %r10
	.word 0x99500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xda8008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_2_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaf0f935d7b6081e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 185: Tcc_R	tne	icc_or_xcc, %r0 + %r30
dvapa_2_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0x88e, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc014  ! 186: STDF_R	std	%f13, [%r20, %r31]
donret_2_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_139-donret_2_139-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0058adbc | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbde, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_139:
	.word 0xdaffe0b0  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x00b0] %asi
	bneg  	 skip_2_140
	fbl skip_2_140
.align 512
skip_2_140:
	.word 0x9f802eb6  ! 188: SIR	sir	0x0eb6
memptr_2_141:
	set user_data_start, %r31
	.word 0x858461b7  ! 189: WRCCR_I	wr	%r17, 0x01b7, %ccr
dvapa_2_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8b7, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7a449d4  ! 190: FDIVd	fdivd	%f48, %f20, %f50
dvapa_2_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa01, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00c  ! 191: STXFSR_R	st-sfr	%f1, [%r12, %r31]
fpinit_2_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 192: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x986a8011  ! 193: UDIVX_R	udivx 	%r10, %r17, %r12
donret_2_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_145-donret_2_145-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00600eea | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf0c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_2_145:
	.word 0xe6ffe191  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x0191] %asi
	.word 0x91920004  ! 195: WRPR_PIL_R	wrpr	%r8, %r4, %pil
	.word 0x91948011  ! 196: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	.word 0x95b507c7  ! 197: PDIST	pdistn	%d20, %d38, %d10
	.word 0x9f802b1c  ! 198: SIR	sir	0x0b1c
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802010  ! 200: WRASI_I	wr	%r0, 0x0010, %asi
splash_hpstate_2_149:
	ta T_CHANGE_NONHPRIV
	.word 0x8198249c  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049c, %hpstate
	.word 0xe697e038  ! 202: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r19
dvapa_2_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0xde3, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc012  ! 203: STDF_R	std	%f19, [%r18, %r31]
splash_decr_2_151:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7818010  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r16, %-
brcommon2_2_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x99a309c1  ! 1: FDIVd	fdivd	%f12, %f32, %f12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fd960  ! 205: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x97454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xe897e1f0  ! 207: LDUHA_I	lduha	[%r31, + 0x01f0] %asi, %r20
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
    brnz %r10, sma_2_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 208: CASA_R	casa	[%r31] %asi, %r20, %r20
vahole_2_154:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe160  ! 209: STDFA_I	stda	%f0, [0x0160, %r31]
splash_lsu_2_155:
	nop
	ta T_CHANGE_HPRIV
	set 0xc12b330f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_156:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982dfe  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dfe, %hpstate
fpinit_2_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82de6  ! 212: PREFETCHA_I	prefetcha	[%r0, + 0x0de6] %asi, #one_read
splash_tba_2_158:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0x249f866ba527daa9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d934002  ! 215: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0xc1bfe080  ! 216: STDFA_I	stda	%f0, [0x0080, %r31]
pmu_2_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2d8fffff180, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_163-donret_2_163-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c512f7 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xad6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_2_163:
	.word 0x9ba109ca  ! 218: FDIVd	fdivd	%f4, %f10, %f44
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r16
vahole_2_164:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4dfc030  ! 221: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
ibp_2_165:
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
ibp_startwait2_165:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_165
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_165:
    brnz %r16, ibp_wait2_165
    ld [%r23], %r16
    ba ibp_startwait2_165
    mov 0x2, %r16
continue_ibp_2_165:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_165:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_165
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_165:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_165
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_165:
    best_set_reg(0x00000050fffcf258,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe5e7e00d  ! 222: CASA_R	casa	[%r31] %asi, %r13, %r18
dvapa_2_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9e8, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 223: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe44fe020  ! 224: LDSB_I	ldsb	[%r31 + 0x0020], %r18
mondo_2_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d910011  ! 225: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
	.word 0x9880c006  ! 226: ADDcc_R	addcc 	%r3, %r6, %r12
	.word 0xda97c032  ! 227: LDUHA_R	lduha	[%r31, %r18] 0x01, %r13
vahole_2_169:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87aaca54  ! 228: FCMPd	fcmpd	%fcc<n>, %f42, %f20
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_170:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 229: RDPC	rd	%pc, %r19
vahole_2_171:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd1e7e013  ! 230: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x91950005  ! 231: WRPR_PIL_R	wrpr	%r20, %r5, %pil
pmu_2_173:
	nop
	setx 0xfffff463fffffaf9, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd097c028  ! 233: LDUHA_R	lduha	[%r31, %r8] 0x01, %r8
	.word 0xa7694014  ! 234: SDIVX_R	sdivx	%r5, %r20, %r19
splash_cmpr_2_175:
	nop
	setx 0x11eaa1b9f78a7257, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_176) + 48, 16, 16)) -> intp(0,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_176)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,20)
#else
	setx 0xb0431e9cd91558d4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_2_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdce, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfda00  ! 237: STDFA_R	stda	%f0, [%r0, %r31]
vahole_2_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 238: STDFA_R	stda	%f16, [%r0, %r31]
fpinit_2_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 239: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_2_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 240: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
vahole_2_181:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe1e0  ! 241: STDFA_I	stda	%f16, [0x01e0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_182) + 48, 16, 16)) -> intp(6,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_182)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,24)
#else
	setx 0x5cfb97ccc9ff1169, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4800b00  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
intveclr_2_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0826a16b9fb45b4c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_2_184:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4bfc028  ! 245: STDA_R	stda	%r18, [%r31 + %r8] 0x01
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
    brnz %r10, sma_2_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 246: CASA_R	casa	[%r31] %asi, %r19, %r18
fpinit_2_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 247: FDIVd	fdivd	%f0, %f4, %f8
vahole_2_187:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4bfc030  ! 248: STDA_R	stda	%r18, [%r31 + %r16] 0x01
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_2_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe315000c  ! 1: LDQF_R	-	[%r20, %r12], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 250: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_2_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d92c013  ! 251: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
	setx 0x872ac762eefa42a3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_2_192:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe2dfc028  ! 253: LDXA_R	ldxa	[%r31, %r8] 0x01, %r17
ibp_2_193:
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
ibp_startwait2_193:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_193
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_193:
    brnz %r16, ibp_wait2_193
    ld [%r23], %r16
    ba ibp_startwait2_193
    mov 0x2, %r16
continue_ibp_2_193:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_193:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_193
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_193:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_193
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_193:
    best_set_reg(0x000000503ff25871,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 254: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xab81eda5  ! 255: WR_CLEAR_SOFTINT_I	wr	%r7, 0x0da5, %clear_softint
splash_lsu_2_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x37bde5ff, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 257: CASA_R	casa	[%r31] %asi, %r19, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_196) + 56, 16, 16)) -> intp(7,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_196)&0xffffffff)  + 56, 16, 16)) -> intp(7,0,10)
#else
	setx 0x792b245f066b7f33, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9b14990  ! 259: BSHUFFLE	fmovc32	%d36, %d16, %d20
	.word 0x9f802fd2  ! 260: SIR	sir	0x0fd2
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
    brnz %r10, sma_2_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 261: CASA_R	casa	[%r31] %asi, %r20, %r19
splash_tba_2_199:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_2_200:
	ta T_CHANGE_NONHPRIV
	.word 0x8198208d  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008d, %hpstate
mondo_2_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d940009  ! 264: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
tagged_2_202:
	tsubcctv %r18, 0x1140, %r12
	.word 0xe607e188  ! 265: LDUW_I	lduw	[%r31 + 0x0188], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_2_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d91800d  ! 267: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
splash_cmpr_2_204:
	nop
	setx 0x8af00f9ba591837d, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_2_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8acf16563e706f63, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9034ee  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x14ee, %pstate
cwp_2_207:
    set user_data_start, %o7
	.word 0x93902001  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_208) + 0, 16, 16)) -> intp(4,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_208)&0xffffffff)  + 0, 16, 16)) -> intp(4,0,10)
#else
	setx 0x93b1f97119a0b72d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_2_209:
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
ibp_startwait2_209:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_209
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_209:
    brnz %r16, ibp_wait2_209
    ld [%r23], %r16
    ba ibp_startwait2_209
    mov 0x2, %r16
continue_ibp_2_209:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_209:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_209
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_209:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_209
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_209:
    best_set_reg(0x0000005086d8717a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc3e98033  ! 273: PREFETCHA_R	prefetcha	[%r6, %r19] 0x01, #one_read
mondo_2_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d95000d  ! 274: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
ibp_2_211:
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
ibp_startwait2_211:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_211
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_211:
    brnz %r16, ibp_wait2_211
    ld [%r23], %r16
    ba ibp_startwait2_211
    mov 0x2, %r16
continue_ibp_2_211:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_211:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_211
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_211:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_211
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_211:
    best_set_reg(0x0000005031f17a0c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe020  ! 275: STDFA_I	stda	%f0, [0x0020, %r31]
splash_lsu_2_212:
	nop
	ta T_CHANGE_HPRIV
	set 0x6d5ffb74, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 277: Tcc_R	ta	icc_or_xcc, %r0 + %r30
trapasi_2_213:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d04a00  ! 278: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r20
pmu_2_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff386fffffe66, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe1bfc2c0  ! 280: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_216) + 16, 16, 16)) -> intp(4,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_216)&0xffffffff)  + 16, 16, 16)) -> intp(4,0,23)
#else
	setx 0xbfcfeb6770951465, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_217:
	nop
	ta T_CHANGE_HPRIV
	set 0x1fa67c01, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d924013  ! 283: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
vahole_2_219:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 284: STDFA_R	stda	%f0, [%r0, %r31]
mondo_2_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c014  ! 285: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	ble,a	 skip_2_221
	.word 0x95b404d0  ! 1: FCMPNE32	fcmpne32	%d16, %d16, %r10
.align 512
skip_2_221:
	.word 0xc368ae4e  ! 286: PREFETCH_I	prefetch	[%r2 + 0x0e4e], #one_read
donret_2_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_222-donret_2_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0085c062 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf1f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_222:
	.word 0xe86fe0ec  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x00ec]
jmptr_2_223:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_2_224:
	nop
	setx 0x61f07ef2f116d468, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_2_225:
	nop
	setx 0x38b51210842002f0, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_2_226:
	nop
	setx 0xfffffba3fffff95c, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff186fffff248, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d944003  ! 293: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0x87802014  ! 294: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x99a00174  ! 295: FABSq	dis not found

donret_2_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_230-donret_2_230-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007405d6 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x40e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_230:
	.word 0xe66fe02d  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x002d]
vahole_2_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfdf20  ! 297: STDFA_R	stda	%f16, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_232:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 298: RDPC	rd	%pc, %r20
trapasi_2_233:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 299: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
dvapa_2_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0x93b, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91703040  ! 300: POPC_I	popc	0x1040, %r8
intveclr_2_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5e30004bff962057, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94000d  ! 302: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	setx 0xd0fd75be6d048fdd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00170  ! 304: FABSq	dis not found

pmu_2_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff70ffffff59f, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff268fffff877, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_241:
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
ibp_startwait2_241:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_241
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_241:
    brnz %r16, ibp_wait2_241
    ld [%r23], %r16
    ba ibp_startwait2_241
    mov 0x2, %r16
continue_ibp_2_241:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_241:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_241
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_241:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_241
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_241:
    best_set_reg(0x000000503bfa0cf4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe49fc033  ! 307: LDDA_R	ldda	[%r31, %r19] 0x01, %r18
splash_tba_2_242:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_2_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_243:
	.word 0x8f902002  ! 309: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 310: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_2_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa54795f5c9cc043a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_2_245:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe120  ! 312: STDFA_I	stda	%f0, [0x0120, %r31]
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
    brnz %r10, sma_2_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 313: CASA_R	casa	[%r31] %asi, %r19, %r18
dvapa_2_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9a6, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95a0c9d1  ! 314: FDIVd	fdivd	%f34, %f48, %f10
unsupttte_2_248:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a509d3  ! 315: FDIVd	fdivd	%f20, %f50, %f10
ibp_2_249:
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
ibp_startwait2_249:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_249
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_249:
    brnz %r16, ibp_wait2_249
    ld [%r23], %r16
    ba ibp_startwait2_249
    mov 0x2, %r16
continue_ibp_2_249:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_249:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_249
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_249:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_249
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_249:
    best_set_reg(0x0000005091ccf402,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 316: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_250) + 56, 16, 16)) -> intp(1,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_250)&0xffffffff)  + 56, 16, 16)) -> intp(1,0,24)
#else
	setx 0x5c952df3ae9649f7, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_2_251:
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
ibp_startwait2_251:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_251
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_251:
    brnz %r16, ibp_wait2_251
    ld [%r23], %r16
    ba ibp_startwait2_251
    mov 0x2, %r16
continue_ibp_2_251:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_251:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_251
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_251:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_251
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_251:
    best_set_reg(0x00000050cef4020b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd13fc011  ! 319: STDF_R	std	%f8, [%r17, %r31]
vahole_2_252:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fc3e0  ! 320: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x633f82bd43fba210, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0800c20  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
dvapa_2_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe84, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0bfc02b  ! 323: STDA_R	stda	%r8, [%r31 + %r11] 0x01
	.word 0x8d802004  ! 324: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_2_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9119b4941c839bd4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 326: CASA_R	casa	[%r31] %asi, %r13, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_257:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 327: RDPC	rd	%pc, %r11
ibp_2_258:
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
ibp_startwait2_258:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_258
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_258:
    brnz %r16, ibp_wait2_258
    ld [%r23], %r16
    ba ibp_startwait2_258
    mov 0x2, %r16
continue_ibp_2_258:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_258:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_258
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_258:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_258
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_258:
    best_set_reg(0x0000005008c20b6e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd920  ! 328: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_2_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 329: FDIVs	fdivs	%f0, %f4, %f8
vahole_2_260:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdadfc034  ! 330: LDXA_R	ldxa	[%r31, %r20] 0x01, %r13
	.word 0xda800c60  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
	.word 0x9ad47884  ! 332: UMULcc_I	umulcc 	%r17, 0xfffff884, %r13
ibp_2_261:
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
ibp_startwait2_261:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_261
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_261:
    brnz %r16, ibp_wait2_261
    ld [%r23], %r16
    ba ibp_startwait2_261
    mov 0x2, %r16
continue_ibp_2_261:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_261:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_261
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_261:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_261
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_261:
    best_set_reg(0x0000005086cb6e25,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9bb04489  ! 333: FCMPLE32	fcmple32	%d32, %d40, %r13
mondo_2_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d920007  ! 334: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
mondo_2_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94c002  ! 335: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
	.word 0x9b524000  ! 336: RDPR_CWP	<illegal instruction>
pmu_2_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff5cfffff803, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_2_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa0f, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd2bfc032  ! 338: STDA_R	stda	%r9, [%r31 + %r18] 0x01
splash_lsu_2_267:
	nop
	ta T_CHANGE_HPRIV
	set 0x66d745c0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_2_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 341: Tcc_R	tne	icc_or_xcc, %r0 + %r30
donret_2_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_269-donret_2_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a895c8 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb05, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2ecc0001  ! 1: BRGEZ	brgez,a,pt	%r16,<label_0xc0001>
	done
donretarg_2_269:
	.word 0x9ba449d0  ! 342: FDIVd	fdivd	%f48, %f16, %f44
ibp_2_270:
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
ibp_startwait2_270:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_270
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_270:
    brnz %r16, ibp_wait2_270
    ld [%r23], %r16
    ba ibp_startwait2_270
    mov 0x2, %r16
continue_ibp_2_270:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_270:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_270
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_270:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_270
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_270:
    best_set_reg(0x00000050c7ee250c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fc2c0  ! 343: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80291a  ! 344: SIR	sir	0x091a
splash_hpstate_2_271:
	.word 0x81982885  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0885, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_272:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 346: RDPC	rd	%pc, %r8
ibp_2_273:
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
ibp_startwait2_273:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_273
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_273:
    brnz %r16, ibp_wait2_273
    ld [%r23], %r16
    ba ibp_startwait2_273
    mov 0x2, %r16
continue_ibp_2_273:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_273:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_273
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_273:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_273
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_273:
    best_set_reg(0x0000005099e50c9a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc02c  ! 347: STDA_R	stda	%r13, [%r31 + %r12] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_274) + 32, 16, 16)) -> intp(0,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_274)&0xffffffff)  + 32, 16, 16)) -> intp(0,0,11)
#else
	setx 0x64e54e7f14798736, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff3ebfffff9a0, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_276:
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
ibp_startwait2_276:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_276
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_276:
    brnz %r16, ibp_wait2_276
    ld [%r23], %r16
    ba ibp_startwait2_276
    mov 0x2, %r16
continue_ibp_2_276:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_276:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_276
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_276:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_276
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_276:
    best_set_reg(0x00000050e6cc9a91,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xdabfc031  ! 350: STDA_R	stda	%r13, [%r31 + %r17] 0x01
pmu_2_277:
	nop
	setx 0xfffffd53fffff34c, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x35f8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b447c1  ! 352: PDIST	pdistn	%d48, %d32, %d12
dvapa_2_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0x822, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95b1c494  ! 353: FCMPLE32	fcmple32	%d38, %d20, %r10
	.word 0xe71fe140  ! 354: LDDF_I	ldd	[%r31, 0x0140], %f19
pmu_2_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff274fffff314, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_280) + 32, 16, 16)) -> intp(5,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_280)&0xffffffff)  + 32, 16, 16)) -> intp(5,0,17)
#else
	setx 0xe545b3c4a325f4dd, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e1c0  ! 357: LDUHA_I	lduha	[%r31, + 0x01c0] %asi, %r19
intveclr_2_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd30e1074e4c32221, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_2_282:
	nop
	setx 0xfffffbcdfffff16a, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0xeed4d1ff9d7bd105, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x2+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_284:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 362: RDPC	rd	%pc, %r11
	.word 0xa1450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r16
intveclr_2_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd19e5515b6f9233b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_2_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 365: FDIVs	fdivs	%f0, %f4, %f4
ibp_2_287:
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
ibp_startwait2_287:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_287
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_287:
    brnz %r16, ibp_wait2_287
    ld [%r23], %r16
    ba ibp_startwait2_287
    mov 0x2, %r16
continue_ibp_2_287:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_287:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_287
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_287:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_287
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_287:
    best_set_reg(0x00000050beda910d,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x9bb107d2  ! 366: PDIST	pdistn	%d4, %d18, %d44
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
    brnz %r10, sma_2_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 367: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8d802004  ! 368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	setx 0x518c1976771b5f76, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 370: CASA_R	casa	[%r31] %asi, %r16, %r18
donret_2_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_291-donret_2_291-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009bc826 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x57, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_2_291:
	.word 0xa7a509d0  ! 371: FDIVd	fdivd	%f20, %f16, %f50
	.word 0xab82a5f3  ! 372: WR_CLEAR_SOFTINT_I	wr	%r10, 0x05f3, %clear_softint
	.word 0xd68008a0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
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
    brnz %r10, sma_2_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 374: CASA_R	casa	[%r31] %asi, %r17, %r11
br_longdelay2_2_293:
	.word 0x26cb4001  ! 1: BRLZ	brlz,a,pt	%r13,<label_0xb4001>
	.word 0xd63fc009  ! 375: STD_R	std	%r11, [%r31 + %r9]
dvapa_2_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0x810, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00c  ! 376: STXFSR_R	st-sfr	%f1, [%r12, %r31]
splash_lsu_2_295:
	nop
	ta T_CHANGE_HPRIV
	set 0xea0da992, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_2_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9d3  ! 1: FDIVd	fdivd	%f62, %f50, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803ad2  ! 378: SIR	sir	0x1ad2
	.word 0x8d802000  ! 379: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_2_297:
	nop
	setx 0x8159dba128b7eca3, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_298) + 48, 16, 16)) -> intp(1,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_298)&0xffffffff)  + 48, 16, 16)) -> intp(1,0,6)
#else
	setx 0x2048847a5bff1c89, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91944004  ! 382: WRPR_PIL_R	wrpr	%r17, %r4, %pil
splash_cmpr_2_300:
	nop
	setx 0xc278c1446c5c0e45, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_2_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d91c007  ! 385: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
	.word 0xd037e122  ! 386: STH_I	sth	%r8, [%r31 + 0x0122]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x514f8760c85d6c55, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00166  ! 389: FABSq	dis not found

donret_2_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_305-donret_2_305-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00556663 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_305:
	.word 0xe8ffe0c5  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x00c5] %asi
	.word 0xe897e100  ! 391: LDUHA_I	lduha	[%r31, + 0x0100] %asi, %r20
	.word 0xe8d7e1a0  ! 392: LDSHA_I	ldsha	[%r31, + 0x01a0] %asi, %r20
pmu_2_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff8cfffff949, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_2_307:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 394: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_2_308:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8d84b40  ! 395: LDXA_R	ldxa	[%r1, %r0] 0x5a, %r20
trapasi_2_309:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8904a00  ! 396: LDUHA_R	lduha	[%r1, %r0] 0x50, %r20
ibp_2_310:
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
ibp_startwait2_310:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_310
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_310:
    brnz %r16, ibp_wait2_310
    ld [%r23], %r16
    ba ibp_startwait2_310
    mov 0x2, %r16
continue_ibp_2_310:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_310:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_310
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_310:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_310
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_310:
    best_set_reg(0x00000050fcd10d3b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe897c02b  ! 397: LDUHA_R	lduha	[%r31, %r11] 0x01, %r20
intveclr_2_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0629e7026ed56ad4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_2_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_2_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb39fffff89d, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
vahole_1_0:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4dfc028  ! 1: LDXA_R	ldxa	[%r31, %r8] 0x01, %r18
jmptr_1_1:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 2: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 3: BGE	bge,a	<label_0x1>
	.word 0xe1bfc3e0  ! 4: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_1_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 5: CASA_R	casa	[%r31] %asi, %r10, %r18
vahole_1_3:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa3a049a2  ! 6: FDIVs	fdivs	%f1, %f2, %f17
	.word 0xc19fe060  ! 7: LDDFA_I	ldda	[%r31, 0x0060], %f0
ibp_1_4:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe020  ! 8: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xe19fc2c0  ! 9: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_1_6:
	nop
	setx 0xfffffe10fffff605, %g1, %g7
	.word 0xa3800007  ! 10: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_7:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc2c0  ! 11: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f802e80  ! 12: SIR	sir	0x0e80
brcommon1_1_8:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa3702e80  ! 1: POPC_I	popc	0x0e80, %r17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93a409aa  ! 13: FDIVs	fdivs	%f16, %f10, %f9
	.word 0xa9540000  ! 14: RDPR_GL	<illegal instruction>
splash_lsu_1_9:
	nop
	ta T_CHANGE_HPRIV
	set 0xd5bd5598, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 15: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe82fe06b  ! 16: STB_I	stb	%r20, [%r31 + 0x006b]
pmu_1_10:
	nop
	setx 0xfffff3d7fffff800, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803293  ! 18: SIR	sir	0x1293
	.word 0x8d9022d8  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x02d8, %pstate
dvapa_1_12:
	nop
	ta T_CHANGE_HPRIV
	mov 0xde3, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 20: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_1_13:
	nop
	setx 0xf1c461dbfc89117c, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 21: WRPR_TICK_R	wrpr	%r0, %r17, %tick
donret_1_14:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_14-donret_1_14-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00208d54 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x495, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x22cd0001  ! 1: BRZ	brz,a,pt	%r20,<label_0xd0001>
	retry
donretarg_1_14:
	.word 0x9ba409c8  ! 22: FDIVd	fdivd	%f16, %f8, %f44
trapasi_1_15:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xdac04a00  ! 23: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r13
dvapa_1_16:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9b8, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc00a  ! 24: LDDF_R	ldd	[%r31, %r10], %f13
	.word 0x8d802004  ! 25: WRFPRS_I	wr	%r0, 0x0004, %fprs
	bg  	 skip_1_17
	brlez,a,pn	%r20, skip_1_17
.align 512
skip_1_17:
	.word 0xc36fe130  ! 26: PREFETCH_I	prefetch	[%r31 + 0x0130], #one_read
splash_cmpr_1_18:
	nop
	setx 0x4a79d11b9805e619, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 27: WRPR_TICK_R	wrpr	%r0, %r17, %tick
intveclr_1_19:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4a0371e4c3b37b41, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 28: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_20:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1a60dbc58d87c854, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 29: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_21:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 30: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0xa5a00166  ! 31: FABSq	dis not found

memptr_1_23:
	set 0x60140000, %r31
	.word 0x85806ef1  ! 32: WRCCR_I	wr	%r1, 0x0ef1, %ccr
splash_tba_1_24:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 33: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe45fe150  ! 34: LDX_I	ldx	[%r31 + 0x0150], %r18
	.word 0x9f803105  ! 35: SIR	sir	0x1105
mondo_1_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c008  ! 36: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
donret_1_26:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_26-donret_1_26-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00386284 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x387, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_26:
	.word 0xe46fe03a  ! 37: LDSTUB_I	ldstub	%r18, [%r31 + 0x003a]
donret_1_27:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_27-donret_1_27-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eb4c08 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x70e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2accc001  ! 1: BRNZ	brnz,a,pt	%r19,<label_0xcc001>
	done
donretarg_1_27:
	.word 0xe46fe107  ! 38: LDSTUB_I	ldstub	%r18, [%r31 + 0x0107]
	.word 0x91934013  ! 39: WRPR_PIL_R	wrpr	%r13, %r19, %pil
pmu_1_29:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4f2fffffa55, %g1, %g7
	.word 0xa3800007  ! 40: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	bge  	 skip_1_30
	brz,pt  	%r7, skip_1_30
.align 1024
skip_1_30:
	.word 0xc36fe18e  ! 41: PREFETCH_I	prefetch	[%r31 + 0x018e], #one_read
splash_tba_1_31:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 42: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_32:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0eff3abc436756bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe497e130  ! 44: LDUHA_I	lduha	[%r31, + 0x0130] %asi, %r18
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa985000b  ! 46: WR_SET_SOFTINT_R	wr	%r20, %r11, %set_softint
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_33
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_33
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_33:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 47: RDPC	rd	%pc, %r20
tagged_1_34:
	tsubcctv %r9, 0x1155, %r1
	.word 0xe807e17c  ! 48: LDUW_I	lduw	[%r31 + 0x017c], %r20
splash_lsu_1_35:
	nop
	ta T_CHANGE_HPRIV
	set 0x5a36a532, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 49: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_1_36:
	nop
	.word 0xe8dfc033  ! 50: LDXA_R	ldxa	[%r31, %r19] 0x01, %r20
	.word 0xa9a00170  ! 51: FABSq	dis not found

intveclr_1_38:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8b2876107e59a825, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_39:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d944011  ! 53: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
pmu_1_40:
	nop
	setx 0xfffff470fffffdb3, %g1, %g7
	.word 0xa3800007  ! 54: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_1_41:
	nop
	ta T_CHANGE_HPRIV
	mov 0xab3, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 55: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_1_42:
	nop
	setx 0xfffffacdfffffa62, %g1, %g7
	.word 0xa3800007  ! 56: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_1_43:
	taddcctv %r18, 0x1f7f, %r16
	.word 0xe807e0c1  ! 57: LDUW_I	lduw	[%r31 + 0x00c1], %r20
splash_lsu_1_44:
	nop
	ta T_CHANGE_HPRIV
	set 0x2e991a0b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
trapasi_1_45:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xe89044a0  ! 59: LDUHA_R	lduha	[%r1, %r0] 0x25, %r20
	.word 0x93a309b4  ! 60: FDIVs	fdivs	%f12, %f20, %f9
jmptr_1_46:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 61: JMPL_R	jmpl	%r27 + %r0, %r27
	fbu,a,pn	%fcc0,  skip_1_47
	.word 0x91b504cb  ! 1: FCMPNE32	fcmpne32	%d20, %d42, %r8
.align 1024
skip_1_47:
	.word 0xc30fc000  ! 62: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
splash_cmpr_1_48:
	nop
	setx 0x043f069b2f5f48c9, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 63: WR_STICK_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_49:
	ta	T_CHANGE_NONPRIV	! macro
mondo_1_50:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d914014  ! 65: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
donret_1_51:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_51-donret_1_51-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007419ee | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x70e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_51:
	.word 0x93a449d0  ! 66: FDIVd	fdivd	%f48, %f16, %f40
brcommon1_1_52:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32ff105  ! 1: STXFSR_I	st-sfr	%f1, [0x1105, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a449d3  ! 67: FDIVd	fdivd	%f48, %f50, %f10
jmptr_1_53:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 68: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tba_1_54:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 69: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_1_55:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x72) 
	.word 0xd4d84e40  ! 70: LDXA_R	ldxa	[%r1, %r0] 0x72, %r10
pmu_1_56:
	nop
	setx 0xfffffd61ffffff40, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_57:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_57-donret_1_57-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d3ac04 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x905, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_57:
	.word 0xd4ffe032  ! 72: SWAPA_I	swapa	%r10, [%r31 + 0x0032] %asi
brcommon1_1_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd5e7c02b  ! 1: CASA_I	casa	[%r31] 0x 1, %r11, %r10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803b51  ! 73: SIR	sir	0x1b51
	.word 0xe1bfe0e0  ! 74: STDFA_I	stda	%f16, [0x00e0, %r31]
dvapa_1_59:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc1d, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 75: CASA_R	casa	[%r31] %asi, %r20, %r16
donret_1_60:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_60-donret_1_60-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000fbf2c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_60:
	.word 0xe06fe1ca  ! 76: LDSTUB_I	ldstub	%r16, [%r31 + 0x01ca]
	.word 0x8d903f54  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x1f54, %pstate
	.word 0xc19fe060  ! 78: LDDFA_I	ldda	[%r31, 0x0060], %f0
	.word 0xe137c000  ! 79: STQF_R	-	%f16, [%r0, %r31]
jmptr_1_62:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
vahole_1_63:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe13fc014  ! 81: STDF_R	std	%f16, [%r20, %r31]
	fbuge skip_1_64
	.word 0xa1a089c1  ! 1: FDIVd	fdivd	%f2, %f32, %f16
.align 2048
skip_1_64:
	.word 0xa7b504d2  ! 82: FCMPNE32	fcmpne32	%d20, %d18, %r19
	.word 0x87802014  ! 83: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe6dfe168  ! 84: LDXA_I	ldxa	[%r31, + 0x0168] %asi, %r19
splash_lsu_1_65:
	nop
	ta T_CHANGE_HPRIV
	set 0xdac21b51, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 85: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 86: WRASI_I	wr	%r0, 0x0089, %asi
pmu_1_66:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc63fffff1f0, %g1, %g7
	.word 0xa3800007  ! 87: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_67:
	nop
	ta T_CHANGE_HPRIV
	setx 0x770a7fc28987215a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 88: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_68
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_68
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 89: RDPC	rd	%pc, %r18
brcommon3_1_69:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46ff0aa  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0xfffff0aa]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc012  ! 90: STXFSR_R	st-sfr	%f1, [%r18, %r31]
pmu_1_70:
	nop
	setx 0xfffff9bbfffff47b, %g1, %g7
	.word 0xa3800007  ! 91: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91940006  ! 92: WRPR_PIL_R	wrpr	%r16, %r6, %pil
	.word 0xe43fc000  ! 93: STD_R	std	%r18, [%r31 + %r0]
mondo_1_72:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d950002  ! 94: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
    set 0xd65, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b487cc  ! 95: PDIST	pdistn	%d18, %d12, %d42
vahole_1_73:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa9b0c494  ! 96: FCMPLE32	fcmple32	%d34, %d20, %r20
splash_tba_1_74:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 97: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_1_75:
    set user_data_start, %o7
	.word 0x93902004  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99a48d32  ! 99: FsMULd	fsmuld	%f18, %f18, %f12
dvapa_1_76:
	nop
	ta T_CHANGE_HPRIV
	mov 0xab3, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc02d  ! 100: LDXA_R	ldxa	[%r31, %r13] 0x01, %r12
	.word 0xd847e108  ! 101: LDSW_I	ldsw	[%r31 + 0x0108], %r12
mondo_1_77:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d918012  ! 102: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0xa7540000  ! 103: RDPR_GL	<illegal instruction>
	.word 0xa9a00173  ! 104: FABSq	dis not found

	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_79:
	ta	T_CHANGE_NONPRIV	! macro
mondo_1_80:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d914010  ! 106: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	setx 0x2e16c3fd68752a08, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_81:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe1e0  ! 108: STDFA_I	stda	%f0, [0x01e0, %r31]
splash_cmpr_1_82:
	nop
	setx 0x5e8c0a182cc5dcf7, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 109: WR_STICK_REG_R	wr	%r0, %r17, %-
pmu_1_83:
	nop
	setx 0xfffff221fffff5aa, %g1, %g7
	.word 0xa3800007  ! 110: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7847f42  ! 111: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x1f42, %-
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
    brnz %r10, sma_1_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_84:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 112: CASA_R	casa	[%r31] %asi, %r16, %r20
fpinit_1_85:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 113: FDIVd	fdivd	%f0, %f4, %f6
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_86
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_86
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_86:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 114: RDPC	rd	%pc, %r18
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 115: CASA_R	casa	[%r31] %asi, %r10, %r18
	.word 0xa9834013  ! 116: WR_SET_SOFTINT_R	wr	%r13, %r19, %set_softint
vahole_1_88:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87ac4a45  ! 117: FCMPd	fcmpd	%fcc<n>, %f48, %f36
vahole_1_89:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe1c0  ! 118: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0x91930002  ! 119: WRPR_PIL_R	wrpr	%r12, %r2, %pil
	.word 0x87802010  ! 120: WRASI_I	wr	%r0, 0x0010, %asi
pmu_1_91:
	nop
	setx 0xfffffbd9fffffd43, %g1, %g7
	.word 0xa3800007  ! 121: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd6800bc0  ! 122: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
intveclr_1_92:
	nop
	ta T_CHANGE_HPRIV
	setx 0x659b328efc64e1cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 123: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_1_93:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 124: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd69fe160  ! 125: LDDA_I	ldda	[%r31, + 0x0160] %asi, %r11
	.word 0xc1bfe1c0  ! 126: STDFA_I	stda	%f0, [0x01c0, %r31]
fpinit_1_95:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 127: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xd68008a0  ! 128: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_96
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_96
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_96:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 129: RDPC	rd	%pc, %r10
	.word 0x8d802004  ! 130: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_1_97:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb19fffff716, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_1_98:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_1_99:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d93000d  ! 134: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
jmptr_1_100:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 135: JMPL_R	jmpl	%r27 + %r0, %r27
	fbl,a,pn	%fcc0,  skip_1_101
	brlez,a,pn	%r11, skip_1_101
.align 1024
skip_1_101:
	.word 0xc30fc000  ! 136: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x99a00168  ! 137: FABSq	dis not found

	.word 0x91d02034  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd8cfe0e0  ! 139: LDSBA_I	ldsba	[%r31, + 0x00e0] %asi, %r12
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_103
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_103:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 140: RDPC	rd	%pc, %r19
	.word 0x8d903179  ! 141: WRPR_PSTATE_I	wrpr	%r0, 0x1179, %pstate
donret_1_105:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_105-donret_1_105-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c15ac6 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7c7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_105:
	.word 0xe66fe1d7  ! 142: LDSTUB_I	ldstub	%r19, [%r31 + 0x01d7]
fpinit_1_106:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83d6b  ! 143: PREFETCHA_I	prefetcha	[%r0, + 0xfffffd6b] %asi, #one_read
donret_1_107:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_107-donret_1_107-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b79592 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe8e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_107:
	.word 0x95a249c6  ! 144: FDIVd	fdivd	%f40, %f6, %f10
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
    brnz %r10, sma_1_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_108:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 145: CASA_R	casa	[%r31] %asi, %r10, %r10
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 146: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_1_109:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 147: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
ibp_1_110:
	nop
	.word 0xe1bfe140  ! 148: STDFA_I	stda	%f16, [0x0140, %r31]
mondo_1_111:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d90c013  ! 149: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
	.word 0x8d802000  ! 150: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d903b22  ! 151: WRPR_PSTATE_I	wrpr	%r0, 0x1b22, %pstate
	fbne skip_1_113
	fblg skip_1_113
.align 32
skip_1_113:
	.word 0xc32fc000  ! 152: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_hpstate_1_114:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x819823ed  ! 153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ed, %hpstate
cwp_1_115:
    set user_data_start, %o7
	.word 0x93902000  ! 154: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa2dc0014  ! 155: SMULcc_R	smulcc 	%r16, %r20, %r17
	.word 0x91950014  ! 156: WRPR_PIL_R	wrpr	%r20, %r20, %pil
vahole_1_117:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fc2c0  ! 157: LDDFA_R	ldda	[%r31, %r0], %f0
vahole_1_118:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd920  ! 158: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x87ac0a51  ! 159: FCMPd	fcmpd	%fcc<n>, %f16, %f48
ibp_1_120:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe03ffc0f  ! 160: STD_I	std	%r16, [%r31 + 0xfffffc0f]
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_121
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_121:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 161: RDPC	rd	%pc, %r10
	.word 0x93a00169  ! 162: FABSq	dis not found

	.word 0xe19fe1c0  ! 163: LDDFA_I	ldda	[%r31, 0x01c0], %f16
mondo_1_123:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d91c012  ! 164: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
splash_tba_1_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 165: WRPR_TBA_R	wrpr	%r0, %r12, %tba
vahole_1_125:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfde00  ! 166: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_1_126:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xd2c04b60  ! 167: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r9
ibp_1_127:
	nop
	.word 0x9f803c0f  ! 168: SIR	sir	0x1c0f
donret_1_128:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_128-donret_1_128-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003aef2d | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3c5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_128:
	.word 0xd2ffe1f2  ! 169: SWAPA_I	swapa	%r9, [%r31 + 0x01f2] %asi
jmptr_1_129:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 170: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc32fc014  ! 171: STXFSR_R	st-sfr	%f1, [%r20, %r31]
vahole_1_131:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa7a409a7  ! 172: FDIVs	fdivs	%f16, %f7, %f19
	.word 0xe727e098  ! 173: STF_I	st	%f19, [0x0098, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
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
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_132:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 174: RDPC	rd	%pc, %r10
	.word 0x87802055  ! 175: WRASI_I	wr	%r0, 0x0055, %asi
donret_1_133:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_133-donret_1_133-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00485a62 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x22ccc001  ! 1: BRZ	brz,a,pt	%r19,<label_0xcc001>
	done
donretarg_1_133:
	.word 0x99a209cd  ! 176: FDIVd	fdivd	%f8, %f44, %f12
	.word 0x93500000  ! 177: RDPR_TPC	<illegal instruction>
br_badelay2_1_134:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f0, %f12, %f30
	.word 0x95b44312  ! 178: ALIGNADDRESS	alignaddr	%r17, %r18, %r10
	setx 0xba0ff0773aae87bc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_135:
	.word 0x39400001  ! 179: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbge skip_1_136
	.word 0x87ac4a51  ! 1: FCMPd	fcmpd	%fcc<n>, %f48, %f48
.align 128
skip_1_136:
	.word 0xc36fe07a  ! 180: PREFETCH_I	prefetch	[%r31 + 0x007a], #one_read
	.word 0x9b500000  ! 181: RDPR_TPC	<illegal instruction>
	.word 0xda8008a0  ! 182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x38800001  ! 183: BGU	bgu,a	<label_0x1>
intveclr_1_137:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf4da6d24be34f681, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 184: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 185: Tcc_R	tne	icc_or_xcc, %r0 + %r30
dvapa_1_138:
	nop
	ta T_CHANGE_HPRIV
	mov 0x909, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc032  ! 186: STDA_R	stda	%r13, [%r31 + %r18] 0x01
donret_1_139:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_139-donret_1_139-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001514b0 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x656, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_1_139:
	.word 0xdaffe1d0  ! 187: SWAPA_I	swapa	%r13, [%r31 + 0x01d0] %asi
	fblg skip_1_140
	ble  	 skip_1_140
.align 512
skip_1_140:
	.word 0xa7b244ca  ! 188: FCMPNE32	fcmpne32	%d40, %d10, %r19
memptr_1_141:
	set user_data_start, %r31
	.word 0x8581b0f4  ! 189: WRCCR_I	wr	%r6, 0x10f4, %ccr
dvapa_1_142:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9c2, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a84a4a  ! 190: FCMPd	fcmpd	%fcc<n>, %f32, %f10
dvapa_1_143:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcfb, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 191: CASA_R	casa	[%r31] %asi, %r11, %r19
fpinit_1_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82620  ! 192: PREFETCHA_I	prefetcha	[%r0, + 0x0620] %asi, #one_read
	.word 0xa66c000d  ! 193: UDIVX_R	udivx 	%r16, %r13, %r19
donret_1_145:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_145-donret_1_145-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00019ee1 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_1_145:
	.word 0xe6ffe0d4  ! 194: SWAPA_I	swapa	%r19, [%r31 + 0x00d4] %asi
	.word 0x91910007  ! 195: WRPR_PIL_R	wrpr	%r4, %r7, %pil
	.word 0x91908010  ! 196: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	.word 0xa7a2c9b1  ! 197: FDIVs	fdivs	%f11, %f17, %f19
	.word 0x9f802de6  ! 198: SIR	sir	0x0de6
	.word 0x3e780001  ! 199: BPVC	<illegal instruction>
	.word 0x87802055  ! 200: WRASI_I	wr	%r0, 0x0055, %asi
splash_hpstate_1_149:
	ta T_CHANGE_NONHPRIV
	.word 0x8198249f  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	.word 0xe697e148  ! 202: LDUHA_I	lduha	[%r31, + 0x0148] %asi, %r19
dvapa_1_150:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd24, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc02c  ! 203: LDDA_R	ldda	[%r31, %r12] 0x01, %r19
	.word 0xa7828010  ! 204: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r16, %-
brcommon2_1_152:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7b7c712  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f18, %d50
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdb60  ! 205: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa9454000  ! 206: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe897e120  ! 207: LDUHA_I	lduha	[%r31, + 0x0120] %asi, %r20
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
    brnz %r10, sma_1_153
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_153:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 208: CASA_R	casa	[%r31] %asi, %r11, %r20
vahole_1_154:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 209: STDFA_R	stda	%f16, [%r0, %r31]
splash_lsu_1_155:
	nop
	ta T_CHANGE_HPRIV
	set 0x0cd5618c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 210: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_156:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982896  ! 211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
fpinit_1_157:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 212: FDIVd	fdivd	%f0, %f4, %f6
splash_tba_1_158:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 213: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_159:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb4ab9829a0f1cbe3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_160:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d914003  ! 215: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xc1bfc2c0  ! 216: STDFA_R	stda	%f0, [%r0, %r31]
pmu_1_162:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeb1fffff604, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_163:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_163-donret_1_163-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0005823a | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe4d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_163:
	.word 0xa5a449cd  ! 218: FDIVd	fdivd	%f48, %f44, %f18
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 219: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa5464000  ! 220: RD_STICK_CMPR_REG	rd	%-, %r18
vahole_1_164:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe4bfc032  ! 221: STDA_R	stda	%r18, [%r31 + %r18] 0x01
ibp_1_165:
	nop
	.word 0xe49fc02b  ! 222: LDDA_R	ldda	[%r31, %r11] 0x01, %r18
dvapa_1_166:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcff, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe0a0  ! 223: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe44fe1c8  ! 224: LDSB_I	ldsb	[%r31 + 0x01c8], %r18
mondo_1_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d934002  ! 225: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0x9a828007  ! 226: ADDcc_R	addcc 	%r10, %r7, %r13
	.word 0xdadfc028  ! 227: LDXA_R	ldxa	[%r31, %r8] 0x01, %r13
vahole_1_169:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87ad0a52  ! 228: FCMPd	fcmpd	%fcc<n>, %f20, %f18
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_170
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_170:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 229: RDPC	rd	%pc, %r8
vahole_1_171:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd11fc008  ! 230: LDDF_R	ldd	[%r31, %r8], %f8
	.word 0x91934014  ! 231: WRPR_PIL_R	wrpr	%r13, %r20, %pil
pmu_1_173:
	nop
	setx 0xfffff084fffff77a, %g1, %g7
	.word 0xa3800007  ! 232: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc32fc014  ! 233: STXFSR_R	st-sfr	%f1, [%r20, %r31]
	.word 0xa568c013  ! 234: SDIVX_R	sdivx	%r3, %r19, %r18
splash_cmpr_1_175:
	nop
	setx 0xfa9740f3f931439b, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	sub %l1, 40, %g1
	.word 0x89900011  ! 235: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_176) + 8, 16, 16)) -> intp(4,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_176)&0xffffffff)  + 8, 16, 16)) -> intp(4,0,31)
#else
	setx 0xcecd09d67f6d6d91, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_176:
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_1_177:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe9b, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 237: STDFA_R	stda	%f16, [%r0, %r31]
vahole_1_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fde00  ! 238: LDDFA_R	ldda	[%r31, %r0], %f16
fpinit_1_179:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 239: FDIVd	fdivd	%f0, %f4, %f6
mondo_1_180:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d920011  ! 240: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
vahole_1_181:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fda00  ! 241: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_182) + 48, 16, 16)) -> intp(3,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_182)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,25)
#else
	setx 0x28d34a0877c21438, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_182:
	.word 0x39400001  ! 242: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe4800be0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
intveclr_1_183:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe5cc17aeaa50f654, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 244: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_1_184:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc011  ! 245: STXFSR_R	st-sfr	%f1, [%r17, %r31]
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
    brnz %r10, sma_1_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_185:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 246: CASA_R	casa	[%r31] %asi, %r9, %r18
fpinit_1_186:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 247: FCMPd	fcmpd	%fcc<n>, %f0, %f4
vahole_1_187:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe49fc02d  ! 248: LDDA_R	ldda	[%r31, %r13] 0x01, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_188:
	ta	T_CHANGE_NONPRIV	! macro
brcommon2_1_189:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a7c9ca  ! 1: FDIVd	fdivd	%f62, %f10, %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd920  ! 250: STDFA_R	stda	%f0, [%r0, %r31]
mondo_1_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940013  ! 251: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	setx 0xa95e423003ea0030, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_191:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_1_192:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe29fc029  ! 253: LDDA_R	ldda	[%r31, %r9] 0x01, %r17
ibp_1_193:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfde00  ! 254: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xab8362b6  ! 255: WR_CLEAR_SOFTINT_I	wr	%r13, 0x02b6, %clear_softint
splash_lsu_1_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xde1f3ae7, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 256: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_195
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_195:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 257: CASA_R	casa	[%r31] %asi, %r11, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_196) + 0, 16, 16)) -> intp(7,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_196)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,24)
#else
	setx 0xf4d48f6685c91882, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_1_197:
    nop
    rd %asi, %l3        ! save %asi
    ta T_CHANGE_HPRIV
    wr %g0, ASI_MMU_ZERO_CONTEXT_TSB_CONFIG, %asi
    mov 1, %l2
    sllx %l2, 63, %l2
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_ZERO_CONTEXT_TSB_CONFIG_3] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_0] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_1] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_2] %asi
    ldxa [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi, %l4
    xor %l4, %l2, %l4
    stxa %l4, [ASI_MMU_NONZERO_CONTEXT_TSB_CONFIG_3] %asi
    ta T_CHANGE_NONHPRIV
    wr %g0, %l3, %asi   !restore %asi
	.word 0xa7b4c993  ! 259: BSHUFFLE	fmovc32	%d50, %d50, %d50
	.word 0x9f80235c  ! 260: SIR	sir	0x035c
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
    brnz %r10, sma_1_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00a  ! 261: CASA_R	casa	[%r31] %asi, %r10, %r19
splash_tba_1_199:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 262: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_hpstate_1_200:
	ta T_CHANGE_NONHPRIV
	.word 0x81982807  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
mondo_1_201:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d92c002  ! 264: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
tagged_1_202:
	tsubcctv %r5, 0x1397, %r18
	.word 0xe607e0e4  ! 265: LDUW_I	lduw	[%r31 + 0x00e4], %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r19
mondo_1_203:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c011  ! 267: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
splash_cmpr_1_204:
	nop
	setx 0xe36024e67f15c4c8, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0xb1800011  ! 268: WR_STICK_REG_R	wr	%r0, %r17, %-
intveclr_1_205:
	nop
	ta T_CHANGE_HPRIV
	setx 0x70245bab58e915a3, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 269: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902327  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0327, %pstate
cwp_1_207:
    set user_data_start, %o7
	.word 0x93902001  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_208) + 16, 16, 16)) -> intp(6,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_208)&0xffffffff)  + 16, 16, 16)) -> intp(6,0,0)
#else
	setx 0xe6b19cd490c3ec8b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_208:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_1_209:
	nop
	.word 0xa9b287cb  ! 273: PDIST	pdistn	%d10, %d42, %d20
mondo_1_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d90c012  ! 274: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
ibp_1_211:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc2c0  ! 275: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_1_212:
	nop
	ta T_CHANGE_HPRIV
	set 0x689a0fef, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 277: Tcc_R	tne	icc_or_xcc, %r0 + %r30
trapasi_1_213:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe8c04a00  ! 278: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r20
pmu_1_214:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff570fffff31c, %g1, %g7
	.word 0xa3800007  ! 279: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc1bfe1e0  ! 280: STDFA_I	stda	%f0, [0x01e0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_216) + 40, 16, 16)) -> intp(7,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_216)&0xffffffff)  + 40, 16, 16)) -> intp(7,0,31)
#else
	setx 0x548b6834bd2e5277, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_216:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_217:
	nop
	ta T_CHANGE_HPRIV
	set 0xdeb37925, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 282: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_218:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d94c006  ! 283: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
vahole_1_219:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdf20  ! 284: STDFA_R	stda	%f0, [%r0, %r31]
mondo_1_220:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948001  ! 285: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	fbn skip_1_221
	.word 0x9bb284c3  ! 1: FCMPNE32	fcmpne32	%d10, %d34, %r13
.align 512
skip_1_221:
	.word 0x39400001  ! 286: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_222-donret_1_222-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0063e667 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd06, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_222:
	.word 0xe86fe0e5  ! 287: LDSTUB_I	ldstub	%r20, [%r31 + 0x00e5]
jmptr_1_223:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 288: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_1_224:
	nop
	setx 0x21c1ccba4a32eabd, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	sub %l1, 40, %g1
	.word 0x89900011  ! 289: WRPR_TICK_R	wrpr	%r0, %r17, %tick
splash_cmpr_1_225:
	nop
	setx 0x11c2d17a7cddfd90, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 290: WRPR_TICK_R	wrpr	%r0, %r17, %tick
pmu_1_226:
	nop
	setx 0xffffff03fffff312, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_227:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5acfffff529, %g1, %g7
	.word 0xa3800007  ! 292: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_228:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 293: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	.word 0x87802055  ! 294: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa7a00170  ! 295: FABSq	dis not found

donret_1_230:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_230-donret_1_230-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a7da4a | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa8e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_230:
	.word 0xe66fe064  ! 296: LDSTUB_I	ldstub	%r19, [%r31 + 0x0064]
vahole_1_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 297: STDFA_R	stda	%f16, [%r0, %r31]
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_232
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_232
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_232:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 298: RDPC	rd	%pc, %r13
trapasi_1_233:
	nop
	mov 0x3f0, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 299: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
dvapa_1_234:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa4d, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec4031  ! 300: PREFETCHA_R	prefetcha	[%r17, %r17] 0x01, #one_read
intveclr_1_235:
	nop
	ta T_CHANGE_HPRIV
	setx 0x43c4139f34e038a5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_236:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d910014  ! 302: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	setx 0xb4c8b35fd2d407f3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_237:
	.word 0x39400001  ! 303: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00174  ! 304: FABSq	dis not found

pmu_1_239:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd6ffffff823, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_240:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff19fffff58a, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_241:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 307: CASA_R	casa	[%r31] %asi, %r16, %r18
splash_tba_1_242:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 308: WRPR_TBA_R	wrpr	%r0, %r12, %tba
change_to_randtl_1_243:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_243:
	.word 0x8f902000  ! 309: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d802000  ! 310: WRFPRS_I	wr	%r0, 0x0000, %fprs
intveclr_1_244:
	nop
	ta T_CHANGE_HPRIV
	setx 0x54267970a1e4c0fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 311: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
vahole_1_245:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdc00  ! 312: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_1_246
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_246:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 313: CASA_R	casa	[%r31] %asi, %r12, %r18
dvapa_1_247:
	nop
	ta T_CHANGE_HPRIV
	mov 0xecd, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91a4c9d1  ! 314: FDIVd	fdivd	%f50, %f48, %f8
unsupttte_1_248:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x91a449b1  ! 315: FDIVs	fdivs	%f17, %f17, %f8
ibp_1_249:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xd0bfc02c  ! 316: STDA_R	stda	%r8, [%r31 + %r12] 0x01
	.word 0x3e800001  ! 317: BVC	bvc,a	<label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_250) + 8, 16, 16)) -> intp(4,0,0)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_250)&0xffffffff)  + 8, 16, 16)) -> intp(4,0,0)
#else
	setx 0x2b6de432d5037210, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_250:
	.word 0x39400001  ! 318: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_1_251:
	nop
	.word 0xd1e7e00c  ! 319: CASA_R	casa	[%r31] %asi, %r12, %r8
vahole_1_252:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfd960  ! 320: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0x6b0889d5af4dd969, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_253:
	.word 0x39400001  ! 321: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd0800c40  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
dvapa_1_254:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8be, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd09fc02d  ! 323: LDDA_R	ldda	[%r31, %r13] 0x01, %r8
	.word 0x8d802004  ! 324: WRFPRS_I	wr	%r0, 0x0004, %fprs
intveclr_1_255:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8cdc9f9f4097377a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 326: CASA_R	casa	[%r31] %asi, %r19, %r8
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_257
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_257
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_257:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 327: RDPC	rd	%pc, %r13
ibp_1_258:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1a0  ! 328: STDFA_I	stda	%f16, [0x01a0, %r31]
fpinit_1_259:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 329: FCMPd	fcmpd	%fcc<n>, %f0, %f4
vahole_1_260:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda97c034  ! 330: LDUHA_R	lduha	[%r31, %r20] 0x01, %r13
	.word 0xda8008a0  ! 331: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa8d2fa50  ! 332: UMULcc_I	umulcc 	%r11, 0xfffffa50, %r20
ibp_1_261:
	nop
	.word 0xc3eac022  ! 333: PREFETCHA_R	prefetcha	[%r11, %r2] 0x01, #one_read
mondo_1_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94400d  ! 334: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
mondo_1_263:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d940012  ! 335: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x93524000  ! 336: RDPR_CWP	<illegal instruction>
pmu_1_265:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8e8fffffb24, %g1, %g7
	.word 0xa3800007  ! 337: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
dvapa_1_266:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdca, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc010  ! 338: STDF_R	std	%f9, [%r16, %r31]
splash_lsu_1_267:
	nop
	ta T_CHANGE_HPRIV
	set 0x878e6dc2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_1_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 340: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 341: Tcc_R	te	icc_or_xcc, %r0 + %r30
donret_1_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_269-donret_1_269-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00350a43 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	done
donretarg_1_269:
	.word 0xa5a289d2  ! 342: FDIVd	fdivd	%f10, %f18, %f18
ibp_1_270:
	nop
	.word 0xe19fda00  ! 343: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802a91  ! 344: SIR	sir	0x0a91
splash_hpstate_1_271:
	.word 0x81982fd4  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd4, %hpstate
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_272
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_272:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 346: RDPC	rd	%pc, %r13
ibp_1_273:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x9f802a91  ! 347: SIR	sir	0x0a91
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_274) + 48, 16, 16)) -> intp(0,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_274)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,9)
#else
	setx 0x560fc6c2ed9b8f52, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_274:
	.word 0x39400001  ! 348: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_275:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1d7fffff92d, %g1, %g7
	.word 0xa3800007  ! 349: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_276:
	nop
	.word 0xdb3fc009  ! 350: STDF_R	std	%f13, [%r9, %r31]
pmu_1_277:
	nop
	setx 0xfffffad9fffffd18, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    set 0x3135, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b4c7d1  ! 352: PDIST	pdistn	%d50, %d48, %d50
dvapa_1_278:
	nop
	ta T_CHANGE_HPRIV
	mov 0x94d, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7702304  ! 353: POPC_I	popc	0x0304, %r19
	.word 0xe71fe1f0  ! 354: LDDF_I	ldd	[%r31, 0x01f0], %f19
pmu_1_279:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbb9fffff277, %g1, %g7
	.word 0xa3800007  ! 355: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_280) + 8, 16, 16)) -> intp(4,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_280)&0xffffffff)  + 8, 16, 16)) -> intp(4,0,11)
#else
	setx 0xcfe4a9d8b72512a4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_280:
	.word 0x39400001  ! 356: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe697e0b8  ! 357: LDUHA_I	lduha	[%r31, + 0x00b8] %asi, %r19
intveclr_1_281:
	nop
	ta T_CHANGE_HPRIV
	setx 0x000725d76b5cc6ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 358: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3c780001  ! 359: BPPOS	<illegal instruction>
pmu_1_282:
	nop
	setx 0xfffffbc1fffffdc4, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_283:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1d0e37246c14cd45, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    nop
    ta T_CHANGE_HPRIV
    mov 0x1+1, %r10
    set sync_thr_counter5, %r23
#ifndef SPC
    ldxa [%g0]0x63, %o1
    and %o1, 0x38, %o1
    add %o1, %r23, %r23
#endif
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_284
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_284
    set CWQ_BASE, %l6
    stxa    %l1,    [%g0 + ASI_SPU_CWQ_CSR] %asi
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_284:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 362: RDPC	rd	%pc, %r16
	.word 0xa5450000  ! 363: RD_SET_SOFTINT	rd	%set_softint, %r18
intveclr_1_285:
	nop
	ta T_CHANGE_HPRIV
	setx 0x364214c20f78843f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_1_286:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 365: FDIVs	fdivs	%f0, %f4, %f4
ibp_1_287:
	nop
	.word 0xa5a409c1  ! 366: FDIVd	fdivd	%f16, %f32, %f18
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
    brnz %r10, sma_1_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 367: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0x8d802000  ! 368: WRFPRS_I	wr	%r0, 0x0000, %fprs
	setx 0xce2de3aeea99f1b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_289:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_290
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_290:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 370: CASA_R	casa	[%r31] %asi, %r18, %r18
donret_1_291:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_291-donret_1_291-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cc242c | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x25f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_1_291:
	.word 0x97a489ca  ! 371: FDIVd	fdivd	%f18, %f10, %f42
	.word 0xab84b2e3  ! 372: WR_CLEAR_SOFTINT_I	wr	%r18, 0x12e3, %clear_softint
	.word 0xd6800aa0  ! 373: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r11
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
    brnz %r10, sma_1_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_292:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 374: CASA_R	casa	[%r31] %asi, %r9, %r11
br_longdelay2_1_293:
	.word 0x24c94001  ! 1: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
	.word 0xc36ff2e3  ! 375: PREFETCH_I	prefetch	[%r31 + 0xfffff2e3], #one_read
dvapa_1_294:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcdb, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc032  ! 376: LDXA_R	ldxa	[%r31, %r18] 0x01, %r11
splash_lsu_1_295:
	nop
	ta T_CHANGE_HPRIV
	set 0x88546b03, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_1_296:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0x97a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f42
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87acca41  ! 378: FCMPd	fcmpd	%fcc<n>, %f50, %f32
	.word 0x8d802004  ! 379: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_1_297:
	nop
	setx 0x3f826a8dba90f03d, %l2, %l1
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	ta T_CHANGE_NONPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 380: WRPR_TICK_R	wrpr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_298) + 16, 16, 16)) -> intp(6,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_298)&0xffffffff)  + 16, 16, 16)) -> intp(6,0,31)
#else
	setx 0xb02649c88eed381e, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_298:
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9193000d  ! 382: WRPR_PIL_R	wrpr	%r12, %r13, %pil
splash_cmpr_1_300:
	nop
	setx 0xa1d40de65e998c92, %l2, %l1
	ta T_CHANGE_HPRIV
	wrhpr %l1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %l1, 40, %g1
	.word 0x89900011  ! 383: WRPR_TICK_R	wrpr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_301:
	ta	T_CHANGE_NONPRIV	! macro
mondo_1_302:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 385: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0xd037e1fc  ! 386: STH_I	sth	%r8, [%r31 + 0x01fc]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 387: LDX_R	ldx	[%r31 + %r0], %r8
	setx 0x19993bb2b17d6791, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_303:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a0016b  ! 389: FABSq	dis not found

donret_1_305:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_305-donret_1_305-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008af0c0 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x286, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_305:
	.word 0xe8ffe02c  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x002c] %asi
	.word 0xe897e140  ! 391: LDUHA_I	lduha	[%r31, + 0x0140] %asi, %r20
	.word 0xe8d7e158  ! 392: LDSHA_I	ldsha	[%r31, + 0x0158] %asi, %r20
pmu_1_306:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff941fffff174, %g1, %g7
	.word 0xa3800007  ! 393: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_1_307:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe0a0  ! 394: STDFA_I	stda	%f0, [0x00a0, %r31]
trapasi_1_308:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5a) 
	.word 0xe8884b40  ! 395: LDUBA_R	lduba	[%r1, %r0] 0x5a, %r20
trapasi_1_309:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe8d04a00  ! 396: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r20
ibp_1_310:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 397: CASA_R	casa	[%r31] %asi, %r19, %r20
intveclr_1_311:
	nop
	ta T_CHANGE_HPRIV
	setx 0xebd13ee7bc2c86d9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_1_312:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 399: WRPR_TBA_R	wrpr	%r0, %r12, %tba
pmu_1_313:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff065fffff4fe, %g1, %g7
	.word 0xa3800007  ! 400: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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

	.xword	0x242d832d0f3c1231
	.xword	0xc26b78aa3a9d9a01
	.xword	0xfc5cfc9cb186acc2
	.xword	0xafdba8ff0def4739
	.xword	0xd8674e2168396c67
	.xword	0xca2da4833f508057
	.xword	0xa740603a6df9d040
	.xword	0xa6449f3a2fe41f82
	.xword	0x5e125e636e0221a0
	.xword	0xce9e9d981cde1380
	.xword	0x5fe070d5633a90ef
	.xword	0x5927805a5b300227
	.xword	0x63585c4645bf81a1
	.xword	0x39b377c80b936143
	.xword	0xa97cf91cd8fc78a0
	.xword	0x00d6f7e07c8badfa
	.xword	0xa80989457d11d9ad
	.xword	0x18f6ed21c5efda64
	.xword	0x0890e5a8a84c4dad
	.xword	0xec34b6b59f25578a
	.xword	0xfd4e1481cba6317a
	.xword	0x116e0e3351b2212a
	.xword	0x9ee600e09fe73016
	.xword	0x93335e6ddbe1dcbb
	.xword	0xc773e3858dff987d
	.xword	0xcc12b2c77a46385d
	.xword	0x6288264598873286
	.xword	0xe4f61897616d600e
	.xword	0x2a47e1e112b1327a
	.xword	0xbee6e491050cca1f
	.xword	0x58abb5d9d4cd0916
	.xword	0xefd45bfd51a56f36
	.xword	0xf451491a55f5ae99
	.xword	0xd0c4a0e11aed020c
	.xword	0xb5563abf8faac6e5
	.xword	0x54ef77045256f4e4
	.xword	0x7d2898631c942065
	.xword	0x46201e5fb596405d
	.xword	0x9f7438234b9dbbc6
	.xword	0x535d813da48743e1
	.xword	0xbce40828cc658689
	.xword	0x00d6c9f8b3748eb8
	.xword	0x3752f5599bb9be8a
	.xword	0xd835fc8a2f75f96f
	.xword	0x5e47ee62717bd8b2
	.xword	0xa9440e85aac10d96
	.xword	0x9e6e1efad753635d
	.xword	0xed555983f6cdc993
	.xword	0x8f5bf9789068a204
	.xword	0x626080ba00a0c416
	.xword	0xece76836732ccf39
	.xword	0x355804f329784dc1
	.xword	0x9626805d125440cf
	.xword	0xa1f1d1e64b94c2c5
	.xword	0xa001f75b185d5a3f
	.xword	0x302cc6c78614eedd
	.xword	0x4cc738a97bf554dd
	.xword	0x425e216f45676b88
	.xword	0x25be5895dee1e083
	.xword	0x2ad2bbde3470dc45
	.xword	0xcdd034e1516a3c51
	.xword	0x7d6a400bcb847580
	.xword	0x1f5652b691b525ab
	.xword	0x0ce76c935d860534
	.xword	0x39bbb1b2016430cf
	.xword	0x36fdecb45e65d5c9
	.xword	0xdc27a26ba6c0aaa3
	.xword	0x528a2b8af3ff4383
	.xword	0xee449f1d06f3980c
	.xword	0xbb30d21ab2946da1
	.xword	0x32dc55cdf5ada672
	.xword	0xff97eda5d6ea6772
	.xword	0xf830b08f8e869750
	.xword	0x56d0d578fa9f0fc4
	.xword	0xca053a07a7d54714
	.xword	0x262c64ca8f4ad727
	.xword	0x587cea28ab23260f
	.xword	0x22eea47865fef973
	.xword	0xe31b8cb4caea0405
	.xword	0x4099ab2d3be00b1d
	.xword	0x52bc29f8b75e5fe4
	.xword	0x4ddf2431d30974b8
	.xword	0x8cfa677c0a3fbbd9
	.xword	0xd39721822393e86a
	.xword	0x91eb7e4951dd60d5
	.xword	0x711d9aedfb59aee3
	.xword	0x09ab9b3de37511da
	.xword	0x9c4cf2095a1d55f7
	.xword	0xdfa0dd11375e00cb
	.xword	0xb1519a7abd8a93fd
	.xword	0xa68bf384ef162179
	.xword	0x77ce54b93945ea40
	.xword	0x656341022bc5aea0
	.xword	0xcb0151dba4970337
	.xword	0x34e2ff37ecea483f
	.xword	0x0bf0499ca7a7b66c
	.xword	0x8e0dd0100395125a
	.xword	0x0bb5ff8bce1cd4c3
	.xword	0x9d2c0915e4d5907d
	.xword	0x80ed567600a640b8
	.xword	0x35444d2b8e65c3da
	.xword	0xcbcf6e434d0714d8
	.xword	0x90a4cb8b6440d73d
	.xword	0xadcba1228bc5ab83
	.xword	0xa279ce21d8bac0f6
	.xword	0xf6ffa8f60904ef5a
	.xword	0xa1ddeea57c5b637f
	.xword	0x63d3fc36d9fe5544
	.xword	0xf2a8c6fa8bafb1d5
	.xword	0x4a3cbc45126dcc5f
	.xword	0xbaad567f91b4aa04
	.xword	0x08e1c5321f9427a0
	.xword	0x7c88ad4a3e8ad92b
	.xword	0xf863892b44463241
	.xword	0x60ddb30b0f2712f7
	.xword	0x60bb1df7f5d8c0a3
	.xword	0x2b442d53454a4823
	.xword	0x3ed2152f2c83242c
	.xword	0xc1da0f0243bec78e
	.xword	0x85a3bc98c53733c3
	.xword	0x9b68515146219ac4
	.xword	0x90292149ca915a12
	.xword	0x2ceef826ddf9a4ee
	.xword	0xe155701ff1a5bac4
	.xword	0xf2f9cea577385785
	.xword	0x8d06ae7b2e387ac7
	.xword	0x007c1f5a13ac35b6
	.xword	0x4c65cfc09db4d241
	.xword	0x63921a379d1a2ee0
	.xword	0xf7f96093c78e440d
	.xword	0x549f4a6bdfe945f1
	.xword	0x347204b68931c31b
	.xword	0x429ed4538a93512b
	.xword	0x03d1b7cd0a208793
	.xword	0xf6ad0f4424214e87
	.xword	0xb285a5b8df501a48
	.xword	0x978c3388a8da8b69
	.xword	0xf10d0ddceb08f806
	.xword	0x0983eb1a6f0171c1
	.xword	0xde5c42a4c21f6f19
	.xword	0xbca5c8f2fdd4a6aa
	.xword	0xc3f2cf704a91355b
	.xword	0xa435f275b0bc2c9f
	.xword	0xab64fbe50dc6884b
	.xword	0xc107528df1b25a13
	.xword	0x86b5f2f7a09d1f00
	.xword	0xe4a5e1047a6f69b3
	.xword	0x2d02bade6c5fc9bd
	.xword	0xdc63ed05edd81e37
	.xword	0x23332662cd325bbc
	.xword	0x04a8b69c5b3aeea5
	.xword	0x38821bd5e606f84f
	.xword	0xe5181877e23ea098
	.xword	0x8feb66375ac7dfb4
	.xword	0x004442dfa87f013b
	.xword	0x050d7e5035893813
	.xword	0x0fd9b18e1b0f62a3
	.xword	0xa0837b10b8547bc2
	.xword	0x3855164f613e80ed
	.xword	0x9ac858122ca1f345
	.xword	0x5abe27032996dd97
	.xword	0xfcd123c8e69c7d64
	.xword	0x85c2a855198dd476
	.xword	0xd028f61ea93434fa
	.xword	0xaaa480b17bd49644
	.xword	0xd355f8b258ed9c92
	.xword	0x1984ed40e4186173
	.xword	0x733781b8c7272f11
	.xword	0x1b2417b3df76df06
	.xword	0x78e1cf13de2a73f1
	.xword	0xd0d33c76e9bbc785
	.xword	0x1c667e7ecc0067c0
	.xword	0x5b2324196181bfb6
	.xword	0xcee77981b22a97de
	.xword	0xbeb029037fdc47fa
	.xword	0x32e2a502d93d34fd
	.xword	0xd644ca7a094b88e3
	.xword	0xd2fcbc616dd5781a
	.xword	0x855df0dcdf998536
	.xword	0x8371ca162440f2ed
	.xword	0x6196c5fa1ba3a822
	.xword	0x399c2bc8327c16b0
	.xword	0xaeecbeac2bacdca3
	.xword	0x9ee8363383f8ff06
	.xword	0x8bff25235d469e84
	.xword	0xfe59e601a06ea5e9
	.xword	0xf9a96dc153940bfc
	.xword	0x0a6d515e37e4b695
	.xword	0xacd74b8ce394dd3a
	.xword	0x3c4bbb50d6b3688d
	.xword	0x17fca77ecb127ded
	.xword	0xfc399b1b0201cf1d
	.xword	0x217d0eaf0c9ebd6b
	.xword	0x64c6c6a078a9fd6d
	.xword	0xc989b34237f6d111
	.xword	0xf4d2f93bba95731a
	.xword	0x2aaff6b61b023a5e
	.xword	0xa52be5454f693f76
	.xword	0x191e913dee9611e9
	.xword	0x4c19517d547d6c1c
	.xword	0x0f6ccad40eed070f
	.xword	0x29f7454a2b0d41de
	.xword	0x41509ce2cbaa96e7
	.xword	0xeb8f25f2dca6c271
	.xword	0xae5aa572f6860bd4
	.xword	0x1d45aba19ff0fa4d
	.xword	0xfa4d2d7b8284e0b8
	.xword	0x8730b2b47d7a9fb1
	.xword	0x9cd1f311a3e63e57
	.xword	0x7aa0ad29f2a94700
	.xword	0xaf2a24d4c994c736
	.xword	0x2ce0414c5fc20b0a
	.xword	0xf151cb3640062a01
	.xword	0x91eae1bf352ed44e
	.xword	0xbf8aedfce8ba8dff
	.xword	0xcfb15a8fd3ba822d
	.xword	0x39c857f40754cd73
	.xword	0x3f8cfacea2c0f5d6
	.xword	0xc09b5cc6f6beb282
	.xword	0x393697c23f777211
	.xword	0x312346993ce6bfcf
	.xword	0x4fa5dcddee0fcdd5
	.xword	0x0766547ea17c8523
	.xword	0x3f11e54b54e3c912
	.xword	0x1848d8678bdf1bc7
	.xword	0x3cb522dbc5c7c83b
	.xword	0x7579bb6aa8a75298
	.xword	0x844bbd74a5190100
	.xword	0xf409e01ce33f098d
	.xword	0x90d7a613ace5676b
	.xword	0x71f23026371bde0f
	.xword	0x638c3d3ad3b81b03
	.xword	0xa51ad02783ec8bba
	.xword	0x81c657c04ecb1673
	.xword	0xb89c351697ebf130
	.xword	0x2487ad6f948360d4
	.xword	0x4e24bfd915830fa7
	.xword	0xe3ba99caa3a6b33a
	.xword	0xd36784d74e043a8e
	.xword	0x70a9caf28bb1fccc
	.xword	0x0faafae094119172
	.xword	0x2861da63c5e91e45
	.xword	0x26b397d7b163c9da
	.xword	0xefa8694a07d53feb
	.xword	0x743cb67450cc8a18
	.xword	0x03e0eb566a216690
	.xword	0x204f492880bd7ed0
	.xword	0x1ee9d61aab82e492
	.xword	0xaeaf32b5f6de2344
	.xword	0xbca9fc0cd4c5666e
	.xword	0x87bc7999408e8e4d
	.xword	0x15c3d21b20a28099
	.xword	0xec776adaccffc241
	.xword	0x3c63632d49983ab7
	.xword	0xdd1ffbdab045f338
	.xword	0xea81e604892cb89b

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
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext
.global retry_with_base_tba
.global resolve_bad_tte

SECTION .HTRAPS
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
# 85 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
! Red mode other reset handler
! Get htba, and tt and make trap address
! Jump to trap handler ..

SECTION .RED_SEC
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
# 925 "diag.j"
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
	TTE_CP	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	.xword	0xf86d0317bddb635d
	.xword	0x5094f9c74a6e9f84
	.xword	0xd8a88f2789345f85
	.xword	0xf14f61dadc44c098
	.xword	0x587c5ed02e9cffbf
	.xword	0x60b6ec24a8456402
	.xword	0x870ee9b7151780b9
	.xword	0x7515ce34c7387358
	.xword	0x40664fd9d4b29d4e
	.xword	0xdcfc5ac1f0fc6839
	.xword	0x38caf6f4c38c7e30
	.xword	0x275cbd4b6048614e
	.xword	0xd6c534e4d89eceac
	.xword	0x11f008b172f6b04c
	.xword	0x0b8a0de73340e9f6
	.xword	0x081d99ba89ba46c7
	.xword	0x9495540080ee76f9
	.xword	0x475e3b486a90c287
	.xword	0x924a2953ab44c82e
	.xword	0xae73c7a04e286518
	.xword	0x664969df7d639612
	.xword	0x7bf0f67515374eb4
	.xword	0x835c4ffe266d49c4
	.xword	0x90d516a9173b4cda
	.xword	0x510340040920cc37
	.xword	0x7478c2fbabbcfb66
	.xword	0x1f9b3163f9c254c0
	.xword	0x128496a0377508ae
	.xword	0x126d2b422c7f898a
	.xword	0x83fe45471a62fdeb
	.xword	0xf5d5d6c6cfe38813
	.xword	0xb1259e045a856568



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
	TTE_Size	 = 5,
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
	.xword	0xb4da7341051ef967
	.xword	0xd09a4cb6e9723ec3
	.xword	0x41409d7226511d89
	.xword	0x836d2ab96f227457
	.xword	0x8909fd1a528a6674
	.xword	0xe3d5857fa694b667
	.xword	0xf2531ce71bc29bd7
	.xword	0x3ade7d3aa734b9e6
	.xword	0xf09889fb56b5808c
	.xword	0x78d270c4daa2eca8
	.xword	0x745b4a7ba3dd42d1
	.xword	0x54571ef03f510445
	.xword	0x01be6bcf0cd7d0cd
	.xword	0x1aecc4f670ab4010
	.xword	0x5d7f588a68efaef7
	.xword	0x2d07d68cc4f9d36f
	.xword	0xc0cda0d1f9d25d40
	.xword	0x5c4a9e8c53bf2f4f
	.xword	0xc834483f958b416d
	.xword	0x4d8a901f31b483d9
	.xword	0x75232d218a65a28a
	.xword	0x2c432404147fe03c
	.xword	0x768b87547c8e33f4
	.xword	0xf791f7d174dbfd4b
	.xword	0x8a11d7ab35d51e0d
	.xword	0x0519edbfa18815af
	.xword	0x25e39298a23a2702
	.xword	0xa679cc46109a3df1
	.xword	0x876aba9895cd2331
	.xword	0xd49865b6932a6d0d
	.xword	0x606640ce21034864
	.xword	0xac5fd628e8e1e19b



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
	TTE_Size	 = 0,
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
	.xword	0x395bbec7a91e0660
	.xword	0x68f68df60d06ef89
	.xword	0x142f3d20d55cfc52
	.xword	0xd6af92592657f5cb
	.xword	0x1c4eaba5ccc2b55b
	.xword	0xb1d737544ae92ce1
	.xword	0x6f88ffefddfedf2a
	.xword	0x902e83a0dece5481
	.xword	0xc4243d16907a51d7
	.xword	0x34beb038288139b8
	.xword	0x627e7f64ce8475f5
	.xword	0xb830ca1d6a93605d
	.xword	0xb122a145cca59d91
	.xword	0x31eedd568946d3f6
	.xword	0x6d06c0d2ea2ff5f8
	.xword	0x62a0abbb427f2ce6
	.xword	0x0f33e2685f1c2914
	.xword	0xe2d35a7a9073f19e
	.xword	0x82bd3c98353fe56f
	.xword	0x7abf731b2b477f04
	.xword	0xd765b8adcada1e44
	.xword	0xaf18d4ff035ae8ac
	.xword	0xc67cf5bd32cf85d0
	.xword	0xeec78cf619052566
	.xword	0xbd9fc4cd02ef498f
	.xword	0xf6007e01e3f45801
	.xword	0x1d1a03ecba6b9d20
	.xword	0x766690a39d2ebf3a
	.xword	0xbec08804e079bb85
	.xword	0xd8ebb73807a4a1e6
	.xword	0x957e937d06674de6
	.xword	0x73322a0ea168cfa6



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
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
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
	.xword	0xb46005bd0bf9a45a
	.xword	0x39eec0fd8374226c
	.xword	0x6daea9592ed865ad
	.xword	0xf9a784a2942efeaa
	.xword	0x828d6debdbaeda20
	.xword	0x8006e98ae899b9ff
	.xword	0x895a27318cbc887c
	.xword	0x910ff0b0ade2a572
	.xword	0x2eef19c0d265cc7d
	.xword	0xacda7f40d822aa21
	.xword	0xf35ad28dfc637648
	.xword	0xf18b636078685c26
	.xword	0xeabfdcac220af003
	.xword	0x9e8f2040e3b76df9
	.xword	0x27afbbc28e75fb53
	.xword	0xfe244c883a9e4768
	.xword	0xcff4291d0ccd3e7d
	.xword	0xa008bc4fbc992536
	.xword	0x2fa0870539554189
	.xword	0x60c6dade50a4250d
	.xword	0x60d19ce5c4b98919
	.xword	0xa345e2efa63a14e8
	.xword	0x986d3930edb04023
	.xword	0xb2d965b7f6b30b9a
	.xword	0x8a49b32b4d763404
	.xword	0x90012e1364b6ead9
	.xword	0x74525a0fc5dcaec0
	.xword	0x1a02e24b05bd73c4
	.xword	0xe6420dc74e54d132
	.xword	0x7b5be5cbf435e061
	.xword	0x31314c14b1167aff
	.xword	0x4d1a5d565f59907a





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
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 1
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f8
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
	TTE_W	 = 1
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
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f4
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
	TTE_Size	 = 1,
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
	TTE_W	 = 1
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0,
	TTE_X	 = 1,
	tsbonly
}

.text
	nop



SECTION .MASKEDHOLE TEXT_VA = 0x0000000100000000
attr_text {
    Name     = .MASKEDHOLE,
    RA   = 0x0000000000000000,
    PA   = ra2pa(0x0000000000000000,0),
    part_0_ctx_zero_tsb_config_3,
    part_0_ctx_nonzero_tsb_config_3,
    TTE_G    = 1, TTE_Context    = 0x44, TTE_V   = 1, TTE_Size   = 1, 
    TTE_NFO  = 0, TTE_IE     = 1, TTE_Soft2  = 0, TTE_Diag   = 0, 
    TTE_Soft   = 0, TTE_L    = 0, TTE_CP     = 1, TTE_CV     = 0, 
    TTE_E  = 0, TTE_P  = 0, TTE_W  = 1, TTE_X    = 1
    tsbonly
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



#if 0
#endif

