/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand5fc_8506227.s
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
#define MAIN_PAGE_VA_RS_RA_ALSO
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
#define T_HANDLER_RAND4_5 ldda	[%r31]ASI_NUCLEUS_QUAD_LDD, %f16;\
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
#define T_HANDLER_RAND4_6 ldda [%r31]ASI_BLOCK_AS_IF_USER_PRIMARY, %f32;\
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
#define HT_HANDLER_RAND4_4 ldda [%i7]ASI_BLOCK_PRIMARY_LITTLE, %f0;\
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
#define HT_HANDLER_RAND4_5 ldda	[%r31]ASI_NUCLEUS_QUAD_LDD, %f48;\
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
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    HT_HANDLER_RAND7_3;\
    done;
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    HT_HANDLER_RAND7_6;\
    done;
#define H_HT0_Reserved_0x3b
#define SUN_H_HT0_Reserved_0x3b \
    mov 0x80, %l3;\
    stxa %l3, [%l3]0x5f ;\
    stxa %l3, [%l3]0x57 ;\
    done;
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
!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g5 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g4 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    INT_HANDLER_RAND4_1 ;\
    retry;

!!!!! Queue interrupt handler
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
!!!!! Hstick-match trap handler
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
!!!!! SW interuupt handlers
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

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
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

#define H_T1_Reserved_0x00
#define SUN_H_T1_Reserved_0x00 \
    nop;\
    jmpl %r27+8, %r0;\
    nop;

#undef FAST_BOOT
#include "hboot.s"

#ifndef MULTIPASS
#define MULTIPASS 0
#endif
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
    wrhpr %g0, 0x0, %hpstate  ! ta T_CHANGE_NONHPRIV
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
	mov 0x35, %r14
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
	mov 0x32, %r14
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

#if  (MULTIPASS > 0)
    mov 0x38, %g1
    stxa %r0, [%g1]ASI_SCRATCHPAD
#endif

    ! Set up fpr PMU traps 
    set 0x18d89bbe, %g2
    b fork_threads
    wr %g2, %g0, %pcr
.align 128
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
	.word 0xd03fe1c8  ! 1: STD_I	std	%r8, [%r31 + 0x01c8]
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
	.word 0x20800001  ! 2: BN	bn,a	<label_0x1>
	.word 0xd1e7c543  ! 3: CASA_I	casa	[%r31] 0x2a, %r3, %r8
	.word 0xd13fe050  ! 4: STDF_I	std	%f8, [0x0050, %r31]
	.word 0x20800001  ! 5: BN	bn,a	<label_0x1>
	.word 0x9f802020  ! 5: SIR	sir	0x0020
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_2) + 56, 16, 16)) -> intp(1,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_2)&0xffffffff) + 8, 16, 16)) -> intp(5,0,0,,,,,1)
#else
	set 0x8a704c75, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802e12  ! 1: SIR	sir	0x0e12
intvec_80_2:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f802775  ! 1: SIR	sir	0x0775
intvec_80_3:
	.word 0x93a489c8  ! 6: FDIVd	fdivd	%f18, %f8, %f40
	.word 0x20800001  ! 7: BN	bn,a	<label_0x1>
	.word 0x9f802d82  ! 8: SIR	sir	0x0d82
	.word 0x19400001  ! 9: FBPUGE	fbuge
	.word 0xe19fd920  ! 9: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_80_5:
	set 0x60540000, %r31
	.word 0xd297c2c0  ! 10: LDUHA_R	lduha	[%r31, %r0] 0x16, %r9
	.word 0x8584e257  ! 11: WRCCR_I	wr	%r19, 0x0257, %ccr
	.word 0xe1bfde00  ! 12: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd29fc401  ! 13: LDDA_R	ldda	[%r31, %r1] 0x20, %r9
	.word 0x00800001  ! 13: BN	bn  	<label_0x1>
memptr_80_6:
	set user_data_start, %r31
	.word 0xc1bfc2c0  ! 14: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8584fbff  ! 15: WRCCR_I	wr	%r19, 0x1bff, %ccr
	.word 0xe19fc2c0  ! 16: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fc3e0  ! 17: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc19fdc00  ! 17: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_80_8:
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
	.word 0x95a489ca  ! 1: FDIVd	fdivd	%f18, %f10, %f10
intvec_80_9:
	.word 0xe697d920  ! 18: LDUHA_R	lduha	[%r31, %r0] 0xc9, %r19
	.word 0x8580772c  ! 19: WRCCR_I	wr	%r1, 0x172c, %ccr
	.word 0x91b404c7  ! 20: FCMPNE32	fcmpne32	%d16, %d38, %r8
	.word 0xd1e7d042  ! 21: CASA_I	casa	[%r31] 0x82, %r2, %r8
	.word 0x85852cae  ! 21: WRCCR_I	wr	%r20, 0x0cae, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_11:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_12) + 0, 16, 16)) -> intp(2,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_12)&0xffffffff) + 32, 16, 16)) -> intp(3,0,23,,,,,1)
#else
	set 0x71b0c29d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_12:
	.word 0x9f803649  ! 22: SIR	sir	0x1649
	.word 0xc1bfdc00  ! 23: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa1a449c4  ! 24: FDIVd	fdivd	%f48, %f4, %f16
	.word 0xa9a309d1  ! 25: FDIVd	fdivd	%f12, %f48, %f20
	.word 0xe19fd960  ! 25: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_80_14:
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
intvec_80_15:
	.word 0xe69fc603  ! 26: LDDA_R	ldda	[%r31, %r3] 0x30, %r19
	.word 0x858422b1  ! 27: WRCCR_I	wr	%r16, 0x02b1, %ccr
	.word 0xa3a409d2  ! 28: FDIVd	fdivd	%f16, %f18, %f48
	.word 0x9f802170  ! 29: SIR	sir	0x0170
	.word 0x8583274a  ! 29: WRCCR_I	wr	%r12, 0x074a, %ccr
	.word 0xc19fc3e0  ! 30: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfda00  ! 31: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x20800001  ! 32: BN	bn,a	<label_0x1>
	.word 0xe1bfc3e0  ! 33: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe1bfdf20  ! 33: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc3efe080  ! 34: PREFETCHA_I	prefetcha	[%r31, + 0x0080] %asi, #one_read
	.word 0xe7e7c282  ! 35: CASA_I	casa	[%r31] 0x14, %r2, %r19
	.word 0x20800001  ! 36: BN	bn,a	<label_0x1>
	.word 0xc3efe0a0  ! 37: PREFETCHA_I	prefetcha	[%r31, + 0x00a0] %asi, #one_read
	.word 0xc19fc3e0  ! 37: LDDFA_R	ldda	[%r31, %r0], %f0
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_19:
memptr_80_20:
	set 0x60540000, %r31
	.word 0xa7a089d4  ! 38: FDIVd	fdivd	%f2, %f20, %f50
	.word 0x858473cc  ! 39: WRCCR_I	wr	%r17, 0x13cc, %ccr
	.word 0xe33fe140  ! 40: STDF_I	std	%f17, [0x0140, %r31]
	.word 0x9f8034f5  ! 41: SIR	sir	0x14f5
	.word 0x85847feb  ! 41: WRCCR_I	wr	%r17, 0x1feb, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_22) + 0, 16, 16)) -> intp(1,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_22)&0xffffffff) + 40, 16, 16)) -> intp(0,0,22,,,,,1)
#else
	set 0xa70f15e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_22:
	.word 0xe1bfd920  ! 42: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x87afca40  ! 43: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd920  ! 45: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa3b304d0  ! 45: FCMPNE32	fcmpne32	%d12, %d16, %r17
	.word 0xe1bfc2c0  ! 46: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fde00  ! 47: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f802110  ! 48: SIR	sir	0x0110
	.word 0xc19fdc00  ! 49: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe897c403  ! 49: LDUHA_R	lduha	[%r31, %r3] 0x20, %r20
	.word 0xe897c2e0  ! 50: LDUHA_R	lduha	[%r31, %r0] 0x17, %r20
	.word 0xc19fd920  ! 51: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f8021f0  ! 52: SIR	sir	0x01f0
	.word 0xe897c722  ! 53: LDUHA_R	lduha	[%r31, %r2] 0x39, %r20
	.word 0x20800001  ! 53: BN	bn,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_26) + 16, 16, 16)) -> intp(1,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_26)&0xffffffff) + 40, 16, 16)) -> intp(5,0,16,,,,,1)
#else
	set 0x97e07ccf, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa1b504c7  ! 1: FCMPNE32	fcmpne32	%d20, %d38, %r16
intvec_80_26:
	.word 0xc3efe0f0  ! 54: PREFETCHA_I	prefetcha	[%r31, + 0x00f0] %asi, #one_read
	.word 0x87afca41  ! 55: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd497d103  ! 57: LDUHA_R	lduha	[%r31, %r3] 0x88, %r10
	.word 0xa9a149c5  ! 57: FDIVd	fdivd	%f36, %f36, %f20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_28) + 40, 16, 16)) -> intp(1,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_28)&0xffffffff) + 0, 16, 16)) -> intp(0,0,10,,,,,1)
#else
	set 0x1c60a613, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_28:
memptr_80_29:
	set 0x60740000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_30) + 24, 16, 16)) -> intp(7,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_30)&0xffffffff) + 0, 16, 16)) -> intp(6,0,22,,,,,1)
#else
	set 0xda9059c3, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93a409c4  ! 1: FDIVd	fdivd	%f16, %f4, %f40
intvec_80_30:
	.word 0x9ba4c9d2  ! 58: FDIVd	fdivd	%f50, %f18, %f44
	.word 0x858524f9  ! 59: WRCCR_I	wr	%r20, 0x04f9, %ccr
	.word 0x9f8038bb  ! 60: SIR	sir	0x18bb
	.word 0x39400001  ! 61: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x85836139  ! 61: WRCCR_I	wr	%r13, 0x0139, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x91a409d3  ! 1: FDIVd	fdivd	%f16, %f50, %f8
intvec_80_31:
	.word 0xa5a509d1  ! 62: FDIVd	fdivd	%f20, %f48, %f18
	.word 0xa5b7c4c0  ! 63: FCMPNE32	fcmpne32	%d62, %d0, %r18
	.word 0x20800001  ! 64: BN	bn,a	<label_0x1>
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe9e7e001  ! 65: CASA_R	casa	[%r31] %asi, %r1, %r20
memptr_80_33:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_34) + 40, 16, 16)) -> intp(5,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_34)&0xffffffff) + 48, 16, 16)) -> intp(5,0,22,,,,,1)
#else
	set 0xebf05f6c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_34:
	.word 0xe81fe110  ! 66: LDD_I	ldd	[%r31 + 0x0110], %r20
	.word 0x8584326a  ! 67: WRCCR_I	wr	%r16, 0x126a, %ccr
	.word 0x9f803d8d  ! 68: SIR	sir	0x1d8d
	.word 0xe89fc542  ! 69: LDDA_R	ldda	[%r31, %r2] 0x2a, %r20
	.word 0x9f803120  ! 69: SIR	sir	0x1120
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_36) + 40, 16, 16)) -> intp(0,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_36)&0xffffffff) + 48, 16, 16)) -> intp(2,0,21,,,,,1)
#else
	set 0xf1904b68, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_36:
	.word 0x9f8021cd  ! 70: SIR	sir	0x01cd
	.word 0xc36fe0e0  ! 71: PREFETCH_I	prefetch	[%r31 + 0x00e0], #one_read
	.word 0xd89fc6c2  ! 72: LDDA_R	ldda	[%r31, %r2] 0x36, %r12
	.word 0x95a2c9cc  ! 73: FDIVd	fdivd	%f42, %f12, %f10
	.word 0x39400001  ! 73: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc3efe090  ! 74: PREFETCHA_I	prefetcha	[%r31, + 0x0090] %asi, #one_read
	.word 0xc36fe010  ! 75: PREFETCH_I	prefetch	[%r31 + 0x0010], #one_read
	.word 0x20800001  ! 76: BN	bn,a	<label_0x1>
	.word 0xe89fd061  ! 77: LDDA_R	ldda	[%r31, %r1] 0x83, %r20
	.word 0x20800001  ! 77: BN	bn,a	<label_0x1>
	.word 0xe81fe0a0  ! 78: LDD_I	ldd	[%r31 + 0x00a0], %r20
	.word 0x24cfc001  ! 79: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xe9e7dd43  ! 80: CASA_I	casa	[%r31] 0xea, %r3, %r20
	.word 0xe8dfc283  ! 81: LDXA_R	ldxa	[%r31, %r3] 0x14, %r20
	.word 0xe9e7e003  ! 81: CASA_R	casa	[%r31] %asi, %r3, %r20
memptr_80_40:
	set 0x60140000, %r31
	.word 0xd4dfdd40  ! 82: LDXA_R	ldxa	[%r31, %r0] 0xea, %r10
	.word 0x85833ab7  ! 83: WRCCR_I	wr	%r12, 0x1ab7, %ccr
	.word 0xd41fe1d0  ! 84: LDD_I	ldd	[%r31 + 0x01d0], %r10
	.word 0xd41fe170  ! 85: LDD_I	ldd	[%r31 + 0x0170], %r10
	.word 0xd497c3c1  ! 85: LDUHA_R	lduha	[%r31, %r1] 0x1e, %r10
	.word 0x9f8020c0  ! 86: SIR	sir	0x00c0
	.word 0x24cfc001  ! 87: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xd497c282  ! 88: LDUHA_R	lduha	[%r31, %r2] 0x14, %r10
	.word 0xd41fe1b0  ! 89: LDD_I	ldd	[%r31 + 0x01b0], %r10
	.word 0x24cfc001  ! 89: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xc19fdc00  ! 90: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfd920  ! 91: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x20800001  ! 92: BN	bn,a	<label_0x1>
	.word 0xe19fda00  ! 93: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fdf20  ! 93: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_44) + 0, 16, 16)) -> intp(4,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_44)&0xffffffff) + 16, 16, 16)) -> intp(1,0,2,,,,,1)
#else
	set 0x49607a8b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7a1c9c9  ! 1: FDIVd	fdivd	%f38, %f40, %f50
intvec_80_44:
memptr_80_45:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_46) + 32, 16, 16)) -> intp(7,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_46)&0xffffffff) + 32, 16, 16)) -> intp(2,0,10,,,,,1)
#else
	set 0x5020acae, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7b404d3  ! 1: FCMPNE32	fcmpne32	%d16, %d50, %r19
intvec_80_46:
	.word 0x9f803235  ! 94: SIR	sir	0x1235
	.word 0x858521eb  ! 95: WRCCR_I	wr	%r20, 0x01eb, %ccr
	.word 0x93b444d1  ! 96: FCMPNE32	fcmpne32	%d48, %d48, %r9
	.word 0x39400001  ! 97: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8584aacb  ! 97: WRCCR_I	wr	%r18, 0x0acb, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_47:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc3e0  ! 99: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfc3e0  ! 100: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f803909  ! 101: SIR	sir	0x1909
	.word 0xe19fda00  ! 101: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc32fe040  ! 102: STXFSR_I	st-sfr	%f1, [0x0040, %r31]
	.word 0x87afca40  ! 103: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0xe19fdf20  ! 104: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc32fe040  ! 105: STXFSR_I	st-sfr	%f1, [0x0040, %r31]
	.word 0x20800001  ! 105: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 106: BN	bn,a	<label_0x1>
	.word 0xe5e7e000  ! 107: CASA_R	casa	[%r31] %asi, %r0, %r18
	.word 0xe19fda00  ! 108: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fd960  ! 109: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe5e7e002  ! 109: CASA_R	casa	[%r31] %asi, %r2, %r18
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
intvec_80_51:
	.word 0x95b484cc  ! 110: FCMPNE32	fcmpne32	%d18, %d12, %r10
	.word 0x20800001  ! 111: BN	bn,a	<label_0x1>
	.word 0xc3efe0b0  ! 112: PREFETCHA_I	prefetcha	[%r31, + 0x00b0] %asi, #one_read
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc2c0  ! 113: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f802180  ! 114: SIR	sir	0x0180
	.word 0x91b7c4c1  ! 115: FCMPNE32	fcmpne32	%d62, %d32, %r8
	.word 0xe1bfda00  ! 116: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd13fe080  ! 117: STDF_I	std	%f8, [0x0080, %r31]
	.word 0xd03fe060  ! 117: STD_I	std	%r8, [%r31 + 0x0060]
memptr_80_54:
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
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_80_55:
	.word 0xd91fe0b0  ! 118: LDDF_I	ldd	[%r31, 0x00b0], %f12
	.word 0x8580eb48  ! 119: WRCCR_I	wr	%r3, 0x0b48, %ccr
	.word 0x19400001  ! 120: FBPUGE	fbuge
	.word 0x9f802160  ! 121: SIR	sir	0x0160
	.word 0x93b484d2  ! 121: FCMPNE32	fcmpne32	%d18, %d18, %r9
memptr_80_57:
	set user_data_start, %r31
	.word 0xc19fd960  ! 122: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x85826878  ! 123: WRCCR_I	wr	%r9, 0x0878, %ccr
	.word 0xc3efe020  ! 124: PREFETCHA_I	prefetcha	[%r31, + 0x0020] %asi, #one_read
	.word 0xe1bfda00  ! 125: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc32fe190  ! 125: STXFSR_I	st-sfr	%f1, [0x0190, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_59:
	.word 0x9f802082  ! 126: SIR	sir	0x0082
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 128: BN	bn,a	<label_0x1>
	.word 0x9f803283  ! 129: SIR	sir	0x1283
	.word 0x20800001  ! 129: BN	bn,a	<label_0x1>
	.word 0xc3efe010  ! 130: PREFETCHA_I	prefetcha	[%r31, + 0x0010] %asi, #one_read
	.word 0xe19fda00  ! 131: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xda3fe1a0  ! 132: STD_I	std	%r13, [%r31 + 0x01a0]
	.word 0xdb1fe020  ! 133: LDDF_I	ldd	[%r31, 0x0020], %f13
	.word 0xc32fe1a0  ! 133: STXFSR_I	st-sfr	%f1, [0x01a0, %r31]
	.word 0xe19fdb60  ! 134: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 135: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 136: BN	bn,a	<label_0x1>
	.word 0xc1bfc3e0  ! 137: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfd960  ! 137: STDFA_R	stda	%f16, [%r0, %r31]
memptr_80_62:
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
intvec_80_63:
	.word 0xc1bfd960  ! 138: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x85852a01  ! 139: WRCCR_I	wr	%r20, 0x0a01, %ccr
	.word 0x9f802e8f  ! 140: SIR	sir	0x0e8f
	.word 0xe1bfde00  ! 141: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x93a309d0  ! 141: FDIVd	fdivd	%f12, %f16, %f40
memptr_80_65:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_66) + 56, 16, 16)) -> intp(6,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_66)&0xffffffff) + 0, 16, 16)) -> intp(1,0,23,,,,,1)
#else
	set 0x2ac0e262, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_66:
	.word 0xc19fde00  ! 142: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8584ea91  ! 143: WRCCR_I	wr	%r19, 0x0a91, %ccr
	.word 0x99b244d2  ! 144: FCMPNE32	fcmpne32	%d40, %d18, %r12
	.word 0xc1bfde00  ! 145: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x858531e4  ! 145: WRCCR_I	wr	%r20, 0x11e4, %ccr
	.word 0xd93fe130  ! 146: STDF_I	std	%f12, [0x0130, %r31]
	.word 0xe1bfda00  ! 147: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8020c0  ! 148: SIR	sir	0x00c0
	.word 0xd83fe130  ! 149: STD_I	std	%r12, [%r31 + 0x0130]
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_68) + 56, 16, 16)) -> intp(2,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_68)&0xffffffff) + 16, 16, 16)) -> intp(2,0,0,,,,,1)
#else
	set 0x81005609, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_80_68:
	.word 0xa3b044d1  ! 150: FCMPNE32	fcmpne32	%d32, %d48, %r17
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe020  ! 152: LDD_I	ldd	[%r31 + 0x0020], %r17
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x19400001  ! 153: FBPUGE	fbuge
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
	.word 0xe29fc6c3  ! 154: LDDA_R	ldda	[%r31, %r3] 0x36, %r17
	.word 0xe1bfdc00  ! 155: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa7a489c2  ! 156: FDIVd	fdivd	%f18, %f2, %f50
	.word 0xc32fe040  ! 157: STXFSR_I	st-sfr	%f1, [0x0040, %r31]
	.word 0xe1bfda00  ! 157: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x00800001  ! 158: BN	bn  	<label_0x1>
	.word 0xa9a7c9c1  ! 159: FDIVd	fdivd	%f62, %f32, %f20
	.word 0xe9e7d101  ! 160: CASA_I	casa	[%r31] 0x88, %r1, %r20
	.word 0xc1bfd960  ! 161: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa9a7c9c1  ! 161: FDIVd	fdivd	%f62, %f32, %f20
memptr_80_72:
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
intvec_80_73:
	.word 0xe1bfdc00  ! 162: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x85847fb3  ! 163: WRCCR_I	wr	%r17, 0x1fb3, %ccr
	.word 0xa9b244d3  ! 164: FCMPNE32	fcmpne32	%d40, %d50, %r20
	.word 0xe19fdf20  ! 165: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa3a489d0  ! 165: FDIVd	fdivd	%f18, %f16, %f48
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f80275d  ! 1: SIR	sir	0x075d
intvec_80_75:
	.word 0xd51fe1d0  ! 166: LDDF_I	ldd	[%r31, 0x01d0], %f10
	.word 0xc1bfdf20  ! 167: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa9b144d1  ! 168: FCMPNE32	fcmpne32	%d36, %d48, %r20
	.word 0xe81fe1f0  ! 169: LDD_I	ldd	[%r31 + 0x01f0], %r20
	.word 0x9f8033ef  ! 169: SIR	sir	0x13ef
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_77:
memptr_80_78:
	set user_data_start, %r31
	.word 0x9f8031c8  ! 170: SIR	sir	0x11c8
	.word 0x8580eba6  ! 171: WRCCR_I	wr	%r3, 0x0ba6, %ccr
	.word 0xc19fdb60  ! 172: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x39400001  ! 173: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fc3e0  ! 173: LDDFA_R	ldda	[%r31, %r0], %f16
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_79:
	.word 0x9f802725  ! 174: SIR	sir	0x0725
	.word 0x87afca40  ! 175: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0xe1bfde00  ! 176: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa1b084d1  ! 177: FCMPNE32	fcmpne32	%d2, %d48, %r16
	.word 0x04cfc001  ! 177: BRLEZ	brlez,pt  	%r31,<label_0xfc001>
	.word 0xe097df03  ! 178: LDUHA_R	lduha	[%r31, %r3] 0xf8, %r16
	.word 0xe19fdf20  ! 179: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc32fe180  ! 180: STXFSR_I	st-sfr	%f1, [0x0180, %r31]
	.word 0xc32fe160  ! 181: STXFSR_I	st-sfr	%f1, [0x0160, %r31]
	.word 0xc1bfda00  ! 181: STDFA_R	stda	%f0, [%r0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_82) + 24, 16, 16)) -> intp(3,0,0,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_82)&0xffffffff) + 40, 16, 16)) -> intp(0,0,29,,,,,1)
#else
	set 0xb9b00822, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_82:
	.word 0x91a4c9cd  ! 182: FDIVd	fdivd	%f50, %f44, %f8
	.word 0xe19fd920  ! 183: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 184: BN	bn,a	<label_0x1>
	.word 0x9f802bcc  ! 185: SIR	sir	0x0bcc
	.word 0xe19fdf20  ! 185: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_80_84:
	set user_data_start, %r31
	.word 0xd63fe0b0  ! 186: STD_I	std	%r11, [%r31 + 0x00b0]
	.word 0x8582b317  ! 187: WRCCR_I	wr	%r10, 0x1317, %ccr
	.word 0xd71fe160  ! 188: LDDF_I	ldd	[%r31, 0x0160], %f11
	.word 0xd697c240  ! 189: LDUHA_R	lduha	[%r31, %r0] 0x12, %r11
	.word 0xd697c402  ! 189: LDUHA_R	lduha	[%r31, %r2] 0x20, %r11
memptr_80_85:
	set 0x60540000, %r31
	.word 0x9f802040  ! 190: SIR	sir	0x0040
	.word 0x85832ae2  ! 191: WRCCR_I	wr	%r12, 0x0ae2, %ccr
	.word 0xe1bfc2c0  ! 192: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd63fe0e0  ! 193: STD_I	std	%r11, [%r31 + 0x00e0]
	.word 0x8584e19c  ! 193: WRCCR_I	wr	%r19, 0x019c, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_86) + 24, 16, 16)) -> intp(5,0,10,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_86)&0xffffffff) + 0, 16, 16)) -> intp(0,0,18,,,,,1)
#else
	set 0x26f00c3e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_80_86:
	.word 0xa5a4c9d4  ! 194: FDIVd	fdivd	%f50, %f20, %f18
	.word 0x93a7c9c3  ! 195: FDIVd	fdivd	%f62, %f34, %f40
	.word 0xc19fdb60  ! 196: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x93b144c1  ! 197: FCMPNE32	fcmpne32	%d36, %d32, %r9
	.word 0x93a7c9c1  ! 197: FDIVd	fdivd	%f62, %f32, %f40
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_88) + 0, 16, 16)) -> intp(0,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_88)&0xffffffff) + 48, 16, 16)) -> intp(2,0,17,,,,,1)
#else
	set 0x65a0bc69, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_88:
	.word 0x9f803bf8  ! 198: SIR	sir	0x1bf8
	.word 0xe19fd960  ! 199: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe6dfc383  ! 200: LDXA_R	ldxa	[%r31, %r3] 0x1c, %r19
	.word 0x9f802976  ! 201: SIR	sir	0x0976
	.word 0xe1bfdb60  ! 201: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfdc00  ! 202: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x24cfc001  ! 203: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xe23fe1d0  ! 204: STD_I	std	%r17, [%r31 + 0x01d0]
	.word 0x20800001  ! 205: BN	bn,a	<label_0x1>
	.word 0x87afca42  ! 205: FCMPd	fcmpd	%fcc<n>, %f62, %f2
memptr_80_91:
	set 0x60140000, %r31
	.word 0xe19fdc00  ! 206: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8584fd77  ! 207: WRCCR_I	wr	%r19, 0x1d77, %ccr
	.word 0xc32fe180  ! 208: STXFSR_I	st-sfr	%f1, [0x0180, %r31]
	.word 0xe19fdf20  ! 209: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x858327e1  ! 209: WRCCR_I	wr	%r12, 0x07e1, %ccr
memptr_80_93:
	set user_data_start, %r31
	.word 0xe19fd960  ! 210: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8582a168  ! 211: WRCCR_I	wr	%r10, 0x0168, %ccr
	.word 0xe1bfc3e0  ! 212: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfd920  ! 213: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x85853dfe  ! 213: WRCCR_I	wr	%r20, 0x1dfe, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_95:
	.word 0xc1bfdc00  ! 214: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803707  ! 216: SIR	sir	0x1707
	.word 0x20800001  ! 217: BN	bn,a	<label_0x1>
	.word 0xc36fe040  ! 217: PREFETCH_I	prefetch	[%r31 + 0x0040], #one_read
memptr_80_97:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_98) + 0, 16, 16)) -> intp(6,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_98)&0xffffffff) + 24, 16, 16)) -> intp(2,0,25,,,,,1)
#else
	set 0x4870bcec, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_98:
	.word 0xe1bfdc00  ! 218: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8585350f  ! 219: WRCCR_I	wr	%r20, 0x150f, %ccr
	.word 0xa7b344d1  ! 220: FCMPNE32	fcmpne32	%d44, %d48, %r19
	.word 0xe1bfc2c0  ! 221: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa3a089d2  ! 221: FDIVd	fdivd	%f2, %f18, %f48
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_100) + 16, 16, 16)) -> intp(2,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_100)&0xffffffff) + 24, 16, 16)) -> intp(4,0,9,,,,,1)
#else
	set 0x170f47d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3b444d1  ! 1: FCMPNE32	fcmpne32	%d48, %d48, %r17
intvec_80_100:
memptr_80_101:
	set 0x60540000, %r31
	.word 0x91a409d1  ! 222: FDIVd	fdivd	%f16, %f48, %f8
	.word 0x8584b5e1  ! 223: WRCCR_I	wr	%r18, 0x15e1, %ccr
	.word 0xc32fe030  ! 224: STXFSR_I	st-sfr	%f1, [0x0030, %r31]
	.word 0x99a2c9d1  ! 225: FDIVd	fdivd	%f42, %f48, %f12
	.word 0x8581e496  ! 225: WRCCR_I	wr	%r7, 0x0496, %ccr
	.word 0xc19fd960  ! 226: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x99b7c4c1  ! 227: FCMPNE32	fcmpne32	%d62, %d32, %r12
	.word 0xc32fe1c0  ! 228: STXFSR_I	st-sfr	%f1, [0x01c0, %r31]
	.word 0xc19fc3e0  ! 229: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd89fc540  ! 229: LDDA_R	ldda	[%r31, %r0] 0x2a, %r12
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa1b404c5  ! 1: FCMPNE32	fcmpne32	%d16, %d36, %r16
intvec_80_103:
memptr_80_104:
	set 0x60540000, %r31
	.word 0xa9b284c1  ! 230: FCMPNE32	fcmpne32	%d10, %d32, %r20
	.word 0x85843f0a  ! 231: WRCCR_I	wr	%r16, 0x1f0a, %ccr
	.word 0xe91fe1e0  ! 232: LDDF_I	ldd	[%r31, 0x01e0], %f20
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x85846c66  ! 233: WRCCR_I	wr	%r17, 0x0c66, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_106) + 8, 16, 16)) -> intp(0,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_106)&0xffffffff) + 8, 16, 16)) -> intp(5,0,27,,,,,1)
#else
	set 0xf940f2b5, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_106:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_107:
	.word 0x95a489d2  ! 234: FDIVd	fdivd	%f18, %f18, %f10
	.word 0xe19fdf20  ! 235: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9a509d2  ! 236: FDIVd	fdivd	%f20, %f18, %f20
	.word 0x9f802d88  ! 237: SIR	sir	0x0d88
	.word 0x20800001  ! 237: BN	bn,a	<label_0x1>
memptr_80_109:
	set 0x60740000, %r31
	.word 0xe19fda00  ! 238: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85813e69  ! 239: WRCCR_I	wr	%r4, 0x1e69, %ccr
	.word 0x20800001  ! 240: BN	bn,a	<label_0x1>
	.word 0xe19fc3e0  ! 241: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8584adc8  ! 241: WRCCR_I	wr	%r18, 0x0dc8, %ccr
memptr_80_111:
	set user_data_start, %r31
	.word 0x20800001  ! 242: BN	bn,a	<label_0x1>
	.word 0x85817b72  ! 243: WRCCR_I	wr	%r5, 0x1b72, %ccr
	.word 0x20800001  ! 244: BN	bn,a	<label_0x1>
	.word 0xc1bfc2c0  ! 245: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfda00  ! 245: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20800001  ! 246: BN	bn,a	<label_0x1>
	.word 0x24cfc001  ! 247: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0xe81fe030  ! 248: LDD_I	ldd	[%r31 + 0x0030], %r20
	.word 0x20800001  ! 249: BN	bn,a	<label_0x1>
	.word 0xe9e7dc41  ! 249: CASA_I	casa	[%r31] 0xe2, %r1, %r20
	.word 0x20800001  ! 250: BN	bn,a	<label_0x1>
	.word 0xc1bfde00  ! 251: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfdb60  ! 252: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fd960  ! 253: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 253: BN	bn,a	<label_0x1>
	.word 0xc1bfc2c0  ! 254: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfdb60  ! 255: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe5e7c2c0  ! 256: CASA_I	casa	[%r31] 0x16, %r0, %r18
	.word 0xc1bfd920  ! 257: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20800001  ! 257: BN	bn,a	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_113:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_114) + 8, 16, 16)) -> intp(4,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_114)&0xffffffff) + 40, 16, 16)) -> intp(2,0,23,,,,,1)
#else
	set 0xeec037d3, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803c5a  ! 1: SIR	sir	0x1c5a
intvec_80_114:
	.word 0x39400001  ! 258: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1b7c4c0  ! 259: FCMPNE32	fcmpne32	%d62, %d0, %r16
	.word 0xa7b444d0  ! 260: FCMPNE32	fcmpne32	%d48, %d16, %r19
	.word 0x93a209d0  ! 261: FDIVd	fdivd	%f8, %f16, %f40
	.word 0x9f802d3d  ! 261: SIR	sir	0x0d3d
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_115:
	.word 0xe6dfc2c3  ! 262: LDXA_R	ldxa	[%r31, %r3] 0x16, %r19
	.word 0xa7a7c9c0  ! 263: FDIVd	fdivd	%f62, %f0, %f50
	.word 0x9f8025ea  ! 264: SIR	sir	0x05ea
	.word 0xd297c6c1  ! 265: LDUHA_R	lduha	[%r31, %r1] 0x36, %r9
	.word 0x93a7c9c2  ! 265: FDIVd	fdivd	%f62, %f2, %f40
	.word 0xd3e7c241  ! 266: CASA_I	casa	[%r31] 0x12, %r1, %r9
	.word 0x20800001  ! 267: BN	bn,a	<label_0x1>
	.word 0x9f8021d0  ! 268: SIR	sir	0x01d0
	.word 0x9f802120  ! 269: SIR	sir	0x0120
	.word 0xd29fd143  ! 269: LDDA_R	ldda	[%r31, %r3] 0x8a, %r9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_118) + 48, 16, 16)) -> intp(4,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_118)&0xffffffff) + 16, 16, 16)) -> intp(2,0,21,,,,,1)
#else
	set 0xff80f7bd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_118:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa3b044d0  ! 1: FCMPNE32	fcmpne32	%d32, %d16, %r17
intvec_80_119:
	.word 0x9f802102  ! 270: SIR	sir	0x0102
	.word 0x93a7c9c0  ! 271: FDIVd	fdivd	%f62, %f0, %f40
	.word 0xa7a4c9c7  ! 272: FDIVd	fdivd	%f50, %f38, %f50
	.word 0xa5b184d3  ! 273: FCMPNE32	fcmpne32	%d6, %d50, %r18
	.word 0xa5b7c4c1  ! 273: FCMPNE32	fcmpne32	%d62, %d32, %r18
	.word 0xc19fc3e0  ! 274: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x87afca40  ! 275: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0xe1bfc3e0  ! 276: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fdb60  ! 277: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x19400001  ! 277: FBPUGE	fbuge
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_121:
	.word 0x39400001  ! 278: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 279: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 280: BN	bn,a	<label_0x1>
	.word 0x9ba449d3  ! 281: FDIVd	fdivd	%f48, %f50, %f44
	.word 0x20800001  ! 281: BN	bn,a	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_123:
	.word 0xe1bfc3e0  ! 282: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x97b7c4c0  ! 283: FCMPNE32	fcmpne32	%d62, %d0, %r11
	.word 0x9ba509d2  ! 284: FDIVd	fdivd	%f20, %f18, %f44
	.word 0xc19fdc00  ! 285: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc36fe1d0  ! 285: PREFETCH_I	prefetch	[%r31 + 0x01d0], #one_read
	.word 0xe19fde00  ! 286: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc36fe1a0  ! 287: PREFETCH_I	prefetch	[%r31 + 0x01a0], #one_read
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
	.word 0xe1bfd960  ! 289: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fdf20  ! 289: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_80_126:
	set user_data_start, %r31
	.word 0xe19fda00  ! 290: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85846077  ! 291: WRCCR_I	wr	%r17, 0x0077, %ccr
	.word 0x20800001  ! 292: BN	bn,a	<label_0x1>
	.word 0xe19fd920  ! 293: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85806e80  ! 293: WRCCR_I	wr	%r1, 0x0e80, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa5a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f18
intvec_80_127:
	.word 0x9f803563  ! 294: SIR	sir	0x1563
	.word 0xd03fe0b0  ! 295: STD_I	std	%r8, [%r31 + 0x00b0]
	.word 0xd097df01  ! 296: LDUHA_R	lduha	[%r31, %r1] 0xf8, %r8
	.word 0x95a409c2  ! 297: FDIVd	fdivd	%f16, %f2, %f10
	.word 0xd13fe040  ! 297: STDF_I	std	%f8, [0x0040, %r31]
memptr_80_128:
	set 0x60740000, %r31
	.word 0x9f802190  ! 298: SIR	sir	0x0190
	.word 0x8584b6d1  ! 299: WRCCR_I	wr	%r18, 0x16d1, %ccr
	.word 0xd13fe1f0  ! 300: STDF_I	std	%f8, [0x01f0, %r31]
	.word 0xc3efe110  ! 301: PREFETCHA_I	prefetcha	[%r31, + 0x0110] %asi, #one_read
	.word 0xd13fe0a0  ! 301: STDF_I	std	%f8, [0x00a0, %r31]
	.word 0x20800001  ! 302: BN	bn,a	<label_0x1>
	.word 0xd1e7e002  ! 303: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xe1bfdf20  ! 304: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fdc00  ! 305: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfdc00  ! 305: STDFA_R	stda	%f16, [%r0, %r31]
memptr_80_130:
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
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_80_131:
	.word 0xc19fc3e0  ! 306: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8584f8bf  ! 307: WRCCR_I	wr	%r19, 0x18bf, %ccr
	.word 0x9f802ffa  ! 308: SIR	sir	0x0ffa
	.word 0xc19fd960  ! 309: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f803585  ! 309: SIR	sir	0x1585
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_133:
	.word 0xc1bfd960  ! 310: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfde00  ! 311: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8037c0  ! 312: SIR	sir	0x17c0
	.word 0xe19fdb60  ! 313: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfc2c0  ! 313: STDFA_R	stda	%f16, [%r0, %r31]
memptr_80_134:
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
intvec_80_135:
	.word 0xe7e7d142  ! 314: CASA_I	casa	[%r31] 0x8a, %r2, %r19
	.word 0x85837dc2  ! 315: WRCCR_I	wr	%r13, 0x1dc2, %ccr
	.word 0xa9a2c9d2  ! 316: FDIVd	fdivd	%f42, %f18, %f20
	.word 0xe93fe070  ! 317: STDF_I	std	%f20, [0x0070, %r31]
	.word 0xa3a4c9d2  ! 317: FDIVd	fdivd	%f50, %f18, %f48
	.word 0xe23fe150  ! 318: STD_I	std	%r17, [%r31 + 0x0150]
	.word 0xe19fdb60  ! 319: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe297c720  ! 320: LDUHA_R	lduha	[%r31, %r0] 0x39, %r17
	.word 0xe3e7c722  ! 321: CASA_I	casa	[%r31] 0x39, %r2, %r17
	.word 0xe23fe110  ! 321: STD_I	std	%r17, [%r31 + 0x0110]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_136) + 8, 16, 16)) -> intp(4,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_136)&0xffffffff) + 40, 16, 16)) -> intp(0,0,1,,,,,1)
#else
	set 0x9560af1f, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_136:
	.word 0x9f802715  ! 322: SIR	sir	0x0715
	.word 0xc1bfdb60  ! 323: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fde00  ! 324: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa5b1c4d1  ! 325: FCMPNE32	fcmpne32	%d38, %d48, %r18
	.word 0xc19fc2c0  ! 325: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_138) + 0, 16, 16)) -> intp(0,0,19,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_138)&0xffffffff) + 24, 16, 16)) -> intp(4,0,27,,,,,1)
#else
	set 0xaff0d95e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f8026dd  ! 1: SIR	sir	0x06dd
intvec_80_138:
	.word 0x9f803963  ! 326: SIR	sir	0x1963
	.word 0x04cfc001  ! 327: BRLEZ	brlez,pt  	%r31,<label_0xfc001>
	.word 0xc32fe070  ! 328: STXFSR_I	st-sfr	%f1, [0x0070, %r31]
	.word 0x97a089d3  ! 329: FDIVd	fdivd	%f2, %f50, %f42
	.word 0x87afca42  ! 329: FCMPd	fcmpd	%fcc<n>, %f62, %f2
	.word 0xe0dfd920  ! 330: LDXA_R	ldxa	[%r31, %r0] 0xc9, %r16
	.word 0x20800001  ! 331: BN	bn,a	<label_0x1>
	.word 0xe19fda00  ! 332: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc3efe0c0  ! 333: PREFETCHA_I	prefetcha	[%r31, + 0x00c0] %asi, #one_read
	.word 0xe1bfc3e0  ! 333: STDFA_R	stda	%f16, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_139:
	.word 0xc19fdb60  ! 334: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x24cfc001  ! 335: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x39400001  ! 336: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd960  ! 337: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x97b2c4c5  ! 337: FCMPNE32	fcmpne32	%d42, %d36, %r11
	.word 0xc19fc2c0  ! 338: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x99a7c9c1  ! 339: FDIVd	fdivd	%f62, %f32, %f12
	.word 0xc32fe090  ! 340: STXFSR_I	st-sfr	%f1, [0x0090, %r31]
	.word 0xe19fdf20  ! 341: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd9e7d101  ! 341: CASA_I	casa	[%r31] 0x88, %r1, %r12
memptr_80_141:
	set user_data_start, %r31
	.word 0xd8dfdd40  ! 342: LDXA_R	ldxa	[%r31, %r0] 0xea, %r12
	.word 0x8580e485  ! 343: WRCCR_I	wr	%r3, 0x0485, %ccr
	.word 0xe19fc2c0  ! 344: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd91fe1c0  ! 345: LDDF_I	ldd	[%r31, 0x01c0], %f12
	.word 0x858371da  ! 345: WRCCR_I	wr	%r13, 0x11da, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_143:
memptr_80_144:
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
	.word 0x99a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f12
intvec_80_145:
	.word 0x93b2c4d0  ! 346: FCMPNE32	fcmpne32	%d42, %d16, %r9
	.word 0x8584764e  ! 347: WRCCR_I	wr	%r17, 0x164e, %ccr
	.word 0xa9b284d2  ! 348: FCMPNE32	fcmpne32	%d10, %d18, %r20
	.word 0x19400001  ! 349: FBPUGE	fbuge
	.word 0x9f802e39  ! 349: SIR	sir	0x0e39
	.word 0xd4dfc3c3  ! 350: LDXA_R	ldxa	[%r31, %r3] 0x1e, %r10
	.word 0x24cfc001  ! 351: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x20800001  ! 352: BN	bn,a	<label_0x1>
	.word 0xd497c603  ! 353: LDUHA_R	lduha	[%r31, %r3] 0x30, %r10
	.word 0x20800001  ! 353: BN	bn,a	<label_0x1>
memptr_80_148:
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
intvec_80_149:
	.word 0xe1bfdb60  ! 354: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8584e7f8  ! 355: WRCCR_I	wr	%r19, 0x07f8, %ccr
	.word 0x9f8024a0  ! 356: SIR	sir	0x04a0
	.word 0xe19fde00  ! 357: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85826421  ! 357: WRCCR_I	wr	%r9, 0x0421, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_151:
	.word 0x9ba489c6  ! 358: FDIVd	fdivd	%f18, %f6, %f44
	.word 0xc1bfdb60  ! 359: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20800001  ! 360: BN	bn,a	<label_0x1>
	.word 0xa7a049d3  ! 361: FDIVd	fdivd	%f32, %f50, %f50
	.word 0xc19fc2c0  ! 361: LDDFA_R	ldda	[%r31, %r0], %f0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_152) + 16, 16, 16)) -> intp(0,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_152)&0xffffffff) + 40, 16, 16)) -> intp(2,0,14,,,,,1)
#else
	set 0x820211b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_152:
	.word 0xe5e7dd40  ! 362: CASA_I	casa	[%r31] 0xea, %r0, %r18
	.word 0xc36fe160  ! 363: PREFETCH_I	prefetch	[%r31 + 0x0160], #one_read
	.word 0x9f803c34  ! 364: SIR	sir	0x1c34
	.word 0xd8dfc723  ! 365: LDXA_R	ldxa	[%r31, %r3] 0x39, %r12
	.word 0x99b7c4c1  ! 365: FCMPNE32	fcmpne32	%d62, %d32, %r12
memptr_80_153:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_154) + 8, 16, 16)) -> intp(4,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_154)&0xffffffff) + 56, 16, 16)) -> intp(5,0,31,,,,,1)
#else
	set 0x1a60d62b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93b044d0  ! 1: FCMPNE32	fcmpne32	%d32, %d16, %r9
intvec_80_154:
	.word 0xe19fde00  ! 366: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8582f150  ! 367: WRCCR_I	wr	%r11, 0x1150, %ccr
	.word 0x95a4c9d2  ! 368: FDIVd	fdivd	%f50, %f18, %f10
	.word 0xe19fda00  ! 369: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8584bc22  ! 369: WRCCR_I	wr	%r18, 0x1c22, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_156) + 16, 16, 16)) -> intp(1,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_156)&0xffffffff) + 16, 16, 16)) -> intp(4,0,7,,,,,1)
#else
	set 0x3ce02ed8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7b444c5  ! 1: FCMPNE32	fcmpne32	%d48, %d36, %r19
intvec_80_156:
memptr_80_157:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_158) + 48, 16, 16)) -> intp(5,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_158)&0xffffffff) + 40, 16, 16)) -> intp(4,0,28,,,,,1)
#else
	set 0xcf00fbc, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f8039cb  ! 1: SIR	sir	0x19cb
intvec_80_158:
	.word 0xa5b0c4c9  ! 370: FCMPNE32	fcmpne32	%d34, %d40, %r18
	.word 0x8581730a  ! 371: WRCCR_I	wr	%r5, 0x130a, %ccr
	.word 0xa9a209d3  ! 372: FDIVd	fdivd	%f8, %f50, %f20
	.word 0xa7a409d0  ! 373: FDIVd	fdivd	%f16, %f16, %f50
	.word 0x8582adcd  ! 373: WRCCR_I	wr	%r10, 0x0dcd, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_160) + 24, 16, 16)) -> intp(7,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_160)&0xffffffff) + 16, 16, 16)) -> intp(0,0,12,,,,,1)
#else
	set 0x96f0e597, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_160:
memptr_80_161:
	set 0x60140000, %r31
	.word 0x95a289d0  ! 374: FDIVd	fdivd	%f10, %f16, %f10
	.word 0x8581b21b  ! 375: WRCCR_I	wr	%r6, 0x121b, %ccr
	.word 0x00800001  ! 376: BN	bn  	<label_0x1>
	.word 0xa9b044c5  ! 377: FCMPNE32	fcmpne32	%d32, %d36, %r20
	.word 0x00800001  ! 377: BN	bn  	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_162) + 24, 16, 16)) -> intp(4,0,7,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_162)&0xffffffff) + 32, 16, 16)) -> intp(4,0,11,,,,,1)
#else
	set 0x3ee0a253, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa1b404cb  ! 1: FCMPNE32	fcmpne32	%d16, %d42, %r16
intvec_80_162:
	.word 0xa9a249c1  ! 378: FDIVd	fdivd	%f40, %f32, %f20
	.word 0x20800001  ! 379: BN	bn,a	<label_0x1>
	.word 0xe19fde00  ! 380: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x39400001  ! 381: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fdf20  ! 381: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe297c380  ! 382: LDUHA_R	lduha	[%r31, %r0] 0x1c, %r17
	.word 0xc1bfde00  ! 383: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc3efe0e0  ! 384: PREFETCHA_I	prefetcha	[%r31, + 0x00e0] %asi, #one_read
	.word 0xe29fc2c1  ! 385: LDDA_R	ldda	[%r31, %r1] 0x16, %r17
	.word 0xe21fe0e0  ! 385: LDD_I	ldd	[%r31 + 0x00e0], %r17
	.word 0xc1bfd920  ! 386: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fd920  ! 387: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x00800001  ! 388: BN	bn  	<label_0x1>
	.word 0xc1bfda00  ! 389: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x00800001  ! 389: BN	bn  	<label_0x1>
	.word 0xe51fe1e0  ! 390: LDDF_I	ldd	[%r31, 0x01e0], %f18
	.word 0x00800001  ! 391: BN	bn  	<label_0x1>
	.word 0x00800001  ! 392: BN	bn  	<label_0x1>
	.word 0xe5e7c402  ! 393: CASA_I	casa	[%r31] 0x20, %r2, %r18
	.word 0x00800001  ! 393: BN	bn  	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_165:
memptr_80_166:
	set 0x60140000, %r31
	.word 0xa9a449c1  ! 394: FDIVd	fdivd	%f48, %f32, %f20
	.word 0x85817321  ! 395: WRCCR_I	wr	%r5, 0x1321, %ccr
	.word 0xe33fe1a0  ! 396: STDF_I	std	%f17, [0x01a0, %r31]
	.word 0xa3b404d3  ! 397: FCMPNE32	fcmpne32	%d16, %d50, %r17
	.word 0x85816e19  ! 397: WRCCR_I	wr	%r5, 0x0e19, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_168) + 40, 16, 16)) -> intp(7,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_168)&0xffffffff) + 24, 16, 16)) -> intp(4,0,18,,,,,1)
#else
	set 0xa0d02509, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93a2c9d2  ! 1: FDIVd	fdivd	%f42, %f18, %f40
intvec_80_168:
	.word 0xc1bfd960  ! 398: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fda00  ! 399: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f803419  ! 400: SIR	sir	0x1419
	.word 0xc1bfde00  ! 401: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x19400001  ! 401: FBPUGE	fbuge
memptr_80_169:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_170) + 40, 16, 16)) -> intp(0,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_170)&0xffffffff) + 16, 16, 16)) -> intp(3,0,5,,,,,1)
#else
	set 0x7e05a56, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_80_170:
	.word 0xe53fe170  ! 402: STDF_I	std	%f18, [0x0170, %r31]
	.word 0x858464c4  ! 403: WRCCR_I	wr	%r17, 0x04c4, %ccr
	.word 0x9f802680  ! 404: SIR	sir	0x0680
	.word 0xd33fe1c0  ! 405: STDF_I	std	%f9, [0x01c0, %r31]
	.word 0x85842d2e  ! 405: WRCCR_I	wr	%r16, 0x0d2e, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_172) + 24, 16, 16)) -> intp(3,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_172)&0xffffffff) + 56, 16, 16)) -> intp(3,0,10,,,,,1)
#else
	set 0x31c04f51, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_172:
	.word 0xd297c381  ! 406: LDUHA_R	lduha	[%r31, %r1] 0x1c, %r9
	.word 0x87afca41  ! 407: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0x95a049c3  ! 408: FDIVd	fdivd	%f32, %f34, %f10
	.word 0xd53fe060  ! 409: STDF_I	std	%f10, [0x0060, %r31]
	.word 0xa9b404cd  ! 409: FCMPNE32	fcmpne32	%d16, %d44, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_174) + 0, 16, 16)) -> intp(7,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_174)&0xffffffff) + 16, 16, 16)) -> intp(1,0,7,,,,,1)
#else
	set 0x2f906fdc, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_174:
	.word 0xd11fe000  ! 410: LDDF_I	ldd	[%r31, 0x0000], %f8
	.word 0xc19fde00  ! 411: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x93b484c9  ! 412: FCMPNE32	fcmpne32	%d18, %d40, %r9
	.word 0xe497d040  ! 413: LDUHA_R	lduha	[%r31, %r0] 0x82, %r18
	.word 0x20800001  ! 413: BN	bn,a	<label_0x1>
	.word 0xe5e7c383  ! 414: CASA_I	casa	[%r31] 0x1c, %r3, %r18
	.word 0x87afca43  ! 415: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	.word 0xc1bfc2c0  ! 416: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f802190  ! 417: SIR	sir	0x0190
	.word 0x00800001  ! 417: BN	bn  	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_176) + 32, 16, 16)) -> intp(0,0,27,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_176)&0xffffffff) + 0, 16, 16)) -> intp(6,0,13,,,,,1)
#else
	set 0x673083eb, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3b044c2  ! 1: FCMPNE32	fcmpne32	%d32, %d2, %r17
intvec_80_176:
	.word 0xa3a4c9c8  ! 418: FDIVd	fdivd	%f50, %f8, %f48
	.word 0xe63fe1b0  ! 419: STD_I	std	%r19, [%r31 + 0x01b0]
	.word 0xc3efe050  ! 420: PREFETCHA_I	prefetcha	[%r31, + 0x0050] %asi, #one_read
	.word 0x39400001  ! 421: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a7c9c1  ! 421: FDIVd	fdivd	%f62, %f32, %f12
memptr_80_177:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_178) + 40, 16, 16)) -> intp(4,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_178)&0xffffffff) + 56, 16, 16)) -> intp(0,0,17,,,,,1)
#else
	set 0xc4a0b736, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_178:
	.word 0xd897c540  ! 422: LDUHA_R	lduha	[%r31, %r0] 0x2a, %r12
	.word 0x85842161  ! 423: WRCCR_I	wr	%r16, 0x0161, %ccr
	.word 0x91b104d1  ! 424: FCMPNE32	fcmpne32	%d4, %d48, %r8
	.word 0xe43fe0c0  ! 425: STD_I	std	%r18, [%r31 + 0x00c0]
	.word 0x8581e348  ! 425: WRCCR_I	wr	%r7, 0x0348, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_180) + 40, 16, 16)) -> intp(4,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_180)&0xffffffff) + 56, 16, 16)) -> intp(4,0,27,,,,,1)
#else
	set 0x25a04ee8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f80240c  ! 1: SIR	sir	0x040c
intvec_80_180:
	.word 0xc3efe070  ! 426: PREFETCHA_I	prefetcha	[%r31, + 0x0070] %asi, #one_read
	.word 0x9ba7c9c2  ! 427: FDIVd	fdivd	%f62, %f2, %f44
	.word 0x95b484c8  ! 428: FCMPNE32	fcmpne32	%d18, %d8, %r10
	.word 0xd51fe1d0  ! 429: LDDF_I	ldd	[%r31, 0x01d0], %f10
	.word 0xa5a089cd  ! 429: FDIVd	fdivd	%f2, %f44, %f18
	.word 0xe41fe0d0  ! 430: LDD_I	ldd	[%r31 + 0x00d0], %r18
	.word 0xe1bfdb60  ! 431: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe5e7c380  ! 432: CASA_I	casa	[%r31] 0x1c, %r0, %r18
	.word 0xe41fe040  ! 433: LDD_I	ldd	[%r31 + 0x0040], %r18
	.word 0xe41fe0b0  ! 433: LDD_I	ldd	[%r31 + 0x00b0], %r18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_183:
	.word 0x20800001  ! 434: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 435: BN	bn,a	<label_0x1>
	.word 0xa5a0c9d3  ! 436: FDIVd	fdivd	%f34, %f50, %f18
	.word 0xe19fd920  ! 437: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80359c  ! 437: SIR	sir	0x159c
memptr_80_185:
	set 0x60340000, %r31
	.word 0x9f802050  ! 438: SIR	sir	0x0050
	.word 0x85833163  ! 439: WRCCR_I	wr	%r12, 0x1163, %ccr
	.word 0xd13fe0b0  ! 440: STDF_I	std	%f8, [0x00b0, %r31]
	.word 0xc32fe070  ! 441: STXFSR_I	st-sfr	%f1, [0x0070, %r31]
	.word 0x858431fb  ! 441: WRCCR_I	wr	%r16, 0x11fb, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_186) + 8, 16, 16)) -> intp(7,0,1,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_186)&0xffffffff) + 24, 16, 16)) -> intp(5,0,12,,,,,1)
#else
	set 0xcfd054e0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93b304d0  ! 1: FCMPNE32	fcmpne32	%d12, %d16, %r9
intvec_80_186:
memptr_80_187:
	set 0x60140000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_188) + 16, 16, 16)) -> intp(1,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_188)&0xffffffff) + 24, 16, 16)) -> intp(7,0,20,,,,,1)
#else
	set 0xe3403428, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_188:
	.word 0x97b104d1  ! 442: FCMPNE32	fcmpne32	%d4, %d48, %r11
	.word 0x8584aed0  ! 443: WRCCR_I	wr	%r18, 0x0ed0, %ccr
	.word 0x9f8025ca  ! 444: SIR	sir	0x05ca
	.word 0x9f802418  ! 445: SIR	sir	0x0418
	.word 0x85852841  ! 445: WRCCR_I	wr	%r20, 0x0841, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa1a409d4  ! 1: FDIVd	fdivd	%f16, %f20, %f16
intvec_80_189:
	.word 0x20800001  ! 446: BN	bn,a	<label_0x1>
	.word 0xe19fc2c0  ! 447: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa7b044d2  ! 448: FCMPNE32	fcmpne32	%d32, %d18, %r19
	.word 0xc19fc3e0  ! 449: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91a489d3  ! 449: FDIVd	fdivd	%f18, %f50, %f8
	.word 0xe21fe080  ! 450: LDD_I	ldd	[%r31 + 0x0080], %r17
	.word 0x20800001  ! 451: BN	bn,a	<label_0x1>
	.word 0xe1bfdc00  ! 452: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f802180  ! 453: SIR	sir	0x0180
	.word 0xc19fd920  ! 453: LDDFA_R	ldda	[%r31, %r0], %f0
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f803ef6  ! 1: SIR	sir	0x1ef6
intvec_80_191:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_192) + 40, 16, 16)) -> intp(6,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_192)&0xffffffff) + 56, 16, 16)) -> intp(5,0,8,,,,,1)
#else
	set 0xaf200b70, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_192:
	.word 0x93b504cd  ! 454: FCMPNE32	fcmpne32	%d20, %d44, %r9
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93b444c2  ! 456: FCMPNE32	fcmpne32	%d48, %d2, %r9
	.word 0x99b4c4c6  ! 457: FCMPNE32	fcmpne32	%d50, %d6, %r12
	.word 0x9ba449d2  ! 457: FDIVd	fdivd	%f48, %f18, %f44
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_194) + 32, 16, 16)) -> intp(2,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_194)&0xffffffff) + 16, 16, 16)) -> intp(3,0,8,,,,,1)
#else
	set 0x26305db3, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_194:
	.word 0xdb3fe1a0  ! 458: STDF_I	std	%f13, [0x01a0, %r31]
	.word 0xc36fe030  ! 459: PREFETCH_I	prefetch	[%r31 + 0x0030], #one_read
	.word 0x93a509ca  ! 460: FDIVd	fdivd	%f20, %f10, %f40
	.word 0xc32fe140  ! 461: STXFSR_I	st-sfr	%f1, [0x0140, %r31]
	.word 0x39400001  ! 461: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_196) + 48, 16, 16)) -> intp(6,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_80_196)&0xffffffff) + 32, 16, 16)) -> intp(2,0,1,,,,,1)
#else
	set 0xc980a480, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_80_196:
	.word 0xe91fe0a0  ! 462: LDDF_I	ldd	[%r31, 0x00a0], %f20
	.word 0xa9a7c9c0  ! 463: FDIVd	fdivd	%f62, %f0, %f20
	.word 0x9f803a12  ! 464: SIR	sir	0x1a12
	.word 0xe89fc242  ! 465: LDDA_R	ldda	[%r31, %r2] 0x12, %r20
	.word 0xa9a7c9c3  ! 465: FDIVd	fdivd	%f62, %f34, %f20
memptr_80_198:
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
	.word 0x9f803a24  ! 1: SIR	sir	0x1a24
intvec_80_199:
	.word 0xdadfc242  ! 466: LDXA_R	ldxa	[%r31, %r2] 0x12, %r13
	.word 0x85833f6c  ! 467: WRCCR_I	wr	%r12, 0x1f6c, %ccr
	.word 0x9f80345c  ! 468: SIR	sir	0x145c
	.word 0xda97c2c1  ! 469: LDUHA_R	lduha	[%r31, %r1] 0x16, %r13
	.word 0x95a209c3  ! 469: FDIVd	fdivd	%f8, %f34, %f10
	.word 0x20800001  ! 470: BN	bn,a	<label_0x1>
	.word 0xc36fe0c0  ! 471: PREFETCH_I	prefetch	[%r31 + 0x00c0], #one_read
	.word 0xd7e7d163  ! 472: CASA_I	casa	[%r31] 0x8b, %r3, %r11
	.word 0xc1bfde00  ! 473: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd697d142  ! 473: LDUHA_R	lduha	[%r31, %r2] 0x8a, %r11
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_201:
memptr_80_202:
	set 0x60340000, %r31
	.word 0x39400001  ! 474: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x85853c3c  ! 475: WRCCR_I	wr	%r20, 0x1c3c, %ccr
	.word 0xc1bfdb60  ! 476: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f802981  ! 477: SIR	sir	0x0981
	.word 0x8580e1e0  ! 477: WRCCR_I	wr	%r3, 0x01e0, %ccr
	.word 0xd71fe180  ! 478: LDDF_I	ldd	[%r31, 0x0180], %f11
	.word 0x00800001  ! 479: BN	bn  	<label_0x1>
	.word 0xc1bfdb60  ! 480: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd69fc381  ! 481: LDDA_R	ldda	[%r31, %r1] 0x1c, %r11
	.word 0xc1bfda00  ! 481: STDFA_R	stda	%f0, [%r0, %r31]
memptr_80_205:
	set 0x60140000, %r31
	.word 0xd69fd062  ! 482: LDDA_R	ldda	[%r31, %r2] 0x83, %r11
	.word 0x8584216d  ! 483: WRCCR_I	wr	%r16, 0x016d, %ccr
	.word 0xd63fe140  ! 484: STD_I	std	%r11, [%r31 + 0x0140]
	.word 0x9f8021a0  ! 485: SIR	sir	0x01a0
	.word 0xd71fe020  ! 485: LDDF_I	ldd	[%r31, 0x0020], %f11
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_80_207:
	.word 0x19400001  ! 486: FBPUGE	fbuge
	.word 0xc1bfda00  ! 487: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd097d162  ! 488: LDUHA_R	lduha	[%r31, %r2] 0x8b, %r8
	.word 0x9bb1c4d3  ! 489: FCMPNE32	fcmpne32	%d38, %d50, %r13
	.word 0x00800001  ! 489: BN	bn  	<label_0x1>
	.word 0xa5a00552  ! 1: FSQRTd	fsqrt	
memptr_80_209:
	set 0x60140000, %r31
	.word 0xd2dfc283  ! 490: LDXA_R	ldxa	[%r31, %r3] 0x14, %r9
	.word 0x8584bc1f  ! 491: WRCCR_I	wr	%r18, 0x1c1f, %ccr
	.word 0xc1bfc3e0  ! 492: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd2dfdc42  ! 493: LDXA_R	ldxa	[%r31, %r2] 0xe2, %r9
	.word 0xe19fda00  ! 493: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_80_211:
	set 0x60740000, %r31
	.word 0xd2dfc3c1  ! 494: LDXA_R	ldxa	[%r31, %r1] 0x1e, %r9
	.word 0x8581b7b5  ! 495: WRCCR_I	wr	%r6, 0x17b5, %ccr
	.word 0x00800001  ! 496: BN	bn  	<label_0x1>
	.word 0xd297c6c3  ! 497: LDUHA_R	lduha	[%r31, %r3] 0x36, %r9
	.word 0x85846fa7  ! 497: WRCCR_I	wr	%r17, 0x0fa7, %ccr
	.word 0xc19fd960  ! 498: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc1bfdb60  ! 499: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd33fe0a0  ! 500: STDF_I	std	%f9, [0x00a0, %r31]
	.word 0xc1bfd960  ! 501: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fd960  ! 501: LDDFA_R	ldda	[%r31, %r0], %f0
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
	.word 0xc19fc2c0  ! 2: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd03fe1f0  ! 3: STD_I	std	%r8, [%r31 + 0x01f0]
	.word 0xd1e7c282  ! 4: CASA_I	casa	[%r31] 0x14, %r2, %r8
	.word 0x20800001  ! 5: BN	bn,a	<label_0x1>
	.word 0xc32fe150  ! 5: STXFSR_I	st-sfr	%f1, [0x0150, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_2) + 32, 16, 16)) -> intp(7,0,18,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_2)&0xffffffff) + 56, 16, 16)) -> intp(0,0,5,,,,,1)
#else
	set 0x575090ce, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7b284cd  ! 1: FCMPNE32	fcmpne32	%d10, %d44, %r19
intvec_40_2:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_40_3:
	.word 0x39400001  ! 6: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 7: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa1b444d3  ! 8: FCMPNE32	fcmpne32	%d48, %d50, %r16
	.word 0xa9a409c4  ! 9: FDIVd	fdivd	%f16, %f4, %f20
	.word 0x00800001  ! 9: BN	bn  	<label_0x1>
memptr_40_5:
	set 0x60340000, %r31
	.word 0xd3e7c380  ! 10: CASA_I	casa	[%r31] 0x1c, %r0, %r9
	.word 0x8580606d  ! 11: WRCCR_I	wr	%r1, 0x006d, %ccr
	.word 0xc19fdc00  ! 12: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd23fe030  ! 13: STD_I	std	%r9, [%r31 + 0x0030]
	.word 0xc1bfdb60  ! 13: STDFA_R	stda	%f0, [%r0, %r31]
memptr_40_6:
	set user_data_start, %r31
	.word 0xe19fc3e0  ! 14: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85827175  ! 15: WRCCR_I	wr	%r9, 0x1175, %ccr
	.word 0xc19fc2c0  ! 16: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfd920  ! 17: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x00800001  ! 17: BN	bn  	<label_0x1>
memptr_40_8:
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
	.word 0xa7b184ca  ! 1: FCMPNE32	fcmpne32	%d6, %d10, %r19
intvec_40_9:
	.word 0x9f8020e0  ! 18: SIR	sir	0x00e0
	.word 0x8584207f  ! 19: WRCCR_I	wr	%r16, 0x007f, %ccr
	.word 0x9f802fec  ! 20: SIR	sir	0x0fec
	.word 0xd11fe0d0  ! 21: LDDF_I	ldd	[%r31, 0x00d0], %f8
	.word 0x85847f24  ! 21: WRCCR_I	wr	%r17, 0x1f24, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_11:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_12) + 48, 16, 16)) -> intp(3,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_12)&0xffffffff) + 48, 16, 16)) -> intp(3,0,14,,,,,1)
#else
	set 0xdde04ca4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_12:
	.word 0x9f80287a  ! 22: SIR	sir	0x087a
	.word 0xc19fd920  ! 23: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x19400001  ! 24: FBPUGE	fbuge
	.word 0xa7b1c4c7  ! 25: FCMPNE32	fcmpne32	%d38, %d38, %r19
	.word 0x00800001  ! 25: BN	bn  	<label_0x1>
memptr_40_14:
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
intvec_40_15:
	.word 0xe73fe090  ! 26: STDF_I	std	%f19, [0x0090, %r31]
	.word 0x85816016  ! 27: WRCCR_I	wr	%r5, 0x0016, %ccr
	.word 0x39400001  ! 28: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe69fc723  ! 29: LDDA_R	ldda	[%r31, %r3] 0x39, %r19
	.word 0x8584ef9e  ! 29: WRCCR_I	wr	%r19, 0x0f9e, %ccr
	.word 0x20800001  ! 30: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 31: BN	bn,a	<label_0x1>
	.word 0xe19fda00  ! 32: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc19fc2c0  ! 33: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 33: BN	bn,a	<label_0x1>
	.word 0xe73fe170  ! 34: STDF_I	std	%f19, [0x0170, %r31]
	.word 0xe63fe010  ! 35: STD_I	std	%r19, [%r31 + 0x0010]
	.word 0xc1bfde00  ! 36: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe71fe1f0  ! 37: LDDF_I	ldd	[%r31, 0x01f0], %f19
	.word 0x20800001  ! 37: BN	bn,a	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_19:
memptr_40_20:
	set 0x60740000, %r31
	.word 0xa3a1c9ca  ! 38: FDIVd	fdivd	%f38, %f10, %f48
	.word 0x8580b4bf  ! 39: WRCCR_I	wr	%r2, 0x14bf, %ccr
	.word 0xe297d040  ! 40: LDUHA_R	lduha	[%r31, %r0] 0x82, %r17
	.word 0x91a189cc  ! 41: FDIVd	fdivd	%f6, %f12, %f8
	.word 0x8584e7eb  ! 41: WRCCR_I	wr	%r19, 0x07eb, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_22) + 8, 16, 16)) -> intp(3,0,0,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_22)&0xffffffff) + 8, 16, 16)) -> intp(7,0,0,,,,,1)
#else
	set 0xd920a4f3, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_22:
	.word 0xc1bfc3e0  ! 42: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x24cfc001  ! 43: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 45: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f802c33  ! 45: SIR	sir	0x0c33
	.word 0xc19fd920  ! 46: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xe93fe1c0  ! 48: STDF_I	std	%f20, [0x01c0, %r31]
	.word 0xe1bfc2c0  ! 49: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe897c602  ! 49: LDUHA_R	lduha	[%r31, %r2] 0x30, %r20
	.word 0xe897dd40  ! 50: LDUHA_R	lduha	[%r31, %r0] 0xea, %r20
	.word 0x20800001  ! 51: BN	bn,a	<label_0x1>
	.word 0x9f802030  ! 52: SIR	sir	0x0030
	.word 0x9f802120  ! 53: SIR	sir	0x0120
	.word 0xe19fdc00  ! 53: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_26) + 0, 16, 16)) -> intp(0,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_26)&0xffffffff) + 8, 16, 16)) -> intp(3,0,8,,,,,1)
#else
	set 0xf8f053cd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x97a489c5  ! 1: FDIVd	fdivd	%f18, %f36, %f42
intvec_40_26:
	.word 0xd31fe0c0  ! 54: LDDF_I	ldd	[%r31, 0x00c0], %f9
	.word 0xd3e7e002  ! 55: CASA_R	casa	[%r31] %asi, %r2, %r9
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd51fe000  ! 57: LDDF_I	ldd	[%r31, 0x0000], %f10
	.word 0x9f802224  ! 57: SIR	sir	0x0224
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_28) + 8, 16, 16)) -> intp(7,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_28)&0xffffffff) + 40, 16, 16)) -> intp(1,0,31,,,,,1)
#else
	set 0xa2f0ce87, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_28:
memptr_40_29:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_30) + 48, 16, 16)) -> intp(0,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_30)&0xffffffff) + 24, 16, 16)) -> intp(3,0,7,,,,,1)
#else
	set 0xdd40f5f0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803938  ! 1: SIR	sir	0x1938
intvec_40_30:
	.word 0x97b244c1  ! 58: FCMPNE32	fcmpne32	%d40, %d32, %r11
	.word 0x8581be0f  ! 59: WRCCR_I	wr	%r6, 0x1e0f, %ccr
	.word 0x97b244ca  ! 60: FCMPNE32	fcmpne32	%d40, %d10, %r11
	.word 0x99a449cc  ! 61: FDIVd	fdivd	%f48, %f12, %f12
	.word 0x8584bfad  ! 61: WRCCR_I	wr	%r18, 0x1fad, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f803970  ! 1: SIR	sir	0x1970
intvec_40_31:
	.word 0x39400001  ! 62: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87afca43  ! 63: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	.word 0xe19fc2c0  ! 64: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9a449cd  ! 65: FDIVd	fdivd	%f48, %f44, %f20
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_33:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_34) + 32, 16, 16)) -> intp(1,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_34)&0xffffffff) + 48, 16, 16)) -> intp(5,0,27,,,,,1)
#else
	set 0x298040e7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_34:
	.word 0xe89fc280  ! 66: LDDA_R	ldda	[%r31, %r0] 0x14, %r20
	.word 0x8581fca0  ! 67: WRCCR_I	wr	%r7, 0x1ca0, %ccr
	.word 0x9f802a59  ! 68: SIR	sir	0x0a59
	.word 0x9f802080  ! 69: SIR	sir	0x0080
	.word 0x9f803453  ! 69: SIR	sir	0x1453
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_36) + 24, 16, 16)) -> intp(2,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_36)&0xffffffff) + 32, 16, 16)) -> intp(2,0,11,,,,,1)
#else
	set 0x593091c4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_36:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a7c9c3  ! 71: FDIVd	fdivd	%f62, %f34, %f12
	.word 0xd83fe160  ! 72: STD_I	std	%r12, [%r31 + 0x0160]
	.word 0xa5a089cc  ! 73: FDIVd	fdivd	%f2, %f12, %f18
	.word 0x87afca41  ! 73: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0xe9e7c6c1  ! 74: CASA_I	casa	[%r31] 0x36, %r1, %r20
	.word 0x39400001  ! 75: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc2c0  ! 76: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f802010  ! 77: SIR	sir	0x0010
	.word 0xe1bfde00  ! 77: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe91fe180  ! 78: LDDF_I	ldd	[%r31, 0x0180], %f20
	.word 0x39400001  ! 79: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe897d160  ! 80: LDUHA_R	lduha	[%r31, %r0] 0x8b, %r20
	.word 0xc3efe190  ! 81: PREFETCHA_I	prefetcha	[%r31, + 0x0190] %asi, #one_read
	.word 0x87afca41  ! 81: FCMPd	fcmpd	%fcc<n>, %f62, %f32
memptr_40_40:
	set 0x60740000, %r31
	.word 0xd41fe000  ! 82: LDD_I	ldd	[%r31 + 0x0000], %r10
	.word 0x85807ef7  ! 83: WRCCR_I	wr	%r1, 0x1ef7, %ccr
	.word 0xc3efe070  ! 84: PREFETCHA_I	prefetcha	[%r31, + 0x0070] %asi, #one_read
	.word 0xd53fe010  ! 85: STDF_I	std	%f10, [0x0010, %r31]
	.word 0xd41fe030  ! 85: LDD_I	ldd	[%r31 + 0x0030], %r10
	.word 0xd51fe1e0  ! 86: LDDF_I	ldd	[%r31, 0x01e0], %f10
	.word 0x39400001  ! 87: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd497dd42  ! 88: LDUHA_R	lduha	[%r31, %r2] 0xea, %r10
	.word 0xd497c283  ! 89: LDUHA_R	lduha	[%r31, %r3] 0x14, %r10
	.word 0xc36fe1d0  ! 89: PREFETCH_I	prefetch	[%r31 + 0x01d0], #one_read
	.word 0xc19fd960  ! 90: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 91: BN	bn,a	<label_0x1>
	.word 0xc19fda00  ! 92: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fde00  ! 93: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfdc00  ! 93: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_44) + 0, 16, 16)) -> intp(4,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_44)&0xffffffff) + 16, 16, 16)) -> intp(4,0,20,,,,,1)
#else
	set 0xfbc0c365, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_40_44:
memptr_40_45:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_46) + 48, 16, 16)) -> intp(0,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_46)&0xffffffff) + 32, 16, 16)) -> intp(5,0,14,,,,,1)
#else
	set 0xb0479f, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803946  ! 1: SIR	sir	0x1946
intvec_40_46:
	.word 0xa3b4c4d2  ! 94: FCMPNE32	fcmpne32	%d50, %d18, %r17
	.word 0x858134de  ! 95: WRCCR_I	wr	%r4, 0x14de, %ccr
	.word 0x9f802f83  ! 96: SIR	sir	0x0f83
	.word 0xa5a149d0  ! 97: FDIVd	fdivd	%f36, %f16, %f18
	.word 0x8584abff  ! 97: WRCCR_I	wr	%r18, 0x0bff, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_47:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 99: BN	bn,a	<label_0x1>
	.word 0xe1bfdb60  ! 100: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa5b484d2  ! 101: FCMPNE32	fcmpne32	%d18, %d18, %r18
	.word 0x20800001  ! 101: BN	bn,a	<label_0x1>
	.word 0xc3efe130  ! 102: PREFETCHA_I	prefetcha	[%r31, + 0x0130] %asi, #one_read
	.word 0xa5a7c9c0  ! 103: FDIVd	fdivd	%f62, %f0, %f18
	.word 0xe19fdb60  ! 104: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe497d003  ! 105: LDUHA_R	lduha	[%r31, %r3] 0x80, %r18
	.word 0xc1bfde00  ! 105: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fd920  ! 106: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe5e7c542  ! 107: CASA_I	casa	[%r31] 0x2a, %r2, %r18
	.word 0x20800001  ! 108: BN	bn,a	<label_0x1>
	.word 0xc19fd960  ! 109: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe43fe0d0  ! 109: STD_I	std	%r18, [%r31 + 0x00d0]
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
intvec_40_51:
	.word 0x9f803e0d  ! 110: SIR	sir	0x1e0d
	.word 0x20800001  ! 111: BN	bn,a	<label_0x1>
	.word 0xd01fe060  ! 112: LDD_I	ldd	[%r31 + 0x0060], %r8
	.word 0x9f8024ff  ! 113: SIR	sir	0x04ff
	.word 0xe19fc3e0  ! 113: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd11fe000  ! 114: LDDF_I	ldd	[%r31, 0x0000], %f8
	.word 0x87afca41  ! 115: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0xc19fdb60  ! 116: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd09fc720  ! 117: LDDA_R	ldda	[%r31, %r0] 0x39, %r8
	.word 0x24cfc001  ! 117: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
memptr_40_54:
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
	.word 0x99b484c7  ! 1: FCMPNE32	fcmpne32	%d18, %d38, %r12
intvec_40_55:
	.word 0xd89fc2e1  ! 118: LDDA_R	ldda	[%r31, %r1] 0x17, %r12
	.word 0x8581fb60  ! 119: WRCCR_I	wr	%r7, 0x1b60, %ccr
	.word 0x97b4c4c3  ! 120: FCMPNE32	fcmpne32	%d50, %d34, %r11
	.word 0xc32fe0b0  ! 121: STXFSR_I	st-sfr	%f1, [0x00b0, %r31]
	.word 0x95a209d3  ! 121: FDIVd	fdivd	%f8, %f50, %f10
memptr_40_57:
	set user_data_start, %r31
	.word 0x20800001  ! 122: BN	bn,a	<label_0x1>
	.word 0x85853296  ! 123: WRCCR_I	wr	%r20, 0x1296, %ccr
	.word 0x9f802020  ! 124: SIR	sir	0x0020
	.word 0x20800001  ! 125: BN	bn,a	<label_0x1>
	.word 0xe13fe1c0  ! 125: STDF_I	std	%f16, [0x01c0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_59:
	.word 0xa9a449d4  ! 126: FDIVd	fdivd	%f48, %f20, %f20
	.word 0xe83fe110  ! 127: STD_I	std	%r20, [%r31 + 0x0110]
	.word 0xe19fda00  ! 128: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa7a1c9d1  ! 129: FDIVd	fdivd	%f38, %f48, %f50
	.word 0xc1bfdf20  ! 129: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f8020d0  ! 130: SIR	sir	0x00d0
	.word 0xe1bfdc00  ! 131: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xdb3fe000  ! 132: STDF_I	std	%f13, [0x0000, %r31]
	.word 0xdb1fe030  ! 133: LDDF_I	ldd	[%r31, 0x0030], %f13
	.word 0xc3efe180  ! 133: PREFETCHA_I	prefetcha	[%r31, + 0x0180] %asi, #one_read
	.word 0xc1bfc2c0  ! 134: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20800001  ! 135: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 136: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 137: BN	bn,a	<label_0x1>
	.word 0xc1bfc2c0  ! 137: STDFA_R	stda	%f0, [%r0, %r31]
memptr_40_62:
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
intvec_40_63:
	.word 0x20800001  ! 138: BN	bn,a	<label_0x1>
	.word 0x85843709  ! 139: WRCCR_I	wr	%r16, 0x1709, %ccr
	.word 0x9f802c96  ! 140: SIR	sir	0x0c96
	.word 0xe1bfdb60  ! 141: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa7b044c8  ! 141: FCMPNE32	fcmpne32	%d32, %d8, %r19
memptr_40_65:
	set 0x60740000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_66) + 16, 16, 16)) -> intp(2,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_66)&0xffffffff) + 16, 16, 16)) -> intp(0,0,20,,,,,1)
#else
	set 0xdee0f8ab, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_66:
	.word 0xc19fde00  ! 142: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8581ff87  ! 143: WRCCR_I	wr	%r7, 0x1f87, %ccr
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 145: BN	bn,a	<label_0x1>
	.word 0x8584612f  ! 145: WRCCR_I	wr	%r17, 0x012f, %ccr
	.word 0xd93fe0d0  ! 146: STDF_I	std	%f12, [0x00d0, %r31]
	.word 0xc19fd920  ! 147: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd93fe0a0  ! 148: STDF_I	std	%f12, [0x00a0, %r31]
	.word 0xc32fe1e0  ! 149: STXFSR_I	st-sfr	%f1, [0x01e0, %r31]
	.word 0xe19fc2c0  ! 149: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_68) + 32, 16, 16)) -> intp(5,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_68)&0xffffffff) + 56, 16, 16)) -> intp(0,0,31,,,,,1)
#else
	set 0xcfb01f28, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803195  ! 1: SIR	sir	0x1195
intvec_40_68:
	.word 0x19400001  ! 150: FBPUGE	fbuge
	.word 0x39400001  ! 151: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe23fe190  ! 152: STD_I	std	%r17, [%r31 + 0x0190]
	.word 0x9f80288f  ! 153: SIR	sir	0x088f
	.word 0x04cfc001  ! 153: BRLEZ	brlez,pt  	%r31,<label_0xfc001>
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
	.word 0xe297c721  ! 154: LDUHA_R	lduha	[%r31, %r1] 0x39, %r17
	.word 0xc19fd920  ! 155: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f8031c6  ! 156: SIR	sir	0x11c6
	.word 0xe8dfc382  ! 157: LDXA_R	ldxa	[%r31, %r2] 0x1c, %r20
	.word 0x00800001  ! 157: BN	bn  	<label_0x1>
	.word 0xc1bfdc00  ! 158: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe9e7c2c0  ! 159: CASA_I	casa	[%r31] 0x16, %r0, %r20
	.word 0xc32fe150  ! 160: STXFSR_I	st-sfr	%f1, [0x0150, %r31]
	.word 0xc19fc3e0  ! 161: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa9a7c9c1  ! 161: FDIVd	fdivd	%f62, %f32, %f20
memptr_40_72:
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
intvec_40_73:
	.word 0xc1bfdc00  ! 162: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8580f2d5  ! 163: WRCCR_I	wr	%r3, 0x12d5, %ccr
	.word 0xa3b284cc  ! 164: FCMPNE32	fcmpne32	%d10, %d12, %r17
	.word 0xe19fde00  ! 165: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x19400001  ! 165: FBPUGE	fbuge
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
intvec_40_75:
	.word 0xd53fe110  ! 166: STDF_I	std	%f10, [0x0110, %r31]
	.word 0x20800001  ! 167: BN	bn,a	<label_0x1>
	.word 0x9f80284e  ! 168: SIR	sir	0x084e
	.word 0xe89fc400  ! 169: LDDA_R	ldda	[%r31, %r0] 0x20, %r20
	.word 0x93b084c1  ! 169: FCMPNE32	fcmpne32	%d2, %d32, %r9
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_77:
memptr_40_78:
	set user_data_start, %r31
	.word 0x9f803c7a  ! 170: SIR	sir	0x1c7a
	.word 0x858536e5  ! 171: WRCCR_I	wr	%r20, 0x16e5, %ccr
	.word 0x20800001  ! 172: BN	bn,a	<label_0x1>
	.word 0x9f802e6a  ! 173: SIR	sir	0x0e6a
	.word 0xc1bfd920  ! 173: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_79:
	.word 0xa3a509c2  ! 174: FDIVd	fdivd	%f20, %f2, %f48
	.word 0x87afca43  ! 175: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	.word 0x20800001  ! 176: BN	bn,a	<label_0x1>
	.word 0x39400001  ! 177: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a7c9c1  ! 177: FDIVd	fdivd	%f62, %f32, %f16
	.word 0xe11fe080  ! 178: LDDF_I	ldd	[%r31, 0x0080], %f16
	.word 0xc1bfd960  ! 179: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe01fe170  ! 180: LDD_I	ldd	[%r31 + 0x0170], %r16
	.word 0xe03fe060  ! 181: STD_I	std	%r16, [%r31 + 0x0060]
	.word 0x00800001  ! 181: BN	bn  	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_82) + 0, 16, 16)) -> intp(3,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_82)&0xffffffff) + 32, 16, 16)) -> intp(4,0,16,,,,,1)
#else
	set 0x6cf0861d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_82:
	.word 0x97a409c5  ! 182: FDIVd	fdivd	%f16, %f36, %f42
	.word 0xc1bfd920  ! 183: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20800001  ! 184: BN	bn,a	<label_0x1>
	.word 0x9f802dfc  ! 185: SIR	sir	0x0dfc
	.word 0xc1bfd920  ! 185: STDFA_R	stda	%f0, [%r0, %r31]
memptr_40_84:
	set user_data_start, %r31
	.word 0xd7e7d002  ! 186: CASA_I	casa	[%r31] 0x80, %r2, %r11
	.word 0x858467e9  ! 187: WRCCR_I	wr	%r17, 0x07e9, %ccr
	.word 0xd61fe0f0  ! 188: LDD_I	ldd	[%r31 + 0x00f0], %r11
	.word 0xd61fe1b0  ! 189: LDD_I	ldd	[%r31 + 0x01b0], %r11
	.word 0xd6dfc600  ! 189: LDXA_R	ldxa	[%r31, %r0] 0x30, %r11
memptr_40_85:
	set 0x60540000, %r31
	.word 0xd7e7d041  ! 190: CASA_I	casa	[%r31] 0x82, %r1, %r11
	.word 0x8580ae60  ! 191: WRCCR_I	wr	%r2, 0x0e60, %ccr
	.word 0x20800001  ! 192: BN	bn,a	<label_0x1>
	.word 0xc3efe170  ! 193: PREFETCHA_I	prefetcha	[%r31, + 0x0170] %asi, #one_read
	.word 0x85846193  ! 193: WRCCR_I	wr	%r17, 0x0193, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_86) + 56, 16, 16)) -> intp(5,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_86)&0xffffffff) + 24, 16, 16)) -> intp(5,0,8,,,,,1)
#else
	set 0x72304ecd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x99b1c4d2  ! 1: FCMPNE32	fcmpne32	%d38, %d18, %r12
intvec_40_86:
	.word 0x9f8025c3  ! 194: SIR	sir	0x05c3
	.word 0xc36fe1e0  ! 195: PREFETCH_I	prefetch	[%r31 + 0x01e0], #one_read
	.word 0xe19fc2c0  ! 196: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802d39  ! 197: SIR	sir	0x0d39
	.word 0x19400001  ! 197: FBPUGE	fbuge
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_88) + 8, 16, 16)) -> intp(2,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_88)&0xffffffff) + 16, 16, 16)) -> intp(3,0,11,,,,,1)
#else
	set 0xe1c05b37, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_88:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd920  ! 199: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe61fe1b0  ! 200: LDD_I	ldd	[%r31 + 0x01b0], %r19
	.word 0x9f803f23  ! 201: SIR	sir	0x1f23
	.word 0xe1bfd920  ! 201: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fdb60  ! 202: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc36fe190  ! 203: PREFETCH_I	prefetch	[%r31 + 0x0190], #one_read
	.word 0xe297d160  ! 204: LDUHA_R	lduha	[%r31, %r0] 0x8b, %r17
	.word 0x20800001  ! 205: BN	bn,a	<label_0x1>
	.word 0xe3e7c2e2  ! 205: CASA_I	casa	[%r31] 0x17, %r2, %r17
memptr_40_91:
	set 0x60340000, %r31
	.word 0x20800001  ! 206: BN	bn,a	<label_0x1>
	.word 0x8584a086  ! 207: WRCCR_I	wr	%r18, 0x0086, %ccr
	.word 0xe23fe0f0  ! 208: STD_I	std	%r17, [%r31 + 0x00f0]
	.word 0xc19fdc00  ! 209: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8582b602  ! 209: WRCCR_I	wr	%r10, 0x1602, %ccr
memptr_40_93:
	set user_data_start, %r31
	.word 0xe19fde00  ! 210: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85816878  ! 211: WRCCR_I	wr	%r5, 0x0878, %ccr
	.word 0x20800001  ! 212: BN	bn,a	<label_0x1>
	.word 0xc1bfd920  ! 213: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x85827511  ! 213: WRCCR_I	wr	%r9, 0x1511, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_95:
	.word 0x20800001  ! 214: BN	bn,a	<label_0x1>
	.word 0x99a7c9c1  ! 215: FDIVd	fdivd	%f62, %f32, %f12
	.word 0x9f802fa0  ! 216: SIR	sir	0x0fa0
	.word 0xc19fdb60  ! 217: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc36fe1b0  ! 217: PREFETCH_I	prefetch	[%r31 + 0x01b0], #one_read
memptr_40_97:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_98) + 48, 16, 16)) -> intp(4,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_98)&0xffffffff) + 16, 16, 16)) -> intp(6,0,14,,,,,1)
#else
	set 0xcb706a61, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_98:
	.word 0xc1bfc2c0  ! 218: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x858167c5  ! 219: WRCCR_I	wr	%r5, 0x07c5, %ccr
	.word 0x19400001  ! 220: FBPUGE	fbuge
	.word 0xe1bfdc00  ! 221: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91a249c6  ! 221: FDIVd	fdivd	%f40, %f6, %f8
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_100) + 40, 16, 16)) -> intp(1,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_100)&0xffffffff) + 0, 16, 16)) -> intp(0,0,0,,,,,1)
#else
	set 0x298004b1, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803028  ! 1: SIR	sir	0x1028
intvec_40_100:
memptr_40_101:
	set 0x60340000, %r31
	.word 0xa9a089d3  ! 222: FDIVd	fdivd	%f2, %f50, %f20
	.word 0x85812dc3  ! 223: WRCCR_I	wr	%r4, 0x0dc3, %ccr
	.word 0xd33fe1e0  ! 224: STDF_I	std	%f9, [0x01e0, %r31]
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8581aa72  ! 225: WRCCR_I	wr	%r6, 0x0a72, %ccr
	.word 0xc1bfdf20  ! 226: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc6c1  ! 228: LDDA_R	ldda	[%r31, %r1] 0x36, %r12
	.word 0x20800001  ! 229: BN	bn,a	<label_0x1>
	.word 0xd93fe040  ! 229: STDF_I	std	%f12, [0x0040, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa1b284d0  ! 1: FCMPNE32	fcmpne32	%d10, %d16, %r16
intvec_40_103:
memptr_40_104:
	set 0x60740000, %r31
	.word 0x19400001  ! 230: FBPUGE	fbuge
	.word 0x8584a90b  ! 231: WRCCR_I	wr	%r18, 0x090b, %ccr
	.word 0xe93fe1c0  ! 232: STDF_I	std	%f20, [0x01c0, %r31]
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x85836a17  ! 233: WRCCR_I	wr	%r13, 0x0a17, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_106) + 40, 16, 16)) -> intp(3,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_106)&0xffffffff) + 8, 16, 16)) -> intp(2,0,28,,,,,1)
#else
	set 0xb1a0a56e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_106:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_107:
	.word 0x97a2c9c3  ! 234: FDIVd	fdivd	%f42, %f34, %f42
	.word 0xc1bfdb60  ! 235: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x39400001  ! 236: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5b044d4  ! 237: FCMPNE32	fcmpne32	%d32, %d20, %r18
	.word 0xe19fd920  ! 237: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_40_109:
	set 0x60340000, %r31
	.word 0x20800001  ! 238: BN	bn,a	<label_0x1>
	.word 0x858525e2  ! 239: WRCCR_I	wr	%r20, 0x05e2, %ccr
	.word 0x20800001  ! 240: BN	bn,a	<label_0x1>
	.word 0xc1bfde00  ! 241: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x8580aa42  ! 241: WRCCR_I	wr	%r2, 0x0a42, %ccr
memptr_40_111:
	set user_data_start, %r31
	.word 0xe1bfdb60  ! 242: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8582adb6  ! 243: WRCCR_I	wr	%r10, 0x0db6, %ccr
	.word 0x20800001  ! 244: BN	bn,a	<label_0x1>
	.word 0xc1bfde00  ! 245: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fde00  ! 245: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfd920  ! 246: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe83fe0b0  ! 247: STD_I	std	%r20, [%r31 + 0x00b0]
	.word 0xe81fe1e0  ! 248: LDD_I	ldd	[%r31 + 0x01e0], %r20
	.word 0xe19fc2c0  ! 249: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe9e7e001  ! 249: CASA_R	casa	[%r31] %asi, %r1, %r20
	.word 0x20800001  ! 250: BN	bn,a	<label_0x1>
	.word 0xe1bfd960  ! 251: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe1bfd960  ! 252: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fda00  ! 253: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fd920  ! 253: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 254: BN	bn,a	<label_0x1>
	.word 0xc19fc3e0  ! 255: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe5e7c541  ! 256: CASA_I	casa	[%r31] 0x2a, %r1, %r18
	.word 0xc19fc2c0  ! 257: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 257: BN	bn,a	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_113:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_114) + 32, 16, 16)) -> intp(0,0,18,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_114)&0xffffffff) + 48, 16, 16)) -> intp(1,0,3,,,,,1)
#else
	set 0x21905c6b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa1a249c1  ! 1: FDIVd	fdivd	%f40, %f32, %f16
intvec_40_114:
	.word 0x9f803124  ! 258: SIR	sir	0x1124
	.word 0x39400001  ! 259: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a409d2  ! 260: FDIVd	fdivd	%f16, %f18, %f12
	.word 0x97b284cc  ! 261: FCMPNE32	fcmpne32	%d10, %d12, %r11
	.word 0xa7a1c9cb  ! 261: FDIVd	fdivd	%f38, %f42, %f50
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_115:
	.word 0xe7e7d160  ! 262: CASA_I	casa	[%r31] 0x8b, %r0, %r19
	.word 0xa7b7c4c1  ! 263: FCMPNE32	fcmpne32	%d62, %d32, %r19
	.word 0x93b0c4d2  ! 264: FCMPNE32	fcmpne32	%d34, %d18, %r9
	.word 0xd29fd041  ! 265: LDDA_R	ldda	[%r31, %r1] 0x82, %r9
	.word 0xd3e7e001  ! 265: CASA_R	casa	[%r31] %asi, %r1, %r9
	.word 0xd23fe000  ! 266: STD_I	std	%r9, [%r31 + 0x0000]
	.word 0xc19fdc00  ! 267: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd3e7c2e0  ! 268: CASA_I	casa	[%r31] 0x17, %r0, %r9
	.word 0xd31fe0d0  ! 269: LDDF_I	ldd	[%r31, 0x00d0], %f9
	.word 0xd21fe0f0  ! 269: LDD_I	ldd	[%r31 + 0x00f0], %r9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_118) + 32, 16, 16)) -> intp(3,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_118)&0xffffffff) + 56, 16, 16)) -> intp(6,0,19,,,,,1)
#else
	set 0xe48057d4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_118:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f8026da  ! 1: SIR	sir	0x06da
intvec_40_119:
	.word 0x39400001  ! 270: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x24cfc001  ! 271: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x9bb204d3  ! 272: FCMPNE32	fcmpne32	%d8, %d50, %r13
	.word 0x9f8027c2  ! 273: SIR	sir	0x07c2
	.word 0xe5e7e001  ! 273: CASA_R	casa	[%r31] %asi, %r1, %r18
	.word 0xe19fdf20  ! 274: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x04cfc001  ! 275: BRLEZ	brlez,pt  	%r31,<label_0xfc001>
	.word 0x00800001  ! 276: BN	bn  	<label_0x1>
	.word 0xe1bfde00  ! 277: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa1b7c4c1  ! 277: FCMPNE32	fcmpne32	%d62, %d32, %r16
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_121:
	.word 0x9ba489d0  ! 278: FDIVd	fdivd	%f18, %f16, %f44
	.word 0xd03fe0c0  ! 279: STD_I	std	%r8, [%r31 + 0x00c0]
	.word 0x20800001  ! 280: BN	bn,a	<label_0x1>
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fc2c0  ! 281: LDDFA_R	ldda	[%r31, %r0], %f16
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_123:
	.word 0xc1bfdf20  ! 282: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x39400001  ! 283: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 284: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 285: BN	bn,a	<label_0x1>
	.word 0xd43fe0b0  ! 285: STD_I	std	%r10, [%r31 + 0x00b0]
	.word 0xc19fc3e0  ! 286: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x95b7c4c2  ! 287: FCMPNE32	fcmpne32	%d62, %d2, %r10
	.word 0xc1bfda00  ! 288: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfde00  ! 289: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fda00  ! 289: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_40_126:
	set user_data_start, %r31
	.word 0x20800001  ! 290: BN	bn,a	<label_0x1>
	.word 0x858535c0  ! 291: WRCCR_I	wr	%r20, 0x15c0, %ccr
	.word 0xc19fdb60  ! 292: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfdb60  ! 293: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x85842e20  ! 293: WRCCR_I	wr	%r16, 0x0e20, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa3b4c4cd  ! 1: FCMPNE32	fcmpne32	%d50, %d44, %r17
intvec_40_127:
	.word 0xa5a309ca  ! 294: FDIVd	fdivd	%f12, %f10, %f18
	.word 0x87afca41  ! 295: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0xc32fe080  ! 296: STXFSR_I	st-sfr	%f1, [0x0080, %r31]
	.word 0xa7b044cb  ! 297: FCMPNE32	fcmpne32	%d32, %d42, %r19
	.word 0xd03fe070  ! 297: STD_I	std	%r8, [%r31 + 0x0070]
memptr_40_128:
	set 0x60740000, %r31
	.word 0xd13fe0b0  ! 298: STDF_I	std	%f8, [0x00b0, %r31]
	.word 0x8584f3b3  ! 299: WRCCR_I	wr	%r19, 0x13b3, %ccr
	.word 0xd097d002  ! 300: LDUHA_R	lduha	[%r31, %r2] 0x80, %r8
	.word 0xc3efe130  ! 301: PREFETCHA_I	prefetcha	[%r31, + 0x0130] %asi, #one_read
	.word 0xd097c403  ! 301: LDUHA_R	lduha	[%r31, %r3] 0x20, %r8
	.word 0xc1bfda00  ! 302: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x91a7c9c3  ! 303: FDIVd	fdivd	%f62, %f34, %f8
	.word 0xe19fda00  ! 304: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 305: BN	bn,a	<label_0x1>
	.word 0xe1bfd960  ! 305: STDFA_R	stda	%f16, [%r0, %r31]
memptr_40_130:
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
	.word 0x9f803bee  ! 1: SIR	sir	0x1bee
intvec_40_131:
	.word 0xe19fdb60  ! 306: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85853f10  ! 307: WRCCR_I	wr	%r20, 0x1f10, %ccr
	.word 0xa7a309ca  ! 308: FDIVd	fdivd	%f12, %f10, %f50
	.word 0xc19fd920  ! 309: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9bb184cb  ! 309: FCMPNE32	fcmpne32	%d6, %d42, %r13
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_133:
	.word 0xc19fdf20  ! 310: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfdc00  ! 311: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f80221a  ! 312: SIR	sir	0x021a
	.word 0xe1bfde00  ! 313: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fd920  ! 313: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_40_134:
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
intvec_40_135:
	.word 0xe697c602  ! 314: LDUHA_R	lduha	[%r31, %r2] 0x30, %r19
	.word 0x8582b03e  ! 315: WRCCR_I	wr	%r10, 0x103e, %ccr
	.word 0x19400001  ! 316: FBPUGE	fbuge
	.word 0xc32fe0d0  ! 317: STXFSR_I	st-sfr	%f1, [0x00d0, %r31]
	.word 0x9f80216c  ! 317: SIR	sir	0x016c
	.word 0xc3efe0c0  ! 318: PREFETCHA_I	prefetcha	[%r31, + 0x00c0] %asi, #one_read
	.word 0xe1bfdb60  ! 319: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8021d0  ! 320: SIR	sir	0x01d0
	.word 0xe3e7c723  ! 321: CASA_I	casa	[%r31] 0x39, %r3, %r17
	.word 0xe3e7d002  ! 321: CASA_I	casa	[%r31] 0x80, %r2, %r17
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_136) + 32, 16, 16)) -> intp(4,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_136)&0xffffffff) + 48, 16, 16)) -> intp(5,0,20,,,,,1)
#else
	set 0xac50c552, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_136:
	.word 0x97b2c4cb  ! 322: FCMPNE32	fcmpne32	%d42, %d42, %r11
	.word 0xc1bfda00  ! 323: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fdb60  ! 324: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9ba409ca  ! 325: FDIVd	fdivd	%f16, %f10, %f44
	.word 0xc1bfdc00  ! 325: STDFA_R	stda	%f0, [%r0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_138) + 48, 16, 16)) -> intp(6,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_138)&0xffffffff) + 16, 16, 16)) -> intp(2,0,22,,,,,1)
#else
	set 0x430e4fd, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803dfc  ! 1: SIR	sir	0x1dfc
intvec_40_138:
	.word 0x99b204ca  ! 326: FCMPNE32	fcmpne32	%d8, %d10, %r12
	.word 0xdbe7e001  ! 327: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0xdadfd161  ! 328: LDXA_R	ldxa	[%r31, %r1] 0x8b, %r13
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a7c9c2  ! 329: FDIVd	fdivd	%f62, %f2, %f16
	.word 0xc3efe0e0  ! 330: PREFETCHA_I	prefetcha	[%r31, + 0x00e0] %asi, #one_read
	.word 0x20800001  ! 331: BN	bn,a	<label_0x1>
	.word 0xc19fdf20  ! 332: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe09fc602  ! 333: LDDA_R	ldda	[%r31, %r2] 0x30, %r16
	.word 0xe19fdf20  ! 333: LDDFA_R	ldda	[%r31, %r0], %f16
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_139:
	.word 0xe19fdf20  ! 334: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x24cfc001  ! 335: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x97b504d0  ! 336: FCMPNE32	fcmpne32	%d20, %d16, %r11
	.word 0xe19fdb60  ! 337: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x99b304c5  ! 337: FCMPNE32	fcmpne32	%d12, %d36, %r12
	.word 0x00800001  ! 338: BN	bn  	<label_0x1>
	.word 0xd9e7c2c3  ! 339: CASA_I	casa	[%r31] 0x16, %r3, %r12
	.word 0xc3efe1b0  ! 340: PREFETCHA_I	prefetcha	[%r31, + 0x01b0] %asi, #one_read
	.word 0x00800001  ! 341: BN	bn  	<label_0x1>
	.word 0x99a7c9c0  ! 341: FDIVd	fdivd	%f62, %f0, %f12
memptr_40_141:
	set user_data_start, %r31
	.word 0xd89fc381  ! 342: LDDA_R	ldda	[%r31, %r1] 0x1c, %r12
	.word 0x8580e6cb  ! 343: WRCCR_I	wr	%r3, 0x06cb, %ccr
	.word 0xc19fdf20  ! 344: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f802010  ! 345: SIR	sir	0x0010
	.word 0x858362c5  ! 345: WRCCR_I	wr	%r13, 0x02c5, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_143:
memptr_40_144:
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
	.word 0x93b244cb  ! 1: FCMPNE32	fcmpne32	%d40, %d42, %r9
intvec_40_145:
	.word 0x97b104ca  ! 346: FCMPNE32	fcmpne32	%d4, %d10, %r11
	.word 0x8581e88a  ! 347: WRCCR_I	wr	%r7, 0x088a, %ccr
	.word 0x9f802d60  ! 348: SIR	sir	0x0d60
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803e46  ! 349: SIR	sir	0x1e46
	.word 0xd49fc543  ! 350: LDDA_R	ldda	[%r31, %r3] 0x2a, %r10
	.word 0x39400001  ! 351: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc2c0  ! 352: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd43fe0d0  ! 353: STD_I	std	%r10, [%r31 + 0x00d0]
	.word 0xe1bfdc00  ! 353: STDFA_R	stda	%f16, [%r0, %r31]
memptr_40_148:
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
intvec_40_149:
	.word 0xc1bfdb60  ! 354: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x858135c4  ! 355: WRCCR_I	wr	%r4, 0x15c4, %ccr
	.word 0x9bb244d1  ! 356: FCMPNE32	fcmpne32	%d40, %d48, %r13
	.word 0xe1bfdc00  ! 357: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x858375bb  ! 357: WRCCR_I	wr	%r13, 0x15bb, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_151:
	.word 0x93a149cc  ! 358: FDIVd	fdivd	%f36, %f12, %f40
	.word 0xc19fdf20  ! 359: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 360: BN	bn,a	<label_0x1>
	.word 0x39400001  ! 361: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 361: BN	bn,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_152) + 8, 16, 16)) -> intp(1,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_152)&0xffffffff) + 24, 16, 16)) -> intp(6,0,14,,,,,1)
#else
	set 0x6130aef8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_152:
	.word 0x9f802050  ! 362: SIR	sir	0x0050
	.word 0x24cfc001  ! 363: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x39400001  ! 364: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fe0a0  ! 365: STXFSR_I	st-sfr	%f1, [0x00a0, %r31]
	.word 0xd9e7e003  ! 365: CASA_R	casa	[%r31] %asi, %r3, %r12
memptr_40_153:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_154) + 0, 16, 16)) -> intp(4,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_154)&0xffffffff) + 56, 16, 16)) -> intp(6,0,0,,,,,1)
#else
	set 0xc490caed, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93b284d2  ! 1: FCMPNE32	fcmpne32	%d10, %d18, %r9
intvec_40_154:
	.word 0xc19fd920  ! 366: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8581e5d7  ! 367: WRCCR_I	wr	%r7, 0x05d7, %ccr
	.word 0xa5a409d0  ! 368: FDIVd	fdivd	%f16, %f16, %f18
	.word 0xc19fc3e0  ! 369: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8580fff8  ! 369: WRCCR_I	wr	%r3, 0x1ff8, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_156) + 32, 16, 16)) -> intp(2,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_156)&0xffffffff) + 48, 16, 16)) -> intp(6,0,9,,,,,1)
#else
	set 0x8550ea67, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_40_156:
memptr_40_157:
	set 0x60740000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_158) + 16, 16, 16)) -> intp(0,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_158)&0xffffffff) + 24, 16, 16)) -> intp(1,0,18,,,,,1)
#else
	set 0x2a60e8e8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_40_158:
	.word 0x19400001  ! 370: FBPUGE	fbuge
	.word 0x858463d8  ! 371: WRCCR_I	wr	%r17, 0x03d8, %ccr
	.word 0x9f803b73  ! 372: SIR	sir	0x1b73
	.word 0x95b304cd  ! 373: FCMPNE32	fcmpne32	%d12, %d44, %r10
	.word 0x8584adac  ! 373: WRCCR_I	wr	%r18, 0x0dac, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_160) + 0, 16, 16)) -> intp(3,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_160)&0xffffffff) + 0, 16, 16)) -> intp(4,0,31,,,,,1)
#else
	set 0xf390985c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_160:
memptr_40_161:
	set 0x60540000, %r31
	.word 0x9f802b3e  ! 374: SIR	sir	0x0b3e
	.word 0x85846e72  ! 375: WRCCR_I	wr	%r17, 0x0e72, %ccr
	.word 0xc19fc2c0  ! 376: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f802d64  ! 377: SIR	sir	0x0d64
	.word 0xc1bfde00  ! 377: STDFA_R	stda	%f0, [%r0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_162) + 56, 16, 16)) -> intp(1,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_162)&0xffffffff) + 0, 16, 16)) -> intp(3,0,14,,,,,1)
#else
	set 0xe320d551, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5b444d2  ! 1: FCMPNE32	fcmpne32	%d48, %d18, %r18
intvec_40_162:
	.word 0x9f80398a  ! 378: SIR	sir	0x198a
	.word 0xe19fc2c0  ! 379: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfdb60  ! 380: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa3a1c9d4  ! 381: FDIVd	fdivd	%f38, %f20, %f48
	.word 0xe1bfdf20  ! 381: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe3e7dc41  ! 382: CASA_I	casa	[%r31] 0xe2, %r1, %r17
	.word 0xe1bfd920  ! 383: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8020f0  ! 384: SIR	sir	0x00f0
	.word 0x9f802010  ! 385: SIR	sir	0x0010
	.word 0xe3e7d920  ! 385: CASA_I	casa	[%r31] 0xc9, %r0, %r17
	.word 0x00800001  ! 386: BN	bn  	<label_0x1>
	.word 0xc1bfdf20  ! 387: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x00800001  ! 388: BN	bn  	<label_0x1>
	.word 0xc19fdf20  ! 389: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fc2c0  ! 389: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe497d143  ! 390: LDUHA_R	lduha	[%r31, %r3] 0x8a, %r18
	.word 0xe19fdf20  ! 391: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fd960  ! 392: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc3efe150  ! 393: PREFETCHA_I	prefetcha	[%r31, + 0x0150] %asi, #one_read
	.word 0xc1bfda00  ! 393: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_165:
memptr_40_166:
	set 0x60740000, %r31
	.word 0xa3b044d1  ! 394: FCMPNE32	fcmpne32	%d32, %d48, %r17
	.word 0x8584b2fc  ! 395: WRCCR_I	wr	%r18, 0x12fc, %ccr
	.word 0xe29fc540  ! 396: LDDA_R	ldda	[%r31, %r0] 0x2a, %r17
	.word 0xa3a489d3  ! 397: FDIVd	fdivd	%f18, %f50, %f48
	.word 0x8582ad71  ! 397: WRCCR_I	wr	%r10, 0x0d71, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_168) + 32, 16, 16)) -> intp(0,0,10,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_168)&0xffffffff) + 8, 16, 16)) -> intp(7,0,24,,,,,1)
#else
	set 0xef306592, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3a289c6  ! 1: FDIVd	fdivd	%f10, %f6, %f48
intvec_40_168:
	.word 0xe19fdb60  ! 398: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfde00  ! 399: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x39400001  ! 400: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfda00  ! 401: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa1b404d2  ! 401: FCMPNE32	fcmpne32	%d16, %d18, %r16
memptr_40_169:
	set 0x60140000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_170) + 8, 16, 16)) -> intp(3,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_170)&0xffffffff) + 0, 16, 16)) -> intp(3,0,5,,,,,1)
#else
	set 0x1040b38b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803d5f  ! 1: SIR	sir	0x1d5f
intvec_40_170:
	.word 0xc3efe070  ! 402: PREFETCHA_I	prefetcha	[%r31, + 0x0070] %asi, #one_read
	.word 0x85842ca2  ! 403: WRCCR_I	wr	%r16, 0x0ca2, %ccr
	.word 0xa5b1c4d0  ! 404: FCMPNE32	fcmpne32	%d38, %d16, %r18
	.word 0x9f802030  ! 405: SIR	sir	0x0030
	.word 0x85817755  ! 405: WRCCR_I	wr	%r5, 0x1755, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_172) + 48, 16, 16)) -> intp(4,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_172)&0xffffffff) + 24, 16, 16)) -> intp(0,0,18,,,,,1)
#else
	set 0x20701405, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_172:
	.word 0x9f8021e0  ! 406: SIR	sir	0x01e0
	.word 0xd3e7d101  ! 407: CASA_I	casa	[%r31] 0x88, %r1, %r9
	.word 0x39400001  ! 408: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd53fe1d0  ! 409: STDF_I	std	%f10, [0x01d0, %r31]
	.word 0x91a4c9d1  ! 409: FDIVd	fdivd	%f50, %f48, %f8
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_174) + 32, 16, 16)) -> intp(1,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_174)&0xffffffff) + 8, 16, 16)) -> intp(3,0,26,,,,,1)
#else
	set 0x8c80f886, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_174:
	.word 0x9f802050  ! 410: SIR	sir	0x0050
	.word 0x20800001  ! 411: BN	bn,a	<label_0x1>
	.word 0xa5a2c9c4  ! 412: FDIVd	fdivd	%f42, %f4, %f18
	.word 0xe53fe050  ! 413: STDF_I	std	%f18, [0x0050, %r31]
	.word 0xc1bfd960  ! 413: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f8020f0  ! 414: SIR	sir	0x00f0
	.word 0xe43fe050  ! 415: STD_I	std	%r18, [%r31 + 0x0050]
	.word 0x00800001  ! 416: BN	bn  	<label_0x1>
	.word 0xe4dfdd40  ! 417: LDXA_R	ldxa	[%r31, %r0] 0xea, %r18
	.word 0x00800001  ! 417: BN	bn  	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_176) + 40, 16, 16)) -> intp(2,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_176)&0xffffffff) + 24, 16, 16)) -> intp(1,0,6,,,,,1)
#else
	set 0x54005f2, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x91b504c6  ! 1: FCMPNE32	fcmpne32	%d20, %d6, %r8
intvec_40_176:
	.word 0xa7a209cc  ! 418: FDIVd	fdivd	%f8, %f12, %f50
	.word 0x39400001  ! 419: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe7e7c602  ! 420: CASA_I	casa	[%r31] 0x30, %r2, %r19
	.word 0x99a409d4  ! 421: FDIVd	fdivd	%f16, %f20, %f12
	.word 0x87afca42  ! 421: FCMPd	fcmpd	%fcc<n>, %f62, %f2
memptr_40_177:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_178) + 48, 16, 16)) -> intp(4,0,10,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_178)&0xffffffff) + 56, 16, 16)) -> intp(1,0,20,,,,,1)
#else
	set 0x4040db12, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_178:
	.word 0xd81fe140  ! 422: LDD_I	ldd	[%r31 + 0x0140], %r12
	.word 0x85846473  ! 423: WRCCR_I	wr	%r17, 0x0473, %ccr
	.word 0xa1b144d0  ! 424: FCMPNE32	fcmpne32	%d36, %d16, %r16
	.word 0xc32fe020  ! 425: STXFSR_I	st-sfr	%f1, [0x0020, %r31]
	.word 0x8585254f  ! 425: WRCCR_I	wr	%r20, 0x054f, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_180) + 56, 16, 16)) -> intp(1,0,7,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_180)&0xffffffff) + 48, 16, 16)) -> intp(5,0,18,,,,,1)
#else
	set 0x9090cb21, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f8031c3  ! 1: SIR	sir	0x11c3
intvec_40_180:
	.word 0xda3fe0a0  ! 426: STD_I	std	%r13, [%r31 + 0x00a0]
	.word 0xc36fe190  ! 427: PREFETCH_I	prefetch	[%r31 + 0x0190], #one_read
	.word 0x39400001  ! 428: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd5e7dc41  ! 429: CASA_I	casa	[%r31] 0xe2, %r1, %r10
	.word 0x9f803670  ! 429: SIR	sir	0x1670
	.word 0xc3efe060  ! 430: PREFETCHA_I	prefetcha	[%r31, + 0x0060] %asi, #one_read
	.word 0xc19fdf20  ! 431: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe49fd163  ! 432: LDDA_R	ldda	[%r31, %r3] 0x8b, %r18
	.word 0xc3efe0b0  ! 433: PREFETCHA_I	prefetcha	[%r31, + 0x00b0] %asi, #one_read
	.word 0xe497c6c0  ! 433: LDUHA_R	lduha	[%r31, %r0] 0x36, %r18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_183:
	.word 0xc19fde00  ! 434: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fdc00  ! 435: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x39400001  ! 436: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 437: BN	bn,a	<label_0x1>
	.word 0x91b084c7  ! 437: FCMPNE32	fcmpne32	%d2, %d38, %r8
memptr_40_185:
	set 0x60540000, %r31
	.word 0xd01fe1d0  ! 438: LDD_I	ldd	[%r31 + 0x01d0], %r8
	.word 0x8584e8a7  ! 439: WRCCR_I	wr	%r19, 0x08a7, %ccr
	.word 0xd11fe080  ! 440: LDDF_I	ldd	[%r31, 0x0080], %f8
	.word 0xd03fe1b0  ! 441: STD_I	std	%r8, [%r31 + 0x01b0]
	.word 0x8584edbf  ! 441: WRCCR_I	wr	%r19, 0x0dbf, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_186) + 32, 16, 16)) -> intp(6,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_186)&0xffffffff) + 24, 16, 16)) -> intp(1,0,7,,,,,1)
#else
	set 0x1a009e04, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x93a309d3  ! 1: FDIVd	fdivd	%f12, %f50, %f40
intvec_40_186:
memptr_40_187:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_188) + 0, 16, 16)) -> intp(3,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_188)&0xffffffff) + 40, 16, 16)) -> intp(4,0,23,,,,,1)
#else
	set 0x47f0c8b4, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_188:
	.word 0x9f803bc5  ! 442: SIR	sir	0x1bc5
	.word 0x85806bc5  ! 443: WRCCR_I	wr	%r1, 0x0bc5, %ccr
	.word 0x19400001  ! 444: FBPUGE	fbuge
	.word 0x9f8036b4  ! 445: SIR	sir	0x16b4
	.word 0x8581a090  ! 445: WRCCR_I	wr	%r6, 0x0090, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa5b0c4d1  ! 1: FCMPNE32	fcmpne32	%d34, %d48, %r18
intvec_40_189:
	.word 0xc19fdc00  ! 446: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 447: BN	bn,a	<label_0x1>
	.word 0x39400001  ! 448: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfda00  ! 449: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x97b084d1  ! 449: FCMPNE32	fcmpne32	%d2, %d48, %r11
	.word 0xe31fe020  ! 450: LDDF_I	ldd	[%r31, 0x0020], %f17
	.word 0x20800001  ! 451: BN	bn,a	<label_0x1>
	.word 0xe19fdb60  ! 452: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802130  ! 453: SIR	sir	0x0130
	.word 0xe1bfdb60  ! 453: STDFA_R	stda	%f16, [%r0, %r31]
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
intvec_40_191:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_192) + 24, 16, 16)) -> intp(1,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_192)&0xffffffff) + 8, 16, 16)) -> intp(4,0,12,,,,,1)
#else
	set 0x3e303b83, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_192:
	.word 0xa1a409c3  ! 454: FDIVd	fdivd	%f16, %f34, %f16
	.word 0xa3b7c4c1  ! 455: FCMPNE32	fcmpne32	%d62, %d32, %r17
	.word 0x91b404cd  ! 456: FCMPNE32	fcmpne32	%d16, %d44, %r8
	.word 0xa1b2c4c3  ! 457: FCMPNE32	fcmpne32	%d42, %d34, %r16
	.word 0x9f8024af  ! 457: SIR	sir	0x04af
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_194) + 16, 16, 16)) -> intp(0,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_194)&0xffffffff) + 56, 16, 16)) -> intp(6,0,30,,,,,1)
#else
	set 0x2d5017ee, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_194:
	.word 0x9f802010  ! 458: SIR	sir	0x0010
	.word 0x9bb7c4c1  ! 459: FCMPNE32	fcmpne32	%d62, %d32, %r13
	.word 0xa9b204c7  ! 460: FCMPNE32	fcmpne32	%d8, %d38, %r20
	.word 0xc3efe1c0  ! 461: PREFETCHA_I	prefetcha	[%r31, + 0x01c0] %asi, #one_read
	.word 0x9f80385a  ! 461: SIR	sir	0x185a
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_196) + 32, 16, 16)) -> intp(0,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_40_196)&0xffffffff) + 32, 16, 16)) -> intp(7,0,6,,,,,1)
#else
	set 0x1460828b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_40_196:
	.word 0xe83fe060  ! 462: STD_I	std	%r20, [%r31 + 0x0060]
	.word 0xe9e7e003  ! 463: CASA_R	casa	[%r31] %asi, %r3, %r20
	.word 0x9f803840  ! 464: SIR	sir	0x1840
	.word 0xe8dfc3c3  ! 465: LDXA_R	ldxa	[%r31, %r3] 0x1e, %r20
	.word 0xa9b7c4c1  ! 465: FCMPNE32	fcmpne32	%d62, %d32, %r20
memptr_40_198:
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
	.word 0x9f8039c0  ! 1: SIR	sir	0x19c0
intvec_40_199:
	.word 0x9f802020  ! 466: SIR	sir	0x0020
	.word 0x85853e7c  ! 467: WRCCR_I	wr	%r20, 0x1e7c, %ccr
	.word 0x19400001  ! 468: FBPUGE	fbuge
	.word 0xdbe7c380  ! 469: CASA_I	casa	[%r31] 0x1c, %r0, %r13
	.word 0x39400001  ! 469: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdf20  ! 470: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc36fe080  ! 471: PREFETCH_I	prefetch	[%r31 + 0x0080], #one_read
	.word 0xc32fe050  ! 472: STXFSR_I	st-sfr	%f1, [0x0050, %r31]
	.word 0xe1bfdb60  ! 473: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8021d0  ! 473: SIR	sir	0x01d0
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_201:
memptr_40_202:
	set 0x60140000, %r31
	.word 0x9bb404c2  ! 474: FCMPNE32	fcmpne32	%d16, %d2, %r13
	.word 0x8584a29c  ! 475: WRCCR_I	wr	%r18, 0x029c, %ccr
	.word 0xc1bfd920  ! 476: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x97b204ca  ! 477: FCMPNE32	fcmpne32	%d8, %d10, %r11
	.word 0x85852e3a  ! 477: WRCCR_I	wr	%r20, 0x0e3a, %ccr
	.word 0xc32fe0c0  ! 478: STXFSR_I	st-sfr	%f1, [0x00c0, %r31]
	.word 0x00800001  ! 479: BN	bn  	<label_0x1>
	.word 0x00800001  ! 480: BN	bn  	<label_0x1>
	.word 0xd73fe190  ! 481: STDF_I	std	%f11, [0x0190, %r31]
	.word 0xe19fdf20  ! 481: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_40_205:
	set 0x60140000, %r31
	.word 0xd7e7c601  ! 482: CASA_I	casa	[%r31] 0x30, %r1, %r11
	.word 0x8581ee08  ! 483: WRCCR_I	wr	%r7, 0x0e08, %ccr
	.word 0xd69fd060  ! 484: LDDA_R	ldda	[%r31, %r0] 0x83, %r11
	.word 0xd7e7c283  ! 485: CASA_I	casa	[%r31] 0x14, %r3, %r11
	.word 0xd6dfd921  ! 485: LDXA_R	ldxa	[%r31, %r1] 0xc9, %r11
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_40_207:
	.word 0xa3b4c4cb  ! 486: FCMPNE32	fcmpne32	%d50, %d42, %r17
	.word 0x00800001  ! 487: BN	bn  	<label_0x1>
	.word 0xc32fe010  ! 488: STXFSR_I	st-sfr	%f1, [0x0010, %r31]
	.word 0x19400001  ! 489: FBPUGE	fbuge
	.word 0xe1bfc2c0  ! 489: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x81dfc002  ! 1: FLUSH_R	flush 	%r31, %r2, %r0
memptr_40_209:
	set 0x60340000, %r31
	.word 0xd297c241  ! 490: LDUHA_R	lduha	[%r31, %r1] 0x12, %r9
	.word 0x8584b323  ! 491: WRCCR_I	wr	%r18, 0x1323, %ccr
	.word 0x00800001  ! 492: BN	bn  	<label_0x1>
	.word 0xd33fe130  ! 493: STDF_I	std	%f9, [0x0130, %r31]
	.word 0xc1bfd960  ! 493: STDFA_R	stda	%f0, [%r0, %r31]
memptr_40_211:
	set 0x60740000, %r31
	.word 0xd3e7dc43  ! 494: CASA_I	casa	[%r31] 0xe2, %r3, %r9
	.word 0x8580bdd0  ! 495: WRCCR_I	wr	%r2, 0x1dd0, %ccr
	.word 0xe19fdb60  ! 496: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd23fe150  ! 497: STD_I	std	%r9, [%r31 + 0x0150]
	.word 0x8582a989  ! 497: WRCCR_I	wr	%r10, 0x0989, %ccr
	.word 0x00800001  ! 498: BN	bn  	<label_0x1>
	.word 0xe1bfdc00  ! 499: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd29fc722  ! 500: LDDA_R	ldda	[%r31, %r2] 0x39, %r9
	.word 0xe1bfde00  ! 501: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fc3e0  ! 501: LDDFA_R	ldda	[%r31, %r0], %f0
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
    wrhpr %g0, 0x13c1, %hpstate  ! ta T_CHANGE_NONHPRIV 
	.word 0x91940013  ! 1: WRPR_PIL_R	wrpr	%r16, %r19, %pil
splash_htba_20_1:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 5: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_20_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 9: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd23fe133  ! 13: STD_I	std	%r9, [%r31 + 0x0133]
jmptr_20_7:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_10) + 0, 16, 16)) -> intp(3,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_10)&0xffffffff) + 56, 16, 16)) -> intp(0,0,27,,,,,1)
#else
	set 0x66e0988c, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_10:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d903f51  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1f51, %pstate
    nop
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
	set 0x001a1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_16:
    wrhpr %g0, 0xc09, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe7e7c3c0  ! 29: CASA_I	casa	[%r31] 0x1e, %r0, %r19
demap_20_17:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	stxa %r8, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	wrhpr %g0, 0x1f13, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe61fe08d  ! 33: LDD_I	ldd	[%r31 + 0x008d], %r19
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_18) + 16, 16, 16)) -> intp(0,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_18)&0xffffffff) + 32, 16, 16)) -> intp(4,0,21,,,,,1)
#else
	set 0x8c90a951, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_18:
	.word 0x39400001  ! 37: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_21:
	ta T_CHANGE_NONHPRIV
	.word 0x05400001  ! 1: FBPLG	fblg
	.word 0x81983fdf  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1fdf, %hpstate
demap_20_23:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	wrhpr %g0, 0x1688, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe81fe081  ! 45: LDD_I	ldd	[%r31 + 0x0081], %r20
fpinit_20_24:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 49: FDIVd	fdivd	%f0, %f4, %f8
brcommon1_20_25:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c1  ! 1: PDIST	pdistn	%d62, %d32, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x95703e27  ! 53: POPC_I	popc	0x1e27, %r10
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f802e71  ! 1: SIR	sir	0x0e71
intvec_20_27:
	.word 0x97a489d3  ! 57: FDIVd	fdivd	%f18, %f50, %f42
	.word 0xe927c000  ! 61: STF_R	st	%f20, [%r0, %r31]
	.word 0x9194c010  ! 65: WRPR_PIL_R	wrpr	%r19, %r16, %pil
splash_cmpr_20_35:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 69: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_20_37:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 73: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_38:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 77: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
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
    brnz %r10, cwq_20_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_39
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
cwq_20_39:
    wrhpr %g0, 0x74a, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 81: RDPC	rd	%pc, %r9
    nop
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
    brnz %r10, sma_20_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_41:
    wrhpr %g0, 0x1801, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd5e7d922  ! 85: CASA_I	casa	[%r31] 0xc9, %r2, %r10
splash_cmpr_20_42:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x07400001  ! 1: FBPUL	fbul
	.word 0x8d903697  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1697, %pstate
	.word 0xe00fe148  ! 97: LDUB_I	ldub	[%r31 + 0x0148], %r16
	.word 0x89800011  ! 101: WRTICK_R	wr	%r0, %r17, %tick
	fbg skip_20_49
	stxa %r8, [%r0] ASI_LSU_CONTROL
	fbuge,a,pn	%fcc0,  skip_20_49
	stxa %r17, [%r0] ASI_LSU_CONTROL
.align 128
skip_20_49:
	.word 0xe5e7c2e0  ! 105: CASA_I	casa	[%r31] 0x17, %r0, %r18
br_badelay3_20_50:
	.word 0x9ba449d2  ! 1: FDIVd	fdivd	%f48, %f18, %f44
	.word 0xcd6bc0b6	! Random illegal ?
	.word 0x93a00550  ! 1: FSQRTd	fsqrt	
	.word 0x95a10832  ! 109: FADDs	fadds	%f4, %f18, %f10
memptr_20_52:
	set 0x60140000, %r31
	.word 0x8584edc8  ! 113: WRCCR_I	wr	%r19, 0x0dc8, %ccr
demap_20_53:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	wrhpr %g0, 0x1589, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd81fe1a0  ! 117: LDD_I	ldd	[%r31 + 0x01a0], %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_56) + 16, 16, 16)) -> intp(1,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_56)&0xffffffff) + 48, 16, 16)) -> intp(2,0,11,,,,,1)
#else
	set 0x9c20862a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x97b344d2  ! 1: FCMPNE32	fcmpne32	%d44, %d18, %r11
intvec_20_56:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_58:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_58-donret_20_58), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b87900 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd86, %htstate
	wrhpr %g0, 0x16d3, %hpstate  !  rand=1 (20)
	ldx [%r12+%r0], %g1
	retry
.align 128
donretarg_20_58:
	.word 0x93a049cb  ! 125: FDIVd	fdivd	%f32, %f42, %f40
	.word 0x9194400b  ! 129: WRPR_PIL_R	wrpr	%r17, %r11, %pil
	bge,a	 skip_20_61
	brlz,pn  	%r19, skip_20_61
.align 2048
skip_20_61:
	.word 0x87ac8a52  ! 133: FCMPd	fcmpd	%fcc<n>, %f18, %f18
	.word 0xda07c000  ! 137: LDUW_R	lduw	[%r31 + %r0], %r13
splash_tba_20_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 141: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd81fc002  ! 145: LDD_R	ldd	[%r31 + %r2], %r12
	.word 0xa9b200e7  ! 149: EDGE16LN	edge16ln	%r8, %r7, %r20
	.word 0xa1902006  ! 153: WRPR_GL_I	wrpr	%r0, 0x0006, %-
brcommon3_20_70:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe060  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0060]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81983ed9  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ed9, %hpstate
brcommon1_20_71:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c2  ! 1: PDIST	pdistn	%d62, %d2, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xa57035fc  ! 161: POPC_I	popc	0x15fc, %r18
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_74) + 16, 16, 16)) -> intp(5,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_74)&0xffffffff) + 8, 16, 16)) -> intp(1,0,27,,,,,1)
#else
	set 0xeb30b652, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803d4b  ! 1: SIR	sir	0x1d4b
intvec_20_74:
	.word 0x9f8022b3  ! 165: SIR	sir	0x02b3
	fbul,a,pn	%fcc0,  skip_20_76
	stxa %r8, [%r0] ASI_LSU_CONTROL
	.word 0x9f803dec  ! 1: SIR	sir	0x1dec
	stxa %r13, [%r0] ASI_LSU_CONTROL
.align 512
skip_20_76:
	.word 0xc36fe18c  ! 169: PREFETCH_I	prefetch	[%r31 + 0x018c], #one_read
	.word 0xd22fe18b  ! 173: STB_I	stb	%r9, [%r31 + 0x018b]
	.word 0x91950014  ! 177: WRPR_PIL_R	wrpr	%r20, %r20, %pil
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
intvec_20_81:
	.word 0x9f802d48  ! 181: SIR	sir	0x0d48
jmptr_20_83:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 185: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fd920  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x81dc0012  ! 193: FLUSH_R	flush 	%r16, %r18, %r0
jmptr_20_87:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 197: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_20_89:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x83eb3709, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 201: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902fd5  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0fd5, %pstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_92:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_92-donret_20_92), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b8b800 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x517, %htstate
	wrpr %g0, 0x17a1, %pstate  ! rand=0 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	ldx [%r12+%r0], %g1
	retry
donretarg_20_92:
	.word 0xa7a509d2  ! 209: FDIVd	fdivd	%f20, %f18, %f50
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_94) + 16, 16, 16)) -> intp(2,0,15,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_94)&0xffffffff) + 56, 16, 16)) -> intp(5,0,29,,,,,1)
#else
	set 0x3c70c489, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_94:
	.word 0x39400001  ! 213: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_96)+40, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_20_96)&0xffffffff) + 56, 16, 16)) -> intp(mask2tid(0x20),1,3,,,,,1)
xir_20_96:
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
xir_20_96:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa982bcc7  ! 217: WR_SET_SOFTINT_I	wr	%r10, 0x1cc7, %set_softint
	.word 0x89800011  ! 221: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd8ffe0c0  ! 225: SWAPA_I	swapa	%r12, [%r31 + 0x00c0] %asi
splash_hpstate_20_102:
	.word 0x8198234d  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
intveclr_20_105:
	nop
	nop
	ta T_CHANGE_HPRIV
	setx 0xc766ab5b2dc2aa27, %r1, %r28
	stxa %r28, [%g0] 0x72
	wrhpr %g0, 0x5c2, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_20_108:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xe64a6705, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_110:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_110-donret_20_110+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005b3b00 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc5a, %htstate
	wrpr %g0, 0x538, %pstate  ! rand=0 (20)
	ldx [%r12+%r0], %g1
	retry
.align 512
donretarg_20_110:
	.word 0x93a349c5  ! 241: FDIVd	fdivd	%f44, %f36, %f40
	.word 0xe83fc000  ! 245: STD_R	std	%r20, [%r31 + %r0]
	.word 0xe8cfc380  ! 249: LDSBA_R	ldsba	[%r31, %r0] 0x1c, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_112) + 32, 16, 16)) -> intp(1,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_112)&0xffffffff) + 16, 16, 16)) -> intp(0,0,9,,,,,1)
#else
	set 0xd1f0e119, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_20_112:
	.word 0x91a289ca  ! 253: FDIVd	fdivd	%f10, %f10, %f8
	.word 0xe037e034  ! 257: STH_I	sth	%r16, [%r31 + 0x0034]
	.word 0xc30fc000  ! 261: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_20_116:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 265: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_20_117:
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81983c9d  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1c9d, %hpstate
    set 0x2b21, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b2c7c5  ! 273: PDIST	pdistn	%d42, %d36, %d16
splash_lsu_20_120:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x8cc68504, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_122:
	.word 0x81983e4d  ! 281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e4d, %hpstate
splash_lsu_20_124:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xc5c8e24a, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x13400001  ! 1: FBPE	fbe
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 285: FBPULE	fbule
	.word 0x95a00162  ! 289: FABSq	dis not found

	.word 0xe3e7e002  ! 293: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0xd047c000  ! 297: LDSW_R	ldsw	[%r31 + %r0], %r8
brcommon3_20_129:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1f0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01f0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x819826d5  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
	.word 0xe727e115  ! 305: STF_I	st	%f19, [0x0115, %r31]
	.word 0x93b2c0f4  ! 309: EDGE16LN	edge16ln	%r11, %r20, %r9
	.word 0x9b53c000  ! 313: RDPR_FQ	<illegal instruction>
	.word 0xc1bfdc00  ! 317: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe21fc003  ! 321: LDD_R	ldd	[%r31 + %r3], %r17
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa78236a5  ! 329: WR_GRAPHICS_STATUS_REG_I	wr	%r8, 0x16a5, %-
	.word 0xe127e134  ! 333: STF_I	st	%f16, [0x0134, %r31]
jmptr_20_140:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 337: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd8c7c280  ! 341: LDSWA_R	ldswa	[%r31, %r0] 0x14, %r12
	.word 0x8d903ee6  ! 345: WRPR_PSTATE_I	wrpr	%r0, 0x1ee6, %pstate
	.word 0x9191c011  ! 349: WRPR_PIL_R	wrpr	%r7, %r17, %pil
	.word 0x97b280f2  ! 353: EDGE16LN	edge16ln	%r10, %r18, %r11
jmptr_20_150:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 357: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xd337e176  ! 365: STQF_I	-	%f9, [0x0176, %r31]
jmptr_20_155:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 369: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_159:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 373: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe44fc000  ! 377: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe3e7e001  ! 381: CASA_R	casa	[%r31] %asi, %r1, %r17
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f8028c5  ! 1: SIR	sir	0x08c5
intvec_20_163:
	.word 0xa1b504c8  ! 385: FCMPNE32	fcmpne32	%d20, %d8, %r16
brcommon3_20_164:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46fe1d0  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0x01d0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x00800001  ! 389: BN	bn  	<label_0x1>
	.word 0xe4800b00  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r18
	.word 0x8d90328c  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x128c, %pstate
	.word 0xe4c7c540  ! 401: LDSWA_R	ldswa	[%r31, %r0] 0x2a, %r18
splash_tba_20_171:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 405: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_20_173:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe180  ! 1: STXFSR_I	st-sfr	%f1, [0x0180, %r31]
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xa5b48490  ! 409: FCMPLE32	fcmple32	%d18, %d16, %r18
splash_lsu_20_175:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xf093526b, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 413: FBPULE	fbule
	.word 0xc1bfe0e0  ! 417: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xd897d100  ! 421: LDUHA_R	lduha	[%r31, %r0] 0x88, %r12
	.word 0xdb3fe0d0  ! 425: STDF_I	std	%f13, [0x00d0, %r31]
brcommon3_20_181:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c000  ! 1: STQF_R	-	%f18, [%r0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r12, [%r0] ASI_LSU_CONTROL
	.word 0xa7aac828  ! 429: FMOVGE	fmovs	%fcc1, %f8, %f19
pmu_20_182:
	nop
	nop
	setx 0xffffffb6ffffffa1, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_20_184:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 437: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xd68008a0  ! 441: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xe4c7c2e0  ! 445: LDSWA_R	ldswa	[%r31, %r0] 0x17, %r18
	.word 0xe337c000  ! 449: STQF_R	-	%f17, [%r0, %r31]
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_190:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_190-donret_20_190), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002b2300 | (0x4f << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x131d, %htstate
	wrpr %g0, 0x9f1, %pstate  ! rand=0 (20)
	retry
.align 512
donretarg_20_190:
	.word 0x26800001  ! 453: BL	bl,a	<label_0x1>
splash_htba_20_193:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 457: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_20_195:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 461: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
trapasi_20_197:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xdad84920  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x49, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_200) + 32, 16, 16)) -> intp(3,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_20_200)&0xffffffff) + 56, 16, 16)) -> intp(1,0,7,,,,,1)
#else
	set 0xe4702f33, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_20_200:
	.word 0x39400001  ! 469: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe1e0  ! 473: STDFA_I	stda	%f0, [0x01e0, %r31]
	.word 0x89800011  ! 477: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_20_204:
	.word 0x1e800001  ! 1: BVC	bvc  	<label_0x1>
	.word 0x8198320f  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x120f, %hpstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_20_206:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_20_206-donret_20_206+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00602f00 | (0x58 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x17e4, %htstate
	wrhpr %g0, 0x1c4a, %hpstate  !  rand=1 (20)
	ldx [%r12+%r0], %g1
	retry
donretarg_20_206:
	.word 0xd66fe143  ! 485: LDSTUB_I	ldstub	%r11, [%r31 + 0x0143]
brcommon2_20_208:
    nop
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xc19fd920  ! 489: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_20_210:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 493: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91950009  ! 497: WRPR_PIL_R	wrpr	%r20, %r9, %pil
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
    wrhpr %g0, 0x1953, %hpstate  ! ta T_CHANGE_NONHPRIV 
	.word 0x91904013  ! 1: WRPR_PIL_R	wrpr	%r1, %r19, %pil
splash_htba_10_1:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 5: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_10_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd23fe1b9  ! 13: STD_I	std	%r9, [%r31 + 0x01b9]
jmptr_10_7:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_10) + 40, 16, 16)) -> intp(1,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_10)&0xffffffff) + 24, 16, 16)) -> intp(7,0,9,,,,,1)
#else
	set 0xce705745, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_10:
	.word 0x91a1c9c4  ! 21: FDIVd	fdivd	%f38, %f4, %f8
	.word 0x05400001  ! 1: FBPLG	fblg
	.word 0x8d902966  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x0966, %pstate
    nop
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
	set 0x00121fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_16:
    wrhpr %g0, 0x3c2, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe7e7d042  ! 29: CASA_I	casa	[%r31] 0x82, %r2, %r19
demap_10_17:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0xe50, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe61fe026  ! 33: LDD_I	ldd	[%r31 + 0x0026], %r19
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_18) + 8, 16, 16)) -> intp(7,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_18)&0xffffffff) + 56, 16, 16)) -> intp(3,0,28,,,,,1)
#else
	set 0x57a0e5ec, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_18:
	.word 0x39400001  ! 37: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_21:
	ta T_CHANGE_NONHPRIV
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x81982cdf  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdf, %hpstate
demap_10_23:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x16800001  ! 1: BGE	bge  	<label_0x1>
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	wrhpr %g0, 0x120a, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe81fe12b  ! 45: LDD_I	ldd	[%r31 + 0x012b], %r20
fpinit_10_24:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 49: FCMPd	fcmpd	%fcc<n>, %f0, %f4
brcommon1_10_25:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c3  ! 1: PDIST	pdistn	%d62, %d34, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x97a249b2  ! 53: FDIVs	fdivs	%f9, %f18, %f11
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f8036ed  ! 1: SIR	sir	0x16ed
intvec_10_27:
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe927c000  ! 61: STF_R	st	%f20, [%r0, %r31]
	.word 0x91950010  ! 65: WRPR_PIL_R	wrpr	%r20, %r16, %pil
splash_cmpr_10_35:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 69: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_10_37:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 73: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_38:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 77: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
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
    brnz %r10, cwq_10_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_39
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
cwq_10_39:
    wrhpr %g0, 0x492, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 81: RDPC	rd	%pc, %r20
    nop
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
    brnz %r10, sma_10_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_41:
    wrhpr %g0, 0x851, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd5e7dc41  ! 85: CASA_I	casa	[%r31] 0xe2, %r1, %r10
splash_cmpr_10_42:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d903611  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1611, %pstate
	.word 0xe00fe168  ! 97: LDUB_I	ldub	[%r31 + 0x0168], %r16
	.word 0x89800011  ! 101: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc36fe192  ! 105: PREFETCH_I	prefetch	[%r31 + 0x0192], #one_read
br_badelay3_10_50:
	.word 0xa3a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f48
	.word 0xc56f3f47	! Random illegal ?
	.word 0x91a00553  ! 1: FSQRTd	fsqrt	
	.word 0x97a4882d  ! 109: FADDs	fadds	%f18, %f13, %f11
memptr_10_52:
	set 0x60540000, %r31
	.word 0x8581f65e  ! 113: WRCCR_I	wr	%r7, 0x165e, %ccr
demap_10_53:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	wrhpr %g0, 0x1252, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd81fe178  ! 117: LDD_I	ldd	[%r31 + 0x0178], %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_56) + 0, 16, 16)) -> intp(6,0,12,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_56)&0xffffffff) + 16, 16, 16)) -> intp(1,0,5,,,,,1)
#else
	set 0xfe5099e7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5a509d0  ! 1: FDIVd	fdivd	%f20, %f16, %f18
intvec_10_56:
	.word 0xa1b504ca  ! 121: FCMPNE32	fcmpne32	%d20, %d10, %r16
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_58:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_58-donret_10_58), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c8b900 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1b0e, %htstate
	wrhpr %g0, 0x759, %hpstate  !  rand=1 (10)
	ldx [%r12+%r0], %g1
	retry
.align 128
donretarg_10_58:
	.word 0xa5a249c2  ! 125: FDIVd	fdivd	%f40, %f2, %f18
	.word 0x9190c014  ! 129: WRPR_PIL_R	wrpr	%r3, %r20, %pil
	.word 0x87a94a53  ! 133: FCMPd	fcmpd	%fcc<n>, %f36, %f50
	.word 0xda07c000  ! 137: LDUW_R	lduw	[%r31 + %r0], %r13
splash_tba_10_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 141: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd81fc000  ! 145: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x9bb280e4  ! 149: EDGE16LN	edge16ln	%r10, %r4, %r13
	.word 0xa190200b  ! 153: WRPR_GL_I	wrpr	%r0, 0x000b, %-
brcommon3_10_70:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe1c0  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x01c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d9024dd  ! 157: WRPR_PSTATE_I	wrpr	%r0, 0x04dd, %pstate
brcommon1_10_71:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c0  ! 1: PDIST	pdistn	%d62, %d0, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x9bb247c6  ! 161: PDIST	pdistn	%d40, %d6, %d44
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_74) + 16, 16, 16)) -> intp(4,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_74)&0xffffffff) + 8, 16, 16)) -> intp(3,0,21,,,,,1)
#else
	set 0x45f02b2d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f803e01  ! 1: SIR	sir	0x1e01
intvec_10_74:
	.word 0x39400001  ! 165: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd3e7c2e0  ! 169: CASA_I	casa	[%r31] 0x17, %r0, %r9
	.word 0xd22fe179  ! 173: STB_I	stb	%r9, [%r31 + 0x0179]
	.word 0x91948010  ! 177: WRPR_PIL_R	wrpr	%r18, %r16, %pil
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x93a509d4  ! 1: FDIVd	fdivd	%f20, %f20, %f40
intvec_10_81:
	.word 0x39400001  ! 181: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_10_83:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 185: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fd960  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x81dc0009  ! 193: FLUSH_R	flush 	%r16, %r9, %r0
jmptr_10_87:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 197: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_10_89:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x2de6a635, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 201: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e41  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0e41, %pstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_92:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_92-donret_10_92), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b14f00 | (0x88 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d6f, %htstate
	wrpr %g0, 0x1f39, %pstate  ! rand=0 (10)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	ldx [%r12+%r0], %g1
	retry
donretarg_10_92:
	.word 0xa7a409d1  ! 209: FDIVd	fdivd	%f16, %f48, %f50
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_94) + 40, 16, 16)) -> intp(2,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_94)&0xffffffff) + 40, 16, 16)) -> intp(4,0,3,,,,,1)
#else
	set 0xea509e90, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_94:
	.word 0x9f802fa6  ! 213: SIR	sir	0x0fa6
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_96)+0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_10_96)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x10),1,3,,,,,1)
xir_10_96:
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
xir_10_96:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa984675e  ! 217: WR_SET_SOFTINT_I	wr	%r17, 0x075e, %set_softint
	.word 0x89800011  ! 221: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd8ffe000  ! 225: SWAPA_I	swapa	%r12, [%r31 + 0x0000] %asi
splash_hpstate_10_102:
	.word 0x819827df  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
intveclr_10_105:
	nop
	nop
	ta T_CHANGE_HPRIV
	setx 0x4c2dc023ab34de0f, %r1, %r28
	stxa %r28, [%g0] 0x72
	wrhpr %g0, 0x194a, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_10_108:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xbbb3e2c2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 237: FBPULE	fbule
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_110:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_110-donret_10_110+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cd3100 | (48 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x64e, %htstate
	wrpr %g0, 0xe72, %pstate  ! rand=0 (10)
	ldx [%r12+%r0], %g1
	retry
.align 512
donretarg_10_110:
	.word 0xa7a489c5  ! 241: FDIVd	fdivd	%f18, %f36, %f50
	.word 0xe83fc000  ! 245: STD_R	std	%r20, [%r31 + %r0]
	.word 0xe8cfd140  ! 249: LDSBA_R	ldsba	[%r31, %r0] 0x8a, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_112) + 48, 16, 16)) -> intp(7,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_112)&0xffffffff) + 0, 16, 16)) -> intp(7,0,10,,,,,1)
#else
	set 0xb1d02d89, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f8034bf  ! 1: SIR	sir	0x14bf
intvec_10_112:
	.word 0xa1a509d3  ! 253: FDIVd	fdivd	%f20, %f50, %f16
	.word 0xe037e166  ! 257: STH_I	sth	%r16, [%r31 + 0x0166]
	.word 0xc30fc000  ! 261: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_10_116:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 265: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_10_117:
	ta T_CHANGE_NONHPRIV
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x81983dd5  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1dd5, %hpstate
    set 0x2e9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b407d2  ! 273: PDIST	pdistn	%d16, %d18, %d12
splash_lsu_10_120:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xe937beb9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_122:
	.word 0x8198245f  ! 281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
splash_lsu_10_124:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x20dd0fd0, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 285: FBPULE	fbule
	.word 0x9f8020d0  ! 289: SIR	sir	0x00d0
	.word 0xe3e7e002  ! 293: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0xd047c000  ! 297: LDSW_R	ldsw	[%r31 + %r0], %r8
brcommon3_10_129:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe070  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0070]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903d55  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x1d55, %pstate
	.word 0xe727e198  ! 305: STF_I	st	%f19, [0x0198, %r31]
	.word 0xa1b4c0f4  ! 309: EDGE16LN	edge16ln	%r19, %r20, %r16
	.word 0x9953c000  ! 313: RDPR_FQ	<illegal instruction>
	.word 0xe1bfdf20  ! 317: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe21fc003  ! 321: LDD_R	ldd	[%r31 + %r3], %r17
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa783276d  ! 329: WR_GRAPHICS_STATUS_REG_I	wr	%r12, 0x076d, %-
	.word 0xe127e04e  ! 333: STF_I	st	%f16, [0x004e, %r31]
jmptr_10_140:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 337: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd8c7c600  ! 341: LDSWA_R	ldswa	[%r31, %r0] 0x30, %r12
	.word 0x8d903344  ! 345: WRPR_PSTATE_I	wrpr	%r0, 0x1344, %pstate
	.word 0x9194000c  ! 349: WRPR_PIL_R	wrpr	%r16, %r12, %pil
	.word 0x97b500f0  ! 353: EDGE16LN	edge16ln	%r20, %r16, %r11
jmptr_10_150:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 357: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe48008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xd337e1f8  ! 365: STQF_I	-	%f9, [0x01f8, %r31]
jmptr_10_155:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 369: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_159:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 373: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe44fc000  ! 377: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe3e7e002  ! 381: CASA_R	casa	[%r31] %asi, %r2, %r17
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_10_163:
	.word 0x99a409cc  ! 385: FDIVd	fdivd	%f16, %f12, %f12
brcommon3_10_164:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46fe0d0  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0x00d0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x00800001  ! 389: BN	bn  	<label_0x1>
	.word 0xe4800b20  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	.word 0x8d902173  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x0173, %pstate
	.word 0xe4c7d060  ! 401: LDSWA_R	ldswa	[%r31, %r0] 0x83, %r18
splash_tba_10_171:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 405: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_10_173:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe040  ! 1: STXFSR_I	st-sfr	%f1, [0x0040, %r31]
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xa3a109ad  ! 409: FDIVs	fdivs	%f4, %f13, %f17
splash_lsu_10_175:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x2e6097fa, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 413: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe0e0  ! 417: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xd897c2c0  ! 421: LDUHA_R	lduha	[%r31, %r0] 0x16, %r12
	.word 0x9f802050  ! 425: SIR	sir	0x0050
brcommon3_10_181:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c002  ! 1: STQF_R	-	%f18, [%r2, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r12, [%r0] ASI_LSU_CONTROL
	.word 0x97aac825  ! 429: FMOVGE	fmovs	%fcc1, %f5, %f11
pmu_10_182:
	nop
	nop
	setx 0xffffffb0ffffffaf, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_10_184:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 437: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xd68008a0  ! 441: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xe4c7d060  ! 445: LDSWA_R	ldswa	[%r31, %r0] 0x83, %r18
	.word 0xe337c000  ! 449: STQF_R	-	%f17, [%r0, %r31]
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_190:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_190-donret_10_190), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c9d900 | (0x89 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb5f, %htstate
	wrpr %g0, 0x1051, %pstate  ! rand=0 (10)
	retry
.align 512
donretarg_10_190:
	.word 0x0ec8c001  ! 453: BRGEZ	brgez,pt  	%r3,<label_0x8c001>
splash_htba_10_193:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 457: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_10_195:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 461: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
trapasi_10_197:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xdad84920  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x49, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_200) + 32, 16, 16)) -> intp(4,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_10_200)&0xffffffff) + 16, 16, 16)) -> intp(4,0,17,,,,,1)
#else
	set 0x88904970, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_10_200:
	.word 0x39400001  ! 469: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe000  ! 473: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0x89800011  ! 477: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_10_204:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x819834fa  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x14fa, %hpstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_10_206:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_10_206-donret_10_206+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00295700 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x110d, %htstate
	wrhpr %g0, 0x1441, %hpstate  !  rand=1 (10)
	ldx [%r12+%r0], %g1
	retry
donretarg_10_206:
	.word 0xd66fe05b  ! 485: LDSTUB_I	ldstub	%r11, [%r31 + 0x005b]
brcommon2_10_208:
    nop
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc000  ! 1: FLUSH_R	flush 	%r31, %r0, %r0
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xc19fc2c0  ! 489: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_10_210:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 493: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91950005  ! 497: WRPR_PIL_R	wrpr	%r20, %r5, %pil
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
    wrhpr %g0, 0x9c1, %hpstate  ! ta T_CHANGE_NONHPRIV 
	.word 0x91950013  ! 1: WRPR_PIL_R	wrpr	%r20, %r19, %pil
splash_htba_8_1:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 5: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_8_4:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd23fe0a8  ! 13: STD_I	std	%r9, [%r31 + 0x00a8]
jmptr_8_7:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_10) + 16, 16, 16)) -> intp(1,0,8,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_10)&0xffffffff) + 40, 16, 16)) -> intp(3,0,1,,,,,1)
#else
	set 0xfe0011e0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_10:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x12800001  ! 1: BNE	bne  	<label_0x1>
	.word 0x8d9030ff  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x10ff, %pstate
    nop
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
	set 0x000a1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_16:
    wrhpr %g0, 0xf50, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe7e7d162  ! 29: CASA_I	casa	[%r31] 0x8b, %r2, %r19
demap_8_17:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	stxa %r11, [%r0] ASI_LSU_CONTROL
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0x1219, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe61fe143  ! 33: LDD_I	ldd	[%r31 + 0x0143], %r19
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_18) + 48, 16, 16)) -> intp(6,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_18)&0xffffffff) + 40, 16, 16)) -> intp(2,0,17,,,,,1)
#else
	set 0x5280b169, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_18:
	.word 0xa5b4c4c1  ! 37: FCMPNE32	fcmpne32	%d50, %d32, %r18
splash_hpstate_8_21:
	ta T_CHANGE_NONHPRIV
	.word 0x17400001  ! 1: FBPGE	fbge
	.word 0x819835dd  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15dd, %hpstate
demap_8_23:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0x819, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe81fe079  ! 45: LDD_I	ldd	[%r31 + 0x0079], %r20
fpinit_8_24:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 49: FDIVd	fdivd	%f0, %f4, %f8
brcommon1_8_25:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c2  ! 1: PDIST	pdistn	%d62, %d2, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x00800001  ! 53: BN	bn  	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa3b4c4d2  ! 1: FCMPNE32	fcmpne32	%d50, %d18, %r17
intvec_8_27:
	.word 0xa1b404c1  ! 57: FCMPNE32	fcmpne32	%d16, %d32, %r16
	.word 0xe927c000  ! 61: STF_R	st	%f20, [%r0, %r31]
	.word 0x91924013  ! 65: WRPR_PIL_R	wrpr	%r9, %r19, %pil
splash_cmpr_8_35:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 69: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_8_37:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 73: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_38:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 77: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
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
    brnz %r10, cwq_8_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_39
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
cwq_8_39:
    wrhpr %g0, 0xcd9, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 81: RDPC	rd	%pc, %r18
    nop
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
    brnz %r10, sma_8_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_41:
    wrhpr %g0, 0x1fc0, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd5e7d043  ! 85: CASA_I	casa	[%r31] 0x82, %r3, %r10
splash_cmpr_8_42:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d902325  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x0325, %pstate
	.word 0xe00fe0e8  ! 97: LDUB_I	ldub	[%r31 + 0x00e8], %r16
	.word 0x89800011  ! 101: WRTICK_R	wr	%r0, %r17, %tick
	bn  	 skip_8_49
	stxa %r14, [%r0] ASI_LSU_CONTROL
	.word 0x87a88a41  ! 1: FCMPd	fcmpd	%fcc<n>, %f2, %f32
	stxa %r12, [%r0] ASI_LSU_CONTROL
.align 128
skip_8_49:
	.word 0xc36fe076  ! 105: PREFETCH_I	prefetch	[%r31 + 0x0076], #one_read
br_badelay3_8_50:
	.word 0x99a4c9d0  ! 1: FDIVd	fdivd	%f50, %f16, %f12
	.word 0x9964b007	! Random illegal ?
	.word 0x91a00553  ! 1: FSQRTd	fsqrt	
	.word 0x97a4c832  ! 109: FADDs	fadds	%f19, %f18, %f11
memptr_8_52:
	set 0x60740000, %r31
	.word 0x8584e452  ! 113: WRCCR_I	wr	%r19, 0x0452, %ccr
demap_8_53:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	wrhpr %g0, 0x298, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd81fe0dd  ! 117: LDD_I	ldd	[%r31 + 0x00dd], %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_56) + 48, 16, 16)) -> intp(4,0,26,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_56)&0xffffffff) + 40, 16, 16)) -> intp(5,0,4,,,,,1)
#else
	set 0x25302673, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5b444c2  ! 1: FCMPNE32	fcmpne32	%d48, %d2, %r18
intvec_8_56:
	.word 0x9f8020ee  ! 121: SIR	sir	0x00ee
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_58:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_58-donret_8_58), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00083d00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd07, %htstate
	wrhpr %g0, 0x179a, %hpstate  !  rand=1 (8)
	ldx [%r12+%r0], %g1
	retry
.align 128
donretarg_8_58:
	.word 0x97a049c1  ! 125: FDIVd	fdivd	%f32, %f32, %f42
	.word 0x91940013  ! 129: WRPR_PIL_R	wrpr	%r16, %r19, %pil
	fbule,a,pn	%fcc0,  skip_8_61
	fbl,a,pn	%fcc0,  skip_8_61
.align 2048
skip_8_61:
	.word 0x24cc8001  ! 133: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xda07c000  ! 137: LDUW_R	lduw	[%r31 + %r0], %r13
splash_tba_8_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 141: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd81fc001  ! 145: LDD_R	ldd	[%r31 + %r1], %r12
	.word 0x9bb340f2  ! 149: EDGE16LN	edge16ln	%r13, %r18, %r13
	.word 0xa190200c  ! 153: WRPR_GL_I	wrpr	%r0, 0x000c, %-
brcommon3_8_70:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe190  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0190]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81982694  ! 157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0694, %hpstate
brcommon1_8_71:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c0  ! 1: PDIST	pdistn	%d62, %d0, %d20
    ba,a .+8
    jmpl %r27-0, %r27
	.word 0xa1b4c7d1  ! 161: PDIST	pdistn	%d50, %d48, %d16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_74) + 32, 16, 16)) -> intp(4,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_74)&0xffffffff) + 40, 16, 16)) -> intp(4,0,25,,,,,1)
#else
	set 0x2080720e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3a409d2  ! 1: FDIVd	fdivd	%f16, %f18, %f48
intvec_8_74:
	.word 0xa5b404cd  ! 165: FCMPNE32	fcmpne32	%d16, %d44, %r18
	bvs  	 skip_8_76
	stxa %r10, [%r0] ASI_LSU_CONTROL
	brlez,pt  	%r5, skip_8_76
	stxa %r16, [%r0] ASI_LSU_CONTROL
.align 512
skip_8_76:
	.word 0xd3e7c2e0  ! 169: CASA_I	casa	[%r31] 0x17, %r0, %r9
	.word 0xd22fe1b5  ! 173: STB_I	stb	%r9, [%r31 + 0x01b5]
	.word 0x9190c012  ! 177: WRPR_PIL_R	wrpr	%r3, %r18, %pil
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x97b504d4  ! 1: FCMPNE32	fcmpne32	%d20, %d20, %r11
intvec_8_81:
	.word 0x9ba4c9c2  ! 181: FDIVd	fdivd	%f50, %f2, %f44
jmptr_8_83:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 185: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fde00  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x81d9c00d  ! 193: FLUSH_R	flush 	%r7, %r13, %r0
jmptr_8_87:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 197: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_8_89:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x5f62af54, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 201: FBPULE	fbule
	.word 0x8d902117  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0117, %pstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_92:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_92-donret_8_92), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0033c900 | (0x8a << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x74d, %htstate
	wrpr %g0, 0x1871, %pstate  ! rand=0 (8)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	ldx [%r12+%r0], %g1
	retry
donretarg_8_92:
	.word 0x95a4c9d4  ! 209: FDIVd	fdivd	%f50, %f20, %f10
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_94) + 24, 16, 16)) -> intp(2,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_94)&0xffffffff) + 24, 16, 16)) -> intp(4,0,0,,,,,1)
#else
	set 0xcb0b312, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_94:
	.word 0x97a489d3  ! 213: FDIVd	fdivd	%f18, %f50, %f42
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_96)+56, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_8_96)&0xffffffff) + 48, 16, 16)) -> intp(mask2tid(0x8),1,3,,,,,1)
xir_8_96:
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
xir_8_96:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa98522e6  ! 217: WR_SET_SOFTINT_I	wr	%r20, 0x02e6, %set_softint
	.word 0x89800011  ! 221: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd8ffe1c0  ! 225: SWAPA_I	swapa	%r12, [%r31 + 0x01c0] %asi
splash_hpstate_8_102:
	.word 0x819821c7  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
intveclr_8_105:
	nop
	nop
	ta T_CHANGE_HPRIV
	setx 0x5c688c4f1e6b4f21, %r1, %r28
	stxa %r28, [%g0] 0x72
	wrhpr %g0, 0xdda, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_8_108:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xbc806cab, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_110:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_110-donret_8_110+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c83f00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1387, %htstate
	wrpr %g0, 0x1e38, %pstate  ! rand=0 (8)
	ldx [%r12+%r0], %g1
	retry
.align 512
donretarg_8_110:
	.word 0x97a509c9  ! 241: FDIVd	fdivd	%f20, %f40, %f42
	.word 0xe83fc000  ! 245: STD_R	std	%r20, [%r31 + %r0]
	.word 0xe8cfc280  ! 249: LDSBA_R	ldsba	[%r31, %r0] 0x14, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_112) + 0, 16, 16)) -> intp(2,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_112)&0xffffffff) + 8, 16, 16)) -> intp(1,0,27,,,,,1)
#else
	set 0x1c708f07, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_8_112:
	.word 0x95a449c1  ! 253: FDIVd	fdivd	%f48, %f32, %f10
	.word 0xe037e04b  ! 257: STH_I	sth	%r16, [%r31 + 0x004b]
	.word 0xc30fc000  ! 261: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_8_116:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 265: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_8_117:
	ta T_CHANGE_NONHPRIV
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81983e5f  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1e5f, %hpstate
    set 0x2d95, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b287d2  ! 273: PDIST	pdistn	%d10, %d18, %d10
splash_lsu_8_120:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xb005b721, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_122:
	.word 0x8198321f  ! 281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x121f, %hpstate
splash_lsu_8_124:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xcefe143b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x26cc0001  ! 1: BRLZ	brlz,a,pt	%r16,<label_0xc0001>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 285: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4bfc280  ! 289: STDA_R	stda	%r10, [%r31 + %r0] 0x14
	.word 0xe3e7e002  ! 293: CASA_R	casa	[%r31] %asi, %r2, %r17
	.word 0xd047c000  ! 297: LDSW_R	ldsw	[%r31 + %r0], %r8
brcommon3_8_129:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe140  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0140]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x81983ca1  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1ca1, %hpstate
	.word 0xe727e1b5  ! 305: STF_I	st	%f19, [0x01b5, %r31]
	.word 0xa9b340f2  ! 309: EDGE16LN	edge16ln	%r13, %r18, %r20
	.word 0x9353c000  ! 313: RDPR_FQ	<illegal instruction>
	.word 0xe1bfdf20  ! 317: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe21fc003  ! 321: LDD_R	ldd	[%r31 + %r3], %r17
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa7847601  ! 329: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x1601, %-
	.word 0xe127e1dc  ! 333: STF_I	st	%f16, [0x01dc, %r31]
jmptr_8_140:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 337: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd8c7d160  ! 341: LDSWA_R	ldswa	[%r31, %r0] 0x8b, %r12
	.word 0x8d9026d6  ! 345: WRPR_PSTATE_I	wrpr	%r0, 0x06d6, %pstate
	.word 0x91944002  ! 349: WRPR_PIL_R	wrpr	%r17, %r2, %pil
	.word 0x99b140f3  ! 353: EDGE16LN	edge16ln	%r5, %r19, %r12
jmptr_8_150:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 357: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800b40  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0xd337e14a  ! 365: STQF_I	-	%f9, [0x014a, %r31]
jmptr_8_155:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 369: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_159:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 373: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe44fc000  ! 377: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe3e7e003  ! 381: CASA_R	casa	[%r31] %asi, %r3, %r17
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
intvec_8_163:
	.word 0x19400001  ! 385: FBPUGE	fbuge
brcommon3_8_164:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46fe150  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0x0150]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x00800001  ! 389: BN	bn  	<label_0x1>
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8d903807  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x1807, %pstate
	.word 0xe4c7d040  ! 401: LDSWA_R	ldswa	[%r31, %r0] 0x82, %r18
splash_tba_8_171:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 405: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_8_173:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe040  ! 1: STXFSR_I	st-sfr	%f1, [0x0040, %r31]
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xa37029bd  ! 409: POPC_I	popc	0x09bd, %r17
splash_lsu_8_175:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x2b3f81b7, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 413: FBPULE	fbule
	.word 0xc1bfe0e0  ! 417: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xd897d140  ! 421: LDUHA_R	lduha	[%r31, %r0] 0x8a, %r12
	.word 0xda9fd003  ! 425: LDDA_R	ldda	[%r31, %r3] 0x80, %r13
brcommon3_8_181:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c001  ! 1: STQF_R	-	%f18, [%r1, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r20, [%r0] ASI_LSU_CONTROL
	.word 0x91aac831  ! 429: FMOVGE	fmovs	%fcc1, %f17, %f8
pmu_8_182:
	nop
	nop
	setx 0xffffffb6ffffffa4, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_8_184:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 437: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xd68008a0  ! 441: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xe4c7d060  ! 445: LDSWA_R	ldswa	[%r31, %r0] 0x83, %r18
	.word 0xe337c000  ! 449: STQF_R	-	%f17, [%r0, %r31]
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_190:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_190-donret_8_190), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0060e500 | (4 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x145f, %htstate
	wrpr %g0, 0xceb, %pstate  ! rand=0 (8)
	retry
.align 512
donretarg_8_190:
	.word 0x30800001  ! 453: BA	ba,a	<label_0x1>
splash_htba_8_193:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 457: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_8_195:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 461: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
trapasi_8_197:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xdad84920  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x49, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_200) + 8, 16, 16)) -> intp(1,0,4,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_8_200)&0xffffffff) + 8, 16, 16)) -> intp(5,0,0,,,,,1)
#else
	set 0xc410ea85, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_8_200:
	.word 0x9f8038ff  ! 469: SIR	sir	0x18ff
	.word 0xe1bfe0a0  ! 473: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0x89800011  ! 477: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_8_204:
	.word 0x26cd0001  ! 1: BRLZ	brlz,a,pt	%r20,<label_0xd0001>
	.word 0x81982747  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_8_206:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_8_206-donret_8_206+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0073c600 | (0x80 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1552, %htstate
	wrhpr %g0, 0x1090, %hpstate  !  rand=1 (8)
	ldx [%r12+%r0], %g1
	retry
donretarg_8_206:
	.word 0xd66fe145  ! 485: LDSTUB_I	ldstub	%r11, [%r31 + 0x0145]
brcommon2_8_208:
    nop
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x99a0054a  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xc19fdb60  ! 489: LDDFA_R	ldda	[%r31, %r0], %f0
splash_cmpr_8_210:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xb3800011  ! 493: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91948001  ! 497: WRPR_PIL_R	wrpr	%r18, %r1, %pil
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
	.word 0x20800001  ! 2: BN	bn,a	<label_0x1>
	.word 0x91b7c4c1  ! 3: FCMPNE32	fcmpne32	%d62, %d32, %r8
	.word 0x9f802060  ! 4: SIR	sir	0x0060
	.word 0x20800001  ! 5: BN	bn,a	<label_0x1>
	.word 0xc3efe030  ! 5: PREFETCHA_I	prefetcha	[%r31, + 0x0030] %asi, #one_read
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_2) + 32, 16, 16)) -> intp(4,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_2)&0xffffffff) + 8, 16, 16)) -> intp(1,0,18,,,,,1)
#else
	set 0xb8005897, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7a409c3  ! 1: FDIVd	fdivd	%f16, %f34, %f50
intvec_4_2:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa5b444cd  ! 1: FCMPNE32	fcmpne32	%d48, %d44, %r18
intvec_4_3:
	.word 0x9f8024cd  ! 6: SIR	sir	0x04cd
	.word 0xc1bfde00  ! 7: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x19400001  ! 8: FBPUGE	fbuge
	.word 0x93b4c4c6  ! 9: FCMPNE32	fcmpne32	%d50, %d6, %r9
	.word 0xe1bfdf20  ! 9: STDFA_R	stda	%f16, [%r0, %r31]
memptr_4_5:
	set 0x60340000, %r31
	.word 0xd3e7c280  ! 10: CASA_I	casa	[%r31] 0x14, %r0, %r9
	.word 0x8581a826  ! 11: WRCCR_I	wr	%r6, 0x0826, %ccr
	.word 0x00800001  ! 12: BN	bn  	<label_0x1>
	.word 0x9f8021c0  ! 13: SIR	sir	0x01c0
	.word 0x00800001  ! 13: BN	bn  	<label_0x1>
memptr_4_6:
	set user_data_start, %r31
	.word 0xe19fde00  ! 14: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85852cb6  ! 15: WRCCR_I	wr	%r20, 0x0cb6, %ccr
	.word 0x00800001  ! 16: BN	bn  	<label_0x1>
	.word 0xe1bfd960  ! 17: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfd960  ! 17: STDFA_R	stda	%f0, [%r0, %r31]
memptr_4_8:
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
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_4_9:
	.word 0xe6dfc283  ! 18: LDXA_R	ldxa	[%r31, %r3] 0x14, %r19
	.word 0x85843d01  ! 19: WRCCR_I	wr	%r16, 0x1d01, %ccr
	.word 0x9f802c45  ! 20: SIR	sir	0x0c45
	.word 0xd0dfd163  ! 21: LDXA_R	ldxa	[%r31, %r3] 0x8b, %r8
	.word 0x85846ec0  ! 21: WRCCR_I	wr	%r17, 0x0ec0, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_11:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_12) + 32, 16, 16)) -> intp(4,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_12)&0xffffffff) + 48, 16, 16)) -> intp(4,0,7,,,,,1)
#else
	set 0xf9006101, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_12:
	.word 0x9bb184cd  ! 22: FCMPNE32	fcmpne32	%d6, %d44, %r13
	.word 0xe1bfd960  ! 23: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x95a1c9c8  ! 24: FDIVd	fdivd	%f38, %f8, %f10
	.word 0x9f8022ac  ! 25: SIR	sir	0x02ac
	.word 0xe19fc3e0  ! 25: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_4_14:
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
intvec_4_15:
	.word 0xe61fe170  ! 26: LDD_I	ldd	[%r31 + 0x0170], %r19
	.word 0x85827dcf  ! 27: WRCCR_I	wr	%r9, 0x1dcf, %ccr
	.word 0xa7b444cb  ! 28: FCMPNE32	fcmpne32	%d48, %d42, %r19
	.word 0xe6dfd163  ! 29: LDXA_R	ldxa	[%r31, %r3] 0x8b, %r19
	.word 0x85843022  ! 29: WRCCR_I	wr	%r16, 0x1022, %ccr
	.word 0xc19fde00  ! 30: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fd960  ! 31: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfde00  ! 32: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fdb60  ! 33: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 33: BN	bn,a	<label_0x1>
	.word 0xe7e7d040  ! 34: CASA_I	casa	[%r31] 0x82, %r0, %r19
	.word 0xa7a7c9c3  ! 35: FDIVd	fdivd	%f62, %f34, %f50
	.word 0xe1bfc3e0  ! 36: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe6dfdf00  ! 37: LDXA_R	ldxa	[%r31, %r0] 0xf8, %r19
	.word 0xc1bfd960  ! 37: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_19:
memptr_4_20:
	set 0x60740000, %r31
	.word 0x9f802311  ! 38: SIR	sir	0x0311
	.word 0x85812c40  ! 39: WRCCR_I	wr	%r4, 0x0c40, %ccr
	.word 0xe21fe090  ! 40: LDD_I	ldd	[%r31 + 0x0090], %r17
	.word 0x39400001  ! 41: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8582284f  ! 41: WRCCR_I	wr	%r8, 0x084f, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_22) + 16, 16, 16)) -> intp(1,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_22)&0xffffffff) + 8, 16, 16)) -> intp(6,0,9,,,,,1)
#else
	set 0x8770665e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_22:
	.word 0xe19fdb60  ! 42: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x87afca43  ! 43: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	.word 0x9f803368  ! 44: SIR	sir	0x1368
	.word 0xe19fde00  ! 45: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9a189d2  ! 45: FDIVd	fdivd	%f6, %f18, %f20
	.word 0xe1bfda00  ! 46: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fdf20  ! 47: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe9e7c242  ! 48: CASA_I	casa	[%r31] 0x12, %r2, %r20
	.word 0xe19fdb60  ! 49: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe83fe030  ! 49: STD_I	std	%r20, [%r31 + 0x0030]
	.word 0xe93fe1c0  ! 50: STDF_I	std	%f20, [0x01c0, %r31]
	.word 0xc1bfc3e0  ! 51: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc32fe190  ! 52: STXFSR_I	st-sfr	%f1, [0x0190, %r31]
	.word 0xe9e7df02  ! 53: CASA_I	casa	[%r31] 0xf8, %r2, %r20
	.word 0xe1bfda00  ! 53: STDFA_R	stda	%f16, [%r0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_26) + 0, 16, 16)) -> intp(3,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_26)&0xffffffff) + 32, 16, 16)) -> intp(4,0,27,,,,,1)
#else
	set 0x9108c9d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x99a189d0  ! 1: FDIVd	fdivd	%f6, %f16, %f12
intvec_4_26:
	.word 0xd297c3c2  ! 54: LDUHA_R	lduha	[%r31, %r2] 0x1e, %r9
	.word 0xd23fe150  ! 55: STD_I	std	%r9, [%r31 + 0x0150]
	.word 0x95a4c9cc  ! 56: FDIVd	fdivd	%f50, %f12, %f10
	.word 0xd4dfd920  ! 57: LDXA_R	ldxa	[%r31, %r0] 0xc9, %r10
	.word 0x39400001  ! 57: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_28) + 56, 16, 16)) -> intp(5,0,24,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_28)&0xffffffff) + 48, 16, 16)) -> intp(5,0,18,,,,,1)
#else
	set 0x2ba0569e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_28:
memptr_4_29:
	set 0x60340000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_30) + 48, 16, 16)) -> intp(5,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_30)&0xffffffff) + 24, 16, 16)) -> intp(1,0,21,,,,,1)
#else
	set 0x1190cd79, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa1b444d4  ! 1: FCMPNE32	fcmpne32	%d48, %d20, %r16
intvec_4_30:
	.word 0xa9b1c4cc  ! 58: FCMPNE32	fcmpne32	%d38, %d12, %r20
	.word 0x8583678f  ! 59: WRCCR_I	wr	%r13, 0x078f, %ccr
	.word 0x9f803dac  ! 60: SIR	sir	0x1dac
	.word 0x99a109c1  ! 61: FDIVd	fdivd	%f4, %f32, %f12
	.word 0x85846338  ! 61: WRCCR_I	wr	%r17, 0x0338, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa9b444c5  ! 1: FCMPNE32	fcmpne32	%d48, %d36, %r20
intvec_4_31:
	.word 0x39400001  ! 62: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5b7c4c3  ! 63: FCMPNE32	fcmpne32	%d62, %d34, %r18
	.word 0xe19fdf20  ! 64: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x39400001  ! 65: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe9e7d100  ! 65: CASA_I	casa	[%r31] 0x88, %r0, %r20
memptr_4_33:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_34) + 24, 16, 16)) -> intp(2,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_34)&0xffffffff) + 40, 16, 16)) -> intp(3,0,29,,,,,1)
#else
	set 0xaaf08a66, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_34:
	.word 0xe897c720  ! 66: LDUHA_R	lduha	[%r31, %r0] 0x39, %r20
	.word 0x8584a1a7  ! 67: WRCCR_I	wr	%r18, 0x01a7, %ccr
	.word 0x9f8024c5  ! 68: SIR	sir	0x04c5
	.word 0xc3efe0b0  ! 69: PREFETCHA_I	prefetcha	[%r31, + 0x00b0] %asi, #one_read
	.word 0x9f803613  ! 69: SIR	sir	0x1613
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_36) + 0, 16, 16)) -> intp(1,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_36)&0xffffffff) + 48, 16, 16)) -> intp(5,0,5,,,,,1)
#else
	set 0xe1f09f16, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_36:
	.word 0x99b044c8  ! 70: FCMPNE32	fcmpne32	%d32, %d8, %r12
	.word 0xc36fe100  ! 71: PREFETCH_I	prefetch	[%r31 + 0x0100], #one_read
	.word 0xd9e7c381  ! 72: CASA_I	casa	[%r31] 0x1c, %r1, %r12
	.word 0xa9b344d1  ! 73: FCMPNE32	fcmpne32	%d44, %d48, %r20
	.word 0x39400001  ! 73: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fe0d0  ! 74: STD_I	std	%r20, [%r31 + 0x00d0]
	.word 0x87afca42  ! 75: FCMPd	fcmpd	%fcc<n>, %f62, %f2
	.word 0xe1bfc3e0  ! 76: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f802010  ! 77: SIR	sir	0x0010
	.word 0xc19fd960  ! 77: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe8dfc6c0  ! 78: LDXA_R	ldxa	[%r31, %r0] 0x36, %r20
	.word 0x87afca43  ! 79: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	.word 0xe81fe080  ! 80: LDD_I	ldd	[%r31 + 0x0080], %r20
	.word 0xc32fe090  ! 81: STXFSR_I	st-sfr	%f1, [0x0090, %r31]
	.word 0xa9b7c4c2  ! 81: FCMPNE32	fcmpne32	%d62, %d2, %r20
memptr_4_40:
	set 0x60740000, %r31
	.word 0xd49fc403  ! 82: LDDA_R	ldda	[%r31, %r3] 0x20, %r10
	.word 0x8584398e  ! 83: WRCCR_I	wr	%r16, 0x198e, %ccr
	.word 0xd5e7c540  ! 84: CASA_I	casa	[%r31] 0x2a, %r0, %r10
	.word 0xd49fc241  ! 85: LDDA_R	ldda	[%r31, %r1] 0x12, %r10
	.word 0xd497c723  ! 85: LDUHA_R	lduha	[%r31, %r3] 0x39, %r10
	.word 0xd43fe010  ! 86: STD_I	std	%r10, [%r31 + 0x0010]
	.word 0xd43fe020  ! 87: STD_I	std	%r10, [%r31 + 0x0020]
	.word 0xd43fe060  ! 88: STD_I	std	%r10, [%r31 + 0x0060]
	.word 0xd53fe1a0  ! 89: STDF_I	std	%f10, [0x01a0, %r31]
	.word 0x24cfc001  ! 89: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x20800001  ! 90: BN	bn,a	<label_0x1>
	.word 0xc19fd920  ! 91: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 92: BN	bn,a	<label_0x1>
	.word 0xe1bfda00  ! 93: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x20800001  ! 93: BN	bn,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_44) + 8, 16, 16)) -> intp(1,0,19,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_44)&0xffffffff) + 16, 16, 16)) -> intp(0,0,2,,,,,1)
#else
	set 0x16b0c08f, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5b104d2  ! 1: FCMPNE32	fcmpne32	%d4, %d18, %r18
intvec_4_44:
memptr_4_45:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_46) + 40, 16, 16)) -> intp(4,0,7,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_46)&0xffffffff) + 40, 16, 16)) -> intp(1,0,30,,,,,1)
#else
	set 0xa4306efe, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa3a209c6  ! 1: FDIVd	fdivd	%f8, %f6, %f48
intvec_4_46:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8584e264  ! 95: WRCCR_I	wr	%r19, 0x0264, %ccr
	.word 0x39400001  ! 96: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a289ca  ! 97: FDIVd	fdivd	%f10, %f10, %f16
	.word 0x85852694  ! 97: WRCCR_I	wr	%r20, 0x0694, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_47:
	.word 0x9f803755  ! 98: SIR	sir	0x1755
	.word 0xe1bfc3e0  ! 99: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfc3e0  ! 100: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f802f37  ! 101: SIR	sir	0x0f37
	.word 0xe19fd920  ! 101: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe41fe0e0  ! 102: LDD_I	ldd	[%r31 + 0x00e0], %r18
	.word 0xe43fe150  ! 103: STD_I	std	%r18, [%r31 + 0x0150]
	.word 0xc19fdc00  ! 104: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe43fe010  ! 105: STD_I	std	%r18, [%r31 + 0x0010]
	.word 0x20800001  ! 105: BN	bn,a	<label_0x1>
	.word 0xe1bfdb60  ! 106: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa5a7c9c0  ! 107: FDIVd	fdivd	%f62, %f0, %f18
	.word 0xc19fdf20  ! 108: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fc2c0  ! 109: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x87afca43  ! 109: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x91b504d0  ! 1: FCMPNE32	fcmpne32	%d20, %d16, %r8
intvec_4_51:
	.word 0x91b444d3  ! 110: FCMPNE32	fcmpne32	%d48, %d50, %r8
	.word 0xc1bfde00  ! 111: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd03fe190  ! 112: STD_I	std	%r8, [%r31 + 0x0190]
	.word 0x39400001  ! 113: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 113: BN	bn,a	<label_0x1>
	.word 0xc3efe030  ! 114: PREFETCHA_I	prefetcha	[%r31, + 0x0030] %asi, #one_read
	.word 0xd1e7e002  ! 115: CASA_R	casa	[%r31] %asi, %r2, %r8
	.word 0xe1bfd960  ! 116: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc32fe0d0  ! 117: STXFSR_I	st-sfr	%f1, [0x00d0, %r31]
	.word 0x87afca40  ! 117: FCMPd	fcmpd	%fcc<n>, %f62, %f0
memptr_4_54:
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
	.word 0x9f802c07  ! 1: SIR	sir	0x0c07
intvec_4_55:
	.word 0xd83fe0a0  ! 118: STD_I	std	%r12, [%r31 + 0x00a0]
	.word 0x85842581  ! 119: WRCCR_I	wr	%r16, 0x0581, %ccr
	.word 0xa9a109c8  ! 120: FDIVd	fdivd	%f4, %f8, %f20
	.word 0xe93fe1f0  ! 121: STDF_I	std	%f20, [0x01f0, %r31]
	.word 0x95a449d2  ! 121: FDIVd	fdivd	%f48, %f18, %f10
memptr_4_57:
	set user_data_start, %r31
	.word 0xc19fdb60  ! 122: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x85846296  ! 123: WRCCR_I	wr	%r17, 0x0296, %ccr
	.word 0x9f802020  ! 124: SIR	sir	0x0020
	.word 0xc1bfda00  ! 125: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1e7c540  ! 125: CASA_I	casa	[%r31] 0x2a, %r0, %r16
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_59:
	.word 0xa9b4c4c2  ! 126: FCMPNE32	fcmpne32	%d50, %d2, %r20
	.word 0x24cfc001  ! 127: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x20800001  ! 128: BN	bn,a	<label_0x1>
	.word 0x9ba0c9cd  ! 129: FDIVd	fdivd	%f34, %f44, %f44
	.word 0xe1bfdc00  ! 129: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc32fe010  ! 130: STXFSR_I	st-sfr	%f1, [0x0010, %r31]
	.word 0xe19fda00  ! 131: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xda97d103  ! 132: LDUHA_R	lduha	[%r31, %r3] 0x88, %r13
	.word 0xc32fe1b0  ! 133: STXFSR_I	st-sfr	%f1, [0x01b0, %r31]
	.word 0xc3efe090  ! 133: PREFETCHA_I	prefetcha	[%r31, + 0x0090] %asi, #one_read
	.word 0xc19fc3e0  ! 134: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fc2c0  ! 135: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x20800001  ! 136: BN	bn,a	<label_0x1>
	.word 0xe1bfde00  ! 137: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x20800001  ! 137: BN	bn,a	<label_0x1>
memptr_4_62:
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
intvec_4_63:
	.word 0xc19fda00  ! 138: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8581ee3e  ! 139: WRCCR_I	wr	%r7, 0x0e3e, %ccr
	.word 0x39400001  ! 140: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfc3e0  ! 141: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa9a4c9d1  ! 141: FDIVd	fdivd	%f50, %f48, %f20
memptr_4_65:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_66) + 8, 16, 16)) -> intp(7,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_66)&0xffffffff) + 0, 16, 16)) -> intp(4,0,31,,,,,1)
#else
	set 0x2cd0cd67, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_66:
	.word 0xe1bfc3e0  ! 142: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x85826fec  ! 143: WRCCR_I	wr	%r9, 0x0fec, %ccr
	.word 0x39400001  ! 144: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc3e0  ! 145: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x85812563  ! 145: WRCCR_I	wr	%r4, 0x0563, %ccr
	.word 0x9f802130  ! 146: SIR	sir	0x0130
	.word 0x20800001  ! 147: BN	bn,a	<label_0x1>
	.word 0xd897df03  ! 148: LDUHA_R	lduha	[%r31, %r3] 0xf8, %r12
	.word 0xd81fe070  ! 149: LDD_I	ldd	[%r31 + 0x0070], %r12
	.word 0xe19fdb60  ! 149: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_68) + 24, 16, 16)) -> intp(4,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_68)&0xffffffff) + 16, 16, 16)) -> intp(7,0,20,,,,,1)
#else
	set 0xe3403ae8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x99a4c9d4  ! 1: FDIVd	fdivd	%f50, %f20, %f12
intvec_4_68:
	.word 0x39400001  ! 150: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87afca41  ! 151: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0xe23fe1f0  ! 152: STD_I	std	%r17, [%r31 + 0x01f0]
	.word 0x19400001  ! 153: FBPUGE	fbuge
	.word 0x04cfc001  ! 153: BRLEZ	brlez,pt  	%r31,<label_0xfc001>
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
	.word 0xe31fe080  ! 154: LDDF_I	ldd	[%r31, 0x0080], %f17
	.word 0xe19fde00  ! 155: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9b084d3  ! 156: FCMPNE32	fcmpne32	%d2, %d50, %r20
	.word 0xe93fe140  ! 157: STDF_I	std	%f20, [0x0140, %r31]
	.word 0x00800001  ! 157: BN	bn  	<label_0x1>
	.word 0x00800001  ! 158: BN	bn  	<label_0x1>
	.word 0xa9b7c4c3  ! 159: FCMPNE32	fcmpne32	%d62, %d34, %r20
	.word 0xe8dfd040  ! 160: LDXA_R	ldxa	[%r31, %r0] 0x82, %r20
	.word 0xc19fd920  ! 161: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe9e7e000  ! 161: CASA_R	casa	[%r31] %asi, %r0, %r20
memptr_4_72:
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
intvec_4_73:
	.word 0xe19fd960  ! 162: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85832bcc  ! 163: WRCCR_I	wr	%r12, 0x0bcc, %ccr
	.word 0x97b404c8  ! 164: FCMPNE32	fcmpne32	%d16, %d8, %r11
	.word 0x00800001  ! 165: BN	bn  	<label_0x1>
	.word 0xa5b504cb  ! 165: FCMPNE32	fcmpne32	%d20, %d42, %r18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f80365e  ! 1: SIR	sir	0x165e
intvec_4_75:
	.word 0xd53fe170  ! 166: STDF_I	std	%f10, [0x0170, %r31]
	.word 0x20800001  ! 167: BN	bn,a	<label_0x1>
	.word 0xa9b504d3  ! 168: FCMPNE32	fcmpne32	%d20, %d50, %r20
	.word 0x9f802140  ! 169: SIR	sir	0x0140
	.word 0x9f80237a  ! 169: SIR	sir	0x037a
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_77:
memptr_4_78:
	set user_data_start, %r31
	.word 0x9f802c1d  ! 170: SIR	sir	0x0c1d
	.word 0x85832c89  ! 171: WRCCR_I	wr	%r12, 0x0c89, %ccr
	.word 0xe1bfda00  ! 172: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f80332d  ! 173: SIR	sir	0x132d
	.word 0xc19fd960  ! 173: LDDFA_R	ldda	[%r31, %r0], %f0
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_79:
	.word 0x91b304d0  ! 174: FCMPNE32	fcmpne32	%d12, %d16, %r8
	.word 0x87afca40  ! 175: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0xc19fd920  ! 176: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x19400001  ! 177: FBPUGE	fbuge
	.word 0xe1e7e001  ! 177: CASA_R	casa	[%r31] %asi, %r1, %r16
	.word 0xe11fe020  ! 178: LDDF_I	ldd	[%r31, 0x0020], %f16
	.word 0xc19fdc00  ! 179: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe01fe030  ! 180: LDD_I	ldd	[%r31 + 0x0030], %r16
	.word 0xe03fe190  ! 181: STD_I	std	%r16, [%r31 + 0x0190]
	.word 0xc1bfdc00  ! 181: STDFA_R	stda	%f0, [%r0, %r31]
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_82) + 0, 16, 16)) -> intp(4,0,28,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_82)&0xffffffff) + 16, 16, 16)) -> intp(1,0,3,,,,,1)
#else
	set 0xcc00d8c0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_82:
	.word 0x39400001  ! 182: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fde00  ! 183: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc19fd920  ! 184: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f80281f  ! 185: SIR	sir	0x081f
	.word 0x20800001  ! 185: BN	bn,a	<label_0x1>
memptr_4_84:
	set user_data_start, %r31
	.word 0xd71fe100  ! 186: LDDF_I	ldd	[%r31, 0x0100], %f11
	.word 0x8582277b  ! 187: WRCCR_I	wr	%r8, 0x077b, %ccr
	.word 0xd6dfc401  ! 188: LDXA_R	ldxa	[%r31, %r1] 0x20, %r11
	.word 0xc3efe1f0  ! 189: PREFETCHA_I	prefetcha	[%r31, + 0x01f0] %asi, #one_read
	.word 0xd6dfd061  ! 189: LDXA_R	ldxa	[%r31, %r1] 0x83, %r11
memptr_4_85:
	set 0x60540000, %r31
	.word 0xd697c243  ! 190: LDUHA_R	lduha	[%r31, %r3] 0x12, %r11
	.word 0x8584a0ce  ! 191: WRCCR_I	wr	%r18, 0x00ce, %ccr
	.word 0xe19fc2c0  ! 192: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc3efe1e0  ! 193: PREFETCHA_I	prefetcha	[%r31, + 0x01e0] %asi, #one_read
	.word 0x8584ef48  ! 193: WRCCR_I	wr	%r19, 0x0f48, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_86) + 48, 16, 16)) -> intp(7,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_86)&0xffffffff) + 48, 16, 16)) -> intp(3,0,14,,,,,1)
#else
	set 0xfb50a24b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_4_86:
	.word 0x93b044d4  ! 194: FCMPNE32	fcmpne32	%d32, %d20, %r9
	.word 0x93a7c9c2  ! 195: FDIVd	fdivd	%f62, %f2, %f40
	.word 0x20800001  ! 196: BN	bn,a	<label_0x1>
	.word 0x19400001  ! 197: FBPUGE	fbuge
	.word 0xd3e7d042  ! 197: CASA_I	casa	[%r31] 0x82, %r2, %r9
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_88) + 32, 16, 16)) -> intp(0,0,1,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_88)&0xffffffff) + 16, 16, 16)) -> intp(7,0,14,,,,,1)
#else
	set 0x9c10b30a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_88:
	.word 0xa7b444cc  ! 198: FCMPNE32	fcmpne32	%d48, %d12, %r19
	.word 0x20800001  ! 199: BN	bn,a	<label_0x1>
	.word 0xe73fe0d0  ! 200: STDF_I	std	%f19, [0x00d0, %r31]
	.word 0xa3a289c3  ! 201: FDIVd	fdivd	%f10, %f34, %f48
	.word 0xe19fdb60  ! 201: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc1bfdf20  ! 202: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa3b7c4c3  ! 203: FCMPNE32	fcmpne32	%d62, %d34, %r17
	.word 0xe297c401  ! 204: LDUHA_R	lduha	[%r31, %r1] 0x20, %r17
	.word 0x20800001  ! 205: BN	bn,a	<label_0x1>
	.word 0x24cfc001  ! 205: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
memptr_4_91:
	set 0x60340000, %r31
	.word 0xe19fda00  ! 206: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85832ea4  ! 207: WRCCR_I	wr	%r12, 0x0ea4, %ccr
	.word 0xe2dfd061  ! 208: LDXA_R	ldxa	[%r31, %r1] 0x83, %r17
	.word 0x20800001  ! 209: BN	bn,a	<label_0x1>
	.word 0x85827b92  ! 209: WRCCR_I	wr	%r9, 0x1b92, %ccr
memptr_4_93:
	set user_data_start, %r31
	.word 0x20800001  ! 210: BN	bn,a	<label_0x1>
	.word 0x85837bf2  ! 211: WRCCR_I	wr	%r13, 0x1bf2, %ccr
	.word 0xc19fc2c0  ! 212: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1bfd960  ! 213: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x8581e435  ! 213: WRCCR_I	wr	%r7, 0x0435, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_95:
	.word 0xe19fda00  ! 214: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd83fe150  ! 215: STD_I	std	%r12, [%r31 + 0x0150]
	.word 0x95a189d2  ! 216: FDIVd	fdivd	%f6, %f18, %f10
	.word 0x20800001  ! 217: BN	bn,a	<label_0x1>
	.word 0x95a7c9c1  ! 217: FDIVd	fdivd	%f62, %f32, %f10
memptr_4_97:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_98) + 24, 16, 16)) -> intp(5,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_98)&0xffffffff) + 24, 16, 16)) -> intp(5,0,30,,,,,1)
#else
	set 0x9fe06a4d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_98:
	.word 0x20800001  ! 218: BN	bn,a	<label_0x1>
	.word 0x8584b1d9  ! 219: WRCCR_I	wr	%r18, 0x11d9, %ccr
	.word 0x19400001  ! 220: FBPUGE	fbuge
	.word 0x00800001  ! 221: BN	bn  	<label_0x1>
	.word 0x19400001  ! 221: FBPUGE	fbuge
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_100) + 56, 16, 16)) -> intp(5,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_100)&0xffffffff) + 0, 16, 16)) -> intp(3,0,0,,,,,1)
#else
	set 0xbbc0652b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_4_100:
memptr_4_101:
	set 0x60340000, %r31
	.word 0x93b344c8  ! 222: FCMPNE32	fcmpne32	%d44, %d8, %r9
	.word 0x8580f0b7  ! 223: WRCCR_I	wr	%r3, 0x10b7, %ccr
	.word 0xd3e7c382  ! 224: CASA_I	casa	[%r31] 0x1c, %r2, %r9
	.word 0x9f8022e9  ! 225: SIR	sir	0x02e9
	.word 0x858121d9  ! 225: WRCCR_I	wr	%r4, 0x01d9, %ccr
	.word 0xe19fde00  ! 226: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x39400001  ! 227: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd897d103  ! 228: LDUHA_R	lduha	[%r31, %r3] 0x88, %r12
	.word 0xe19fdb60  ! 229: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc3efe020  ! 229: PREFETCHA_I	prefetcha	[%r31, + 0x0020] %asi, #one_read
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa7a4c9c4  ! 1: FDIVd	fdivd	%f50, %f4, %f50
intvec_4_103:
memptr_4_104:
	set 0x60140000, %r31
	.word 0x9f80264e  ! 230: SIR	sir	0x064e
	.word 0x8584b82d  ! 231: WRCCR_I	wr	%r18, 0x182d, %ccr
	.word 0xe9e7d040  ! 232: CASA_I	casa	[%r31] 0x82, %r0, %r20
	.word 0xa5b304c6  ! 233: FCMPNE32	fcmpne32	%d12, %d6, %r18
	.word 0x858439b8  ! 233: WRCCR_I	wr	%r16, 0x19b8, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_106) + 56, 16, 16)) -> intp(3,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_106)&0xffffffff) + 56, 16, 16)) -> intp(7,0,12,,,,,1)
#else
	set 0x89400d47, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_106:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_107:
	.word 0x97a149cd  ! 234: FDIVd	fdivd	%f36, %f44, %f42
	.word 0x20800001  ! 235: BN	bn,a	<label_0x1>
	.word 0xa7b284d0  ! 236: FCMPNE32	fcmpne32	%d10, %d16, %r19
	.word 0xa7b484c8  ! 237: FCMPNE32	fcmpne32	%d18, %d8, %r19
	.word 0xe19fde00  ! 237: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_4_109:
	set 0x60340000, %r31
	.word 0xc1bfd920  ! 238: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x858375b9  ! 239: WRCCR_I	wr	%r13, 0x15b9, %ccr
	.word 0xe1bfde00  ! 240: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc1bfdf20  ! 241: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x85812ef6  ! 241: WRCCR_I	wr	%r4, 0x0ef6, %ccr
memptr_4_111:
	set user_data_start, %r31
	.word 0xe19fdf20  ! 242: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8584e2a9  ! 243: WRCCR_I	wr	%r19, 0x02a9, %ccr
	.word 0xe1bfc2c0  ! 244: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fda00  ! 245: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe19fd960  ! 245: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc19fdf20  ! 246: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x39400001  ! 247: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802120  ! 248: SIR	sir	0x0120
	.word 0xe1bfda00  ! 249: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x39400001  ! 249: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 250: BN	bn,a	<label_0x1>
	.word 0xe19fd960  ! 251: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe19fde00  ! 252: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1bfd960  ! 253: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xc19fde00  ! 253: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fdc00  ! 254: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc19fd960  ! 255: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe41fe000  ! 256: LDD_I	ldd	[%r31 + 0x0000], %r18
	.word 0x20800001  ! 257: BN	bn,a	<label_0x1>
	.word 0xe1bfd960  ! 257: STDFA_R	stda	%f16, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_113:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_114) + 16, 16, 16)) -> intp(6,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_114)&0xffffffff) + 16, 16, 16)) -> intp(6,0,5,,,,,1)
#else
	set 0xc35011c9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_4_114:
	.word 0x9f803de9  ! 258: SIR	sir	0x1de9
	.word 0xa1a7c9c1  ! 259: FDIVd	fdivd	%f62, %f32, %f16
	.word 0xa3b344d1  ! 260: FCMPNE32	fcmpne32	%d44, %d48, %r17
	.word 0x39400001  ! 261: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803b4d  ! 261: SIR	sir	0x1b4d
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_115:
	.word 0xe69fc3c1  ! 262: LDDA_R	ldda	[%r31, %r1] 0x1e, %r19
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803228  ! 264: SIR	sir	0x1228
	.word 0xd3e7c542  ! 265: CASA_I	casa	[%r31] 0x2a, %r2, %r9
	.word 0x87afca41  ! 265: FCMPd	fcmpd	%fcc<n>, %f62, %f32
	.word 0xd33fe110  ! 266: STDF_I	std	%f9, [0x0110, %r31]
	.word 0xc1bfc2c0  ! 267: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd2dfc723  ! 268: LDXA_R	ldxa	[%r31, %r3] 0x39, %r9
	.word 0xd3e7d162  ! 269: CASA_I	casa	[%r31] 0x8b, %r2, %r9
	.word 0x9f8020c0  ! 269: SIR	sir	0x00c0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_118) + 0, 16, 16)) -> intp(1,0,30,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_118)&0xffffffff) + 0, 16, 16)) -> intp(7,0,15,,,,,1)
#else
	set 0x7cd02c43, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_118:
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x99b484c9  ! 1: FCMPNE32	fcmpne32	%d18, %d40, %r12
intvec_4_119:
	.word 0x93a249d3  ! 270: FDIVd	fdivd	%f40, %f50, %f40
	.word 0x24cfc001  ! 271: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x19400001  ! 272: FBPUGE	fbuge
	.word 0x9f8037b1  ! 273: SIR	sir	0x17b1
	.word 0xe5e7c542  ! 273: CASA_I	casa	[%r31] 0x2a, %r2, %r18
	.word 0xe1bfd920  ! 274: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe03fe140  ! 275: STD_I	std	%r16, [%r31 + 0x0140]
	.word 0xc1bfde00  ! 276: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe1bfdb60  ! 277: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x87afca43  ! 277: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_121:
	.word 0x91a409ca  ! 278: FDIVd	fdivd	%f16, %f10, %f8
	.word 0x91a7c9c3  ! 279: FDIVd	fdivd	%f62, %f34, %f8
	.word 0x20800001  ! 280: BN	bn,a	<label_0x1>
	.word 0x97a489cd  ! 281: FDIVd	fdivd	%f18, %f44, %f42
	.word 0xc1bfd960  ! 281: STDFA_R	stda	%f0, [%r0, %r31]
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_123:
	.word 0x20800001  ! 282: BN	bn,a	<label_0x1>
	.word 0xd7e7d063  ! 283: CASA_I	casa	[%r31] 0x83, %r3, %r11
	.word 0x95a189d3  ! 284: FDIVd	fdivd	%f6, %f50, %f10
	.word 0xe1bfd920  ! 285: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd43fe040  ! 285: STD_I	std	%r10, [%r31 + 0x0040]
	.word 0xc1bfd920  ! 286: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x87afca43  ! 287: FCMPd	fcmpd	%fcc<n>, %f62, %f34
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
	.word 0xc1bfde00  ! 289: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fdf20  ! 289: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_4_126:
	set user_data_start, %r31
	.word 0xc19fdf20  ! 290: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x8580b84f  ! 291: WRCCR_I	wr	%r2, 0x184f, %ccr
	.word 0xc19fdb60  ! 292: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 293: BN	bn,a	<label_0x1>
	.word 0x8584e323  ! 293: WRCCR_I	wr	%r19, 0x0323, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x9f803c06  ! 1: SIR	sir	0x1c06
intvec_4_127:
	.word 0x91b084d0  ! 294: FCMPNE32	fcmpne32	%d2, %d16, %r8
	.word 0xd03fe1c0  ! 295: STD_I	std	%r8, [%r31 + 0x01c0]
	.word 0xd13fe180  ! 296: STDF_I	std	%f8, [0x0180, %r31]
	.word 0x91a209cc  ! 297: FDIVd	fdivd	%f8, %f12, %f8
	.word 0xd1e7d003  ! 297: CASA_I	casa	[%r31] 0x80, %r3, %r8
memptr_4_128:
	set 0x60140000, %r31
	.word 0xd097c540  ! 298: LDUHA_R	lduha	[%r31, %r0] 0x2a, %r8
	.word 0x8580b699  ! 299: WRCCR_I	wr	%r2, 0x1699, %ccr
	.word 0xd0dfd060  ! 300: LDXA_R	ldxa	[%r31, %r0] 0x83, %r8
	.word 0xd03fe150  ! 301: STD_I	std	%r8, [%r31 + 0x0150]
	.word 0xd09fdc41  ! 301: LDDA_R	ldda	[%r31, %r1] 0xe2, %r8
	.word 0xc19fd960  ! 302: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc36fe090  ! 303: PREFETCH_I	prefetch	[%r31 + 0x0090], #one_read
	.word 0x20800001  ! 304: BN	bn,a	<label_0x1>
	.word 0xc19fc2c0  ! 305: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc1bfdf20  ! 305: STDFA_R	stda	%f0, [%r0, %r31]
memptr_4_130:
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
	.word 0xa7a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f50
intvec_4_131:
	.word 0xc19fdf20  ! 306: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x85806fd9  ! 307: WRCCR_I	wr	%r1, 0x0fd9, %ccr
	.word 0x9f80392e  ! 308: SIR	sir	0x192e
	.word 0xc19fdb60  ! 309: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa5b484c4  ! 309: FCMPNE32	fcmpne32	%d18, %d4, %r18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_133:
	.word 0xe1bfc3e0  ! 310: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x00800001  ! 311: BN	bn  	<label_0x1>
	.word 0x39400001  ! 312: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 313: BN	bn,a	<label_0x1>
	.word 0xe19fd920  ! 313: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_4_134:
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
intvec_4_135:
	.word 0xe697d060  ! 314: LDUHA_R	lduha	[%r31, %r0] 0x83, %r19
	.word 0x85846c5a  ! 315: WRCCR_I	wr	%r17, 0x0c5a, %ccr
	.word 0x9f8028b2  ! 316: SIR	sir	0x08b2
	.word 0xe81fe1a0  ! 317: LDD_I	ldd	[%r31 + 0x01a0], %r20
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfc282  ! 318: LDXA_R	ldxa	[%r31, %r2] 0x14, %r17
	.word 0x20800001  ! 319: BN	bn,a	<label_0x1>
	.word 0xe297c243  ! 320: LDUHA_R	lduha	[%r31, %r3] 0x12, %r17
	.word 0xe297d142  ! 321: LDUHA_R	lduha	[%r31, %r2] 0x8a, %r17
	.word 0x9f8021b0  ! 321: SIR	sir	0x01b0
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_136) + 32, 16, 16)) -> intp(4,0,27,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_136)&0xffffffff) + 24, 16, 16)) -> intp(1,0,12,,,,,1)
#else
	set 0x2240655d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_136:
	.word 0x39400001  ! 322: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xe1bfdc00  ! 324: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x19400001  ! 325: FBPUGE	fbuge
	.word 0x00800001  ! 325: BN	bn  	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_138) + 0, 16, 16)) -> intp(6,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_138)&0xffffffff) + 0, 16, 16)) -> intp(1,0,7,,,,,1)
#else
	set 0xf630630b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa7a449cd  ! 1: FDIVd	fdivd	%f48, %f44, %f50
intvec_4_138:
	.word 0x9ba449c5  ! 326: FDIVd	fdivd	%f48, %f36, %f44
	.word 0xdbe7e003  ! 327: CASA_R	casa	[%r31] %asi, %r3, %r13
	.word 0xda3fe090  ! 328: STD_I	std	%r13, [%r31 + 0x0090]
	.word 0xa1a489c8  ! 329: FDIVd	fdivd	%f18, %f8, %f16
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe0dfd160  ! 330: LDXA_R	ldxa	[%r31, %r0] 0x8b, %r16
	.word 0x20800001  ! 331: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 332: BN	bn,a	<label_0x1>
	.word 0xe13fe1c0  ! 333: STDF_I	std	%f16, [0x01c0, %r31]
	.word 0xe19fd960  ! 333: LDDFA_R	ldda	[%r31, %r0], %f16
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_139:
	.word 0xe1bfd960  ! 334: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa1b7c4c1  ! 335: FCMPNE32	fcmpne32	%d62, %d32, %r16
	.word 0x9ba509d4  ! 336: FDIVd	fdivd	%f20, %f20, %f44
	.word 0xe1bfc2c0  ! 337: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x19400001  ! 337: FBPUGE	fbuge
	.word 0xe1bfdc00  ! 338: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd9e7df03  ! 339: CASA_I	casa	[%r31] 0xf8, %r3, %r12
	.word 0xd83fe160  ! 340: STD_I	std	%r12, [%r31 + 0x0160]
	.word 0xe19fda00  ! 341: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x87afca41  ! 341: FCMPd	fcmpd	%fcc<n>, %f62, %f32
memptr_4_141:
	set user_data_start, %r31
	.word 0xd89fc723  ! 342: LDDA_R	ldda	[%r31, %r3] 0x39, %r12
	.word 0x85853f84  ! 343: WRCCR_I	wr	%r20, 0x1f84, %ccr
	.word 0xc1bfdf20  ! 344: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f802020  ! 345: SIR	sir	0x0020
	.word 0x8582e67a  ! 345: WRCCR_I	wr	%r11, 0x067a, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_143:
memptr_4_144:
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
	.word 0x99a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f12
intvec_4_145:
	.word 0x95a2c9d3  ! 346: FDIVd	fdivd	%f42, %f50, %f10
	.word 0x858424f0  ! 347: WRCCR_I	wr	%r16, 0x04f0, %ccr
	.word 0x9f803c9b  ! 348: SIR	sir	0x1c9b
	.word 0x99a409d4  ! 349: FDIVd	fdivd	%f16, %f20, %f12
	.word 0x95b184d1  ! 349: FCMPNE32	fcmpne32	%d6, %d48, %r10
	.word 0x9f8021f0  ! 350: SIR	sir	0x01f0
	.word 0xd5e7e001  ! 351: CASA_R	casa	[%r31] %asi, %r1, %r10
	.word 0xc19fd920  ! 352: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd4dfc602  ! 353: LDXA_R	ldxa	[%r31, %r2] 0x30, %r10
	.word 0xe19fd920  ! 353: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_4_148:
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
intvec_4_149:
	.word 0xe19fda00  ! 354: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x85842dc4  ! 355: WRCCR_I	wr	%r16, 0x0dc4, %ccr
	.word 0xa5b484d4  ! 356: FCMPNE32	fcmpne32	%d18, %d20, %r18
	.word 0xe19fd960  ! 357: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x8581bd85  ! 357: WRCCR_I	wr	%r6, 0x1d85, %ccr
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_151:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 359: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 360: BN	bn,a	<label_0x1>
	.word 0xa5b244d0  ! 361: FCMPNE32	fcmpne32	%d40, %d16, %r18
	.word 0x20800001  ! 361: BN	bn,a	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_152) + 16, 16, 16)) -> intp(4,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_152)&0xffffffff) + 16, 16, 16)) -> intp(0,0,12,,,,,1)
#else
	set 0x23506de6, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_152:
	.word 0xe5e7d003  ! 362: CASA_I	casa	[%r31] 0x80, %r3, %r18
	.word 0xa5b7c4c1  ! 363: FCMPNE32	fcmpne32	%d62, %d32, %r18
	.word 0x99b404d2  ! 364: FCMPNE32	fcmpne32	%d16, %d18, %r12
	.word 0xc32fe110  ! 365: STXFSR_I	st-sfr	%f1, [0x0110, %r31]
	.word 0x87afca43  ! 365: FCMPd	fcmpd	%fcc<n>, %f62, %f34
memptr_4_153:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_154) + 56, 16, 16)) -> intp(6,0,18,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_154)&0xffffffff) + 40, 16, 16)) -> intp(6,0,0,,,,,1)
#else
	set 0x5920934a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f8035d1  ! 1: SIR	sir	0x15d1
intvec_4_154:
	.word 0xc19fde00  ! 366: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x858334ce  ! 367: WRCCR_I	wr	%r12, 0x14ce, %ccr
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 369: BN	bn,a	<label_0x1>
	.word 0x85822a67  ! 369: WRCCR_I	wr	%r8, 0x0a67, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_156) + 0, 16, 16)) -> intp(6,0,0,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_156)&0xffffffff) + 32, 16, 16)) -> intp(3,0,26,,,,,1)
#else
	set 0xbfc0927d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9f802c08  ! 1: SIR	sir	0x0c08
intvec_4_156:
memptr_4_157:
	set 0x60140000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_158) + 8, 16, 16)) -> intp(2,0,1,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_158)&0xffffffff) + 40, 16, 16)) -> intp(2,0,3,,,,,1)
#else
	set 0x78607f7a, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9bb484c9  ! 1: FCMPNE32	fcmpne32	%d18, %d40, %r13
intvec_4_158:
	.word 0x39400001  ! 370: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8584ff22  ! 371: WRCCR_I	wr	%r19, 0x1f22, %ccr
	.word 0xa9b184d4  ! 372: FCMPNE32	fcmpne32	%d6, %d20, %r20
	.word 0x95b244d2  ! 373: FCMPNE32	fcmpne32	%d40, %d18, %r10
	.word 0x8584a1c7  ! 373: WRCCR_I	wr	%r18, 0x01c7, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_160) + 56, 16, 16)) -> intp(4,0,12,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_160)&0xffffffff) + 8, 16, 16)) -> intp(6,0,13,,,,,1)
#else
	set 0x70503530, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_160:
memptr_4_161:
	set 0x60140000, %r31
	.word 0x19400001  ! 374: FBPUGE	fbuge
	.word 0x8582a62f  ! 375: WRCCR_I	wr	%r10, 0x062f, %ccr
	.word 0xe19fda00  ! 376: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f80331d  ! 377: SIR	sir	0x131d
	.word 0xe19fdc00  ! 377: LDDFA_R	ldda	[%r31, %r0], %f16
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_162) + 16, 16, 16)) -> intp(1,0,12,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_162)&0xffffffff) + 56, 16, 16)) -> intp(0,0,19,,,,,1)
#else
	set 0x3f80f704, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_4_162:
	.word 0xa3a049c6  ! 378: FDIVd	fdivd	%f32, %f6, %f48
	.word 0xc1bfd960  ! 379: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x20800001  ! 380: BN	bn,a	<label_0x1>
	.word 0x9f803263  ! 381: SIR	sir	0x1263
	.word 0x20800001  ! 381: BN	bn,a	<label_0x1>
	.word 0xe31fe1e0  ! 382: LDDF_I	ldd	[%r31, 0x01e0], %f17
	.word 0xe1bfc3e0  ! 383: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe21fe090  ! 384: LDD_I	ldd	[%r31 + 0x0090], %r17
	.word 0xc32fe080  ! 385: STXFSR_I	st-sfr	%f1, [0x0080, %r31]
	.word 0xe2dfd003  ! 385: LDXA_R	ldxa	[%r31, %r3] 0x80, %r17
	.word 0x00800001  ! 386: BN	bn  	<label_0x1>
	.word 0x00800001  ! 387: BN	bn  	<label_0x1>
	.word 0x00800001  ! 388: BN	bn  	<label_0x1>
	.word 0x00800001  ! 389: BN	bn  	<label_0x1>
	.word 0xc19fc2c0  ! 389: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe497d162  ! 390: LDUHA_R	lduha	[%r31, %r2] 0x8b, %r18
	.word 0xe19fdb60  ! 391: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc1bfd960  ! 392: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe53fe0e0  ! 393: STDF_I	std	%f18, [0x00e0, %r31]
	.word 0x00800001  ! 393: BN	bn  	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_165:
memptr_4_166:
	set 0x60340000, %r31
	.word 0x9f802c18  ! 394: SIR	sir	0x0c18
	.word 0x8582a18e  ! 395: WRCCR_I	wr	%r10, 0x018e, %ccr
	.word 0x9f802080  ! 396: SIR	sir	0x0080
	.word 0x19400001  ! 397: FBPUGE	fbuge
	.word 0x85853d6c  ! 397: WRCCR_I	wr	%r20, 0x1d6c, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_168) + 16, 16, 16)) -> intp(6,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_168)&0xffffffff) + 0, 16, 16)) -> intp(2,0,10,,,,,1)
#else
	set 0xbf106249, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_4_168:
	.word 0xc19fdf20  ! 398: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 399: BN	bn,a	<label_0x1>
	.word 0x99a289c9  ! 400: FDIVd	fdivd	%f10, %f40, %f12
	.word 0x20800001  ! 401: BN	bn,a	<label_0x1>
	.word 0x95b484c4  ! 401: FCMPNE32	fcmpne32	%d18, %d4, %r10
memptr_4_169:
	set 0x60740000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_170) + 8, 16, 16)) -> intp(7,0,20,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_170)&0xffffffff) + 0, 16, 16)) -> intp(1,0,24,,,,,1)
#else
	set 0x9a00272d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa5a289d1  ! 1: FDIVd	fdivd	%f10, %f48, %f18
intvec_4_170:
	.word 0xe497d060  ! 402: LDUHA_R	lduha	[%r31, %r0] 0x83, %r18
	.word 0x85847c22  ! 403: WRCCR_I	wr	%r17, 0x1c22, %ccr
	.word 0x93b404d4  ! 404: FCMPNE32	fcmpne32	%d16, %d20, %r9
	.word 0xc3efe0e0  ! 405: PREFETCHA_I	prefetcha	[%r31, + 0x00e0] %asi, #one_read
	.word 0x8584e8ec  ! 405: WRCCR_I	wr	%r19, 0x08ec, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_172) + 0, 16, 16)) -> intp(0,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_172)&0xffffffff) + 40, 16, 16)) -> intp(3,0,4,,,,,1)
#else
	set 0xfc40339e, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_172:
	.word 0xd31fe160  ! 406: LDDF_I	ldd	[%r31, 0x0160], %f9
	.word 0x19400001  ! 407: FBPUGE	fbuge
	.word 0x9f802781  ! 408: SIR	sir	0x0781
	.word 0xd53fe130  ! 409: STDF_I	std	%f10, [0x0130, %r31]
	.word 0xa9a449ca  ! 409: FDIVd	fdivd	%f48, %f10, %f20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_174) + 24, 16, 16)) -> intp(2,0,10,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_174)&0xffffffff) + 40, 16, 16)) -> intp(4,0,23,,,,,1)
#else
	set 0xec02aec, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_174:
	.word 0xc32fe010  ! 410: STXFSR_I	st-sfr	%f1, [0x0010, %r31]
	.word 0xe19fde00  ! 411: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x39400001  ! 412: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc32fe120  ! 413: STXFSR_I	st-sfr	%f1, [0x0120, %r31]
	.word 0xc19fd920  ! 413: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe53fe170  ! 414: STDF_I	std	%f18, [0x0170, %r31]
	.word 0x87afca40  ! 415: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0xe19fdc00  ! 416: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802150  ! 417: SIR	sir	0x0150
	.word 0x00800001  ! 417: BN	bn  	<label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_176) + 8, 16, 16)) -> intp(3,0,9,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_176)&0xffffffff) + 40, 16, 16)) -> intp(5,0,9,,,,,1)
#else
	set 0xe7a05789, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_4_176:
	.word 0x39400001  ! 418: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87afca40  ! 419: FCMPd	fcmpd	%fcc<n>, %f62, %f0
	.word 0xc3efe0c0  ! 420: PREFETCHA_I	prefetcha	[%r31, + 0x00c0] %asi, #one_read
	.word 0x9f803655  ! 421: SIR	sir	0x1655
	.word 0x99b7c4c2  ! 421: FCMPNE32	fcmpne32	%d62, %d2, %r12
memptr_4_177:
	set user_data_start, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_178) + 24, 16, 16)) -> intp(7,0,1,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_178)&0xffffffff) + 48, 16, 16)) -> intp(3,0,15,,,,,1)
#else
	set 0x58b04904, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_178:
	.word 0xc32fe1e0  ! 422: STXFSR_I	st-sfr	%f1, [0x01e0, %r31]
	.word 0x8581e4e2  ! 423: WRCCR_I	wr	%r7, 0x04e2, %ccr
	.word 0xa5b1c4d3  ! 424: FCMPNE32	fcmpne32	%d38, %d50, %r18
	.word 0xe5e7df01  ! 425: CASA_I	casa	[%r31] 0xf8, %r1, %r18
	.word 0x8580b4b9  ! 425: WRCCR_I	wr	%r2, 0x14b9, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_180) + 8, 16, 16)) -> intp(2,0,14,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_180)&0xffffffff) + 8, 16, 16)) -> intp(5,0,21,,,,,1)
#else
	set 0xb5c08f0b, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9ba149cb  ! 1: FDIVd	fdivd	%f36, %f42, %f44
intvec_4_180:
	.word 0xc3efe0f0  ! 426: PREFETCHA_I	prefetcha	[%r31, + 0x00f0] %asi, #one_read
	.word 0xdbe7e001  ! 427: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x39400001  ! 428: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc3efe1f0  ! 429: PREFETCHA_I	prefetcha	[%r31, + 0x01f0] %asi, #one_read
	.word 0x9f803dc8  ! 429: SIR	sir	0x1dc8
	.word 0xe51fe1c0  ! 430: LDDF_I	ldd	[%r31, 0x01c0], %f18
	.word 0xe19fd920  ! 431: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802140  ! 432: SIR	sir	0x0140
	.word 0xe51fe130  ! 433: LDDF_I	ldd	[%r31, 0x0130], %f18
	.word 0xe4dfc400  ! 433: LDXA_R	ldxa	[%r31, %r0] 0x20, %r18
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_183:
	.word 0x20800001  ! 434: BN	bn,a	<label_0x1>
	.word 0xc1bfd920  ! 435: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9f8026df  ! 436: SIR	sir	0x06df
	.word 0x20800001  ! 437: BN	bn,a	<label_0x1>
	.word 0x91a049d2  ! 437: FDIVd	fdivd	%f32, %f18, %f8
memptr_4_185:
	set 0x60540000, %r31
	.word 0xd13fe100  ! 438: STDF_I	std	%f8, [0x0100, %r31]
	.word 0x8584e31e  ! 439: WRCCR_I	wr	%r19, 0x031e, %ccr
	.word 0x9f802100  ! 440: SIR	sir	0x0100
	.word 0xc32fe0c0  ! 441: STXFSR_I	st-sfr	%f1, [0x00c0, %r31]
	.word 0x8584e7bf  ! 441: WRCCR_I	wr	%r19, 0x07bf, %ccr
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_186) + 32, 16, 16)) -> intp(7,0,31,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_186)&0xffffffff) + 32, 16, 16)) -> intp(1,0,3,,,,,1)
#else
	set 0xbac0cfff, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x97b4c4d1  ! 1: FCMPNE32	fcmpne32	%d50, %d48, %r11
intvec_4_186:
memptr_4_187:
	set 0x60540000, %r31
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_188) + 48, 16, 16)) -> intp(0,0,18,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_188)&0xffffffff) + 8, 16, 16)) -> intp(4,0,23,,,,,1)
#else
	set 0xee704c06, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_188:
	.word 0xa1a409cd  ! 442: FDIVd	fdivd	%f16, %f44, %f16
	.word 0x858532e3  ! 443: WRCCR_I	wr	%r20, 0x12e3, %ccr
	.word 0x93a489c2  ! 444: FDIVd	fdivd	%f18, %f2, %f40
	.word 0x9f80391e  ! 445: SIR	sir	0x191e
	.word 0x858474e0  ! 445: WRCCR_I	wr	%r17, 0x14e0, %ccr
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
intvec_4_189:
	.word 0xc19fd960  ! 446: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xc1bfc2c0  ! 447: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x39400001  ! 448: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fc2c0  ! 449: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa3b284d3  ! 449: FCMPNE32	fcmpne32	%d10, %d50, %r17
	.word 0xc32fe1b0  ! 450: STXFSR_I	st-sfr	%f1, [0x01b0, %r31]
	.word 0xc19fd920  ! 451: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x20800001  ! 452: BN	bn,a	<label_0x1>
	.word 0xe33fe170  ! 453: STDF_I	std	%f17, [0x0170, %r31]
	.word 0x20800001  ! 453: BN	bn,a	<label_0x1>
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa7b444d1  ! 1: FCMPNE32	fcmpne32	%d48, %d48, %r19
intvec_4_191:
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_192) + 0, 16, 16)) -> intp(5,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_192)&0xffffffff) + 8, 16, 16)) -> intp(1,0,24,,,,,1)
#else
	set 0x87305c77, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_192:
	.word 0xa3a289c7  ! 454: FDIVd	fdivd	%f10, %f38, %f48
	.word 0xa3a7c9c0  ! 455: FDIVd	fdivd	%f62, %f0, %f48
	.word 0x39400001  ! 456: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x19400001  ! 457: FBPUGE	fbuge
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_194) + 24, 16, 16)) -> intp(2,0,21,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_194)&0xffffffff) + 24, 16, 16)) -> intp(0,0,13,,,,,1)
#else
	set 0x6930f178, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_194:
	.word 0xc32fe1d0  ! 458: STXFSR_I	st-sfr	%f1, [0x01d0, %r31]
	.word 0x9ba7c9c0  ! 459: FDIVd	fdivd	%f62, %f0, %f44
	.word 0x19400001  ! 460: FBPUGE	fbuge
	.word 0xe897c3c2  ! 461: LDUHA_R	lduha	[%r31, %r2] 0x1e, %r20
	.word 0x9f8038d3  ! 461: SIR	sir	0x18d3
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_196) + 24, 16, 16)) -> intp(0,0,16,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_4_196)&0xffffffff) + 48, 16, 16)) -> intp(7,0,23,,,,,1)
#else
	set 0x8ac09fe5, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_4_196:
	.word 0xe93fe040  ! 462: STDF_I	std	%f20, [0x0040, %r31]
	.word 0x24cfc001  ! 463: BRLEZ	brlez,a,pt	%r31,<label_0xfc001>
	.word 0x9f8032ae  ! 464: SIR	sir	0x12ae
	.word 0x9f802130  ! 465: SIR	sir	0x0130
	.word 0xa9a7c9c2  ! 465: FDIVd	fdivd	%f62, %f2, %f20
memptr_4_198:
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
	.word 0x9ba409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f44
intvec_4_199:
	.word 0xdadfc282  ! 466: LDXA_R	ldxa	[%r31, %r2] 0x14, %r13
	.word 0x8582f9dd  ! 467: WRCCR_I	wr	%r11, 0x19dd, %ccr
	.word 0x19400001  ! 468: FBPUGE	fbuge
	.word 0xc32fe1d0  ! 469: STXFSR_I	st-sfr	%f1, [0x01d0, %r31]
	.word 0x93a209c1  ! 469: FDIVd	fdivd	%f8, %f32, %f40
	.word 0x20800001  ! 470: BN	bn,a	<label_0x1>
	.word 0xd63fe0d0  ! 471: STD_I	std	%r11, [%r31 + 0x00d0]
	.word 0xd7e7c381  ! 472: CASA_I	casa	[%r31] 0x1c, %r1, %r11
	.word 0xe19fc2c0  ! 473: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd69fc240  ! 473: LDDA_R	ldda	[%r31, %r0] 0x12, %r11
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_201:
memptr_4_202:
	set 0x60540000, %r31
	.word 0x39400001  ! 474: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8580e4aa  ! 475: WRCCR_I	wr	%r3, 0x04aa, %ccr
	.word 0xc19fda00  ! 476: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x19400001  ! 477: FBPUGE	fbuge
	.word 0x8580a65e  ! 477: WRCCR_I	wr	%r2, 0x065e, %ccr
	.word 0xd63fe1b0  ! 478: STD_I	std	%r11, [%r31 + 0x01b0]
	.word 0xc19fde00  ! 479: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x00800001  ! 480: BN	bn  	<label_0x1>
	.word 0xd63fe1b0  ! 481: STD_I	std	%r11, [%r31 + 0x01b0]
	.word 0xc19fdc00  ! 481: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_4_205:
	set 0x60540000, %r31
	.word 0xd73fe1e0  ! 482: STDF_I	std	%f11, [0x01e0, %r31]
	.word 0x8581f704  ! 483: WRCCR_I	wr	%r7, 0x1704, %ccr
	.word 0xd61fe170  ! 484: LDD_I	ldd	[%r31 + 0x0170], %r11
	.word 0xd73fe120  ! 485: STDF_I	std	%f11, [0x0120, %r31]
	.word 0xd71fe160  ! 485: LDDF_I	ldd	[%r31, 0x0160], %f11
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
intvec_4_207:
	.word 0x91b4c4d0  ! 486: FCMPNE32	fcmpne32	%d50, %d16, %r8
	.word 0xe1bfdf20  ! 487: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd0dfc3c3  ! 488: LDXA_R	ldxa	[%r31, %r3] 0x1e, %r8
	.word 0xa7a089d1  ! 489: FDIVd	fdivd	%f2, %f48, %f50
	.word 0xc19fd920  ! 489: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x81dfc001  ! 1: FLUSH_R	flush 	%r31, %r1, %r0
memptr_4_209:
	set 0x60740000, %r31
	.word 0xc32fe120  ! 490: STXFSR_I	st-sfr	%f1, [0x0120, %r31]
	.word 0x858221aa  ! 491: WRCCR_I	wr	%r8, 0x01aa, %ccr
	.word 0x00800001  ! 492: BN	bn  	<label_0x1>
	.word 0xd29fc283  ! 493: LDDA_R	ldda	[%r31, %r3] 0x14, %r9
	.word 0xc19fd920  ! 493: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_4_211:
	set 0x60540000, %r31
	.word 0xd3e7d041  ! 494: CASA_I	casa	[%r31] 0x82, %r1, %r9
	.word 0x858274ff  ! 495: WRCCR_I	wr	%r9, 0x14ff, %ccr
	.word 0x00800001  ! 496: BN	bn  	<label_0x1>
	.word 0xd3e7d140  ! 497: CASA_I	casa	[%r31] 0x8a, %r0, %r9
	.word 0x8584b057  ! 497: WRCCR_I	wr	%r18, 0x1057, %ccr
	.word 0xc19fc2c0  ! 498: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x00800001  ! 499: BN	bn  	<label_0x1>
	.word 0xd21fe010  ! 500: LDD_I	ldd	[%r31 + 0x0010], %r9
	.word 0xc1bfdb60  ! 501: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc1bfc2c0  ! 501: STDFA_R	stda	%f0, [%r0, %r31]
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
master_thread_stuff:

setup_tick:
    setx 0xfd03910af47cb30e, %r1, %r17
    wrpr %g0, %r17, %tick

    rd %asi, %r12
#ifdef XIR_RND_CORES
setup_xir_2:
    setx 0x5a4d2ee1d0e4932b, %r1, %r28
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
    brnz %g1, unlock_sync_thds_2
    wrpr %g0, %g0, %pstate
#endif
setup_spu_2:
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    set CWQ_BASE, %l6

#ifndef SPC
    ldxa [%g0]0x63, %o2
    and %o2, 0x38, %o2
    sllx %o2, 5, %o2    !(CID*256)
    add %l6, %o2, %l6
#endif
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
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
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

unlock_sync_thds_2:
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
    wrhpr %g0, 0x7c3, %hpstate  ! ta T_CHANGE_NONHPRIV 
cmp_2_0:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_0:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_0
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_0:
    brnz,a %r10, cmp_wait2_0
    ld [%r23], %r10
    ba cmp_startwait2_0
    mov 0x2, %r10
continue_cmp_2_0:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_0
    mov 0x45, %r17
    best_set_reg(0x2a63238f1af320f2, %r16, %r17)
cmp_multi_core_2_0:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	wrhpr %g0, 0x1bd1, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x9192c011  ! 1: WRPR_PIL_R	wrpr	%r11, %r17, %pil
splash_htba_2_1:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 5: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_2_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xb3800011  ! 9: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd23fe0f6  ! 13: STD_I	std	%r9, [%r31 + 0x00f6]
jmptr_2_7:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_10) + 0, 16, 16)) -> intp(2,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_10)&0xffffffff) + 32, 16, 16)) -> intp(3,0,19,,,,,1)
#else
	set 0xc2007242, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_10:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d903d35  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1d35, %pstate
    nop
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
	set 0x00021fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_16:
    wrhpr %g0, 0xcc1, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe7e7c2c0  ! 29: CASA_I	casa	[%r31] 0x16, %r0, %r19
demap_2_17:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0x841, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe61fe151  ! 33: LDD_I	ldd	[%r31 + 0x0151], %r19
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_18) + 32, 16, 16)) -> intp(6,0,25,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_18)&0xffffffff) + 40, 16, 16)) -> intp(6,0,14,,,,,1)
#else
	set 0x7b40cac9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_18:
	.word 0x91a049d1  ! 37: FDIVd	fdivd	%f32, %f48, %f8
splash_hpstate_2_21:
	ta T_CHANGE_NONHPRIV
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x81983bcd  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1bcd, %hpstate
demap_2_23:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x07400001  ! 1: FBPUL	fbul
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x5f
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x5f
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x57
	.word 0xbfefc000  ! 1: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	wrhpr %g0, 0x1611, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe81fe169  ! 45: LDD_I	ldd	[%r31 + 0x0169], %r20
fpinit_2_24:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 49: FCMPLE32	fcmple32	%d0, %d4, %r6
brcommon1_2_25:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c1  ! 1: PDIST	pdistn	%d62, %d32, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x9bb1848a  ! 53: FCMPLE32	fcmple32	%d6, %d10, %r13
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa7b444c7  ! 1: FCMPNE32	fcmpne32	%d48, %d38, %r19
intvec_2_27:
	.word 0x97b484d1  ! 57: FCMPNE32	fcmpne32	%d18, %d48, %r11
	.word 0xe927c000  ! 61: STF_R	st	%f20, [%r0, %r31]
cmp_2_32:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_32:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_32
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_32:
    brnz,a %r10, cmp_wait2_32
    ld [%r23], %r10
    ba cmp_startwait2_32
    mov 0x2, %r10
continue_cmp_2_32:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_32
    mov 0xef, %r17
    best_set_reg(0x356829fa275faf9d, %r16, %r17)
cmp_multi_core_2_32:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91950013  ! 65: WRPR_PIL_R	wrpr	%r20, %r19, %pil
splash_cmpr_2_35:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x70, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 69: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_2_37:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 73: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_38:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 77: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
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
    brnz %r10, cwq_2_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_39
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
cwq_2_39:
    wrhpr %g0, 0x189b, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 81: RDPC	rd	%pc, %r17
    nop
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
    brnz %r10, sma_2_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_41:
    wrhpr %g0, 0x898, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd5e7dd40  ! 85: CASA_I	casa	[%r31] 0xea, %r0, %r10
splash_cmpr_2_42:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xb3800011  ! 89: WR_STICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d903636  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1636, %pstate
	.word 0xe00fe128  ! 97: LDUB_I	ldub	[%r31 + 0x0128], %r16
splash_tick_2_48:
    nop
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x10960001a2cb74b5, %r16, %r17)
	.word 0x89800011  ! 101: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc32fc000  ! 105: STXFSR_R	st-sfr	%f1, [%r0, %r31]
br_badelay3_2_50:
	.word 0xa9a209ca  ! 1: FDIVd	fdivd	%f8, %f10, %f20
	.word 0xc75e2295	! Random illegal ?
	.word 0xa7a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa3a30826  ! 109: FADDs	fadds	%f12, %f6, %f17
memptr_2_52:
	set 0x60740000, %r31
	.word 0x8582e5c7  ! 113: WRCCR_I	wr	%r11, 0x05c7, %ccr
demap_2_53:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x1e800001  ! 1: BVC	bvc  	<label_0x1>
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	.word 0xbfe7c000  ! 1: SAVE_R	save	%r31, %r0, %r31
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	.word 0x9d97c000  ! 1: WRPR_WSTATE_R	wrpr	%r31, %r0, %wstate
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	wrhpr %g0, 0x583, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd81fe0f8  ! 117: LDD_I	ldd	[%r31 + 0x00f8], %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_56) + 0, 16, 16)) -> intp(3,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_56)&0xffffffff) + 16, 16, 16)) -> intp(5,0,28,,,,,1)
#else
	set 0xbd20032d, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intvec_2_56:
	.word 0x9f803607  ! 121: SIR	sir	0x1607
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_58:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_58-donret_2_58), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e24200 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf04, %htstate
	wrhpr %g0, 0x15a, %hpstate  !  rand=1 (2)
	ldx [%r12+%r0], %g1
	retry
.align 128
donretarg_2_58:
	.word 0xa9a489d2  ! 125: FDIVd	fdivd	%f18, %f18, %f20
cmp_2_60:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_60:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_60
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_60:
    brnz,a %r10, cmp_wait2_60
    ld [%r23], %r10
    ba cmp_startwait2_60
    mov 0x2, %r10
continue_cmp_2_60:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_60
    mov 0xd7, %r17
    best_set_reg(0xbcc6982f26c789ff, %r16, %r17)
cmp_multi_core_2_60:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x91950010  ! 129: WRPR_PIL_R	wrpr	%r20, %r16, %pil
	.word 0x24cc4001  ! 133: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	.word 0xda07c000  ! 137: LDUW_R	lduw	[%r31 + %r0], %r13
splash_tba_2_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 141: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd81fc002  ! 145: LDD_R	ldd	[%r31 + %r2], %r12
ticken_2_67:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0x5243782134a36005, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0x93b500eb  ! 149: EDGE16LN	edge16ln	%r20, %r11, %r9
	.word 0xa1902007  ! 153: WRPR_GL_I	wrpr	%r0, 0x0007, %-
brcommon3_2_70:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe0e0  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x00e0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x00800001  ! 157: BN	bn  	<label_0x1>
brcommon1_2_71:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c0  ! 1: PDIST	pdistn	%d62, %d0, %d20
    ba,a .+8
    jmpl %r27-0, %r27
	.word 0x87ac4a45  ! 161: FCMPd	fcmpd	%fcc<n>, %f48, %f36
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_74) + 56, 16, 16)) -> intp(2,0,13,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_74)&0xffffffff) + 0, 16, 16)) -> intp(4,0,19,,,,,1)
#else
	set 0x6c9042ec, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x95b504d0  ! 1: FCMPNE32	fcmpne32	%d20, %d16, %r10
intvec_2_74:
	.word 0x95a049d2  ! 165: FDIVd	fdivd	%f32, %f18, %f10
	.word 0xc30fc000  ! 169: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
	.word 0xd22fe0fe  ! 173: STB_I	stb	%r9, [%r31 + 0x00fe]
cmp_2_80:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_80:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_80
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_80:
    brnz,a %r10, cmp_wait2_80
    ld [%r23], %r10
    ba cmp_startwait2_80
    mov 0x2, %r10
continue_cmp_2_80:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_80
    mov 0x8d, %r17
    best_set_reg(0xc140fe4d23903448, %r16, %r17)
cmp_multi_core_2_80:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	wrhpr %g0, 0x5d9, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x9192c010  ! 177: WRPR_PIL_R	wrpr	%r11, %r16, %pil
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x97a4c9c4  ! 1: FDIVd	fdivd	%f50, %f4, %f42
intvec_2_81:
	.word 0x91a449d4  ! 181: FDIVd	fdivd	%f48, %f20, %f8
jmptr_2_83:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 185: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fda00  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x81dac014  ! 193: FLUSH_R	flush 	%r11, %r20, %r0
jmptr_2_87:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 197: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_2_89:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xb99cb2b5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 201: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026ed  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x06ed, %pstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_92:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_92-donret_2_92), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00240b00 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d5, %htstate
	wrpr %g0, 0x26b, %pstate  ! rand=0 (2)
	.word 0x10800001  ! 1: BA	ba  	<label_0x1>
	ldx [%r12+%r0], %g1
	retry
donretarg_2_92:
	.word 0xa3a149c4  ! 209: FDIVd	fdivd	%f36, %f4, %f48
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_94) + 24, 16, 16)) -> intp(6,0,6,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_94)&0xffffffff) + 56, 16, 16)) -> intp(1,0,20,,,,,1)
#else
	set 0x66903968, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_94:
	.word 0x91a449c9  ! 213: FDIVd	fdivd	%f48, %f40, %f8
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_96)+40, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_2_96)&0xffffffff) + 0, 16, 16)) -> intp(mask2tid(0x2),1,3,,,,,1)
xir_2_96:
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
xir_2_96:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981220f  ! 217: WR_SET_SOFTINT_I	wr	%r4, 0x020f, %set_softint
splash_tick_2_99:
    nop
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xc446f7f70e362a19, %r16, %r17)
	.word 0x89800011  ! 221: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd8ffe0d0  ! 225: SWAPA_I	swapa	%r12, [%r31 + 0x00d0] %asi
splash_hpstate_2_102:
	.word 0x8198331f  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x131f, %hpstate
intveclr_2_105:
	nop
	nop
	ta T_CHANGE_HPRIV
	setx 0xdb2ac96fe9ca3a85, %r1, %r28
	stxa %r28, [%g0] 0x72
	wrhpr %g0, 0x89b, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_2_108:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x4f1a0d7a, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 237: FBPULE	fbule
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_110:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_110-donret_2_110+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00730600 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x160e, %htstate
	wrpr %g0, 0x1491, %pstate  ! rand=0 (2)
	ldx [%r12+%r0], %g1
	retry
.align 512
donretarg_2_110:
	.word 0x95a049d0  ! 241: FDIVd	fdivd	%f32, %f16, %f10
	.word 0xe83fc000  ! 245: STD_R	std	%r20, [%r31 + %r0]
	.word 0xe8cfc540  ! 249: LDSBA_R	ldsba	[%r31, %r0] 0x2a, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_112) + 24, 16, 16)) -> intp(0,0,17,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_112)&0xffffffff) + 16, 16, 16)) -> intp(7,0,23,,,,,1)
#else
	set 0x5660b5f7, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_2_112:
	.word 0xa5b444d3  ! 253: FCMPNE32	fcmpne32	%d48, %d50, %r18
	.word 0xe037e09e  ! 257: STH_I	sth	%r16, [%r31 + 0x009e]
	.word 0xc30fc000  ! 261: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_2_116:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 265: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_2_117:
	ta T_CHANGE_NONHPRIV
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8198240e  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040e, %hpstate
    set 0xd06, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b147c9  ! 273: PDIST	pdistn	%d36, %d40, %d16
splash_lsu_2_120:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x218b3632, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_122:
	.word 0x819823f1  ! 281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03f1, %hpstate
splash_lsu_2_124:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x9b0748fd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 285: FBPULE	fbule
cmp_2_125:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_125:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_125
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_125:
    brnz,a %r10, cmp_wait2_125
    ld [%r23], %r10
    ba cmp_startwait2_125
    mov 0x2, %r10
continue_cmp_2_125:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_125
    mov 42, %r17
    best_set_reg(0x6b6048a1321d3200, %r16, %r17)
cmp_multi_core_2_125:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	wrhpr %g0, 0x1509, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd49fd923  ! 289: LDDA_R	ldda	[%r31, %r3] 0xc9, %r10
	.word 0xe3e7e001  ! 293: CASA_R	casa	[%r31] %asi, %r1, %r17
	.word 0xd047c000  ! 297: LDSW_R	ldsw	[%r31 + %r0], %r8
brcommon3_2_129:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe1a0  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x01a0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x20800001  ! 301: BN	bn,a	<label_0x1>
	.word 0xe727e106  ! 305: STF_I	st	%f19, [0x0106, %r31]
ticken_2_132:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0xfbea1ff00b7be315, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0xa3b280ea  ! 309: EDGE16LN	edge16ln	%r10, %r10, %r17
	.word 0xa953c000  ! 313: RDPR_FQ	<illegal instruction>
	.word 0xc1bfde00  ! 317: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe21fc001  ! 321: LDD_R	ldd	[%r31 + %r1], %r17
splash_tick_2_137:
    nop
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0xd0c0f1a506e67641, %r16, %r17)
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa78433da  ! 329: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x13da, %-
	.word 0xe127e0d4  ! 333: STF_I	st	%f16, [0x00d4, %r31]
jmptr_2_140:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 337: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd8c7d000  ! 341: LDSWA_R	ldswa	[%r31, %r0] 0x80, %r12
	.word 0x8d903303  ! 345: WRPR_PSTATE_I	wrpr	%r0, 0x1303, %pstate
cmp_2_146:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_146:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_146
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_146:
    brnz,a %r10, cmp_wait2_146
    ld [%r23], %r10
    ba cmp_startwait2_146
    mov 0x2, %r10
continue_cmp_2_146:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_146
    mov 42, %r17
    best_set_reg(0xdbbeb2a4f39d0d52, %r16, %r17)
cmp_multi_core_2_146:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	.word 0x9190800d  ! 349: WRPR_PIL_R	wrpr	%r2, %r13, %pil
ticken_2_147:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    stxa %g0, [0x38]%asi
    best_set_reg(0x715832d473dccab9, %r16, %r17)
    wrpr %g0, %r17, %tick
    mov 1, %r16
    stxa %r16, [0x38]%asi
    wr %g0, %r12, %asi
	.word 0x97b040e9  ! 353: EDGE16LN	edge16ln	%r1, %r9, %r11
jmptr_2_150:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 357: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800b60  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	.word 0xd337e1c8  ! 365: STQF_I	-	%f9, [0x01c8, %r31]
jmptr_2_155:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 369: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_159:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 373: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe44fc000  ! 377: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe3e7e003  ! 381: CASA_R	casa	[%r31] %asi, %r3, %r17
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa3b304d2  ! 1: FCMPNE32	fcmpne32	%d12, %d18, %r17
intvec_2_163:
	.word 0x19400001  ! 385: FBPUGE	fbuge
brcommon3_2_164:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46fe1c0  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0x01c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d90350d  ! 389: WRPR_PSTATE_I	wrpr	%r0, 0x150d, %pstate
	.word 0xe4800b40  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0x8d903996  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x1996, %pstate
	.word 0xe4c7c280  ! 401: LDSWA_R	ldswa	[%r31, %r0] 0x14, %r18
splash_tba_2_171:
	nop
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 405: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_2_173:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe0d0  ! 1: STXFSR_I	st-sfr	%f1, [0x00d0, %r31]
    ba,a .+8
    jmpl %r27-0, %r27
	.word 0xa7b0c7c1  ! 409: PDIST	pdistn	%d34, %d32, %d50
splash_lsu_2_175:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x71d0ca76, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 413: FBPULE	fbule
	.word 0xc1bfe100  ! 417: STDFA_I	stda	%f0, [0x0100, %r31]
	.word 0xd897c2c0  ! 421: LDUHA_R	lduha	[%r31, %r0] 0x16, %r12
cmp_2_179:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_179:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_179
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_179:
    brnz,a %r10, cmp_wait2_179
    ld [%r23], %r10
    ba cmp_startwait2_179
    mov 0x2, %r10
continue_cmp_2_179:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_179
    mov 0x86, %r17
    best_set_reg(0xe1b186f273061149, %r16, %r17)
cmp_multi_core_2_179:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	wrhpr %g0, 0x171b, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xda9fd160  ! 425: LDDA_R	ldda	[%r31, %r0] 0x8b, %r13
brcommon3_2_181:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c002  ! 1: STQF_R	-	%f18, [%r2, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r6, [%r0] ASI_LSU_CONTROL
	.word 0xa9aac831  ! 429: FMOVGE	fmovs	%fcc1, %f17, %f20
pmu_2_182:
	nop
	nop
	setx 0xffffffbdffffffa3, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_2_184:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 437: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xd6800b40  ! 441: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
	.word 0xe4c7c600  ! 445: LDSWA_R	ldswa	[%r31, %r0] 0x30, %r18
	.word 0xe337c000  ! 449: STQF_R	-	%f17, [%r0, %r31]
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_190:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_190-donret_2_190), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0041eb00 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x144, %htstate
	wrpr %g0, 0xa91, %pstate  ! rand=0 (2)
	retry
.align 512
donretarg_2_190:
	.word 0x24cd0001  ! 453: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
splash_htba_2_193:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 457: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_2_195:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 461: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
trapasi_2_197:
	nop
	mov 0x10, %r1 	! (VA for ASI 0x49) 
	.word 0xdad84920  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x49, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_200) + 8, 16, 16)) -> intp(7,0,23,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_2_200)&0xffffffff) + 56, 16, 16)) -> intp(1,0,21,,,,,1)
#else
	set 0x57900028, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_2_200:
	.word 0x97b304d0  ! 469: FCMPNE32	fcmpne32	%d12, %d16, %r11
	.word 0xc1bfe020  ! 473: STDFA_I	stda	%f0, [0x0020, %r31]
splash_tick_2_203:
    nop
    nop
    ta T_CHANGE_HPRIV
    best_set_reg(0x27b4cc4322f6c350, %r16, %r17)
	.word 0x89800011  ! 477: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_2_204:
	.word 0x1b400001  ! 1: FBPLE	fble
	.word 0x81983196  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1196, %hpstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_2_206:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_2_206-donret_2_206+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f9d900 | (0x83 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfdf, %htstate
	wrhpr %g0, 0x1443, %hpstate  !  rand=1 (2)
	ldx [%r12+%r0], %g1
	retry
donretarg_2_206:
	.word 0xd66fe10f  ! 485: LDSTUB_I	ldstub	%r11, [%r31 + 0x010f]
brcommon2_2_208:
    nop
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x93a00549  ! 1: FSQRTd	fsqrt	
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0xe19fd920  ! 489: LDDFA_R	ldda	[%r31, %r0], %f16
splash_cmpr_2_210:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x100, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 493: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
cmp_2_212:
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
    xor %r9, 0x2, %r9
    sllx %r9, %r8, %r9              ! My core mask
#else
    mov 0, %r8
    mov 0xff, %r9                   
    xor %r9, 0x2, %r9         ! My core mask
#endif
    mov 0x2, %r10
cmp_startwait2_212:
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_2_212
    ldxa [0x50]%asi, %r13       !Running_rw
    ld [%r23], %r10
cmp_wait2_212:
    brnz,a %r10, cmp_wait2_212
    ld [%r23], %r10
    ba cmp_startwait2_212
    mov 0x2, %r10
continue_cmp_2_212:
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    brz,a %r8, cmp_multi_core_2_212
    mov 0x69, %r17
    best_set_reg(0x866cc4ef425b1d4c, %r16, %r17)
cmp_multi_core_2_212:
    and %r14, %r17, %r14        !Apply set/clear mask to bits equal
    and %r14, %r9, %r14         !Apply core-mask
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %g0, %r12, %asi
	wrhpr %g0, 0x813, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x91940013  ! 497: WRPR_PIL_R	wrpr	%r16, %r19, %pil
cmpenall_2_213:
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
cmpenall_startwait2_213:
    mov 0x2, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_2_213
    nop
cmpenall_wait2_213:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait2_213
    nop
    ba,a cmpenall_startwait2_213
continue_cmpenall_2_213:
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_2_213:
    ldxa [0x50]%asi, %r13       !Running_rw
    cmp %r13, %r14
    bne,a %xcc, wait_for_cmpstat_2_213
    ldxa [0x58]%asi, %r14       !Running_status
    ldxa [0x10]%asi, %r14       !Get enabled threads
    and %r14, %r9, %r14         !My core mask
    stxa %r14, [0x60]%asi       !W1S
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_2_213:
    and %r16, %r9, %r16         !My core mask
    cmp %r14, %r16
    bne,a %xcc, wait_for_cmpstat2_2_213
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
fork_lbl_0_1:
    wrhpr %g0, 0x1c50, %hpstate  ! ta T_CHANGE_NONHPRIV 
	.word 0x91904012  ! 1: WRPR_PIL_R	wrpr	%r1, %r18, %pil
splash_htba_1_1:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 5: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_1_4:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	ta T_CHANGE_PRIV
	.word 0xaf800011  ! 9: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0xd23fe198  ! 13: STD_I	std	%r9, [%r31 + 0x0198]
jmptr_1_7:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 17: JMPL_R	jmpl	%r27 + %r0, %r27
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_10) + 24, 16, 16)) -> intp(7,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_10)&0xffffffff) + 56, 16, 16)) -> intp(7,0,24,,,,,1)
#else
	set 0x56c0f9c9, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_10:
	.word 0x39400001  ! 21: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x22cd0001  ! 1: BRZ	brz,a,pt	%r20,<label_0xd0001>
	.word 0x8d903997  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x1997, %pstate
    nop
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
	set 0x001e1fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_16:
    wrhpr %g0, 0x2da, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe7e7d143  ! 29: CASA_I	casa	[%r31] 0x8a, %r3, %r19
demap_1_17:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0x2d1, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe61fe144  ! 33: LDD_I	ldd	[%r31 + 0x0144], %r19
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_18) + 8, 16, 16)) -> intp(3,0,5,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_18)&0xffffffff) + 56, 16, 16)) -> intp(7,0,28,,,,,1)
#else
	set 0xc240fc47, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_18:
	.word 0x39400001  ! 37: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_21:
	ta T_CHANGE_NONHPRIV
	.word 0x2ecb4001  ! 1: BRGEZ	brgez,a,pt	%r13,<label_0xb4001>
	.word 0x81983745  ! 41: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1745, %hpstate
demap_1_23:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0x1289, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xe81fe098  ! 45: LDD_I	ldd	[%r31 + 0x0098], %r20
fpinit_1_24:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 49: FDIVs	fdivs	%f0, %f4, %f6
brcommon1_1_25:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c3  ! 1: PDIST	pdistn	%d62, %d34, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x93b4c7c2  ! 53: PDIST	pdistn	%d50, %d2, %d40
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x97a189d2  ! 1: FDIVd	fdivd	%f6, %f18, %f42
intvec_1_27:
	.word 0x19400001  ! 57: FBPUGE	fbuge
	.word 0xe927c000  ! 61: STF_R	st	%f20, [%r0, %r31]
	.word 0x91914014  ! 65: WRPR_PIL_R	wrpr	%r5, %r20, %pil
splash_cmpr_1_35:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x80, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 69: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
jmptr_1_37:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 73: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_38:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 77: JMPL_R	jmpl	%r27 + %r0, %r27
    nop
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
    brnz %r10, cwq_1_39
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_39
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
cwq_1_39:
    wrhpr %g0, 0xd13, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 81: RDPC	rd	%pc, %r10
    nop
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
    brnz %r10, sma_1_41
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %l7
	stxa	%l7,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_41:
    wrhpr %g0, 0x482, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd5e7d923  ! 85: CASA_I	casa	[%r31] 0xc9, %r3, %r10
splash_cmpr_1_42:
    mov 0, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x50, %r17
    or %r17, %r18, %r17
	.word 0xaf800011  ! 89: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903db7  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x1db7, %pstate
	.word 0xe00fe070  ! 97: LDUB_I	ldub	[%r31 + 0x0070], %r16
	.word 0x89800011  ! 101: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xe43fe045  ! 105: STD_I	std	%r18, [%r31 + 0x0045]
br_badelay3_1_50:
	.word 0xa7a089c9  ! 1: FDIVd	fdivd	%f2, %f40, %f50
	.word 0xed7d89f9	! Random illegal ?
	.word 0x9ba00554  ! 1: FSQRTd	fsqrt	
	.word 0x99a48833  ! 109: FADDs	fadds	%f18, %f19, %f12
memptr_1_52:
	set 0x60340000, %r31
	.word 0x8581b226  ! 113: WRCCR_I	wr	%r6, 0x1226, %ccr
demap_1_53:
	nop
	mov 0x80, %g3
	ta T_CHANGE_HPRIV
	.word 0x24c88001  ! 1: BRLEZ	brlez,a,pt	%r2,<label_0x88001>
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x5f
	stxa %g3, [%g3] 0x57
	stxa %g3, [%g3] 0x5f
	wrhpr %g0, 0x1fc9, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0xd81fe0c9  ! 117: LDD_I	ldd	[%r31 + 0x00c9], %r12
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_56) + 8, 16, 16)) -> intp(2,0,11,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_56)&0xffffffff) + 32, 16, 16)) -> intp(1,0,22,,,,,1)
#else
	set 0xcc408743, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0x9bb044d0  ! 1: FCMPNE32	fcmpne32	%d32, %d16, %r13
intvec_1_56:
	.word 0x9f80399e  ! 121: SIR	sir	0x199e
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_58:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_58-donret_1_58), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eb9900 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1dd5, %htstate
	wrhpr %g0, 0x1bdb, %hpstate  !  rand=1 (1)
	ldx [%r12+%r0], %g1
	retry
.align 128
donretarg_1_58:
	.word 0x95a509d4  ! 125: FDIVd	fdivd	%f20, %f20, %f10
	.word 0x91948014  ! 129: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	.word 0xc36c769d  ! 133: PREFETCH_I	prefetch	[%r17 + 0xfffff69d], #one_read
	.word 0xda07c000  ! 137: LDUW_R	lduw	[%r31 + %r0], %r13
splash_tba_1_64:
	nop
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 141: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xd81fc003  ! 145: LDD_R	ldd	[%r31 + %r3], %r12
	.word 0xa9b2c0f4  ! 149: EDGE16LN	edge16ln	%r11, %r20, %r20
	.word 0xa1902002  ! 153: WRPR_GL_I	wrpr	%r0, 0x0002, %-
brcommon3_1_70:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe86fe030  ! 1: LDSTUB_I	ldstub	%r20, [%r31 + 0x0030]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d90350b  ! 157: WRPR_PSTATE_I	wrpr	%r0, 0x150b, %pstate
brcommon1_1_71:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-0], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xa9b7c7c0  ! 1: PDIST	pdistn	%d62, %d0, %d20
    ba,a .+8
    jmpl %r27-4, %r27
	.word 0x97702fdd  ! 161: POPC_I	popc	0x0fdd, %r11
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_74) + 40, 16, 16)) -> intp(3,0,2,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_74)&0xffffffff) + 56, 16, 16)) -> intp(7,0,12,,,,,1)
#else
	set 0x2b0029af, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa9a049d2  ! 1: FDIVd	fdivd	%f32, %f18, %f20
intvec_1_74:
	.word 0x9f803c94  ! 165: SIR	sir	0x1c94
	.word 0xd23fe100  ! 169: STD_I	std	%r9, [%r31 + 0x0100]
	.word 0xd22fe18e  ! 173: STB_I	stb	%r9, [%r31 + 0x018e]
	.word 0x91948014  ! 177: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0x19400001  ! 1: FBPUGE	fbuge
intvec_1_81:
	.word 0x9f803569  ! 181: SIR	sir	0x1569
jmptr_1_83:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 185: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fdf20  ! 189: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x81dd0013  ! 193: FLUSH_R	flush 	%r20, %r19, %r0
jmptr_1_87:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 197: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_1_89:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0xf6363cf5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 201: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9031e1  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x11e1, %pstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_92:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_92-donret_1_92), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
	andn %r12, %r10, %r12 ! low VA tpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00161d00 | (20 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14d, %htstate
	wrpr %g0, 0x1590, %pstate  ! rand=0 (1)
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	ldx [%r12+%r0], %g1
	retry
donretarg_1_92:
	.word 0xa9a189ca  ! 209: FDIVd	fdivd	%f6, %f10, %f20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_94) + 16, 16, 16)) -> intp(0,0,29,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_94)&0xffffffff) + 40, 16, 16)) -> intp(2,0,29,,,,,1)
#else
	set 0xb2405b40, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_94:
	.word 0x99b444d3  ! 213: FCMPNE32	fcmpne32	%d48, %d50, %r12
#if (defined SPC || defined CMP)
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_96)+40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.xir_1_96)&0xffffffff) + 40, 16, 16)) -> intp(mask2tid(0x1),1,3,,,,,1)
xir_1_96:
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
xir_1_96:
	stxa %r18, [%r19] 0x41
	stx %r16, [%r17]
#endif
#endif
	.word 0xa981a508  ! 217: WR_SET_SOFTINT_I	wr	%r6, 0x0508, %set_softint
	.word 0x89800011  ! 221: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xd8ffe1d0  ! 225: SWAPA_I	swapa	%r12, [%r31 + 0x01d0] %asi
splash_hpstate_1_102:
	.word 0x819835f9  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x15f9, %hpstate
intveclr_1_105:
	nop
	nop
	ta T_CHANGE_HPRIV
	setx 0x29c3a276496f6cc6, %r1, %r28
	stxa %r28, [%g0] 0x72
	wrhpr %g0, 0x18c3, %hpstate  ! ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 233: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_lsu_1_108:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x5a1647d0, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 237: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_110:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_110-donret_1_110+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00739f00 | (22 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7c7, %htstate
	wrpr %g0, 0x1d99, %pstate  ! rand=0 (1)
	ldx [%r12+%r0], %g1
	retry
.align 512
donretarg_1_110:
	.word 0xa9a189d4  ! 241: FDIVd	fdivd	%f6, %f20, %f20
	.word 0xe83fc000  ! 245: STD_R	std	%r20, [%r31 + %r0]
	.word 0xe8cfc3c0  ! 249: LDSBA_R	ldsba	[%r31, %r0] 0x1e, %r20
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_112) + 40, 16, 16)) -> intp(4,0,22,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_112)&0xffffffff) + 48, 16, 16)) -> intp(3,0,29,,,,,1)
#else
	set 0xe62062a0, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
	.word 0xa9b1c4c2  ! 1: FCMPNE32	fcmpne32	%d38, %d2, %r20
intvec_1_112:
	.word 0x39400001  ! 253: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe037e002  ! 257: STH_I	sth	%r16, [%r31 + 0x0002]
	.word 0xc30fc000  ! 261: LDXFSR_R	ld-fsr	[%r31, %r0], %f1
jmptr_1_116:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 265: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_1_117:
	ta T_CHANGE_NONHPRIV
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x819833cf  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x13cf, %hpstate
    set 0x190b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b247d4  ! 273: PDIST	pdistn	%d40, %d20, %d16
splash_lsu_1_120:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x61e95f89, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 277: FBPULE	fbule
splash_hpstate_1_122:
	.word 0x8198302d  ! 281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x102d, %hpstate
splash_lsu_1_124:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x32892f45, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 285: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802060  ! 289: SIR	sir	0x0060
	.word 0xe3e7e003  ! 293: CASA_R	casa	[%r31] %asi, %r3, %r17
	.word 0xd047c000  ! 297: LDSW_R	ldsw	[%r31 + %r0], %r8
brcommon3_1_129:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xd06fe110  ! 1: LDSTUB_I	ldstub	%r8, [%r31 + 0x0110]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d902d45  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x0d45, %pstate
	.word 0xe727e1f4  ! 305: STF_I	st	%f19, [0x01f4, %r31]
	.word 0x93b200e2  ! 309: EDGE16LN	edge16ln	%r8, %r2, %r9
	.word 0xa753c000  ! 313: RDPR_FQ	<illegal instruction>
	.word 0xc1bfc2c0  ! 317: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe21fc000  ! 321: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x89800011  ! 325: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xa784fb6d  ! 329: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x1b6d, %-
	.word 0xe127e13e  ! 333: STF_I	st	%f16, [0x013e, %r31]
jmptr_1_140:
    nop
    nop
    best_set_reg(0xe1a00000, %r20, %r27)
	.word 0xb7c6c000  ! 337: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd8c7c6c0  ! 341: LDSWA_R	ldswa	[%r31, %r0] 0x36, %r12
	.word 0x8d902940  ! 345: WRPR_PSTATE_I	wrpr	%r0, 0x0940, %pstate
	.word 0x9194c010  ! 349: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0x93b480f3  ! 353: EDGE16LN	edge16ln	%r18, %r19, %r9
jmptr_1_150:
    nop
    nop
    best_set_reg(0xe0200000, %r20, %r27)
	.word 0xb7c6c000  ! 357: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe4800bc0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r18
	.word 0xd337e0e1  ! 365: STQF_I	-	%f9, [0x00e1, %r31]
jmptr_1_155:
    nop
    nop
    best_set_reg(0xe0a00000, %r20, %r27)
	.word 0xb7c6c000  ! 369: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_159:
    nop
    nop
    best_set_reg(0xe1200000, %r20, %r27)
	.word 0xb7c6c000  ! 373: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe44fc000  ! 377: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe3e7e002  ! 381: CASA_R	casa	[%r31] %asi, %r2, %r17
	rd %tick, %r28
#if (MAX_THREADS == 8)
	sethi %hi(0x33800), %r27
#else
	sethi %hi(0x30000), %r27
#endif
	andn %r28, %r27, %r28
	ta T_CHANGE_HPRIV
	stxa %r28, [%g0] 0x73
	.word 0xa7b404d2  ! 1: FCMPNE32	fcmpne32	%d16, %d18, %r19
intvec_1_163:
	.word 0xa5a489c7  ! 385: FDIVd	fdivd	%f18, %f38, %f18
brcommon3_1_164:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe46fe0c0  ! 1: LDSTUB_I	ldstub	%r18, [%r31 + 0x00c0]
    ba,a .+8
    jmpl %r27+0, %r27
	.word 0x8d903655  ! 389: WRPR_PSTATE_I	wrpr	%r0, 0x1655, %pstate
	.word 0xe48008a0  ! 393: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8d903451  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x1451, %pstate
	.word 0xe4c7d140  ! 401: LDSWA_R	ldswa	[%r31, %r0] 0x8a, %r18
splash_tba_1_171:
	nop
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 405: WRPR_TBA_R	wrpr	%r0, %r12, %tba
brcommon1_1_173:
    nop
    nop
    setx common_target, %r12, %r27
    lduw [%r27-4], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xc32fe020  ! 1: STXFSR_I	st-sfr	%f1, [0x0020, %r31]
    ba,a .+8
    jmpl %r27-0, %r27
	.word 0x91b44483  ! 409: FCMPLE32	fcmple32	%d48, %d34, %r8
splash_lsu_1_175:
	nop
	nop
	ta T_CHANGE_HPRIV
	set 0x822bb08d, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	.word 0x16800001  ! 1: BGE	bge  	<label_0x1>
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x1d400001  ! 413: FBPULE	fbule
	.word 0xe1bfe1c0  ! 417: STDFA_I	stda	%f16, [0x01c0, %r31]
	.word 0xd897c380  ! 421: LDUHA_R	lduha	[%r31, %r0] 0x1c, %r12
	.word 0x9f802180  ! 425: SIR	sir	0x0180
brcommon3_1_181:
    nop
    setx common_target, %r12, %r27
    lduw [%r27], %r12       ! Load common dest into dcache ..
    ba,a .+12
	.word 0xe537c000  ! 1: STQF_R	-	%f18, [%r0, %r31]
    ba,a .+8
    jmpl %r27+0, %r27
    stxa %r17, [%r0] ASI_LSU_CONTROL
	.word 0xa5aac833  ! 429: FMOVGE	fmovs	%fcc1, %f19, %f18
pmu_1_182:
	nop
	nop
	setx 0xffffffbfffffffab, %g1, %g7
	.word 0xa3800007  ! 433: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_1_184:
    nop 
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 437: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xd6800c40  ! 441: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r11
	.word 0xe4c7df00  ! 445: LDSWA_R	ldswa	[%r31, %r0] 0xf8, %r18
	.word 0xe337c000  ! 449: STQF_R	-	%f17, [%r0, %r31]
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_190:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_190-donret_1_190), %r12
	add %r12, 0x8, %r11 ! nonseq tnpc
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00edf500 | (0x8b << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1ec7, %htstate
	wrpr %g0, 0x1fb8, %pstate  ! rand=0 (1)
	retry
.align 512
donretarg_1_190:
	.word 0x26c88001  ! 453: BRLZ	brlz,a,pt	%r2,<label_0x88001>
splash_htba_1_193:
	nop
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 457: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_1_195:
	nop
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 461: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
trapasi_1_197:
	nop
	mov 0x8, %r1 	! (VA for ASI 0x49) 
	.word 0xdad84920  ! 465: LDXA_R	ldxa	[%r1, %r0] 0x49, %r13
#if (defined SPC || defined CMP1)
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_200) + 40, 16, 16)) -> intp(4,0,3,,,,,1)
!$EV trig_pc_d(1, expr((@VA(.MAIN.intvec_1_200)&0xffffffff) + 48, 16, 16)) -> intp(6,0,2,,,,,1)
#else
	set 0x97a0dba8, %r28
#if (MAX_THREADS == 8)
	and %r28, 0x7ff, %r28
#endif
	stxa %r28, [%g0] 0x73
#endif
intvec_1_200:
	.word 0x39400001  ! 469: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfe0e0  ! 473: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0x89800011  ! 477: WRTICK_R	wr	%r0, %r17, %tick
splash_hpstate_1_204:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x81983356  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x1356, %hpstate
	nop
	nop
	ta	T_CHANGE_HPRIV	! macro
donret_1_206:
	rd %pc, %r12
	mov HIGHVA_HIGHNUM, %r10
	sllx %r10, 32, %r10
	or %r12, %r10, %r12
	add %r12, (donretarg_1_206-donret_1_206+4), %r12
	add %r12, 0x4, %r11 ! seq tnpc
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a66600 | (16 << 24)), %r13
    and %r12, 0xfff, %r14
    sllx %r14, 32, %r14
    or %r13, %r14, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1449, %htstate
	wrhpr %g0, 0xec1, %hpstate  !  rand=1 (1)
	ldx [%r12+%r0], %g1
	retry
donretarg_1_206:
	.word 0xd66fe02c  ! 485: LDSTUB_I	ldstub	%r11, [%r31 + 0x002c]
brcommon2_1_208:
    nop
    nop
    setx common_target, %r12, %r27
    ba,a .+12
	.word 0x81dfc000  ! 1: FLUSH_R	flush 	%r31, %r0, %r0
    ba,a .+8
    jmpl %r27-0, %r27
	.word 0x00800001  ! 489: BN	bn  	<label_0x1>
splash_cmpr_1_210:
    mov 1, %r18
    sllx %r18, 63, %r18
    rd %tick, %r17 
    add %r17, 0x60, %r17
    or %r17, %r18, %r17
	ta T_CHANGE_HPRIV
	wrhpr %r17, %g0, %hsys_tick_cmpr
	.word 0xaf800011  ! 493: WR_TICK_CMPR_REG_R	wr	%r0, %r17, %-
	.word 0x91940014  ! 497: WRPR_PIL_R	wrpr	%r16, %r20, %pil
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

	.xword	0xabb68908d736e94d
	.xword	0xb3bc34a1edfe5a2e
	.xword	0xeb8315744cb2f69d
	.xword	0x3d25896c0824a7a2
	.xword	0xe563dd6ad12eb250
	.xword	0x9b5fc301a7ce87cf
	.xword	0x5bbd742b72c75006
	.xword	0x6e8a979aafe31686
	.xword	0x0debfc38817e419d
	.xword	0x0952df23fd5c4b5b
	.xword	0x205e576a3b160fb6
	.xword	0x02bfa4d107d9810f
	.xword	0xa5053d834461e714
	.xword	0x53a3fee3c04cf879
	.xword	0x6b7439167ac7f5f3
	.xword	0xf2c136fab23e3155
	.xword	0xd3386a10d7f3fdda
	.xword	0x36572f95f68a05a6
	.xword	0x9c467b77e4d623ca
	.xword	0x43753f185a64c554
	.xword	0x0fdca8f2a0d3e099
	.xword	0xce32f96abce31674
	.xword	0x54fe03139e090ce3
	.xword	0x68149692b6a2174b
	.xword	0x6da3884e482119e0
	.xword	0x82d9d1dad8315b9f
	.xword	0xdd19e67b40cddef6
	.xword	0xae513a100d538d5d
	.xword	0xeab208112c78b017
	.xword	0xbad277581875a80d
	.xword	0x6508b834365f0a67
	.xword	0xbb514f3976d77833
	.xword	0xb7ee569cd8607410
	.xword	0x362a9ee872cd5ed3
	.xword	0xc38a78591569ddfe
	.xword	0x3423ebdf22605abd
	.xword	0x78d5979b822252df
	.xword	0x7e82fdc822b1779b
	.xword	0xa8876368d56c43dd
	.xword	0x4aa751cecdc37764
	.xword	0x12c5165a002c7ab7
	.xword	0x67d56cb7359fdaff
	.xword	0xeb2d6a41f6d9ab64
	.xword	0xf312a9542e14b850
	.xword	0xd9c1bcb24fa62b87
	.xword	0x1ae0c82a94f1a842
	.xword	0xce00aa3bd21a9517
	.xword	0x9fa2969e11f9b3af
	.xword	0x134ab5f2ce0ed936
	.xword	0x339c5350f8996956
	.xword	0xb17e2663688df40a
	.xword	0xda6cfc343dc5bc5e
	.xword	0x6969a37458174c9b
	.xword	0x35418330d9e96ecf
	.xword	0x4673fcdcb7055c22
	.xword	0x0d194cff57d5c23d
	.xword	0xf64d29fbbf0a7339
	.xword	0x6079c8a9d822a364
	.xword	0xec636be77de55982
	.xword	0x5214d1a1e7f78a8f
	.xword	0xcc3e6536b03af799
	.xword	0xa49f6ec922e181ea
	.xword	0x3203ecf812633d4c
	.xword	0x5822e86eb1d12665
	.xword	0xb50e5706de8602f2
	.xword	0xe605d2e764d8da7a
	.xword	0x9e94b3622af42970
	.xword	0x4d51f326a14aa91d
	.xword	0x07492ac96724be73
	.xword	0xb4fc22bfa0d77ba0
	.xword	0xb04a8af010c7fdf3
	.xword	0xd1662ac89e1adad6
	.xword	0x9972b9f85eb46686
	.xword	0x2acd6fa928687181
	.xword	0x7b404d087f970558
	.xword	0x72ed7c5a43092f03
	.xword	0x54b0d235aa7d2c1c
	.xword	0xb44ada8ebae8ce7c
	.xword	0x91577de0bba6c0d3
	.xword	0x68a48557f4a577be
	.xword	0x7ae89b6f7a5f883d
	.xword	0x1b2fd7b413eceb8a
	.xword	0x30288bf43adc0cee
	.xword	0xebb25d5aabbcd079
	.xword	0xc10e66bbc22a54d1
	.xword	0xe116b78fcbf4e8b8
	.xword	0x5b8e988788d18d05
	.xword	0x488e25e75dfbcb91
	.xword	0x305a5975b90b0efe
	.xword	0x31d3539fa2d4273c
	.xword	0x7e35fc2b0ed18f34
	.xword	0x1cfece5d45fefd03
	.xword	0x50088b53f1f81110
	.xword	0x5fbf26b2da48ef9f
	.xword	0xaa2edf79bff9d938
	.xword	0x023fd93f6049b457
	.xword	0xbc17303f6cbe81df
	.xword	0xae2f303ddda8a8a6
	.xword	0x2144089233159411
	.xword	0xa6a3722435ae2eee
	.xword	0x690ab90e89c33957
	.xword	0x63ab342bc13dedd5
	.xword	0x26d1d85c10ed9bee
	.xword	0x8cc64b602c5f0bc4
	.xword	0x40d27f95c2e768ec
	.xword	0xbcfa8f62533aed58
	.xword	0x1650a10ea8b2633a
	.xword	0xc35f6c5245560858
	.xword	0x0d74c7877483df63
	.xword	0x5496c0e1b07ef5ce
	.xword	0xa4393699e40f3da9
	.xword	0xcf06e7e91532374c
	.xword	0x44d72a53b6e73d88
	.xword	0xb54bb4173973de5b
	.xword	0x4a9ace7909674837
	.xword	0xdb96bf6b35fd3189
	.xword	0x7caa9ed59cc2253f
	.xword	0xed7946e9503d2646
	.xword	0x7e042c98d2aa78d7
	.xword	0x5d6a2daff2ed1f64
	.xword	0x1ef7fb18419bd97c
	.xword	0x250349344c273bed
	.xword	0xed8c061c0ea7eb61
	.xword	0x8ef55b7b95424bc0
	.xword	0xc814e687406fc988
	.xword	0x2c958555c5c513e2
	.xword	0x77c0e2602ad07ac2
	.xword	0xeeca974a6447aa65
	.xword	0xaef75c555b27d38f
	.xword	0x981ceb6dd56a93b1
	.xword	0x1ffb8c1489af8e99
	.xword	0xcec1c9303b65e196
	.xword	0x9ec31bdff7212501
	.xword	0x20d43907b0896db2
	.xword	0x3034e3dfc671b4da
	.xword	0x2831229238a8b649
	.xword	0xd8fb82813c907a0d
	.xword	0x21e8335ba2d550a6
	.xword	0x0e84191e1b4fbb47
	.xword	0xd8682000cc9b6baa
	.xword	0xef09592e5abc5699
	.xword	0x211166d6e4bb8fdd
	.xword	0x8b5bcbd9bc417ff1
	.xword	0x82edd1c333327101
	.xword	0x8aa515370b99a720
	.xword	0xce956676ec4a5337
	.xword	0x5a9f394b7af6ecd0
	.xword	0xac8d298d7e4ec243
	.xword	0xc6066f614bb7e828
	.xword	0xcd30f64498777964
	.xword	0x4eaae5c60cb0b43d
	.xword	0xa67087fed9256f00
	.xword	0x86a22f680753d15d
	.xword	0x85e54a5de45b7d0e
	.xword	0x00ce1ee71892f521
	.xword	0x54b5313b64559c16
	.xword	0x697182d4fa4fe2e7
	.xword	0xf3b0f0e6379349a9
	.xword	0x2a0174c3eda75d6f
	.xword	0x10e1125323ec6adc
	.xword	0x2c817b0b761c5229
	.xword	0xe54b2d8f9fa09619
	.xword	0x4dbbd3c0bfc75252
	.xword	0x46eadab959ae33be
	.xword	0x7f23317ddaad4240
	.xword	0x9b8b75a0e839fc53
	.xword	0x36c7ac04a2d5e164
	.xword	0xf897ab83c145b114
	.xword	0x647e4af2b91b2f37
	.xword	0xebe03f7e5d025a05
	.xword	0xf9487dda8c2253a7
	.xword	0xf4a4b20fe3f74946
	.xword	0x7e199fabd4cf0a70
	.xword	0x6d5d1ee75442e987
	.xword	0xdded602b4076234c
	.xword	0xca6d89f2d5e8d951
	.xword	0x213637c486633e14
	.xword	0xec314a8bcacb434e
	.xword	0x201857e3c5066853
	.xword	0x482a5929048cc6db
	.xword	0x7ddde7d3b7f46983
	.xword	0x9136e2c57a2b3e45
	.xword	0xafde447ba92bb60d
	.xword	0x9b8a3027218f3f15
	.xword	0xedc88cb1e93cd750
	.xword	0xe7dce00be5c322b2
	.xword	0xc7c5375e23ec9f90
	.xword	0x2603d4031c1d0ef2
	.xword	0xc6c18cc5a38e2b27
	.xword	0xf82b64466fdf474c
	.xword	0xf8e9207cd0baa9f0
	.xword	0x025598f5449c4690
	.xword	0x5d26dc6edb2858e2
	.xword	0x4c49b3f61fc546b0
	.xword	0x189d3fdcf15ec23c
	.xword	0x2df2ce5b669e3f80
	.xword	0x7d57c000937c77a7
	.xword	0xf320fbd0a475d1b4
	.xword	0x8ddab4abb02ab6b8
	.xword	0x5948f45f3e3adc52
	.xword	0x0aa41d5099abdbf1
	.xword	0x0474c9f9cae1c778
	.xword	0x297480c2d3ce3ada
	.xword	0x883ab1689b808da2
	.xword	0xb23ea78906dc7296
	.xword	0xdbd50a74f2343c16
	.xword	0x342a371c78355167
	.xword	0x915c0ada399209f6
	.xword	0xee27761dcd9d1744
	.xword	0x67fa1c867ad4d71c
	.xword	0xc8bc89f1aac5bd4a
	.xword	0x82f282cadd1c2c4a
	.xword	0xea64fd3411d0a589
	.xword	0xee9d19aa830a0b3c
	.xword	0x72d30abbca931d11
	.xword	0xeda5a0dab02f2d00
	.xword	0xede33b2ff0645752
	.xword	0x6c9b439a6ebca83d
	.xword	0x3681f471f5640ec9
	.xword	0x454565e95dacc666
	.xword	0xdc07bd88ec73e7a3
	.xword	0xc51625d529d6c329
	.xword	0x23675f958accf5c9
	.xword	0x98af8196a6f26d12
	.xword	0xa3b53fbb0bad2e4d
	.xword	0x942eb239b75c2c56
	.xword	0x7534bae3b7d05df5
	.xword	0x3091b882c1f3732a
	.xword	0x05a13cf719994fd8
	.xword	0x88a1ab96eb415c20
	.xword	0xb28c3256947fbacc
	.xword	0xd47960e5f724aa75
	.xword	0xe465189980811302
	.xword	0x4a6a719774dd7307
	.xword	0x93dab4d21f999d14
	.xword	0xcf6863f093571ddc
	.xword	0xa2858f828c48284d
	.xword	0x0dbc61962f7ee7aa
	.xword	0x4f54918e3a1ba0b5
	.xword	0x1f24f15f9ad88078
	.xword	0x4d1293e29736ca8d
	.xword	0xe2d892928df316f2
	.xword	0xc1f5e9b7282541d7
	.xword	0xd474b40aefac25bc
	.xword	0xd650ed472e3f3cf4
	.xword	0xb71db2d9b387fbea
	.xword	0xfbf5549134a89955
	.xword	0xfd1c3cbfeb985638
	.xword	0x59f63960757ccf2b
	.xword	0xd29e92b5fd27202f
	.xword	0x714ed0ebe2cbf29a
	.xword	0xb7e7cd78dde2ecd7
	.xword	0xdee4f8cb9cf509dc
	.xword	0xfcd4d5f65c19cbf6
	.xword	0x908f69b953dd2c2c
	.xword	0x14e39821e87fdaba

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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 0,
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
	TTE_CP	 = 1,
	TTE_CV	 = 1,
	TTE_E	 = 1,
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
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_0,
	RA	 = 0x0000000170100000,
	PA	 = ra2pa(0x0000000170100000,0),
	part_0_ctx_nonzero_tsb_config_2,
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
	TTE_CP	 = 1,
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
	.xword	0xe0fbd11337713efc
	.xword	0x5808acda9ff186e0
	.xword	0xd91e411d88361ec4
	.xword	0x0df7916c4b246517
	.xword	0xca62d6a85352a5cb
	.xword	0xea677594e3812193
	.xword	0xc8a3c5026c06485a
	.xword	0xbe1c28403810426a
	.xword	0x5a7d85f5c80d16ee
	.xword	0xb5d3fc1cd5a32185
	.xword	0xe34ffa1be0f997b8
	.xword	0x97ff77d9d4b04d90
	.xword	0xa77cc187e1777a52
	.xword	0xc3bf2da9cffca16d
	.xword	0x7bee11a63f0c5375
	.xword	0x156ee7e0436fdc57
	.xword	0x2cfa1cb106aed740
	.xword	0x51a0d86bd438c662
	.xword	0x93f873ff8ec0fc34
	.xword	0xd9a462ca7a54a284
	.xword	0x2f51fde9450587b8
	.xword	0x9c7e5e89a5328003
	.xword	0x6ac6008c8ca413a3
	.xword	0xd7ab2891c87bd4e6
	.xword	0x25547bbe3d86c861
	.xword	0x75e99530b96bb06f
	.xword	0x90771d3272b345c3
	.xword	0xdbae5824945f287c
	.xword	0xaa2f68a3f0901842
	.xword	0x5245e1de7f65389e
	.xword	0x4be108212040d817
	.xword	0xebb6632de2f60e1c



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
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
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
	part_0_ctx_nonzero_tsb_config_2,
	TTE_G	 = 1,
	TTE_Context	 = SCONTEXT,
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
	.xword	0xbe2a97658d85981c
	.xword	0x199e88bf3c630a37
	.xword	0x7221f8fb0e6d3e43
	.xword	0x43b23f7c36be1c59
	.xword	0x471a72577921347f
	.xword	0x44ccc83d382614f2
	.xword	0x7c6da5f9094222fc
	.xword	0x5c7b6663378951e1
	.xword	0xb3501412f4750ebd
	.xword	0xb98e7675341b11c7
	.xword	0x95e243c17343deb8
	.xword	0x9252e3aa98c20ef0
	.xword	0x0f2401f18a836124
	.xword	0xf705d9bcb8de28c6
	.xword	0x3de80f220aebb4d2
	.xword	0xb20b546bbed63349
	.xword	0x9b2b61b693f4e62e
	.xword	0xed2cce7525193dfc
	.xword	0xe70a23b3b8fca368
	.xword	0x3577131c3e87bb44
	.xword	0xcb00d9280d6a6afe
	.xword	0x2f5a06f08803bb4a
	.xword	0xb44d1951b151c1de
	.xword	0x2fbd0cb8eab4bdf5
	.xword	0x66d08a97e1c9ec98
	.xword	0xa9d734bdc7418c80
	.xword	0x7bc03638738edb9f
	.xword	0x4f86098d9e557fcb
	.xword	0x6acce800a9b366cd
	.xword	0x6bb679a6f13cbf08
	.xword	0x9519f410555636f4
	.xword	0x7a6ed45297deb5aa



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
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
	part_0_ctx_nonzero_tsb_config_2,
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
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	.xword	0xf2596733eb9d7072
	.xword	0x527e8ac908573217
	.xword	0x2c7279d65224677f
	.xword	0xbd6d4b43c160596a
	.xword	0x5c154656ffe469de
	.xword	0x0a133d64a562c6dc
	.xword	0xda3fe0bf9d1f233e
	.xword	0x0d6227a820984202
	.xword	0x487fea6d303fe9e1
	.xword	0x657611af67b9b69d
	.xword	0x09c81743a365d556
	.xword	0x233e20507b50a729
	.xword	0x95da8606ad7312bb
	.xword	0xf21065e966767391
	.xword	0x7956df503549eac3
	.xword	0xb25ed96d8eb6671a
	.xword	0x9b7c494b77f6d74f
	.xword	0xed656e72c2230481
	.xword	0xc783082f654fec5d
	.xword	0x82d256d7ecb541af
	.xword	0x0ba4a228b5bf4ce6
	.xword	0x15093e35b0f84806
	.xword	0x331a9334f65310e1
	.xword	0x056a72eac7febf04
	.xword	0x1cd2a8a63cff0bc5
	.xword	0x3818a1fc0b26c806
	.xword	0x9c57fd1e968465f1
	.xword	0x9be31ce43df61248
	.xword	0xd328ce8702432435
	.xword	0x7445f061ab5289b5
	.xword	0xfac4aa55bc8a727e
	.xword	0x530dbbe9647a8512



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
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
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
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}


attr_data {
	Name	 = .MyDATA_3,
	RA	 = 0x0000000170700000,
	PA	 = ra2pa(0x0000000170700000,0),
	part_0_ctx_nonzero_tsb_config_2,
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
	TTE_CV	 = 0,
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
	.xword	0x8100f71cd599b405
	.xword	0x690d316d4cef5b10
	.xword	0xd9e1c9d5003c8b48
	.xword	0xb81623ac8bd43c97
	.xword	0x8bb3e3244b91ff97
	.xword	0xebc53cf9c7ed8f57
	.xword	0xa119a536825c0952
	.xword	0xef2d9bdfd5471a4b
	.xword	0x31a70fef20098449
	.xword	0xef2476d00a7f97a6
	.xword	0x42aa0191e9b8b86c
	.xword	0xc2114dd34ee4064c
	.xword	0x505f1d9fd2c18a0e
	.xword	0x87e546b3def02f0b
	.xword	0xe2e49739f134f708
	.xword	0x84c3826c1a2bffdc
	.xword	0x55966d6e13247ad7
	.xword	0x2c1ec80860966686
	.xword	0x622113a020e45611
	.xword	0xe80bec4b0d725425
	.xword	0xbacc0696a9c5e3cf
	.xword	0xcfed86e62f1acee3
	.xword	0x259a7bd284499cc4
	.xword	0x8b8d503db36f384f
	.xword	0x409b6acd2792577a
	.xword	0xef878a834ce78082
	.xword	0xdadfe848abcfb088
	.xword	0xe40ab2a94a293988
	.xword	0xf5284c0b0ed2400f
	.xword	0x6558069bd7fa826e
	.xword	0xe50cc550a4142fde
	.xword	0xdd66091ca0288a15





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
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f6
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
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
	TTE_W	 = 0
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f6
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
	TTE_IE	 = 0,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 0
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f6
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
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
	TTE_P	 = 0,
	TTE_W	 = 1
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f4
	mov HIGHVA_HIGHNUM, %r11
	sllx %r11, 32, %r11
	or %r27, %r11, %r27
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
	jmpl %r27+8, %r0
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
	TTE_Size	 = 1,
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
	TTE_W	 = 1,
	TTE_X	 = 1
}


.text
	nop
    mov HIGHVA_HIGHNUM, %r11
    sllx %r11, 32, %r11
    or %r27, %r11, %r27
	jmpl %r27+8, %r0
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
