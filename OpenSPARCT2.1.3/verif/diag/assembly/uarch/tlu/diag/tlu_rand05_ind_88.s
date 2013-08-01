/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_88.s
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
# 466 "diag.j"
#define H_HT0_Instruction_Access_MMU_Error_0x71 inst_access_mmu_error_handler
#define H_HT0_Instruction_access_error_0x0a inst_access_error_handler
#define H_HT0_Internal_Processor_Error_0x29 int_proc_err_handler
#define H_HT0_Data_Access_MMU_Error_0x72 data_access_mmu_error_handler
#define H_HT0_Data_access_error_0x32 data_access_error_handler
#define H_HT0_Hw_Corrected_Error_0x63 hw_corrected_error_handler
#define H_HT0_Sw_Recoverable_Error_0x40 sw_recoverable_error_handler
#define H_HT0_Store_Error_0x07 store_error_handler

#define DAE_SKIP_IF_SOCU_ERROR
# 5 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 198 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 227 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 339 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 707 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 722 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 748 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 764 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 780 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done;
# 786 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
# 792 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    done;
# 802 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 59 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    INT_HANDLER_RAND4_1 ;\
    retry;

!!!!! Queue interrupt handler
# 72 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 172 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 175 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 220 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 223 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 713 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 480 "diag.j"
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
# 547 "diag.j"
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
	mov 0xb1, %r14
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
	mov 0x35, %r14
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
	mov 0x33, %r14
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
	mov 0x33, %r14
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
	mov 0xb1, %r14
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
	mov 0x33, %r14
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
	.word 0xc36ae483  ! 1: PREFETCH_I	prefetch	[%r11 + 0x0483], #one_read
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
br_longdelay1_80_0:
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	brlez,pt  	%r4, skip_80_1
	fbn,a,pn	%fcc0,  skip_80_1
.align 1024
skip_80_1:
	.word 0xe63fc000  ! 2: STD_R	std	%r19, [%r31 + %r0]
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 3: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_3:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_80_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa781c003  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r3, %-
	.word 0x87a9cad3  ! 6: FCMPEd	fcmped	%fcc<n>, %f38, %f50
vahole_80_5:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe7e7e008  ! 7: CASA_R	casa	[%r31] %asi, %r8, %r19
memptr_80_6:
	set user_data_start, %r31
	.word 0x858469a4  ! 8: WRCCR_I	wr	%r17, 0x09a4, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_80_7:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x93410000  ! 10: RDTICK	rd	%tick, %r9
splash_lsu_80_8:
	nop
	ta T_CHANGE_HPRIV
	set 0x0122d3c9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_80_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1e0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa5a4c9a9  ! 12: FDIVs	fdivs	%f19, %f9, %f18
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_80_10:
	nop
	setx 0xfffff4adfffff15b, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_80_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff777fffff177, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_80_12:
	nop
	.word 0xe1bfe080  ! 17: STDFA_I	stda	%f16, [0x0080, %r31]
ibp_80_13:
	nop
	.word 0xc1bfdf20  ! 18: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd65fe1a0  ! 19: LDX_I	ldx	[%r31 + 0x01a0], %r11
	.word 0xd727e175  ! 20: STF_I	st	%f11, [0x0175, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_14) + 8, 16, 16)) -> intp(2,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_14)&0xffffffff)  + 8, 16, 16)) -> intp(2,0,27)
#else
	setx 0x588eae60029e8a94, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_15-donret_80_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ba549d | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d06, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_15:
	.word 0xd6ffe014  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x0014] %asi
    set 0x346b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b147c9  ! 24: PDIST	pdistn	%d36, %d40, %d20
	.word 0xc1bfde00  ! 25: STDFA_R	stda	%f0, [%r0, %r31]
pmu_80_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe0dfffff203, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_80_17:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd09fc033  ! 27: LDDA_R	ldda	[%r31, %r19] 0x01, %r8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_18)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_18)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_18:
	.word 0xa9832e1c  ! 28: WR_SET_SOFTINT_I	wr	%r12, 0x0e1c, %set_softint
	.word 0x95a0016c  ! 29: FABSq	dis not found

donret_80_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_20-donret_80_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00727e4d | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f9e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_80_20:
	.word 0xe2ffe044  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x0044] %asi
splash_decr_80_21:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7844004  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r4, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_22) + 48, 16, 16)) -> intp(4,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_22)&0xffffffff)  + 48, 16, 16)) -> intp(4,0,31)
#else
	setx 0x7e4feb95e345bbe5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_80_23:
	set 0x60340000, %r31
	.word 0x8582feba  ! 33: WRCCR_I	wr	%r11, 0x1eba, %ccr
unsupttte_80_24:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3b1c483  ! 34: FCMPLE32	fcmple32	%d38, %d34, %r17
brcommon3_80_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02a  ! 1: CASA_I	casa	[%r31] 0x 1, %r10, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd2dfc02c  ! 35: LDXA_R	ldxa	[%r31, %r12] 0x01, %r9
jmptr_80_26:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_80_27:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_80_28:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 38: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_80_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904012  ! 39: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
brcommon3_80_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe120  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0120]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd31fe190  ! 40: LDDF_I	ldd	[%r31, 0x0190], %f9
	.word 0xd2dfe010  ! 41: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0xd327e0c5  ! 42: STF_I	st	%f9, [0x00c5, %r31]
	setx 0xb2bdae1c5098a388, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d928008  ! 44: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
ceter_80_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 45: RDTICK	rd	%tick, %r20
	.word 0x9194400b  ! 46: WRPR_PIL_R	wrpr	%r17, %r11, %pil
splash_tba_80_35:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_80_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d908007  ! 48: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0xe31fc00b  ! 1: LDDF_R	ldd	[%r31, %r11], %f17
	.word 0x9f803207  ! 49: SIR	sir	0x1207
br_longdelay2_80_37:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x87afca53  ! 50: FCMPd	fcmpd	%fcc<n>, %f62, %f50
splash_cmpr_80_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 51: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_80_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 52: CASA_R	casa	[%r31] %asi, %r16, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_40)+56, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_40)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_40:
	.word 0xa985374b  ! 53: WR_SET_SOFTINT_I	wr	%r20, 0x174b, %set_softint
jmptr_80_41:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_80_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_42-donret_80_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d10aab | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c85, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_42:
	.word 0xe26fe18c  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x018c]
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
    brnz %r10, cwq_80_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_43
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
cwq_80_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 56: RDPC	rd	%pc, %r17
splash_hpstate_80_44:
	.word 0x81982d07  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d9023b5  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x03b5, %pstate
mondo_80_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d940010  ! 59: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
mondo_80_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d918012  ! 60: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
splash_hpstate_80_48:
	ta T_CHANGE_NONHPRIV
	.word 0x819836fe  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16fe, %hpstate
	.word 0xd31fe078  ! 62: LDDF_I	ldd	[%r31, 0x0078], %f9
vahole_80_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fe060  ! 63: LDDFA_I	ldda	[%r31, 0x0060], %f16
brcommon1_80_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7703900  ! 64: POPC_I	popc	0x1900, %r19
splash_hpstate_80_51:
	ta T_CHANGE_NONHPRIV
	.word 0x81982fc5  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc5, %hpstate
	.word 0x8d903c42  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1c42, %pstate
iaw_80_53:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait80_53:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_53
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_53:
    brnz %r16, iaw_wait80_53
    ld [%r23], %r16
    ba iaw_startwait80_53
    mov 0x80, %r16
continue_iaw_80_53:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_53:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_53
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_53:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_53
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_53:
	mov 0x38, %r18
iaw3_80_53:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe020  ! 67: STDFA_I	stda	%f16, [0x0020, %r31]
br_badelay1_80_54:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0xd337e0f0  ! 1: STQF_I	-	%f9, [0x00f0, %r31]
	.word 0x93b7c4cc  ! 1: FCMPNE32	fcmpne32	%d62, %d12, %r9
	normalw
	.word 0x99458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd82fe059  ! 69: STB_I	stb	%r12, [%r31 + 0x0059]
donret_80_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_55-donret_80_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003096e7 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_80_55:
	.word 0xa9a409d3  ! 70: FDIVd	fdivd	%f16, %f50, %f20
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
    brnz %r10, sma_80_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 71: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe19fe040  ! 72: LDDFA_I	ldda	[%r31, 0x0040], %f16
mondo_80_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d910014  ! 73: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_80_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 76: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa553c000  ! 79: RDPR_FQ	<illegal instruction>
donret_80_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_59-donret_80_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000145a1 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4aa, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_59:
	.word 0x97a489d2  ! 80: FDIVd	fdivd	%f18, %f18, %f42
	.word 0xda8fe1d0  ! 81: LDUBA_I	lduba	[%r31, + 0x01d0] %asi, %r13
	.word 0xe19fdc00  ! 82: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_80_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_80_61:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 84: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_80_62:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d944004  ! 86: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_64)+16, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_64)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_64:
	.word 0xa9826b22  ! 87: WR_SET_SOFTINT_I	wr	%r9, 0x0b22, %set_softint
	.word 0xdb37e181  ! 88: STQF_I	-	%f13, [0x0181, %r31]
mondo_80_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d95000a  ! 89: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_80_66:
	set user_data_start, %r31
	.word 0x8580f087  ! 91: WRCCR_I	wr	%r3, 0x1087, %ccr
jmptr_80_67:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 94: Tcc_R	te	icc_or_xcc, %r0 + %r30
vahole_80_69:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda3fe100  ! 95: STD_I	std	%r13, [%r31 + 0x0100]
pmu_80_70:
	nop
	setx 0xfffffeaafffffd5c, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_71:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_80_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_80_73:
	.word 0x81982614  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
donret_80_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_74-donret_80_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0046a92b | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x495, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	retry
donretarg_80_74:
	.word 0xda6fe0af  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x00af]
change_to_randtl_80_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_75:
	.word 0x8f902001  ! 101: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
unsupttte_80_76:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba289d0  ! 102: FDIVd	fdivd	%f10, %f16, %f44
	.word 0x8d9021a2  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x01a2, %pstate
intveclr_80_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9d75e530629b4a72, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_80_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_79-donret_80_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0006209b | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x545, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_79:
	.word 0xa5a449d0  ! 105: FDIVd	fdivd	%f48, %f16, %f18
	.word 0xe4d7e0f8  ! 106: LDSHA_I	ldsha	[%r31, + 0x00f8] %asi, %r18
tagged_80_80:
	tsubcctv %r4, 0x1b77, %r4
	.word 0xe407e1f8  ! 107: LDUW_I	lduw	[%r31 + 0x01f8], %r18
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
    brnz %r10, cwq_80_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_81
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
cwq_80_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 108: RDPC	rd	%pc, %r17
splash_lsu_80_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x612cf5e8, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 110: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_80_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_80_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d910004  ! 112: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
	.word 0xc1bfde00  ! 113: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fd960  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_80_86:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 115: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_87)+24, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_87)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_87:
	.word 0xa980ea7d  ! 116: WR_SET_SOFTINT_I	wr	%r3, 0x0a7d, %set_softint
brcommon3_80_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c00a  ! 1: STQF_R	-	%f8, [%r10, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd13fc010  ! 117: STDF_R	std	%f8, [%r16, %r31]
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d90392d  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x192d, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_91)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_91)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_91:
	.word 0xa984381f  ! 120: WR_SET_SOFTINT_I	wr	%r16, 0x181f, %set_softint
splash_cmpr_80_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 121: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x95a00166  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_80_95:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 124: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfdb60  ! 125: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_80_96:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xc32cde87bd2830c9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff61fffffb59, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_80_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_99-donret_80_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00650d44 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbcd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_99:
	.word 0xa5a249d4  ! 129: FDIVd	fdivd	%f40, %f20, %f18
pmu_80_100:
	nop
	setx 0xfffff999fffff35a, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d940012  ! 131: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
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
    brnz %r10, sma_80_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 132: CASA_R	casa	[%r31] %asi, %r9, %r12
	.word 0xc1bfc2c0  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_80_103:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_80_104:
	nop
	ta T_CHANGE_HPRIV
	set 0x5802856a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x7d678359671c7b48, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_80_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_106:
	.word 0x8f902001  ! 137: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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
    brnz %r10, cwq_80_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_107
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
cwq_80_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 138: RDPC	rd	%pc, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_108)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_108)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_108:
	.word 0xa984bbae  ! 139: WR_SET_SOFTINT_I	wr	%r18, 0x1bae, %set_softint
br_badelay1_80_109:
	.word 0x87afca48  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f8
	.word 0xe731b970  ! 1: STQF_I	-	%f19, [0x1970, %r6]
	.word 0xda3fc00d  ! 1: STD_R	std	%r13, [%r31 + %r13]
	normalw
	.word 0x93458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_110:
	ta	T_CHANGE_NONHPRIV	! macro
vahole_80_111:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa5a349ad  ! 142: FDIVs	fdivs	%f13, %f13, %f18
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
    brnz %r10, cwq_80_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_112
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
cwq_80_112:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 143: RDPC	rd	%pc, %r9
	.word 0xd91fe088  ! 144: LDDF_I	ldd	[%r31, 0x0088], %f12
	setx 0xf30a0bd50a2d20db, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x96d40011  ! 146: UMULcc_R	umulcc 	%r16, %r17, %r11
splash_cmpr_80_114:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 147: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_80_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 148: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
change_to_randtl_80_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_116:
	.word 0x8f902000  ! 149: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_80_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_117:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_118) + 32, 16, 16)) -> intp(6,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_118)&0xffffffff)  + 32, 16, 16)) -> intp(6,0,15)
#else
	setx 0x4812c57ba3cffbb8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_80_119:
	set 0x60140000, %r31
	.word 0x85807501  ! 152: WRCCR_I	wr	%r1, 0x1501, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d903c90  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1c90, %pstate
mondo_80_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 155: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0x8d903180  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x1180, %pstate
	.word 0x91d020b2  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 178
	setx 0x4a408fd538d922c0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc368c006  ! 159: PREFETCH_R	prefetch	[%r3 + %r6], #one_read
fpinit_80_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 160: FDIVs	fdivs	%f0, %f4, %f4
splash_hpstate_80_125:
	ta T_CHANGE_NONHPRIV
	.word 0x2cca8001  ! 1: BRGZ	brgz,a,pt	%r10,<label_0xa8001>
	.word 0x81983cdb  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cdb, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_80_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 163: CASA_R	casa	[%r31] %asi, %r8, %r16
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
    brnz %r10, sma_80_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 164: CASA_R	casa	[%r31] %asi, %r9, %r16
pmu_80_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff885fffff1c4, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 166: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_80_130:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 167: RDTICK	rd	%tick, %r16
jmptr_80_131:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa96b4003  ! 169: SDIVX_R	sdivx	%r13, %r3, %r20
splash_cmpr_80_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 170: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_80_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_133
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
cwq_80_133:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 172: RDPC	rd	%pc, %r10
jmptr_80_134:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd160  ! 174: LDDA_R	ldda	[%r31, %r0] 0x8b, %r16
	setx 0xfc680b7c027cd3b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_136:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 176: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e010  ! 177: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
splash_cmpr_80_137:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_80_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944009  ! 179: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
change_to_randtl_80_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_139:
	.word 0x8f902000  ! 180: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
jmptr_80_140:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91950001  ! 182: WRPR_PIL_R	wrpr	%r20, %r1, %pil
donret_80_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_142-donret_80_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d66ed1 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x596, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_142:
	.word 0x93a349d0  ! 183: FDIVd	fdivd	%f44, %f16, %f40
	.word 0xe6c7e030  ! 184: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0xc1bfdb60  ! 185: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe6cfe020  ! 186: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r19
splash_cmpr_80_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 187: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x90848012  ! 188: ADDcc_R	addcc 	%r18, %r18, %r8
ibp_80_144:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe160  ! 189: STDFA_I	stda	%f16, [0x0160, %r31]
ceter_80_145:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 190: RDTICK	rd	%tick, %r13
ceter_80_146:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 191: RDTICK	rd	%tick, %r12
	setx 0x505310280c971a5b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_80_148:
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
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0x97a00164  ! 194: FABSq	dis not found

	.word 0xe6c7e140  ! 195: LDSWA_I	ldswa	[%r31, + 0x0140] %asi, %r19
splash_lsu_80_150:
	nop
	ta T_CHANGE_HPRIV
	set 0xfc7381a8, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe040  ! 198: LDX_I	ldx	[%r31 + 0x0040], %r19
splash_hpstate_80_152:
	ta T_CHANGE_NONHPRIV
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x819836ac  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16ac, %hpstate
	.word 0x9353c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0xd23fe1a0  ! 1: STD_I	std	%r9, [%r31 + 0x01a0]
	.word 0x9f802e0d  ! 201: SIR	sir	0x0e0d
mondo_80_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d92c00b  ! 202: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
jmptr_80_154:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	brlez,a,pt	%r8, skip_80_155
	.word 0xa3b4c4d1  ! 1: FCMPNE32	fcmpne32	%d50, %d48, %r17
.align 2048
skip_80_155:
	.word 0x95a309c1  ! 204: FDIVd	fdivd	%f12, %f32, %f10
pmu_80_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff399fffff554, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x1af026848cb70185, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e15e  ! 207: STX_I	stx	%r19, [%r31 + 0x015e]
brcommon2_80_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe5110004  ! 1: LDQF_R	-	[%r4, %r4], %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfda00  ! 208: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa2fc0011  ! 209: SDIVcc_R	sdivcc 	%r16, %r17, %r17
	.word 0xd897e068  ! 210: LDUHA_I	lduha	[%r31, + 0x0068] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_80_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_159:
	.word 0x8f902001  ! 212: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_80_160:
	tsubcctv %r12, 0x1b67, %r18
	.word 0xd807e136  ! 213: LDUW_I	lduw	[%r31 + 0x0136], %r12
br_badelay1_80_161:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0xd937c008  ! 1: STQF_R	-	%f12, [%r8, %r31]
	.word 0xd83fc00d  ! 1: STD_R	std	%r12, [%r31 + %r13]
	normalw
	.word 0x97458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r11
pmu_80_162:
	nop
	setx 0xfffff2e7fffff35d, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_80_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff828fffffdb1, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc1bfd960  ! 219: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfda00  ! 220: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe1bfe1a0  ! 221: STDFA_I	stda	%f16, [0x01a0, %r31]
	setx 0x6354422c1f04248f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_80_166:
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 223: RESTORE_R	restore	%r31, %r0, %r31
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
    brnz %r10, sma_80_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 224: CASA_R	casa	[%r31] %asi, %r10, %r16
jmptr_80_168:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x7a448ee32ff63e2d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c012  ! 227: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
splash_cmpr_80_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 228: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_80_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc30fffff793, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xaa210a65, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d95000b  ! 231: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
memptr_80_175:
	set 0x60740000, %r31
	.word 0x8584394b  ! 232: WRCCR_I	wr	%r16, 0x194b, %ccr
mondo_80_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d940005  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_177)+16, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_177)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_177:
	.word 0xa9842909  ! 234: WR_SET_SOFTINT_I	wr	%r16, 0x0909, %set_softint
splash_lsu_80_178:
	nop
	ta T_CHANGE_HPRIV
	set 0x64460993, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_179:
	nop
	setx 0xfffff10cfffffcb7, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_180:
	nop
	ta T_CHANGE_HPRIV
	set 0x8bfa2101, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 238: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e038  ! 239: LDSH_I	ldsh	[%r31 + 0x0038], %r16
donret_80_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_182-donret_80_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00285b06 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4f4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_182:
	.word 0xe0ffe0f5  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x00f5] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe060  ! 242: STDFA_I	stda	%f0, [0x0060, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_184)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_184)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_184:
	.word 0xa9836751  ! 243: WR_SET_SOFTINT_I	wr	%r13, 0x0751, %set_softint
unsupttte_80_185:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa7b4c492  ! 244: FCMPLE32	fcmple32	%d50, %d18, %r19
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_80_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_186
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
cwq_80_186:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 246: RDPC	rd	%pc, %r13
	setx 0xb1a4ed3671e52fdd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_188:
	nop
	setx 0xfffff60afffff9a8, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_189:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 249: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_80_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_190-donret_80_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006f798a | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x105d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_190:
	.word 0x99a349d4  ! 250: FDIVd	fdivd	%f44, %f20, %f12
memptr_80_191:
	set 0x60340000, %r31
	.word 0x85842357  ! 251: WRCCR_I	wr	%r16, 0x0357, %ccr
	.word 0xe49fc540  ! 252: LDDA_R	ldda	[%r31, %r0] 0x2a, %r18
invtsb_80_192:
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
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_80_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_193
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
cwq_80_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 254: RDPC	rd	%pc, %r20
splash_lsu_80_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x03a4ce82, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa953c000  ! 256: RDPR_FQ	<illegal instruction>
vahole_80_195:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe91fe1d0  ! 257: LDDF_I	ldd	[%r31, 0x01d0], %f20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_196) + 8, 16, 16)) -> intp(5,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_196)&0xffffffff)  + 8, 16, 16)) -> intp(5,0,11)
#else
	setx 0xeb2b1ed40b6256bb, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_80_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 259: CASA_R	casa	[%r31] %asi, %r11, %r20
	.word 0xe8c7e180  ! 260: LDSWA_I	ldswa	[%r31, + 0x0180] %asi, %r20
vahole_80_198:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9ba0c9d3  ! 261: FDIVd	fdivd	%f34, %f50, %f44
	.word 0xd697e0c0  ! 262: LDUHA_I	lduha	[%r31, + 0x00c0] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe018  ! 264: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r11
pmu_80_199:
	nop
	setx 0xfffff2eefffffe54, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
vahole_80_201:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3e90033  ! 267: PREFETCHA_R	prefetcha	[%r4, %r19] 0x01, #one_read
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d903fc3  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1fc3, %pstate
	.word 0xe097e1a0  ! 269: LDUHA_I	lduha	[%r31, + 0x01a0] %asi, %r16
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
    brnz %r10, sma_80_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 270: CASA_R	casa	[%r31] %asi, %r8, %r16
	.word 0xe07fe110  ! 271: SWAP_I	swap	%r16, [%r31 + 0x0110]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_80_204:
    set user_data_start, %o7
	.word 0x93902000  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_80_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff25bfffffa7c, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 275: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
br_badelay3_80_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x97a40827  ! 276: FADDs	fadds	%f16, %f7, %f11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_80_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c012  ! 279: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
donret_80_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_211-donret_80_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f712e1 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1542, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_211:
	.word 0xd86fe10d  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x010d]
donret_80_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_212-donret_80_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0024b52e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1946, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_212:
	.word 0xa1a509d0  ! 281: FDIVd	fdivd	%f20, %f16, %f16
brcommon1_80_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa5b047d3  ! 282: PDIST	pdistn	%d32, %d50, %d18
	.word 0xe19fe0a0  ! 283: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0x8d903583  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x1583, %pstate
splash_cmpr_80_215:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 285: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_80_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 286: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9032f1  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x12f1, %pstate
splash_lsu_80_219:
	nop
	ta T_CHANGE_HPRIV
	set 0xbc6b92d9, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_80_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_220-donret_80_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004f9e37 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x60f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	retry
donretarg_80_220:
	.word 0xd66fe013  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x0013]
	.word 0x91d02034  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 52
	setx 0x626ac130b112b3ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_80_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e050  ! 1: STQF_I	-	%f11, [0x0050, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6bfc034  ! 293: STDA_R	stda	%r11, [%r31 + %r20] 0x01
	.word 0xd6d7e140  ! 294: LDSHA_I	ldsha	[%r31, + 0x0140] %asi, %r11
pmu_80_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff84fffffe8a, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00161  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_225)+48, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_225)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_225:
	.word 0xa98435d8  ! 297: WR_SET_SOFTINT_I	wr	%r16, 0x15d8, %set_softint
memptr_80_226:
	set 0x60740000, %r31
	.word 0x8583352e  ! 298: WRCCR_I	wr	%r12, 0x152e, %ccr
mondo_80_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d948001  ! 299: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0xd297e1c8  ! 300: LDUHA_I	lduha	[%r31, + 0x01c8] %asi, %r9
vahole_80_228:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa9702953  ! 301: POPC_I	popc	0x0953, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_229)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_229)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_229:
	.word 0xa982329e  ! 302: WR_SET_SOFTINT_I	wr	%r8, 0x129e, %set_softint
	.word 0x8d902ca1  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x0ca1, %pstate
vahole_80_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe8dfc028  ! 304: LDXA_R	ldxa	[%r31, %r8] 0x01, %r20
trapasi_80_232:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8d04980  ! 305: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_233)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_233)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_233:
	.word 0xa981bbda  ! 306: WR_SET_SOFTINT_I	wr	%r6, 0x1bda, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_234) + 16, 16, 16)) -> intp(6,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_234)&0xffffffff)  + 16, 16, 16)) -> intp(6,0,23)
#else
	setx 0xcfc79531950ccb6b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_80_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff3e2fffffeec, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_80_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_236
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
cwq_80_236:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 310: RDPC	rd	%pc, %r19
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
    brnz %r10, sma_80_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 311: CASA_R	casa	[%r31] %asi, %r17, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_80_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 313: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0xc32fc00d  ! 1: STXFSR_R	st-sfr	%f1, [%r13, %r31]
	.word 0x9f802c42  ! 314: SIR	sir	0x0c42
	.word 0x91d020b4  ! 315: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_80_240:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_80_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d904007  ! 317: WRPR_WSTATE_R	wrpr	%r1, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_80_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 319: CASA_R	casa	[%r31] %asi, %r9, %r8
br_longdelay1_80_243:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0xbfefc000  ! 320: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_80_244:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 321: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_80_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff785fffff7c7, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_246:
	nop
	setx 0xfffff405fffff3cd, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa1a00171  ! 326: FABSq	dis not found

mondo_80_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d904013  ! 327: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_250) + 24, 16, 16)) -> intp(5,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_250)&0xffffffff)  + 24, 16, 16)) -> intp(5,0,15)
#else
	setx 0x7b5d3b618b516345, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_251-donret_80_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a2ddc9 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xac5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_80_251:
	.word 0x91a209d4  ! 329: FDIVd	fdivd	%f8, %f20, %f8
	.word 0xd4c7e158  ! 330: LDSWA_I	ldswa	[%r31, + 0x0158] %asi, %r10
	.word 0xc1bfe140  ! 331: STDFA_I	stda	%f0, [0x0140, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_80_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x897af0b9	! Random illegal ?
	.word 0x95a00554  ! 1: FSQRTd	fsqrt	
	.word 0x9ba4c82a  ! 333: FADDs	fadds	%f19, %f10, %f13
splash_hpstate_80_253:
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x81982c56  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c56, %hpstate
mondo_80_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94000b  ! 335: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0xe33fc010  ! 1: STDF_R	std	%f17, [%r16, %r31]
	.word 0x9f802e60  ! 336: SIR	sir	0x0e60
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e1a6  ! 338: STX_I	stx	%r17, [%r31 + 0x01a6]
pmu_80_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff715fffff641, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe227e188  ! 342: STW_I	stw	%r17, [%r31 + 0x0188]
	setx 0xccc14dd6b57aa4f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_80_258:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_80_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_259-donret_80_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009de0b3 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c1b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_80_259:
	.word 0x95a409c3  ! 345: FDIVd	fdivd	%f16, %f34, %f10
jmptr_80_260:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa9a00165  ! 347: FABSq	dis not found

	.word 0xa4c4b62b  ! 348: ADDCcc_I	addccc 	%r18, 0xfffff62b, %r18
mondo_80_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 349: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d903e6f  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1e6f, %pstate
	.word 0xe19fe080  ! 351: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_266) + 40, 16, 16)) -> intp(1,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_266)&0xffffffff)  + 40, 16, 16)) -> intp(1,0,23)
#else
	setx 0xf808d178c2f0f615, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_80_267:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe69fe090  ! 355: LDDA_I	ldda	[%r31, + 0x0090] %asi, %r19
	.word 0xc19fe180  ! 356: LDDFA_I	ldda	[%r31, 0x0180], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_268)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_268)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_268:
	.word 0xa9816d7c  ! 357: WR_SET_SOFTINT_I	wr	%r5, 0x0d7c, %set_softint
	setx 0xb39735ff13694140, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_80_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_270
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
cwq_80_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 359: RDPC	rd	%pc, %r17
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_80_272:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0xbfefc000  ! 361: RESTORE_R	restore	%r31, %r0, %r31
fpinit_80_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8376b  ! 362: PREFETCHA_I	prefetcha	[%r0, + 0xfffff76b] %asi, #one_read
jmptr_80_274:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_80_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7c4b67a3577f2b7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_80_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_277
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
cwq_80_277:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 366: RDPC	rd	%pc, %r16
brcommon3_80_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd89fc02d  ! 367: LDDA_R	ldda	[%r31, %r13] 0x01, %r12
	.word 0xd827e084  ! 368: STW_I	stw	%r12, [%r31 + 0x0084]
	.word 0xd8c7e158  ! 369: LDSWA_I	ldswa	[%r31, + 0x0158] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_279)+16, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_279)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_279:
	.word 0xa981e3d7  ! 370: WR_SET_SOFTINT_I	wr	%r7, 0x03d7, %set_softint
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
    brnz %r10, cwq_80_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_280
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
cwq_80_280:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 371: RDPC	rd	%pc, %r9
	.word 0xd4cfe058  ! 372: LDSBA_I	ldsba	[%r31, + 0x0058] %asi, %r10
splash_cmpr_80_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 373: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_80_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 374: CASA_R	casa	[%r31] %asi, %r18, %r10
br_badelay2_80_283:
	.word 0x93a509c6  ! 1: FDIVd	fdivd	%f20, %f6, %f40
	pdist %f22, %f4, %f22
	.word 0x91b14310  ! 375: ALIGNADDRESS	alignaddr	%r5, %r16, %r8
	.word 0xc19fe000  ! 376: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0xd43fc00c  ! 1: STD_R	std	%r10, [%r31 + %r12]
	.word 0x9f802373  ! 377: SIR	sir	0x0373
	.word 0xc1bfdc00  ! 378: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x98dc0012  ! 379: SMULcc_R	smulcc 	%r16, %r18, %r12
	fbge skip_80_284
	fbn skip_80_284
.align 2048
skip_80_284:
	.word 0xe83fc000  ! 380: STD_R	std	%r20, [%r31 + %r0]
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
    brnz %r10, cwq_80_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_285
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
cwq_80_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 381: RDPC	rd	%pc, %r18
brcommon3_80_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c010  ! 1: STQF_R	-	%f13, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdbe7e00b  ! 382: CASA_R	casa	[%r31] %asi, %r11, %r13
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
iaw_80_287:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait80_287:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_287
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_287:
    brnz %r16, iaw_wait80_287
    ld [%r23], %r16
    ba iaw_startwait80_287
    mov 0x80, %r16
continue_iaw_80_287:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_287:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_287
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_287:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_287
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_287:
	mov 0x38, %r18
iaw4_80_287:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fe190  ! 384: LDDF_I	ldd	[%r31, 0x0190], %f13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_288) + 56, 16, 16)) -> intp(1,0,10)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_288)&0xffffffff)  + 56, 16, 16)) -> intp(1,0,10)
#else
	setx 0xda0a01bf0f0d69dc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_80_289:
	taddcctv %r5, 0x1618, %r18
	.word 0xda07e110  ! 386: LDUW_I	lduw	[%r31 + 0x0110], %r13
ibp_80_290:
	nop
	.word 0xc1bfda00  ! 387: STDFA_R	stda	%f0, [%r0, %r31]
cwp_80_291:
    set user_data_start, %o7
	.word 0x93902007  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
pmu_80_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff483fffff2d9, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_80_294:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x97410000  ! 391: RDTICK	rd	%tick, %r11
cwp_80_295:
    set user_data_start, %o7
	.word 0x93902003  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_80_296:
	nop
	ta T_CHANGE_HPRIV
	set 0xff34dc49, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_80_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd48d4d471b443b9f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_80_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0x908, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe31fe1e0  ! 397: LDDF_I	ldd	[%r31, 0x01e0], %f17
mondo_80_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d914013  ! 398: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0xe19fc2c0  ! 399: LDDFA_R	ldda	[%r31, %r0], %f16
splash_decr_80_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7850013  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r19, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_302) + 40, 16, 16)) -> intp(0,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_302)&0xffffffff)  + 40, 16, 16)) -> intp(0,0,5)
#else
	setx 0x2ca8add2c77b2524, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_80_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9ba00546  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fda00  ! 402: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_80_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 403: CASA_R	casa	[%r31] %asi, %r17, %r9
pmu_80_305:
	nop
	setx 0xfffffd78fffffe42, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_306:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_308) + 0, 16, 16)) -> intp(3,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_308)&0xffffffff)  + 0, 16, 16)) -> intp(3,0,9)
#else
	setx 0xfdef7f71976709a2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_309:
	.word 0x819838df  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x18df, %hpstate
br_badelay2_80_310:
	.word 0xa5a4c9c3  ! 1: FDIVd	fdivd	%f50, %f34, %f18
	pdist %f2, %f16, %f24
	.word 0x99b44306  ! 409: ALIGNADDRESS	alignaddr	%r17, %r6, %r12
splash_cmpr_80_311:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 410: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_80_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 411: CASA_R	casa	[%r31] %asi, %r20, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_313)+16, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_313)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_313:
	.word 0xa9842d89  ! 412: WR_SET_SOFTINT_I	wr	%r16, 0x0d89, %set_softint
memptr_80_314:
	set 0x60740000, %r31
	.word 0x8582aae7  ! 413: WRCCR_I	wr	%r10, 0x0ae7, %ccr
	.word 0x91944005  ! 414: WRPR_PIL_R	wrpr	%r17, %r5, %pil
	.word 0xe4dfc034  ! 1: LDXA_R	ldxa	[%r31, %r20] 0x01, %r18
	.word 0x9f802647  ! 415: SIR	sir	0x0647
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
    brnz %r10, cwq_80_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_316
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
cwq_80_316:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 416: RDPC	rd	%pc, %r11
intveclr_80_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa93bf5bf27573783, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 418: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x0865abc4825f0c7e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_80_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c005  ! 421: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
splash_lsu_80_322:
	nop
	ta T_CHANGE_HPRIV
	set 0xcc05f1ea, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe0f1  ! 424: STD_I	std	%r13, [%r31 + 0x00f1]
	.word 0x91d02035  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d903035  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x1035, %pstate
br_badelay2_80_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b18307  ! 428: ALIGNADDRESS	alignaddr	%r6, %r7, %r9
vahole_80_325:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd697c034  ! 429: LDUHA_R	lduha	[%r31, %r20] 0x01, %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_326) + 56, 16, 16)) -> intp(5,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_326)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,9)
#else
	setx 0x9a423153b99dc8ab, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_327:
	ta T_CHANGE_NONHPRIV
	.word 0x8198378f  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x178f, %hpstate
splash_htba_80_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x93b44549  ! 434: FCMPEQ16	fcmpeq16	%d48, %d40, %r9
donret_80_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_329-donret_80_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00230d52 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf0f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_329:
	.word 0xd8ffe1a2  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x01a2] %asi
	.word 0x91a18d26  ! 436: FsMULd	fsmuld	%f6, %f6, %f8
splash_tba_80_330:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_80_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_331-donret_80_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e03399 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	done
donretarg_80_331:
	.word 0xe26fe03e  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x003e]
donret_80_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_332-donret_80_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008ed0e5 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1714, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_332:
	.word 0xa1a209c9  ! 441: FDIVd	fdivd	%f8, %f40, %f16
	setx 0x763ca5ba3fcbcd89, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe000  ! 443: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
	.word 0xe937e021  ! 444: STQF_I	-	%f20, [0x0021, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
iaw_80_335:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait80_335:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_335
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_335:
    brnz %r16, iaw_wait80_335
    ld [%r23], %r16
    ba iaw_startwait80_335
    mov 0x80, %r16
continue_iaw_80_335:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_335:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_335
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_335:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_335
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_335:
	mov 0x38, %r18
iaw4_80_335:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a089a3  ! 446: FDIVs	fdivs	%f2, %f3, %f19
brcommon2_80_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd512c011  ! 1: LDQF_R	-	[%r11, %r17], %f10
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdc00  ! 447: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa24d0012  ! 448: MULX_R	mulx 	%r20, %r18, %r17
splash_lsu_80_337:
	nop
	ta T_CHANGE_HPRIV
	set 0xadcd0119, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d914006  ! 450: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_80_340:
	ta T_CHANGE_NONHPRIV
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982c0d  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
pmu_80_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff421fffffdb8, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02033  ! 454: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9ba309ad  ! 455: FDIVs	fdivs	%f12, %f13, %f13
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_80_342:
    set user_data_start, %o7
	.word 0x93902000  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
jmptr_80_343:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_80_344:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_80_345:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_80_346:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait80_346:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_346
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_346:
    brnz %r16, iaw_wait80_346
    ld [%r23], %r16
    ba iaw_startwait80_346
    mov 0x80, %r16
continue_iaw_80_346:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_346:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_346
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_346:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_346
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_346:
	mov 0x38, %r18
iaw1_80_346:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe71fe120  ! 461: LDDF_I	ldd	[%r31, 0x0120], %f19
brcommon1_80_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa77020d0  ! 1: POPC_I	popc	0x00d0, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99b0c7cb  ! 462: PDIST	pdistn	%d34, %d42, %d12
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_80_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 464: RDTICK	rd	%tick, %r12
splash_cmpr_80_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 465: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa0840014  ! 466: ADDcc_R	addcc 	%r16, %r20, %r16
	.word 0xd28008a0  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_80_351:
	set user_data_start, %r31
	.word 0x8580b2d4  ! 468: WRCCR_I	wr	%r2, 0x12d4, %ccr
	.word 0xd27fe120  ! 469: SWAP_I	swap	%r9, [%r31 + 0x0120]
	.word 0x93b7c489  ! 1: FCMPLE32	fcmple32	%d62, %d40, %r9
	.word 0x9f802212  ! 470: SIR	sir	0x0212
	.word 0x91924006  ! 471: WRPR_PIL_R	wrpr	%r9, %r6, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_80_353:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_80_354:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait80_354:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_354
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_354:
    brnz %r16, iaw_wait80_354
    ld [%r23], %r16
    ba iaw_startwait80_354
    mov 0x80, %r16
continue_iaw_80_354:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_354:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_354
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_354:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_80_354
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_354:
	mov 0x38, %r18
iaw1_80_354:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a289d1  ! 474: FDIVd	fdivd	%f10, %f48, %f12
unsupttte_80_355:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aaca51  ! 475: FCMPd	fcmpd	%fcc<n>, %f42, %f48
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_356)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_356)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x80),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_80_356:
	.word 0xa980bb55  ! 476: WR_SET_SOFTINT_I	wr	%r2, 0x1b55, %set_softint
trapasi_80_357:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8d84980  ! 477: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r12
	.word 0xe19fe020  ! 478: LDDFA_I	ldda	[%r31, 0x0020], %f16
donret_80_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_358-donret_80_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0007535c | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x517, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_358:
	.word 0xd8ffe01e  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x001e] %asi
invtsb_80_359:
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
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_80_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d948013  ! 481: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xc19fd960  ! 482: LDDFA_R	ldda	[%r31, %r0], %f0
br_badelay1_80_361:
	.word 0x24cc0001  ! 1: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0xd937c010  ! 1: STQF_R	-	%f12, [%r16, %r31]
	.word 0xd83fc014  ! 1: STD_R	std	%r12, [%r31 + %r20]
	normalw
	.word 0xa5458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xc32fc014  ! 1: STXFSR_R	st-sfr	%f1, [%r20, %r31]
	.word 0x9f803cda  ! 484: SIR	sir	0x1cda
	.word 0xdb27e19a  ! 485: STF_I	st	%f13, [0x019a, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_80_362:
	nop
	setx 0xfffff175fffff9da, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902c0f  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x0c0f, %pstate
	brgez,a,pt	%r12, skip_80_364
	fbuge skip_80_364
.align 32
skip_80_364:
	.word 0xc32fc000  ! 490: STXFSR_R	st-sfr	%f1, [%r0, %r31]
donret_80_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_365-donret_80_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001931e3 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3a5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_365:
	.word 0xdaffe138  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x0138] %asi
	.word 0xdb27e034  ! 492: STF_I	st	%f13, [0x0034, %r31]
	.word 0xdaffc02d  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r13] 0x01
splash_cmpr_80_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 494: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9b702000  ! 1: POPC_I	popc	0x0000, %r13
	.word 0x9f803adf  ! 496: SIR	sir	0x1adf
pmu_80_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff305fffff178, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_80_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_368
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
cwq_80_368:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 498: RDPC	rd	%pc, %r17
change_to_randtl_80_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_80_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 501: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
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
br_longdelay1_40_0:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	brnz,pn  	%r10, skip_40_1
	fbule,a,pn	%fcc0,  skip_40_1
.align 1024
skip_40_1:
	.word 0xc30fc000  ! 2: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 3: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_3:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_40_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7820012  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r18, %-
	.word 0x87ac8ad2  ! 6: FCMPEd	fcmped	%fcc<n>, %f18, %f18
vahole_40_5:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe63fe130  ! 7: STD_I	std	%r19, [%r31 + 0x0130]
memptr_40_6:
	set user_data_start, %r31
	.word 0x8584b2fb  ! 8: WRCCR_I	wr	%r18, 0x12fb, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_40_7:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa5410000  ! 10: RDTICK	rd	%tick, %r18
splash_lsu_40_8:
	nop
	ta T_CHANGE_HPRIV
	set 0xa209061d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_40_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe190  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0190]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3e8c032  ! 12: PREFETCHA_R	prefetcha	[%r3, %r18] 0x01, #one_read
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_40_10:
	nop
	setx 0xfffff31efffff428, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_40_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff58cfffff238, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_12:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait40_12:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_12
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_12:
    brnz %r16, ibp_wait40_12
    ld [%r23], %r16
    ba ibp_startwait40_12
    mov 0x40, %r16
continue_ibp_40_12:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_12:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_12
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_12:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_12
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_12:
    best_set_reg(0x00000050f2c00079,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fe040  ! 17: LDDFA_I	ldda	[%r31, 0x0040], %f0
ibp_40_13:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait40_13:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_13
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_13:
    brnz %r16, ibp_wait40_13
    ld [%r23], %r16
    ba ibp_startwait40_13
    mov 0x40, %r16
continue_ibp_40_13:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_13:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_13
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_13:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_13
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_13:
    best_set_reg(0x00000050dac0792b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe160  ! 18: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xd65fe188  ! 19: LDX_I	ldx	[%r31 + 0x0188], %r11
	.word 0xd727e155  ! 20: STF_I	st	%f11, [0x0155, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_14) + 16, 16, 16)) -> intp(0,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_14)&0xffffffff)  + 16, 16, 16)) -> intp(0,0,25)
#else
	setx 0xc20ebae602cdbece, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_15-donret_40_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007ad81a | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x716, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_15:
	.word 0xd6ffe164  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x0164] %asi
    set 0x1938, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b287d1  ! 24: PDIST	pdistn	%d10, %d48, %d48
	.word 0xe1bfde00  ! 25: STDFA_R	stda	%f16, [%r0, %r31]
pmu_40_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff177fffff6ff, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_40_17:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd097c032  ! 27: LDUHA_R	lduha	[%r31, %r18] 0x01, %r8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_18)+56, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_18)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_18:
	.word 0xa9843e72  ! 28: WR_SET_SOFTINT_I	wr	%r16, 0x1e72, %set_softint
	.word 0x91a00171  ! 29: FABSq	dis not found

donret_40_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_20-donret_40_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001ddf63 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f95, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	retry
donretarg_40_20:
	.word 0xe2ffe041  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x0041] %asi
splash_decr_40_21:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa784c004  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r4, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_22) + 32, 16, 16)) -> intp(5,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_22)&0xffffffff)  + 32, 16, 16)) -> intp(5,0,22)
#else
	setx 0x10a9f3fe9ffe41c3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_23:
	set 0x60740000, %r31
	.word 0x85806acf  ! 33: WRCCR_I	wr	%r1, 0x0acf, %ccr
unsupttte_40_24:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9b0c494  ! 34: FCMPLE32	fcmple32	%d34, %d20, %r20
brcommon3_40_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd23fe070  ! 35: STD_I	std	%r9, [%r31 + 0x0070]
jmptr_40_26:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_40_27:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 37: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_40_28:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 38: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_40_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d92c00d  ! 39: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
brcommon3_40_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe0c0  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x00c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd33fc00a  ! 40: STDF_R	std	%f9, [%r10, %r31]
	.word 0xd2dfe030  ! 41: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0xd327e0a0  ! 42: STF_I	st	%f9, [0x00a0, %r31]
	setx 0x8b7f461f0e0f2031, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d91c011  ! 44: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
ceter_40_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 45: RDTICK	rd	%tick, %r11
	.word 0x9194c00a  ! 46: WRPR_PIL_R	wrpr	%r19, %r10, %pil
splash_tba_40_35:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_40_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d930014  ! 48: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0xe31fc011  ! 1: LDDF_R	ldd	[%r31, %r17], %f17
	.word 0x9f80322c  ! 49: SIR	sir	0x122c
br_longdelay2_40_37:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xe3e7c02a  ! 50: CASA_I	casa	[%r31] 0x 1, %r10, %r17
splash_cmpr_40_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 51: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_40_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e012  ! 52: CASA_R	casa	[%r31] %asi, %r18, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_40)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_40)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_40:
	.word 0xa982b798  ! 53: WR_SET_SOFTINT_I	wr	%r10, 0x1798, %set_softint
jmptr_40_41:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_40_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_42-donret_40_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d7de21 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x43c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_42:
	.word 0xe26fe168  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x0168]
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
    brnz %r10, cwq_40_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_43
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
cwq_40_43:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 56: RDPC	rd	%pc, %r9
splash_hpstate_40_44:
	.word 0x8198314d  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x114d, %hpstate
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d90318d  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x118d, %pstate
mondo_40_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d940008  ! 59: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
mondo_40_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d918005  ! 60: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
splash_hpstate_40_48:
	ta T_CHANGE_NONHPRIV
	.word 0x81982647  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
	.word 0xd31fe178  ! 62: LDDF_I	ldd	[%r31, 0x0178], %f9
vahole_40_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfde00  ! 63: STDFA_R	stda	%f16, [%r0, %r31]
brcommon1_40_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9970341f  ! 64: POPC_I	popc	0x141f, %r12
splash_hpstate_40_51:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d86  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d86, %hpstate
	.word 0x8d90241b  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x041b, %pstate
	.word 0xe19fe1a0  ! 67: LDDFA_I	ldda	[%r31, 0x01a0], %f16
br_badelay1_40_54:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xd337e0a0  ! 1: STQF_I	-	%f9, [0x00a0, %r31]
	.word 0x87afca54  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f20
	normalw
	.word 0x93458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd82fe0f1  ! 69: STB_I	stb	%r12, [%r31 + 0x00f1]
donret_40_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_55-donret_40_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d47c1f | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8d9, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_55:
	.word 0xa1a449c9  ! 70: FDIVd	fdivd	%f48, %f40, %f16
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
    brnz %r10, sma_40_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 71: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe19fe040  ! 72: LDDFA_I	ldda	[%r31, 0x0040], %f16
mondo_40_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d92c010  ! 73: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_40_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 76: CASA_R	casa	[%r31] %asi, %r11, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9553c000  ! 79: RDPR_FQ	<illegal instruction>
donret_40_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_59-donret_40_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a5d7a3 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x150f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_59:
	.word 0x95a489d1  ! 80: FDIVd	fdivd	%f18, %f48, %f10
	.word 0xda8fe030  ! 81: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xc19fda00  ! 82: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_40_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_40_61:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 84: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_40_62:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 86: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_64)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_64)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_64:
	.word 0xa9816184  ! 87: WR_SET_SOFTINT_I	wr	%r5, 0x0184, %set_softint
	.word 0xdb37e009  ! 88: STQF_I	-	%f13, [0x0009, %r31]
mondo_40_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d904006  ! 89: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_40_66:
	set user_data_start, %r31
	.word 0x85842e9b  ! 91: WRCCR_I	wr	%r16, 0x0e9b, %ccr
jmptr_40_67:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_40_69:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xdb1fc00b  ! 95: LDDF_R	ldd	[%r31, %r11], %f13
pmu_40_70:
	nop
	setx 0xfffff685fffff890, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_71:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_40_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_40_73:
	.word 0x81982e15  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e15, %hpstate
donret_40_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_74-donret_40_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0062777f | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	retry
donretarg_40_74:
	.word 0xda6fe1e9  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x01e9]
change_to_randtl_40_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_75:
	.word 0x8f902000  ! 101: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
unsupttte_40_76:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ea0025  ! 102: PREFETCHA_R	prefetcha	[%r8, %r5] 0x01, #one_read
	.word 0x8d903ab3  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x1ab3, %pstate
intveclr_40_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0xbba736654dad3396, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_40_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_79-donret_40_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0036a6f0 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1405, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_79:
	.word 0xa7a0c9cd  ! 105: FDIVd	fdivd	%f34, %f44, %f50
	.word 0xe4d7e038  ! 106: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r18
tagged_40_80:
	tsubcctv %r13, 0x17b8, %r13
	.word 0xe407e10b  ! 107: LDUW_I	lduw	[%r31 + 0x010b], %r18
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
    brnz %r10, cwq_40_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_81
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
cwq_40_81:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 108: RDPC	rd	%pc, %r13
splash_lsu_40_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xbb49a20f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 110: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_40_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_40_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 112: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0xe1bfc3e0  ! 113: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fdf20  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_40_86:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_87)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_87)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_87:
	.word 0xa982b54c  ! 116: WR_SET_SOFTINT_I	wr	%r10, 0x154c, %set_softint
brcommon3_40_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c010  ! 1: STQF_R	-	%f8, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fc008  ! 117: LDDF_R	ldd	[%r31, %r8], %f8
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d90351a  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x151a, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_91)+8, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_91)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_91:
	.word 0xa982f145  ! 120: WR_SET_SOFTINT_I	wr	%r11, 0x1145, %set_softint
splash_cmpr_40_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 121: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9ba00163  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_40_95:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 124: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfdf20  ! 125: STDFA_R	stda	%f0, [%r0, %r31]
jmptr_40_96:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5fcbfbb68d58eeaf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff267fffff248, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_40_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_99-donret_40_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0091051f | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x126f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_99:
	.word 0xa9a4c9d0  ! 129: FDIVd	fdivd	%f50, %f16, %f20
pmu_40_100:
	nop
	setx 0xfffff562fffffeb5, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d914010  ! 131: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
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
    brnz %r10, sma_40_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00a  ! 132: CASA_R	casa	[%r31] %asi, %r10, %r12
	.word 0xc1bfdc00  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_40_103:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_40_104:
	nop
	ta T_CHANGE_HPRIV
	set 0x6843d871, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xdbabbd90502885d1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_40_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_106:
	.word 0x8f902001  ! 137: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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
    brnz %r10, cwq_40_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_107
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
cwq_40_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 138: RDPC	rd	%pc, %r16
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_108)+24, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_108)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_108:
	.word 0xa9843447  ! 139: WR_SET_SOFTINT_I	wr	%r16, 0x1447, %set_softint
br_badelay1_40_109:
	.word 0x87afca53  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f50
	.word 0xd13423f3  ! 1: STQF_I	-	%f8, [0x03f3, %r16]
	.word 0x9ba7c9ca  ! 1: FDIVd	fdivd	%f62, %f10, %f44
	normalw
	.word 0x93458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_110:
	ta	T_CHANGE_NONHPRIV	! macro
vahole_40_111:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa5a2c9c9  ! 142: FDIVd	fdivd	%f42, %f40, %f18
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
    brnz %r10, cwq_40_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_112
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
cwq_40_112:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 143: RDPC	rd	%pc, %r12
	.word 0xd91fe040  ! 144: LDDF_I	ldd	[%r31, 0x0040], %f12
	setx 0xa73e72bcbe7026a6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa2d20006  ! 146: UMULcc_R	umulcc 	%r8, %r6, %r17
splash_cmpr_40_114:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 147: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_40_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d908011  ! 148: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
change_to_randtl_40_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_116:
	.word 0x8f902000  ! 149: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_40_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_117:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_118) + 56, 16, 16)) -> intp(0,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_118)&0xffffffff)  + 56, 16, 16)) -> intp(0,0,26)
#else
	setx 0xf794bacc2b0d191f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_119:
	set 0x60340000, %r31
	.word 0x858466e8  ! 152: WRCCR_I	wr	%r17, 0x06e8, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d90398b  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x198b, %pstate
mondo_40_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c012  ! 155: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0x8d902517  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x0517, %pstate
	.word 0x91d020b2  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 178
	setx 0xece1b7b9235c77df, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36c0013  ! 159: PREFETCH_R	prefetch	[%r16 + %r19], #one_read
fpinit_40_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 160: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_hpstate_40_125:
	ta T_CHANGE_NONHPRIV
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x81982cd9  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_40_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 163: CASA_R	casa	[%r31] %asi, %r12, %r16
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
    brnz %r10, sma_40_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 164: CASA_R	casa	[%r31] %asi, %r10, %r16
pmu_40_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff862fffff1e2, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 166: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_40_130:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 167: RDTICK	rd	%tick, %r20
jmptr_40_131:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9b6b0011  ! 169: SDIVX_R	sdivx	%r12, %r17, %r13
splash_cmpr_40_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 170: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_40_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_133
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
cwq_40_133:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 172: RDPC	rd	%pc, %r13
jmptr_40_134:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd060  ! 174: LDDA_R	ldda	[%r31, %r0] 0x83, %r16
	setx 0xde098c1e77a9ea0d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_136:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 176: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e090  ! 177: LDSHA_I	ldsha	[%r31, + 0x0090] %asi, %r16
splash_cmpr_40_137:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_40_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d91c002  ! 179: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
change_to_randtl_40_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_139:
	.word 0x8f902000  ! 180: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
jmptr_40_140:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9191c013  ! 182: WRPR_PIL_R	wrpr	%r7, %r19, %pil
donret_40_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_142-donret_40_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0030d05a | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17cd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_142:
	.word 0x9ba1c9c9  ! 183: FDIVd	fdivd	%f38, %f40, %f44
	.word 0xe6c7e0b8  ! 184: LDSWA_I	ldswa	[%r31, + 0x00b8] %asi, %r19
	.word 0xe1bfdb60  ! 185: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe6cfe168  ! 186: LDSBA_I	ldsba	[%r31, + 0x0168] %asi, %r19
splash_cmpr_40_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 187: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x96844007  ! 188: ADDcc_R	addcc 	%r17, %r7, %r11
ibp_40_144:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait40_144:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_144
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_144:
    brnz %r16, ibp_wait40_144
    ld [%r23], %r16
    ba ibp_startwait40_144
    mov 0x40, %r16
continue_ibp_40_144:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_144:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_144
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_144:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_144
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_144:
    best_set_reg(0x000000400bf92b1c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe120  ! 189: LDDFA_I	ldda	[%r31, 0x0120], %f16
ceter_40_145:
    nop
    ta T_CHANGE_HPRIV
    mov 5, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 190: RDTICK	rd	%tick, %r12
ceter_40_146:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 191: RDTICK	rd	%tick, %r9
	setx 0xdd73d4dc9bcf6538, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_40_148:
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
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0x95a00165  ! 194: FABSq	dis not found

	.word 0xe6c7e170  ! 195: LDSWA_I	ldswa	[%r31, + 0x0170] %asi, %r19
splash_lsu_40_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x0b66414c, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe0e8  ! 198: LDX_I	ldx	[%r31 + 0x00e8], %r19
splash_hpstate_40_152:
	ta T_CHANGE_NONHPRIV
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x8198244b  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044b, %hpstate
	.word 0x9353c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0xc32fc012  ! 1: STXFSR_R	st-sfr	%f1, [%r18, %r31]
	.word 0x9f803d69  ! 201: SIR	sir	0x1d69
mondo_40_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d940013  ! 202: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
jmptr_40_154:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	brnz,a,pn	%r13, skip_40_155
	brlez,a,pn	%r4, skip_40_155
.align 2048
skip_40_155:
	.word 0x87ac8a50  ! 204: FCMPd	fcmpd	%fcc<n>, %f18, %f16
pmu_40_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff3dfffff036, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x52964d968890063e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e024  ! 207: STX_I	stx	%r19, [%r31 + 0x0024]
brcommon2_40_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a7c973  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe060  ! 208: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0x98fc4013  ! 209: SDIVcc_R	sdivcc 	%r17, %r19, %r12
	.word 0xd897e1e0  ! 210: LDUHA_I	lduha	[%r31, + 0x01e0] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_40_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_159:
	.word 0x8f902002  ! 212: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_40_160:
	tsubcctv %r18, 0x1464, %r1
	.word 0xd807e100  ! 213: LDUW_I	lduw	[%r31 + 0x0100], %r12
br_badelay1_40_161:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0xd937c010  ! 1: STQF_R	-	%f12, [%r16, %r31]
	.word 0x99a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f12
	normalw
	.word 0xa3458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r17
pmu_40_162:
	nop
	setx 0xffffff3ffffff456, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_40_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd90fffffb8f, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe1bfde00  ! 219: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfc3e0  ! 220: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfe1c0  ! 221: STDFA_I	stda	%f16, [0x01c0, %r31]
	setx 0x6d5e9221c151ff93, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_40_166:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 223: RESTORE_R	restore	%r31, %r0, %r31
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
    brnz %r10, sma_40_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 224: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_40_168:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xb7f5b59561862335, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948002  ! 227: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
splash_cmpr_40_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 228: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_40_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd97fffff760, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xafed0d9b, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d950007  ! 231: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
memptr_40_175:
	set 0x60740000, %r31
	.word 0x858437b9  ! 232: WRCCR_I	wr	%r16, 0x17b9, %ccr
mondo_40_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d940010  ! 233: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_177)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_177)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_177:
	.word 0xa9847dc1  ! 234: WR_SET_SOFTINT_I	wr	%r17, 0x1dc1, %set_softint
splash_lsu_40_178:
	nop
	ta T_CHANGE_HPRIV
	set 0x50212139, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_179:
	nop
	setx 0xfffff5fafffff355, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_180:
	nop
	ta T_CHANGE_HPRIV
	set 0xaadb9487, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 238: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e0f8  ! 239: LDSH_I	ldsh	[%r31 + 0x00f8], %r16
donret_40_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_182-donret_40_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0007a7b8 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x897, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_182:
	.word 0xe0ffe0d8  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x00d8] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe1bfe0e0  ! 242: STDFA_I	stda	%f16, [0x00e0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_184)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_184)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_184:
	.word 0xa9837f51  ! 243: WR_SET_SOFTINT_I	wr	%r13, 0x1f51, %set_softint
unsupttte_40_185:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a409b0  ! 244: FDIVs	fdivs	%f16, %f16, %f20
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_40_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_186
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
cwq_40_186:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 246: RDPC	rd	%pc, %r10
	setx 0x1e9072ee17f67cf0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_188:
	nop
	setx 0xfffff1fafffff4eb, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_189:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 249: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_40_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_190-donret_40_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f771a1 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x697, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_190:
	.word 0x9ba409d4  ! 250: FDIVd	fdivd	%f16, %f20, %f44
memptr_40_191:
	set 0x60140000, %r31
	.word 0x85817fef  ! 251: WRCCR_I	wr	%r5, 0x1fef, %ccr
	.word 0xe49fc540  ! 252: LDDA_R	ldda	[%r31, %r0] 0x2a, %r18
invtsb_40_192:
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
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_40_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_193
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
cwq_40_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 254: RDPC	rd	%pc, %r19
splash_lsu_40_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x7a6367ed, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b53c000  ! 256: RDPR_FQ	<illegal instruction>
vahole_40_195:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe83fe1d0  ! 257: STD_I	std	%r20, [%r31 + 0x01d0]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_196) + 8, 16, 16)) -> intp(0,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_196)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,13)
#else
	setx 0xc4e3ec66950ee723, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_40_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 259: CASA_R	casa	[%r31] %asi, %r11, %r20
	.word 0xe8c7e180  ! 260: LDSWA_I	ldswa	[%r31, + 0x0180] %asi, %r20
vahole_40_198:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa9703162  ! 261: POPC_I	popc	0x1162, %r20
	.word 0xd697e1e8  ! 262: LDUHA_I	lduha	[%r31, + 0x01e8] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe1c8  ! 264: LDUBA_I	lduba	[%r31, + 0x01c8] %asi, %r11
pmu_40_199:
	nop
	setx 0xfffff43bfffffc0b, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
vahole_40_201:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x95a309b2  ! 267: FDIVs	fdivs	%f12, %f18, %f10
	.word 0x24cd0001  ! 1: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0x8d903305  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1305, %pstate
	.word 0xe097e0d8  ! 269: LDUHA_I	lduha	[%r31, + 0x00d8] %asi, %r16
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
    brnz %r10, sma_40_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 270: CASA_R	casa	[%r31] %asi, %r17, %r16
	.word 0xe07fe140  ! 271: SWAP_I	swap	%r16, [%r31 + 0x0140]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_40_204:
    set user_data_start, %o7
	.word 0x93902007  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
pmu_40_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2e8fffff71d, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d910005  ! 275: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
br_badelay3_40_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x93a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xa5a4c82a  ! 276: FADDs	fadds	%f19, %f10, %f18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_40_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d920004  ! 279: WRPR_WSTATE_R	wrpr	%r8, %r4, %wstate
donret_40_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_211-donret_40_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a10e30 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x465, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_211:
	.word 0xd86fe0d2  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x00d2]
donret_40_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_212-donret_40_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002c0b06 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x317, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_212:
	.word 0x93a149d1  ! 281: FDIVd	fdivd	%f36, %f48, %f40
brcommon1_40_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91b48494  ! 282: FCMPLE32	fcmple32	%d18, %d20, %r8
	.word 0xc19fe000  ! 283: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0x8d903022  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x1022, %pstate
splash_cmpr_40_215:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 285: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_40_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 286: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9025a3  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x05a3, %pstate
splash_lsu_40_219:
	nop
	ta T_CHANGE_HPRIV
	set 0x9c0d0457, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_40_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_220-donret_40_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00207627 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbd7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_220:
	.word 0xd66fe152  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x0152]
	.word 0x91d020b3  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 179
	setx 0x939a03e24493f88e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_40_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e1f0  ! 1: STQF_I	-	%f11, [0x01f0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd697c028  ! 293: LDUHA_R	lduha	[%r31, %r8] 0x01, %r11
	.word 0xd6d7e098  ! 294: LDSHA_I	ldsha	[%r31, + 0x0098] %asi, %r11
pmu_40_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9c5fffff750, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00170  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_225)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_225)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_225:
	.word 0xa9813dcb  ! 297: WR_SET_SOFTINT_I	wr	%r4, 0x1dcb, %set_softint
memptr_40_226:
	set 0x60540000, %r31
	.word 0x8581a65b  ! 298: WRCCR_I	wr	%r6, 0x065b, %ccr
mondo_40_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d908007  ! 299: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0xd297e1b8  ! 300: LDUHA_I	lduha	[%r31, + 0x01b8] %asi, %r9
vahole_40_228:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x95b447c9  ! 301: PDIST	pdistn	%d48, %d40, %d10
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_229)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_229)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_229:
	.word 0xa984a6f2  ! 302: WR_SET_SOFTINT_I	wr	%r18, 0x06f2, %set_softint
	.word 0x8d903f47  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x1f47, %pstate
vahole_40_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe9e7e014  ! 304: CASA_R	casa	[%r31] %asi, %r20, %r20
trapasi_40_232:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8884980  ! 305: LDUBA_R	lduba	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_233)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_233)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_233:
	.word 0xa9832b72  ! 306: WR_SET_SOFTINT_I	wr	%r12, 0x0b72, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_234) + 56, 16, 16)) -> intp(2,0,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_234)&0xffffffff)  + 56, 16, 16)) -> intp(2,0,1)
#else
	setx 0x771f1d7f65afe563, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_40_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe2afffff347, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_40_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_236
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
cwq_40_236:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 310: RDPC	rd	%pc, %r18
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
    brnz %r10, sma_40_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 311: CASA_R	casa	[%r31] %asi, %r11, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_40_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00a  ! 313: CASA_R	casa	[%r31] %asi, %r10, %r8
	.word 0xd03fc008  ! 1: STD_R	std	%r8, [%r31 + %r8]
	.word 0x9f80305e  ! 314: SIR	sir	0x105e
	.word 0x83d02033  ! 315: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_cmpr_40_240:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_40_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d940003  ! 317: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_40_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 319: CASA_R	casa	[%r31] %asi, %r11, %r8
br_longdelay1_40_243:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 320: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_40_244:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 321: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_40_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff861fffff64b, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_246:
	nop
	setx 0xfffff3fcfffff313, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x99a00171  ! 326: FABSq	dis not found

mondo_40_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d94800c  ! 327: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_250) + 40, 16, 16)) -> intp(7,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_250)&0xffffffff)  + 40, 16, 16)) -> intp(7,0,14)
#else
	setx 0xebabeedfdafae1fe, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_251-donret_40_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008c4c8c | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc87, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_251:
	.word 0x91a049c4  ! 329: FDIVd	fdivd	%f32, %f4, %f8
	.word 0xd4c7e138  ! 330: LDSWA_I	ldswa	[%r31, + 0x0138] %asi, %r10
	.word 0xe1bfe0a0  ! 331: STDFA_I	stda	%f16, [0x00a0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_40_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc150f358	! Random illegal ?
	.word 0x9ba00543  ! 1: FSQRTd	fsqrt	
	.word 0xa3a28827  ! 333: FADDs	fadds	%f10, %f7, %f17
splash_hpstate_40_253:
	.word 0x2ecd0001  ! 1: BRGEZ	brgez,a,pt	%r20,<label_0xd0001>
	.word 0x81982e07  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
mondo_40_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92c007  ! 335: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
	.word 0xe33fc010  ! 1: STDF_R	std	%f17, [%r16, %r31]
	.word 0x9f802b03  ! 336: SIR	sir	0x0b03
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e1a0  ! 338: STX_I	stx	%r17, [%r31 + 0x01a0]
pmu_40_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff498fffff944, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe227e08c  ! 342: STW_I	stw	%r17, [%r31 + 0x008c]
	setx 0x502431329d32e1ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_40_258:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_40_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_259-donret_40_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00637509 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb2f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	done
donretarg_40_259:
	.word 0xa3a309d4  ! 345: FDIVd	fdivd	%f12, %f20, %f48
jmptr_40_260:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x97a00166  ! 347: FABSq	dis not found

	.word 0x92c42b38  ! 348: ADDCcc_I	addccc 	%r16, 0x0b38, %r9
mondo_40_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 349: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d903bfb  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1bfb, %pstate
	.word 0xe19fe0a0  ! 351: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_266) + 16, 16, 16)) -> intp(7,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_266)&0xffffffff)  + 16, 16, 16)) -> intp(7,0,22)
#else
	setx 0xf29f1d118eea728b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_40_267:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe69fe1b0  ! 355: LDDA_I	ldda	[%r31, + 0x01b0] %asi, %r19
	.word 0xe19fe160  ! 356: LDDFA_I	ldda	[%r31, 0x0160], %f16
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_268)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_268)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_268:
	.word 0xa984be61  ! 357: WR_SET_SOFTINT_I	wr	%r18, 0x1e61, %set_softint
	setx 0x2af69eec2b1d8013, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_40_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_270
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
cwq_40_270:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 359: RDPC	rd	%pc, %r13
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_40_272:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9d97c000  ! 361: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
fpinit_40_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 362: FCMPd	fcmpd	%fcc<n>, %f0, %f4
jmptr_40_274:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_40_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2570409bb4caec48, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_40_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_277
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
cwq_40_277:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 366: RDPC	rd	%pc, %r12
brcommon3_40_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c010  ! 1: STQF_R	-	%f12, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd897c034  ! 367: LDUHA_R	lduha	[%r31, %r20] 0x01, %r12
	.word 0xd827e110  ! 368: STW_I	stw	%r12, [%r31 + 0x0110]
	.word 0xd8c7e128  ! 369: LDSWA_I	ldswa	[%r31, + 0x0128] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_279)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_279)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_279:
	.word 0xa98522f0  ! 370: WR_SET_SOFTINT_I	wr	%r20, 0x02f0, %set_softint
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
    brnz %r10, cwq_40_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_280
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
cwq_40_280:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 371: RDPC	rd	%pc, %r10
	.word 0xd4cfe000  ! 372: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
splash_cmpr_40_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 373: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_40_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00c  ! 374: CASA_R	casa	[%r31] %asi, %r12, %r10
br_badelay2_40_283:
	.word 0x97a149d1  ! 1: FDIVd	fdivd	%f36, %f48, %f42
	pdist %f28, %f22, %f6
	.word 0x93b50310  ! 375: ALIGNADDRESS	alignaddr	%r20, %r16, %r9
	.word 0xe19fe180  ! 376: LDDFA_I	ldda	[%r31, 0x0180], %f16
	.word 0xc36fe190  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0190], #one_read
	.word 0x9f803180  ! 377: SIR	sir	0x1180
	.word 0xe1bfd920  ! 378: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa2dc0010  ! 379: SMULcc_R	smulcc 	%r16, %r16, %r17
	fbul,a,pn	%fcc0,  skip_40_284
	fbl skip_40_284
.align 2048
skip_40_284:
	.word 0xc36fe054  ! 380: PREFETCH_I	prefetch	[%r31 + 0x0054], #one_read
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
    brnz %r10, cwq_40_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_285
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
cwq_40_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 381: RDPC	rd	%pc, %r20
brcommon3_40_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c009  ! 1: STQF_R	-	%f13, [%r9, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda9fc02a  ! 382: LDDA_R	ldda	[%r31, %r10] 0x01, %r13
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
	.word 0xdadfc028  ! 384: LDXA_R	ldxa	[%r31, %r8] 0x01, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_288) + 16, 16, 16)) -> intp(3,0,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_288)&0xffffffff)  + 16, 16, 16)) -> intp(3,0,1)
#else
	setx 0xc65b32f1f95b8109, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_40_289:
	taddcctv %r0, 0x1e23, %r16
	.word 0xda07e0ac  ! 386: LDUW_I	lduw	[%r31 + 0x00ac], %r13
ibp_40_290:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait40_290:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_40_290
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
ibp_wait40_290:
    brnz %r16, ibp_wait40_290
    ld [%r23], %r16
    ba ibp_startwait40_290
    mov 0x40, %r16
continue_ibp_40_290:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_290:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_290
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_40_290:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_40_290
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit40_290:
    best_set_reg(0x0000004089eb1c28,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fe1c0  ! 387: LDDFA_I	ldda	[%r31, 0x01c0], %f16
cwp_40_291:
    set user_data_start, %o7
	.word 0x93902002  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
pmu_40_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0d4fffff430, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_40_294:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa3410000  ! 391: RDTICK	rd	%tick, %r17
cwp_40_295:
    set user_data_start, %o7
	.word 0x93902002  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_40_296:
	nop
	ta T_CHANGE_HPRIV
	set 0x1a4c27b4, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_40_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0x343f9a6b4438e77f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_40_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd06, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc013  ! 397: STXFSR_R	st-sfr	%f1, [%r19, %r31]
mondo_40_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d934002  ! 398: WRPR_WSTATE_R	wrpr	%r13, %r2, %wstate
	.word 0xc19fdc00  ! 399: LDDFA_R	ldda	[%r31, %r0], %f0
splash_decr_40_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7824002  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r2, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_302) + 0, 16, 16)) -> intp(7,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_302)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,17)
#else
	setx 0xb3d94d2eb38995b4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_40_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f8021d0  ! 1: SIR	sir	0x01d0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 402: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_40_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 403: CASA_R	casa	[%r31] %asi, %r17, %r9
pmu_40_305:
	nop
	setx 0xfffff55dfffffb63, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_306:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_308) + 56, 16, 16)) -> intp(2,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_308)&0xffffffff)  + 56, 16, 16)) -> intp(2,0,21)
#else
	setx 0xf4b5e7a73a948077, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_309:
	.word 0x81983607  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1607, %hpstate
br_badelay2_40_310:
	.word 0x99a509d4  ! 1: FDIVd	fdivd	%f20, %f20, %f12
	pdist %f16, %f22, %f22
	.word 0xa9b34314  ! 409: ALIGNADDRESS	alignaddr	%r13, %r20, %r20
splash_cmpr_40_311:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 410: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_40_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 411: CASA_R	casa	[%r31] %asi, %r10, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_313)+56, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_313)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_313:
	.word 0xa981b959  ! 412: WR_SET_SOFTINT_I	wr	%r6, 0x1959, %set_softint
memptr_40_314:
	set 0x60340000, %r31
	.word 0x8584256a  ! 413: WRCCR_I	wr	%r16, 0x056a, %ccr
	.word 0x91930001  ! 414: WRPR_PIL_R	wrpr	%r12, %r1, %pil
	.word 0xe51fe110  ! 1: LDDF_I	ldd	[%r31, 0x0110], %f18
	.word 0x9f802fae  ! 415: SIR	sir	0x0fae
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
    brnz %r10, cwq_40_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_316
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
cwq_40_316:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 416: RDPC	rd	%pc, %r11
intveclr_40_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4fd992e26e44da7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 418: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x78fca6d8ba2d4319, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_40_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 421: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
splash_lsu_40_322:
	nop
	ta T_CHANGE_HPRIV
	set 0x067559ab, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe008  ! 424: STD_I	std	%r13, [%r31 + 0x0008]
	.word 0x91d02034  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 426: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x2ccb0001  ! 1: BRGZ	brgz,a,pt	%r12,<label_0xb0001>
	.word 0x8d903c8b  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x1c8b, %pstate
br_badelay2_40_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b1030a  ! 428: ALIGNADDRESS	alignaddr	%r4, %r10, %r8
vahole_40_325:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd7e7e013  ! 429: CASA_R	casa	[%r31] %asi, %r19, %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_326) + 8, 16, 16)) -> intp(1,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_326)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,8)
#else
	setx 0x95ebb5c7179ef203, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_327:
	ta T_CHANGE_NONHPRIV
	.word 0x81983fed  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fed, %hpstate
splash_htba_40_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x97b04548  ! 434: FCMPEQ16	fcmpeq16	%d32, %d8, %r11
donret_40_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_329-donret_40_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ef27e2 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1111, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_329:
	.word 0xd8ffe05c  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x005c] %asi
	.word 0xa7a4cd34  ! 436: FsMULd	fsmuld	%f19, %f20, %f50
splash_tba_40_330:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_40_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_331-donret_40_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e1d746 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ead, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	done
donretarg_40_331:
	.word 0xe26fe10c  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x010c]
donret_40_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_332-donret_40_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000dcbca | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x743, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_332:
	.word 0x91a509d0  ! 441: FDIVd	fdivd	%f20, %f16, %f8
	setx 0x7ae7159b2f449b09, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe170  ! 443: LDUBA_I	lduba	[%r31, + 0x0170] %asi, %r20
	.word 0xe937e128  ! 444: STQF_I	-	%f20, [0x0128, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x9bb5048b  ! 446: FCMPLE32	fcmple32	%d20, %d42, %r13
brcommon2_40_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9b7c714  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f20, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fc2c0  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa24a0010  ! 448: MULX_R	mulx 	%r8, %r16, %r17
splash_lsu_40_337:
	nop
	ta T_CHANGE_HPRIV
	set 0xaed6d48a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d940013  ! 450: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_40_340:
	ta T_CHANGE_NONHPRIV
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982d3d  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d3d, %hpstate
pmu_40_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2d8fffffba0, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 454: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93a049b3  ! 455: FDIVs	fdivs	%f1, %f19, %f9
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_40_342:
    set user_data_start, %o7
	.word 0x93902007  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
jmptr_40_343:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_40_344:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_40_345:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe6bfc031  ! 461: STDA_R	stda	%r19, [%r31 + %r17] 0x01
brcommon1_40_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa7702190  ! 1: POPC_I	popc	0x0190, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ec8030  ! 462: PREFETCHA_R	prefetcha	[%r18, %r16] 0x01, #one_read
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_40_349:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 464: RDTICK	rd	%tick, %r20
splash_cmpr_40_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 465: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x94844002  ! 466: ADDcc_R	addcc 	%r17, %r2, %r10
	.word 0xd2800c60  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
memptr_40_351:
	set user_data_start, %r31
	.word 0x85822c6d  ! 468: WRCCR_I	wr	%r8, 0x0c6d, %ccr
	.word 0xd27fe050  ! 469: SWAP_I	swap	%r9, [%r31 + 0x0050]
	.word 0x93b7c7cc  ! 1: PDIST	pdistn	%d62, %d12, %d40
	.word 0x9f80270d  ! 470: SIR	sir	0x070d
	.word 0x91944008  ! 471: WRPR_PIL_R	wrpr	%r17, %r8, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_40_353:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x95703261  ! 474: POPC_I	popc	0x1261, %r10
unsupttte_40_355:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97b4048d  ! 475: FCMPLE32	fcmple32	%d16, %d44, %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_356)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_356)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x40),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_40_356:
	.word 0xa9827645  ! 476: WR_SET_SOFTINT_I	wr	%r9, 0x1645, %set_softint
trapasi_40_357:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 477: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
	.word 0xe19fe060  ! 478: LDDFA_I	ldda	[%r31, 0x0060], %f16
donret_40_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_358-donret_40_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d94a77 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_358:
	.word 0xd8ffe144  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x0144] %asi
invtsb_40_359:
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
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_40_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d91c012  ! 481: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0xc19fc3e0  ! 482: LDDFA_R	ldda	[%r31, %r0], %f0
br_badelay1_40_361:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd937c008  ! 1: STQF_R	-	%f12, [%r8, %r31]
	.word 0xd9e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r12
	normalw
	.word 0x9b458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xc36fe0f0  ! 1: PREFETCH_I	prefetch	[%r31 + 0x00f0], #one_read
	.word 0x9f802afc  ! 484: SIR	sir	0x0afc
	.word 0xdb27e0c6  ! 485: STF_I	st	%f13, [0x00c6, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_40_362:
	nop
	setx 0xfffffc6efffff233, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d903bbb  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x1bbb, %pstate
	bcs  	 skip_40_364
	.word 0xc36cb1e1  ! 1: PREFETCH_I	prefetch	[%r18 + 0xfffff1e1], #one_read
.align 32
skip_40_364:
	.word 0xc36fe1d4  ! 490: PREFETCH_I	prefetch	[%r31 + 0x01d4], #one_read
donret_40_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_365-donret_40_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c80f28 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x597, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_365:
	.word 0xdaffe13a  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x013a] %asi
	.word 0xdb27e046  ! 492: STF_I	st	%f13, [0x0046, %r31]
	.word 0xdaffc034  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r20] 0x01
splash_cmpr_40_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 494: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87afca4a  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f10
	.word 0x9f80357c  ! 496: SIR	sir	0x157c
pmu_40_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff52afffff787, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_40_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_368
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
cwq_40_368:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 498: RDPC	rd	%pc, %r20
change_to_randtl_40_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_40_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 501: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
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
br_longdelay1_20_0:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	bcc,a	 skip_20_1
	brgz,a,pt	%r16, skip_20_1
.align 1024
skip_20_1:
	.word 0xc32fc000  ! 2: STXFSR_R	st-sfr	%f1, [%r0, %r31]
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
	.word 0xe7e7e010  ! 3: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_3:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_20_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa781c008  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r8, %-
	.word 0x87ac4ac8  ! 6: FCMPEd	fcmped	%fcc<n>, %f48, %f8
vahole_20_5:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc00b  ! 7: STXFSR_R	st-sfr	%f1, [%r11, %r31]
memptr_20_6:
	set user_data_start, %r31
	.word 0x85842319  ! 8: WRCCR_I	wr	%r16, 0x0319, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_20_7:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa7410000  ! 10: RDTICK	rd	%tick, %r19
splash_lsu_20_8:
	nop
	ta T_CHANGE_HPRIV
	set 0x6e4ddb1a, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_20_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe160  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0160]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa3b287d4  ! 12: PDIST	pdistn	%d10, %d20, %d48
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_20_10:
	nop
	setx 0xfffff6cafffff3c0, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_20_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffc7ffffff70, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_12:
	nop
	.word 0xc19fe1a0  ! 17: LDDFA_I	ldda	[%r31, 0x01a0], %f0
ibp_20_13:
	nop
	.word 0xe1bfdb60  ! 18: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd65fe108  ! 19: LDX_I	ldx	[%r31 + 0x0108], %r11
	.word 0xd727e042  ! 20: STF_I	st	%f11, [0x0042, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_14) + 0, 16, 16)) -> intp(4,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_14)&0xffffffff)  + 0, 16, 16)) -> intp(4,0,13)
#else
	setx 0x9694d3fbc3b1836f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_20_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_15-donret_20_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e59ca4 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6cf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_15:
	.word 0xd6ffe0a0  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x00a0] %asi
    set 0x2d60, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7d4  ! 24: PDIST	pdistn	%d50, %d20, %d48
	.word 0xc1bfde00  ! 25: STDFA_R	stda	%f0, [%r0, %r31]
pmu_20_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff03efffffd5c, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_20_17:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd11fc013  ! 27: LDDF_R	ldd	[%r31, %r19], %f8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_18)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_18)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_18:
	.word 0xa984f602  ! 28: WR_SET_SOFTINT_I	wr	%r19, 0x1602, %set_softint
	.word 0xa3a00166  ! 29: FABSq	dis not found

donret_20_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_20-donret_20_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006dc92b | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17d4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	retry
donretarg_20_20:
	.word 0xe2ffe150  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x0150] %asi
splash_decr_20_21:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7840001  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r1, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_22) + 40, 16, 16)) -> intp(5,0,28)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_22)&0xffffffff)  + 40, 16, 16)) -> intp(5,0,28)
#else
	setx 0xbebdf247df603ddc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_20_23:
	set 0x60540000, %r31
	.word 0x8582ee1d  ! 33: WRCCR_I	wr	%r11, 0x0e1d, %ccr
unsupttte_20_24:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a509c8  ! 34: FDIVd	fdivd	%f20, %f8, %f42
brcommon3_20_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd2bfc032  ! 35: STDA_R	stda	%r9, [%r31 + %r18] 0x01
jmptr_20_26:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_20_27:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 37: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_20_28:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 38: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_20_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d910013  ! 39: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
brcommon3_20_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe100  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0100]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc00d  ! 40: STXFSR_R	st-sfr	%f1, [%r13, %r31]
	.word 0xd2dfe048  ! 41: LDXA_I	ldxa	[%r31, + 0x0048] %asi, %r9
	.word 0xd327e0f9  ! 42: STF_I	st	%f9, [0x00f9, %r31]
	setx 0x9196b8a25cd73aed, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d918003  ! 44: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
ceter_20_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x91410000  ! 45: RDTICK	rd	%tick, %r8
	.word 0x91944010  ! 46: WRPR_PIL_R	wrpr	%r17, %r16, %pil
splash_tba_20_35:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_20_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d91c014  ! 48: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0xe2dfc033  ! 1: LDXA_R	ldxa	[%r31, %r19] 0x01, %r17
	.word 0x9f803ad2  ! 49: SIR	sir	0x1ad2
br_longdelay2_20_37:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x39400001  ! 50: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 51: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_20_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 52: CASA_R	casa	[%r31] %asi, %r20, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_40)+56, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_40)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_40:
	.word 0xa98528bf  ! 53: WR_SET_SOFTINT_I	wr	%r20, 0x08bf, %set_softint
jmptr_20_41:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_20_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_42-donret_20_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d2c729 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1226, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_42:
	.word 0xe26fe172  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x0172]
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
    brnz %r10, cwq_20_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_43
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
cwq_20_43:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 56: RDPC	rd	%pc, %r8
splash_hpstate_20_44:
	.word 0x81982cd7  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	.word 0x2acd0001  ! 1: BRNZ	brnz,a,pt	%r20,<label_0xd0001>
	.word 0x8d9037b9  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x17b9, %pstate
mondo_20_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d91c003  ! 59: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
mondo_20_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d91800d  ! 60: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
splash_hpstate_20_48:
	ta T_CHANGE_NONHPRIV
	.word 0x81983ef3  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ef3, %hpstate
	.word 0xd31fe020  ! 62: LDDF_I	ldd	[%r31, 0x0020], %f9
vahole_20_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fe0a0  ! 63: LDDFA_I	ldda	[%r31, 0x00a0], %f0
brcommon1_20_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99a489a8  ! 64: FDIVs	fdivs	%f18, %f8, %f12
splash_hpstate_20_51:
	ta T_CHANGE_NONHPRIV
	.word 0x819826d8  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d8, %hpstate
	.word 0x8d9034b1  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x14b1, %pstate
	.word 0xc1bfc3e0  ! 67: STDFA_R	stda	%f0, [%r0, %r31]
br_badelay1_20_54:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xd337e1a0  ! 1: STQF_I	-	%f9, [0x01a0, %r31]
	.word 0xd3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r9
	normalw
	.word 0xa9458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xd82fe00e  ! 69: STB_I	stb	%r12, [%r31 + 0x000e]
donret_20_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_55-donret_20_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f5b7b5 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1707, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x22c98001  ! 1: BRZ	brz,a,pt	%r6,<label_0x98001>
	done
donretarg_20_55:
	.word 0x95a1c9cc  ! 70: FDIVd	fdivd	%f38, %f12, %f10
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
    brnz %r10, sma_20_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e009  ! 71: CASA_R	casa	[%r31] %asi, %r9, %r19
	.word 0xc19fe0e0  ! 72: LDDFA_I	ldda	[%r31, 0x00e0], %f0
mondo_20_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 73: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_20_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 76: CASA_R	casa	[%r31] %asi, %r11, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9753c000  ! 79: RDPR_FQ	<illegal instruction>
donret_20_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_59-donret_20_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0054924f | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1adb, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_59:
	.word 0x9ba489cc  ! 80: FDIVd	fdivd	%f18, %f12, %f44
	.word 0xda8fe1c8  ! 81: LDUBA_I	lduba	[%r31, + 0x01c8] %asi, %r13
	.word 0xc19fdf20  ! 82: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_20_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_20_61:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 84: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_20_62:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c005  ! 86: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_64)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_64)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_64:
	.word 0xa9846aea  ! 87: WR_SET_SOFTINT_I	wr	%r17, 0x0aea, %set_softint
	.word 0xdb37e058  ! 88: STQF_I	-	%f13, [0x0058, %r31]
mondo_20_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d90c004  ! 89: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_20_66:
	set user_data_start, %r31
	.word 0x85846f60  ! 91: WRCCR_I	wr	%r17, 0x0f60, %ccr
jmptr_20_67:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_20_69:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda9fe070  ! 95: LDDA_I	ldda	[%r31, + 0x0070] %asi, %r13
pmu_20_70:
	nop
	setx 0xfffff790ffffffe3, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_71:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_20_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_20_73:
	.word 0x8198379f  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x179f, %hpstate
donret_20_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_74-donret_20_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00395589 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x155, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_74:
	.word 0xda6fe003  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x0003]
change_to_randtl_20_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_75:
	.word 0x8f902002  ! 101: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
unsupttte_20_76:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ed002c  ! 102: PREFETCHA_R	prefetcha	[%r20, %r12] 0x01, #one_read
	.word 0x8d9037bf  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x17bf, %pstate
intveclr_20_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6e241fd17c9bb99a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_20_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_79-donret_20_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007e381a | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_79:
	.word 0x95a489c5  ! 105: FDIVd	fdivd	%f18, %f36, %f10
	.word 0xe4d7e038  ! 106: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r18
tagged_20_80:
	tsubcctv %r12, 0x14e3, %r20
	.word 0xe407e029  ! 107: LDUW_I	lduw	[%r31 + 0x0029], %r18
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
    brnz %r10, cwq_20_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_81
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
cwq_20_81:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 108: RDPC	rd	%pc, %r11
splash_lsu_20_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xa6060588, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 110: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_20_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_20_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 112: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0xc1bfde00  ! 113: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fc3e0  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_20_86:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_87)+8, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_87)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_87:
	.word 0xa984fe75  ! 116: WR_SET_SOFTINT_I	wr	%r19, 0x1e75, %set_softint
brcommon3_20_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c014  ! 1: STQF_R	-	%f8, [%r20, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd03fe1c0  ! 117: STD_I	std	%r8, [%r31 + 0x01c0]
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8d9024f3  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x04f3, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_91)+0, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_91)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_91:
	.word 0xa982675f  ! 120: WR_SET_SOFTINT_I	wr	%r9, 0x075f, %set_softint
splash_cmpr_20_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 121: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x93a00172  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_20_95:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 124: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfde00  ! 125: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_20_96:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x3186bb01efbe9f99, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff433fffffd5b, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_20_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_99-donret_20_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0096eff5 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15ac, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_99:
	.word 0xa1a409d2  ! 129: FDIVd	fdivd	%f16, %f18, %f16
pmu_20_100:
	nop
	setx 0xfffff1f7fffff4e0, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d94c001  ! 131: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
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
    brnz %r10, sma_20_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e008  ! 132: CASA_R	casa	[%r31] %asi, %r8, %r12
	.word 0xc1bfc3e0  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_20_103:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_20_104:
	nop
	ta T_CHANGE_HPRIV
	set 0x79e627e2, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xcebd9153d90abf42, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_20_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_106:
	.word 0x8f902001  ! 137: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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
    brnz %r10, cwq_20_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_107
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
cwq_20_107:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 138: RDPC	rd	%pc, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_108)+16, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_108)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_108:
	.word 0xa9812e05  ! 139: WR_SET_SOFTINT_I	wr	%r4, 0x0e05, %set_softint
br_badelay1_20_109:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe930a66d  ! 1: STQF_I	-	%f20, [0x066d, %r2]
	.word 0xdbe7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r13
	normalw
	.word 0x95458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_110:
	ta	T_CHANGE_NONHPRIV	! macro
vahole_20_111:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87ac0a50  ! 142: FCMPd	fcmpd	%fcc<n>, %f16, %f16
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
    brnz %r10, cwq_20_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_112
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
cwq_20_112:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 143: RDPC	rd	%pc, %r20
	.word 0xd91fe088  ! 144: LDDF_I	ldd	[%r31, 0x0088], %f12
	setx 0x6be1f1e0c9d3ddc1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6d48006  ! 146: UMULcc_R	umulcc 	%r18, %r6, %r19
splash_cmpr_20_114:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 147: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_20_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c004  ! 148: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
change_to_randtl_20_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_116:
	.word 0x8f902001  ! 149: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_20_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_117:
	.word 0x8f902000  ! 150: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_118) + 40, 16, 16)) -> intp(1,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_118)&0xffffffff)  + 40, 16, 16)) -> intp(1,0,26)
#else
	setx 0x20587d4c7389b639, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_20_119:
	set 0x60340000, %r31
	.word 0x8582782c  ! 152: WRCCR_I	wr	%r9, 0x182c, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d903781  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1781, %pstate
mondo_20_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d950013  ! 155: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0x8d902d53  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x0d53, %pstate
	.word 0x91d020b5  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 181
	setx 0x2ecbeb1c08b38ba0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36d0012  ! 159: PREFETCH_R	prefetch	[%r20 + %r18], #one_read
fpinit_20_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 160: FDIVs	fdivs	%f0, %f4, %f8
splash_hpstate_20_125:
	ta T_CHANGE_NONHPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81983691  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1691, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_20_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 163: CASA_R	casa	[%r31] %asi, %r8, %r16
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
    brnz %r10, sma_20_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r16
pmu_20_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff786fffff8a9, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 166: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_20_130:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 167: RDTICK	rd	%tick, %r20
jmptr_20_131:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9b69c012  ! 169: SDIVX_R	sdivx	%r7, %r18, %r13
splash_cmpr_20_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 170: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_20_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_133
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
cwq_20_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 172: RDPC	rd	%pc, %r16
jmptr_20_134:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd140  ! 174: LDDA_R	ldda	[%r31, %r0] 0x8a, %r16
	setx 0x99e0c1c07ee5761d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_136:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 176: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e168  ! 177: LDSHA_I	ldsha	[%r31, + 0x0168] %asi, %r16
splash_cmpr_20_137:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_20_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 179: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
change_to_randtl_20_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_139:
	.word 0x8f902000  ! 180: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
jmptr_20_140:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91944013  ! 182: WRPR_PIL_R	wrpr	%r17, %r19, %pil
donret_20_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_142-donret_20_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004eaa7b | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f02, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_142:
	.word 0xa7a409d0  ! 183: FDIVd	fdivd	%f16, %f16, %f50
	.word 0xe6c7e0a8  ! 184: LDSWA_I	ldswa	[%r31, + 0x00a8] %asi, %r19
	.word 0xc1bfc3e0  ! 185: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe6cfe1e8  ! 186: LDSBA_I	ldsba	[%r31, + 0x01e8] %asi, %r19
splash_cmpr_20_143:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 187: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x96850010  ! 188: ADDcc_R	addcc 	%r20, %r16, %r11
ibp_20_144:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd920  ! 189: STDFA_R	stda	%f0, [%r0, %r31]
ceter_20_145:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 190: RDTICK	rd	%tick, %r12
ceter_20_146:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 191: RDTICK	rd	%tick, %r13
	setx 0x869b6a62eb12be5f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_20_148:
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
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0xa9a00172  ! 194: FABSq	dis not found

	.word 0xe6c7e138  ! 195: LDSWA_I	ldswa	[%r31, + 0x0138] %asi, %r19
splash_lsu_20_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x72d75940, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe108  ! 198: LDX_I	ldx	[%r31 + 0x0108], %r19
splash_hpstate_20_152:
	ta T_CHANGE_NONHPRIV
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81983417  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1417, %hpstate
	.word 0x9753c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0xd31fe1a0  ! 1: LDDF_I	ldd	[%r31, 0x01a0], %f9
	.word 0x9f8030d4  ! 201: SIR	sir	0x10d4
mondo_20_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d910010  ! 202: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
jmptr_20_154:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	brlez,a,pt	%r9, skip_20_155
	.word 0xc36a3ccf  ! 1: PREFETCH_I	prefetch	[%r8 + 0xfffffccf], #one_read
.align 2048
skip_20_155:
	.word 0xc36d3508  ! 204: PREFETCH_I	prefetch	[%r20 + 0xfffff508], #one_read
pmu_20_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff88efffffae8, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xa8e93279d0b401c4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e14a  ! 207: STX_I	stx	%r19, [%r31 + 0x014a]
brcommon2_20_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd9110005  ! 1: LDQF_R	-	[%r4, %r5], %f12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe140  ! 208: STDFA_I	stda	%f16, [0x0140, %r31]
	.word 0x9afc8010  ! 209: SDIVcc_R	sdivcc 	%r18, %r16, %r13
	.word 0xd897e028  ! 210: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_20_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_159:
	.word 0x8f902000  ! 212: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_20_160:
	tsubcctv %r12, 0x1b85, %r9
	.word 0xd807e090  ! 213: LDUW_I	lduw	[%r31 + 0x0090], %r12
br_badelay1_20_161:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
	.word 0x99b7c4c8  ! 1: FCMPNE32	fcmpne32	%d62, %d8, %r12
	normalw
	.word 0xa7458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r19
pmu_20_162:
	nop
	setx 0xfffff30bfffff1d8, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_20_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd2cfffff4db, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe1bfda00  ! 219: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfdc00  ! 220: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfe040  ! 221: STDFA_I	stda	%f0, [0x0040, %r31]
	setx 0x2530778fd122f4ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_20_166:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0xbfefc000  ! 223: RESTORE_R	restore	%r31, %r0, %r31
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
    brnz %r10, sma_20_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 224: CASA_R	casa	[%r31] %asi, %r18, %r16
jmptr_20_168:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xa0e0c6333a4adb01, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d948003  ! 227: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
splash_cmpr_20_171:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 228: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_20_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2ecfffff8f5, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xd69b57f2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944007  ! 231: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
memptr_20_175:
	set 0x60340000, %r31
	.word 0x85847bcc  ! 232: WRCCR_I	wr	%r17, 0x1bcc, %ccr
mondo_20_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d908002  ! 233: WRPR_WSTATE_R	wrpr	%r2, %r2, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_177)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_177)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_177:
	.word 0xa984b7ef  ! 234: WR_SET_SOFTINT_I	wr	%r18, 0x17ef, %set_softint
splash_lsu_20_178:
	nop
	ta T_CHANGE_HPRIV
	set 0x224786a9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_179:
	nop
	setx 0xfffff48dfffff56a, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_180:
	nop
	ta T_CHANGE_HPRIV
	set 0x5ecc6f49, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 238: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e048  ! 239: LDSH_I	ldsh	[%r31 + 0x0048], %r16
donret_20_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_182-donret_20_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d9a480 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1fcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_182:
	.word 0xe0ffe024  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x0024] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe160  ! 242: STDFA_I	stda	%f0, [0x0160, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_184)+24, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_184)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_184:
	.word 0xa9823f16  ! 243: WR_SET_SOFTINT_I	wr	%r8, 0x1f16, %set_softint
unsupttte_20_185:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1b08491  ! 244: FCMPLE32	fcmple32	%d2, %d48, %r16
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_20_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_186
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
cwq_20_186:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 246: RDPC	rd	%pc, %r11
	setx 0xa0c40def4c65cf8d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_188:
	nop
	setx 0xfffffa94fffff3ce, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_189:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 249: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_20_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_190-donret_20_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00289e03 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_190:
	.word 0xa9a289c7  ! 250: FDIVd	fdivd	%f10, %f38, %f20
memptr_20_191:
	set 0x60340000, %r31
	.word 0x8581f44d  ! 251: WRCCR_I	wr	%r7, 0x144d, %ccr
	.word 0xe49fdc40  ! 252: LDDA_R	ldda	[%r31, %r0] 0xe2, %r18
invtsb_20_192:
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
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_20_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_193
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
cwq_20_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 254: RDPC	rd	%pc, %r19
splash_lsu_20_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xb06ec3df, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9153c000  ! 256: RDPR_FQ	<illegal instruction>
vahole_20_195:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe83fe0a0  ! 257: STD_I	std	%r20, [%r31 + 0x00a0]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_196) + 40, 16, 16)) -> intp(2,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_196)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,3)
#else
	setx 0x0e550a4b6ed2bf74, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_20_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 259: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe8c7e1a8  ! 260: LDSWA_I	ldswa	[%r31, + 0x01a8] %asi, %r20
vahole_20_198:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87ac0a48  ! 261: FCMPd	fcmpd	%fcc<n>, %f16, %f8
	.word 0xd697e068  ! 262: LDUHA_I	lduha	[%r31, + 0x0068] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe110  ! 264: LDUBA_I	lduba	[%r31, + 0x0110] %asi, %r11
pmu_20_199:
	nop
	setx 0xfffff284fffff20d, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
vahole_20_201:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x95a0c9b3  ! 267: FDIVs	fdivs	%f3, %f19, %f10
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f7f  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0f7f, %pstate
	.word 0xe097e0f0  ! 269: LDUHA_I	lduha	[%r31, + 0x00f0] %asi, %r16
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
    brnz %r10, sma_20_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 270: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0xe07fe010  ! 271: SWAP_I	swap	%r16, [%r31 + 0x0010]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_20_204:
    set user_data_start, %o7
	.word 0x93902003  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
pmu_20_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff686fffffea5, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d934011  ! 275: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
br_badelay3_20_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa9a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa3a28830  ! 276: FADDs	fadds	%f10, %f16, %f17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_20_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d944004  ! 279: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
donret_20_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_211-donret_20_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00659b85 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1505, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_211:
	.word 0xd86fe1d5  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x01d5]
donret_20_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_212-donret_20_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0049a58e | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x111f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_212:
	.word 0x99a309c1  ! 281: FDIVd	fdivd	%f12, %f32, %f12
brcommon1_20_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a049c4  ! 282: FDIVd	fdivd	%f32, %f4, %f10
	.word 0xc19fe1c0  ! 283: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0x8d9037af  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x17af, %pstate
splash_cmpr_20_215:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 285: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_20_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 286: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9035a7  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x15a7, %pstate
splash_lsu_20_219:
	nop
	ta T_CHANGE_HPRIV
	set 0xb6059e1f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_20_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_220-donret_20_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00905cf1 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1486, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_20_220:
	.word 0xd66fe1ff  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x01ff]
	.word 0x93d020b5  ! 291: Tcc_I	tne	icc_or_xcc, %r0 + 181
	setx 0x693e3c632af50f6c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_20_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e010  ! 1: STQF_I	-	%f11, [0x0010, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd7e7e012  ! 293: CASA_R	casa	[%r31] %asi, %r18, %r11
	.word 0xd6d7e128  ! 294: LDSHA_I	ldsha	[%r31, + 0x0128] %asi, %r11
pmu_20_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff15bfffff2b0, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a00171  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_225)+0, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_225)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_225:
	.word 0xa984f0ef  ! 297: WR_SET_SOFTINT_I	wr	%r19, 0x10ef, %set_softint
memptr_20_226:
	set 0x60140000, %r31
	.word 0x8584aab2  ! 298: WRCCR_I	wr	%r18, 0x0ab2, %ccr
mondo_20_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d928011  ! 299: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0xd297e170  ! 300: LDUHA_I	lduha	[%r31, + 0x0170] %asi, %r9
vahole_20_228:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x99a4c9d3  ! 301: FDIVd	fdivd	%f50, %f50, %f12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_229)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_229)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_229:
	.word 0xa984a0ee  ! 302: WR_SET_SOFTINT_I	wr	%r18, 0x00ee, %set_softint
	.word 0x8d903bb7  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x1bb7, %pstate
vahole_20_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe91fc009  ! 304: LDDF_R	ldd	[%r31, %r9], %f20
trapasi_20_232:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8d04980  ! 305: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_233)+0, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_233)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_233:
	.word 0xa98477df  ! 306: WR_SET_SOFTINT_I	wr	%r17, 0x17df, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_234) + 48, 16, 16)) -> intp(0,0,28)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_234)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,28)
#else
	setx 0x373392c1d1268766, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_20_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7bffffff3be, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_20_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_236
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
cwq_20_236:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 310: RDPC	rd	%pc, %r17
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
    brnz %r10, sma_20_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 311: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_20_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 313: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0xd1e7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r8
	.word 0x9f802958  ! 314: SIR	sir	0x0958
	.word 0x93d02033  ! 315: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_cmpr_20_240:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 316: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_20_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d940007  ! 317: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_20_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00b  ! 319: CASA_R	casa	[%r31] %asi, %r11, %r8
br_longdelay1_20_243:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 320: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_20_244:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 321: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_20_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4b2fffff3a1, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_246:
	nop
	setx 0xfffffaa4fffffceb, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x9ba00172  ! 326: FABSq	dis not found

mondo_20_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d92c001  ! 327: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_250) + 8, 16, 16)) -> intp(0,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_250)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,4)
#else
	setx 0xa7e621cc0b9fb2ef, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_20_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_251-donret_20_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00415a35 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf73, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_251:
	.word 0xa3a349d0  ! 329: FDIVd	fdivd	%f44, %f16, %f48
	.word 0xd4c7e000  ! 330: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	.word 0xe1bfe180  ! 331: STDFA_I	stda	%f16, [0x0180, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_20_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb5dae7f	! Random illegal ?
	.word 0xa7a00553  ! 1: FSQRTd	fsqrt	
	.word 0xa3a48823  ! 333: FADDs	fadds	%f18, %f3, %f17
splash_hpstate_20_253:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x81982dc5  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc5, %hpstate
mondo_20_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d908006  ! 335: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
	.word 0xe31fc011  ! 1: LDDF_R	ldd	[%r31, %r17], %f17
	.word 0x9f803e71  ! 336: SIR	sir	0x1e71
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e000  ! 338: STX_I	stx	%r17, [%r31 + 0x0000]
pmu_20_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff457fffff601, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe227e0d8  ! 342: STW_I	stw	%r17, [%r31 + 0x00d8]
	setx 0x27556a6762a1daab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_20_258:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_20_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_259-donret_20_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0042c1cb | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xccd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x2ec8c001  ! 1: BRGEZ	brgez,a,pt	%r3,<label_0x8c001>
	done
donretarg_20_259:
	.word 0xa9a4c9c9  ! 345: FDIVd	fdivd	%f50, %f40, %f20
jmptr_20_260:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x95a00163  ! 347: FABSq	dis not found

	.word 0x94c12c76  ! 348: ADDCcc_I	addccc 	%r4, 0x0c76, %r10
mondo_20_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d90c00a  ! 349: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d3c  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1d3c, %pstate
	.word 0xe19fe0e0  ! 351: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_266) + 32, 16, 16)) -> intp(0,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_266)&0xffffffff)  + 32, 16, 16)) -> intp(0,0,4)
#else
	setx 0x0809df1e93cdb108, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_20_267:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe69fe1e0  ! 355: LDDA_I	ldda	[%r31, + 0x01e0] %asi, %r19
	.word 0xe19fe0a0  ! 356: LDDFA_I	ldda	[%r31, 0x00a0], %f16
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_268)+40, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_268)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_268:
	.word 0xa981a1a6  ! 357: WR_SET_SOFTINT_I	wr	%r6, 0x01a6, %set_softint
	setx 0x7dee86617e586102, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_20_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_270
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
cwq_20_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 359: RDPC	rd	%pc, %r20
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_20_272:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 361: RESTORE_R	restore	%r31, %r0, %r31
fpinit_20_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 362: FDIVs	fdivs	%f0, %f4, %f8
jmptr_20_274:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_20_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe0b986416522f1b5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_20_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_277
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
cwq_20_277:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 366: RDPC	rd	%pc, %r11
brcommon3_20_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c00d  ! 1: STQF_R	-	%f12, [%r13, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd91fc010  ! 367: LDDF_R	ldd	[%r31, %r16], %f12
	.word 0xd827e165  ! 368: STW_I	stw	%r12, [%r31 + 0x0165]
	.word 0xd8c7e050  ! 369: LDSWA_I	ldswa	[%r31, + 0x0050] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_279)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_279)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_279:
	.word 0xa980aa89  ! 370: WR_SET_SOFTINT_I	wr	%r2, 0x0a89, %set_softint
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
    brnz %r10, cwq_20_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_280
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
cwq_20_280:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 371: RDPC	rd	%pc, %r19
	.word 0xd4cfe0a8  ! 372: LDSBA_I	ldsba	[%r31, + 0x00a8] %asi, %r10
splash_cmpr_20_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 373: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_20_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e009  ! 374: CASA_R	casa	[%r31] %asi, %r9, %r10
br_badelay2_20_283:
	.word 0x93a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f40
	pdist %f28, %f10, %f18
	.word 0x99b40301  ! 375: ALIGNADDRESS	alignaddr	%r16, %r1, %r12
	.word 0xe19fe100  ! 376: LDDFA_I	ldda	[%r31, 0x0100], %f16
	.word 0xc30fc00a  ! 1: LDXFSR_R	ld-fsr	[%r31, %r10], %f1
	.word 0x9f802b9a  ! 377: SIR	sir	0x0b9a
	.word 0xc1bfdc00  ! 378: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa8dd000d  ! 379: SMULcc_R	smulcc 	%r20, %r13, %r20
	brlz,a,pt	%r19, skip_20_284
	fbg skip_20_284
.align 2048
skip_20_284:
	.word 0xe9e7c020  ! 380: CASA_I	casa	[%r31] 0x 1, %r0, %r20
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
    brnz %r10, cwq_20_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_285
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
cwq_20_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 381: RDPC	rd	%pc, %r17
brcommon3_20_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c012  ! 1: STQF_R	-	%f13, [%r18, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb3fc014  ! 382: STDF_R	std	%f13, [%r20, %r31]
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
	.word 0xdb1fe1a0  ! 384: LDDF_I	ldd	[%r31, 0x01a0], %f13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_288) + 8, 16, 16)) -> intp(6,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_288)&0xffffffff)  + 8, 16, 16)) -> intp(6,0,4)
#else
	setx 0x2b0d077d5329150c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_20_289:
	taddcctv %r3, 0x1d4d, %r17
	.word 0xda07e198  ! 386: LDUW_I	lduw	[%r31 + 0x0198], %r13
ibp_20_290:
	nop
	.word 0xc1bfda00  ! 387: STDFA_R	stda	%f0, [%r0, %r31]
cwp_20_291:
    set user_data_start, %o7
	.word 0x93902000  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_20_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff140fffff67f, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_20_294:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x95410000  ! 391: RDTICK	rd	%tick, %r10
cwp_20_295:
    set user_data_start, %o7
	.word 0x93902000  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_20_296:
	nop
	ta T_CHANGE_HPRIV
	set 0x4f501005, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_20_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0x550347884561ba7e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_20_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbd6, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe31fe110  ! 397: LDDF_I	ldd	[%r31, 0x0110], %f17
mondo_20_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 398: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0xe19fd920  ! 399: LDDFA_R	ldda	[%r31, %r0], %f16
splash_decr_20_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7840013  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r19, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_302) + 0, 16, 16)) -> intp(5,0,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_302)&0xffffffff)  + 0, 16, 16)) -> intp(5,0,1)
#else
	setx 0x13c70b920b4455e5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_20_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa5a00550  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1a0  ! 402: STDFA_I	stda	%f0, [0x01a0, %r31]
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
    brnz %r10, sma_20_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 403: CASA_R	casa	[%r31] %asi, %r10, %r9
pmu_20_305:
	nop
	setx 0xfffff0b3fffffab6, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_306:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_308) + 48, 16, 16)) -> intp(3,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_308)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,5)
#else
	setx 0xd23f188784f0b496, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_309:
	.word 0x81983d91  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d91, %hpstate
br_badelay2_20_310:
	.word 0xa1a489d2  ! 1: FDIVd	fdivd	%f18, %f18, %f16
	pdist %f20, %f4, %f28
	.word 0xa5b4c304  ! 409: ALIGNADDRESS	alignaddr	%r19, %r4, %r18
splash_cmpr_20_311:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 410: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_20_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 411: CASA_R	casa	[%r31] %asi, %r8, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_313)+8, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_313)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_313:
	.word 0xa982fa72  ! 412: WR_SET_SOFTINT_I	wr	%r11, 0x1a72, %set_softint
memptr_20_314:
	set 0x60540000, %r31
	.word 0x8582ab30  ! 413: WRCCR_I	wr	%r10, 0x0b30, %ccr
	.word 0x9191c007  ! 414: WRPR_PIL_R	wrpr	%r7, %r7, %pil
	.word 0xe497c032  ! 1: LDUHA_R	lduha	[%r31, %r18] 0x01, %r18
	.word 0x9f802865  ! 415: SIR	sir	0x0865
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
    brnz %r10, cwq_20_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_316
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
cwq_20_316:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 416: RDPC	rd	%pc, %r17
intveclr_20_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc91d96a726a4af62, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 418: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x82ad2ffbf2490b7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_20_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d950003  ! 421: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
splash_lsu_20_322:
	nop
	ta T_CHANGE_HPRIV
	set 0x7fc8a7eb, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe0ab  ! 424: STD_I	std	%r13, [%r31 + 0x00ab]
	.word 0x91d020b4  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 180
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d902c0c  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x0c0c, %pstate
br_badelay2_20_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa9b0430b  ! 428: ALIGNADDRESS	alignaddr	%r1, %r11, %r20
vahole_20_325:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd69fc034  ! 429: LDDA_R	ldda	[%r31, %r20] 0x01, %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_326) + 56, 16, 16)) -> intp(5,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_326)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,24)
#else
	setx 0x3d030e1c688cf288, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_327:
	ta T_CHANGE_NONHPRIV
	.word 0x819834d1  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x14d1, %hpstate
splash_htba_20_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0xa5b50551  ! 434: FCMPEQ16	fcmpeq16	%d20, %d48, %r18
donret_20_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_329-donret_20_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fc2af5 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc49, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_329:
	.word 0xd8ffe0d4  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x00d4] %asi
	.word 0xa1a40d23  ! 436: FsMULd	fsmuld	%f16, %f34, %f16
splash_tba_20_330:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_20_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_331-donret_20_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004da436 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x96, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x24c8c001  ! 1: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
	done
donretarg_20_331:
	.word 0xe26fe0d6  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x00d6]
donret_20_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_332-donret_20_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00665569 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd44, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_332:
	.word 0x9ba4c9c7  ! 441: FDIVd	fdivd	%f50, %f38, %f44
	setx 0xcc19be796bcca753, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe1b8  ! 443: LDUBA_I	lduba	[%r31, + 0x01b8] %asi, %r20
	.word 0xe937e150  ! 444: STQF_I	-	%f20, [0x0150, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa1702d5d  ! 446: POPC_I	popc	0x0d5d, %r16
brcommon2_20_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe1108007  ! 1: LDQF_R	-	[%r2, %r7], %f16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdf20  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa44ac004  ! 448: MULX_R	mulx 	%r11, %r4, %r18
splash_lsu_20_337:
	nop
	ta T_CHANGE_HPRIV
	set 0x7c0f9714, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 450: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_20_340:
	ta T_CHANGE_NONHPRIV
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81983c9b  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9b, %hpstate
pmu_20_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff056fffffe56, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02035  ! 454: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93a409b4  ! 455: FDIVs	fdivs	%f16, %f20, %f9
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_20_342:
    set user_data_start, %o7
	.word 0x93902006  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
jmptr_20_343:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_344:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_345:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe73fc014  ! 461: STDF_R	std	%f19, [%r20, %r31]
brcommon1_20_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa7702120  ! 1: POPC_I	popc	0x0120, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1a2c9cd  ! 462: FDIVd	fdivd	%f42, %f44, %f16
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_20_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 464: RDTICK	rd	%tick, %r18
splash_cmpr_20_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 465: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa2818013  ! 466: ADDcc_R	addcc 	%r6, %r19, %r17
	.word 0xd28008a0  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_20_351:
	set user_data_start, %r31
	.word 0x8581a839  ! 468: WRCCR_I	wr	%r6, 0x0839, %ccr
	.word 0xd27fe1f0  ! 469: SWAP_I	swap	%r9, [%r31 + 0x01f0]
	.word 0xc3efc032  ! 1: PREFETCHA_R	prefetcha	[%r31, %r18] 0x01, #one_read
	.word 0x9f802861  ! 470: SIR	sir	0x0861
	.word 0x9191400b  ! 471: WRPR_PIL_R	wrpr	%r5, %r11, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_20_353:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3ecc030  ! 474: PREFETCHA_R	prefetcha	[%r19, %r16] 0x01, #one_read
unsupttte_20_355:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba489c8  ! 475: FDIVd	fdivd	%f18, %f8, %f44
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_356)+24, 16, 16)) -> intp(mask2tid(0x20),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_356)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x20),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_20_356:
	.word 0xa9832e60  ! 476: WR_SET_SOFTINT_I	wr	%r12, 0x0e60, %set_softint
trapasi_20_357:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8904980  ! 477: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r12
	.word 0xc19fe080  ! 478: LDDFA_I	ldda	[%r31, 0x0080], %f0
donret_20_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_358-donret_20_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d4f573 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4cd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_358:
	.word 0xd8ffe0cc  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x00cc] %asi
invtsb_20_359:
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
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_20_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d940010  ! 481: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xc19fdb60  ! 482: LDDFA_R	ldda	[%r31, %r0], %f0
br_badelay1_20_361:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0xd937c014  ! 1: STQF_R	-	%f12, [%r20, %r31]
	.word 0x87afca54  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f20
	normalw
	.word 0xa1458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xdbe7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r13
	.word 0x9f8021a3  ! 484: SIR	sir	0x01a3
	.word 0xdb27e0e0  ! 485: STF_I	st	%f13, [0x00e0, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_20_362:
	nop
	setx 0xfffff871fffff968, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d9034d1  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x14d1, %pstate
	fbug,a,pn	%fcc0,  skip_20_364
	.word 0x87ac0a42  ! 1: FCMPd	fcmpd	%fcc<n>, %f16, %f2
.align 32
skip_20_364:
	.word 0xc30fc000  ! 490: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
donret_20_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_365-donret_20_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0034a198 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x517, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_365:
	.word 0xdaffe13c  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x013c] %asi
	.word 0xdb27e0f4  ! 492: STF_I	st	%f13, [0x00f4, %r31]
	.word 0xdaffc02b  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r11] 0x01
splash_cmpr_20_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 494: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9bb7c7cd  ! 1: PDIST	pdistn	%d62, %d44, %d44
	.word 0x9f80249a  ! 496: SIR	sir	0x049a
pmu_20_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc31fffff36b, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_20_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_368
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
cwq_20_368:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 498: RDPC	rd	%pc, %r13
change_to_randtl_20_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_20_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c00d  ! 501: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
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
br_longdelay1_10_0:
	.word 0x2ecb0001  ! 1: BRGEZ	brgez,a,pt	%r12,<label_0xb0001>
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xc36fe134  ! 2: PREFETCH_I	prefetch	[%r31 + 0x0134], #one_read
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
	.word 0xe7e7e011  ! 3: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_3:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa782c011  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r17, %-
	.word 0x87ab0ac5  ! 6: FCMPEd	fcmped	%fcc<n>, %f12, %f36
	setx vahole_target1, %r18, %r27
	.word 0xe6bfc034  ! 7: STDA_R	stda	%r19, [%r31 + %r20] 0x01
memptr_10_6:
	set user_data_start, %r31
	.word 0x8582b46a  ! 8: WRCCR_I	wr	%r10, 0x146a, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_10_7:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa9410000  ! 10: RDTICK	rd	%tick, %r20
splash_lsu_10_8:
	nop
	ta T_CHANGE_HPRIV
	set 0x10b1cc51, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_10_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe000  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0000]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a449d3  ! 12: FDIVd	fdivd	%f48, %f50, %f10
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_10_10:
	nop
	setx 0xfffffd80fffffb3e, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_10_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc40fffffba9, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_12:
	nop
	.word 0xc19fde00  ! 17: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_10_13:
	nop
	.word 0xe1bfdf20  ! 18: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd65fe198  ! 19: LDX_I	ldx	[%r31 + 0x0198], %r11
	.word 0xd727e1ce  ! 20: STF_I	st	%f11, [0x01ce, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_14) + 48, 16, 16)) -> intp(5,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_14)&0xffffffff)  + 48, 16, 16)) -> intp(5,0,20)
#else
	setx 0xcb2245389f2771a0, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_10_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_15-donret_10_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0096ed84 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x513, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_15:
	.word 0xd6ffe17b  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x017b] %asi
    set 0x10b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb507c4  ! 24: PDIST	pdistn	%d20, %d4, %d44
	.word 0xe1bfc3e0  ! 25: STDFA_R	stda	%f16, [%r0, %r31]
pmu_10_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe4dfffff999, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target1, %r18, %r27
	.word 0xd03fe120  ! 27: STD_I	std	%r8, [%r31 + 0x0120]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_18)+0, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_18)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_18:
	.word 0xa98173e8  ! 28: WR_SET_SOFTINT_I	wr	%r5, 0x13e8, %set_softint
	.word 0xa5a0016a  ! 29: FABSq	dis not found

donret_10_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_20-donret_10_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00729101 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf98, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_20:
	.word 0xe2ffe0cc  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x00cc] %asi
	.word 0xa781800c  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r12, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_22) + 32, 16, 16)) -> intp(6,0,22)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_22)&0xffffffff)  + 32, 16, 16)) -> intp(6,0,22)
#else
	setx 0x780da242da59efda, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_23:
	set 0x60340000, %r31
	.word 0x8582b274  ! 33: WRCCR_I	wr	%r10, 0x1274, %ccr
	.word 0xc3e8c032  ! 34: PREFETCHA_R	prefetcha	[%r3, %r18] 0x01, #one_read
brcommon3_10_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc011  ! 35: STXFSR_R	st-sfr	%f1, [%r17, %r31]
jmptr_10_26:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_10_27:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_10_28:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 38: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_10_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 39: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
brcommon3_10_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe040  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0040]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc008  ! 40: STXFSR_R	st-sfr	%f1, [%r8, %r31]
	.word 0xd2dfe0f8  ! 41: LDXA_I	ldxa	[%r31, + 0x00f8] %asi, %r9
	.word 0xd327e085  ! 42: STF_I	st	%f9, [0x0085, %r31]
	setx 0xcfd835b6afb2cbbe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d91c009  ! 44: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
ceter_10_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa7410000  ! 45: RDTICK	rd	%tick, %r19
	.word 0x91948013  ! 46: WRPR_PIL_R	wrpr	%r18, %r19, %pil
splash_tba_10_35:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_10_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d914012  ! 48: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0x9f8022d3  ! 49: SIR	sir	0x02d3
br_longdelay2_10_37:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a7c9d4  ! 50: FDIVd	fdivd	%f62, %f20, %f48
splash_cmpr_10_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 51: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_10_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 52: CASA_R	casa	[%r31] %asi, %r13, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_40)+48, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_40)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_40:
	.word 0xa9832864  ! 53: WR_SET_SOFTINT_I	wr	%r12, 0x0864, %set_softint
jmptr_10_41:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_10_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_42-donret_10_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00970562 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe11, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_42:
	.word 0xe26fe0a5  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a5]
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
    brnz %r10, cwq_10_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_43
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
cwq_10_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 56: RDPC	rd	%pc, %r20
splash_hpstate_10_44:
	.word 0x8198218d  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d903c8d  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x1c8d, %pstate
mondo_10_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d940012  ! 59: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
mondo_10_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d908005  ! 60: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
splash_hpstate_10_48:
	ta T_CHANGE_NONHPRIV
	.word 0x819830c7  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x10c7, %hpstate
	.word 0xd31fe090  ! 62: LDDF_I	ldd	[%r31, 0x0090], %f9
	setx vahole_target2, %r18, %r27
	.word 0xc1bfe1e0  ! 63: STDFA_I	stda	%f0, [0x01e0, %r31]
brcommon1_10_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c034  ! 1: CASA_I	casa	[%r31] 0x 1, %r20, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803d97  ! 64: SIR	sir	0x1d97
splash_hpstate_10_51:
	ta T_CHANGE_NONHPRIV
	.word 0x81983a17  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a17, %hpstate
	.word 0x8d90362a  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x162a, %pstate
	.word 0xe19fde00  ! 67: LDDFA_R	ldda	[%r31, %r0], %f16
br_badelay1_10_54:
	.word 0x2ec84001  ! 1: BRGEZ	brgez,a,pt	%r1,<label_0x84001>
	.word 0xd337e160  ! 1: STQF_I	-	%f9, [0x0160, %r31]
	.word 0x87afca51  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f48
	normalw
	.word 0xa3458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xd82fe10f  ! 69: STB_I	stb	%r12, [%r31 + 0x010f]
donret_10_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_55-donret_10_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0050867c | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b01, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_55:
	.word 0x9ba089cd  ! 70: FDIVd	fdivd	%f2, %f44, %f44
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
    brnz %r10, sma_10_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00d  ! 71: CASA_R	casa	[%r31] %asi, %r13, %r19
	.word 0xe19fe140  ! 72: LDDFA_I	ldda	[%r31, 0x0140], %f16
mondo_10_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d94c00a  ! 73: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_10_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 76: CASA_R	casa	[%r31] %asi, %r11, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9153c000  ! 79: RDPR_FQ	<illegal instruction>
donret_10_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_59-donret_10_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00516fb9 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1545, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_59:
	.word 0x9ba409d3  ! 80: FDIVd	fdivd	%f16, %f50, %f44
	.word 0xda8fe090  ! 81: LDUBA_I	lduba	[%r31, + 0x0090] %asi, %r13
	.word 0xe19fdf20  ! 82: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_10_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_60:
	.word 0x8f902001  ! 83: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_10_61:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 84: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_10_62:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94c003  ! 86: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_64)+0, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_64)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_64:
	.word 0xa98424f6  ! 87: WR_SET_SOFTINT_I	wr	%r16, 0x04f6, %set_softint
	.word 0xdb37e082  ! 88: STQF_I	-	%f13, [0x0082, %r31]
mondo_10_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d948014  ! 89: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_10_66:
	set user_data_start, %r31
	.word 0x8584e9f5  ! 91: WRCCR_I	wr	%r19, 0x09f5, %ccr
jmptr_10_67:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 94: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx vahole_target0, %r18, %r27
	.word 0xdb1fc00b  ! 95: LDDF_R	ldd	[%r31, %r11], %f13
pmu_10_70:
	nop
	setx 0xfffffc55fffff347, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_71:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_10_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_10_73:
	.word 0x819828de  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08de, %hpstate
donret_10_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_74-donret_10_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0005456b | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1605, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_74:
	.word 0xda6fe193  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x0193]
change_to_randtl_10_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_75:
	.word 0x8f902000  ! 101: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9ba0c9c7  ! 102: FDIVd	fdivd	%f34, %f38, %f44
	.word 0x8d903f7d  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x1f7d, %pstate
intveclr_10_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0x50045632e22f1db2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_10_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_79-donret_10_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007b56d2 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xddf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_79:
	.word 0x95a509d4  ! 105: FDIVd	fdivd	%f20, %f20, %f10
	.word 0xe4d7e0a0  ! 106: LDSHA_I	ldsha	[%r31, + 0x00a0] %asi, %r18
tagged_10_80:
	tsubcctv %r17, 0x142d, %r17
	.word 0xe407e190  ! 107: LDUW_I	lduw	[%r31 + 0x0190], %r18
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
    brnz %r10, cwq_10_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_81
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
cwq_10_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 108: RDPC	rd	%pc, %r18
splash_lsu_10_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x760da187, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 110: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_10_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_10_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94800a  ! 112: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0xc1bfd960  ! 113: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fde00  ! 114: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_10_86:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 115: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_87)+32, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_87)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_87:
	.word 0xa98461de  ! 116: WR_SET_SOFTINT_I	wr	%r17, 0x01de, %set_softint
brcommon3_10_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c009  ! 1: STQF_R	-	%f8, [%r9, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd097c033  ! 117: LDUHA_R	lduha	[%r31, %r19] 0x01, %r8
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0x8d903fd9  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x1fd9, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_91)+32, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_91)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_91:
	.word 0xa980f742  ! 120: WR_SET_SOFTINT_I	wr	%r3, 0x1742, %set_softint
splash_cmpr_10_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 121: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91a00172  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_10_95:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 124: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfda00  ! 125: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_10_96:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x4021df01bdcf8e2e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff45cfffffc50, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_10_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_99-donret_10_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005cafa6 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1717, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_99:
	.word 0x99a049c4  ! 129: FDIVd	fdivd	%f32, %f4, %f12
pmu_10_100:
	nop
	setx 0xfffff611ffffff0f, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950007  ! 131: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
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
    brnz %r10, sma_10_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 132: CASA_R	casa	[%r31] %asi, %r11, %r12
	.word 0xe1bfdc00  ! 133: STDFA_R	stda	%f16, [%r0, %r31]
splash_tba_10_103:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_10_104:
	nop
	ta T_CHANGE_HPRIV
	set 0xfe91ae99, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xc6faa98eb99c7282, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_10_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_106:
	.word 0x8f902000  ! 137: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_10_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_107
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
cwq_10_107:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 138: RDPC	rd	%pc, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_108)+48, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_108)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_108:
	.word 0xa9826c76  ! 139: WR_SET_SOFTINT_I	wr	%r9, 0x0c76, %set_softint
br_badelay1_10_109:
	.word 0xe5e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r18
	.word 0xd9307382  ! 1: STQF_I	-	%f12, [0x1382, %r1]
	.word 0xdbe7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r13
	normalw
	.word 0xa5458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_110:
	ta	T_CHANGE_NONHPRIV	! macro
	setx vahole_target1, %r18, %r27
	.word 0xa7b44493  ! 142: FCMPLE32	fcmple32	%d48, %d50, %r19
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
    brnz %r10, cwq_10_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_112
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
cwq_10_112:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 143: RDPC	rd	%pc, %r13
	.word 0xd91fe020  ! 144: LDDF_I	ldd	[%r31, 0x0020], %f12
	setx 0xc2bb670f0d77b2b4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0d1c009  ! 146: UMULcc_R	umulcc 	%r7, %r9, %r16
splash_cmpr_10_114:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 147: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_10_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d928014  ! 148: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
change_to_randtl_10_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_116:
	.word 0x8f902000  ! 149: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_10_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_117:
	.word 0x8f902002  ! 150: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_118) + 48, 16, 16)) -> intp(5,0,2)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_118)&0xffffffff)  + 48, 16, 16)) -> intp(5,0,2)
#else
	setx 0xe299edc47e273fd2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_119:
	set 0x60340000, %r31
	.word 0x8584f6d2  ! 152: WRCCR_I	wr	%r19, 0x16d2, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902d89  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0d89, %pstate
mondo_10_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d90c003  ! 155: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
	.word 0x8d902743  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x0743, %pstate
	.word 0x91d02035  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0x7bead1f9b9fd19da, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36d0011  ! 159: PREFETCH_R	prefetch	[%r20 + %r17], #one_read
fpinit_10_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 160: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_hpstate_10_125:
	ta T_CHANGE_NONHPRIV
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x81982d8c  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_10_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 163: CASA_R	casa	[%r31] %asi, %r17, %r16
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
    brnz %r10, sma_10_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e008  ! 164: CASA_R	casa	[%r31] %asi, %r8, %r16
pmu_10_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5c3fffff82d, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 166: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_10_130:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 167: RDTICK	rd	%tick, %r17
jmptr_10_131:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa56a4012  ! 169: SDIVX_R	sdivx	%r9, %r18, %r18
splash_cmpr_10_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 170: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_10_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_133
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
cwq_10_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 172: RDPC	rd	%pc, %r20
jmptr_10_134:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd140  ! 174: LDDA_R	ldda	[%r31, %r0] 0x8a, %r16
	setx 0x1935ca90dcf5ef83, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_136:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 176: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e0f8  ! 177: LDSHA_I	ldsha	[%r31, + 0x00f8] %asi, %r16
splash_cmpr_10_137:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_10_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d940013  ! 179: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
change_to_randtl_10_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_139:
	.word 0x8f902000  ! 180: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
jmptr_10_140:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9195000d  ! 182: WRPR_PIL_R	wrpr	%r20, %r13, %pil
donret_10_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_142-donret_10_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c8d450 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1715, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_142:
	.word 0x95a409c8  ! 183: FDIVd	fdivd	%f16, %f8, %f10
	.word 0xe6c7e1e0  ! 184: LDSWA_I	ldswa	[%r31, + 0x01e0] %asi, %r19
	.word 0xc1bfde00  ! 185: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe6cfe1e8  ! 186: LDSBA_I	ldsba	[%r31, + 0x01e8] %asi, %r19
splash_cmpr_10_143:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 187: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9a828003  ! 188: ADDcc_R	addcc 	%r10, %r3, %r13
ibp_10_144:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd960  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
ceter_10_145:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 190: RDTICK	rd	%tick, %r20
ceter_10_146:
    nop
    ta T_CHANGE_HPRIV
    mov 4, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 191: RDTICK	rd	%tick, %r16
	setx 0x01809d2bbc4f12a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0x91a00173  ! 194: FABSq	dis not found

	.word 0xe6c7e100  ! 195: LDSWA_I	ldswa	[%r31, + 0x0100] %asi, %r19
splash_lsu_10_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x3379da30, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe1f0  ! 198: LDX_I	ldx	[%r31 + 0x01f0], %r19
splash_hpstate_10_152:
	ta T_CHANGE_NONHPRIV
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x81982015  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0015, %hpstate
	.word 0x9353c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0x9f803fb5  ! 201: SIR	sir	0x1fb5
mondo_10_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 202: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
jmptr_10_154:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x24c8c001  ! 204: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
pmu_10_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff702ffffffbe, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xb2c9a0a7760df14a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e088  ! 207: STX_I	stx	%r19, [%r31 + 0x0088]
brcommon2_10_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a7c973  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe1e0  ! 208: LDDFA_I	ldda	[%r31, 0x01e0], %f0
	.word 0xa2fc4014  ! 209: SDIVcc_R	sdivcc 	%r17, %r20, %r17
	.word 0xd897e068  ! 210: LDUHA_I	lduha	[%r31, + 0x0068] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_10_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_159:
	.word 0x8f902002  ! 212: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_10_160:
	tsubcctv %r7, 0x1fed, %r11
	.word 0xd807e0dc  ! 213: LDUW_I	lduw	[%r31 + 0x00dc], %r12
br_badelay1_10_161:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0xd937c013  ! 1: STQF_R	-	%f12, [%r19, %r31]
	.word 0xd83fc012  ! 1: STD_R	std	%r12, [%r31 + %r18]
	normalw
	.word 0xa1458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r16
pmu_10_162:
	nop
	setx 0xfffff4cafffffca6, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_10_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff112fffff989, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc1bfc3e0  ! 219: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfc2c0  ! 220: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfe0c0  ! 221: STDFA_I	stda	%f0, [0x00c0, %r31]
	setx 0xd05f7fc9c9820ecd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_10_166:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0xbfefc000  ! 223: RESTORE_R	restore	%r31, %r0, %r31
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
    brnz %r10, sma_10_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 224: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_10_168:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xed4e4d2aeb6de012, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90c00a  ! 227: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
splash_cmpr_10_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 228: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_10_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff992fffff4e1, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xb5cc2436, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92c00a  ! 231: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
memptr_10_175:
	set 0x60740000, %r31
	.word 0x8582addf  ! 232: WRCCR_I	wr	%r10, 0x0ddf, %ccr
mondo_10_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 233: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_177)+24, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_177)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_177:
	.word 0xa98469ca  ! 234: WR_SET_SOFTINT_I	wr	%r17, 0x09ca, %set_softint
splash_lsu_10_178:
	nop
	ta T_CHANGE_HPRIV
	set 0x7ba63b1e, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_179:
	nop
	setx 0xffffff18fffff753, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_180:
	nop
	ta T_CHANGE_HPRIV
	set 0x01b5858f, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 238: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e0d0  ! 239: LDSH_I	ldsh	[%r31 + 0x00d0], %r16
donret_10_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_182-donret_10_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001c6e1c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_182:
	.word 0xe0ffe016  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x0016] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe0a0  ! 242: STDFA_I	stda	%f0, [0x00a0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_184)+40, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_184)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_184:
	.word 0xa980b57a  ! 243: WR_SET_SOFTINT_I	wr	%r2, 0x157a, %set_softint
	.word 0x87ab4a53  ! 244: FCMPd	fcmpd	%fcc<n>, %f44, %f50
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_10_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_186
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
cwq_10_186:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 246: RDPC	rd	%pc, %r19
	setx 0xe9577a6dcaeff96d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_188:
	nop
	setx 0xfffff9a8fffff6ca, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_189:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 249: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_10_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_190-donret_10_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e1175e | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c55, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_190:
	.word 0xa5a4c9ca  ! 250: FDIVd	fdivd	%f50, %f10, %f18
memptr_10_191:
	set 0x60340000, %r31
	.word 0x8580e060  ! 251: WRCCR_I	wr	%r3, 0x0060, %ccr
	.word 0xe49fc240  ! 252: LDDA_R	ldda	[%r31, %r0] 0x12, %r18
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_10_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_193
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
cwq_10_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 254: RDPC	rd	%pc, %r20
splash_lsu_10_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x756f1ae0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9953c000  ! 256: RDPR_FQ	<illegal instruction>
	setx vahole_target2, %r18, %r27
	.word 0xe91fe170  ! 257: LDDF_I	ldd	[%r31, 0x0170], %f20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_196) + 40, 16, 16)) -> intp(0,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_196)&0xffffffff)  + 40, 16, 16)) -> intp(0,0,7)
#else
	setx 0xf1ac696d70211ca6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_10_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 259: CASA_R	casa	[%r31] %asi, %r19, %r20
	.word 0xe8c7e068  ! 260: LDSWA_I	ldswa	[%r31, + 0x0068] %asi, %r20
	setx vahole_target3, %r18, %r27
	.word 0x9bb2c7d4  ! 261: PDIST	pdistn	%d42, %d20, %d44
	.word 0xd697e048  ! 262: LDUHA_I	lduha	[%r31, + 0x0048] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe100  ! 264: LDUBA_I	lduba	[%r31, + 0x0100] %asi, %r11
pmu_10_199:
	nop
	setx 0xfffff382fffff9f4, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
	setx vahole_target1, %r18, %r27
	.word 0x95b10486  ! 267: FCMPLE32	fcmple32	%d4, %d6, %r10
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d90350f  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x150f, %pstate
	.word 0xe097e128  ! 269: LDUHA_I	lduha	[%r31, + 0x0128] %asi, %r16
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
    brnz %r10, sma_10_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00d  ! 270: CASA_R	casa	[%r31] %asi, %r13, %r16
	.word 0xe07fe1e0  ! 271: SWAP_I	swap	%r16, [%r31 + 0x01e0]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_10_204:
    set user_data_start, %o7
	.word 0x93902004  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
pmu_10_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4a8fffff702, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d90c014  ! 275: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
br_badelay3_10_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa9a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x91a40830  ! 276: FADDs	fadds	%f16, %f16, %f8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_10_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d904013  ! 279: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
donret_10_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_211-donret_10_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003ec246 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc45, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_211:
	.word 0xd86fe06e  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x006e]
donret_10_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_212-donret_10_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0082a39a | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x496, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_212:
	.word 0x99a409d3  ! 281: FDIVd	fdivd	%f16, %f50, %f12
brcommon1_10_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93703194  ! 282: POPC_I	popc	0x1194, %r9
	.word 0xe19fe080  ! 283: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0x8d903539  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x1539, %pstate
splash_cmpr_10_215:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 285: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_10_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 286: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d902895  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
splash_lsu_10_219:
	nop
	ta T_CHANGE_HPRIV
	set 0x718fbdc8, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_10_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_220-donret_10_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff4f63 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x84e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	retry
donretarg_10_220:
	.word 0xd66fe0ed  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x00ed]
	.word 0x91d02035  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0x3e089e7962cbadf3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_10_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e100  ! 1: STQF_I	-	%f11, [0x0100, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd697c033  ! 293: LDUHA_R	lduha	[%r31, %r19] 0x01, %r11
	.word 0xd6d7e050  ! 294: LDSHA_I	ldsha	[%r31, + 0x0050] %asi, %r11
pmu_10_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff128fffffdd0, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a00174  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_225)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_225)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_225:
	.word 0xa981afb4  ! 297: WR_SET_SOFTINT_I	wr	%r6, 0x0fb4, %set_softint
memptr_10_226:
	set 0x60740000, %r31
	.word 0x8582f779  ! 298: WRCCR_I	wr	%r11, 0x1779, %ccr
mondo_10_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d90c004  ! 299: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
	.word 0xd297e0c8  ! 300: LDUHA_I	lduha	[%r31, + 0x00c8] %asi, %r9
	setx vahole_target2, %r18, %r27
	.word 0x87ac0a4d  ! 301: FCMPd	fcmpd	%fcc<n>, %f16, %f44
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_229)+24, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_229)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_229:
	.word 0xa9846b73  ! 302: WR_SET_SOFTINT_I	wr	%r17, 0x0b73, %set_softint
	.word 0x8d903301  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x1301, %pstate
	setx vahole_target0, %r18, %r27
	.word 0xe8bfc031  ! 304: STDA_R	stda	%r20, [%r31 + %r17] 0x01
trapasi_10_232:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8884980  ! 305: LDUBA_R	lduba	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_233)+0, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_233)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_233:
	.word 0xa9847b9a  ! 306: WR_SET_SOFTINT_I	wr	%r17, 0x1b9a, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_234) + 24, 16, 16)) -> intp(5,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_234)&0xffffffff)  + 24, 16, 16)) -> intp(5,0,5)
#else
	setx 0x07cba0aae0777f03, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_10_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff58afffff72f, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_10_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_236
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
cwq_10_236:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 310: RDPC	rd	%pc, %r19
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
    brnz %r10, sma_10_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 311: CASA_R	casa	[%r31] %asi, %r17, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_10_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 313: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x9f802b60  ! 314: SIR	sir	0x0b60
	.word 0x91d020b3  ! 315: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_cmpr_10_240:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_10_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d920007  ! 317: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_10_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 319: CASA_R	casa	[%r31] %asi, %r20, %r8
br_longdelay1_10_243:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 320: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_10_244:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 321: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_10_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffabafffff313, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_246:
	nop
	setx 0xfffffc2bfffffd61, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x9ba00171  ! 326: FABSq	dis not found

mondo_10_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 327: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_250) + 48, 16, 16)) -> intp(6,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_250)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,17)
#else
	setx 0xafeea9bc011b3b42, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_10_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_251-donret_10_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e5fa2 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdd5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_10_251:
	.word 0xa1a489d2  ! 329: FDIVd	fdivd	%f18, %f18, %f16
	.word 0xd4c7e008  ! 330: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r10
	.word 0xe1bfe0e0  ! 331: STDFA_I	stda	%f16, [0x00e0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_10_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe578d806	! Random illegal ?
	.word 0x99a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa5a24832  ! 333: FADDs	fadds	%f9, %f18, %f18
splash_hpstate_10_253:
	.word 0x2acb0001  ! 1: BRNZ	brnz,a,pt	%r12,<label_0xb0001>
	.word 0x81983a4b  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a4b, %hpstate
mondo_10_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d950005  ! 335: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x9f803b8a  ! 336: SIR	sir	0x1b8a
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e0e0  ! 338: STX_I	stx	%r17, [%r31 + 0x00e0]
pmu_10_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5b9fffff990, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 341: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe227e1e2  ! 342: STW_I	stw	%r17, [%r31 + 0x01e2]
	setx 0xf147c530a577dc66, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_10_258:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_10_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_259-donret_10_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0081c6ec | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x715, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_10_259:
	.word 0x95a149d3  ! 345: FDIVd	fdivd	%f36, %f50, %f10
jmptr_10_260:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa3a00167  ! 347: FABSq	dis not found

	.word 0x96c0f5cb  ! 348: ADDCcc_I	addccc 	%r3, 0xfffff5cb, %r11
mondo_10_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d928013  ! 349: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d903218  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1218, %pstate
	.word 0xe19fe0e0  ! 351: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_266) + 56, 16, 16)) -> intp(7,0,7)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_266)&0xffffffff)  + 56, 16, 16)) -> intp(7,0,7)
#else
	setx 0x7122ac1e27db9ea9, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target1, %r18, %r27
	.word 0xe63fe090  ! 355: STD_I	std	%r19, [%r31 + 0x0090]
	.word 0xc19fe080  ! 356: LDDFA_I	ldda	[%r31, 0x0080], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_268)+40, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_268)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_268:
	.word 0xa9842312  ! 357: WR_SET_SOFTINT_I	wr	%r16, 0x0312, %set_softint
	setx 0x7186f64451a600ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_10_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_270
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
cwq_10_270:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 359: RDPC	rd	%pc, %r10
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_10_272:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9d97c000  ! 361: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
fpinit_10_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8376b  ! 362: PREFETCHA_I	prefetcha	[%r0, + 0xfffff76b] %asi, #one_read
jmptr_10_274:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_10_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaa830dec8669510d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_10_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_277
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
cwq_10_277:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 366: RDPC	rd	%pc, %r16
brcommon3_10_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c00c  ! 1: STQF_R	-	%f12, [%r12, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd89fe060  ! 367: LDDA_I	ldda	[%r31, + 0x0060] %asi, %r12
	.word 0xd827e1fe  ! 368: STW_I	stw	%r12, [%r31 + 0x01fe]
	.word 0xd8c7e1d8  ! 369: LDSWA_I	ldswa	[%r31, + 0x01d8] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_279)+16, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_279)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_279:
	.word 0xa9826f1c  ! 370: WR_SET_SOFTINT_I	wr	%r9, 0x0f1c, %set_softint
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
    brnz %r10, cwq_10_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_280
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
cwq_10_280:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 371: RDPC	rd	%pc, %r16
	.word 0xd4cfe050  ! 372: LDSBA_I	ldsba	[%r31, + 0x0050] %asi, %r10
splash_cmpr_10_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 373: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_10_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00c  ! 374: CASA_R	casa	[%r31] %asi, %r12, %r10
br_badelay2_10_283:
	.word 0xa1a409d2  ! 1: FDIVd	fdivd	%f16, %f18, %f16
	pdist %f8, %f8, %f26
	.word 0x91b14314  ! 375: ALIGNADDRESS	alignaddr	%r5, %r20, %r8
	.word 0xe19fe1e0  ! 376: LDDFA_I	ldda	[%r31, 0x01e0], %f16
	.word 0x9f802663  ! 377: SIR	sir	0x0663
	.word 0xe1bfdb60  ! 378: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x92d98013  ! 379: SMULcc_R	smulcc 	%r6, %r19, %r9
	.word 0xc32fc000  ! 380: STXFSR_R	st-sfr	%f1, [%r0, %r31]
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
    brnz %r10, cwq_10_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_285
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
cwq_10_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 381: RDPC	rd	%pc, %r19
brcommon3_10_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c00d  ! 1: STQF_R	-	%f13, [%r13, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdadfc02b  ! 382: LDXA_R	ldxa	[%r31, %r11] 0x01, %r13
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
	.word 0xda9fc028  ! 384: LDDA_R	ldda	[%r31, %r8] 0x01, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_288) + 8, 16, 16)) -> intp(3,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_288)&0xffffffff)  + 8, 16, 16)) -> intp(3,0,29)
#else
	setx 0x998e5d24d51a20b0, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_10_289:
	taddcctv %r12, 0x120d, %r3
	.word 0xda07e077  ! 386: LDUW_I	lduw	[%r31 + 0x0077], %r13
ibp_10_290:
	nop
	.word 0xe1bfe060  ! 387: STDFA_I	stda	%f16, [0x0060, %r31]
cwp_10_291:
    set user_data_start, %o7
	.word 0x93902000  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
pmu_10_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa40fffff169, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_10_294:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x99410000  ! 391: RDTICK	rd	%tick, %r12
cwp_10_295:
    set user_data_start, %o7
	.word 0x93902003  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_10_296:
	nop
	ta T_CHANGE_HPRIV
	set 0xafa600e7, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_10_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd9d83f052326f7e9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_10_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xde9, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 397: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_10_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d904008  ! 398: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
	.word 0xc19fdc00  ! 399: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa7834001  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r1, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_302) + 48, 16, 16)) -> intp(7,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_302)&0xffffffff)  + 48, 16, 16)) -> intp(7,0,13)
#else
	setx 0x9d10fbf2d4f832d9, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_10_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f802040  ! 1: SIR	sir	0x0040
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe1e0  ! 402: STDFA_I	stda	%f16, [0x01e0, %r31]
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
    brnz %r10, sma_10_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e012  ! 403: CASA_R	casa	[%r31] %asi, %r18, %r9
pmu_10_305:
	nop
	setx 0xfffffb1afffff5da, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_306:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_308) + 16, 16, 16)) -> intp(4,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_308)&0xffffffff)  + 16, 16, 16)) -> intp(4,0,31)
#else
	setx 0xa0a8271189614a58, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_309:
	.word 0x81983d5e  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d5e, %hpstate
br_badelay2_10_310:
	.word 0x91a1c9c9  ! 1: FDIVd	fdivd	%f38, %f40, %f8
	pdist %f22, %f22, %f18
	.word 0x99b20312  ! 409: ALIGNADDRESS	alignaddr	%r8, %r18, %r12
splash_cmpr_10_311:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 410: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_10_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 411: CASA_R	casa	[%r31] %asi, %r13, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_313)+40, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_313)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_313:
	.word 0xa98469f5  ! 412: WR_SET_SOFTINT_I	wr	%r17, 0x09f5, %set_softint
memptr_10_314:
	set 0x60140000, %r31
	.word 0x85846e7b  ! 413: WRCCR_I	wr	%r17, 0x0e7b, %ccr
	.word 0x91948011  ! 414: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	.word 0x9f803728  ! 415: SIR	sir	0x1728
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
    brnz %r10, cwq_10_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_316
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
cwq_10_316:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 416: RDPC	rd	%pc, %r11
intveclr_10_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0xda0f04fada17cce2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 418: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0xc751b1d6d49f5582, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_10_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d940005  ! 421: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
splash_lsu_10_322:
	nop
	ta T_CHANGE_HPRIV
	set 0xb6820d7a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe0c2  ! 424: STD_I	std	%r13, [%r31 + 0x00c2]
	.word 0x91d02032  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 426: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d903f51  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x1f51, %pstate
br_badelay2_10_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb50310  ! 428: ALIGNADDRESS	alignaddr	%r20, %r16, %r13
	setx vahole_target0, %r18, %r27
	.word 0xd6bfc02c  ! 429: STDA_R	stda	%r11, [%r31 + %r12] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_326) + 40, 16, 16)) -> intp(5,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_326)&0xffffffff)  + 40, 16, 16)) -> intp(5,0,18)
#else
	setx 0x737e0ec8dba8c6b6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_327:
	ta T_CHANGE_NONHPRIV
	.word 0x81983d8f  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d8f, %hpstate
splash_htba_10_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x99b4054b  ! 434: FCMPEQ16	fcmpeq16	%d16, %d42, %r12
donret_10_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_329-donret_10_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c0c028 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17dd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_329:
	.word 0xd8ffe1a9  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x01a9] %asi
	.word 0xa7a04d28  ! 436: FsMULd	fsmuld	%f1, %f8, %f50
splash_tba_10_330:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_10_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_331-donret_10_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f4932c | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1427, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x22cc0001  ! 1: BRZ	brz,a,pt	%r16,<label_0xc0001>
	done
donretarg_10_331:
	.word 0xe26fe007  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x0007]
donret_10_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_332-donret_10_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00650ca3 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x715, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_332:
	.word 0x91a489c8  ! 441: FDIVd	fdivd	%f18, %f8, %f8
	setx 0x9722ce3b6d53ea6d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe0a8  ! 443: LDUBA_I	lduba	[%r31, + 0x00a8] %asi, %r20
	.word 0xe937e014  ! 444: STQF_I	-	%f20, [0x0014, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x97b1c7d0  ! 446: PDIST	pdistn	%d38, %d16, %d42
brcommon2_10_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9b7c712  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f18, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fd960  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa048c013  ! 448: MULX_R	mulx 	%r3, %r19, %r16
splash_lsu_10_337:
	nop
	ta T_CHANGE_HPRIV
	set 0x0c784343, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c009  ! 450: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_10_340:
	ta T_CHANGE_NONHPRIV
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	.word 0x81982652  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0652, %hpstate
pmu_10_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff68fffff48c, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 454: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x95a409b2  ! 455: FDIVs	fdivs	%f16, %f18, %f10
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_10_342:
    set user_data_start, %o7
	.word 0x93902001  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_10_343:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_344:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_345:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe71fe020  ! 461: LDDF_I	ldd	[%r31, 0x0020], %f19
brcommon1_10_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa77021c0  ! 1: POPC_I	popc	0x01c0, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f803f59  ! 462: SIR	sir	0x1f59
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_10_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 464: RDTICK	rd	%tick, %r10
splash_cmpr_10_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 465: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa0818012  ! 466: ADDcc_R	addcc 	%r6, %r18, %r16
	.word 0xd2800a80  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r9
memptr_10_351:
	set user_data_start, %r31
	.word 0x858470a6  ! 468: WRCCR_I	wr	%r17, 0x10a6, %ccr
	.word 0xd27fe040  ! 469: SWAP_I	swap	%r9, [%r31 + 0x0040]
	.word 0x9f803f9d  ! 470: SIR	sir	0x1f9d
	.word 0x91914012  ! 471: WRPR_PIL_R	wrpr	%r5, %r18, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_10_353:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x87aa8a50  ! 474: FCMPd	fcmpd	%fcc<n>, %f10, %f16
	.word 0xa5a449a1  ! 475: FDIVs	fdivs	%f17, %f1, %f18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_356)+16, 16, 16)) -> intp(mask2tid(0x10),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_356)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x10),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_10_356:
	.word 0xa9813407  ! 476: WR_SET_SOFTINT_I	wr	%r4, 0x1407, %set_softint
trapasi_10_357:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8884980  ! 477: LDUBA_R	lduba	[%r1, %r0] 0x4c, %r12
	.word 0xe19fe160  ! 478: LDDFA_I	ldda	[%r31, 0x0160], %f16
donret_10_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_358-donret_10_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e852b0 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe88, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_358:
	.word 0xd8ffe146  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x0146] %asi
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_10_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d90c012  ! 481: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0xc19fdc00  ! 482: LDDFA_R	ldda	[%r31, %r0], %f0
br_badelay1_10_361:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0xd937c013  ! 1: STQF_R	-	%f12, [%r19, %r31]
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	normalw
	.word 0xa7458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x9f80254e  ! 484: SIR	sir	0x054e
	.word 0xdb27e051  ! 485: STF_I	st	%f13, [0x0051, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_10_362:
	nop
	setx 0xfffff99afffff679, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902789  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x0789, %pstate
	.word 0xda3fc000  ! 490: STD_R	std	%r13, [%r31 + %r0]
donret_10_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_365-donret_10_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007e9ba1 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d1f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_365:
	.word 0xdaffe170  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x0170] %asi
	.word 0xdb27e113  ! 492: STF_I	st	%f13, [0x0113, %r31]
	.word 0xdaffc02b  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r11] 0x01
splash_cmpr_10_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 494: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9f802ba5  ! 496: SIR	sir	0x0ba5
pmu_10_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2fafffff2c7, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_10_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_368
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
cwq_10_368:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 498: RDPC	rd	%pc, %r8
change_to_randtl_10_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_10_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d914013  ! 501: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
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
br_longdelay1_8_0:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	fbge,a,pn	%fcc0,  skip_8_1
	fbo skip_8_1
.align 1024
skip_8_1:
	.word 0xe63fc000  ! 2: STD_R	std	%r19, [%r31 + %r0]
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
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 3: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_3:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7814014  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r20, %-
	.word 0x87ac0ac8  ! 6: FCMPEd	fcmped	%fcc<n>, %f16, %f8
vahole_8_5:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe71fc011  ! 7: LDDF_R	ldd	[%r31, %r17], %f19
memptr_8_6:
	set user_data_start, %r31
	.word 0x8584681e  ! 8: WRCCR_I	wr	%r17, 0x081e, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_8_7:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x99410000  ! 10: RDTICK	rd	%tick, %r12
splash_lsu_8_8:
	nop
	ta T_CHANGE_HPRIV
	set 0x61eeb1cc, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_8_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe0c0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x00c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99a449cb  ! 12: FDIVd	fdivd	%f48, %f42, %f12
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_8_10:
	nop
	setx 0xfffff9aafffff720, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_8_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff39bfffffda3, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_12:
	nop
	.word 0xc19fdf20  ! 17: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_8_13:
	nop
	.word 0xe19fdc00  ! 18: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd65fe158  ! 19: LDX_I	ldx	[%r31 + 0x0158], %r11
	.word 0xd727e190  ! 20: STF_I	st	%f11, [0x0190, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_14) + 56, 16, 16)) -> intp(0,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_14)&0xffffffff)  + 56, 16, 16)) -> intp(0,0,6)
#else
	setx 0x69dd84cdcada6b75, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_8_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_15-donret_8_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003f3122 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16d6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_15:
	.word 0xd6ffe1c0  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x01c0] %asi
    set 0x1b37, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb087d3  ! 24: PDIST	pdistn	%d2, %d50, %d44
	.word 0xc1bfdf20  ! 25: STDFA_R	stda	%f0, [%r0, %r31]
pmu_8_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9a9fffffaec, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_8_17:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd11fe040  ! 27: LDDF_I	ldd	[%r31, 0x0040], %f8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_18)+16, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_18)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_18:
	.word 0xa9853b30  ! 28: WR_SET_SOFTINT_I	wr	%r20, 0x1b30, %set_softint
	.word 0xa5a00170  ! 29: FABSq	dis not found

donret_8_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_20-donret_8_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0088279f | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x218, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_20:
	.word 0xe2ffe058  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x0058] %asi
	.word 0xa7808011  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_22) + 48, 16, 16)) -> intp(3,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_22)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,27)
#else
	setx 0x4af81cf6b7f81e8f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_23:
	set 0x60740000, %r31
	.word 0x8581745f  ! 33: WRCCR_I	wr	%r5, 0x145f, %ccr
unsupttte_8_24:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ec4026  ! 34: PREFETCHA_R	prefetcha	[%r17, %r6] 0x01, #one_read
brcommon3_8_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd3e7e011  ! 35: CASA_R	casa	[%r31] %asi, %r17, %r9
jmptr_8_26:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_8_27:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_8_28:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 38: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_8_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d930011  ! 39: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
brcommon3_8_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe160  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0160]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd2bfc029  ! 40: STDA_R	stda	%r9, [%r31 + %r9] 0x01
	.word 0xd2dfe050  ! 41: LDXA_I	ldxa	[%r31, + 0x0050] %asi, %r9
	.word 0xd327e03c  ! 42: STF_I	st	%f9, [0x003c, %r31]
	setx 0x1d8994de613145d8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944005  ! 44: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
ceter_8_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 45: RDTICK	rd	%tick, %r16
	.word 0x91944004  ! 46: WRPR_PIL_R	wrpr	%r17, %r4, %pil
splash_tba_8_35:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_8_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 48: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x9f803478  ! 49: SIR	sir	0x1478
br_longdelay2_8_37:
	.word 0x22c84001  ! 1: BRZ	brz,a,pt	%r1,<label_0x84001>
	.word 0xa3a7c9ca  ! 50: FDIVd	fdivd	%f62, %f10, %f48
splash_cmpr_8_38:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 51: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_8_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 52: CASA_R	casa	[%r31] %asi, %r11, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_40)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_40)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_40:
	.word 0xa9853198  ! 53: WR_SET_SOFTINT_I	wr	%r20, 0x1198, %set_softint
jmptr_8_41:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_8_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_42-donret_8_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f58c84 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x134d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_42:
	.word 0xe26fe126  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x0126]
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
    brnz %r10, cwq_8_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_43
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
cwq_8_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 56: RDPC	rd	%pc, %r20
splash_hpstate_8_44:
	.word 0x81983495  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1495, %hpstate
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8d902061  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x0061, %pstate
mondo_8_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d92000b  ! 59: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
mondo_8_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d904006  ! 60: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
splash_hpstate_8_48:
	ta T_CHANGE_NONHPRIV
	.word 0x8198280f  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0xd31fe178  ! 62: LDDF_I	ldd	[%r31, 0x0178], %f9
vahole_8_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe1a0  ! 63: STDFA_I	stda	%f0, [0x01a0, %r31]
brcommon1_8_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7b0c7c8  ! 64: PDIST	pdistn	%d34, %d8, %d50
splash_hpstate_8_51:
	ta T_CHANGE_NONHPRIV
	.word 0x81982747  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
	.word 0x8d903440  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1440, %pstate
	.word 0xc19fe100  ! 67: LDDFA_I	ldda	[%r31, 0x0100], %f0
br_badelay1_8_54:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0xd337e0b0  ! 1: STQF_I	-	%f9, [0x00b0, %r31]
	.word 0x93b7c4cc  ! 1: FCMPNE32	fcmpne32	%d62, %d12, %r9
	normalw
	.word 0x95458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd82fe006  ! 69: STB_I	stb	%r12, [%r31 + 0x0006]
donret_8_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_55-donret_8_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0020667a | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x18df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	done
donretarg_8_55:
	.word 0x97a489d2  ! 70: FDIVd	fdivd	%f18, %f18, %f42
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
    brnz %r10, sma_8_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 71: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0xc19fe1a0  ! 72: LDDFA_I	ldda	[%r31, 0x01a0], %f0
mondo_8_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d91c011  ! 73: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_8_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e012  ! 76: CASA_R	casa	[%r31] %asi, %r18, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa953c000  ! 79: RDPR_FQ	<illegal instruction>
donret_8_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_59-donret_8_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000a0b44 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1793, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_59:
	.word 0xa9a049cd  ! 80: FDIVd	fdivd	%f32, %f44, %f20
	.word 0xda8fe0e0  ! 81: LDUBA_I	lduba	[%r31, + 0x00e0] %asi, %r13
	.word 0xe19fda00  ! 82: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_8_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_8_61:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 84: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_8_62:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d918012  ! 86: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_64)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_64)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_64:
	.word 0xa98461f9  ! 87: WR_SET_SOFTINT_I	wr	%r17, 0x01f9, %set_softint
	.word 0xdb37e078  ! 88: STQF_I	-	%f13, [0x0078, %r31]
mondo_8_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94400a  ! 89: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_8_66:
	set user_data_start, %r31
	.word 0x8582f032  ! 91: WRCCR_I	wr	%r11, 0x1032, %ccr
jmptr_8_67:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_8_69:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda9fc033  ! 95: LDDA_R	ldda	[%r31, %r19] 0x01, %r13
pmu_8_70:
	nop
	setx 0xfffff26afffffb7e, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_71:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_8_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 98: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_8_73:
	.word 0x81983cd7  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cd7, %hpstate
donret_8_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_74-donret_8_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00398578 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9ce, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2ecd0001  ! 1: BRGEZ	brgez,a,pt	%r20,<label_0xd0001>
	retry
donretarg_8_74:
	.word 0xda6fe09f  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x009f]
change_to_randtl_8_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_75:
	.word 0x8f902000  ! 101: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
unsupttte_8_76:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1a049c7  ! 102: FDIVd	fdivd	%f32, %f38, %f16
	.word 0x8d9028ab  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x08ab, %pstate
intveclr_8_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfc19fa23b4abf672, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_8_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_79-donret_8_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0082de9a | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf6d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_79:
	.word 0xa3a489d3  ! 105: FDIVd	fdivd	%f18, %f50, %f48
	.word 0xe4d7e1d8  ! 106: LDSHA_I	ldsha	[%r31, + 0x01d8] %asi, %r18
tagged_8_80:
	tsubcctv %r7, 0x1868, %r16
	.word 0xe407e135  ! 107: LDUW_I	lduw	[%r31 + 0x0135], %r18
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
    brnz %r10, cwq_8_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_81
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
cwq_8_81:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 108: RDPC	rd	%pc, %r10
splash_lsu_8_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xc0641729, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_83:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 110: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_8_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_8_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 112: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xc1bfdf20  ! 113: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fc2c0  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_8_86:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 115: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_87)+0, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_87)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_87:
	.word 0xa9832005  ! 116: WR_SET_SOFTINT_I	wr	%r12, 0x0005, %set_softint
brcommon3_8_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c013  ! 1: STQF_R	-	%f8, [%r19, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd09fc034  ! 117: LDDA_R	ldda	[%r31, %r20] 0x01, %r8
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8d903359  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x1359, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_91)+16, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_91)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_91:
	.word 0xa984fae3  ! 120: WR_SET_SOFTINT_I	wr	%r19, 0x1ae3, %set_softint
splash_cmpr_8_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 121: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa7a00162  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_8_95:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 124: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfdb60  ! 125: STDFA_R	stda	%f0, [%r0, %r31]
jmptr_8_96:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5c5019c401e35f25, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb1afffff9f8, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_8_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_99-donret_8_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003c52dd | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x316, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_99:
	.word 0x99a449c4  ! 129: FDIVd	fdivd	%f48, %f4, %f12
pmu_8_100:
	nop
	setx 0xfffff7b9ffffff09, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d92000d  ! 131: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
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
    brnz %r10, sma_8_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e008  ! 132: CASA_R	casa	[%r31] %asi, %r8, %r12
	.word 0xc1bfc3e0  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_8_103:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_8_104:
	nop
	ta T_CHANGE_HPRIV
	set 0xaa20c85c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x6a2079cf9c40dbaf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_8_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_106:
	.word 0x8f902001  ! 137: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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
    brnz %r10, cwq_8_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_107
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
cwq_8_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 138: RDPC	rd	%pc, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_108)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_108)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_108:
	.word 0xa9846ea7  ! 139: WR_SET_SOFTINT_I	wr	%r17, 0x0ea7, %set_softint
br_badelay1_8_109:
	.word 0xc36fe040  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0040], #one_read
	.word 0xd5352d5b  ! 1: STQF_I	-	%f10, [0x0d5b, %r20]
	.word 0x87afca48  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f8
	normalw
	.word 0x99458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_110:
	ta	T_CHANGE_NONHPRIV	! macro
vahole_8_111:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x937039f9  ! 142: POPC_I	popc	0x19f9, %r9
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
    brnz %r10, cwq_8_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_112
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
cwq_8_112:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 143: RDPC	rd	%pc, %r11
	.word 0xd91fe1f0  ! 144: LDDF_I	ldd	[%r31, 0x01f0], %f12
	setx 0xf9242e0fa3a6ef82, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa2d1800b  ! 146: UMULcc_R	umulcc 	%r6, %r11, %r17
splash_cmpr_8_114:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 147: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_8_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d94c00b  ! 148: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
change_to_randtl_8_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_116:
	.word 0x8f902001  ! 149: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_8_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_117:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_118) + 32, 16, 16)) -> intp(0,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_118)&0xffffffff)  + 32, 16, 16)) -> intp(0,0,6)
#else
	setx 0xc17b9475912f5465, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_119:
	set 0x60740000, %r31
	.word 0x858421bd  ! 152: WRCCR_I	wr	%r16, 0x01bd, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902cfa  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0cfa, %pstate
mondo_8_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d90c012  ! 155: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	.word 0x8d903147  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x1147, %pstate
	.word 0x91d02033  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 51
	setx 0x2b29454f1a01ccfc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36b4008  ! 159: PREFETCH_R	prefetch	[%r13 + %r8], #one_read
fpinit_8_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 160: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_hpstate_8_125:
	ta T_CHANGE_NONHPRIV
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x819837df  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17df, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_8_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 163: CASA_R	casa	[%r31] %asi, %r18, %r16
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
    brnz %r10, sma_8_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 164: CASA_R	casa	[%r31] %asi, %r20, %r16
pmu_8_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbcffffffaa9, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 166: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_8_130:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 167: RDTICK	rd	%tick, %r9
jmptr_8_131:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa768c014  ! 169: SDIVX_R	sdivx	%r3, %r20, %r19
splash_cmpr_8_132:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 170: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_8_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_133
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
cwq_8_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 172: RDPC	rd	%pc, %r16
jmptr_8_134:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd040  ! 174: LDDA_R	ldda	[%r31, %r0] 0x82, %r16
	setx 0x1fc81410f930ee25, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_136:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 176: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e1c0  ! 177: LDSHA_I	ldsha	[%r31, + 0x01c0] %asi, %r16
splash_cmpr_8_137:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_8_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94000d  ! 179: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
change_to_randtl_8_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_139:
	.word 0x8f902000  ! 180: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
jmptr_8_140:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9194c002  ! 182: WRPR_PIL_R	wrpr	%r19, %r2, %pil
donret_8_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_142-donret_8_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b2d670 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1648, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_142:
	.word 0x97a309d2  ! 183: FDIVd	fdivd	%f12, %f18, %f42
	.word 0xe6c7e130  ! 184: LDSWA_I	ldswa	[%r31, + 0x0130] %asi, %r19
	.word 0xe1bfda00  ! 185: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe6cfe0a8  ! 186: LDSBA_I	ldsba	[%r31, + 0x00a8] %asi, %r19
splash_cmpr_8_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 187: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa6814012  ! 188: ADDcc_R	addcc 	%r5, %r18, %r19
ibp_8_144:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe0c0  ! 189: LDDFA_I	ldda	[%r31, 0x00c0], %f0
ceter_8_145:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 190: RDTICK	rd	%tick, %r18
ceter_8_146:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x91410000  ! 191: RDTICK	rd	%tick, %r8
	setx 0x28534d2129d754eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0xa3a0016b  ! 194: FABSq	dis not found

	.word 0xe6c7e1a0  ! 195: LDSWA_I	ldswa	[%r31, + 0x01a0] %asi, %r19
splash_lsu_8_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x4335c248, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe1f0  ! 198: LDX_I	ldx	[%r31 + 0x01f0], %r19
splash_hpstate_8_152:
	ta T_CHANGE_NONHPRIV
	.word 0x2aca4001  ! 1: BRNZ	brnz,a,pt	%r9,<label_0xa4001>
	.word 0x819834c5  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x14c5, %hpstate
	.word 0xa353c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0x9f803f48  ! 201: SIR	sir	0x1f48
mondo_8_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90c006  ! 202: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
jmptr_8_154:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	brgz,pn  	%r5, skip_8_155
	.word 0x87acca53  ! 1: FCMPd	fcmpd	%fcc<n>, %f50, %f50
.align 2048
skip_8_155:
	.word 0x9ba4c9d3  ! 204: FDIVd	fdivd	%f50, %f50, %f44
pmu_8_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9b7fffffe79, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xeb2364d95f00e926, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e0da  ! 207: STX_I	stx	%r19, [%r31 + 0x00da]
brcommon2_8_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd110c014  ! 1: LDQF_R	-	[%r3, %r20], %f8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe080  ! 208: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0xa6fcc00c  ! 209: SDIVcc_R	sdivcc 	%r19, %r12, %r19
	.word 0xd897e160  ! 210: LDUHA_I	lduha	[%r31, + 0x0160] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_8_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_159:
	.word 0x8f902001  ! 212: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_8_160:
	tsubcctv %r19, 0x14cf, %r17
	.word 0xd807e1f2  ! 213: LDUW_I	lduw	[%r31 + 0x01f2], %r12
br_badelay1_8_161:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd937c008  ! 1: STQF_R	-	%f12, [%r8, %r31]
	.word 0x87afca52  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f18
	normalw
	.word 0x95458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r10
pmu_8_162:
	nop
	setx 0xfffff284fffff7ed, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_8_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcbefffff3c9, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe1bfd960  ! 219: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe1bfdc00  ! 220: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfe1a0  ! 221: STDFA_I	stda	%f0, [0x01a0, %r31]
	setx 0xad2763f52d762e5d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_8_166:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 223: SAVE_R	save	%r31, %r0, %r31
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
    brnz %r10, sma_8_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r16
jmptr_8_168:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5d7682297f0d44f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c012  ! 227: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
splash_cmpr_8_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 228: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_8_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff97bfffff138, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xab7c0853, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d930006  ! 231: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
memptr_8_175:
	set 0x60740000, %r31
	.word 0x8584e3ab  ! 232: WRCCR_I	wr	%r19, 0x03ab, %ccr
mondo_8_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944012  ! 233: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_177)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_177)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_177:
	.word 0xa98327c9  ! 234: WR_SET_SOFTINT_I	wr	%r12, 0x07c9, %set_softint
splash_lsu_8_178:
	nop
	ta T_CHANGE_HPRIV
	set 0x3417233e, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_179:
	nop
	setx 0xfffff3d9fffffdfd, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_180:
	nop
	ta T_CHANGE_HPRIV
	set 0x87d05510, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 238: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e178  ! 239: LDSH_I	ldsh	[%r31 + 0x0178], %r16
donret_8_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_182-donret_8_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b8f643 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x121e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_182:
	.word 0xe0ffe154  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x0154] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe1e0  ! 242: STDFA_I	stda	%f0, [0x01e0, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_184)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_184)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_184:
	.word 0xa983221f  ! 243: WR_SET_SOFTINT_I	wr	%r12, 0x021f, %set_softint
unsupttte_8_185:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a509c9  ! 244: FDIVd	fdivd	%f20, %f40, %f42
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_8_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_186
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
cwq_8_186:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 246: RDPC	rd	%pc, %r20
	setx 0x88646b9a2bd631f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_188:
	nop
	setx 0xfffffc07fffff475, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_189:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 249: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_8_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_190-donret_8_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00914cba | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_190:
	.word 0x93a089cd  ! 250: FDIVd	fdivd	%f2, %f44, %f40
memptr_8_191:
	set 0x60140000, %r31
	.word 0x85806e15  ! 251: WRCCR_I	wr	%r1, 0x0e15, %ccr
	.word 0xe49fc3c0  ! 252: LDDA_R	ldda	[%r31, %r0] 0x1e, %r18
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_8_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_193
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
cwq_8_193:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 254: RDPC	rd	%pc, %r9
splash_lsu_8_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xae413231, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa153c000  ! 256: RDPR_FQ	<illegal instruction>
vahole_8_195:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe91fc012  ! 257: LDDF_R	ldd	[%r31, %r18], %f20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_196) + 48, 16, 16)) -> intp(3,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_196)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,4)
#else
	setx 0x04e7abdfe7c61367, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_8_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 259: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe8c7e0e8  ! 260: LDSWA_I	ldswa	[%r31, + 0x00e8] %asi, %r20
vahole_8_198:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9bb50487  ! 261: FCMPLE32	fcmple32	%d20, %d38, %r13
	.word 0xd697e1c0  ! 262: LDUHA_I	lduha	[%r31, + 0x01c0] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe1c8  ! 264: LDUBA_I	lduba	[%r31, + 0x01c8] %asi, %r11
pmu_8_199:
	nop
	setx 0xfffff197fffff974, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
vahole_8_201:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9ba089d2  ! 267: FDIVd	fdivd	%f2, %f18, %f44
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903fe6  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1fe6, %pstate
	.word 0xe097e168  ! 269: LDUHA_I	lduha	[%r31, + 0x0168] %asi, %r16
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
    brnz %r10, sma_8_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 270: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xe07fe060  ! 271: SWAP_I	swap	%r16, [%r31 + 0x0060]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_8_204:
    set user_data_start, %o7
	.word 0x93902005  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
pmu_8_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff138fffffdf2, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d904011  ! 275: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
br_badelay3_8_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x99a00546  ! 1: FSQRTd	fsqrt	
	.word 0xa7a48828  ! 276: FADDs	fadds	%f18, %f8, %f19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_8_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d940009  ! 279: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
donret_8_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_211-donret_8_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d3bb6f | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x145d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_211:
	.word 0xd86fe1a8  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x01a8]
donret_8_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_212-donret_8_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0057a756 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4de, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_212:
	.word 0x9ba4c9c9  ! 281: FDIVd	fdivd	%f50, %f40, %f44
brcommon1_8_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa1a249b0  ! 282: FDIVs	fdivs	%f9, %f16, %f16
	.word 0xc19fe120  ! 283: LDDFA_I	ldda	[%r31, 0x0120], %f0
	.word 0x8d902cc9  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x0cc9, %pstate
splash_cmpr_8_215:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 285: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_8_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 286: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038ef  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x18ef, %pstate
splash_lsu_8_219:
	nop
	ta T_CHANGE_HPRIV
	set 0xc00e5788, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_8_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_220-donret_8_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00638b57 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x48d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_220:
	.word 0xd66fe09f  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x009f]
	.word 0x91d02035  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0xafe6690405eff399, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_8_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e090  ! 1: STQF_I	-	%f11, [0x0090, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd7e7e009  ! 293: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0xd6d7e1d8  ! 294: LDSHA_I	ldsha	[%r31, + 0x01d8] %asi, %r11
pmu_8_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff48fffff476, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9a00163  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_225)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_225)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_225:
	.word 0xa984f0c2  ! 297: WR_SET_SOFTINT_I	wr	%r19, 0x10c2, %set_softint
memptr_8_226:
	set 0x60740000, %r31
	.word 0x8584ea14  ! 298: WRCCR_I	wr	%r19, 0x0a14, %ccr
mondo_8_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d920007  ! 299: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	.word 0xd297e100  ! 300: LDUHA_I	lduha	[%r31, + 0x0100] %asi, %r9
vahole_8_228:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x99a289ad  ! 301: FDIVs	fdivs	%f10, %f13, %f12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_229)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_229)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_229:
	.word 0xa981747f  ! 302: WR_SET_SOFTINT_I	wr	%r5, 0x147f, %set_softint
	.word 0x8d903a4c  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x1a4c, %pstate
vahole_8_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe897c02b  ! 304: LDUHA_R	lduha	[%r31, %r11] 0x01, %r20
trapasi_8_232:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8904980  ! 305: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_233)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_233)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_233:
	.word 0xa9806d41  ! 306: WR_SET_SOFTINT_I	wr	%r1, 0x0d41, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_234) + 0, 16, 16)) -> intp(0,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_234)&0xffffffff)  + 0, 16, 16)) -> intp(0,0,8)
#else
	setx 0x21df603e2866927a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_8_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcdafffff264, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_8_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_236
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
cwq_8_236:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 310: RDPC	rd	%pc, %r11
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
    brnz %r10, sma_8_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 311: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_8_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e013  ! 313: CASA_R	casa	[%r31] %asi, %r19, %r8
	.word 0x9f8032e9  ! 314: SIR	sir	0x12e9
	.word 0x91d02033  ! 315: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_8_240:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_8_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 317: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_8_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 319: CASA_R	casa	[%r31] %asi, %r20, %r8
br_longdelay1_8_243:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 320: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_8_244:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 321: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_8_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff955fffffeb2, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_246:
	nop
	setx 0xfffffa0cfffff281, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa5a00170  ! 326: FABSq	dis not found

mondo_8_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d944004  ! 327: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_250) + 24, 16, 16)) -> intp(7,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_250)&0xffffffff)  + 24, 16, 16)) -> intp(7,0,8)
#else
	setx 0x831e48f336c95eea, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_8_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_251-donret_8_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b0340d | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x667, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_251:
	.word 0x95a0c9c7  ! 329: FDIVd	fdivd	%f34, %f38, %f10
	.word 0xd4c7e018  ! 330: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r10
	.word 0xe1bfe120  ! 331: STDFA_I	stda	%f16, [0x0120, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_8_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x997c3548	! Random illegal ?
	.word 0x9ba00551  ! 1: FSQRTd	fsqrt	
	.word 0x99a40834  ! 333: FADDs	fadds	%f16, %f20, %f12
splash_hpstate_8_253:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982c4d  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4d, %hpstate
mondo_8_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d918013  ! 335: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0x9f803e3d  ! 336: SIR	sir	0x1e3d
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e06a  ! 338: STX_I	stx	%r17, [%r31 + 0x006a]
pmu_8_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff314fffffddc, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe227e1c6  ! 342: STW_I	stw	%r17, [%r31 + 0x01c6]
	setx 0x0f5db33647c6787d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_8_258:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_8_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_259-donret_8_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005b14a2 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd13, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_259:
	.word 0x9ba309c7  ! 345: FDIVd	fdivd	%f12, %f38, %f44
jmptr_8_260:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa1a0016a  ! 347: FABSq	dis not found

	.word 0xa4c36c60  ! 348: ADDCcc_I	addccc 	%r13, 0x0c60, %r18
mondo_8_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 349: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x2ecac001  ! 1: BRGEZ	brgez,a,pt	%r11,<label_0xac001>
	.word 0x8d902c03  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0xe19fe1a0  ! 351: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_266) + 48, 16, 16)) -> intp(0,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_266)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,24)
#else
	setx 0xd67d09c1588f23ae, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_8_267:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe71fe1a0  ! 355: LDDF_I	ldd	[%r31, 0x01a0], %f19
	.word 0xc19fe180  ! 356: LDDFA_I	ldda	[%r31, 0x0180], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_268)+32, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_268)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_268:
	.word 0xa9812b84  ! 357: WR_SET_SOFTINT_I	wr	%r4, 0x0b84, %set_softint
	setx 0x25fdec745e9889fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_8_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_270
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
cwq_8_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 359: RDPC	rd	%pc, %r18
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_8_272:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 361: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
fpinit_8_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 362: FDIVs	fdivs	%f0, %f4, %f4
jmptr_8_274:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_8_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb2b2550ef81af434, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_8_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_277
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
cwq_8_277:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 366: RDPC	rd	%pc, %r8
brcommon3_8_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c014  ! 1: STQF_R	-	%f12, [%r20, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd91fe040  ! 367: LDDF_I	ldd	[%r31, 0x0040], %f12
	.word 0xd827e060  ! 368: STW_I	stw	%r12, [%r31 + 0x0060]
	.word 0xd8c7e1d8  ! 369: LDSWA_I	ldswa	[%r31, + 0x01d8] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_279)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_279)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_279:
	.word 0xa9852c4f  ! 370: WR_SET_SOFTINT_I	wr	%r20, 0x0c4f, %set_softint
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
    brnz %r10, cwq_8_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_280
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
cwq_8_280:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 371: RDPC	rd	%pc, %r8
	.word 0xd4cfe108  ! 372: LDSBA_I	ldsba	[%r31, + 0x0108] %asi, %r10
splash_cmpr_8_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 373: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_8_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00c  ! 374: CASA_R	casa	[%r31] %asi, %r12, %r10
br_badelay2_8_283:
	.word 0x9ba509c8  ! 1: FDIVd	fdivd	%f20, %f8, %f44
	pdist %f28, %f16, %f30
	.word 0x99b34314  ! 375: ALIGNADDRESS	alignaddr	%r13, %r20, %r12
	.word 0xc19fe020  ! 376: LDDFA_I	ldda	[%r31, 0x0020], %f0
	.word 0x9f803766  ! 377: SIR	sir	0x1766
	.word 0xe1bfde00  ! 378: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9ad98004  ! 379: SMULcc_R	smulcc 	%r6, %r4, %r13
	brgez,pn  	%r17, skip_8_284
	fbuge skip_8_284
.align 2048
skip_8_284:
	.word 0xc30fc000  ! 380: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
    brnz %r10, cwq_8_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_285
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
cwq_8_285:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 381: RDPC	rd	%pc, %r18
brcommon3_8_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c013  ! 1: STQF_R	-	%f13, [%r19, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda9fe1d0  ! 382: LDDA_I	ldda	[%r31, + 0x01d0] %asi, %r13
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
	.word 0xdbe7e009  ! 384: CASA_R	casa	[%r31] %asi, %r9, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_288) + 0, 16, 16)) -> intp(5,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_288)&0xffffffff)  + 0, 16, 16)) -> intp(5,0,13)
#else
	setx 0x0aacfa858dd4e3df, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_8_289:
	taddcctv %r0, 0x13a8, %r3
	.word 0xda07e0ec  ! 386: LDUW_I	lduw	[%r31 + 0x00ec], %r13
ibp_8_290:
	nop
	.word 0xe1bfdb60  ! 387: STDFA_R	stda	%f16, [%r0, %r31]
cwp_8_291:
    set user_data_start, %o7
	.word 0x93902003  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
pmu_8_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc84fffff34b, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_8_294:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x9b410000  ! 391: RDTICK	rd	%tick, %r13
cwp_8_295:
    set user_data_start, %o7
	.word 0x93902006  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_8_296:
	nop
	ta T_CHANGE_HPRIV
	set 0x28a7fea5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_8_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe13df8717834e60e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_8_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xff1, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe29fc034  ! 397: LDDA_R	ldda	[%r31, %r20] 0x01, %r17
mondo_8_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d950012  ! 398: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xe19fc2c0  ! 399: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa7850012  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r18, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_302) + 16, 16, 16)) -> intp(1,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_302)&0xffffffff)  + 16, 16, 16)) -> intp(1,0,16)
#else
	setx 0x21c9d5e08aaacde6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_8_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9a0054a  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0c0  ! 402: STDFA_I	stda	%f16, [0x00c0, %r31]
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
    brnz %r10, sma_8_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 403: CASA_R	casa	[%r31] %asi, %r13, %r9
pmu_8_305:
	nop
	setx 0xfffff994fffff16a, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_306:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_308) + 0, 16, 16)) -> intp(2,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_308)&0xffffffff)  + 0, 16, 16)) -> intp(2,0,6)
#else
	setx 0xfbb0a2438af442ae, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_309:
	.word 0x81982f1e  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1e, %hpstate
br_badelay2_8_310:
	.word 0xa1a209c4  ! 1: FDIVd	fdivd	%f8, %f4, %f16
	pdist %f0, %f0, %f20
	.word 0xa9b44314  ! 409: ALIGNADDRESS	alignaddr	%r17, %r20, %r20
splash_cmpr_8_311:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 410: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_8_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 411: CASA_R	casa	[%r31] %asi, %r18, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_313)+16, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_313)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_313:
	.word 0xa982a7a6  ! 412: WR_SET_SOFTINT_I	wr	%r10, 0x07a6, %set_softint
memptr_8_314:
	set 0x60540000, %r31
	.word 0x85847e34  ! 413: WRCCR_I	wr	%r17, 0x1e34, %ccr
	.word 0x91948002  ! 414: WRPR_PIL_R	wrpr	%r18, %r2, %pil
	.word 0x9f802092  ! 415: SIR	sir	0x0092
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
    brnz %r10, cwq_8_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_316
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
cwq_8_316:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 416: RDPC	rd	%pc, %r8
intveclr_8_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9c1dc798c4c47fab, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 418: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x281c45eb0ace5309, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_8_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d948003  ! 421: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
splash_lsu_8_322:
	nop
	ta T_CHANGE_HPRIV
	set 0xfc014757, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe0c3  ! 424: STD_I	std	%r13, [%r31 + 0x00c3]
	.word 0x93d02033  ! 425: Tcc_I	tne	icc_or_xcc, %r0 + 51
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22cc4001  ! 1: BRZ	brz,a,pt	%r17,<label_0xc4001>
	.word 0x8d903c6c  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x1c6c, %pstate
br_badelay2_8_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x99b4830a  ! 428: ALIGNADDRESS	alignaddr	%r18, %r10, %r12
vahole_8_325:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd69fc02d  ! 429: LDDA_R	ldda	[%r31, %r13] 0x01, %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_326) + 0, 16, 16)) -> intp(2,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_326)&0xffffffff)  + 0, 16, 16)) -> intp(2,0,23)
#else
	setx 0x0984d326b0150087, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_327:
	ta T_CHANGE_NONHPRIV
	.word 0x81983753  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1753, %hpstate
splash_htba_8_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0xa9b40551  ! 434: FCMPEQ16	fcmpeq16	%d16, %d48, %r20
donret_8_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_329-donret_8_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00edd50e | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f43, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_329:
	.word 0xd8ffe180  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x0180] %asi
	.word 0x93a4cd30  ! 436: FsMULd	fsmuld	%f19, %f16, %f40
splash_tba_8_330:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_8_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_331-donret_8_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0087767d | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d07, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	done
donretarg_8_331:
	.word 0xe26fe1ba  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x01ba]
donret_8_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_332-donret_8_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00868444 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_332:
	.word 0x9ba409d2  ! 441: FDIVd	fdivd	%f16, %f18, %f44
	setx 0x530dedc5bf4e5a33, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe018  ! 443: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r20
	.word 0xe937e178  ! 444: STQF_I	-	%f20, [0x0178, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x99a489c1  ! 446: FDIVd	fdivd	%f18, %f32, %f12
brcommon2_8_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe1118013  ! 1: LDQF_R	-	[%r6, %r19], %f16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe020  ! 447: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0x98494006  ! 448: MULX_R	mulx 	%r5, %r6, %r12
splash_lsu_8_337:
	nop
	ta T_CHANGE_HPRIV
	set 0xac30cc53, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d948003  ! 450: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_8_340:
	ta T_CHANGE_NONHPRIV
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x819837c7  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17c7, %hpstate
pmu_8_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff22dffffff9d, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b2  ! 454: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x95a189b4  ! 455: FDIVs	fdivs	%f6, %f20, %f10
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_8_342:
    set user_data_start, %o7
	.word 0x93902003  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
jmptr_8_343:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_344:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_345:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe69fc028  ! 461: LDDA_R	ldda	[%r31, %r8] 0x01, %r19
brcommon1_8_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa7702020  ! 1: POPC_I	popc	0x0020, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a489a2  ! 462: FDIVs	fdivs	%f18, %f2, %f19
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_8_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x99410000  ! 464: RDTICK	rd	%tick, %r12
splash_cmpr_8_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 465: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x94848014  ! 466: ADDcc_R	addcc 	%r18, %r20, %r10
	.word 0xd28008a0  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_8_351:
	set user_data_start, %r31
	.word 0x8580f24f  ! 468: WRCCR_I	wr	%r3, 0x124f, %ccr
	.word 0xd27fe1d0  ! 469: SWAP_I	swap	%r9, [%r31 + 0x01d0]
	.word 0x9f802ea1  ! 470: SIR	sir	0x0ea1
	.word 0x91940014  ! 471: WRPR_PIL_R	wrpr	%r16, %r20, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_8_353:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa9b487d4  ! 474: PDIST	pdistn	%d18, %d20, %d20
unsupttte_8_355:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a449ca  ! 475: FDIVd	fdivd	%f48, %f10, %f12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_356)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_356)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x8),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_8_356:
	.word 0xa9852db4  ! 476: WR_SET_SOFTINT_I	wr	%r20, 0x0db4, %set_softint
trapasi_8_357:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c04980  ! 477: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r12
	.word 0xc19fe100  ! 478: LDDFA_I	ldda	[%r31, 0x0100], %f0
donret_8_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_358-donret_8_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006271e2 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ecf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_358:
	.word 0xd8ffe0c9  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x00c9] %asi
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_8_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d92c011  ! 481: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0xc19fc2c0  ! 482: LDDFA_R	ldda	[%r31, %r0], %f0
br_badelay1_8_361:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
	.word 0xc36fe180  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0180], #one_read
	normalw
	.word 0xa9458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x9f803b37  ! 484: SIR	sir	0x1b37
	.word 0xdb27e061  ! 485: STF_I	st	%f13, [0x0061, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_8_362:
	nop
	setx 0xfffff52ffffff21b, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d903915  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x1915, %pstate
	brlez,a,pn	%r20, skip_8_364
	.word 0x95b1c4cb  ! 1: FCMPNE32	fcmpne32	%d38, %d42, %r10
.align 32
skip_8_364:
	.word 0xc32fc000  ! 490: STXFSR_R	st-sfr	%f1, [%r0, %r31]
donret_8_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_365-donret_8_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0072cbf6 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x505, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_365:
	.word 0xdaffe140  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x0140] %asi
	.word 0xdb27e050  ! 492: STF_I	st	%f13, [0x0050, %r31]
	.word 0xdaffc028  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r8] 0x01
splash_cmpr_8_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 494: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9f80370d  ! 496: SIR	sir	0x170d
pmu_8_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4ebfffff1a7, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_8_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_368
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
cwq_8_368:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 498: RDPC	rd	%pc, %r16
change_to_randtl_8_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_369:
	.word 0x8f902001  ! 499: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_8_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d91c009  ! 501: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
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
    setx 0xec431b359b86abe7, %r1, %r28
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
    add %l6, %o3, %l6
#endif
# 771 "diag.j"
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
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
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
br_longdelay1_4_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xc32fc000  ! 2: STXFSR_R	st-sfr	%f1, [%r0, %r31]
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
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 3: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_3:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_4_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7848011  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r17, %-
	.word 0x87aacac6  ! 6: FCMPEd	fcmped	%fcc<n>, %f42, %f6
	setx vahole_target1, %r18, %r27
	.word 0xe69fc029  ! 7: LDDA_R	ldda	[%r31, %r9] 0x01, %r19
memptr_4_6:
	set user_data_start, %r31
	.word 0x8582376c  ! 8: WRCCR_I	wr	%r8, 0x176c, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_4_7:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x95410000  ! 10: RDTICK	rd	%tick, %r10
splash_lsu_4_8:
	nop
	ta T_CHANGE_HPRIV
	set 0x8e0c90b1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_4_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1e0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x97b147cd  ! 12: PDIST	pdistn	%d36, %d44, %d42
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_4_10:
	nop
	setx 0xffffff66ffffff7a, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_4_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1a3fffff917, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_4_12:
	nop
	.word 0xe19fda00  ! 17: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_4_13:
	nop
	.word 0xe19fd960  ! 18: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd65fe028  ! 19: LDX_I	ldx	[%r31 + 0x0028], %r11
	.word 0xd727e170  ! 20: STF_I	st	%f11, [0x0170, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_14) + 56, 16, 16)) -> intp(2,0,16)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_14)&0xffffffff)  + 56, 16, 16)) -> intp(2,0,16)
#else
	setx 0x42f81e6bef10510c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_15-donret_4_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005570dd | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd47, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_15:
	.word 0xd6ffe028  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x0028] %asi
    set 0x388c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb507cd  ! 24: PDIST	pdistn	%d20, %d44, %d44
	.word 0xe1bfdb60  ! 25: STDFA_R	stda	%f16, [%r0, %r31]
pmu_4_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff35dfffff249, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target1, %r18, %r27
	.word 0xd11fe0f0  ! 27: LDDF_I	ldd	[%r31, 0x00f0], %f8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_18)+40, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_18)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_18:
	.word 0xa9852cdc  ! 28: WR_SET_SOFTINT_I	wr	%r20, 0x0cdc, %set_softint
cmp_4_19:
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
cmp_startwait4_19:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_19
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_19:
    brnz,a %r10, cmp_wait4_19
    ld [%r23], %r10
    ba cmp_startwait4_19
    mov 0x4, %r10
continue_cmp_4_19:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_19
    mov 0x8d, %r17
    best_set_reg(0x7e89818693100317, %r16, %r17)
cmp_multi_core_4_19:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa9a0016c  ! 29: FABSq	dis not found

donret_4_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_20-donret_4_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00504f8e | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x59d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_20:
	.word 0xe2ffe1a1  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x01a1] %asi
splash_decr_4_21:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa784000d  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r13, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_22) + 56, 16, 16)) -> intp(0,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_22)&0xffffffff)  + 56, 16, 16)) -> intp(0,0,3)
#else
	setx 0x28f10d8c9476acb0, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_23:
	set 0x60740000, %r31
	.word 0x85842ad3  ! 33: WRCCR_I	wr	%r16, 0x0ad3, %ccr
	.word 0x99a489d3  ! 34: FDIVd	fdivd	%f18, %f50, %f12
brcommon3_4_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02a  ! 1: CASA_I	casa	[%r31] 0x 1, %r10, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd23fe0b0  ! 35: STD_I	std	%r9, [%r31 + 0x00b0]
jmptr_4_26:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_4_27:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_4_28:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 38: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_4_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 39: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
brcommon3_4_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe150  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0150]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc014  ! 40: STXFSR_R	st-sfr	%f1, [%r20, %r31]
	.word 0xd2dfe0d8  ! 41: LDXA_I	ldxa	[%r31, + 0x00d8] %asi, %r9
	.word 0xd327e120  ! 42: STF_I	st	%f9, [0x0120, %r31]
	setx 0x3fbdd84c23140e49, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 44: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
ceter_4_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 45: RDTICK	rd	%tick, %r13
cmp_4_34:
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
cmp_startwait4_34:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_34
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_34:
    brnz,a %r10, cmp_wait4_34
    ld [%r23], %r10
    ba cmp_startwait4_34
    mov 0x4, %r10
continue_cmp_4_34:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_34
    mov 61, %r17
    best_set_reg(0x0f17ca83ba3287d7, %r16, %r17)
cmp_multi_core_4_34:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950005  ! 46: WRPR_PIL_R	wrpr	%r20, %r5, %pil
splash_tba_4_35:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d92400a  ! 48: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0xe33fc012  ! 1: STDF_R	std	%f17, [%r18, %r31]
	.word 0x9f803d20  ! 49: SIR	sir	0x1d20
br_longdelay2_4_37:
	.word 0x22ccc001  ! 1: BRZ	brz,a,pt	%r19,<label_0xcc001>
	.word 0xe23fc00b  ! 50: STD_R	std	%r17, [%r31 + %r11]
splash_cmpr_4_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 51: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_4_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 52: CASA_R	casa	[%r31] %asi, %r17, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_40)+24, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_40)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_40:
	.word 0xa982b25f  ! 53: WR_SET_SOFTINT_I	wr	%r10, 0x125f, %set_softint
jmptr_4_41:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_4_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_42-donret_4_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dd9925 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dcb, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_42:
	.word 0xe26fe064  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x0064]
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
    brnz %r10, cwq_4_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_43
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
cwq_4_43:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 56: RDPC	rd	%pc, %r9
splash_hpstate_4_44:
	.word 0x81982ecd  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecd, %hpstate
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d903af9  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x1af9, %pstate
mondo_4_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d94c008  ! 59: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
mondo_4_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 60: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
splash_hpstate_4_48:
	ta T_CHANGE_NONHPRIV
	.word 0x81983a5d  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1a5d, %hpstate
	.word 0xd31fe190  ! 62: LDDF_I	ldd	[%r31, 0x0190], %f9
	setx vahole_target2, %r18, %r27
	.word 0xe19fd960  ! 63: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon1_4_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa3a0c9b2  ! 64: FDIVs	fdivs	%f3, %f18, %f17
splash_hpstate_4_51:
	ta T_CHANGE_NONHPRIV
	.word 0x819836d7  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16d7, %hpstate
	.word 0x8d903a45  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1a45, %pstate
iaw_4_53:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait4_53:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_53
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_53:
    brnz %r16, iaw_wait4_53
    ld [%r23], %r16
    ba iaw_startwait4_53
    mov 0x4, %r16
continue_iaw_4_53:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_53:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_53
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_53:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_53
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_53:
	mov 0x38, %r18
iaw3_4_53:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe140  ! 67: STDFA_I	stda	%f0, [0x0140, %r31]
br_badelay1_4_54:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0xd337e0a0  ! 1: STQF_I	-	%f9, [0x00a0, %r31]
	.word 0xc36fe010  ! 1: PREFETCH_I	prefetch	[%r31 + 0x0010], #one_read
	normalw
	.word 0xa3458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xd82fe104  ! 69: STB_I	stb	%r12, [%r31 + 0x0104]
donret_4_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_55-donret_4_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0061e919 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7c6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_55:
	.word 0x9ba149d2  ! 70: FDIVd	fdivd	%f36, %f18, %f44
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
    brnz %r10, sma_4_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00d  ! 71: CASA_R	casa	[%r31] %asi, %r13, %r19
	.word 0xe19fe080  ! 72: LDDFA_I	ldda	[%r31, 0x0080], %f16
mondo_4_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94800c  ! 73: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_4_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00d  ! 76: CASA_R	casa	[%r31] %asi, %r13, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xa153c000  ! 79: RDPR_FQ	<illegal instruction>
donret_4_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_59-donret_4_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a3d5be | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dcd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_59:
	.word 0x91a509c3  ! 80: FDIVd	fdivd	%f20, %f34, %f8
	.word 0xda8fe138  ! 81: LDUBA_I	lduba	[%r31, + 0x0138] %asi, %r13
	.word 0xc19fda00  ! 82: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_4_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_4_61:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 84: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_4_62:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d90c00b  ! 86: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_64)+40, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_64)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_64:
	.word 0xa985335f  ! 87: WR_SET_SOFTINT_I	wr	%r20, 0x135f, %set_softint
	.word 0xdb37e0a0  ! 88: STQF_I	-	%f13, [0x00a0, %r31]
mondo_4_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d944011  ! 89: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_4_66:
	set user_data_start, %r31
	.word 0x85846a58  ! 91: WRCCR_I	wr	%r17, 0x0a58, %ccr
jmptr_4_67:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx vahole_target0, %r18, %r27
	.word 0xda9fc02d  ! 95: LDDA_R	ldda	[%r31, %r13] 0x01, %r13
pmu_4_70:
	nop
	setx 0xfffffb0dffffff94, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_71:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_4_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_4_73:
	.word 0x81982817  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0817, %hpstate
donret_4_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_74-donret_4_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bafd57 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1657, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_74:
	.word 0xda6fe076  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x0076]
change_to_randtl_4_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_75:
	.word 0x8f902000  ! 101: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa5a1c9cb  ! 102: FDIVd	fdivd	%f38, %f42, %f18
	.word 0x8d90399f  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x199f, %pstate
intveclr_4_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfb6c1855dfdab0a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_4_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_79-donret_4_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d044f6 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5de, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_79:
	.word 0xa3a449cd  ! 105: FDIVd	fdivd	%f48, %f44, %f48
	.word 0xe4d7e068  ! 106: LDSHA_I	ldsha	[%r31, + 0x0068] %asi, %r18
tagged_4_80:
	tsubcctv %r17, 0x1b8f, %r16
	.word 0xe407e08c  ! 107: LDUW_I	lduw	[%r31 + 0x008c], %r18
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
    brnz %r10, cwq_4_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_81
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
cwq_4_81:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 108: RDPC	rd	%pc, %r11
splash_lsu_4_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x7ef527c3, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 110: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_4_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_4_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950007  ! 112: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0xe1bfdc00  ! 113: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fc2c0  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_4_86:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_87)+48, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_87)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_87:
	.word 0xa981eb68  ! 116: WR_SET_SOFTINT_I	wr	%r7, 0x0b68, %set_softint
brcommon3_4_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c014  ! 1: STQF_R	-	%f8, [%r20, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd11fe130  ! 117: LDDF_I	ldd	[%r31, 0x0130], %f8
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d902cfb  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x0cfb, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_91)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_91)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_91:
	.word 0xa9823900  ! 120: WR_SET_SOFTINT_I	wr	%r8, 0x1900, %set_softint
splash_cmpr_4_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 121: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
cmp_4_93:
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
cmp_startwait4_93:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_93
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_93:
    brnz,a %r10, cmp_wait4_93
    ld [%r23], %r10
    ba cmp_startwait4_93
    mov 0x4, %r10
continue_cmp_4_93:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_93
    mov 0xb5, %r17
    best_set_reg(0x6b8d251d390c771d, %r16, %r17)
cmp_multi_core_4_93:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a00161  ! 122: FABSq	dis not found

cerer_4_94:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xa781dd9b4d946adb, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_4_95:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 124: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfda00  ! 125: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_4_96:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x227f01abad529476, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff18dfffff303, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_99-donret_4_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00674c70 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc4d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_99:
	.word 0x97a449c4  ! 129: FDIVd	fdivd	%f48, %f4, %f42
pmu_4_100:
	nop
	setx 0xfffffe75fffff3b6, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d914012  ! 131: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
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
    brnz %r10, sma_4_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 132: CASA_R	casa	[%r31] %asi, %r11, %r12
	.word 0xc1bfdb60  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_4_103:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_4_104:
	nop
	ta T_CHANGE_HPRIV
	set 0xfdd0410f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x3eacce82e2f328b5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_106:
	.word 0x8f902000  ! 137: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_4_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_107
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
cwq_4_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 138: RDPC	rd	%pc, %r19
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_108)+48, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_108)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_108:
	.word 0xa98125d1  ! 139: WR_SET_SOFTINT_I	wr	%r4, 0x05d1, %set_softint
br_badelay1_4_109:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xdb343f67  ! 1: STQF_I	-	%f13, [0x1f67, %r16]
	.word 0x9bb7c4d0  ! 1: FCMPNE32	fcmpne32	%d62, %d16, %r13
	normalw
	.word 0x93458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_110:
	ta	T_CHANGE_NONHPRIV	! macro
	setx vahole_target1, %r18, %r27
	.word 0xc3eac023  ! 142: PREFETCHA_R	prefetcha	[%r11, %r3] 0x01, #one_read
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
    brnz %r10, cwq_4_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_112
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
cwq_4_112:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 143: RDPC	rd	%pc, %r11
	.word 0xd91fe0b8  ! 144: LDDF_I	ldd	[%r31, 0x00b8], %f12
	setx 0xffbf806bcc23d3e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x96d40007  ! 146: UMULcc_R	umulcc 	%r16, %r7, %r11
splash_cmpr_4_114:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 147: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_4_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94c006  ! 148: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
change_to_randtl_4_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_116:
	.word 0x8f902000  ! 149: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
change_to_randtl_4_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_117:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_118) + 32, 16, 16)) -> intp(5,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_118)&0xffffffff)  + 32, 16, 16)) -> intp(5,0,18)
#else
	setx 0xc957b1e784ad2382, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_119:
	set 0x60540000, %r31
	.word 0x8582250e  ! 152: WRCCR_I	wr	%r8, 0x050e, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902d6e  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0d6e, %pstate
mondo_4_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d948013  ! 155: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0x8d902f39  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x0f39, %pstate
	.word 0x83d020b2  ! 157: Tcc_I	te	icc_or_xcc, %r0 + 178
	setx 0x2e31548f2d5e7325, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36cc012  ! 159: PREFETCH_R	prefetch	[%r19 + %r18], #one_read
fpinit_4_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 160: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_hpstate_4_125:
	ta T_CHANGE_NONHPRIV
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81983c3e  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c3e, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_4_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 163: CASA_R	casa	[%r31] %asi, %r19, %r16
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
    brnz %r10, sma_4_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 164: CASA_R	casa	[%r31] %asi, %r16, %r16
pmu_4_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff81bfffffc72, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_129:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 166: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_4_130:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 167: RDTICK	rd	%tick, %r10
jmptr_4_131:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9b688004  ! 169: SDIVX_R	sdivx	%r2, %r4, %r13
splash_cmpr_4_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 170: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_4_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_133
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
cwq_4_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 172: RDPC	rd	%pc, %r18
jmptr_4_134:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fc2e0  ! 174: LDDA_R	ldda	[%r31, %r0] 0x17, %r16
	setx 0xf177ca81c0e642c6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_136:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 176: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e018  ! 177: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r16
splash_cmpr_4_137:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 178: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_4_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d944012  ! 179: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
change_to_randtl_4_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_139:
	.word 0x8f902001  ! 180: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
jmptr_4_140:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
cmp_4_141:
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
cmp_startwait4_141:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_141
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_141:
    brnz,a %r10, cmp_wait4_141
    ld [%r23], %r10
    ba cmp_startwait4_141
    mov 0x4, %r10
continue_cmp_4_141:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_141
    mov 0x48, %r17
    best_set_reg(0x1a03e7318dfed4ee, %r16, %r17)
cmp_multi_core_4_141:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91940011  ! 182: WRPR_PIL_R	wrpr	%r16, %r17, %pil
donret_4_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_142-donret_4_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f1f746 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x44, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_142:
	.word 0x95a1c9d2  ! 183: FDIVd	fdivd	%f38, %f18, %f10
	.word 0xe6c7e1b8  ! 184: LDSWA_I	ldswa	[%r31, + 0x01b8] %asi, %r19
	.word 0xc1bfdf20  ! 185: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe6cfe150  ! 186: LDSBA_I	ldsba	[%r31, + 0x0150] %asi, %r19
splash_cmpr_4_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 187: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa8818003  ! 188: ADDcc_R	addcc 	%r6, %r3, %r20
ibp_4_144:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fe0a0  ! 189: LDDFA_I	ldda	[%r31, 0x00a0], %f0
ceter_4_145:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 190: RDTICK	rd	%tick, %r20
ceter_4_146:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x9b410000  ! 191: RDTICK	rd	%tick, %r13
	setx 0x608cbada9113cb41, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_4_148:
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
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
cmp_4_149:
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
cmp_startwait4_149:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_149
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_149:
    brnz,a %r10, cmp_wait4_149
    ld [%r23], %r10
    ba cmp_startwait4_149
    mov 0x4, %r10
continue_cmp_4_149:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_149
    mov 0x9f, %r17
    best_set_reg(0x02bdd6dea7c5800b, %r16, %r17)
cmp_multi_core_4_149:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x99a00166  ! 194: FABSq	dis not found

	.word 0xe6c7e118  ! 195: LDSWA_I	ldswa	[%r31, + 0x0118] %asi, %r19
splash_lsu_4_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x070d1fcc, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe020  ! 198: LDX_I	ldx	[%r31 + 0x0020], %r19
splash_hpstate_4_152:
	ta T_CHANGE_NONHPRIV
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8198295d  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095d, %hpstate
	.word 0x9753c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0xd33fc011  ! 1: STDF_R	std	%f9, [%r17, %r31]
	.word 0x9f803490  ! 201: SIR	sir	0x1490
mondo_4_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d950007  ! 202: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
jmptr_4_154:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91a509d4  ! 204: FDIVd	fdivd	%f20, %f20, %f8
pmu_4_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff56ffffff036, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x0dd023b6f30530f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e1b8  ! 207: STX_I	stx	%r19, [%r31 + 0x01b8]
brcommon2_4_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a7c96b  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fde00  ! 208: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x92fc4014  ! 209: SDIVcc_R	sdivcc 	%r17, %r20, %r9
	.word 0xd897e128  ! 210: LDUHA_I	lduha	[%r31, + 0x0128] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_4_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_159:
	.word 0x8f902000  ! 212: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_4_160:
	tsubcctv %r11, 0x1811, %r19
	.word 0xd807e110  ! 213: LDUW_I	lduw	[%r31 + 0x0110], %r12
br_badelay1_4_161:
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
	.word 0x24cfc001  ! 1: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	normalw
	.word 0x99458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r12
pmu_4_162:
	nop
	setx 0xfffff712fffff57c, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tick_4_163:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x9b7fa5643448045f, %r16, %r17)
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_4_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0d9fffff441, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 218: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc1bfd960  ! 219: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfdc00  ! 220: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfe160  ! 221: STDFA_I	stda	%f0, [0x0160, %r31]
	setx 0xd053f8e64ef47501, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_4_166:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xbfe7c000  ! 223: SAVE_R	save	%r31, %r0, %r31
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
    brnz %r10, sma_4_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 224: CASA_R	casa	[%r31] %asi, %r16, %r16
jmptr_4_168:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xaaf1cdad497ab66b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d94800d  ! 227: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
splash_cmpr_4_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 228: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_4_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc8dfffff1d7, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xf2004389, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d930012  ! 231: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
memptr_4_175:
	set 0x60140000, %r31
	.word 0x85846aae  ! 232: WRCCR_I	wr	%r17, 0x0aae, %ccr
mondo_4_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 233: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_177)+40, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_177)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_177:
	.word 0xa982b653  ! 234: WR_SET_SOFTINT_I	wr	%r10, 0x1653, %set_softint
splash_lsu_4_178:
	nop
	ta T_CHANGE_HPRIV
	set 0xcc0f3c5b, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_179:
	nop
	setx 0xfffff467fffffd45, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_180:
	nop
	ta T_CHANGE_HPRIV
	set 0xc91bfad9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 238: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e070  ! 239: LDSH_I	ldsh	[%r31 + 0x0070], %r16
donret_4_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_182-donret_4_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff4ae6 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_182:
	.word 0xe0ffe131  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x0131] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe160  ! 242: STDFA_I	stda	%f0, [0x0160, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_184)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_184)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_184:
	.word 0xa984bdc9  ! 243: WR_SET_SOFTINT_I	wr	%r18, 0x1dc9, %set_softint
	.word 0x9ba349b2  ! 244: FDIVs	fdivs	%f13, %f18, %f13
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_4_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_186
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
cwq_4_186:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 246: RDPC	rd	%pc, %r10
	setx 0x7a1b9c7669071990, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_188:
	nop
	setx 0xfffff7f3fffff040, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_189:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 249: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_4_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_190-donret_4_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e07307 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dc7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_190:
	.word 0xa1a509d4  ! 250: FDIVd	fdivd	%f20, %f20, %f16
memptr_4_191:
	set 0x60140000, %r31
	.word 0x8582ed18  ! 251: WRCCR_I	wr	%r11, 0x0d18, %ccr
	.word 0xe49fc240  ! 252: LDDA_R	ldda	[%r31, %r0] 0x12, %r18
invtsb_4_192:
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
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_4_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_193
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
cwq_4_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 254: RDPC	rd	%pc, %r19
splash_lsu_4_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xe9d6fde3, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa553c000  ! 256: RDPR_FQ	<illegal instruction>
	setx vahole_target2, %r18, %r27
	.word 0xe91fe1e0  ! 257: LDDF_I	ldd	[%r31, 0x01e0], %f20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_196) + 0, 16, 16)) -> intp(7,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_196)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,27)
#else
	setx 0xb1459a3e7e0aa203, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_4_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 259: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xe8c7e010  ! 260: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r20
	setx vahole_target3, %r18, %r27
	.word 0x9ba049b3  ! 261: FDIVs	fdivs	%f1, %f19, %f13
	.word 0xd697e0d0  ! 262: LDUHA_I	lduha	[%r31, + 0x00d0] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe1d8  ! 264: LDUBA_I	lduba	[%r31, + 0x01d8] %asi, %r11
pmu_4_199:
	nop
	setx 0xfffff070fffff390, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tick_4_200:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xa94061feabe185c8, %r16, %r17)
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
	setx vahole_target1, %r18, %r27
	.word 0xa3a349c7  ! 267: FDIVd	fdivd	%f44, %f38, %f48
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d902183  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0183, %pstate
	.word 0xe097e0a8  ! 269: LDUHA_I	lduha	[%r31, + 0x00a8] %asi, %r16
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
    brnz %r10, sma_4_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 270: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0xe07fe060  ! 271: SWAP_I	swap	%r16, [%r31 + 0x0060]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_4_204:
    set user_data_start, %o7
	.word 0x93902001  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
pmu_4_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8d2fffffce2, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918006  ! 275: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
br_badelay3_4_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a00544  ! 1: FSQRTd	fsqrt	
	.word 0xa3a10834  ! 276: FADDs	fadds	%f4, %f20, %f17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_208:
	ta	T_CHANGE_NONPRIV	! macro
splash_tick_4_209:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x33dc5a2dcecec097, %r16, %r17)
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_4_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d908005  ! 279: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
donret_4_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_211-donret_4_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ccc0f0 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14d0, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_211:
	.word 0xd86fe1e0  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x01e0]
donret_4_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_212-donret_4_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005df803 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe09, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_212:
	.word 0xa3a089d4  ! 281: FDIVd	fdivd	%f2, %f20, %f48
brcommon1_4_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac0a52  ! 282: FCMPd	fcmpd	%fcc<n>, %f16, %f18
	.word 0xe19fe080  ! 283: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0x8d9032c7  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x12c7, %pstate
splash_cmpr_4_215:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 285: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_4_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 286: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x24ccc001  ! 1: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
	.word 0x8d902d13  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0d13, %pstate
splash_lsu_4_219:
	nop
	ta T_CHANGE_HPRIV
	set 0x28c5275f, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_4_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_220-donret_4_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aae90d | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x597, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_220:
	.word 0xd66fe12f  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x012f]
	.word 0x83d02032  ! 291: Tcc_I	te	icc_or_xcc, %r0 + 50
	setx 0x02c691824ba04f84, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_4_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e020  ! 1: STQF_I	-	%f11, [0x0020, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6bfc02a  ! 293: STDA_R	stda	%r11, [%r31 + %r10] 0x01
	.word 0xd6d7e108  ! 294: LDSHA_I	ldsha	[%r31, + 0x0108] %asi, %r11
pmu_4_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff961fffff51f, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_4_224:
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
cmp_startwait4_224:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_224
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_224:
    brnz,a %r10, cmp_wait4_224
    ld [%r23], %r10
    ba cmp_startwait4_224
    mov 0x4, %r10
continue_cmp_4_224:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_224
    mov 0x81, %r17
    best_set_reg(0x3b107a2a9997499b, %r16, %r17)
cmp_multi_core_4_224:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91a0016a  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_225)+40, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_225)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_225:
	.word 0xa984ed62  ! 297: WR_SET_SOFTINT_I	wr	%r19, 0x0d62, %set_softint
memptr_4_226:
	set 0x60340000, %r31
	.word 0x8585298c  ! 298: WRCCR_I	wr	%r20, 0x098c, %ccr
mondo_4_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 299: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0xd297e010  ! 300: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	setx vahole_target2, %r18, %r27
	.word 0xa3a149c6  ! 301: FDIVd	fdivd	%f36, %f6, %f48
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_229)+16, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_229)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_229:
	.word 0xa9837fb8  ! 302: WR_SET_SOFTINT_I	wr	%r13, 0x1fb8, %set_softint
	.word 0x8d903a41  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x1a41, %pstate
	setx vahole_target0, %r18, %r27
	.word 0xe897c030  ! 304: LDUHA_R	lduha	[%r31, %r16] 0x01, %r20
trapasi_4_232:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8d04980  ! 305: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_233)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_233)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_233:
	.word 0xa9852ca5  ! 306: WR_SET_SOFTINT_I	wr	%r20, 0x0ca5, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_234) + 0, 16, 16)) -> intp(0,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_234)&0xffffffff)  + 0, 16, 16)) -> intp(0,0,17)
#else
	setx 0x1d8c6cbfdef59e32, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_4_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff29efffff55d, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_4_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_236
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
cwq_4_236:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 310: RDPC	rd	%pc, %r16
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
    brnz %r10, sma_4_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e010  ! 311: CASA_R	casa	[%r31] %asi, %r16, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_4_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 313: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0xc30fc014  ! 1: LDXFSR_R	ld-fsr	[%r31, %r20], %f1
	.word 0x9f8031c1  ! 314: SIR	sir	0x11c1
	.word 0x93d02032  ! 315: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_4_240:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_4_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d914012  ! 317: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_4_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 319: CASA_R	casa	[%r31] %asi, %r18, %r8
br_longdelay1_4_243:
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0xbfefc000  ! 320: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_4_244:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 321: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_4_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff568ffffff4f, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_246:
	nop
	setx 0xfffffb91fffff69d, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
splash_tick_4_247:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x288f39c96d921895, %r16, %r17)
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
cmp_4_248:
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
cmp_startwait4_248:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_248
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_248:
    brnz,a %r10, cmp_wait4_248
    ld [%r23], %r10
    ba cmp_startwait4_248
    mov 0x4, %r10
continue_cmp_4_248:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_248
    mov 0x51, %r17
    best_set_reg(0xda7f7bdcf4daba28, %r16, %r17)
cmp_multi_core_4_248:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa7a00168  ! 326: FABSq	dis not found

mondo_4_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 327: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_250) + 40, 16, 16)) -> intp(7,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_250)&0xffffffff)  + 40, 16, 16)) -> intp(7,0,9)
#else
	setx 0x1deb8790fa0b2c73, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_251-donret_4_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000e0b23 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x607, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_251:
	.word 0xa5a349d2  ! 329: FDIVd	fdivd	%f44, %f18, %f18
	.word 0xd4c7e068  ! 330: LDSWA_I	ldswa	[%r31, + 0x0068] %asi, %r10
	.word 0xe1bfe020  ! 331: STDFA_I	stda	%f16, [0x0020, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_4_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc16e3672	! Random illegal ?
	.word 0xa7a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa7a4482a  ! 333: FADDs	fadds	%f17, %f10, %f19
splash_hpstate_4_253:
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8198295f  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095f, %hpstate
mondo_4_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d94c003  ! 335: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0xe31fc013  ! 1: LDDF_R	ldd	[%r31, %r19], %f17
	.word 0x9f80392a  ! 336: SIR	sir	0x192a
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e0e0  ! 338: STX_I	stx	%r17, [%r31 + 0x00e0]
pmu_4_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff167fffff2ab, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 341: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe227e012  ! 342: STW_I	stw	%r17, [%r31 + 0x0012]
	setx 0xa3897ac93481ae68, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_4_258:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_4_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_259-donret_4_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f5701c | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x505, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_4_259:
	.word 0xa5a449d4  ! 345: FDIVd	fdivd	%f48, %f20, %f18
jmptr_4_260:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
cmp_4_261:
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
cmp_startwait4_261:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_261
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_261:
    brnz,a %r10, cmp_wait4_261
    ld [%r23], %r10
    ba cmp_startwait4_261
    mov 0x4, %r10
continue_cmp_4_261:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_261
    mov 0x5f, %r17
    best_set_reg(0x6f75f38d9edc4820, %r16, %r17)
cmp_multi_core_4_261:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a00165  ! 347: FABSq	dis not found

	.word 0x96c436f4  ! 348: ADDCcc_I	addccc 	%r16, 0xfffff6f4, %r11
mondo_4_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c005  ! 349: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d902d95  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0d95, %pstate
	.word 0xe19fe080  ! 351: LDDFA_I	ldda	[%r31, 0x0080], %f16
splash_tick_4_264:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x58d58790e2fd55e4, %r16, %r17)
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_266) + 40, 16, 16)) -> intp(7,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_266)&0xffffffff)  + 40, 16, 16)) -> intp(7,0,23)
#else
	setx 0xc8291d80ef1f0413, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target1, %r18, %r27
	.word 0xe63fe1e0  ! 355: STD_I	std	%r19, [%r31 + 0x01e0]
	.word 0xc19fe0c0  ! 356: LDDFA_I	ldda	[%r31, 0x00c0], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_268)+24, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_268)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_268:
	.word 0xa982bf3f  ! 357: WR_SET_SOFTINT_I	wr	%r10, 0x1f3f, %set_softint
	setx 0x8ced63321d5443c7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_4_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_270
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
cwq_4_270:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 359: RDPC	rd	%pc, %r11
splash_tick_4_271:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x5d29c348834e9b01, %r16, %r17)
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_4_272:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0xbfefc000  ! 361: RESTORE_R	restore	%r31, %r0, %r31
fpinit_4_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 362: FCMPd	fcmpd	%fcc<n>, %f0, %f4
jmptr_4_274:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
cerer_4_275:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x94e03f0eb4b7c457, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_4_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0x638c5a64a8af8f24, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_4_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_277
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
cwq_4_277:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 366: RDPC	rd	%pc, %r18
brcommon3_4_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c00a  ! 1: STQF_R	-	%f12, [%r10, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc011  ! 367: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0xd827e1be  ! 368: STW_I	stw	%r12, [%r31 + 0x01be]
	.word 0xd8c7e0d8  ! 369: LDSWA_I	ldswa	[%r31, + 0x00d8] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_279)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_279)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_279:
	.word 0xa981a915  ! 370: WR_SET_SOFTINT_I	wr	%r6, 0x0915, %set_softint
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
    brnz %r10, cwq_4_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_280
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
cwq_4_280:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 371: RDPC	rd	%pc, %r18
	.word 0xd4cfe038  ! 372: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r10
splash_cmpr_4_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 373: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_4_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 374: CASA_R	casa	[%r31] %asi, %r8, %r10
br_badelay2_4_283:
	.word 0x91a089d2  ! 1: FDIVd	fdivd	%f2, %f18, %f8
	pdist %f30, %f22, %f14
	.word 0x97b14306  ! 375: ALIGNADDRESS	alignaddr	%r5, %r6, %r11
	.word 0xc19fe180  ! 376: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xd5e7c02a  ! 1: CASA_I	casa	[%r31] 0x 1, %r10, %r10
	.word 0x9f8024a2  ! 377: SIR	sir	0x04a2
	.word 0xc1bfdb60  ! 378: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa6dcc011  ! 379: SMULcc_R	smulcc 	%r19, %r17, %r19
	.word 0xc36fe17c  ! 380: PREFETCH_I	prefetch	[%r31 + 0x017c], #one_read
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
    brnz %r10, cwq_4_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_285
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
cwq_4_285:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 381: RDPC	rd	%pc, %r8
brcommon3_4_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c010  ! 1: STQF_R	-	%f13, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fe100  ! 382: LDDF_I	ldd	[%r31, 0x0100], %f13
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
iaw_4_287:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait4_287:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_287
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_287:
    brnz %r16, iaw_wait4_287
    ld [%r23], %r16
    ba iaw_startwait4_287
    mov 0x4, %r16
continue_iaw_4_287:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_287:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_287
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_287:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_287
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_287:
	mov 0x38, %r18
iaw4_4_287:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fe140  ! 384: LDDF_I	ldd	[%r31, 0x0140], %f13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_288) + 24, 16, 16)) -> intp(3,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_288)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,20)
#else
	setx 0x0f115f969e0aea28, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_4_289:
	taddcctv %r18, 0x1806, %r9
	.word 0xda07e1fd  ! 386: LDUW_I	lduw	[%r31 + 0x01fd], %r13
ibp_4_290:
	nop
	.word 0xe1bfe0c0  ! 387: STDFA_I	stda	%f16, [0x00c0, %r31]
cwp_4_291:
    set user_data_start, %o7
	.word 0x93902004  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
pmu_4_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeabfffffbe2, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_4_294:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa7410000  ! 391: RDTICK	rd	%tick, %r19
cwp_4_295:
    set user_data_start, %o7
	.word 0x93902001  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_4_296:
	nop
	ta T_CHANGE_HPRIV
	set 0xa1a949ca, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_4_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0x480a21547d680f14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_4_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb73, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc012  ! 397: STDF_R	std	%f17, [%r18, %r31]
mondo_4_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92400c  ! 398: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
	.word 0xe19fd960  ! 399: LDDFA_R	ldda	[%r31, %r0], %f16
splash_decr_4_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa784c014  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_302) + 8, 16, 16)) -> intp(4,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_302)&0xffffffff)  + 8, 16, 16)) -> intp(4,0,3)
#else
	setx 0x3079e22d1844ab6a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_4_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f8021b0  ! 1: SIR	sir	0x01b0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 402: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_4_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 403: CASA_R	casa	[%r31] %asi, %r16, %r9
pmu_4_305:
	nop
	setx 0xfffff140fffff53d, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_306:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tick_4_307:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x475346ca0755eec0, %r16, %r17)
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_308) + 24, 16, 16)) -> intp(1,0,2)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_308)&0xffffffff)  + 24, 16, 16)) -> intp(1,0,2)
#else
	setx 0x8d28c87a9b66599d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_309:
	.word 0x819820d4  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
br_badelay2_4_310:
	.word 0xa5a309d0  ! 1: FDIVd	fdivd	%f12, %f16, %f18
	pdist %f12, %f0, %f6
	.word 0x91b14311  ! 409: ALIGNADDRESS	alignaddr	%r5, %r17, %r8
splash_cmpr_4_311:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 410: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_4_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 411: CASA_R	casa	[%r31] %asi, %r20, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_313)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_313)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_313:
	.word 0xa9806f1a  ! 412: WR_SET_SOFTINT_I	wr	%r1, 0x0f1a, %set_softint
memptr_4_314:
	set 0x60740000, %r31
	.word 0x8584be02  ! 413: WRCCR_I	wr	%r18, 0x1e02, %ccr
cmp_4_315:
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
cmp_startwait4_315:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_315
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_315:
    brnz,a %r10, cmp_wait4_315
    ld [%r23], %r10
    ba cmp_startwait4_315
    mov 0x4, %r10
continue_cmp_4_315:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_315
    mov 0xf1, %r17
    best_set_reg(0xcd463527c96fb603, %r16, %r17)
cmp_multi_core_4_315:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9192c010  ! 414: WRPR_PIL_R	wrpr	%r11, %r16, %pil
	.word 0xe43fe110  ! 1: STD_I	std	%r18, [%r31 + 0x0110]
	.word 0x9f802213  ! 415: SIR	sir	0x0213
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
    brnz %r10, cwq_4_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_316
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
cwq_4_316:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 416: RDPC	rd	%pc, %r13
intveclr_4_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdd1d8cc4a63a6edb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 418: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x4d747da76e6366e0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_4_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d950001  ! 421: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
splash_lsu_4_322:
	nop
	ta T_CHANGE_HPRIV
	set 0x8e0a47ff, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe1b8  ! 424: STD_I	std	%r13, [%r31 + 0x01b8]
	.word 0x91d02033  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ac0  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x1ac0, %pstate
br_badelay2_4_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b30312  ! 428: ALIGNADDRESS	alignaddr	%r12, %r18, %r8
	setx vahole_target0, %r18, %r27
	.word 0xd71fc013  ! 429: LDDF_R	ldd	[%r31, %r19], %f11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_326) + 48, 16, 16)) -> intp(1,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_326)&0xffffffff)  + 48, 16, 16)) -> intp(1,0,18)
#else
	setx 0x61b4fae9e081f5e1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_327:
	ta T_CHANGE_NONHPRIV
	.word 0x819835fe  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15fe, %hpstate
splash_htba_4_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x93b48550  ! 434: FCMPEQ16	fcmpeq16	%d18, %d16, %r9
donret_4_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_329-donret_4_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000ed250 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb46, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_329:
	.word 0xd8ffe16f  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x016f] %asi
	.word 0x97a44d30  ! 436: FsMULd	fsmuld	%f17, %f16, %f42
splash_tba_4_330:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_4_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_331-donret_4_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006a671c | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14cb, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_331:
	.word 0xe26fe1bd  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x01bd]
donret_4_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_332-donret_4_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e6b38 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4cd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_332:
	.word 0x9ba489d2  ! 441: FDIVd	fdivd	%f18, %f18, %f44
	setx 0x681e856389d70fab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe038  ! 443: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r20
	.word 0xe937e18b  ! 444: STQF_I	-	%f20, [0x018b, %r31]
cerer_4_334:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x6baf52f60888a165, %r26, %r27)
    sethi %hi(0x20008000), %r26   ! Set ITTM/DTTM
    sllx %r26, 32, %r26
    or %r26, %r27, %r27
    mov 0x10, %r26
    stxa %r27, [%r26]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
iaw_4_335:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait4_335:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_335
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_335:
    brnz %r16, iaw_wait4_335
    ld [%r23], %r16
    ba iaw_startwait4_335
    mov 0x4, %r16
continue_iaw_4_335:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_335:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_335
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_335:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_335
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_335:
	mov 0x38, %r18
iaw4_4_335:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb4031  ! 446: PREFETCHA_R	prefetcha	[%r13, %r17] 0x01, #one_read
brcommon2_4_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9b7c70a  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f10, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdb60  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x984cc009  ! 448: MULX_R	mulx 	%r19, %r9, %r12
splash_lsu_4_337:
	nop
	ta T_CHANGE_HPRIV
	set 0x4e4b46cb, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 450: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
splash_tick_4_339:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xe8ed4ae3190d0f6b, %r16, %r17)
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_4_340:
	ta T_CHANGE_NONHPRIV
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8198281e  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
pmu_4_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffc2fffffa39, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b4  ! 454: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9ba1c9b4  ! 455: FDIVs	fdivs	%f7, %f20, %f13
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_4_342:
    set user_data_start, %o7
	.word 0x93902006  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
jmptr_4_343:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_4_344:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_4_345:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_4_346:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait4_346:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_346
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_346:
    brnz %r16, iaw_wait4_346
    ld [%r23], %r16
    ba iaw_startwait4_346
    mov 0x4, %r16
continue_iaw_4_346:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_346:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_346
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_346:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_346
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_346:
	mov 0x38, %r18
iaw1_4_346:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc031  ! 461: STDA_R	stda	%r19, [%r31 + %r17] 0x01
brcommon1_4_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa77021a0  ! 1: POPC_I	popc	0x01a0, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x87ac4a54  ! 462: FCMPd	fcmpd	%fcc<n>, %f48, %f20
splash_tick_4_348:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xbe4f4e0149d3ee51, %r16, %r17)
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_4_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x97410000  ! 464: RDTICK	rd	%tick, %r11
splash_cmpr_4_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 465: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9680c013  ! 466: ADDcc_R	addcc 	%r3, %r19, %r11
	.word 0xd28008a0  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
memptr_4_351:
	set user_data_start, %r31
	.word 0x8581b03e  ! 468: WRCCR_I	wr	%r6, 0x103e, %ccr
	.word 0xd27fe060  ! 469: SWAP_I	swap	%r9, [%r31 + 0x0060]
	.word 0x93a7c9d0  ! 1: FDIVd	fdivd	%f62, %f16, %f40
	.word 0x9f802432  ! 470: SIR	sir	0x0432
cmp_4_352:
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
cmp_startwait4_352:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_4_352
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait4_352:
    brnz,a %r10, cmp_wait4_352
    ld [%r23], %r10
    ba cmp_startwait4_352
    mov 0x4, %r10
continue_cmp_4_352:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_4_352
    mov 55, %r17
    best_set_reg(0xb3d7c85ddeadaec9, %r16, %r17)
cmp_multi_core_4_352:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192800c  ! 471: WRPR_PIL_R	wrpr	%r10, %r12, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_4_353:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
iaw_4_354:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait4_354:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_4_354
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
iaw_wait4_354:
    brnz %r16, iaw_wait4_354
    ld [%r23], %r16
    ba iaw_startwait4_354
    mov 0x4, %r16
continue_iaw_4_354:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_354:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_354
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_4_354:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_4_354
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit4_354:
	mov 0x38, %r18
iaw1_4_354:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3e90034  ! 474: PREFETCHA_R	prefetcha	[%r4, %r20] 0x01, #one_read
	.word 0x87a88a42  ! 475: FCMPd	fcmpd	%fcc<n>, %f2, %f2
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_356)+56, 16, 16)) -> intp(mask2tid(0x4),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_356)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x4),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_4_356:
	.word 0xa9817a0d  ! 476: WR_SET_SOFTINT_I	wr	%r5, 0x1a0d, %set_softint
trapasi_4_357:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8904980  ! 477: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r12
	.word 0xc19fe040  ! 478: LDDFA_I	ldda	[%r31, 0x0040], %f0
donret_4_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_358-donret_4_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007871fe | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_358:
	.word 0xd8ffe03d  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x003d] %asi
invtsb_4_359:
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
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_4_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 481: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xe19fdf20  ! 482: LDDFA_R	ldda	[%r31, %r0], %f16
br_badelay1_4_361:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
	.word 0xd9e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r12
	normalw
	.word 0xa9458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xdbe7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r13
	.word 0x9f802e85  ! 484: SIR	sir	0x0e85
	.word 0xdb27e18c  ! 485: STF_I	st	%f13, [0x018c, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_4_362:
	nop
	setx 0xfffff264fffff643, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d902edc  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	.word 0xda3fc000  ! 490: STD_R	std	%r13, [%r31 + %r0]
donret_4_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_365-donret_4_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cb6f64 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x567, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_365:
	.word 0xdaffe0b4  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x00b4] %asi
	.word 0xdb27e1c0  ! 492: STF_I	st	%f13, [0x01c0, %r31]
	.word 0xdaffc032  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r18] 0x01
splash_cmpr_4_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 494: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9ba7c9b2  ! 1: FDIVs	fdivs	%f31, %f18, %f13
	.word 0x9f80381b  ! 496: SIR	sir	0x181b
pmu_4_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffae5fffffe92, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_4_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_368
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
cwq_4_368:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 498: RDPC	rd	%pc, %r18
change_to_randtl_4_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_4_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d90c004  ! 501: WRPR_WSTATE_R	wrpr	%r3, %r4, %wstate
cmpenall_4_371:
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
cmpenall_startwait4_371:
    mov 0x4, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_4_371
    nop
cmpenall_wait4_371:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait4_371
    nop
    ba,a cmpenall_startwait4_371
continue_cmpenall_4_371:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_4_371:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_4_371
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_4_371:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_4_371
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
br_longdelay1_2_0:
	.word 0x24ca8001  ! 1: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	brnz,a,pt	%r20, skip_2_1
	brlez,a,pt	%r18, skip_2_1
.align 1024
skip_2_1:
	.word 0xe7e7c020  ! 2: CASA_I	casa	[%r31] 0x 1, %r0, %r19
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
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e009  ! 3: CASA_R	casa	[%r31] %asi, %r9, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_3:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_2_4:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7848011  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r17, %-
	.word 0x87aa4ad4  ! 6: FCMPEd	fcmped	%fcc<n>, %f40, %f20
vahole_2_5:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe63fe1e0  ! 7: STD_I	std	%r19, [%r31 + 0x01e0]
memptr_2_6:
	set user_data_start, %r31
	.word 0x858378ec  ! 8: WRCCR_I	wr	%r13, 0x18ec, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_2_7:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x9b410000  ! 10: RDTICK	rd	%tick, %r13
splash_lsu_2_8:
	nop
	ta T_CHANGE_HPRIV
	set 0xbccc9f7b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_2_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe020  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0020]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f8030f8  ! 12: SIR	sir	0x10f8
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_2_10:
	nop
	setx 0xfffff392fffff6ca, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_2_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff583fffff839, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_12:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait2_12:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_12
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_12:
    brnz %r16, ibp_wait2_12
    ld [%r23], %r16
    ba ibp_startwait2_12
    mov 0x2, %r16
continue_ibp_2_12:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_12:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_12
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_12:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_12
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_12:
    best_set_reg(0x0000004099c00792,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfdc00  ! 17: STDFA_R	stda	%f0, [%r0, %r31]
ibp_2_13:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait2_13:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_13
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_13:
    brnz %r16, ibp_wait2_13
    ld [%r23], %r16
    ba ibp_startwait2_13
    mov 0x2, %r16
continue_ibp_2_13:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_13:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_13
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_13:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_13
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_13:
    best_set_reg(0x00000050edc792b1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfd960  ! 18: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd65fe128  ! 19: LDX_I	ldx	[%r31 + 0x0128], %r11
	.word 0xd727e16c  ! 20: STF_I	st	%f11, [0x016c, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_14) + 32, 16, 16)) -> intp(6,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_14)&0xffffffff)  + 32, 16, 16)) -> intp(6,0,27)
#else
	setx 0xec23930ccf54e058, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_15-donret_2_15-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006a0aff | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1fcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_15:
	.word 0xd6ffe044  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x0044] %asi
    set 0x22fd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b247c3  ! 24: PDIST	pdistn	%d40, %d34, %d40
	.word 0xe1bfde00  ! 25: STDFA_R	stda	%f16, [%r0, %r31]
pmu_2_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd0bfffff7e8, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_2_17:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd09fc02c  ! 27: LDDA_R	ldda	[%r31, %r12] 0x01, %r8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_18)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_18)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_18:
	.word 0xa9823f67  ! 28: WR_SET_SOFTINT_I	wr	%r8, 0x1f67, %set_softint
	.word 0x9ba0016c  ! 29: FABSq	dis not found

donret_2_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_20-donret_2_20-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008cf890 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x175f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	retry
donretarg_2_20:
	.word 0xe2ffe0ad  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x00ad] %asi
splash_decr_2_21:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7844008  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r8, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_22) + 8, 16, 16)) -> intp(7,0,20)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_22)&0xffffffff)  + 8, 16, 16)) -> intp(7,0,20)
#else
	setx 0xcafc5c9a27396114, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_23:
	set 0x60340000, %r31
	.word 0x85833eb7  ! 33: WRCCR_I	wr	%r12, 0x1eb7, %ccr
unsupttte_2_24:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a409a1  ! 34: FDIVs	fdivs	%f16, %f1, %f20
brcommon3_2_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd29fe0b0  ! 35: LDDA_I	ldda	[%r31, + 0x00b0] %asi, %r9
jmptr_2_26:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_2_27:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_2_28:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 38: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_2_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92800d  ! 39: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
brcommon3_2_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe1e0  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x01e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd2bfc032  ! 40: STDA_R	stda	%r9, [%r31 + %r18] 0x01
	.word 0xd2dfe1f0  ! 41: LDXA_I	ldxa	[%r31, + 0x01f0] %asi, %r9
	.word 0xd327e0a4  ! 42: STF_I	st	%f9, [0x00a4, %r31]
	setx 0x2e577144d7ab7956, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d934005  ! 44: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
ceter_2_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa7410000  ! 45: RDTICK	rd	%tick, %r19
	.word 0x91934013  ! 46: WRPR_PIL_R	wrpr	%r13, %r19, %pil
splash_tba_2_35:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d940005  ! 48: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0xe2bfc031  ! 1: STDA_R	stda	%r17, [%r31 + %r17] 0x01
	.word 0x9f80275d  ! 49: SIR	sir	0x075d
br_longdelay2_2_37:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24cfc001  ! 50: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
splash_cmpr_2_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 51: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_2_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 52: CASA_R	casa	[%r31] %asi, %r16, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_40)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_40)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_40:
	.word 0xa984bae1  ! 53: WR_SET_SOFTINT_I	wr	%r18, 0x1ae1, %set_softint
jmptr_2_41:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_2_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_42-donret_2_42-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00181ce7 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c87, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_42:
	.word 0xe26fe0aa  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x00aa]
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
    brnz %r10, cwq_2_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_43
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
cwq_2_43:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 56: RDPC	rd	%pc, %r9
splash_hpstate_2_44:
	.word 0x81983bcf  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bcf, %hpstate
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8d903e39  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x1e39, %pstate
mondo_2_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d94c006  ! 59: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
mondo_2_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d934010  ! 60: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
splash_hpstate_2_48:
	ta T_CHANGE_NONHPRIV
	.word 0x81982c0f  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0xd31fe0b0  ! 62: LDDF_I	ldd	[%r31, 0x00b0], %f9
vahole_2_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfd960  ! 63: STDFA_R	stda	%f0, [%r0, %r31]
brcommon1_2_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f802d7b  ! 64: SIR	sir	0x0d7b
splash_hpstate_2_51:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d8e  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
	.word 0x8d903382  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1382, %pstate
	.word 0xe1bfe1e0  ! 67: STDFA_I	stda	%f16, [0x01e0, %r31]
br_badelay1_2_54:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0xd337e190  ! 1: STQF_I	-	%f9, [0x0190, %r31]
	.word 0xd3e7c02a  ! 1: CASA_I	casa	[%r31] 0x 1, %r10, %r9
	normalw
	.word 0xa7458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xd82fe0d1  ! 69: STB_I	stb	%r12, [%r31 + 0x00d1]
donret_2_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_55-donret_2_55-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e6f20e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x795, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_2_55:
	.word 0x9ba449c7  ! 70: FDIVd	fdivd	%f48, %f38, %f44
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
    brnz %r10, sma_2_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 71: CASA_R	casa	[%r31] %asi, %r12, %r19
	.word 0xc19fe020  ! 72: LDDFA_I	ldda	[%r31, 0x0020], %f0
mondo_2_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 73: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_2_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 76: CASA_R	casa	[%r31] %asi, %r16, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9353c000  ! 79: RDPR_FQ	<illegal instruction>
donret_2_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_59-donret_2_59-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f8523f | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4c5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_59:
	.word 0xa7a1c9ca  ! 80: FDIVd	fdivd	%f38, %f10, %f50
	.word 0xda8fe0c0  ! 81: LDUBA_I	lduba	[%r31, + 0x00c0] %asi, %r13
	.word 0xe19fde00  ! 82: LDDFA_R	ldda	[%r31, %r0], %f16
change_to_randtl_2_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_2_61:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 84: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_2_62:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 86: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_64)+8, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_64)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_64:
	.word 0xa982e608  ! 87: WR_SET_SOFTINT_I	wr	%r11, 0x0608, %set_softint
	.word 0xdb37e19a  ! 88: STQF_I	-	%f13, [0x019a, %r31]
mondo_2_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c011  ! 89: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_2_66:
	set user_data_start, %r31
	.word 0x8582ab08  ! 91: WRCCR_I	wr	%r10, 0x0b08, %ccr
jmptr_2_67:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
vahole_2_69:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda3fe0a0  ! 95: STD_I	std	%r13, [%r31 + 0x00a0]
pmu_2_70:
	nop
	setx 0xfffff5c4fffff0b1, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_71:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_2_72:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_2_73:
	.word 0x81982617  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0617, %hpstate
donret_2_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_74-donret_2_74-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003b03cb | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x179e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	retry
donretarg_2_74:
	.word 0xda6fe004  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x0004]
change_to_randtl_2_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_75:
	.word 0x8f902000  ! 101: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
unsupttte_2_76:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e88032  ! 102: PREFETCHA_R	prefetcha	[%r2, %r18] 0x01, #one_read
	.word 0x8d9033c4  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x13c4, %pstate
intveclr_2_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc25d5cdc401e5bfe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_2_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_79-donret_2_79-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0028ac84 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_79:
	.word 0xa3a509d2  ! 105: FDIVd	fdivd	%f20, %f18, %f48
	.word 0xe4d7e088  ! 106: LDSHA_I	ldsha	[%r31, + 0x0088] %asi, %r18
tagged_2_80:
	tsubcctv %r20, 0x1287, %r6
	.word 0xe407e0f4  ! 107: LDUW_I	lduw	[%r31 + 0x00f4], %r18
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
    brnz %r10, cwq_2_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_81
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
cwq_2_81:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 108: RDPC	rd	%pc, %r16
splash_lsu_2_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x64c4ce21, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 110: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_2_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_2_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 112: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xc1bfc3e0  ! 113: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fc2c0  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_2_86:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_87)+16, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_87)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_87:
	.word 0xa9846f2a  ! 116: WR_SET_SOFTINT_I	wr	%r17, 0x0f2a, %set_softint
brcommon3_2_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c00c  ! 1: STQF_R	-	%f8, [%r12, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd13fc014  ! 117: STDF_R	std	%f8, [%r20, %r31]
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d903a13  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x1a13, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_91)+32, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_91)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_91:
	.word 0xa981aefa  ! 120: WR_SET_SOFTINT_I	wr	%r6, 0x0efa, %set_softint
splash_cmpr_2_92:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 121: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x95a00162  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_2_95:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 124: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc1bfd920  ! 125: STDFA_R	stda	%f0, [%r0, %r31]
jmptr_2_96:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xe585bd987e17a571, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeacfffff25b, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_99-donret_2_99-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008d709e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_99:
	.word 0x93a209d4  ! 129: FDIVd	fdivd	%f8, %f20, %f40
pmu_2_100:
	nop
	setx 0xfffffc0dfffff9b9, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d94c012  ! 131: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
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
    brnz %r10, sma_2_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 132: CASA_R	casa	[%r31] %asi, %r19, %r12
	.word 0xc1bfd960  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_2_103:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_2_104:
	nop
	ta T_CHANGE_HPRIV
	set 0x4d035109, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xcf1531b4076dbd56, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_106:
	.word 0x8f902000  ! 137: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_2_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_107
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
cwq_2_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 138: RDPC	rd	%pc, %r16
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_108)+32, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_108)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_108:
	.word 0xa9842f8b  ! 139: WR_SET_SOFTINT_I	wr	%r16, 0x0f8b, %set_softint
br_badelay1_2_109:
	.word 0x24cfc001  ! 1: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xe9327413  ! 1: STQF_I	-	%f20, [0x1413, %r9]
	.word 0x9bb7c4cc  ! 1: FCMPNE32	fcmpne32	%d62, %d12, %r13
	normalw
	.word 0xa3458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_110:
	ta	T_CHANGE_NONHPRIV	! macro
vahole_2_111:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa5b24494  ! 142: FCMPLE32	fcmple32	%d40, %d20, %r18
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
    brnz %r10, cwq_2_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_112
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
cwq_2_112:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 143: RDPC	rd	%pc, %r17
	.word 0xd91fe1c8  ! 144: LDDF_I	ldd	[%r31, 0x01c8], %f12
	setx 0x0cb6df9e4288d1a5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa6d44011  ! 146: UMULcc_R	umulcc 	%r17, %r17, %r19
splash_cmpr_2_114:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 147: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_2_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d950006  ! 148: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
change_to_randtl_2_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_116:
	.word 0x8f902001  ! 149: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_2_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_117:
	.word 0x8f902002  ! 150: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_118) + 16, 16, 16)) -> intp(6,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_118)&0xffffffff)  + 16, 16, 16)) -> intp(6,0,5)
#else
	setx 0xb741edae9eba3d6a, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_119:
	set 0x60740000, %r31
	.word 0x8580b76e  ! 152: WRCCR_I	wr	%r2, 0x176e, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d9037f4  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x17f4, %pstate
mondo_2_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d90c00b  ! 155: WRPR_WSTATE_R	wrpr	%r3, %r11, %wstate
	.word 0x8d903ee2  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x1ee2, %pstate
	.word 0x83d02033  ! 157: Tcc_I	te	icc_or_xcc, %r0 + 51
	setx 0x1c5f289d112e95b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc3688012  ! 159: PREFETCH_R	prefetch	[%r2 + %r18], #one_read
fpinit_2_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 160: FDIVd	fdivd	%f0, %f4, %f6
splash_hpstate_2_125:
	ta T_CHANGE_NONHPRIV
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81983c1d  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c1d, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_2_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 163: CASA_R	casa	[%r31] %asi, %r9, %r16
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
    brnz %r10, sma_2_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 164: CASA_R	casa	[%r31] %asi, %r16, %r16
pmu_2_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff064fffff2d8, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 166: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_2_130:
    nop
    ta T_CHANGE_HPRIV
    mov 2, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa5410000  ! 167: RDTICK	rd	%tick, %r18
jmptr_2_131:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x996a8014  ! 169: SDIVX_R	sdivx	%r10, %r20, %r12
splash_cmpr_2_132:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 170: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_2_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_133
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
cwq_2_133:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 172: RDPC	rd	%pc, %r12
jmptr_2_134:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd060  ! 174: LDDA_R	ldda	[%r31, %r0] 0x83, %r16
	setx 0x12d46cfc7feb99d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_136:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 176: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e0e8  ! 177: LDSHA_I	ldsha	[%r31, + 0x00e8] %asi, %r16
splash_cmpr_2_137:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_2_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d914012  ! 179: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
change_to_randtl_2_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_139:
	.word 0x8f902001  ! 180: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
jmptr_2_140:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9190c013  ! 182: WRPR_PIL_R	wrpr	%r3, %r19, %pil
donret_2_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_142-donret_2_142-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0034a3a9 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x745, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_142:
	.word 0xa9a149d2  ! 183: FDIVd	fdivd	%f36, %f18, %f20
	.word 0xe6c7e110  ! 184: LDSWA_I	ldswa	[%r31, + 0x0110] %asi, %r19
	.word 0xe1bfdb60  ! 185: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe6cfe000  ! 186: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r19
splash_cmpr_2_143:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 187: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa480c014  ! 188: ADDcc_R	addcc 	%r3, %r20, %r18
ibp_2_144:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait2_144:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_144
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_144:
    brnz %r16, ibp_wait2_144
    ld [%r23], %r16
    ba ibp_startwait2_144
    mov 0x2, %r16
continue_ibp_2_144:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_144:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_144
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_144:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_144
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_144:
    best_set_reg(0x00000040f4d2b1c2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fe1a0  ! 189: LDDFA_I	ldda	[%r31, 0x01a0], %f16
ceter_2_145:
    nop
    ta T_CHANGE_HPRIV
    mov 4, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 190: RDTICK	rd	%tick, %r10
ceter_2_146:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 191: RDTICK	rd	%tick, %r10
	setx 0x7ff3efd293c7a0c6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_2_148:
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
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0xa5a0016d  ! 194: FABSq	dis not found

	.word 0xe6c7e180  ! 195: LDSWA_I	ldswa	[%r31, + 0x0180] %asi, %r19
splash_lsu_2_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x830d39bf, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe128  ! 198: LDX_I	ldx	[%r31 + 0x0128], %r19
splash_hpstate_2_152:
	ta T_CHANGE_NONHPRIV
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x819835c9  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15c9, %hpstate
	.word 0xa353c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0xd297c030  ! 1: LDUHA_R	lduha	[%r31, %r16] 0x01, %r9
	.word 0x9f8037bd  ! 201: SIR	sir	0x17bd
mondo_2_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 202: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
jmptr_2_154:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	bne  	 skip_2_155
	fbuge skip_2_155
.align 2048
skip_2_155:
	.word 0xa7b1c4c1  ! 204: FCMPNE32	fcmpne32	%d38, %d32, %r19
pmu_2_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc4bfffff508, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x7bbb66456e0e64c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e159  ! 207: STX_I	stx	%r19, [%r31 + 0x0159]
brcommon2_2_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd7124014  ! 1: LDQF_R	-	[%r9, %r20], %f11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe080  ! 208: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0x94f90010  ! 209: SDIVcc_R	sdivcc 	%r4, %r16, %r10
	.word 0xd897e1b8  ! 210: LDUHA_I	lduha	[%r31, + 0x01b8] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_2_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_159:
	.word 0x8f902000  ! 212: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_2_160:
	tsubcctv %r16, 0x14ca, %r12
	.word 0xd807e118  ! 213: LDUW_I	lduw	[%r31 + 0x0118], %r12
br_badelay1_2_161:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
	.word 0x24cfc001  ! 1: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	normalw
	.word 0x91458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r8
pmu_2_162:
	nop
	setx 0xfffff0c0fffff09d, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_2_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffef5fffff1c4, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 218: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc1bfdb60  ! 219: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfdf20  ! 220: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe1bfe1a0  ! 221: STDFA_I	stda	%f16, [0x01a0, %r31]
	setx 0x80db2ee821a3bb7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_2_166:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 223: RESTORE_R	restore	%r31, %r0, %r31
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
    brnz %r10, sma_2_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 224: CASA_R	casa	[%r31] %asi, %r10, %r16
jmptr_2_168:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5cd2e43c641b7fc3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d950002  ! 227: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
splash_cmpr_2_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 228: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_2_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2c9fffffe34, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xed9afae1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d934008  ! 231: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
memptr_2_175:
	set 0x60740000, %r31
	.word 0x85823c96  ! 232: WRCCR_I	wr	%r8, 0x1c96, %ccr
mondo_2_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 233: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_177)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_177)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_177:
	.word 0xa984f9da  ! 234: WR_SET_SOFTINT_I	wr	%r19, 0x19da, %set_softint
splash_lsu_2_178:
	nop
	ta T_CHANGE_HPRIV
	set 0xf11d83bb, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_179:
	nop
	setx 0xfffffd53fffffce0, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_180:
	nop
	ta T_CHANGE_HPRIV
	set 0x64ca957c, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 238: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e108  ! 239: LDSH_I	ldsh	[%r31 + 0x0108], %r16
donret_2_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_182-donret_2_182-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00501989 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ec7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_182:
	.word 0xe0ffe1f1  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x01f1] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc1bfe060  ! 242: STDFA_I	stda	%f0, [0x0060, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_184)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_184)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_184:
	.word 0xa985322c  ! 243: WR_SET_SOFTINT_I	wr	%r20, 0x122c, %set_softint
unsupttte_2_185:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a1c9a1  ! 244: FDIVs	fdivs	%f7, %f1, %f11
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_2_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_186
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
cwq_2_186:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 246: RDPC	rd	%pc, %r17
	setx 0x669359604719d9a4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_188:
	nop
	setx 0xfffffd9dfffff53d, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_189:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 249: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_2_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_190-donret_2_190-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ccec26 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17cd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_190:
	.word 0x95a049d1  ! 250: FDIVd	fdivd	%f32, %f48, %f10
memptr_2_191:
	set 0x60340000, %r31
	.word 0x8583315d  ! 251: WRCCR_I	wr	%r12, 0x115d, %ccr
	.word 0xe49fd160  ! 252: LDDA_R	ldda	[%r31, %r0] 0x8b, %r18
invtsb_2_192:
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
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_2_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_193
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
cwq_2_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 254: RDPC	rd	%pc, %r17
splash_lsu_2_194:
	nop
	ta T_CHANGE_HPRIV
	set 0xe39c5958, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa553c000  ! 256: RDPR_FQ	<illegal instruction>
vahole_2_195:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe8bfc030  ! 257: STDA_R	stda	%r20, [%r31 + %r16] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_196) + 0, 16, 16)) -> intp(2,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_196)&0xffffffff)  + 0, 16, 16)) -> intp(2,0,23)
#else
	setx 0xdb1e20794ef37996, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_2_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 259: CASA_R	casa	[%r31] %asi, %r12, %r20
	.word 0xe8c7e190  ! 260: LDSWA_I	ldswa	[%r31, + 0x0190] %asi, %r20
vahole_2_198:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa7b4c483  ! 261: FCMPLE32	fcmple32	%d50, %d34, %r19
	.word 0xd697e068  ! 262: LDUHA_I	lduha	[%r31, + 0x0068] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe010  ! 264: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
pmu_2_199:
	nop
	setx 0xfffff9c8fffffc7b, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
vahole_2_201:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9ba449cc  ! 267: FDIVd	fdivd	%f48, %f12, %f44
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d90238f  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x038f, %pstate
	.word 0xe097e1d8  ! 269: LDUHA_I	lduha	[%r31, + 0x01d8] %asi, %r16
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
    brnz %r10, sma_2_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 270: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0xe07fe1e0  ! 271: SWAP_I	swap	%r16, [%r31 + 0x01e0]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_2_204:
    set user_data_start, %o7
	.word 0x93902004  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
pmu_2_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1aefffff35c, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c002  ! 275: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
br_badelay3_2_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa1a00545  ! 1: FSQRTd	fsqrt	
	.word 0xa3a08822  ! 276: FADDs	fadds	%f2, %f2, %f17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_2_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d90c006  ! 279: WRPR_WSTATE_R	wrpr	%r3, %r6, %wstate
donret_2_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_211-donret_2_211-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006ba6dc | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x175d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_211:
	.word 0xd86fe108  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x0108]
donret_2_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_212-donret_2_212-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dacb13 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_212:
	.word 0xa9a4c9d2  ! 281: FDIVd	fdivd	%f50, %f18, %f20
brcommon1_2_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9f80295f  ! 282: SIR	sir	0x095f
	.word 0xe19fe1c0  ! 283: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0x8d903a43  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x1a43, %pstate
splash_cmpr_2_215:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 285: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_2_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 286: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	.word 0x8d9037a3  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x17a3, %pstate
splash_lsu_2_219:
	nop
	ta T_CHANGE_HPRIV
	set 0x47490cfc, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_2_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_220-donret_2_220-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0076dc42 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1775, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_2_220:
	.word 0xd66fe1b3  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x01b3]
	.word 0x91d02034  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 52
	setx 0xf2dc7f9fe0242683, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_2_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e120  ! 1: STQF_I	-	%f11, [0x0120, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd71fe190  ! 293: LDDF_I	ldd	[%r31, 0x0190], %f11
	.word 0xd6d7e0e8  ! 294: LDSHA_I	ldsha	[%r31, + 0x00e8] %asi, %r11
pmu_2_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff818fffffe8b, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3a00162  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_225)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_225)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_225:
	.word 0xa984a026  ! 297: WR_SET_SOFTINT_I	wr	%r18, 0x0026, %set_softint
memptr_2_226:
	set 0x60540000, %r31
	.word 0x8584b6a0  ! 298: WRCCR_I	wr	%r18, 0x16a0, %ccr
mondo_2_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d94800a  ! 299: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0xd297e060  ! 300: LDUHA_I	lduha	[%r31, + 0x0060] %asi, %r9
vahole_2_228:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87ac4a54  ! 301: FCMPd	fcmpd	%fcc<n>, %f48, %f20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_229)+40, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_229)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_229:
	.word 0xa984332e  ! 302: WR_SET_SOFTINT_I	wr	%r16, 0x132e, %set_softint
	.word 0x8d90372f  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x172f, %pstate
vahole_2_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc011  ! 304: STXFSR_R	st-sfr	%f1, [%r17, %r31]
trapasi_2_232:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8904980  ! 305: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_233)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_233)&0xffffffff) +56, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_233:
	.word 0xa984e373  ! 306: WR_SET_SOFTINT_I	wr	%r19, 0x0373, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_234) + 32, 16, 16)) -> intp(4,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_234)&0xffffffff)  + 32, 16, 16)) -> intp(4,0,25)
#else
	setx 0xfbcc493a00cf71d2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_2_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcc3fffff493, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_2_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_236
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
cwq_2_236:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 310: RDPC	rd	%pc, %r17
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
    brnz %r10, sma_2_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e009  ! 311: CASA_R	casa	[%r31] %asi, %r9, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_2_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e008  ! 313: CASA_R	casa	[%r31] %asi, %r8, %r8
	.word 0xd03fc008  ! 1: STD_R	std	%r8, [%r31 + %r8]
	.word 0x9f80339d  ! 314: SIR	sir	0x139d
	.word 0x93d02032  ! 315: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_2_240:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_2_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 317: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_2_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 319: CASA_R	casa	[%r31] %asi, %r12, %r8
br_longdelay1_2_243:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x9d97c000  ! 320: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
splash_cmpr_2_244:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 321: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_2_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcb5fffff1d6, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_246:
	nop
	setx 0xfffff104fffff7bc, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa3a00171  ! 326: FABSq	dis not found

mondo_2_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d944006  ! 327: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_250) + 56, 16, 16)) -> intp(5,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_250)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,21)
#else
	setx 0xac94d49751b23600, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_251-donret_2_251-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003996de | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x13a4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_2_251:
	.word 0xa1a4c9d1  ! 329: FDIVd	fdivd	%f50, %f48, %f16
	.word 0xd4c7e118  ! 330: LDSWA_I	ldswa	[%r31, + 0x0118] %asi, %r10
	.word 0xc1bfe1c0  ! 331: STDFA_I	stda	%f0, [0x01c0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_2_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8b4d5252	! Random illegal ?
	.word 0xa1a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a34825  ! 333: FADDs	fadds	%f13, %f5, %f9
splash_hpstate_2_253:
	.word 0x24cc8001  ! 1: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x81983e07  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e07, %hpstate
mondo_2_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d918013  ! 335: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
	.word 0xe33fc00a  ! 1: STDF_R	std	%f17, [%r10, %r31]
	.word 0x9f802070  ! 336: SIR	sir	0x0070
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e1fb  ! 338: STX_I	stx	%r17, [%r31 + 0x01fb]
pmu_2_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc0cfffffd5c, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe227e11c  ! 342: STW_I	stw	%r17, [%r31 + 0x011c]
	setx 0x4edc07a460b05e19, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_2_258:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_2_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_259-donret_2_259-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009a060f | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x556, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_259:
	.word 0x93a049d4  ! 345: FDIVd	fdivd	%f32, %f20, %f40
jmptr_2_260:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91a00169  ! 347: FABSq	dis not found

	.word 0x98c36d2a  ! 348: ADDCcc_I	addccc 	%r13, 0x0d2a, %r12
mondo_2_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 349: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d903ed9  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1ed9, %pstate
	.word 0xc19fe0e0  ! 351: LDDFA_I	ldda	[%r31, 0x00e0], %f0
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_266) + 0, 16, 16)) -> intp(5,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_266)&0xffffffff)  + 0, 16, 16)) -> intp(5,0,6)
#else
	setx 0x3417e8d1db359628, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_2_267:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe6dfc033  ! 355: LDXA_R	ldxa	[%r31, %r19] 0x01, %r19
	.word 0xc19fe0a0  ! 356: LDDFA_I	ldda	[%r31, 0x00a0], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_268)+32, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_268)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_268:
	.word 0xa98477d2  ! 357: WR_SET_SOFTINT_I	wr	%r17, 0x17d2, %set_softint
	setx 0x69c1ff7b1b3525ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_2_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_270
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
cwq_2_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 359: RDPC	rd	%pc, %r19
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_2_272:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0xbfe7c000  ! 361: SAVE_R	save	%r31, %r0, %r31
fpinit_2_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8376b  ! 362: PREFETCHA_I	prefetcha	[%r0, + 0xfffff76b] %asi, #one_read
jmptr_2_274:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_2_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0x895e0c796d001ff9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_2_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_277
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
cwq_2_277:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 366: RDPC	rd	%pc, %r9
brcommon3_2_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c010  ! 1: STQF_R	-	%f12, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd83fe130  ! 367: STD_I	std	%r12, [%r31 + 0x0130]
	.word 0xd827e08c  ! 368: STW_I	stw	%r12, [%r31 + 0x008c]
	.word 0xd8c7e1b0  ! 369: LDSWA_I	ldswa	[%r31, + 0x01b0] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_279)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_279)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_279:
	.word 0xa9847140  ! 370: WR_SET_SOFTINT_I	wr	%r17, 0x1140, %set_softint
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
    brnz %r10, cwq_2_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_280
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
cwq_2_280:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 371: RDPC	rd	%pc, %r19
	.word 0xd4cfe1e0  ! 372: LDSBA_I	ldsba	[%r31, + 0x01e0] %asi, %r10
splash_cmpr_2_281:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 373: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_2_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e011  ! 374: CASA_R	casa	[%r31] %asi, %r17, %r10
br_badelay2_2_283:
	.word 0xa5a509c9  ! 1: FDIVd	fdivd	%f20, %f40, %f18
	pdist %f8, %f0, %f2
	.word 0xa7b48312  ! 375: ALIGNADDRESS	alignaddr	%r18, %r18, %r19
	.word 0xe19fe0c0  ! 376: LDDFA_I	ldda	[%r31, 0x00c0], %f16
	.word 0xc30fc00b  ! 1: LDXFSR_R	ld-fsr	[%r31, %r11], %f1
	.word 0x9f80288a  ! 377: SIR	sir	0x088a
	.word 0xc1bfd960  ! 378: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa8d9c009  ! 379: SMULcc_R	smulcc 	%r7, %r9, %r20
	bgu,a	 skip_2_284
	brgez,pn  	%r1, skip_2_284
.align 2048
skip_2_284:
	.word 0xe83fc000  ! 380: STD_R	std	%r20, [%r31 + %r0]
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
    brnz %r10, cwq_2_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_285
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
cwq_2_285:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 381: RDPC	rd	%pc, %r9
brcommon3_2_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c014  ! 1: STQF_R	-	%f13, [%r20, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc013  ! 382: STXFSR_R	st-sfr	%f1, [%r19, %r31]
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
	.word 0xdadfc02d  ! 384: LDXA_R	ldxa	[%r31, %r13] 0x01, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_288) + 24, 16, 16)) -> intp(4,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_288)&0xffffffff)  + 24, 16, 16)) -> intp(4,0,27)
#else
	setx 0xebd0bd873d634b60, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_2_289:
	taddcctv %r6, 0x1099, %r10
	.word 0xda07e16c  ! 386: LDUW_I	lduw	[%r31 + 0x016c], %r13
ibp_2_290:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait2_290:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_2_290
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
ibp_wait2_290:
    brnz %r16, ibp_wait2_290
    ld [%r23], %r16
    ba ibp_startwait2_290
    mov 0x2, %r16
continue_ibp_2_290:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_290:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_290
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_2_290:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_2_290
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit2_290:
    best_set_reg(0x0000005092f1c287,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fc3e0  ! 387: LDDFA_R	ldda	[%r31, %r0], %f0
cwp_2_291:
    set user_data_start, %o7
	.word 0x93902003  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
pmu_2_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc35fffffb04, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_2_294:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa9410000  ! 391: RDTICK	rd	%tick, %r20
cwp_2_295:
    set user_data_start, %o7
	.word 0x93902003  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_2_296:
	nop
	ta T_CHANGE_HPRIV
	set 0x50631bab, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_2_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7c3ce77f8b555720, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_2_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe8a, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe297c02d  ! 397: LDUHA_R	lduha	[%r31, %r13] 0x01, %r17
mondo_2_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94800c  ! 398: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	.word 0xc19fde00  ! 399: LDDFA_R	ldda	[%r31, %r0], %f0
splash_decr_2_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa780c013  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r19, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_302) + 40, 16, 16)) -> intp(6,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_302)&0xffffffff)  + 40, 16, 16)) -> intp(6,0,3)
#else
	setx 0xae2e50a68efac38f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_2_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x93a00553  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe060  ! 402: STDFA_I	stda	%f16, [0x0060, %r31]
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
    brnz %r10, sma_2_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 403: CASA_R	casa	[%r31] %asi, %r19, %r9
pmu_2_305:
	nop
	setx 0xfffff800fffffba3, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_306:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_308) + 32, 16, 16)) -> intp(4,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_308)&0xffffffff)  + 32, 16, 16)) -> intp(4,0,5)
#else
	setx 0xcff40e605a2f1559, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_309:
	.word 0x819824d1  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d1, %hpstate
br_badelay2_2_310:
	.word 0x97a1c9d1  ! 1: FDIVd	fdivd	%f38, %f48, %f42
	pdist %f12, %f12, %f26
	.word 0x91b44312  ! 409: ALIGNADDRESS	alignaddr	%r17, %r18, %r8
splash_cmpr_2_311:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 410: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_2_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 411: CASA_R	casa	[%r31] %asi, %r19, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_313)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_313)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_313:
	.word 0xa98475a5  ! 412: WR_SET_SOFTINT_I	wr	%r17, 0x15a5, %set_softint
memptr_2_314:
	set 0x60140000, %r31
	.word 0x85846164  ! 413: WRCCR_I	wr	%r17, 0x0164, %ccr
	.word 0x91904002  ! 414: WRPR_PIL_R	wrpr	%r1, %r2, %pil
	.word 0xe49fe050  ! 1: LDDA_I	ldda	[%r31, + 0x0050] %asi, %r18
	.word 0x9f80387c  ! 415: SIR	sir	0x187c
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
    brnz %r10, cwq_2_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_316
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
cwq_2_316:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 416: RDPC	rd	%pc, %r19
intveclr_2_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0xfe758089cdc2bfc2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 418: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x55f10995c4035ddf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_2_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d944009  ! 421: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
splash_lsu_2_322:
	nop
	ta T_CHANGE_HPRIV
	set 0xdf24f5ef, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe054  ! 424: STD_I	std	%r13, [%r31 + 0x0054]
	.word 0x93d020b3  ! 425: Tcc_I	tne	icc_or_xcc, %r0 + 179
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	.word 0x8d9036cf  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x16cf, %pstate
br_badelay2_2_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b40308  ! 428: ALIGNADDRESS	alignaddr	%r16, %r8, %r17
vahole_2_325:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc00d  ! 429: STXFSR_R	st-sfr	%f1, [%r13, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_326) + 48, 16, 16)) -> intp(0,0,4)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_326)&0xffffffff)  + 48, 16, 16)) -> intp(0,0,4)
#else
	setx 0xa8554a1f7c49f765, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_327:
	ta T_CHANGE_NONHPRIV
	.word 0x819833cf  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x13cf, %hpstate
splash_htba_2_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x93b40552  ! 434: FCMPEQ16	fcmpeq16	%d16, %d18, %r9
donret_2_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_329-donret_2_329-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00608b11 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54a, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_329:
	.word 0xd8ffe1c8  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x01c8] %asi
	.word 0x99a04d26  ! 436: FsMULd	fsmuld	%f1, %f6, %f12
splash_tba_2_330:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_2_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_331-donret_2_331-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ac9fba | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe1f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	done
donretarg_2_331:
	.word 0xe26fe080  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x0080]
donret_2_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_332-donret_2_332-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003cc299 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x154d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_332:
	.word 0xa3a449d4  ! 441: FDIVd	fdivd	%f48, %f20, %f48
	setx 0x35ee5e93315e8cdf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe098  ! 443: LDUBA_I	lduba	[%r31, + 0x0098] %asi, %r20
	.word 0xe937e0cd  ! 444: STQF_I	-	%f20, [0x00cd, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0x97a4c9a3  ! 446: FDIVs	fdivs	%f19, %f3, %f11
brcommon2_2_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe7120012  ! 1: LDQF_R	-	[%r8, %r18], %f19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 447: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa24b0006  ! 448: MULX_R	mulx 	%r12, %r6, %r17
splash_lsu_2_337:
	nop
	ta T_CHANGE_HPRIV
	set 0x04d59e84, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948010  ! 450: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_2_340:
	ta T_CHANGE_NONHPRIV
	.word 0x2cc98001  ! 1: BRGZ	brgz,a,pt	%r6,<label_0x98001>
	.word 0x8198344d  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x144d, %hpstate
pmu_2_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc30fffff74b, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b5  ! 454: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa9a149b4  ! 455: FDIVs	fdivs	%f5, %f20, %f20
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_2_342:
    set user_data_start, %o7
	.word 0x93902001  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_2_343:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_344:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_345:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe71fe1a0  ! 461: LDDF_I	ldd	[%r31, 0x01a0], %f19
brcommon1_2_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa7702130  ! 1: POPC_I	popc	0x0130, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa9a089d4  ! 462: FDIVd	fdivd	%f2, %f20, %f20
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_2_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa9410000  ! 464: RDTICK	rd	%tick, %r20
splash_cmpr_2_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 465: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa6828011  ! 466: ADDcc_R	addcc 	%r10, %r17, %r19
	.word 0xd2800c20  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
memptr_2_351:
	set user_data_start, %r31
	.word 0x8584ef04  ! 468: WRCCR_I	wr	%r19, 0x0f04, %ccr
	.word 0xd27fe010  ! 469: SWAP_I	swap	%r9, [%r31 + 0x0010]
	.word 0x93a7c9aa  ! 1: FDIVs	fdivs	%f31, %f10, %f9
	.word 0x9f802820  ! 470: SIR	sir	0x0820
	.word 0x9195000c  ! 471: WRPR_PIL_R	wrpr	%r20, %r12, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_2_353:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9ba309d4  ! 474: FDIVd	fdivd	%f12, %f20, %f44
unsupttte_2_355:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93a109aa  ! 475: FDIVs	fdivs	%f4, %f10, %f9
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_356)+32, 16, 16)) -> intp(mask2tid(0x2),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_356)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x2),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_2_356:
	.word 0xa984ea69  ! 476: WR_SET_SOFTINT_I	wr	%r19, 0x0a69, %set_softint
trapasi_2_357:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c84980  ! 477: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r12
	.word 0xe19fe1c0  ! 478: LDDFA_I	ldda	[%r31, 0x01c0], %f16
donret_2_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_358-donret_2_358-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006612c2 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x64f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_358:
	.word 0xd8ffe0e4  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x00e4] %asi
invtsb_2_359:
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
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_2_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d908004  ! 481: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0xe19fdc00  ! 482: LDDFA_R	ldda	[%r31, %r0], %f16
br_badelay1_2_361:
	.word 0x2cc8c001  ! 1: BRGZ	brgz,a,pt	%r3,<label_0x8c001>
	.word 0xd937c00b  ! 1: STQF_R	-	%f12, [%r11, %r31]
	.word 0x24cfc001  ! 1: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	normalw
	.word 0x93458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xdbe7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r13
	.word 0x9f80336e  ! 484: SIR	sir	0x136e
	.word 0xdb27e03a  ! 485: STF_I	st	%f13, [0x003a, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_2_362:
	nop
	setx 0xfffff314fffff80e, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d90308d  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x108d, %pstate
	brnz,pt  	%r12, skip_2_364
	.word 0xc36ce6f6  ! 1: PREFETCH_I	prefetch	[%r19 + 0x06f6], #one_read
.align 32
skip_2_364:
	.word 0xda3fc000  ! 490: STD_R	std	%r13, [%r31 + %r0]
donret_2_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_365-donret_2_365-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002ac69b | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1441, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_365:
	.word 0xdaffe1ec  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x01ec] %asi
	.word 0xdb27e0d4  ! 492: STF_I	st	%f13, [0x00d4, %r31]
	.word 0xdaffc02c  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r12] 0x01
splash_cmpr_2_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 494: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9bb7c7c9  ! 1: PDIST	pdistn	%d62, %d40, %d44
	.word 0x9f802cd6  ! 496: SIR	sir	0x0cd6
pmu_2_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff21dfffffd28, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_2_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_368
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
cwq_2_368:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 498: RDPC	rd	%pc, %r12
change_to_randtl_2_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_2_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 501: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
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
br_longdelay1_1_0:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	fbug skip_1_1
	bge  	 skip_1_1
.align 1024
skip_1_1:
	.word 0xe63fc000  ! 2: STD_R	std	%r19, [%r31 + %r0]
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
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_2:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 3: CASA_R	casa	[%r31] %asi, %r12, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_3:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa784800b  ! 5: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r11, %-
	.word 0x87a88ac9  ! 6: FCMPEd	fcmped	%fcc<n>, %f2, %f40
vahole_1_5:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe7e7e010  ! 7: CASA_R	casa	[%r31] %asi, %r16, %r19
memptr_1_6:
	set user_data_start, %r31
	.word 0x85846bf5  ! 8: WRCCR_I	wr	%r17, 0x0bf5, %ccr
	.word 0x2e780001  ! 9: BPVS	<illegal instruction>
ceter_1_7:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x91410000  ! 10: RDTICK	rd	%tick, %r8
splash_lsu_1_8:
	nop
	ta T_CHANGE_HPRIV
	set 0x704fbe56, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon1_1_9:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1a0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ecc02a  ! 12: PREFETCHA_R	prefetcha	[%r19, %r10] 0x01, #one_read
	.word 0x22800001  ! 13: BE	be,a	<label_0x1>
pmu_1_10:
	nop
	setx 0xfffff444fffff7bc, %g1, %g7
	.word 0xa3800007  ! 14: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x32780001  ! 15: BPNE	<illegal instruction>
pmu_1_11:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff868fffffd5e, %g1, %g7
	.word 0xa3800007  ! 16: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_12:
	nop
	.word 0xe1bfe080  ! 17: STDFA_I	stda	%f16, [0x0080, %r31]
ibp_1_13:
	nop
	.word 0xe19fc3e0  ! 18: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd65fe170  ! 19: LDX_I	ldx	[%r31 + 0x0170], %r11
	.word 0xd727e1d1  ! 20: STF_I	st	%f11, [0x01d1, %r31]
	.word 0x81580000  ! 21: FLUSHW	flushw
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_14) + 24, 16, 16)) -> intp(2,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_14)&0xffffffff)  + 24, 16, 16)) -> intp(2,0,29)
#else
	setx 0x60e47d2edcae3e69, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_14:
	.word 0x39400001  ! 22: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_15:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_15-donret_1_15-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007235a6 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1615, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_15:
	.word 0xd6ffe071  ! 23: SWAPA_I	swapa	%r11, [%r31 + 0x0071] %asi
    set 0x101d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b447c9  ! 24: PDIST	pdistn	%d48, %d40, %d8
	.word 0xc1bfdf20  ! 25: STDFA_R	stda	%f0, [%r0, %r31]
pmu_1_16:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff321fffffa85, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_1_17:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd11fc013  ! 27: LDDF_R	ldd	[%r31, %r19], %f8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_18)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_18)&0xffffffff) +48, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_18:
	.word 0xa981eeb7  ! 28: WR_SET_SOFTINT_I	wr	%r7, 0x0eb7, %set_softint
	.word 0xa3a00165  ! 29: FABSq	dis not found

donret_1_20:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_20-donret_1_20-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008efdea | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2cc94001  ! 1: BRGZ	brgz,a,pt	%r5,<label_0x94001>
	retry
donretarg_1_20:
	.word 0xe2ffe04d  ! 30: SWAPA_I	swapa	%r17, [%r31 + 0x004d] %asi
	.word 0xa784400b  ! 31: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r11, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_22) + 0, 16, 16)) -> intp(2,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_22)&0xffffffff)  + 0, 16, 16)) -> intp(2,0,11)
#else
	setx 0xf587e78fdd6db3ce, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_22:
	.word 0x39400001  ! 32: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_23:
	set 0x60740000, %r31
	.word 0x8585380e  ! 33: WRCCR_I	wr	%r20, 0x180e, %ccr
unsupttte_1_24:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93b48481  ! 34: FCMPLE32	fcmple32	%d18, %d32, %r9
brcommon3_1_25:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd297c032  ! 35: LDUHA_R	lduha	[%r31, %r18] 0x01, %r9
jmptr_1_26:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 36: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_1_27:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 37: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_1_28:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 38: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_1_29:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 39: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
brcommon3_1_30:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe0c0  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x00c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd31fc010  ! 40: LDDF_R	ldd	[%r31, %r16], %f9
	.word 0xd2dfe1d8  ! 41: LDXA_I	ldxa	[%r31, + 0x01d8] %asi, %r9
	.word 0xd327e114  ! 42: STF_I	st	%f9, [0x0114, %r31]
	setx 0xa46e9520798cdc17, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_31:
	.word 0x39400001  ! 43: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_32:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d91c010  ! 44: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
ceter_1_33:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 45: RDTICK	rd	%tick, %r17
	.word 0x9194800c  ! 46: WRPR_PIL_R	wrpr	%r18, %r12, %pil
splash_tba_1_35:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 47: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_36:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d930010  ! 48: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0x9f802412  ! 49: SIR	sir	0x0412
br_longdelay2_1_37:
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0xa3a7c9d2  ! 50: FDIVd	fdivd	%f62, %f18, %f48
splash_cmpr_1_38:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 51: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_1_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_39:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e009  ! 52: CASA_R	casa	[%r31] %asi, %r9, %r17
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_40)+40, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_40)&0xffffffff) +40, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_40:
	.word 0xa9826764  ! 53: WR_SET_SOFTINT_I	wr	%r9, 0x0764, %set_softint
jmptr_1_41:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 54: JMPL_R	jmpl	%r27 + %r0, %r27
donret_1_42:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_42-donret_1_42-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0018dfd3 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb1f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_42:
	.word 0xe26fe0ef  ! 55: LDSTUB_I	ldstub	%r17, [%r31 + 0x00ef]
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
    brnz %r10, cwq_1_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_43
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
cwq_1_43:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 56: RDPC	rd	%pc, %r9
splash_hpstate_1_44:
	.word 0x8198308f  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x108f, %hpstate
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d90364f  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x164f, %pstate
mondo_1_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d928008  ! 59: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
mondo_1_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d94c010  ! 60: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
splash_hpstate_1_48:
	ta T_CHANGE_NONHPRIV
	.word 0x81982c97  ! 61: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c97, %hpstate
	.word 0xd31fe000  ! 62: LDDF_I	ldd	[%r31, 0x0000], %f9
vahole_1_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fe1a0  ! 63: LDDFA_I	ldda	[%r31, 0x01a0], %f0
brcommon1_1_50:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd3e7c02a  ! 1: CASA_I	casa	[%r31] 0x 1, %r10, %r9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x93b2c7c3  ! 64: PDIST	pdistn	%d42, %d34, %d40
splash_hpstate_1_51:
	ta T_CHANGE_NONHPRIV
	.word 0x81983ccf  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ccf, %hpstate
	.word 0x8d902601  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0601, %pstate
	.word 0xe19fe0e0  ! 67: LDDFA_I	ldda	[%r31, 0x00e0], %f16
br_badelay1_1_54:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0xd337e0a0  ! 1: STQF_I	-	%f9, [0x00a0, %r31]
	.word 0x93b7c4d4  ! 1: FCMPNE32	fcmpne32	%d62, %d20, %r9
	normalw
	.word 0x99458000  ! 68: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd82fe12d  ! 69: STB_I	stb	%r12, [%r31 + 0x012d]
donret_1_55:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_55-donret_1_55-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e25a56 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a0f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_55:
	.word 0xa7a309d0  ! 70: FDIVd	fdivd	%f12, %f16, %f50
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
    brnz %r10, sma_1_56
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_56:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 71: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0xe19fe160  ! 72: LDDFA_I	ldda	[%r31, 0x0160], %f16
mondo_1_57:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d948010  ! 73: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 74: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe727c000  ! 75: STF_R	st	%f19, [%r0, %r31]
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
    brnz %r10, sma_1_58
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_58:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00b  ! 76: CASA_R	casa	[%r31] %asi, %r11, %r19
	.word 0x2a800001  ! 77: BCS	bcs,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe65fc000  ! 78: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x9753c000  ! 79: RDPR_FQ	<illegal instruction>
donret_1_59:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_59-donret_1_59-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e18962 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ac5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_59:
	.word 0x9ba4c9d1  ! 80: FDIVd	fdivd	%f50, %f48, %f44
	.word 0xda8fe1a8  ! 81: LDUBA_I	lduba	[%r31, + 0x01a8] %asi, %r13
	.word 0xc19fc3e0  ! 82: LDDFA_R	ldda	[%r31, %r0], %f0
change_to_randtl_1_60:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_60:
	.word 0x8f902000  ! 83: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_1_61:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 84: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_1_62:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 85: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c009  ! 86: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_64)+8, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_64)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_64:
	.word 0xa984398e  ! 87: WR_SET_SOFTINT_I	wr	%r16, 0x198e, %set_softint
	.word 0xdb37e05e  ! 88: STQF_I	-	%f13, [0x005e, %r31]
mondo_1_65:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d94800d  ! 89: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
	.word 0xda0fc000  ! 90: LDUB_R	ldub	[%r31 + %r0], %r13
memptr_1_66:
	set user_data_start, %r31
	.word 0x858473d3  ! 91: WRCCR_I	wr	%r17, 0x13d3, %ccr
jmptr_1_67:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 92: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_68:
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 94: Tcc_R	tne	icc_or_xcc, %r0 + %r30
vahole_1_69:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xda9fe080  ! 95: LDDA_I	ldda	[%r31, + 0x0080] %asi, %r13
pmu_1_70:
	nop
	setx 0xffffff6dfffff499, %g1, %g7
	.word 0xa3800007  ! 96: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_71:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 97: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_1_72:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 98: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_hpstate_1_73:
	.word 0x81982281  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0281, %hpstate
donret_1_74:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_74-donret_1_74-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c064fa | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x16ff, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_74:
	.word 0xda6fe102  ! 100: LDSTUB_I	ldstub	%r13, [%r31 + 0x0102]
change_to_randtl_1_75:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_75:
	.word 0x8f902000  ! 101: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
unsupttte_1_76:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a349d4  ! 102: FDIVd	fdivd	%f44, %f20, %f20
	.word 0x8d903303  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x1303, %pstate
intveclr_1_78:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdf6a1ab2dd0c5a28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 104: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_1_79:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_79-donret_1_79-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0058c963 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_79:
	.word 0xa5a149cb  ! 105: FDIVd	fdivd	%f36, %f42, %f18
	.word 0xe4d7e1b0  ! 106: LDSHA_I	ldsha	[%r31, + 0x01b0] %asi, %r18
tagged_1_80:
	tsubcctv %r17, 0x19c0, %r0
	.word 0xe407e04d  ! 107: LDUW_I	lduw	[%r31 + 0x004d], %r18
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
    brnz %r10, cwq_1_81
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_81
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
cwq_1_81:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 108: RDPC	rd	%pc, %r8
splash_lsu_1_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x967d0d43, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 109: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_83:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 110: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_htba_1_84:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 111: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_1_85:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 112: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0xe1bfda00  ! 113: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fda00  ! 114: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_1_86:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_87)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_87)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_87:
	.word 0xa982fa58  ! 116: WR_SET_SOFTINT_I	wr	%r11, 0x1a58, %set_softint
brcommon3_1_88:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd137c009  ! 1: STQF_R	-	%f8, [%r9, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd13fc011  ! 117: STDF_R	std	%f8, [%r17, %r31]
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d902d69  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x0d69, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_90:
	ta	T_CHANGE_NONPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_91)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_91)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_91:
	.word 0xa985307c  ! 120: WR_SET_SOFTINT_I	wr	%r20, 0x107c, %set_softint
splash_cmpr_1_92:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 121: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1a00163  ! 122: FABSq	dis not found

	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 123: MEMBAR	membar	#LoadLoad | #Lookaside 
splash_cmpr_1_95:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 124: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe1bfc2c0  ! 125: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_1_96:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x5d0d483e1ef98448, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_97:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_98:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7aefffffec6, %g1, %g7
	.word 0xa3800007  ! 128: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_99:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_99-donret_1_99-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009fbe11 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x21f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_99:
	.word 0x99a0c9ca  ! 129: FDIVd	fdivd	%f34, %f10, %f12
pmu_1_100:
	nop
	setx 0xfffff5d9ffffff90, %g1, %g7
	.word 0xa3800007  ! 130: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_101:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 131: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
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
    brnz %r10, sma_1_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_102:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 132: CASA_R	casa	[%r31] %asi, %r9, %r12
	.word 0xc1bfda00  ! 133: STDFA_R	stda	%f0, [%r0, %r31]
splash_tba_1_103:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 134: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_lsu_1_104:
	nop
	ta T_CHANGE_HPRIV
	set 0x5046f3b4, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xc06a3bcbc8082181, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_105:
	.word 0x39400001  ! 136: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_106:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_106:
	.word 0x8f902000  ! 137: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_1_107
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_107
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
cwq_1_107:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 138: RDPC	rd	%pc, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_108)+8, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_108)&0xffffffff) +8, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_108:
	.word 0xa984fc32  ! 139: WR_SET_SOFTINT_I	wr	%r19, 0x1c32, %set_softint
br_badelay1_1_109:
	.word 0xe43fc009  ! 1: STD_R	std	%r18, [%r31 + %r9]
	.word 0xdb33318e  ! 1: STQF_I	-	%f13, [0x118e, %r12]
	.word 0x24cfc001  ! 1: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	normalw
	.word 0x95458000  ! 140: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_110:
	ta	T_CHANGE_NONHPRIV	! macro
vahole_1_111:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3ec4031  ! 142: PREFETCHA_R	prefetcha	[%r17, %r17] 0x01, #one_read
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
    brnz %r10, cwq_1_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_112
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
cwq_1_112:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 143: RDPC	rd	%pc, %r12
	.word 0xd91fe070  ! 144: LDDF_I	ldd	[%r31, 0x0070], %f12
	setx 0x4e0a47a3cc4f300c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_113:
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa0d2400c  ! 146: UMULcc_R	umulcc 	%r9, %r12, %r16
splash_cmpr_1_114:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 147: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_1_115:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d924014  ! 148: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
change_to_randtl_1_116:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_116:
	.word 0x8f902001  ! 149: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_1_117:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_117:
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_118) + 56, 16, 16)) -> intp(3,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_118)&0xffffffff)  + 56, 16, 16)) -> intp(3,0,25)
#else
	setx 0x9dcec6453ee2f102, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_118:
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_119:
	set 0x60740000, %r31
	.word 0x8582e7a2  ! 152: WRCCR_I	wr	%r11, 0x07a2, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 153: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x8d902209  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0209, %pstate
mondo_1_121:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948014  ! 155: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x8d9023bb  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x03bb, %pstate
	.word 0x91d020b4  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 180
	setx 0x0083e556e94f4b80, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_123:
	.word 0x39400001  ! 158: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36a4013  ! 159: PREFETCH_R	prefetch	[%r9 + %r19], #one_read
fpinit_1_124:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 160: FCMPLE32	fcmple32	%d0, %d4, %r4
splash_hpstate_1_125:
	ta T_CHANGE_NONHPRIV
	.word 0x2ac9c001  ! 1: BRNZ	brnz,a,pt	%r7,<label_0x9c001>
	.word 0x81983d45  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d45, %hpstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xe05fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r16
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
    brnz %r10, sma_1_126
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_126:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r16
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
    brnz %r10, sma_1_127
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_127:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 164: CASA_R	casa	[%r31] %asi, %r16, %r16
pmu_1_128:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff21bfffff873, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_129:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 166: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ceter_1_130:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa1410000  ! 167: RDTICK	rd	%tick, %r16
jmptr_1_131:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 168: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91684008  ! 169: SDIVX_R	sdivx	%r1, %r8, %r8
splash_cmpr_1_132:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 170: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 171: LDD_R	ldd	[%r31 + %r0], %r8
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
    brnz %r10, cwq_1_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_133
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
cwq_1_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 172: RDPC	rd	%pc, %r16
jmptr_1_134:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 173: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe09fd100  ! 174: LDDA_R	ldda	[%r31, %r0] 0x88, %r16
	setx 0xa5b8e1695cd3b7b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_135:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_136:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 176: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe0d7e008  ! 177: LDSHA_I	ldsha	[%r31, + 0x0008] %asi, %r16
splash_cmpr_1_137:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 178: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_1_138:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 179: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
change_to_randtl_1_139:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_139:
	.word 0x8f902001  ! 180: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
jmptr_1_140:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 181: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91928013  ! 182: WRPR_PIL_R	wrpr	%r10, %r19, %pil
donret_1_142:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_142-donret_1_142-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d4bc88 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1645, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_142:
	.word 0xa7a449ca  ! 183: FDIVd	fdivd	%f48, %f10, %f50
	.word 0xe6c7e040  ! 184: LDSWA_I	ldswa	[%r31, + 0x0040] %asi, %r19
	.word 0xc1bfdf20  ! 185: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe6cfe0a0  ! 186: LDSBA_I	ldsba	[%r31, + 0x00a0] %asi, %r19
splash_cmpr_1_143:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 187: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9a830002  ! 188: ADDcc_R	addcc 	%r12, %r2, %r13
ibp_1_144:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 189: LDDFA_R	ldda	[%r31, %r0], %f0
ceter_1_145:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x93410000  ! 190: RDTICK	rd	%tick, %r9
ceter_1_146:
    nop
    ta T_CHANGE_HPRIV
    mov 3, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0xa3410000  ! 191: RDTICK	rd	%tick, %r17
	setx 0x20c153e68220c828, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_147:
	.word 0x39400001  ! 192: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 193: FBL	fbl,a	<label_0x1>
	.word 0xa7a0016c  ! 194: FABSq	dis not found

	.word 0xe6c7e1b0  ! 195: LDSWA_I	ldswa	[%r31, + 0x01b0] %asi, %r19
splash_lsu_1_150:
	nop
	ta T_CHANGE_HPRIV
	set 0x561664af, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_151:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe65fe150  ! 198: LDX_I	ldx	[%r31 + 0x0150], %r19
splash_hpstate_1_152:
	ta T_CHANGE_NONHPRIV
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81983cc4  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1cc4, %hpstate
	.word 0x9353c000  ! 200: RDPR_FQ	<illegal instruction>
	.word 0x9f80320f  ! 201: SIR	sir	0x120f
mondo_1_153:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d944005  ! 202: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
jmptr_1_154:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 203: JMPL_R	jmpl	%r27 + %r0, %r27
	fbe,a,pn	%fcc0,  skip_1_155
	fbuge skip_1_155
.align 2048
skip_1_155:
	.word 0x24c94001  ! 204: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
pmu_1_156:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff58cfffffc73, %g1, %g7
	.word 0xa3800007  ! 205: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xac9c457ddf49215d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_157:
	.word 0x39400001  ! 206: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe677e188  ! 207: STX_I	stx	%r19, [%r31 + 0x0188]
brcommon2_1_158:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa7a7c96c  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe1a0  ! 208: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	.word 0x98fc8014  ! 209: SDIVcc_R	sdivcc 	%r18, %r20, %r12
	.word 0xd897e1b0  ! 210: LDUHA_I	lduha	[%r31, + 0x01b0] %asi, %r12
	.word 0x3c800001  ! 211: BPOS	bpos,a	<label_0x1>
change_to_randtl_1_159:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_159:
	.word 0x8f902002  ! 212: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_1_160:
	tsubcctv %r19, 0x1d99, %r16
	.word 0xd807e16e  ! 213: LDUW_I	lduw	[%r31 + 0x016e], %r12
br_badelay1_1_161:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0xd937c008  ! 1: STQF_R	-	%f12, [%r8, %r31]
	.word 0xd9e7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r12
	normalw
	.word 0xa1458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r16
pmu_1_162:
	nop
	setx 0xfffff383fffff408, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 216: WRTICK_R	wr	%r0, %r17, %tick
pmu_1_164:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff696fffff652, %g1, %g7
	.word 0xa3800007  ! 217: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc1bfc3e0  ! 219: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfd920  ! 220: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfe1c0  ! 221: STDFA_I	stda	%f0, [0x01c0, %r31]
	setx 0x176a420241c68c80, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_165:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
br_longdelay1_1_166:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 223: RESTORE_R	restore	%r31, %r0, %r31
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
    brnz %r10, sma_1_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 224: CASA_R	casa	[%r31] %asi, %r18, %r16
jmptr_1_168:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 225: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xad8877e244a404a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_169:
	.word 0x39400001  ! 226: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 227: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
splash_cmpr_1_171:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 228: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_1_172:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbd7fffff64a, %g1, %g7
	.word 0xa3800007  ! 229: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_173:
	nop
	ta T_CHANGE_HPRIV
	set 0xfbc7aea3, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_174:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d950012  ! 231: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
memptr_1_175:
	set 0x60740000, %r31
	.word 0x8584b713  ! 232: WRCCR_I	wr	%r18, 0x1713, %ccr
mondo_1_176:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 233: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_177)+32, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_177)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_177:
	.word 0xa9852a47  ! 234: WR_SET_SOFTINT_I	wr	%r20, 0x0a47, %set_softint
splash_lsu_1_178:
	nop
	ta T_CHANGE_HPRIV
	set 0xc0d9a69d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_179:
	nop
	setx 0xfffff802fffffb2c, %g1, %g7
	.word 0xa3800007  ! 236: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_180:
	nop
	ta T_CHANGE_HPRIV
	set 0x257eae75, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_181:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 238: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xe057e128  ! 239: LDSH_I	ldsh	[%r31 + 0x0128], %r16
donret_1_182:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_182-donret_1_182-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004a70bf | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x89d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_182:
	.word 0xe0ffe157  ! 240: SWAPA_I	swapa	%r16, [%r31 + 0x0157] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_183:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe1bfe160  ! 242: STDFA_I	stda	%f16, [0x0160, %r31]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_184)+24, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_184)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_184:
	.word 0xa9846617  ! 243: WR_SET_SOFTINT_I	wr	%r17, 0x0617, %set_softint
unsupttte_1_185:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ac0a52  ! 244: FCMPd	fcmpd	%fcc<n>, %f16, %f18
	.word 0x2a800001  ! 245: BCS	bcs,a	<label_0x1>
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
    brnz %r10, cwq_1_186
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_186
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
cwq_1_186:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 246: RDPC	rd	%pc, %r8
	setx 0xbab8ed0b4a8c01ae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_187:
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_188:
	nop
	setx 0xfffffd9afffff5f3, %g1, %g7
	.word 0xa3800007  ! 248: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_189:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 249: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
donret_1_190:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_190-donret_1_190-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e9ce63 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf4d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_190:
	.word 0xa5a449c8  ! 250: FDIVd	fdivd	%f48, %f8, %f18
memptr_1_191:
	set 0x60740000, %r31
	.word 0x858431c7  ! 251: WRCCR_I	wr	%r16, 0x11c7, %ccr
	.word 0xe49fdf00  ! 252: LDDA_R	ldda	[%r31, %r0] 0xf8, %r18
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
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
    brnz %r10, cwq_1_193
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_193
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
cwq_1_193:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 254: RDPC	rd	%pc, %r16
splash_lsu_1_194:
	nop
	ta T_CHANGE_HPRIV
	set 0x43322f4f, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa953c000  ! 256: RDPR_FQ	<illegal instruction>
vahole_1_195:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe897c02b  ! 257: LDUHA_R	lduha	[%r31, %r11] 0x01, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_196) + 32, 16, 16)) -> intp(2,0,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_196)&0xffffffff)  + 32, 16, 16)) -> intp(2,0,1)
#else
	setx 0xf91ae3841bdb43c2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_196:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, sma_1_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 259: CASA_R	casa	[%r31] %asi, %r17, %r20
	.word 0xe8c7e0e8  ! 260: LDSWA_I	ldswa	[%r31, + 0x00e8] %asi, %r20
vahole_1_198:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x97a409a3  ! 261: FDIVs	fdivs	%f16, %f3, %f11
	.word 0xd697e0d8  ! 262: LDUHA_I	lduha	[%r31, + 0x00d8] %asi, %r11
	.word 0xd73fc000  ! 263: STDF_R	std	%f11, [%r0, %r31]
	.word 0xd68fe070  ! 264: LDUBA_I	lduba	[%r31, + 0x0070] %asi, %r11
pmu_1_199:
	nop
	setx 0xfffffc52fffff33d, %g1, %g7
	.word 0xa3800007  ! 265: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x89800011  ! 266: WRTICK_R	wr	%r0, %r17, %tick
vahole_1_201:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa1b247ca  ! 267: PDIST	pdistn	%d40, %d10, %d16
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d903132  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x1132, %pstate
	.word 0xe097e1e0  ! 269: LDUHA_I	lduha	[%r31, + 0x01e0] %asi, %r16
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
    brnz %r10, sma_1_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_203:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 270: CASA_R	casa	[%r31] %asi, %r9, %r16
	.word 0xe07fe0d0  ! 271: SWAP_I	swap	%r16, [%r31 + 0x00d0]
	.word 0x28780001  ! 272: BPLEU	<illegal instruction>
cwp_1_204:
    set user_data_start, %o7
	.word 0x93902007  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
pmu_1_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff737fffff090, %g1, %g7
	.word 0xa3800007  ! 274: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d92c012  ! 275: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
br_badelay3_1_207:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa1a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x99a24831  ! 276: FADDs	fadds	%f9, %f17, %f12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_208:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89800011  ! 278: WRTICK_R	wr	%r0, %r17, %tick
mondo_1_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d924014  ! 279: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
donret_1_211:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_211-donret_1_211-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b38eb5 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa45, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_211:
	.word 0xd86fe061  ! 280: LDSTUB_I	ldstub	%r12, [%r31 + 0x0061]
donret_1_212:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_212-donret_1_212-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00460bb6 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xac7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_212:
	.word 0xa9a4c9c7  ! 281: FDIVd	fdivd	%f50, %f38, %f20
brcommon1_1_213:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe9e7c02b  ! 1: CASA_I	casa	[%r31] 0x 1, %r11, %r20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x97b4c491  ! 282: FCMPLE32	fcmple32	%d50, %d48, %r11
	.word 0xc19fe160  ! 283: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0x8d903153  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x1153, %pstate
splash_cmpr_1_215:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 285: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_1_216:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 286: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_217:
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	.word 0x8d9031ea  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x11ea, %pstate
splash_lsu_1_219:
	nop
	ta T_CHANGE_HPRIV
	set 0x617875bb, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
donret_1_220:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_220-donret_1_220-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004ea376 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_220:
	.word 0xd66fe07c  ! 290: LDSTUB_I	ldstub	%r11, [%r31 + 0x007c]
	.word 0x91d02034  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 52
	setx 0xf3a359b9fb2eaa01, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_221:
	.word 0x39400001  ! 292: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon3_1_222:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd737e020  ! 1: STQF_I	-	%f11, [0x0020, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd69fc028  ! 293: LDDA_R	ldda	[%r31, %r8] 0x01, %r11
	.word 0xd6d7e1c0  ! 294: LDSHA_I	ldsha	[%r31, + 0x01c0] %asi, %r11
pmu_1_223:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd94fffff505, %g1, %g7
	.word 0xa3800007  ! 295: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a00172  ! 296: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_225)+32, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_225)&0xffffffff) +32, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_225:
	.word 0xa98463c3  ! 297: WR_SET_SOFTINT_I	wr	%r17, 0x03c3, %set_softint
memptr_1_226:
	set 0x60740000, %r31
	.word 0x8582fdfa  ! 298: WRCCR_I	wr	%r11, 0x1dfa, %ccr
mondo_1_227:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c001  ! 299: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	.word 0xd297e000  ! 300: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
vahole_1_228:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa9a049ac  ! 301: FDIVs	fdivs	%f1, %f12, %f20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_229)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_229)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_229:
	.word 0xa9827d5d  ! 302: WR_SET_SOFTINT_I	wr	%r9, 0x1d5d, %set_softint
	.word 0x8d9024db  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
vahole_1_231:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe93fc008  ! 304: STDF_R	std	%f20, [%r8, %r31]
trapasi_1_232:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xe8d04980  ! 305: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r20
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_233)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_233)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_233:
	.word 0xa981bf4d  ! 306: WR_SET_SOFTINT_I	wr	%r6, 0x1f4d, %set_softint
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_234) + 24, 16, 16)) -> intp(5,0,30)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_234)&0xffffffff)  + 24, 16, 16)) -> intp(5,0,30)
#else
	setx 0xc65b7623d10006a3, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_234:
	.word 0x39400001  ! 307: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fc000  ! 308: STD_R	std	%r20, [%r31 + %r0]
pmu_1_235:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff361fffff44b, %g1, %g7
	.word 0xa3800007  ! 309: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_1_236
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_236
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
cwq_1_236:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 310: RDPC	rd	%pc, %r8
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
    brnz %r10, sma_1_237
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_237:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 311: CASA_R	casa	[%r31] %asi, %r12, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_238:
	ta	T_CHANGE_NONPRIV	! macro
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
    brnz %r10, sma_1_239
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_239:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 313: CASA_R	casa	[%r31] %asi, %r13, %r8
	.word 0x9f802b4e  ! 314: SIR	sir	0x0b4e
	.word 0x91d02033  ! 315: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_1_240:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 316: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_1_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d940007  ! 317: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd05fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r8
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
    brnz %r10, sma_1_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e011  ! 319: CASA_R	casa	[%r31] %asi, %r17, %r8
br_longdelay1_1_243:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xbfefc000  ! 320: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_1_244:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 321: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
pmu_1_245:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff15ffffffb3, %g1, %g7
	.word 0xa3800007  ! 322: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_246:
	nop
	setx 0xfffff688fffff0e0, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd127c000  ! 324: STF_R	st	%f8, [%r0, %r31]
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa3a00166  ! 326: FABSq	dis not found

mondo_1_249:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d944008  ! 327: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_250) + 0, 16, 16)) -> intp(6,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_250)&0xffffffff)  + 0, 16, 16)) -> intp(6,0,18)
#else
	setx 0xea2bde9d63c1da5d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_250:
	.word 0x39400001  ! 328: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_251:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_251-donret_1_251-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c615d1 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x44e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2ccd0001  ! 1: BRGZ	brgz,a,pt	%r20,<label_0xd0001>
	done
donretarg_1_251:
	.word 0x95a4c9d0  ! 329: FDIVd	fdivd	%f50, %f16, %f10
	.word 0xd4c7e180  ! 330: LDSWA_I	ldswa	[%r31, + 0x0180] %asi, %r10
	.word 0xe1bfe0e0  ! 331: STDFA_I	stda	%f16, [0x00e0, %r31]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xd45fc000  ! 332: LDX_R	ldx	[%r31 + %r0], %r10
br_badelay3_1_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbf4fc694	! Random illegal ?
	.word 0xa7a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa3a40825  ! 333: FADDs	fadds	%f16, %f5, %f17
splash_hpstate_1_253:
	.word 0x26ca0001  ! 1: BRLZ	brlz,a,pt	%r8,<label_0xa0001>
	.word 0x819835ce  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15ce, %hpstate
mondo_1_254:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d950012  ! 335: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x9f8025e2  ! 336: SIR	sir	0x05e2
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_255:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe277e060  ! 338: STX_I	stx	%r17, [%r31 + 0x0060]
pmu_1_256:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff84bfffffbed, %g1, %g7
	.word 0xa3800007  ! 339: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe327c000  ! 340: STF_R	st	%f17, [%r0, %r31]
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe227e054  ! 342: STW_I	stw	%r17, [%r31 + 0x0054]
	setx 0xd29918d10733b789, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_257:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_1_258:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 344: JMPL_R	jmpl	%r27 + %r0, %r27
donret_1_259:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_259-donret_1_259-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009b9b19 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10de, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_259:
	.word 0xa9a349c8  ! 345: FDIVd	fdivd	%f44, %f8, %f20
jmptr_1_260:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 346: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa9a00173  ! 347: FABSq	dis not found

	.word 0xa6c331fe  ! 348: ADDCcc_I	addccc 	%r12, 0xfffff1fe, %r19
mondo_1_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d944006  ! 349: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026a4  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x06a4, %pstate
	.word 0xe19fe000  ! 351: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0x89800011  ! 352: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_265:
	ta	T_CHANGE_NONHPRIV	! macro
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_266) + 32, 16, 16)) -> intp(2,0,23)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_266)&0xffffffff)  + 32, 16, 16)) -> intp(2,0,23)
#else
	setx 0xa083ece4724f3ca6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_266:
	.word 0x39400001  ! 354: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_1_267:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe6bfc033  ! 355: STDA_R	stda	%r19, [%r31 + %r19] 0x01
	.word 0xc19fe000  ! 356: LDDFA_I	ldda	[%r31, 0x0000], %f0
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_268)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_268)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_268:
	.word 0xa984f76b  ! 357: WR_SET_SOFTINT_I	wr	%r19, 0x176b, %set_softint
	setx 0x87b753679a5a70b4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_269:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_1_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_270
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
cwq_1_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 359: RDPC	rd	%pc, %r16
	.word 0x89800011  ! 360: WRTICK_R	wr	%r0, %r17, %tick
br_longdelay1_1_272:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x9d97c000  ! 361: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
fpinit_1_273:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 362: FCMPd	fcmpd	%fcc<n>, %f0, %f4
jmptr_1_274:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 363: JMPL_R	jmpl	%r27 + %r0, %r27
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 364: MEMBAR	membar	#LoadLoad | #Lookaside 
intveclr_1_276:
	nop
	ta T_CHANGE_HPRIV
	setx 0xabdc1c7386e955c7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 365: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_1_277
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_277
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
cwq_1_277:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 366: RDPC	rd	%pc, %r12
brcommon3_1_278:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd937c008  ! 1: STQF_R	-	%f12, [%r8, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd89fc030  ! 367: LDDA_R	ldda	[%r31, %r16] 0x01, %r12
	.word 0xd827e0a2  ! 368: STW_I	stw	%r12, [%r31 + 0x00a2]
	.word 0xd8c7e018  ! 369: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_279)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_279)&0xffffffff) +16, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_279:
	.word 0xa984a405  ! 370: WR_SET_SOFTINT_I	wr	%r18, 0x0405, %set_softint
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
    brnz %r10, cwq_1_280
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_280
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
cwq_1_280:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 371: RDPC	rd	%pc, %r10
	.word 0xd4cfe010  ! 372: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
splash_cmpr_1_281:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 373: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_1_282
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_282:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 374: CASA_R	casa	[%r31] %asi, %r8, %r10
br_badelay2_1_283:
	.word 0x91a509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f8
	pdist %f10, %f6, %f16
	.word 0x95b2430c  ! 375: ALIGNADDRESS	alignaddr	%r9, %r12, %r10
	.word 0xe19fe0a0  ! 376: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0x9f802ebe  ! 377: SIR	sir	0x0ebe
	.word 0xc1bfde00  ! 378: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa8dc4001  ! 379: SMULcc_R	smulcc 	%r17, %r1, %r20
	bvc  	 skip_1_284
	bne,a	 skip_1_284
.align 2048
skip_1_284:
	.word 0xc36fe125  ! 380: PREFETCH_I	prefetch	[%r31 + 0x0125], #one_read
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
    brnz %r10, cwq_1_285
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_285
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
cwq_1_285:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 381: RDPC	rd	%pc, %r13
brcommon3_1_286:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c008  ! 1: STQF_R	-	%f13, [%r8, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fc012  ! 382: LDDF_R	ldd	[%r31, %r18], %f13
	.word 0x28800001  ! 383: BLEU	bleu,a	<label_0x1>
	.word 0xda9fc033  ! 384: LDDA_R	ldda	[%r31, %r19] 0x01, %r13
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_288) + 56, 16, 16)) -> intp(5,0,2)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_288)&0xffffffff)  + 56, 16, 16)) -> intp(5,0,2)
#else
	setx 0xc9d21836ad429260, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_288:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_1_289:
	taddcctv %r11, 0x1d42, %r16
	.word 0xda07e046  ! 386: LDUW_I	lduw	[%r31 + 0x0046], %r13
ibp_1_290:
	nop
	.word 0xc19fe0c0  ! 387: LDDFA_I	ldda	[%r31, 0x00c0], %f0
cwp_1_291:
    set user_data_start, %o7
	.word 0x93902004  ! 388: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
pmu_1_292:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff38bfffffede, %g1, %g7
	.word 0xa3800007  ! 389: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_293:
	ta	T_CHANGE_NONPRIV	! macro
ceter_1_294:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa3410000  ! 391: RDTICK	rd	%tick, %r17
cwp_1_295:
    set user_data_start, %o7
	.word 0x93902005  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_1_296:
	nop
	ta T_CHANGE_HPRIV
	set 0xc68943a9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
intveclr_1_297:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5464fecb70502773, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 395: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_298:
	ta	T_CHANGE_NONPRIV	! macro
dvapa_1_299:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaab, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 397: CASA_R	casa	[%r31] %asi, %r17, %r17
mondo_1_300:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c009  ! 398: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xc19fdb60  ! 399: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa7804014  ! 400: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r20, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_302) + 56, 16, 16)) -> intp(4,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_302)&0xffffffff)  + 56, 16, 16)) -> intp(4,0,27)
#else
	setx 0xec0d105134513e4c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_302:
	.word 0x39400001  ! 401: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_1_303:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f8020d0  ! 1: SIR	sir	0x00d0
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fe180  ! 402: LDDFA_I	ldda	[%r31, 0x0180], %f16
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
    brnz %r10, sma_1_304
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_304:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 403: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_1_305:
	nop
	setx 0xfffff53ffffff7f4, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_306:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 405: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 406: WRTICK_R	wr	%r0, %r17, %tick
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_308) + 0, 16, 16)) -> intp(3,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_308)&0xffffffff)  + 0, 16, 16)) -> intp(3,0,5)
#else
	setx 0x7c0387ea7b81cd21, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_308:
	.word 0x39400001  ! 407: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_309:
	.word 0x81982589  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0589, %hpstate
br_badelay2_1_310:
	.word 0xa1a4c9cc  ! 1: FDIVd	fdivd	%f50, %f12, %f16
	pdist %f12, %f18, %f22
	.word 0xa5b2c313  ! 409: ALIGNADDRESS	alignaddr	%r11, %r19, %r18
splash_cmpr_1_311:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 410: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_1_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_312:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 411: CASA_R	casa	[%r31] %asi, %r9, %r18
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_313)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_313)&0xffffffff) +0, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_313:
	.word 0xa984af00  ! 412: WR_SET_SOFTINT_I	wr	%r18, 0x0f00, %set_softint
memptr_1_314:
	set 0x60740000, %r31
	.word 0x8584220d  ! 413: WRCCR_I	wr	%r16, 0x020d, %ccr
	.word 0x91948001  ! 414: WRPR_PIL_R	wrpr	%r18, %r1, %pil
	.word 0x9f803b5f  ! 415: SIR	sir	0x1b5f
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
    brnz %r10, cwq_1_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_316
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
cwq_1_316:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 416: RDPC	rd	%pc, %r13
intveclr_1_317:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4a125e980806c4a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 417: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_318:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 418: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x722a6ccdb9ac8722, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_319:
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_320:
	ta	T_CHANGE_NONHPRIV	! macro
mondo_1_321:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d950007  ! 421: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
splash_lsu_1_322:
	nop
	ta T_CHANGE_HPRIV
	set 0x3f745404, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 422: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a780001  ! 423: BPCC	<illegal instruction>
	.word 0xda3fe1c8  ! 424: STD_I	std	%r13, [%r31 + 0x01c8]
	.word 0x83d02033  ! 425: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2ecb0001  ! 1: BRGEZ	brgez,a,pt	%r12,<label_0xb0001>
	.word 0x8d903a5d  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x1a5d, %pstate
br_badelay2_1_324:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b14312  ! 428: ALIGNADDRESS	alignaddr	%r5, %r18, %r11
vahole_1_325:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd697c02d  ! 429: LDUHA_R	lduha	[%r31, %r13] 0x01, %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_326) + 16, 16, 16)) -> intp(5,0,31)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_326)&0xffffffff)  + 16, 16, 16)) -> intp(5,0,31)
#else
	setx 0xf9d5bfdf12c5e2be, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_326:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_327:
	ta T_CHANGE_NONHPRIV
	.word 0x81983448  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1448, %hpstate
splash_htba_1_328:
	nop
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 432: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xd607c000  ! 433: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x99b1c541  ! 434: FCMPEQ16	fcmpeq16	%d38, %d32, %r12
donret_1_329:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_329-donret_1_329-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a2abb3 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 23, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_329:
	.word 0xd8ffe198  ! 435: SWAPA_I	swapa	%r12, [%r31 + 0x0198] %asi
	.word 0xa3a40d33  ! 436: FsMULd	fsmuld	%f16, %f50, %f48
splash_tba_1_330:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 437: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe25fc000  ! 438: LDX_R	ldx	[%r31 + %r0], %r17
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xe25fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r17
donret_1_331:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_331-donret_1_331-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000daa9b | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe13, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_1_331:
	.word 0xe26fe106  ! 440: LDSTUB_I	ldstub	%r17, [%r31 + 0x0106]
donret_1_332:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_332-donret_1_332-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0004d9a6 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d98, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_332:
	.word 0xa9a409d3  ! 441: FDIVd	fdivd	%f16, %f50, %f20
	setx 0xc179f0b7662e98bf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_333:
	.word 0x39400001  ! 442: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe060  ! 443: LDUBA_I	lduba	[%r31, + 0x0060] %asi, %r20
	.word 0xe937e040  ! 444: STQF_I	-	%f20, [0x0040, %r31]
	ta T_CHANGE_NONHPRIV
	.word 0x8143e011  ! 445: MEMBAR	membar	#LoadLoad | #Lookaside 
	.word 0xa9b0c487  ! 446: FCMPLE32	fcmple32	%d34, %d38, %r20
brcommon2_1_336:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa9b7c70d  ! 1: FMULD8SUx16	fmuld8ulx16	%f31, %f13, %d20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 447: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa6484003  ! 448: MULX_R	mulx 	%r1, %r3, %r19
splash_lsu_1_337:
	nop
	ta T_CHANGE_HPRIV
	set 0x4993264d, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 449: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 450: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0x89800011  ! 451: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_1_340:
	ta T_CHANGE_NONHPRIV
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x81983907  ! 452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1907, %hpstate
pmu_1_341:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff41cffffff2d, %g1, %g7
	.word 0xa3800007  ! 453: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02035  ! 454: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa7a509b1  ! 455: FDIVs	fdivs	%f20, %f17, %f19
	.word 0xe73fc000  ! 456: STDF_R	std	%f19, [%r0, %r31]
cwp_1_342:
    set user_data_start, %o7
	.word 0x93902006  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
jmptr_1_343:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 458: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_344:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 459: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_345:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 460: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe71fc014  ! 461: LDDF_R	ldd	[%r31, %r20], %f19
brcommon1_1_347:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa7702080  ! 1: POPC_I	popc	0x0080, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x97b187d3  ! 462: PDIST	pdistn	%d6, %d50, %d42
	.word 0x89800011  ! 463: WRTICK_R	wr	%r0, %r17, %tick
ceter_1_349:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	ta T_CHANGE_NONHPRIV
	.word 0x95410000  ! 464: RDTICK	rd	%tick, %r10
splash_cmpr_1_350:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 465: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x92818011  ! 466: ADDcc_R	addcc 	%r6, %r17, %r9
	.word 0xd2800b20  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r9
memptr_1_351:
	set user_data_start, %r31
	.word 0x85827a2a  ! 468: WRCCR_I	wr	%r9, 0x1a2a, %ccr
	.word 0xd27fe190  ! 469: SWAP_I	swap	%r9, [%r31 + 0x0190]
	.word 0x9f803bcb  ! 470: SIR	sir	0x1bcb
	.word 0x91920001  ! 471: WRPR_PIL_R	wrpr	%r8, %r1, %pil
	.word 0x28780001  ! 472: BPLEU	<illegal instruction>
jmptr_1_353:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 473: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x95b18484  ! 474: FCMPLE32	fcmple32	%d6, %d4, %r10
unsupttte_1_355:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a189b1  ! 475: FDIVs	fdivs	%f6, %f17, %f12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_356)+24, 16, 16)) -> intp(mask2tid(0x1),1,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_356)&0xffffffff) +24, 16, 16)) -> intp(mask2tid(0x1),1,3)
#else
!! TODO:Generate XIR via RESET_GEN register
!	setx 0x8900000808, %r16, %r17
!	mov 0x2, %r16
!	stw %r16, [%r17]
#endif
xir_1_356:
	.word 0xa982b2e7  ! 476: WR_SET_SOFTINT_I	wr	%r10, 0x12e7, %set_softint
trapasi_1_357:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xd8c04980  ! 477: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r12
	.word 0xc19fe120  ! 478: LDDFA_I	ldda	[%r31, 0x0120], %f0
donret_1_358:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_358-donret_1_358-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00358aad | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c10, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_358:
	.word 0xd8ffe1fc  ! 479: SWAPA_I	swapa	%r12, [%r31 + 0x01fc] %asi
	.word 0x29800001  ! 480: FBL	fbl,a	<label_0x1>
mondo_1_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d944012  ! 481: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0xe19fdb60  ! 482: LDDFA_R	ldda	[%r31, %r0], %f16
br_badelay1_1_361:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0xd937c012  ! 1: STQF_R	-	%f12, [%r18, %r31]
	.word 0xd83fc008  ! 1: STD_R	std	%r12, [%r31 + %r8]
	normalw
	.word 0x9b458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9f802073  ! 484: SIR	sir	0x0073
	.word 0xdb27e158  ! 485: STF_I	st	%f13, [0x0158, %r31]
	.word 0xda0fc000  ! 486: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x26800001  ! 487: BL	bl,a	<label_0x1>
pmu_1_362:
	nop
	setx 0xfffff2f9fffff050, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8d903a33  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x1a33, %pstate
	bvs,a	 skip_1_364
	.word 0xa1a289d2  ! 1: FDIVd	fdivd	%f10, %f18, %f16
.align 32
skip_1_364:
	.word 0xc36fe0b5  ! 490: PREFETCH_I	prefetch	[%r31 + 0x00b5], #one_read
donret_1_365:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_365-donret_1_365-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0070313e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1757, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_365:
	.word 0xdaffe09c  ! 491: SWAPA_I	swapa	%r13, [%r31 + 0x009c] %asi
	.word 0xdb27e0dc  ! 492: STF_I	st	%f13, [0x00dc, %r31]
	.word 0xdaffc030  ! 493: SWAPA_R	swapa	%r13, [%r31 + %r16] 0x01
splash_cmpr_1_366:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 494: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xda5fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9f8038fd  ! 496: SIR	sir	0x18fd
pmu_1_367:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff91dfffffc4e, %g1, %g7
	.word 0xa3800007  ! 497: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_1_368
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_368
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
cwq_1_368:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 498: RDPC	rd	%pc, %r19
change_to_randtl_1_369:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_369:
	.word 0x8f902000  ! 499: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe737c000  ! 500: STQF_R	-	%f19, [%r0, %r31]
mondo_1_370:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d91c00d  ! 501: WRPR_WSTATE_R	wrpr	%r7, %r13, %wstate
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

	.xword	0x010a401ac1b8ecde
	.xword	0xe01a0ce85f82688f
	.xword	0x6a9cb07cdc08ed37
	.xword	0x4992bdd39afeed80
	.xword	0x0b9ca2437e84c78a
	.xword	0x07f49a4343976769
	.xword	0x8c8025e4fda128ce
	.xword	0xba12e5552d930d7e
	.xword	0x8886e11660450c78
	.xword	0x5ef62827cd098cff
	.xword	0xbad5dfd695753419
	.xword	0x1267dd6e45feac20
	.xword	0x718af2561954053e
	.xword	0xc9c49d75a805d192
	.xword	0x1da6001183e7db6e
	.xword	0xc2421dc7282e8cc7
	.xword	0x1c3d1d6fe17de071
	.xword	0xaa933dd5109d36c2
	.xword	0x8af30780df9da078
	.xword	0x1db299012c318f35
	.xword	0x8515f4c467af40e7
	.xword	0x7e761451ee6fe19c
	.xword	0x3768966b370b0265
	.xword	0x5885d5d2d722107b
	.xword	0x76c8bea19300715b
	.xword	0x90f2ad45ff2eaeb1
	.xword	0xb18d818a08ca9964
	.xword	0xa53a63538db0253f
	.xword	0xf051e1ceb181d4ae
	.xword	0x8a844946d11177ff
	.xword	0xf6dc7d512768f76e
	.xword	0xc870d71285292157
	.xword	0xc68f51bb00eb0fd9
	.xword	0x865d80fadb7958c3
	.xword	0x5e7145b3468bfd71
	.xword	0x55aca4a6e1968779
	.xword	0x30b3895d6b0c0400
	.xword	0x0e0c67cc3b7225e4
	.xword	0xfd8a2a5c13b42238
	.xword	0x71b455dce8ce2826
	.xword	0xf7bef0ad07ea3101
	.xword	0xc2a87e556acc0de8
	.xword	0x136a1374baa26184
	.xword	0x70e92cab03f71d9e
	.xword	0xdc48a3bca6a1ae47
	.xword	0xa40e65d64eba3e42
	.xword	0x6608017804c53efe
	.xword	0x8dac03fd5ea5d314
	.xword	0xf590423d7c04faaa
	.xword	0x9bf0879006e681a6
	.xword	0xc3a586affd3b1204
	.xword	0xc29a5e2bf922dad6
	.xword	0x3c49a1c13e3c84a3
	.xword	0xfe050d063ec45538
	.xword	0x6d19d02d6024f4e4
	.xword	0xcea6eb9bae3991d4
	.xword	0xbb70d1a3c4bd7d4e
	.xword	0x8bafb1f419813c11
	.xword	0x7443a38e69fd7e7a
	.xword	0xd75434d907e0e060
	.xword	0xfcae1e1072cb3a51
	.xword	0x9cf53fa882486517
	.xword	0xc731047f032becbe
	.xword	0x255d33aed4d070b3
	.xword	0x845889b015faf9b7
	.xword	0x73ec7df1819f379a
	.xword	0x18687ab28aa5d147
	.xword	0xd8cfce09467ff322
	.xword	0xf47ca7549f10f052
	.xword	0x3eca05ed4751e946
	.xword	0x6813e8351cac71e0
	.xword	0x545b61cda5d0f71d
	.xword	0x65f59976b2430995
	.xword	0x240a4dbba8a73d7d
	.xword	0xe33ecb0d8c069fe5
	.xword	0xcd15a9f025d5c5d5
	.xword	0x7a99b05c700e06f3
	.xword	0x565971d8a5df42a4
	.xword	0x7c5a378d5002e75f
	.xword	0xaad4cb9ee6867b00
	.xword	0x7c4e2d63f610f5b4
	.xword	0xd080c582a1b4a339
	.xword	0x942bfda9afffd301
	.xword	0x998bc3290356bf7e
	.xword	0x33d363d9dcf93d2b
	.xword	0x3cea5cd1216ee478
	.xword	0x13c4237c580cd6e2
	.xword	0xdc8d1c254764d1b0
	.xword	0x4df409af2cd3a237
	.xword	0xf29abba23e461892
	.xword	0xec87bc3a2aa4655c
	.xword	0x37a9bfc8b18faec3
	.xword	0x0c6ea6ca4f4fbd6c
	.xword	0x3d047e4c1504da09
	.xword	0x3f9e9b3cc45a1258
	.xword	0x5584729527041540
	.xword	0xe8aab7a90324e75c
	.xword	0xf57a1db1b1862619
	.xword	0xa6099e6cd5aa2e79
	.xword	0x9fc6072975ed4ca0
	.xword	0x58fafd5c6298efab
	.xword	0x05a5a461b8339520
	.xword	0x4833451a7eefb897
	.xword	0x54eec075d18e32b3
	.xword	0x6dd1f5388c7bc38b
	.xword	0xfcc045210e46b971
	.xword	0xd7fb39d02c4f6e7c
	.xword	0x31f8293bb7db35b6
	.xword	0x7d85345158656e08
	.xword	0xff82ff388110c958
	.xword	0xf8405a122ed0f3a5
	.xword	0xea5dfe54a2e1cd97
	.xword	0xa6ded29d66f81c3c
	.xword	0x9f8c3942300cffa7
	.xword	0x9edcd87f71bf3dce
	.xword	0x62ee388f950348a1
	.xword	0xa573477f2e3e801a
	.xword	0x93c63938c5c59480
	.xword	0x9328a47e46be4ab8
	.xword	0xf0dd2a212615d872
	.xword	0x2296e566d0889bee
	.xword	0xdc993a6338470fd8
	.xword	0xa1fbd4eabd821f23
	.xword	0x7cf9858799167464
	.xword	0x2beafb34773eddcd
	.xword	0xb42ad5a4fe169ad8
	.xword	0xcd3fb5ea917fd0d9
	.xword	0xdd75f0e4374738bf
	.xword	0x590b9a605059e547
	.xword	0xd9beb747c426d114
	.xword	0xe361283150b4192d
	.xword	0x417ead5e8fca012c
	.xword	0xa91e1d3524932e44
	.xword	0xe964d94e0053a440
	.xword	0xfa7ae30ce6b8791b
	.xword	0x6ac74e97f1ee5238
	.xword	0xa095e4c52f22ab20
	.xword	0x84f224acaac8b18d
	.xword	0xe1af6f963683e1d2
	.xword	0xbd62f295c631e45b
	.xword	0x62b218e8ecba18d5
	.xword	0x654493db4479bcdd
	.xword	0xd19e3d23e5689a7f
	.xword	0xbaab3c1d2df40be8
	.xword	0x3817cc28307ecfcb
	.xword	0x6778d794d1e77d67
	.xword	0xce5e7167eff6c141
	.xword	0xdcf94bf4db783ea3
	.xword	0x1695da63c1c38280
	.xword	0x7efa3e317593e901
	.xword	0xfc0a0ecc5fd5339e
	.xword	0x3fcd2b3c7d554330
	.xword	0x3699dc9ee46d47ce
	.xword	0x68520a899e18b82b
	.xword	0xe82c909488c912c8
	.xword	0x0a15dc2ebd7c57e5
	.xword	0x0167c5b5915f24c4
	.xword	0xfe4c2ace91544bfa
	.xword	0x8ff175c8101c0758
	.xword	0xc0f41b069d246315
	.xword	0x0934d527a48a1d5f
	.xword	0xf64624621333597f
	.xword	0x44859854004e8e19
	.xword	0xcbe22bd4db09d612
	.xword	0x98bf91b5643438c8
	.xword	0xbd93e4c24ac16c56
	.xword	0x44600d495bc50a35
	.xword	0xa707e87a283f49b3
	.xword	0x34b7c1ea30de6627
	.xword	0xa22b014bc682cad1
	.xword	0x12db714c55851c12
	.xword	0x081f2d24e6d63437
	.xword	0xb881c8033e878075
	.xword	0x09325bd2a99bc686
	.xword	0x45e9e2eca9551390
	.xword	0x3bf4501e5d58f1be
	.xword	0x05060a273016ee10
	.xword	0x2424117e55cfb3ce
	.xword	0xe68e71422dc31f45
	.xword	0x6d38efa76e22410a
	.xword	0xe12810feca31778b
	.xword	0x15c34c5065616f8b
	.xword	0x34074c2f0f4ea3a0
	.xword	0xfa6b7fb5e393f3f2
	.xword	0x9c4dac5c600d69d1
	.xword	0x49db1f89bc886794
	.xword	0x0c831444481af0e4
	.xword	0x3f55d88f743e9efb
	.xword	0xd1b95dbf6a34c793
	.xword	0x88eb74b292e48b79
	.xword	0x9efcb517545d9432
	.xword	0x849ef50a7a3e8600
	.xword	0x844c00b038e7e41c
	.xword	0xc9009731e8e382df
	.xword	0x0adbe8f310facf40
	.xword	0x46f79815d4313316
	.xword	0x61cdd31fae80baf3
	.xword	0xc1c8851e43d61286
	.xword	0xac4965cb0073a4dc
	.xword	0x9abb608b6eaf0e82
	.xword	0xecd4043b8a7dc9b1
	.xword	0x1985b4c639a1a64d
	.xword	0x72bd2e12696994ce
	.xword	0x89b6137d470a46dc
	.xword	0x82156a12426a7361
	.xword	0xb5e41ae06e0d980a
	.xword	0xd29afd648c4a6562
	.xword	0x594fbd57f85a60bb
	.xword	0x79771c34fc16070b
	.xword	0x5f51f5f7c556faf6
	.xword	0x1d9b07895f935932
	.xword	0xa5e19a2d7e2edea8
	.xword	0x8502c57d23bf7145
	.xword	0x5f3d837fd55781f6
	.xword	0xc2b5ebc5957a8f4b
	.xword	0xd734679756a38256
	.xword	0x048090af28bc305e
	.xword	0xe46dd30fcc33a295
	.xword	0xea44955fc259825e
	.xword	0x0263fe2ba45e8d10
	.xword	0x0284ba00f1a49c50
	.xword	0x572430978dcbf29b
	.xword	0x52d256039e943434
	.xword	0xeb69958876b4bc07
	.xword	0x360e5ae4d9c3173d
	.xword	0xaefc5fe88762f9d7
	.xword	0x86568bf13b7101bd
	.xword	0x54e67249acf0490d
	.xword	0x9cb66137cac133e5
	.xword	0xd75bb3f1a60f828a
	.xword	0x1c302cac9eb869c6
	.xword	0x2e092d213ca07117
	.xword	0xfda351f62fc42d73
	.xword	0x862f5a19ca692c94
	.xword	0x6f9e009317067bc4
	.xword	0xaf3f8d330d9136d3
	.xword	0x7e01e61ad570de7e
	.xword	0x1ac7b61f385a84a5
	.xword	0x746a1403f365809d
	.xword	0xe61fa950b291217b
	.xword	0x49a3ec9cca82b557
	.xword	0x11e53d98d21feb78
	.xword	0x03c12bd49751d87d
	.xword	0x4bc49e8a53be2750
	.xword	0xe3ad9813749ccda1
	.xword	0xa7b58b00db629fdb
	.xword	0xcb7a3d8761aaf0be
	.xword	0x852c0083fd2185a3
	.xword	0x82017ea0bb8fb013
	.xword	0xe6a9aa2700034107
	.xword	0x7c009d1a7c5d2079
	.xword	0x1ee6c269678a2a9c
	.xword	0xdc074f23ff0608bb
	.xword	0x0221c9c33dff7849
	.xword	0x48c2c822f7cba2aa
	.xword	0xc16d85c7070872aa

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
# 10 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 86 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 961 "diag.j"

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
	TTE_CV	 = 1,
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
	TTE_CV	 = 0,
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
	TTE_Size	 = 1,
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
	.xword	0x1e63788adcefa661
	.xword	0x34d068861ae48239
	.xword	0xc18468fc7a78bd93
	.xword	0x5bd389e46ce06542
	.xword	0x94686674c5937a89
	.xword	0xdd3239f4cfa82021
	.xword	0x2fa2198fc232f6fe
	.xword	0x82c2acf32e447c83
	.xword	0x3ff5bb204f707a95
	.xword	0xe169367644aaf730
	.xword	0xfc4fca1ebd9bea51
	.xword	0x74b7ad7d6a996f8b
	.xword	0xb4e7d24ec472838a
	.xword	0xfbb4ea2005b49d1e
	.xword	0x9fffd6017ffc4fd9
	.xword	0x2992361a09e12c3b
	.xword	0xdb2706e5a0aab5f2
	.xword	0x79d8bbd3f1437a0e
	.xword	0xa7478ce0eeda9ff1
	.xword	0x235fddf488ba51ba
	.xword	0x23d298cdf783a516
	.xword	0xd3db69d588a8428a
	.xword	0x1ada27b4a14cd4d0
	.xword	0x862d643f1ef506cb
	.xword	0x58a71f5fd4d997a9
	.xword	0x234f2259c71c78ad
	.xword	0xf8e8a9cab7d794a6
	.xword	0x0addea84803dd59d
	.xword	0x771ed93c1671e1a0
	.xword	0xd535440d985d7973
	.xword	0xe9dd84d4b40ee5bc
	.xword	0xfecabf5966323cb8



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
	TTE_CV	 = 1,
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
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0x6d4854208a792ed8
	.xword	0x2138b2e680ecb2ec
	.xword	0xd16e98392e96f03e
	.xword	0x05749cee4cf1dadf
	.xword	0xf1abc7b8b47bf6d8
	.xword	0xc84500f35cfdf2f5
	.xword	0xd402af0fe36bdf79
	.xword	0x13c7bd8944909eac
	.xword	0x64462ece0af8b532
	.xword	0xcddd540b541fab8d
	.xword	0x17bb22cfc292c26d
	.xword	0xc6bd66f47394734e
	.xword	0x5936ff40bb391b11
	.xword	0x40444fc01f316936
	.xword	0xaa4f1b49563fb4e5
	.xword	0xc275e70b9eaf0d94
	.xword	0x7547d63020035c64
	.xword	0xc5740bd7a3781368
	.xword	0x418b6751e95e9ccd
	.xword	0xf0feadc0439b2396
	.xword	0x1029cefcb0acee7f
	.xword	0xd63f0eb7b6146e5c
	.xword	0xb3885c4ae4c49165
	.xword	0xa9af82832704fdf8
	.xword	0x2198baa1fbb6d62f
	.xword	0xd6f259241c632aaa
	.xword	0xa0d51871de981c80
	.xword	0x6e8d9ab15f464237
	.xword	0xa28063935bad7304
	.xword	0x797a04a8f488e969
	.xword	0xadc55c544ea564a8
	.xword	0x1bd580b0a4318e42



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
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
	.xword	0xa55938ca91aca3f3
	.xword	0x2a88abee5a41b05d
	.xword	0xb20fd415def59bdd
	.xword	0x07288f58d55373ce
	.xword	0x805827c7ab5849aa
	.xword	0x9ccd23b4445412b8
	.xword	0x48bf22eb9a6150d6
	.xword	0xeef0612956b0b063
	.xword	0xb55aad0b71801a4c
	.xword	0xe7b338447028fac2
	.xword	0xf75bd6bed4639182
	.xword	0xaee68e03744e2ff7
	.xword	0xb1eef80ff49a66d3
	.xword	0x9f2634c56ea83d95
	.xword	0x8db3d9ab6440da2d
	.xword	0xa5dce371361c0f7c
	.xword	0x41cbefd9aa64e9a2
	.xword	0xc0ca2a6097aae39d
	.xword	0xf17154a8452f7da5
	.xword	0x26a1f7a8f6c72e87
	.xword	0x8518a874244862b0
	.xword	0xbe6f88ca81f663d6
	.xword	0xf8391f5eecfa36a5
	.xword	0x418e8fc0c0ae8c42
	.xword	0x51fe69f1712e7d6d
	.xword	0x985f508c8098427a
	.xword	0x9cf6714bba6a0f4f
	.xword	0xd2cb77ff1de7a5aa
	.xword	0xf0d83483cf0a5e94
	.xword	0x848cbb96e2e81c11
	.xword	0xb2c7311fe8ec90d7
	.xword	0x7d7a2f5825361fbd



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
	.xword	0x21adbd97c51d2b95
	.xword	0x2d63b75f3a59c038
	.xword	0x0b603a59e09ab365
	.xword	0x5600d59825fcb6fd
	.xword	0x76a1e2f2c551dba1
	.xword	0x8a78e3f353c1997d
	.xword	0x33d89d46edcb1934
	.xword	0xc0dce043d97af13b
	.xword	0x6082f2ee3633c527
	.xword	0x0812e6360706b1cd
	.xword	0xa5ff36a573d196ba
	.xword	0x6d9627e5e48d8182
	.xword	0x2b240faf36cb5e50
	.xword	0x415060ae72d16253
	.xword	0x3413326ff35a63a1
	.xword	0xc83016d3d3af2223
	.xword	0x4200a45cca66c7ea
	.xword	0x45cc74de9e569648
	.xword	0x964b23a2291672a9
	.xword	0xee541c6b4cdcbd9b
	.xword	0x4bcd509df9eaa208
	.xword	0xff237e9e49d2bec9
	.xword	0xbd0de5201b070604
	.xword	0x7f3259fed2ebe84f
	.xword	0x1959dd2258c6f7bc
	.xword	0x2f3741cfb863a1d3
	.xword	0xba961a49c2684b0d
	.xword	0x9c193a8c143c9dd8
	.xword	0xc14c26d7b75dd03e
	.xword	0xcb9cedfce57c0bff
	.xword	0x018782958edfa663
	.xword	0x4905df69106e9628





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
	TTE_CV	 = 1,
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
	TTE_P	 = 1,
	TTE_W	 = 1
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f6
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
	TTE_CV	 = 0,
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
	TTE_P	 = 0,
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
	TTE_Size	 = 0,
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
    !setx wdog_red_ext, %g1, %g2
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
    setx red_other_ext, %g1, %g2
    jmp %g2
    nop





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


