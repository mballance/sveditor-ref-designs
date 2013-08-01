/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_03_01_1.s
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
    ldxa [%r31]ASI_AS_IF_USER_PRIMARY, %l2;\
    b .+8 ;\
    stda    %f16,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY ;\
    b .+12 ;\
    stda    %f0,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE ;\
    illtrap
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
    sdiv %l3, %l6, %l5;\
    stda %l4, [%r31]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P;
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
#define T_HANDLER_RAND4_6 ld [%r31], %l2;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    ld [%r31+%l3], %l3;
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
    ldxa [%r31]ASI_AS_IF_USER_PRIMARY, %l2;\
    b .+8 ;\
    stda    %f16,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY ;\
    b .+12 ;\
    stda    %f0,[%i7]ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE ;\
    illtrap
#endif
#ifndef HT_HANDLER_RAND4_4
#define HT_HANDLER_RAND4_4 ld [%i7], %l3;\
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
    stda %l4, [%r31]ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P;
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
    ld [%r31+%l3], %l3;
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
    HT_HANDLER_RAND4_6;\
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
# 349 "diag.j"
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
# 396 "diag.j"
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
	ta	T_RD_THID   ! Result in %o1 = r9
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
	mov 0xb5, %r14
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
	mov 0x30, %r14
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
	mov 0xb2, %r30
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
    wr %g2, %g0, %pcr
    ta T_RD_THID
    brnz %o1, skip_non0
setup_cmp:
    stw %g0, [%g0]
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x58]%asi, %r14
	stxa %r14, [0x50]%asi
setup_spu:
    mov 1, %r10
    set sync_thr_counter1, %r23
    st %r10, [%r23]             !lock sync_thr_counter1
    wr %g0, 0x40, %asi    
    !# allocate control word queue (e.g., setup head/tail/first/last registers)
    setx CWQ_BASE, %g1, %l6

    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %l5				!# then end of CWQ region to LAST
    stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi

    !# set  CWQ control word ([38:36] is strand ID ..)
    setx 0x2061000000000000, %l1, %l2		!#		Control Word

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

    st %r0, [%r23]    !unlock sync_thr_counter1
    wr %r0, %r12, %asi
skip_non0:
    ta T_CHANGE_NONHPRIV 
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
fpinit_80_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e76  ! 1: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe76] %asi, #one_read
	.word 0x91a01a6a  ! 2: FqTOi	fqtoi	
	.word 0x9f80374f  ! 3: SIR	sir	0x174f
splash_tba_80_1:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda800b60  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r13
	.word 0xa784c013  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r19, %-
tagged_80_3:
	taddcctv %r0, 0x1d2d, %r18
	.word 0xda07e0f7  ! 7: LDUW_I	lduw	[%r31 + 0x00f7], %r13
splash_tba_80_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_80_5:
	nop
debug_dva_80_5:
	ta T_CHANGE_HPRIV
	set 0x6351ced7, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0x2af5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b047f1  ! 10: PDISTN	fmean16	%d32, %d48, %d8
	.word 0xe68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9f8036c9  ! 12: SIR	sir	0x16c9
tagged_80_6:
	tsubcctv %r8, 0x1e45, %r18
	.word 0xe607e030  ! 13: LDUW_I	lduw	[%r31 + 0x0030], %r19
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_8)+56, 16, 16)) -> intp(80,1,3)
xir_80_8:
	.word 0xa984bb55  ! 15: WR_SET_SOFTINT_I	wr	%r18, 0x1b55, %set_softint
jmptr_80_9:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_80_10:
    set user_data_start, %o7
	.word 0x93902007  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
jmptr_80_11:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_12)+0, 16, 16)) -> intp(80,1,3)
xir_80_12:
	.word 0xa982e38a  ! 19: WR_SET_SOFTINT_I	wr	%r11, 0x038a, %set_softint
tagged_80_13:
	taddcctv %r5, 0x1917, %r17
	.word 0xe607e0e4  ! 20: LDUW_I	lduw	[%r31 + 0x00e4], %r19
	.word 0xe68fe030  ! 21: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
memptr_80_14:
	set 0x60340000, %r31
	.word 0x8584e180  ! 22: WRCCR_I	wr	%r19, 0x0180, %ccr
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x3117, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407f2  ! 24: PDISTN	fmean16	%d16, %d18, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_16)+0, 16, 16)) -> intp(80,1,3)
xir_80_16:
	.word 0xa984a1fd  ! 25: WR_SET_SOFTINT_I	wr	%r18, 0x01fd, %set_softint
cwp_80_17:
    set user_data_start, %o7
	.word 0x93902006  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
fpinit_80_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 27: FCMPLE32	fcmple32	%d0, %d4, %r6
splash_htba_80_19:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0x0a870ad2a80cf4f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa7813464  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x1464, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c637a  ! 33: SDIVX_I	sdivx	%r17, 0x037a, %r18
DS_80_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe334f810  ! 1: STQF_I	-	%f17, [0x1810, %r19]
	normalw
	.word 0xa3458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r17
    set 0x2fa4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b507ec  ! 35: PDISTN	fmean16	%d20, %d12, %d48
tagged_80_24:
	tsubcctv %r12, 0x163a, %r5
	.word 0xe007e074  ! 36: LDUW_I	lduw	[%r31 + 0x0074], %r16
	.word 0x91d020b2  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9f802b4e  ! 38: SIR	sir	0x0b4e
cwp_80_25:
    set user_data_start, %o7
	.word 0x93902003  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_80_26:
	tsubcctv %r2, 0x11fd, %r20
	.word 0xe007e0f8  ! 40: LDUW_I	lduw	[%r31 + 0x00f8], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6a29d8  ! 41: SDIVX_I	sdivx	%r8, 0x09d8, %r13
	.word 0x8d903076  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1076, %pstate
	.word 0xe4800ae0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r18
	.word 0xe4cfe030  ! 44: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r18
cwp_80_28:
    set user_data_start, %o7
	.word 0x93902004  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa784000d  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r13, %-
	.word 0x9f80243d  ! 47: SIR	sir	0x043d
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_30)+0, 16, 16)) -> intp(80,1,3)
xir_80_30:
	.word 0xa98134af  ! 48: WR_SET_SOFTINT_I	wr	%r4, 0x14af, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_80_31:
	taddcctv %r17, 0x1d42, %r19
	.word 0xe407e094  ! 50: LDUW_I	lduw	[%r31 + 0x0094], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_32)+40, 16, 16)) -> intp(80,1,3)
xir_80_32:
	.word 0xa9846977  ! 51: WR_SET_SOFTINT_I	wr	%r17, 0x0977, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_33)+56, 16, 16)) -> intp(80,1,3)
xir_80_33:
	.word 0xa984a1b3  ! 52: WR_SET_SOFTINT_I	wr	%r18, 0x01b3, %set_softint
	.word 0xe48008a0  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	.word 0xa5a4c9d1  ! 55: FDIVd	fdivd	%f50, %f48, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_36) + 32, 16, 16)) -> intp(4,0,19)
intvec_80_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7850011  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
    set 0x11c5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b187f3  ! 58: PDISTN	fmean16	%d6, %d50, %d10
splash_tba_80_38:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa4837873  ! 60: ADDcc_I	addcc 	%r13, 0xfffff873, %r18
fpinit_80_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 61: FDIVs	fdivs	%f0, %f4, %f8
splash_htba_80_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x95a0054a  ! 63: FSQRTd	fsqrt	
	.word 0xa7834009  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r9, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a7c94  ! 65: SDIVX_I	sdivx	%r9, 0xfffffc94, %r8
	.word 0xa84a8012  ! 66: MULX_R	mulx 	%r10, %r18, %r20
tagged_80_43:
	taddcctv %r18, 0x1d2d, %r1
	.word 0xd207e0ed  ! 67: LDUW_I	lduw	[%r31 + 0x00ed], %r9
splash_lsu_80_44:
	set 0x8eb785f7, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_80_45:
	set 0x1809de0f, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_80_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_46:
	.word 0x8f902001  ! 70: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x25f0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb347f4  ! 71: PDISTN	fmean16	%d44, %d20, %d44
pmu_80_47:
	nop
	setx 0xfffff979fffff912, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_80_48:
	tsubcctv %r19, 0x1d70, %r0
	.word 0xe407e032  ! 73: LDUW_I	lduw	[%r31 + 0x0032], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_49)+40, 16, 16)) -> intp(80,1,3)
xir_80_49:
	.word 0xa9832ca0  ! 74: WR_SET_SOFTINT_I	wr	%r12, 0x0ca0, %set_softint
	.word 0xa7800001  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r1, %-
	.word 0xc3ed0033  ! 76: PREFETCHA_R	prefetcha	[%r20, %r19] 0x01, #one_read
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x92f9c013  ! 78: SDIVcc_R	sdivcc 	%r7, %r19, %r9
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e020  ! 80: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0xa869329c  ! 81: UDIVX_I	udivx 	%r4, 0xfffff29c, %r20
	.word 0xa780400c  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r12, %-
splash_htba_80_54:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_80_55:
    set user_data_start, %o7
	.word 0x93902004  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cwp_80_56:
    set user_data_start, %o7
	.word 0x93902004  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87ab0a29  ! 88: FCMPs	fcmps	%fcc<n>, %f12, %f9
    set 0x1453, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b4c7ea  ! 89: PDISTN	fmean16	%d50, %d10, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_57)+16, 16, 16)) -> intp(80,1,3)
xir_80_57:
	.word 0xa982f4de  ! 90: WR_SET_SOFTINT_I	wr	%r11, 0x14de, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_58) + 0, 16, 16)) -> intp(3,0,17)
intvec_80_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe28008a0  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x9f80204b  ! 94: SIR	sir	0x004b
splash_lsu_80_60:
	set 0xa475fea5, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_80_61:
	set 0x60740000, %r31
	.word 0x85833a95  ! 96: WRCCR_I	wr	%r12, 0x1a95, %ccr
	.word 0x8d90308f  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x108f, %pstate
	.word 0x91a089ad  ! 98: FDIVs	fdivs	%f2, %f13, %f8
    set 0x176b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b087f1  ! 99: PDISTN	fmean16	%d2, %d48, %d48
fpinit_80_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82741  ! 100: PREFETCHA_I	prefetcha	[%r0, + 0x0741] %asi, #one_read
	.word 0xa86ce34d  ! 101: UDIVX_I	udivx 	%r19, 0x034d, %r20
    set 0xb35, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507f0  ! 102: PDISTN	fmean16	%d20, %d16, %d40
	.word 0xd9e50032  ! 103: CASA_I	casa	[%r20] 0x 1, %r18, %r12
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_80_66:
	set 0x5855d18b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa8f88013  ! 107: SDIVcc_R	sdivcc 	%r2, %r19, %r20
cwp_80_67:
    set user_data_start, %o7
	.word 0x93902005  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
jmptr_80_68:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_80_70:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1dde, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b1c7f4  ! 112: PDISTN	fmean16	%d38, %d20, %d42
cwp_80_71:
    set user_data_start, %o7
	.word 0x93902003  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_htba_80_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_80_73:
	.word 0x81982216  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
splash_htba_80_74:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803687  ! 117: SIR	sir	0x1687
splash_htba_80_75:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_80_76:
	tsubcctv %r20, 0x1a36, %r18
	.word 0xe407e048  ! 119: LDUW_I	lduw	[%r31 + 0x0048], %r18
	.word 0xa9a009d3  ! 120: FDIVd	fdivd	%f0, %f50, %f20
	.word 0x99a489d0  ! 121: FDIVd	fdivd	%f18, %f16, %f12
	.word 0xd21fe030  ! 122: LDD_I	ldd	[%r31 + 0x0030], %r9
    set 0x2ba4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b487f2  ! 123: PDISTN	fmean16	%d18, %d18, %d40
splash_lsu_80_79:
	set 0x740ea88a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800b60  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r17
	.word 0xa782c000  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r0, %-
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d90240e  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x040e, %pstate
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_80_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d900014  ! 131: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
cwp_80_84:
    set user_data_start, %o7
	.word 0x93902007  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_80_86:
	tsubcctv %r19, 0x1528, %r1
	.word 0xe207e024  ! 134: LDUW_I	lduw	[%r31 + 0x0024], %r17
splash_lsu_80_87:
	set 0x41cbae38, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe000  ! 136: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0xa5a109b0  ! 137: FDIVs	fdivs	%f4, %f16, %f18
	.word 0x99b244c8  ! 138: FCMPNE32	fcmpne32	%d40, %d8, %r12
change_to_randtl_80_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd68008a0  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_lsu_80_91:
	set 0x8389f010, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a20dd0  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_80_92:
	set 0x60340000, %r31
	.word 0x858072b6  ! 144: WRCCR_I	wr	%r1, 0x12b6, %ccr
	.word 0xd097e020  ! 145: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
splash_htba_80_93:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7a1c9d2  ! 147: FDIVd	fdivd	%f38, %f18, %f50
    set 0x1501, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7e3  ! 148: PDISTN	fmean16	%d50, %d34, %d40
jmptr_80_94:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_80_95:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe010  ! 151: LDUB_I	ldub	[%r31 + 0x0010], %r13
    set 0x1d3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b307f2  ! 152: PDISTN	fmean16	%d12, %d18, %d42
splash_htba_80_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803daf  ! 154: SIR	sir	0x1daf
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
	.word 0xa781c013  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r19, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16866ab  ! 157: SDIVX_I	sdivx	%r1, 0x06ab, %r16
jmptr_80_100:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e0b8  ! 159: STF_I	st	%f19, [0x00b8, %r31]
	.word 0x9f802ac2  ! 160: SIR	sir	0x0ac2
cwp_80_101:
    set user_data_start, %o7
	.word 0x93902003  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903668  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x1668, %pstate
    set 0x1e18, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7e6  ! 163: PDISTN	fmean16	%d50, %d6, %d48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01961  ! 164: FqTOd	dis not found

	.word 0x93a509c3  ! 165: FDIVd	fdivd	%f20, %f34, %f40
	.word 0x8d902f9f  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x0f9f, %pstate
	.word 0xa6698013  ! 167: UDIVX_R	udivx 	%r6, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_104)+8, 16, 16)) -> intp(80,1,3)
xir_80_104:
	.word 0xa984f0b5  ! 168: WR_SET_SOFTINT_I	wr	%r19, 0x10b5, %set_softint
	setx 0xf6368064814a6653, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_80_106:
    set user_data_start, %o7
	.word 0x93902001  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_80_107:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76a75d6  ! 172: SDIVX_I	sdivx	%r9, 0xfffff5d6, %r19
splash_tba_80_109:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_80_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 174: FCMPLE32	fcmple32	%d0, %d4, %r6
	setx 0x98ea11dcfcd4bed9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_80_112:
	set 0x60740000, %r31
	.word 0x8584bd14  ! 176: WRCCR_I	wr	%r18, 0x1d14, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169a80d  ! 177: SDIVX_I	sdivx	%r6, 0x080d, %r16
cwp_80_114:
    set user_data_start, %o7
	.word 0x93902003  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
    set 0x3b3d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b247f1  ! 179: PDISTN	fmean16	%d40, %d48, %d50
splash_tba_80_115:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x73f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b507f1  ! 181: PDISTN	fmean16	%d20, %d48, %d8
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_80_117:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_80_118:
    set user_data_start, %o7
	.word 0x93902006  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_80_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_119-donret_80_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c81a53 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcde, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_119:
	.word 0xe2ffe09c  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x009c] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_120)+24, 16, 16)) -> intp(80,1,3)
xir_80_120:
	.word 0xa9842034  ! 186: WR_SET_SOFTINT_I	wr	%r16, 0x0034, %set_softint
	.word 0xe2800ac0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
splash_htba_80_121:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80306a  ! 189: SIR	sir	0x106a
debug_80_122:
	nop
debug_dva_80_122:
	ta T_CHANGE_HPRIV
	set 0xff08f919, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_80_123:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_124)+56, 16, 16)) -> intp(80,1,3)
xir_80_124:
	.word 0xa982bc4f  ! 192: WR_SET_SOFTINT_I	wr	%r10, 0x1c4f, %set_softint
	setx 0xae23e963dcf889d0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_126) + 16, 16, 16)) -> intp(4,0,16)
intvec_80_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7850005  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r5, %-
memptr_80_128:
	set 0x60540000, %r31
	.word 0x85842cf4  ! 196: WRCCR_I	wr	%r16, 0x0cf4, %ccr
    set 0x24a1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b007f2  ! 197: PDISTN	fmean16	%d0, %d18, %d48
	.word 0xa7850001  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r1, %-
splash_htba_80_130:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_80_131:
    set user_data_start, %o7
	.word 0x93902001  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_hpstate_80_132:
	.word 0x8198251e  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051e, %hpstate
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_80_134:
    set user_data_start, %o7
	.word 0x93902007  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_135)+56, 16, 16)) -> intp(80,1,3)
xir_80_135:
	.word 0xa984ad18  ! 204: WR_SET_SOFTINT_I	wr	%r18, 0x0d18, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_80_136:
	tsubcctv %r17, 0x10c1, %r19
	.word 0xd407e038  ! 206: LDUW_I	lduw	[%r31 + 0x0038], %r10
memptr_80_137:
	set 0x60740000, %r31
	.word 0x8580244b  ! 207: WRCCR_I	wr	%r0, 0x044b, %ccr
cwp_80_138:
    set user_data_start, %o7
	.word 0x93902006  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93a509ca  ! 209: FDIVd	fdivd	%f20, %f10, %f40
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_80_141:
    set user_data_start, %o7
	.word 0x93902001  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
memptr_80_142:
	set 0x60140000, %r31
	.word 0x85846c70  ! 212: WRCCR_I	wr	%r17, 0x0c70, %ccr
splash_htba_80_143:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_80_144:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x319f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b507e6  ! 215: PDISTN	fmean16	%d20, %d6, %d42
	.word 0xa7b00491  ! 216: FCMPLE32	fcmple32	%d0, %d48, %r19
	.word 0xe597e000  ! 217: LDQFA_I	-	[%r31, 0x0000], %f18
	.word 0xa78479f2  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r17, 0x19f2, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_80_146:
    set user_data_start, %o7
	.word 0x93902007  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    set 0x240d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b007f2  ! 221: PDISTN	fmean16	%d0, %d18, %d12
	.word 0x99a44dc2  ! 222: FdMULq	fdmulq	
jmptr_80_147:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa781c00c  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r12, %-
	.word 0xe4800aa0  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r18
	.word 0xa3a449c8  ! 226: FDIVd	fdivd	%f48, %f8, %f48
	.word 0x9f803ef5  ! 227: SIR	sir	0x1ef5
	.word 0x8d9023c5  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x03c5, %pstate
	.word 0xd88fe030  ! 229: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
jmptr_80_150:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_80_151:
	set 0x3e6188c7, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90323b  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x123b, %pstate
	.word 0x87ac0a41  ! 233: FCMPd	fcmpd	%fcc<n>, %f16, %f32
splash_hpstate_80_153:
	.word 0x819826d5  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_154)+40, 16, 16)) -> intp(80,1,3)
xir_80_154:
	.word 0xa98470dd  ! 236: WR_SET_SOFTINT_I	wr	%r17, 0x10dd, %set_softint
	.word 0x8d903856  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1856, %pstate
	.word 0x8d902ace  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x0ace, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_155)+0, 16, 16)) -> intp(80,1,3)
xir_80_155:
	.word 0xa982b198  ! 239: WR_SET_SOFTINT_I	wr	%r10, 0x1198, %set_softint
	.word 0x9f803396  ! 240: SIR	sir	0x1396
fpinit_80_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 241: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x9f8027a8  ! 242: SIR	sir	0x07a8
	.word 0xa36cc000  ! 243: SDIVX_R	sdivx	%r19, %r0, %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56cf5ae  ! 244: SDIVX_I	sdivx	%r19, 0xfffff5ae, %r18
	.word 0xe257e030  ! 245: LDSH_I	ldsh	[%r31 + 0x0030], %r17
	.word 0xe297e020  ! 246: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0xa7844014  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
    set 0x34dd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b207f1  ! 248: PDISTN	fmean16	%d8, %d48, %d40
	.word 0xa953c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_80_159:
	nop
	setx 0xfffff50dfffffe30, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_160)+0, 16, 16)) -> intp(80,1,3)
xir_80_160:
	.word 0xa9853b5f  ! 252: WR_SET_SOFTINT_I	wr	%r20, 0x1b5f, %set_softint
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_162)+8, 16, 16)) -> intp(80,1,3)
xir_80_162:
	.word 0xa9846baf  ! 254: WR_SET_SOFTINT_I	wr	%r17, 0x0baf, %set_softint
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
	.word 0xa780400a  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r10, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
	.word 0xa7a109d0  ! 258: FDIVd	fdivd	%f4, %f16, %f50
tagged_80_166:
	tsubcctv %r1, 0x173b, %r13
	.word 0xe607e0ef  ! 259: LDUW_I	lduw	[%r31 + 0x00ef], %r19
	.word 0xa784c012  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
	.word 0xa781c010  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r16, %-
	.word 0x8d903b0b  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x1b0b, %pstate
	.word 0xa9a4c9ea  ! 263: FDIVq	dis not found

cwp_80_169:
    set user_data_start, %o7
	.word 0x93902002  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_80_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d928014  ! 266: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_80_171:
    set user_data_start, %o7
	.word 0x93902007  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
cwp_80_172:
    set user_data_start, %o7
	.word 0x93902005  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_80_173:
	set 0xaf894083, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5b484c3  ! 271: FCMPNE32	fcmpne32	%d18, %d34, %r18
fpinit_80_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 272: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_80_176:
    set user_data_start, %o7
	.word 0x93902007  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    set 0x2903, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b047f3  ! 275: PDISTN	fmean16	%d32, %d50, %d48
cwp_80_177:
    set user_data_start, %o7
	.word 0x93902006  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa7814003  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r3, %-
change_to_randtl_80_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_179:
	.word 0x8f902000  ! 278: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_180)+56, 16, 16)) -> intp(80,1,3)
xir_80_180:
	.word 0xa984fd2a  ! 279: WR_SET_SOFTINT_I	wr	%r19, 0x1d2a, %set_softint
	setx 0x1d32ea5802ce9160, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87a84a4a  ! 281: FCMPd	fcmpd	%fcc<n>, %f32, %f10
	.word 0xc3e80033  ! 282: PREFETCHA_R	prefetcha	[%r0, %r19] 0x01, #one_read
intveclr_80_184:
	setx 0x8a89cc4944b8921c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_185:
	setx 0xbb933572732c51f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_80_186:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_80_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 286: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x39400001  ! 287: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802458  ! 288: SIR	sir	0x0458
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_80_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 290: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa7848010  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_192)+48, 16, 16)) -> intp(80,1,3)
xir_80_192:
	.word 0xa980bfaa  ! 292: WR_SET_SOFTINT_I	wr	%r2, 0x1faa, %set_softint
splash_hpstate_80_193:
	.word 0x81982555  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0xc3e90032  ! 294: PREFETCHA_R	prefetcha	[%r4, %r18] 0x01, #one_read
    set 0x1c3f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407e7  ! 295: PDISTN	fmean16	%d16, %d38, %d20
    set 0x2a46, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b4c7f4  ! 296: PDISTN	fmean16	%d50, %d20, %d8
memptr_80_195:
	set user_data_start, %r31
	.word 0x85843fa5  ! 297: WRCCR_I	wr	%r16, 0x1fa5, %ccr
	.word 0xd4800a60  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
	.word 0xc36cf072  ! 299: PREFETCH_I	prefetch	[%r19 + 0xfffff072], #one_read
    set 0x2047, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b0c7e0  ! 300: PDISTN	fmean16	%d34, %d0, %d40
cwp_80_197:
    set user_data_start, %o7
	.word 0x93902007  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa780000d  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r13, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x95a2c9d2  ! 304: FDIVd	fdivd	%f42, %f18, %f10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_200)+40, 16, 16)) -> intp(80,1,3)
xir_80_200:
	.word 0xa982b289  ! 305: WR_SET_SOFTINT_I	wr	%r10, 0x1289, %set_softint
	.word 0xd6dfe010  ! 306: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9568ecf2  ! 307: SDIVX_I	sdivx	%r3, 0x0cf2, %r10
	.word 0x9145c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r8
change_to_randtl_80_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_202:
	.word 0x8f902001  ! 309: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_80_203:
    set user_data_start, %o7
	.word 0x93902006  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_80_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_80_205:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x91d02032  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9f80267c  ! 314: SIR	sir	0x067c
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_206:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 315: RDPC	rd	%pc, %r11
tagged_80_207:
	taddcctv %r1, 0x10ba, %r10
	.word 0xd407e04c  ! 316: LDUW_I	lduw	[%r31 + 0x004c], %r10
	.word 0x39400001  ! 317: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd64fe030  ! 318: LDSB_I	ldsb	[%r31 + 0x0030], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_209)+48, 16, 16)) -> intp(80,1,3)
xir_80_209:
	.word 0xa98126fc  ! 319: WR_SET_SOFTINT_I	wr	%r4, 0x06fc, %set_softint
	rd %pc, %r19
	add %r19, (ivw_80_210-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_210:
	.word 0x91944002  ! 320: WRPR_PIL_R	wrpr	%r17, %r2, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_211)+48, 16, 16)) -> intp(80,1,3)
xir_80_211:
	.word 0xa982e21a  ! 321: WR_SET_SOFTINT_I	wr	%r11, 0x021a, %set_softint
intveclr_80_212:
	setx 0x0cf04c4fc6bbe38d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_80_213:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_80_214:
    set user_data_start, %o7
	.word 0x93902005  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_80_215:
	taddcctv %r16, 0x124c, %r5
	.word 0xd607e029  ! 325: LDUW_I	lduw	[%r31 + 0x0029], %r11
	.word 0x9f80320c  ! 326: SIR	sir	0x120c
	.word 0x8d903664  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x1664, %pstate
splash_htba_80_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_80_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_217:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	.word 0xa3a509c5  ! 331: FDIVd	fdivd	%f20, %f36, %f48
fpinit_80_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 332: FDIVs	fdivs	%f0, %f4, %f6
fpinit_80_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 333: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa968fc5f  ! 334: SDIVX_I	sdivx	%r3, 0xfffffc5f, %r20
splash_tba_80_223:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x22a9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b2c7e9  ! 336: PDISTN	fmean16	%d42, %d40, %d40
splash_tba_80_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_80_225:
	taddcctv %r12, 0x1564, %r17
	.word 0xe207e0e8  ! 338: LDUW_I	lduw	[%r31 + 0x00e8], %r17
splash_lsu_80_226:
	set 0xf3d75af0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x26a5, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407f0  ! 341: PDISTN	fmean16	%d16, %d16, %d40
	.word 0xc3ecc030  ! 342: PREFETCHA_R	prefetcha	[%r19, %r16] 0x01, #one_read
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_229)+24, 16, 16)) -> intp(80,1,3)
xir_80_229:
	.word 0xa98037cf  ! 344: WR_SET_SOFTINT_I	wr	%r0, 0x17cf, %set_softint
	.word 0xda9fc240  ! 345: LDDA_R	ldda	[%r31, %r0] 0x12, %r13
cwp_80_230:
    set user_data_start, %o7
	.word 0x93902003  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_80_231:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_80_232:
    set user_data_start, %o7
	.word 0x93902000  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f803ae7  ! 350: SIR	sir	0x1ae7
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f803514  ! 352: SIR	sir	0x1514
	.word 0xdadfe000  ! 353: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569ef78  ! 354: SDIVX_I	sdivx	%r7, 0x0f78, %r10
	.word 0x9f80340d  ! 355: SIR	sir	0x140d
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_236)+0, 16, 16)) -> intp(80,1,3)
xir_80_236:
	.word 0xa9852c8a  ! 356: WR_SET_SOFTINT_I	wr	%r20, 0x0c8a, %set_softint
splash_tba_80_237:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa2d36a3e  ! 358: UMULcc_I	umulcc 	%r13, 0x0a3e, %r17
    set 0x88, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b407f0  ! 359: PDISTN	fmean16	%d16, %d16, %d10
jmptr_80_238:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa784800b  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r11, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0xa96a8005  ! 364: SDIVX_R	sdivx	%r10, %r5, %r20
splash_lsu_80_240:
	set 0xe4ad97e4, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_80_241:
	set 0x60140000, %r31
	.word 0x85847a62  ! 366: WRCCR_I	wr	%r17, 0x1a62, %ccr
	.word 0x91b444cd  ! 367: FCMPNE32	fcmpne32	%d48, %d44, %r8
fpinit_80_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 368: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01970  ! 369: FqTOd	dis not found

    set 0x1a7d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b307f0  ! 370: PDISTN	fmean16	%d12, %d16, %d40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996caa99  ! 371: SDIVX_I	sdivx	%r18, 0x0a99, %r12
splash_tba_80_246:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_80_247:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_248)+48, 16, 16)) -> intp(80,1,3)
xir_80_248:
	.word 0xa984a67c  ! 374: WR_SET_SOFTINT_I	wr	%r18, 0x067c, %set_softint
	.word 0xe86fe027  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x0027]
splash_tba_80_249:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7804008  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r8, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01970  ! 378: FqTOd	dis not found

	.word 0x9081000b  ! 379: ADDcc_R	addcc 	%r4, %r11, %r8
memptr_80_252:
	set user_data_start, %r31
	.word 0x8581ac66  ! 380: WRCCR_I	wr	%r6, 0x0c66, %ccr
splash_htba_80_253:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9880c008  ! 382: ADDcc_R	addcc 	%r3, %r8, %r12
fpinit_80_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 383: FDIVd	fdivd	%f0, %f4, %f8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_255)+48, 16, 16)) -> intp(80,1,3)
xir_80_255:
	.word 0xa9806249  ! 384: WR_SET_SOFTINT_I	wr	%r1, 0x0249, %set_softint
debug_80_256:
	nop
debug_iva_80_256:
	ta T_CHANGE_HPRIV
	set 0xc2e01b55, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_257)+16, 16, 16)) -> intp(80,1,3)
xir_80_257:
	.word 0xa982e433  ! 386: WR_SET_SOFTINT_I	wr	%r11, 0x0433, %set_softint
tagged_80_258:
	tsubcctv %r20, 0x1099, %r11
	.word 0xe007e0ca  ! 387: LDUW_I	lduw	[%r31 + 0x00ca], %r16
memptr_80_259:
	set 0x60740000, %r31
	.word 0x8581a343  ! 388: WRCCR_I	wr	%r6, 0x0343, %ccr
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_260:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 389: RDPC	rd	%pc, %r12
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_80_262:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa785000d  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r13, %-
intveclr_80_264:
	setx 0x1935115cc0978e24, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_80_265:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d902212  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x0212, %pstate
splash_htba_80_266:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7820000  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r0, %-
	.word 0xa7850002  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r2, %-
	.word 0xa7848012  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
intveclr_80_270:
	setx 0x78ec547184b4b134, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
fpinit_40_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 1: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x95a01a61  ! 2: FqTOi	fqtoi	
	.word 0x9f80370c  ! 3: SIR	sir	0x170c
splash_tba_40_1:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda800ac0  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r13
	.word 0xa7840010  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
tagged_40_3:
	taddcctv %r7, 0x108e, %r4
	.word 0xda07e0e9  ! 7: LDUW_I	lduw	[%r31 + 0x00e9], %r13
splash_tba_40_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_40_5:
	nop
debug_dva_40_5:
	ta T_CHANGE_HPRIV
	set 0xa496e372, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0x368, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b2c7ed  ! 10: PDISTN	fmean16	%d42, %d44, %d8
	.word 0xe68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9f80246b  ! 12: SIR	sir	0x046b
tagged_40_6:
	tsubcctv %r1, 0x12ac, %r3
	.word 0xe607e0c8  ! 13: LDUW_I	lduw	[%r31 + 0x00c8], %r19
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_8)+16, 16, 16)) -> intp(40,1,3)
xir_40_8:
	.word 0xa98068ef  ! 15: WR_SET_SOFTINT_I	wr	%r1, 0x08ef, %set_softint
jmptr_40_9:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_40_10:
    set user_data_start, %o7
	.word 0x93902001  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_40_11:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_12)+0, 16, 16)) -> intp(40,1,3)
xir_40_12:
	.word 0xa98526f5  ! 19: WR_SET_SOFTINT_I	wr	%r20, 0x06f5, %set_softint
tagged_40_13:
	taddcctv %r2, 0x1c1f, %r20
	.word 0xe607e024  ! 20: LDUW_I	lduw	[%r31 + 0x0024], %r19
	.word 0xe68fe010  ! 21: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r19
memptr_40_14:
	set 0x60340000, %r31
	.word 0x858470f4  ! 22: WRCCR_I	wr	%r17, 0x10f4, %ccr
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x1b92, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b447e5  ! 24: PDISTN	fmean16	%d48, %d36, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_16)+16, 16, 16)) -> intp(40,1,3)
xir_40_16:
	.word 0xa98234b7  ! 25: WR_SET_SOFTINT_I	wr	%r8, 0x14b7, %set_softint
cwp_40_17:
    set user_data_start, %o7
	.word 0x93902001  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
fpinit_40_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 27: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_htba_40_19:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0xc16a5a327b729172, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa78528dd  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r20, 0x08dd, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956927f5  ! 33: SDIVX_I	sdivx	%r4, 0x07f5, %r10
DS_40_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe7302164  ! 1: STQF_I	-	%f19, [0x0164, %r0]
	normalw
	.word 0x9b458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r13
    set 0x12a0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b147f4  ! 35: PDISTN	fmean16	%d36, %d20, %d12
tagged_40_24:
	tsubcctv %r5, 0x1a1e, %r18
	.word 0xe007e041  ! 36: LDUW_I	lduw	[%r31 + 0x0041], %r16
	.word 0x93d02033  ! 37: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9f802a63  ! 38: SIR	sir	0x0a63
cwp_40_25:
    set user_data_start, %o7
	.word 0x93902000  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_40_26:
	tsubcctv %r17, 0x153b, %r3
	.word 0xe007e044  ! 40: LDUW_I	lduw	[%r31 + 0x0044], %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ce14e  ! 41: SDIVX_I	sdivx	%r19, 0x014e, %r19
	.word 0x8d902876  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0876, %pstate
	.word 0xe4800ac0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
	.word 0xe4cfe020  ! 44: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
cwp_40_28:
    set user_data_start, %o7
	.word 0x93902004  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa7850013  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r19, %-
	.word 0x9f802eb0  ! 47: SIR	sir	0x0eb0
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_30)+8, 16, 16)) -> intp(40,1,3)
xir_40_30:
	.word 0xa982201e  ! 48: WR_SET_SOFTINT_I	wr	%r8, 0x001e, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_40_31:
	taddcctv %r20, 0x1d7c, %r18
	.word 0xe407e0c4  ! 50: LDUW_I	lduw	[%r31 + 0x00c4], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_32)+48, 16, 16)) -> intp(40,1,3)
xir_40_32:
	.word 0xa98272f4  ! 51: WR_SET_SOFTINT_I	wr	%r9, 0x12f4, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_33)+48, 16, 16)) -> intp(40,1,3)
xir_40_33:
	.word 0xa9813dcd  ! 52: WR_SET_SOFTINT_I	wr	%r4, 0x1dcd, %set_softint
	.word 0xe4800b60  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	.word 0xa3b184d4  ! 55: FCMPNE32	fcmpne32	%d6, %d20, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_36) + 16, 16, 16)) -> intp(4,0,20)
intvec_40_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7850013  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r19, %-
    set 0x197e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b407e8  ! 58: PDISTN	fmean16	%d16, %d8, %d50
splash_tba_40_38:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x98823681  ! 60: ADDcc_I	addcc 	%r8, 0xfffff681, %r12
fpinit_40_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 61: FCMPLE32	fcmple32	%d0, %d4, %r8
splash_htba_40_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa9a00540  ! 63: FSQRTd	fsqrt	
	.word 0xa784c014  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9768a61e  ! 65: SDIVX_I	sdivx	%r2, 0x061e, %r11
	.word 0xa24cc00c  ! 66: MULX_R	mulx 	%r19, %r12, %r17
tagged_40_43:
	taddcctv %r6, 0x1577, %r20
	.word 0xd207e0f0  ! 67: LDUW_I	lduw	[%r31 + 0x00f0], %r9
splash_lsu_40_44:
	set 0xe9234060, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_40_45:
	set 0xa3945f57, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_40_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_46:
	.word 0x8f902001  ! 70: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x2d51, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b147e9  ! 71: PDISTN	fmean16	%d36, %d40, %d18
pmu_40_47:
	nop
	setx 0xfffffdaefffff9ee, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_40_48:
	tsubcctv %r19, 0x110b, %r16
	.word 0xe407e02a  ! 73: LDUW_I	lduw	[%r31 + 0x002a], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_49)+40, 16, 16)) -> intp(40,1,3)
xir_40_49:
	.word 0xa9812a39  ! 74: WR_SET_SOFTINT_I	wr	%r4, 0x0a39, %set_softint
	.word 0xa7848012  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0xa3b2c48b  ! 76: FCMPLE32	fcmple32	%d42, %d42, %r17
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x90fb0003  ! 78: SDIVcc_R	sdivcc 	%r12, %r3, %r8
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e000  ! 80: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0x946d3614  ! 81: UDIVX_I	udivx 	%r20, 0xfffff614, %r10
	.word 0xa7850012  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r18, %-
splash_htba_40_54:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_40_55:
    set user_data_start, %o7
	.word 0x93902005  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
cwp_40_56:
    set user_data_start, %o7
	.word 0x93902000  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87acca31  ! 88: FCMPs	fcmps	%fcc<n>, %f19, %f17
    set 0x12f8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b507f0  ! 89: PDISTN	fmean16	%d20, %d16, %d50
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_57)+56, 16, 16)) -> intp(40,1,3)
xir_40_57:
	.word 0xa985205d  ! 90: WR_SET_SOFTINT_I	wr	%r20, 0x005d, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_58) + 8, 16, 16)) -> intp(2,0,29)
intvec_40_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe2800b20  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r17
	.word 0x9f803d57  ! 94: SIR	sir	0x1d57
splash_lsu_40_60:
	set 0xfd405ebe, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_40_61:
	set 0x60140000, %r31
	.word 0x8584268a  ! 96: WRCCR_I	wr	%r16, 0x068a, %ccr
	.word 0x8d9035d3  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x15d3, %pstate
	.word 0x87a94a51  ! 98: FCMPd	fcmpd	%fcc<n>, %f36, %f48
    set 0x3e23, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507e2  ! 99: PDISTN	fmean16	%d20, %d2, %d40
fpinit_40_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 100: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xa66ce7e5  ! 101: UDIVX_I	udivx 	%r19, 0x07e5, %r19
    set 0x5a1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407e5  ! 102: PDISTN	fmean16	%d16, %d36, %d40
	.word 0xc36cf351  ! 103: PREFETCH_I	prefetch	[%r19 + 0xfffff351], #one_read
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_40_66:
	set 0xd78e3ea8, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa4fa8013  ! 107: SDIVcc_R	sdivcc 	%r10, %r19, %r18
cwp_40_67:
    set user_data_start, %o7
	.word 0x93902006  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
jmptr_40_68:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_40_70:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1cf7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b0c7f3  ! 112: PDISTN	fmean16	%d34, %d50, %d50
cwp_40_71:
    set user_data_start, %o7
	.word 0x93902005  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_htba_40_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_40_73:
	.word 0x81982b4e  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4e, %hpstate
splash_htba_40_74:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8039ba  ! 117: SIR	sir	0x19ba
splash_htba_40_75:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_40_76:
	tsubcctv %r0, 0x1dc7, %r8
	.word 0xe407e076  ! 119: LDUW_I	lduw	[%r31 + 0x0076], %r18
	.word 0x91a309b0  ! 120: FDIVs	fdivs	%f12, %f16, %f8
	.word 0x24ca0001  ! 121: BRLEZ	brlez,a,pt	%r8,<label_0xa0001>
	.word 0xd21fe010  ! 122: LDD_I	ldd	[%r31 + 0x0010], %r9
    set 0x1fa, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407ea  ! 123: PDISTN	fmean16	%d16, %d10, %d44
splash_lsu_40_79:
	set 0xdbd80591, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800a60  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r17
	.word 0xa7840005  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r5, %-
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d903ef3  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1ef3, %pstate
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_40_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3f0] %asi
	.word 0x9d94c010  ! 131: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
cwp_40_84:
    set user_data_start, %o7
	.word 0x93902005  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_40_86:
	tsubcctv %r9, 0x1d59, %r20
	.word 0xe207e0ac  ! 134: LDUW_I	lduw	[%r31 + 0x00ac], %r17
splash_lsu_40_87:
	set 0xbe33dbf0, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 136: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
	.word 0xc3eb4034  ! 137: PREFETCHA_R	prefetcha	[%r13, %r20] 0x01, #one_read
	.word 0xe03d0001  ! 138: STD_R	std	%r16, [%r20 + %r1]
change_to_randtl_40_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd6800c60  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
splash_lsu_40_91:
	set 0xe3360365, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a1cdd0  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_40_92:
	set 0x60340000, %r31
	.word 0x85843cab  ! 144: WRCCR_I	wr	%r16, 0x1cab, %ccr
	.word 0xd097e010  ! 145: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
splash_htba_40_93:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x97a4c9d4  ! 147: FDIVd	fdivd	%f50, %f20, %f42
    set 0x3831, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7e0  ! 148: PDISTN	fmean16	%d50, %d0, %d40
jmptr_40_94:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_40_95:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe020  ! 151: LDUB_I	ldub	[%r31 + 0x0020], %r13
    set 0x3c7b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b507eb  ! 152: PDISTN	fmean16	%d20, %d42, %d18
splash_htba_40_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80340c  ! 154: SIR	sir	0x140c
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
	.word 0xa780c013  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r19, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6a797a  ! 157: SDIVX_I	sdivx	%r9, 0xfffff97a, %r13
jmptr_40_100:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e040  ! 159: STF_I	st	%f19, [0x0040, %r31]
	.word 0x9f8024c1  ! 160: SIR	sir	0x04c1
cwp_40_101:
    set user_data_start, %o7
	.word 0x93902001  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902cd3  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x0cd3, %pstate
    set 0x2a44, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb107e8  ! 163: PDISTN	fmean16	%d4, %d8, %d44
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01971  ! 164: FqTOd	dis not found

	.word 0xa9b0448d  ! 165: FCMPLE32	fcmple32	%d32, %d44, %r20
	.word 0x8d903128  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x1128, %pstate
	.word 0xa46c4013  ! 167: UDIVX_R	udivx 	%r17, %r19, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_104)+24, 16, 16)) -> intp(40,1,3)
xir_40_104:
	.word 0xa98235e9  ! 168: WR_SET_SOFTINT_I	wr	%r8, 0x15e9, %set_softint
	setx 0x8182b081ca7621c9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_40_106:
    set user_data_start, %o7
	.word 0x93902000  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
jmptr_40_107:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76ca417  ! 172: SDIVX_I	sdivx	%r18, 0x0417, %r19
splash_tba_40_109:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_40_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 174: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx 0xc2d28455f2dde1ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_112:
	set 0x60340000, %r31
	.word 0x85837f59  ! 176: WRCCR_I	wr	%r13, 0x1f59, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b75fc  ! 177: SDIVX_I	sdivx	%r13, 0xfffff5fc, %r20
cwp_40_114:
    set user_data_start, %o7
	.word 0x93902001  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    set 0x46, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb187f1  ! 179: PDISTN	fmean16	%d6, %d48, %d44
splash_tba_40_115:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x355c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507e0  ! 181: PDISTN	fmean16	%d20, %d0, %d40
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_40_117:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_40_118:
    set user_data_start, %o7
	.word 0x93902007  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
donret_40_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_119-donret_40_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eb28d9 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_119:
	.word 0xe2ffe04d  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x004d] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_120)+16, 16, 16)) -> intp(40,1,3)
xir_40_120:
	.word 0xa98161d8  ! 186: WR_SET_SOFTINT_I	wr	%r5, 0x01d8, %set_softint
	.word 0xe2800b20  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r17
splash_htba_40_121:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803ef4  ! 189: SIR	sir	0x1ef4
debug_40_122:
	nop
debug_dva_40_122:
	ta T_CHANGE_HPRIV
	set 0x4eee2e65, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_40_123:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_124)+32, 16, 16)) -> intp(40,1,3)
xir_40_124:
	.word 0xa9833b71  ! 192: WR_SET_SOFTINT_I	wr	%r12, 0x1b71, %set_softint
	setx 0x6450293d7c1a2d4a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_126) + 32, 16, 16)) -> intp(7,0,31)
intvec_40_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7848012  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
memptr_40_128:
	set 0x60740000, %r31
	.word 0x8582b553  ! 196: WRCCR_I	wr	%r10, 0x1553, %ccr
    set 0x8e7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b187f0  ! 197: PDISTN	fmean16	%d6, %d16, %d16
	.word 0xa7810011  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r17, %-
splash_htba_40_130:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_40_131:
    set user_data_start, %o7
	.word 0x93902007  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_hpstate_40_132:
	.word 0x81982f25  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f25, %hpstate
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_40_134:
    set user_data_start, %o7
	.word 0x93902006  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_135)+32, 16, 16)) -> intp(40,1,3)
xir_40_135:
	.word 0xa9846a0f  ! 204: WR_SET_SOFTINT_I	wr	%r17, 0x0a0f, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_40_136:
	tsubcctv %r7, 0x11ec, %r9
	.word 0xd407e0d1  ! 206: LDUW_I	lduw	[%r31 + 0x00d1], %r10
memptr_40_137:
	set 0x60340000, %r31
	.word 0x8584a590  ! 207: WRCCR_I	wr	%r18, 0x0590, %ccr
cwp_40_138:
    set user_data_start, %o7
	.word 0x93902003  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa9a209b2  ! 209: FDIVs	fdivs	%f8, %f18, %f20
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_40_141:
    set user_data_start, %o7
	.word 0x93902000  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
memptr_40_142:
	set 0x60340000, %r31
	.word 0x8582736d  ! 212: WRCCR_I	wr	%r9, 0x136d, %ccr
splash_htba_40_143:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_40_144:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x37ef, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b4c7f3  ! 215: PDISTN	fmean16	%d50, %d50, %d12
	.word 0xc3ec0033  ! 216: PREFETCHA_R	prefetcha	[%r16, %r19] 0x01, #one_read
	.word 0xe597e010  ! 217: LDQFA_I	-	[%r31, 0x0010], %f18
	.word 0xa7803a9f  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x1a9f, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_40_146:
    set user_data_start, %o7
	.word 0x93902005  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    set 0x1fbd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b007ec  ! 221: PDISTN	fmean16	%d0, %d12, %d10
	.word 0x93a00dd4  ! 222: FdMULq	fdmulq	
jmptr_40_147:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7820009  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r9, %-
	.word 0xe4800b20  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r18
	.word 0x9ba409d4  ! 226: FDIVd	fdivd	%f16, %f20, %f44
	.word 0x9f802037  ! 227: SIR	sir	0x0037
	.word 0x8d903587  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x1587, %pstate
	.word 0xd88fe010  ! 229: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
jmptr_40_150:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_40_151:
	set 0x71e3050c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9023df  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x03df, %pstate
	.word 0xe23d0012  ! 233: STD_R	std	%r17, [%r20 + %r18]
splash_hpstate_40_153:
	.word 0x8198243d  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x043d, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_154)+56, 16, 16)) -> intp(40,1,3)
xir_40_154:
	.word 0xa9852d2f  ! 236: WR_SET_SOFTINT_I	wr	%r20, 0x0d2f, %set_softint
	.word 0x8d902109  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0109, %pstate
	.word 0x8d903695  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x1695, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_155)+32, 16, 16)) -> intp(40,1,3)
xir_40_155:
	.word 0xa984f87a  ! 239: WR_SET_SOFTINT_I	wr	%r19, 0x187a, %set_softint
	.word 0x9f803c07  ! 240: SIR	sir	0x1c07
fpinit_40_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 241: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x9f8028d2  ! 242: SIR	sir	0x08d2
	.word 0x936c8012  ! 243: SDIVX_R	sdivx	%r18, %r18, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936b7e73  ! 244: SDIVX_I	sdivx	%r13, 0xfffffe73, %r9
	.word 0xe257e010  ! 245: LDSH_I	ldsh	[%r31 + 0x0010], %r17
	.word 0xe297e020  ! 246: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0xa7804012  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r18, %-
    set 0x2937, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b287e5  ! 248: PDISTN	fmean16	%d10, %d36, %d48
	.word 0x9753c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_40_159:
	nop
	setx 0xfffffe78fffffd08, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_160)+40, 16, 16)) -> intp(40,1,3)
xir_40_160:
	.word 0xa98539ef  ! 252: WR_SET_SOFTINT_I	wr	%r20, 0x19ef, %set_softint
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_162)+24, 16, 16)) -> intp(40,1,3)
xir_40_162:
	.word 0xa982beba  ! 254: WR_SET_SOFTINT_I	wr	%r10, 0x1eba, %set_softint
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
	.word 0xa7824007  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r7, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
	.word 0x87a90a4a  ! 258: FCMPd	fcmpd	%fcc<n>, %f4, %f10
tagged_40_166:
	tsubcctv %r9, 0x111c, %r13
	.word 0xe607e056  ! 259: LDUW_I	lduw	[%r31 + 0x0056], %r19
	.word 0xa7850001  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r1, %-
	.word 0xa7800000  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r0, %-
	.word 0x8d902263  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x0263, %pstate
	.word 0x99a409f2  ! 263: FDIVq	dis not found

cwp_40_169:
    set user_data_start, %o7
	.word 0x93902004  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_40_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d934014  ! 266: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_40_171:
    set user_data_start, %o7
	.word 0x93902006  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_40_172:
    set user_data_start, %o7
	.word 0x93902002  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_40_173:
	set 0x31092c49, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd43a800d  ! 271: STD_R	std	%r10, [%r10 + %r13]
fpinit_40_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 272: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_40_176:
    set user_data_start, %o7
	.word 0x93902002  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set 0x1cc9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b047e5  ! 275: PDISTN	fmean16	%d32, %d36, %d40
cwp_40_177:
    set user_data_start, %o7
	.word 0x93902004  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa7844014  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
change_to_randtl_40_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_179:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_180)+56, 16, 16)) -> intp(40,1,3)
xir_40_180:
	.word 0xa982fed0  ! 279: WR_SET_SOFTINT_I	wr	%r11, 0x1ed0, %set_softint
	setx 0xc3591e61c9629292, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a489d4  ! 281: FDIVd	fdivd	%f18, %f20, %f10
	.word 0x87ac8a53  ! 282: FCMPd	fcmpd	%fcc<n>, %f18, %f50
intveclr_40_184:
	setx 0xf015b945abb0aa8b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_185:
	setx 0xbab19d406644eb06, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_40_186:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_40_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 286: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x24cc8001  ! 287: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x9f803536  ! 288: SIR	sir	0x1536
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_40_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 290: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xa782c010  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r16, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_192)+56, 16, 16)) -> intp(40,1,3)
xir_40_192:
	.word 0xa98065ea  ! 292: WR_SET_SOFTINT_I	wr	%r1, 0x05ea, %set_softint
splash_hpstate_40_193:
	.word 0x81982ccd  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccd, %hpstate
	.word 0x87acca51  ! 294: FCMPd	fcmpd	%fcc<n>, %f50, %f48
    set 0x2f82, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b407f3  ! 295: PDISTN	fmean16	%d16, %d50, %d18
    set 0x18cc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b447f3  ! 296: PDISTN	fmean16	%d48, %d50, %d50
memptr_40_195:
	set user_data_start, %r31
	.word 0x8584b99f  ! 297: WRCCR_I	wr	%r18, 0x199f, %ccr
	.word 0xd4800aa0  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
	.word 0xc3682500  ! 299: PREFETCH_I	prefetch	[%r0 + 0x0500], #one_read
    set 0x2d0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7f1  ! 300: PDISTN	fmean16	%d50, %d48, %d40
cwp_40_197:
    set user_data_start, %o7
	.word 0x93902007  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7834011  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r17, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9ba449c7  ! 304: FDIVd	fdivd	%f48, %f38, %f44
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_200)+8, 16, 16)) -> intp(40,1,3)
xir_40_200:
	.word 0xa984a62f  ! 305: WR_SET_SOFTINT_I	wr	%r18, 0x062f, %set_softint
	.word 0xd6dfe000  ! 306: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cade9  ! 307: SDIVX_I	sdivx	%r18, 0x0de9, %r13
	.word 0x9545c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r10
change_to_randtl_40_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_202:
	.word 0x8f902001  ! 309: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_40_203:
    set user_data_start, %o7
	.word 0x93902007  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_htba_40_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_40_205:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x91d02033  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802322  ! 314: SIR	sir	0x0322
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 315: RDPC	rd	%pc, %r19
tagged_40_207:
	taddcctv %r2, 0x1823, %r5
	.word 0xd407e024  ! 316: LDUW_I	lduw	[%r31 + 0x0024], %r10
	.word 0x87aaca54  ! 317: FCMPd	fcmpd	%fcc<n>, %f42, %f20
	.word 0xd64fe000  ! 318: LDSB_I	ldsb	[%r31 + 0x0000], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_209)+48, 16, 16)) -> intp(40,1,3)
xir_40_209:
	.word 0xa9822737  ! 319: WR_SET_SOFTINT_I	wr	%r8, 0x0737, %set_softint
	rd %pc, %r19
	add %r19, (ivw_40_210-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_210:
	.word 0x91940013  ! 320: WRPR_PIL_R	wrpr	%r16, %r19, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_211)+32, 16, 16)) -> intp(40,1,3)
xir_40_211:
	.word 0xa981e371  ! 321: WR_SET_SOFTINT_I	wr	%r7, 0x0371, %set_softint
intveclr_40_212:
	setx 0xb7b79e2077208f8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_40_213:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_40_214:
    set user_data_start, %o7
	.word 0x93902007  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_40_215:
	taddcctv %r18, 0x1ec5, %r4
	.word 0xd607e0d0  ! 325: LDUW_I	lduw	[%r31 + 0x00d0], %r11
	.word 0x9f803440  ! 326: SIR	sir	0x1440
	.word 0x8d9038f3  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x18f3, %pstate
splash_htba_40_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_40_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_217:
	.word 0x8f902001  ! 329: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	.word 0x91b404d2  ! 331: FCMPNE32	fcmpne32	%d16, %d18, %r8
fpinit_40_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 332: FDIVd	fdivd	%f0, %f4, %f8
fpinit_40_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 333: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c672c  ! 334: SDIVX_I	sdivx	%r17, 0x072c, %r12
splash_tba_40_223:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x21b4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b107f3  ! 336: PDISTN	fmean16	%d4, %d50, %d10
splash_tba_40_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_40_225:
	taddcctv %r5, 0x13a7, %r18
	.word 0xe207e03e  ! 338: LDUW_I	lduw	[%r31 + 0x003e], %r17
splash_lsu_40_226:
	set 0x666351c6, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x98d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b1c7f4  ! 341: PDISTN	fmean16	%d38, %d20, %d42
	.word 0x87a9ca41  ! 342: FCMPd	fcmpd	%fcc<n>, %f38, %f32
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_229)+0, 16, 16)) -> intp(40,1,3)
xir_40_229:
	.word 0xa984275f  ! 344: WR_SET_SOFTINT_I	wr	%r16, 0x075f, %set_softint
	.word 0xda9fd100  ! 345: LDDA_R	ldda	[%r31, %r0] 0x88, %r13
cwp_40_230:
    set user_data_start, %o7
	.word 0x93902005  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_40_231:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_40_232:
    set user_data_start, %o7
	.word 0x93902002  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f8025ae  ! 350: SIR	sir	0x05ae
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f803bd2  ! 352: SIR	sir	0x1bd2
	.word 0xdadfe010  ! 353: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa968f637  ! 354: SDIVX_I	sdivx	%r3, 0xfffff637, %r20
	.word 0x9f80319b  ! 355: SIR	sir	0x119b
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_236)+56, 16, 16)) -> intp(40,1,3)
xir_40_236:
	.word 0xa98366e2  ! 356: WR_SET_SOFTINT_I	wr	%r13, 0x06e2, %set_softint
splash_tba_40_237:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x92d2b302  ! 358: UMULcc_I	umulcc 	%r10, 0xfffff302, %r9
    set 0x377d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b4c7f4  ! 359: PDISTN	fmean16	%d50, %d20, %d18
jmptr_40_238:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa780c013  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r19, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0xa9688012  ! 364: SDIVX_R	sdivx	%r2, %r18, %r20
splash_lsu_40_240:
	set 0x0d77f2e0, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_40_241:
	set 0x60340000, %r31
	.word 0x85832bcb  ! 366: WRCCR_I	wr	%r12, 0x0bcb, %ccr
	.word 0x87aa0a54  ! 367: FCMPd	fcmpd	%fcc<n>, %f8, %f20
fpinit_40_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 368: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01962  ! 369: FqTOd	dis not found

    set 0x34db, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b347e6  ! 370: PDISTN	fmean16	%d44, %d6, %d10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9686ccd  ! 371: SDIVX_I	sdivx	%r1, 0x0ccd, %r20
splash_tba_40_246:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_40_247:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_248)+56, 16, 16)) -> intp(40,1,3)
xir_40_248:
	.word 0xa9832f5b  ! 374: WR_SET_SOFTINT_I	wr	%r12, 0x0f5b, %set_softint
	.word 0xe86fe0e2  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x00e2]
splash_tba_40_249:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7848000  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r0, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01970  ! 378: FqTOd	dis not found

	.word 0x9881400a  ! 379: ADDcc_R	addcc 	%r5, %r10, %r12
memptr_40_252:
	set user_data_start, %r31
	.word 0x85852754  ! 380: WRCCR_I	wr	%r20, 0x0754, %ccr
splash_htba_40_253:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa084c012  ! 382: ADDcc_R	addcc 	%r19, %r18, %r16
fpinit_40_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 383: FDIVd	fdivd	%f0, %f4, %f6
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_255)+48, 16, 16)) -> intp(40,1,3)
xir_40_255:
	.word 0xa984e2a9  ! 384: WR_SET_SOFTINT_I	wr	%r19, 0x02a9, %set_softint
debug_40_256:
	nop
debug_iva_40_256:
	ta T_CHANGE_HPRIV
	set 0x4ce7, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_257)+32, 16, 16)) -> intp(40,1,3)
xir_40_257:
	.word 0xa984790d  ! 386: WR_SET_SOFTINT_I	wr	%r17, 0x190d, %set_softint
tagged_40_258:
	tsubcctv %r10, 0x1521, %r2
	.word 0xe007e000  ! 387: LDUW_I	lduw	[%r31 + 0x0000], %r16
memptr_40_259:
	set 0x60740000, %r31
	.word 0x858370a0  ! 388: WRCCR_I	wr	%r13, 0x10a0, %ccr
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_260:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 389: RDPC	rd	%pc, %r20
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_40_262:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7820010  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r16, %-
intveclr_40_264:
	setx 0x0e4264d9e69caaae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_40_265:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d90291b  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x091b, %pstate
splash_htba_40_266:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa784c00a  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r10, %-
	.word 0xa7804011  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r17, %-
	.word 0xa7814011  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r17, %-
intveclr_40_270:
	setx 0xc6252f480898f190, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
fpinit_20_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 1: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xa1a01a67  ! 2: FqTOi	fqtoi	
	.word 0x9f803449  ! 3: SIR	sir	0x1449
splash_tba_20_1:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda8008a0  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa785000a  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r10, %-
tagged_20_3:
	taddcctv %r18, 0x183e, %r3
	.word 0xda07e040  ! 7: LDUW_I	lduw	[%r31 + 0x0040], %r13
splash_tba_20_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_20_5:
	nop
debug_dva_20_5:
	ta T_CHANGE_HPRIV
	set 0xa5f0f848, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0x1b2c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b507f0  ! 10: PDISTN	fmean16	%d20, %d16, %d50
	.word 0xe68008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9f802db0  ! 12: SIR	sir	0x0db0
tagged_20_6:
	tsubcctv %r0, 0x18ac, %r17
	.word 0xe607e08c  ! 13: LDUW_I	lduw	[%r31 + 0x008c], %r19
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_8)+40, 16, 16)) -> intp(20,1,3)
xir_20_8:
	.word 0xa982bfec  ! 15: WR_SET_SOFTINT_I	wr	%r10, 0x1fec, %set_softint
jmptr_20_9:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_20_10:
    set user_data_start, %o7
	.word 0x93902005  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
jmptr_20_11:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_12)+32, 16, 16)) -> intp(20,1,3)
xir_20_12:
	.word 0xa9837abf  ! 19: WR_SET_SOFTINT_I	wr	%r13, 0x1abf, %set_softint
tagged_20_13:
	taddcctv %r13, 0x12bd, %r1
	.word 0xe607e0e8  ! 20: LDUW_I	lduw	[%r31 + 0x00e8], %r19
	.word 0xe68fe020  ! 21: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r19
memptr_20_14:
	set 0x60140000, %r31
	.word 0x8584abae  ! 22: WRCCR_I	wr	%r18, 0x0bae, %ccr
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x3b48, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b287f2  ! 24: PDISTN	fmean16	%d10, %d18, %d18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_16)+56, 16, 16)) -> intp(20,1,3)
xir_20_16:
	.word 0xa980f93e  ! 25: WR_SET_SOFTINT_I	wr	%r3, 0x193e, %set_softint
cwp_20_17:
    set user_data_start, %o7
	.word 0x93902005  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
fpinit_20_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b92  ! 27: PREFETCHA_I	prefetcha	[%r0, + 0x0b92] %asi, #one_read
splash_htba_20_19:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0x97114fd0bf17246b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa784ec7a  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x0c7a, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996b2d00  ! 33: SDIVX_I	sdivx	%r12, 0x0d00, %r12
DS_20_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1332cfa  ! 1: STQF_I	-	%f16, [0x0cfa, %r12]
	normalw
	.word 0xa3458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r17
    set 0x1eed, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b147e4  ! 35: PDISTN	fmean16	%d36, %d4, %d48
tagged_20_24:
	tsubcctv %r3, 0x19f6, %r12
	.word 0xe007e0b0  ! 36: LDUW_I	lduw	[%r31 + 0x00b0], %r16
	.word 0x83d020b3  ! 37: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x9f802af6  ! 38: SIR	sir	0x0af6
cwp_20_25:
    set user_data_start, %o7
	.word 0x93902005  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_20_26:
	tsubcctv %r6, 0x18c8, %r18
	.word 0xe007e034  ! 40: LDUW_I	lduw	[%r31 + 0x0034], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9369f336  ! 41: SDIVX_I	sdivx	%r7, 0xfffff336, %r9
	.word 0x8d9020a1  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x00a1, %pstate
	.word 0xe4800a80  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r18
	.word 0xe4cfe020  ! 44: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
cwp_20_28:
    set user_data_start, %o7
	.word 0x93902002  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa7824012  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r18, %-
	.word 0x9f8023ca  ! 47: SIR	sir	0x03ca
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_30)+32, 16, 16)) -> intp(20,1,3)
xir_20_30:
	.word 0xa981e27e  ! 48: WR_SET_SOFTINT_I	wr	%r7, 0x027e, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_20_31:
	taddcctv %r19, 0x1cab, %r19
	.word 0xe407e0a4  ! 50: LDUW_I	lduw	[%r31 + 0x00a4], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_32)+48, 16, 16)) -> intp(20,1,3)
xir_20_32:
	.word 0xa98374d3  ! 51: WR_SET_SOFTINT_I	wr	%r13, 0x14d3, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_33)+0, 16, 16)) -> intp(20,1,3)
xir_20_33:
	.word 0xa985299c  ! 52: WR_SET_SOFTINT_I	wr	%r20, 0x099c, %set_softint
	.word 0xe4800b80  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r18
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	.word 0xa9b084ca  ! 55: FCMPNE32	fcmpne32	%d2, %d10, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_36) + 48, 16, 16)) -> intp(7,0,23)
intvec_20_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7804011  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r17, %-
    set 0x8bd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b2c7e3  ! 58: PDISTN	fmean16	%d42, %d34, %d48
splash_tba_20_38:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9a842e05  ! 60: ADDcc_I	addcc 	%r16, 0x0e05, %r13
fpinit_20_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 61: FDIVs	fdivs	%f0, %f4, %f6
splash_htba_20_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa5a00547  ! 63: FSQRTd	fsqrt	
	.word 0xa784400a  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r10, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56d24bc  ! 65: SDIVX_I	sdivx	%r20, 0x04bc, %r18
	.word 0x924a8002  ! 66: MULX_R	mulx 	%r10, %r2, %r9
tagged_20_43:
	taddcctv %r17, 0x1ff1, %r11
	.word 0xd207e0c6  ! 67: LDUW_I	lduw	[%r31 + 0x00c6], %r9
splash_lsu_20_44:
	set 0x7f74040b, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_20_45:
	set 0x8e871bd4, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_20_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_46:
	.word 0x8f902000  ! 70: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x3229, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7f2  ! 71: PDISTN	fmean16	%d50, %d18, %d40
pmu_20_47:
	nop
	setx 0xfffff227fffff35b, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_20_48:
	tsubcctv %r0, 0x163b, %r19
	.word 0xe407e000  ! 73: LDUW_I	lduw	[%r31 + 0x0000], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_49)+56, 16, 16)) -> intp(20,1,3)
xir_20_49:
	.word 0xa9842782  ! 74: WR_SET_SOFTINT_I	wr	%r16, 0x0782, %set_softint
	.word 0xa784400a  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r10, %-
	.word 0xc3e8402b  ! 76: PREFETCHA_R	prefetcha	[%r1, %r11] 0x01, #one_read
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x98fd0014  ! 78: SDIVcc_R	sdivcc 	%r20, %r20, %r12
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e000  ! 80: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0xa869e8ec  ! 81: UDIVX_I	udivx 	%r7, 0x08ec, %r20
	.word 0xa7850005  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r5, %-
splash_htba_20_54:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_20_55:
    set user_data_start, %o7
	.word 0x93902004  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cwp_20_56:
    set user_data_start, %o7
	.word 0x93902003  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 87: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87ab0a23  ! 88: FCMPs	fcmps	%fcc<n>, %f12, %f3
    set 0x2f0c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b487f0  ! 89: PDISTN	fmean16	%d18, %d16, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_57)+32, 16, 16)) -> intp(20,1,3)
xir_20_57:
	.word 0xa9842512  ! 90: WR_SET_SOFTINT_I	wr	%r16, 0x0512, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_58) + 16, 16, 16)) -> intp(6,0,23)
intvec_20_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe28008a0  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x9f8022ae  ! 94: SIR	sir	0x02ae
splash_lsu_20_60:
	set 0x4866516f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_20_61:
	set 0x60340000, %r31
	.word 0x8584766d  ! 96: WRCCR_I	wr	%r17, 0x166d, %ccr
	.word 0x8d903fa8  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x1fa8, %pstate
	.word 0xc3eb4027  ! 98: PREFETCHA_R	prefetcha	[%r13, %r7] 0x01, #one_read
    set 0x8f4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b407ec  ! 99: PDISTN	fmean16	%d16, %d12, %d8
fpinit_20_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 100: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x966b389c  ! 101: UDIVX_I	udivx 	%r12, 0xfffff89c, %r11
    set 0x26b8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b187e7  ! 102: PDISTN	fmean16	%d6, %d38, %d16
	.word 0x95a189ca  ! 103: FDIVd	fdivd	%f6, %f10, %f10
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_20_66:
	set 0x34f5c2f1, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9afa0002  ! 107: SDIVcc_R	sdivcc 	%r8, %r2, %r13
cwp_20_67:
    set user_data_start, %o7
	.word 0x93902002  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
jmptr_20_68:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_20_70:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3d73, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb4c7e5  ! 112: PDISTN	fmean16	%d50, %d36, %d44
cwp_20_71:
    set user_data_start, %o7
	.word 0x93902005  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_htba_20_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_20_73:
	.word 0x81982f4c  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
splash_htba_20_74:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803a49  ! 117: SIR	sir	0x1a49
splash_htba_20_75:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_20_76:
	tsubcctv %r17, 0x14f8, %r20
	.word 0xe407e099  ! 119: LDUW_I	lduw	[%r31 + 0x0099], %r18
	.word 0x87a8ca53  ! 120: FCMPd	fcmpd	%fcc<n>, %f34, %f50
	.word 0x24cc8001  ! 121: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xd21fe030  ! 122: LDD_I	ldd	[%r31 + 0x0030], %r9
    set 0x38a0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b207f0  ! 123: PDISTN	fmean16	%d8, %d16, %d20
splash_lsu_20_79:
	set 0xf5e4c4ef, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800c20  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0xa7848012  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d903f20  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1f20, %pstate
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_20_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94000c  ! 131: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
cwp_20_84:
    set user_data_start, %o7
	.word 0x93902006  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_20_86:
	tsubcctv %r8, 0x1cc7, %r16
	.word 0xe207e010  ! 134: LDUW_I	lduw	[%r31 + 0x0010], %r17
splash_lsu_20_87:
	set 0x3061abd1, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe000  ! 136: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0x87a94a54  ! 137: FCMPd	fcmpd	%fcc<n>, %f36, %f20
	.word 0xa5a409c8  ! 138: FDIVd	fdivd	%f16, %f8, %f18
change_to_randtl_20_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd6800b80  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
splash_lsu_20_91:
	set 0xc87552bd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9a4cdcb  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_20_92:
	set 0x60540000, %r31
	.word 0x85812d12  ! 144: WRCCR_I	wr	%r4, 0x0d12, %ccr
	.word 0xd097e010  ! 145: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
splash_htba_20_93:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa9a489d0  ! 147: FDIVd	fdivd	%f18, %f16, %f20
    set 0x2cff, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b107e7  ! 148: PDISTN	fmean16	%d4, %d38, %d20
jmptr_20_94:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_20_95:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe030  ! 151: LDUB_I	ldub	[%r31 + 0x0030], %r13
    set 0x21d3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b0c7ec  ! 152: PDISTN	fmean16	%d34, %d12, %d12
splash_htba_20_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80344f  ! 154: SIR	sir	0x144f
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
	.word 0xa7848006  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r6, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b2581  ! 157: SDIVX_I	sdivx	%r12, 0x0581, %r11
jmptr_20_100:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e038  ! 159: STF_I	st	%f19, [0x0038, %r31]
	.word 0x9f80367a  ! 160: SIR	sir	0x167a
cwp_20_101:
    set user_data_start, %o7
	.word 0x93902004  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d9031f5  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x11f5, %pstate
    set 0x10b1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407eb  ! 163: PDISTN	fmean16	%d16, %d42, %d20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01966  ! 164: FqTOd	dis not found

	.word 0xc3ec4034  ! 165: PREFETCHA_R	prefetcha	[%r17, %r20] 0x01, #one_read
	.word 0x8d902ab0  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x0ab0, %pstate
	.word 0xa8688014  ! 167: UDIVX_R	udivx 	%r2, %r20, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_104)+0, 16, 16)) -> intp(20,1,3)
xir_20_104:
	.word 0xa981e88c  ! 168: WR_SET_SOFTINT_I	wr	%r7, 0x088c, %set_softint
	setx 0xfe07d69b2eed0f7b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_20_106:
    set user_data_start, %o7
	.word 0x93902006  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
jmptr_20_107:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a340c  ! 172: SDIVX_I	sdivx	%r8, 0xfffff40c, %r11
splash_tba_20_109:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_20_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 174: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx 0x8349954168c4fa87, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_20_112:
	set 0x60140000, %r31
	.word 0x85843a14  ! 176: WRCCR_I	wr	%r16, 0x1a14, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768e954  ! 177: SDIVX_I	sdivx	%r3, 0x0954, %r19
cwp_20_114:
    set user_data_start, %o7
	.word 0x93902005  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    set 0x3950, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b487f1  ! 179: PDISTN	fmean16	%d18, %d48, %d42
splash_tba_20_115:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x2925, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b107e2  ! 181: PDISTN	fmean16	%d4, %d2, %d40
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_20_117:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_20_118:
    set user_data_start, %o7
	.word 0x93902007  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
donret_20_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_119-donret_20_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005e7463 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_119:
	.word 0xe2ffe029  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x0029] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_120)+0, 16, 16)) -> intp(20,1,3)
xir_20_120:
	.word 0xa982f22e  ! 186: WR_SET_SOFTINT_I	wr	%r11, 0x122e, %set_softint
	.word 0xe2800aa0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r17
splash_htba_20_121:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8035cd  ! 189: SIR	sir	0x15cd
debug_20_122:
	nop
debug_dva_20_122:
	ta T_CHANGE_HPRIV
	set 0xdcf7a831, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_20_123:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_124)+56, 16, 16)) -> intp(20,1,3)
xir_20_124:
	.word 0xa982e9bb  ! 192: WR_SET_SOFTINT_I	wr	%r11, 0x09bb, %set_softint
	setx 0x728c88c74a6b7484, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_126) + 24, 16, 16)) -> intp(5,0,22)
intvec_20_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7840011  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r17, %-
memptr_20_128:
	set 0x60740000, %r31
	.word 0x8580275a  ! 196: WRCCR_I	wr	%r0, 0x075a, %ccr
    set 0x27ca, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b1c7f0  ! 197: PDISTN	fmean16	%d38, %d16, %d10
	.word 0xa7840009  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r9, %-
splash_htba_20_130:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_20_131:
    set user_data_start, %o7
	.word 0x93902003  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_hpstate_20_132:
	.word 0x81982165  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0165, %hpstate
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_20_134:
    set user_data_start, %o7
	.word 0x93902000  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_135)+8, 16, 16)) -> intp(20,1,3)
xir_20_135:
	.word 0xa981734e  ! 204: WR_SET_SOFTINT_I	wr	%r5, 0x134e, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_20_136:
	tsubcctv %r9, 0x1644, %r3
	.word 0xd407e041  ! 206: LDUW_I	lduw	[%r31 + 0x0041], %r10
memptr_20_137:
	set 0x60540000, %r31
	.word 0x8584a686  ! 207: WRCCR_I	wr	%r18, 0x0686, %ccr
cwp_20_138:
    set user_data_start, %o7
	.word 0x93902005  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87acca53  ! 209: FCMPd	fcmpd	%fcc<n>, %f50, %f50
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_20_141:
    set user_data_start, %o7
	.word 0x93902006  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
memptr_20_142:
	set 0x60740000, %r31
	.word 0x8585308e  ! 212: WRCCR_I	wr	%r20, 0x108e, %ccr
splash_htba_20_143:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_20_144:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x25c0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b047e1  ! 215: PDISTN	fmean16	%d32, %d32, %d20
	.word 0xa7a309cd  ! 216: FDIVd	fdivd	%f12, %f44, %f50
	.word 0xe597e010  ! 217: LDQFA_I	-	[%r31, 0x0010], %f18
	.word 0xa78129ae  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x09ae, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_20_146:
    set user_data_start, %o7
	.word 0x93902007  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    set 0x2670, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b507e8  ! 221: PDISTN	fmean16	%d20, %d8, %d48
	.word 0xa1a34dc6  ! 222: FdMULq	fdmulq	
jmptr_20_147:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7840010  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
	.word 0xe4800ac0  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
	.word 0x93a0c9d4  ! 226: FDIVd	fdivd	%f34, %f20, %f40
	.word 0x9f803a53  ! 227: SIR	sir	0x1a53
	.word 0x8d903cb8  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x1cb8, %pstate
	.word 0xd88fe000  ! 229: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
jmptr_20_150:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_20_151:
	set 0x30be5777, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902176  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x0176, %pstate
	.word 0x87ac4a44  ! 233: FCMPd	fcmpd	%fcc<n>, %f48, %f4
splash_hpstate_20_153:
	.word 0x8198200d  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_154)+24, 16, 16)) -> intp(20,1,3)
xir_20_154:
	.word 0xa9852a12  ! 236: WR_SET_SOFTINT_I	wr	%r20, 0x0a12, %set_softint
	.word 0x8d902d93  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0d93, %pstate
	.word 0x8d903529  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x1529, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_155)+16, 16, 16)) -> intp(20,1,3)
xir_20_155:
	.word 0xa98368e7  ! 239: WR_SET_SOFTINT_I	wr	%r13, 0x08e7, %set_softint
	.word 0x9f802fdb  ! 240: SIR	sir	0x0fdb
fpinit_20_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 241: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x9f802aa0  ! 242: SIR	sir	0x0aa0
	.word 0x996d0013  ! 243: SDIVX_R	sdivx	%r20, %r19, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569bc1f  ! 244: SDIVX_I	sdivx	%r6, 0xfffffc1f, %r10
	.word 0xe257e000  ! 245: LDSH_I	ldsh	[%r31 + 0x0000], %r17
	.word 0xe297e010  ! 246: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0xa7840010  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
    set 0x2251, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b4c7ed  ! 248: PDISTN	fmean16	%d50, %d44, %d50
	.word 0xa553c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_20_159:
	nop
	setx 0xfffff1a7ffffff88, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_160)+56, 16, 16)) -> intp(20,1,3)
xir_20_160:
	.word 0xa984a598  ! 252: WR_SET_SOFTINT_I	wr	%r18, 0x0598, %set_softint
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_162)+48, 16, 16)) -> intp(20,1,3)
xir_20_162:
	.word 0xa98527b6  ! 254: WR_SET_SOFTINT_I	wr	%r20, 0x07b6, %set_softint
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
	.word 0xa7848010  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
	.word 0x95a1c9c8  ! 258: FDIVd	fdivd	%f38, %f8, %f10
tagged_20_166:
	tsubcctv %r19, 0x1dd3, %r18
	.word 0xe607e0e2  ! 259: LDUW_I	lduw	[%r31 + 0x00e2], %r19
	.word 0xa780c003  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r3, %-
	.word 0xa7810014  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r20, %-
	.word 0x8d902b95  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x0b95, %pstate
	.word 0x97a309f2  ! 263: FDIVq	dis not found

cwp_20_169:
    set user_data_start, %o7
	.word 0x93902003  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_20_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944013  ! 266: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_20_171:
    set user_data_start, %o7
	.word 0x93902007  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
cwp_20_172:
    set user_data_start, %o7
	.word 0x93902001  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_20_173:
	set 0x85234deb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xdbe44021  ! 271: CASA_I	casa	[%r17] 0x 1, %r1, %r13
fpinit_20_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 272: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_20_176:
    set user_data_start, %o7
	.word 0x93902000  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    set 0xe38, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b047f1  ! 275: PDISTN	fmean16	%d32, %d48, %d20
cwp_20_177:
    set user_data_start, %o7
	.word 0x93902007  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7840006  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r6, %-
change_to_randtl_20_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_179:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_180)+40, 16, 16)) -> intp(20,1,3)
xir_20_180:
	.word 0xa9847475  ! 279: WR_SET_SOFTINT_I	wr	%r17, 0x1475, %set_softint
	setx 0x10835cf0f4fa1f31, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc3eac024  ! 281: PREFETCHA_R	prefetcha	[%r11, %r4] 0x01, #one_read
	.word 0xa7a449a8  ! 282: FDIVs	fdivs	%f17, %f8, %f19
intveclr_20_184:
	setx 0x31310b18268f8174, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_185:
	setx 0x642434b0ecbb6ae7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_20_186:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_20_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 286: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x39400001  ! 287: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f803de4  ! 288: SIR	sir	0x1de4
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_20_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 290: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xa7820005  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r5, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_192)+40, 16, 16)) -> intp(20,1,3)
xir_20_192:
	.word 0xa982e102  ! 292: WR_SET_SOFTINT_I	wr	%r11, 0x0102, %set_softint
splash_hpstate_20_193:
	.word 0x8198274e  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074e, %hpstate
	.word 0xa3a349ad  ! 294: FDIVs	fdivs	%f13, %f13, %f17
    set 0x131, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb4c7eb  ! 295: PDISTN	fmean16	%d50, %d42, %d44
    set 0x28e6, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b507f0  ! 296: PDISTN	fmean16	%d20, %d16, %d42
memptr_20_195:
	set user_data_start, %r31
	.word 0x85832eb2  ! 297: WRCCR_I	wr	%r12, 0x0eb2, %ccr
	.word 0xd4800c80  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0x95a109c9  ! 299: FDIVd	fdivd	%f4, %f40, %f10
    set 0x3144, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b407f2  ! 300: PDISTN	fmean16	%d16, %d18, %d48
cwp_20_197:
    set user_data_start, %o7
	.word 0x93902005  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa7848004  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xc3e80033  ! 304: PREFETCHA_R	prefetcha	[%r0, %r19] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_200)+8, 16, 16)) -> intp(20,1,3)
xir_20_200:
	.word 0xa984bf59  ! 305: WR_SET_SOFTINT_I	wr	%r18, 0x1f59, %set_softint
	.word 0xd6dfe000  ! 306: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c655c  ! 307: SDIVX_I	sdivx	%r17, 0x055c, %r18
	.word 0xa545c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r18
change_to_randtl_20_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_202:
	.word 0x8f902000  ! 309: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_20_203:
    set user_data_start, %o7
	.word 0x93902002  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_htba_20_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_20_205:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x83d020b4  ! 313: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x9f802a15  ! 314: SIR	sir	0x0a15
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 315: RDPC	rd	%pc, %r16
tagged_20_207:
	taddcctv %r20, 0x1d89, %r19
	.word 0xd407e054  ! 316: LDUW_I	lduw	[%r31 + 0x0054], %r10
	.word 0xc36cbc7d  ! 317: PREFETCH_I	prefetch	[%r18 + 0xfffffc7d], #one_read
	.word 0xd64fe010  ! 318: LDSB_I	ldsb	[%r31 + 0x0010], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_209)+40, 16, 16)) -> intp(20,1,3)
xir_20_209:
	.word 0xa982e9e6  ! 319: WR_SET_SOFTINT_I	wr	%r11, 0x09e6, %set_softint
	rd %pc, %r19
	add %r19, (ivw_20_210-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_210:
	.word 0x91950012  ! 320: WRPR_PIL_R	wrpr	%r20, %r18, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_211)+48, 16, 16)) -> intp(20,1,3)
xir_20_211:
	.word 0xa9852fb4  ! 321: WR_SET_SOFTINT_I	wr	%r20, 0x0fb4, %set_softint
intveclr_20_212:
	setx 0x7551d10384175b09, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_20_213:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_20_214:
    set user_data_start, %o7
	.word 0x93902005  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_20_215:
	taddcctv %r20, 0x1d49, %r16
	.word 0xd607e05c  ! 325: LDUW_I	lduw	[%r31 + 0x005c], %r11
	.word 0x9f802d9a  ! 326: SIR	sir	0x0d9a
	.word 0x8d9033fa  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x13fa, %pstate
splash_htba_20_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_20_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_217:
	.word 0x8f902002  ! 329: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	.word 0xd9e44034  ! 331: CASA_I	casa	[%r17] 0x 1, %r20, %r12
fpinit_20_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e822a3  ! 332: PREFETCHA_I	prefetcha	[%r0, + 0x02a3] %asi, #one_read
fpinit_20_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 333: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936c2890  ! 334: SDIVX_I	sdivx	%r16, 0x0890, %r9
splash_tba_20_223:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x18e8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407f0  ! 336: PDISTN	fmean16	%d16, %d16, %d40
splash_tba_20_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_20_225:
	taddcctv %r9, 0x166b, %r5
	.word 0xe207e0b8  ! 338: LDUW_I	lduw	[%r31 + 0x00b8], %r17
splash_lsu_20_226:
	set 0x3b1ac3bb, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x19e9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b447f1  ! 341: PDISTN	fmean16	%d48, %d48, %d12
	.word 0xa3a509b2  ! 342: FDIVs	fdivs	%f20, %f18, %f17
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_229)+40, 16, 16)) -> intp(20,1,3)
xir_20_229:
	.word 0xa982fdeb  ! 344: WR_SET_SOFTINT_I	wr	%r11, 0x1deb, %set_softint
	.word 0xda9fd920  ! 345: LDDA_R	ldda	[%r31, %r0] 0xc9, %r13
cwp_20_230:
    set user_data_start, %o7
	.word 0x93902000  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_20_231:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_20_232:
    set user_data_start, %o7
	.word 0x93902000  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f802cae  ! 350: SIR	sir	0x0cae
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f803c51  ! 352: SIR	sir	0x1c51
	.word 0xdadfe010  ! 353: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1696c31  ! 354: SDIVX_I	sdivx	%r5, 0x0c31, %r16
	.word 0x9f80239d  ! 355: SIR	sir	0x039d
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_236)+24, 16, 16)) -> intp(20,1,3)
xir_20_236:
	.word 0xa984e799  ! 356: WR_SET_SOFTINT_I	wr	%r19, 0x0799, %set_softint
splash_tba_20_237:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa8d070cc  ! 358: UMULcc_I	umulcc 	%r1, 0xfffff0cc, %r20
    set 0x37f3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b347f1  ! 359: PDISTN	fmean16	%d44, %d48, %d42
jmptr_20_238:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa784c011  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r17, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0xa76ac007  ! 364: SDIVX_R	sdivx	%r11, %r7, %r19
splash_lsu_20_240:
	set 0x8e7a9d8d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_20_241:
	set 0x60540000, %r31
	.word 0x85847d2d  ! 366: WRCCR_I	wr	%r17, 0x1d2d, %ccr
	.word 0x87a80a4d  ! 367: FCMPd	fcmpd	%fcc<n>, %f0, %f44
fpinit_20_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 368: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196a  ! 369: FqTOd	dis not found

    set 0x1358, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb187e5  ! 370: PDISTN	fmean16	%d6, %d36, %d44
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa169e24c  ! 371: SDIVX_I	sdivx	%r7, 0x024c, %r16
splash_tba_20_246:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_20_247:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_248)+48, 16, 16)) -> intp(20,1,3)
xir_20_248:
	.word 0xa984b927  ! 374: WR_SET_SOFTINT_I	wr	%r18, 0x1927, %set_softint
	.word 0xe86fe061  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x0061]
splash_tba_20_249:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa780c00a  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r10, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01970  ! 378: FqTOd	dis not found

	.word 0xa080c002  ! 379: ADDcc_R	addcc 	%r3, %r2, %r16
memptr_20_252:
	set user_data_start, %r31
	.word 0x8584627f  ! 380: WRCCR_I	wr	%r17, 0x027f, %ccr
splash_htba_20_253:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa484c00c  ! 382: ADDcc_R	addcc 	%r19, %r12, %r18
fpinit_20_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82702  ! 383: PREFETCHA_I	prefetcha	[%r0, + 0x0702] %asi, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_255)+56, 16, 16)) -> intp(20,1,3)
xir_20_255:
	.word 0xa9802a5a  ! 384: WR_SET_SOFTINT_I	wr	%r0, 0x0a5a, %set_softint
debug_20_256:
	nop
debug_iva_20_256:
	ta T_CHANGE_HPRIV
	set 0x2471e2ba, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_257)+16, 16, 16)) -> intp(20,1,3)
xir_20_257:
	.word 0xa98173f1  ! 386: WR_SET_SOFTINT_I	wr	%r5, 0x13f1, %set_softint
tagged_20_258:
	tsubcctv %r11, 0x16cf, %r4
	.word 0xe007e0d0  ! 387: LDUW_I	lduw	[%r31 + 0x00d0], %r16
memptr_20_259:
	set 0x60340000, %r31
	.word 0x8581f014  ! 388: WRCCR_I	wr	%r7, 0x1014, %ccr
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_260:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 389: RDPC	rd	%pc, %r11
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_20_262:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa780000c  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r12, %-
intveclr_20_264:
	setx 0x79e01a20077383a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_20_265:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903295  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x1295, %pstate
splash_htba_20_266:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa782c00a  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r10, %-
	.word 0xa7818011  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r17, %-
	.word 0xa7834012  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r18, %-
intveclr_20_270:
	setx 0xf8ff55dfbde41247, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
fpinit_10_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e76  ! 1: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe76] %asi, #one_read
	.word 0x99a01a6a  ! 2: FqTOi	fqtoi	
	.word 0x9f802811  ! 3: SIR	sir	0x0811
splash_tba_10_1:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda8008a0  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_decr_10_2:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa784c013  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r19, %-
tagged_10_3:
	taddcctv %r3, 0x1b86, %r10
	.word 0xda07e0d8  ! 7: LDUW_I	lduw	[%r31 + 0x00d8], %r13
splash_tba_10_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_10_5:
	nop
debug_dva_10_5:
	ta T_CHANGE_HPRIV
	set 0xfe227edf, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0xac9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b047f4  ! 10: PDISTN	fmean16	%d32, %d20, %d12
	.word 0xe6800aa0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r19
	.word 0x9f803218  ! 12: SIR	sir	0x1218
tagged_10_6:
	tsubcctv %r17, 0x152a, %r9
	.word 0xe607e034  ! 13: LDUW_I	lduw	[%r31 + 0x0034], %r19
invtsb_10_7:
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
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_8)+24, 16, 16)) -> intp(10,1,3)
xir_10_8:
	.word 0xa984b72c  ! 15: WR_SET_SOFTINT_I	wr	%r18, 0x172c, %set_softint
jmptr_10_9:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_10_10:
    set user_data_start, %o7
	.word 0x93902007  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
jmptr_10_11:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_12)+24, 16, 16)) -> intp(10,1,3)
xir_10_12:
	.word 0xa9812120  ! 19: WR_SET_SOFTINT_I	wr	%r4, 0x0120, %set_softint
tagged_10_13:
	taddcctv %r16, 0x1053, %r10
	.word 0xe607e0c8  ! 20: LDUW_I	lduw	[%r31 + 0x00c8], %r19
	.word 0xe68fe020  ! 21: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r19
memptr_10_14:
	set 0x60340000, %r31
	.word 0x85842232  ! 22: WRCCR_I	wr	%r16, 0x0232, %ccr
invtsb_10_15:
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
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x1116, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb507f1  ! 24: PDISTN	fmean16	%d20, %d48, %d44
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_16)+48, 16, 16)) -> intp(10,1,3)
xir_10_16:
	.word 0xa983269e  ! 25: WR_SET_SOFTINT_I	wr	%r12, 0x069e, %set_softint
cwp_10_17:
    set user_data_start, %o7
	.word 0x93902003  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
fpinit_10_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b92  ! 27: PREFETCHA_I	prefetcha	[%r0, + 0x0b92] %asi, #one_read
splash_htba_10_19:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
invtsb_10_20:
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
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0xae8454fa28df4a87, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8800be0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r20
	.word 0xa784f2da  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r19, 0x12da, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169b846  ! 33: SDIVX_I	sdivx	%r6, 0xfffff846, %r8
DS_10_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd53524ba  ! 1: STQF_I	-	%f10, [0x04ba, %r20]
	normalw
	.word 0x97458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r11
    set 0x1bd9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b287e8  ! 35: PDISTN	fmean16	%d10, %d8, %d10
tagged_10_24:
	tsubcctv %r13, 0x18ee, %r13
	.word 0xe007e0fa  ! 36: LDUW_I	lduw	[%r31 + 0x00fa], %r16
	.word 0x91d02034  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802848  ! 38: SIR	sir	0x0848
cwp_10_25:
    set user_data_start, %o7
	.word 0x93902003  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_10_26:
	tsubcctv %r4, 0x19ed, %r20
	.word 0xe007e038  ! 40: LDUW_I	lduw	[%r31 + 0x0038], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c292a  ! 41: SDIVX_I	sdivx	%r16, 0x092a, %r16
	.word 0x8d902ed5  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	.word 0xe48008a0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4cfe000  ! 44: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r18
cwp_10_28:
    set user_data_start, %o7
	.word 0x93902003  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_decr_10_29:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7808014  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r20, %-
	.word 0x9f802337  ! 47: SIR	sir	0x0337
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_30)+32, 16, 16)) -> intp(10,1,3)
xir_10_30:
	.word 0xa9837cf7  ! 48: WR_SET_SOFTINT_I	wr	%r13, 0x1cf7, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_10_31:
	taddcctv %r1, 0x16a9, %r7
	.word 0xe407e0ba  ! 50: LDUW_I	lduw	[%r31 + 0x00ba], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_32)+48, 16, 16)) -> intp(10,1,3)
xir_10_32:
	.word 0xa981fe14  ! 51: WR_SET_SOFTINT_I	wr	%r7, 0x1e14, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_33)+16, 16, 16)) -> intp(10,1,3)
xir_10_33:
	.word 0xa9843a94  ! 52: WR_SET_SOFTINT_I	wr	%r16, 0x1a94, %set_softint
	.word 0xe48008a0  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
invtsb_10_34:
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
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	.word 0xd9e0c031  ! 55: CASA_I	casa	[%r3] 0x 1, %r17, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_36) + 8, 16, 16)) -> intp(6,0,5)
intvec_10_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_10_37:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa780c006  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r6, %-
    set 0x1c9a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b047eb  ! 58: PDISTN	fmean16	%d32, %d42, %d48
splash_tba_10_38:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa2843539  ! 60: ADDcc_I	addcc 	%r16, 0xfffff539, %r17
fpinit_10_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 61: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_htba_10_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x99a00553  ! 63: FSQRTd	fsqrt	
splash_decr_10_41:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa784c007  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976a3689  ! 65: SDIVX_I	sdivx	%r8, 0xfffff689, %r11
	.word 0xa64a800b  ! 66: MULX_R	mulx 	%r10, %r11, %r19
tagged_10_43:
	taddcctv %r20, 0x1ab9, %r16
	.word 0xd207e0d0  ! 67: LDUW_I	lduw	[%r31 + 0x00d0], %r9
splash_lsu_10_44:
	set 0xe3d19336, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_10_45:
	set 0x3a7093c9, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_10_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_46:
	.word 0x8f902001  ! 70: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x3760, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b4c7f1  ! 71: PDISTN	fmean16	%d50, %d48, %d10
pmu_10_47:
	nop
	setx 0xfffff612fffffdcf, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_10_48:
	tsubcctv %r1, 0x1bd1, %r19
	.word 0xe407e03c  ! 73: LDUW_I	lduw	[%r31 + 0x003c], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_49)+16, 16, 16)) -> intp(10,1,3)
xir_10_49:
	.word 0xa98460dd  ! 74: WR_SET_SOFTINT_I	wr	%r17, 0x00dd, %set_softint
splash_decr_10_50:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7840014  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r20, %-
	.word 0x87a90a51  ! 76: FCMPd	fcmpd	%fcc<n>, %f4, %f48
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x96fcc011  ! 78: SDIVcc_R	sdivcc 	%r19, %r17, %r11
invtsb_10_52:
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
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e030  ! 80: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
	.word 0x946c7dfb  ! 81: UDIVX_I	udivx 	%r17, 0xfffffdfb, %r10
splash_decr_10_53:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7850012  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r18, %-
splash_htba_10_54:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_10_55:
    set user_data_start, %o7
	.word 0x93902005  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
cwp_10_56:
    set user_data_start, %o7
	.word 0x93902005  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87a98a34  ! 88: FCMPs	fcmps	%fcc<n>, %f6, %f20
    set 0x5bf, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb287f2  ! 89: PDISTN	fmean16	%d10, %d18, %d44
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_57)+32, 16, 16)) -> intp(10,1,3)
xir_10_57:
	.word 0xa9853f70  ! 90: WR_SET_SOFTINT_I	wr	%r20, 0x1f70, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_58) + 56, 16, 16)) -> intp(2,0,14)
intvec_10_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_10_59:
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
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe28008a0  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x9f802920  ! 94: SIR	sir	0x0920
splash_lsu_10_60:
	set 0x47998fbf, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_10_61:
	set 0x60140000, %r31
	.word 0x858378b4  ! 96: WRCCR_I	wr	%r13, 0x18b4, %ccr
	.word 0x8d90256f  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x056f, %pstate
	.word 0x97a409a5  ! 98: FDIVs	fdivs	%f16, %f5, %f11
    set 0x3768, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b347f4  ! 99: PDISTN	fmean16	%d44, %d20, %d8
fpinit_10_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82741  ! 100: PREFETCHA_I	prefetcha	[%r0, + 0x0741] %asi, #one_read
	.word 0x986c6db5  ! 101: UDIVX_I	udivx 	%r17, 0x0db5, %r12
    set 0x19fd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b1c7f3  ! 102: PDISTN	fmean16	%d38, %d50, %d16
	.word 0x24c8c001  ! 103: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
invtsb_10_65:
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
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_10_66:
	set 0xa57ed336, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x98fcc012  ! 107: SDIVcc_R	sdivcc 	%r19, %r18, %r12
cwp_10_67:
    set user_data_start, %o7
	.word 0x93902005  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
jmptr_10_68:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
invtsb_10_69:
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
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_10_70:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1fb9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507f0  ! 112: PDISTN	fmean16	%d20, %d16, %d40
cwp_10_71:
    set user_data_start, %o7
	.word 0x93902006  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_10_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_10_73:
	.word 0x819820dd  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
splash_htba_10_74:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8022ab  ! 117: SIR	sir	0x02ab
splash_htba_10_75:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_10_76:
	tsubcctv %r19, 0x187f, %r3
	.word 0xe407e054  ! 119: LDUW_I	lduw	[%r31 + 0x0054], %r18
	.word 0x9ba509ad  ! 120: FDIVs	fdivs	%f20, %f13, %f13
	.word 0xc36caaf1  ! 121: PREFETCH_I	prefetch	[%r18 + 0x0af1], #one_read
	.word 0xd21fe020  ! 122: LDD_I	ldd	[%r31 + 0x0020], %r9
    set 0x1507, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b447f2  ! 123: PDISTN	fmean16	%d48, %d18, %d10
splash_lsu_10_79:
	set 0x23faeec4, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_decr_10_80:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7814012  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r18, %-
invtsb_10_81:
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
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d903ddb  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1ddb, %pstate
invtsb_10_82:
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
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_10_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d928003  ! 131: WRPR_WSTATE_R	wrpr	%r10, %r3, %wstate
cwp_10_84:
    set user_data_start, %o7
	.word 0x93902005  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
invtsb_10_85:
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
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_10_86:
	tsubcctv %r10, 0x122e, %r1
	.word 0xe207e006  ! 134: LDUW_I	lduw	[%r31 + 0x0006], %r17
splash_lsu_10_87:
	set 0xe6454b52, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe010  ! 136: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
	.word 0xa7a409c9  ! 137: FDIVd	fdivd	%f16, %f40, %f50
	.word 0xa9b504d0  ! 138: FCMPNE32	fcmpne32	%d20, %d16, %r20
change_to_randtl_10_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd68008a0  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_lsu_10_91:
	set 0x7ae6d040, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a4cdd4  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_10_92:
	set 0x60140000, %r31
	.word 0x858137fd  ! 144: WRCCR_I	wr	%r4, 0x17fd, %ccr
	.word 0xd097e020  ! 145: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
splash_htba_10_93:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x95a509d0  ! 147: FDIVd	fdivd	%f20, %f16, %f10
    set 0x2651, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b2c7f2  ! 148: PDISTN	fmean16	%d42, %d18, %d42
jmptr_10_94:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_10_95:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe000  ! 151: LDUB_I	ldub	[%r31 + 0x0000], %r13
    set 0x2477, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b047f4  ! 152: PDISTN	fmean16	%d32, %d20, %d16
splash_htba_10_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80234e  ! 154: SIR	sir	0x034e
invtsb_10_97:
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
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
splash_decr_10_98:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7850008  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r8, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16d278c  ! 157: SDIVX_I	sdivx	%r20, 0x078c, %r16
jmptr_10_100:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e014  ! 159: STF_I	st	%f19, [0x0014, %r31]
	.word 0x9f80351b  ! 160: SIR	sir	0x151b
cwp_10_101:
    set user_data_start, %o7
	.word 0x93902004  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902a07  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
    set 0x3d97, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b407ea  ! 163: PDISTN	fmean16	%d16, %d10, %d50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196a  ! 164: FqTOd	dis not found

	.word 0x91a089cd  ! 165: FDIVd	fdivd	%f2, %f44, %f8
	.word 0x8d902677  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x0677, %pstate
	.word 0xa26c8009  ! 167: UDIVX_R	udivx 	%r18, %r9, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_104)+0, 16, 16)) -> intp(10,1,3)
xir_10_104:
	.word 0xa9852121  ! 168: WR_SET_SOFTINT_I	wr	%r20, 0x0121, %set_softint
	setx 0x7bf6c4215b91b1dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_10_106:
    set user_data_start, %o7
	.word 0x93902002  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
jmptr_10_107:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cbd0e  ! 172: SDIVX_I	sdivx	%r18, 0xfffffd0e, %r9
splash_tba_10_109:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_10_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83ca6  ! 174: PREFETCHA_I	prefetcha	[%r0, + 0xfffffca6] %asi, #one_read
	setx 0xe207307594325b9b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_112:
	set 0x60540000, %r31
	.word 0x85853a73  ! 176: WRCCR_I	wr	%r20, 0x1a73, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56cf20a  ! 177: SDIVX_I	sdivx	%r19, 0xfffff20a, %r18
cwp_10_114:
    set user_data_start, %o7
	.word 0x93902004  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
    set 0x697, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b007e5  ! 179: PDISTN	fmean16	%d0, %d36, %d18
splash_tba_10_115:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0xafc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b4c7f4  ! 181: PDISTN	fmean16	%d50, %d20, %d18
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_10_117:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_10_118:
    set user_data_start, %o7
	.word 0x93902000  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
donret_10_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_119-donret_10_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003c4653 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xddf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_119:
	.word 0xe2ffe096  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x0096] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_120)+0, 16, 16)) -> intp(10,1,3)
xir_10_120:
	.word 0xa980296e  ! 186: WR_SET_SOFTINT_I	wr	%r0, 0x096e, %set_softint
	.word 0xe2800ac0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
splash_htba_10_121:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8025be  ! 189: SIR	sir	0x05be
debug_10_122:
	nop
debug_dva_10_122:
	ta T_CHANGE_HPRIV
	set 0x9750b8c5, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_10_123:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_124)+0, 16, 16)) -> intp(10,1,3)
xir_10_124:
	.word 0xa9846b2a  ! 192: WR_SET_SOFTINT_I	wr	%r17, 0x0b2a, %set_softint
	setx 0xeeee5ff802b33fb9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_126) + 16, 16, 16)) -> intp(3,0,5)
intvec_10_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_10_127:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7848002  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r2, %-
memptr_10_128:
	set 0x60540000, %r31
	.word 0x8580e5a8  ! 196: WRCCR_I	wr	%r3, 0x05a8, %ccr
    set 0x252e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b447e0  ! 197: PDISTN	fmean16	%d48, %d0, %d48
splash_decr_10_129:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7804013  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r19, %-
splash_htba_10_130:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_10_131:
    set user_data_start, %o7
	.word 0x93902002  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_hpstate_10_132:
	.word 0x8198215d  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
invtsb_10_133:
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
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_10_134:
    set user_data_start, %o7
	.word 0x93902006  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_135)+24, 16, 16)) -> intp(10,1,3)
xir_10_135:
	.word 0xa981ef37  ! 204: WR_SET_SOFTINT_I	wr	%r7, 0x0f37, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_10_136:
	tsubcctv %r18, 0x118d, %r3
	.word 0xd407e0dc  ! 206: LDUW_I	lduw	[%r31 + 0x00dc], %r10
memptr_10_137:
	set 0x60340000, %r31
	.word 0x8584ef65  ! 207: WRCCR_I	wr	%r19, 0x0f65, %ccr
cwp_10_138:
    set user_data_start, %o7
	.word 0x93902005  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9ba2c9b0  ! 209: FDIVs	fdivs	%f11, %f16, %f13
invtsb_10_140:
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
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_10_141:
    set user_data_start, %o7
	.word 0x93902004  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
memptr_10_142:
	set 0x60540000, %r31
	.word 0x85853dfd  ! 212: WRCCR_I	wr	%r20, 0x1dfd, %ccr
splash_htba_10_143:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_10_144:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x1993, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b447f4  ! 215: PDISTN	fmean16	%d48, %d20, %d10
	.word 0x97a449d0  ! 216: FDIVd	fdivd	%f48, %f16, %f42
	.word 0xe597e010  ! 217: LDQFA_I	-	[%r31, 0x0010], %f18
	.word 0xa7842a78  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x0a78, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_10_146:
    set user_data_start, %o7
	.word 0x93902000  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    set 0x2da1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b1c7eb  ! 221: PDISTN	fmean16	%d38, %d42, %d18
	.word 0xa1a40dcc  ! 222: FdMULq	fdmulq	
jmptr_10_147:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
splash_decr_10_148:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7848008  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r8, %-
	.word 0xe4800c80  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
	.word 0x97a409d4  ! 226: FDIVd	fdivd	%f16, %f20, %f42
	.word 0x9f802cc7  ! 227: SIR	sir	0x0cc7
	.word 0x8d902cc4  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	.word 0xd88fe000  ! 229: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
jmptr_10_150:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_10_151:
	set 0x6c49f535, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9028b7  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x08b7, %pstate
	.word 0xd63a8003  ! 233: STD_R	std	%r11, [%r10 + %r3]
splash_hpstate_10_153:
	.word 0x81982697  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_154)+48, 16, 16)) -> intp(10,1,3)
xir_10_154:
	.word 0xa9812acc  ! 236: WR_SET_SOFTINT_I	wr	%r4, 0x0acc, %set_softint
	.word 0x8d90274e  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x074e, %pstate
	.word 0x8d9023f0  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x03f0, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_155)+56, 16, 16)) -> intp(10,1,3)
xir_10_155:
	.word 0xa984b179  ! 239: WR_SET_SOFTINT_I	wr	%r18, 0x1179, %set_softint
	.word 0x9f802a3a  ! 240: SIR	sir	0x0a3a
fpinit_10_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 241: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x9f803730  ! 242: SIR	sir	0x1730
	.word 0xa76a800c  ! 243: SDIVX_R	sdivx	%r10, %r12, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996caae0  ! 244: SDIVX_I	sdivx	%r18, 0x0ae0, %r12
	.word 0xe257e020  ! 245: LDSH_I	ldsh	[%r31 + 0x0020], %r17
	.word 0xe297e030  ! 246: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
splash_decr_10_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7840014  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r20, %-
    set 0x3e45, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b107f3  ! 248: PDISTN	fmean16	%d4, %d50, %d40
	.word 0x9b53c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_10_159:
	nop
	setx 0xfffff143fffffe3b, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_160)+8, 16, 16)) -> intp(10,1,3)
xir_10_160:
	.word 0xa981a259  ! 252: WR_SET_SOFTINT_I	wr	%r6, 0x0259, %set_softint
invtsb_10_161:
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
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_162)+8, 16, 16)) -> intp(10,1,3)
xir_10_162:
	.word 0xa983639b  ! 254: WR_SET_SOFTINT_I	wr	%r13, 0x039b, %set_softint
invtsb_10_163:
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
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
splash_decr_10_164:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa781c00c  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r12, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
	.word 0xa3a4c9b0  ! 258: FDIVs	fdivs	%f19, %f16, %f17
tagged_10_166:
	tsubcctv %r17, 0x16d6, %r19
	.word 0xe607e050  ! 259: LDUW_I	lduw	[%r31 + 0x0050], %r19
splash_decr_10_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7828013  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r19, %-
splash_decr_10_168:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa782c00c  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r12, %-
	.word 0x8d9033b0  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x13b0, %pstate
	.word 0xa3a089ea  ! 263: FDIVq	dis not found

cwp_10_169:
    set user_data_start, %o7
	.word 0x93902000  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_10_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 266: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_10_171:
    set user_data_start, %o7
	.word 0x93902003  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_10_172:
    set user_data_start, %o7
	.word 0x93902001  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_10_173:
	set 0x8e8b1a23, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3a4c9d2  ! 271: FDIVd	fdivd	%f50, %f18, %f48
fpinit_10_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 272: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_10_176:
    set user_data_start, %o7
	.word 0x93902001  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    set 0x1929, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b007eb  ! 275: PDISTN	fmean16	%d0, %d42, %d50
cwp_10_177:
    set user_data_start, %o7
	.word 0x93902006  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_decr_10_178:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa784800b  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r11, %-
change_to_randtl_10_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_179:
	.word 0x8f902000  ! 278: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_180)+0, 16, 16)) -> intp(10,1,3)
xir_10_180:
	.word 0xa984a509  ! 279: WR_SET_SOFTINT_I	wr	%r18, 0x0509, %set_softint
	setx 0xdd0614003e33e987, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a1c9b1  ! 281: FDIVs	fdivs	%f7, %f17, %f17
	.word 0x97b50493  ! 282: FCMPLE32	fcmple32	%d20, %d50, %r11
intveclr_10_184:
	setx 0xbd16b51cdaae9c6a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_185:
	setx 0x72bf16321fdfe84a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_10_186:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_10_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83537  ! 286: PREFETCHA_I	prefetcha	[%r0, + 0xfffff537] %asi, #one_read
	.word 0xc36cf8b3  ! 287: PREFETCH_I	prefetch	[%r19 + 0xfffff8b3], #one_read
	.word 0x9f802d03  ! 288: SIR	sir	0x0d03
invtsb_10_189:
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
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_10_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83279  ! 290: PREFETCHA_I	prefetcha	[%r0, + 0xfffff279] %asi, #one_read
splash_decr_10_191:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7808012  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r18, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_192)+56, 16, 16)) -> intp(10,1,3)
xir_10_192:
	.word 0xa9842afc  ! 292: WR_SET_SOFTINT_I	wr	%r16, 0x0afc, %set_softint
splash_hpstate_10_193:
	.word 0x819823dd  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03dd, %hpstate
	.word 0x9bb14492  ! 294: FCMPLE32	fcmple32	%d36, %d18, %r13
    set 0x2a87, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b487e5  ! 295: PDISTN	fmean16	%d18, %d36, %d48
    set 0x1fe4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b347e7  ! 296: PDISTN	fmean16	%d44, %d38, %d18
memptr_10_195:
	set user_data_start, %r31
	.word 0x85817671  ! 297: WRCCR_I	wr	%r5, 0x1671, %ccr
	.word 0xd4800c00  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0xc36c366c  ! 299: PREFETCH_I	prefetch	[%r16 + 0xfffff66c], #one_read
    set 0x3a81, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b087f3  ! 300: PDISTN	fmean16	%d2, %d50, %d42
cwp_10_197:
    set user_data_start, %o7
	.word 0x93902003  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_decr_10_198:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa781c008  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r8, %-
	.word 0xd2800bc0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r9
	.word 0xa5a249ac  ! 304: FDIVs	fdivs	%f9, %f12, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_200)+48, 16, 16)) -> intp(10,1,3)
xir_10_200:
	.word 0xa9846a9e  ! 305: WR_SET_SOFTINT_I	wr	%r17, 0x0a9e, %set_softint
	.word 0xd6dfe030  ! 306: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cac09  ! 307: SDIVX_I	sdivx	%r18, 0x0c09, %r8
	.word 0x9b45c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r13
change_to_randtl_10_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_202:
	.word 0x8f902001  ! 309: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_10_203:
    set user_data_start, %o7
	.word 0x93902002  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_htba_10_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_10_205:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x93d020b4  ! 313: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x9f802553  ! 314: SIR	sir	0x0553
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_206:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 315: RDPC	rd	%pc, %r9
tagged_10_207:
	taddcctv %r16, 0x147d, %r4
	.word 0xd407e014  ! 316: LDUW_I	lduw	[%r31 + 0x0014], %r10
	.word 0xd03a400d  ! 317: STD_R	std	%r8, [%r9 + %r13]
	.word 0xd64fe020  ! 318: LDSB_I	ldsb	[%r31 + 0x0020], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_209)+24, 16, 16)) -> intp(10,1,3)
xir_10_209:
	.word 0xa9843971  ! 319: WR_SET_SOFTINT_I	wr	%r16, 0x1971, %set_softint
	rd %pc, %r19
	add %r19, (ivw_10_210-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_210:
	.word 0x9194c013  ! 320: WRPR_PIL_R	wrpr	%r19, %r19, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_211)+8, 16, 16)) -> intp(10,1,3)
xir_10_211:
	.word 0xa9842717  ! 321: WR_SET_SOFTINT_I	wr	%r16, 0x0717, %set_softint
intveclr_10_212:
	setx 0x15e8fd23bef73020, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_10_213:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_10_214:
    set user_data_start, %o7
	.word 0x93902005  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_10_215:
	taddcctv %r19, 0x16b9, %r0
	.word 0xd607e0cc  ! 325: LDUW_I	lduw	[%r31 + 0x00cc], %r11
	.word 0x9f803023  ! 326: SIR	sir	0x1023
	.word 0x8d903d0a  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x1d0a, %pstate
splash_htba_10_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_10_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_217:
	.word 0x8f902002  ! 329: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
invtsb_10_218:
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
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	.word 0x97a089d1  ! 331: FDIVd	fdivd	%f2, %f48, %f42
fpinit_10_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 332: FCMPd	fcmpd	%fcc<n>, %f0, %f4
fpinit_10_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 333: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996cf168  ! 334: SDIVX_I	sdivx	%r19, 0xfffff168, %r12
splash_tba_10_223:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x24e7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb507e1  ! 336: PDISTN	fmean16	%d20, %d32, %d44
splash_tba_10_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_10_225:
	taddcctv %r17, 0x1b13, %r20
	.word 0xe207e0cc  ! 338: LDUW_I	lduw	[%r31 + 0x00cc], %r17
splash_lsu_10_226:
	set 0x6e3d7c56, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x2e69, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b407e3  ! 341: PDISTN	fmean16	%d16, %d34, %d10
	.word 0x95b0048d  ! 342: FCMPLE32	fcmple32	%d0, %d44, %r10
invtsb_10_228:
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
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_229)+8, 16, 16)) -> intp(10,1,3)
xir_10_229:
	.word 0xa9842b36  ! 344: WR_SET_SOFTINT_I	wr	%r16, 0x0b36, %set_softint
	.word 0xda9fd160  ! 345: LDDA_R	ldda	[%r31, %r0] 0x8b, %r13
cwp_10_230:
    set user_data_start, %o7
	.word 0x93902000  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_10_231:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_10_232:
    set user_data_start, %o7
	.word 0x93902000  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
invtsb_10_233:
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
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f802992  ! 350: SIR	sir	0x0992
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f80233b  ! 352: SIR	sir	0x033b
	.word 0xdadfe030  ! 353: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976974be  ! 354: SDIVX_I	sdivx	%r5, 0xfffff4be, %r11
	.word 0x9f803eed  ! 355: SIR	sir	0x1eed
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_236)+48, 16, 16)) -> intp(10,1,3)
xir_10_236:
	.word 0xa984a1d8  ! 356: WR_SET_SOFTINT_I	wr	%r18, 0x01d8, %set_softint
splash_tba_10_237:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x94d26551  ! 358: UMULcc_I	umulcc 	%r9, 0x0551, %r10
    set 0x1d07, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b0c7e4  ! 359: PDISTN	fmean16	%d34, %d4, %d50
jmptr_10_238:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800a60  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
splash_decr_10_239:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa784c005  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r5, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0xa76c8012  ! 364: SDIVX_R	sdivx	%r18, %r18, %r19
splash_lsu_10_240:
	set 0x4dd42c67, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_10_241:
	set 0x60140000, %r31
	.word 0x8584a082  ! 366: WRCCR_I	wr	%r18, 0x0082, %ccr
	.word 0x39400001  ! 367: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830f2  ! 368: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0f2] %asi, #one_read
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01961  ! 369: FqTOd	dis not found

    set 0x4f3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b4c7eb  ! 370: PDISTN	fmean16	%d50, %d42, %d16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c2339  ! 371: SDIVX_I	sdivx	%r16, 0x0339, %r16
splash_tba_10_246:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_10_247:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_248)+40, 16, 16)) -> intp(10,1,3)
xir_10_248:
	.word 0xa982ab74  ! 374: WR_SET_SOFTINT_I	wr	%r10, 0x0b74, %set_softint
	.word 0xe86fe0ae  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x00ae]
splash_tba_10_249:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_10_250:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7820008  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r8, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01966  ! 378: FqTOd	dis not found

	.word 0x98804010  ! 379: ADDcc_R	addcc 	%r1, %r16, %r12
memptr_10_252:
	set user_data_start, %r31
	.word 0x8584388b  ! 380: WRCCR_I	wr	%r16, 0x188b, %ccr
splash_htba_10_253:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa4804007  ! 382: ADDcc_R	addcc 	%r1, %r7, %r18
fpinit_10_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 383: FCMPLE32	fcmple32	%d0, %d4, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_255)+8, 16, 16)) -> intp(10,1,3)
xir_10_255:
	.word 0xa980edaa  ! 384: WR_SET_SOFTINT_I	wr	%r3, 0x0daa, %set_softint
debug_10_256:
	nop
debug_iva_10_256:
	ta T_CHANGE_HPRIV
	set 0x78528f0b, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_257)+0, 16, 16)) -> intp(10,1,3)
xir_10_257:
	.word 0xa98375cd  ! 386: WR_SET_SOFTINT_I	wr	%r13, 0x15cd, %set_softint
tagged_10_258:
	tsubcctv %r0, 0x159f, %r16
	.word 0xe007e06c  ! 387: LDUW_I	lduw	[%r31 + 0x006c], %r16
memptr_10_259:
	set 0x60340000, %r31
	.word 0x858434f0  ! 388: WRCCR_I	wr	%r16, 0x14f0, %ccr
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_260:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 389: RDPC	rd	%pc, %r20
invtsb_10_261:
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
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_10_262:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_decr_10_263:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7820011  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r17, %-
intveclr_10_264:
	setx 0x9e7ef31be5fc8e05, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_10_265:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d903123  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x1123, %pstate
splash_htba_10_266:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_decr_10_267:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa784000a  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r10, %-
splash_decr_10_268:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa784c002  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r2, %-
splash_decr_10_269:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7844001  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r1, %-
intveclr_10_270:
	setx 0x081c49eb39456b38, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
fpinit_8_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e76  ! 1: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe76] %asi, #one_read
	.word 0xa5a01a71  ! 2: FqTOi	fqtoi	
	.word 0x9f802714  ! 3: SIR	sir	0x0714
splash_tba_8_1:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda800c80  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r13
	.word 0xa781c00c  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r12, %-
tagged_8_3:
	taddcctv %r12, 0x1d08, %r12
	.word 0xda07e0a0  ! 7: LDUW_I	lduw	[%r31 + 0x00a0], %r13
splash_tba_8_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_8_5:
	nop
debug_dva_8_5:
	ta T_CHANGE_HPRIV
	set 0xb3f08e1f, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0x27dd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b107e8  ! 10: PDISTN	fmean16	%d4, %d8, %d10
	.word 0xe6800c00  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r19
	.word 0x9f802e12  ! 12: SIR	sir	0x0e12
tagged_8_6:
	tsubcctv %r4, 0x1860, %r4
	.word 0xe607e01a  ! 13: LDUW_I	lduw	[%r31 + 0x001a], %r19
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_8)+32, 16, 16)) -> intp(8,1,3)
xir_8_8:
	.word 0xa982b682  ! 15: WR_SET_SOFTINT_I	wr	%r10, 0x1682, %set_softint
jmptr_8_9:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_8_10:
    set user_data_start, %o7
	.word 0x93902006  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
jmptr_8_11:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_12)+0, 16, 16)) -> intp(8,1,3)
xir_8_12:
	.word 0xa984abc1  ! 19: WR_SET_SOFTINT_I	wr	%r18, 0x0bc1, %set_softint
tagged_8_13:
	taddcctv %r18, 0x1c16, %r5
	.word 0xe607e029  ! 20: LDUW_I	lduw	[%r31 + 0x0029], %r19
	.word 0xe68fe000  ! 21: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r19
memptr_8_14:
	set 0x60340000, %r31
	.word 0x8584aea9  ! 22: WRCCR_I	wr	%r18, 0x0ea9, %ccr
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x2fc7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b447e1  ! 24: PDISTN	fmean16	%d48, %d32, %d40
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_16)+0, 16, 16)) -> intp(8,1,3)
xir_8_16:
	.word 0xa982bb2d  ! 25: WR_SET_SOFTINT_I	wr	%r10, 0x1b2d, %set_softint
cwp_8_17:
    set user_data_start, %o7
	.word 0x93902004  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
fpinit_8_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 27: FDIVs	fdivs	%f0, %f4, %f4
splash_htba_8_19:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0x79738c8109875d76, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa7813a95  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r4, 0x1a95, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76868a0  ! 33: SDIVX_I	sdivx	%r1, 0x08a0, %r19
DS_8_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe334e602  ! 1: STQF_I	-	%f17, [0x0602, %r19]
	normalw
	.word 0x91458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r8
    set 0x2a1b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b307ea  ! 35: PDISTN	fmean16	%d12, %d10, %d10
tagged_8_24:
	tsubcctv %r10, 0x1af4, %r16
	.word 0xe007e084  ! 36: LDUW_I	lduw	[%r31 + 0x0084], %r16
	.word 0x93d02032  ! 37: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x9f802092  ! 38: SIR	sir	0x0092
cwp_8_25:
    set user_data_start, %o7
	.word 0x93902007  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_8_26:
	tsubcctv %r20, 0x127f, %r8
	.word 0xe007e074  ! 40: LDUW_I	lduw	[%r31 + 0x0074], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916cf7df  ! 41: SDIVX_I	sdivx	%r19, 0xfffff7df, %r8
	.word 0x8d90263c  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x063c, %pstate
	.word 0xe4800c00  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
	.word 0xe4cfe000  ! 44: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r18
cwp_8_28:
    set user_data_start, %o7
	.word 0x93902001  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa7848012  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0x9f803a18  ! 47: SIR	sir	0x1a18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_30)+24, 16, 16)) -> intp(8,1,3)
xir_8_30:
	.word 0xa984316f  ! 48: WR_SET_SOFTINT_I	wr	%r16, 0x116f, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_8_31:
	taddcctv %r4, 0x166b, %r19
	.word 0xe407e028  ! 50: LDUW_I	lduw	[%r31 + 0x0028], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_32)+16, 16, 16)) -> intp(8,1,3)
xir_8_32:
	.word 0xa9842359  ! 51: WR_SET_SOFTINT_I	wr	%r16, 0x0359, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_33)+32, 16, 16)) -> intp(8,1,3)
xir_8_33:
	.word 0xa984fbad  ! 52: WR_SET_SOFTINT_I	wr	%r19, 0x1bad, %set_softint
	.word 0xe4800c20  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	brgez,pn  	%r10, skip_8_35
	brlez,a,pt	%r11, skip_8_35
.align 2048
skip_8_35:
	.word 0x24c8c001  ! 55: BRLEZ	brlez,a,pt	%r3,<label_0x8c001>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_36) + 40, 16, 16)) -> intp(2,0,31)
intvec_8_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa784c014  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
    set 0x60b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b307f0  ! 58: PDISTN	fmean16	%d12, %d16, %d20
splash_tba_8_38:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa482be8d  ! 60: ADDcc_I	addcc 	%r10, 0xfffffe8d, %r18
fpinit_8_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 61: FDIVd	fdivd	%f0, %f4, %f4
splash_htba_8_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7a0054c  ! 63: FSQRTd	fsqrt	
	.word 0xa7848012  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93692d7f  ! 65: SDIVX_I	sdivx	%r4, 0x0d7f, %r9
	.word 0xa048c00c  ! 66: MULX_R	mulx 	%r3, %r12, %r16
tagged_8_43:
	taddcctv %r2, 0x1b14, %r20
	.word 0xd207e07c  ! 67: LDUW_I	lduw	[%r31 + 0x007c], %r9
splash_lsu_8_44:
	set 0xe202530d, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_8_45:
	set 0xe2c29972, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_8_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_46:
	.word 0x8f902001  ! 70: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x575, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b507e6  ! 71: PDISTN	fmean16	%d20, %d6, %d20
pmu_8_47:
	nop
	setx 0xfffffd60ffffff4e, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_8_48:
	tsubcctv %r17, 0x1cdd, %r13
	.word 0xe407e0db  ! 73: LDUW_I	lduw	[%r31 + 0x00db], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_49)+8, 16, 16)) -> intp(8,1,3)
xir_8_49:
	.word 0xa98462bc  ! 74: WR_SET_SOFTINT_I	wr	%r17, 0x02bc, %set_softint
	.word 0xa7840007  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r7, %-
unsupttte8_51:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1a249d3  ! 76: FDIVd	fdivd	%f40, %f50, %f16
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x96fc8013  ! 78: SDIVcc_R	sdivcc 	%r18, %r19, %r11
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e000  ! 80: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0x986ce44d  ! 81: UDIVX_I	udivx 	%r19, 0x044d, %r12
	.word 0xa7850012  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r18, %-
splash_htba_8_54:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_8_55:
    set user_data_start, %o7
	.word 0x93902005  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
cwp_8_56:
    set user_data_start, %o7
	.word 0x93902000  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 87: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87ac4a24  ! 88: FCMPs	fcmps	%fcc<n>, %f17, %f4
    set 0x1cc2, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b447e7  ! 89: PDISTN	fmean16	%d48, %d38, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_57)+0, 16, 16)) -> intp(8,1,3)
xir_8_57:
	.word 0xa9806fb5  ! 90: WR_SET_SOFTINT_I	wr	%r1, 0x0fb5, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_58) + 56, 16, 16)) -> intp(3,0,25)
intvec_8_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe28008a0  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x9f80281b  ! 94: SIR	sir	0x081b
splash_lsu_8_60:
	set 0xbd39f81f, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_8_61:
	set 0x60540000, %r31
	.word 0x8582bf32  ! 96: WRCCR_I	wr	%r10, 0x1f32, %ccr
	.word 0x8d902d5a  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0d5a, %pstate
unsupttte8_62:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5a449c2  ! 98: FDIVd	fdivd	%f48, %f2, %f18
    set 0x1ede, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b147f0  ! 99: PDISTN	fmean16	%d36, %d16, %d10
fpinit_8_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 100: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xa669e399  ! 101: UDIVX_I	udivx 	%r7, 0x0399, %r19
    set 0x842, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b247e8  ! 102: PDISTN	fmean16	%d40, %d8, %d16
	fbue,a,pn	%fcc0,  skip_8_64
	fbuge,a,pn	%fcc0,  skip_8_64
.align 1024
skip_8_64:
	.word 0xd9e48026  ! 103: CASA_I	casa	[%r18] 0x 1, %r6, %r12
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_8_66:
	set 0x8f1619ba, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x98fd000c  ! 107: SDIVcc_R	sdivcc 	%r20, %r12, %r12
cwp_8_67:
    set user_data_start, %o7
	.word 0x93902003  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
jmptr_8_68:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_8_70:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3fae, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b207e3  ! 112: PDISTN	fmean16	%d8, %d34, %d18
cwp_8_71:
    set user_data_start, %o7
	.word 0x93902006  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_8_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_8_73:
	.word 0x81982a15  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
splash_htba_8_74:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8020d3  ! 117: SIR	sir	0x00d3
splash_htba_8_75:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_8_76:
	tsubcctv %r13, 0x1cee, %r10
	.word 0xe407e010  ! 119: LDUW_I	lduw	[%r31 + 0x0010], %r18
unsupttte8_77:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3a509a4  ! 120: FDIVs	fdivs	%f20, %f4, %f17
	bgu  	 skip_8_78
	.word 0xd3e04030  ! 1: CASA_I	casa	[%r1] 0x 1, %r16, %r9
.align 2048
skip_8_78:
	.word 0xe9e14032  ! 121: CASA_I	casa	[%r5] 0x 1, %r18, %r20
	.word 0xd21fe010  ! 122: LDD_I	ldd	[%r31 + 0x0010], %r9
    set 0x1946, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407f0  ! 123: PDISTN	fmean16	%d16, %d16, %d20
splash_lsu_8_79:
	set 0xd05e9cd5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xa780c011  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r17, %-
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d902cdd  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_8_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d94c007  ! 131: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
cwp_8_84:
    set user_data_start, %o7
	.word 0x93902006  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_8_86:
	tsubcctv %r9, 0x1f45, %r17
	.word 0xe207e0ac  ! 134: LDUW_I	lduw	[%r31 + 0x00ac], %r17
splash_lsu_8_87:
	set 0x83b4bff6, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe030  ! 136: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
unsupttte8_88:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ed0034  ! 137: PREFETCHA_R	prefetcha	[%r20, %r20] 0x01, #one_read
	bvs,a	 skip_8_89
	.word 0xc36cf84e  ! 1: PREFETCH_I	prefetch	[%r19 + 0xfffff84e], #one_read
.align 2048
skip_8_89:
	.word 0xe23c8014  ! 138: STD_R	std	%r17, [%r18 + %r20]
change_to_randtl_8_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd68008a0  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_lsu_8_91:
	set 0x9616481e, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba30dcd  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_8_92:
	set 0x60540000, %r31
	.word 0x8582715a  ! 144: WRCCR_I	wr	%r9, 0x115a, %ccr
	.word 0xd097e010  ! 145: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
splash_htba_8_93:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9ba449d1  ! 147: FDIVd	fdivd	%f48, %f48, %f44
    set 0x6b9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b407f0  ! 148: PDISTN	fmean16	%d16, %d16, %d8
jmptr_8_94:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_8_95:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe000  ! 151: LDUB_I	ldub	[%r31 + 0x0000], %r13
    set 0x2890, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb207f2  ! 152: PDISTN	fmean16	%d8, %d18, %d44
splash_htba_8_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802543  ! 154: SIR	sir	0x0543
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
	.word 0xa784400a  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r10, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956d3359  ! 157: SDIVX_I	sdivx	%r20, 0xfffff359, %r10
jmptr_8_100:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e0f4  ! 159: STF_I	st	%f19, [0x00f4, %r31]
	.word 0x9f80371f  ! 160: SIR	sir	0x171f
cwp_8_101:
    set user_data_start, %o7
	.word 0x93902006  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902645  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x0645, %pstate
    set 0x28af, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b507f0  ! 163: PDISTN	fmean16	%d20, %d16, %d16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01970  ! 164: FqTOd	dis not found

unsupttte8_103:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ea8023  ! 165: PREFETCHA_R	prefetcha	[%r10, %r3] 0x01, #one_read
	.word 0x8d903590  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x1590, %pstate
	.word 0xa46d0012  ! 167: UDIVX_R	udivx 	%r20, %r18, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_104)+0, 16, 16)) -> intp(8,1,3)
xir_8_104:
	.word 0xa98129c6  ! 168: WR_SET_SOFTINT_I	wr	%r4, 0x09c6, %set_softint
	setx 0xf5698130029c7ca5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_8_106:
    set user_data_start, %o7
	.word 0x93902001  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_8_107:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56cb643  ! 172: SDIVX_I	sdivx	%r18, 0xfffff643, %r18
splash_tba_8_109:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_8_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 174: FDIVs	fdivs	%f0, %f4, %f6
	setx 0x1b3862165ea1c5ea, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_112:
	set 0x60340000, %r31
	.word 0x8584f142  ! 176: WRCCR_I	wr	%r19, 0x1142, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c78f3  ! 177: SDIVX_I	sdivx	%r17, 0xfffff8f3, %r16
cwp_8_114:
    set user_data_start, %o7
	.word 0x93902002  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set 0xee8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b147e7  ! 179: PDISTN	fmean16	%d36, %d38, %d12
splash_tba_8_115:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x163, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b447f0  ! 181: PDISTN	fmean16	%d48, %d16, %d16
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_8_117:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_8_118:
    set user_data_start, %o7
	.word 0x93902006  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_8_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_119-donret_8_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001eae1c | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2cf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_119:
	.word 0xe2ffe0c8  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x00c8] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_120)+48, 16, 16)) -> intp(8,1,3)
xir_8_120:
	.word 0xa9842554  ! 186: WR_SET_SOFTINT_I	wr	%r16, 0x0554, %set_softint
	.word 0xe2800ac0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
splash_htba_8_121:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8026e0  ! 189: SIR	sir	0x06e0
debug_8_122:
	nop
debug_dva_8_122:
	ta T_CHANGE_HPRIV
	set 0x8c179b9a, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_8_123:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_124)+16, 16, 16)) -> intp(8,1,3)
xir_8_124:
	.word 0xa9832d62  ! 192: WR_SET_SOFTINT_I	wr	%r12, 0x0d62, %set_softint
	setx 0xce9f3ed8b857b58a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_126) + 0, 16, 16)) -> intp(3,0,8)
intvec_8_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7804001  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r1, %-
memptr_8_128:
	set 0x60740000, %r31
	.word 0x8584fdfe  ! 196: WRCCR_I	wr	%r19, 0x1dfe, %ccr
    set 0x2fe0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b487eb  ! 197: PDISTN	fmean16	%d18, %d42, %d16
	.word 0xa7828011  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r17, %-
splash_htba_8_130:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_8_131:
    set user_data_start, %o7
	.word 0x93902006  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_hpstate_8_132:
	.word 0x8198242f  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x042f, %hpstate
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_8_134:
    set user_data_start, %o7
	.word 0x93902000  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_135)+24, 16, 16)) -> intp(8,1,3)
xir_8_135:
	.word 0xa98272e3  ! 204: WR_SET_SOFTINT_I	wr	%r9, 0x12e3, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_8_136:
	tsubcctv %r19, 0x13de, %r8
	.word 0xd407e0f3  ! 206: LDUW_I	lduw	[%r31 + 0x00f3], %r10
memptr_8_137:
	set 0x60540000, %r31
	.word 0x8584b456  ! 207: WRCCR_I	wr	%r18, 0x1456, %ccr
cwp_8_138:
    set user_data_start, %o7
	.word 0x93902007  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
unsupttte8_139:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aa4a52  ! 209: FCMPd	fcmpd	%fcc<n>, %f40, %f18
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_8_141:
    set user_data_start, %o7
	.word 0x93902006  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
memptr_8_142:
	set 0x60540000, %r31
	.word 0x858527f4  ! 212: WRCCR_I	wr	%r20, 0x07f4, %ccr
splash_htba_8_143:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_8_144:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x3b2e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b487e1  ! 215: PDISTN	fmean16	%d18, %d32, %d18
unsupttte8_145:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ac0a53  ! 216: FCMPd	fcmpd	%fcc<n>, %f16, %f50
	.word 0xe597e020  ! 217: LDQFA_I	-	[%r31, 0x0020], %f18
	.word 0xa781ac3e  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r6, 0x0c3e, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_8_146:
    set user_data_start, %o7
	.word 0x93902005  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    set 0x3d64, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b087f0  ! 221: PDISTN	fmean16	%d2, %d16, %d18
	.word 0xa5a44dc4  ! 222: FdMULq	fdmulq	
jmptr_8_147:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7848012  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0xe48008a0  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
unsupttte8_149:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1b4c481  ! 226: FCMPLE32	fcmple32	%d50, %d32, %r16
	.word 0x9f8036c4  ! 227: SIR	sir	0x16c4
	.word 0x8d903054  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x1054, %pstate
	.word 0xd88fe020  ! 229: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
jmptr_8_150:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_8_151:
	set 0xe43f7ad5, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9028f0  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x08f0, %pstate
	fblg skip_8_152
	.word 0xa9b484d3  ! 1: FCMPNE32	fcmpne32	%d18, %d50, %r20
.align 512
skip_8_152:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_153:
	.word 0x81982af6  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0af6, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_154)+8, 16, 16)) -> intp(8,1,3)
xir_8_154:
	.word 0xa982bb7e  ! 236: WR_SET_SOFTINT_I	wr	%r10, 0x1b7e, %set_softint
	.word 0x8d903fb1  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x1fb1, %pstate
	.word 0x8d903b1a  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x1b1a, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_155)+32, 16, 16)) -> intp(8,1,3)
xir_8_155:
	.word 0xa985309c  ! 239: WR_SET_SOFTINT_I	wr	%r20, 0x109c, %set_softint
	.word 0x9f802183  ! 240: SIR	sir	0x0183
fpinit_8_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83225  ! 241: PREFETCHA_I	prefetcha	[%r0, + 0xfffff225] %asi, #one_read
	.word 0x9f8029fd  ! 242: SIR	sir	0x09fd
	.word 0x9769400c  ! 243: SDIVX_R	sdivx	%r5, %r12, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c6ffa  ! 244: SDIVX_I	sdivx	%r17, 0x0ffa, %r20
	.word 0xe257e020  ! 245: LDSH_I	ldsh	[%r31 + 0x0020], %r17
	.word 0xe297e010  ! 246: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0xa7848012  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
    set 0xb10, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb147ed  ! 248: PDISTN	fmean16	%d36, %d44, %d44
	.word 0xa953c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_8_159:
	nop
	setx 0xfffffac5ffffff39, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_160)+32, 16, 16)) -> intp(8,1,3)
xir_8_160:
	.word 0xa9847d33  ! 252: WR_SET_SOFTINT_I	wr	%r17, 0x1d33, %set_softint
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_162)+0, 16, 16)) -> intp(8,1,3)
xir_8_162:
	.word 0xa9817d16  ! 254: WR_SET_SOFTINT_I	wr	%r5, 0x1d16, %set_softint
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
	.word 0xa7808006  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r6, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
unsupttte8_165:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95b0c491  ! 258: FCMPLE32	fcmple32	%d34, %d48, %r10
tagged_8_166:
	tsubcctv %r1, 0x1573, %r17
	.word 0xe607e054  ! 259: LDUW_I	lduw	[%r31 + 0x0054], %r19
	.word 0xa7848012  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
	.word 0xa781800c  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r12, %-
	.word 0x8d903ad7  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x1ad7, %pstate
	.word 0x95a4c9e7  ! 263: FDIVq	dis not found

cwp_8_169:
    set user_data_start, %o7
	.word 0x93902004  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_8_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d948012  ! 266: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_8_171:
    set user_data_start, %o7
	.word 0x93902003  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_8_172:
    set user_data_start, %o7
	.word 0x93902000  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_8_173:
	set 0x9f394c5b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ba  	 skip_8_174
	.word 0x9ba209cb  ! 1: FDIVd	fdivd	%f8, %f42, %f44
.align 128
skip_8_174:
	.word 0x39400001  ! 271: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 272: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_8_176:
    set user_data_start, %o7
	.word 0x93902002  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set 0x3b53, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407f2  ! 275: PDISTN	fmean16	%d16, %d18, %d40
cwp_8_177:
    set user_data_start, %o7
	.word 0x93902005  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa7828011  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r17, %-
change_to_randtl_8_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_179:
	.word 0x8f902000  ! 278: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_180)+16, 16, 16)) -> intp(8,1,3)
xir_8_180:
	.word 0xa984f065  ! 279: WR_SET_SOFTINT_I	wr	%r19, 0x1065, %set_softint
	setx 0xec2c8beea6fc6c5e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte8_182:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a80a50  ! 281: FCMPd	fcmpd	%fcc<n>, %f0, %f16
unsupttte8_183:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3b4c492  ! 282: FCMPLE32	fcmple32	%d50, %d18, %r17
intveclr_8_184:
	setx 0x44af5447f9d1d138, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_185:
	setx 0x0930563f392682cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_8_186:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_8_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 286: FDIVd	fdivd	%f0, %f4, %f8
	fbul,a,pn	%fcc0,  skip_8_188
	.word 0x95a4c9c7  ! 1: FDIVd	fdivd	%f50, %f38, %f10
.align 512
skip_8_188:
	.word 0xe5e4402b  ! 287: CASA_I	casa	[%r17] 0x 1, %r11, %r18
	.word 0x9f80237e  ! 288: SIR	sir	0x037e
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_8_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83279  ! 290: PREFETCHA_I	prefetcha	[%r0, + 0xfffff279] %asi, #one_read
	.word 0xa7804001  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_192)+8, 16, 16)) -> intp(8,1,3)
xir_8_192:
	.word 0xa984268e  ! 292: WR_SET_SOFTINT_I	wr	%r16, 0x068e, %set_softint
splash_hpstate_8_193:
	.word 0x81982514  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
unsupttte8_194:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e80020  ! 294: PREFETCHA_R	prefetcha	[%r0, %r0] 0x01, #one_read
    set 0x7e4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b487e7  ! 295: PDISTN	fmean16	%d18, %d38, %d10
    set 0x152b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b047e7  ! 296: PDISTN	fmean16	%d32, %d38, %d50
memptr_8_195:
	set user_data_start, %r31
	.word 0x8580b08c  ! 297: WRCCR_I	wr	%r2, 0x108c, %ccr
	.word 0xd4800b40  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
	bneg,a	 skip_8_196
	.word 0xa3a489d2  ! 1: FDIVd	fdivd	%f18, %f18, %f48
.align 512
skip_8_196:
	.word 0xe439c002  ! 299: STD_R	std	%r18, [%r7 + %r2]
    set 0x216, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b247f4  ! 300: PDISTN	fmean16	%d40, %d20, %d8
cwp_8_197:
    set user_data_start, %o7
	.word 0x93902007  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa780c014  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r20, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
unsupttte8_199:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a409c5  ! 304: FDIVd	fdivd	%f16, %f36, %f42
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_200)+0, 16, 16)) -> intp(8,1,3)
xir_8_200:
	.word 0xa980f1e9  ! 305: WR_SET_SOFTINT_I	wr	%r3, 0x11e9, %set_softint
	.word 0xd6dfe010  ! 306: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69752e  ! 307: SDIVX_I	sdivx	%r5, 0xfffff52e, %r13
	.word 0x9345c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r9
change_to_randtl_8_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_202:
	.word 0x8f902001  ! 309: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_8_203:
    set user_data_start, %o7
	.word 0x93902007  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_htba_8_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_8_205:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x83d02035  ! 313: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9f803521  ! 314: SIR	sir	0x1521
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_206:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 315: RDPC	rd	%pc, %r16
tagged_8_207:
	taddcctv %r13, 0x18e0, %r3
	.word 0xd407e0ac  ! 316: LDUW_I	lduw	[%r31 + 0x00ac], %r10
	fbu skip_8_208
	.word 0x87a8ca52  ! 1: FCMPd	fcmpd	%fcc<n>, %f34, %f18
.align 1024
skip_8_208:
	.word 0xc36c2703  ! 317: PREFETCH_I	prefetch	[%r16 + 0x0703], #one_read
	.word 0xd64fe000  ! 318: LDSB_I	ldsb	[%r31 + 0x0000], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_209)+56, 16, 16)) -> intp(8,1,3)
xir_8_209:
	.word 0xa982e986  ! 319: WR_SET_SOFTINT_I	wr	%r11, 0x0986, %set_softint
	rd %pc, %r19
	add %r19, (ivw_8_210-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_210:
	.word 0x9194c009  ! 320: WRPR_PIL_R	wrpr	%r19, %r9, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_211)+56, 16, 16)) -> intp(8,1,3)
xir_8_211:
	.word 0xa984e970  ! 321: WR_SET_SOFTINT_I	wr	%r19, 0x0970, %set_softint
intveclr_8_212:
	setx 0x8477ef376dccd626, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_8_213:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_8_214:
    set user_data_start, %o7
	.word 0x93902007  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_8_215:
	taddcctv %r9, 0x125b, %r13
	.word 0xd607e028  ! 325: LDUW_I	lduw	[%r31 + 0x0028], %r11
	.word 0x9f8021dd  ! 326: SIR	sir	0x01dd
	.word 0x8d902d72  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x0d72, %pstate
splash_htba_8_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_8_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_217:
	.word 0x8f902001  ! 329: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	ble,a	 skip_8_219
	brlez,pt  	%r0, skip_8_219
.align 32
skip_8_219:
	.word 0xe0384014  ! 331: STD_R	std	%r16, [%r1 + %r20]
fpinit_8_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 332: FCMPd	fcmpd	%fcc<n>, %f0, %f4
fpinit_8_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 333: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16cfb31  ! 334: SDIVX_I	sdivx	%r19, 0xfffffb31, %r16
splash_tba_8_223:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0xb78, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb287f0  ! 336: PDISTN	fmean16	%d10, %d16, %d44
splash_tba_8_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_8_225:
	taddcctv %r20, 0x14a3, %r0
	.word 0xe207e0e4  ! 338: LDUW_I	lduw	[%r31 + 0x00e4], %r17
splash_lsu_8_226:
	set 0x0a703c20, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x3bd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b347f0  ! 341: PDISTN	fmean16	%d44, %d16, %d12
unsupttte8_227:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3e90033  ! 342: PREFETCHA_R	prefetcha	[%r4, %r19] 0x01, #one_read
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_229)+40, 16, 16)) -> intp(8,1,3)
xir_8_229:
	.word 0xa9843710  ! 344: WR_SET_SOFTINT_I	wr	%r16, 0x1710, %set_softint
	.word 0xda9fd920  ! 345: LDDA_R	ldda	[%r31, %r0] 0xc9, %r13
cwp_8_230:
    set user_data_start, %o7
	.word 0x93902003  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_8_231:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_8_232:
    set user_data_start, %o7
	.word 0x93902005  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f802c85  ! 350: SIR	sir	0x0c85
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f80230b  ! 352: SIR	sir	0x030b
	.word 0xdadfe020  ! 353: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36c622d  ! 354: SDIVX_I	sdivx	%r17, 0x022d, %r17
	.word 0x9f8020f0  ! 355: SIR	sir	0x00f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_236)+32, 16, 16)) -> intp(8,1,3)
xir_8_236:
	.word 0xa98469d5  ! 356: WR_SET_SOFTINT_I	wr	%r17, 0x09d5, %set_softint
splash_tba_8_237:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa0d46dd1  ! 358: UMULcc_I	umulcc 	%r17, 0x0dd1, %r16
    set 0x1762, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b1c7f1  ! 359: PDISTN	fmean16	%d38, %d48, %d40
jmptr_8_238:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa7840014  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r20, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0xa568c012  ! 364: SDIVX_R	sdivx	%r3, %r18, %r18
splash_lsu_8_240:
	set 0x218460e8, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_8_241:
	set 0x60740000, %r31
	.word 0x8585365d  ! 366: WRCCR_I	wr	%r20, 0x165d, %ccr
	fbl skip_8_242
	fbug skip_8_242
.align 1024
skip_8_242:
	.word 0x93a049cd  ! 367: FDIVd	fdivd	%f32, %f44, %f40
fpinit_8_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830f2  ! 368: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0f2] %asi, #one_read
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196a  ! 369: FqTOd	dis not found

    set 0x23ee, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b487eb  ! 370: PDISTN	fmean16	%d18, %d42, %d50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936a3502  ! 371: SDIVX_I	sdivx	%r8, 0xfffff502, %r9
splash_tba_8_246:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_8_247:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_248)+40, 16, 16)) -> intp(8,1,3)
xir_8_248:
	.word 0xa984fe72  ! 374: WR_SET_SOFTINT_I	wr	%r19, 0x1e72, %set_softint
	.word 0xe86fe018  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x0018]
splash_tba_8_249:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7848010  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 378: FqTOd	dis not found

	.word 0x92844007  ! 379: ADDcc_R	addcc 	%r17, %r7, %r9
memptr_8_252:
	set user_data_start, %r31
	.word 0x85813563  ! 380: WRCCR_I	wr	%r4, 0x1563, %ccr
splash_htba_8_253:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x92840013  ! 382: ADDcc_R	addcc 	%r16, %r19, %r9
fpinit_8_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 383: FDIVs	fdivs	%f0, %f4, %f6
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_255)+24, 16, 16)) -> intp(8,1,3)
xir_8_255:
	.word 0xa980b9e6  ! 384: WR_SET_SOFTINT_I	wr	%r2, 0x19e6, %set_softint
debug_8_256:
	nop
debug_iva_8_256:
	ta T_CHANGE_HPRIV
	set 0xc0464df9, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_257)+8, 16, 16)) -> intp(8,1,3)
xir_8_257:
	.word 0xa98262e1  ! 386: WR_SET_SOFTINT_I	wr	%r9, 0x02e1, %set_softint
tagged_8_258:
	tsubcctv %r3, 0x1560, %r10
	.word 0xe007e00a  ! 387: LDUW_I	lduw	[%r31 + 0x000a], %r16
memptr_8_259:
	set 0x60340000, %r31
	.word 0x85843fe1  ! 388: WRCCR_I	wr	%r16, 0x1fe1, %ccr
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_260:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 389: RDPC	rd	%pc, %r18
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_8_262:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7840004  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r4, %-
intveclr_8_264:
	setx 0x8591792c7df762cb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_8_265:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9038b6  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x18b6, %pstate
splash_htba_8_266:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa781c013  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r19, %-
	.word 0xa7824012  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r18, %-
	.word 0xa784c000  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r0, %-
intveclr_8_270:
	setx 0x57cb1078f75bcc8e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
fpinit_4_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e76  ! 1: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe76] %asi, #one_read
	.word 0x91a01a67  ! 2: FqTOi	fqtoi	
	.word 0x9f803e8e  ! 3: SIR	sir	0x1e8e
splash_tba_4_1:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda8008a0  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa7850011  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
tagged_4_3:
	taddcctv %r4, 0x1ad6, %r16
	.word 0xda07e008  ! 7: LDUW_I	lduw	[%r31 + 0x0008], %r13
splash_tba_4_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_5:
	nop
debug_dva_4_5:
	ta T_CHANGE_HPRIV
	set 0xf25be1b6, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0xe57, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b447f3  ! 10: PDISTN	fmean16	%d48, %d50, %d16
	.word 0xe6800ac0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
	.word 0x9f802caf  ! 12: SIR	sir	0x0caf
tagged_4_6:
	tsubcctv %r19, 0x1d43, %r1
	.word 0xe607e06c  ! 13: LDUW_I	lduw	[%r31 + 0x006c], %r19
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_8)+56, 16, 16)) -> intp(4,1,3)
xir_4_8:
	.word 0xa9853695  ! 15: WR_SET_SOFTINT_I	wr	%r20, 0x1695, %set_softint
jmptr_4_9:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_4_10:
    set user_data_start, %o7
	.word 0x93902001  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_4_11:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_12)+40, 16, 16)) -> intp(4,1,3)
xir_4_12:
	.word 0xa9852f90  ! 19: WR_SET_SOFTINT_I	wr	%r20, 0x0f90, %set_softint
tagged_4_13:
	taddcctv %r2, 0x1de8, %r19
	.word 0xe607e0b8  ! 20: LDUW_I	lduw	[%r31 + 0x00b8], %r19
	.word 0xe68fe020  ! 21: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r19
memptr_4_14:
	set 0x60340000, %r31
	.word 0x8581b77f  ! 22: WRCCR_I	wr	%r6, 0x177f, %ccr
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x38c4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb487f4  ! 24: PDISTN	fmean16	%d18, %d20, %d44
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_16)+24, 16, 16)) -> intp(4,1,3)
xir_4_16:
	.word 0xa982aad6  ! 25: WR_SET_SOFTINT_I	wr	%r10, 0x0ad6, %set_softint
cwp_4_17:
    set user_data_start, %o7
	.word 0x93902004  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
fpinit_4_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 27: FDIVd	fdivd	%f0, %f4, %f4
splash_htba_4_19:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0xd4f1b6bcaf01c430, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe8800b20  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r20
	.word 0xa781f339  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r7, 0x1339, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b25e5  ! 33: SDIVX_I	sdivx	%r12, 0x05e5, %r10
DS_4_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3343022  ! 1: STQF_I	-	%f9, [0x1022, %r16]
	normalw
	.word 0x9b458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r13
    set 0x156d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b0c7f3  ! 35: PDISTN	fmean16	%d34, %d50, %d50
tagged_4_24:
	tsubcctv %r16, 0x1374, %r4
	.word 0xe007e044  ! 36: LDUW_I	lduw	[%r31 + 0x0044], %r16
	.word 0x83d020b4  ! 37: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x9f803649  ! 38: SIR	sir	0x1649
cwp_4_25:
    set user_data_start, %o7
	.word 0x93902003  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_4_26:
	tsubcctv %r0, 0x15af, %r19
	.word 0xe007e0ba  ! 40: LDUW_I	lduw	[%r31 + 0x00ba], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b2e58  ! 41: SDIVX_I	sdivx	%r12, 0x0e58, %r20
	.word 0x8d903556  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1556, %pstate
	.word 0xe48008a0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4cfe030  ! 44: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r18
cwp_4_28:
    set user_data_start, %o7
	.word 0x93902000  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa784c014  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r20, %-
	.word 0x9f803a69  ! 47: SIR	sir	0x1a69
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_30)+0, 16, 16)) -> intp(4,1,3)
xir_4_30:
	.word 0xa984b8ce  ! 48: WR_SET_SOFTINT_I	wr	%r18, 0x18ce, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_4_31:
	taddcctv %r18, 0x1b2f, %r16
	.word 0xe407e0bd  ! 50: LDUW_I	lduw	[%r31 + 0x00bd], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_32)+40, 16, 16)) -> intp(4,1,3)
xir_4_32:
	.word 0xa9842f03  ! 51: WR_SET_SOFTINT_I	wr	%r16, 0x0f03, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_33)+8, 16, 16)) -> intp(4,1,3)
xir_4_33:
	.word 0xa9837473  ! 52: WR_SET_SOFTINT_I	wr	%r13, 0x1473, %set_softint
	.word 0xe48008a0  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	fbue skip_4_35
	.word 0x87acca50  ! 1: FCMPd	fcmpd	%fcc<n>, %f50, %f16
.align 2048
skip_4_35:
	.word 0xe63cc010  ! 55: STD_R	std	%r19, [%r19 + %r16]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_36) + 0, 16, 16)) -> intp(2,0,21)
intvec_4_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7840007  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r7, %-
    set 0x18ec, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb487f0  ! 58: PDISTN	fmean16	%d18, %d16, %d44
splash_tba_4_38:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa684b937  ! 60: ADDcc_I	addcc 	%r18, 0xfffff937, %r19
fpinit_4_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 61: FDIVs	fdivs	%f0, %f4, %f8
splash_htba_4_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa9a00552  ! 63: FSQRTd	fsqrt	
	.word 0xa7850014  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r20, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76d2e66  ! 65: SDIVX_I	sdivx	%r20, 0x0e66, %r19
	.word 0x9848c005  ! 66: MULX_R	mulx 	%r3, %r5, %r12
tagged_4_43:
	taddcctv %r19, 0x12c9, %r18
	.word 0xd207e038  ! 67: LDUW_I	lduw	[%r31 + 0x0038], %r9
splash_lsu_4_44:
	set 0xfba11763, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_45:
	set 0x2b991747, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_46:
	.word 0x8f902000  ! 70: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x24dc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b507e9  ! 71: PDISTN	fmean16	%d20, %d40, %d50
pmu_4_47:
	nop
	setx 0xfffff83bfffff850, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_4_48:
	tsubcctv %r5, 0x1d1d, %r20
	.word 0xe407e0ac  ! 73: LDUW_I	lduw	[%r31 + 0x00ac], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_49)+16, 16, 16)) -> intp(4,1,3)
xir_4_49:
	.word 0xa981374f  ! 74: WR_SET_SOFTINT_I	wr	%r4, 0x174f, %set_softint
	.word 0xa7818014  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r20, %-
unsupttte4_51:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a149c2  ! 76: FDIVd	fdivd	%f36, %f2, %f20
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x90fb4005  ! 78: SDIVcc_R	sdivcc 	%r13, %r5, %r8
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e020  ! 80: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0xa86b786e  ! 81: UDIVX_I	udivx 	%r13, 0xfffff86e, %r20
	.word 0xa7804006  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r6, %-
splash_htba_4_54:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_4_55:
    set user_data_start, %o7
	.word 0x93902004  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cwp_4_56:
    set user_data_start, %o7
	.word 0x93902005  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87aa4a21  ! 88: FCMPs	fcmps	%fcc<n>, %f9, %f1
    set 0x2cde, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7e7  ! 89: PDISTN	fmean16	%d50, %d38, %d48
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_57)+40, 16, 16)) -> intp(4,1,3)
xir_4_57:
	.word 0xa980f42e  ! 90: WR_SET_SOFTINT_I	wr	%r3, 0x142e, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_58) + 0, 16, 16)) -> intp(0,0,31)
intvec_4_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe28008a0  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x9f803a59  ! 94: SIR	sir	0x1a59
splash_lsu_4_60:
	set 0xbecfaf33, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_61:
	set 0x60340000, %r31
	.word 0x8585309e  ! 96: WRCCR_I	wr	%r20, 0x109e, %ccr
	.word 0x8d902b9f  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0b9f, %pstate
unsupttte4_62:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ec0030  ! 98: PREFETCHA_R	prefetcha	[%r16, %r16] 0x01, #one_read
    set 0x361b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b007f0  ! 99: PDISTN	fmean16	%d0, %d16, %d8
fpinit_4_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 100: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x946c627c  ! 101: UDIVX_I	udivx 	%r17, 0x027c, %r10
    set 0x1082, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b287ea  ! 102: PDISTN	fmean16	%d10, %d10, %d20
	fbule,a,pn	%fcc0,  skip_4_64
	brlez,a,pn	%r11, skip_4_64
.align 1024
skip_4_64:
	.word 0x24cc4001  ! 103: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_4_66:
	set 0xd1faa153, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa4fac005  ! 107: SDIVcc_R	sdivcc 	%r11, %r5, %r18
cwp_4_67:
    set user_data_start, %o7
	.word 0x93902007  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
jmptr_4_68:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_4_70:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x28e1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b407f3  ! 112: PDISTN	fmean16	%d16, %d50, %d8
cwp_4_71:
    set user_data_start, %o7
	.word 0x93902001  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_htba_4_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_4_73:
	.word 0x81982e07  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
splash_htba_4_74:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802ac8  ! 117: SIR	sir	0x0ac8
splash_htba_4_75:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_4_76:
	tsubcctv %r16, 0x124d, %r1
	.word 0xe407e0e5  ! 119: LDUW_I	lduw	[%r31 + 0x00e5], %r18
unsupttte4_77:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99b44493  ! 120: FCMPLE32	fcmple32	%d48, %d50, %r12
	ble  	 skip_4_78
	.word 0xe439c013  ! 1: STD_R	std	%r18, [%r7 + %r19]
.align 2048
skip_4_78:
	.word 0xd3e50032  ! 121: CASA_I	casa	[%r20] 0x 1, %r18, %r9
	.word 0xd21fe000  ! 122: LDD_I	ldd	[%r31 + 0x0000], %r9
    set 0xa4b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b507e6  ! 123: PDISTN	fmean16	%d20, %d6, %d42
splash_lsu_4_79:
	set 0xfa8ac9af, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800b00  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
	.word 0xa784c004  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r4, %-
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d90287b  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x087b, %pstate
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_4_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3f0] %asi
	.word 0x9d90c00c  ! 131: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
cwp_4_84:
    set user_data_start, %o7
	.word 0x93902003  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_4_86:
	tsubcctv %r17, 0x19cb, %r5
	.word 0xe207e075  ! 134: LDUW_I	lduw	[%r31 + 0x0075], %r17
splash_lsu_4_87:
	set 0x4fc11f72, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 136: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
unsupttte4_88:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93a4c9b4  ! 137: FDIVs	fdivs	%f19, %f20, %f9
	brgez,a,pn	%r19, skip_4_89
	.word 0x9ba189d3  ! 1: FDIVd	fdivd	%f6, %f50, %f44
.align 2048
skip_4_89:
	.word 0xd63c4008  ! 138: STD_R	std	%r11, [%r17 + %r8]
change_to_randtl_4_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd6800b40  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
splash_lsu_4_91:
	set 0xe01cac99, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9a0cdd2  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_4_92:
	set 0x60540000, %r31
	.word 0x85852f1b  ! 144: WRCCR_I	wr	%r20, 0x0f1b, %ccr
	.word 0xd097e020  ! 145: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
splash_htba_4_93:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x91a489d0  ! 147: FDIVd	fdivd	%f18, %f16, %f8
    set 0x354d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b487f4  ! 148: PDISTN	fmean16	%d18, %d20, %d48
jmptr_4_94:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_4_95:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe010  ! 151: LDUB_I	ldub	[%r31 + 0x0010], %r13
    set 0x36e8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b487f2  ! 152: PDISTN	fmean16	%d18, %d18, %d20
splash_htba_4_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802a33  ! 154: SIR	sir	0x0a33
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
	.word 0xa783000c  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r12, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769e58a  ! 157: SDIVX_I	sdivx	%r7, 0x058a, %r19
jmptr_4_100:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e0ac  ! 159: STF_I	st	%f19, [0x00ac, %r31]
	.word 0x9f803e0f  ! 160: SIR	sir	0x1e0f
cwp_4_101:
    set user_data_start, %o7
	.word 0x93902005  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d90366c  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x166c, %pstate
    set 0x745, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b307e2  ! 163: PDISTN	fmean16	%d12, %d2, %d20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01966  ! 164: FqTOd	dis not found

unsupttte4_103:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a94a50  ! 165: FCMPd	fcmpd	%fcc<n>, %f36, %f16
	.word 0x8d903a9d  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x1a9d, %pstate
	.word 0xa26d0002  ! 167: UDIVX_R	udivx 	%r20, %r2, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_104)+24, 16, 16)) -> intp(4,1,3)
xir_4_104:
	.word 0xa982a17b  ! 168: WR_SET_SOFTINT_I	wr	%r10, 0x017b, %set_softint
	setx 0x2d639bd2dbf1b977, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_4_106:
    set user_data_start, %o7
	.word 0x93902005  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
jmptr_4_107:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976ae79e  ! 172: SDIVX_I	sdivx	%r11, 0x079e, %r11
splash_tba_4_109:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_4_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 174: FDIVs	fdivs	%f0, %f4, %f6
	setx 0x52e9353c8bcc9fdb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_112:
	set 0x60340000, %r31
	.word 0x8584e721  ! 176: WRCCR_I	wr	%r19, 0x0721, %ccr
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56cb878  ! 177: SDIVX_I	sdivx	%r18, 0xfffff878, %r18
cwp_4_114:
    set user_data_start, %o7
	.word 0x93902003  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
    set 0x28b6, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b407e6  ! 179: PDISTN	fmean16	%d16, %d6, %d42
splash_tba_4_115:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x16c9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b447f4  ! 181: PDISTN	fmean16	%d48, %d20, %d42
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_4_117:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_4_118:
    set user_data_start, %o7
	.word 0x93902003  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
donret_4_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_119-donret_4_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0057bee6 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x517, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_119:
	.word 0xe2ffe015  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x0015] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_120)+32, 16, 16)) -> intp(4,1,3)
xir_4_120:
	.word 0xa9816fe4  ! 186: WR_SET_SOFTINT_I	wr	%r5, 0x0fe4, %set_softint
	.word 0xe28008a0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_htba_4_121:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8030aa  ! 189: SIR	sir	0x10aa
debug_4_122:
	nop
debug_dva_4_122:
	ta T_CHANGE_HPRIV
	set 0xffdabb73, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_4_123:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_124)+56, 16, 16)) -> intp(4,1,3)
xir_4_124:
	.word 0xa9842356  ! 192: WR_SET_SOFTINT_I	wr	%r16, 0x0356, %set_softint
	setx 0xe6b40f4ddcdf0061, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_126) + 56, 16, 16)) -> intp(3,0,22)
intvec_4_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7800007  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r7, %-
memptr_4_128:
	set 0x60140000, %r31
	.word 0x8584b97d  ! 196: WRCCR_I	wr	%r18, 0x197d, %ccr
    set 0x2d8e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b487e5  ! 197: PDISTN	fmean16	%d18, %d36, %d18
	.word 0xa7814013  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r19, %-
splash_htba_4_130:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_4_131:
    set user_data_start, %o7
	.word 0x93902000  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_hpstate_4_132:
	.word 0x81982015  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0015, %hpstate
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_4_134:
    set user_data_start, %o7
	.word 0x93902007  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_135)+0, 16, 16)) -> intp(4,1,3)
xir_4_135:
	.word 0xa980a048  ! 204: WR_SET_SOFTINT_I	wr	%r2, 0x0048, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_4_136:
	tsubcctv %r2, 0x1b07, %r19
	.word 0xd407e0f8  ! 206: LDUW_I	lduw	[%r31 + 0x00f8], %r10
memptr_4_137:
	set 0x60340000, %r31
	.word 0x8584fcdc  ! 207: WRCCR_I	wr	%r19, 0x1cdc, %ccr
cwp_4_138:
    set user_data_start, %o7
	.word 0x93902005  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
unsupttte4_139:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ec8034  ! 209: PREFETCHA_R	prefetcha	[%r18, %r20] 0x01, #one_read
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_4_141:
    set user_data_start, %o7
	.word 0x93902005  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
memptr_4_142:
	set 0x60540000, %r31
	.word 0x8580fd54  ! 212: WRCCR_I	wr	%r3, 0x1d54, %ccr
splash_htba_4_143:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_4_144:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x2e04, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b287e1  ! 215: PDISTN	fmean16	%d10, %d32, %d40
unsupttte4_145:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a089cb  ! 216: FDIVd	fdivd	%f2, %f42, %f20
	.word 0xe597e010  ! 217: LDQFA_I	-	[%r31, 0x0010], %f18
	.word 0xa7803a5e  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x1a5e, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_4_146:
    set user_data_start, %o7
	.word 0x93902001  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    set 0x3711, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b407f2  ! 221: PDISTN	fmean16	%d16, %d18, %d42
	.word 0x97a04dc8  ! 222: FdMULq	fdmulq	
jmptr_4_147:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa7824000  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r0, %-
	.word 0xe4800a60  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
unsupttte4_149:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87acca54  ! 226: FCMPd	fcmpd	%fcc<n>, %f50, %f20
	.word 0x9f8025e2  ! 227: SIR	sir	0x05e2
	.word 0x8d902535  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x0535, %pstate
	.word 0xd88fe010  ! 229: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
jmptr_4_150:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_4_151:
	set 0xab681a2b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ce1  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x1ce1, %pstate
	fbule,a,pn	%fcc0,  skip_4_152
	.word 0xc36aff10  ! 1: PREFETCH_I	prefetch	[%r11 + 0xffffff10], #one_read
.align 512
skip_4_152:
	.word 0xc3682ab7  ! 233: PREFETCH_I	prefetch	[%r0 + 0x0ab7], #one_read
splash_hpstate_4_153:
	.word 0x8198203f  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x003f, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_154)+56, 16, 16)) -> intp(4,1,3)
xir_4_154:
	.word 0xa9807313  ! 236: WR_SET_SOFTINT_I	wr	%r1, 0x1313, %set_softint
	.word 0x8d902386  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0386, %pstate
	.word 0x8d902a8b  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_155)+48, 16, 16)) -> intp(4,1,3)
xir_4_155:
	.word 0xa981288a  ! 239: WR_SET_SOFTINT_I	wr	%r4, 0x088a, %set_softint
	.word 0x9f802cba  ! 240: SIR	sir	0x0cba
fpinit_4_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 241: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x9f802a57  ! 242: SIR	sir	0x0a57
	.word 0x9968c000  ! 243: SDIVX_R	sdivx	%r3, %r0, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996c2d91  ! 244: SDIVX_I	sdivx	%r16, 0x0d91, %r12
	.word 0xe257e000  ! 245: LDSH_I	ldsh	[%r31 + 0x0000], %r17
	.word 0xe297e010  ! 246: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0xa785000a  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r10, %-
    set 0x6d9, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b007ec  ! 248: PDISTN	fmean16	%d0, %d12, %d18
	.word 0x9953c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_4_159:
	nop
	setx 0xfffff6e6fffff7b7, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_160)+32, 16, 16)) -> intp(4,1,3)
xir_4_160:
	.word 0xa980b2a0  ! 252: WR_SET_SOFTINT_I	wr	%r2, 0x12a0, %set_softint
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_162)+0, 16, 16)) -> intp(4,1,3)
xir_4_162:
	.word 0xa984a2de  ! 254: WR_SET_SOFTINT_I	wr	%r18, 0x02de, %set_softint
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
	.word 0xa782c00c  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r12, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
unsupttte4_165:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95a249a1  ! 258: FDIVs	fdivs	%f9, %f1, %f10
tagged_4_166:
	tsubcctv %r6, 0x1cb3, %r11
	.word 0xe607e0fc  ! 259: LDUW_I	lduw	[%r31 + 0x00fc], %r19
	.word 0xa7850005  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r5, %-
	.word 0xa781c011  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r17, %-
	.word 0x8d9021fc  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x01fc, %pstate
	.word 0xa1a309e8  ! 263: FDIVq	dis not found

cwp_4_169:
    set user_data_start, %o7
	.word 0x93902003  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_4_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d934008  ! 266: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_4_171:
    set user_data_start, %o7
	.word 0x93902000  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_4_172:
    set user_data_start, %o7
	.word 0x93902007  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_4_173:
	set 0x0e45ef68, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fbe,a,pn	%fcc0,  skip_4_174
	.word 0xa9a4c9c4  ! 1: FDIVd	fdivd	%f50, %f4, %f20
.align 128
skip_4_174:
	.word 0x93a489d0  ! 271: FDIVd	fdivd	%f18, %f16, %f40
fpinit_4_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 272: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_4_176:
    set user_data_start, %o7
	.word 0x93902007  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    set 0x2edb, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b4c7e2  ! 275: PDISTN	fmean16	%d50, %d2, %d12
cwp_4_177:
    set user_data_start, %o7
	.word 0x93902003  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa7848004  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
change_to_randtl_4_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_179:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_180)+16, 16, 16)) -> intp(4,1,3)
xir_4_180:
	.word 0xa9832e85  ! 279: WR_SET_SOFTINT_I	wr	%r12, 0x0e85, %set_softint
	setx 0x506363835effdc63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
unsupttte4_182:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ed0024  ! 281: PREFETCHA_R	prefetcha	[%r20, %r4] 0x01, #one_read
unsupttte4_183:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93b00491  ! 282: FCMPLE32	fcmple32	%d0, %d48, %r9
intveclr_4_184:
	setx 0x5c5df1774093e3ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_185:
	setx 0x9ea99adfe95d633d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_4_186:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_4_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 286: FDIVs	fdivs	%f0, %f4, %f6
	bl,a	 skip_4_188
	.word 0xe43c0014  ! 1: STD_R	std	%r18, [%r16 + %r20]
.align 512
skip_4_188:
	.word 0xe03c0007  ! 287: STD_R	std	%r16, [%r16 + %r7]
	.word 0x9f802162  ! 288: SIR	sir	0x0162
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_4_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83279  ! 290: PREFETCHA_I	prefetcha	[%r0, + 0xfffff279] %asi, #one_read
	.word 0xa781c00a  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r10, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_192)+48, 16, 16)) -> intp(4,1,3)
xir_4_192:
	.word 0xa981b36a  ! 292: WR_SET_SOFTINT_I	wr	%r6, 0x136a, %set_softint
splash_hpstate_4_193:
	.word 0x81982f1d  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1d, %hpstate
unsupttte4_194:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a149d2  ! 294: FDIVd	fdivd	%f36, %f18, %f42
    set 0x101a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b487f3  ! 295: PDISTN	fmean16	%d18, %d50, %d12
    set 0xc13, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b287f1  ! 296: PDISTN	fmean16	%d10, %d48, %d50
memptr_4_195:
	set user_data_start, %r31
	.word 0x8582aa7e  ! 297: WRCCR_I	wr	%r10, 0x0a7e, %ccr
	.word 0xd4800c60  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	bneg  	 skip_4_196
	.word 0xdbe18026  ! 1: CASA_I	casa	[%r6] 0x 1, %r6, %r13
.align 512
skip_4_196:
	.word 0xd23b000a  ! 299: STD_R	std	%r9, [%r12 + %r10]
    set 0x1249, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b407e3  ! 300: PDISTN	fmean16	%d16, %d34, %d20
cwp_4_197:
    set user_data_start, %o7
	.word 0x93902006  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa7810013  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r19, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
unsupttte4_199:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ad0a42  ! 304: FCMPd	fcmpd	%fcc<n>, %f20, %f2
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_200)+24, 16, 16)) -> intp(4,1,3)
xir_4_200:
	.word 0xa982a98c  ! 305: WR_SET_SOFTINT_I	wr	%r10, 0x098c, %set_softint
	.word 0xd6dfe020  ! 306: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96ce17b  ! 307: SDIVX_I	sdivx	%r19, 0x017b, %r20
	.word 0x9145c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r8
change_to_randtl_4_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_202:
	.word 0x8f902000  ! 309: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
cwp_4_203:
    set user_data_start, %o7
	.word 0x93902007  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_htba_4_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_4_205:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x91d020b5  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x9f80365c  ! 314: SIR	sir	0x165c
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_206:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 315: RDPC	rd	%pc, %r13
tagged_4_207:
	taddcctv %r6, 0x14b8, %r16
	.word 0xd407e02e  ! 316: LDUW_I	lduw	[%r31 + 0x002e], %r10
	fbe skip_4_208
	.word 0xa3b444cd  ! 1: FCMPNE32	fcmpne32	%d48, %d44, %r17
.align 1024
skip_4_208:
	.word 0xdbe5002c  ! 317: CASA_I	casa	[%r20] 0x 1, %r12, %r13
	.word 0xd64fe010  ! 318: LDSB_I	ldsb	[%r31 + 0x0010], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_209)+48, 16, 16)) -> intp(4,1,3)
xir_4_209:
	.word 0xa9852504  ! 319: WR_SET_SOFTINT_I	wr	%r20, 0x0504, %set_softint
	rd %pc, %r19
	add %r19, (ivw_4_210-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_210:
	.word 0x91920012  ! 320: WRPR_PIL_R	wrpr	%r8, %r18, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_211)+56, 16, 16)) -> intp(4,1,3)
xir_4_211:
	.word 0xa9827c93  ! 321: WR_SET_SOFTINT_I	wr	%r9, 0x1c93, %set_softint
intveclr_4_212:
	setx 0x16f81d7facc507ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_4_213:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_4_214:
    set user_data_start, %o7
	.word 0x93902004  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_4_215:
	taddcctv %r16, 0x139f, %r18
	.word 0xd607e0e0  ! 325: LDUW_I	lduw	[%r31 + 0x00e0], %r11
	.word 0x9f803878  ! 326: SIR	sir	0x1878
	.word 0x8d903b29  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x1b29, %pstate
splash_htba_4_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_4_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_217:
	.word 0x8f902000  ! 329: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	bcc  	 skip_4_219
	.word 0x87a98a53  ! 1: FCMPd	fcmpd	%fcc<n>, %f6, %f50
.align 32
skip_4_219:
	.word 0xe8394011  ! 331: STD_R	std	%r20, [%r5 + %r17]
fpinit_4_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 332: FCMPLE32	fcmple32	%d0, %d4, %r8
fpinit_4_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 333: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa969e194  ! 334: SDIVX_I	sdivx	%r7, 0x0194, %r20
splash_tba_4_223:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x335a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b487f4  ! 336: PDISTN	fmean16	%d18, %d20, %d20
splash_tba_4_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_4_225:
	taddcctv %r5, 0x130d, %r8
	.word 0xe207e08c  ! 338: LDUW_I	lduw	[%r31 + 0x008c], %r17
splash_lsu_4_226:
	set 0x5f2cc623, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x394d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b447f4  ! 341: PDISTN	fmean16	%d48, %d20, %d12
unsupttte4_227:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93b50491  ! 342: FCMPLE32	fcmple32	%d20, %d48, %r9
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_229)+24, 16, 16)) -> intp(4,1,3)
xir_4_229:
	.word 0xa98421bd  ! 344: WR_SET_SOFTINT_I	wr	%r16, 0x01bd, %set_softint
	.word 0xda9fd040  ! 345: LDDA_R	ldda	[%r31, %r0] 0x82, %r13
cwp_4_230:
    set user_data_start, %o7
	.word 0x93902002  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_4_231:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_4_232:
    set user_data_start, %o7
	.word 0x93902007  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f803fb8  ! 350: SIR	sir	0x1fb8
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f802991  ! 352: SIR	sir	0x0991
	.word 0xdadfe020  ! 353: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cfd5a  ! 354: SDIVX_I	sdivx	%r19, 0xfffffd5a, %r12
	.word 0x9f803f93  ! 355: SIR	sir	0x1f93
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_236)+16, 16, 16)) -> intp(4,1,3)
xir_4_236:
	.word 0xa984e2d0  ! 356: WR_SET_SOFTINT_I	wr	%r19, 0x02d0, %set_softint
splash_tba_4_237:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa8d4eef0  ! 358: UMULcc_I	umulcc 	%r19, 0x0ef0, %r20
    set 0x40b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b487e8  ! 359: PDISTN	fmean16	%d18, %d8, %d16
jmptr_4_238:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800a60  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
	.word 0xa7848010  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0x936d0006  ! 364: SDIVX_R	sdivx	%r20, %r6, %r9
splash_lsu_4_240:
	set 0x2adff75a, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_4_241:
	set 0x60740000, %r31
	.word 0x8581aab6  ! 366: WRCCR_I	wr	%r6, 0x0ab6, %ccr
	fbue skip_4_242
	fbn skip_4_242
.align 1024
skip_4_242:
	.word 0x24c90001  ! 367: BRLEZ	brlez,a,pt	%r4,<label_0x90001>
fpinit_4_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 368: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01965  ! 369: FqTOd	dis not found

    set 0x394e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b087f3  ! 370: PDISTN	fmean16	%d2, %d50, %d40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91686a82  ! 371: SDIVX_I	sdivx	%r1, 0x0a82, %r8
splash_tba_4_246:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_4_247:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_248)+24, 16, 16)) -> intp(4,1,3)
xir_4_248:
	.word 0xa9837bef  ! 374: WR_SET_SOFTINT_I	wr	%r13, 0x1bef, %set_softint
	.word 0xe86fe016  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x0016]
splash_tba_4_249:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7814011  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r17, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01971  ! 378: FqTOd	dis not found

	.word 0x9a84c013  ! 379: ADDcc_R	addcc 	%r19, %r19, %r13
memptr_4_252:
	set user_data_start, %r31
	.word 0x8584f639  ! 380: WRCCR_I	wr	%r19, 0x1639, %ccr
splash_htba_4_253:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa884c013  ! 382: ADDcc_R	addcc 	%r19, %r19, %r20
fpinit_4_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 383: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_255)+8, 16, 16)) -> intp(4,1,3)
xir_4_255:
	.word 0xa984f859  ! 384: WR_SET_SOFTINT_I	wr	%r19, 0x1859, %set_softint
debug_4_256:
	nop
debug_iva_4_256:
	ta T_CHANGE_HPRIV
	set 0xf46d933, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+24), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_257)+40, 16, 16)) -> intp(4,1,3)
xir_4_257:
	.word 0xa984f6eb  ! 386: WR_SET_SOFTINT_I	wr	%r19, 0x16eb, %set_softint
tagged_4_258:
	tsubcctv %r10, 0x1cce, %r11
	.word 0xe007e0cc  ! 387: LDUW_I	lduw	[%r31 + 0x00cc], %r16
memptr_4_259:
	set 0x60740000, %r31
	.word 0x858425d6  ! 388: WRCCR_I	wr	%r16, 0x05d6, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_260:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 389: RDPC	rd	%pc, %r17
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_4_262:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7828013  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r19, %-
intveclr_4_264:
	setx 0xe3f5274fb00f3978, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_4_265:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9038c8  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x18c8, %pstate
splash_htba_4_266:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7840012  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r18, %-
	.word 0xa780c014  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r20, %-
	.word 0xa7810012  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r18, %-
intveclr_4_270:
	setx 0xf050c4f26ec8f1c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
fpinit_2_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 1: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xa5a01a70  ! 2: FqTOi	fqtoi	
	.word 0x9f8020f2  ! 3: SIR	sir	0x00f2
splash_tba_2_1:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda8008a0  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_decr_2_2:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7840013  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r19, %-
tagged_2_3:
	taddcctv %r17, 0x1c1d, %r16
	.word 0xda07e0d0  ! 7: LDUW_I	lduw	[%r31 + 0x00d0], %r13
splash_tba_2_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_5:
	nop
debug_dva_2_5:
	ta T_CHANGE_HPRIV
	set 0xce889f71, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0x1c13, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb4c7f1  ! 10: PDISTN	fmean16	%d50, %d48, %d44
	.word 0xe6800a80  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r19
	.word 0x9f802eee  ! 12: SIR	sir	0x0eee
tagged_2_6:
	tsubcctv %r17, 0x1c3c, %r18
	.word 0xe607e018  ! 13: LDUW_I	lduw	[%r31 + 0x0018], %r19
invtsb_2_7:
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
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_8)+56, 16, 16)) -> intp(2,1,3)
xir_2_8:
	.word 0xa984b79b  ! 15: WR_SET_SOFTINT_I	wr	%r18, 0x179b, %set_softint
jmptr_2_9:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_2_10:
    set user_data_start, %o7
	.word 0x93902004  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
jmptr_2_11:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_12)+0, 16, 16)) -> intp(2,1,3)
xir_2_12:
	.word 0xa9846ebb  ! 19: WR_SET_SOFTINT_I	wr	%r17, 0x0ebb, %set_softint
tagged_2_13:
	taddcctv %r12, 0x1768, %r7
	.word 0xe607e08c  ! 20: LDUW_I	lduw	[%r31 + 0x008c], %r19
	.word 0xe68fe030  ! 21: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
memptr_2_14:
	set 0x60140000, %r31
	.word 0x85833d66  ! 22: WRCCR_I	wr	%r12, 0x1d66, %ccr
invtsb_2_15:
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
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x36a4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b047f0  ! 24: PDISTN	fmean16	%d32, %d16, %d48
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_16)+0, 16, 16)) -> intp(2,1,3)
xir_2_16:
	.word 0xa98461ca  ! 25: WR_SET_SOFTINT_I	wr	%r17, 0x01ca, %set_softint
cwp_2_17:
    set user_data_start, %o7
	.word 0x93902002  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
fpinit_2_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 27: FDIVs	fdivs	%f0, %f4, %f4
splash_htba_2_19:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
invtsb_2_20:
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
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0x4e73a7ede10a0119, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa7806e69  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x0e69, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c78d0  ! 33: SDIVX_I	sdivx	%r17, 0xfffff8d0, %r20
DS_2_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe5327592  ! 1: STQF_I	-	%f18, [0x1592, %r9]
	normalw
	.word 0x93458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r9
    set 0x28ff, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b187e1  ! 35: PDISTN	fmean16	%d6, %d32, %d40
tagged_2_24:
	tsubcctv %r20, 0x1929, %r13
	.word 0xe007e03c  ! 36: LDUW_I	lduw	[%r31 + 0x003c], %r16
	.word 0x83d02034  ! 37: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9f8030a5  ! 38: SIR	sir	0x10a5
cwp_2_25:
    set user_data_start, %o7
	.word 0x93902000  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_2_26:
	tsubcctv %r16, 0x1b64, %r18
	.word 0xe007e0ec  ! 40: LDUW_I	lduw	[%r31 + 0x00ec], %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d28a3  ! 41: SDIVX_I	sdivx	%r20, 0x08a3, %r8
	.word 0x8d902eb6  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0eb6, %pstate
	.word 0xe48008a0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4cfe030  ! 44: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r18
cwp_2_28:
    set user_data_start, %o7
	.word 0x93902001  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_decr_2_29:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7848003  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r3, %-
	.word 0x9f803d59  ! 47: SIR	sir	0x1d59
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_30)+56, 16, 16)) -> intp(2,1,3)
xir_2_30:
	.word 0xa9842ba0  ! 48: WR_SET_SOFTINT_I	wr	%r16, 0x0ba0, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_2_31:
	taddcctv %r4, 0x1bb7, %r16
	.word 0xe407e00e  ! 50: LDUW_I	lduw	[%r31 + 0x000e], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_32)+32, 16, 16)) -> intp(2,1,3)
xir_2_32:
	.word 0xa982e371  ! 51: WR_SET_SOFTINT_I	wr	%r11, 0x0371, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_33)+8, 16, 16)) -> intp(2,1,3)
xir_2_33:
	.word 0xa9843e6f  ! 52: WR_SET_SOFTINT_I	wr	%r16, 0x1e6f, %set_softint
	.word 0xe48008a0  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
invtsb_2_34:
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
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	.word 0x93a4c9c5  ! 55: FDIVd	fdivd	%f50, %f36, %f40
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_36) + 24, 16, 16)) -> intp(2,0,16)
intvec_2_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_2_37:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7840011  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r17, %-
    set 0x688, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b287f3  ! 58: PDISTN	fmean16	%d10, %d50, %d12
splash_tba_2_38:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa8847cd5  ! 60: ADDcc_I	addcc 	%r17, 0xfffffcd5, %r20
fpinit_2_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 61: FDIVs	fdivs	%f0, %f4, %f4
splash_htba_2_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa7a00553  ! 63: FSQRTd	fsqrt	
splash_decr_2_41:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7808007  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ca748  ! 65: SDIVX_I	sdivx	%r18, 0x0748, %r9
	.word 0x9448c013  ! 66: MULX_R	mulx 	%r3, %r19, %r10
tagged_2_43:
	taddcctv %r1, 0x1110, %r16
	.word 0xd207e052  ! 67: LDUW_I	lduw	[%r31 + 0x0052], %r9
splash_lsu_2_44:
	set 0x4d416b3c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_45:
	set 0xaa7d1d92, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_46:
	.word 0x8f902000  ! 70: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x3975, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b247f0  ! 71: PDISTN	fmean16	%d40, %d16, %d12
pmu_2_47:
	nop
	setx 0xfffff792fffff855, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_2_48:
	tsubcctv %r10, 0x14a4, %r13
	.word 0xe407e014  ! 73: LDUW_I	lduw	[%r31 + 0x0014], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_49)+32, 16, 16)) -> intp(2,1,3)
xir_2_49:
	.word 0xa981a978  ! 74: WR_SET_SOFTINT_I	wr	%r6, 0x0978, %set_softint
splash_decr_2_50:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa784c001  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r1, %-
	.word 0x87aa8a51  ! 76: FCMPd	fcmpd	%fcc<n>, %f10, %f48
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0xa2f88014  ! 78: SDIVcc_R	sdivcc 	%r2, %r20, %r17
invtsb_2_52:
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
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e030  ! 80: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
	.word 0x946c6dd8  ! 81: UDIVX_I	udivx 	%r17, 0x0dd8, %r10
splash_decr_2_53:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7844003  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r3, %-
splash_htba_2_54:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_2_55:
    set user_data_start, %o7
	.word 0x93902005  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
cwp_2_56:
    set user_data_start, %o7
	.word 0x93902004  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87a88a31  ! 88: FCMPs	fcmps	%fcc<n>, %f2, %f17
    set 0x2f0b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b287f3  ! 89: PDISTN	fmean16	%d10, %d50, %d10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_57)+24, 16, 16)) -> intp(2,1,3)
xir_2_57:
	.word 0xa981f03e  ! 90: WR_SET_SOFTINT_I	wr	%r7, 0x103e, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_58) + 32, 16, 16)) -> intp(5,0,0)
intvec_2_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
invtsb_2_59:
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
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe2800c00  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
	.word 0x9f8024fe  ! 94: SIR	sir	0x04fe
splash_lsu_2_60:
	set 0xc9b573c4, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_61:
	set 0x60140000, %r31
	.word 0x85806476  ! 96: WRCCR_I	wr	%r1, 0x0476, %ccr
	.word 0x8d902d23  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0d23, %pstate
	.word 0xa7a449ab  ! 98: FDIVs	fdivs	%f17, %f11, %f19
    set 0x776, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b0c7e7  ! 99: PDISTN	fmean16	%d34, %d38, %d18
fpinit_2_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 100: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xa268a373  ! 101: UDIVX_I	udivx 	%r2, 0x0373, %r17
    set 0x1320, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b347e1  ! 102: PDISTN	fmean16	%d44, %d32, %d42
	.word 0x99b404d3  ! 103: FCMPNE32	fcmpne32	%d16, %d50, %r12
invtsb_2_65:
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
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_2_66:
	set 0xe4d833b3, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x96fb4014  ! 107: SDIVcc_R	sdivcc 	%r13, %r20, %r11
cwp_2_67:
    set user_data_start, %o7
	.word 0x93902001  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_2_68:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
invtsb_2_69:
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
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_2_70:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1fdb, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b307e3  ! 112: PDISTN	fmean16	%d12, %d34, %d8
cwp_2_71:
    set user_data_start, %o7
	.word 0x93902002  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_htba_2_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_2_73:
	.word 0x81982a85  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a85, %hpstate
splash_htba_2_74:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80237d  ! 117: SIR	sir	0x037d
splash_htba_2_75:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_2_76:
	tsubcctv %r18, 0x14a5, %r0
	.word 0xe407e0f9  ! 119: LDUW_I	lduw	[%r31 + 0x00f9], %r18
	.word 0xa9a449d0  ! 120: FDIVd	fdivd	%f48, %f16, %f20
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd21fe020  ! 122: LDD_I	ldd	[%r31 + 0x0020], %r9
    set 0x1a6b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b287ea  ! 123: PDISTN	fmean16	%d10, %d10, %d48
splash_lsu_2_79:
	set 0x20735f5f, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800c40  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r17
splash_decr_2_80:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7808003  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r3, %-
invtsb_2_81:
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
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d902589  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x0589, %pstate
invtsb_2_82:
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
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_2_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d92800d  ! 131: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
cwp_2_84:
    set user_data_start, %o7
	.word 0x93902002  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
invtsb_2_85:
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
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_2_86:
	tsubcctv %r4, 0x18ab, %r12
	.word 0xe207e0f4  ! 134: LDUW_I	lduw	[%r31 + 0x00f4], %r17
splash_lsu_2_87:
	set 0xb50b717b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe020  ! 136: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r17
	.word 0x87acca51  ! 137: FCMPd	fcmpd	%fcc<n>, %f50, %f48
	.word 0x24c94001  ! 138: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
change_to_randtl_2_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_90:
	.word 0x8f902000  ! 139: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd68008a0  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_lsu_2_91:
	set 0xcf45fb00, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a2cdc8  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_2_92:
	set 0x60340000, %r31
	.word 0x8584f40c  ! 144: WRCCR_I	wr	%r19, 0x140c, %ccr
	.word 0xd097e010  ! 145: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
splash_htba_2_93:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x95a509d2  ! 147: FDIVd	fdivd	%f20, %f18, %f10
    set 0x2b57, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b087e7  ! 148: PDISTN	fmean16	%d2, %d38, %d20
jmptr_2_94:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_2_95:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe010  ! 151: LDUB_I	ldub	[%r31 + 0x0010], %r13
    set 0x11fa, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b507e2  ! 152: PDISTN	fmean16	%d20, %d2, %d18
splash_htba_2_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802715  ! 154: SIR	sir	0x0715
invtsb_2_97:
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
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
splash_decr_2_98:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7844012  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r18, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996d2dc0  ! 157: SDIVX_I	sdivx	%r20, 0x0dc0, %r12
jmptr_2_100:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e004  ! 159: STF_I	st	%f19, [0x0004, %r31]
	.word 0x9f8035f8  ! 160: SIR	sir	0x15f8
cwp_2_101:
    set user_data_start, %o7
	.word 0x93902004  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d903c72  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x1c72, %pstate
    set 0x2e8b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b407e0  ! 163: PDISTN	fmean16	%d16, %d0, %d12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01970  ! 164: FqTOd	dis not found

	.word 0xc3ec0033  ! 165: PREFETCHA_R	prefetcha	[%r16, %r19] 0x01, #one_read
	.word 0x8d902241  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x0241, %pstate
	.word 0xa4680012  ! 167: UDIVX_R	udivx 	%r0, %r18, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_104)+56, 16, 16)) -> intp(2,1,3)
xir_2_104:
	.word 0xa984e473  ! 168: WR_SET_SOFTINT_I	wr	%r19, 0x0473, %set_softint
	setx 0xb290823786c52652, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_2_106:
    set user_data_start, %o7
	.word 0x93902003  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
jmptr_2_107:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1697cca  ! 172: SDIVX_I	sdivx	%r5, 0xfffffcca, %r16
splash_tba_2_109:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_2_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83ca6  ! 174: PREFETCHA_I	prefetcha	[%r0, + 0xfffffca6] %asi, #one_read
	setx 0xd669a0ce82b7868a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_112:
	set 0x60140000, %r31
	.word 0x8580206a  ! 176: WRCCR_I	wr	%r0, 0x006a, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cb6d2  ! 177: SDIVX_I	sdivx	%r18, 0xfffff6d2, %r13
cwp_2_114:
    set user_data_start, %o7
	.word 0x93902007  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
    set 0x9a4, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb307f3  ! 179: PDISTN	fmean16	%d12, %d50, %d44
splash_tba_2_115:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x1ae2, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b487f0  ! 181: PDISTN	fmean16	%d18, %d16, %d42
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_2_117:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_2_118:
    set user_data_start, %o7
	.word 0x93902006  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
donret_2_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_119-donret_2_119-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003a6a92 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x105, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_119:
	.word 0xe2ffe088  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x0088] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_120)+0, 16, 16)) -> intp(2,1,3)
xir_2_120:
	.word 0xa984e169  ! 186: WR_SET_SOFTINT_I	wr	%r19, 0x0169, %set_softint
	.word 0xe28008a0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_htba_2_121:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80219b  ! 189: SIR	sir	0x019b
debug_2_122:
	nop
debug_dva_2_122:
	ta T_CHANGE_HPRIV
	set 0x40808a1, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_2_123:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_124)+16, 16, 16)) -> intp(2,1,3)
xir_2_124:
	.word 0xa98225cf  ! 192: WR_SET_SOFTINT_I	wr	%r8, 0x05cf, %set_softint
	setx 0xa28de5503be7e331, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_126) + 48, 16, 16)) -> intp(1,0,17)
intvec_2_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_decr_2_127:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa784c013  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r19, %-
memptr_2_128:
	set 0x60740000, %r31
	.word 0x8582b3a1  ! 196: WRCCR_I	wr	%r10, 0x13a1, %ccr
    set 0x28de, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b147ea  ! 197: PDISTN	fmean16	%d36, %d10, %d12
splash_decr_2_129:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7850008  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r8, %-
splash_htba_2_130:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_2_131:
    set user_data_start, %o7
	.word 0x93902007  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_hpstate_2_132:
	.word 0x81982ba7  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ba7, %hpstate
invtsb_2_133:
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
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_2_134:
    set user_data_start, %o7
	.word 0x93902001  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_135)+24, 16, 16)) -> intp(2,1,3)
xir_2_135:
	.word 0xa9843bc9  ! 204: WR_SET_SOFTINT_I	wr	%r16, 0x1bc9, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_2_136:
	tsubcctv %r5, 0x118e, %r19
	.word 0xd407e066  ! 206: LDUW_I	lduw	[%r31 + 0x0066], %r10
memptr_2_137:
	set 0x60140000, %r31
	.word 0x858421a0  ! 207: WRCCR_I	wr	%r16, 0x01a0, %ccr
cwp_2_138:
    set user_data_start, %o7
	.word 0x93902006  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc3ec4026  ! 209: PREFETCHA_R	prefetcha	[%r17, %r6] 0x01, #one_read
invtsb_2_140:
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
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_2_141:
    set user_data_start, %o7
	.word 0x93902000  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
memptr_2_142:
	set 0x60140000, %r31
	.word 0x8584f3f6  ! 212: WRCCR_I	wr	%r19, 0x13f6, %ccr
splash_htba_2_143:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_2_144:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x528, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b1c7e7  ! 215: PDISTN	fmean16	%d38, %d38, %d42
	.word 0xa1a449c2  ! 216: FDIVd	fdivd	%f48, %f2, %f16
	.word 0xe597e000  ! 217: LDQFA_I	-	[%r31, 0x0000], %f18
	.word 0xa783655e  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r13, 0x055e, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_2_146:
    set user_data_start, %o7
	.word 0x93902001  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    set 0x64a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b207ea  ! 221: PDISTN	fmean16	%d8, %d10, %d10
	.word 0x93a50dd3  ! 222: FdMULq	fdmulq	
jmptr_2_147:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
splash_decr_2_148:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7808007  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r7, %-
	.word 0xe48008a0  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa9a409b0  ! 226: FDIVs	fdivs	%f16, %f16, %f20
	.word 0x9f803fbe  ! 227: SIR	sir	0x1fbe
	.word 0x8d9035d9  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x15d9, %pstate
	.word 0xd88fe010  ! 229: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
jmptr_2_150:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_2_151:
	set 0x8154b955, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903dd5  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x1dd5, %pstate
	.word 0xa9b304d2  ! 233: FCMPNE32	fcmpne32	%d12, %d18, %r20
splash_hpstate_2_153:
	.word 0x81982b65  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b65, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_154)+8, 16, 16)) -> intp(2,1,3)
xir_2_154:
	.word 0xa98437bf  ! 236: WR_SET_SOFTINT_I	wr	%r16, 0x17bf, %set_softint
	.word 0x8d902b60  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0b60, %pstate
	.word 0x8d902fe0  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x0fe0, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_155)+24, 16, 16)) -> intp(2,1,3)
xir_2_155:
	.word 0xa980eace  ! 239: WR_SET_SOFTINT_I	wr	%r3, 0x0ace, %set_softint
	.word 0x9f803fa3  ! 240: SIR	sir	0x1fa3
fpinit_2_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83225  ! 241: PREFETCHA_I	prefetcha	[%r0, + 0xfffff225] %asi, #one_read
	.word 0x9f8037da  ! 242: SIR	sir	0x17da
	.word 0xa56c000d  ! 243: SDIVX_R	sdivx	%r16, %r13, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa168fafa  ! 244: SDIVX_I	sdivx	%r3, 0xfffffafa, %r16
	.word 0xe257e020  ! 245: LDSH_I	ldsh	[%r31 + 0x0020], %r17
	.word 0xe297e010  ! 246: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
splash_decr_2_158:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa781c013  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r19, %-
    set 0x2504, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b307f3  ! 248: PDISTN	fmean16	%d12, %d50, %d20
	.word 0x9553c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_2_159:
	nop
	setx 0xfffff5befffff02e, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_160)+56, 16, 16)) -> intp(2,1,3)
xir_2_160:
	.word 0xa9822836  ! 252: WR_SET_SOFTINT_I	wr	%r8, 0x0836, %set_softint
invtsb_2_161:
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
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_162)+40, 16, 16)) -> intp(2,1,3)
xir_2_162:
	.word 0xa982e326  ! 254: WR_SET_SOFTINT_I	wr	%r11, 0x0326, %set_softint
invtsb_2_163:
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
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
splash_decr_2_164:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7848001  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r1, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
	.word 0xa9b40492  ! 258: FCMPLE32	fcmple32	%d16, %d18, %r20
tagged_2_166:
	tsubcctv %r17, 0x1e45, %r9
	.word 0xe607e050  ! 259: LDUW_I	lduw	[%r31 + 0x0050], %r19
splash_decr_2_167:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7840003  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r3, %-
splash_decr_2_168:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa784c005  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r5, %-
	.word 0x8d902150  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x0150, %pstate
	.word 0x95a449f1  ! 263: FDIVq	dis not found

cwp_2_169:
    set user_data_start, %o7
	.word 0x93902005  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_2_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d924007  ! 266: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_2_171:
    set user_data_start, %o7
	.word 0x93902000  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
cwp_2_172:
    set user_data_start, %o7
	.word 0x93902004  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_2_173:
	set 0xb8370eb0, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc36cb248  ! 271: PREFETCH_I	prefetch	[%r18 + 0xfffff248], #one_read
fpinit_2_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83248  ! 272: PREFETCHA_I	prefetcha	[%r0, + 0xfffff248] %asi, #one_read
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_2_176:
    set user_data_start, %o7
	.word 0x93902005  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    set 0x165e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b447e5  ! 275: PDISTN	fmean16	%d48, %d36, %d18
cwp_2_177:
    set user_data_start, %o7
	.word 0x93902006  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_decr_2_178:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa784c010  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r16, %-
change_to_randtl_2_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_179:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_180)+32, 16, 16)) -> intp(2,1,3)
xir_2_180:
	.word 0xa9846ffe  ! 279: WR_SET_SOFTINT_I	wr	%r17, 0x0ffe, %set_softint
	setx 0x3fc0ed642e15c598, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba189b3  ! 281: FDIVs	fdivs	%f6, %f19, %f13
	.word 0x9ba289ad  ! 282: FDIVs	fdivs	%f10, %f13, %f13
intveclr_2_184:
	setx 0xed321b91bd39a193, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_185:
	setx 0x59824a7a5359b47b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_2_186:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_2_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 286: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x24cc8001  ! 287: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x9f803582  ! 288: SIR	sir	0x1582
invtsb_2_189:
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
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_2_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 290: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_decr_2_191:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7814014  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r20, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_192)+16, 16, 16)) -> intp(2,1,3)
xir_2_192:
	.word 0xa983689a  ! 292: WR_SET_SOFTINT_I	wr	%r13, 0x089a, %set_softint
splash_hpstate_2_193:
	.word 0x819827c5  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c5, %hpstate
	.word 0x99a089d1  ! 294: FDIVd	fdivd	%f2, %f48, %f12
    set 0x242b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b207f2  ! 295: PDISTN	fmean16	%d8, %d18, %d16
    set 0x340, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b207e7  ! 296: PDISTN	fmean16	%d8, %d38, %d10
memptr_2_195:
	set user_data_start, %r31
	.word 0x8582778a  ! 297: WRCCR_I	wr	%r9, 0x178a, %ccr
	.word 0xd48008a0  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x99a209d0  ! 299: FDIVd	fdivd	%f8, %f16, %f12
    set 0x3296, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b507e2  ! 300: PDISTN	fmean16	%d20, %d2, %d48
cwp_2_197:
    set user_data_start, %o7
	.word 0x93902007  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_decr_2_198:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7848006  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r6, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xc3eb0033  ! 304: PREFETCHA_R	prefetcha	[%r12, %r19] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_200)+0, 16, 16)) -> intp(2,1,3)
xir_2_200:
	.word 0xa982bedc  ! 305: WR_SET_SOFTINT_I	wr	%r10, 0x1edc, %set_softint
	.word 0xd6dfe000  ! 306: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936c7631  ! 307: SDIVX_I	sdivx	%r17, 0xfffff631, %r9
	.word 0xa945c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r20
change_to_randtl_2_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_202:
	.word 0x8f902001  ! 309: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_2_203:
    set user_data_start, %o7
	.word 0x93902004  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_htba_2_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_2_205:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x91d02033  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f803bf7  ! 314: SIR	sir	0x1bf7
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_206:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 315: RDPC	rd	%pc, %r12
tagged_2_207:
	taddcctv %r12, 0x1a06, %r2
	.word 0xd407e080  ! 316: LDUW_I	lduw	[%r31 + 0x0080], %r10
	.word 0x97a409c8  ! 317: FDIVd	fdivd	%f16, %f8, %f42
	.word 0xd64fe010  ! 318: LDSB_I	ldsb	[%r31 + 0x0010], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_209)+8, 16, 16)) -> intp(2,1,3)
xir_2_209:
	.word 0xa984f67c  ! 319: WR_SET_SOFTINT_I	wr	%r19, 0x167c, %set_softint
	rd %pc, %r19
	add %r19, (ivw_2_210-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_210:
	.word 0x91940014  ! 320: WRPR_PIL_R	wrpr	%r16, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_211)+32, 16, 16)) -> intp(2,1,3)
xir_2_211:
	.word 0xa9843adf  ! 321: WR_SET_SOFTINT_I	wr	%r16, 0x1adf, %set_softint
intveclr_2_212:
	setx 0xa9839b74e27e91b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_2_213:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_2_214:
    set user_data_start, %o7
	.word 0x93902004  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_2_215:
	taddcctv %r2, 0x158b, %r16
	.word 0xd607e0d4  ! 325: LDUW_I	lduw	[%r31 + 0x00d4], %r11
	.word 0x9f803144  ! 326: SIR	sir	0x1144
	.word 0x8d902d17  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x0d17, %pstate
splash_htba_2_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_2_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_217:
	.word 0x8f902001  ! 329: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
invtsb_2_218:
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
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	.word 0x39400001  ! 331: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e822a3  ! 332: PREFETCHA_I	prefetcha	[%r0, + 0x02a3] %asi, #one_read
fpinit_2_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 333: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76cb7d6  ! 334: SDIVX_I	sdivx	%r18, 0xfffff7d6, %r19
splash_tba_2_223:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3dff, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b347e3  ! 336: PDISTN	fmean16	%d44, %d34, %d20
splash_tba_2_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_2_225:
	taddcctv %r11, 0x120c, %r7
	.word 0xe207e0ec  ! 338: LDUW_I	lduw	[%r31 + 0x00ec], %r17
splash_lsu_2_226:
	set 0xbf1b9b19, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x157c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b4c7e6  ! 341: PDISTN	fmean16	%d50, %d6, %d48
	.word 0x97a289a4  ! 342: FDIVs	fdivs	%f10, %f4, %f11
invtsb_2_228:
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
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_229)+0, 16, 16)) -> intp(2,1,3)
xir_2_229:
	.word 0xa9803e62  ! 344: WR_SET_SOFTINT_I	wr	%r0, 0x1e62, %set_softint
	.word 0xda9fdc40  ! 345: LDDA_R	ldda	[%r31, %r0] 0xe2, %r13
cwp_2_230:
    set user_data_start, %o7
	.word 0x93902005  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_2_231:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_2_232:
    set user_data_start, %o7
	.word 0x93902003  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
invtsb_2_233:
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
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f802d7e  ! 350: SIR	sir	0x0d7e
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f8037e1  ! 352: SIR	sir	0x17e1
	.word 0xdadfe000  ! 353: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36cea2d  ! 354: SDIVX_I	sdivx	%r19, 0x0a2d, %r17
	.word 0x9f802de7  ! 355: SIR	sir	0x0de7
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_236)+8, 16, 16)) -> intp(2,1,3)
xir_2_236:
	.word 0xa982f06f  ! 356: WR_SET_SOFTINT_I	wr	%r11, 0x106f, %set_softint
splash_tba_2_237:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa6d17150  ! 358: UMULcc_I	umulcc 	%r5, 0xfffff150, %r19
    set 0x816, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407f2  ! 359: PDISTN	fmean16	%d16, %d18, %d44
jmptr_2_238:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd28008a0  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_decr_2_239:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa784c011  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r17, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0x9b6c0011  ! 364: SDIVX_R	sdivx	%r16, %r17, %r13
splash_lsu_2_240:
	set 0x4dd306aa, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_2_241:
	set 0x60540000, %r31
	.word 0x8581bd08  ! 366: WRCCR_I	wr	%r6, 0x1d08, %ccr
	.word 0xd23cc00d  ! 367: STD_R	std	%r9, [%r19 + %r13]
fpinit_2_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 368: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196d  ! 369: FqTOd	dis not found

    set 0x2521, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b1c7f1  ! 370: PDISTN	fmean16	%d38, %d48, %d48
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a3e46  ! 371: SDIVX_I	sdivx	%r8, 0xfffffe46, %r19
splash_tba_2_246:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_2_247:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_248)+48, 16, 16)) -> intp(2,1,3)
xir_2_248:
	.word 0xa980e28f  ! 374: WR_SET_SOFTINT_I	wr	%r3, 0x028f, %set_softint
	.word 0xe86fe0b6  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x00b6]
splash_tba_2_249:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_2_250:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7848004  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 378: FqTOd	dis not found

	.word 0xa6828014  ! 379: ADDcc_R	addcc 	%r10, %r20, %r19
memptr_2_252:
	set user_data_start, %r31
	.word 0x85852805  ! 380: WRCCR_I	wr	%r20, 0x0805, %ccr
splash_htba_2_253:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa4818012  ! 382: ADDcc_R	addcc 	%r6, %r18, %r18
fpinit_2_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82702  ! 383: PREFETCHA_I	prefetcha	[%r0, + 0x0702] %asi, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_255)+0, 16, 16)) -> intp(2,1,3)
xir_2_255:
	.word 0xa981b19c  ! 384: WR_SET_SOFTINT_I	wr	%r6, 0x119c, %set_softint
debug_2_256:
	nop
debug_iva_2_256:
	ta T_CHANGE_HPRIV
	set 0x67fb6719, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_257)+0, 16, 16)) -> intp(2,1,3)
xir_2_257:
	.word 0xa984eadf  ! 386: WR_SET_SOFTINT_I	wr	%r19, 0x0adf, %set_softint
tagged_2_258:
	tsubcctv %r17, 0x1e52, %r19
	.word 0xe007e008  ! 387: LDUW_I	lduw	[%r31 + 0x0008], %r16
memptr_2_259:
	set 0x60740000, %r31
	.word 0x85843519  ! 388: WRCCR_I	wr	%r16, 0x1519, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_260:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 389: RDPC	rd	%pc, %r20
invtsb_2_261:
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
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_2_262:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_decr_2_263:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7840009  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r9, %-
intveclr_2_264:
	setx 0xef763b2f792e7426, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_2_265:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9033a7  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x13a7, %pstate
splash_htba_2_266:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_decr_2_267:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa781c010  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r16, %-
splash_decr_2_268:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7848012  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
splash_decr_2_269:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa782800a  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r10, %-
intveclr_2_270:
	setx 0x33e5e0a9ce956338, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
fpinit_1_0:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 1: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x9ba01a6c  ! 2: FqTOi	fqtoi	
	.word 0x9f802131  ! 3: SIR	sir	0x0131
splash_tba_1_1:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 4: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xda800b40  ! 5: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r13
	.word 0xa784c012  ! 6: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
tagged_1_3:
	taddcctv %r18, 0x1722, %r18
	.word 0xda07e0b8  ! 7: LDUW_I	lduw	[%r31 + 0x00b8], %r13
splash_tba_1_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 8: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_5:
	nop
debug_dva_1_5:
	ta T_CHANGE_HPRIV
	set 0x19a608b4, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 9: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    set 0x1f7f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b487f0  ! 10: PDISTN	fmean16	%d18, %d16, %d50
	.word 0xe6800b00  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r19
	.word 0x9f8039a3  ! 12: SIR	sir	0x19a3
tagged_1_6:
	tsubcctv %r12, 0x1674, %r5
	.word 0xe607e078  ! 13: LDUW_I	lduw	[%r31 + 0x0078], %r19
	.word 0x29800001  ! 14: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_8)+8, 16, 16)) -> intp(1,1,3)
xir_1_8:
	.word 0xa981f583  ! 15: WR_SET_SOFTINT_I	wr	%r7, 0x1583, %set_softint
jmptr_1_9:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 16: JMPL_R	jmpl	%r27 + %r0, %r27
cwp_1_10:
    set user_data_start, %o7
	.word 0x93902000  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
jmptr_1_11:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 18: JMPL_R	jmpl	%r27 + %r0, %r27
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_12)+56, 16, 16)) -> intp(1,1,3)
xir_1_12:
	.word 0xa9836d37  ! 19: WR_SET_SOFTINT_I	wr	%r13, 0x0d37, %set_softint
tagged_1_13:
	taddcctv %r4, 0x1514, %r16
	.word 0xe607e0b0  ! 20: LDUW_I	lduw	[%r31 + 0x00b0], %r19
	.word 0xe68fe030  ! 21: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
memptr_1_14:
	set 0x60540000, %r31
	.word 0x85847a0c  ! 22: WRCCR_I	wr	%r17, 0x1a0c, %ccr
	.word 0x29800001  ! 23: FBL	fbl,a	<label_0x1>
    set 0x237, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b507ec  ! 24: PDISTN	fmean16	%d20, %d12, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_16)+56, 16, 16)) -> intp(1,1,3)
xir_1_16:
	.word 0xa9842b92  ! 25: WR_SET_SOFTINT_I	wr	%r16, 0x0b92, %set_softint
cwp_1_17:
    set user_data_start, %o7
	.word 0x93902004  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
fpinit_1_18:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82b92  ! 27: PREFETCHA_I	prefetcha	[%r0, + 0x0b92] %asi, #one_read
splash_htba_1_19:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 28: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x29800001  ! 29: FBL	fbl,a	<label_0x1>
	setx 0xb4a9e5bfe7b2f0ab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_21:
	.word 0x39400001  ! 30: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe88008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa782ae03  ! 32: WR_GRAPHICS_STATUS_REG_I	wr	%r10, 0x0e03, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936d33a3  ! 33: SDIVX_I	sdivx	%r20, 0xfffff3a3, %r9
DS_1_23:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd5342634  ! 1: STQF_I	-	%f10, [0x0634, %r16]
	normalw
	.word 0x99458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r12
    set 0x3460, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b007f4  ! 35: PDISTN	fmean16	%d0, %d20, %d16
tagged_1_24:
	tsubcctv %r13, 0x19b7, %r6
	.word 0xe007e060  ! 36: LDUW_I	lduw	[%r31 + 0x0060], %r16
	.word 0x91d020b4  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9f8025b6  ! 38: SIR	sir	0x05b6
cwp_1_25:
    set user_data_start, %o7
	.word 0x93902001  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_1_26:
	tsubcctv %r16, 0x1522, %r20
	.word 0xe007e0d4  ! 40: LDUW_I	lduw	[%r31 + 0x00d4], %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c399b  ! 41: SDIVX_I	sdivx	%r16, 0xfffff99b, %r18
	.word 0x8d902a07  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
	.word 0xe48008a0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe4cfe020  ! 44: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
cwp_1_28:
    set user_data_start, %o7
	.word 0x93902005  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa783000b  ! 46: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r11, %-
	.word 0x9f802f0f  ! 47: SIR	sir	0x0f0f
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_30)+0, 16, 16)) -> intp(1,1,3)
xir_1_30:
	.word 0xa981a07c  ! 48: WR_SET_SOFTINT_I	wr	%r6, 0x007c, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 49: LDX_R	ldx	[%r31 + %r0], %r18
tagged_1_31:
	taddcctv %r20, 0x17a3, %r1
	.word 0xe407e042  ! 50: LDUW_I	lduw	[%r31 + 0x0042], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_32)+40, 16, 16)) -> intp(1,1,3)
xir_1_32:
	.word 0xa980343c  ! 51: WR_SET_SOFTINT_I	wr	%r0, 0x143c, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_33)+56, 16, 16)) -> intp(1,1,3)
xir_1_33:
	.word 0xa982a4ff  ! 52: WR_SET_SOFTINT_I	wr	%r10, 0x04ff, %set_softint
	.word 0xe4800c80  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
	.word 0x29800001  ! 54: FBL	fbl,a	<label_0x1>
	.word 0xc36b390d  ! 55: PREFETCH_I	prefetch	[%r12 + 0xfffff90d], #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_36) + 56, 16, 16)) -> intp(1,0,17)
intvec_1_36:
	.word 0x39400001  ! 56: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7840014  ! 57: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r20, %-
    set 0x16ed, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb487f1  ! 58: PDISTN	fmean16	%d18, %d48, %d44
splash_tba_1_38:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 59: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9282ee6c  ! 60: ADDcc_I	addcc 	%r11, 0x0e6c, %r9
fpinit_1_39:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 61: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_htba_1_40:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 62: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa5a00552  ! 63: FSQRTd	fsqrt	
	.word 0xa7828010  ! 64: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r16, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769e15a  ! 65: SDIVX_I	sdivx	%r7, 0x015a, %r11
	.word 0x9248c011  ! 66: MULX_R	mulx 	%r3, %r17, %r9
tagged_1_43:
	taddcctv %r17, 0x1186, %r11
	.word 0xd207e074  ! 67: LDUW_I	lduw	[%r31 + 0x0074], %r9
splash_lsu_1_44:
	set 0xdf6848e9, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 68: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_45:
	set 0x8b0623ac, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 69: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_46:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_46:
	.word 0x8f902001  ! 70: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x2951, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b4c7f1  ! 71: PDISTN	fmean16	%d50, %d48, %d18
pmu_1_47:
	nop
	setx 0xfffff350fffff9f5, %g1, %g7
	.word 0xa3800007  ! 72: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
tagged_1_48:
	tsubcctv %r18, 0x1291, %r4
	.word 0xe407e01f  ! 73: LDUW_I	lduw	[%r31 + 0x001f], %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_49)+56, 16, 16)) -> intp(1,1,3)
xir_1_49:
	.word 0xa9843e5f  ! 74: WR_SET_SOFTINT_I	wr	%r16, 0x1e5f, %set_softint
	.word 0xa7820014  ! 75: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r20, %-
	.word 0xa3a4c9d0  ! 76: FDIVd	fdivd	%f50, %f16, %f48
	.word 0xe21fc000  ! 77: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0xa4fb0011  ! 78: SDIVcc_R	sdivcc 	%r12, %r17, %r18
	.word 0x29800001  ! 79: FBL	fbl,a	<label_0x1>
	.word 0xe4d7e030  ! 80: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
	.word 0xa86a3f5a  ! 81: UDIVX_I	udivx 	%r8, 0xffffff5a, %r20
	.word 0xa785000b  ! 82: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r11, %-
splash_htba_1_54:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 83: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_1_55:
    set user_data_start, %o7
	.word 0x93902006  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_1_56:
    set user_data_start, %o7
	.word 0x93902007  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe85fc000  ! 86: LDX_R	ldx	[%r31 + %r0], %r20
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 87: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87ac4a27  ! 88: FCMPs	fcmps	%fcc<n>, %f17, %f7
    set 0x157a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b507f2  ! 89: PDISTN	fmean16	%d20, %d18, %d48
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_57)+32, 16, 16)) -> intp(1,1,3)
xir_1_57:
	.word 0xa9853ea0  ! 90: WR_SET_SOFTINT_I	wr	%r20, 0x1ea0, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_58) + 16, 16, 16)) -> intp(2,0,24)
intvec_1_58:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x29800001  ! 92: FBL	fbl,a	<label_0x1>
	.word 0xe2800aa0  ! 93: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r17
	.word 0x9f802120  ! 94: SIR	sir	0x0120
splash_lsu_1_60:
	set 0x1d2eb225, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 95: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_61:
	set 0x60140000, %r31
	.word 0x85852741  ! 96: WRCCR_I	wr	%r20, 0x0741, %ccr
	.word 0x8d903735  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x1735, %pstate
	.word 0xc3ec0021  ! 98: PREFETCHA_R	prefetcha	[%r16, %r1] 0x01, #one_read
    set 0x17ff, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b4c7e4  ! 99: PDISTN	fmean16	%d50, %d4, %d12
fpinit_1_63:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 100: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xa86c7390  ! 101: UDIVX_I	udivx 	%r17, 0xfffff390, %r20
    set 0x4fe, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b187e5  ! 102: PDISTN	fmean16	%d6, %d36, %d12
	.word 0xd03c8013  ! 103: STD_R	std	%r8, [%r18 + %r19]
	.word 0x29800001  ! 104: FBL	fbl,a	<label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd05fc000  ! 105: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_1_66:
	set 0x9494ff2a, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 106: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa2fc0007  ! 107: SDIVcc_R	sdivcc 	%r16, %r7, %r17
cwp_1_67:
    set user_data_start, %o7
	.word 0x93902001  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
jmptr_1_68:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 109: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x29800001  ! 110: FBL	fbl,a	<label_0x1>
splash_tba_1_70:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 111: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3197, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b407e8  ! 112: PDISTN	fmean16	%d16, %d8, %d18
cwp_1_71:
    set user_data_start, %o7
	.word 0x93902006  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_1_72:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 114: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_hpstate_1_73:
	.word 0x81982e44  ! 115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e44, %hpstate
splash_htba_1_74:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80388c  ! 117: SIR	sir	0x188c
splash_htba_1_75:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 118: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
tagged_1_76:
	tsubcctv %r17, 0x1373, %r10
	.word 0xe407e064  ! 119: LDUW_I	lduw	[%r31 + 0x0064], %r18
	.word 0x95a4c9a7  ! 120: FDIVs	fdivs	%f19, %f7, %f10
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd21fe020  ! 122: LDD_I	ldd	[%r31 + 0x0020], %r9
    set 0xfdd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b447f4  ! 123: PDISTN	fmean16	%d48, %d20, %d48
splash_lsu_1_79:
	set 0x29e7e164, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 124: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xa7804007  ! 126: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r7, %-
	.word 0x29800001  ! 127: FBL	fbl,a	<label_0x1>
	.word 0xe27feaf1  ! 128: SWAP_I	swap	%r17, [%r31 + 0x0af1]
	.word 0x8d903d59  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x1d59, %pstate
	.word 0x29800001  ! 130: FBL	fbl,a	<label_0x1>
mondo_1_83:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3f8] %asi
	.word 0x9d950011  ! 131: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
cwp_1_84:
    set user_data_start, %o7
	.word 0x93902007  ! 132: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x29800001  ! 133: FBL	fbl,a	<label_0x1>
tagged_1_86:
	tsubcctv %r3, 0x15d0, %r2
	.word 0xe207e026  ! 134: LDUW_I	lduw	[%r31 + 0x0026], %r17
splash_lsu_1_87:
	set 0xbf9db3e6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 135: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2dfe000  ! 136: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0xa1a049d3  ! 137: FDIVd	fdivd	%f32, %f50, %f16
	.word 0x87ad0a43  ! 138: FCMPd	fcmpd	%fcc<n>, %f20, %f34
change_to_randtl_1_90:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_90:
	.word 0x8f902001  ! 139: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd6800c20  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
splash_lsu_1_91:
	set 0xb8546124, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 141: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a48dc9  ! 142: FdMULq	fdmulq	
	.word 0xd007c000  ! 143: LDUW_R	lduw	[%r31 + %r0], %r8
memptr_1_92:
	set 0x60740000, %r31
	.word 0x85843ee2  ! 144: WRCCR_I	wr	%r16, 0x1ee2, %ccr
	.word 0xd097e010  ! 145: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
splash_htba_1_93:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 146: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x93a2c9ca  ! 147: FDIVd	fdivd	%f42, %f10, %f40
    set 0x24f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb1c7e7  ! 148: PDISTN	fmean16	%d38, %d38, %d44
jmptr_1_94:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 149: JMPL_R	jmpl	%r27 + %r0, %r27
splash_htba_1_95:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 150: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xda0fe010  ! 151: LDUB_I	ldub	[%r31 + 0x0010], %r13
    set 0x2d14, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b347e5  ! 152: PDISTN	fmean16	%d44, %d36, %d8
splash_htba_1_96:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 153: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803e18  ! 154: SIR	sir	0x1e18
	.word 0x29800001  ! 155: FBL	fbl,a	<label_0x1>
	.word 0xa7810011  ! 156: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r17, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76cb84a  ! 157: SDIVX_I	sdivx	%r18, 0xfffff84a, %r19
jmptr_1_100:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 158: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe727e088  ! 159: STF_I	st	%f19, [0x0088, %r31]
	.word 0x9f802f24  ! 160: SIR	sir	0x0f24
cwp_1_101:
    set user_data_start, %o7
	.word 0x93902006  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9026f4  ! 162: WRPR_PSTATE_I	wrpr	%r0, 0x06f4, %pstate
    set 0x2e8f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b4c7e8  ! 163: PDISTN	fmean16	%d50, %d8, %d20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01972  ! 164: FqTOd	dis not found

	.word 0x87aa4a42  ! 165: FCMPd	fcmpd	%fcc<n>, %f40, %f2
	.word 0x8d90309f  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x109f, %pstate
	.word 0xa6694013  ! 167: UDIVX_R	udivx 	%r5, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_104)+40, 16, 16)) -> intp(1,1,3)
xir_1_104:
	.word 0xa9853824  ! 168: WR_SET_SOFTINT_I	wr	%r20, 0x1824, %set_softint
	setx 0x20356f6f61352e4a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_105:
	.word 0x39400001  ! 169: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cwp_1_106:
    set user_data_start, %o7
	.word 0x93902004  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
jmptr_1_107:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 171: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936cfca6  ! 172: SDIVX_I	sdivx	%r19, 0xfffffca6, %r9
splash_tba_1_109:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 173: WRPR_TBA_R	wrpr	%r0, %r12, %tba
fpinit_1_110:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 174: FDIVs	fdivs	%f0, %f4, %f4
	setx 0xae66c2292565a7ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_111:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_112:
	set 0x60340000, %r31
	.word 0x858336dc  ! 176: WRCCR_I	wr	%r12, 0x16dc, %ccr
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36a6257  ! 177: SDIVX_I	sdivx	%r9, 0x0257, %r17
cwp_1_114:
    set user_data_start, %o7
	.word 0x93902002  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set 0x2dfd, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b507f3  ! 179: PDISTN	fmean16	%d20, %d50, %d20
splash_tba_1_115:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 180: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x3e48, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b187f1  ! 181: PDISTN	fmean16	%d6, %d48, %d48
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_116
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_116:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e011  ! 182: CASA_R	casa	[%r31] %asi, %r17, %r17
splash_htba_1_117:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 183: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_1_118:
    set user_data_start, %o7
	.word 0x93902003  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
donret_1_119:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_119-donret_1_119-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d9dc4c | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_119:
	.word 0xe2ffe047  ! 185: SWAPA_I	swapa	%r17, [%r31 + 0x0047] %asi
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_120)+24, 16, 16)) -> intp(1,1,3)
xir_1_120:
	.word 0xa98539b8  ! 186: WR_SET_SOFTINT_I	wr	%r20, 0x19b8, %set_softint
	.word 0xe28008a0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_htba_1_121:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 188: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803032  ! 189: SIR	sir	0x1032
debug_1_122:
	nop
debug_dva_1_122:
	ta T_CHANGE_HPRIV
	set 0xc6d441ec, %r19
	mov 3, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	mov 0x38, %r18
	.word 0xfef00b12  ! 190: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_htba_1_123:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 191: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_124)+8, 16, 16)) -> intp(1,1,3)
xir_1_124:
	.word 0xa983784b  ! 192: WR_SET_SOFTINT_I	wr	%r13, 0x184b, %set_softint
	setx 0x3517d033b8b21910, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_125:
	.word 0x39400001  ! 193: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_126) + 8, 16, 16)) -> intp(3,0,12)
intvec_1_126:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7848004  ! 195: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
memptr_1_128:
	set 0x60740000, %r31
	.word 0x8582bdd4  ! 196: WRCCR_I	wr	%r10, 0x1dd4, %ccr
    set 0x19e3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b247f4  ! 197: PDISTN	fmean16	%d40, %d20, %d10
	.word 0xa7848012  ! 198: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
splash_htba_1_130:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 199: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
cwp_1_131:
    set user_data_start, %o7
	.word 0x93902003  ! 200: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_hpstate_1_132:
	.word 0x819824de  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04de, %hpstate
	.word 0x29800001  ! 202: FBL	fbl,a	<label_0x1>
cwp_1_134:
    set user_data_start, %o7
	.word 0x93902007  ! 203: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_135)+32, 16, 16)) -> intp(1,1,3)
xir_1_135:
	.word 0xa980bf06  ! 204: WR_SET_SOFTINT_I	wr	%r2, 0x1f06, %set_softint
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r10
tagged_1_136:
	tsubcctv %r19, 0x14a9, %r8
	.word 0xd407e0a8  ! 206: LDUW_I	lduw	[%r31 + 0x00a8], %r10
memptr_1_137:
	set 0x60140000, %r31
	.word 0x85827243  ! 207: WRCCR_I	wr	%r9, 0x1243, %ccr
cwp_1_138:
    set user_data_start, %o7
	.word 0x93902002  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x97a349cc  ! 209: FDIVd	fdivd	%f44, %f12, %f42
	.word 0x29800001  ! 210: FBL	fbl,a	<label_0x1>
cwp_1_141:
    set user_data_start, %o7
	.word 0x93902007  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
memptr_1_142:
	set 0x60140000, %r31
	.word 0x8584b25a  ! 212: WRCCR_I	wr	%r18, 0x125a, %ccr
splash_htba_1_143:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 213: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_1_144:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 214: JMPL_R	jmpl	%r27 + %r0, %r27
    set 0x18b0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb1c7e9  ! 215: PDISTN	fmean16	%d38, %d40, %d44
	.word 0xa5a149b3  ! 216: FDIVs	fdivs	%f5, %f19, %f18
	.word 0xe597e020  ! 217: LDQFA_I	-	[%r31, 0x0020], %f18
	.word 0xa78439b4  ! 218: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x19b4, %-
	.word 0x3a800001  ! 219: BCC	bcc,a	<label_0x1>
cwp_1_146:
    set user_data_start, %o7
	.word 0x93902002  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
    set 0x3ea8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b487f0  ! 221: PDISTN	fmean16	%d18, %d16, %d16
	.word 0xa5a00dc9  ! 222: FdMULq	fdmulq	
jmptr_1_147:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa780800b  ! 224: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r11, %-
	.word 0xe48008a0  ! 225: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99a289ca  ! 226: FDIVd	fdivd	%f10, %f10, %f12
	.word 0x9f80325d  ! 227: SIR	sir	0x125d
	.word 0x8d9030ec  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x10ec, %pstate
	.word 0xd88fe010  ! 229: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
jmptr_1_150:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 230: JMPL_R	jmpl	%r27 + %r0, %r27
splash_lsu_1_151:
	set 0xa153413e, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 231: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903686  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x1686, %pstate
	.word 0xc36c7bce  ! 233: PREFETCH_I	prefetch	[%r17 + 0xfffffbce], #one_read
splash_hpstate_1_153:
	.word 0x81982eac  ! 234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eac, %hpstate
	.word 0xe917c000  ! 235: LDQF_R	-	[%r31, %r0], %f20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_154)+48, 16, 16)) -> intp(1,1,3)
xir_1_154:
	.word 0xa980f90d  ! 236: WR_SET_SOFTINT_I	wr	%r3, 0x190d, %set_softint
	.word 0x8d902eb6  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0eb6, %pstate
	.word 0x8d90256b  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x056b, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_155)+16, 16, 16)) -> intp(1,1,3)
xir_1_155:
	.word 0xa980fc17  ! 239: WR_SET_SOFTINT_I	wr	%r3, 0x1c17, %set_softint
	.word 0x9f803225  ! 240: SIR	sir	0x1225
fpinit_1_156:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 241: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x9f802bc0  ! 242: SIR	sir	0x0bc0
	.word 0xa5694013  ! 243: SDIVX_R	sdivx	%r5, %r19, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b7289  ! 244: SDIVX_I	sdivx	%r13, 0xfffff289, %r17
	.word 0xe257e010  ! 245: LDSH_I	ldsh	[%r31 + 0x0010], %r17
	.word 0xe297e020  ! 246: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0xa784c011  ! 247: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r17, %-
    set 0x3a5e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407f2  ! 248: PDISTN	fmean16	%d16, %d18, %d44
	.word 0xa153c000  ! 249: RDPR_FQ	<illegal instruction>
pmu_1_159:
	nop
	setx 0xfffffbbdfffff574, %g1, %g7
	.word 0xa3800007  ! 250: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe05fc000  ! 251: LDX_R	ldx	[%r31 + %r0], %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_160)+32, 16, 16)) -> intp(1,1,3)
xir_1_160:
	.word 0xa98429d3  ! 252: WR_SET_SOFTINT_I	wr	%r16, 0x09d3, %set_softint
	.word 0x29800001  ! 253: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_162)+24, 16, 16)) -> intp(1,1,3)
xir_1_162:
	.word 0xa98377f1  ! 254: WR_SET_SOFTINT_I	wr	%r13, 0x17f1, %set_softint
	.word 0x29800001  ! 255: FBL	fbl,a	<label_0x1>
	.word 0xa7814010  ! 256: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r16, %-
	.word 0x81b01021  ! 257: SIAM	siam	1
	.word 0xa7a4c9b1  ! 258: FDIVs	fdivs	%f19, %f17, %f19
tagged_1_166:
	tsubcctv %r8, 0x1098, %r10
	.word 0xe607e002  ! 259: LDUW_I	lduw	[%r31 + 0x0002], %r19
	.word 0xa782800b  ! 260: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r11, %-
	.word 0xa781c00d  ! 261: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r13, %-
	.word 0x8d9028b0  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x08b0, %pstate
	.word 0xa9a149f1  ! 263: FDIVq	dis not found

cwp_1_169:
    set user_data_start, %o7
	.word 0x93902005  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe85fc000  ! 265: LDX_R	ldx	[%r31 + %r0], %r20
mondo_1_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d92c014  ! 266: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
	.word 0xe927c000  ! 267: STF_R	st	%f20, [%r0, %r31]
cwp_1_171:
    set user_data_start, %o7
	.word 0x93902004  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cwp_1_172:
    set user_data_start, %o7
	.word 0x93902001  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_1_173:
	set 0x41f32bdd, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 270: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe23c4003  ! 271: STD_R	std	%r17, [%r17 + %r3]
fpinit_1_175:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83248  ! 272: PREFETCHA_I	prefetcha	[%r0, + 0xfffff248] %asi, #one_read
	.word 0xe257c000  ! 273: LDSH_R	ldsh	[%r31 + %r0], %r17
cwp_1_176:
    set user_data_start, %o7
	.word 0x93902000  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    set 0x35de, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b507f4  ! 275: PDISTN	fmean16	%d20, %d20, %d16
cwp_1_177:
    set user_data_start, %o7
	.word 0x93902001  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa7840013  ! 277: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r19, %-
change_to_randtl_1_179:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_179:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_180)+48, 16, 16)) -> intp(1,1,3)
xir_1_180:
	.word 0xa982f537  ! 279: WR_SET_SOFTINT_I	wr	%r11, 0x1537, %set_softint
	setx 0x43a64660cb844bf0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_181:
	.word 0x39400001  ! 280: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9b4c480  ! 281: FCMPLE32	fcmple32	%d50, %d0, %r20
	.word 0x95a409d0  ! 282: FDIVd	fdivd	%f16, %f16, %f10
intveclr_1_184:
	setx 0x89f4a73f46df3703, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 283: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_185:
	setx 0xe1701d8ef709d74e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_1_186:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 285: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_1_187:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 286: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xe1e08022  ! 287: CASA_I	casa	[%r2] 0x 1, %r2, %r16
	.word 0x9f803279  ! 288: SIR	sir	0x1279
	.word 0x29800001  ! 289: FBL	fbl,a	<label_0x1>
fpinit_1_190:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83279  ! 290: PREFETCHA_I	prefetcha	[%r0, + 0xfffff279] %asi, #one_read
	.word 0xa781400a  ! 291: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r10, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_192)+56, 16, 16)) -> intp(1,1,3)
xir_1_192:
	.word 0xa9833bc2  ! 292: WR_SET_SOFTINT_I	wr	%r12, 0x1bc2, %set_softint
splash_hpstate_1_193:
	.word 0x81982305  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0305, %hpstate
	.word 0x87ac8a53  ! 294: FCMPd	fcmpd	%fcc<n>, %f18, %f50
    set 0x16a0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b207f1  ! 295: PDISTN	fmean16	%d8, %d48, %d20
    set 0x1494, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b507e0  ! 296: PDISTN	fmean16	%d20, %d0, %d10
memptr_1_195:
	set user_data_start, %r31
	.word 0x858232d8  ! 297: WRCCR_I	wr	%r8, 0x12d8, %ccr
	.word 0xd48008a0  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x24cd0001  ! 299: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
    set 0x2578, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b007f3  ! 300: PDISTN	fmean16	%d0, %d50, %d40
cwp_1_197:
    set user_data_start, %o7
	.word 0x93902001  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa7844001  ! 302: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r1, %-
	.word 0xd28008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xc3e94034  ! 304: PREFETCHA_R	prefetcha	[%r5, %r20] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_200)+16, 16, 16)) -> intp(1,1,3)
xir_1_200:
	.word 0xa980706a  ! 305: WR_SET_SOFTINT_I	wr	%r1, 0x106a, %set_softint
	.word 0xd6dfe010  ! 306: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5682a96  ! 307: SDIVX_I	sdivx	%r0, 0x0a96, %r18
	.word 0x9345c000  ! 308: RD_TICK_CMPR_REG	rd	%-, %r9
change_to_randtl_1_202:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_202:
	.word 0x8f902001  ! 309: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
cwp_1_203:
    set user_data_start, %o7
	.word 0x93902002  ! 310: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_htba_1_204:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 311: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_htba_1_205:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 312: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x91d020b2  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9f802750  ! 314: SIR	sir	0x0750
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_206
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_206
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_206:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 315: RDPC	rd	%pc, %r10
tagged_1_207:
	taddcctv %r4, 0x1111, %r18
	.word 0xd407e000  ! 316: LDUW_I	lduw	[%r31 + 0x0000], %r10
	.word 0x87ab0a52  ! 317: FCMPd	fcmpd	%fcc<n>, %f12, %f18
	.word 0xd64fe000  ! 318: LDSB_I	ldsb	[%r31 + 0x0000], %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_209)+16, 16, 16)) -> intp(1,1,3)
xir_1_209:
	.word 0xa9846117  ! 319: WR_SET_SOFTINT_I	wr	%r17, 0x0117, %set_softint
cmp_1_210:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_210:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_210
    nop
cmp_wait1_210:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_210
    nop
    ba,a cmp_startwait1_210
continue_cmp_1_210:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 12, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91914009  ! 320: WRPR_PIL_R	wrpr	%r5, %r9, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_211)+48, 16, 16)) -> intp(1,1,3)
xir_1_211:
	.word 0xa984a746  ! 321: WR_SET_SOFTINT_I	wr	%r18, 0x0746, %set_softint
intveclr_1_212:
	setx 0x0924ec31f2302eab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 322: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_tba_1_213:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 323: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_1_214:
    set user_data_start, %o7
	.word 0x93902005  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_1_215:
	taddcctv %r2, 0x1fda, %r7
	.word 0xd607e0bc  ! 325: LDUW_I	lduw	[%r31 + 0x00bc], %r11
	.word 0x9f8022a3  ! 326: SIR	sir	0x02a3
	.word 0x8d902644  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x0644, %pstate
splash_htba_1_216:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 328: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
change_to_randtl_1_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_217:
	.word 0x8f902002  ! 329: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x29800001  ! 330: FBL	fbl,a	<label_0x1>
	.word 0x24cc4001  ! 331: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
fpinit_1_220:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 332: FDIVs	fdivs	%f0, %f4, %f4
fpinit_1_221:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 333: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916c661d  ! 334: SDIVX_I	sdivx	%r17, 0x061d, %r8
splash_tba_1_223:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 335: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    set 0x2c45, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b0c7f1  ! 336: PDISTN	fmean16	%d34, %d48, %d48
splash_tba_1_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 337: WRPR_TBA_R	wrpr	%r0, %r12, %tba
tagged_1_225:
	taddcctv %r7, 0x15fa, %r3
	.word 0xe207e03a  ! 338: LDUW_I	lduw	[%r31 + 0x003a], %r17
splash_lsu_1_226:
	set 0x06594ad7, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe25fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r17
    set 0x789, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b247ea  ! 341: PDISTN	fmean16	%d40, %d10, %d40
	.word 0x9ba049b2  ! 342: FDIVs	fdivs	%f1, %f18, %f13
	.word 0x29800001  ! 343: FBL	fbl,a	<label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_229)+16, 16, 16)) -> intp(1,1,3)
xir_1_229:
	.word 0xa9802513  ! 344: WR_SET_SOFTINT_I	wr	%r0, 0x0513, %set_softint
	.word 0xda9fd920  ! 345: LDDA_R	ldda	[%r31, %r0] 0xc9, %r13
cwp_1_230:
    set user_data_start, %o7
	.word 0x93902001  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_1_231:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 347: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cwp_1_232:
    set user_data_start, %o7
	.word 0x93902001  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x29800001  ! 349: FBL	fbl,a	<label_0x1>
	.word 0x9f8020fc  ! 350: SIR	sir	0x00fc
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_234
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_234:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 351: CASA_R	casa	[%r31] %asi, %r18, %r13
	.word 0x9f802918  ! 352: SIR	sir	0x0918
	.word 0xdadfe000  ! 353: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996ca6d9  ! 354: SDIVX_I	sdivx	%r18, 0x06d9, %r12
	.word 0x9f803ea9  ! 355: SIR	sir	0x1ea9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_236)+32, 16, 16)) -> intp(1,1,3)
xir_1_236:
	.word 0xa984eb09  ! 356: WR_SET_SOFTINT_I	wr	%r19, 0x0b09, %set_softint
splash_tba_1_237:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 357: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa0d06e84  ! 358: UMULcc_I	umulcc 	%r1, 0x0e84, %r16
    set 0x17d7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b4c7f1  ! 359: PDISTN	fmean16	%d50, %d48, %d40
jmptr_1_238:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 360: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd2800b60  ! 361: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r9
	.word 0xa7828000  ! 362: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r0, %-
	.word 0xd327c000  ! 363: STF_R	st	%f9, [%r0, %r31]
	.word 0xa96c4011  ! 364: SDIVX_R	sdivx	%r17, %r17, %r20
splash_lsu_1_240:
	set 0x85436460, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 365: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
memptr_1_241:
	set 0x60740000, %r31
	.word 0x8582b0f2  ! 366: WRCCR_I	wr	%r10, 0x10f2, %ccr
	.word 0x9ba009c9  ! 367: FDIVd	fdivd	%f0, %f40, %f44
fpinit_1_243:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 368: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 369: FqTOd	dis not found

    set 0x3cb3, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b287e0  ! 370: PDISTN	fmean16	%d10, %d0, %d48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9682799  ! 371: SDIVX_I	sdivx	%r0, 0x0799, %r20
splash_tba_1_246:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 372: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_tba_1_247:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 373: WRPR_TBA_R	wrpr	%r0, %r12, %tba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_248)+56, 16, 16)) -> intp(1,1,3)
xir_1_248:
	.word 0xa985247e  ! 374: WR_SET_SOFTINT_I	wr	%r20, 0x047e, %set_softint
	.word 0xe86fe013  ! 375: LDSTUB_I	ldstub	%r20, [%r31 + 0x0013]
splash_tba_1_249:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 376: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa780000b  ! 377: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r11, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01965  ! 378: FqTOd	dis not found

	.word 0x94800012  ! 379: ADDcc_R	addcc 	%r0, %r18, %r10
memptr_1_252:
	set user_data_start, %r31
	.word 0x85816702  ! 380: WRCCR_I	wr	%r5, 0x0702, %ccr
splash_htba_1_253:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa084c013  ! 382: ADDcc_R	addcc 	%r19, %r19, %r16
fpinit_1_254:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 383: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_255)+24, 16, 16)) -> intp(1,1,3)
xir_1_255:
	.word 0xa984756a  ! 384: WR_SET_SOFTINT_I	wr	%r17, 0x156a, %set_softint
debug_1_256:
	nop
debug_iva_1_256:
	ta T_CHANGE_HPRIV
	set 0x55022ced, %r19
	mov 1, %r20
	sllx %r20, 33, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	ta T_CHANGE_NONHPRIV
	.word 0xe6f00b12  ! 385: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_257)+48, 16, 16)) -> intp(1,1,3)
xir_1_257:
	.word 0xa9842578  ! 386: WR_SET_SOFTINT_I	wr	%r16, 0x0578, %set_softint
tagged_1_258:
	tsubcctv %r3, 0x13b4, %r6
	.word 0xe007e0e4  ! 387: LDUW_I	lduw	[%r31 + 0x00e4], %r16
memptr_1_259:
	set 0x60340000, %r31
	.word 0x85852194  ! 388: WRCCR_I	wr	%r20, 0x0194, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_260
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_260:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 389: RDPC	rd	%pc, %r8
	.word 0x29800001  ! 390: FBL	fbl,a	<label_0x1>
splash_htba_1_262:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 391: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa784c00c  ! 392: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r12, %-
intveclr_1_264:
	setx 0x1c6b1b07e665a8ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_htba_1_265:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 394: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x8d9032be  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x12be, %pstate
splash_htba_1_266:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 396: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa782400a  ! 397: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r10, %-
	.word 0xa7818003  ! 398: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r3, %-
	.word 0xa7848004  ! 399: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r4, %-
intveclr_1_270:
	setx 0xb0f1bed0e1f1eca0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 400: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmpenall_1_271:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait1_271:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_1_271
    nop
cmpenall_wait1_271:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait1_271
    nop
    ba,a cmpenall_startwait1_271
continue_cmpenall_1_271:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_1_271:
    cmp %r13, %r14
    bne,a wait_for_cmpstat_1_271
    ldxa [0x58]%asi, %r14       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_1_271:
    cmp %r14, %r16
    bne,a wait_for_cmpstat2_1_271
    ldxa [0x58]%asi, %r16       !Running_status
    st %g0, [%r23]              !clear lock
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
.global user_data_start
.data
user_data_start:

	.xword	0x3aa9cae478b7767b
	.xword	0x1540236f9660a09f
	.xword	0x6b1870dc1c512217
	.xword	0x5721a94e73671cf5
	.xword	0x7d0dfe58c59ae004
	.xword	0x109b986ce9bb78bd
	.xword	0x97f6d2f74d100cb6
	.xword	0xb8b2af89d990cef3
	.xword	0x95c5f31931bb5229
	.xword	0xde8a2910f64a33b7
	.xword	0xc814cbcbfcba7a8c
	.xword	0x4d6f3977e1071c9e
	.xword	0x720630d1d11e2bf4
	.xword	0x9d5a4b7135c12ded
	.xword	0xb1e2fd8177819765
	.xword	0x72633c0f27dd7ced
	.xword	0xfa4fe2c9b78499d8
	.xword	0x85508762dbf8c2ff
	.xword	0x0a7d52593cd66f09
	.xword	0x9da1cd5ccc2dc36a
	.xword	0xb4533aa5283ba770
	.xword	0xe0ef3e4a6be2b2f8
	.xword	0x07d484f2026b4042
	.xword	0xe5741c417ecccf28
	.xword	0x910d9f1cbf819ce5
	.xword	0x3130bc4e10270753
	.xword	0x227000bef725a201
	.xword	0xdc4e16f3231cba9b
	.xword	0x01072ad26fdf174e
	.xword	0x3a49a5291e315d13
	.xword	0xea9cc7832dd16b9c
	.xword	0x3a756f944ba8c579
	.xword	0xf85e172207451cd7
	.xword	0xb1b1c4cd86695a7b
	.xword	0x944a9baee7952be4
	.xword	0xf1ff78462b012234
	.xword	0x2dc3c56750e6984c
	.xword	0xf3c3742f7af289a3
	.xword	0x576fe64729794d4b
	.xword	0xe571fa9414e399b4
	.xword	0xb924f215346c7549
	.xword	0x525556a29b6c86e2
	.xword	0x4863ca85ad24490c
	.xword	0xa399c14ede9c4032
	.xword	0x8d2165a4eb8cbc5a
	.xword	0x6b204fc637deae28
	.xword	0xb65e134a77ce33c7
	.xword	0x488253ca5db88eff
	.xword	0xa5be2fefd63ecb2a
	.xword	0x93968238f1e82eb5
	.xword	0x0112515023b02089
	.xword	0xbad9b5ac66e1eb06
	.xword	0x9bee921fac727d77
	.xword	0x81af74e731fffd6c
	.xword	0xf3e5391fe1100988
	.xword	0x33e3cf18b6d7ac80
	.xword	0x64723898acbf94a6
	.xword	0x78e9e1e2455d626b
	.xword	0x3c72c72b06531fe7
	.xword	0x8826e3587bfbd59f
	.xword	0x2621462905bc2944
	.xword	0xe4b7ff4fad66e0d8
	.xword	0x9d16e979053487bf
	.xword	0x9c639c2d62dc6b6b
	.xword	0xa7654b7cd0945760
	.xword	0x8b975364796b77b4
	.xword	0xac33b581bf2c017c
	.xword	0xed0346957946bafa
	.xword	0xf63df7b6307cfdd8
	.xword	0x49432d8783857da9
	.xword	0x47f010b58503932b
	.xword	0x5925ab869820fd27
	.xword	0xe651ac6d5915bc96
	.xword	0x7d75142bf5ea3763
	.xword	0x2dde9007bb0e7214
	.xword	0xe59454be0d42a55c
	.xword	0xf331c4ca399e14fb
	.xword	0x9911eb530a247932
	.xword	0x20260957000e3e8d
	.xword	0xb5d2ad8994317687
	.xword	0x2dc51073faf73deb
	.xword	0x388c6b6a9ce4b61d
	.xword	0x7074fa493f6ceeb7
	.xword	0x5cebab909810ddf8
	.xword	0x73c40ae36c947941
	.xword	0x89184b3951a71d61
	.xword	0xcc7e83054c44bffc
	.xword	0x7d947dad69215a57
	.xword	0x6fc1d3aedac42a01
	.xword	0x400e6b6fdede2d21
	.xword	0x7f5b0d6bcd2e2a38
	.xword	0x2cd5cebe08d2efed
	.xword	0x92484572214d9c20
	.xword	0x75b3728a7f24fa94
	.xword	0x2579c15842967a56
	.xword	0x849170fc63e62e89
	.xword	0xa536d7928c9e0872
	.xword	0xaf4aca01c31aa7e1
	.xword	0x575cda3c4fddf296
	.xword	0xff2424fc7c3a9ed5
	.xword	0x29f6500d7e1a5682
	.xword	0xf0fb27e16e70a672
	.xword	0x09e75bcef4b88789
	.xword	0xe476cadca27603e0
	.xword	0xe12d20b8b5cb7421
	.xword	0x29d551d3c53d1148
	.xword	0x1b5a92a09f700ee6
	.xword	0xc6cad7575e3e8455
	.xword	0xc05ee7a84a1c32f4
	.xword	0x36d3cbcd892b8ddc
	.xword	0x320fa776861e15a1
	.xword	0xc534781dffcac4c0
	.xword	0x5ab5007187ea7e54
	.xword	0xae0d65952b7deb31
	.xword	0xc1550724118f9be6
	.xword	0x2ea017d1c6f1c8d2
	.xword	0x3e4056fb27886afc
	.xword	0x3b208f172c09d755
	.xword	0xdf540c19ed02dd4e
	.xword	0x411a49925c38a10d
	.xword	0xd5cadebbd55b4ade
	.xword	0x3003e644df81288f
	.xword	0x9d9685661844c4a5
	.xword	0xa139e5e0414612ef
	.xword	0x25f8dc6db90c9fd6
	.xword	0x0aa8af565c9ac676
	.xword	0x8ddb61d5aa77f288
	.xword	0xfc824256fc12c8b6
	.xword	0xd696d19bb20fef6c
	.xword	0xd29080235ded2a12
	.xword	0x37b08d1f76351a29
	.xword	0x44a749bef4c51bfa
	.xword	0x54da06aa61c56ce8
	.xword	0x27b6c0b565a03743
	.xword	0x6fa0cf7fc41e2c88
	.xword	0x2b265241bd02dfd7
	.xword	0x0b8622fa9052be7a
	.xword	0xfd8db5ab299ac002
	.xword	0x6ca53e99ce47e6b3
	.xword	0x9ada1bab5bd4e678
	.xword	0x713217c03b293842
	.xword	0x21195a9e2878dad4
	.xword	0xa8b9475c87abb14c
	.xword	0x02d1ac9b7c021f35
	.xword	0x605b161394ff2d24
	.xword	0x1c96bc6115068547
	.xword	0x6de9e8c86acda29a
	.xword	0x2a7cd067eb0ae36b
	.xword	0x731b71d23cd79147
	.xword	0x27298d15820e47ef
	.xword	0x7145c116b890f349
	.xword	0x99639a29719ff363
	.xword	0xd9d8e2502d821c89
	.xword	0x1a89205724703ce2
	.xword	0xf5a410cc4fe8e0b6
	.xword	0xd5dc565f5db79bb5
	.xword	0x5f29fdff6ea81576
	.xword	0x2884e96a638ed87e
	.xword	0xae79217b142320e6
	.xword	0xfe87d758e2979044
	.xword	0xb2750d2b0aaaf241
	.xword	0xe8053792d995a728
	.xword	0x6d27d120e9624d4e
	.xword	0x0930f31899532f51
	.xword	0xe9c767f971513e55
	.xword	0x676dc4554e702e6a
	.xword	0x5342222efbaf7aff
	.xword	0xb0eaa1319cbc3af2
	.xword	0xaffe13dbc88c32f3
	.xword	0x82812c72604322d2
	.xword	0xc8d69508d3b29700
	.xword	0x42541f8048ef55fc
	.xword	0x5e892142e1cd835d
	.xword	0x2a1d0a8a26f80553
	.xword	0x6e06a6bb8f5dc778
	.xword	0x9f384311f73c7837
	.xword	0x4bbb292efc02dcc8
	.xword	0x111697efa944e055
	.xword	0xb18279e1089300df
	.xword	0xda8f9dc69b1cc010
	.xword	0x54953b2b1598f20d
	.xword	0x9a1a8bdba4c170d8
	.xword	0x810a37b14fdec913
	.xword	0xa6a30b3372a429f5
	.xword	0x27d85e9022ccf9f7
	.xword	0xfbc2637bd8ec1ee0
	.xword	0xe0d9f99bf08db78a
	.xword	0xaf3084cfdf971306
	.xword	0x1f86b4e2beeded3e
	.xword	0xd1ac2640d6578687
	.xword	0x9eed90ca08ce2a4d
	.xword	0x0eeb753822b2f0de
	.xword	0xdc50de133302a121
	.xword	0x6d771ec38a7a7a05
	.xword	0x48c0ff68ab773a60
	.xword	0x547cbd6406572dfa
	.xword	0x98f5cfc92bd163bb
	.xword	0x0ce9e00e5811671c
	.xword	0x78f2e550f2940e06
	.xword	0xc67cd9e0fa79d9e2
	.xword	0x0be0abb8613ab6d9
	.xword	0x04cdb0777632aa37
	.xword	0x40bd11b69a850d46
	.xword	0x3049bf3a74c33bee
	.xword	0x86ef4e4c91296264
	.xword	0xb2417c4f152a8fb5
	.xword	0x29a13684377988b5
	.xword	0x59e89d71287bc7ba
	.xword	0x4af907a9a55642eb
	.xword	0x7929cf045b53d2b8
	.xword	0x42e871333f7f3c8e
	.xword	0xa7b00d88829e9487
	.xword	0x2e8446eed5f3b5f1
	.xword	0x6ea2268ad73512e1
	.xword	0x69049dc055620148
	.xword	0x25f20160c5e7896a
	.xword	0x7fd3b026ec8ef670
	.xword	0xeea121e7145a7e05
	.xword	0xe3b57ea44a06c864
	.xword	0xb7df2e9c6ec0034f
	.xword	0xff07f9ce45ba5b93
	.xword	0xaa0b74dbaa4088f3
	.xword	0x0f87e9f5c5ccbf14
	.xword	0x30ba703233b826fd
	.xword	0xe86c2e2ed523b02d
	.xword	0x4324c9bdd8fd0e1e
	.xword	0xbdbdb1c0b90aa502
	.xword	0x99db01d79a7d22fe
	.xword	0x60596df784b8b257
	.xword	0xb0b10cdafdd8214b
	.xword	0xbb42fea56e948e62
	.xword	0xec76e311433e2062
	.xword	0xedd137c9caa55f69
	.xword	0x949ed728846ab36e
	.xword	0xdc638792815aeef0
	.xword	0xe7a12b54463dd038
	.xword	0xb83b483b6f248960
	.xword	0xe401be6829259b76
	.xword	0x0e6d2f64aafe5781
	.xword	0x4179d982013119b6
	.xword	0x78a456fff61e1e09
	.xword	0xbffcdb1cd55b7b1c
	.xword	0x1cf4edbc4234ec01
	.xword	0x00f4bdea0fae7486
	.xword	0x5a8412eaf0c74aa3
	.xword	0x6b7a8e9585e1b5c0
	.xword	0xda427d80f88e2fca
	.xword	0x5dbfd3f6e472fce1
	.xword	0xc0efc887e75e2517
	.xword	0x8387bbd81215bc87
	.xword	0x6c38d6d3d5dfc3fd
	.xword	0x830a37130b081f0e
	.xword	0x3dd3718048c87a73
	.xword	0x03115d0420cf6823
	.xword	0x819fcc7af045d13f
	.xword	0xedc08b146a9a305a

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
# 718 "diag.j"
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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

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
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

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
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 0
}

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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 0,
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
	TTE_W	 = 0,
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
	TTE_P	 = 1,
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
	TTE_CV	 = 0,
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


attr_data {
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x86ce0c00829e2288
	.xword	0xd6ae4380046336ac
	.xword	0xb464686b1d8659ef
	.xword	0xf27064a0390232f9
	.xword	0x12d4704c5bbfbde8
	.xword	0xb71bdc84a18e5298
	.xword	0x8c5f6a9e718299af
	.xword	0x51f7b4301de97cdd
	.xword	0x763e3dba61ea6999
	.xword	0x0012f6788c81618d
	.xword	0x2e07c0afc7ab5435
	.xword	0xd5a8696b352a7e17
	.xword	0x13d235236cd17344
	.xword	0xb019b83f6a921a6f
	.xword	0x20830eaab122eec6
	.xword	0x9525b072b8f1afcc
	.xword	0x4f05cd3d7713087e
	.xword	0x031cc7f4f4ecd8b3
	.xword	0xd086c1e392b5e684
	.xword	0x12f531972f715b4f
	.xword	0x28d4f7d41501a092
	.xword	0x60bd817e508769fe
	.xword	0xb77bbce4ce53918c
	.xword	0x1b9bff86df57a9af
	.xword	0x3cd9ccd8242dbbdb
	.xword	0x1c14a448e1f492c3
	.xword	0xf88744848fa07089
	.xword	0x75cb78ce8b852c5b
	.xword	0xc91b66b91fc9f766
	.xword	0x50b1d2e1a5b29990
	.xword	0x6382b992d72ff0bf
	.xword	0xba9bcccdfdcb2800



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


attr_data {
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0xc46051c6bb4d6b7b
	.xword	0x381518be89d23c7c
	.xword	0xd1678a1d8b14cb58
	.xword	0xe37e2eaa2b74c16f
	.xword	0x573bce7a19fa75b3
	.xword	0x1217a46c5a9325e1
	.xword	0x49f064868f5b706f
	.xword	0x253939f9dc4fb268
	.xword	0x21fa3c15894a1d54
	.xword	0xbfb17cfcd2e67ce5
	.xword	0x056eebd3edd518e2
	.xword	0x62f2ad19b12c2557
	.xword	0xad730e04b8a0a59b
	.xword	0xe37c5db7e3efab87
	.xword	0x7451166e0e4a66b4
	.xword	0x791c539e15917166
	.xword	0x1eeba4cef8d2ee2c
	.xword	0x871e2dff62261238
	.xword	0xa15222b736689935
	.xword	0xb24eac16cdc2eb8d
	.xword	0xcd86918acb454d83
	.xword	0xb865f2e60b3c50bd
	.xword	0x649b1e88e7d7afe5
	.xword	0xbebe820d3c4d3b40
	.xword	0xcf956a26802489c6
	.xword	0x956c44390fd18dcf
	.xword	0xb7960230aebad565
	.xword	0x7da6181cc1d284c2
	.xword	0x34fbe2085ef700dc
	.xword	0xa433a0cc30cb5bc0
	.xword	0x65a71edd87ecaf0a
	.xword	0x15e7f71f43760e44



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
	TTE_E	 = 0,
	TTE_P	 = 0,
	TTE_W	 = 1
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
	.xword	0x0ba62300876cf121
	.xword	0x8ee2bca7f7cec15e
	.xword	0xb0c77ace4f56f001
	.xword	0x06e6d1b0b264e838
	.xword	0xceeea50a17fef0dd
	.xword	0xd2da1782b2dcf1d7
	.xword	0x1c53e336fec53dfb
	.xword	0xf61f6220de55ccdc
	.xword	0xebff1bc14ecb6f01
	.xword	0xfefdb31d7c00f119
	.xword	0x8065359dd8587f44
	.xword	0xc1bc58657e1cb73c
	.xword	0x9fe2e9e84f195dea
	.xword	0x58f4f5e8d89439b1
	.xword	0x80ad0baf2f1fb9ef
	.xword	0x6686e17df4793382
	.xword	0x28b20dfea7428f56
	.xword	0xec69afaf77b6980a
	.xword	0x97c64f4f42eb7793
	.xword	0x0af77be327946f1d
	.xword	0xd366a08208b12157
	.xword	0xa584ae8e0eef3dbd
	.xword	0x419caf9ccf3bab31
	.xword	0x11b4c3e486e5990f
	.xword	0x5dcbc589186af068
	.xword	0x6a468d0aece3c34e
	.xword	0x351ea0a189b8d062
	.xword	0xc7233b29f1b87f7b
	.xword	0xc5af13876bcd6586
	.xword	0x09492e93f7a06d36
	.xword	0xc98b8e77619f6360
	.xword	0x214fca766cda8853



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
	TTE_W	 = 0
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
	.xword	0xc5b7e408ce5f4429
	.xword	0x2745567c79d4ee4b
	.xword	0xbe04ab373dcbea9c
	.xword	0x770eb2175148d495
	.xword	0x656fbf899768136e
	.xword	0xc107abaa352c1b41
	.xword	0x8e2e033e4950a5f4
	.xword	0x212961a9d7e20a99
	.xword	0x306c3204eae1b9ee
	.xword	0x8dfa3dff5444a7a3
	.xword	0xe0c36a2afd2bac26
	.xword	0xaecd72ca2628d9c1
	.xword	0xea5b12aa67ef6b8b
	.xword	0x929cff93532096d0
	.xword	0x3f3e38ba8a584a02
	.xword	0xc6a34e39e3a10b4a
	.xword	0xedabedf552656d72
	.xword	0xd47f5e29f6bb1b14
	.xword	0x02f79d9ed3fa74a0
	.xword	0x4957f03bbd6c3a22
	.xword	0x7819036e5885718b
	.xword	0x5a13df17250813bf
	.xword	0x895561171be8eb83
	.xword	0x8e39536cbf19134d
	.xword	0x4efb80a589206a37
	.xword	0x2c0ba56103876b51
	.xword	0xf36718b477101899
	.xword	0xd46c0f07b565c84d
	.xword	0x0e3a7d21868d4892
	.xword	0x37a5b513249c987d
	.xword	0xd722dbd29bc2cd7b
	.xword	0x00e46abe9a7af13e





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
	TTE_W	 = 0
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f6
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
	TTE_W	 = 1
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f8
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

.text
nuff_said_3:
	fdivs %f0, %f4, %f4
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f4



#if 0
#endif

