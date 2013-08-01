/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_85.s
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
# 464 "diag.j"
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
# 478 "diag.j"
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
# 545 "diag.j"
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
	mov 0x31, %r14
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
	mov 0x30, %r14
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
	mov 0xb4, %r14
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
	mov 0xb0, %r14
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
	mov 0xb3, %r14
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
	mov 0x33, %r14
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
	.word 0x9f803c1b  ! 1: SIR	sir	0x1c1b
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
	.word 0xe8800b20  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r20
	.word 0xa7a00173  ! 2: FABSq	dis not found

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
    bne,a wait_for_stat_80_1
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_1:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_1
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_1:
    best_set_reg(0x00000040f1c000f1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9f803c1b  ! 3: SIR	sir	0x1c1b
donret_80_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_2-donret_80_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009a3da2 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	retry
donretarg_80_2:
	.word 0xe26fe191  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x0191]
	setx 0x09d85aeb9971b5b9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d908005  ! 6: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
pmu_80_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffeedfffffc6f, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa6fcb402  ! 8: SDIVcc_I	sdivcc 	%r18, 0xfffff402, %r19
splash_cmpr_80_6:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_80_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_7
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
cwq_80_7:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 10: RDPC	rd	%pc, %r12
pmu_80_8:
	nop
	setx 0xffffff1ffffff5d8, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a00174  ! 12: FABSq	dis not found

ibp_80_10:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_10:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_10
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_10:
    brnz %r16, ibp_wait80_10
    ld [%r23], %r16
    ba ibp_startwait80_10
    mov 0x80, %r16
continue_ibp_80_10:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_10:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_10
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_10:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_10
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_10:
    best_set_reg(0x00000040cfc0f1c1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfdc00  ! 13: STDFA_R	stda	%f0, [%r0, %r31]
trapasi_80_11:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2c04980  ! 14: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r17
splash_cmpr_80_12:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 15: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc3ed0028  ! 16: PREFETCHA_R	prefetcha	[%r20, %r8] 0x01, #one_read
pmu_80_14:
	nop
	setx 0xfffff709fffffed4, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d903fd1  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x1fd1, %pstate
splash_cmpr_80_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 19: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_80_17:
	nop
	ta T_CHANGE_HPRIV
	set 0xdda79529, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    bne,a wait_for_stat_80_18
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_18:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_18
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_18:
    best_set_reg(0x0000004037f1c1ec,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x87aa8a54  ! 22: FCMPd	fcmpd	%fcc<n>, %f10, %f20
fpinit_80_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 23: FDIVd	fdivd	%f0, %f4, %f8
mondo_80_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d94000d  ! 24: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
intveclr_80_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x93b7cf0f12d0b54b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffbc3ffffff1e, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_80_23:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_80_24:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xdac04980  ! 28: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r13
	.word 0x8780208a  ! 29: WRASI_I	wr	%r0, 0x008a, %asi
ibp_80_25:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_25:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_25
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_25:
    brnz %r16, ibp_wait80_25
    ld [%r23], %r16
    ba ibp_startwait80_25
    mov 0x80, %r16
continue_ibp_80_25:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_25:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_25
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_25:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_25
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_25:
    best_set_reg(0x00000040aec1ec7f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd960  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
dvapa_80_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcbf, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda3ffa91  ! 31: STD_I	std	%r13, [%r31 + 0xfffffa91]
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
    brnz %r10, cwq_80_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_27
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
cwq_80_27:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 32: RDPC	rd	%pc, %r12
	.word 0x8d9031d5  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x11d5, %pstate
	.word 0x93a00169  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_30) + 48, 16, 16)) -> intp(6,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_30)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,11)
#else
	setx 0xca8ab9d3398722c4, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_80_31:
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
	.word 0x95b4c992  ! 36: BSHUFFLE	fmovc32	%d50, %d18, %d10
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd44fe050  ! 38: LDSB_I	ldsb	[%r31 + 0x0050], %r10
splash_cmpr_80_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x39ab3da55cf9c32a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_80_34:
	nop
	setx 0xfffff0f4fffff65c, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_35:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e0b8  ! 44: LDSWA_I	ldswa	[%r31, + 0x00b8] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_80_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a91  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa91] %asi, #one_read
cwp_80_37:
    set user_data_start, %o7
	.word 0x93902006  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
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
    bne,a wait_for_stat_80_38
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_38:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_38
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_38:
    best_set_reg(0x00000040d7ec7f49,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd53fc012  ! 48: STDF_R	std	%f10, [%r18, %r31]
pmu_80_39:
	nop
	setx 0xfffffcfcfffff2cb, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_80_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 50: FDIVs	fdivs	%f0, %f4, %f6
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
    brnz %r10, cwq_80_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_41
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
cwq_80_41:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 51: RDPC	rd	%pc, %r19
	.word 0x91948013  ! 52: WRPR_PIL_R	wrpr	%r18, %r19, %pil
mondo_80_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90c007  ! 53: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
dvapa_80_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa03, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc2c0  ! 54: STDFA_R	stda	%f16, [%r0, %r31]
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
    bne,a wait_for_stat_80_45
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_45:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_45
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_45:
    best_set_reg(0x0000005031ff49ef,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 55: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_80_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 56: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b57  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x0b57, %pstate
splash_lsu_80_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x0f89b547, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_80_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3eac034  ! 59: PREFETCHA_R	prefetcha	[%r11, %r20] 0x01, #one_read
splash_hpstate_80_50:
	ta T_CHANGE_NONHPRIV
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982e9d  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9d, %hpstate
vahole_80_51:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe160  ! 61: STDFA_I	stda	%f0, [0x0160, %r31]
splash_lsu_80_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x21152f18, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_80_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_53
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
cwq_80_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 63: RDPC	rd	%pc, %r17
cwp_80_54:
    set user_data_start, %o7
	.word 0x93902006  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx 0x9fe5eaa94a0f7f0c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_80_56:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd51fc013  ! 66: LDDF_R	ldd	[%r31, %r19], %f10
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_80_58:
	tsubcctv %r4, 0x1951, %r20
	.word 0xd407e0c6  ! 68: LDUW_I	lduw	[%r31 + 0x00c6], %r10
jmptr_80_59:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d90c011  ! 70: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
donret_80_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_61-donret_80_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008a5dc8 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf37, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_61:
	.word 0xd4ffe06a  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x006a] %asi
ibp_80_62:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_62:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_62
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_62:
    brnz %r16, ibp_wait80_62
    ld [%r23], %r16
    ba ibp_startwait80_62
    mov 0x80, %r16
continue_ibp_80_62:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_62:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_62
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_62:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_62
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_62:
    best_set_reg(0x00000050cec9efc9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x87ac4a52  ! 72: FCMPd	fcmpd	%fcc<n>, %f48, %f18
	.word 0x2ac94001  ! 1: BRNZ	brnz,a,pt	%r5,<label_0x94001>
	.word 0x8d903cdd  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x1cdd, %pstate
dvapa_80_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa87, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0e0  ! 74: STDFA_I	stda	%f0, [0x00e0, %r31]
vahole_80_65:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x91b0c7c1  ! 75: PDIST	pdistn	%d34, %d32, %d8
pmu_80_66:
	nop
	setx 0xfffff41ffffffa37, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_80_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_67-donret_80_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cdbece | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x78e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_67:
	.word 0xd2ffe122  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x0122] %asi
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
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_68:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 78: RDPC	rd	%pc, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_80_70:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe4c84a00  ! 80: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r18
tglhtw_80_71:
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
	.word 0xa7b48992  ! 81: BSHUFFLE	fmovc32	%d18, %d18, %d50
pmu_80_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0b4fffff3b1, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_80_73:
	taddcctv %r18, 0x10ff, %r17
	.word 0xd607e18d  ! 83: LDUW_I	lduw	[%r31 + 0x018d], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_74) + 8, 16, 16)) -> intp(6,0,19)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_74)&0xffffffff)  + 8, 16, 16)) -> intp(6,0,19)
#else
	setx 0xa5387089d14d1132, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 85: Tcc_I	te	icc_or_xcc, %r0 + 51
    set 0x723, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b487d4  ! 86: PDIST	pdistn	%d18, %d20, %d16
	.word 0x91918010  ! 87: WRPR_PIL_R	wrpr	%r6, %r16, %pil
	.word 0x91934014  ! 88: WRPR_PIL_R	wrpr	%r13, %r20, %pil
pmu_80_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2f3fffff559, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
vahole_80_78:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc013  ! 91: STXFSR_R	st-sfr	%f1, [%r19, %r31]
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
    bne,a wait_for_stat_80_79
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_79:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_79
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_79:
    best_set_reg(0x0000004083efc962,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3eb4027  ! 92: PREFETCHA_R	prefetcha	[%r13, %r7] 0x01, #one_read
splash_lsu_80_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x73121487, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_81:
	nop
	ta T_CHANGE_HPRIV
	set 0x94f3c77d, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_80_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x81cb8c63, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_83:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_80_85:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x81982102  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0102, %hpstate
	.word 0xe01fe120  ! 100: LDD_I	ldd	[%r31 + 0x0120], %r16
	.word 0xe09fe048  ! 101: LDDA_I	ldda	[%r31, + 0x0048] %asi, %r16
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
    bne,a wait_for_stat_80_86
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_86:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_86
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_86:
    best_set_reg(0x0000004025c9623f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fde00  ! 102: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91d020b2  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 178
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
	.word 0xe1e7e012  ! 104: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0x91948009  ! 105: WRPR_PIL_R	wrpr	%r18, %r9, %pil
pmu_80_89:
	nop
	setx 0xfffff574fffff8ca, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d903dcb  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x1dcb, %pstate
intveclr_80_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa423b7e8a8ad1bf2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_80_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe3140011  ! 1: LDQF_R	-	[%r16, %r17], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0c0  ! 110: STDFA_I	stda	%f16, [0x00c0, %r31]
pmu_80_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9b0fffff269, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_80_94:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe8bfc028  ! 112: STDA_R	stda	%r20, [%r31 + %r8] 0x01
	fbl skip_80_95
	.word 0x9f802627  ! 1: SIR	sir	0x0627
.align 2048
skip_80_95:
	.word 0xc36cf3b5  ! 113: PREFETCH_I	prefetch	[%r19 + 0xfffff3b5], #one_read
dvapa_80_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa7e, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95a109a6  ! 114: FDIVs	fdivs	%f4, %f6, %f10
splash_cmpr_80_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 115: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
vahole_80_98:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd31fc009  ! 116: LDDF_R	ldd	[%r31, %r9], %f9
vahole_80_99:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd960  ! 117: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_80_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d924010  ! 118: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
trapasi_80_101:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d84a00  ! 119: LDXA_R	ldxa	[%r1, %r0] 0x50, %r9
splash_cmpr_80_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 120: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_80_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e008  ! 121: CASA_R	casa	[%r31] %asi, %r8, %r9
dvapa_80_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe06, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91a189ab  ! 122: FDIVs	fdivs	%f6, %f11, %f8
splash_hpstate_80_105:
	.word 0x2ac98001  ! 1: BRNZ	brnz,a,pt	%r6,<label_0x98001>
	.word 0x81982864  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0864, %hpstate
	.word 0xe19fd920  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_80_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d910013  ! 125: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
splash_tba_80_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3500000  ! 127: RDPR_TPC	rdpr	%tpc, %r17
brcommon2_80_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x97a00545  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 128: STDFA_R	stda	%f16, [%r0, %r31]
splash_hpstate_80_110:
	.word 0x81983244  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1244, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fe100  ! 131: LDDFA_I	ldda	[%r31, 0x0100], %f0
	.word 0xa3a00162  ! 132: FABSq	dis not found

	setx 0xe819a43f5e50f46d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_80_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 134: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d9025af  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x05af, %pstate
	bvs,a	 skip_80_116
	brgz,a,pn	%r1, skip_80_116
.align 2048
skip_80_116:
	.word 0xc36fe194  ! 136: PREFETCH_I	prefetch	[%r31 + 0x0194], #one_read
intveclr_80_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3a74b34d25e15e5e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_118:
	nop
	setx 0xfffff3b3fffffc5b, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    bne,a wait_for_stat_80_119
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_119:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_119
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_119:
    best_set_reg(0x00000050d2e23f40,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x95a309c4  ! 139: FDIVd	fdivd	%f12, %f4, %f10
splash_lsu_80_120:
	nop
	ta T_CHANGE_HPRIV
	set 0xd8646f0b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcacfffff353, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
unsupttte_80_122:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e84033  ! 142: PREFETCHA_R	prefetcha	[%r1, %r19] 0x01, #one_read
splash_cmpr_80_123:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 143: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_80_124:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 145: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x97524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_80_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4dce4ba9a987e194, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_80_127:
	set 0x60540000, %r31
	.word 0x8582f8d7  ! 148: WRCCR_I	wr	%r11, 0x18d7, %ccr
	.word 0x87802004  ! 149: WRASI_I	wr	%r0, 0x0004, %asi
intveclr_80_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe03eb98dff8172bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_80_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d940009  ! 152: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
vahole_80_130:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 153: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe08fe068  ! 154: LDUBA_I	lduba	[%r31, + 0x0068] %asi, %r16
	.word 0x91d020b3  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 179
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
    brnz %r10, cwq_80_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_131
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
cwq_80_131:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 156: RDPC	rd	%pc, %r12
ibp_80_132:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_132:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_132
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_132:
    brnz %r16, ibp_wait80_132
    ld [%r23], %r16
    ba ibp_startwait80_132
    mov 0x80, %r16
continue_ibp_80_132:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_132:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_132
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_132:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_132
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_132:
    best_set_reg(0x000000400cff401f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa7703058  ! 157: POPC_I	popc	0x1058, %r19
splash_lsu_80_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x484e11b1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8800b00  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r20
vahole_80_134:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 160: STDFA_R	stda	%f16, [%r0, %r31]
brcommon1_80_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x91b207c3  ! 161: PDIST	pdistn	%d8, %d34, %d8
splash_hpstate_80_136:
	.word 0x81982dbf  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dbf, %hpstate
	.word 0xd497e138  ! 163: LDUHA_I	lduha	[%r31, + 0x0138] %asi, %r10
vahole_80_137:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe0c0  ! 164: STDFA_I	stda	%f16, [0x00c0, %r31]
pmu_80_138:
	nop
	setx 0xfffffd9afffffd50, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_80_139:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd43fe47f  ! 166: STD_I	std	%r10, [%r31 + 0x047f]
intveclr_80_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0x5618ad9d24769767, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903510  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x1510, %pstate
	.word 0x87802004  ! 169: WRASI_I	wr	%r0, 0x0004, %asi
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
    bne,a wait_for_stat_80_142
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_142:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_142
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_142:
    best_set_reg(0x00000040d2c01f3b,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87ab4a50  ! 170: FCMPd	fcmpd	%fcc<n>, %f44, %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_80_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 172: FDIVd	fdivd	%f0, %f4, %f4
dvapa_80_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xea1, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc012  ! 173: LDDF_R	ldd	[%r31, %r18], %f18
intveclr_80_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd7234b3400407a37, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe0d0  ! 175: LDDF_I	ldd	[%r31, 0x00d0], %f18
donret_80_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_147-donret_80_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d30b8b | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x134c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_147:
	.word 0xe4ffe14d  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x014d] %asi
	.word 0xe19fe1e0  ! 177: LDDFA_I	ldda	[%r31, 0x01e0], %f16
	.word 0x93d02033  ! 178: Tcc_I	tne	icc_or_xcc, %r0 + 51
fpinit_80_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 179: FCMPLE32	fcmple32	%d0, %d4, %r8
splash_cmpr_80_149:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 180: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_80_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_150
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
cwq_80_150:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 181: RDPC	rd	%pc, %r8
unsupttte_80_151:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ecc025  ! 182: PREFETCHA_R	prefetcha	[%r19, %r5] 0x01, #one_read
	.word 0xa7a00171  ! 183: FABSq	dis not found

vahole_80_153:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 184: STDFA_R	stda	%f0, [%r0, %r31]
mondo_80_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d934013  ! 185: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
	.word 0xe19fc2c0  ! 186: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_80_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 187: CASA_R	casa	[%r31] %asi, %r18, %r13
pmu_80_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffcadfffffccb, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_80_158:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda3fc013  ! 1: STD_R	std	%r13, [%r31 + %r19]
	normalw
	.word 0xa7458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x91944013  ! 190: WRPR_PIL_R	wrpr	%r17, %r19, %pil
splash_cmpr_80_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 191: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_80_161:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 192: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_80_162:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_162:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_162
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_162:
    brnz %r16, ibp_wait80_162
    ld [%r23], %r16
    ba ibp_startwait80_162
    mov 0x80, %r16
continue_ibp_80_162:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_162:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_162
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_162:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_162
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_162:
    best_set_reg(0x00000040cedf3b9c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa9b207cd  ! 193: PDIST	pdistn	%d8, %d44, %d20
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_80_164:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_164:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_164
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_164:
    brnz %r16, ibp_wait80_164
    ld [%r23], %r16
    ba ibp_startwait80_164
    mov 0x80, %r16
continue_ibp_80_164:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_164:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_164
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_164:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_164
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_164:
    best_set_reg(0x00000050ddfb9c22,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fdc00  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_80_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 196: CASA_R	casa	[%r31] %asi, %r20, %r20
splash_tba_80_166:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_80_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc12f99f79b3a3e76, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_80_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 199: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x99a00164  ! 200: FABSq	dis not found

trapasi_80_170:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0904980  ! 201: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r16
splash_tba_80_171:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e1a0  ! 203: LDQFA_I	-	[%r31, 0x01a0], %f16
	.word 0x8780201c  ! 204: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa5454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
memptr_80_172:
	set 0x60540000, %r31
	.word 0x8581a964  ! 206: WRCCR_I	wr	%r6, 0x0964, %ccr
splash_cmpr_80_173:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 207: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_80_175:
	nop
	setx 0xfffff2bffffff519, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_80_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_176
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
cwq_80_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 210: RDPC	rd	%pc, %r17
	.word 0x91d020b4  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
vahole_80_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa1b08482  ! 213: FCMPLE32	fcmple32	%d2, %d2, %r16
	.word 0xda800a80  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
pmu_80_179:
	nop
	setx 0xfffffe2bfffff01f, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_80_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fc00c  ! 216: LDDF_R	ldd	[%r31, %r12], %f13
trapasi_80_181:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xdac844a0  ! 217: LDSBA_R	ldsba	[%r1, %r0] 0x25, %r13
pmu_80_182:
	nop
	setx 0xfffff9aefffffaf1, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_80_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_183-donret_80_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004c0c61 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6af, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	done
donretarg_80_183:
	.word 0xda6fe092  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x0092]
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
    brnz %r10, sma_80_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 220: CASA_R	casa	[%r31] %asi, %r16, %r13
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
    brnz %r10, cwq_80_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_185
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
cwq_80_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 221: RDPC	rd	%pc, %r17
ibp_80_186:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_186:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_186
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_186:
    brnz %r16, ibp_wait80_186
    ld [%r23], %r16
    ba ibp_startwait80_186
    mov 0x80, %r16
continue_ibp_80_186:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_186:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_186
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_186:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_186
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_186:
    best_set_reg(0x00000040bbdc226e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea0023  ! 222: PREFETCHA_R	prefetcha	[%r8, %r3] 0x01, #one_read
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d90389d  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x189d, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_80_189:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_189:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_189
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_189:
    brnz %r16, ibp_wait80_189
    ld [%r23], %r16
    ba ibp_startwait80_189
    mov 0x80, %r16
continue_ibp_80_189:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_189:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_189
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_189:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_189
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_189:
    best_set_reg(0x00000040f9e26e84,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe19fdf20  ! 226: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_80_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1e7e013  ! 228: CASA_R	casa	[%r31] %asi, %r19, %r16
	.word 0xa1902009  ! 229: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_80_191:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 230: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_80_192:
	nop
	ta T_CHANGE_HPRIV
	set 0x8bc2395b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_80_193:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x91703251  ! 232: POPC_I	popc	0x1251, %r8
jmptr_80_194:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_80_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc53, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc034  ! 234: LDXA_R	ldxa	[%r31, %r20] 0x01, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_196:
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
    brnz %r10, sma_80_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00c  ! 236: CASA_R	casa	[%r31] %asi, %r12, %r17
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
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 237: CASA_R	casa	[%r31] %asi, %r19, %r17
	setx 0x437da3156e01da1a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_80_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd112400d  ! 1: LDQF_R	-	[%r9, %r13], %f8
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe160  ! 239: STDFA_I	stda	%f16, [0x0160, %r31]
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
    brnz %r10, sma_80_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e012  ! 240: CASA_R	casa	[%r31] %asi, %r18, %r17
	.word 0x87802016  ! 241: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_80_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_202-donret_80_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00406df7 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1205, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_202:
	.word 0xa9a4c9c9  ! 243: FDIVd	fdivd	%f50, %f40, %f20
	.word 0xe0dfe148  ! 244: LDXA_I	ldxa	[%r31, + 0x0148] %asi, %r16
pmu_80_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4a1fffff9e0, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_80_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_80_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff446fffff216, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_80_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_206
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
cwq_80_206:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 248: RDPC	rd	%pc, %r12
donret_80_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_207-donret_80_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000d8153 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f9d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_207:
	.word 0xa1a209ca  ! 249: FDIVd	fdivd	%f8, %f10, %f16
ibp_80_208:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_208:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_208
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_208:
    brnz %r16, ibp_wait80_208
    ld [%r23], %r16
    ba ibp_startwait80_208
    mov 0x80, %r16
continue_ibp_80_208:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_208:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_208
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_208:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_208
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_208:
    best_set_reg(0x0000005081ee8493,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a4c9b3  ! 250: FDIVs	fdivs	%f19, %f19, %f18
fpinit_80_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 251: FCMPLE32	fcmple32	%d0, %d4, %r4
change_to_randtl_80_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_210:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_80_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_211
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
cwq_80_211:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 253: RDPC	rd	%pc, %r19
memptr_80_212:
	set 0x60340000, %r31
	.word 0x85826f5e  ! 254: WRCCR_I	wr	%r9, 0x0f5e, %ccr
dvapa_80_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe5f, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f802b3d  ! 255: SIR	sir	0x0b3d
donret_80_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_214-donret_80_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c6d151 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e49, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_214:
	.word 0xa9a149ca  ! 256: FDIVd	fdivd	%f36, %f10, %f20
	.word 0xda3fe138  ! 257: STD_I	std	%r13, [%r31 + 0x0138]
dvapa_80_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xceb, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc034  ! 258: LDXA_R	ldxa	[%r31, %r20] 0x01, %r13
	.word 0xc19fde00  ! 259: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_80_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 260: CASA_R	casa	[%r31] %asi, %r19, %r13
pmu_80_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff164fffff265, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_80_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8f8fffff8c3, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_220:
	nop
	setx 0xfffff628fffffcc8, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x682aca028e3e378d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_80_222:
	nop
	ta T_CHANGE_HPRIV
	set 0x28e81d67, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_80_223:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_223:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_223
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_223:
    brnz %r16, ibp_wait80_223
    ld [%r23], %r16
    ba ibp_startwait80_223
    mov 0x80, %r16
continue_ibp_80_223:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_223:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_223
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_223:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_223
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_223:
    best_set_reg(0x00000050b3c4931e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 267: STDFA_R	stda	%f0, [%r0, %r31]
mondo_80_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d94c013  ! 268: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
donret_80_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_225-donret_80_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0048f8ae | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x601, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_225:
	.word 0xda6fe173  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x0173]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_226) + 48, 16, 16)) -> intp(3,0,30)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_226)&0xffffffff)  + 48, 16, 16)) -> intp(3,0,30)
#else
	setx 0xfbe2487a59104ef8, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe008  ! 272: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r13
intveclr_80_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0x41fbd729a01f2259, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_80_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd08, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a50  ! 274: FCMPd	fcmpd	%fcc<n>, %f48, %f16
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_80_230:
	.word 0x819836c5  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x16c5, %hpstate
	.word 0xe4800c20  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
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
    brnz %r10, sma_80_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 278: CASA_R	casa	[%r31] %asi, %r18, %r18
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 279: Tcc_R	tne	icc_or_xcc, %r0 + %r30
brcommon2_80_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe1150010  ! 1: LDQF_R	-	[%r20, %r16], %f16
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0c0  ! 280: STDFA_I	stda	%f16, [0x00c0, %r31]
vahole_80_233:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd920  ! 281: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_80_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 282: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_80_235:
	nop
	ta T_CHANGE_HPRIV
	set 0x402045e7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 284: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d902811  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0811, %pstate
memptr_80_237:
	set user_data_start, %r31
	.word 0x85846322  ! 286: WRCCR_I	wr	%r17, 0x0322, %ccr
memptr_80_238:
	set 0x60340000, %r31
	.word 0x8584aee8  ! 287: WRCCR_I	wr	%r18, 0x0ee8, %ccr
	.word 0xa780800b  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r11, %-
	brz,pt  	%r13, skip_80_240
	fbuge skip_80_240
.align 32
skip_80_240:
	.word 0xc36a6374  ! 289: PREFETCH_I	prefetch	[%r9 + 0x0374], #one_read
intveclr_80_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa112885afb9b9383, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 291: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0x8d802000  ! 292: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_80_243:
	nop
	setx 0xfffffb37fffff136, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_244) + 24, 16, 16)) -> intp(4,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_244)&0xffffffff)  + 24, 16, 16)) -> intp(4,0,6)
#else
	setx 0xe67cbb1cf32c02ae, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_80_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 295: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_80_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d94c00b  ! 296: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
	.word 0xa7524000  ! 297: RDPR_CWP	rdpr	%cwp, %r19
pmu_80_247:
	nop
	setx 0xfffffe01fffff49f, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_80_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902000  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	setx 0xd72cf5c47656224e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbne skip_80_250
	.word 0xc36c707f  ! 1: PREFETCH_I	prefetch	[%r17 + 0xfffff07f], #one_read
.align 1024
skip_80_250:
	.word 0x87ac4a43  ! 301: FCMPd	fcmpd	%fcc<n>, %f48, %f34
ibp_80_251:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_251:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_251
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_251:
    brnz %r16, ibp_wait80_251
    ld [%r23], %r16
    ba ibp_startwait80_251
    mov 0x80, %r16
continue_ibp_80_251:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_251:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_251
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_251:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_251
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_251:
    best_set_reg(0x0000004036d31e67,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfd920  ! 302: STDFA_R	stda	%f0, [%r0, %r31]
dvapa_80_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9ea, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a94a51  ! 303: FCMPd	fcmpd	%fcc<n>, %f36, %f48
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
    brnz %r10, cwq_80_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_253
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
cwq_80_253:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 304: RDPC	rd	%pc, %r12
pmu_80_254:
	nop
	setx 0xfffff984fffff08e, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_255:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_80_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_256
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
cwq_80_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 307: RDPC	rd	%pc, %r18
splash_hpstate_80_257:
	ta T_CHANGE_NONHPRIV
	.word 0x81982ec7  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0xa5a00170  ! 310: FABSq	dis not found

	.word 0x91d020b5  ! 311: Tcc_I	ta	icc_or_xcc, %r0 + 181
intveclr_80_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4b98e96a976cad46, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_80_260:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_260:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_260
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_260:
    brnz %r16, ibp_wait80_260
    ld [%r23], %r16
    ba ibp_startwait80_260
    mov 0x80, %r16
continue_ibp_80_260:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_260:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_260
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_260:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_260
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_260:
    best_set_reg(0x0000004083de6780,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfde00  ! 313: STDFA_R	stda	%f0, [%r0, %r31]
jmptr_80_261:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d948007  ! 315: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
ibp_80_263:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_263:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_263
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_263:
    brnz %r16, ibp_wait80_263
    ld [%r23], %r16
    ba ibp_startwait80_263
    mov 0x80, %r16
continue_ibp_80_263:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_263:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_263
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_263:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_263
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_263:
    best_set_reg(0x0000004026e78083,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe1e0  ! 316: STDFA_I	stda	%f16, [0x01e0, %r31]
	.word 0xe127e112  ! 317: STF_I	st	%f16, [0x0112, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_80_264:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_264:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_264
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_264:
    brnz %r16, ibp_wait80_264
    ld [%r23], %r16
    ba ibp_startwait80_264
    mov 0x80, %r16
continue_ibp_80_264:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_264:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_264
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_264:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_264
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_264:
    best_set_reg(0x00000040b5c08345,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe13fc013  ! 319: STDF_R	std	%f16, [%r19, %r31]
	.word 0xc1bfde00  ! 320: STDFA_R	stda	%f0, [%r0, %r31]
vahole_80_266:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe080  ! 321: STDFA_I	stda	%f16, [0x0080, %r31]
intveclr_80_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7cd4c980c08c708e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_268:
	nop
	setx 0xfffff3aafffffc97, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a000c6  ! 324: FNEGd	fnegd	%f6, %f16
intveclr_80_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8c84f5e3091ee343, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_80_270:
	tsubcctv %r13, 0x1e58, %r8
	.word 0xd807e148  ! 326: LDUW_I	lduw	[%r31 + 0x0148], %r12
	setx 0xb6d436a43644fd24, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_80_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa3a00549  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd920  ! 328: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_80_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e014  ! 329: CASA_R	casa	[%r31] %asi, %r20, %r10
dvapa_80_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd5d, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f803b35  ! 330: SIR	sir	0x1b35
vahole_80_275:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87a84a41  ! 331: FCMPd	fcmpd	%fcc<n>, %f32, %f32
dvapa_80_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf5b, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 332: STDFA_R	stda	%f16, [%r0, %r31]
splash_cmpr_80_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 333: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9b520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_80_278:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 335: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa7703814  ! 336: POPC_I	popc	0x1814, %r19
vahole_80_279:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3ec0034  ! 337: PREFETCHA_R	prefetcha	[%r16, %r20] 0x01, #one_read
jmptr_80_280:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d903255  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x1255, %pstate
ceter_80_282:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa3410000  ! 340: RDTICK	rd	%tick, %r17
	.word 0x99b107c5  ! 341: PDIST	pdistn	%d4, %d36, %d12
	.word 0xd847e1e0  ! 342: LDSW_I	ldsw	[%r31 + 0x01e0], %r12
	.word 0x9195000b  ! 343: WRPR_PIL_R	wrpr	%r20, %r11, %pil
	.word 0xd837e070  ! 344: STH_I	sth	%r12, [%r31 + 0x0070]
ibp_80_285:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait80_285:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_80_285
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
ibp_wait80_285:
    brnz %r16, ibp_wait80_285
    ld [%r23], %r16
    ba ibp_startwait80_285
    mov 0x80, %r16
continue_ibp_80_285:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_285:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_80_285
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_80_285:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_80_285
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit80_285:
    best_set_reg(0x0000005020c3458f,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x87ac0a4b  ! 345: FCMPd	fcmpd	%fcc<n>, %f16, %f42
	fblg,a,pn	%fcc0,  skip_80_286
	fbge,a,pn	%fcc0,  skip_80_286
.align 512
skip_80_286:
	.word 0x97a109c8  ! 346: FDIVd	fdivd	%f4, %f8, %f42
	.word 0xd337e088  ! 347: STQF_I	-	%f9, [0x0088, %r31]
donret_80_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_287-donret_80_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b16245 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_80_287:
	.word 0xd2ffe0b8  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x00b8] %asi
	.word 0xd28008a0  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d802000  ! 350: WRFPRS_I	wr	%r0, 0x0000, %fprs
dvapa_80_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb9a, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd2dfc02d  ! 351: LDXA_R	ldxa	[%r31, %r13] 0x01, %r9
	.word 0xa7a00173  ! 352: FABSq	dis not found

	.word 0xe1bfe020  ! 353: STDFA_I	stda	%f16, [0x0020, %r31]
brcommon2_80_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe3144010  ! 1: LDQF_R	-	[%r17, %r16], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfc3e0  ! 354: STDFA_R	stda	%f16, [%r0, %r31]
donret_80_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_292-donret_80_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001a7f12 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x144c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_292:
	.word 0x97a189d0  ! 355: FDIVd	fdivd	%f6, %f16, %f42
pmu_80_293:
	nop
	setx 0xfffffaabfffff994, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_80_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_294-donret_80_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c60cac | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14d7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_294:
	.word 0xe46fe1ca  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x01ca]
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
    brnz %r10, sma_80_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 358: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_80_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_296
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
cwq_80_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 360: RDPC	rd	%pc, %r16
splash_cmpr_80_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 361: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_80_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d904002  ! 362: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
brcommon3_80_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c00d  ! 1: STQF_R	-	%f13, [%r13, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdadfc031  ! 363: LDXA_R	ldxa	[%r31, %r17] 0x01, %r13
intveclr_80_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0x18abeba080102bff, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_80_302:
	nop
	ta T_CHANGE_HPRIV
	set 0xa0356dba, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_80_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_303
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
cwq_80_303:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 367: RDPC	rd	%pc, %r10
    set 0x2032, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb087cb  ! 368: PDIST	pdistn	%d2, %d42, %d44
splash_lsu_80_304:
	nop
	ta T_CHANGE_HPRIV
	set 0xc07dcaee, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_80_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
dvapa_80_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc53, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ab4a52  ! 371: FCMPd	fcmpd	%fcc<n>, %f44, %f18
pmu_80_307:
	nop
	setx 0xfffff035fffffad7, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_308:
	nop
	setx 0xfffff82dfffffea2, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_80_309:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 374: STDFA_R	stda	%f0, [%r0, %r31]
tagged_80_310:
	tsubcctv %r2, 0x1d97, %r9
	.word 0xd407e170  ! 375: LDUW_I	lduw	[%r31 + 0x0170], %r10
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
    brnz %r10, cwq_80_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_311
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
cwq_80_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 376: RDPC	rd	%pc, %r20
trapasi_80_312:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8c84b60  ! 377: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r12
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d903567  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x1567, %pstate
	.word 0xd93fc00d  ! 379: STDF_R	std	%f12, [%r13, %r31]
mondo_80_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d904010  ! 380: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
fpinit_80_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8333a  ! 381: PREFETCHA_I	prefetcha	[%r0, + 0xfffff33a] %asi, #one_read
dvapa_80_317:
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
	.word 0xc1bfde00  ! 382: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d902c23  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x0c23, %pstate
pmu_80_319:
	nop
	setx 0xfffff6d9fffffec1, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e1e8  ! 385: LDSHA_I	ldsha	[%r31, + 0x01e8] %asi, %r12
	.word 0x8d90353c  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x153c, %pstate
fpinit_80_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8333a  ! 387: PREFETCHA_I	prefetcha	[%r0, + 0xfffff33a] %asi, #one_read
	.word 0xe19fc3e0  ! 388: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa3b44549  ! 389: FCMPEQ16	fcmpeq16	%d48, %d40, %r17
donret_80_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_322-donret_80_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e487be | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	retry
donretarg_80_322:
	.word 0xe8ffe092  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0092] %asi
	.word 0xa145c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xab83000a  ! 392: WR_CLEAR_SOFTINT_R	wr	%r12, %r10, %clear_softint
	setx 0x6218b9700a873462, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc012  ! 394: STXFSR_R	st-sfr	%f1, [%r18, %r31]
	setx 0x61704647858b8c7a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1524000  ! 396: RDPR_CWP	rdpr	%cwp, %r16
dvapa_80_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0xed5, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe000  ! 397: STDFA_I	stda	%f16, [0x0000, %r31]
fpinit_80_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 398: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xe7e7e011  ! 399: CASA_R	casa	[%r31] %asi, %r17, %r19
unsupttte_80_330:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a489c7  ! 400: FDIVd	fdivd	%f18, %f38, %f10
vahole_80_331:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd960  ! 401: LDDFA_R	ldda	[%r31, %r0], %f0
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
	.word 0xe88008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa9a0016c  ! 2: FABSq	dis not found

ibp_40_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc00c  ! 3: LDDF_R	ldd	[%r31, %r12], %f17
donret_40_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_2-donret_40_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0041178f | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1669, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	retry
donretarg_40_2:
	.word 0xe26fe0b7  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x00b7]
	setx 0xbf7c6f06e1996c34, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94c007  ! 6: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
pmu_40_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff645fffff62c, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x90fcea55  ! 8: SDIVcc_I	sdivcc 	%r19, 0x0a55, %r8
splash_cmpr_40_6:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_40_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_7
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
cwq_40_7:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 10: RDPC	rd	%pc, %r12
pmu_40_8:
	nop
	setx 0xfffff54afffff3e8, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a0016b  ! 12: FABSq	dis not found

ibp_40_10:
	nop
	.word 0xe1bfdb60  ! 13: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_40_11:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2d04980  ! 14: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r17
splash_cmpr_40_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 15: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
iaw_40_13:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_13:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_13
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_13:
    brnz %r16, iaw_wait40_13
    ld [%r23], %r16
    ba iaw_startwait40_13
    mov 0x40, %r16
continue_iaw_40_13:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_13:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_13
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_13:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_13
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_13:
	mov 0x38, %r18
iaw3_40_13:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87aa4a45  ! 16: FCMPd	fcmpd	%fcc<n>, %f40, %f36
pmu_40_14:
	nop
	setx 0xfffff64cfffff3cd, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22c88001  ! 1: BRZ	brz,a,pt	%r2,<label_0x88001>
	.word 0x8d903467  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x1467, %pstate
splash_cmpr_40_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 19: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_40_17:
	nop
	ta T_CHANGE_HPRIV
	set 0x1aeb1787, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_40_18:
	nop
	.word 0xa3b447d0  ! 22: PDIST	pdistn	%d48, %d16, %d48
fpinit_40_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a91  ! 23: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa91] %asi, #one_read
mondo_40_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d944009  ! 24: WRPR_WSTATE_R	wrpr	%r17, %r9, %wstate
intveclr_40_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd1be4ca3423a46de, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff321fffff8f5, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_40_23:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_40_24:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xda884980  ! 28: LDUBA_R	lduba	[%r1, %r0] 0x4c, %r13
	.word 0x8780208a  ! 29: WRASI_I	wr	%r0, 0x008a, %asi
ibp_40_25:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe1a0  ! 30: STDFA_I	stda	%f0, [0x01a0, %r31]
dvapa_40_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8ef, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc008  ! 31: STDF_R	std	%f13, [%r8, %r31]
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
    brnz %r10, cwq_40_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_27
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
cwq_40_27:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 32: RDPC	rd	%pc, %r9
	.word 0x8d903775  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x1775, %pstate
	.word 0xa9a0016b  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_30) + 40, 16, 16)) -> intp(3,0,18)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_30)&0xffffffff)  + 40, 16, 16)) -> intp(3,0,18)
#else
	setx 0xf797b0b6b9c6f359, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99b10981  ! 36: BSHUFFLE	fmovc32	%d4, %d32, %d12
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd44fe170  ! 38: LDSB_I	ldsb	[%r31 + 0x0170], %r10
splash_cmpr_40_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x4cb948355a024d05, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_40_34:
	nop
	setx 0xfffff361fffffcb9, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_35:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e040  ! 44: LDSWA_I	ldswa	[%r31, + 0x0040] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_40_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 46: FDIVd	fdivd	%f0, %f4, %f4
cwp_40_37:
    set user_data_start, %o7
	.word 0x93902005  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
ibp_40_38:
	nop
	.word 0xd43ffa91  ! 48: STD_I	std	%r10, [%r31 + 0xfffffa91]
pmu_40_39:
	nop
	setx 0xfffff18cffffff18, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_40_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 50: FDIVd	fdivd	%f0, %f4, %f8
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
    brnz %r10, cwq_40_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_41
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
cwq_40_41:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 51: RDPC	rd	%pc, %r11
	.word 0x91944010  ! 52: WRPR_PIL_R	wrpr	%r17, %r16, %pil
mondo_40_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d924001  ! 53: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
dvapa_40_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xabc, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdf20  ! 54: STDFA_R	stda	%f0, [%r0, %r31]
ibp_40_45:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe180  ! 55: STDFA_I	stda	%f0, [0x0180, %r31]
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
    brnz %r10, sma_40_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 56: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d902b35  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x0b35, %pstate
splash_lsu_40_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x25a85820, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_40_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3e88030  ! 59: PREFETCHA_R	prefetcha	[%r2, %r16] 0x01, #one_read
splash_hpstate_40_50:
	ta T_CHANGE_NONHPRIV
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8198264d  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064d, %hpstate
vahole_40_51:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd960  ! 61: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_40_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x47af3b0c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_40_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_53
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
cwq_40_53:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 63: RDPC	rd	%pc, %r13
cwp_40_54:
    set user_data_start, %o7
	.word 0x93902005  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	setx 0x52988f5767262d99, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_40_56:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd497c02b  ! 66: LDUHA_R	lduha	[%r31, %r11] 0x01, %r10
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_40_58:
	tsubcctv %r7, 0x17c8, %r4
	.word 0xd407e111  ! 68: LDUW_I	lduw	[%r31 + 0x0111], %r10
jmptr_40_59:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d920005  ! 70: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
donret_40_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_61-donret_40_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006eb230 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed8, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_61:
	.word 0xd4ffe0f6  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x00f6] %asi
ibp_40_62:
	nop
	.word 0xc3eb4033  ! 72: PREFETCHA_R	prefetcha	[%r13, %r19] 0x01, #one_read
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d902701  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x0701, %pstate
dvapa_40_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd27, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1c0  ! 74: STDFA_I	stda	%f16, [0x01c0, %r31]
vahole_40_65:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x87a8ca50  ! 75: FCMPd	fcmpd	%fcc<n>, %f34, %f16
pmu_40_66:
	nop
	setx 0xffffffc9fffffbf6, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_40_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_67-donret_40_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00040978 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xefd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_67:
	.word 0xd2ffe0b2  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x00b2] %asi
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_68:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 78: RDPC	rd	%pc, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_40_70:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe4c04a00  ! 80: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r18
	.word 0xa9b40993  ! 81: BSHUFFLE	fmovc32	%d16, %d50, %d20
pmu_40_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff69bfffffc03, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_40_73:
	taddcctv %r8, 0x14f5, %r17
	.word 0xd607e0c0  ! 83: LDUW_I	lduw	[%r31 + 0x00c0], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_74) + 8, 16, 16)) -> intp(0,0,13)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_74)&0xffffffff)  + 8, 16, 16)) -> intp(0,0,13)
#else
	setx 0xda3da70ee63c99fa, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 85: Tcc_I	tne	icc_or_xcc, %r0 + 53
    set 0x3eb9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b487d2  ! 86: PDIST	pdistn	%d18, %d18, %d40
	.word 0x91918010  ! 87: WRPR_PIL_R	wrpr	%r6, %r16, %pil
	.word 0x9193000d  ! 88: WRPR_PIL_R	wrpr	%r12, %r13, %pil
pmu_40_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc2afffff8fa, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
vahole_40_78:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd33fc00b  ! 91: STDF_R	std	%f9, [%r11, %r31]
ibp_40_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3e8c033  ! 92: PREFETCHA_R	prefetcha	[%r3, %r19] 0x01, #one_read
splash_lsu_40_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xbaa3ad62, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_81:
	nop
	ta T_CHANGE_HPRIV
	set 0x2ea6cad8, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_40_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xc307e3ac, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_83:
	ta	T_CHANGE_NONHPRIV	! macro
invtsb_40_84:
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
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_40_85:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8198375e  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x175e, %hpstate
	.word 0xe01fe010  ! 100: LDD_I	ldd	[%r31 + 0x0010], %r16
	.word 0xe09fe188  ! 101: LDDA_I	ldda	[%r31, + 0x0188] %asi, %r16
ibp_40_86:
	nop
	.word 0xc19fc2c0  ! 102: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d020b5  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 181
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
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 104: CASA_R	casa	[%r31] %asi, %r19, %r16
	.word 0x91948010  ! 105: WRPR_PIL_R	wrpr	%r18, %r16, %pil
pmu_40_89:
	nop
	setx 0xfffffbfbfffff89a, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d90254d  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x054d, %pstate
intveclr_40_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0xde2870902f76cc3a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_40_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c973  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe000  ! 110: STDFA_I	stda	%f16, [0x0000, %r31]
pmu_40_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff03dfffff50f, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_40_94:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc00d  ! 112: STXFSR_R	st-sfr	%f1, [%r13, %r31]
	be,a	 skip_40_95
	.word 0xc368ea2d  ! 1: PREFETCH_I	prefetch	[%r3 + 0x0a2d], #one_read
.align 2048
skip_40_95:
	.word 0x24cc4001  ! 113: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
dvapa_40_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb98, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa9a249d3  ! 114: FDIVd	fdivd	%f40, %f50, %f20
splash_cmpr_40_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 115: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
vahole_40_98:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd3e7e00a  ! 116: CASA_R	casa	[%r31] %asi, %r10, %r9
vahole_40_99:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdc00  ! 117: STDFA_R	stda	%f0, [%r0, %r31]
mondo_40_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 118: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
trapasi_40_101:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd2884a00  ! 119: LDUBA_R	lduba	[%r1, %r0] 0x50, %r9
splash_cmpr_40_102:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 120: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_40_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 121: CASA_R	casa	[%r31] %asi, %r11, %r9
dvapa_40_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0x80b, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ad0a4b  ! 122: FCMPd	fcmpd	%fcc<n>, %f20, %f42
splash_hpstate_40_105:
	.word 0x2cc9c001  ! 1: BRGZ	brgz,a,pt	%r7,<label_0x9c001>
	.word 0x81983d55  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d55, %hpstate
iaw_40_106:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_106:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_106
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_106:
    brnz %r16, iaw_wait40_106
    ld [%r23], %r16
    ba iaw_startwait40_106
    mov 0x40, %r16
continue_iaw_40_106:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_106:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_106
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_106:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_106
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_106:
	mov 0x38, %r18
iaw1_40_106:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fde00  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_40_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d914011  ! 125: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
splash_tba_40_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_40_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00a  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fc3e0  ! 128: LDDFA_R	ldda	[%r31, %r0], %f0
splash_hpstate_40_110:
	.word 0x819837cd  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x17cd, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fe120  ! 131: LDDFA_I	ldda	[%r31, 0x0120], %f0
	.word 0xa9a00171  ! 132: FABSq	dis not found

	setx 0xd609eaf8a482755f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_40_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8217a  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x017a] %asi, #one_read
	.word 0x8d903b8a  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x1b8a, %pstate
	be  	 skip_40_116
	fbne,a,pn	%fcc0,  skip_40_116
.align 2048
skip_40_116:
	.word 0xd9e7c020  ! 136: CASA_I	casa	[%r31] 0x 1, %r0, %r12
intveclr_40_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0xebd8275bba30ebda, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_118:
	nop
	setx 0xfffff3bafffff068, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_40_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a409ad  ! 139: FDIVs	fdivs	%f16, %f13, %f18
splash_lsu_40_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x28477cd1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffde9fffffa7e, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
unsupttte_40_122:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa7a509a8  ! 142: FDIVs	fdivs	%f20, %f8, %f19
splash_cmpr_40_123:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 143: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_40_124:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 145: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9b524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_40_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x80a7e9645e335166, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_40_127:
	set 0x60340000, %r31
	.word 0x8584660a  ! 148: WRCCR_I	wr	%r17, 0x060a, %ccr
	.word 0x87802016  ! 149: WRASI_I	wr	%r0, 0x0016, %asi
intveclr_40_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0xec472644dd93190e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_40_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d940007  ! 152: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
vahole_40_130:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdf20  ! 153: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe08fe168  ! 154: LDUBA_I	lduba	[%r31, + 0x0168] %asi, %r16
	.word 0x91d02032  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 50
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
    brnz %r10, cwq_40_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_131
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
cwq_40_131:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 156: RDPC	rd	%pc, %r10
ibp_40_132:
	nop
	.word 0xa3b087c6  ! 157: PDIST	pdistn	%d2, %d6, %d48
splash_lsu_40_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x2e403536, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8800a80  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r20
vahole_40_134:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fda00  ! 160: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon1_40_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa3b487d1  ! 161: PDIST	pdistn	%d18, %d48, %d48
splash_hpstate_40_136:
	.word 0x8198351e  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x151e, %hpstate
	.word 0xd497e008  ! 163: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r10
vahole_40_137:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfc2c0  ! 164: STDFA_R	stda	%f16, [%r0, %r31]
pmu_40_138:
	nop
	setx 0xfffffbfefffff524, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_40_139:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd4dfc033  ! 166: LDXA_R	ldxa	[%r31, %r19] 0x01, %r10
intveclr_40_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1b21f459b14a3295, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d05  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x1d05, %pstate
	.word 0x8780204f  ! 169: WRASI_I	wr	%r0, 0x004f, %asi
ibp_40_142:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99a049d3  ! 170: FDIVd	fdivd	%f32, %f50, %f12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_40_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 172: FCMPLE32	fcmple32	%d0, %d4, %r6
dvapa_40_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdff, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00c  ! 173: STXFSR_R	st-sfr	%f1, [%r12, %r31]
intveclr_40_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x211bf1268cf1f345, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe008  ! 175: LDDF_I	ldd	[%r31, 0x0008], %f18
donret_40_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_147-donret_40_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a54ea1 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb5d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_147:
	.word 0xe4ffe0ac  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x00ac] %asi
	.word 0xc19fe100  ! 177: LDDFA_I	ldda	[%r31, 0x0100], %f0
	.word 0x83d020b2  ! 178: Tcc_I	te	icc_or_xcc, %r0 + 178
fpinit_40_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 179: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_cmpr_40_149:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 180: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_40_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_150
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
cwq_40_150:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 181: RDPC	rd	%pc, %r13
unsupttte_40_151:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5a309d2  ! 182: FDIVd	fdivd	%f12, %f18, %f18
	.word 0xa3a0016c  ! 183: FABSq	dis not found

vahole_40_153:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe0c0  ! 184: STDFA_I	stda	%f0, [0x00c0, %r31]
mondo_40_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d944011  ! 185: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
iaw_40_155:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_155:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_155
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_155:
    brnz %r16, iaw_wait40_155
    ld [%r23], %r16
    ba iaw_startwait40_155
    mov 0x40, %r16
continue_iaw_40_155:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_155:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_155
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_155:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_155
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_155:
	mov 0x38, %r18
iaw1_40_155:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 186: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_40_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00a  ! 187: CASA_R	casa	[%r31] %asi, %r10, %r13
pmu_40_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff27fffff369, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_40_158:
	.word 0xc36fe47f  ! 1: PREFETCH_I	prefetch	[%r31 + 0x047f], #one_read
	.word 0x24c88001  ! 1: BRLEZ	brlez,a,pt	%r2,<label_0x88001>
	.word 0x24cfc001  ! 1: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	normalw
	.word 0xa9458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x91950013  ! 190: WRPR_PIL_R	wrpr	%r20, %r19, %pil
splash_cmpr_40_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 191: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_40_161:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_40_162:
	nop
	.word 0xa9a409b3  ! 193: FDIVs	fdivs	%f16, %f19, %f20
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_40_164:
	nop
	.word 0xc1bfe1e0  ! 195: STDFA_I	stda	%f0, [0x01e0, %r31]
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
    brnz %r10, sma_40_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 196: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_tba_40_166:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_40_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7472872ed9cc5837, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_40_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 199: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xa3a00168  ! 200: FABSq	dis not found

trapasi_40_170:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0c04980  ! 201: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r16
splash_tba_40_171:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e118  ! 203: LDQFA_I	-	[%r31, 0x0118], %f16
	.word 0x87802089  ! 204: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
memptr_40_172:
	set 0x60740000, %r31
	.word 0x8582ffe0  ! 206: WRCCR_I	wr	%r11, 0x1fe0, %ccr
splash_cmpr_40_173:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 207: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_40_175:
	nop
	setx 0xfffffa43fffffe7e, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_40_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_176
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
cwq_40_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 210: RDPC	rd	%pc, %r17
	.word 0x91d02033  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
vahole_40_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x93a449ca  ! 213: FDIVd	fdivd	%f48, %f10, %f40
	.word 0xda8008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_40_179:
	nop
	setx 0xfffffd18fffff6c7, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_40_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c028  ! 1: CASA_I	casa	[%r31] 0x 1, %r8, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda9fc031  ! 216: LDDA_R	ldda	[%r31, %r17] 0x01, %r13
trapasi_40_181:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xdad044a0  ! 217: LDSHA_R	ldsha	[%r1, %r0] 0x25, %r13
pmu_40_182:
	nop
	setx 0xfffff22bfffff1e7, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_40_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_183-donret_40_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007e7779 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x169f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_183:
	.word 0xda6fe190  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x0190]
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
    brnz %r10, sma_40_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 220: CASA_R	casa	[%r31] %asi, %r8, %r13
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
    brnz %r10, cwq_40_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_185
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
cwq_40_185:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 221: RDPC	rd	%pc, %r11
ibp_40_186:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1b487c5  ! 222: PDIST	pdistn	%d18, %d36, %d16
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d903f88  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x1f88, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_40_189:
	nop
	.word 0xe1bfd920  ! 226: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_40_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe0bfc02a  ! 228: STDA_R	stda	%r16, [%r31 + %r10] 0x01
	.word 0xa1902004  ! 229: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_40_191:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 230: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_40_192:
	nop
	ta T_CHANGE_HPRIV
	set 0x480140f6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_40_193:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa7b287d3  ! 232: PDIST	pdistn	%d10, %d50, %d50
jmptr_40_194:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_40_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc85, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00b  ! 234: STXFSR_R	st-sfr	%f1, [%r11, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_196:
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
    brnz %r10, sma_40_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00c  ! 236: CASA_R	casa	[%r31] %asi, %r12, %r17
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 237: CASA_R	casa	[%r31] %asi, %r20, %r17
	setx 0x60ff3271d47f9f8d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_40_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe2e8  ! 1: PREFETCH_I	prefetch	[%r31 + 0x02e8], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fde00  ! 239: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_40_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 240: CASA_R	casa	[%r31] %asi, %r19, %r17
	.word 0x8780208a  ! 241: WRASI_I	wr	%r0, 0x008a, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_40_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_202-donret_40_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d94c6d | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x40b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_202:
	.word 0xa3a509d3  ! 243: FDIVd	fdivd	%f20, %f50, %f48
	.word 0xe0dfe198  ! 244: LDXA_I	ldxa	[%r31, + 0x0198] %asi, %r16
pmu_40_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff6f7fffff664, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_40_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_40_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff79bfffff5e2, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_40_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_206
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
cwq_40_206:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 248: RDPC	rd	%pc, %r9
donret_40_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_207-donret_40_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a2385c | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd0f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_207:
	.word 0xa7a4c9d3  ! 249: FDIVd	fdivd	%f50, %f50, %f50
ibp_40_208:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x97b407d3  ! 250: PDIST	pdistn	%d16, %d50, %d42
fpinit_40_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 251: FDIVd	fdivd	%f0, %f4, %f8
change_to_randtl_40_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_210:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_40_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_211
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
cwq_40_211:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 253: RDPC	rd	%pc, %r16
memptr_40_212:
	set 0x60740000, %r31
	.word 0x85846608  ! 254: WRCCR_I	wr	%r17, 0x0608, %ccr
dvapa_40_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd06, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3e94034  ! 255: PREFETCHA_R	prefetcha	[%r5, %r20] 0x01, #one_read
donret_40_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_214-donret_40_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cfb82d | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_214:
	.word 0xa9a209c5  ! 256: FDIVd	fdivd	%f8, %f36, %f20
	.word 0xda3fe144  ! 257: STD_I	std	%r13, [%r31 + 0x0144]
dvapa_40_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdf8, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc02a  ! 258: LDDA_R	ldda	[%r31, %r10] 0x01, %r13
	.word 0xe19fdf20  ! 259: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_40_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 260: CASA_R	casa	[%r31] %asi, %r17, %r13
pmu_40_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff275ffffffc5, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_40_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff86dfffffec9, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_220:
	nop
	setx 0xfffff094fffff179, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x69aa518fe71f11e7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_40_222:
	nop
	ta T_CHANGE_HPRIV
	set 0x7304a8d3, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_40_223:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 267: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_40_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d910011  ! 268: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
donret_40_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_225-donret_40_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00079c33 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x2acac001  ! 1: BRNZ	brnz,a,pt	%r11,<label_0xac001>
	done
donretarg_40_225:
	.word 0xda6fe12f  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x012f]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_226) + 48, 16, 16)) -> intp(6,0,28)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_226)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,28)
#else
	setx 0xc8a6e01a8856ae3d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe040  ! 272: LDDA_I	ldda	[%r31, + 0x0040] %asi, %r13
intveclr_40_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc798b0a47de2a172, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_40_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc01, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97702db8  ! 274: POPC_I	popc	0x0db8, %r11
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_40_230:
	.word 0x8198305e  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x105e, %hpstate
	.word 0xe4800b40  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
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
    brnz %r10, sma_40_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 278: CASA_R	casa	[%r31] %asi, %r20, %r18
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon2_40_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc014  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fc2c0  ! 280: LDDFA_R	ldda	[%r31, %r0], %f0
vahole_40_233:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe080  ! 281: STDFA_I	stda	%f0, [0x0080, %r31]
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
    brnz %r10, sma_40_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 282: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_lsu_40_235:
	nop
	ta T_CHANGE_HPRIV
	set 0xe08feb77, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdf20  ! 284: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d903069  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x1069, %pstate
memptr_40_237:
	set user_data_start, %r31
	.word 0x85852ffd  ! 286: WRCCR_I	wr	%r20, 0x0ffd, %ccr
memptr_40_238:
	set 0x60740000, %r31
	.word 0x858061c2  ! 287: WRCCR_I	wr	%r1, 0x01c2, %ccr
splash_decr_40_239:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7844009  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r9, %-
	bpos,a	 skip_40_240
	fbuge skip_40_240
.align 32
skip_40_240:
	.word 0x99b184c1  ! 289: FCMPNE32	fcmpne32	%d6, %d32, %r12
intveclr_40_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0e8533f90a88ce03, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e008  ! 291: CASA_R	casa	[%r31] %asi, %r8, %r10
	.word 0x8d802000  ! 292: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_40_243:
	nop
	setx 0xfffffe58fffff569, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_244) + 8, 16, 16)) -> intp(1,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_244)&0xffffffff)  + 8, 16, 16)) -> intp(1,0,9)
#else
	setx 0x14816048dc185ae2, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_40_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 295: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_40_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d910012  ! 296: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0x93524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_40_247:
	nop
	setx 0xfffff4e7fffff0eb, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_40_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902005  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	setx 0xa1039d0907708953, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbu skip_40_250
	.word 0xa3a1c9cc  ! 1: FDIVd	fdivd	%f38, %f12, %f48
.align 1024
skip_40_250:
	.word 0xc36cbab3  ! 301: PREFETCH_I	prefetch	[%r18 + 0xfffffab3], #one_read
ibp_40_251:
	nop
	.word 0xc1bfe160  ! 302: STDFA_I	stda	%f0, [0x0160, %r31]
dvapa_40_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe91, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1702f31  ! 303: POPC_I	popc	0x0f31, %r16
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
    brnz %r10, cwq_40_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_253
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
cwq_40_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 304: RDPC	rd	%pc, %r16
pmu_40_254:
	nop
	setx 0xfffff015fffff132, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_255:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_40_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_256
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
cwq_40_256:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 307: RDPC	rd	%pc, %r8
splash_hpstate_40_257:
	ta T_CHANGE_NONHPRIV
	.word 0x81982055  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0055, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0xa9a00166  ! 310: FABSq	dis not found

	.word 0x91d020b3  ! 311: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_40_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc7ec4a59045a5089, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_40_260:
	nop
	.word 0xc1bfe180  ! 313: STDFA_I	stda	%f0, [0x0180, %r31]
jmptr_40_261:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d934013  ! 315: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
ibp_40_263:
	nop
	.word 0xe1bfe1e0  ! 316: STDFA_I	stda	%f16, [0x01e0, %r31]
	.word 0xe127e03c  ! 317: STF_I	st	%f16, [0x003c, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_40_264:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe13fc013  ! 319: STDF_R	std	%f16, [%r19, %r31]
iaw_40_265:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_265:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_265
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_265:
    brnz %r16, iaw_wait40_265
    ld [%r23], %r16
    ba iaw_startwait40_265
    mov 0x40, %r16
continue_iaw_40_265:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_265:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_265
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_265:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_265
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_265:
	mov 0x38, %r18
iaw1_40_265:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 320: STDFA_R	stda	%f0, [%r0, %r31]
vahole_40_266:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fc3e0  ! 321: LDDFA_R	ldda	[%r31, %r0], %f0
intveclr_40_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd63d08b9c74dba02, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_268:
	nop
	setx 0xfffff044fffffd0d, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a000d1  ! 324: FNEGd	fnegd	%f48, %f40
intveclr_40_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x76d45853a6ddf173, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_40_270:
	tsubcctv %r4, 0x15e2, %r20
	.word 0xd807e11c  ! 326: LDUW_I	lduw	[%r31 + 0x011c], %r12
	setx 0xdceb3631312125c8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_40_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f803e03  ! 1: SIR	sir	0x1e03
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe160  ! 328: STDFA_I	stda	%f0, [0x0160, %r31]
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
    brnz %r10, sma_40_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e011  ! 329: CASA_R	casa	[%r31] %asi, %r17, %r10
dvapa_40_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd2e, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3eac022  ! 330: PREFETCHA_R	prefetcha	[%r11, %r2] 0x01, #one_read
vahole_40_275:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3ec4026  ! 331: PREFETCHA_R	prefetcha	[%r17, %r6] 0x01, #one_read
dvapa_40_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcf3, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdb60  ! 332: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_40_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 333: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x95520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_40_278:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 335: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9170316e  ! 336: POPC_I	popc	0x116e, %r8
vahole_40_279:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x997029b6  ! 337: POPC_I	popc	0x09b6, %r12
jmptr_40_280:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9035ce  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x15ce, %pstate
ceter_40_282:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x91410000  ! 340: RDTICK	rd	%tick, %r8
iaw_40_283:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_283:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_283
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_283:
    brnz %r16, iaw_wait40_283
    ld [%r23], %r16
    ba iaw_startwait40_283
    mov 0x40, %r16
continue_iaw_40_283:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_283:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_283
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_283:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_283
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_283:
	mov 0x38, %r18
iaw1_40_283:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a53  ! 341: FCMPd	fcmpd	%fcc<n>, %f48, %f50
	.word 0xd847e048  ! 342: LDSW_I	ldsw	[%r31 + 0x0048], %r12
	.word 0x9194c00c  ! 343: WRPR_PIL_R	wrpr	%r19, %r12, %pil
	.word 0xd837e0ae  ! 344: STH_I	sth	%r12, [%r31 + 0x00ae]
ibp_40_285:
	nop
	.word 0xa7b4c7d4  ! 345: PDIST	pdistn	%d50, %d20, %d50
	bvs,a	 skip_40_286
	bleu  	 skip_40_286
.align 512
skip_40_286:
	.word 0x93a149c5  ! 346: FDIVd	fdivd	%f36, %f36, %f40
	.word 0xd337e181  ! 347: STQF_I	-	%f9, [0x0181, %r31]
donret_40_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_287-donret_40_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b6dddd | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x15f7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	done
donretarg_40_287:
	.word 0xd2ffe0b8  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x00b8] %asi
	.word 0xd28008a0  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d802004  ! 350: WRFPRS_I	wr	%r0, 0x0004, %fprs
dvapa_40_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0x952, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd31fc008  ! 351: LDDF_R	ldd	[%r31, %r8], %f9
	.word 0xa3a00168  ! 352: FABSq	dis not found

iaw_40_290:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_290:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_290
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_290:
    brnz %r16, iaw_wait40_290
    ld [%r23], %r16
    ba iaw_startwait40_290
    mov 0x40, %r16
continue_iaw_40_290:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_290:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_290
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_290:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_290
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_290:
	mov 0x38, %r18
iaw1_40_290:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe060  ! 353: STDFA_I	stda	%f0, [0x0060, %r31]
brcommon2_40_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00d  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfda00  ! 354: STDFA_R	stda	%f0, [%r0, %r31]
donret_40_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_292-donret_40_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0064deea | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cd9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_292:
	.word 0x99a349d4  ! 355: FDIVd	fdivd	%f44, %f20, %f12
pmu_40_293:
	nop
	setx 0xfffff578fffffd58, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_40_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_294-donret_40_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00db036c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1347, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_294:
	.word 0xe46fe1d3  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x01d3]
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
    brnz %r10, sma_40_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00b  ! 358: CASA_R	casa	[%r31] %asi, %r11, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_40_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_296
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
cwq_40_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 360: RDPC	rd	%pc, %r18
splash_cmpr_40_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 361: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_40_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d930006  ! 362: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
brcommon3_40_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c011  ! 1: STQF_R	-	%f13, [%r17, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdbe7e009  ! 363: CASA_R	casa	[%r31] %asi, %r9, %r13
intveclr_40_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0x825aa366f00bfc77, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_40_302:
	nop
	ta T_CHANGE_HPRIV
	set 0xd53203d1, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_40_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_303
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
cwq_40_303:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 367: RDPC	rd	%pc, %r13
    set 0x403, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b507c3  ! 368: PDIST	pdistn	%d20, %d34, %d50
splash_lsu_40_304:
	nop
	ta T_CHANGE_HPRIV
	set 0x70dca7a8, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_40_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
dvapa_40_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcbb, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac8a52  ! 371: FCMPd	fcmpd	%fcc<n>, %f18, %f18
pmu_40_307:
	nop
	setx 0xfffff601fffff3b3, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_308:
	nop
	setx 0xfffff608fffff811, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_40_309:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 374: STDFA_R	stda	%f16, [%r0, %r31]
tagged_40_310:
	tsubcctv %r8, 0x1f33, %r3
	.word 0xd407e111  ! 375: LDUW_I	lduw	[%r31 + 0x0111], %r10
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
    brnz %r10, cwq_40_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_311
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
cwq_40_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 376: RDPC	rd	%pc, %r19
trapasi_40_312:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 377: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	.word 0x8d90392d  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x192d, %pstate
iaw_40_314:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_314:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_314
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_314:
    brnz %r16, iaw_wait40_314
    ld [%r23], %r16
    ba iaw_startwait40_314
    mov 0x40, %r16
continue_iaw_40_314:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_314:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_314
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_314:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_314
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_314:
	mov 0x38, %r18
iaw1_40_314:
	best_set_reg(0x00000000e1a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd83ff33a  ! 379: STD_I	std	%r12, [%r31 + 0xfffff33a]
mondo_40_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 380: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
fpinit_40_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 381: FDIVd	fdivd	%f0, %f4, %f6
dvapa_40_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf32, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe160  ! 382: STDFA_I	stda	%f0, [0x0160, %r31]
	.word 0x8d90335d  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x135d, %pstate
pmu_40_319:
	nop
	setx 0xfffffcdefffff11e, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e108  ! 385: LDSHA_I	ldsha	[%r31, + 0x0108] %asi, %r12
	.word 0x8d902fff  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x0fff, %pstate
fpinit_40_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 387: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe19fdc00  ! 388: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x99b44544  ! 389: FCMPEQ16	fcmpeq16	%d48, %d4, %r12
donret_40_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_322-donret_40_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0086456d | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x150c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_322:
	.word 0xe8ffe04d  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x004d] %asi
	.word 0xa745c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xab830014  ! 392: WR_CLEAR_SOFTINT_R	wr	%r12, %r20, %clear_softint
	setx 0x441ad17cd25cb22e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_40_324:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_324:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_324
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_324:
    brnz %r16, iaw_wait40_324
    ld [%r23], %r16
    ba iaw_startwait40_324
    mov 0x40, %r16
continue_iaw_40_324:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_324:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_324
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_324:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_324
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_324:
	mov 0x38, %r18
iaw2_40_324:
	rdpr %tba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc00d  ! 394: STDF_R	std	%f19, [%r13, %r31]
	setx 0x2da05d015dfa926e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3524000  ! 396: RDPR_CWP	rdpr	%cwp, %r17
dvapa_40_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0x941, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfde00  ! 397: STDFA_R	stda	%f0, [%r0, %r31]
fpinit_40_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 398: FDIVd	fdivd	%f0, %f4, %f4
iaw_40_329:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait40_329:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_40_329
    mov (~0x40&0xf0), %r16
    ld [%r23], %r16
iaw_wait40_329:
    brnz %r16, iaw_wait40_329
    ld [%r23], %r16
    ba iaw_startwait40_329
    mov 0x40, %r16
continue_iaw_40_329:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_40_329:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_40_329
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_40_329:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_40_329
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit40_329:
	mov 0x38, %r18
iaw1_40_329:
	best_set_reg(0x00000000e0a00000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc013  ! 399: LDDF_R	ldd	[%r31, %r19], %f19
unsupttte_40_330:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a509a8  ! 400: FDIVs	fdivs	%f20, %f8, %f12
vahole_40_331:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fdb60  ! 401: LDDFA_R	ldda	[%r31, %r0], %f16
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
	.word 0xe8800c80  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r20
	.word 0x91a0016a  ! 2: FABSq	dis not found

ibp_20_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe29fc02a  ! 3: LDDA_R	ldda	[%r31, %r10] 0x01, %r17
donret_20_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_2-donret_20_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c71481 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd14, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	retry
donretarg_20_2:
	.word 0xe26fe11c  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x011c]
	setx 0x4613d98bd6d80ebc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d914002  ! 6: WRPR_WSTATE_R	wrpr	%r5, %r2, %wstate
pmu_20_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7c0fffff33b, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x96fa7616  ! 8: SDIVcc_I	sdivcc 	%r9, 0xfffff616, %r11
splash_cmpr_20_6:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_20_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_7
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
cwq_20_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 10: RDPC	rd	%pc, %r16
pmu_20_8:
	nop
	setx 0xfffff253fffff54e, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a00172  ! 12: FABSq	dis not found

ibp_20_10:
	nop
	.word 0xe19fd920  ! 13: LDDFA_R	ldda	[%r31, %r0], %f16
trapasi_20_11:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2904980  ! 14: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r17
splash_cmpr_20_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 15: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1703a91  ! 16: POPC_I	popc	0x1a91, %r16
pmu_20_14:
	nop
	setx 0xfffff946fffff880, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902c6e  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x0c6e, %pstate
splash_cmpr_20_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 19: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_20_17:
	nop
	ta T_CHANGE_HPRIV
	set 0xb4569103, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_20_18:
	nop
	.word 0xa5a1c9ad  ! 22: FDIVs	fdivs	%f7, %f13, %f18
fpinit_20_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 23: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_20_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d90400d  ! 24: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
intveclr_20_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xba8d7b8b7bcb6f85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff760fffff5f7, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_20_23:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_20_24:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x4c) 
	.word 0xdad84980  ! 28: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
	.word 0x8780208a  ! 29: WRASI_I	wr	%r0, 0x008a, %asi
ibp_20_25:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdc00  ! 30: LDDFA_R	ldda	[%r31, %r0], %f0
dvapa_20_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa7f, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc00d  ! 31: LDDF_R	ldd	[%r31, %r13], %f13
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
    brnz %r10, cwq_20_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_27
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
cwq_20_27:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 32: RDPC	rd	%pc, %r8
	.word 0x8d903e38  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x1e38, %pstate
	.word 0xa3a00167  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_30) + 48, 16, 16)) -> intp(6,0,8)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_30)&0xffffffff)  + 48, 16, 16)) -> intp(6,0,8)
#else
	setx 0x5abfd742eeb9e136, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_20_31:
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
	.word 0xa3b50992  ! 36: BSHUFFLE	fmovc32	%d20, %d18, %d48
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd44fe068  ! 38: LDSB_I	ldsb	[%r31 + 0x0068], %r10
splash_cmpr_20_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 39: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x5b416c71c5729867, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_20_34:
	nop
	setx 0xfffffb0dfffff641, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_35:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e0a8  ! 44: LDSWA_I	ldswa	[%r31, + 0x00a8] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_20_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 46: FCMPd	fcmpd	%fcc<n>, %f0, %f4
cwp_20_37:
    set user_data_start, %o7
	.word 0x93902007  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
ibp_20_38:
	nop
	.word 0xd49fc032  ! 48: LDDA_R	ldda	[%r31, %r18] 0x01, %r10
pmu_20_39:
	nop
	setx 0xfffff3b9fffff91c, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_20_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 50: FCMPLE32	fcmple32	%d0, %d4, %r6
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
    brnz %r10, cwq_20_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_41
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
cwq_20_41:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 51: RDPC	rd	%pc, %r17
	.word 0x91940007  ! 52: WRPR_PIL_R	wrpr	%r16, %r7, %pil
mondo_20_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d90c001  ! 53: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
dvapa_20_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe17, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd920  ! 54: STDFA_R	stda	%f16, [%r0, %r31]
ibp_20_45:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 55: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_20_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 56: CASA_R	casa	[%r31] %asi, %r13, %r20
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d90352d  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x152d, %pstate
splash_lsu_20_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x36e516c7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target2, %r18, %r27
	.word 0xa7b44494  ! 59: FCMPLE32	fcmple32	%d48, %d20, %r19
splash_hpstate_20_50:
	ta T_CHANGE_NONHPRIV
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81982455  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0455, %hpstate
	setx vahole_target0, %r18, %r27
	.word 0xc19fdc00  ! 61: LDDFA_R	ldda	[%r31, %r0], %f0
splash_lsu_20_52:
	nop
	ta T_CHANGE_HPRIV
	set 0xb7d897ca, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_20_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_53
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
cwq_20_53:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 63: RDPC	rd	%pc, %r12
cwp_20_54:
    set user_data_start, %o7
	.word 0x93902006  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	setx 0xf1c16e2acd91624d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target1, %r18, %r27
	.word 0xd49fc034  ! 66: LDDA_R	ldda	[%r31, %r20] 0x01, %r10
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_20_58:
	tsubcctv %r4, 0x1640, %r10
	.word 0xd407e1eb  ! 68: LDUW_I	lduw	[%r31 + 0x01eb], %r10
jmptr_20_59:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d92c014  ! 70: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
donret_20_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_61-donret_20_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0033836e | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x174f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_61:
	.word 0xd4ffe174  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x0174] %asi
ibp_20_62:
	nop
	.word 0x87ac0a44  ! 72: FCMPd	fcmpd	%fcc<n>, %f16, %f4
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d902a25  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x0a25, %pstate
dvapa_20_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc54, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 74: LDDFA_R	ldda	[%r31, %r0], %f0
	setx vahole_target1, %r18, %r27
	.word 0xa1b287d1  ! 75: PDIST	pdistn	%d10, %d48, %d16
pmu_20_66:
	nop
	setx 0xffffff72fffff29a, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_20_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_67-donret_20_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000afcf9 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x167c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_67:
	.word 0xd2ffe0cc  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x00cc] %asi
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
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 78: RDPC	rd	%pc, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_20_70:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe4d04a00  ! 80: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r18
tglhtw_20_71:
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
	.word 0xa1b50991  ! 81: BSHUFFLE	fmovc32	%d20, %d48, %d16
pmu_20_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8a8fffff469, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_20_73:
	taddcctv %r16, 0x141f, %r8
	.word 0xd607e159  ! 83: LDUW_I	lduw	[%r31 + 0x0159], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_74) + 56, 16, 16)) -> intp(7,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_74)&0xffffffff)  + 56, 16, 16)) -> intp(7,0,27)
#else
	setx 0x78556194436de3bf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 85: Tcc_I	ta	icc_or_xcc, %r0 + 50
    set 0x594, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407d2  ! 86: PDIST	pdistn	%d16, %d18, %d40
	.word 0x91934007  ! 87: WRPR_PIL_R	wrpr	%r13, %r7, %pil
	.word 0x91920012  ! 88: WRPR_PIL_R	wrpr	%r8, %r18, %pil
pmu_20_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff32bfffff898, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
	setx vahole_target3, %r18, %r27
	.word 0xd23fed78  ! 91: STD_I	std	%r9, [%r31 + 0x0d78]
ibp_20_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3a509a1  ! 92: FDIVs	fdivs	%f20, %f1, %f17
splash_lsu_20_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x3bb1bdf0, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_81:
	nop
	ta T_CHANGE_HPRIV
	set 0x8024c17f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_20_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x6ed0b303, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_83:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_20_85:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8198343d  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x143d, %hpstate
	.word 0xe01fe0f8  ! 100: LDD_I	ldd	[%r31 + 0x00f8], %r16
	.word 0xe09fe0f8  ! 101: LDDA_I	ldda	[%r31, + 0x00f8] %asi, %r16
ibp_20_86:
	nop
	.word 0xe19fc3e0  ! 102: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x93d020b2  ! 103: Tcc_I	tne	icc_or_xcc, %r0 + 178
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e013  ! 104: CASA_R	casa	[%r31] %asi, %r19, %r16
	.word 0x9194400c  ! 105: WRPR_PIL_R	wrpr	%r17, %r12, %pil
pmu_20_89:
	nop
	setx 0xfffff561fffff3eb, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d902957  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x0957, %pstate
intveclr_20_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0e4ef00f25af4a1c, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_20_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe9118002  ! 1: LDQF_R	-	[%r6, %r2], %f20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfc3e0  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
pmu_20_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffaa3fffff461, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe8dfc02d  ! 112: LDXA_R	ldxa	[%r31, %r13] 0x01, %r20
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
dvapa_20_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x89e, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa9b18490  ! 114: FCMPLE32	fcmple32	%d6, %d16, %r20
splash_cmpr_20_97:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx vahole_target1, %r18, %r27
	.word 0xd31fc00b  ! 116: LDDF_R	ldd	[%r31, %r11], %f9
	setx vahole_target0, %r18, %r27
	.word 0xc1bfc2c0  ! 117: STDFA_R	stda	%f0, [%r0, %r31]
mondo_20_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d95000d  ! 118: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
trapasi_20_101:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd2c84a00  ! 119: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r9
splash_cmpr_20_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 120: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_20_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 121: CASA_R	casa	[%r31] %asi, %r9, %r9
dvapa_20_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf6f, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5703057  ! 122: POPC_I	popc	0x1057, %r18
splash_hpstate_20_105:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8198201f  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001f, %hpstate
	.word 0xe19fc3e0  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_20_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 125: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
splash_tba_20_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x99500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_20_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa3a00546  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
splash_hpstate_20_110:
	.word 0x81983699  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1699, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fe140  ! 131: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xa5a00170  ! 132: FABSq	dis not found

	setx 0xa7b9f0e21ccd9619, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8217a  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x017a] %asi, #one_read
	.word 0x8d90322b  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x122b, %pstate
	.word 0xc32fc000  ! 136: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_20_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0x893cf84ea0dd9d18, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_118:
	nop
	setx 0xfffff118fffff974, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_20_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99703be8  ! 139: POPC_I	popc	0x1be8, %r12
splash_lsu_20_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x62363462, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff792fffff5a5, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9b50493  ! 142: FCMPLE32	fcmple32	%d20, %d50, %r20
splash_cmpr_20_123:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 143: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_20_124:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 145: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_20_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x506d795c834638ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_20_127:
	set 0x60140000, %r31
	.word 0x8584797e  ! 148: WRCCR_I	wr	%r17, 0x197e, %ccr
	.word 0x87802083  ! 149: WRASI_I	wr	%r0, 0x0083, %asi
intveclr_20_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0x69a92d419fc333f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b40  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
mondo_20_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d95000c  ! 152: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	setx vahole_target3, %r18, %r27
	.word 0xc19fdb60  ! 153: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe08fe170  ! 154: LDUBA_I	lduba	[%r31, + 0x0170] %asi, %r16
	.word 0x91d02034  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 52
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
    brnz %r10, cwq_20_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_131
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
cwq_20_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 156: RDPC	rd	%pc, %r18
ibp_20_132:
	nop
	.word 0xa9b447c9  ! 157: PDIST	pdistn	%d48, %d40, %d20
splash_lsu_20_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x07cf7c66, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	setx vahole_target1, %r18, %r27
	.word 0xe1bfc3e0  ! 160: STDFA_R	stda	%f16, [%r0, %r31]
brcommon1_20_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3ed0025  ! 161: PREFETCHA_R	prefetcha	[%r20, %r5] 0x01, #one_read
splash_hpstate_20_136:
	.word 0x81982616  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0616, %hpstate
	.word 0xd497e000  ! 163: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe1e0  ! 164: STDFA_I	stda	%f0, [0x01e0, %r31]
pmu_20_138:
	nop
	setx 0xfffffdfdfffffca3, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target0, %r18, %r27
	.word 0xc32fc010  ! 166: STXFSR_R	st-sfr	%f1, [%r16, %r31]
intveclr_20_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1ed55b07ae84d553, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027b9  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x07b9, %pstate
	.word 0x87802080  ! 169: WRASI_I	wr	%r0, 0x0080, %asi
ibp_20_142:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x91b447ca  ! 170: PDIST	pdistn	%d48, %d10, %d8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_20_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 172: FDIVs	fdivs	%f0, %f4, %f4
dvapa_20_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd7a, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc030  ! 173: STDA_R	stda	%r18, [%r31 + %r16] 0x01
intveclr_20_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4225fb3760394259, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe158  ! 175: LDDF_I	ldd	[%r31, 0x0158], %f18
donret_20_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_147-donret_20_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004e28c8 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1a5c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_147:
	.word 0xe4ffe178  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x0178] %asi
	.word 0xc19fe180  ! 177: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0x93d020b2  ! 178: Tcc_I	tne	icc_or_xcc, %r0 + 178
fpinit_20_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 179: FCMPLE32	fcmple32	%d0, %d4, %r4
splash_cmpr_20_149:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 180: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_20_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_150
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
cwq_20_150:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 181: RDPC	rd	%pc, %r8
	.word 0x95b30483  ! 182: FCMPLE32	fcmple32	%d12, %d34, %r10
	.word 0x97a00171  ! 183: FABSq	dis not found

	setx vahole_target2, %r18, %r27
	.word 0xc1bfe120  ! 184: STDFA_I	stda	%f0, [0x0120, %r31]
mondo_20_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 185: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xc1bfc2c0  ! 186: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_20_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00a  ! 187: CASA_R	casa	[%r31] %asi, %r10, %r13
pmu_20_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff368fffff5e4, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_20_158:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x9bb7c4d2  ! 1: FCMPNE32	fcmpne32	%d62, %d18, %r13
	normalw
	.word 0x99458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x91944010  ! 190: WRPR_PIL_R	wrpr	%r17, %r16, %pil
splash_cmpr_20_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 191: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_20_161:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_20_162:
	nop
	.word 0xa7a149d2  ! 193: FDIVd	fdivd	%f36, %f18, %f50
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_20_164:
	nop
	.word 0xc1bfe0e0  ! 195: STDFA_I	stda	%f0, [0x00e0, %r31]
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
    brnz %r10, sma_20_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00c  ! 196: CASA_R	casa	[%r31] %asi, %r12, %r20
splash_tba_20_166:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_20_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x70e774f0ff81e266, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_20_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 199: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x97a00171  ! 200: FABSq	dis not found

trapasi_20_170:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0c84980  ! 201: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r16
splash_tba_20_171:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e160  ! 203: LDQFA_I	-	[%r31, 0x0160], %f16
	.word 0x87802010  ! 204: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa5454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
memptr_20_172:
	set 0x60740000, %r31
	.word 0x8581ae67  ! 206: WRCCR_I	wr	%r6, 0x0e67, %ccr
splash_cmpr_20_173:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 207: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_20_175:
	nop
	setx 0xfffff946fffff306, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_20_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_176
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
cwq_20_176:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 210: RDPC	rd	%pc, %r9
	.word 0x83d020b4  ! 211: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
	setx vahole_target2, %r18, %r27
	.word 0xc3ea0034  ! 213: PREFETCHA_R	prefetcha	[%r8, %r20] 0x01, #one_read
	.word 0xda8008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_20_179:
	nop
	setx 0xfffffda2fffff479, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_20_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda9fc02b  ! 216: LDDA_R	ldda	[%r31, %r11] 0x01, %r13
trapasi_20_181:
	nop
	mov 0x3e0, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 217: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
pmu_20_182:
	nop
	setx 0xfffff975fffff388, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_20_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_183-donret_20_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c2e785 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17cc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x2eca8001  ! 1: BRGEZ	brgez,a,pt	%r10,<label_0xa8001>
	done
donretarg_20_183:
	.word 0xda6fe16f  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x016f]
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
    brnz %r10, sma_20_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r13
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
    brnz %r10, cwq_20_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_185
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
cwq_20_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 221: RDPC	rd	%pc, %r18
ibp_20_186:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x93a109b2  ! 222: FDIVs	fdivs	%f4, %f18, %f9
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d903238  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x1238, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_20_189:
	nop
	.word 0xc1bfe160  ! 226: STDFA_I	stda	%f0, [0x0160, %r31]
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_20_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1e7e00d  ! 228: CASA_R	casa	[%r31] %asi, %r13, %r16
	.word 0xa1902004  ! 229: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_cmpr_20_191:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 230: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_20_192:
	nop
	ta T_CHANGE_HPRIV
	set 0x87e81f59, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xa17022e8  ! 232: POPC_I	popc	0x02e8, %r16
jmptr_20_194:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_20_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcb8, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc033  ! 234: STDA_R	stda	%r17, [%r31 + %r19] 0x01
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_196:
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
    brnz %r10, sma_20_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 236: CASA_R	casa	[%r31] %asi, %r13, %r17
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
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 237: CASA_R	casa	[%r31] %asi, %r16, %r17
	setx 0x8a6c63ecd20d8357, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_20_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe7124011  ! 1: LDQF_R	-	[%r9, %r17], %f19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd920  ! 239: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_20_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00a  ! 240: CASA_R	casa	[%r31] %asi, %r10, %r17
	.word 0x87802082  ! 241: WRASI_I	wr	%r0, 0x0082, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_20_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_202-donret_20_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bae9bd | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc9f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_202:
	.word 0xa5a189cd  ! 243: FDIVd	fdivd	%f6, %f44, %f18
	.word 0xe0dfe0a8  ! 244: LDXA_I	ldxa	[%r31, + 0x00a8] %asi, %r16
pmu_20_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdfafffffb36, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_20_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_20_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7d5fffffb28, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_20_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_206
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
cwq_20_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 248: RDPC	rd	%pc, %r16
donret_20_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_207-donret_20_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002898da | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x10df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_207:
	.word 0x95a249d3  ! 249: FDIVd	fdivd	%f40, %f50, %f10
ibp_20_208:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x997037fe  ! 250: POPC_I	popc	0x17fe, %r12
fpinit_20_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 251: FDIVd	fdivd	%f0, %f4, %f4
change_to_randtl_20_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_210:
	.word 0x8f902001  ! 252: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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
    brnz %r10, cwq_20_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_211
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
cwq_20_211:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 253: RDPC	rd	%pc, %r18
memptr_20_212:
	set 0x60340000, %r31
	.word 0x858362a7  ! 254: WRCCR_I	wr	%r13, 0x02a7, %ccr
dvapa_20_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa64, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93a509ab  ! 255: FDIVs	fdivs	%f20, %f11, %f9
donret_20_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_214-donret_20_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ee240f | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x657, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_214:
	.word 0x9ba309d2  ! 256: FDIVd	fdivd	%f12, %f18, %f44
	.word 0xda3fe156  ! 257: STD_I	std	%r13, [%r31 + 0x0156]
dvapa_20_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdc3, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc028  ! 258: LDXA_R	ldxa	[%r31, %r8] 0x01, %r13
	.word 0xc19fc2c0  ! 259: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_20_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 260: CASA_R	casa	[%r31] %asi, %r17, %r13
pmu_20_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff40ffffff722, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_20_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff67afffff332, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_220:
	nop
	setx 0xfffff0d6fffffc38, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xd81cdc839548fc83, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_20_222:
	nop
	ta T_CHANGE_HPRIV
	set 0xbba6fcb8, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_20_223:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdb60  ! 267: STDFA_R	stda	%f0, [%r0, %r31]
mondo_20_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 268: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
donret_20_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_225-donret_20_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008e9554 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x100f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	done
donretarg_20_225:
	.word 0xda6fe029  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x0029]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_226) + 48, 16, 16)) -> intp(1,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_226)&0xffffffff)  + 48, 16, 16)) -> intp(1,0,27)
#else
	setx 0x032d288042189bc5, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe108  ! 272: LDDA_I	ldda	[%r31, + 0x0108] %asi, %r13
intveclr_20_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8db4e6b47801c974, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_20_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdf9, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1a489b1  ! 274: FDIVs	fdivs	%f18, %f17, %f16
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_20_230:
	.word 0x8198271d  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071d, %hpstate
	.word 0xe48008a0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_20_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00c  ! 278: CASA_R	casa	[%r31] %asi, %r12, %r18
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon2_20_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe9150013  ! 1: LDQF_R	-	[%r20, %r19], %f20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfdc00  ! 280: STDFA_R	stda	%f0, [%r0, %r31]
	setx vahole_target0, %r18, %r27
	.word 0xc1bfdc00  ! 281: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_20_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e012  ! 282: CASA_R	casa	[%r31] %asi, %r18, %r12
splash_lsu_20_235:
	nop
	ta T_CHANGE_HPRIV
	set 0xb9a10196, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdf20  ! 284: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d902635  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0635, %pstate
memptr_20_237:
	set user_data_start, %r31
	.word 0x8581bc21  ! 286: WRCCR_I	wr	%r6, 0x1c21, %ccr
memptr_20_238:
	set 0x60740000, %r31
	.word 0x85853056  ! 287: WRCCR_I	wr	%r20, 0x1056, %ccr
	.word 0xa7840011  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r17, %-
	.word 0x9bb044d3  ! 289: FCMPNE32	fcmpne32	%d32, %d50, %r13
intveclr_20_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0x54228b7613421af9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 291: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0x8d802000  ! 292: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_20_243:
	nop
	setx 0xfffffd95fffff52b, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_244) + 24, 16, 16)) -> intp(4,0,2)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_244)&0xffffffff)  + 24, 16, 16)) -> intp(4,0,2)
#else
	setx 0xcee0b5fea1584d3b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_20_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 295: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_20_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94c005  ! 296: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0x9b524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_20_247:
	nop
	setx 0xfffffbaafffff6de, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_20_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	setx 0x732a63f282a5bab0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87a84a49  ! 301: FCMPd	fcmpd	%fcc<n>, %f32, %f40
ibp_20_251:
	nop
	.word 0xc19fc3e0  ! 302: LDDFA_R	ldda	[%r31, %r0], %f0
dvapa_20_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0x941, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87acca4b  ! 303: FCMPd	fcmpd	%fcc<n>, %f50, %f42
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
    brnz %r10, cwq_20_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_253
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
cwq_20_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 304: RDPC	rd	%pc, %r17
pmu_20_254:
	nop
	setx 0xfffffe9bfffff6fe, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_255:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_20_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_256
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
cwq_20_256:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 307: RDPC	rd	%pc, %r13
splash_hpstate_20_257:
	ta T_CHANGE_NONHPRIV
	.word 0x819827dd  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dd, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0xa3a00166  ! 310: FABSq	dis not found

	.word 0x93d02033  ! 311: Tcc_I	tne	icc_or_xcc, %r0 + 51
intveclr_20_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd1852e0bc9ffeab3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_20_260:
	nop
	.word 0xe1bfc2c0  ! 313: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_20_261:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d910010  ! 315: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
ibp_20_263:
	nop
	.word 0xc1bfe060  ! 316: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xe127e076  ! 317: STF_I	st	%f16, [0x0076, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_20_264:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe09fc02b  ! 319: LDDA_R	ldda	[%r31, %r11] 0x01, %r16
	.word 0xc1bfd960  ! 320: STDFA_R	stda	%f0, [%r0, %r31]
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe180  ! 321: STDFA_I	stda	%f0, [0x0180, %r31]
intveclr_20_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd4b01bfcca033d46, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_268:
	nop
	setx 0xfffffe35fffff3bb, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a000d3  ! 324: FNEGd	fnegd	%f50, %f40
intveclr_20_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x99f743f57ab0a164, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_20_270:
	tsubcctv %r20, 0x1473, %r12
	.word 0xd807e155  ! 326: LDUW_I	lduw	[%r31 + 0x0155], %r12
	setx 0x33db18558fc75db7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_20_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfdf20  ! 328: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_20_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 329: CASA_R	casa	[%r31] %asi, %r18, %r10
dvapa_20_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0x82d, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a49  ! 330: FCMPd	fcmpd	%fcc<n>, %f48, %f40
	setx vahole_target3, %r18, %r27
	.word 0x9770361d  ! 331: POPC_I	popc	0x161d, %r11
dvapa_20_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0xce1, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 332: STDFA_R	stda	%f0, [%r0, %r31]
splash_cmpr_20_277:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 333: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x97520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_20_278:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 335: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x97702de2  ! 336: POPC_I	popc	0x0de2, %r11
	setx vahole_target1, %r18, %r27
	.word 0x87a88a51  ! 337: FCMPd	fcmpd	%fcc<n>, %f2, %f48
jmptr_20_280:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d902f9d  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x0f9d, %pstate
ceter_20_282:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x91410000  ! 340: RDTICK	rd	%tick, %r8
	.word 0x95a449b1  ! 341: FDIVs	fdivs	%f17, %f17, %f10
	.word 0xd847e068  ! 342: LDSW_I	ldsw	[%r31 + 0x0068], %r12
	.word 0x91914014  ! 343: WRPR_PIL_R	wrpr	%r5, %r20, %pil
	.word 0xd837e1f2  ! 344: STH_I	sth	%r12, [%r31 + 0x01f2]
ibp_20_285:
	nop
	.word 0x91b1c7c2  ! 345: PDIST	pdistn	%d38, %d2, %d8
	.word 0x87a9ca48  ! 346: FCMPd	fcmpd	%fcc<n>, %f38, %f8
	.word 0xd337e0f0  ! 347: STQF_I	-	%f9, [0x00f0, %r31]
donret_20_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_287-donret_20_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006ce9c6 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x756, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x24c8c001  ! 1: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
	done
donretarg_20_287:
	.word 0xd2ffe127  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x0127] %asi
	.word 0xd2800be0  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
	.word 0x8d802004  ! 350: WRFPRS_I	wr	%r0, 0x0004, %fprs
dvapa_20_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf1f, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 351: CASA_R	casa	[%r31] %asi, %r19, %r9
	.word 0x97a00166  ! 352: FABSq	dis not found

	.word 0xe19fdc00  ! 353: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon2_20_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe714000b  ! 1: LDQF_R	-	[%r16, %r11], %f19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfd920  ! 354: STDFA_R	stda	%f16, [%r0, %r31]
donret_20_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_292-donret_20_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009fe5a7 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd9, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_292:
	.word 0x95a249cc  ! 355: FDIVd	fdivd	%f40, %f12, %f10
pmu_20_293:
	nop
	setx 0xfffff474fffff7c5, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_20_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_294-donret_20_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001df3bd | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x115e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_294:
	.word 0xe46fe0c3  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x00c3]
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
    brnz %r10, sma_20_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 358: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_20_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_296
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
cwq_20_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 360: RDPC	rd	%pc, %r17
splash_cmpr_20_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 361: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_20_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d948005  ! 362: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
brcommon3_20_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c011  ! 1: STQF_R	-	%f13, [%r17, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda97c02b  ! 363: LDUHA_R	lduha	[%r31, %r11] 0x01, %r13
intveclr_20_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0158d7c31c4f01f6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_20_302:
	nop
	ta T_CHANGE_HPRIV
	set 0x81379529, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_20_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_303
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
cwq_20_303:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 367: RDPC	rd	%pc, %r16
    set 0x5f8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b407d0  ! 368: PDIST	pdistn	%d16, %d16, %d48
splash_lsu_20_304:
	nop
	ta T_CHANGE_HPRIV
	set 0xcb8a5901, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_20_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
dvapa_20_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xad6, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b307c5  ! 371: PDIST	pdistn	%d12, %d36, %d42
pmu_20_307:
	nop
	setx 0xfffff844fffff895, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_308:
	nop
	setx 0xfffffdbffffffb06, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xc1bfe1c0  ! 374: STDFA_I	stda	%f0, [0x01c0, %r31]
tagged_20_310:
	tsubcctv %r8, 0x1464, %r19
	.word 0xd407e096  ! 375: LDUW_I	lduw	[%r31 + 0x0096], %r10
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
    brnz %r10, cwq_20_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_311
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
cwq_20_311:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 376: RDPC	rd	%pc, %r11
trapasi_20_312:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 377: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d903947  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x1947, %pstate
	.word 0xd9e7e011  ! 379: CASA_R	casa	[%r31] %asi, %r17, %r12
mondo_20_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d928004  ! 380: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
fpinit_20_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 381: FCMPd	fcmpd	%fcc<n>, %f0, %f4
dvapa_20_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf3c, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc3e0  ! 382: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d9037c8  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x17c8, %pstate
pmu_20_319:
	nop
	setx 0xfffff684fffffc0e, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e118  ! 385: LDSHA_I	ldsha	[%r31, + 0x0118] %asi, %r12
	.word 0x8d902562  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x0562, %pstate
fpinit_20_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 387: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xc19fdf20  ! 388: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x95b48548  ! 389: FCMPEQ16	fcmpeq16	%d18, %d8, %r10
donret_20_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_322-donret_20_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f3ff13 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_322:
	.word 0xe8ffe035  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0035] %asi
	.word 0x9b45c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xab84c012  ! 392: WR_CLEAR_SOFTINT_R	wr	%r19, %r18, %clear_softint
	setx 0xa9c416d476e99d2f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe7e7e008  ! 394: CASA_R	casa	[%r31] %asi, %r8, %r19
	setx 0x7246a4966a1a3523, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5524000  ! 396: RDPR_CWP	<illegal instruction>
dvapa_20_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd48, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdf20  ! 397: STDFA_R	stda	%f0, [%r0, %r31]
fpinit_20_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 398: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xe6bfc030  ! 399: STDA_R	stda	%r19, [%r31 + %r16] 0x01
	.word 0xa1a4c9d1  ! 400: FDIVd	fdivd	%f50, %f48, %f16
	setx vahole_target2, %r18, %r27
	.word 0xe1bfe160  ! 401: STDFA_I	stda	%f16, [0x0160, %r31]
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
	.word 0xe88008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x93a0016a  ! 2: FABSq	dis not found

ibp_10_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc00d  ! 3: STDF_R	std	%f17, [%r13, %r31]
donret_10_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_2-donret_10_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0079e6fb | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1fd0, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_2:
	.word 0xe26fe052  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x0052]
	setx 0xeb51315f7d192fbb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90c010  ! 6: WRPR_WSTATE_R	wrpr	%r3, %r16, %wstate
pmu_10_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc0dfffff8b5, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x90fcb8ae  ! 8: SDIVcc_I	sdivcc 	%r18, 0xfffff8ae, %r8
splash_cmpr_10_6:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_10_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_7
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
cwq_10_7:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 10: RDPC	rd	%pc, %r9
pmu_10_8:
	nop
	setx 0xfffff65efffff8fc, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a00172  ! 12: FABSq	dis not found

ibp_10_10:
	nop
	.word 0xe1bfe040  ! 13: STDFA_I	stda	%f16, [0x0040, %r31]
trapasi_10_11:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2d04980  ! 14: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r17
splash_cmpr_10_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 15: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xc3ecc023  ! 16: PREFETCHA_R	prefetcha	[%r19, %r3] 0x01, #one_read
pmu_10_14:
	nop
	setx 0xffffff98fffff676, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d902515  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x0515, %pstate
splash_cmpr_10_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 19: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_10_17:
	nop
	ta T_CHANGE_HPRIV
	set 0xdb1cb08e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_10_18:
	nop
	.word 0xa1a289b2  ! 22: FDIVs	fdivs	%f10, %f18, %f16
fpinit_10_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 23: FDIVd	fdivd	%f0, %f4, %f6
mondo_10_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d950013  ! 24: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
intveclr_10_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x1bf31ab815b1990d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff1bcfffff0d2, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_10_23:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_10_24:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xdad84980  ! 28: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
	.word 0x87802014  ! 29: WRASI_I	wr	%r0, 0x0014, %asi
ibp_10_25:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdb60  ! 30: LDDFA_R	ldda	[%r31, %r0], %f0
dvapa_10_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa30, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc02d  ! 31: LDXA_R	ldxa	[%r31, %r13] 0x01, %r13
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
    brnz %r10, cwq_10_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_27
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
cwq_10_27:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 32: RDPC	rd	%pc, %r16
	.word 0x8d903350  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x1350, %pstate
	.word 0x9ba00172  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_30) + 24, 16, 16)) -> intp(0,0,14)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_30)&0xffffffff)  + 24, 16, 16)) -> intp(0,0,14)
#else
	setx 0xb9cb084a2fe920ec, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1b48994  ! 36: BSHUFFLE	fmovc32	%d18, %d20, %d16
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd44fe1b0  ! 38: LDSB_I	ldsb	[%r31 + 0x01b0], %r10
splash_cmpr_10_32:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x9ce28b29b014e300, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_10_34:
	nop
	setx 0xfffff530fffff01a, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_35:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e1f0  ! 44: LDSWA_I	ldswa	[%r31, + 0x01f0] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_10_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 46: FCMPLE32	fcmple32	%d0, %d4, %r6
cwp_10_37:
    set user_data_start, %o7
	.word 0x93902006  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
ibp_10_38:
	nop
	.word 0xc32fc013  ! 48: STXFSR_R	st-sfr	%f1, [%r19, %r31]
pmu_10_39:
	nop
	setx 0xffffffecfffffa53, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_10_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 50: FDIVd	fdivd	%f0, %f4, %f8
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
    brnz %r10, cwq_10_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_41
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
cwq_10_41:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 51: RDPC	rd	%pc, %r18
	.word 0x91950014  ! 52: WRPR_PIL_R	wrpr	%r20, %r20, %pil
mondo_10_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d924010  ! 53: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
dvapa_10_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc70, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 54: LDDFA_R	ldda	[%r31, %r0], %f0
ibp_10_45:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe160  ! 55: STDFA_I	stda	%f16, [0x0160, %r31]
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
    brnz %r10, sma_10_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00d  ! 56: CASA_R	casa	[%r31] %asi, %r13, %r20
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d903142  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x1142, %pstate
splash_lsu_10_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x44427d69, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target2, %r18, %r27
	.word 0xc3ed002d  ! 59: PREFETCHA_R	prefetcha	[%r20, %r13] 0x01, #one_read
splash_hpstate_10_50:
	ta T_CHANGE_NONHPRIV
	.word 0x2ccac001  ! 1: BRGZ	brgz,a,pt	%r11,<label_0xac001>
	.word 0x81982fd5  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd5, %hpstate
	setx vahole_target0, %r18, %r27
	.word 0xc1bfe080  ! 61: STDFA_I	stda	%f0, [0x0080, %r31]
splash_lsu_10_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x034cf9f2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_10_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_53
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
cwq_10_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 63: RDPC	rd	%pc, %r20
cwp_10_54:
    set user_data_start, %o7
	.word 0x93902004  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	setx 0x6f251b4c04c87ba0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target1, %r18, %r27
	.word 0xd497c032  ! 66: LDUHA_R	lduha	[%r31, %r18] 0x01, %r10
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_10_58:
	tsubcctv %r1, 0x1afe, %r9
	.word 0xd407e09a  ! 68: LDUW_I	lduw	[%r31 + 0x009a], %r10
jmptr_10_59:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c014  ! 70: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
donret_10_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_61-donret_10_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00908ed7 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x70c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_61:
	.word 0xd4ffe1e6  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x01e6] %asi
ibp_10_62:
	nop
	.word 0x93a509a5  ! 72: FDIVs	fdivs	%f20, %f5, %f9
	.word 0x22ca0001  ! 1: BRZ	brz,a,pt	%r8,<label_0xa0001>
	.word 0x8d903f71  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x1f71, %pstate
dvapa_10_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0x97c, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 74: STDFA_R	stda	%f0, [%r0, %r31]
	setx vahole_target1, %r18, %r27
	.word 0x97b40485  ! 75: FCMPLE32	fcmple32	%d16, %d36, %r11
pmu_10_66:
	nop
	setx 0xfffff670fffff886, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_10_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_67-donret_10_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0082009d | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	done
donretarg_10_67:
	.word 0xd2ffe07c  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x007c] %asi
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 78: RDPC	rd	%pc, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_10_70:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe4d04a00  ! 80: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r18
	.word 0x93b04991  ! 81: BSHUFFLE	fmovc32	%d32, %d48, %d40
pmu_10_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff8b7fffff31f, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_10_73:
	taddcctv %r11, 0x1d8f, %r16
	.word 0xd607e01c  ! 83: LDUW_I	lduw	[%r31 + 0x001c], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_74) + 40, 16, 16)) -> intp(6,0,5)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_74)&0xffffffff)  + 40, 16, 16)) -> intp(6,0,5)
#else
	setx 0x66fdaff276ac28e1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 85: Tcc_I	ta	icc_or_xcc, %r0 + 52
    set 0xcae, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb207d1  ! 86: PDIST	pdistn	%d8, %d48, %d44
	.word 0x9193400c  ! 87: WRPR_PIL_R	wrpr	%r13, %r12, %pil
	.word 0x91944007  ! 88: WRPR_PIL_R	wrpr	%r17, %r7, %pil
pmu_10_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff83cfffff643, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
	setx vahole_target3, %r18, %r27
	.word 0xd31fc011  ! 91: LDDF_R	ldd	[%r31, %r17], %f9
ibp_10_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea8028  ! 92: PREFETCHA_R	prefetcha	[%r10, %r8] 0x01, #one_read
splash_lsu_10_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xc958840c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_81:
	nop
	ta T_CHANGE_HPRIV
	set 0x5f08dd9a, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_10_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x334e112c, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_83:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_10_85:
	.word 0x24cd0001  ! 1: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0x8198249d  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049d, %hpstate
	.word 0xe01fe048  ! 100: LDD_I	ldd	[%r31 + 0x0048], %r16
	.word 0xe09fe078  ! 101: LDDA_I	ldda	[%r31, + 0x0078] %asi, %r16
ibp_10_86:
	nop
	.word 0xe1bfd960  ! 102: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02035  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 53
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 104: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x9190c014  ! 105: WRPR_PIL_R	wrpr	%r3, %r20, %pil
pmu_10_89:
	nop
	setx 0xfffff9bffffff555, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d903c55  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x1c55, %pstate
intveclr_10_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb42788878c90b208, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_10_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c974  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe100  ! 110: STDFA_I	stda	%f0, [0x0100, %r31]
pmu_10_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff862ffffff67, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe93fc00a  ! 112: STDF_R	std	%f20, [%r10, %r31]
	.word 0x99b504c4  ! 113: FCMPNE32	fcmpne32	%d20, %d4, %r12
dvapa_10_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0x827, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa3a109cb  ! 114: FDIVd	fdivd	%f4, %f42, %f48
splash_cmpr_10_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx vahole_target1, %r18, %r27
	.word 0xd297c034  ! 116: LDUHA_R	lduha	[%r31, %r20] 0x01, %r9
	setx vahole_target0, %r18, %r27
	.word 0xc1bfdf20  ! 117: STDFA_R	stda	%f0, [%r0, %r31]
mondo_10_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d94c013  ! 118: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
trapasi_10_101:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd2c04a00  ! 119: LDSWA_R	ldswa	[%r1, %r0] 0x50, %r9
splash_cmpr_10_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 120: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_10_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 121: CASA_R	casa	[%r31] %asi, %r16, %r9
dvapa_10_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0x959, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b14484  ! 122: FCMPLE32	fcmple32	%d36, %d4, %r11
splash_hpstate_10_105:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x819824ce  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	.word 0xe1bfe1c0  ! 124: STDFA_I	stda	%f16, [0x01c0, %r31]
mondo_10_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d950010  ! 125: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
splash_tba_10_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_10_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc009  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe0c0  ! 128: STDFA_I	stda	%f0, [0x00c0, %r31]
splash_hpstate_10_110:
	.word 0x81983edf  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1edf, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fe0a0  ! 131: LDDFA_I	ldda	[%r31, 0x00a0], %f0
	.word 0x9ba00163  ! 132: FABSq	dis not found

	setx 0xbf71c20c9ced8151, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8217a  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x017a] %asi, #one_read
	.word 0x8d903be7  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x1be7, %pstate
	.word 0xc36fe03f  ! 136: PREFETCH_I	prefetch	[%r31 + 0x003f], #one_read
intveclr_10_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0xff394b0488498197, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_118:
	nop
	setx 0xfffffe72fffff83a, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_10_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87aa4a53  ! 139: FCMPd	fcmpd	%fcc<n>, %f40, %f50
splash_lsu_10_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x713196a3, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa04fffffde0, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97a209aa  ! 142: FDIVs	fdivs	%f8, %f10, %f11
splash_cmpr_10_123:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 143: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_10_124:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 145: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_10_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x32109cdb4c1bb8a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_10_127:
	set 0x60140000, %r31
	.word 0x8582b5bf  ! 148: WRCCR_I	wr	%r10, 0x15bf, %ccr
	.word 0x87802010  ! 149: WRASI_I	wr	%r0, 0x0010, %asi
intveclr_10_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa2781571e0e19eaf, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b20  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r16
mondo_10_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d920006  ! 152: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
	setx vahole_target3, %r18, %r27
	.word 0xe1bfe060  ! 153: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xe08fe060  ! 154: LDUBA_I	lduba	[%r31, + 0x0060] %asi, %r16
	.word 0x91d020b4  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 180
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
    brnz %r10, cwq_10_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_131
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
cwq_10_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 156: RDPC	rd	%pc, %r18
ibp_10_132:
	nop
	.word 0x937035c6  ! 157: POPC_I	popc	0x15c6, %r9
splash_lsu_10_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x8575df11, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8800be0  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r20
	setx vahole_target1, %r18, %r27
	.word 0xc19fc3e0  ! 160: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon1_10_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc3eac02b  ! 161: PREFETCHA_R	prefetcha	[%r11, %r11] 0x01, #one_read
splash_hpstate_10_136:
	.word 0x81982614  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0xd497e190  ! 163: LDUHA_I	lduha	[%r31, + 0x0190] %asi, %r10
	setx vahole_target1, %r18, %r27
	.word 0xe19fd920  ! 164: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_10_138:
	nop
	setx 0xfffffdc0fffff44f, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target0, %r18, %r27
	.word 0xd53fc010  ! 166: STDF_R	std	%f10, [%r16, %r31]
intveclr_10_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3c25f49f7e06bab2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d90346b  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x146b, %pstate
	.word 0x8780204f  ! 169: WRASI_I	wr	%r0, 0x004f, %asi
ibp_10_142:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3eac02d  ! 170: PREFETCHA_R	prefetcha	[%r11, %r13] 0x01, #one_read
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_10_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8247f  ! 172: PREFETCHA_I	prefetcha	[%r0, + 0x047f] %asi, #one_read
dvapa_10_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe0d, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe49fc02a  ! 173: LDDA_R	ldda	[%r31, %r10] 0x01, %r18
intveclr_10_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x419f885bda22ccbd, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe138  ! 175: LDDF_I	ldd	[%r31, 0x0138], %f18
donret_10_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_147-donret_10_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0094d1ac | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x138e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_147:
	.word 0xe4ffe1e6  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x01e6] %asi
	.word 0xe19fe100  ! 177: LDDFA_I	ldda	[%r31, 0x0100], %f16
	.word 0x91d02034  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 52
fpinit_10_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 179: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_cmpr_10_149:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 180: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_10_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_150
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
cwq_10_150:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 181: RDPC	rd	%pc, %r13
	.word 0xa9a409b4  ! 182: FDIVs	fdivs	%f16, %f20, %f20
	.word 0xa3a00171  ! 183: FABSq	dis not found

	setx vahole_target2, %r18, %r27
	.word 0xc19fd920  ! 184: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_10_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d934011  ! 185: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0xc19fda00  ! 186: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_10_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 187: CASA_R	casa	[%r31] %asi, %r11, %r13
pmu_10_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffee5fffffd1d, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_10_158:
	.word 0x87afca53  ! 1: FCMPd	fcmpd	%fcc<n>, %f62, %f50
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0xda3fc014  ! 1: STD_R	std	%r13, [%r31 + %r20]
	normalw
	.word 0x97458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x91940012  ! 190: WRPR_PIL_R	wrpr	%r16, %r18, %pil
splash_cmpr_10_160:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 191: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_10_161:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_10_162:
	nop
	.word 0xc3ea0030  ! 193: PREFETCHA_R	prefetcha	[%r8, %r16] 0x01, #one_read
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_10_164:
	nop
	.word 0xe19fdc00  ! 195: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_10_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00b  ! 196: CASA_R	casa	[%r31] %asi, %r11, %r20
splash_tba_10_166:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_10_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x607000e25c46f1f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_10_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 199: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xa7a00173  ! 200: FABSq	dis not found

trapasi_10_170:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0904980  ! 201: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r16
splash_tba_10_171:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e078  ! 203: LDQFA_I	-	[%r31, 0x0078], %f16
	.word 0x87802014  ! 204: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
memptr_10_172:
	set 0x60540000, %r31
	.word 0x85842ca7  ! 206: WRCCR_I	wr	%r16, 0x0ca7, %ccr
splash_cmpr_10_173:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 207: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_10_175:
	nop
	setx 0xfffff4fcfffff9e9, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_10_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_176
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
cwq_10_176:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 210: RDPC	rd	%pc, %r11
	.word 0x91d02032  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
	setx vahole_target2, %r18, %r27
	.word 0xa1a509c9  ! 213: FDIVd	fdivd	%f20, %f40, %f16
	.word 0xda8008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_10_179:
	nop
	setx 0xfffff236fffff81d, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_10_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c030  ! 1: CASA_I	casa	[%r31] 0x 1, %r16, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc00c  ! 216: STXFSR_R	st-sfr	%f1, [%r12, %r31]
trapasi_10_181:
	nop
	mov 0x3e8, %r1 	! (VA for ASI 0x25) 
	.word 0xda8844a0  ! 217: LDUBA_R	lduba	[%r1, %r0] 0x25, %r13
pmu_10_182:
	nop
	setx 0xfffff737fffffa12, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_10_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_183-donret_10_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006a80ea | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_183:
	.word 0xda6fe023  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x0023]
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
    brnz %r10, sma_10_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e010  ! 220: CASA_R	casa	[%r31] %asi, %r16, %r13
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
    brnz %r10, cwq_10_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_185
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
cwq_10_185:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 221: RDPC	rd	%pc, %r9
ibp_10_186:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99b447ca  ! 222: PDIST	pdistn	%d48, %d10, %d12
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d903683  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x1683, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_10_189:
	nop
	.word 0xe1bfe100  ! 226: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_10_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe0bfc031  ! 228: STDA_R	stda	%r16, [%r31 + %r17] 0x01
	.word 0xa1902003  ! 229: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_10_191:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 230: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_10_192:
	nop
	ta T_CHANGE_HPRIV
	set 0xc29a23dd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xa1a249d0  ! 232: FDIVd	fdivd	%f40, %f16, %f16
jmptr_10_194:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_10_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc32, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc030  ! 234: STDA_R	stda	%r17, [%r31 + %r16] 0x01
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_196:
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
    brnz %r10, sma_10_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 236: CASA_R	casa	[%r31] %asi, %r13, %r17
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
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 237: CASA_R	casa	[%r31] %asi, %r19, %r17
	setx 0xf6037b9dea292cfe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_10_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe2e8  ! 1: PREFETCH_I	prefetch	[%r31 + 0x02e8], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe140  ! 239: STDFA_I	stda	%f16, [0x0140, %r31]
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
    brnz %r10, sma_10_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 240: CASA_R	casa	[%r31] %asi, %r17, %r17
	.word 0x87802016  ! 241: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_10_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_202-donret_10_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00064f73 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1fbf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_202:
	.word 0x99a089c3  ! 243: FDIVd	fdivd	%f2, %f34, %f12
	.word 0xe0dfe140  ! 244: LDXA_I	ldxa	[%r31, + 0x0140] %asi, %r16
pmu_10_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff867fffffe32, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_10_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_10_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdaafffff22b, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_10_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_206
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
cwq_10_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 248: RDPC	rd	%pc, %r16
donret_10_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_207-donret_10_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e7de0c | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ec7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_207:
	.word 0x99a509d3  ! 249: FDIVd	fdivd	%f20, %f50, %f12
ibp_10_208:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ecc02a  ! 250: PREFETCHA_R	prefetcha	[%r19, %r10] 0x01, #one_read
fpinit_10_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 251: FDIVd	fdivd	%f0, %f4, %f6
change_to_randtl_10_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_210:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_10_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_211
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
cwq_10_211:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 253: RDPC	rd	%pc, %r19
memptr_10_212:
	set 0x60540000, %r31
	.word 0x858227c9  ! 254: WRCCR_I	wr	%r8, 0x07c9, %ccr
dvapa_10_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd15, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a53  ! 255: FCMPd	fcmpd	%fcc<n>, %f48, %f50
donret_10_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_214-donret_10_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003dce0e | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_214:
	.word 0xa5a409d2  ! 256: FDIVd	fdivd	%f16, %f18, %f18
	.word 0xda3fe008  ! 257: STD_I	std	%r13, [%r31 + 0x0008]
dvapa_10_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd5e, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 258: CASA_R	casa	[%r31] %asi, %r8, %r13
	.word 0xe19fc3e0  ! 259: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_10_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 260: CASA_R	casa	[%r31] %asi, %r17, %r13
pmu_10_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff97cfffff02b, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_10_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffa5afffffa73, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_220:
	nop
	setx 0xfffff8c6fffff1ef, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xcbfd1846ed8d8dd7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_10_222:
	nop
	ta T_CHANGE_HPRIV
	set 0xf5b2a74e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_10_223:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 267: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_10_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d940002  ! 268: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
donret_10_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_225-donret_10_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00670402 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd4d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_225:
	.word 0xda6fe172  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x0172]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_226) + 40, 16, 16)) -> intp(2,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_226)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,9)
#else
	setx 0xc6ed73bf3ff2d423, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe150  ! 272: LDDA_I	ldda	[%r31, + 0x0150] %asi, %r13
intveclr_10_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7a9de9de93e2736d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_10_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f9, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93b50493  ! 274: FCMPLE32	fcmple32	%d20, %d50, %r9
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_10_230:
	.word 0x81982f4f  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
	.word 0xe48008a0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_10_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 278: CASA_R	casa	[%r31] %asi, %r16, %r18
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 279: Tcc_R	tne	icc_or_xcc, %r0 + %r30
brcommon2_10_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc010  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0e0  ! 280: STDFA_I	stda	%f16, [0x00e0, %r31]
	setx vahole_target0, %r18, %r27
	.word 0xc1bfc3e0  ! 281: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_10_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 282: CASA_R	casa	[%r31] %asi, %r17, %r12
splash_lsu_10_235:
	nop
	ta T_CHANGE_HPRIV
	set 0xfed7d64c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdf20  ! 284: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d902a52  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x0a52, %pstate
memptr_10_237:
	set user_data_start, %r31
	.word 0x8581f01c  ! 286: WRCCR_I	wr	%r7, 0x101c, %ccr
memptr_10_238:
	set 0x60540000, %r31
	.word 0x85847184  ! 287: WRCCR_I	wr	%r17, 0x1184, %ccr
	.word 0xa7844011  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r17, %-
	.word 0x93a4c9d1  ! 289: FDIVd	fdivd	%f50, %f48, %f40
intveclr_10_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa3a64006f97920d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 291: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0x8d802000  ! 292: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_10_243:
	nop
	setx 0xfffff622fffff908, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_244) + 40, 16, 16)) -> intp(2,0,27)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_244)&0xffffffff)  + 40, 16, 16)) -> intp(2,0,27)
#else
	setx 0x77babb4dd5478d8c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_10_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 295: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_10_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 296: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xa3524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_10_247:
	nop
	setx 0xfffffea4ffffffb3, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_10_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902001  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	setx 0xa026523437287af9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 301: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
ibp_10_251:
	nop
	.word 0xc1bfe1c0  ! 302: STDFA_I	stda	%f0, [0x01c0, %r31]
dvapa_10_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf19, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7b48490  ! 303: FCMPLE32	fcmple32	%d18, %d16, %r19
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
    brnz %r10, cwq_10_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_253
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
cwq_10_253:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 304: RDPC	rd	%pc, %r8
pmu_10_254:
	nop
	setx 0xfffffb26fffff05e, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_255:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_10_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_256
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
cwq_10_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 307: RDPC	rd	%pc, %r18
splash_hpstate_10_257:
	ta T_CHANGE_NONHPRIV
	.word 0x8198309b  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x109b, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0x91a00163  ! 310: FABSq	dis not found

	.word 0x93d020b4  ! 311: Tcc_I	tne	icc_or_xcc, %r0 + 180
intveclr_10_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0xde5aeaa139fe454a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_10_260:
	nop
	.word 0xc1bfc2c0  ! 313: STDFA_R	stda	%f0, [%r0, %r31]
jmptr_10_261:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 315: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
ibp_10_263:
	nop
	.word 0xc1bfe160  ! 316: STDFA_I	stda	%f0, [0x0160, %r31]
	.word 0xe127e19c  ! 317: STF_I	st	%f16, [0x019c, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_10_264:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe09fc034  ! 319: LDDA_R	ldda	[%r31, %r20] 0x01, %r16
	.word 0xe1bfc3e0  ! 320: STDFA_R	stda	%f16, [%r0, %r31]
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe160  ! 321: STDFA_I	stda	%f0, [0x0160, %r31]
intveclr_10_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0a8ed48bef2b4a1e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_268:
	nop
	setx 0xfffff7f0fffff73c, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97a000c6  ! 324: FNEGd	fnegd	%f6, %f42
intveclr_10_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x971b993cbb28c331, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_10_270:
	tsubcctv %r9, 0x1af9, %r11
	.word 0xd807e194  ! 326: LDUW_I	lduw	[%r31 + 0x0194], %r12
	setx 0x864b3a61376fe7db, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_10_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f803e03  ! 1: SIR	sir	0x1e03
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfdc00  ! 328: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_10_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e009  ! 329: CASA_R	casa	[%r31] %asi, %r9, %r10
dvapa_10_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf07, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1702fb6  ! 330: POPC_I	popc	0x0fb6, %r16
	setx vahole_target3, %r18, %r27
	.word 0xa1b40490  ! 331: FCMPLE32	fcmple32	%d16, %d16, %r16
dvapa_10_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9f2, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 332: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_10_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 333: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9b520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_10_278:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 335: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa17038a5  ! 336: POPC_I	popc	0x18a5, %r16
	setx vahole_target1, %r18, %r27
	.word 0x87ac8a41  ! 337: FCMPd	fcmpd	%fcc<n>, %f18, %f32
jmptr_10_280:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d903f91  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x1f91, %pstate
ceter_10_282:
    nop
    ta T_CHANGE_HPRIV
    mov 5, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa7410000  ! 340: RDTICK	rd	%tick, %r19
	.word 0x9170364c  ! 341: POPC_I	popc	0x164c, %r8
	.word 0xd847e110  ! 342: LDSW_I	ldsw	[%r31 + 0x0110], %r12
	.word 0x9190c011  ! 343: WRPR_PIL_R	wrpr	%r3, %r17, %pil
	.word 0xd837e0e6  ! 344: STH_I	sth	%r12, [%r31 + 0x00e6]
ibp_10_285:
	nop
	.word 0xc3e8c030  ! 345: PREFETCHA_R	prefetcha	[%r3, %r16] 0x01, #one_read
	.word 0x93a109c5  ! 346: FDIVd	fdivd	%f4, %f36, %f40
	.word 0xd337e19c  ! 347: STQF_I	-	%f9, [0x019c, %r31]
donret_10_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_287-donret_10_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005692d5 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3c7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_287:
	.word 0xd2ffe0b4  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x00b4] %asi
	.word 0xd2800c20  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0x8d802000  ! 350: WRFPRS_I	wr	%r0, 0x0000, %fprs
dvapa_10_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf3f, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c029  ! 351: LDUHA_R	lduha	[%r31, %r9] 0x01, %r9
	.word 0x9ba00169  ! 352: FABSq	dis not found

	.word 0xe1bfe000  ! 353: STDFA_I	stda	%f16, [0x0000, %r31]
brcommon2_10_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00b  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fd920  ! 354: LDDFA_R	ldda	[%r31, %r0], %f0
donret_10_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_292-donret_10_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d235f5 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x48f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_292:
	.word 0x91a0c9d3  ! 355: FDIVd	fdivd	%f34, %f50, %f8
pmu_10_293:
	nop
	setx 0xfffff706fffffe1d, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_10_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_294-donret_10_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c6c621 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfd5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_294:
	.word 0xe46fe0b1  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x00b1]
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
    brnz %r10, sma_10_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e008  ! 358: CASA_R	casa	[%r31] %asi, %r8, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_10_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_296
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
cwq_10_296:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 360: RDPC	rd	%pc, %r13
splash_cmpr_10_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 361: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_10_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d930012  ! 362: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
brcommon3_10_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c014  ! 1: STQF_R	-	%f13, [%r20, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda3fe410  ! 363: STD_I	std	%r13, [%r31 + 0x0410]
intveclr_10_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcbd69e83b929fa69, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_10_302:
	nop
	ta T_CHANGE_HPRIV
	set 0xe4785dce, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_10_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_303
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
cwq_10_303:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 367: RDPC	rd	%pc, %r13
    set 0x37b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b2c7c4  ! 368: PDIST	pdistn	%d42, %d4, %d42
splash_lsu_10_304:
	nop
	ta T_CHANGE_HPRIV
	set 0xbf479867, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_10_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
dvapa_10_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xaf9, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1b4c491  ! 371: FCMPLE32	fcmple32	%d50, %d48, %r16
pmu_10_307:
	nop
	setx 0xfffffb43fffffa6f, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_308:
	nop
	setx 0xfffffa4dfffff3e5, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe19fdc00  ! 374: LDDFA_R	ldda	[%r31, %r0], %f16
tagged_10_310:
	tsubcctv %r2, 0x1ba0, %r5
	.word 0xd407e0d8  ! 375: LDUW_I	lduw	[%r31 + 0x00d8], %r10
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
    brnz %r10, cwq_10_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_311
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
cwq_10_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 376: RDPC	rd	%pc, %r18
trapasi_10_312:
	nop
	mov 0x30, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8c84b60  ! 377: LDSBA_R	ldsba	[%r1, %r0] 0x5b, %r12
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902dcb  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x0dcb, %pstate
	.word 0xd897c032  ! 379: LDUHA_R	lduha	[%r31, %r18] 0x01, %r12
mondo_10_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d948013  ! 380: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
fpinit_10_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8333a  ! 381: PREFETCHA_I	prefetcha	[%r0, + 0xfffff33a] %asi, #one_read
dvapa_10_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xccf, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe040  ! 382: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0x8d9037fe  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x17fe, %pstate
pmu_10_319:
	nop
	setx 0xfffffe5bfffff260, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e128  ! 385: LDSHA_I	ldsha	[%r31, + 0x0128] %asi, %r12
	.word 0x8d903765  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x1765, %pstate
fpinit_10_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 387: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xe19fd960  ! 388: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91b4c547  ! 389: FCMPEQ16	fcmpeq16	%d50, %d38, %r8
donret_10_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_322-donret_10_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00af8311 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b5c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_322:
	.word 0xe8ffe04c  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x004c] %asi
	.word 0x9545c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xab830011  ! 392: WR_CLEAR_SOFTINT_R	wr	%r12, %r17, %clear_softint
	setx 0x69c3324696a9d683, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe69fc02a  ! 394: LDDA_R	ldda	[%r31, %r10] 0x01, %r19
	setx 0x2708a4f94ba190af, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7524000  ! 396: RDPR_CWP	<illegal instruction>
dvapa_10_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0x902, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 397: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_10_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 398: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xe697c02b  ! 399: LDUHA_R	lduha	[%r31, %r11] 0x01, %r19
	.word 0x87ac0a44  ! 400: FCMPd	fcmpd	%fcc<n>, %f16, %f4
	setx vahole_target2, %r18, %r27
	.word 0xe19fdf20  ! 401: LDDFA_R	ldda	[%r31, %r0], %f16
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
    setx 0x4fd691c0cb0a5cdd, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
setup_spu_8:
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
	.word 0xe88008a0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
cmp_8_0:
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
cmp_startwait8_0:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_0
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_0:
    brnz,a %r10, cmp_wait8_0
    ld [%r23], %r10
    ba cmp_startwait8_0
    mov 0x8, %r10
continue_cmp_8_0:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_0
    mov 6, %r17
    best_set_reg(0x47c9841ee11f4894, %r16, %r17)
cmp_multi_core_8_0:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x95a00168  ! 2: FABSq	dis not found

ibp_8_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc00a  ! 3: LDDF_R	ldd	[%r31, %r10], %f17
donret_8_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_2-donret_8_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b1a27e | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x924, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_2:
	.word 0xe26fe0f6  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x00f6]
	setx 0x418ac564698566c7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d92400c  ! 6: WRPR_WSTATE_R	wrpr	%r9, %r12, %wstate
pmu_8_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff6cdfffff6f1, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa6fd2e16  ! 8: SDIVcc_I	sdivcc 	%r20, 0x0e16, %r19
splash_cmpr_8_6:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 9: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_8_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_7
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
cwq_8_7:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 10: RDPC	rd	%pc, %r12
pmu_8_8:
	nop
	setx 0xfffff794fffff13d, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_8_9:
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
cmp_startwait8_9:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_9
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_9:
    brnz,a %r10, cmp_wait8_9
    ld [%r23], %r10
    ba cmp_startwait8_9
    mov 0x8, %r10
continue_cmp_8_9:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_9
    mov 0xa2, %r17
    best_set_reg(0xbcad17351dcbe6e3, %r16, %r17)
cmp_multi_core_8_9:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91a00166  ! 12: FABSq	dis not found

ibp_8_10:
	nop
	.word 0xe1bfc3e0  ! 13: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_8_11:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2c04980  ! 14: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r17
splash_cmpr_8_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 15: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87ad0a44  ! 16: FCMPd	fcmpd	%fcc<n>, %f20, %f4
pmu_8_14:
	nop
	setx 0xfffff3e6fffffc1f, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x24cc8001  ! 1: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x8d902ab5  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x0ab5, %pstate
splash_cmpr_8_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 19: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_8_17:
	nop
	ta T_CHANGE_HPRIV
	set 0x09c76813, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_8_18:
	nop
	.word 0xa7b1c7d3  ! 22: PDIST	pdistn	%d38, %d50, %d50
fpinit_8_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 23: FCMPLE32	fcmple32	%d0, %d4, %r8
mondo_8_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d910014  ! 24: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
intveclr_8_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x3af89fbaecb13af6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb86fffffad4, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_8_23:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_8_24:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xda884980  ! 28: LDUBA_R	lduba	[%r1, %r0] 0x4c, %r13
	.word 0x87802080  ! 29: WRASI_I	wr	%r0, 0x0080, %asi
ibp_8_25:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1c0  ! 30: STDFA_I	stda	%f16, [0x01c0, %r31]
dvapa_8_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdec, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda97c034  ! 31: LDUHA_R	lduha	[%r31, %r20] 0x01, %r13
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
    brnz %r10, cwq_8_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_27
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
cwq_8_27:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 32: RDPC	rd	%pc, %r9
	.word 0x8d90310b  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x110b, %pstate
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
    mov 0x94, %r17
    best_set_reg(0xd260c35ebf847c9f, %r16, %r17)
cmp_multi_core_8_29:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9ba00174  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_30) + 16, 16, 16)) -> intp(3,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_30)&0xffffffff)  + 16, 16, 16)) -> intp(3,0,15)
#else
	setx 0xaa7feb4c80ed59fe, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7b4c994  ! 36: BSHUFFLE	fmovc32	%d50, %d20, %d50
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd44fe050  ! 38: LDSB_I	ldsb	[%r31 + 0x0050], %r10
splash_cmpr_8_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0xfdc58a98cea60088, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_8_34:
	nop
	setx 0xfffff454fffff49c, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_35:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e178  ! 44: LDSWA_I	ldswa	[%r31, + 0x0178] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_8_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a91  ! 46: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa91] %asi, #one_read
cwp_8_37:
    set user_data_start, %o7
	.word 0x93902004  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
ibp_8_38:
	nop
	.word 0xd5e7e00d  ! 48: CASA_R	casa	[%r31] %asi, %r13, %r10
pmu_8_39:
	nop
	setx 0xfffff593fffffa0d, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_8_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 50: FDIVs	fdivs	%f0, %f4, %f6
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
    brnz %r10, cwq_8_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_41
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
cwq_8_41:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 51: RDPC	rd	%pc, %r18
cmp_8_42:
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
cmp_startwait8_42:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_42
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_42:
    brnz,a %r10, cmp_wait8_42
    ld [%r23], %r10
    ba cmp_startwait8_42
    mov 0x8, %r10
continue_cmp_8_42:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_42
    mov 8, %r17
    best_set_reg(0x14727316abbbe88b, %r16, %r17)
cmp_multi_core_8_42:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91944014  ! 52: WRPR_PIL_R	wrpr	%r17, %r20, %pil
mondo_8_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950012  ! 53: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
dvapa_8_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa42, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe060  ! 54: STDFA_I	stda	%f0, [0x0060, %r31]
ibp_8_45:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfdf20  ! 55: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_8_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 56: CASA_R	casa	[%r31] %asi, %r8, %r20
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902713  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x0713, %pstate
splash_lsu_8_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x33e9138a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_8_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa5a049d1  ! 59: FDIVd	fdivd	%f32, %f48, %f18
splash_hpstate_8_50:
	ta T_CHANGE_NONHPRIV
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x81983b85  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1b85, %hpstate
vahole_8_51:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe120  ! 61: STDFA_I	stda	%f16, [0x0120, %r31]
splash_lsu_8_52:
	nop
	ta T_CHANGE_HPRIV
	set 0x0577444b, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_8_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_53
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
cwq_8_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 63: RDPC	rd	%pc, %r20
cwp_8_54:
    set user_data_start, %o7
	.word 0x93902003  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	setx 0x3a1bb233902068b2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_8_56:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd43ffa99  ! 66: STD_I	std	%r10, [%r31 + 0xfffffa99]
splash_tick_8_57:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x538bca10e88728d1, %r16, %r17)
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_8_58:
	tsubcctv %r19, 0x1c94, %r3
	.word 0xd407e0dc  ! 68: LDUW_I	lduw	[%r31 + 0x00dc], %r10
jmptr_8_59:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 70: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
donret_8_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_61-donret_8_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00163381 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x755, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_61:
	.word 0xd4ffe1c8  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x01c8] %asi
ibp_8_62:
	nop
	.word 0x99b2c7c4  ! 72: PDIST	pdistn	%d42, %d4, %d12
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d9035a3  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x15a3, %pstate
dvapa_8_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc11, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfc2c0  ! 74: STDFA_R	stda	%f0, [%r0, %r31]
vahole_8_65:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x97b047ca  ! 75: PDIST	pdistn	%d32, %d10, %d42
pmu_8_66:
	nop
	setx 0xfffff6b0fffff6b4, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_8_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_67-donret_8_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007fb258 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x55f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_67:
	.word 0xd2ffe03c  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x003c] %asi
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
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_68:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 78: RDPC	rd	%pc, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_8_70:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe4c84a00  ! 80: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r18
	.word 0xa9b20992  ! 81: BSHUFFLE	fmovc32	%d8, %d18, %d20
pmu_8_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9b1fffffb09, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_8_73:
	taddcctv %r9, 0x147d, %r18
	.word 0xd607e085  ! 83: LDUW_I	lduw	[%r31 + 0x0085], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_74) + 40, 16, 16)) -> intp(7,0,24)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_74)&0xffffffff)  + 40, 16, 16)) -> intp(7,0,24)
#else
	setx 0x04527060ebb9f0cf, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 85: Tcc_I	ta	icc_or_xcc, %r0 + 50
    set 0x1265, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b307d2  ! 86: PDIST	pdistn	%d12, %d18, %d50
cmp_8_75:
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
cmp_startwait8_75:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_75
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_75:
    brnz,a %r10, cmp_wait8_75
    ld [%r23], %r10
    ba cmp_startwait8_75
    mov 0x8, %r10
continue_cmp_8_75:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_75
    mov 57, %r17
    best_set_reg(0xa627fd045528df84, %r16, %r17)
cmp_multi_core_8_75:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c006  ! 87: WRPR_PIL_R	wrpr	%r7, %r6, %pil
cmp_8_76:
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
cmp_startwait8_76:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_76
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_76:
    brnz,a %r10, cmp_wait8_76
    ld [%r23], %r10
    ba cmp_startwait8_76
    mov 0x8, %r10
continue_cmp_8_76:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_76
    mov 19, %r17
    best_set_reg(0xd811c04d7a00f58f, %r16, %r17)
cmp_multi_core_8_76:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c014  ! 88: WRPR_PIL_R	wrpr	%r7, %r20, %pil
pmu_8_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb8ffffffee0, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
vahole_8_78:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd23fed78  ! 91: STD_I	std	%r9, [%r31 + 0x0d78]
ibp_8_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec4023  ! 92: PREFETCHA_R	prefetcha	[%r17, %r3] 0x01, #one_read
splash_lsu_8_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xbd01ad81, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_81:
	nop
	ta T_CHANGE_HPRIV
	set 0x345322ce, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_8_82:
	nop
	ta T_CHANGE_HPRIV
	set 0xb3efe4c0, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_83:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_8_85:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982d84  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d84, %hpstate
	.word 0xe01fe050  ! 100: LDD_I	ldd	[%r31 + 0x0050], %r16
	.word 0xe09fe148  ! 101: LDDA_I	ldda	[%r31, + 0x0148] %asi, %r16
ibp_8_86:
	nop
	.word 0xe1bfc3e0  ! 102: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x93d02034  ! 103: Tcc_I	tne	icc_or_xcc, %r0 + 52
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
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 104: CASA_R	casa	[%r31] %asi, %r20, %r16
cmp_8_88:
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
cmp_startwait8_88:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_88
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_88:
    brnz,a %r10, cmp_wait8_88
    ld [%r23], %r10
    ba cmp_startwait8_88
    mov 0x8, %r10
continue_cmp_8_88:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_88
    mov 0x70, %r17
    best_set_reg(0x2d76d784d815def8, %r16, %r17)
cmp_multi_core_8_88:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91928008  ! 105: WRPR_PIL_R	wrpr	%r10, %r8, %pil
pmu_8_89:
	nop
	setx 0xfffff3ccfffffde9, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x26c88001  ! 1: BRLZ	brlz,a,pt	%r2,<label_0x88001>
	.word 0x8d903d66  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x1d66, %pstate
intveclr_8_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x82ecfc536d20b564, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_8_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe3144013  ! 1: LDQF_R	-	[%r17, %r19], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfde00  ! 110: STDFA_R	stda	%f0, [%r0, %r31]
pmu_8_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe18fffff1f2, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_8_94:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe8bfc031  ! 112: STDA_R	stda	%r20, [%r31 + %r17] 0x01
	fbge skip_8_95
	brlez,a,pt	%r20, skip_8_95
.align 2048
skip_8_95:
	.word 0xc36c67d7  ! 113: PREFETCH_I	prefetch	[%r17 + 0x07d7], #one_read
dvapa_8_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf0d, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97702842  ! 114: POPC_I	popc	0x0842, %r11
splash_cmpr_8_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
vahole_8_98:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd31fc00d  ! 116: LDDF_R	ldd	[%r31, %r13], %f9
vahole_8_99:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfdb60  ! 117: STDFA_R	stda	%f0, [%r0, %r31]
mondo_8_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 118: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
trapasi_8_101:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd2c84a00  ! 119: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r9
splash_cmpr_8_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 120: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_8_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e009  ! 121: CASA_R	casa	[%r31] %asi, %r9, %r9
dvapa_8_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8e1, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3eac02d  ! 122: PREFETCHA_R	prefetcha	[%r11, %r13] 0x01, #one_read
splash_hpstate_8_105:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81983787  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1787, %hpstate
	.word 0xc1bfe040  ! 124: STDFA_I	stda	%f0, [0x0040, %r31]
mondo_8_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d950011  ! 125: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
splash_tba_8_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_8_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x95a00550  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfd920  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
splash_hpstate_8_110:
	.word 0x8198355d  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x155d, %hpstate
splash_tick_8_111:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xcb90385db1bdb682, %r16, %r17)
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe19fe000  ! 131: LDDFA_I	ldda	[%r31, 0x0000], %f16
cmp_8_112:
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
cmp_startwait8_112:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_112
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_112:
    brnz,a %r10, cmp_wait8_112
    ld [%r23], %r10
    ba cmp_startwait8_112
    mov 0x8, %r10
continue_cmp_8_112:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_112
    mov 0xbd, %r17
    best_set_reg(0xb477b023680074ca, %r16, %r17)
cmp_multi_core_8_112:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa1a00168  ! 132: FABSq	dis not found

	setx 0x2b37b1c598591932, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8217a  ! 134: PREFETCHA_I	prefetcha	[%r0, + 0x017a] %asi, #one_read
	.word 0x8d903654  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x1654, %pstate
	fbul skip_8_116
	fbe,a,pn	%fcc0,  skip_8_116
.align 2048
skip_8_116:
	.word 0xd9e7c020  ! 136: CASA_I	casa	[%r31] 0x 1, %r0, %r12
intveclr_8_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0x600a28857d72980e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_118:
	nop
	setx 0xfffff879fffff862, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_8_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3ea8025  ! 139: PREFETCHA_R	prefetcha	[%r10, %r5] 0x01, #one_read
splash_lsu_8_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x681b3ebd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4f1fffff43e, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
unsupttte_8_122:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa7b30482  ! 142: FCMPLE32	fcmple32	%d12, %d2, %r19
splash_cmpr_8_123:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 143: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_8_124:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 145: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
cerer_8_125:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x5e240ca758bcda3a, %r16, %r17)
    sethi %hi(0x20008000), %r16   ! Set ITTM/DTTM
    sllx %r16, 32, %r16
    or %r16, %r17, %r17
    mov 0x10, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa1524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_8_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9b8d0b50adbd69f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_8_127:
	set 0x60540000, %r31
	.word 0x85852627  ! 148: WRCCR_I	wr	%r20, 0x0627, %ccr
	.word 0x87802055  ! 149: WRASI_I	wr	%r0, 0x0055, %asi
intveclr_8_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa5042a2eccd61e4d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_8_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d928011  ! 152: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
vahole_8_130:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe180  ! 153: STDFA_I	stda	%f16, [0x0180, %r31]
	.word 0xe08fe098  ! 154: LDUBA_I	lduba	[%r31, + 0x0098] %asi, %r16
	.word 0x93d020b4  ! 155: Tcc_I	tne	icc_or_xcc, %r0 + 180
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
    brnz %r10, cwq_8_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_131
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
cwq_8_131:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 156: RDPC	rd	%pc, %r13
ibp_8_132:
	nop
	.word 0x87a9ca53  ! 157: FCMPd	fcmpd	%fcc<n>, %f38, %f50
splash_lsu_8_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x49d3131f, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
vahole_8_134:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fd960  ! 160: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon1_8_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x95a309b0  ! 161: FDIVs	fdivs	%f12, %f16, %f10
splash_hpstate_8_136:
	.word 0x81983f15  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1f15, %hpstate
	.word 0xd497e0d0  ! 163: LDUHA_I	lduha	[%r31, + 0x00d0] %asi, %r10
vahole_8_137:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe080  ! 164: STDFA_I	stda	%f16, [0x0080, %r31]
pmu_8_138:
	nop
	setx 0xfffffdaffffffae3, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_8_139:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd497c028  ! 166: LDUHA_R	lduha	[%r31, %r8] 0x01, %r10
intveclr_8_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe109cda4280286a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e03  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
	.word 0x87802058  ! 169: WRASI_I	wr	%r0, 0x0058, %asi
ibp_8_142:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x99a449cd  ! 170: FDIVd	fdivd	%f48, %f44, %f12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_8_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 172: FCMPLE32	fcmple32	%d0, %d4, %r6
dvapa_8_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0x81f, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc030  ! 173: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
intveclr_8_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x6e394bb9eb8237c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe168  ! 175: LDDF_I	ldd	[%r31, 0x0168], %f18
donret_8_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_147-donret_8_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00086314 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x95c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_147:
	.word 0xe4ffe01a  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x001a] %asi
	.word 0xe19fe0e0  ! 177: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x91d02034  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 52
fpinit_8_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 179: FDIVd	fdivd	%f0, %f4, %f4
splash_cmpr_8_149:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 180: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_8_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_150
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
cwq_8_150:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 181: RDPC	rd	%pc, %r12
unsupttte_8_151:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a0c9c8  ! 182: FDIVd	fdivd	%f34, %f8, %f12
cmp_8_152:
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
cmp_startwait8_152:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_152
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_152:
    brnz,a %r10, cmp_wait8_152
    ld [%r23], %r10
    ba cmp_startwait8_152
    mov 0x8, %r10
continue_cmp_8_152:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_152
    mov 0xe6, %r17
    best_set_reg(0x7981c64e61a76288, %r16, %r17)
cmp_multi_core_8_152:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa3a00170  ! 183: FABSq	dis not found

vahole_8_153:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe020  ! 184: STDFA_I	stda	%f0, [0x0020, %r31]
mondo_8_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d930011  ! 185: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	.word 0xc1bfd960  ! 186: STDFA_R	stda	%f0, [%r0, %r31]
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
    brnz %r10, sma_8_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00a  ! 187: CASA_R	casa	[%r31] %asi, %r10, %r13
pmu_8_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7edfffff3f7, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_8_158:
	.word 0x9bb7c4d0  ! 1: FCMPNE32	fcmpne32	%d62, %d16, %r13
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0xdbe7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r13
	normalw
	.word 0xa7458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r19
cmp_8_159:
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
cmp_startwait8_159:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_159
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_159:
    brnz,a %r10, cmp_wait8_159
    ld [%r23], %r10
    ba cmp_startwait8_159
    mov 0x8, %r10
continue_cmp_8_159:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_159
    mov 0x92, %r17
    best_set_reg(0x36eee1d27891be1c, %r16, %r17)
cmp_multi_core_8_159:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924014  ! 190: WRPR_PIL_R	wrpr	%r9, %r20, %pil
splash_cmpr_8_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 191: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_8_161:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_8_162:
	nop
	.word 0xa9a249d1  ! 193: FDIVd	fdivd	%f40, %f48, %f20
splash_tick_8_163:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x956a35bed3cc23be, %r16, %r17)
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_8_164:
	nop
	.word 0xe1bfdf20  ! 195: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_8_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 196: CASA_R	casa	[%r31] %asi, %r17, %r20
splash_tba_8_166:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_8_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x799f068701b9b92a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_8_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 199: FCMPd	fcmpd	%fcc<n>, %f0, %f4
cmp_8_169:
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
cmp_startwait8_169:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_169
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_169:
    brnz,a %r10, cmp_wait8_169
    ld [%r23], %r10
    ba cmp_startwait8_169
    mov 0x8, %r10
continue_cmp_8_169:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_169
    mov 0xd5, %r17
    best_set_reg(0xf725075ee9f36ea5, %r16, %r17)
cmp_multi_core_8_169:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa3a00167  ! 200: FABSq	dis not found

trapasi_8_170:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0c84980  ! 201: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r16
splash_tba_8_171:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e140  ! 203: LDQFA_I	-	[%r31, 0x0140], %f16
	.word 0x87802010  ! 204: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
memptr_8_172:
	set 0x60540000, %r31
	.word 0x85837552  ! 206: WRCCR_I	wr	%r13, 0x1552, %ccr
splash_cmpr_8_173:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 207: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_tick_8_174:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xfc48f443c8aca9ef, %r16, %r17)
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_8_175:
	nop
	setx 0xfffffb0efffff968, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_8_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_176
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
cwq_8_176:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 210: RDPC	rd	%pc, %r10
	.word 0x93d020b5  ! 211: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_tick_8_177:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x0e047f034f9ebe96, %r16, %r17)
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
vahole_8_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3e8c032  ! 213: PREFETCHA_R	prefetcha	[%r3, %r18] 0x01, #one_read
	.word 0xda800c20  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r13
pmu_8_179:
	nop
	setx 0xfffff584fffff4ae, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_8_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdabfc034  ! 216: STDA_R	stda	%r13, [%r31 + %r20] 0x01
trapasi_8_181:
	nop
	mov 0x3f8, %r1 	! (VA for ASI 0x25) 
	.word 0xdac044a0  ! 217: LDSWA_R	ldswa	[%r1, %r0] 0x25, %r13
pmu_8_182:
	nop
	setx 0xfffff34cfffff926, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_8_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_183-donret_8_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e73eb7 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cc5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_183:
	.word 0xda6fe12f  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x012f]
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
    brnz %r10, sma_8_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 220: CASA_R	casa	[%r31] %asi, %r8, %r13
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
    brnz %r10, cwq_8_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_185
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
cwq_8_185:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 221: RDPC	rd	%pc, %r13
ibp_8_186:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa3a4c9d0  ! 222: FDIVd	fdivd	%f50, %f16, %f48
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d9034e1  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x14e1, %pstate
splash_tick_8_188:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xe70f0da45bc4463f, %r16, %r17)
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_8_189:
	nop
	.word 0xe19fdc00  ! 226: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_8_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe0dfc030  ! 228: LDXA_R	ldxa	[%r31, %r16] 0x01, %r16
	.word 0xa1902003  ! 229: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_8_191:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 230: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_8_192:
	nop
	ta T_CHANGE_HPRIV
	set 0x14b90a2c, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_8_193:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x95b447c3  ! 232: PDIST	pdistn	%d48, %d34, %d10
jmptr_8_194:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_8_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb87, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e009  ! 234: CASA_R	casa	[%r31] %asi, %r9, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_196:
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
    brnz %r10, sma_8_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 236: CASA_R	casa	[%r31] %asi, %r13, %r17
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
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 237: CASA_R	casa	[%r31] %asi, %r11, %r17
	setx 0xb5fbd809836843d9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_8_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd7104010  ! 1: LDQF_R	-	[%r1, %r16], %f11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfc3e0  ! 239: STDFA_R	stda	%f16, [%r0, %r31]
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
    brnz %r10, sma_8_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 240: CASA_R	casa	[%r31] %asi, %r19, %r17
	.word 0x87802082  ! 241: WRASI_I	wr	%r0, 0x0082, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_8_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_202-donret_8_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a1fb4c | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_202:
	.word 0xa3a4c9d0  ! 243: FDIVd	fdivd	%f50, %f16, %f48
	.word 0xe0dfe120  ! 244: LDXA_I	ldxa	[%r31, + 0x0120] %asi, %r16
pmu_8_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff6c9fffff87f, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_8_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_8_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff692fffffd71, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_8_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_206
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
cwq_8_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 248: RDPC	rd	%pc, %r18
donret_8_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_207-donret_8_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00178ec7 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x69f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_207:
	.word 0x95a109d0  ! 249: FDIVd	fdivd	%f4, %f16, %f10
ibp_8_208:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a449a7  ! 250: FDIVs	fdivs	%f17, %f7, %f18
fpinit_8_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 251: FDIVs	fdivs	%f0, %f4, %f4
change_to_randtl_8_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_210:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_8_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_211
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
cwq_8_211:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 253: RDPC	rd	%pc, %r16
memptr_8_212:
	set 0x60740000, %r31
	.word 0x8584e7bb  ! 254: WRCCR_I	wr	%r19, 0x07bb, %ccr
dvapa_8_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc3b, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93a4c9c9  ! 255: FDIVd	fdivd	%f50, %f40, %f40
donret_8_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_214-donret_8_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009824f1 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1f8d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_214:
	.word 0xa1a209d4  ! 256: FDIVd	fdivd	%f8, %f20, %f16
	.word 0xda3fe0c0  ! 257: STD_I	std	%r13, [%r31 + 0x00c0]
dvapa_8_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0x918, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc02d  ! 258: STDA_R	stda	%r13, [%r31 + %r13] 0x01
	.word 0xe19fc2c0  ! 259: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_8_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e011  ! 260: CASA_R	casa	[%r31] %asi, %r17, %r13
pmu_8_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff21efffff92a, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_8_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff0b3fffff6f2, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_220:
	nop
	setx 0xfffff85dfffff85f, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x61e3307113330e6c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_8_222:
	nop
	ta T_CHANGE_HPRIV
	set 0xd6415e4b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_8_223:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdc00  ! 267: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_8_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d91400b  ! 268: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
donret_8_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_225-donret_8_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000ae14f | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x13dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	done
donretarg_8_225:
	.word 0xda6fe1ca  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x01ca]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_226) + 0, 16, 16)) -> intp(7,0,29)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_226)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,29)
#else
	setx 0xc57778baa052a1e1, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_tick_8_227:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xd2efbf94c33e1b58, %r16, %r17)
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe080  ! 272: LDDA_I	ldda	[%r31, + 0x0080] %asi, %r13
intveclr_8_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0x15ad79845fbb28f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_8_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbdc, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0030  ! 274: PREFETCHA_R	prefetcha	[%r16, %r16] 0x01, #one_read
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_8_230:
	.word 0x8198325f  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x125f, %hpstate
	.word 0xe4800c00  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
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
    brnz %r10, sma_8_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 278: CASA_R	casa	[%r31] %asi, %r18, %r18
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 279: Tcc_R	te	icc_or_xcc, %r0 + %r30
brcommon2_8_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd310800a  ! 1: LDQF_R	-	[%r2, %r10], %f9
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe040  ! 280: STDFA_I	stda	%f16, [0x0040, %r31]
vahole_8_233:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fda00  ! 281: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_8_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00c  ! 282: CASA_R	casa	[%r31] %asi, %r12, %r12
splash_lsu_8_235:
	nop
	ta T_CHANGE_HPRIV
	set 0x4bda7240, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfda00  ! 284: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d903da7  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x1da7, %pstate
memptr_8_237:
	set user_data_start, %r31
	.word 0x8584ab4f  ! 286: WRCCR_I	wr	%r18, 0x0b4f, %ccr
memptr_8_238:
	set 0x60540000, %r31
	.word 0x8584e517  ! 287: WRCCR_I	wr	%r19, 0x0517, %ccr
	.word 0xa780800a  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r10, %-
	fbl skip_8_240
	.word 0xa7a4c9d2  ! 1: FDIVd	fdivd	%f50, %f18, %f50
.align 32
skip_8_240:
	.word 0xa3b204d2  ! 289: FCMPNE32	fcmpne32	%d8, %d18, %r17
intveclr_8_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0x204ef9abc9867e32, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00c  ! 291: CASA_R	casa	[%r31] %asi, %r12, %r10
	.word 0x8d802004  ! 292: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_8_243:
	nop
	setx 0xfffffdcdfffffb9a, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_244) + 48, 16, 16)) -> intp(7,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_244)&0xffffffff)  + 48, 16, 16)) -> intp(7,0,25)
#else
	setx 0xc30e5a40889429bd, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_8_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 295: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_8_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d950004  ! 296: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
cerer_8_246:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x0987e4442df7e5c6, %r16, %r17)
    sethi %hi(0x20008000), %r16   ! Set ITTM/DTTM
    sllx %r16, 32, %r16
    or %r16, %r17, %r17
    mov 0x10, %r16
    stxa %r17, [%r16]0x4c
	.word 0x95524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_8_247:
	nop
	setx 0xfffff337fffff967, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_8_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902003  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	setx 0x9af9c3e79ea14f9b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	bn,a	 skip_8_250
	brlez,pn  	%r18, skip_8_250
.align 1024
skip_8_250:
	.word 0x9f80251d  ! 301: SIR	sir	0x051d
ibp_8_251:
	nop
	.word 0xc1bfe020  ! 302: STDFA_I	stda	%f0, [0x0020, %r31]
dvapa_8_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfbd, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa7b48490  ! 303: FCMPLE32	fcmple32	%d18, %d16, %r19
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
    brnz %r10, cwq_8_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_253
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
cwq_8_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 304: RDPC	rd	%pc, %r18
pmu_8_254:
	nop
	setx 0xfffffe43fffff3bd, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_255:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_8_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_256
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
cwq_8_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 307: RDPC	rd	%pc, %r20
splash_hpstate_8_257:
	ta T_CHANGE_NONHPRIV
	.word 0x81983c91  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c91, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
cmp_8_258:
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
cmp_startwait8_258:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_258
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_258:
    brnz,a %r10, cmp_wait8_258
    ld [%r23], %r10
    ba cmp_startwait8_258
    mov 0x8, %r10
continue_cmp_8_258:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_258
    mov 44, %r17
    best_set_reg(0x5a3a25fe47dd3001, %r16, %r17)
cmp_multi_core_8_258:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa9a00168  ! 310: FABSq	dis not found

	.word 0x83d020b4  ! 311: Tcc_I	te	icc_or_xcc, %r0 + 180
intveclr_8_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc513cdd2b7f2f53d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_8_260:
	nop
	.word 0xe19fda00  ! 313: LDDFA_R	ldda	[%r31, %r0], %f16
jmptr_8_261:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d920009  ! 315: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
ibp_8_263:
	nop
	.word 0xe1bfda00  ! 316: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe127e1b0  ! 317: STF_I	st	%f16, [0x01b0, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_8_264:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 319: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0xc19fdf20  ! 320: LDDFA_R	ldda	[%r31, %r0], %f0
vahole_8_266:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 321: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_8_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0x25f2df50aa5d9556, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_268:
	nop
	setx 0xfffffbe1fffff68e, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a000d2  ! 324: FNEGd	fnegd	%f18, %f8
intveclr_8_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd0d16f2f64771703, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_8_270:
	tsubcctv %r20, 0x1974, %r12
	.word 0xd807e00e  ! 326: LDUW_I	lduw	[%r31 + 0x000e], %r12
	setx 0x3c417a1a9849c38d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_8_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a00552  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe020  ! 328: STDFA_I	stda	%f0, [0x0020, %r31]
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
    brnz %r10, sma_8_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 329: CASA_R	casa	[%r31] %asi, %r11, %r10
dvapa_8_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc44, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97b40493  ! 330: FCMPLE32	fcmple32	%d16, %d50, %r11
vahole_8_275:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa1a509d1  ! 331: FDIVd	fdivd	%f20, %f48, %f16
dvapa_8_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa70, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe100  ! 332: STDFA_I	stda	%f16, [0x0100, %r31]
splash_cmpr_8_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 333: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x97520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_8_278:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 335: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa5703f72  ! 336: POPC_I	popc	0x1f72, %r18
vahole_8_279:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9bb107d1  ! 337: PDIST	pdistn	%d4, %d48, %d44
jmptr_8_280:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9039ff  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x19ff, %pstate
ceter_8_282:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x91410000  ! 340: RDTICK	rd	%tick, %r8
	.word 0x95a1c9b3  ! 341: FDIVs	fdivs	%f7, %f19, %f10
	.word 0xd847e140  ! 342: LDSW_I	ldsw	[%r31 + 0x0140], %r12
cmp_8_284:
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
cmp_startwait8_284:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_284
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_284:
    brnz,a %r10, cmp_wait8_284
    ld [%r23], %r10
    ba cmp_startwait8_284
    mov 0x8, %r10
continue_cmp_8_284:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_284
    mov 0x43, %r17
    best_set_reg(0x347d1599b1724d1e, %r16, %r17)
cmp_multi_core_8_284:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91920012  ! 343: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	.word 0xd837e09a  ! 344: STH_I	sth	%r12, [%r31 + 0x009a]
ibp_8_285:
	nop
	.word 0xa1703ff2  ! 345: POPC_I	popc	0x1ff2, %r16
	brz,a,pn	%r19, skip_8_286
	ba  	 skip_8_286
.align 512
skip_8_286:
	.word 0x24cd0001  ! 346: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0xd337e038  ! 347: STQF_I	-	%f9, [0x0038, %r31]
donret_8_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_287-donret_8_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a8585c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x655, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_287:
	.word 0xd2ffe170  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x0170] %asi
	.word 0xd2800c40  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r9
	.word 0x8d802004  ! 350: WRFPRS_I	wr	%r0, 0x0004, %fprs
dvapa_8_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfd7, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc00d  ! 351: STXFSR_R	st-sfr	%f1, [%r13, %r31]
cmp_8_289:
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
cmp_startwait8_289:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_8_289
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait8_289:
    brnz,a %r10, cmp_wait8_289
    ld [%r23], %r10
    ba cmp_startwait8_289
    mov 0x8, %r10
continue_cmp_8_289:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_8_289
    mov 20, %r17
    best_set_reg(0x94e003d7c7a2c962, %r16, %r17)
cmp_multi_core_8_289:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0xa3a00166  ! 352: FABSq	dis not found

	.word 0xc1bfd960  ! 353: STDFA_R	stda	%f0, [%r0, %r31]
brcommon2_8_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe515000b  ! 1: LDQF_R	-	[%r20, %r11], %f18
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfc2c0  ! 354: STDFA_R	stda	%f0, [%r0, %r31]
donret_8_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_292-donret_8_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001d43fd | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9ce, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_292:
	.word 0x93a509d2  ! 355: FDIVd	fdivd	%f20, %f18, %f40
pmu_8_293:
	nop
	setx 0xfffff4c3fffff8bd, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_8_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_294-donret_8_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a8d321 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5cc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_294:
	.word 0xe46fe0c2  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x00c2]
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
    brnz %r10, sma_8_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 358: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_8_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_296
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
cwq_8_296:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 360: RDPC	rd	%pc, %r11
splash_cmpr_8_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 361: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_8_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d95000b  ! 362: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
brcommon3_8_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c010  ! 1: STQF_R	-	%f13, [%r16, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdabfc034  ! 363: STDA_R	stda	%r13, [%r31 + %r20] 0x01
intveclr_8_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0xaf82cb3bfdd65843, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tick_8_301:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xc2526b6a308e64b9, %r16, %r17)
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_8_302:
	nop
	ta T_CHANGE_HPRIV
	set 0x8c140daf, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_8_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_303
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
cwq_8_303:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 367: RDPC	rd	%pc, %r10
    set 0x2b20, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b487d4  ! 368: PDIST	pdistn	%d18, %d20, %d8
splash_lsu_8_304:
	nop
	ta T_CHANGE_HPRIV
	set 0x887ba173, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_8_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
dvapa_8_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe31, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97a049a1  ! 371: FDIVs	fdivs	%f1, %f1, %f11
pmu_8_307:
	nop
	setx 0xfffff92bfffff6c4, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_308:
	nop
	setx 0xfffff0e8fffff8e2, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_8_309:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe120  ! 374: STDFA_I	stda	%f16, [0x0120, %r31]
tagged_8_310:
	tsubcctv %r11, 0x16b5, %r3
	.word 0xd407e041  ! 375: LDUW_I	lduw	[%r31 + 0x0041], %r10
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
    brnz %r10, cwq_8_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_311
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
cwq_8_311:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 376: RDPC	rd	%pc, %r12
trapasi_8_312:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8d84b60  ! 377: LDXA_R	ldxa	[%r1, %r0] 0x5b, %r12
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9034df  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x14df, %pstate
	.word 0xd93fc00a  ! 379: STDF_R	std	%f12, [%r10, %r31]
mondo_8_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d934007  ! 380: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
fpinit_8_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 381: FCMPd	fcmpd	%fcc<n>, %f0, %f4
dvapa_8_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd15, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fde00  ! 382: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8d903ada  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x1ada, %pstate
pmu_8_319:
	nop
	setx 0xfffff93ffffff388, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e070  ! 385: LDSHA_I	ldsha	[%r31, + 0x0070] %asi, %r12
	.word 0x8d9027e1  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x07e1, %pstate
fpinit_8_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 387: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xc19fdc00  ! 388: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9bb1c552  ! 389: FCMPEQ16	fcmpeq16	%d38, %d18, %r13
donret_8_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_322-donret_8_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c1315f | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x19d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_322:
	.word 0xe8ffe128  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0128] %asi
	.word 0x9945c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xab82800c  ! 392: WR_CLEAR_SOFTINT_R	wr	%r10, %r12, %clear_softint
	setx 0x9fae1bc722c73f86, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe7e7e008  ! 394: CASA_R	casa	[%r31] %asi, %r8, %r19
	setx 0x4769e45854349cd0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cerer_8_326:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xd599a2311e2caf6b, %r16, %r17)
    sethi %hi(0x20008000), %r16   ! Set ITTM/DTTM
    sllx %r16, 32, %r16
    or %r16, %r17, %r17
    mov 0x10, %r16
    stxa %r17, [%r16]0x4c
	.word 0x91524000  ! 396: RDPR_CWP	<illegal instruction>
dvapa_8_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf87, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 397: LDDFA_R	ldda	[%r31, %r0], %f0
fpinit_8_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8333a  ! 398: PREFETCHA_I	prefetcha	[%r0, + 0xfffff33a] %asi, #one_read
	.word 0xe7e7e009  ! 399: CASA_R	casa	[%r31] %asi, %r9, %r19
unsupttte_8_330:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ad0a4a  ! 400: FCMPd	fcmpd	%fcc<n>, %f20, %f10
vahole_8_331:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfdb60  ! 401: STDFA_R	stda	%f16, [%r0, %r31]
cmpenall_8_332:
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
cmpenall_startwait8_332:
    mov 0x8, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_8_332
    nop
cmpenall_wait8_332:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait8_332
    nop
    ba,a cmpenall_startwait8_332
continue_cmpenall_8_332:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_8_332:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_8_332
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_8_332:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_8_332
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
	.word 0xe8800c40  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r20
	.word 0x95a00173  ! 2: FABSq	dis not found

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
    bne,a wait_for_stat_4_1
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_1:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_1
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_1:
    best_set_reg(0x000000408bc00f1c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc013  ! 3: STDF_R	std	%f17, [%r19, %r31]
donret_4_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_2-donret_4_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0063239f | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cce, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_2:
	.word 0xe26fe106  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x0106]
	setx 0x3085aa32f7c939b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 6: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
pmu_4_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff426ffffffe9, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x94fb6bb0  ! 8: SDIVcc_I	sdivcc 	%r13, 0x0bb0, %r10
splash_cmpr_4_6:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_4_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_7
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
cwq_4_7:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 10: RDPC	rd	%pc, %r13
pmu_4_8:
	nop
	setx 0xfffffb2ffffff16f, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a00170  ! 12: FABSq	dis not found

ibp_4_10:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_10:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_10
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_10:
    brnz %r16, ibp_wait4_10
    ld [%r23], %r16
    ba ibp_startwait4_10
    mov 0x4, %r16
continue_ibp_4_10:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_10:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_10
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_10:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_10
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_10:
    best_set_reg(0x00000040bbcf1c1e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfd960  ! 13: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_4_11:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2d04980  ! 14: LDSHA_R	ldsha	[%r1, %r0] 0x4c, %r17
splash_cmpr_4_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 15: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x87aa8a45  ! 16: FCMPd	fcmpd	%fcc<n>, %f10, %f36
pmu_4_14:
	nop
	setx 0xfffff8d3fffffea2, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903671  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x1671, %pstate
splash_cmpr_4_16:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 19: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_4_17:
	nop
	ta T_CHANGE_HPRIV
	set 0xa2859a38, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    bne,a wait_for_stat_4_18
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_18:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_18
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_18:
    best_set_reg(0x00000040aedc1ec7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc3ec0033  ! 22: PREFETCHA_R	prefetcha	[%r16, %r19] 0x01, #one_read
fpinit_4_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 23: FDIVs	fdivs	%f0, %f4, %f8
mondo_4_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950001  ! 24: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
intveclr_4_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2d70d8eb668792a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc75fffff0f4, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_4_23:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_4_24:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xdad84980  ! 28: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r13
	.word 0x87802014  ! 29: WRASI_I	wr	%r0, 0x0014, %asi
ibp_4_25:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_25:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_25
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_25:
    brnz %r16, ibp_wait4_25
    ld [%r23], %r16
    ba ibp_startwait4_25
    mov 0x4, %r16
continue_ibp_4_25:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_25:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_25
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_25:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_25
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_25:
    best_set_reg(0x000000401bdec7f4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc2c0  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
dvapa_4_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0xafb, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda3ffa91  ! 31: STD_I	std	%r13, [%r31 + 0xfffffa91]
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
    brnz %r10, cwq_4_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_27
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
cwq_4_27:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 32: RDPC	rd	%pc, %r10
	.word 0x8d902133  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x0133, %pstate
	.word 0x91a00170  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_30) + 40, 16, 16)) -> intp(6,0,21)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_30)&0xffffffff)  + 40, 16, 16)) -> intp(6,0,21)
#else
	setx 0x6356526aaa806f4c, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_4_31:
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
	.word 0x93b40992  ! 36: BSHUFFLE	fmovc32	%d16, %d18, %d40
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd44fe108  ! 38: LDSB_I	ldsb	[%r31 + 0x0108], %r10
splash_cmpr_4_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0xe7d7256763e9ce59, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_4_34:
	nop
	setx 0xfffffed7fffff2f6, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_35:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e048  ! 44: LDSWA_I	ldswa	[%r31, + 0x0048] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_4_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 46: FDIVd	fdivd	%f0, %f4, %f6
cwp_4_37:
    set user_data_start, %o7
	.word 0x93902003  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
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
    bne,a wait_for_stat_4_38
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_38:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_38
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_38:
    best_set_reg(0x0000004014c7f49e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xd49fc033  ! 48: LDDA_R	ldda	[%r31, %r19] 0x01, %r10
pmu_4_39:
	nop
	setx 0xfffff1eafffff70f, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_4_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 50: FDIVs	fdivs	%f0, %f4, %f4
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
    brnz %r10, cwq_4_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_41
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
cwq_4_41:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 51: RDPC	rd	%pc, %r19
	.word 0x91948004  ! 52: WRPR_PIL_R	wrpr	%r18, %r4, %pil
mondo_4_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d940008  ! 53: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
dvapa_4_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0x840, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd960  ! 54: LDDFA_R	ldda	[%r31, %r0], %f16
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
    bne,a wait_for_stat_4_45
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_45:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_45
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_45:
    best_set_reg(0x00000050fdf49efc,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdc00  ! 55: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_4_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 56: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c83  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x1c83, %pstate
splash_lsu_4_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x61235a74, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target2, %r18, %r27
	.word 0x9bb447c8  ! 59: PDIST	pdistn	%d48, %d8, %d44
splash_hpstate_4_50:
	ta T_CHANGE_NONHPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982d9e  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9e, %hpstate
	setx vahole_target0, %r18, %r27
	.word 0xc1bfe040  ! 61: STDFA_I	stda	%f0, [0x0040, %r31]
splash_lsu_4_52:
	nop
	ta T_CHANGE_HPRIV
	set 0xf3b07c7c, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_4_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_53
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
cwq_4_53:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 63: RDPC	rd	%pc, %r9
cwp_4_54:
    set user_data_start, %o7
	.word 0x93902003  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	setx 0x3a4da3b9614da54f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target1, %r18, %r27
	.word 0xd4bfc033  ! 66: STDA_R	stda	%r10, [%r31 + %r19] 0x01
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_4_58:
	tsubcctv %r18, 0x1a1f, %r2
	.word 0xd407e0e0  ! 68: LDUW_I	lduw	[%r31 + 0x00e0], %r10
jmptr_4_59:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d924004  ! 70: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
donret_4_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_61-donret_4_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00241658 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14c1, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_61:
	.word 0xd4ffe000  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x0000] %asi
ibp_4_62:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_62:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_62
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_62:
    brnz %r16, ibp_wait4_62
    ld [%r23], %r16
    ba ibp_startwait4_62
    mov 0x4, %r16
continue_ibp_4_62:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_62:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_62
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_62:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_62
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_62:
    best_set_reg(0x00000040eedefc96,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x87ac0a4d  ! 72: FCMPd	fcmpd	%fcc<n>, %f16, %f44
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d9030f9  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x10f9, %pstate
dvapa_4_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc80, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfdc00  ! 74: STDFA_R	stda	%f0, [%r0, %r31]
	setx vahole_target1, %r18, %r27
	.word 0x95b28494  ! 75: FCMPLE32	fcmple32	%d10, %d20, %r10
pmu_4_66:
	nop
	setx 0xfffff351fffff097, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_67-donret_4_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bc022c | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c07, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_4_67:
	.word 0xd2ffe081  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x0081] %asi
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
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_68:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 78: RDPC	rd	%pc, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_4_70:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe4904a00  ! 80: LDUHA_R	lduha	[%r1, %r0] 0x50, %r18
tglhtw_4_71:
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
	.word 0xa1b44988  ! 81: BSHUFFLE	fmovc32	%d48, %d8, %d16
pmu_4_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff12ffffff78f, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_4_73:
	taddcctv %r12, 0x1471, %r12
	.word 0xd607e184  ! 83: LDUW_I	lduw	[%r31 + 0x0184], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_74) + 24, 16, 16)) -> intp(2,0,17)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_74)&0xffffffff)  + 24, 16, 16)) -> intp(2,0,17)
#else
	setx 0x51b0b6aa7ebcf5cc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 85: Tcc_I	te	icc_or_xcc, %r0 + 180
    set 0x22a4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b487c4  ! 86: PDIST	pdistn	%d18, %d4, %d10
	.word 0x91924007  ! 87: WRPR_PIL_R	wrpr	%r9, %r7, %pil
	.word 0x91920012  ! 88: WRPR_PIL_R	wrpr	%r8, %r18, %pil
pmu_4_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff416fffff4fa, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
	setx vahole_target3, %r18, %r27
	.word 0xd33fc00a  ! 91: STDF_R	std	%f9, [%r10, %r31]
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
    bne,a wait_for_stat_4_79
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_79:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_79
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_79:
    best_set_reg(0x00000040d7fc9623,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa5a189cc  ! 92: FDIVd	fdivd	%f6, %f12, %f18
splash_lsu_4_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x283106c6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_81:
	nop
	ta T_CHANGE_HPRIV
	set 0xba06dbb2, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_4_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x94bcf228, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_83:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_4_85:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8198374d  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x174d, %hpstate
	.word 0xe01fe0a8  ! 100: LDD_I	ldd	[%r31 + 0x00a8], %r16
	.word 0xe09fe000  ! 101: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r16
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
    bne,a wait_for_stat_4_86
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_86:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_86
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_86:
    best_set_reg(0x00000050ead623f4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfe0c0  ! 102: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0x91d02032  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 50
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
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 104: CASA_R	casa	[%r31] %asi, %r9, %r16
	.word 0x9194c002  ! 105: WRPR_PIL_R	wrpr	%r19, %r2, %pil
pmu_4_89:
	nop
	setx 0xfffff263fffff1f7, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d902c69  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x0c69, %pstate
intveclr_4_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc0577fd298a890ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_4_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c971  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fdb60  ! 110: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_4_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff2f5fffff18f, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe83fed78  ! 112: STD_I	std	%r20, [%r31 + 0x0d78]
	.word 0x24c9c001  ! 113: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
dvapa_4_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc55, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95a509cd  ! 114: FDIVd	fdivd	%f20, %f44, %f10
splash_cmpr_4_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx vahole_target1, %r18, %r27
	.word 0xc32fc009  ! 116: STXFSR_R	st-sfr	%f1, [%r9, %r31]
	setx vahole_target0, %r18, %r27
	.word 0xc19fde00  ! 117: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_4_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d904006  ! 118: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
trapasi_4_101:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d04a00  ! 119: LDSHA_R	ldsha	[%r1, %r0] 0x50, %r9
splash_cmpr_4_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 120: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_4_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 121: CASA_R	casa	[%r31] %asi, %r17, %r9
dvapa_4_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdc9, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f8034b6  ! 122: SIR	sir	0x14b6
splash_hpstate_4_105:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81983459  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1459, %hpstate
	.word 0xc19fc2c0  ! 124: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_4_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d92c00c  ! 125: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
splash_tba_4_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9b500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_4_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc012  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfc3e0  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
splash_hpstate_4_110:
	.word 0x81983897  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1897, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe19fe060  ! 131: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0x91a0016a  ! 132: FABSq	dis not found

	setx 0xf81c3d703c12d875, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 134: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x8d903a4f  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x1a4f, %pstate
	.word 0xd83fc000  ! 136: STD_R	std	%r12, [%r31 + %r0]
intveclr_4_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcbf3c69f372bc609, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_118:
	nop
	setx 0xfffff602ffffffb9, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    bne,a wait_for_stat_4_119
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_119:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_119
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_119:
    best_set_reg(0x00000050fbe3f401,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87aa4a4b  ! 139: FCMPd	fcmpd	%fcc<n>, %f40, %f42
splash_lsu_4_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x12753567, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff5c3fffff4af, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a489a8  ! 142: FDIVs	fdivs	%f18, %f8, %f8
splash_cmpr_4_123:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 143: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_4_124:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 145: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_4_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x790124ddec1bf3cd, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_127:
	set 0x60740000, %r31
	.word 0x85846173  ! 148: WRCCR_I	wr	%r17, 0x0173, %ccr
	.word 0x8780204f  ! 149: WRASI_I	wr	%r0, 0x004f, %asi
intveclr_4_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0x605e544af4500184, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe08008a0  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
mondo_4_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d910012  ! 152: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	setx vahole_target3, %r18, %r27
	.word 0xc1bfc2c0  ! 153: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe08fe018  ! 154: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r16
	.word 0x91d020b5  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 181
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
    brnz %r10, cwq_4_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_131
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
cwq_4_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 156: RDPC	rd	%pc, %r16
ibp_4_132:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_132:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_132
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_132:
    brnz %r16, ibp_wait4_132
    ld [%r23], %r16
    ba ibp_startwait4_132
    mov 0x4, %r16
continue_ibp_4_132:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_132:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_132
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_132:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_132
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_132:
    best_set_reg(0x00000040fbf401f3,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc3ec002d  ! 157: PREFETCHA_R	prefetcha	[%r16, %r13] 0x01, #one_read
splash_lsu_4_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x03ebbb6d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8800c40  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r20
	setx vahole_target1, %r18, %r27
	.word 0xe1bfdf20  ! 160: STDFA_R	stda	%f16, [%r0, %r31]
brcommon1_4_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x99a509a7  ! 161: FDIVs	fdivs	%f20, %f7, %f12
splash_hpstate_4_136:
	.word 0x8198261e  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061e, %hpstate
	.word 0xd497e198  ! 163: LDUHA_I	lduha	[%r31, + 0x0198] %asi, %r10
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe060  ! 164: STDFA_I	stda	%f0, [0x0060, %r31]
pmu_4_138:
	nop
	setx 0xfffffa7dfffff135, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target0, %r18, %r27
	.word 0xd53fc008  ! 166: STDF_R	std	%f10, [%r8, %r31]
intveclr_4_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0xf2e3b045c6de954a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902661  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x0661, %pstate
	.word 0x8780208a  ! 169: WRASI_I	wr	%r0, 0x008a, %asi
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
    bne,a wait_for_stat_4_142
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_142:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_142
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_142:
    best_set_reg(0x00000050d2c1f3b9,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x87ac4a4d  ! 170: FCMPd	fcmpd	%fcc<n>, %f48, %f44
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_4_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 172: FCMPd	fcmpd	%fcc<n>, %f0, %f4
dvapa_4_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa36, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc033  ! 173: STDA_R	stda	%r18, [%r31 + %r19] 0x01
intveclr_4_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x18d9da6642354359, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe0d8  ! 175: LDDF_I	ldd	[%r31, 0x00d8], %f18
donret_4_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_147-donret_4_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e0c3a0 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb6c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_147:
	.word 0xe4ffe168  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x0168] %asi
	.word 0xe19fe120  ! 177: LDDFA_I	ldda	[%r31, 0x0120], %f16
	.word 0x93d020b5  ! 178: Tcc_I	tne	icc_or_xcc, %r0 + 181
fpinit_4_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 179: FDIVs	fdivs	%f0, %f4, %f4
splash_cmpr_4_149:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 180: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_4_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_150
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
cwq_4_150:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 181: RDPC	rd	%pc, %r10
	.word 0x87ac0a54  ! 182: FCMPd	fcmpd	%fcc<n>, %f16, %f20
	.word 0x97a00174  ! 183: FABSq	dis not found

	setx vahole_target2, %r18, %r27
	.word 0xc1bfe060  ! 184: STDFA_I	stda	%f0, [0x0060, %r31]
mondo_4_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 185: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xc1bfe1e0  ! 186: STDFA_I	stda	%f0, [0x01e0, %r31]
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
    brnz %r10, sma_4_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 187: CASA_R	casa	[%r31] %asi, %r18, %r13
pmu_4_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc2cfffff728, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_4_158:
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0xda3fc010  ! 1: STD_R	std	%r13, [%r31 + %r16]
	normalw
	.word 0x91458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x91944014  ! 190: WRPR_PIL_R	wrpr	%r17, %r20, %pil
splash_cmpr_4_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 191: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_4_161:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_4_162:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_162:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_162
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_162:
    brnz %r16, ibp_wait4_162
    ld [%r23], %r16
    ba ibp_startwait4_162
    mov 0x4, %r16
continue_ibp_4_162:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_162:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_162
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_162:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_162
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_162:
    best_set_reg(0x000000501bf3b9c2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xa9703238  ! 193: POPC_I	popc	0x1238, %r20
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_4_164:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_164:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_164
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_164:
    brnz %r16, ibp_wait4_164
    ld [%r23], %r16
    ba ibp_startwait4_164
    mov 0x4, %r16
continue_ibp_4_164:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_164:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_164
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_164:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_164
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_164:
    best_set_reg(0x00000040e5f9c226,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc19fd960  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_4_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e009  ! 196: CASA_R	casa	[%r31] %asi, %r9, %r20
splash_tba_4_166:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x097aa49fa1922ad7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_4_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 199: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xa7a0016a  ! 200: FABSq	dis not found

trapasi_4_170:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0d84980  ! 201: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r16
splash_tba_4_171:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e010  ! 203: LDQFA_I	-	[%r31, 0x0010], %f16
	.word 0x8780204f  ! 204: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa7454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
memptr_4_172:
	set 0x60740000, %r31
	.word 0x8582bcb6  ! 206: WRCCR_I	wr	%r10, 0x1cb6, %ccr
splash_cmpr_4_173:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 207: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_4_175:
	nop
	setx 0xfffffa7cfffff4fb, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_4_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_176
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
cwq_4_176:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 210: RDPC	rd	%pc, %r8
	.word 0x91d020b2  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
	setx vahole_target2, %r18, %r27
	.word 0xa9a509d0  ! 213: FDIVd	fdivd	%f20, %f16, %f20
	.word 0xda8008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_4_179:
	nop
	setx 0xfffffd6dfffffa17, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_4_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c032  ! 1: CASA_I	casa	[%r31] 0x 1, %r18, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xda9fc034  ! 216: LDDA_R	ldda	[%r31, %r20] 0x01, %r13
trapasi_4_181:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xda9044a0  ! 217: LDUHA_R	lduha	[%r1, %r0] 0x25, %r13
pmu_4_182:
	nop
	setx 0xfffffd50fffff8bb, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_183-donret_4_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002d5613 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1811, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_183:
	.word 0xda6fe144  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x0144]
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
    brnz %r10, sma_4_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 220: CASA_R	casa	[%r31] %asi, %r18, %r13
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
    brnz %r10, cwq_4_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_185
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
cwq_4_185:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 221: RDPC	rd	%pc, %r16
ibp_4_186:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_186:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_186
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_186:
    brnz %r16, ibp_wait4_186
    ld [%r23], %r16
    ba ibp_startwait4_186
    mov 0x4, %r16
continue_ibp_4_186:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_186:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_186
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_186:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_186
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_186:
    best_set_reg(0x000000403dc226e8,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa37033fd  ! 222: POPC_I	popc	0x13fd, %r17
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d903882  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x1882, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_4_189:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_189:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_189
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_189:
    brnz %r16, ibp_wait4_189
    ld [%r23], %r16
    ba ibp_startwait4_189
    mov 0x4, %r16
continue_ibp_4_189:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_189:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_189
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_189:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_189
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_189:
    best_set_reg(0x000000400be6e849,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfda00  ! 226: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_4_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe097c02c  ! 228: LDUHA_R	lduha	[%r31, %r12] 0x01, %r16
	.word 0xa1902000  ! 229: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_4_191:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 230: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_4_192:
	nop
	ta T_CHANGE_HPRIV
	set 0xcd53d6dc, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xc3ec0032  ! 232: PREFETCHA_R	prefetcha	[%r16, %r18] 0x01, #one_read
jmptr_4_194:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_4_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9e6, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e009  ! 234: CASA_R	casa	[%r31] %asi, %r9, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_196:
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
    brnz %r10, sma_4_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 236: CASA_R	casa	[%r31] %asi, %r11, %r17
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
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 237: CASA_R	casa	[%r31] %asi, %r20, %r17
	setx 0xb0eed2b733970ed3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_4_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe2e8  ! 1: PREFETCH_I	prefetch	[%r31 + 0x02e8], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fdb60  ! 239: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_4_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 240: CASA_R	casa	[%r31] %asi, %r19, %r17
	.word 0x8780208b  ! 241: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_4_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_202-donret_4_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ce953e | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfc5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_202:
	.word 0xa9a2c9d4  ! 243: FDIVd	fdivd	%f42, %f20, %f20
	.word 0xe0dfe0f0  ! 244: LDXA_I	ldxa	[%r31, + 0x00f0] %asi, %r16
pmu_4_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff854fffff0db, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_4_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_204:
	.word 0x8f902001  ! 246: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
pmu_4_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff210fffff26d, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_4_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_206
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
cwq_4_206:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 248: RDPC	rd	%pc, %r11
donret_4_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_207-donret_4_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0031e0d4 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c9e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_207:
	.word 0xa7a249c3  ! 249: FDIVd	fdivd	%f40, %f34, %f50
ibp_4_208:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_208:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_208
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_208:
    brnz %r16, ibp_wait4_208
    ld [%r23], %r16
    ba ibp_startwait4_208
    mov 0x4, %r16
continue_ibp_4_208:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_208:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_208
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_208:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_208
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_208:
    best_set_reg(0x0000005031e84931,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91702f9f  ! 250: POPC_I	popc	0x0f9f, %r8
fpinit_4_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82f9f  ! 251: PREFETCHA_I	prefetcha	[%r0, + 0x0f9f] %asi, #one_read
change_to_randtl_4_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_210:
	.word 0x8f902001  ! 252: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
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
    brnz %r10, cwq_4_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_211
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
cwq_4_211:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 253: RDPC	rd	%pc, %r8
memptr_4_212:
	set 0x60140000, %r31
	.word 0x85852bbe  ! 254: WRCCR_I	wr	%r20, 0x0bbe, %ccr
dvapa_4_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc4b, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ad0a50  ! 255: FCMPd	fcmpd	%fcc<n>, %f20, %f16
donret_4_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_214-donret_4_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00974f99 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xed4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_214:
	.word 0x99a109d0  ! 256: FDIVd	fdivd	%f4, %f16, %f12
	.word 0xda3fe062  ! 257: STD_I	std	%r13, [%r31 + 0x0062]
dvapa_4_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe44, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb3fc00a  ! 258: STDF_R	std	%f13, [%r10, %r31]
	.word 0xc19fd960  ! 259: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_4_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 260: CASA_R	casa	[%r31] %asi, %r18, %r13
pmu_4_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff01afffffa56, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_4_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd77fffff5fb, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_220:
	nop
	setx 0xfffff4b0fffff6e7, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xba22a45a267690a6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_222:
	nop
	ta T_CHANGE_HPRIV
	set 0x2b3b62d1, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_4_223:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_223:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_223
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_223:
    brnz %r16, ibp_wait4_223
    ld [%r23], %r16
    ba ibp_startwait4_223
    mov 0x4, %r16
continue_ibp_4_223:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_223:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_223
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_223:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_223
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_223:
    best_set_reg(0x00000050cbc931e6,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc19fd960  ! 267: LDDFA_R	ldda	[%r31, %r0], %f0
mondo_4_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d91000a  ! 268: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
donret_4_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_225-donret_4_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ae85b6 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d81, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x24cc0001  ! 1: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	done
donretarg_4_225:
	.word 0xda6fe1df  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x01df]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_226) + 56, 16, 16)) -> intp(2,0,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_226)&0xffffffff)  + 56, 16, 16)) -> intp(2,0,1)
#else
	setx 0xdb3ecf32bb5b104f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe090  ! 272: LDDA_I	ldda	[%r31, + 0x0090] %asi, %r13
intveclr_4_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0xdcfa76b34c3e2cbd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_4_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0x98c, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93b507d1  ! 274: PDIST	pdistn	%d20, %d48, %d40
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_4_230:
	.word 0x8198330f  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x130f, %hpstate
	.word 0xe4800a80  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r18
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
    brnz %r10, sma_4_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 278: CASA_R	casa	[%r31] %asi, %r9, %r18
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 279: Tcc_R	tne	icc_or_xcc, %r0 + %r30
brcommon2_4_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc011  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe000  ! 280: STDFA_I	stda	%f0, [0x0000, %r31]
	setx vahole_target0, %r18, %r27
	.word 0xe1bfe160  ! 281: STDFA_I	stda	%f16, [0x0160, %r31]
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
    brnz %r10, sma_4_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e013  ! 282: CASA_R	casa	[%r31] %asi, %r19, %r12
splash_lsu_4_235:
	nop
	ta T_CHANGE_HPRIV
	set 0xac9998fb, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc3e0  ! 284: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d90336c  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x136c, %pstate
memptr_4_237:
	set user_data_start, %r31
	.word 0x8580e407  ! 286: WRCCR_I	wr	%r3, 0x0407, %ccr
memptr_4_238:
	set 0x60140000, %r31
	.word 0x8584bbe1  ! 287: WRCCR_I	wr	%r18, 0x1be1, %ccr
	.word 0xa782400b  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r11, %-
	.word 0xc36aad3f  ! 289: PREFETCH_I	prefetch	[%r10 + 0x0d3f], #one_read
intveclr_4_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0x9e2a86a4ef6ec351, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e014  ! 291: CASA_R	casa	[%r31] %asi, %r20, %r10
	.word 0x8d802004  ! 292: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_4_243:
	nop
	setx 0xfffffa28fffff8aa, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_244) + 56, 16, 16)) -> intp(3,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_244)&0xffffffff)  + 56, 16, 16)) -> intp(3,0,6)
#else
	setx 0x3c482f7f79aa1531, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_4_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 295: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_4_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d91400b  ! 296: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
	.word 0x95524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_4_247:
	nop
	setx 0xfffff590fffff0b6, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_4_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902000  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	setx 0x766974c1f7829440, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f8029a0  ! 301: SIR	sir	0x09a0
ibp_4_251:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_251:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_251
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_251:
    brnz %r16, ibp_wait4_251
    ld [%r23], %r16
    ba ibp_startwait4_251
    mov 0x4, %r16
continue_ibp_4_251:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_251:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_251
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_251:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_251
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_251:
    best_set_reg(0x0000005028f1e678,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xe1bfdb60  ! 302: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_4_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf04, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac8a52  ! 303: FCMPd	fcmpd	%fcc<n>, %f18, %f18
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
    brnz %r10, cwq_4_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_253
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
cwq_4_253:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 304: RDPC	rd	%pc, %r12
pmu_4_254:
	nop
	setx 0xffffff2bfffff92b, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_255:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_4_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_256
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
cwq_4_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 307: RDPC	rd	%pc, %r20
splash_hpstate_4_257:
	ta T_CHANGE_NONHPRIV
	.word 0x81983e00  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e00, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0xa9a00165  ! 310: FABSq	dis not found

	.word 0x91d02033  ! 311: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_4_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0xb1c771407faab757, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_4_260:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_260:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_260
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_260:
    brnz %r16, ibp_wait4_260
    ld [%r23], %r16
    ba ibp_startwait4_260
    mov 0x4, %r16
continue_ibp_4_260:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_260:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_260
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_260:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_260
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_260:
    best_set_reg(0x000000409be67808,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfe060  ! 313: STDFA_I	stda	%f0, [0x0060, %r31]
jmptr_4_261:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 315: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
ibp_4_263:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_263:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_263
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_263:
    brnz %r16, ibp_wait4_263
    ld [%r23], %r16
    ba ibp_startwait4_263
    mov 0x4, %r16
continue_ibp_4_263:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_263:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_263
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_263:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_263
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_263:
    best_set_reg(0x0000004035f80834,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0xc1bfe0e0  ! 316: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xe127e094  ! 317: STF_I	st	%f16, [0x0094, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_4_264:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_264:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_264
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_264:
    brnz %r16, ibp_wait4_264
    ld [%r23], %r16
    ba ibp_startwait4_264
    mov 0x4, %r16
continue_ibp_4_264:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_264:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_264
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_264:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_264
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_264:
    best_set_reg(0x00000040dbc83458,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc010  ! 319: STXFSR_R	st-sfr	%f1, [%r16, %r31]
	.word 0xc19fdb60  ! 320: LDDFA_R	ldda	[%r31, %r0], %f0
	setx vahole_target1, %r18, %r27
	.word 0xe1bfe1e0  ! 321: STDFA_I	stda	%f16, [0x01e0, %r31]
intveclr_4_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0xca82d02c31218a54, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_268:
	nop
	setx 0xfffff4fcfffff6a0, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a000d4  ! 324: FNEGd	fnegd	%f20, %f16
intveclr_4_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x969880da2eb0a477, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_4_270:
	tsubcctv %r5, 0x1a97, %r16
	.word 0xd807e104  ! 326: LDUW_I	lduw	[%r31 + 0x0104], %r12
	setx 0xd8f9d843be9dcfea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_4_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f803e03  ! 1: SIR	sir	0x1e03
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe0a0  ! 328: STDFA_I	stda	%f16, [0x00a0, %r31]
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
    brnz %r10, sma_4_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00b  ! 329: CASA_R	casa	[%r31] %asi, %r11, %r10
dvapa_4_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0x9da, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91b487c2  ! 330: PDIST	pdistn	%d18, %d2, %d8
	setx vahole_target3, %r18, %r27
	.word 0x957024e9  ! 331: POPC_I	popc	0x04e9, %r10
dvapa_4_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0x999, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 332: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_4_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 333: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa5520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_4_278:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 335: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x99702afe  ! 336: POPC_I	popc	0x0afe, %r12
	setx vahole_target1, %r18, %r27
	.word 0x97702897  ! 337: POPC_I	popc	0x0897, %r11
jmptr_4_280:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9028cb  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x08cb, %pstate
ceter_4_282:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa3410000  ! 340: RDTICK	rd	%tick, %r17
	.word 0x97703d9a  ! 341: POPC_I	popc	0x1d9a, %r11
	.word 0xd847e040  ! 342: LDSW_I	ldsw	[%r31 + 0x0040], %r12
	.word 0x9190800c  ! 343: WRPR_PIL_R	wrpr	%r2, %r12, %pil
	.word 0xd837e1c7  ! 344: STH_I	sth	%r12, [%r31 + 0x01c7]
ibp_4_285:
	nop
    ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
ibp_startwait4_285:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_ibp_4_285
    mov (~0x4&0xf), %r16
    ld [%r23], %r16
ibp_wait4_285:
    brnz %r16, ibp_wait4_285
    ld [%r23], %r16
    ba ibp_startwait4_285
    mov 0x4, %r16
continue_ibp_4_285:
    sllx %r16, %r8, %r16        !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_4_285:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_4_285
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_ibp_4_285:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_ibp_4_285
    ldxa [0x50]%asi, %r14       !Running_rw
ibp_doit4_285:
    best_set_reg(0x0000005001f458f2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r16, [0x60] %asi     !Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          !restore %asi
	.word 0x91b40494  ! 345: FCMPLE32	fcmple32	%d16, %d20, %r8
	.word 0x39400001  ! 346: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd337e1d0  ! 347: STQF_I	-	%f9, [0x01d0, %r31]
donret_4_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_287-donret_4_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0096ae6b | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1787, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_4_287:
	.word 0xd2ffe190  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x0190] %asi
	.word 0xd28008a0  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d802000  ! 350: WRFPRS_I	wr	%r0, 0x0000, %fprs
dvapa_4_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0xee6, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd23fe410  ! 351: STD_I	std	%r9, [%r31 + 0x0410]
	.word 0xa5a0016b  ! 352: FABSq	dis not found

	.word 0xc19fd920  ! 353: LDDFA_R	ldda	[%r31, %r0], %f0
brcommon2_4_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00b  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fdb60  ! 354: LDDFA_R	ldda	[%r31, %r0], %f16
donret_4_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_292-donret_4_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ecf33f | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_292:
	.word 0x97a489d4  ! 355: FDIVd	fdivd	%f18, %f20, %f42
pmu_4_293:
	nop
	setx 0xfffff319fffffe57, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_294-donret_4_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0024aaa8 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe85, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_294:
	.word 0xe46fe06d  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x006d]
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
    brnz %r10, sma_4_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 358: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_4_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_296
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
cwq_4_296:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 360: RDPC	rd	%pc, %r17
splash_cmpr_4_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 361: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_4_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d928010  ! 362: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
brcommon3_4_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c00d  ! 1: STQF_R	-	%f13, [%r13, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fc010  ! 363: LDDF_R	ldd	[%r31, %r16], %f13
intveclr_4_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0x24d1343ec52018da, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_4_302:
	nop
	ta T_CHANGE_HPRIV
	set 0x7cb3f245, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_4_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_303
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
cwq_4_303:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 367: RDPC	rd	%pc, %r18
    set 0x2083, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b487ca  ! 368: PDIST	pdistn	%d18, %d10, %d50
splash_lsu_4_304:
	nop
	ta T_CHANGE_HPRIV
	set 0x34e3e90e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_4_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
dvapa_4_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8d0, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x95a089b0  ! 371: FDIVs	fdivs	%f2, %f16, %f10
pmu_4_307:
	nop
	setx 0xfffff73afffffc88, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_308:
	nop
	setx 0xfffff742fffff53c, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe1bfc3e0  ! 374: STDFA_R	stda	%f16, [%r0, %r31]
tagged_4_310:
	tsubcctv %r4, 0x101c, %r18
	.word 0xd407e090  ! 375: LDUW_I	lduw	[%r31 + 0x0090], %r10
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
    brnz %r10, cwq_4_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_311
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
cwq_4_311:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 376: RDPC	rd	%pc, %r10
trapasi_4_312:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8884b60  ! 377: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r12
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d902b51  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x0b51, %pstate
	.word 0xd83ff33a  ! 379: STD_I	std	%r12, [%r31 + 0xfffff33a]
mondo_4_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94800c  ! 380: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
fpinit_4_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 381: FCMPLE32	fcmple32	%d0, %d4, %r8
dvapa_4_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd73, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 382: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8d9039d9  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x19d9, %pstate
pmu_4_319:
	nop
	setx 0xfffffc63fffff7f2, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e050  ! 385: LDSHA_I	ldsha	[%r31, + 0x0050] %asi, %r12
	.word 0x8d90344d  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x144d, %pstate
fpinit_4_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 387: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xc19fda00  ! 388: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa9b48549  ! 389: FCMPEQ16	fcmpeq16	%d18, %d40, %r20
donret_4_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_322-donret_4_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004bd3f0 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c9a, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_322:
	.word 0xe8ffe138  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0138] %asi
	.word 0x9b45c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xab844006  ! 392: WR_CLEAR_SOFTINT_R	wr	%r17, %r6, %clear_softint
	setx 0xf4239d16badeb18f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fc008  ! 394: STXFSR_R	st-sfr	%f1, [%r8, %r31]
	setx 0x21cb2141cc07643a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9524000  ! 396: RDPR_CWP	<illegal instruction>
dvapa_4_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8d8, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe180  ! 397: STDFA_I	stda	%f16, [0x0180, %r31]
fpinit_4_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 398: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xe69fc030  ! 399: LDDA_R	ldda	[%r31, %r16] 0x01, %r19
	.word 0xc3ec4030  ! 400: PREFETCHA_R	prefetcha	[%r17, %r16] 0x01, #one_read
	setx vahole_target2, %r18, %r27
	.word 0xc1bfe1c0  ! 401: STDFA_I	stda	%f0, [0x01c0, %r31]
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
	.word 0xe8800b20  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r20
	.word 0x95a00168  ! 2: FABSq	dis not found

ibp_2_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc008  ! 3: STDF_R	std	%f17, [%r8, %r31]
donret_2_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_2-donret_2_2-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0001748b | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6d7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2ccc8001  ! 1: BRGZ	brgz,a,pt	%r18,<label_0xc8001>
	retry
donretarg_2_2:
	.word 0xe26fe06b  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x006b]
	setx 0x45ebf1f2794e513d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d91c011  ! 6: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
pmu_2_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff87cffffff36, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9afc6ff9  ! 8: SDIVcc_I	sdivcc 	%r17, 0x0ff9, %r13
splash_cmpr_2_6:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 9: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_2_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_7
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
cwq_2_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 10: RDPC	rd	%pc, %r20
pmu_2_8:
	nop
	setx 0xfffff632fffffbdc, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00174  ! 12: FABSq	dis not found

ibp_2_10:
	nop
	.word 0xc19fde00  ! 13: LDDFA_R	ldda	[%r31, %r0], %f0
trapasi_2_11:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2d84980  ! 14: LDXA_R	ldxa	[%r1, %r0] 0x4c, %r17
splash_cmpr_2_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 15: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
iaw_2_13:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_13:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_13
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_13:
    brnz %r16, iaw_wait2_13
    ld [%r23], %r16
    ba iaw_startwait2_13
    mov 0x2, %r16
continue_iaw_2_13:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_13:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_13
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_13:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_13
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_13:
	mov 0x38, %r18
iaw3_2_13:
	setx vahole_target0, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7a0c9c5  ! 16: FDIVd	fdivd	%f34, %f36, %f50
pmu_2_14:
	nop
	setx 0xfffffa09fffffebc, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d903e87  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x1e87, %pstate
splash_cmpr_2_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 19: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_2_17:
	nop
	ta T_CHANGE_HPRIV
	set 0x49f6ca3c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_2_18:
	nop
	.word 0x91b4048d  ! 22: FCMPLE32	fcmple32	%d16, %d44, %r8
fpinit_2_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 23: FDIVs	fdivs	%f0, %f4, %f4
mondo_2_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d940014  ! 24: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
intveclr_2_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0xe96ac7d836395159, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff4e6fffff51c, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_2_23:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_2_24:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x4c) 
	.word 0xda904980  ! 28: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r13
	.word 0x87802083  ! 29: WRASI_I	wr	%r0, 0x0083, %asi
ibp_2_25:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0a0  ! 30: STDFA_I	stda	%f0, [0x00a0, %r31]
dvapa_2_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0x911, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdadfc028  ! 31: LDXA_R	ldxa	[%r31, %r8] 0x01, %r13
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
    brnz %r10, cwq_2_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_27
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
cwq_2_27:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 32: RDPC	rd	%pc, %r8
	.word 0x8d90389b  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x189b, %pstate
	.word 0xa5a00166  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_30) + 24, 16, 16)) -> intp(3,0,9)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_30)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,9)
#else
	setx 0xb2c16e943f5e6ad6, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_2_31:
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
	.word 0x99b1098d  ! 36: BSHUFFLE	fmovc32	%d4, %d44, %d12
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd44fe070  ! 38: LDSB_I	ldsb	[%r31 + 0x0070], %r10
splash_cmpr_2_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x7b44cc393b2102eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 41: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_2_34:
	nop
	setx 0xfffff266fffff96e, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_35:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e118  ! 44: LDSWA_I	ldswa	[%r31, + 0x0118] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_2_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 46: FDIVd	fdivd	%f0, %f4, %f6
cwp_2_37:
    set user_data_start, %o7
	.word 0x93902007  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
ibp_2_38:
	nop
	.word 0xd497c033  ! 48: LDUHA_R	lduha	[%r31, %r19] 0x01, %r10
pmu_2_39:
	nop
	setx 0xfffff94ffffff3f1, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_2_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 50: FCMPLE32	fcmple32	%d0, %d4, %r8
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
    brnz %r10, cwq_2_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_41
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
cwq_2_41:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 51: RDPC	rd	%pc, %r11
	.word 0x91948010  ! 52: WRPR_PIL_R	wrpr	%r18, %r16, %pil
mondo_2_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d950007  ! 53: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
dvapa_2_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf40, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 54: STDFA_R	stda	%f16, [%r0, %r31]
ibp_2_45:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fd920  ! 55: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_2_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 56: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0x26ca8001  ! 1: BRLZ	brlz,a,pt	%r10,<label_0xa8001>
	.word 0x8d903dc3  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x1dc3, %pstate
splash_lsu_2_48:
	nop
	ta T_CHANGE_HPRIV
	set 0xa0606972, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_2_49:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x9b703a99  ! 59: POPC_I	popc	0x1a99, %r13
splash_hpstate_2_50:
	ta T_CHANGE_NONHPRIV
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x81983fd7  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fd7, %hpstate
vahole_2_51:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fdb60  ! 61: LDDFA_R	ldda	[%r31, %r0], %f16
splash_lsu_2_52:
	nop
	ta T_CHANGE_HPRIV
	set 0xe695e951, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_2_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_53
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
cwq_2_53:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 63: RDPC	rd	%pc, %r16
cwp_2_54:
    set user_data_start, %o7
	.word 0x93902003  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	setx 0xaf82a1529330313d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
vahole_2_56:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd49fc028  ! 66: LDDA_R	ldda	[%r31, %r8] 0x01, %r10
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_2_58:
	tsubcctv %r0, 0x1965, %r20
	.word 0xd407e01d  ! 68: LDUW_I	lduw	[%r31 + 0x001d], %r10
jmptr_2_59:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d904009  ! 70: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
donret_2_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_61-donret_2_61-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0069c12a | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x337, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_61:
	.word 0xd4ffe16d  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x016d] %asi
ibp_2_62:
	nop
	.word 0xc3ea8032  ! 72: PREFETCHA_R	prefetcha	[%r10, %r18] 0x01, #one_read
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903bf7  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x1bf7, %pstate
dvapa_2_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0x990, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfd960  ! 74: STDFA_R	stda	%f0, [%r0, %r31]
vahole_2_65:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0x93702d78  ! 75: POPC_I	popc	0x0d78, %r9
pmu_2_66:
	nop
	setx 0xfffff2b1fffff35a, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_67-donret_2_67-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0009269e | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdbf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x22cc0001  ! 1: BRZ	brz,a,pt	%r16,<label_0xc0001>
	done
donretarg_2_67:
	.word 0xd2ffe1e9  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x01e9] %asi
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
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 78: RDPC	rd	%pc, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_2_70:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xe4904a00  ! 80: LDUHA_R	lduha	[%r1, %r0] 0x50, %r18
tglhtw_2_71:
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
	.word 0xa7b0c98b  ! 81: BSHUFFLE	fmovc32	%d34, %d42, %d50
pmu_2_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff301fffff1ba, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_2_73:
	taddcctv %r17, 0x1a07, %r11
	.word 0xd607e0d4  ! 83: LDUW_I	lduw	[%r31 + 0x00d4], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_74) + 40, 16, 16)) -> intp(6,0,15)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_74)&0xffffffff)  + 40, 16, 16)) -> intp(6,0,15)
#else
	setx 0x090aab5489e1469f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 85: Tcc_I	tne	icc_or_xcc, %r0 + 50
    set 0x1aa9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b307d3  ! 86: PDIST	pdistn	%d12, %d50, %d40
	.word 0x91904004  ! 87: WRPR_PIL_R	wrpr	%r1, %r4, %pil
	.word 0x91908012  ! 88: WRPR_PIL_R	wrpr	%r2, %r18, %pil
pmu_2_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdaffffff87d, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
vahole_2_78:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd29fc02c  ! 91: LDDA_R	ldda	[%r31, %r12] 0x01, %r9
ibp_2_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a189c1  ! 92: FDIVd	fdivd	%f6, %f32, %f18
splash_lsu_2_80:
	nop
	ta T_CHANGE_HPRIV
	set 0xa91e1ef3, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_81:
	nop
	ta T_CHANGE_HPRIV
	set 0x12e1c8a0, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_2_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x035f0ae7, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_83:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_2_85:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982c17  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
	.word 0xe01fe198  ! 100: LDD_I	ldd	[%r31 + 0x0198], %r16
	.word 0xe09fe1a0  ! 101: LDDA_I	ldda	[%r31, + 0x01a0] %asi, %r16
ibp_2_86:
	nop
	.word 0xe1bfde00  ! 102: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d02033  ! 103: Tcc_I	te	icc_or_xcc, %r0 + 51
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
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 104: CASA_R	casa	[%r31] %asi, %r17, %r16
	.word 0x9194c012  ! 105: WRPR_PIL_R	wrpr	%r19, %r18, %pil
pmu_2_89:
	nop
	setx 0xfffffc85fffff27b, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	.word 0x8d90373b  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x173b, %pstate
intveclr_2_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0xba888114e0baf0ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_2_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe9108012  ! 1: LDQF_R	-	[%r2, %r18], %f20
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 110: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_2_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffc7bfffffe1f, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_2_94:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe9e7e00b  ! 112: CASA_R	casa	[%r31] %asi, %r11, %r20
	fblg skip_2_95
	.word 0x87acca45  ! 1: FCMPd	fcmpd	%fcc<n>, %f50, %f36
.align 2048
skip_2_95:
	.word 0x87aa8a43  ! 113: FCMPd	fcmpd	%fcc<n>, %f10, %f34
dvapa_2_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe7e, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93a489cb  ! 114: FDIVd	fdivd	%f18, %f42, %f40
splash_cmpr_2_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
vahole_2_98:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xd2dfc02c  ! 116: LDXA_R	ldxa	[%r31, %r12] 0x01, %r9
vahole_2_99:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfc3e0  ! 117: STDFA_R	stda	%f0, [%r0, %r31]
mondo_2_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d928008  ! 118: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
trapasi_2_101:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xd2c84a00  ! 119: LDSBA_R	ldsba	[%r1, %r0] 0x50, %r9
splash_cmpr_2_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 120: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_2_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 121: CASA_R	casa	[%r31] %asi, %r11, %r9
dvapa_2_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbf0, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa37028da  ! 122: POPC_I	popc	0x08da, %r17
splash_hpstate_2_105:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982c85  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c85, %hpstate
iaw_2_106:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_106:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_106
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_106:
    brnz %r16, iaw_wait2_106
    ld [%r23], %r16
    ba iaw_startwait2_106
    mov 0x2, %r16
continue_iaw_2_106:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_106:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_106
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_106:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_106
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_106:
	mov 0x38, %r18
iaw1_2_106:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc3e0  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_2_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 125: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
splash_tba_2_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_2_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x95a00552  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdc00  ! 128: LDDFA_R	ldda	[%r31, %r0], %f0
splash_hpstate_2_110:
	.word 0x81982e7f  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e7f, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fe1e0  ! 131: LDDFA_I	ldda	[%r31, 0x01e0], %f0
	.word 0xa1a00171  ! 132: FABSq	dis not found

	setx 0xc76ab97b1b102712, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 134: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x8d9037f3  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x17f3, %pstate
	bne  	 skip_2_116
	bvs  	 skip_2_116
.align 2048
skip_2_116:
	.word 0xc32fc000  ! 136: STXFSR_R	st-sfr	%f1, [%r0, %r31]
intveclr_2_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0xab3d53d42db5f312, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_118:
	nop
	setx 0xfffffcccfffff73c, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_2_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1a449ac  ! 139: FDIVs	fdivs	%f17, %f12, %f16
splash_lsu_2_120:
	nop
	ta T_CHANGE_HPRIV
	set 0x4c3d2cf2, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff14ffffff0fa, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
unsupttte_2_122:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a209a3  ! 142: FDIVs	fdivs	%f8, %f3, %f20
splash_cmpr_2_123:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 143: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_2_124:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 145: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x97524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_2_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0xa041563f5bb47816, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_127:
	set 0x60140000, %r31
	.word 0x85843a13  ! 148: WRCCR_I	wr	%r16, 0x1a13, %ccr
	.word 0x87802080  ! 149: WRASI_I	wr	%r0, 0x0080, %asi
intveclr_2_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0x526cbd4baf7c244f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800a80  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r16
mondo_2_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91000b  ! 152: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
vahole_2_130:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe1a0  ! 153: STDFA_I	stda	%f0, [0x01a0, %r31]
	.word 0xe08fe168  ! 154: LDUBA_I	lduba	[%r31, + 0x0168] %asi, %r16
	.word 0x91d02032  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 50
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
    brnz %r10, cwq_2_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_131
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
cwq_2_131:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 156: RDPC	rd	%pc, %r9
ibp_2_132:
	nop
	.word 0x91b1c489  ! 157: FCMPLE32	fcmple32	%d38, %d40, %r8
splash_lsu_2_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x22f6b9f5, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
vahole_2_134:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fdc00  ! 160: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon1_2_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xa7a449a9  ! 161: FDIVs	fdivs	%f17, %f9, %f19
splash_hpstate_2_136:
	.word 0x8198290c  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090c, %hpstate
	.word 0xd497e170  ! 163: LDUHA_I	lduha	[%r31, + 0x0170] %asi, %r10
vahole_2_137:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fdf20  ! 164: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_2_138:
	nop
	setx 0xfffff532fffff0db, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_2_139:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc32fc013  ! 166: STXFSR_R	st-sfr	%f1, [%r19, %r31]
intveclr_2_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0x487fdba70a5d4739, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9038ab  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x18ab, %pstate
	.word 0x87802055  ! 169: WRASI_I	wr	%r0, 0x0055, %asi
ibp_2_142:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a489d2  ! 170: FDIVd	fdivd	%f18, %f18, %f18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_2_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8247f  ! 172: PREFETCHA_I	prefetcha	[%r0, + 0x047f] %asi, #one_read
dvapa_2_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0x91f, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc014  ! 173: STXFSR_R	st-sfr	%f1, [%r20, %r31]
intveclr_2_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x797d077a618c9992, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe088  ! 175: LDDF_I	ldd	[%r31, 0x0088], %f18
donret_2_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_147-donret_2_147-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cdd547 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x121f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_147:
	.word 0xe4ffe1d0  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x01d0] %asi
	.word 0xe19fe020  ! 177: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0x83d020b2  ! 178: Tcc_I	te	icc_or_xcc, %r0 + 178
fpinit_2_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 179: FCMPLE32	fcmple32	%d0, %d4, %r4
splash_cmpr_2_149:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 180: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_2_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_150
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
cwq_2_150:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 181: RDPC	rd	%pc, %r16
unsupttte_2_151:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x91a449c6  ! 182: FDIVd	fdivd	%f48, %f6, %f8
	.word 0x93a00163  ! 183: FABSq	dis not found

vahole_2_153:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe1bfe000  ! 184: STDFA_I	stda	%f16, [0x0000, %r31]
mondo_2_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 185: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
iaw_2_155:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_155:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_155
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_155:
    brnz %r16, iaw_wait2_155
    ld [%r23], %r16
    ba iaw_startwait2_155
    mov 0x2, %r16
continue_iaw_2_155:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_155:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_155
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_155:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_155
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_155:
	mov 0x38, %r18
iaw1_2_155:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe120  ! 186: STDFA_I	stda	%f16, [0x0120, %r31]
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
    brnz %r10, sma_2_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00a  ! 187: CASA_R	casa	[%r31] %asi, %r10, %r13
pmu_2_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff356fffffcb1, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_2_158:
	.word 0xc36fe47f  ! 1: PREFETCH_I	prefetch	[%r31 + 0x047f], #one_read
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	normalw
	.word 0x95458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x91914011  ! 190: WRPR_PIL_R	wrpr	%r5, %r17, %pil
splash_cmpr_2_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 191: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_2_161:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_2_162:
	nop
	.word 0x87aa8a52  ! 193: FCMPd	fcmpd	%fcc<n>, %f10, %f18
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_2_164:
	nop
	.word 0xc1bfe100  ! 195: STDFA_I	stda	%f0, [0x0100, %r31]
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
    brnz %r10, sma_2_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e011  ! 196: CASA_R	casa	[%r31] %asi, %r17, %r20
splash_tba_2_166:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x8bc8d0ec48b630cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_2_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 199: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xa9a00170  ! 200: FABSq	dis not found

trapasi_2_170:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0904980  ! 201: LDUHA_R	lduha	[%r1, %r0] 0x4c, %r16
splash_tba_2_171:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e1b8  ! 203: LDQFA_I	-	[%r31, 0x01b8], %f16
	.word 0x87802082  ! 204: WRASI_I	wr	%r0, 0x0082, %asi
	.word 0xa3454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
memptr_2_172:
	set 0x60340000, %r31
	.word 0x858425e0  ! 206: WRCCR_I	wr	%r16, 0x05e0, %ccr
splash_cmpr_2_173:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 207: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_2_175:
	nop
	setx 0xfffff41cfffff037, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_2_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_176
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
cwq_2_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 210: RDPC	rd	%pc, %r20
	.word 0x91d02035  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
vahole_2_178:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc3ec8027  ! 213: PREFETCHA_R	prefetcha	[%r18, %r7] 0x01, #one_read
	.word 0xda8008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_2_179:
	nop
	setx 0xfffffee9fffff0b6, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_2_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc00c  ! 216: STXFSR_R	st-sfr	%f1, [%r12, %r31]
trapasi_2_181:
	nop
	mov 0x3c8, %r1 	! (VA for ASI 0x25) 
	.word 0xdad844a0  ! 217: LDXA_R	ldxa	[%r1, %r0] 0x25, %r13
pmu_2_182:
	nop
	setx 0xfffffab4fffff96c, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_183-donret_2_183-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0088c053 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e5d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_183:
	.word 0xda6fe0b2  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x00b2]
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
    brnz %r10, sma_2_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 220: CASA_R	casa	[%r31] %asi, %r19, %r13
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
    brnz %r10, cwq_2_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_185
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
cwq_2_185:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 221: RDPC	rd	%pc, %r10
ibp_2_186:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x93a4c9c8  ! 222: FDIVd	fdivd	%f50, %f8, %f40
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d903334  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x1334, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_2_189:
	nop
	.word 0xe19fdf20  ! 226: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_2_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe0bfc02d  ! 228: STDA_R	stda	%r16, [%r31 + %r13] 0x01
	.word 0xa1902002  ! 229: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_2_191:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 230: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_2_192:
	nop
	ta T_CHANGE_HPRIV
	set 0x95b88881, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
vahole_2_193:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa3a349a3  ! 232: FDIVs	fdivs	%f13, %f3, %f17
jmptr_2_194:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_2_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd73, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe29fc030  ! 234: LDDA_R	ldda	[%r31, %r16] 0x01, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_196:
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
    brnz %r10, sma_2_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 236: CASA_R	casa	[%r31] %asi, %r16, %r17
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
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e009  ! 237: CASA_R	casa	[%r31] %asi, %r9, %r17
	setx 0xdf46ec6cfeace8e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_2_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe311000a  ! 1: LDQF_R	-	[%r4, %r10], %f17
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe040  ! 239: STDFA_I	stda	%f16, [0x0040, %r31]
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
    brnz %r10, sma_2_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00b  ! 240: CASA_R	casa	[%r31] %asi, %r11, %r17
	.word 0x87802088  ! 241: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_2_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_202-donret_2_202-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d34f4b | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdbc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_202:
	.word 0x95a309c6  ! 243: FDIVd	fdivd	%f12, %f6, %f10
	.word 0xe0dfe190  ! 244: LDXA_I	ldxa	[%r31, + 0x0190] %asi, %r16
pmu_2_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff81fffff57e, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_2_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_2_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff569fffff26b, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_2_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_206
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
cwq_2_206:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 248: RDPC	rd	%pc, %r12
donret_2_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_207-donret_2_207-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00baa0ae | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b85, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_207:
	.word 0x97a4c9c5  ! 249: FDIVd	fdivd	%f50, %f36, %f42
ibp_2_208:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa5a309cc  ! 250: FDIVd	fdivd	%f12, %f12, %f18
fpinit_2_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 251: FDIVs	fdivs	%f0, %f4, %f4
change_to_randtl_2_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_210:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_2_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_211
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
cwq_2_211:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 253: RDPC	rd	%pc, %r9
memptr_2_212:
	set 0x60540000, %r31
	.word 0x858233ac  ! 254: WRCCR_I	wr	%r8, 0x13ac, %ccr
dvapa_2_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0x8ac, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec0030  ! 255: PREFETCHA_R	prefetcha	[%r16, %r16] 0x01, #one_read
donret_2_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_214-donret_2_214-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002dc121 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x44c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_214:
	.word 0xa9a409c9  ! 256: FDIVd	fdivd	%f16, %f40, %f20
	.word 0xda3fe144  ! 257: STD_I	std	%r13, [%r31 + 0x0144]
dvapa_2_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf8a, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdb1fc011  ! 258: LDDF_R	ldd	[%r31, %r17], %f13
	.word 0xc19fdb60  ! 259: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_2_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00b  ! 260: CASA_R	casa	[%r31] %asi, %r11, %r13
pmu_2_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff7c6fffffa65, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_2_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffb0effffffb5, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_220:
	nop
	setx 0xfffff605fffff47a, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x09d0243cfeb6fdbc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_222:
	nop
	ta T_CHANGE_HPRIV
	set 0x4b0260ba, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_2_223:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe060  ! 267: STDFA_I	stda	%f0, [0x0060, %r31]
mondo_2_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 268: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
donret_2_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_225-donret_2_225-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00040456 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c5e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	done
donretarg_2_225:
	.word 0xda6fe04b  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x004b]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_226) + 0, 16, 16)) -> intp(4,0,11)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_226)&0xffffffff)  + 0, 16, 16)) -> intp(4,0,11)
#else
	setx 0x75e2e70fa16c246b, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe1f0  ! 272: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r13
intveclr_2_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0x66dbdc80fae25161, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_2_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0x92d, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa5a0c9d4  ! 274: FDIVd	fdivd	%f34, %f20, %f18
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_2_230:
	.word 0x81982acd  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
	.word 0xe48008a0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
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
    brnz %r10, sma_2_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e014  ! 278: CASA_R	casa	[%r31] %asi, %r20, %r18
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 279: Tcc_R	tne	icc_or_xcc, %r0 + %r30
brcommon2_2_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xd9108012  ! 1: LDQF_R	-	[%r2, %r18], %f12
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe160  ! 280: STDFA_I	stda	%f16, [0x0160, %r31]
vahole_2_233:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target0, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc1bfe040  ! 281: STDFA_I	stda	%f0, [0x0040, %r31]
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
    brnz %r10, sma_2_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e008  ! 282: CASA_R	casa	[%r31] %asi, %r8, %r12
splash_lsu_2_235:
	nop
	ta T_CHANGE_HPRIV
	set 0x47b6198e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc3e0  ! 284: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8d903a93  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x1a93, %pstate
memptr_2_237:
	set user_data_start, %r31
	.word 0x8580af1a  ! 286: WRCCR_I	wr	%r2, 0x0f1a, %ccr
memptr_2_238:
	set 0x60740000, %r31
	.word 0x8580f436  ! 287: WRCCR_I	wr	%r3, 0x1436, %ccr
	.word 0xa7844005  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r5, %-
	brgez,pn  	%r20, skip_2_240
	.word 0x9f8026fd  ! 1: SIR	sir	0x06fd
.align 32
skip_2_240:
	.word 0x87aa4a43  ! 289: FCMPd	fcmpd	%fcc<n>, %f40, %f34
intveclr_2_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0xcf00e4332912b8b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 291: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0x8d802000  ! 292: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_2_243:
	nop
	setx 0xfffffa3efffff141, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_244) + 56, 16, 16)) -> intp(6,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_244)&0xffffffff)  + 56, 16, 16)) -> intp(6,0,26)
#else
	setx 0xf6346d5c09fcc609, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_2_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 295: WRFPRS_I	wr	%r0, 0x0000, %fprs
mondo_2_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d914012  ! 296: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0x93524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_2_247:
	nop
	setx 0xfffff11bfffff837, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_2_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902003  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	setx 0x15327a29d9eb5e4c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbg,a,pn	%fcc0,  skip_2_250
	.word 0x9f803774  ! 1: SIR	sir	0x1774
.align 1024
skip_2_250:
	.word 0x93b504cd  ! 301: FCMPNE32	fcmpne32	%d20, %d44, %r9
ibp_2_251:
	nop
	.word 0xe1bfd960  ! 302: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_2_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc46, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x91a489d1  ! 303: FDIVd	fdivd	%f18, %f48, %f8
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
    brnz %r10, cwq_2_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_253
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
cwq_2_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 304: RDPC	rd	%pc, %r19
pmu_2_254:
	nop
	setx 0xfffff7eafffff539, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_255:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_2_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_256
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
cwq_2_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 307: RDPC	rd	%pc, %r16
splash_hpstate_2_257:
	ta T_CHANGE_NONHPRIV
	.word 0x81982d09  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0x93a00174  ! 310: FABSq	dis not found

	.word 0x91d020b5  ! 311: Tcc_I	ta	icc_or_xcc, %r0 + 181
intveclr_2_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0x59b50d13a7dd04c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_2_260:
	nop
	.word 0xe1bfd960  ! 313: STDFA_R	stda	%f16, [%r0, %r31]
jmptr_2_261:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d920009  ! 315: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
ibp_2_263:
	nop
	.word 0xe19fd960  ! 316: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe127e0e0  ! 317: STF_I	st	%f16, [0x00e0, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_2_264:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe09fc033  ! 319: LDDA_R	ldda	[%r31, %r19] 0x01, %r16
iaw_2_265:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_265:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_265
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_265:
    brnz %r16, iaw_wait2_265
    ld [%r23], %r16
    ba iaw_startwait2_265
    mov 0x2, %r16
continue_iaw_2_265:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_265:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_265
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_265:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_265
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_265:
	mov 0x38, %r18
iaw1_2_265:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdc00  ! 320: LDDFA_R	ldda	[%r31, %r0], %f16
vahole_2_266:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd960  ! 321: LDDFA_R	ldda	[%r31, %r0], %f0
intveclr_2_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2e9dac1de3fe5c14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_268:
	nop
	setx 0xfffff28ffffff503, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3a000c4  ! 324: FNEGd	fnegd	%f4, %f48
intveclr_2_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x2f17b0af156492e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_2_270:
	tsubcctv %r8, 0x1cd3, %r16
	.word 0xd807e1e8  ! 326: LDUW_I	lduw	[%r31 + 0x01e8], %r12
	setx 0x97eb8ec699b91528, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_2_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x95a0054a  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe120  ! 328: STDFA_I	stda	%f16, [0x0120, %r31]
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
    brnz %r10, sma_2_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e011  ! 329: CASA_R	casa	[%r31] %asi, %r17, %r10
dvapa_2_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0xbd9, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93703349  ! 330: POPC_I	popc	0x1349, %r9
vahole_2_275:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target3, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa5703039  ! 331: POPC_I	popc	0x1039, %r18
dvapa_2_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0xef4, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fdf20  ! 332: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_2_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 333: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_2_278:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 335: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x9b703d73  ! 336: POPC_I	popc	0x1d73, %r13
vahole_2_279:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target1, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xa5a089a2  ! 337: FDIVs	fdivs	%f2, %f2, %f18
jmptr_2_280:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d903ac4  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x1ac4, %pstate
ceter_2_282:
    nop
    ta T_CHANGE_HPRIV
    mov 7, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0x97410000  ! 340: RDTICK	rd	%tick, %r11
iaw_2_283:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_283:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_283
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_283:
    brnz %r16, iaw_wait2_283
    ld [%r23], %r16
    ba iaw_startwait2_283
    mov 0x2, %r16
continue_iaw_2_283:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_283:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_283
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_283:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_283
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_283:
	mov 0x38, %r18
iaw1_2_283:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0x99a0c9a3  ! 341: FDIVs	fdivs	%f3, %f3, %f12
	.word 0xd847e0e8  ! 342: LDSW_I	ldsw	[%r31 + 0x00e8], %r12
	.word 0x91940005  ! 343: WRPR_PIL_R	wrpr	%r16, %r5, %pil
	.word 0xd837e04e  ! 344: STH_I	sth	%r12, [%r31 + 0x004e]
ibp_2_285:
	nop
	.word 0xa7702410  ! 345: POPC_I	popc	0x0410, %r19
	ba  	 skip_2_286
	fblg,a,pn	%fcc0,  skip_2_286
.align 512
skip_2_286:
	.word 0x87ac8a41  ! 346: FCMPd	fcmpd	%fcc<n>, %f18, %f32
	.word 0xd337e0dd  ! 347: STQF_I	-	%f9, [0x00dd, %r31]
donret_2_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_287-donret_2_287-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fa0e0c | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b13, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x22cc8001  ! 1: BRZ	brz,a,pt	%r18,<label_0xc8001>
	done
donretarg_2_287:
	.word 0xd2ffe165  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x0165] %asi
	.word 0xd28008a0  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d802000  ! 350: WRFPRS_I	wr	%r0, 0x0000, %fprs
dvapa_2_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0xfaa, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c031  ! 351: LDUHA_R	lduha	[%r31, %r17] 0x01, %r9
	.word 0xa3a00163  ! 352: FABSq	dis not found

iaw_2_290:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_290:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_290
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_290:
    brnz %r16, iaw_wait2_290
    ld [%r23], %r16
    ba iaw_startwait2_290
    mov 0x2, %r16
continue_iaw_2_290:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_290:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_290
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_290:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_290
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_290:
	mov 0x38, %r18
iaw1_2_290:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe19fde00  ! 353: LDDFA_R	ldda	[%r31, %r0], %f16
brcommon2_2_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xe714400d  ! 1: LDQF_R	-	[%r17, %r13], %f19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 354: LDDFA_R	ldda	[%r31, %r0], %f16
donret_2_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_292-donret_2_292-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d49d17 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfdc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_292:
	.word 0x95a189c7  ! 355: FDIVd	fdivd	%f6, %f38, %f10
pmu_2_293:
	nop
	setx 0xfffff486fffff296, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_294-donret_2_294-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0007778b | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14bd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_294:
	.word 0xe46fe02a  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x002a]
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
    brnz %r10, sma_2_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e009  ! 358: CASA_R	casa	[%r31] %asi, %r9, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_2_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_296
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
cwq_2_296:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 360: RDPC	rd	%pc, %r13
splash_cmpr_2_297:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 361: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_2_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d940004  ! 362: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
brcommon3_2_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c011  ! 1: STQF_R	-	%f13, [%r17, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdadfc033  ! 363: LDXA_R	ldxa	[%r31, %r19] 0x01, %r13
intveclr_2_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0x095c788ddb05f17a, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_2_302:
	nop
	ta T_CHANGE_HPRIV
	set 0x63cf2560, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_2_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_303
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
cwq_2_303:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 367: RDPC	rd	%pc, %r8
    set 0xb94, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b507cd  ! 368: PDIST	pdistn	%d20, %d44, %d10
splash_lsu_2_304:
	nop
	ta T_CHANGE_HPRIV
	set 0x05d7d38d, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_2_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
dvapa_2_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcb1, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80333a  ! 371: SIR	sir	0x133a
pmu_2_307:
	nop
	setx 0xffffffcefffff9a1, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_308:
	nop
	setx 0xfffffd42fffff9b9, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
vahole_2_309:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xe19fc2c0  ! 374: LDDFA_R	ldda	[%r31, %r0], %f16
tagged_2_310:
	tsubcctv %r16, 0x1776, %r19
	.word 0xd407e01c  ! 375: LDUW_I	lduw	[%r31 + 0x001c], %r10
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
    brnz %r10, cwq_2_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_311
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
cwq_2_311:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 376: RDPC	rd	%pc, %r19
trapasi_2_312:
	nop
	mov 0x28, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8884b60  ! 377: LDUBA_R	lduba	[%r1, %r0] 0x5b, %r12
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d9039fb  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x19fb, %pstate
iaw_2_314:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_314:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_314
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_314:
    brnz %r16, iaw_wait2_314
    ld [%r23], %r16
    ba iaw_startwait2_314
    mov 0x2, %r16
continue_iaw_2_314:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_314:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_314
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_314:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_314
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_314:
	mov 0x38, %r18
iaw1_2_314:
	best_set_reg(0x00000000e0200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc028  ! 379: LDXA_R	ldxa	[%r31, %r8] 0x01, %r12
mondo_2_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d90c002  ! 380: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
fpinit_2_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 381: FCMPLE32	fcmple32	%d0, %d4, %r4
dvapa_2_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe0f, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdf20  ! 382: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8d9031b9  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x11b9, %pstate
pmu_2_319:
	nop
	setx 0xfffff2a9ffffff71, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e160  ! 385: LDSHA_I	ldsha	[%r31, + 0x0160] %asi, %r12
	.word 0x8d9039c5  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x19c5, %pstate
fpinit_2_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 387: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xe19fdb60  ! 388: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa3b40547  ! 389: FCMPEQ16	fcmpeq16	%d16, %d38, %r17
donret_2_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_322-donret_2_322-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0004b78e | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xea7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_322:
	.word 0xe8ffe038  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x0038] %asi
	.word 0xa945c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xab83000c  ! 392: WR_CLEAR_SOFTINT_R	wr	%r12, %r12, %clear_softint
	setx 0x46851c2a08cd081a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
iaw_2_324:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_324:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_324
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_324:
    brnz %r16, iaw_wait2_324
    ld [%r23], %r16
    ba iaw_startwait2_324
    mov 0x2, %r16
continue_iaw_2_324:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_324:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_324
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_324:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_324
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_324:
	mov 0x38, %r18
iaw2_2_324:
	rdpr %tba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc032  ! 394: STDA_R	stda	%r19, [%r31 + %r18] 0x01
	setx 0x8dac533bf9056336, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9524000  ! 396: RDPR_CWP	<illegal instruction>
dvapa_2_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf14, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe140  ! 397: STDFA_I	stda	%f16, [0x0140, %r31]
fpinit_2_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 398: FDIVs	fdivs	%f0, %f4, %f6
iaw_2_329:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait2_329:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_2_329
    mov (~0x2&0xf), %r16
    ld [%r23], %r16
iaw_wait2_329:
    brnz %r16, iaw_wait2_329
    ld [%r23], %r16
    ba iaw_startwait2_329
    mov 0x2, %r16
continue_iaw_2_329:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_2_329:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a wait_for_stat_2_329
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_2_329:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_iaw_2_329
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit2_329:
	mov 0x38, %r18
iaw1_2_329:
	best_set_reg(0x00000000e1200000, %r20, %r19)
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc034  ! 399: LDDA_R	ldda	[%r31, %r20] 0x01, %r19
unsupttte_2_330:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa7a309cb  ! 400: FDIVd	fdivd	%f12, %f42, %f50
vahole_2_331:
    nop
    ta T_CHANGE_NONHPRIV
	setx vahole_target2, %r18, %r27
    jmpl %r27+0, %r27
	.word 0xc19fd920  ! 401: LDDFA_R	ldda	[%r31, %r0], %f0
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
	.word 0xe8800aa0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r20
	.word 0xa3a00170  ! 2: FABSq	dis not found

ibp_1_1:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc011  ! 3: STDF_R	std	%f17, [%r17, %r31]
donret_1_2:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_2-donret_1_2-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00866171 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcdf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2accc001  ! 1: BRNZ	brnz,a,pt	%r19,<label_0xcc001>
	retry
donretarg_1_2:
	.word 0xe26fe172  ! 4: LDSTUB_I	ldstub	%r17, [%r31 + 0x0172]
	setx 0xe81c527cc27ba8de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_3:
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_4:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d928004  ! 6: WRPR_WSTATE_R	wrpr	%r10, %r4, %wstate
pmu_1_5:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff765fffff9b5, %g1, %g7
	.word 0xa3800007  ! 7: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x96fca301  ! 8: SDIVcc_I	sdivcc 	%r18, 0x0301, %r11
splash_cmpr_1_6:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 9: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_1_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_7
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
cwq_1_7:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 10: RDPC	rd	%pc, %r13
pmu_1_8:
	nop
	setx 0xfffff1cafffff1db, %g1, %g7
	.word 0xa3800007  ! 11: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3a00172  ! 12: FABSq	dis not found

ibp_1_10:
	nop
	.word 0xe1bfda00  ! 13: STDFA_R	stda	%f16, [%r0, %r31]
trapasi_1_11:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x4c) 
	.word 0xe2c04980  ! 14: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r17
splash_cmpr_1_12:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 15: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91a2c9a1  ! 16: FDIVs	fdivs	%f11, %f1, %f8
pmu_1_14:
	nop
	setx 0xfffff356fffff9d8, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d903f92  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x1f92, %pstate
splash_cmpr_1_16:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 19: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd01fc000  ! 20: LDD_R	ldd	[%r31 + %r0], %r8
splash_lsu_1_17:
	nop
	ta T_CHANGE_HPRIV
	set 0x31c40ba1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 21: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_1_18:
	nop
	.word 0x9bb4c7cc  ! 22: PDIST	pdistn	%d50, %d12, %d44
fpinit_1_19:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 23: FCMPLE32	fcmple32	%d0, %d4, %r6
mondo_1_20:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d92c011  ! 24: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
intveclr_1_21:
	nop
	ta T_CHANGE_HPRIV
	setx 0x7ddb25f4fc9b4191, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 25: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_22:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff899fffff225, %g1, %g7
	.word 0xa3800007  ! 26: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_tba_1_23:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 27: WRPR_TBA_R	wrpr	%r0, %r12, %tba
trapasi_1_24:
	nop
	mov 0x0, %r1 	! (VA for ASI 0x4c) 
	.word 0xdac04980  ! 28: LDSWA_R	ldswa	[%r1, %r0] 0x4c, %r13
	.word 0x8780208a  ! 29: WRASI_I	wr	%r0, 0x008a, %asi
ibp_1_25:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfd960  ! 30: STDFA_R	stda	%f16, [%r0, %r31]
dvapa_1_26:
	nop
	ta T_CHANGE_HPRIV
	mov 0x80d, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xdabfc028  ! 31: STDA_R	stda	%r13, [%r31 + %r8] 0x01
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
    brnz %r10, cwq_1_27
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_27
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
cwq_1_27:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 32: RDPC	rd	%pc, %r9
	.word 0x8d903aa5  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x1aa5, %pstate
	.word 0xa1a00174  ! 34: FABSq	dis not found

#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_30) + 24, 16, 16)) -> intp(3,0,3)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_30)&0xffffffff)  + 24, 16, 16)) -> intp(3,0,3)
#else
	setx 0x5da4842bf6b6957d, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_30:
	.word 0x39400001  ! 35: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tglhtw_1_31:
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
	.word 0x95b48994  ! 36: BSHUFFLE	fmovc32	%d18, %d20, %d10
	.word 0x8d802000  ! 37: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd44fe1c0  ! 38: LDSB_I	ldsb	[%r31 + 0x01c0], %r10
splash_cmpr_1_32:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 39: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx 0x9610a653461b9c66, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_33:
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 41: WRFPRS_I	wr	%r0, 0x0000, %fprs
pmu_1_34:
	nop
	setx 0xfffff7f4fffff17a, %g1, %g7
	.word 0xa3800007  ! 42: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_35:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 43: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd4c7e090  ! 44: LDSWA_I	ldswa	[%r31, + 0x0090] %asi, %r10
	.word 0xc30fc000  ! 45: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
fpinit_1_36:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 46: FCMPd	fcmpd	%fcc<n>, %f0, %f4
cwp_1_37:
    set user_data_start, %o7
	.word 0x93902001  ! 47: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
ibp_1_38:
	nop
	.word 0xc32fc014  ! 48: STXFSR_R	st-sfr	%f1, [%r20, %r31]
pmu_1_39:
	nop
	setx 0xfffffffffffffb01, %g1, %g7
	.word 0xa3800007  ! 49: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_1_40:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83a91  ! 50: PREFETCHA_I	prefetcha	[%r0, + 0xfffffa91] %asi, #one_read
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
    brnz %r10, cwq_1_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_41
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
cwq_1_41:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 51: RDPC	rd	%pc, %r20
	.word 0x9191400d  ! 52: WRPR_PIL_R	wrpr	%r5, %r13, %pil
mondo_1_43:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d944003  ! 53: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
dvapa_1_44:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe41, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe19fc3e0  ! 54: LDDFA_R	ldda	[%r31, %r0], %f16
ibp_1_45:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe19fdb60  ! 55: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_1_46
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_46:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 56: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0x26cc4001  ! 1: BRLZ	brlz,a,pt	%r17,<label_0xc4001>
	.word 0x8d903da5  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x1da5, %pstate
splash_lsu_1_48:
	nop
	ta T_CHANGE_HPRIV
	set 0x17bb3f30, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target2, %r18, %r27
	.word 0x97b4c7c4  ! 59: PDIST	pdistn	%d50, %d4, %d42
splash_hpstate_1_50:
	ta T_CHANGE_NONHPRIV
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81983d57  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d57, %hpstate
	setx vahole_target0, %r18, %r27
	.word 0xe1bfe0e0  ! 61: STDFA_I	stda	%f16, [0x00e0, %r31]
splash_lsu_1_52:
	nop
	ta T_CHANGE_HPRIV
	set 0xea2af5fd, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 62: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_1_53
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_53
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
cwq_1_53:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 63: RDPC	rd	%pc, %r10
cwp_1_54:
    set user_data_start, %o7
	.word 0x93902000  ! 64: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	setx 0xeb3ecee55d705aee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_55:
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx vahole_target1, %r18, %r27
	.word 0xc32fc011  ! 66: STXFSR_R	st-sfr	%f1, [%r17, %r31]
	.word 0x89800011  ! 67: WRTICK_R	wr	%r0, %r17, %tick
tagged_1_58:
	tsubcctv %r18, 0x1684, %r12
	.word 0xd407e077  ! 68: LDUW_I	lduw	[%r31 + 0x0077], %r10
jmptr_1_59:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 69: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_60:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d93400d  ! 70: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
donret_1_61:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_61-donret_1_61-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0053f327 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x640, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_61:
	.word 0xd4ffe0ec  ! 71: SWAPA_I	swapa	%r10, [%r31 + 0x00ec] %asi
ibp_1_62:
	nop
	.word 0x91b487c3  ! 72: PDIST	pdistn	%d18, %d34, %d8
	.word 0x2ecc4001  ! 1: BRGEZ	brgez,a,pt	%r17,<label_0xc4001>
	.word 0x8d902959  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x0959, %pstate
dvapa_1_64:
	nop
	ta T_CHANGE_HPRIV
	mov 0xedc, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe180  ! 74: STDFA_I	stda	%f0, [0x0180, %r31]
	setx vahole_target1, %r18, %r27
	.word 0xc3ecc022  ! 75: PREFETCHA_R	prefetcha	[%r19, %r2] 0x01, #one_read
pmu_1_66:
	nop
	setx 0xfffff399fffff6ed, %g1, %g7
	.word 0xa3800007  ! 76: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_67:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_67-donret_1_67-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00329263 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdd5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	done
donretarg_1_67:
	.word 0xd2ffe1e0  ! 77: SWAPA_I	swapa	%r9, [%r31 + 0x01e0] %asi
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
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_68:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 78: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_69:
	ta	T_CHANGE_NONHPRIV	! macro
trapasi_1_70:
	nop
	mov 0x38, %r1 	! (VA for ASI 0x50) 
	.word 0xe4884a00  ! 80: LDUBA_R	lduba	[%r1, %r0] 0x50, %r18
tglhtw_1_71:
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
	.word 0x97b4098d  ! 81: BSHUFFLE	fmovc32	%d16, %d44, %d42
pmu_1_72:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff9aefffff1bb, %g1, %g7
	.word 0xa3800007  ! 82: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_1_73:
	taddcctv %r16, 0x1d76, %r19
	.word 0xd607e130  ! 83: LDUW_I	lduw	[%r31 + 0x0130], %r11
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_74) + 8, 16, 16)) -> intp(5,0,26)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_74)&0xffffffff)  + 8, 16, 16)) -> intp(5,0,26)
#else
	setx 0x1ce4d808a957008f, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_74:
	.word 0x39400001  ! 84: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 85: Tcc_I	te	icc_or_xcc, %r0 + 51
    set 0x9d4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7d2  ! 86: PDIST	pdistn	%d50, %d18, %d40
	.word 0x9194c005  ! 87: WRPR_PIL_R	wrpr	%r19, %r5, %pil
	.word 0x9192c006  ! 88: WRPR_PIL_R	wrpr	%r11, %r6, %pil
pmu_1_77:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffd03fffffdcf, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22780001  ! 90: BPE	<illegal instruction>
	setx vahole_target3, %r18, %r27
	.word 0xd29fc030  ! 91: LDDA_R	ldda	[%r31, %r16] 0x01, %r9
ibp_1_79:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1a509b4  ! 92: FDIVs	fdivs	%f20, %f20, %f16
splash_lsu_1_80:
	nop
	ta T_CHANGE_HPRIV
	set 0x86833b96, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 93: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_81:
	nop
	ta T_CHANGE_HPRIV
	set 0xe2da3847, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 94: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 95: RD_STICK_REG	stbar
splash_lsu_1_82:
	nop
	ta T_CHANGE_HPRIV
	set 0x9c826860, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 96: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_83:
	ta	T_CHANGE_NONHPRIV	! macro
invtsb_1_84:
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
	.word 0x29800001  ! 98: FBL	fbl,a	<label_0x1>
splash_hpstate_1_85:
	.word 0x2ac9c001  ! 1: BRNZ	brnz,a,pt	%r7,<label_0x9c001>
	.word 0x8198365f  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x165f, %hpstate
	.word 0xe01fe060  ! 100: LDD_I	ldd	[%r31 + 0x0060], %r16
	.word 0xe09fe010  ! 101: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r16
ibp_1_86:
	nop
	.word 0xe1bfe060  ! 102: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0x83d020b3  ! 103: Tcc_I	te	icc_or_xcc, %r0 + 179
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_87:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e014  ! 104: CASA_R	casa	[%r31] %asi, %r20, %r16
	.word 0x91934001  ! 105: WRPR_PIL_R	wrpr	%r13, %r1, %pil
pmu_1_89:
	nop
	setx 0xfffff4defffffb8f, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc30fc000  ! 107: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d9038d7  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x18d7, %pstate
intveclr_1_91:
	nop
	ta T_CHANGE_HPRIV
	setx 0x26d6d36613cb82a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 109: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
brcommon2_1_92:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c974  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fdf20  ! 110: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_1_93:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffe40ffffff1e, %g1, %g7
	.word 0xa3800007  ! 111: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xe9e7e010  ! 112: CASA_R	casa	[%r31] %asi, %r16, %r20
	.word 0xa9a109c9  ! 113: FDIVd	fdivd	%f4, %f40, %f20
dvapa_1_96:
	nop
	ta T_CHANGE_HPRIV
	mov 0xeb0, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3e90031  ! 114: PREFETCHA_R	prefetcha	[%r4, %r17] 0x01, #one_read
splash_cmpr_1_97:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	setx vahole_target1, %r18, %r27
	.word 0xd29fc028  ! 116: LDDA_R	ldda	[%r31, %r8] 0x01, %r9
	setx vahole_target0, %r18, %r27
	.word 0xe1bfdb60  ! 117: STDFA_R	stda	%f16, [%r0, %r31]
mondo_1_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d90c011  ! 118: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
trapasi_1_101:
	nop
	mov 0x18, %r1 	! (VA for ASI 0x50) 
	.word 0xd2d84a00  ! 119: LDXA_R	ldxa	[%r1, %r0] 0x50, %r9
splash_cmpr_1_102:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 120: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, sma_1_103
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_103:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00c  ! 121: CASA_R	casa	[%r31] %asi, %r12, %r9
dvapa_1_104:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf21, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80217a  ! 122: SIR	sir	0x017a
splash_hpstate_1_105:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x81982307  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0xe19fdf20  ! 124: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_1_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94c00b  ! 125: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
splash_tba_1_108:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 126: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91500000  ! 127: RDPR_TPC	<illegal instruction>
brcommon2_1_109:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc008  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfde00  ! 128: STDFA_R	stda	%f16, [%r0, %r31]
splash_hpstate_1_110:
	.word 0x81982cdd  ! 129: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdd, %hpstate
	.word 0x89800011  ! 130: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc19fe140  ! 131: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0x99a00174  ! 132: FABSq	dis not found

	setx 0xe4064d3aebc78965, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_113:
	.word 0x39400001  ! 133: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_114:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 134: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x8d90379b  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x179b, %pstate
	.word 0xc30fc000  ! 136: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
intveclr_1_117:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd2c24c81521c6b12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 137: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_118:
	nop
	setx 0xfffffb8bfffff310, %g1, %g7
	.word 0xa3800007  ! 138: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
ibp_1_119:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc3e84034  ! 139: PREFETCHA_R	prefetcha	[%r1, %r20] 0x01, #one_read
splash_lsu_1_120:
	nop
	ta T_CHANGE_HPRIV
	set 0xcbb3306c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_121:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff984fffff4e8, %g1, %g7
	.word 0xa3800007  ! 141: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a4c9b0  ! 142: FDIVs	fdivs	%f19, %f16, %f10
splash_cmpr_1_123:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 143: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd47ffbe8  ! 144: SWAP_I	swap	%r10, [%r31 + 0xfffffbe8]
splash_cmpr_1_124:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 145: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1524000  ! 146: RDPR_CWP	<illegal instruction>
intveclr_1_126:
	nop
	ta T_CHANGE_HPRIV
	setx 0x16487888d42f9bd5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 147: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_127:
	set 0x60540000, %r31
	.word 0x8582a81e  ! 148: WRCCR_I	wr	%r10, 0x081e, %ccr
	.word 0x8780208a  ! 149: WRASI_I	wr	%r0, 0x008a, %asi
intveclr_1_128:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc780d0e5935b4e6d, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 150: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe0800b60  ! 151: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r16
mondo_1_129:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d90c001  ! 152: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	setx vahole_target3, %r18, %r27
	.word 0xc1bfe1e0  ! 153: STDFA_I	stda	%f0, [0x01e0, %r31]
	.word 0xe08fe138  ! 154: LDUBA_I	lduba	[%r31, + 0x0138] %asi, %r16
	.word 0x91d02034  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 52
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
    brnz %r10, cwq_1_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_131
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
cwq_1_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 156: RDPC	rd	%pc, %r16
ibp_1_132:
	nop
	.word 0xa9a4c9d0  ! 157: FDIVd	fdivd	%f50, %f16, %f20
splash_lsu_1_133:
	nop
	ta T_CHANGE_HPRIV
	set 0x8d5704d6, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8800aa0  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r20
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe0a0  ! 160: STDFA_I	stda	%f0, [0x00a0, %r31]
brcommon1_1_135:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86ff5c6  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0xfffff5c6]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x9570247f  ! 161: POPC_I	popc	0x047f, %r10
splash_hpstate_1_136:
	.word 0x81983e93  ! 162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e93, %hpstate
	.word 0xd497e0c8  ! 163: LDUHA_I	lduha	[%r31, + 0x00c8] %asi, %r10
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe0c0  ! 164: STDFA_I	stda	%f0, [0x00c0, %r31]
pmu_1_138:
	nop
	setx 0xfffffd8efffff6f7, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target0, %r18, %r27
	.word 0xd4dfc030  ! 166: LDXA_R	ldxa	[%r31, %r16] 0x01, %r10
intveclr_1_140:
	nop
	ta T_CHANGE_HPRIV
	setx 0x08d3ee6ea0bd9236, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 167: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026a3  ! 168: WRPR_PSTATE_I	wrpr	%r0, 0x06a3, %pstate
	.word 0x87802088  ! 169: WRASI_I	wr	%r0, 0x0088, %asi
ibp_1_142:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0x87a9ca42  ! 170: FCMPd	fcmpd	%fcc<n>, %f38, %f2
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_143:
	ta	T_CHANGE_NONPRIV	! macro
fpinit_1_144:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 172: FCMPd	fcmpd	%fcc<n>, %f0, %f4
dvapa_1_145:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcc3, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc32fc009  ! 173: STXFSR_R	st-sfr	%f1, [%r9, %r31]
intveclr_1_146:
	nop
	ta T_CHANGE_HPRIV
	setx 0x97bf182ba16e75e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 174: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe51fe1a8  ! 175: LDDF_I	ldd	[%r31, 0x01a8], %f18
donret_1_147:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_147-donret_1_147-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009df9bc | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1985, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_147:
	.word 0xe4ffe1ec  ! 176: SWAPA_I	swapa	%r18, [%r31 + 0x01ec] %asi
	.word 0xe19fe160  ! 177: LDDFA_I	ldda	[%r31, 0x0160], %f16
	.word 0x91d02033  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 51
fpinit_1_148:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 179: FCMPLE32	fcmple32	%d0, %d4, %r6
splash_cmpr_1_149:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 180: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
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
    brnz %r10, cwq_1_150
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_150
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
cwq_1_150:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 181: RDPC	rd	%pc, %r9
	.word 0xa1a2c9c5  ! 182: FDIVd	fdivd	%f42, %f36, %f16
	.word 0x9ba00164  ! 183: FABSq	dis not found

	setx vahole_target2, %r18, %r27
	.word 0xe19fc3e0  ! 184: LDDFA_R	ldda	[%r31, %r0], %f16
mondo_1_154:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d924012  ! 185: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xe19fc3e0  ! 186: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_1_156
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_156:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e008  ! 187: CASA_R	casa	[%r31] %asi, %r8, %r13
pmu_1_157:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff151fffff042, %g1, %g7
	.word 0xa3800007  ! 188: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_badelay1_1_158:
	.word 0xdbe7c02d  ! 1: CASA_I	casa	[%r31] 0x 1, %r13, %r13
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0xda3fc010  ! 1: STD_R	std	%r13, [%r31 + %r16]
	normalw
	.word 0xa7458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x9194400b  ! 190: WRPR_PIL_R	wrpr	%r17, %r11, %pil
splash_cmpr_1_160:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 191: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_cmpr_1_161:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 192: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
ibp_1_162:
	nop
	.word 0xc3ec8026  ! 193: PREFETCHA_R	prefetcha	[%r18, %r6] 0x01, #one_read
	.word 0x89800011  ! 194: WRTICK_R	wr	%r0, %r17, %tick
ibp_1_164:
	nop
	.word 0xc19fd960  ! 195: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_1_165
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_165:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 196: CASA_R	casa	[%r31] %asi, %r19, %r20
splash_tba_1_166:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 197: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_167:
	nop
	ta T_CHANGE_HPRIV
	setx 0x20f49274e0a3eb3f, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 198: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_1_168:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 199: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa1a00171  ! 200: FABSq	dis not found

trapasi_1_170:
	nop
	mov 0x20, %r1 	! (VA for ASI 0x4c) 
	.word 0xe0c84980  ! 201: LDSBA_R	ldsba	[%r1, %r0] 0x4c, %r16
splash_tba_1_171:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 202: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xe197e128  ! 203: LDQFA_I	-	[%r31, 0x0128], %f16
	.word 0x87802055  ! 204: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x91454000  ! 205: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
memptr_1_172:
	set 0x60740000, %r31
	.word 0x85843336  ! 206: WRCCR_I	wr	%r16, 0x1336, %ccr
splash_cmpr_1_173:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 207: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x89800011  ! 208: WRTICK_R	wr	%r0, %r17, %tick
pmu_1_175:
	nop
	setx 0xfffff460ffffff86, %g1, %g7
	.word 0xa3800007  ! 209: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_1_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_176
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
cwq_1_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 210: RDPC	rd	%pc, %r18
	.word 0x91d020b4  ! 211: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x89800011  ! 212: WRTICK_R	wr	%r0, %r17, %tick
	setx vahole_target2, %r18, %r27
	.word 0x9bb40492  ! 213: FCMPLE32	fcmple32	%d16, %d18, %r13
	.word 0xda8008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_1_179:
	nop
	setx 0xfffff6befffff35b, %g1, %g7
	.word 0xa3800007  ! 215: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
brcommon3_1_180:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdbe7c034  ! 1: CASA_I	casa	[%r31] 0x 1, %r20, %r13
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdb1fc00b  ! 216: LDDF_R	ldd	[%r31, %r11], %f13
trapasi_1_181:
	nop
	mov 0x3c0, %r1 	! (VA for ASI 0x25) 
	.word 0xda8844a0  ! 217: LDUBA_R	lduba	[%r1, %r0] 0x25, %r13
pmu_1_182:
	nop
	setx 0xfffff944fffff7aa, %g1, %g7
	.word 0xa3800007  ! 218: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_183:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_183-donret_1_183-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00205e9b | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x22cb0001  ! 1: BRZ	brz,a,pt	%r12,<label_0xb0001>
	done
donretarg_1_183:
	.word 0xda6fe0f9  ! 219: LDSTUB_I	ldstub	%r13, [%r31 + 0x00f9]
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
    brnz %r10, sma_1_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_184:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 220: CASA_R	casa	[%r31] %asi, %r18, %r13
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
    brnz %r10, cwq_1_185
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_185
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
cwq_1_185:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 221: RDPC	rd	%pc, %r10
ibp_1_186:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1a449a8  ! 222: FDIVs	fdivs	%f17, %f8, %f16
	.word 0xe0bfc020  ! 223: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	.word 0x8d903331  ! 224: WRPR_PSTATE_I	wrpr	%r0, 0x1331, %pstate
	.word 0x89800011  ! 225: WRTICK_R	wr	%r0, %r17, %tick
ibp_1_189:
	nop
	.word 0xc1bfe060  ! 226: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xc30fc000  ! 227: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
brcommon3_1_190:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe06ff3fd  ! 1: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffff3fd]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc32fc008  ! 228: STXFSR_R	st-sfr	%f1, [%r8, %r31]
	.word 0xa1902003  ! 229: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_1_191:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 230: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
splash_lsu_1_192:
	nop
	ta T_CHANGE_HPRIV
	set 0xcefbd920, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx vahole_target3, %r18, %r27
	.word 0xa3b207ca  ! 232: PDIST	pdistn	%d8, %d10, %d48
jmptr_1_194:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 233: JMPL_R	jmpl	%r27 + %r0, %r27
dvapa_1_195:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe81, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e00d  ! 234: CASA_R	casa	[%r31] %asi, %r13, %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_196:
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
    brnz %r10, sma_1_197
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_197:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e012  ! 236: CASA_R	casa	[%r31] %asi, %r18, %r17
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
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_198:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e008  ! 237: CASA_R	casa	[%r31] %asi, %r8, %r17
	setx 0x44dc978da8e9382c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_199:
	.word 0x39400001  ! 238: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_1_200:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xc36fe2e8  ! 1: PREFETCH_I	prefetch	[%r31 + 0x02e8], #one_read
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe19fd960  ! 239: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_1_201
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_201:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e010  ! 240: CASA_R	casa	[%r31] %asi, %r16, %r17
	.word 0x8780208b  ! 241: WRASI_I	wr	%r0, 0x008b, %asi
	.word 0xe327c000  ! 242: STF_R	st	%f17, [%r0, %r31]
donret_1_202:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_202-donret_1_202-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0010ff07 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5b, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_202:
	.word 0xa1a349cd  ! 243: FDIVd	fdivd	%f44, %f44, %f16
	.word 0xe0dfe078  ! 244: LDXA_I	ldxa	[%r31, + 0x0078] %asi, %r16
pmu_1_203:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffffdbafffff18b, %g1, %g7
	.word 0xa3800007  ! 245: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_1_204:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_204:
	.word 0x8f902000  ! 246: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
pmu_1_205:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff510fffff0ab, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
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
    brnz %r10, cwq_1_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_206
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
cwq_1_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 248: RDPC	rd	%pc, %r18
donret_1_207:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_207-donret_1_207-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00edb772 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x151d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_207:
	.word 0x91a0c9c7  ! 249: FDIVd	fdivd	%f34, %f38, %f8
ibp_1_208:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xa1b307d0  ! 250: PDIST	pdistn	%d12, %d16, %d16
fpinit_1_209:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82f9f  ! 251: PREFETCHA_I	prefetcha	[%r0, + 0x0f9f] %asi, #one_read
change_to_randtl_1_210:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_210:
	.word 0x8f902000  ! 252: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
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
    brnz %r10, cwq_1_211
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_211
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
cwq_1_211:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 253: RDPC	rd	%pc, %r17
memptr_1_212:
	set 0x60540000, %r31
	.word 0x858266b6  ! 254: WRCCR_I	wr	%r9, 0x06b6, %ccr
dvapa_1_213:
	nop
	ta T_CHANGE_HPRIV
	mov 0xdcb, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa37031b2  ! 255: POPC_I	popc	0x11b2, %r17
donret_1_214:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_214-donret_1_214-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005a842e | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17c1, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_214:
	.word 0x9ba449d0  ! 256: FDIVd	fdivd	%f48, %f16, %f44
	.word 0xda3fe1e9  ! 257: STD_I	std	%r13, [%r31 + 0x01e9]
dvapa_1_215:
	nop
	ta T_CHANGE_HPRIV
	mov 0xcd5, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xda9fc034  ! 258: LDDA_R	ldda	[%r31, %r20] 0x01, %r13
	.word 0xc19fdb60  ! 259: LDDFA_R	ldda	[%r31, %r0], %f0
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
    brnz %r10, sma_1_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_216:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e014  ! 260: CASA_R	casa	[%r31] %asi, %r20, %r13
pmu_1_217:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffff8efffff6bf, %g1, %g7
	.word 0xa3800007  ! 261: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_218:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_1_219:
	nop
	ta T_CHANGE_PRIV
	setx 0xfffff382fffff579, %g1, %g7
	.word 0xa3800007  ! 263: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_220:
	nop
	setx 0xfffff6befffff121, %g1, %g7
	.word 0xa3800007  ! 264: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xd93e0e5c37dbe63c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_221:
	.word 0x39400001  ! 265: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_222:
	nop
	ta T_CHANGE_HPRIV
	set 0x7e4b3ff9, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
ibp_1_223:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xc1bfe0c0  ! 267: STDFA_I	stda	%f0, [0x00c0, %r31]
mondo_1_224:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d930011  ! 268: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
donret_1_225:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_225-donret_1_225-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004cfe37 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14cf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_225:
	.word 0xda6fe148  ! 269: LDSTUB_I	ldstub	%r13, [%r31 + 0x0148]
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_226) + 0, 16, 16)) -> intp(7,0,6)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_226)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,6)
#else
	setx 0x219c6a2b36f7f6fc, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_226:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 271: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xda9fe028  ! 272: LDDA_I	ldda	[%r31, + 0x0028] %asi, %r13
intveclr_1_228:
	nop
	ta T_CHANGE_HPRIV
	setx 0x4eea47c89fbd7686, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 273: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
dvapa_1_229:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd0c, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f80312b  ! 274: SIR	sir	0x112b
	.word 0x81b01021  ! 275: SIAM	siam	1
splash_hpstate_1_230:
	.word 0x81983e61  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e61, %hpstate
	.word 0xe4800ba0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
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
    brnz %r10, sma_1_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e012  ! 278: CASA_R	casa	[%r31] %asi, %r18, %r18
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
brcommon2_1_232:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc00d  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fda00  ! 280: LDDFA_R	ldda	[%r31, %r0], %f0
	setx vahole_target0, %r18, %r27
	.word 0xe19fdb60  ! 281: LDDFA_R	ldda	[%r31, %r0], %f16
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
    brnz %r10, sma_1_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_234:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 282: CASA_R	casa	[%r31] %asi, %r11, %r12
splash_lsu_1_235:
	nop
	ta T_CHANGE_HPRIV
	set 0x3650aecd, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfde00  ! 284: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d903efd  ! 285: WRPR_PSTATE_I	wrpr	%r0, 0x1efd, %pstate
memptr_1_237:
	set user_data_start, %r31
	.word 0x8583278a  ! 286: WRCCR_I	wr	%r12, 0x078a, %ccr
memptr_1_238:
	set 0x60140000, %r31
	.word 0x8584bd4f  ! 287: WRCCR_I	wr	%r18, 0x1d4f, %ccr
splash_decr_1_239:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa784c014  ! 288: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
	.word 0x95b484d0  ! 289: FCMPNE32	fcmpne32	%d18, %d16, %r10
intveclr_1_241:
	nop
	ta T_CHANGE_HPRIV
	setx 0x674c1790f7e0ecb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 290: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
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
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_242:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 291: CASA_R	casa	[%r31] %asi, %r19, %r10
	.word 0x8d802004  ! 292: WRFPRS_I	wr	%r0, 0x0004, %fprs
pmu_1_243:
	nop
	setx 0xfffff3e0fffffe61, %g1, %g7
	.word 0xa3800007  ! 293: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_244) + 0, 16, 16)) -> intp(7,0,25)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_244)&0xffffffff)  + 0, 16, 16)) -> intp(7,0,25)
#else
	setx 0x650c8fdea0709e40, %r1, %r28
	stxa %r28, [%g0] 0x73
#endif
intvec_1_244:
	.word 0x39400001  ! 294: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 295: WRFPRS_I	wr	%r0, 0x0004, %fprs
mondo_1_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d940008  ! 296: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0x95524000  ! 297: RDPR_CWP	<illegal instruction>
pmu_1_247:
	nop
	setx 0xfffffdfdfffffd33, %g1, %g7
	.word 0xa3800007  ! 298: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
br_longdelay3_1_248:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x99902004  ! 299: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	setx 0x6628bfac33066296, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_249:
	.word 0x39400001  ! 300: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97b204c7  ! 301: FCMPNE32	fcmpne32	%d8, %d38, %r11
ibp_1_251:
	nop
	.word 0xc1bfe1c0  ! 302: STDFA_I	stda	%f0, [0x01c0, %r31]
dvapa_1_252:
	nop
	ta T_CHANGE_HPRIV
	mov 0xa2c, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x9f803e03  ! 303: SIR	sir	0x1e03
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
    brnz %r10, cwq_1_253
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_253
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
cwq_1_253:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 304: RDPC	rd	%pc, %r20
pmu_1_254:
	nop
	setx 0xfffffcd9fffff5ad, %g1, %g7
	.word 0xa3800007  ! 305: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_255:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 306: JMPL_R	jmpl	%r27 + %r0, %r27
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
    brnz %r10, cwq_1_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_256
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
cwq_1_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 307: RDPC	rd	%pc, %r16
splash_hpstate_1_257:
	ta T_CHANGE_NONHPRIV
	.word 0x81983443  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1443, %hpstate
	.word 0xe077c000  ! 309: STX_R	stx	%r16, [%r31 + %r0]
	.word 0xa1a0016d  ! 310: FABSq	dis not found

	.word 0x93d02034  ! 311: Tcc_I	tne	icc_or_xcc, %r0 + 52
intveclr_1_259:
	nop
	ta T_CHANGE_HPRIV
	setx 0xc42d4d08a264c39e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
ibp_1_260:
	nop
	.word 0xe1bfe180  ! 313: STDFA_I	stda	%f16, [0x0180, %r31]
jmptr_1_261:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 314: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 315: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
ibp_1_263:
	nop
	.word 0xe19fc3e0  ! 316: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe127e163  ! 317: STF_I	st	%f16, [0x0163, %r31]
	.word 0xe04fc000  ! 318: LDSB_R	ldsb	[%r31 + %r0], %r16
ibp_1_264:
	nop
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc029  ! 319: STDA_R	stda	%r16, [%r31 + %r9] 0x01
	.word 0xe19fdf20  ! 320: LDDFA_R	ldda	[%r31, %r0], %f16
	setx vahole_target1, %r18, %r27
	.word 0xc1bfe0e0  ! 321: STDFA_I	stda	%f0, [0x00e0, %r31]
intveclr_1_267:
	nop
	ta T_CHANGE_HPRIV
	setx 0x67c43148f2c1e0a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_268:
	nop
	setx 0xfffffd6dfffff388, %g1, %g7
	.word 0xa3800007  ! 323: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a000d0  ! 324: FNEGd	fnegd	%f16, %f12
intveclr_1_269:
	nop
	ta T_CHANGE_HPRIV
	setx 0x95a21e7d2d7f21dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 325: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
tagged_1_270:
	tsubcctv %r17, 0x13d2, %r16
	.word 0xd807e072  ! 326: LDUW_I	lduw	[%r31 + 0x0072], %r12
	setx 0xfb24db1c4a0b1b96, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_271:
	.word 0x39400001  ! 327: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_1_272:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x9f803e03  ! 1: SIR	sir	0x1e03
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc1bfe1a0  ! 328: STDFA_I	stda	%f0, [0x01a0, %r31]
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
    brnz %r10, sma_1_273
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_273:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 329: CASA_R	casa	[%r31] %asi, %r10, %r10
dvapa_1_274:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf90, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x93b40482  ! 330: FCMPLE32	fcmple32	%d16, %d2, %r9
	setx vahole_target3, %r18, %r27
	.word 0xa7b14491  ! 331: FCMPLE32	fcmple32	%d36, %d48, %r19
dvapa_1_276:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc56, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc19fc3e0  ! 332: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_1_277:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 333: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1520000  ! 334: RDPR_PIL	<illegal instruction>
splash_cmpr_1_278:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 335: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xa1702453  ! 336: POPC_I	popc	0x0453, %r16
	setx vahole_target1, %r18, %r27
	.word 0xa5a149a1  ! 337: FDIVs	fdivs	%f5, %f1, %f18
jmptr_1_280:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 338: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9030e4  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x10e4, %pstate
ceter_1_282:
    nop
    ta T_CHANGE_HPRIV
    mov 6, %r17
    sllx %r17, 60, %r17
    mov 0x18, %r16
    stxa %r17, [%r16]0x4c
	.word 0xa3410000  ! 340: RDTICK	rd	%tick, %r17
	.word 0x99b407cb  ! 341: PDIST	pdistn	%d16, %d42, %d12
	.word 0xd847e0f0  ! 342: LDSW_I	ldsw	[%r31 + 0x00f0], %r12
	.word 0x91948010  ! 343: WRPR_PIL_R	wrpr	%r18, %r16, %pil
	.word 0xd837e000  ! 344: STH_I	sth	%r12, [%r31 + 0x0000]
ibp_1_285:
	nop
	.word 0x93b247d1  ! 345: PDIST	pdistn	%d40, %d48, %d40
	.word 0x39400001  ! 346: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd337e180  ! 347: STQF_I	-	%f9, [0x0180, %r31]
donret_1_287:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_287-donret_1_287-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ecc846 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x27e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_287:
	.word 0xd2ffe129  ! 348: SWAPA_I	swapa	%r9, [%r31 + 0x0129] %asi
	.word 0xd2800c20  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0x8d802004  ! 350: WRFPRS_I	wr	%r0, 0x0004, %fprs
dvapa_1_288:
	nop
	ta T_CHANGE_HPRIV
	mov 0x90f, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc02a  ! 351: LDDA_R	ldda	[%r31, %r10] 0x01, %r9
	.word 0x99a0016c  ! 352: FABSq	dis not found

	.word 0xe1bfe0c0  ! 353: STDFA_I	stda	%f16, [0x00c0, %r31]
brcommon2_1_291:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc008  ! 1: FLUSH_R	flush
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fdb60  ! 354: LDDFA_R	ldda	[%r31, %r0], %f0
donret_1_292:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_292-donret_1_292-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00342008 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_292:
	.word 0xa5a349d3  ! 355: FDIVd	fdivd	%f44, %f50, %f18
pmu_1_293:
	nop
	setx 0xfffff3e0fffff055, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_294:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_294-donret_1_294-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ee30d2 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1e0d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_294:
	.word 0xe46fe1a6  ! 357: LDSTUB_I	ldstub	%r18, [%r31 + 0x01a6]
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
    brnz %r10, sma_1_295
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_295:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00a  ! 358: CASA_R	casa	[%r31] %asi, %r10, %r18
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
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
    brnz %r10, cwq_1_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_296
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
cwq_1_296:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 360: RDPC	rd	%pc, %r13
splash_cmpr_1_297:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 361: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
mondo_1_298:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d948011  ! 362: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
brcommon3_1_299:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xdb37c00d  ! 1: STQF_R	-	%f13, [%r13, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xdadfc034  ! 363: LDXA_R	ldxa	[%r31, %r20] 0x01, %r13
intveclr_1_300:
	nop
	ta T_CHANGE_HPRIV
	setx 0xd815fae1e64c041e, %r1, %r28
	stxa %r28, [%g0] 0x72
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 364: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x89800011  ! 365: WRTICK_R	wr	%r0, %r17, %tick
splash_lsu_1_302:
	nop
	ta T_CHANGE_HPRIV
	set 0x3098617a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 366: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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
    brnz %r10, cwq_1_303
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_303
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
cwq_1_303:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 367: RDPC	rd	%pc, %r18
    set 0xb5e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b487d1  ! 368: PDIST	pdistn	%d18, %d48, %d50
splash_lsu_1_304:
	nop
	ta T_CHANGE_HPRIV
	set 0x4995574a, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 369: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
br_longdelay4_1_305:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 370: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
dvapa_1_306:
	nop
	ta T_CHANGE_HPRIV
	mov 0xb72, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xc3ec8034  ! 371: PREFETCHA_R	prefetcha	[%r18, %r20] 0x01, #one_read
pmu_1_307:
	nop
	setx 0xfffff8f5fffffeb9, %g1, %g7
	.word 0xa3800007  ! 372: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_308:
	nop
	setx 0xfffffa82fffff89f, %g1, %g7
	.word 0xa3800007  ! 373: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx vahole_target2, %r18, %r27
	.word 0xc1bfdc00  ! 374: STDFA_R	stda	%f0, [%r0, %r31]
tagged_1_310:
	tsubcctv %r20, 0x119f, %r18
	.word 0xd407e048  ! 375: LDUW_I	lduw	[%r31 + 0x0048], %r10
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
    brnz %r10, cwq_1_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_311
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
cwq_1_311:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 376: RDPC	rd	%pc, %r12
trapasi_1_312:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x5b) 
	.word 0xd8c04b60  ! 377: LDSWA_R	ldswa	[%r1, %r0] 0x5b, %r12
	.word 0x22cc4001  ! 1: BRZ	brz,a,pt	%r17,<label_0xc4001>
	.word 0x8d9038cf  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x18cf, %pstate
	.word 0xd897c02a  ! 379: LDUHA_R	lduha	[%r31, %r10] 0x01, %r12
mondo_1_315:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi
	ta T_CHANGE_PRIV
    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d904009  ! 380: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
fpinit_1_316:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 381: FDIVd	fdivd	%f0, %f4, %f4
dvapa_1_317:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf46, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfc2c0  ! 382: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8d90341b  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x141b, %pstate
pmu_1_319:
	nop
	setx 0xfffff94cfffffe72, %g1, %g7
	.word 0xa3800007  ! 384: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8d7e0a0  ! 385: LDSHA_I	ldsha	[%r31, + 0x00a0] %asi, %r12
	.word 0x8d9030c0  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x10c0, %pstate
fpinit_1_321:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 387: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xe19fdb60  ! 388: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9b48550  ! 389: FCMPEQ16	fcmpeq16	%d18, %d16, %r20
donret_1_322:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_322-donret_1_322-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d71ef6 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x68e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_322:
	.word 0xe8ffe18f  ! 390: SWAPA_I	swapa	%r20, [%r31 + 0x018f] %asi
	.word 0xa745c000  ! 391: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xab804004  ! 392: WR_CLEAR_SOFTINT_R	wr	%r1, %r4, %clear_softint
	setx 0x29325935327c33ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_323:
	.word 0x39400001  ! 393: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe63ff33a  ! 394: STD_I	std	%r19, [%r31 + 0xfffff33a]
	setx 0x9a5d96ea379f0b4b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_325:
	.word 0x39400001  ! 395: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7524000  ! 396: RDPR_CWP	<illegal instruction>
dvapa_1_327:
	nop
	ta T_CHANGE_HPRIV
	mov 0x82b, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1bfe1a0  ! 397: STDFA_I	stda	%f16, [0x01a0, %r31]
fpinit_1_328:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 398: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xe6dfc032  ! 399: LDXA_R	ldxa	[%r31, %r18] 0x01, %r19
	.word 0xc3ec8030  ! 400: PREFETCHA_R	prefetcha	[%r18, %r16] 0x01, #one_read
	setx vahole_target2, %r18, %r27
	.word 0xc19fdc00  ! 401: LDDFA_R	ldda	[%r31, %r0], %f0
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

	.xword	0x9aa801585b3b5539
	.xword	0x4f7ff15fb9951add
	.xword	0x12df0de45a18f7da
	.xword	0x2053ae23398865f4
	.xword	0x4e2a06f70a6d76bc
	.xword	0x680e98fd48556fbc
	.xword	0x4934de2eaf0b1657
	.xword	0xa3db3edb5f22f5cc
	.xword	0x344ac6f87b36a4e0
	.xword	0x65f886b58201f412
	.xword	0x69c9e80a508c7155
	.xword	0x20611a1b6b1be1be
	.xword	0x40a141523c05ea66
	.xword	0x4346fbbaf293775b
	.xword	0x34c9840ad8240ac8
	.xword	0xf4dc63ec12b23f3c
	.xword	0x8ff1f823566e3eae
	.xword	0x15257680b224f169
	.xword	0x9dbb2df7c1f3368c
	.xword	0x1938336366d57443
	.xword	0x211024b4ddded259
	.xword	0xcd9489abb386fa22
	.xword	0x0c4e52cf46f2b157
	.xword	0x6d5c5e1a2be840d5
	.xword	0xf98bf07ee322e802
	.xword	0x910d190e593c0c23
	.xword	0xa6959b3fdf407da3
	.xword	0xb8e82d5b686c00e0
	.xword	0xd8f7bdb9a958677c
	.xword	0xbca7ceb1f5980c8f
	.xword	0xf44d5237ea079c76
	.xword	0xdfe83f6ffa2f21cf
	.xword	0xe680c2aa2fc5fd07
	.xword	0x5cddeb5b0700d370
	.xword	0xe40a7eea55f11693
	.xword	0x7008a0bd03dd1003
	.xword	0x03780cb278d039d9
	.xword	0x650312b163c1b164
	.xword	0x641eb5c3b0cc2efd
	.xword	0x83f6391113ea733f
	.xword	0xcf7dfdcbbf1d3739
	.xword	0x66b68454bff36810
	.xword	0xea44c9f465579d06
	.xword	0xcdd6e77306c9e8d9
	.xword	0xbeecec3536a11ab6
	.xword	0xf064c14cdc9d0b13
	.xword	0x7460d4f48d145536
	.xword	0x50bd23d8a6558c83
	.xword	0x6d35293a8af8c911
	.xword	0x0374f67ca6cd84d0
	.xword	0x736f6e59753f68d4
	.xword	0xf79b27a44e1d7410
	.xword	0x528c2650bc47e580
	.xword	0x746d0162845c1004
	.xword	0xfc383d50199208c5
	.xword	0xad51da4b87eca25d
	.xword	0xf16ec3795c435968
	.xword	0xeb6b4e606751c569
	.xword	0xd9b6da2b11493e17
	.xword	0xb7fb13f6216ccfb4
	.xword	0xc02bf948b823aea3
	.xword	0x19898acadadce26b
	.xword	0xb527c1a67a3ce841
	.xword	0x55b7b664b020c2ff
	.xword	0xa7cd816beb14a7d5
	.xword	0xcf674e3315040e13
	.xword	0x5f334adb00807740
	.xword	0x8cd26d2cfe913697
	.xword	0x38e694034bac18ee
	.xword	0xb9369869682c604f
	.xword	0x8f0cca4e978c87e0
	.xword	0x40cb0c72af5f7c91
	.xword	0x2d667aa2ce6ab8e3
	.xword	0xb377bb88015b0344
	.xword	0x0fef80005e50c841
	.xword	0xd6998da99859305d
	.xword	0xac5fe657f9add4d0
	.xword	0xfbd1e4539cc98b8f
	.xword	0x3f33d1823f84626f
	.xword	0x52b20505f2ced372
	.xword	0xdb36b67189c44eb3
	.xword	0xba0dde34aacb0d7e
	.xword	0x3f0d6da8bc684888
	.xword	0x6165193524c45901
	.xword	0x48133cdb3f435938
	.xword	0xde3eed6bb81d7839
	.xword	0x72a464e583ce1fd0
	.xword	0xec3cc298664f6b18
	.xword	0xfc3941af8cdb77f8
	.xword	0x8c740d73f369f1c7
	.xword	0xdc5dfa831987dcac
	.xword	0x9d765b481d460d93
	.xword	0xb0323c24f12ceb01
	.xword	0x26df5fa1b5692b64
	.xword	0x60b4c6dab6f7e14f
	.xword	0xbd1a7884a28af39f
	.xword	0x049453e3c76b9007
	.xword	0xd766ec625d1522a1
	.xword	0x41459975c44d7c9c
	.xword	0xa6855484abda4e8c
	.xword	0xd3d0a2e1790b26a9
	.xword	0x7ac688bdd1a4d4f1
	.xword	0x14883308e0107c4d
	.xword	0x290a983d9f9c44d3
	.xword	0x3a4ca6e6ca746426
	.xword	0x5660687b11b90a52
	.xword	0x391b95a2c1961814
	.xword	0xd4801b7e6d87db7f
	.xword	0x9fcc9c699ae966e6
	.xword	0x68fc7ae0e82ca32c
	.xword	0xf751109d940c174f
	.xword	0x8bbaece4f8550530
	.xword	0x406c3d23a1fe975b
	.xword	0xcb77ef589fc06dc5
	.xword	0xa3c26ac3b4d11f5d
	.xword	0x91ba722c3ba6487b
	.xword	0xda92e0299c85da02
	.xword	0xc6fbd030cffc8f32
	.xword	0x8db973c4738e72b9
	.xword	0x08f1088589b8eebb
	.xword	0x8559bb37a344fe53
	.xword	0xdf37ede1af077c4d
	.xword	0x9b8182ce7579ef46
	.xword	0xdae64d8031d97f3c
	.xword	0x28c71f451f809315
	.xword	0x2cb7277a58721d1d
	.xword	0x11ba67f24c821dbd
	.xword	0xe0c12b967b130525
	.xword	0x048e56375c04cbda
	.xword	0x44d3a88a542cd027
	.xword	0x69e61cd70199406f
	.xword	0x147d729e5f670c60
	.xword	0xa25ce35e682a2a65
	.xword	0x7dc3f51c4282d56c
	.xword	0xba60e3f1997b3687
	.xword	0x443fe908f8ef2a54
	.xword	0x8e00155c880103b0
	.xword	0x3599ae278832ca30
	.xword	0x3a8ac78361643317
	.xword	0xf85ff96cc396d21b
	.xword	0x7633423ef9752a52
	.xword	0x3811fc5445c84fd8
	.xword	0xda7e2195ffe704be
	.xword	0x03c574b66b5c5e1f
	.xword	0x8ead06f97163c98d
	.xword	0x76828b33545b8925
	.xword	0x2d0303cf85cb8b09
	.xword	0xe16ae9f6155158bd
	.xword	0x675fd4e81356b06e
	.xword	0xf7e6c75f0ccc5cf8
	.xword	0x5e52e32389532cf9
	.xword	0x8c64fe695de3101f
	.xword	0x601f034ad99fd3b6
	.xword	0x74716743ee9357d0
	.xword	0x8fde3d575878c1f4
	.xword	0x5cad26a3d7df9448
	.xword	0x4a21f6801ef727f9
	.xword	0x90502ec1ab4a6a61
	.xword	0x6958ad8a9ffb3722
	.xword	0x9b6c185f0e1ee3a9
	.xword	0x73d15ebc7847ea31
	.xword	0x6bb0a4827d2e0972
	.xword	0xc58360756335495e
	.xword	0x0a4571bfd2d7d037
	.xword	0x4b5995c334b0fe39
	.xword	0x8849554b9959bbaf
	.xword	0xfb5613e1c4d9ba8b
	.xword	0x0c57fcc27bf517f5
	.xword	0x88944913fc333d09
	.xword	0x25854cce75593cb9
	.xword	0xea54df82610a401d
	.xword	0x6c636450626acdac
	.xword	0xac9c22b0d89c02d5
	.xword	0x1db23c6072b2a5a1
	.xword	0x33462c94f191cb1c
	.xword	0x31389b6833b94a38
	.xword	0xf30b70f7ecacec6c
	.xword	0xe342c6d21c91917e
	.xword	0x395741258ab1447a
	.xword	0x9c9e529dbf091568
	.xword	0x3696c06c2de8ab1c
	.xword	0xc057d44505083700
	.xword	0x23e42ac595dc0ed9
	.xword	0x5db7336563785325
	.xword	0xaaef4412308112b4
	.xword	0x30378fd15c3b9435
	.xword	0xb21a932fd2cfb1c9
	.xword	0x03bbbc0246773c1c
	.xword	0xf390efb4c7f80424
	.xword	0x15bb8747b160e6fb
	.xword	0x67fd4d32a88bae2c
	.xword	0xc419784a3113f306
	.xword	0xd81f669924d053dc
	.xword	0x58e8130db5ad5eb2
	.xword	0x977b31645f0082dc
	.xword	0x37242a0ec1fc72ac
	.xword	0xd9fc4e4eee838a12
	.xword	0x5fb24cf916ed4d44
	.xword	0xe4a895da5d9fcc32
	.xword	0x79b68a84dbeb4d11
	.xword	0x4e0833b6b737d3c8
	.xword	0x64f006d0ef61339f
	.xword	0x01567e949d438685
	.xword	0x8666f5b274323984
	.xword	0x6e05441e51b9827b
	.xword	0x01d3065b160a87b2
	.xword	0xf7ee6dc9891940db
	.xword	0xda8696e4a41936e6
	.xword	0xbf58830ca3b9721c
	.xword	0x7aebb863ffa5ec1f
	.xword	0x814215274227a366
	.xword	0x494c567761a84f48
	.xword	0x427ea2fc52091a1d
	.xword	0x11221ae06c8c8392
	.xword	0xb3d9097ba7011480
	.xword	0x74be8fd33f2befc9
	.xword	0x4955720cf595e016
	.xword	0xfa1b7bac735cfbef
	.xword	0xa0fc7c43649574e3
	.xword	0xd4f8050333ae38ba
	.xword	0xa297a34a8d4968a5
	.xword	0x3f72be996501866d
	.xword	0x8564504b5e086967
	.xword	0x25b62d4cd84f7e79
	.xword	0x386917322ea2cf65
	.xword	0x79dc574cab56fdd4
	.xword	0xa51e989261f7578f
	.xword	0x647100495551da36
	.xword	0xe11633caffee486a
	.xword	0x7c8008f524366da1
	.xword	0x86566b839f94d2ad
	.xword	0x3cf7771c35cf25fc
	.xword	0xde399a66d1d60f83
	.xword	0xf248bd5e2ea494e2
	.xword	0x838afc8e6d2234b3
	.xword	0x3346fd42d1b53b3f
	.xword	0x8cb1b91964674b97
	.xword	0x34c25bbdba58644e
	.xword	0x07f39ed4ff47fa9a
	.xword	0x39d4e11c4725f612
	.xword	0xf41f08e9f38b4f34
	.xword	0xe24a357afa692d2e
	.xword	0xbbdfa8348920e36b
	.xword	0x772ea1b97de5bb11
	.xword	0x19e59b8345198b83
	.xword	0xd53970227ff0eea3
	.xword	0xf715557d66b443f3
	.xword	0xa5b143b1fb388a91
	.xword	0xde6db296cd34c387
	.xword	0x56e2764340b38abb
	.xword	0xd8ce37a23af51ff9
	.xword	0x2e2814607133c78b
	.xword	0x56b90ce6763a1144
	.xword	0x844ff11a326ce464
	.xword	0xa5e09d1e57068560
	.xword	0xe9d9429e68cdaefe

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
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 85 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 948 "diag.j"
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
	TTE_CP	 = 0,
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
	TTE_IE	 = 0,
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
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
	TTE_P	 = 0,
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
	.xword	0x10c798404b958c07
	.xword	0x2549f620f256392a
	.xword	0x773342efbe94d94e
	.xword	0x60d01de6433fe12d
	.xword	0xa147a6b744c64457
	.xword	0x50d73d88ad141e0a
	.xword	0x8fa3decd310059f0
	.xword	0xa36338e4ffe49c2c
	.xword	0xaf01b9bd2268ed69
	.xword	0x02c62c061cd32b3a
	.xword	0x58c81c80e7979bd6
	.xword	0x262cf4aa9317ef3c
	.xword	0x41b07e1fe833c0c4
	.xword	0xc8befeb08b2c77fa
	.xword	0xedcf8396b932ab6e
	.xword	0x45fd82cd1986c65e
	.xword	0x94faff790422b6e1
	.xword	0xf1f3cd50b0499c59
	.xword	0xa36a2d874043ba63
	.xword	0xf4db36d4287814b7
	.xword	0xb2a5560941bf3afa
	.xword	0x18f4944d1d2ea6fd
	.xword	0x1f265ffef94536b8
	.xword	0x3165a85c56625bec
	.xword	0x6aae6c8d8daa6eeb
	.xword	0xffce371bcb4260ea
	.xword	0xb086c889294f4fd4
	.xword	0xaa555a1762de40a4
	.xword	0x3816d3321c1c4b12
	.xword	0x5a506cc326c257e0
	.xword	0x45517b5dff1a10c7
	.xword	0x90c23562b61bb6d7



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
	TTE_Size	 = 0,
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
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0x379443e2e33727c0
	.xword	0x060dc829d18b3ed8
	.xword	0xa7cf7e79539ddbf1
	.xword	0xa48181e2cb119e84
	.xword	0xaa4cd57beb5c7b58
	.xword	0x1c388bd96cfa2b3e
	.xword	0x5cd55777cbbce3e0
	.xword	0xf0b3f39095ae4362
	.xword	0xc74916a467be37a6
	.xword	0xc112625366812427
	.xword	0x8ec131ffd48c55ba
	.xword	0x1969d52169ec7267
	.xword	0xc1265a43e76875ff
	.xword	0xb6e533f7d5cc943d
	.xword	0x7abdf6798443e570
	.xword	0xe1664b9152c3a258
	.xword	0xedb69b370b9207e3
	.xword	0x0a14170ac09b981f
	.xword	0x1b12ebf748ab815d
	.xword	0x671b1b9202650457
	.xword	0x097d11eed215f080
	.xword	0x2c043de684686daa
	.xword	0x432fd9ce282feaa3
	.xword	0x4343952385a03406
	.xword	0xef45b78607439be4
	.xword	0xcf881faed174412b
	.xword	0x2dccf059947a5208
	.xword	0x9f90413b2ec13fa6
	.xword	0x3f1c695cc2416963
	.xword	0xe24eed22f8331ef2
	.xword	0x2c7becbe36744170
	.xword	0x86675c3d743ec406



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
	.xword	0x70d05b3f5a86bd3c
	.xword	0x5bdb50ee349f8585
	.xword	0x5e012241b548e0ca
	.xword	0x7b240274a84c7a3d
	.xword	0xda38695161b9cb82
	.xword	0xac710535e9eb314b
	.xword	0x13cfa715ae5cef5a
	.xword	0x0b2a32b4115e502d
	.xword	0x899d83bfc6221bac
	.xword	0x1f4bf432e67c35be
	.xword	0x4c860ff452fd004c
	.xword	0x594a06700b4af609
	.xword	0xe0cbf450b945785e
	.xword	0xbae2aee12487edb9
	.xword	0x266eef8fd92cbec7
	.xword	0xcc8e616cd7e46353
	.xword	0xc2d061bb684be9be
	.xword	0xc13db7e2eb7e589c
	.xword	0xce858fa99aa3c2b1
	.xword	0x7608cfd9ad5520ab
	.xword	0x3a91d3ae7355f5d3
	.xword	0x31058b9abe852436
	.xword	0x6ec78d76183eaf99
	.xword	0xdee2dfa54a83c09d
	.xword	0x384fa7523bc408df
	.xword	0xe23ae61d901a691d
	.xword	0x3b4f882cba92f141
	.xword	0xc64285972cb3c464
	.xword	0xc0f9db177e604de7
	.xword	0x130b288be13901cd
	.xword	0xbe3b797cd8f52cea
	.xword	0x196b161f1ba9dff0



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
	.xword	0x7c79076098634d34
	.xword	0x3ad84c80e3a328d9
	.xword	0xb3db9646e4fe3126
	.xword	0xd1e3ee1a9435ff32
	.xword	0x5836c76e1a6990ea
	.xword	0x7121844e6ccee3e2
	.xword	0x97f66275eebb47c4
	.xword	0x07e9693ea40b4ea8
	.xword	0x2b433e5492401a85
	.xword	0x0da82f1484ea09e8
	.xword	0xe5f6f19d5d4a441a
	.xword	0x3af19ae7f91b162c
	.xword	0x2413d4fd46955b20
	.xword	0xf5633d1982eff253
	.xword	0x5f70d0f96921aa44
	.xword	0x02ca2b0c242db0b5
	.xword	0x56c896bde3752aa2
	.xword	0x12e07a5b242622bb
	.xword	0xbde1b8bae0a5fdfe
	.xword	0x933d27f28bd4a945
	.xword	0x33909519bd80754f
	.xword	0x065fa20fc19e7327
	.xword	0x55a12f018be6451d
	.xword	0xc9a74f9a569f9565
	.xword	0x9f6a4995146bbc8e
	.xword	0xb71e1963f52ad77b
	.xword	0x413bbb92cf22a98e
	.xword	0x4e31d062b8be18d7
	.xword	0x43cbe4ab7b840207
	.xword	0xda9e2e40f227abc2
	.xword	0x07d6b56407f135f2
	.xword	0xff2d71b5b3a6af7d





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
	TTE_Size	 = 3,
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
	TTE_W	 = 1
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
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	TTE_CP	 = 1,
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

