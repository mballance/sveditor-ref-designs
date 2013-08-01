/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: fcrand05_rand_88.s
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
# 528 "diag.j.pp"
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
# 554 "diag.j.pp"
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

# 710 "/import/n2-aus-localdir1/somePerson/n2cdmspp2/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 576 "diag.j.pp"
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
# 648 "diag.j.pp"
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
    mov 0xff, %r11
lock_sync_thds:
    set sync_thr_counter4, %r23
#ifndef SPC
    and %o2, 0x38, %o2
    add %o2,%r23,%r23           !Core's sync counter
#endif
    st %r11, [%r23]             !lock sync_thr_counter4
    add %r23, 64, %r23
    st %r11, [%r23]             !lock sync_thr_counter5
    add %r23, 64, %r23
    st %r11, [%r23]             !lock sync_thr_counter6
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
	mov 0x33, %r14
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
	mov 0x32, %r14
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
	mov 0xb1, %r14
	mov 0xb0, %r30
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
    set 0x2b409973, %g2
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
	.word 0xc30fc000  ! 1: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
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
	.word 0x91920012  ! 1: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 5: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93a489b0  ! 9: FDIVs	fdivs	%f18, %f16, %f9
	.word 0xc1bfc2c0  ! 13: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfc3e0  ! 17: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe22fe1c1  ! 21: STB_I	stb	%r17, [%r31 + 0x01c1]
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
intvec_80_7:
	.word 0x95a509d2  ! 25: FDIVd	fdivd	%f20, %f18, %f10
	.word 0x2cca0001  ! 1: BRGZ	brgz,a,pt	%r8,<label_0xa0001>
	.word 0x8d902209  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0209, %pstate
fpinit_80_10:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 33: FCMPLE32	fcmple32	%d0, %d4, %r8
memptr_80_13:
	set 0x60340000, %r31
	.word 0x85847c94  ! 37: WRCCR_I	wr	%r17, 0x1c94, %ccr
	.word 0x91950004  ! 41: WRPR_PIL_R	wrpr	%r20, %r4, %pil
fpinit_80_18:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 45: FDIVs	fdivs	%f0, %f4, %f6
dvapa_80_19:
	nop
	ta T_CHANGE_HPRIV
	mov 0xf41, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87ac8a51  ! 49: FCMPd	fcmpd	%fcc<n>, %f18, %f48
brcommon3_80_20:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd7e7c02a  ! 1: CASA_I	casa	[%r31] 0x 1, %r10, %r11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd6dfc02c  ! 53: LDXA_R	ldxa	[%r31, %r12] 0x01, %r11
br_longdelay4_80_22:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902002  ! 57: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd7e7c020  ! 61: CASA_I	casa	[%r31] 0x 1, %r0, %r11
splash_hpstate_80_27:
	.word 0x8198248d  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048d, %hpstate
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d9023d6  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x03d6, %pstate
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
	set 0x001a1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 73: CASA_R	casa	[%r31] %asi, %r20, %r8
	.word 0xd137e118  ! 77: STQF_I	-	%f8, [0x0118, %r31]
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
    brnz %r10, sma_80_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_34:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e014  ! 81: CASA_R	casa	[%r31] %asi, %r20, %r12
memptr_80_36:
	set user_data_start, %r31
	.word 0x85847d69  ! 85: WRCCR_I	wr	%r17, 0x1d69, %ccr
pmu_80_39:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb7ffffffa2, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd0ffc02b  ! 93: SWAPA_R	swapa	%r8, [%r31 + %r11] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_43)+0, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_43)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_43:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_80_43:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa985291b  ! 97: WR_SET_SOFTINT_I	wr	%r20, 0x091b, %set_softint
fpinit_80_45:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 101: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x8d802004  ! 105: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe857e188  ! 109: LDSH_I	ldsh	[%r31 + 0x0188], %r20
pmu_80_48:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb8ffffffa8, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe737e038  ! 117: STQF_I	-	%f19, [0x0038, %r31]
	.word 0x89800011  ! 121: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa9a40d2c  ! 125: FsMULd	fsmuld	%f16, %f12, %f20
iaw_80_54:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
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
iaw_startwait80_54:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_80_54
    mov (~0x80&0xf0), %r16
    ld [%r23], %r16
iaw_wait80_54:
    brnz %r16, iaw_wait80_54
    ld [%r23], %r16
    ba iaw_startwait80_54
    mov 0x80, %r16
continue_iaw_80_54:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_80_54:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_80_54
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_80_54:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_80_54
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit80_54:
	mov 0x38, %r18
iaw4_80_54:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xc3e90024  ! 129: PREFETCHA_R	prefetcha	[%r4, %r4] 0x01, #one_read
splash_lsu_80_56:
	nop
	ta T_CHANGE_HPRIV
	set 0x9fd1f32f, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_80_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe7e7c02c  ! 1: CASA_I	casa	[%r31] 0x 1, %r12, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903d7f  ! 137: WRPR_PSTATE_I	wrpr	%r0, 0x1d7f, %pstate
	.word 0xe937e150  ! 141: STQF_I	-	%f20, [0x0150, %r31]
	.word 0xa7b400f1  ! 145: EDGE16LN	edge16ln	%r16, %r17, %r19
brcommon3_80_64:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe0f0  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x00f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903acd  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x1acd, %pstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_65)+48, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_80_65)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x80),1,3,,,,,1)
xir_80_65:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_80_65:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa984f7d9  ! 153: WR_SET_SOFTINT_I	wr	%r19, 0x17d9, %set_softint
splash_hpstate_80_66:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8198260d  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060d, %hpstate
pmu_80_67:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb5ffffffa7, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x97b444c9  ! 1: FCMPNE32	fcmpne32	%d48, %d40, %r11
intvec_80_69:
	.word 0xa3b4c4d4  ! 165: FCMPNE32	fcmpne32	%d50, %d20, %r17
brcommon2_80_71:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a00548  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe020  ! 169: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0xc36caef0  ! 173: PREFETCH_I	prefetch	[%r18 + 0x0ef0], #one_read
	.word 0xd337e090  ! 177: STQF_I	-	%f9, [0x0090, %r31]
splash_lsu_80_78:
	nop
	ta T_CHANGE_HPRIV
	set 0xec4d2346, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xae247064, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_80_82:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 193: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd33fe03d  ! 197: STDF_I	std	%f9, [0x003d, %r31]
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
setup_tick:
    setx 0xa4e1892ce8a5255f, %r1, %r17
    wrpr %g0, %r17, %tick

    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_40:
    setx 0x0fead1642680e98e, %r1, %r28
    mov 0x30, %r17
    stxa %r28, [%r17] 0x41
#endif
#ifdef SPLASH_HIDECR
    mov 8, %r1
    set SPLASH_HIDECR, %r2
    sllx %r2, 32, %r2
    stxa %r2, [%r1] 0x45
#endif
#if  (MULTIPASS > 0)
    mov 0x38, %g1
    ldxa [%g1]ASI_SCRATCHPAD, %r10
    brnz %g1, unlock_sync_thds_40
    wrpr %g0, %g0, %pstate
#endif
setup_spu_40:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %l6

#ifndef SPC
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
    sllx %o2, 5, %o2    !(CID*256)
    add %l6, %o2, %l6
#endif
# 901 "diag.j.pp"
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

unlock_sync_thds_40:
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
cmp_40_0:
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
    xor %r9, 0x40, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x40, %r9         ! My core mask
#endif
    mov 0x40, %r10
cmp_startwait40_0:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_40_0
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait40_0:
    brnz,a %r10, cmp_wait40_0
    ld [%r23], %r10
    ba cmp_startwait40_0
    mov 0x40, %r10
continue_cmp_40_0:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_40_0
    mov 0xa7, %r17
    best_set_reg(0x644a623b2d4de0f0, %r16, %r17)
cmp_multi_core_40_0:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91908003  ! 1: WRPR_PIL_R	wrpr	%r2, %r3, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 5: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x91a0c9b1  ! 9: FDIVs	fdivs	%f3, %f17, %f8
	.word 0xe1bfc3e0  ! 13: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfd920  ! 17: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe22fe181  ! 21: STB_I	stb	%r17, [%r31 + 0x0181]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa1b304c6  ! 1: FCMPNE32	fcmpne32	%d12, %d6, %r16
intvec_40_7:
	.word 0xc36979b1  ! 25: PREFETCH_I	prefetch	[%r5 + 0xfffff9b1], #one_read
	.word 0x26c90001  ! 1: BRLZ	brlz,a,pt	%r4,<label_0x90001>
	.word 0x8d9034cf  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x14cf, %pstate
fpinit_40_10:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 33: FCMPd	fcmpd	%fcc<n>, %f0, %f4
memptr_40_13:
	set 0x60540000, %r31
	.word 0x85812329  ! 37: WRCCR_I	wr	%r4, 0x0329, %ccr
cmp_40_16:
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
    xor %r9, 0x40, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x40, %r9         ! My core mask
#endif
    mov 0x40, %r10
cmp_startwait40_16:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_40_16
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait40_16:
    brnz,a %r10, cmp_wait40_16
    ld [%r23], %r10
    ba cmp_startwait40_16
    mov 0x40, %r10
continue_cmp_40_16:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_40_16
    mov 0xad, %r17
    best_set_reg(0x5a9c5ee5fa172e30, %r16, %r17)
cmp_multi_core_40_16:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9193000d  ! 41: WRPR_PIL_R	wrpr	%r12, %r13, %pil
fpinit_40_18:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 45: FCMPd	fcmpd	%fcc<n>, %f0, %f4
dvapa_40_19:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd13, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa1a449ab  ! 49: FDIVs	fdivs	%f17, %f11, %f16
brcommon3_40_20:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd7e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd69fe120  ! 53: LDDA_I	ldda	[%r31, + 0x0120] %asi, %r11
br_longdelay4_40_22:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902005  ! 57: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd7e7c020  ! 61: CASA_I	casa	[%r31] 0x 1, %r0, %r11
splash_hpstate_40_27:
	.word 0x81982a58  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a58, %hpstate
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d902671  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x0671, %pstate
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
	set 0x001a1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 73: CASA_R	casa	[%r31] %asi, %r12, %r8
	.word 0xd137e16c  ! 77: STQF_I	-	%f8, [0x016c, %r31]
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
    brnz %r10, sma_40_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_34:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00c  ! 81: CASA_R	casa	[%r31] %asi, %r12, %r12
memptr_40_36:
	set user_data_start, %r31
	.word 0x858525b0  ! 85: WRCCR_I	wr	%r20, 0x05b0, %ccr
pmu_40_39:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbcffffffa8, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd0ffc032  ! 93: SWAPA_R	swapa	%r8, [%r31 + %r18] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_43)+8, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_43)&0xffffffff) + 24, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_43:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_40_43:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa984e191  ! 97: WR_SET_SOFTINT_I	wr	%r19, 0x0191, %set_softint
fpinit_40_45:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 101: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d802000  ! 105: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe857e028  ! 109: LDSH_I	ldsh	[%r31 + 0x0028], %r20
pmu_40_48:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbfffffffaf, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe737e110  ! 117: STQF_I	-	%f19, [0x0110, %r31]
splash_tick_40_51:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x6837daf8aa58777e, %r16, %r17)
	.word 0x89800011  ! 121: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa7a20d22  ! 125: FsMULd	fsmuld	%f8, %f2, %f50
	.word 0x97a489a7  ! 129: FDIVs	fdivs	%f18, %f7, %f11
splash_lsu_40_56:
	nop
	ta T_CHANGE_HPRIV
	set 0x6828717c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_40_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe7e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d902380  ! 137: WRPR_PSTATE_I	wrpr	%r0, 0x0380, %pstate
	.word 0xe937e020  ! 141: STQF_I	-	%f20, [0x0020, %r31]
ticken_40_61:
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0x5ac0b6ab8d9c3dc3, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0xa7b2c0e5  ! 145: EDGE16LN	edge16ln	%r11, %r5, %r19
brcommon3_40_64:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe0d0  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x00d0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81983dcb  ! 149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dcb, %hpstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_65)+32, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_40_65)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x40),1,3,,,,,1)
xir_40_65:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_40_65:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa9833436  ! 153: WR_SET_SOFTINT_I	wr	%r12, 0x1436, %set_softint
splash_hpstate_40_66:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81983187  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1187, %hpstate
pmu_40_67:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbcffffffa9, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa1b4c4c2  ! 1: FCMPNE32	fcmpne32	%d50, %d2, %r16
intvec_40_69:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_40_71:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c973  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe140  ! 169: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0x87ab0a51  ! 173: FCMPd	fcmpd	%fcc<n>, %f12, %f48
	.word 0xd337e060  ! 177: STQF_I	-	%f9, [0x0060, %r31]
splash_lsu_40_78:
	nop
	ta T_CHANGE_HPRIV
	set 0x38edee0b, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_79:
	nop
	ta T_CHANGE_HPRIV
	set 0x7a818ee1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_40_82:
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
splash_tick_40_84:
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x85c67737d87e2ba7, %r16, %r17)
	.word 0x89800011  ! 193: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd33fe1b5  ! 197: STDF_I	std	%f9, [0x01b5, %r31]
# 975 "diag.j.pp"
cmpenall_40_86:
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
cmpenall_startwait40_86:
    mov 0x40, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_40_86
    nop
cmpenall_wait40_86:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait40_86
    nop
    ba,a cmpenall_startwait40_86
continue_cmpenall_40_86:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_40_86:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_40_86
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_40_86:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_40_86
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
    add %r23,%r8,%r23           !Core's sync counter
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
fork_lbl_0_6:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_1:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_2) + 48, 16, 16)) -> intp(1,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_2)&0xffffffff) + 48, 16, 16)) -> intp(1,0,9,,,,,1)
#else
	set 0x27e01f3e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_2:
	.word 0xc36cf3d7  ! 2: PREFETCH_I	prefetch	[%r19 + 0xfffff3d7], #one_read
	.word 0xd5e7c029  ! 3: CASA_I	casa	[%r31] 0x 1, %r9, %r10
	.word 0x9f803e24  ! 4: SIR	sir	0x1e24
	.word 0x97b504d1  ! 5: FCMPNE32	fcmpne32	%d20, %d48, %r11
	.word 0xd63fe060  ! 5: STD_I	std	%r11, [%r31 + 0x0060]
	.word 0xc19fe140  ! 6: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xd63fe160  ! 7: STD_I	std	%r11, [%r31 + 0x0160]
	.word 0xe1bfe060  ! 8: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xe19fe140  ! 9: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xd7e7c02d  ! 9: CASA_I	casa	[%r31] 0x 1, %r13, %r11
	.word 0xd1e7c02a  ! 10: CASA_I	casa	[%r31] 0x 1, %r10, %r8
	.word 0xe1bfe160  ! 11: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xe19fe140  ! 12: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xd11fe0a0  ! 13: LDDF_I	ldd	[%r31, 0x00a0], %f8
	.word 0xc19fe1a0  ! 13: LDDFA_I	ldda	[%r31, 0x01a0], %f0
memptr_20_3:
	set user_data_start, %r31
	.word 0xe19fe000  ! 14: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0x8584feaa  ! 15: WRCCR_I	wr	%r19, 0x1eaa, %ccr
	.word 0xe19fe080  ! 16: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0xe1bfe0c0  ! 17: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0xc1bfe000  ! 17: STDFA_I	stda	%f0, [0x0000, %r31]
memptr_20_4:
	set 0x60340000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_5:
	.word 0x9f802130  ! 18: SIR	sir	0x0130
	.word 0x85833f38  ! 19: WRCCR_I	wr	%r12, 0x1f38, %ccr
	.word 0x95a4c9cc  ! 20: FDIVd	fdivd	%f50, %f12, %f10
	.word 0x9f802050  ! 21: SIR	sir	0x0050
	.word 0x858233d7  ! 21: WRCCR_I	wr	%r8, 0x13d7, %ccr
memptr_20_6:
	set user_data_start, %r31
	.word 0xe1bfe080  ! 22: STDFA_I	stda	%f16, [0x0080, %r31]
	.word 0x85846886  ! 23: WRCCR_I	wr	%r17, 0x0886, %ccr
	.word 0xe31fe0e0  ! 24: LDDF_I	ldd	[%r31, 0x00e0], %f17
	.word 0xc19fe100  ! 25: LDDFA_I	ldda	[%r31, 0x0100], %f0
	.word 0xe31fe000  ! 25: LDDF_I	ldd	[%r31, 0x0000], %f17
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_8) + 32, 16, 16)) -> intp(1,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_8)&0xffffffff) + 24, 16, 16)) -> intp(4,0,16,,,,,1)
#else
	set 0x5a4057c7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x99a489d2  ! 1: FDIVd	fdivd	%f18, %f18, %f12
intvec_20_8:
	.word 0x97b344c2  ! 26: FCMPNE32	fcmpne32	%d44, %d2, %r11
	.word 0xe23fe1d0  ! 27: STD_I	std	%r17, [%r31 + 0x01d0]
	.word 0xc1bfe1a0  ! 28: STDFA_I	stda	%f0, [0x01a0, %r31]
	.word 0xc36c2834  ! 29: PREFETCH_I	prefetch	[%r16 + 0x0834], #one_read
	.word 0xe1bfe0a0  ! 29: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe2dfc031  ! 30: LDXA_R	ldxa	[%r31, %r17] 0x01, %r17
	.word 0x87afca4d  ! 31: FCMPd	fcmpd	%fcc<n>, %f62, %f44
	.word 0xc19fe1c0  ! 32: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0xe29fe090  ! 33: LDDA_I	ldda	[%r31, + 0x0090] %asi, %r17
	.word 0xe23fe150  ! 33: STD_I	std	%r17, [%r31 + 0x0150]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36cb2ae  ! 1: PREFETCH_I	prefetch	[%r18 + 0xfffff2ae], #one_read
intvec_20_11:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_12) + 56, 16, 16)) -> intp(1,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_12)&0xffffffff) + 16, 16, 16)) -> intp(5,0,24,,,,,1)
#else
	set 0x55504502, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_12:
	.word 0x39400001  ! 34: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe060  ! 35: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9b484c3  ! 37: FCMPNE32	fcmpne32	%d18, %d34, %r20
	.word 0xc36aa2b1  ! 37: PREFETCH_I	prefetch	[%r10 + 0x02b1], #one_read
memptr_20_14:
	set 0x60140000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_15:
	.word 0xe19fe100  ! 38: LDDFA_I	ldda	[%r31, 0x0100], %f16
	.word 0x85853df9  ! 39: WRCCR_I	wr	%r20, 0x1df9, %ccr
	.word 0xc36966ad  ! 40: PREFETCH_I	prefetch	[%r5 + 0x06ad], #one_read
	.word 0xc19fe100  ! 41: LDDFA_I	ldda	[%r31, 0x0100], %f0
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_17:
	.word 0xe71fe080  ! 42: LDDF_I	ldd	[%r31, 0x0080], %f19
	.word 0xa7b7c4c8  ! 43: FCMPNE32	fcmpne32	%d62, %d8, %r19
	.word 0x95b084c4  ! 44: FCMPNE32	fcmpne32	%d2, %d4, %r10
	.word 0xdb1fe0f0  ! 45: LDDF_I	ldd	[%r31, 0x00f0], %f13
	.word 0x24cfc001  ! 45: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xda97e0d0  ! 46: LDUHA_I	lduha	[%r31, + 0x00d0] %asi, %r13
	.word 0x9bb7c4ca  ! 47: FCMPNE32	fcmpne32	%d62, %d10, %r13
	.word 0x9f8020d0  ! 48: SIR	sir	0x00d0
	.word 0xdb1fc00c  ! 49: LDDF_R	ldd	[%r31, %r12], %f13
	.word 0xda3fe060  ! 49: STD_I	std	%r13, [%r31 + 0x0060]
	.word 0xd697e1f0  ! 50: LDUHA_I	lduha	[%r31, + 0x01f0] %asi, %r11
	.word 0xe19fe080  ! 51: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0xe19fe1a0  ! 52: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0xd69fe040  ! 53: LDDA_I	ldda	[%r31, + 0x0040] %asi, %r11
	.word 0xc1bfe100  ! 53: STDFA_I	stda	%f0, [0x0100, %r31]
memptr_20_21:
	set user_data_start, %r31
	.word 0xc19fe060  ! 54: LDDFA_I	ldda	[%r31, 0x0060], %f0
	.word 0x8582381f  ! 55: WRCCR_I	wr	%r8, 0x181f, %ccr
	.word 0xd69fe120  ! 56: LDDA_I	ldda	[%r31, + 0x0120] %asi, %r11
	.word 0xc1bfe120  ! 57: STDFA_I	stda	%f0, [0x0120, %r31]
	.word 0x8584601b  ! 57: WRCCR_I	wr	%r17, 0x001b, %ccr
	.word 0xd71fe040  ! 58: LDDF_I	ldd	[%r31, 0x0040], %f11
	.word 0xc19fe100  ! 59: LDDFA_I	ldda	[%r31, 0x0100], %f0
	.word 0xd7e7c02d  ! 60: CASA_I	casa	[%r31] 0x 1, %r13, %r11
	.word 0x9f802030  ! 61: SIR	sir	0x0030
	.word 0xd71fc013  ! 61: LDDF_R	ldd	[%r31, %r19], %f11
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_24) + 16, 16, 16)) -> intp(5,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_24)&0xffffffff) + 32, 16, 16)) -> intp(1,0,31,,,,,1)
#else
	set 0x2570c27b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_24:
memptr_20_25:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_26) + 32, 16, 16)) -> intp(2,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_26)&0xffffffff) + 0, 16, 16)) -> intp(4,0,5,,,,,1)
#else
	set 0xff50f70a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802a7f  ! 1: SIR	sir	0x0a7f
intvec_20_26:
	.word 0x39400001  ! 62: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8584ad0b  ! 63: WRCCR_I	wr	%r18, 0x0d0b, %ccr
	.word 0x39400001  ! 64: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36afd7b  ! 65: PREFETCH_I	prefetch	[%r11 + 0xfffffd7b], #one_read
	.word 0x9f802a5d  ! 65: SIR	sir	0x0a5d
memptr_20_28:
	set 0x60740000, %r31
	.word 0xd0dfc028  ! 66: LDXA_R	ldxa	[%r31, %r8] 0x01, %r8
	.word 0x8580e125  ! 67: WRCCR_I	wr	%r3, 0x0125, %ccr
	.word 0xe19fe080  ! 68: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0xc32fe050  ! 69: STXFSR_I	st-sfr	%f1, [0x0050, %r31]
	.word 0xc19fe0c0  ! 69: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	.word 0xd11fe010  ! 70: LDDF_I	ldd	[%r31, 0x0010], %f8
	.word 0xc36fe130  ! 71: PREFETCH_I	prefetch	[%r31 + 0x0130], #one_read
	.word 0xe19fe060  ! 72: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xd0dfc02d  ! 73: LDXA_R	ldxa	[%r31, %r13] 0x01, %r8
	.word 0xe19fe100  ! 73: LDDFA_I	ldda	[%r31, 0x0100], %f16
memptr_20_31:
	set 0x60740000, %r31
	.word 0xc1bfe0c0  ! 74: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0x85846166  ! 75: WRCCR_I	wr	%r17, 0x0166, %ccr
	.word 0xd13fe070  ! 76: STDF_I	std	%f8, [0x0070, %r31]
	.word 0xe19fe140  ! 77: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0x8581eac1  ! 77: WRCCR_I	wr	%r7, 0x0ac1, %ccr
memptr_20_32:
	set 0x60340000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_33:
	.word 0xd11fe130  ! 78: LDDF_I	ldd	[%r31, 0x0130], %f8
	.word 0x858136ce  ! 79: WRCCR_I	wr	%r4, 0x16ce, %ccr
	.word 0xc368efeb  ! 80: PREFETCH_I	prefetch	[%r3 + 0x0feb], #one_read
	.word 0xd51fe0c0  ! 81: LDDF_I	ldd	[%r31, 0x00c0], %f10
	.word 0x9ba049d4  ! 81: FDIVd	fdivd	%f32, %f20, %f44
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x99a049d1  ! 1: FDIVd	fdivd	%f32, %f48, %f12
intvec_20_35:
	.word 0xa1b084c1  ! 82: FCMPNE32	fcmpne32	%d2, %d32, %r16
	.word 0xd7e7c032  ! 83: CASA_I	casa	[%r31] 0x 1, %r18, %r11
	.word 0xd69fe060  ! 84: LDDA_I	ldda	[%r31, + 0x0060] %asi, %r11
	.word 0xa5a4c9ca  ! 85: FDIVd	fdivd	%f50, %f10, %f18
	.word 0xe49fe1e0  ! 85: LDDA_I	ldda	[%r31, + 0x01e0] %asi, %r18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_37:
memptr_20_38:
	set 0x60540000, %r31
	.word 0x39400001  ! 86: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x85853117  ! 87: WRCCR_I	wr	%r20, 0x1117, %ccr
	.word 0xe1bfe060  ! 88: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xa9b504d0  ! 89: FCMPNE32	fcmpne32	%d20, %d16, %r20
	.word 0xe19fe180  ! 89: LDDFA_I	ldda	[%r31, 0x0180], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_40) + 56, 16, 16)) -> intp(7,0,10,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_40)&0xffffffff) + 56, 16, 16)) -> intp(0,0,23,,,,,1)
#else
	set 0xcff0007f, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36b7c92  ! 1: PREFETCH_I	prefetch	[%r13 + 0xfffffc92], #one_read
intvec_20_40:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe0e0  ! 91: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xe11fe0a0  ! 92: LDDF_I	ldd	[%r31, 0x00a0], %f16
	.word 0xa7b504d3  ! 93: FCMPNE32	fcmpne32	%d20, %d50, %r19
	.word 0xc19fe0c0  ! 93: LDDFA_I	ldda	[%r31, 0x00c0], %f0
memptr_20_41:
	set 0x60740000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_42) + 40, 16, 16)) -> intp(1,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_42)&0xffffffff) + 16, 16, 16)) -> intp(3,0,4,,,,,1)
#else
	set 0xf9e04119, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_42:
	.word 0xe1bfe020  ! 94: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0x85822e48  ! 95: WRCCR_I	wr	%r8, 0x0e48, %ccr
	.word 0x9f802521  ! 96: SIR	sir	0x0521
	.word 0xe19fe180  ! 97: LDDFA_I	ldda	[%r31, 0x0180], %f16
	.word 0xa3a189d2  ! 97: FDIVd	fdivd	%f6, %f18, %f48
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_44) + 48, 16, 16)) -> intp(6,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_44)&0xffffffff) + 16, 16, 16)) -> intp(6,0,20,,,,,1)
#else
	set 0x3b0c0db, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f8031e5  ! 1: SIR	sir	0x11e5
intvec_20_44:
	.word 0xe91fe0a0  ! 98: LDDF_I	ldd	[%r31, 0x00a0], %f20
	.word 0xe19fe0e0  ! 99: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe91fe070  ! 101: LDDF_I	ldd	[%r31, 0x0070], %f20
	.word 0xc36a2bb8  ! 101: PREFETCH_I	prefetch	[%r8 + 0x0bb8], #one_read
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_46) + 32, 16, 16)) -> intp(5,0,0,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_46)&0xffffffff) + 32, 16, 16)) -> intp(2,0,20,,,,,1)
#else
	set 0x38d0de7b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_46:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 103: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe020  ! 104: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0x39400001  ! 105: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe040  ! 105: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0xe93fe1a0  ! 106: STDF_I	std	%f20, [0x01a0, %r31]
	.word 0xc1bfe120  ! 107: STDFA_I	stda	%f0, [0x0120, %r31]
	.word 0xe1bfe140  ! 108: STDFA_I	stda	%f16, [0x0140, %r31]
	.word 0xe8bfe170  ! 109: STDA_I	stda	%r20, [%r31 + 0x0170] %asi
	.word 0xe19fe0c0  ! 109: LDDFA_I	ldda	[%r31, 0x00c0], %f16
memptr_20_47:
	set 0x60740000, %r31
	.word 0xe89fe000  ! 110: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r20
	.word 0x8582a300  ! 111: WRCCR_I	wr	%r10, 0x0300, %ccr
	.word 0xe89fe070  ! 112: LDDA_I	ldda	[%r31, + 0x0070] %asi, %r20
	.word 0xe8bfe0c0  ! 113: STDA_I	stda	%r20, [%r31 + 0x00c0] %asi
	.word 0x8584648f  ! 113: WRCCR_I	wr	%r17, 0x048f, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_49:
	.word 0xc1bfe0a0  ! 114: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0x87afca4d  ! 115: FCMPd	fcmpd	%fcc<n>, %f62, %f44
	.word 0x97a109d4  ! 116: FDIVd	fdivd	%f4, %f20, %f42
	.word 0xe1bfe0e0  ! 117: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xa7b504d3  ! 117: FCMPNE32	fcmpne32	%d20, %d50, %r19
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_50) + 24, 16, 16)) -> intp(5,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_50)&0xffffffff) + 40, 16, 16)) -> intp(7,0,12,,,,,1)
#else
	set 0xf640519e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_50:
	.word 0xc36cfa56  ! 118: PREFETCH_I	prefetch	[%r19 + 0xfffffa56], #one_read
	.word 0xc19fe1c0  ! 119: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0xc32fe0a0  ! 120: STXFSR_I	st-sfr	%f1, [0x00a0, %r31]
	.word 0x9f802a30  ! 121: SIR	sir	0x0a30
	.word 0xe5e7c033  ! 121: CASA_I	casa	[%r31] 0x 1, %r19, %r18
memptr_20_52:
	set 0x60540000, %r31
	.word 0xe51fe130  ! 122: LDDF_I	ldd	[%r31, 0x0130], %f18
	.word 0x8584fab6  ! 123: WRCCR_I	wr	%r19, 0x1ab6, %ccr
	.word 0xc19fe140  ! 124: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xe49fe1d0  ! 125: LDDA_I	ldda	[%r31, + 0x01d0] %asi, %r18
	.word 0xe1bfe1a0  ! 125: STDFA_I	stda	%f16, [0x01a0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_53:
	.word 0x9f802463  ! 126: SIR	sir	0x0463
	.word 0x87afca4d  ! 127: FCMPd	fcmpd	%fcc<n>, %f62, %f44
	.word 0xe1bfe160  ! 128: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xa7b104d4  ! 129: FCMPNE32	fcmpne32	%d4, %d20, %r19
	.word 0xc19fe020  ! 129: LDDFA_I	ldda	[%r31, 0x0020], %f0
memptr_20_55:
	set 0x60540000, %r31
	.word 0xe19fe0e0  ! 130: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x85822699  ! 131: WRCCR_I	wr	%r8, 0x0699, %ccr
	.word 0xe1bfe180  ! 132: STDFA_I	stda	%f16, [0x0180, %r31]
	.word 0xc19fe1a0  ! 133: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	.word 0xc19fe100  ! 133: LDDFA_I	ldda	[%r31, 0x0100], %f0
memptr_20_57:
	set user_data_start, %r31
	.word 0xe6dfc02c  ! 134: LDXA_R	ldxa	[%r31, %r12] 0x01, %r19
	.word 0x8582e51c  ! 135: WRCCR_I	wr	%r11, 0x051c, %ccr
	.word 0xe1bfe180  ! 136: STDFA_I	stda	%f16, [0x0180, %r31]
	.word 0xc32fe030  ! 137: STXFSR_I	st-sfr	%f1, [0x0030, %r31]
	.word 0x8582bb28  ! 137: WRCCR_I	wr	%r10, 0x1b28, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_59:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_60) + 40, 16, 16)) -> intp(0,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_60)&0xffffffff) + 56, 16, 16)) -> intp(1,0,30,,,,,1)
#else
	set 0xfbc0a96e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_60:
	.word 0x39400001  ! 138: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe43fe060  ! 139: STD_I	std	%r18, [%r31 + 0x0060]
	.word 0xa9b104cb  ! 140: FCMPNE32	fcmpne32	%d4, %d42, %r20
	.word 0x97b304d1  ! 141: FCMPNE32	fcmpne32	%d12, %d48, %r11
	.word 0xc36fe1d0  ! 141: PREFETCH_I	prefetch	[%r31 + 0x01d0], #one_read
	.word 0xe91fe0d0  ! 142: LDDF_I	ldd	[%r31, 0x00d0], %f20
	.word 0x39400001  ! 143: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fe1e0  ! 144: LDDFA_I	ldda	[%r31, 0x01e0], %f0
	.word 0xe8dfc028  ! 145: LDXA_R	ldxa	[%r31, %r8] 0x01, %r20
	.word 0x39400001  ! 145: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_62) + 8, 16, 16)) -> intp(3,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_62)&0xffffffff) + 56, 16, 16)) -> intp(4,0,30,,,,,1)
#else
	set 0xdd009873, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36a79b6  ! 1: PREFETCH_I	prefetch	[%r9 + 0xfffff9b6], #one_read
intvec_20_62:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f802616  ! 1: SIR	sir	0x0616
intvec_20_63:
	.word 0x97b484c3  ! 146: FCMPNE32	fcmpne32	%d18, %d34, %r11
	.word 0xe19fe1e0  ! 147: LDDFA_I	ldda	[%r31, 0x01e0], %f16
	.word 0xa7b084c5  ! 148: FCMPNE32	fcmpne32	%d2, %d36, %r19
	.word 0x9f803140  ! 149: SIR	sir	0x1140
	.word 0xe1bfe1a0  ! 149: STDFA_I	stda	%f16, [0x01a0, %r31]
	.word 0xc1bfe180  ! 150: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0xd23fe050  ! 151: STD_I	std	%r9, [%r31 + 0x0050]
	.word 0xc32fe080  ! 152: STXFSR_I	st-sfr	%f1, [0x0080, %r31]
	.word 0xe1bfe020  ! 153: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0xd31fe190  ! 153: LDDF_I	ldd	[%r31, 0x0190], %f9
	.word 0xc19fe140  ! 154: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xc19fe0e0  ! 155: LDDFA_I	ldda	[%r31, 0x00e0], %f0
	.word 0xe19fe0a0  ! 156: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0xc1bfe020  ! 157: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xe19fe060  ! 157: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xe1bfe140  ! 158: STDFA_I	stda	%f16, [0x0140, %r31]
	.word 0x93a7c9d4  ! 159: FDIVd	fdivd	%f62, %f20, %f40
	.word 0xd29fe0f0  ! 160: LDDA_I	ldda	[%r31, + 0x00f0] %asi, %r9
	.word 0xc19fe000  ! 161: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0xd33fe0a0  ! 161: STDF_I	std	%f9, [0x00a0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_68) + 8, 16, 16)) -> intp(5,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_68)&0xffffffff) + 40, 16, 16)) -> intp(7,0,4,,,,,1)
#else
	set 0x6c08a47, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802d3a  ! 1: SIR	sir	0x0d3a
intvec_20_68:
	.word 0x39400001  ! 162: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe060  ! 163: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xe19fe1a0  ! 164: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0xa3a409ca  ! 165: FDIVd	fdivd	%f16, %f10, %f48
	.word 0xe1bfe020  ! 165: STDFA_I	stda	%f16, [0x0020, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_70) + 40, 16, 16)) -> intp(7,0,19,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_70)&0xffffffff) + 40, 16, 16)) -> intp(2,0,5,,,,,1)
#else
	set 0xdb4023f4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_20_70:
	.word 0xd097e1a0  ! 166: LDUHA_I	lduha	[%r31, + 0x01a0] %asi, %r8
	.word 0xe1bfe1e0  ! 167: STDFA_I	stda	%f16, [0x01e0, %r31]
	.word 0xc36c3eff  ! 168: PREFETCH_I	prefetch	[%r16 + 0xfffffeff], #one_read
	.word 0xe1e7c033  ! 169: CASA_I	casa	[%r31] 0x 1, %r19, %r16
	.word 0xe19fe120  ! 169: LDDFA_I	ldda	[%r31, 0x0120], %f16
	.word 0xa9a0054a  ! 1: FSQRTd	fsqrt	
memptr_20_72:
	set user_data_start, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_20_73:
	.word 0xe19fe0c0  ! 170: LDDFA_I	ldda	[%r31, 0x00c0], %f16
	.word 0x85817557  ! 171: WRCCR_I	wr	%r5, 0x1557, %ccr
	.word 0x39400001  ! 172: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fe180  ! 173: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xa1b504d1  ! 173: FCMPNE32	fcmpne32	%d20, %d48, %r16
memptr_20_75:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_76) + 56, 16, 16)) -> intp(2,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_76)&0xffffffff) + 56, 16, 16)) -> intp(4,0,21,,,,,1)
#else
	set 0xa0c001de, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x95b284cc  ! 1: FCMPNE32	fcmpne32	%d10, %d12, %r10
intvec_20_76:
	.word 0xc32fe150  ! 174: STXFSR_I	st-sfr	%f1, [0x0150, %r31]
	.word 0x85846fa2  ! 175: WRCCR_I	wr	%r17, 0x0fa2, %ccr
	.word 0xa5b184cb  ! 176: FCMPNE32	fcmpne32	%d6, %d42, %r18
	.word 0xda9fe170  ! 177: LDDA_I	ldda	[%r31, + 0x0170] %asi, %r13
	.word 0xc36d3496  ! 177: PREFETCH_I	prefetch	[%r20 + 0xfffff496], #one_read
memptr_20_77:
	set 0x60140000, %r31
	.word 0xd29fe020  ! 178: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r9
	.word 0x858523b4  ! 179: WRCCR_I	wr	%r20, 0x03b4, %ccr
	.word 0x9f8020c0  ! 180: SIR	sir	0x00c0
	.word 0xc32fe0d0  ! 181: STXFSR_I	st-sfr	%f1, [0x00d0, %r31]
	.word 0x85847163  ! 181: WRCCR_I	wr	%r17, 0x1163, %ccr
	.word 0xd31fe1b0  ! 182: LDDF_I	ldd	[%r31, 0x01b0], %f9
	.word 0x93b7c4d0  ! 183: FCMPNE32	fcmpne32	%d62, %d16, %r9
	.word 0xd33fe070  ! 184: STDF_I	std	%f9, [0x0070, %r31]
	.word 0xd29fe0d0  ! 185: LDDA_I	ldda	[%r31, + 0x00d0] %asi, %r9
	.word 0xd23fe0a0  ! 185: STD_I	std	%r9, [%r31 + 0x00a0]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_80) + 0, 16, 16)) -> intp(1,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_80)&0xffffffff) + 32, 16, 16)) -> intp(4,0,7,,,,,1)
#else
	set 0x5fb06be3, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802b27  ! 1: SIR	sir	0x0b27
intvec_20_80:
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
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a7c9d0  ! 187: FDIVd	fdivd	%f62, %f16, %f50
	.word 0xa3a0c9cb  ! 188: FDIVd	fdivd	%f34, %f42, %f48
	.word 0x91a4c9ca  ! 189: FDIVd	fdivd	%f50, %f10, %f8
	.word 0x39400001  ! 189: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
intvec_20_83:
	.word 0xa7b444d2  ! 190: FCMPNE32	fcmpne32	%d48, %d18, %r19
	.word 0xe19fe1c0  ! 191: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0xe19fe040  ! 192: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe0e0  ! 193: LDDFA_I	ldda	[%r31, 0x00e0], %f16
memptr_20_85:
	set 0x60740000, %r31
	.word 0xd23fe140  ! 194: STD_I	std	%r9, [%r31 + 0x0140]
	.word 0x8585233b  ! 195: WRCCR_I	wr	%r20, 0x033b, %ccr
	.word 0xd31fe040  ! 196: LDDF_I	ldd	[%r31, 0x0040], %f9
	.word 0xd29fe020  ! 197: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r9
	.word 0x8581f6f3  ! 197: WRCCR_I	wr	%r7, 0x16f3, %ccr
	.word 0xc19fe080  ! 198: LDDFA_I	ldda	[%r31, 0x0080], %f0
	.word 0xc36fe070  ! 199: PREFETCH_I	prefetch	[%r31 + 0x0070], #one_read
	.word 0xd3e7c028  ! 200: CASA_I	casa	[%r31] 0x 1, %r8, %r9
	.word 0xc19fe080  ! 201: LDDFA_I	ldda	[%r31, 0x0080], %f0
	.word 0xd3e7c030  ! 201: CASA_I	casa	[%r31] 0x 1, %r16, %r9
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_1:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_2) + 8, 16, 16)) -> intp(3,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_2)&0xffffffff) + 56, 16, 16)) -> intp(2,0,8,,,,,1)
#else
	set 0xe390b578, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_2:
	.word 0xc36ce712  ! 2: PREFETCH_I	prefetch	[%r19 + 0x0712], #one_read
	.word 0xd43fe110  ! 3: STD_I	std	%r10, [%r31 + 0x0110]
	.word 0x9ba249c2  ! 4: FDIVd	fdivd	%f40, %f2, %f44
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36fe080  ! 5: PREFETCH_I	prefetch	[%r31 + 0x0080], #one_read
	.word 0xc19fe080  ! 6: LDDFA_I	ldda	[%r31, 0x0080], %f0
	.word 0x97a7c9d2  ! 7: FDIVd	fdivd	%f62, %f18, %f42
	.word 0xe1bfe1a0  ! 8: STDFA_I	stda	%f16, [0x01a0, %r31]
	.word 0xc1bfe000  ! 9: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xd63fe010  ! 9: STD_I	std	%r11, [%r31 + 0x0010]
	.word 0xd0bfe050  ! 10: STDA_I	stda	%r8, [%r31 + 0x0050] %asi
	.word 0xc1bfe0a0  ! 11: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0xe1bfe1c0  ! 12: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xc32fe110  ! 13: STXFSR_I	st-sfr	%f1, [0x0110, %r31]
	.word 0xc1bfe1e0  ! 13: STDFA_I	stda	%f0, [0x01e0, %r31]
memptr_10_3:
	set user_data_start, %r31
	.word 0xe19fe080  ! 14: LDDFA_I	ldda	[%r31, 0x0080], %f16
	.word 0x85853cc9  ! 15: WRCCR_I	wr	%r20, 0x1cc9, %ccr
	.word 0xc19fe140  ! 16: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xc1bfe180  ! 17: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0xe1bfe020  ! 17: STDFA_I	stda	%f16, [0x0020, %r31]
memptr_10_4:
	set 0x60140000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_5:
	.word 0xd13fe010  ! 18: STDF_I	std	%f8, [0x0010, %r31]
	.word 0x85827096  ! 19: WRCCR_I	wr	%r9, 0x1096, %ccr
	.word 0x9f80224f  ! 20: SIR	sir	0x024f
	.word 0xe33fe1d0  ! 21: STDF_I	std	%f17, [0x01d0, %r31]
	.word 0x85846d33  ! 21: WRCCR_I	wr	%r17, 0x0d33, %ccr
memptr_10_6:
	set user_data_start, %r31
	.word 0xc19fe0a0  ! 22: LDDFA_I	ldda	[%r31, 0x00a0], %f0
	.word 0x858278d5  ! 23: WRCCR_I	wr	%r9, 0x18d5, %ccr
	.word 0xe3e7c031  ! 24: CASA_I	casa	[%r31] 0x 1, %r17, %r17
	.word 0xc1bfe120  ! 25: STDFA_I	stda	%f0, [0x0120, %r31]
	.word 0xe23fe010  ! 25: STD_I	std	%r17, [%r31 + 0x0010]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_8) + 0, 16, 16)) -> intp(7,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_8)&0xffffffff) + 24, 16, 16)) -> intp(4,0,8,,,,,1)
#else
	set 0x59a04750, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803b90  ! 1: SIR	sir	0x1b90
intvec_10_8:
	.word 0xa3b404d0  ! 26: FCMPNE32	fcmpne32	%d16, %d16, %r17
	.word 0x24cfc001  ! 27: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xe19fe1c0  ! 28: LDDFA_I	ldda	[%r31, 0x01c0], %f16
	.word 0xa3b444d4  ! 29: FCMPNE32	fcmpne32	%d48, %d20, %r17
	.word 0xc19fe0a0  ! 29: LDDFA_I	ldda	[%r31, 0x00a0], %f0
	.word 0xe2dfc028  ! 30: LDXA_R	ldxa	[%r31, %r8] 0x01, %r17
	.word 0xe23fe150  ! 31: STD_I	std	%r17, [%r31 + 0x0150]
	.word 0xc1bfe0a0  ! 32: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0xe31fc008  ! 33: LDDF_R	ldd	[%r31, %r8], %f17
	.word 0x24cfc001  ! 33: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa9b484d4  ! 1: FCMPNE32	fcmpne32	%d18, %d20, %r20
intvec_10_11:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_12) + 24, 16, 16)) -> intp(0,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_12)&0xffffffff) + 32, 16, 16)) -> intp(7,0,5,,,,,1)
#else
	set 0x77d0a20b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_12:
	.word 0xa3b0c4c5  ! 34: FCMPNE32	fcmpne32	%d34, %d36, %r17
	.word 0xc1bfe140  ! 35: STDFA_I	stda	%f0, [0x0140, %r31]
	.word 0x9f803d54  ! 36: SIR	sir	0x1d54
	.word 0x9f802f75  ! 37: SIR	sir	0x0f75
	.word 0x9f803ec0  ! 37: SIR	sir	0x1ec0
memptr_10_14:
	set 0x60540000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_15:
	.word 0xe1bfe1a0  ! 38: STDFA_I	stda	%f16, [0x01a0, %r31]
	.word 0x858534ad  ! 39: WRCCR_I	wr	%r20, 0x14ad, %ccr
	.word 0xa1b444d3  ! 40: FCMPNE32	fcmpne32	%d48, %d50, %r16
	.word 0xe19fe0c0  ! 41: LDDFA_I	ldda	[%r31, 0x00c0], %f16
	.word 0xc36c38d6  ! 41: PREFETCH_I	prefetch	[%r16 + 0xfffff8d6], #one_read
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_17:
	.word 0xe6bfe050  ! 42: STDA_I	stda	%r19, [%r31 + 0x0050] %asi
	.word 0xa7a7c9d2  ! 43: FDIVd	fdivd	%f62, %f18, %f50
	.word 0x9bb484d2  ! 44: FCMPNE32	fcmpne32	%d18, %d18, %r13
	.word 0x9f802050  ! 45: SIR	sir	0x0050
	.word 0x39400001  ! 45: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fe0f0  ! 46: STXFSR_I	st-sfr	%f1, [0x00f0, %r31]
	.word 0xda3fe1b0  ! 47: STD_I	std	%r13, [%r31 + 0x01b0]
	.word 0xda3fe190  ! 48: STD_I	std	%r13, [%r31 + 0x0190]
	.word 0xdbe7c031  ! 49: CASA_I	casa	[%r31] 0x 1, %r17, %r13
	.word 0x9bb7c4c8  ! 49: FCMPNE32	fcmpne32	%d62, %d8, %r13
	.word 0xd7e7c029  ! 50: CASA_I	casa	[%r31] 0x 1, %r9, %r11
	.word 0xc19fe180  ! 51: LDDFA_I	ldda	[%r31, 0x0180], %f0
	.word 0xc1bfe1a0  ! 52: STDFA_I	stda	%f0, [0x01a0, %r31]
	.word 0xd63fe0c0  ! 53: STD_I	std	%r11, [%r31 + 0x00c0]
	.word 0xc1bfe100  ! 53: STDFA_I	stda	%f0, [0x0100, %r31]
memptr_10_21:
	set user_data_start, %r31
	.word 0xc1bfe080  ! 54: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0x8582a1c1  ! 55: WRCCR_I	wr	%r10, 0x01c1, %ccr
	.word 0xd71fe1f0  ! 56: LDDF_I	ldd	[%r31, 0x01f0], %f11
	.word 0xe1bfe040  ! 57: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0x858421b9  ! 57: WRCCR_I	wr	%r16, 0x01b9, %ccr
	.word 0xd73fe180  ! 58: STDF_I	std	%f11, [0x0180, %r31]
	.word 0xc19fe1a0  ! 59: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	.word 0x9f8020f0  ! 60: SIR	sir	0x00f0
	.word 0x9f802190  ! 61: SIR	sir	0x0190
	.word 0xc32fe080  ! 61: STXFSR_I	st-sfr	%f1, [0x0080, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_24) + 32, 16, 16)) -> intp(2,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_24)&0xffffffff) + 48, 16, 16)) -> intp(3,0,30,,,,,1)
#else
	set 0x6106d6e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_24:
memptr_10_25:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_26) + 16, 16, 16)) -> intp(4,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_26)&0xffffffff) + 24, 16, 16)) -> intp(7,0,25,,,,,1)
#else
	set 0x7a0e4c5, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36b2b57  ! 1: PREFETCH_I	prefetch	[%r12 + 0x0b57], #one_read
intvec_10_26:
	.word 0x91b484c7  ! 62: FCMPNE32	fcmpne32	%d18, %d38, %r8
	.word 0x8584633c  ! 63: WRCCR_I	wr	%r17, 0x033c, %ccr
	.word 0x9f802cce  ! 64: SIR	sir	0x0cce
	.word 0x95a449c1  ! 65: FDIVd	fdivd	%f48, %f32, %f10
	.word 0x9f803f04  ! 65: SIR	sir	0x1f04
memptr_10_28:
	set 0x60740000, %r31
	.word 0xd0bfe050  ! 66: STDA_I	stda	%r8, [%r31 + 0x0050] %asi
	.word 0x858475cd  ! 67: WRCCR_I	wr	%r17, 0x15cd, %ccr
	.word 0xe1bfe1c0  ! 68: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xd097e000  ! 69: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0xe19fe000  ! 69: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0xd0dfc034  ! 70: LDXA_R	ldxa	[%r31, %r20] 0x01, %r8
	.word 0xd03fe1c0  ! 71: STD_I	std	%r8, [%r31 + 0x01c0]
	.word 0xc1bfe020  ! 72: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xd11fe120  ! 73: LDDF_I	ldd	[%r31, 0x0120], %f8
	.word 0xc1bfe100  ! 73: STDFA_I	stda	%f0, [0x0100, %r31]
memptr_10_31:
	set 0x60140000, %r31
	.word 0xc19fe1a0  ! 74: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	.word 0x85816953  ! 75: WRCCR_I	wr	%r5, 0x0953, %ccr
	.word 0xd11fe030  ! 76: LDDF_I	ldd	[%r31, 0x0030], %f8
	.word 0xe1bfe0a0  ! 77: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0x8582a9bc  ! 77: WRCCR_I	wr	%r10, 0x09bc, %ccr
memptr_10_32:
	set 0x60540000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_33:
	.word 0xd1e7c02d  ! 78: CASA_I	casa	[%r31] 0x 1, %r13, %r8
	.word 0x858468fb  ! 79: WRCCR_I	wr	%r17, 0x08fb, %ccr
	.word 0x95a509c5  ! 80: FDIVd	fdivd	%f20, %f36, %f10
	.word 0xd4bfe0a0  ! 81: STDA_I	stda	%r10, [%r31 + 0x00a0] %asi
	.word 0x39400001  ! 81: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36caa6d  ! 1: PREFETCH_I	prefetch	[%r18 + 0x0a6d], #one_read
intvec_10_35:
	.word 0x9f802feb  ! 82: SIR	sir	0x0feb
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd71fe1e0  ! 84: LDDF_I	ldd	[%r31, 0x01e0], %f11
	.word 0x9f8037ad  ! 85: SIR	sir	0x17ad
	.word 0xe51fe1d0  ! 85: LDDF_I	ldd	[%r31, 0x01d0], %f18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_37:
memptr_10_38:
	set 0x60340000, %r31
	.word 0x9f8039a1  ! 86: SIR	sir	0x19a1
	.word 0x858527bb  ! 87: WRCCR_I	wr	%r20, 0x07bb, %ccr
	.word 0xe1bfe160  ! 88: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0x9bb084c8  ! 89: FCMPNE32	fcmpne32	%d2, %d8, %r13
	.word 0xc19fe0e0  ! 89: LDDFA_I	ldda	[%r31, 0x00e0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_40) + 32, 16, 16)) -> intp(2,0,7,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_40)&0xffffffff) + 48, 16, 16)) -> intp(6,0,31,,,,,1)
#else
	set 0xae02251, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_10_40:
	.word 0xa1b204d3  ! 90: FCMPNE32	fcmpne32	%d8, %d50, %r16
	.word 0xc1bfe040  ! 91: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe0dfc033  ! 92: LDXA_R	ldxa	[%r31, %r19] 0x01, %r16
	.word 0x9f80251e  ! 93: SIR	sir	0x051e
	.word 0xc19fe1a0  ! 93: LDDFA_I	ldda	[%r31, 0x01a0], %f0
memptr_10_41:
	set 0x60140000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_42) + 24, 16, 16)) -> intp(5,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_42)&0xffffffff) + 16, 16, 16)) -> intp(7,0,2,,,,,1)
#else
	set 0x35c0fcd0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_42:
	.word 0xe19fe020  ! 94: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0x858364e2  ! 95: WRCCR_I	wr	%r13, 0x04e2, %ccr
	.word 0xc36d2462  ! 96: PREFETCH_I	prefetch	[%r20 + 0x0462], #one_read
	.word 0xc19fe1c0  ! 97: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0x9bb2c4d0  ! 97: FCMPNE32	fcmpne32	%d42, %d16, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_44) + 24, 16, 16)) -> intp(7,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_44)&0xffffffff) + 40, 16, 16)) -> intp(7,0,31,,,,,1)
#else
	set 0x1d8065eb, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa9a049d3  ! 1: FDIVd	fdivd	%f32, %f50, %f20
intvec_10_44:
	.word 0xe89fe140  ! 98: LDDA_I	ldda	[%r31, + 0x0140] %asi, %r20
	.word 0xc1bfe180  ! 99: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0x9f803b27  ! 100: SIR	sir	0x1b27
	.word 0xe897e0c0  ! 101: LDUHA_I	lduha	[%r31, + 0x00c0] %asi, %r20
	.word 0xa5a409d4  ! 101: FDIVd	fdivd	%f16, %f20, %f18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_46) + 16, 16, 16)) -> intp(2,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_46)&0xffffffff) + 56, 16, 16)) -> intp(1,0,17,,,,,1)
#else
	set 0x4c6054f6, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_46:
	.word 0x39400001  ! 102: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a7c9d0  ! 103: FDIVd	fdivd	%f62, %f16, %f10
	.word 0xc1bfe040  ! 104: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0x9f803029  ! 105: SIR	sir	0x1029
	.word 0xc1bfe0c0  ! 105: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xe91fe150  ! 106: LDDF_I	ldd	[%r31, 0x0150], %f20
	.word 0xe19fe0e0  ! 107: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xc19fe0c0  ! 108: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	.word 0xe93fe160  ! 109: STDF_I	std	%f20, [0x0160, %r31]
	.word 0xe1bfe020  ! 109: STDFA_I	stda	%f16, [0x0020, %r31]
memptr_10_47:
	set 0x60140000, %r31
	.word 0xe83fe080  ! 110: STD_I	std	%r20, [%r31 + 0x0080]
	.word 0x8584f1f2  ! 111: WRCCR_I	wr	%r19, 0x11f2, %ccr
	.word 0xe89fe0a0  ! 112: LDDA_I	ldda	[%r31, + 0x00a0] %asi, %r20
	.word 0xe91fe0f0  ! 113: LDDF_I	ldd	[%r31, 0x00f0], %f20
	.word 0x85827f8b  ! 113: WRCCR_I	wr	%r9, 0x1f8b, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_49:
	.word 0xe19fe060  ! 114: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xa9b7c4d0  ! 115: FCMPNE32	fcmpne32	%d62, %d16, %r20
	.word 0x39400001  ! 116: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe100  ! 117: STDFA_I	stda	%f16, [0x0100, %r31]
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_50) + 32, 16, 16)) -> intp(3,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_50)&0xffffffff) + 24, 16, 16)) -> intp(5,0,27,,,,,1)
#else
	set 0x5400710c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_50:
	.word 0xc369f40c  ! 118: PREFETCH_I	prefetch	[%r7 + 0xfffff40c], #one_read
	.word 0xc1bfe060  ! 119: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xe23fe190  ! 120: STD_I	std	%r17, [%r31 + 0x0190]
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe49fe030  ! 121: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r18
memptr_10_52:
	set 0x60140000, %r31
	.word 0xc32fe070  ! 122: STXFSR_I	st-sfr	%f1, [0x0070, %r31]
	.word 0x858238da  ! 123: WRCCR_I	wr	%r8, 0x18da, %ccr
	.word 0xc19fe160  ! 124: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0xe51fe090  ! 125: LDDF_I	ldd	[%r31, 0x0090], %f18
	.word 0xe1bfe0a0  ! 125: STDFA_I	stda	%f16, [0x00a0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_53:
	.word 0x39400001  ! 126: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91b7c4cc  ! 127: FCMPNE32	fcmpne32	%d62, %d12, %r8
	.word 0xc19fe020  ! 128: LDDFA_I	ldda	[%r31, 0x0020], %f0
	.word 0x99a509c8  ! 129: FDIVd	fdivd	%f20, %f8, %f12
	.word 0xe19fe0c0  ! 129: LDDFA_I	ldda	[%r31, 0x00c0], %f16
memptr_10_55:
	set 0x60340000, %r31
	.word 0xe19fe0a0  ! 130: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0x858372a6  ! 131: WRCCR_I	wr	%r13, 0x12a6, %ccr
	.word 0xe1bfe000  ! 132: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xc19fe000  ! 133: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0xc1bfe120  ! 133: STDFA_I	stda	%f0, [0x0120, %r31]
memptr_10_57:
	set user_data_start, %r31
	.word 0xe697e010  ! 134: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
	.word 0x8581e91e  ! 135: WRCCR_I	wr	%r7, 0x091e, %ccr
	.word 0xc1bfe040  ! 136: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe71fc00a  ! 137: LDDF_R	ldd	[%r31, %r10], %f19
	.word 0x858472a1  ! 137: WRCCR_I	wr	%r17, 0x12a1, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_59:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_60) + 0, 16, 16)) -> intp(3,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_60)&0xffffffff) + 40, 16, 16)) -> intp(1,0,31,,,,,1)
#else
	set 0x5e901d03, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_60:
	.word 0x9f802c06  ! 138: SIR	sir	0x0c06
	.word 0xc36fe150  ! 139: PREFETCH_I	prefetch	[%r31 + 0x0150], #one_read
	.word 0xa3a489c7  ! 140: FDIVd	fdivd	%f18, %f38, %f48
	.word 0xc369fd0f  ! 141: PREFETCH_I	prefetch	[%r7 + 0xfffffd0f], #one_read
	.word 0xa9b7c4c9  ! 141: FCMPNE32	fcmpne32	%d62, %d40, %r20
	.word 0x9f802070  ! 142: SIR	sir	0x0070
	.word 0xa9a7c9cd  ! 143: FDIVd	fdivd	%f62, %f44, %f20
	.word 0xe1bfe160  ! 144: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xe91fc00d  ! 145: LDDF_R	ldd	[%r31, %r13], %f20
	.word 0xe83fe1b0  ! 145: STD_I	std	%r20, [%r31 + 0x01b0]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_62) + 16, 16, 16)) -> intp(0,0,7,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_62)&0xffffffff) + 0, 16, 16)) -> intp(7,0,11,,,,,1)
#else
	set 0xe140946d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x97a449cc  ! 1: FDIVd	fdivd	%f48, %f12, %f42
intvec_10_62:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f802d86  ! 1: SIR	sir	0x0d86
intvec_10_63:
	.word 0xa1b504c7  ! 146: FCMPNE32	fcmpne32	%d20, %d38, %r16
	.word 0xe1bfe020  ! 147: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0x9ba1c9d2  ! 148: FDIVd	fdivd	%f38, %f18, %f44
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe1a0  ! 149: STDFA_I	stda	%f16, [0x01a0, %r31]
	.word 0xc1bfe040  ! 150: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xd23fe1e0  ! 151: STD_I	std	%r9, [%r31 + 0x01e0]
	.word 0xd31fc014  ! 152: LDDF_R	ldd	[%r31, %r20], %f9
	.word 0xe1bfe160  ! 153: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xd2dfc033  ! 153: LDXA_R	ldxa	[%r31, %r19] 0x01, %r9
	.word 0xe19fe040  ! 154: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0xe19fe060  ! 155: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xc1bfe080  ! 156: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0xc19fe140  ! 157: LDDFA_I	ldda	[%r31, 0x0140], %f0
	.word 0xe19fe140  ! 157: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xc1bfe1a0  ! 158: STDFA_I	stda	%f0, [0x01a0, %r31]
	.word 0xc36fe0b0  ! 159: PREFETCH_I	prefetch	[%r31 + 0x00b0], #one_read
	.word 0xd297e1f0  ! 160: LDUHA_I	lduha	[%r31, + 0x01f0] %asi, %r9
	.word 0xe19fe020  ! 161: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0xd2dfc033  ! 161: LDXA_R	ldxa	[%r31, %r19] 0x01, %r9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_68) + 48, 16, 16)) -> intp(5,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_68)&0xffffffff) + 56, 16, 16)) -> intp(1,0,9,,,,,1)
#else
	set 0x3250db9a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93a489d1  ! 1: FDIVd	fdivd	%f18, %f48, %f40
intvec_10_68:
	.word 0x93a449d0  ! 162: FDIVd	fdivd	%f48, %f16, %f40
	.word 0xc1bfe100  ! 163: STDFA_I	stda	%f0, [0x0100, %r31]
	.word 0xc1bfe1c0  ! 164: STDFA_I	stda	%f0, [0x01c0, %r31]
	.word 0x9f80300f  ! 165: SIR	sir	0x100f
	.word 0xe1bfe0c0  ! 165: STDFA_I	stda	%f16, [0x00c0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_70) + 32, 16, 16)) -> intp(0,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_70)&0xffffffff) + 8, 16, 16)) -> intp(4,0,5,,,,,1)
#else
	set 0x60e0e1a7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_10_70:
	.word 0xd0dfc02b  ! 166: LDXA_R	ldxa	[%r31, %r11] 0x01, %r8
	.word 0xe19fe020  ! 167: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0x9f802496  ! 168: SIR	sir	0x0496
	.word 0xe11fc012  ! 169: LDDF_R	ldd	[%r31, %r18], %f16
	.word 0xe1bfe1c0  ! 169: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xa1a7c971  ! 1: FMULq	dis not found

memptr_10_72:
	set user_data_start, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_10_73:
	.word 0xe19fe180  ! 170: LDDFA_I	ldda	[%r31, 0x0180], %f16
	.word 0x85826128  ! 171: WRCCR_I	wr	%r9, 0x0128, %ccr
	.word 0xc36cad90  ! 172: PREFETCH_I	prefetch	[%r18 + 0x0d90], #one_read
	.word 0xc19fe100  ! 173: LDDFA_I	ldda	[%r31, 0x0100], %f0
	.word 0xc36ceda2  ! 173: PREFETCH_I	prefetch	[%r19 + 0x0da2], #one_read
memptr_10_75:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_76) + 8, 16, 16)) -> intp(5,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_76)&0xffffffff) + 16, 16, 16)) -> intp(0,0,27,,,,,1)
#else
	set 0x36a0a412, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_10_76:
	.word 0xe63fe160  ! 174: STD_I	std	%r19, [%r31 + 0x0160]
	.word 0x858360ce  ! 175: WRCCR_I	wr	%r13, 0x00ce, %ccr
	.word 0x9bb404c1  ! 176: FCMPNE32	fcmpne32	%d16, %d32, %r13
	.word 0xdb1fe060  ! 177: LDDF_I	ldd	[%r31, 0x0060], %f13
	.word 0x93a089cd  ! 177: FDIVd	fdivd	%f2, %f44, %f40
memptr_10_77:
	set 0x60140000, %r31
	.word 0xd297e190  ! 178: LDUHA_I	lduha	[%r31, + 0x0190] %asi, %r9
	.word 0x8584fdc8  ! 179: WRCCR_I	wr	%r19, 0x1dc8, %ccr
	.word 0xc32fe100  ! 180: STXFSR_I	st-sfr	%f1, [0x0100, %r31]
	.word 0xd31fe190  ! 181: LDDF_I	ldd	[%r31, 0x0190], %f9
	.word 0x8582a077  ! 181: WRCCR_I	wr	%r10, 0x0077, %ccr
	.word 0xd31fc013  ! 182: LDDF_R	ldd	[%r31, %r19], %f9
	.word 0x87afca52  ! 183: FCMPd	fcmpd	%fcc<n>, %f62, %f18
	.word 0xd33fe1c0  ! 184: STDF_I	std	%f9, [0x01c0, %r31]
	.word 0xd297e110  ! 185: LDUHA_I	lduha	[%r31, + 0x0110] %asi, %r9
	.word 0x24cfc001  ! 185: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_80) + 0, 16, 16)) -> intp(2,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_80)&0xffffffff) + 32, 16, 16)) -> intp(6,0,5,,,,,1)
#else
	set 0xb10a375, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7a449d0  ! 1: FDIVd	fdivd	%f48, %f16, %f50
intvec_10_80:
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
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24cfc001  ! 187: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xc36c6d0d  ! 188: PREFETCH_I	prefetch	[%r17 + 0x0d0d], #one_read
	.word 0x99b404cd  ! 189: FCMPNE32	fcmpne32	%d16, %d44, %r12
	.word 0x87afca48  ! 189: FCMPd	fcmpd	%fcc<n>, %f62, %f8
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f803682  ! 1: SIR	sir	0x1682
intvec_10_83:
	.word 0x9f80226a  ! 190: SIR	sir	0x026a
	.word 0xc1bfe080  ! 191: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0xc19fe160  ! 192: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0x93b284c3  ! 193: FCMPNE32	fcmpne32	%d10, %d34, %r9
	.word 0xe1bfe1a0  ! 193: STDFA_I	stda	%f16, [0x01a0, %r31]
memptr_10_85:
	set 0x60540000, %r31
	.word 0xd31fe1a0  ! 194: LDDF_I	ldd	[%r31, 0x01a0], %f9
	.word 0x8582f489  ! 195: WRCCR_I	wr	%r11, 0x1489, %ccr
	.word 0xd33fe020  ! 196: STDF_I	std	%f9, [0x0020, %r31]
	.word 0xd31fc014  ! 197: LDDF_R	ldd	[%r31, %r20], %f9
	.word 0x8581387e  ! 197: WRCCR_I	wr	%r4, 0x187e, %ccr
	.word 0xe1bfe000  ! 198: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0x39400001  ! 199: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd2dfc028  ! 200: LDXA_R	ldxa	[%r31, %r8] 0x01, %r9
	.word 0xc1bfe100  ! 201: STDFA_I	stda	%f0, [0x0100, %r31]
	.word 0xd3e7c034  ! 201: CASA_I	casa	[%r31] 0x 1, %r20, %r9
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_1:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_2) + 32, 16, 16)) -> intp(6,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_2)&0xffffffff) + 16, 16, 16)) -> intp(5,0,26,,,,,1)
#else
	set 0x26c0c46a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_2:
	.word 0xc36a288a  ! 2: PREFETCH_I	prefetch	[%r8 + 0x088a], #one_read
	.word 0x87afca53  ! 3: FCMPd	fcmpd	%fcc<n>, %f62, %f50
	.word 0xc3686ec5  ! 4: PREFETCH_I	prefetch	[%r1 + 0x0ec5], #one_read
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36fe0f0  ! 5: PREFETCH_I	prefetch	[%r31 + 0x00f0], #one_read
	.word 0xc1bfe120  ! 6: STDFA_I	stda	%f0, [0x0120, %r31]
	.word 0xd7e7c033  ! 7: CASA_I	casa	[%r31] 0x 1, %r19, %r11
	.word 0xc19fe160  ! 8: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0xc1bfe1e0  ! 9: STDFA_I	stda	%f0, [0x01e0, %r31]
	.word 0x87afca49  ! 9: FCMPd	fcmpd	%fcc<n>, %f62, %f40
	.word 0xd0dfc02d  ! 10: LDXA_R	ldxa	[%r31, %r13] 0x01, %r8
	.word 0xe1bfe0a0  ! 11: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe1bfe160  ! 12: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xd1e7c02c  ! 13: CASA_I	casa	[%r31] 0x 1, %r12, %r8
	.word 0xc1bfe020  ! 13: STDFA_I	stda	%f0, [0x0020, %r31]
memptr_8_3:
	set user_data_start, %r31
	.word 0xe19fe060  ! 14: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0x858428f1  ! 15: WRCCR_I	wr	%r16, 0x08f1, %ccr
	.word 0xe19fe060  ! 16: LDDFA_I	ldda	[%r31, 0x0060], %f16
	.word 0xe19fe100  ! 17: LDDFA_I	ldda	[%r31, 0x0100], %f16
	.word 0xe1bfe0e0  ! 17: STDFA_I	stda	%f16, [0x00e0, %r31]
memptr_8_4:
	set 0x60740000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_5:
	.word 0xd09fe020  ! 18: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r8
	.word 0x85827aae  ! 19: WRCCR_I	wr	%r9, 0x1aae, %ccr
	.word 0xa3a449d4  ! 20: FDIVd	fdivd	%f48, %f20, %f48
	.word 0xe2dfc034  ! 21: LDXA_R	ldxa	[%r31, %r20] 0x01, %r17
	.word 0x8584771d  ! 21: WRCCR_I	wr	%r17, 0x171d, %ccr
memptr_8_6:
	set user_data_start, %r31
	.word 0xc19fe060  ! 22: LDDFA_I	ldda	[%r31, 0x0060], %f0
	.word 0x85807aa8  ! 23: WRCCR_I	wr	%r1, 0x1aa8, %ccr
	.word 0xe31fc00b  ! 24: LDDF_R	ldd	[%r31, %r11], %f17
	.word 0xc1bfe140  ! 25: STDFA_I	stda	%f0, [0x0140, %r31]
	.word 0xe2dfc033  ! 25: LDXA_R	ldxa	[%r31, %r19] 0x01, %r17
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_8) + 56, 16, 16)) -> intp(2,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_8)&0xffffffff) + 16, 16, 16)) -> intp(4,0,16,,,,,1)
#else
	set 0xf0603ce8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_8_8:
	.word 0x9f802673  ! 26: SIR	sir	0x0673
	.word 0x39400001  ! 27: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fe0c0  ! 28: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	.word 0xc368ecbd  ! 29: PREFETCH_I	prefetch	[%r3 + 0x0cbd], #one_read
	.word 0xe19fe140  ! 29: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xe29fe030  ! 30: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r17
	.word 0xe3e7c02c  ! 31: CASA_I	casa	[%r31] 0x 1, %r12, %r17
	.word 0xc19fe1e0  ! 32: LDDFA_I	ldda	[%r31, 0x01e0], %f0
	.word 0xc32fe120  ! 33: STXFSR_I	st-sfr	%f1, [0x0120, %r31]
	.word 0xe3e7c030  ! 33: CASA_I	casa	[%r31] 0x 1, %r16, %r17
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36b3f02  ! 1: PREFETCH_I	prefetch	[%r12 + 0xffffff02], #one_read
intvec_8_11:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_12) + 0, 16, 16)) -> intp(5,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_12)&0xffffffff) + 16, 16, 16)) -> intp(2,0,30,,,,,1)
#else
	set 0x2d3027b7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_12:
	.word 0xc36cad2d  ! 34: PREFETCH_I	prefetch	[%r18 + 0x0d2d], #one_read
	.word 0xe19fe100  ! 35: LDDFA_I	ldda	[%r31, 0x0100], %f16
	.word 0xc36c2262  ! 36: PREFETCH_I	prefetch	[%r16 + 0x0262], #one_read
	.word 0x95a1c9c3  ! 37: FDIVd	fdivd	%f38, %f34, %f10
	.word 0x95a249d2  ! 37: FDIVd	fdivd	%f40, %f18, %f10
memptr_8_14:
	set 0x60140000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_15:
	.word 0xc19fe160  ! 38: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0x85852266  ! 39: WRCCR_I	wr	%r20, 0x0266, %ccr
	.word 0xa7a449c1  ! 40: FDIVd	fdivd	%f48, %f32, %f50
	.word 0xc1bfe060  ! 41: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0xc36ae08e  ! 41: PREFETCH_I	prefetch	[%r11 + 0x008e], #one_read
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_17:
	.word 0xe71fe1f0  ! 42: LDDF_I	ldd	[%r31, 0x01f0], %f19
	.word 0xa7a7c9d3  ! 43: FDIVd	fdivd	%f62, %f50, %f50
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xdb1fe010  ! 45: LDDF_I	ldd	[%r31, 0x0010], %f13
	.word 0xdbe7c033  ! 45: CASA_I	casa	[%r31] 0x 1, %r19, %r13
	.word 0xdabfe000  ! 46: STDA_I	stda	%r13, [%r31 + 0x0000] %asi
	.word 0x24cfc001  ! 47: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xdbe7c030  ! 48: CASA_I	casa	[%r31] 0x 1, %r16, %r13
	.word 0xda9fe070  ! 49: LDDA_I	ldda	[%r31, + 0x0070] %asi, %r13
	.word 0xdbe7c031  ! 49: CASA_I	casa	[%r31] 0x 1, %r17, %r13
	.word 0xc32fe0e0  ! 50: STXFSR_I	st-sfr	%f1, [0x00e0, %r31]
	.word 0xc19fe040  ! 51: LDDFA_I	ldda	[%r31, 0x0040], %f0
	.word 0xe19fe000  ! 52: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0xd6dfc034  ! 53: LDXA_R	ldxa	[%r31, %r20] 0x01, %r11
	.word 0xc1bfe080  ! 53: STDFA_I	stda	%f0, [0x0080, %r31]
memptr_8_21:
	set user_data_start, %r31
	.word 0xc19fe160  ! 54: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0x85843a6e  ! 55: WRCCR_I	wr	%r16, 0x1a6e, %ccr
	.word 0xd71fe1a0  ! 56: LDDF_I	ldd	[%r31, 0x01a0], %f11
	.word 0xe1bfe060  ! 57: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0x85853967  ! 57: WRCCR_I	wr	%r20, 0x1967, %ccr
	.word 0xd6bfe1f0  ! 58: STDA_I	stda	%r11, [%r31 + 0x01f0] %asi
	.word 0xc1bfe0c0  ! 59: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xd73fe1b0  ! 60: STDF_I	std	%f11, [0x01b0, %r31]
	.word 0xd6dfc031  ! 61: LDXA_R	ldxa	[%r31, %r17] 0x01, %r11
	.word 0x9f8020c0  ! 61: SIR	sir	0x00c0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_24) + 32, 16, 16)) -> intp(3,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_24)&0xffffffff) + 48, 16, 16)) -> intp(0,0,2,,,,,1)
#else
	set 0x6dc040db, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_24:
memptr_8_25:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_26) + 16, 16, 16)) -> intp(3,0,18,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_26)&0xffffffff) + 56, 16, 16)) -> intp(5,0,6,,,,,1)
#else
	set 0xf24086f6, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f80281f  ! 1: SIR	sir	0x081f
intvec_8_26:
	.word 0x9f803aca  ! 62: SIR	sir	0x1aca
	.word 0x85847a3e  ! 63: WRCCR_I	wr	%r17, 0x1a3e, %ccr
	.word 0x9f80332f  ! 64: SIR	sir	0x132f
	.word 0x91b404cd  ! 65: FCMPNE32	fcmpne32	%d16, %d44, %r8
	.word 0xc36c785b  ! 65: PREFETCH_I	prefetch	[%r17 + 0xfffff85b], #one_read
memptr_8_28:
	set 0x60540000, %r31
	.word 0xd13fe060  ! 66: STDF_I	std	%f8, [0x0060, %r31]
	.word 0x8581a26a  ! 67: WRCCR_I	wr	%r6, 0x026a, %ccr
	.word 0xe19fe1a0  ! 68: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0xd11fc012  ! 69: LDDF_R	ldd	[%r31, %r18], %f8
	.word 0xc19fe160  ! 69: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0x9f8020f0  ! 70: SIR	sir	0x00f0
	.word 0x87afca48  ! 71: FCMPd	fcmpd	%fcc<n>, %f62, %f8
	.word 0xc19fe040  ! 72: LDDFA_I	ldda	[%r31, 0x0040], %f0
	.word 0xd097e130  ! 73: LDUHA_I	lduha	[%r31, + 0x0130] %asi, %r8
	.word 0xe1bfe180  ! 73: STDFA_I	stda	%f16, [0x0180, %r31]
memptr_8_31:
	set 0x60740000, %r31
	.word 0xc19fe120  ! 74: LDDFA_I	ldda	[%r31, 0x0120], %f0
	.word 0x8581abe5  ! 75: WRCCR_I	wr	%r6, 0x0be5, %ccr
	.word 0xd09fe170  ! 76: LDDA_I	ldda	[%r31, + 0x0170] %asi, %r8
	.word 0xe1bfe060  ! 77: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0x8584a989  ! 77: WRCCR_I	wr	%r18, 0x0989, %ccr
memptr_8_32:
	set 0x60540000, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_33:
	.word 0xd11fe0e0  ! 78: LDDF_I	ldd	[%r31, 0x00e0], %f8
	.word 0x8584af93  ! 79: WRCCR_I	wr	%r18, 0x0f93, %ccr
	.word 0x9f803127  ! 80: SIR	sir	0x1127
	.word 0xd5e7c02a  ! 81: CASA_I	casa	[%r31] 0x 1, %r10, %r10
	.word 0x91b484c4  ! 81: FCMPNE32	fcmpne32	%d18, %d4, %r8
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36ae453  ! 1: PREFETCH_I	prefetch	[%r11 + 0x0453], #one_read
intvec_8_35:
	.word 0x97a149d4  ! 82: FDIVd	fdivd	%f36, %f20, %f42
	.word 0x39400001  ! 83: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd7e7c030  ! 84: CASA_I	casa	[%r31] 0x 1, %r16, %r11
	.word 0x39400001  ! 85: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fe040  ! 85: STXFSR_I	st-sfr	%f1, [0x0040, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_37:
memptr_8_38:
	set 0x60140000, %r31
	.word 0x97a489c7  ! 86: FDIVd	fdivd	%f18, %f38, %f42
	.word 0x858532c1  ! 87: WRCCR_I	wr	%r20, 0x12c1, %ccr
	.word 0xc19fe0a0  ! 88: LDDFA_I	ldda	[%r31, 0x00a0], %f0
	.word 0x9f8036cc  ! 89: SIR	sir	0x16cc
	.word 0xe1bfe140  ! 89: STDFA_I	stda	%f16, [0x0140, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_40) + 16, 16, 16)) -> intp(3,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_40)&0xffffffff) + 32, 16, 16)) -> intp(7,0,14,,,,,1)
#else
	set 0x2b001d41, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9ba049d3  ! 1: FDIVd	fdivd	%f32, %f50, %f44
intvec_8_40:
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fe1e0  ! 91: LDDFA_I	ldda	[%r31, 0x01e0], %f16
	.word 0xe0bfe020  ! 92: STDA_I	stda	%r16, [%r31 + 0x0020] %asi
	.word 0x91b104d0  ! 93: FCMPNE32	fcmpne32	%d4, %d16, %r8
	.word 0xc1bfe1e0  ! 93: STDFA_I	stda	%f0, [0x01e0, %r31]
memptr_8_41:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_42) + 32, 16, 16)) -> intp(4,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_42)&0xffffffff) + 16, 16, 16)) -> intp(6,0,5,,,,,1)
#else
	set 0x88a02dd4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_42:
	.word 0xc19fe020  ! 94: LDDFA_I	ldda	[%r31, 0x0020], %f0
	.word 0x85847148  ! 95: WRCCR_I	wr	%r17, 0x1148, %ccr
	.word 0x97b504d2  ! 96: FCMPNE32	fcmpne32	%d20, %d18, %r11
	.word 0xe1bfe0e0  ! 97: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0x9f8035f9  ! 97: SIR	sir	0x15f9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_44) + 56, 16, 16)) -> intp(5,0,12,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_44)&0xffffffff) + 0, 16, 16)) -> intp(3,0,16,,,,,1)
#else
	set 0x7cb00fd5, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36ab6e8  ! 1: PREFETCH_I	prefetch	[%r10 + 0xfffff6e8], #one_read
intvec_8_44:
	.word 0xe89fe060  ! 98: LDDA_I	ldda	[%r31, + 0x0060] %asi, %r20
	.word 0xc1bfe140  ! 99: STDFA_I	stda	%f0, [0x0140, %r31]
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe91fe130  ! 101: LDDF_I	ldd	[%r31, 0x0130], %f20
	.word 0x39400001  ! 101: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_46) + 32, 16, 16)) -> intp(4,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_46)&0xffffffff) + 40, 16, 16)) -> intp(2,0,12,,,,,1)
#else
	set 0xa6a06482, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_46:
	.word 0x95a449c9  ! 102: FDIVd	fdivd	%f48, %f40, %f10
	.word 0x95a7c9ca  ! 103: FDIVd	fdivd	%f62, %f10, %f10
	.word 0xc1bfe1a0  ! 104: STDFA_I	stda	%f0, [0x01a0, %r31]
	.word 0xa9b444cd  ! 105: FCMPNE32	fcmpne32	%d48, %d44, %r20
	.word 0xe19fe0a0  ! 105: LDDFA_I	ldda	[%r31, 0x00a0], %f16
	.word 0xe89fe0f0  ! 106: LDDA_I	ldda	[%r31, + 0x00f0] %asi, %r20
	.word 0xe19fe140  ! 107: LDDFA_I	ldda	[%r31, 0x0140], %f16
	.word 0xc19fe1c0  ! 108: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0xe91fe0b0  ! 109: LDDF_I	ldd	[%r31, 0x00b0], %f20
	.word 0xe1bfe1e0  ! 109: STDFA_I	stda	%f16, [0x01e0, %r31]
memptr_8_47:
	set 0x60340000, %r31
	.word 0xe89fe140  ! 110: LDDA_I	ldda	[%r31, + 0x0140] %asi, %r20
	.word 0x8581b063  ! 111: WRCCR_I	wr	%r6, 0x1063, %ccr
	.word 0xe89fe1f0  ! 112: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r20
	.word 0xe89fe0e0  ! 113: LDDA_I	ldda	[%r31, + 0x00e0] %asi, %r20
	.word 0x85816d64  ! 113: WRCCR_I	wr	%r5, 0x0d64, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_49:
	.word 0xc1bfe180  ! 114: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0x39400001  ! 115: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803147  ! 116: SIR	sir	0x1147
	.word 0xc19fe1c0  ! 117: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0xc36ce772  ! 117: PREFETCH_I	prefetch	[%r19 + 0x0772], #one_read
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_50) + 24, 16, 16)) -> intp(5,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_50)&0xffffffff) + 56, 16, 16)) -> intp(1,0,20,,,,,1)
#else
	set 0xf5b0f3f4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_50:
	.word 0xa3a4c9d3  ! 118: FDIVd	fdivd	%f50, %f50, %f48
	.word 0xe1bfe0a0  ! 119: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe31fe140  ! 120: LDDF_I	ldd	[%r31, 0x0140], %f17
	.word 0xa5a509c9  ! 121: FDIVd	fdivd	%f20, %f40, %f18
	.word 0xe49fe110  ! 121: LDDA_I	ldda	[%r31, + 0x0110] %asi, %r18
memptr_8_52:
	set 0x60140000, %r31
	.word 0xe4bfe1d0  ! 122: STDA_I	stda	%r18, [%r31 + 0x01d0] %asi
	.word 0x85846211  ! 123: WRCCR_I	wr	%r17, 0x0211, %ccr
	.word 0xe1bfe060  ! 124: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0xe49fe1a0  ! 125: LDDA_I	ldda	[%r31, + 0x01a0] %asi, %r18
	.word 0xc19fe140  ! 125: LDDFA_I	ldda	[%r31, 0x0140], %f0
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_53:
	.word 0x9f802d04  ! 126: SIR	sir	0x0d04
	.word 0xc36fe000  ! 127: PREFETCH_I	prefetch	[%r31 + 0x0000], #one_read
	.word 0xc1bfe0e0  ! 128: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0x9f8029e0  ! 129: SIR	sir	0x09e0
	.word 0xe1bfe120  ! 129: STDFA_I	stda	%f16, [0x0120, %r31]
memptr_8_55:
	set 0x60740000, %r31
	.word 0xe19fe0e0  ! 130: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0x8580fb51  ! 131: WRCCR_I	wr	%r3, 0x1b51, %ccr
	.word 0xc19fe1e0  ! 132: LDDFA_I	ldda	[%r31, 0x01e0], %f0
	.word 0xc1bfe1e0  ! 133: STDFA_I	stda	%f0, [0x01e0, %r31]
	.word 0xc1bfe140  ! 133: STDFA_I	stda	%f0, [0x0140, %r31]
memptr_8_57:
	set user_data_start, %r31
	.word 0xe6bfe0a0  ! 134: STDA_I	stda	%r19, [%r31 + 0x00a0] %asi
	.word 0x85847a89  ! 135: WRCCR_I	wr	%r17, 0x1a89, %ccr
	.word 0xc1bfe0c0  ! 136: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xe7e7c034  ! 137: CASA_I	casa	[%r31] 0x 1, %r20, %r19
	.word 0x8584b869  ! 137: WRCCR_I	wr	%r18, 0x1869, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_59:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_60) + 48, 16, 16)) -> intp(4,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_60)&0xffffffff) + 24, 16, 16)) -> intp(7,0,17,,,,,1)
#else
	set 0x38704fde, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_60:
	.word 0xa5b304cc  ! 138: FCMPNE32	fcmpne32	%d12, %d12, %r18
	.word 0x24cfc001  ! 139: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x9ba209d0  ! 140: FDIVd	fdivd	%f8, %f16, %f44
	.word 0xa9b484c7  ! 141: FCMPNE32	fcmpne32	%d18, %d38, %r20
	.word 0xc36fe050  ! 141: PREFETCH_I	prefetch	[%r31 + 0x0050], #one_read
	.word 0xe91fe000  ! 142: LDDF_I	ldd	[%r31, 0x0000], %f20
	.word 0xe9e7c028  ! 143: CASA_I	casa	[%r31] 0x 1, %r8, %r20
	.word 0xc1bfe000  ! 144: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xe89fe1f0  ! 145: LDDA_I	ldda	[%r31, + 0x01f0] %asi, %r20
	.word 0xc36fe1f0  ! 145: PREFETCH_I	prefetch	[%r31 + 0x01f0], #one_read
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_62) + 32, 16, 16)) -> intp(1,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_62)&0xffffffff) + 40, 16, 16)) -> intp(3,0,7,,,,,1)
#else
	set 0xbeb0a238, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9ba149c2  ! 1: FDIVd	fdivd	%f36, %f2, %f44
intvec_8_62:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f803d13  ! 1: SIR	sir	0x1d13
intvec_8_63:
	.word 0x39400001  ! 146: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe180  ! 147: STDFA_I	stda	%f0, [0x0180, %r31]
	.word 0xa7a289d1  ! 148: FDIVd	fdivd	%f10, %f48, %f50
	.word 0x93a4c9d1  ! 149: FDIVd	fdivd	%f50, %f48, %f40
	.word 0xc19fe160  ! 149: LDDFA_I	ldda	[%r31, 0x0160], %f0
	.word 0xc19fe080  ! 150: LDDFA_I	ldda	[%r31, 0x0080], %f0
	.word 0x93b7c4d2  ! 151: FCMPNE32	fcmpne32	%d62, %d18, %r9
	.word 0xd31fc014  ! 152: LDDF_R	ldd	[%r31, %r20], %f9
	.word 0xc1bfe0e0  ! 153: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xd297e070  ! 153: LDUHA_I	lduha	[%r31, + 0x0070] %asi, %r9
	.word 0xe1bfe1e0  ! 154: STDFA_I	stda	%f16, [0x01e0, %r31]
	.word 0xc1bfe140  ! 155: STDFA_I	stda	%f0, [0x0140, %r31]
	.word 0xc1bfe100  ! 156: STDFA_I	stda	%f0, [0x0100, %r31]
	.word 0xc19fe040  ! 157: LDDFA_I	ldda	[%r31, 0x0040], %f0
	.word 0xc19fe040  ! 157: LDDFA_I	ldda	[%r31, 0x0040], %f0
	.word 0xe1bfe1c0  ! 158: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xd3e7c031  ! 159: CASA_I	casa	[%r31] 0x 1, %r17, %r9
	.word 0xd31fe170  ! 160: LDDF_I	ldd	[%r31, 0x0170], %f9
	.word 0xc1bfe160  ! 161: STDFA_I	stda	%f0, [0x0160, %r31]
	.word 0xd23fe190  ! 161: STD_I	std	%r9, [%r31 + 0x0190]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_68) + 32, 16, 16)) -> intp(7,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_68)&0xffffffff) + 56, 16, 16)) -> intp(2,0,22,,,,,1)
#else
	set 0xb3108f2d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5a449d3  ! 1: FDIVd	fdivd	%f48, %f50, %f18
intvec_8_68:
	.word 0x9f802888  ! 162: SIR	sir	0x0888
	.word 0xe1bfe160  ! 163: STDFA_I	stda	%f16, [0x0160, %r31]
	.word 0xe1bfe1c0  ! 164: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0x9f8038ea  ! 165: SIR	sir	0x18ea
	.word 0xe19fe0a0  ! 165: LDDFA_I	ldda	[%r31, 0x00a0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_70) + 8, 16, 16)) -> intp(6,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_70)&0xffffffff) + 56, 16, 16)) -> intp(7,0,6,,,,,1)
#else
	set 0x4ea07ca6, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802606  ! 1: SIR	sir	0x0606
intvec_8_70:
	.word 0xc32fe140  ! 166: STXFSR_I	st-sfr	%f1, [0x0140, %r31]
	.word 0xc19fe0c0  ! 167: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	.word 0xa1a449d3  ! 168: FDIVd	fdivd	%f48, %f50, %f16
	.word 0xe1e7c031  ! 169: CASA_I	casa	[%r31] 0x 1, %r17, %r16
	.word 0xc19fe1c0  ! 169: LDDFA_I	ldda	[%r31, 0x01c0], %f0
	.word 0xa5a00554  ! 1: FSQRTd	fsqrt	
memptr_8_72:
	set user_data_start, %r31
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_8_73:
	.word 0xe19fe1a0  ! 170: LDDFA_I	ldda	[%r31, 0x01a0], %f16
	.word 0x85853412  ! 171: WRCCR_I	wr	%r20, 0x1412, %ccr
	.word 0xa9a409c7  ! 172: FDIVd	fdivd	%f16, %f38, %f20
	.word 0xc1bfe080  ! 173: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0x97b504d1  ! 173: FCMPNE32	fcmpne32	%d20, %d48, %r11
memptr_8_75:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_76) + 48, 16, 16)) -> intp(3,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_76)&0xffffffff) + 8, 16, 16)) -> intp(5,0,29,,,,,1)
#else
	set 0xdc80c648, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa9a1c9d4  ! 1: FDIVd	fdivd	%f38, %f20, %f20
intvec_8_76:
	.word 0xe69fe1a0  ! 174: LDDA_I	ldda	[%r31, + 0x01a0] %asi, %r19
	.word 0x8581b9f2  ! 175: WRCCR_I	wr	%r6, 0x19f2, %ccr
	.word 0xc36cb56a  ! 176: PREFETCH_I	prefetch	[%r18 + 0xfffff56a], #one_read
	.word 0xdb1fe1d0  ! 177: LDDF_I	ldd	[%r31, 0x01d0], %f13
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_77:
	set 0x60540000, %r31
	.word 0xc32fe150  ! 178: STXFSR_I	st-sfr	%f1, [0x0150, %r31]
	.word 0x8584f597  ! 179: WRCCR_I	wr	%r19, 0x1597, %ccr
	.word 0xc32fe1c0  ! 180: STXFSR_I	st-sfr	%f1, [0x01c0, %r31]
	.word 0xd3e7c028  ! 181: CASA_I	casa	[%r31] 0x 1, %r8, %r9
	.word 0x85853a14  ! 181: WRCCR_I	wr	%r20, 0x1a14, %ccr
	.word 0xd2dfc028  ! 182: LDXA_R	ldxa	[%r31, %r8] 0x01, %r9
	.word 0x93a7c9cc  ! 183: FDIVd	fdivd	%f62, %f12, %f40
	.word 0xd31fe0d0  ! 184: LDDF_I	ldd	[%r31, 0x00d0], %f9
	.word 0xd297e090  ! 185: LDUHA_I	lduha	[%r31, + 0x0090] %asi, %r9
	.word 0xd3e7c033  ! 185: CASA_I	casa	[%r31] 0x 1, %r19, %r9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_80) + 56, 16, 16)) -> intp(7,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_80)&0xffffffff) + 16, 16, 16)) -> intp(2,0,24,,,,,1)
#else
	set 0x5b206d4a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xc36ca76c  ! 1: PREFETCH_I	prefetch	[%r18 + 0x076c], #one_read
intvec_8_80:
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
	.word 0x9f802406  ! 186: SIR	sir	0x0406
	.word 0x24cfc001  ! 187: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x39400001  ! 188: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f8039f0  ! 189: SIR	sir	0x19f0
	.word 0xd9e7c033  ! 189: CASA_I	casa	[%r31] 0x 1, %r19, %r12
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x91a4c9d0  ! 1: FDIVd	fdivd	%f50, %f16, %f8
intvec_8_83:
	.word 0x9f80350d  ! 190: SIR	sir	0x150d
	.word 0xc1bfe0a0  ! 191: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0xe1bfe0c0  ! 192: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0xc36c664d  ! 193: PREFETCH_I	prefetch	[%r17 + 0x064d], #one_read
	.word 0xc1bfe040  ! 193: STDFA_I	stda	%f0, [0x0040, %r31]
memptr_8_85:
	set 0x60140000, %r31
	.word 0xd23fe080  ! 194: STD_I	std	%r9, [%r31 + 0x0080]
	.word 0x8584f13f  ! 195: WRCCR_I	wr	%r19, 0x113f, %ccr
	.word 0xd297e100  ! 196: LDUHA_I	lduha	[%r31, + 0x0100] %asi, %r9
	.word 0xd33fe0f0  ! 197: STDF_I	std	%f9, [0x00f0, %r31]
	.word 0x8581ff9a  ! 197: WRCCR_I	wr	%r7, 0x1f9a, %ccr
	.word 0xc1bfe0e0  ! 198: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xc36fe120  ! 199: PREFETCH_I	prefetch	[%r31 + 0x0120], #one_read
	.word 0xd2bfe0a0  ! 200: STDA_I	stda	%r9, [%r31 + 0x00a0] %asi
	.word 0xe1bfe140  ! 201: STDFA_I	stda	%f16, [0x0140, %r31]
	.word 0xd2dfc029  ! 201: LDXA_R	ldxa	[%r31, %r9] 0x01, %r9
.text
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
    ta T_CHANGE_NONHPRIV 
	.word 0x91930001  ! 1: WRPR_PIL_R	wrpr	%r12, %r1, %pil
	nop
	mov 0x80, %g3
	stxa %r7, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	.word 0xd65fc000  ! 5: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa9a1c9a9  ! 9: FDIVs	fdivs	%f7, %f9, %f20
	.word 0xc1bfdb60  ! 13: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfc2c0  ! 17: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe22fe043  ! 21: STB_I	stb	%r17, [%r31 + 0x0043]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36b29f3  ! 1: PREFETCH_I	prefetch	[%r12 + 0x09f3], #one_read
intvec_4_7:
	.word 0x9f802a00  ! 25: SIR	sir	0x0a00
	.word 0x22cd0001  ! 1: BRZ	brz,a,pt	%r20,<label_0xd0001>
	.word 0x8d902177  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0177, %pstate
fpinit_4_10:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83f02  ! 33: PREFETCHA_I	prefetcha	[%r0, + 0xffffff02] %asi, #one_read
memptr_4_13:
	set 0x60740000, %r31
	.word 0x8584fec3  ! 37: WRCCR_I	wr	%r19, 0x1ec3, %ccr
	.word 0x91948011  ! 41: WRPR_PIL_R	wrpr	%r18, %r17, %pil
fpinit_4_18:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 45: FDIVs	fdivs	%f0, %f4, %f4
dvapa_4_19:
	nop
	ta T_CHANGE_HPRIV
	mov 0xc8c, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xa570236b  ! 49: POPC_I	popc	0x036b, %r18
brcommon3_4_20:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd7e7c031  ! 1: CASA_I	casa	[%r31] 0x 1, %r17, %r11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd697e030  ! 53: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r11
br_longdelay4_4_22:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902005  ! 57: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	fbg skip_4_23
	stxa %r13, [%r0] ASI_LSU_CONTROL
	.word 0x87a8ca4b  ! 1: FCMPd	fcmpd	%fcc<n>, %f34, %f42
	stxa %r13, [%r0] ASI_LSU_CONTROL
.align 32
skip_4_23:
	.word 0xd63fe0f1  ! 61: STD_I	std	%r11, [%r31 + 0x00f1]
splash_hpstate_4_27:
	.word 0x81982e8c  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8c, %hpstate
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d9025e3  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x05e3, %pstate
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
	set 0x000e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e012  ! 73: CASA_R	casa	[%r31] %asi, %r18, %r8
	.word 0xd137e1a8  ! 77: STQF_I	-	%f8, [0x01a8, %r31]
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
    brnz %r10, sma_4_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_34:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 81: CASA_R	casa	[%r31] %asi, %r16, %r12
memptr_4_36:
	set user_data_start, %r31
	.word 0x858075c7  ! 85: WRCCR_I	wr	%r1, 0x15c7, %ccr
pmu_4_39:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbdffffffa7, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd0ffc02d  ! 93: SWAPA_R	swapa	%r8, [%r31 + %r13] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_43)+24, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_43)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_43:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_4_43:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa982737f  ! 97: WR_SET_SOFTINT_I	wr	%r9, 0x137f, %set_softint
fpinit_4_45:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 101: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x8d802000  ! 105: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe857e0e8  ! 109: LDSH_I	ldsh	[%r31 + 0x00e8], %r20
pmu_4_48:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb9ffffffab, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe737e060  ! 117: STQF_I	-	%f19, [0x0060, %r31]
	.word 0x89800011  ! 121: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa7a40d32  ! 125: FsMULd	fsmuld	%f16, %f18, %f50
	.word 0xa97022fc  ! 129: POPC_I	popc	0x02fc, %r20
splash_lsu_4_56:
	nop
	ta T_CHANGE_HPRIV
	set 0x8dc786dc, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_4_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe7e7c02b  ! 1: CASA_I	casa	[%r31] 0x 1, %r11, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d90255f  ! 137: WRPR_PSTATE_I	wrpr	%r0, 0x055f, %pstate
	.word 0xe937e104  ! 141: STQF_I	-	%f20, [0x0104, %r31]
	.word 0xa1b440f1  ! 145: EDGE16LN	edge16ln	%r17, %r17, %r16
brcommon3_4_64:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe090  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0090]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81982c95  ! 149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c95, %hpstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_65)+0, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_4_65)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x4),1,3,,,,,1)
xir_4_65:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_4_65:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa982af90  ! 153: WR_SET_SOFTINT_I	wr	%r10, 0x0f90, %set_softint
splash_hpstate_4_66:
	.word 0x2ac9c001  ! 1: BRNZ	brnz,a,pt	%r7,<label_0x9c001>
	.word 0x81983555  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1555, %hpstate
pmu_4_67:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbfffffffad, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9ba249c9  ! 1: FDIVd	fdivd	%f40, %f40, %f44
intvec_4_69:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
brcommon2_4_71:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c971  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe040  ! 169: LDDFA_I	ldda	[%r31, 0x0040], %f0
	fbue,a,pn	%fcc0,  skip_4_74
	fbuge skip_4_74
.align 32
skip_4_74:
	.word 0xa7a4c9d0  ! 173: FDIVd	fdivd	%f50, %f16, %f50
	.word 0xd337e146  ! 177: STQF_I	-	%f9, [0x0146, %r31]
splash_lsu_4_78:
	nop
	ta T_CHANGE_HPRIV
	set 0x8c370ae7, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_79:
	nop
	ta T_CHANGE_HPRIV
	set 0x2bf83217, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_4_82:
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 193: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd33fe170  ! 197: STDF_I	std	%f9, [0x0170, %r31]
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
	.word 0x91940014  ! 1: WRPR_PIL_R	wrpr	%r16, %r20, %pil
	nop
	mov 0x80, %g3
	stxa %r6, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 5: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x99a509b2  ! 9: FDIVs	fdivs	%f20, %f18, %f12
	.word 0xc1bfdb60  ! 13: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfda00  ! 17: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe22fe1fc  ! 21: STB_I	stb	%r17, [%r31 + 0x01fc]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa1b504c5  ! 1: FCMPNE32	fcmpne32	%d20, %d36, %r16
intvec_2_7:
	.word 0x91b084d2  ! 25: FCMPNE32	fcmpne32	%d2, %d18, %r8
	.word 0x26c98001  ! 1: BRLZ	brlz,a,pt	%r6,<label_0x98001>
	.word 0x8d9035bf  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x15bf, %pstate
fpinit_2_10:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 33: FCMPd	fcmpd	%fcc<n>, %f0, %f4
memptr_2_13:
	set 0x60340000, %r31
	.word 0x8580b944  ! 37: WRCCR_I	wr	%r2, 0x1944, %ccr
	.word 0x91920012  ! 41: WRPR_PIL_R	wrpr	%r8, %r18, %pil
fpinit_2_18:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8208e  ! 45: PREFETCHA_I	prefetcha	[%r0, + 0x008e] %asi, #one_read
dvapa_2_19:
	nop
	ta T_CHANGE_HPRIV
	mov 0xe53, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x87a94a49  ! 49: FCMPd	fcmpd	%fcc<n>, %f36, %f40
brcommon3_2_20:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd7e7c033  ! 1: CASA_I	casa	[%r31] 0x 1, %r19, %r11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd69fe100  ! 53: LDDA_I	ldda	[%r31, + 0x0100] %asi, %r11
br_longdelay4_2_22:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902005  ! 57: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	brgz,a,pt	%r17, skip_2_23
	stxa %r12, [%r0] ASI_LSU_CONTROL
	.word 0xc36d2e44  ! 1: PREFETCH_I	prefetch	[%r20 + 0x0e44], #one_read
	stxa %r12, [%r0] ASI_LSU_CONTROL
.align 32
skip_2_23:
	.word 0xd63fe1b9  ! 61: STD_I	std	%r11, [%r31 + 0x01b9]
splash_hpstate_2_27:
	.word 0x81982d1a  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1a, %hpstate
	.word 0x2cc98001  ! 1: BRGZ	brgz,a,pt	%r6,<label_0x98001>
	.word 0x8d9037ef  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x17ef, %pstate
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
	set 0x000a1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e014  ! 73: CASA_R	casa	[%r31] %asi, %r20, %r8
	.word 0xd137e163  ! 77: STQF_I	-	%f8, [0x0163, %r31]
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
    brnz %r10, sma_2_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_34:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00b  ! 81: CASA_R	casa	[%r31] %asi, %r11, %r12
memptr_2_36:
	set user_data_start, %r31
	.word 0x85852355  ! 85: WRCCR_I	wr	%r20, 0x0355, %ccr
pmu_2_39:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb2ffffffaa, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd0ffc028  ! 93: SWAPA_R	swapa	%r8, [%r31 + %r8] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_43)+24, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_43)&0xffffffff) + 8, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_43:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_2_43:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa984af22  ! 97: WR_SET_SOFTINT_I	wr	%r18, 0x0f22, %set_softint
fpinit_2_45:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 101: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d802004  ! 105: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe857e188  ! 109: LDSH_I	ldsh	[%r31 + 0x0188], %r20
pmu_2_48:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbfffffffa4, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe737e163  ! 117: STQF_I	-	%f19, [0x0163, %r31]
	.word 0x89800011  ! 121: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x93a44d22  ! 125: FsMULd	fsmuld	%f17, %f2, %f40
	.word 0x91b207d1  ! 129: PDIST	pdistn	%d8, %d48, %d8
splash_lsu_2_56:
	nop
	ta T_CHANGE_HPRIV
	set 0x1a51d933, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_2_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe7e7c034  ! 1: CASA_I	casa	[%r31] 0x 1, %r20, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8198328d  ! 137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x128d, %hpstate
	.word 0xe937e18c  ! 141: STQF_I	-	%f20, [0x018c, %r31]
	.word 0xa3b500f1  ! 145: EDGE16LN	edge16ln	%r20, %r17, %r17
brcommon3_2_64:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe1e0  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x01e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903441  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x1441, %pstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_65)+40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_65)&0xffffffff) + 16, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_65:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_2_65:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa9837e20  ! 153: WR_SET_SOFTINT_I	wr	%r13, 0x1e20, %set_softint
splash_hpstate_2_66:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81983c13  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c13, %hpstate
pmu_2_67:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb5ffffffa5, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc368712b  ! 1: PREFETCH_I	prefetch	[%r1 + 0xfffff12b], #one_read
intvec_2_69:
	.word 0x9f8020a1  ! 165: SIR	sir	0x00a1
brcommon2_2_71:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a0054a  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xe1bfe1c0  ! 169: STDFA_I	stda	%f16, [0x01c0, %r31]
	brz,pn  	%r11, skip_2_74
	bcc  	 skip_2_74
.align 32
skip_2_74:
	.word 0xc36ab1e7  ! 173: PREFETCH_I	prefetch	[%r10 + 0xfffff1e7], #one_read
	.word 0xd337e112  ! 177: STQF_I	-	%f9, [0x0112, %r31]
splash_lsu_2_78:
	nop
	ta T_CHANGE_HPRIV
	set 0x43f948d3, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x22c94001  ! 1: BRZ	brz,a,pt	%r5,<label_0x94001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_79:
	nop
	ta T_CHANGE_HPRIV
	set 0x3a9eb831, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_2_82:
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 193: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd33fe10c  ! 197: STDF_I	std	%f9, [0x010c, %r31]
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
	.word 0x91924010  ! 1: WRPR_PIL_R	wrpr	%r9, %r16, %pil
	nop
	mov 0x80, %g3
	stxa %r7, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x5f
	.word 0xd65fc000  ! 5: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x91a509b2  ! 9: FDIVs	fdivs	%f20, %f18, %f8
	.word 0xc1bfc2c0  ! 13: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfc2c0  ! 17: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe22fe005  ! 21: STB_I	stb	%r17, [%r31 + 0x0005]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x93a309c1  ! 1: FDIVd	fdivd	%f12, %f32, %f40
intvec_1_7:
	.word 0x9f802c33  ! 25: SIR	sir	0x0c33
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d903f87  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x1f87, %pstate
fpinit_1_10:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 33: FCMPd	fcmpd	%fcc<n>, %f0, %f4
memptr_1_13:
	set 0x60140000, %r31
	.word 0x8581efb6  ! 37: WRCCR_I	wr	%r7, 0x0fb6, %ccr
	.word 0x91908012  ! 41: WRPR_PIL_R	wrpr	%r2, %r18, %pil
fpinit_1_18:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 45: FDIVs	fdivs	%f0, %f4, %f8
dvapa_1_19:
	nop
	ta T_CHANGE_HPRIV
	mov 0xd4a, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0x97703ec9  ! 49: POPC_I	popc	0x1ec9, %r11
brcommon3_1_20:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd7e7c029  ! 1: CASA_I	casa	[%r31] 0x 1, %r9, %r11
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xd69fe140  ! 53: LDDA_I	ldda	[%r31, + 0x0140] %asi, %r11
br_longdelay4_1_22:
	nop
	not %g0, %r27
	jmpl %r27+0, %r27
	.word 0x9d902005  ! 57: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	fbg skip_1_23
	stxa %r10, [%r0] ASI_LSU_CONTROL
	.word 0x91a0c9c2  ! 1: FDIVd	fdivd	%f34, %f2, %f8
	stxa %r6, [%r0] ASI_LSU_CONTROL
.align 32
skip_1_23:
	.word 0xc32fc000  ! 61: STXFSR_R	st-sfr	%f1, [%r0, %r31]
splash_hpstate_1_27:
	.word 0x81983fc7  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fc7, %hpstate
	.word 0x24cd0001  ! 1: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0x8d903651  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x1651, %pstate
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
	set 0x00061fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_30:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00c  ! 73: CASA_R	casa	[%r31] %asi, %r12, %r8
	.word 0xd137e0a8  ! 77: STQF_I	-	%f8, [0x00a8, %r31]
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
    brnz %r10, sma_1_34
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_34:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 81: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_1_36:
	set user_data_start, %r31
	.word 0x8582a45f  ! 85: WRCCR_I	wr	%r10, 0x045f, %ccr
pmu_1_39:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbbffffffa5, %g1, %g7
	.word 0xa3800007  ! 89: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd0ffc030  ! 93: SWAPA_R	swapa	%r8, [%r31 + %r16] 0x01
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_43)+40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_43)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_43:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_1_43:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa98175a9  ! 97: WR_SET_SOFTINT_I	wr	%r5, 0x15a9, %set_softint
fpinit_1_45:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 101: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8d802004  ! 105: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xe857e0b8  ! 109: LDSH_I	ldsh	[%r31 + 0x00b8], %r20
pmu_1_48:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffbcffffffab, %g1, %g7
	.word 0xa3800007  ! 113: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe737e150  ! 117: STQF_I	-	%f19, [0x0150, %r31]
	.word 0x89800011  ! 121: WRTICK_R	wr	%r0, %r17, %tick
	.word 0x91a50d29  ! 125: FsMULd	fsmuld	%f20, %f40, %f8
iaw_1_54:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter4, %r23
#ifndef SPC
    ldxa [%g0]0x63, %r8
    and %r8, 0x38, %r8              ! Core ID
    add %r8, %r23, %r23
#else
    mov 0, %r8
#endif
    mov 0x1, %r16
iaw_startwait1_54:
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_iaw_1_54
    mov (~0x1&0xf), %r16
    ld [%r23], %r16
iaw_wait1_54:
    brnz %r16, iaw_wait1_54
    ld [%r23], %r16
    ba iaw_startwait1_54
    mov 0x1, %r16
continue_iaw_1_54:
    sllx %r16, %r8,  %r16       !Mask for my core only
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_54:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r17
    bne,a %xcc, wait_for_stat_1_54
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi       !Park (W1C)
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_iaw_1_54:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a %xcc, wait_for_iaw_1_54
    ldxa [0x50]%asi, %r14       !Running_rw
iaw_doit1_54:
	mov 0x38, %r18
iaw4_1_54:
	setx common_target, %r20, %r19
	or %r19, 0x1, %r19
	stxa %r19, [%r18]0x50
    stxa  %r16, [0x60] %asi     ! Unpark (W1S)
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xa7b50494  ! 129: FCMPLE32	fcmple32	%d20, %d20, %r19
splash_lsu_1_56:
	nop
	ta T_CHANGE_HPRIV
	set 0x4732dfa0, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
brcommon3_1_58:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe7e7c02b  ! 1: CASA_I	casa	[%r31] 0x 1, %r11, %r19
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8198375d  ! 137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x175d, %hpstate
	.word 0xe937e168  ! 141: STQF_I	-	%f20, [0x0168, %r31]
	.word 0x99b480f1  ! 145: EDGE16LN	edge16ln	%r18, %r17, %r12
brcommon3_1_64:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd26fe030  ! 1: LDSTUB_I	ldstub	%r9, [%r31 + 0x0030]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903fc7  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x1fc7, %pstate
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_65)+0, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_65)&0xffffffff) + 32, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_65:
#else
#if (defined FC)
!! Generate XIR via RESET_GEN register
!!	ta T_CHANGE_HPRIV
!!	rdpr %pstate, %r18
!!	andn %r18, 0x208, %r18 ! Reset pstate.am,cle
!!	wrpr %r18, %pstate
#ifndef XIR_RND_CORES
!!	ldxa [%g0] 0x63, %o1
!!	mov 1, %r18
!!	sllx %r18, %o1, %r18
#endif
!!	mov 0x30, %r19
!!	setx 0x8900000808, %r16, %r17
!!	mov 0x2, %r16
!!xir_1_65:
!!	stxa %r18, [%r19] 0x41
!!	stx %r16, [%r17]
#endif
#endif
	.word 0xa98176d8  ! 153: WR_SET_SOFTINT_I	wr	%r5, 0x16d8, %set_softint
splash_hpstate_1_66:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x81983d05  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1d05, %hpstate
pmu_1_67:
	nop
	ta T_CHANGE_PRIV
	setx 0xffffffb1ffffffab, %g1, %g7
	.word 0xa3800007  ! 161: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xc36d34f5  ! 1: PREFETCH_I	prefetch	[%r20 + 0xfffff4f5], #one_read
intvec_1_69:
	.word 0x91a489d4  ! 165: FDIVd	fdivd	%f18, %f20, %f8
brcommon2_1_71:
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0xa1a7c96d  ! 1: FMULq	dis not found

    ba,a .+8
    jmpl %r27+0, %r27
	.word 0xc19fe1a0  ! 169: LDDFA_I	ldda	[%r31, 0x01a0], %f0
	bne,a	 skip_1_74
	fbue,a,pn	%fcc0,  skip_1_74
.align 32
skip_1_74:
	.word 0x24cc8001  ! 173: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xd337e1a2  ! 177: STQF_I	-	%f9, [0x01a2, %r31]
splash_lsu_1_78:
	nop
	ta T_CHANGE_HPRIV
	set 0x43decb13, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_79:
	nop
	ta T_CHANGE_HPRIV
	set 0xcce89410, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 185: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
jmptr_1_82:
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 189: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x89800011  ! 193: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd33fe11c  ! 197: STDF_I	std	%f9, [0x011c, %r31]
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

	.xword	0xee5fb12eadb27577
	.xword	0xa644ecb0149b50ac
	.xword	0x1edc3e065d307083
	.xword	0x5c8b9251a1b8bd17
	.xword	0x21b37cc9d9532d14
	.xword	0x70ac77ff3366c7c7
	.xword	0xdcecebf360f0dae8
	.xword	0x322cb53de3ad4d09
	.xword	0xb9565b1a36694a68
	.xword	0xe390efde9d20cc7e
	.xword	0x87c2cd431aebd7f8
	.xword	0xfc2bb80b29ecb3dd
	.xword	0xc0b6002d2e30dd08
	.xword	0x5d87b9a10c8568b9
	.xword	0x1d3b3898ad23619e
	.xword	0xc3f80615b7fcabb4
	.xword	0x612a94faeeeb00bf
	.xword	0x6365361a8682a1a0
	.xword	0x2bc88ca1c633b0f2
	.xword	0x3a39b5a4c8ad6349
	.xword	0x849dab0d617c5db8
	.xword	0x0e4b61e5a209f0d7
	.xword	0x275778e89b028abc
	.xword	0x16a3b2f0dc82d835
	.xword	0xd39e194f3f62bb32
	.xword	0xd0c14471c68fb1a9
	.xword	0xd5c762ffd42bc98a
	.xword	0x9302d68a3340d9d8
	.xword	0x5ae5a223c78a867e
	.xword	0x7a75989d7b4761d1
	.xword	0x67d60bf43b6e1f8e
	.xword	0xcc1cbb050d71ba01
	.xword	0x265b319b9424c7ff
	.xword	0x4c8d099799e16446
	.xword	0xaa704ce40edf7ec8
	.xword	0x90b6b66ed6987697
	.xword	0x6102e2ceccffb160
	.xword	0x4a5e70c9ed3f28fd
	.xword	0xebb7334070d65306
	.xword	0x2c4e636270daa770
	.xword	0x2669d902073b2d27
	.xword	0x359de2cba0b9eae4
	.xword	0xbff774a0277519b6
	.xword	0x8d8e57d9384e834f
	.xword	0x94bca09fa8109ef8
	.xword	0xf2d38e97731430a2
	.xword	0xd733120ca5a98e5e
	.xword	0x9edd9f15fa4f4e32
	.xword	0xdb2ba8278c8f3e7d
	.xword	0xcbc6a8d3fb5f322e
	.xword	0xb67928cec2bffb49
	.xword	0xe9e20f0a26b32bad
	.xword	0x7d2841bb79505a84
	.xword	0x8562463e2288d1ae
	.xword	0xf0ff5c64702f12f9
	.xword	0x5563124bd23c1abc
	.xword	0x8215e1819a15b741
	.xword	0x23df42298a508d80
	.xword	0x6d827d51c0521012
	.xword	0x2a345fd587278141
	.xword	0xc1e3d7a27d733f66
	.xword	0xa7722fcd142eb1c0
	.xword	0xf7d18390e0059c86
	.xword	0x9ee4f5161143ce53
	.xword	0xf7eb7f828ba536e3
	.xword	0x1830317c7eb2d6fa
	.xword	0x989a30ff781d01e9
	.xword	0x57633429ac93f3f9
	.xword	0x1573d996dc06925d
	.xword	0xf6f7577444473312
	.xword	0x4c6dfcfbf0f0c0f4
	.xword	0x7aa96b4a822d995f
	.xword	0x66d77c0c38eabdfa
	.xword	0x2db2589367bb5342
	.xword	0x56d55c57fce51825
	.xword	0xd21ea2c7b5a988de
	.xword	0x16f648e692dabcf0
	.xword	0x3b8cf255678afa4c
	.xword	0x3230c6533b927902
	.xword	0xda044e55c9aadb21
	.xword	0xc331d50e0e01ad0a
	.xword	0x2e7e4a1c31d872e9
	.xword	0xea3e710aacdf51c2
	.xword	0xf8531113a8a4cc48
	.xword	0x1d9ea839c5b8fc76
	.xword	0x495179b2d28f8e67
	.xword	0xdb6d23915138542e
	.xword	0xb3b5fad598af793c
	.xword	0x506100c5c6dee448
	.xword	0x0c58a4e45629aab9
	.xword	0xc5101dc1a0ca8acc
	.xword	0x3593a209d360ed26
	.xword	0x527f361880a177fa
	.xword	0x3bc1058abc9b456b
	.xword	0x6242d3dadc8f6d94
	.xword	0xbb27766c693eb739
	.xword	0x2708c1b2dbc6a1d5
	.xword	0xb5bb959c7ceefb60
	.xword	0xfb6e46fc954a3531
	.xword	0x3e7a8e1be2f2685b
	.xword	0x39c5901996da9e0e
	.xword	0x489f3c981badb88a
	.xword	0xfc0d9e6dac0ad0bd
	.xword	0x6aa26319bd4c2b4a
	.xword	0xd777a413a430666d
	.xword	0x6f382902fae5ff04
	.xword	0x0327ff3451efeeaa
	.xword	0x2e219e83b2fdc0b3
	.xword	0xac27b347508cab68
	.xword	0x16edcc05bc45ced6
	.xword	0xe8da1204b469d2d8
	.xword	0xd737f5037e71951b
	.xword	0x7d12c5a38e99d2e1
	.xword	0xa0eea92a70c567fb
	.xword	0xa910706b7e511767
	.xword	0x449dd172ce0b4815
	.xword	0xbf40a52a3f9d095e
	.xword	0x8b56b6bb8a8d220f
	.xword	0x2c756adef16942fb
	.xword	0x34c3c634e20a6ba8
	.xword	0x0ae4f05ef60509e4
	.xword	0xdc2bb93e56dff3d6
	.xword	0xeece674c55fd3401
	.xword	0xf06017c5f3adf638
	.xword	0x35f33e4391437f7a
	.xword	0x56f41feac9464cd1
	.xword	0xb3f205b334e899cb
	.xword	0xc991dc11bac5b10b
	.xword	0xf4f0213abf7096a5
	.xword	0x2ce77968acac1391
	.xword	0x6fef680cf1845ffa
	.xword	0xf346d8ccef9d2425
	.xword	0x1372905b847863e2
	.xword	0x5fad8c070b1b10f0
	.xword	0xbcc355cbccea794b
	.xword	0x76d265aa42e7e367
	.xword	0x36c5d9a6ad6198b9
	.xword	0x9496bd90eb82566a
	.xword	0xe06730d999baece3
	.xword	0x470317cd015ce0a0
	.xword	0xde87b12d29361264
	.xword	0x2aa54b77fffb5d94
	.xword	0xdc9cffd195c9641c
	.xword	0x9c919684cb4ac7f0
	.xword	0x0758d5429230bf42
	.xword	0xedf9f30858ab0c7f
	.xword	0x11f9463d4647d42e
	.xword	0x77931bf6860ab05e
	.xword	0x17ac2051ae845ef8
	.xword	0x8ec88dffdbd1500a
	.xword	0x68e88cf231ffb207
	.xword	0x7f85fc8db90ed432
	.xword	0x9e52ad44029cf7df
	.xword	0x9914d88ade338345
	.xword	0x3decefd2870646dd
	.xword	0xdea5c803d79559b1
	.xword	0xcab4a40342f15a3a
	.xword	0x9019da3505944632
	.xword	0xc1b57e32dbd1e59e
	.xword	0xd18a72c639641499
	.xword	0x587c9ee7436f460d
	.xword	0x4b9a7c305c5f9681
	.xword	0x55f16f806544c705
	.xword	0xd4e42223747337e8
	.xword	0x28e1a7f0f86a19c0
	.xword	0x454215942dd8ed5a
	.xword	0xf13a1f4d4eab404e
	.xword	0xd88a206de09da6e1
	.xword	0x11b6155ef579b811
	.xword	0x84b0a65b1c4f4da9
	.xword	0x5b3c5a7f625dc5ec
	.xword	0x14564a56932b3fcd
	.xword	0x3e37bcae61d0df57
	.xword	0x3c8c121f7c38b67d
	.xword	0xa4669242a3a2c787
	.xword	0x2f021d09df336a6a
	.xword	0x0bbae949d8a7be14
	.xword	0xe3d20c7982e26ff0
	.xword	0x69a39c7c6ac36464
	.xword	0xd57f61f844032087
	.xword	0xfecdfdf4b832f810
	.xword	0x659f96236622758f
	.xword	0xc631cf69329fce85
	.xword	0x90b65d9059f863eb
	.xword	0xd13b4825743e8c61
	.xword	0xb62fcf2008e6fcc6
	.xword	0x85bbb70432e7f3f7
	.xword	0xdf03d4489d554fed
	.xword	0xddc5160f135a26f6
	.xword	0xb3040cca57f35d07
	.xword	0x3f62d646c47a2a0b
	.xword	0xc4511abb801de421
	.xword	0x8816d23be4637d2d
	.xword	0xb0bc6536d68e8f71
	.xword	0x63adb91c4a225fee
	.xword	0x37b5bc1d2c2e0b6a
	.xword	0x58d966297f09c943
	.xword	0x6ddc05b1f32f2240
	.xword	0xc19e53afcc7eb495
	.xword	0x24ba7410f69d3bbc
	.xword	0x631f7d28abf18897
	.xword	0xe914433e45d7b395
	.xword	0xdc871b7797fab402
	.xword	0xbcdabb41f57265d7
	.xword	0x7ae0c9e03beceb19
	.xword	0x2662beb64ca0fa5b
	.xword	0x9ff5da8a0399543c
	.xword	0x074f7121739852be
	.xword	0x2fcd309ebeb37088
	.xword	0xda293bb0e65b86ab
	.xword	0xc7031996479715c3
	.xword	0x0198100d05d53731
	.xword	0x7e4271d1bbcd35e0
	.xword	0x51c658f45eb11649
	.xword	0x77cf831475fedcce
	.xword	0xe975cd9251ce3068
	.xword	0x4c66d4497e619456
	.xword	0xf68bb29a87a2cf31
	.xword	0x4ad33eb2947cb041
	.xword	0x8f7036e4058618df
	.xword	0xf9be3aaae52d6e7c
	.xword	0x35c7c6e8d26f8b08
	.xword	0x5f39429a8be44e95
	.xword	0xc784d3d8d146c7a8
	.xword	0x9af57a6f581c7da3
	.xword	0x9c3801f0eda7fc12
	.xword	0xff031c870bbb99f9
	.xword	0xe20832c2a1e977e7
	.xword	0xb5cc74711ed8583c
	.xword	0x901849a530869c90
	.xword	0x70bfe54451579ada
	.xword	0x06737f024c9cf7cd
	.xword	0x9c900f57cfd3e65a
	.xword	0x603b9fdc1757c901
	.xword	0xbc46223bb095e19c
	.xword	0xf96bdb5751667dc1
	.xword	0xe5a08439687f359e
	.xword	0x8b665ccfb4e8bf3d
	.xword	0x83668367b1a2fbf8
	.xword	0x3c63594bb8e4da52
	.xword	0xc9a28c00cc41f9cc
	.xword	0x5aea89402eb6e426
	.xword	0xd6947077a15f500c
	.xword	0xc74a3785111c3b78
	.xword	0x8ffb525e5d36d8f1
	.xword	0x61b362c66ed0794a
	.xword	0xc46f72700d2f25e7
	.xword	0xdaad218f87fc93fc
	.xword	0x08709e4242012b44
	.xword	0xddbb9ab1dc7d5073
	.xword	0x6c4844888ab18e8f
	.xword	0x3ebb41a6d5f7e817
	.xword	0x612d22410269dac1
	.xword	0x3d336ff7eac271eb
	.xword	0x563af5c03881ad35
	.xword	0xdc0363de141d0220

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
# 1133 "diag.j.pp"

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
	TTE_CP	 = 1,
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
	TTE_Size	 = 5,
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
	.xword	0xab25f2b39b15f5f4
	.xword	0x970623f10d97500e
	.xword	0x140641b6f5d47adc
	.xword	0xba157de4da6e3421
	.xword	0xdbd6787e1597d552
	.xword	0xa9f4700cdeaf2ae1
	.xword	0x420dcf5c521905b7
	.xword	0x2581e84bcb2a8b38
	.xword	0xb9812381055bfd05
	.xword	0xc859c26121830bf2
	.xword	0x6369863f46c12c7d
	.xword	0x5ff20715d1a05298
	.xword	0x789b42228a97b2dc
	.xword	0xcd1ec9aee70fe6a1
	.xword	0xcf03423d65360217
	.xword	0x12dc2ecbdbf1f045
	.xword	0x675fbc12804bfb44
	.xword	0xba243da81bf6770a
	.xword	0xc7173b14dcd14429
	.xword	0xc67bc0ffeee8bec9
	.xword	0x8701edc2d48e64d5
	.xword	0xbfd64ad060830ca2
	.xword	0xfd79684361f5d5ff
	.xword	0xadce0fb8ad69aef4
	.xword	0x6e3d1908cf238747
	.xword	0x86c05393c1d3e924
	.xword	0x8020b314bf7a8531
	.xword	0x97e217d9b660b289
	.xword	0xa09fc4f1da60b8fa
	.xword	0x1c223c62b1f0e40c
	.xword	0x33266d421acedd47
	.xword	0x682ba02829bd80a9



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
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
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
	.xword	0x121c788c5aeb6d0e
	.xword	0xd00d38c9f53e57e5
	.xword	0xd8543686e24a12a4
	.xword	0x782629c61304b2de
	.xword	0x4ab7732999e248a2
	.xword	0xe1617b4548203bce
	.xword	0x9b94c820a4e1776e
	.xword	0x8d0ea2acec361010
	.xword	0xb80da65292c7b0e9
	.xword	0x0a15d4d9c78e0448
	.xword	0xc12a8e34531d4d1c
	.xword	0x1b8b06f2f3fb0de4
	.xword	0x56b7249611c9f808
	.xword	0x58b33d88e2cec630
	.xword	0x30d024db9ca7d953
	.xword	0x9bdc6923a7478a0f
	.xword	0x816d502aa271d80d
	.xword	0x4318fa16daaa5948
	.xword	0x0fc33d485569b447
	.xword	0x2aa109c5e173703f
	.xword	0x4175f5e46fa8489a
	.xword	0x3b5295353b6c3d6e
	.xword	0xb0be0e5cf51c96ff
	.xword	0x2f67f0654229978c
	.xword	0xd08ca7b50f87efe5
	.xword	0xdb4f4c016fbedfc3
	.xword	0xfb6980cf9ade6bcd
	.xword	0xb199b327e37ddd39
	.xword	0x4beba6223a2dbbc8
	.xword	0x77950696847b1908
	.xword	0x2937117eeebce1cf
	.xword	0xd72a89b50ab2542d



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
	TTE_Size	 = 5,
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
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
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
	.xword	0x06edaddb742ae499
	.xword	0x85f730841d1e3cff
	.xword	0xf2d21e817232a90b
	.xword	0x4d95597d8aa85b07
	.xword	0xb48cabb9f8e45c09
	.xword	0x46bf7219e5bdb18f
	.xword	0xa76a1b7edcae2949
	.xword	0x95d2d8af411acd4f
	.xword	0xc88efe6af12ea6c1
	.xword	0x1bef9f2a482ece6b
	.xword	0x0175dd5d366fd089
	.xword	0x1a9433388dcf4352
	.xword	0x89748af723eb2639
	.xword	0xdca8227d7b117cb4
	.xword	0xf618b10426e5e776
	.xword	0xfccce1319168a2a9
	.xword	0x5f96a3c88d37532d
	.xword	0x67b5ba733d3166eb
	.xword	0x7c142821bb8added
	.xword	0xaa330b6dc229792d
	.xword	0xb708caf3c0a2a7a3
	.xword	0x7c34d690c3d61405
	.xword	0x35b00427f2acd421
	.xword	0xace746ed00f811ad
	.xword	0x4d57d906fa5e3e25
	.xword	0xd806ac7c18b190b3
	.xword	0x68ac14951ef787f2
	.xword	0x2540cd86fc8e9472
	.xword	0xba51bda777f30259
	.xword	0x394a1d26464976ab
	.xword	0xc664edf81c315a08
	.xword	0xf52ad4387ba87edc



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
	TTE_Size	 = 5,
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
	.xword	0x14ecdad3691f2718
	.xword	0x5bda7dc5689a4b1c
	.xword	0xf48c771c01dc6c16
	.xword	0xaf6ab3886714e60b
	.xword	0x538f002490aab009
	.xword	0x507cd1ea434c95cd
	.xword	0xd5291ac78cc7fe47
	.xword	0x7b19563ab17d55b0
	.xword	0xd82febb605bd4083
	.xword	0x2f767e8fd382e786
	.xword	0x463e08ed590bf5b0
	.xword	0x0470c64221589352
	.xword	0x40478f18fccbf854
	.xword	0x9ae43b6b27b78f04
	.xword	0x34275aa5de107cbb
	.xword	0xf981c829ce0ac52b
	.xword	0x782d0b2f1985f8e7
	.xword	0x4f259aee579b067c
	.xword	0x42f6b1e4c5d963dc
	.xword	0xbfaf553628fb727b
	.xword	0x2fdd9568a797ab43
	.xword	0xb478553fa8342320
	.xword	0x1dde4ffb5c33f41e
	.xword	0x4d2df1ebb7b2e9fc
	.xword	0x7b565c9256314281
	.xword	0xacc87a380b676c7a
	.xword	0xcb9c3778f7b86fb1
	.xword	0xaf3ae1ddbc66524c
	.xword	0xe03d185275a780a7
	.xword	0x1cb97bbf0d0d43a8
	.xword	0x31ebfc8327f9decf
	.xword	0xb20a22f709ded152





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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
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
	TTE_E	 = 1,
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
	TTE_Size	 = 5,
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
nuff_said_2:
	fdivd %f0, %f4, %f4
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
	fdivs %f0, %f4, %f8
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
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
