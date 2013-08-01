/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_60.s
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
# 373 "diag.j"
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
# 420 "diag.j"
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
	mov 0xb1, %r14
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
	mov 0x34, %r14
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
	mov 0x31, %r14
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
	mov 0xb1, %r14
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
	mov 0xb1, %r14
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
    wr %g2, %g0, %pcr
    ta T_RD_THID
    brnz %o1, skip_non0
setup_cmp:
    mov 1, %r10
    set sync_thr_counter1, %r23
    st %r10, [%r23]             !lock sync_thr_counter1
    stw %g0, [%g0]
    rd %asi, %r12
    wr %r0, 0x41, %asi
    ldxa [0x58]%asi, %r14
	stxa %r14, [0x50]%asi
setup_spu:
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
    setx 0x2061008000000000, %l1, %l2		!#		Control Word

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
	.word 0x93a00173  ! 1: FABSq	dis not found

	.word 0xe187e060  ! 2: LDFA_I	lda	[%r31, 0x0060], %f16
	.word 0xa9a00161  ! 3: FABSq	dis not found

    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x87ac4a40  ! 5: FCMPd	fcmpd	%fcc<n>, %f48, %f0
pmu_80_2:
	nop
	setx 0xfffff85dfffff9b0, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe0fb  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x00fb]
donret_80_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_3-donret_80_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007d5bb4 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x144, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_3:
	.word 0xd2ffe0a0  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x00a0] %asi
jmptr_80_4:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe018  ! 10: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r9
	.word 0x95a00170  ! 11: FABSq	dis not found

DS_80_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0x9b480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x95480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_80_6:
	setx 0xa844cd1226e60896, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e028  ! 17: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r18
	.word 0xe4dfe028  ! 18: LDXA_I	ldxa	[%r31, + 0x0028] %asi, %r18
DS_80_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe1344010  ! 1: STQF_R	-	%f16, [%r16, %r17]
	normalw
	.word 0x95458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r10
intveclr_80_8:
	setx 0xd8c052a54436c86f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_9:
	nop
	setx 0xfffff15afffff648, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e022  ! 23: STX_I	stx	%r20, [%r31 + 0x0022]
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 24: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99a00170  ! 25: FABSq	dis not found

intveclr_80_10:
	setx 0x925da04def824bd7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_11:
	.word 0x81982ddc  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddc, %hpstate
splash_tba_80_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x61f1b6307ca1a4bd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_80_15:
	nop
	setx 0xfffff4c8fffff58f, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc36d2e49  ! 32: PREFETCH_I	prefetch	[%r20 + 0x0e49], #one_read
splash_cmpr_80_17:
	setx 0x8177a9abcca0b076, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_80_18:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_80_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d92c008  ! 35: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
	.word 0x93500000  ! 36: RDPR_TPC	rdpr	%tpc, %r9
jmptr_80_20:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_80_21:
	setx 0x19ef12c6f258d383, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8029d2  ! 39: SIR	sir	0x09d2
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_80_22-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_22:
	.word 0x9195000d  ! 41: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	.word 0x93a00173  ! 42: FABSq	dis not found

DS_80_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a0c9d4  ! 1: FDIVd	fdivd	%f34, %f20, %f48
	.word 0xa3a34830  ! 43: FADDs	fadds	%f13, %f16, %f17
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x95a509c5  ! 45: FDIVd	fdivd	%f20, %f36, %f10
	.word 0x39400001  ! 46: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_25-donret_80_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00308f5a | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_25:
	.word 0xe2ffe0dc  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x00dc] %asi
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 48: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe26fe07c  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x007c]
	.word 0xe26fe0d4  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x00d4]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xc1bfe0e0  ! 52: STDFA_I	stda	%f0, [0x00e0, %r31]
tagged_80_26:
	tsubcctv %r17, 0x1fce, %r1
	.word 0xe207e0e8  ! 53: LDUW_I	lduw	[%r31 + 0x00e8], %r17
	rd %pc, %r19
	add %r19, (ivw_80_27-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_27:
	.word 0x91904007  ! 54: WRPR_PIL_R	wrpr	%r1, %r7, %pil
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f802562  ! 56: SIR	sir	0x0562
splash_hpstate_80_29:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x819822c7  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0xe277e0e0  ! 58: STX_I	stx	%r17, [%r31 + 0x00e0]
debug_80_30:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 59: CASA_R	casa	[%r31] %asi, %r20, %r17
jmptr_80_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe08f  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x008f]
	rd %pc, %r19
	add %r19, (ivw_80_32-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_32:
	.word 0x91908008  ! 62: WRPR_PIL_R	wrpr	%r2, %r8, %pil
	.word 0x91d02035  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xad82614e  ! 64: WR_SOFTINT_REG_I	wr	%r9, 0x014e, %softint
intveclr_80_33:
	setx 0xb8cc1a4e50225522, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ea5  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0ea5, %pstate
	.word 0xc187dc00  ! 67: LDFA_R	lda	[%r31, %r0], %f0
	.word 0xa1520000  ! 68: RDPR_PIL	rdpr	%pil, %r16
	.word 0xd88008a0  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_80_35:
	setx 0x3fbf25f923eeb198, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_80_36:
	set user_data_start, %r31
	.word 0x8584228e  ! 71: WRCCR_I	wr	%r16, 0x028e, %ccr
	rd %pc, %r19
	add %r19, (ivw_80_37-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_37:
	.word 0x91940013  ! 72: WRPR_PIL_R	wrpr	%r16, %r19, %pil
intveclr_80_38:
	setx 0x2560dc3d63f72047, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a509d0  ! 74: FDIVd	fdivd	%f20, %f16, %f16
	.word 0xa3a00173  ! 75: FABSq	dis not found

DS_80_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02033  ! 77: Tcc_I	te	icc_or_xcc, %r0 + 51
pmu_80_40:
	nop
	setx 0xfffffcd9fffff81f, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22c84001  ! 1: BRZ	brz,a,pt	%r1,<label_0x84001>
	.word 0x8d903ca8  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1ca8, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_80_42:
	setx 0x642912e34ef8a9b0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_80_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_43-donret_80_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aeabcb | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb8d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_43:
	.word 0xe8ffe09d  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x009d] %asi
debug_80_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_44:
	mov 0xca4, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc033  ! 83: STDA_R	stda	%r20, [%r31 + %r19] 0x01
splash_htba_80_45:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_80_46:
	setx 0x84c6a76403a5d288, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe1bfe0a0  ! 87: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xa78027a7  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x07a7, %-
	setx 0xf62168dcfd535435, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d944005  ! 90: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
donret_80_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_49-donret_80_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00801c67 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe5d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_80_49:
	.word 0xd8ffe06c  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x006c] %asi
DS_80_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa7a00174  ! 93: FABSq	dis not found

	.word 0xd46fe0d1  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x00d1]
debug_80_51:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd4dfc024  ! 95: LDXA_R	ldxa	[%r31, %r4] 0x01, %r10
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0x9945c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_52) + 16, 16, 16)) -> intp(2,0,30)
intvec_80_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_80_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_80_54-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_54:
	.word 0x91948002  ! 100: WRPR_PIL_R	wrpr	%r18, %r2, %pil
DS_80_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd514c010  ! 1: LDQF_R	-	[%r19, %r16], %f10
	.word 0x91a30823  ! 101: FADDs	fadds	%f12, %f3, %f8
DS_80_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd369c2c0	! Random illegal ?
	.word 0xa9a00547  ! 1: FSQRTd	fsqrt	
	.word 0x99a48827  ! 102: FADDs	fadds	%f18, %f7, %f12
	.word 0xd327e090  ! 103: STF_I	st	%f9, [0x0090, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_80_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 106: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	setx 0x88b2ed2344fd87ae, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
DS_80_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_80_61:
	setx 0x3330d7c177b44e0b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_80_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_64:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 115: RDPC	rd	%pc, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_66) + 0, 16, 16)) -> intp(0,0,24)
intvec_80_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_80_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_67:
	mov 0x7e1, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc007  ! 118: LDDF_R	ldd	[%r31, %r7], %f18
intveclr_80_68:
	setx 0xac1b6858b65dfefb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x3128bdf7aa0938cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d940013  ! 121: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	setx 0xc44d1f1faa3e2050, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a0c9cb  ! 123: FDIVd	fdivd	%f34, %f42, %f48
splash_cmpr_80_72:
	setx 0xe2ba38b81f66b8b8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8037ca  ! 125: SIR	sir	0x17ca
jmptr_80_73:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903976  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x1976, %pstate
	.word 0xc36c6de2  ! 128: PREFETCH_I	prefetch	[%r17 + 0x0de2], #one_read
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f802756  ! 130: SIR	sir	0x0756
	.word 0x87ac4a42  ! 131: FCMPd	fcmpd	%fcc<n>, %f48, %f2
	.word 0xe8bfe020  ! 132: STDA_I	stda	%r20, [%r31 + 0x0020] %asi
splash_htba_80_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_80_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a249ca  ! 1: FDIVd	fdivd	%f40, %f10, %f18
	normalw
	.word 0x91458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r8
change_to_randtl_80_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_78:
	.word 0x8f902000  ! 135: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_80_79:
	set 0xf6b074c5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e011  ! 137: STF_I	st	%f20, [0x0011, %r31]
splash_cmpr_80_80:
	setx 0x314bc6b203a5923a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02032  ! 139: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xe8cfe020  ! 140: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
splash_htba_80_81:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe187c2c0  ! 142: LDFA_R	lda	[%r31, %r0], %f16
jmptr_80_82:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc36cf334  ! 144: PREFETCH_I	prefetch	[%r19 + 0xfffff334], #one_read
splash_decr_80_84:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7820001  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r1, %-
splash_lsu_80_85:
	set 0x3274b738, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_86:
	setx 0x915287053fc43fb4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a00171  ! 148: FABSq	dis not found

	.word 0x93a0016a  ! 149: FABSq	dis not found

pmu_80_87:
	nop
	setx 0xfffffa4efffff106, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00173  ! 151: FABSq	dis not found

mondo_80_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d944003  ! 152: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
	.word 0xda57e008  ! 153: LDSH_I	ldsh	[%r31 + 0x0008], %r13
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_89:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 154: RDPC	rd	%pc, %r12
intveclr_80_90:
	setx 0x2df2a47653e716f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d948006  ! 156: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
donret_80_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_92-donret_80_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b9ef1e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb54, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	retry
donretarg_80_92:
	.word 0xd6ffe051  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x0051] %asi
splash_decr_80_93:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7850008  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r8, %-
mondo_80_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 159: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
memptr_80_95:
	set 0x60340000, %r31
	.word 0x8584a456  ! 160: WRCCR_I	wr	%r18, 0x0456, %ccr
debug_80_96:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 161: CASA_R	casa	[%r31] %asi, %r20, %r11
memptr_80_97:
	set 0x60140000, %r31
	.word 0x8582f691  ! 162: WRCCR_I	wr	%r11, 0x1691, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_98) + 48, 16, 16)) -> intp(4,0,15)
intvec_80_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_99:
	.word 0x819826fd  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06fd, %hpstate
	.word 0xd727e0c2  ! 165: STF_I	st	%f11, [0x00c2, %r31]
	.word 0xe6390012  ! 166: STD_R	std	%r19, [%r4 + %r18]
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0xa1a00166  ! 168: FABSq	dis not found

fpinit_80_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 169: FCMPd	fcmpd	%fcc<n>, %f0, %f4
DS_80_102:
	.word 0xa7a489d3  ! 1: FDIVd	fdivd	%f18, %f50, %f50
	allclean
	.word 0x91b2c310  ! 170: ALIGNADDRESS	alignaddr	%r11, %r16, %r8
mondo_80_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d918010  ! 171: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
pmu_80_104:
	nop
	setx 0xfffffdf0fffffe07, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xa5a4c9d3  ! 174: FDIVd	fdivd	%f50, %f50, %f18
	.word 0x91a00172  ! 175: FABSq	dis not found

	.word 0x9bb40490  ! 176: FCMPLE32	fcmple32	%d16, %d16, %r13
	.word 0xd44fe020  ! 177: LDSB_I	ldsb	[%r31 + 0x0020], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_80_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94800b  ! 179: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xe187dc00  ! 181: LDFA_R	lda	[%r31, %r0], %f16
tagged_80_106:
	tsubcctv %r11, 0x14aa, %r8
	.word 0xd407e05d  ! 182: LDUW_I	lduw	[%r31 + 0x005d], %r10
mondo_80_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d934014  ! 183: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_108) + 16, 16, 16)) -> intp(0,0,22)
intvec_80_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e000  ! 186: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	.word 0xab826c19  ! 187: WR_CLEAR_SOFTINT_I	wr	%r9, 0x0c19, %clear_softint
splash_hpstate_80_109:
	.word 0x2cca8001  ! 1: BRGZ	brgz,a,pt	%r10,<label_0xa8001>
	.word 0x81982d07  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
mondo_80_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d910010  ! 189: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
	.word 0xc1bfdc00  ! 190: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_80_111:
	setx 0x7c6c67c55d17b1e2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d940004  ! 192: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
intveclr_80_113:
	setx 0x300a2f886be6aa48, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0xc3ed0021  ! 195: PREFETCHA_R	prefetcha	[%r20, %r1] 0x01, #one_read
debug_80_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_115:
	mov 0x770, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc005  ! 196: LDDF_R	ldd	[%r31, %r5], %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0x17e4c5d680dc75ee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_118:
	setx 0x25bff3b9717d1ef5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8039af  ! 200: SIR	sir	0x19af
	ta	T_CHANGE_NONPRIV	! macro
pmu_80_119:
	nop
	setx 0xffffffebfffffa93, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_120) + 40, 16, 16)) -> intp(5,0,18)
intvec_80_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe0cc  ! 204: STD_I	std	%r16, [%r31 + 0x00cc]
fpinit_80_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 205: FCMPd	fcmpd	%fcc<n>, %f0, %f4
pmu_80_122:
	nop
	setx 0xfffffa06fffff26e, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xdbe4c028  ! 207: CASA_I	casa	[%r19] 0x 1, %r8, %r13
	.word 0xd23fe05e  ! 208: STD_I	std	%r9, [%r31 + 0x005e]
	.word 0x95a00174  ! 209: FABSq	dis not found

splash_cmpr_80_124:
	setx 0xd8bc24a913de9828, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd9e4c032  ! 211: CASA_I	casa	[%r19] 0x 1, %r18, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_80_127:
	setx 0x73af18957b9b428e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe030  ! 214: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_128) + 8, 16, 16)) -> intp(6,0,3)
intvec_80_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903792  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x1792, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_130) + 0, 16, 16)) -> intp(5,0,23)
intvec_80_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 218: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_131:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 219: RDPC	rd	%pc, %r12
	.word 0xa9a189d3  ! 220: FDIVd	fdivd	%f6, %f50, %f20
splash_cmpr_80_132:
	setx 0x9355a538c40b5009, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e026  ! 222: STH_I	sth	%r20, [%r31 + 0x0026]
jmptr_80_133:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_80_134:
	nop
	setx 0xfffff70cfffff881, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x65224a92990a72c0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_80_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_136:
	mov 0x707, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x20,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8dfc032  ! 226: LDXA_R	ldxa	[%r31, %r18] 0x01, %r20
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x87ac0a51  ! 230: FCMPd	fcmpd	%fcc<n>, %f16, %f48
	rd %pc, %r19
	add %r19, (ivw_80_140-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_140:
	.word 0x9191800b  ! 231: WRPR_PIL_R	wrpr	%r6, %r11, %pil
mondo_80_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d904006  ! 232: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
	.word 0x9f803565  ! 233: SIR	sir	0x1565
pmu_80_142:
	nop
	setx 0xfffff524ffffffa9, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91932f34  ! 235: WRPR_PIL_I	wrpr	%r12, 0x0f34, %pil
splash_hpstate_80_143:
	.word 0x8198294c  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0xa3b1c7ed  ! 237: PDISTN	fmean16	%d38, %d44, %d48
memptr_80_144:
	set user_data_start, %r31
	.word 0x85847329  ! 238: WRCCR_I	wr	%r17, 0x1329, %ccr
mondo_80_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 239: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xa3a489a2  ! 240: FDIVs	fdivs	%f18, %f2, %f17
pmu_80_147:
	nop
	setx 0xfffffdbffffff6e0, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_80_148:
	setx 0x3ab718ea5e379d6e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a509d0  ! 244: FDIVd	fdivd	%f20, %f16, %f40
	rd %pc, %r19
	add %r19, (ivw_80_149-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_149:
	.word 0x91944003  ! 245: WRPR_PIL_R	wrpr	%r17, %r3, %pil
fpinit_80_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 246: FDIVd	fdivd	%f0, %f4, %f4
mondo_80_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d908005  ! 247: WRPR_WSTATE_R	wrpr	%r2, %r5, %wstate
invtsb_80_152:
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
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_80_153:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc028  ! 249: LDXA_R	ldxa	[%r31, %r8] 0x01, %r11
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_80_155:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d90245f  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_80_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_157:
	mov 0x5b6, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+24), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd73fc008  ! 254: STDF_R	std	%f11, [%r8, %r31]
intveclr_80_158:
	setx 0xe3a724bd9b402528, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_159-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_159:
	.word 0x91924007  ! 256: WRPR_PIL_R	wrpr	%r9, %r7, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_80_160:
	set 0xc2105713, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d928007  ! 259: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	.word 0xa3a00165  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_163:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 263: RDPC	rd	%pc, %r20
mondo_80_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94800a  ! 264: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_80_165:
	set user_data_start, %r31
	.word 0x85843a13  ! 266: WRCCR_I	wr	%r16, 0x1a13, %ccr
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_168) + 8, 16, 16)) -> intp(0,0,17)
intvec_80_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_80_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_169:
	mov 0x5cf, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x10,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe63fe8cf  ! 270: STD_I	std	%r19, [%r31 + 0x08cf]
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x94fa05a4d0d41222, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_80_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 273: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xab840006  ! 274: WR_CLEAR_SOFTINT_R	wr	%r16, %r6, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e010  ! 276: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_80_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d94c004  ! 278: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
memptr_80_174:
	set user_data_start, %r31
	.word 0x8581b614  ! 279: WRCCR_I	wr	%r6, 0x1614, %ccr
	.word 0x8d90251e  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x051e, %pstate
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 281: RDPC	rd	%pc, %r16
	.word 0xa9520000  ! 282: RDPR_PIL	rdpr	%pil, %r20
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_177:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 283: RDPC	rd	%pc, %r13
fpinit_80_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 284: FDIVd	fdivd	%f0, %f4, %f8
	setx 0x293f736f9434dbd4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_80_180:
	tsubcctv %r1, 0x1e21, %r4
	.word 0xd007e07a  ! 286: LDUW_I	lduw	[%r31 + 0x007a], %r8
debug_80_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_181:
	mov 0x6a8, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x20,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc025  ! 287: LDXA_R	ldxa	[%r31, %r5] 0x01, %r8
DS_80_182:
	.word 0x97a109d2  ! 1: FDIVd	fdivd	%f4, %f18, %f42
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 291: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_184:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xd9e4002b  ! 293: CASA_I	casa	[%r16] 0x 1, %r11, %r12
tagged_80_186:
	tsubcctv %r1, 0x1c37, %r18
	.word 0xe607e07d  ! 294: LDUW_I	lduw	[%r31 + 0x007d], %r19
	setx 0x77694443b63e1f43, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x997021de  ! 296: POPC_I	popc	0x01de, %r12
intveclr_80_188:
	setx 0x0bd3710fcca23d7f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_80_190:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_80_191:
	setx 0xbadb844243260faf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_80_192:
	setx 0x3f5c75755baccdfd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_80_193:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa782c001  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r1, %-
	.word 0xa5a00166  ! 305: FABSq	dis not found

pmu_80_194:
	nop
	setx 0xfffff6e5ffffff06, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b2  ! 307: Tcc_I	tne	icc_or_xcc, %r0 + 178
memptr_80_195:
	set user_data_start, %r31
	.word 0x858477b3  ! 308: WRCCR_I	wr	%r17, 0x17b3, %ccr
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_196:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 309: RDPC	rd	%pc, %r13
	.word 0xa7450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r19
pmu_80_197:
	nop
	setx 0xffffff3afffff005, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 312: RDPC	rd	%pc, %r16
	.word 0x99520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_200) + 48, 16, 16)) -> intp(3,0,30)
intvec_80_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_201:
	setx 0x2e24e819dc4e4d2a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_80_202-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_202:
	.word 0x9190c007  ! 317: WRPR_PIL_R	wrpr	%r3, %r7, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_80_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_203:
	mov 0xc4a, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 319: CASA_R	casa	[%r31] %asi, %r20, %r17
donret_80_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_204-donret_80_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001b9fd3 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x95d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	retry
donretarg_80_204:
	.word 0xe2ffe0f9  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x00f9] %asi
	.word 0x87a8ca53  ! 321: FCMPd	fcmpd	%fcc<n>, %f34, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_206)+16, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_206:
	.word 0xa98437df  ! 322: WR_SET_SOFTINT_I	wr	%r16, 0x17df, %set_softint
	.word 0x97b104d3  ! 323: FCMPNE32	fcmpne32	%d4, %d50, %r11
mondo_80_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d90c014  ! 324: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	setx 0x86683e4c2c1f0bee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_80_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d920002  ! 326: WRPR_WSTATE_R	wrpr	%r8, %r2, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_212) + 24, 16, 16)) -> intp(7,0,8)
intvec_80_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_80_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 330: FCMPd	fcmpd	%fcc<n>, %f0, %f4
DS_80_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f4, %f18
	.word 0xa1b48310  ! 331: ALIGNADDRESS	alignaddr	%r18, %r16, %r16
	.word 0xd49fd100  ! 332: LDDA_R	ldda	[%r31, %r0] 0x88, %r10
intveclr_80_215:
	setx 0x169cf27ee5e847ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_216-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_216:
	.word 0x9190c012  ! 334: WRPR_PIL_R	wrpr	%r3, %r18, %pil
change_to_randtl_80_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_217:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0xd27, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b4c7f2  ! 336: PDISTN	fmean16	%d50, %d18, %d20
memptr_80_218:
	set 0x60140000, %r31
	.word 0x8583644e  ! 337: WRCCR_I	wr	%r13, 0x044e, %ccr
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_80_220:
	setx 0x1edb36efeaad6ede, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_80_221:
	taddcctv %r9, 0x1d81, %r2
	.word 0xe807e0b0  ! 340: LDUW_I	lduw	[%r31 + 0x00b0], %r20
	.word 0x9f803b01  ! 341: SIR	sir	0x1b01
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 342: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa5a0016b  ! 343: FABSq	dis not found

	.word 0xa1a1c9d3  ! 344: FDIVd	fdivd	%f38, %f50, %f16
donret_80_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_222-donret_80_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ffa329 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x39d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_222:
	.word 0xe2ffe000  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x0000] %asi
	.word 0xe187e000  ! 346: LDFA_I	lda	[%r31, 0x0000], %f16
	rd %pc, %r19
	add %r19, (ivw_80_223-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_223:
	.word 0x9194c010  ! 347: WRPR_PIL_R	wrpr	%r19, %r16, %pil
cwp_80_224:
    set user_data_start, %o7
	.word 0x93902007  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91a1c9c5  ! 349: FDIVd	fdivd	%f38, %f36, %f8
DS_80_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb3324e0  ! 1: STQF_I	-	%f13, [0x04e0, %r12]
	normalw
	.word 0x95458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r10
pmu_80_226:
	nop
	setx 0xfffff496fffffd3f, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_80_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f30, %f12, %f4
	.word 0xa3b44311  ! 352: ALIGNADDRESS	alignaddr	%r17, %r17, %r17
splash_hpstate_80_228:
	.word 0x8198250c  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050c, %hpstate
splash_cmpr_80_229:
	setx 0xce854fd4279e11f9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a4c9c3  ! 355: FDIVd	fdivd	%f50, %f34, %f20
memptr_80_230:
	set 0x60540000, %r31
	.word 0x85816e0b  ! 356: WRCCR_I	wr	%r5, 0x0e0b, %ccr
	.word 0xa9a00168  ! 357: FABSq	dis not found

DS_80_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_80_232:
	nop
	setx 0xfffffb0afffff1ed, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d902e6d  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x0e6d, %pstate
fpinit_80_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 362: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0xe927e032  ! 363: STF_I	st	%f20, [0x0032, %r31]
fpinit_80_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 364: FDIVs	fdivs	%f0, %f4, %f8
	.word 0x91d020b4  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_80_236:
	setx 0x4aba47f1f4daadd3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_80_237:
	set user_data_start, %r31
	.word 0x85837b80  ! 367: WRCCR_I	wr	%r13, 0x1b80, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_238) + 48, 16, 16)) -> intp(0,0,8)
intvec_80_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_239:
	nop
	setx 0xfffffe10fffffb0d, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_240:
	set 0xd1fb6bd4, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0x7855c6d6fdb027a2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_80_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_242-donret_80_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00262a5d | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	retry
donretarg_80_242:
	.word 0xe8ffe0b4  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x00b4] %asi
pmu_80_243:
	nop
	setx 0xfffffe7bfffff2d8, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe8800ae0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
	.word 0xa3a00160  ! 376: FABSq	dis not found

	.word 0xab833c33  ! 377: WR_CLEAR_SOFTINT_I	wr	%r12, 0x1c33, %clear_softint
jmptr_80_244:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_80_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 379: FDIVs	fdivs	%f0, %f4, %f4
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_80_246:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_80_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_247:
	mov 0x765, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe23fe60a  ! 382: STD_I	std	%r17, [%r31 + 0x060a]
donret_80_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_248-donret_80_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0xac46 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x61e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_80_248:
	.word 0xe2ffe01c  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x001c] %asi
DS_80_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_80_250:
	tsubcctv %r5, 0x18a5, %r7
	.word 0xe207e099  ! 385: LDUW_I	lduw	[%r31 + 0x0099], %r17
pmu_80_251:
	nop
	setx 0xfffff061fffffb54, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_80_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 387: FDIVd	fdivd	%f0, %f4, %f4
splash_decr_80_253:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7848012  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r18, %-
splash_cmpr_80_254:
	setx 0xf8417b991730ac41, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_80_255:
	set user_data_start, %r31
	.word 0x85836765  ! 390: WRCCR_I	wr	%r13, 0x0765, %ccr
splash_lsu_80_256:
	set 0x219ffe55, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87ad0a4a  ! 392: FCMPd	fcmpd	%fcc<n>, %f20, %f10
mondo_80_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d900013  ! 393: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xc1bfdc00  ! 395: STDFA_R	stda	%f0, [%r0, %r31]
donret_80_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_260-donret_80_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bc07a5 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_260:
	.word 0xe0ffe070  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x0070] %asi
	.word 0xa9b24480  ! 397: FCMPLE32	fcmple32	%d40, %d0, %r20
intveclr_80_262:
	setx 0x46e94dec70434976, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_80_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe93227d3  ! 1: STQF_I	-	%f20, [0x07d3, %r8]
	normalw
	.word 0x99458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r12
DS_80_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_80_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 402: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0x93a00173  ! 403: FABSq	dis not found

mondo_80_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d920014  ! 404: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_267:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 405: RDPC	rd	%pc, %r10
mondo_80_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d900011  ! 406: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0x93540000  ! 407: RDPR_GL	rdpr	%-, %r9
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
    set (0x00478c2b | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9d6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_269:
	.word 0xe4ffe04e  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x004e] %asi
	.word 0x99902003  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 410: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 411: RDPC	rd	%pc, %r20
	.word 0x91d020b3  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa7b487f2  ! 413: PDISTN	fmean16	%d18, %d18, %d50
splash_cmpr_80_272:
	setx 0xfb071f2f3acd4940, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_80_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_273-donret_80_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cd3e04 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf55, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_273:
	.word 0xe0ffe0f4  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x00f4] %asi
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_274:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 416: RDPC	rd	%pc, %r16
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_80_275:
	set 0x60340000, %r31
	.word 0x858262ac  ! 418: WRCCR_I	wr	%r9, 0x02ac, %ccr
splash_hpstate_80_276:
	.word 0x8198213d  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x013d, %hpstate
intveclr_80_277:
	setx 0xc91f6d79dda2aed5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_80_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_278:
	mov 0xc87, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc031  ! 421: LDXA_R	ldxa	[%r31, %r17] 0x01, %r16
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_279:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 422: RDPC	rd	%pc, %r17
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x91d020b2  ! 424: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_80_280:
	setx 0xa30ca72db64d2b6d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_281)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_281:
	.word 0xa982223f  ! 426: WR_SET_SOFTINT_I	wr	%r8, 0x023f, %set_softint
	.word 0xc187da00  ! 427: LDFA_R	lda	[%r31, %r0], %f0
donret_80_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_282-donret_80_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0090a696 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x74f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_282:
	.word 0xd4ffe07c  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x007c] %asi
	.word 0x83d020b3  ! 429: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x24cc4001  ! 430: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 432: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802453  ! 433: SIR	sir	0x0453
pmu_80_284:
	nop
	setx 0xfffffd68fffff8ee, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe008  ! 435: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r19
debug_80_285:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe697c031  ! 436: LDUHA_R	lduha	[%r31, %r17] 0x01, %r19
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_80_286:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_80_287:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xa3500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_80_290:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_80_291:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe000  ! 446: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_80_292-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_292:
	.word 0x9194400b  ! 447: WRPR_PIL_R	wrpr	%r17, %r11, %pil
splash_cmpr_80_293:
	setx 0xcbb4ba0812cc9e44, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_80_294:
	setx 0x71aa20f87e2f3739, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_80_295:
	setx 0x3a0fa8f324558843, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e008  ! 451: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r11
	.word 0x93d020b2  ! 452: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_hpstate_80_296:
	.word 0x819827d6  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d6, %hpstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_298) + 48, 16, 16)) -> intp(1,0,2)
intvec_80_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 50
	setx 0x3a3b22637675c797, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a189d4  ! 458: FDIVd	fdivd	%f6, %f20, %f12
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_80_300-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_300:
	.word 0x9194000b  ! 460: WRPR_PIL_R	wrpr	%r16, %r11, %pil
DS_80_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
jmptr_80_302:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_80_303:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe617  ! 463: STD_I	std	%r16, [%r31 + 0x0617]
pmu_80_304:
	nop
	setx 0xfffff59bfffffca7, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_305:
	nop
	setx 0xfffff8d1fffffa69, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_306:
	setx 0x0fd0b0d95a482692, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a449d4  ! 467: FDIVd	fdivd	%f48, %f20, %f42
    set 0xa7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b0c7f0  ! 468: PDISTN	fmean16	%d34, %d16, %d12
	.word 0xa9a00161  ! 469: FABSq	dis not found

    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xc1bfdc00  ! 471: STDFA_R	stda	%f0, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_308) + 40, 16, 16)) -> intp(1,0,13)
intvec_80_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 473: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd937e040  ! 474: STQF_I	-	%f12, [0x0040, %r31]
tagged_80_309:
	taddcctv %r8, 0x1537, %r18
	.word 0xd807e030  ! 475: LDUW_I	lduw	[%r31 + 0x0030], %r12
	.word 0xc36a7b0c  ! 476: PREFETCH_I	prefetch	[%r9 + 0xfffffb0c], #one_read
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_80_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 478: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xa7a00170  ! 479: FABSq	dis not found

	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_80_313:
	setx 0xeadd84cb3afb56d0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_80_314:
	setx 0x986c6ab59e0a2356, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
invtsb_80_315:
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
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_80_317:
	taddcctv %r4, 0x14ed, %r12
	.word 0xe407e0e8  ! 485: LDUW_I	lduw	[%r31 + 0x00e8], %r18
donret_80_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_318-donret_80_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0059ee58 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	retry
donretarg_80_318:
	.word 0xe4ffe0a4  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x00a4] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0x97464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x93702990  ! 489: POPC_I	popc	0x0990, %r9
	.word 0x8d903de2  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x1de2, %pstate
	.word 0xe62fe09d  ! 491: STB_I	stb	%r19, [%r31 + 0x009d]
splash_htba_80_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_321:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 493: RDPC	rd	%pc, %r9
	.word 0xad80b0ec  ! 494: WR_SOFTINT_REG_I	wr	%r2, 0x10ec, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f802c06  ! 496: SIR	sir	0x0c06
	.word 0x97a149ca  ! 497: FDIVd	fdivd	%f36, %f10, %f42
jmptr_80_322:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_80_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 500: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0xd86fe014  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x0014]
	.word 0x9f803a3d  ! 502: SIR	sir	0x1a3d
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_324) + 0, 16, 16)) -> intp(5,0,22)
intvec_80_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_325:
	nop
	setx 0xfffffb86fffff891, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x97a00171  ! 506: FABSq	dis not found

splash_lsu_80_327:
	set 0x67e7f669, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe23cc00d  ! 508: STD_R	std	%r17, [%r19 + %r13]
	.word 0xe83fe031  ! 509: STD_I	std	%r20, [%r31 + 0x0031]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 510: RDPC	rd	%pc, %r20
	.word 0xe187e0c0  ! 511: LDFA_I	lda	[%r31, 0x00c0], %f16
intveclr_80_330:
	setx 0x45acc28f95ba7850, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_331:
	.word 0x81982d1c  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1c, %hpstate
DS_80_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe534c011  ! 1: STQF_R	-	%f18, [%r17, %r19]
	normalw
	.word 0xa7458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r19
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_333:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 515: RDPC	rd	%pc, %r10
jmptr_80_334:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe0c6  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x00c6]
splash_tba_80_335:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc3eb4023  ! 519: PREFETCHA_R	prefetcha	[%r13, %r3] 0x01, #one_read
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_336:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 520: RDPC	rd	%pc, %r19
intveclr_80_337:
	setx 0x2fad7fb835687447, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r11
mondo_80_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 523: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
intveclr_80_339:
	setx 0x7486656a16e78cfb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d924001  ! 525: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
splash_hpstate_80_341:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982a54  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a54, %hpstate
	.word 0xe26fe070  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x0070]
splash_lsu_80_342:
	set 0xaaac9f4c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 529: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_80_344:
	tsubcctv %r17, 0x1be9, %r19
	.word 0xd807e0cc  ! 530: LDUW_I	lduw	[%r31 + 0x00cc], %r12
	.word 0xd8cfe030  ! 531: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
pmu_80_345:
	nop
	setx 0xfffff546fffff571, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e000  ! 533: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_80_346:
	setx 0xb0097689e0ba422f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_347:
	setx 0xe948d33bb17c8d96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfde00  ! 537: STDFA_R	stda	%f16, [%r0, %r31]
donret_80_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_348-donret_80_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007fe855 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcc5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	retry
donretarg_80_348:
	.word 0xd8ffe052  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x0052] %asi
	.word 0xe1bfc2c0  ! 539: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa9818001  ! 540: WR_SET_SOFTINT_R	wr	%r6, %r1, %set_softint
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f8026ee  ! 542: SIR	sir	0x06ee
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 543: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_80_349:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_80_350:
	set 0xedcffcdb, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc400  ! 546: LDDA_R	ldda	[%r31, %r0] 0x20, %r12
intveclr_80_351:
	setx 0x2ebed2adf0a48116, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_80_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 548: FDIVd	fdivd	%f0, %f4, %f4
intveclr_80_353:
	setx 0xb38823e281e4976d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 550: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_354:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 551: RDPC	rd	%pc, %r16
	setx 0xe306b58a327a0ce3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_358) + 16, 16, 16)) -> intp(1,0,30)
intvec_80_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x89eacf14284fc5d2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 557: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 558: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd71fe010  ! 559: LDDF_I	ldd	[%r31, 0x0010], %f11
mondo_80_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 560: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
intveclr_80_361:
	setx 0xd03fe33c36f34420, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_362:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 562: RDPC	rd	%pc, %r20
splash_tba_80_363:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_80_364:
	setx 0xc902e240e8735e41, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0x91a449d3  ! 566: FDIVd	fdivd	%f48, %f50, %f8
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 568: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_80_366:
	nop
	setx 0xfffffc31fffff9e8, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_367:
	setx 0x931c5715d243d849, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_369:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 572: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_80_370-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_370:
	.word 0x9194c014  ! 573: WRPR_PIL_R	wrpr	%r19, %r20, %pil
mondo_80_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d950010  ! 574: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
mondo_80_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d94c007  ! 575: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
DS_80_373:
	.word 0x97a4c9c1  ! 1: FDIVd	fdivd	%f50, %f32, %f42
	pdist %f12, %f20, %f12
	.word 0xa1b44311  ! 576: ALIGNADDRESS	alignaddr	%r17, %r17, %r16
	.word 0x95a449a2  ! 577: FDIVs	fdivs	%f17, %f2, %f10
debug_80_375:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc012  ! 578: STDF_R	std	%f12, [%r18, %r31]
splash_hpstate_80_376:
	.word 0x81982e1c  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
	.word 0xe187e0e0  ! 580: LDFA_I	lda	[%r31, 0x00e0], %f16
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_377:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 581: RDPC	rd	%pc, %r10
mondo_80_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d94c014  ! 582: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
intveclr_80_379:
	setx 0x4205afe81538341a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_80_381:
	set 0x104755a5, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87ac0a50  ! 586: FCMPd	fcmpd	%fcc<n>, %f16, %f16
tagged_80_383:
	taddcctv %r5, 0x17f2, %r18
	.word 0xd807e0dc  ! 587: LDUW_I	lduw	[%r31 + 0x00dc], %r12
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_384:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 588: RDPC	rd	%pc, %r18
	.word 0x97a089c3  ! 589: FDIVd	fdivd	%f2, %f34, %f42
pmu_80_385:
	nop
	setx 0xfffff24efffffdf5, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_80_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f28, %f2, %f26
	.word 0x99b3030d  ! 591: ALIGNADDRESS	alignaddr	%r12, %r13, %r12
jmptr_80_387:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91d02032  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_80_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_80_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 595: FDIVd	fdivd	%f0, %f4, %f6
splash_hpstate_80_390:
	.word 0x819827c6  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c6, %hpstate
	.word 0x8d902412  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
cwp_80_392:
    set user_data_start, %o7
	.word 0x93902002  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x24c84001  ! 599: BRLEZ	brlez,a,pt	%r1,<label_0x84001>
donret_80_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_394-donret_80_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f3d31e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x894, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	retry
donretarg_80_394:
	.word 0xd8ffe094  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x0094] %asi
	.word 0x977039d0  ! 601: POPC_I	popc	0x19d0, %r11
mondo_80_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d940000  ! 602: WRPR_WSTATE_R	wrpr	%r16, %r0, %wstate
jmptr_80_396:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_80_397:
	setx 0xf26f7e3037447a7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_398:
	nop
	setx 0xfffff66bfffff76e, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_80_399:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc030  ! 606: LDXA_R	ldxa	[%r31, %r16] 0x01, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_400)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_400:
	.word 0xa98525c5  ! 607: WR_SET_SOFTINT_I	wr	%r20, 0x05c5, %set_softint
	rd %pc, %r19
	add %r19, (ivw_80_401-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_401:
	.word 0x9191400b  ! 608: WRPR_PIL_R	wrpr	%r5, %r11, %pil
	.word 0x9f80236d  ! 609: SIR	sir	0x036d
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_402) + 48, 16, 16)) -> intp(0,0,20)
intvec_80_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_80_403:
	set 0x60340000, %r31
	.word 0x85833a74  ! 611: WRCCR_I	wr	%r12, 0x1a74, %ccr
	.word 0xe46fe046  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x0046]
cwp_80_404:
    set user_data_start, %o7
	.word 0x93902005  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_405)+48, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_405:
	.word 0xa984f6e1  ! 614: WR_SET_SOFTINT_I	wr	%r19, 0x16e1, %set_softint
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d902fa9  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x0fa9, %pstate
mondo_80_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d900009  ! 616: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
debug_80_408:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe43ff1c9  ! 617: STD_I	std	%r18, [%r31 + 0xfffff1c9]
pmu_80_409:
	nop
	setx 0xfffff9d5fffff250, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_410:
	setx 0x55ac19b080ff4047, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1500000  ! 620: RDPR_TPC	rdpr	%tpc, %r16
	setx 0xe4ffec204b7bdba4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93b20493  ! 622: FCMPLE32	fcmple32	%d8, %d50, %r9
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e0ac  ! 624: STF_I	st	%f19, [0x00ac, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_80_413:
	nop
	setx 0xfffff41ffffffc97, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_80_414-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_414:
	.word 0x91920012  ! 627: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	.word 0x9194bb80  ! 628: WRPR_PIL_I	wrpr	%r18, 0x1b80, %pil
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_415:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 629: RDPC	rd	%pc, %r18
change_to_randtl_80_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_416:
	.word 0x8f902000  ! 630: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 632: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_80_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 635: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa1464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r16
donret_80_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_420-donret_80_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0046aff4 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x145, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x24ca8001  ! 1: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
	retry
donretarg_80_420:
	.word 0xd6ffe05c  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x005c] %asi
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_421:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 638: RDPC	rd	%pc, %r18
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_80_422-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_422:
	.word 0x91910011  ! 640: WRPR_PIL_R	wrpr	%r4, %r17, %pil
splash_cmpr_80_423:
	setx 0x0c93b2f4e08ffbeb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_80_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_424-donret_80_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0092ae67 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd07, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	retry
donretarg_80_424:
	.word 0xe0ffe09f  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x009f] %asi
	.word 0xa5a00171  ! 643: FABSq	dis not found

memptr_80_425:
	set 0x60340000, %r31
	.word 0x8585267d  ! 644: WRCCR_I	wr	%r20, 0x067d, %ccr
	.word 0xe48fe000  ! 645: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
splash_cmpr_80_426:
	setx 0x4ecbd484ee964a71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x18ab1e20074ad19b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_80_428:
	nop
	setx 0xfffffdf7fffff9ab, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e038  ! 650: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r18
	.word 0xe46fe0c1  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x00c1]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a00173  ! 653: FABSq	dis not found

	.word 0xe6800aa0  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r19
splash_lsu_80_429:
	set 0xe6bd897a, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1540000  ! 656: RDPR_GL	rdpr	%-, %r16
	.word 0x9f802473  ! 657: SIR	sir	0x0473
	.word 0xe8388010  ! 658: STD_R	std	%r20, [%r2 + %r16]
	rd %pc, %r19
	add %r19, (ivw_80_431-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_431:
	.word 0x91910012  ! 659: WRPR_PIL_R	wrpr	%r4, %r18, %pil
DS_80_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc956e15c	! Random illegal ?
	.word 0xa9a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a4c827  ! 660: FADDs	fadds	%f19, %f7, %f9
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 661: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 662: Tcc_R	te	icc_or_xcc, %r0 + %r30
donret_80_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_433-donret_80_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009e509f | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xddd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_433:
	.word 0xd8ffe088  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x0088] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_80_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3347373  ! 1: STQF_I	-	%f17, [0x1373, %r17]
	normalw
	.word 0x95458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r10
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_436:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 666: RDPC	rd	%pc, %r18
splash_htba_80_437:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_438)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_438:
	.word 0xa981b439  ! 668: WR_SET_SOFTINT_I	wr	%r6, 0x1439, %set_softint
pmu_80_439:
	nop
	setx 0xfffff8a3fffff154, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87a80a46  ! 670: FCMPd	fcmpd	%fcc<n>, %f0, %f6
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_440) + 8, 16, 16)) -> intp(1,0,24)
intvec_80_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_80_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d903993  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x1993, %pstate
splash_hpstate_80_443:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x81982b1e  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1e, %hpstate
pmu_80_444:
	nop
	setx 0xfffff274fffffbf7, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_decr_80_445:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7800008  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r8, %-
	.word 0xda77e0e0  ! 678: STX_I	stx	%r13, [%r31 + 0x00e0]
jmptr_80_446:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f803dec  ! 680: SIR	sir	0x1dec
DS_80_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a00554  ! 1: FSQRTd	fsqrt	
	.word 0x91a44830  ! 681: FADDs	fadds	%f17, %f16, %f8
	.word 0xda37e0a2  ! 682: STH_I	sth	%r13, [%r31 + 0x00a2]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_448:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 683: RDPC	rd	%pc, %r8
pmu_80_449:
	nop
	setx 0xfffff292fffffd74, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_450:
	set 0x73c1dfb0, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x5fdd81dde316c18b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_452:
	setx 0x11c672144a8d799d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_80_454:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x819829c7  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_80_455:
	setx 0x9a1f79df523a4a0a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e028  ! 692: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r9
splash_lsu_80_456:
	set 0xb02a1d40, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab8426f6  ! 694: WR_CLEAR_SOFTINT_I	wr	%r16, 0x06f6, %clear_softint
memptr_80_457:
	set 0x60740000, %r31
	.word 0x8582b4d7  ! 695: WRCCR_I	wr	%r10, 0x14d7, %ccr
splash_cmpr_80_458:
	setx 0xb3de4dd910f02ea4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_decr_80_460:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7848013  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r19, %-
	rd %pc, %r19
	add %r19, (ivw_80_461-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_461:
	.word 0x91940011  ! 700: WRPR_PIL_R	wrpr	%r16, %r17, %pil
	.word 0x9b454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0xa7a00171  ! 1: FABSq	dis not found

	.word 0xc187e0e0  ! 2: LDFA_I	lda	[%r31, 0x00e0], %f0
	.word 0xa3a0016b  ! 3: FABSq	dis not found

    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0xdbe3402b  ! 5: CASA_I	casa	[%r13] 0x 1, %r11, %r13
pmu_40_2:
	nop
	setx 0xfffff83dfffff391, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe016  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x0016]
donret_40_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_3-donret_40_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0017314e | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x74c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_3:
	.word 0xd2ffe0e4  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x00e4] %asi
jmptr_40_4:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe028  ! 10: LDDA_I	ldda	[%r31, + 0x0028] %asi, %r9
	.word 0xa5a00171  ! 11: FABSq	dis not found

DS_40_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0x99480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x95480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 15: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_40_6:
	setx 0x023e36670a94f4fb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e000  ! 17: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe4dfe020  ! 18: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r18
DS_40_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5348010  ! 1: STQF_R	-	%f10, [%r16, %r18]
	normalw
	.word 0xa9458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r20
intveclr_40_8:
	setx 0x136e20eeecbe6bcb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_9:
	nop
	setx 0xfffffb40fffffaec, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e058  ! 23: STX_I	stx	%r20, [%r31 + 0x0058]
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 24: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9ba0016a  ! 25: FABSq	dis not found

intveclr_40_10:
	setx 0x27f4f6793d812b2a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_11:
	.word 0x81982257  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0257, %hpstate
splash_tba_40_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x4d78e60196478fde, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_40_15:
	nop
	setx 0xfffff3bcffffff56, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a149d3  ! 32: FDIVd	fdivd	%f36, %f50, %f12
splash_cmpr_40_17:
	setx 0x60346b9ae7bd98f5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_40_18:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_40_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d950012  ! 35: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x93500000  ! 36: RDPR_TPC	rdpr	%tpc, %r9
jmptr_40_20:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_40_21:
	setx 0xcfdd49183488b99f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803940  ! 39: SIR	sir	0x1940
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_40_22-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_22:
	.word 0x91900013  ! 41: WRPR_PIL_R	wrpr	%r0, %r19, %pil
	.word 0xa1a00170  ! 42: FABSq	dis not found

DS_40_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a189d0  ! 1: FDIVd	fdivd	%f6, %f16, %f48
	.word 0x91a18821  ! 43: FADDs	fadds	%f6, %f1, %f8
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xa7a409c9  ! 45: FDIVd	fdivd	%f16, %f40, %f50
	.word 0xc36b2110  ! 46: PREFETCH_I	prefetch	[%r12 + 0x0110], #one_read
donret_40_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_25-donret_40_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d563b4 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9c6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_25:
	.word 0xe2ffe09a  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x009a] %asi
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 48: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe26fe04b  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x004b]
	.word 0xe26fe04b  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x004b]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xe1bfe080  ! 52: STDFA_I	stda	%f16, [0x0080, %r31]
tagged_40_26:
	tsubcctv %r0, 0x1ead, %r20
	.word 0xe207e0c0  ! 53: LDUW_I	lduw	[%r31 + 0x00c0], %r17
	rd %pc, %r19
	add %r19, (ivw_40_27-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_27:
	.word 0x9194000d  ! 54: WRPR_PIL_R	wrpr	%r16, %r13, %pil
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f803761  ! 56: SIR	sir	0x1761
splash_hpstate_40_29:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x81982f16  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f16, %hpstate
	.word 0xe277e03f  ! 58: STX_I	stx	%r17, [%r31 + 0x003f]
debug_40_30:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc014  ! 59: STDF_R	std	%f17, [%r20, %r31]
jmptr_40_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe026  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x0026]
	rd %pc, %r19
	add %r19, (ivw_40_32-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_32:
	.word 0x91928010  ! 62: WRPR_PIL_R	wrpr	%r10, %r16, %pil
	.word 0x91d02034  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xad81b569  ! 64: WR_SOFTINT_REG_I	wr	%r6, 0x1569, %softint
intveclr_40_33:
	setx 0x88ee9bd130d3da8a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903247  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1247, %pstate
	.word 0xe187de00  ! 67: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x91520000  ! 68: RDPR_PIL	rdpr	%pil, %r8
	.word 0xd8800a80  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r12
splash_cmpr_40_35:
	setx 0xd3a197afbed2e4ce, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_40_36:
	set user_data_start, %r31
	.word 0x85826d56  ! 71: WRCCR_I	wr	%r9, 0x0d56, %ccr
	rd %pc, %r19
	add %r19, (ivw_40_37-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_37:
	.word 0x91924003  ! 72: WRPR_PIL_R	wrpr	%r9, %r3, %pil
intveclr_40_38:
	setx 0x079935e5043c7bb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a289c7  ! 74: FDIVd	fdivd	%f10, %f38, %f40
	.word 0xa9a00169  ! 75: FABSq	dis not found

DS_40_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b4  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 180
pmu_40_40:
	nop
	setx 0xfffff2b6fffffd35, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2aca8001  ! 1: BRNZ	brnz,a,pt	%r10,<label_0xa8001>
	.word 0x8d903f71  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1f71, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_40_42:
	setx 0xf55630997e6c3281, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_40_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_43-donret_40_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00264d82 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe45, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_43:
	.word 0xe8ffe090  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x0090] %asi
debug_40_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_44:
	mov 0xa18, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe91fc013  ! 83: LDDF_R	ldd	[%r31, %r19], %f20
splash_htba_40_45:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_40_46:
	setx 0x748cc336d3a3cb88, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
	.word 0xc1bfe000  ! 87: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xa780fc8a  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r3, 0x1c8a, %-
	setx 0xaf9832579f52dc01, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d93400d  ! 90: WRPR_WSTATE_R	wrpr	%r13, %r13, %wstate
donret_40_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_49-donret_40_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0046fe78 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe97, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_49:
	.word 0xd8ffe0cd  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x00cd] %asi
DS_40_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91a00174  ! 93: FABSq	dis not found

	.word 0xd46fe0c2  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x00c2]
debug_40_51:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd51fc004  ! 95: LDDF_R	ldd	[%r31, %r4], %f10
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0xa145c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_52) + 24, 16, 16)) -> intp(1,0,26)
intvec_40_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_40_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_40_54-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_54:
	.word 0x9194c014  ! 100: WRPR_PIL_R	wrpr	%r19, %r20, %pil
DS_40_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd314c013  ! 1: LDQF_R	-	[%r19, %r19], %f9
	.word 0x91a10832  ! 101: FADDs	fadds	%f4, %f18, %f8
DS_40_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xf9601cdd	! Random illegal ?
	.word 0x99a00554  ! 1: FSQRTd	fsqrt	
	.word 0x9ba1c82b  ! 102: FADDs	fadds	%f7, %f11, %f13
	.word 0xd327e01c  ! 103: STF_I	st	%f9, [0x001c, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_40_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d93400a  ! 106: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
	setx 0x3b478dba136b54fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800b20  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r9
DS_40_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_40_61:
	setx 0x0126df35666f04a7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_40_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_64:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 115: RDPC	rd	%pc, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_66) + 24, 16, 16)) -> intp(5,0,23)
intvec_40_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_40_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_67:
	mov 0x6d9, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe43fe3b0  ! 118: STD_I	std	%r18, [%r31 + 0x03b0]
intveclr_40_68:
	setx 0xd44f54b0a833faec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xe96b994b868c1869, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d904013  ! 121: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	setx 0xf7eb10f9446e319f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a189d4  ! 123: FDIVd	fdivd	%f6, %f20, %f12
splash_cmpr_40_72:
	setx 0x7436a96705939755, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802f63  ! 125: SIR	sir	0x0f63
jmptr_40_73:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d9039d4  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x19d4, %pstate
	.word 0xa7a409c2  ! 128: FDIVd	fdivd	%f16, %f2, %f50
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f803f6a  ! 130: SIR	sir	0x1f6a
	.word 0x87ac8a45  ! 131: FCMPd	fcmpd	%fcc<n>, %f18, %f36
	.word 0xe8bfe040  ! 132: STDA_I	stda	%r20, [%r31 + 0x0040] %asi
splash_htba_40_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_40_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a1c9d3  ! 1: FDIVd	fdivd	%f38, %f50, %f50
	normalw
	.word 0xa9458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r20
change_to_randtl_40_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_78:
	.word 0x8f902000  ! 135: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_40_79:
	set 0xe4432d88, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e0d9  ! 137: STF_I	st	%f20, [0x00d9, %r31]
splash_cmpr_40_80:
	setx 0x342536aab9c9050a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d02033  ! 139: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe8cfe010  ! 140: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
splash_htba_40_81:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xc187dc00  ! 142: LDFA_R	lda	[%r31, %r0], %f0
jmptr_40_82:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc3696fe2  ! 144: PREFETCH_I	prefetch	[%r5 + 0x0fe2], #one_read
splash_decr_40_84:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa784c011  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r17, %-
splash_lsu_40_85:
	set 0x07542140, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_86:
	setx 0x8cbd868adf66b119, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a0016c  ! 148: FABSq	dis not found

	.word 0xa3a00169  ! 149: FABSq	dis not found

pmu_40_87:
	nop
	setx 0xfffff169fffff5fc, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a0016c  ! 151: FABSq	dis not found

mondo_40_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d91c002  ! 152: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	.word 0xda57e020  ! 153: LDSH_I	ldsh	[%r31 + 0x0020], %r13
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_89:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 154: RDPC	rd	%pc, %r10
intveclr_40_90:
	setx 0x8938ac173379559e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d948014  ! 156: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
donret_40_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_92-donret_40_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0005150a | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb04, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x22ca4001  ! 1: BRZ	brz,a,pt	%r9,<label_0xa4001>
	retry
donretarg_40_92:
	.word 0xd6ffe0e4  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x00e4] %asi
splash_decr_40_93:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7844011  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r17, %-
mondo_40_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d908013  ! 159: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
memptr_40_95:
	set 0x60540000, %r31
	.word 0x8584f99b  ! 160: WRCCR_I	wr	%r19, 0x199b, %ccr
debug_40_96:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd6bfc034  ! 161: STDA_R	stda	%r11, [%r31 + %r20] 0x01
memptr_40_97:
	set 0x60140000, %r31
	.word 0x8584fa7e  ! 162: WRCCR_I	wr	%r19, 0x1a7e, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_98) + 32, 16, 16)) -> intp(7,0,3)
intvec_40_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_99:
	.word 0x81982bd7  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd7, %hpstate
	.word 0xd727e07d  ! 165: STF_I	st	%f11, [0x007d, %r31]
	.word 0x9bb504cc  ! 166: FCMPNE32	fcmpne32	%d20, %d12, %r13
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0xa5a00173  ! 168: FABSq	dis not found

fpinit_40_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 169: FDIVd	fdivd	%f0, %f4, %f6
DS_40_102:
	.word 0x95a409d2  ! 1: FDIVd	fdivd	%f16, %f18, %f10
	allclean
	.word 0xa7b1030d  ! 170: ALIGNADDRESS	alignaddr	%r4, %r13, %r19
mondo_40_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d930014  ! 171: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
pmu_40_104:
	nop
	setx 0xfffff7abffffff5d, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0x93a1c9c6  ! 174: FDIVd	fdivd	%f38, %f6, %f40
	.word 0xa1a00164  ! 175: FABSq	dis not found

	.word 0x97a4c9b4  ! 176: FDIVs	fdivs	%f19, %f20, %f11
	.word 0xd44fe020  ! 177: LDSB_I	ldsb	[%r31 + 0x0020], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_40_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d94c00a  ! 179: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xe187dc00  ! 181: LDFA_R	lda	[%r31, %r0], %f16
tagged_40_106:
	tsubcctv %r5, 0x1f00, %r8
	.word 0xd407e069  ! 182: LDUW_I	lduw	[%r31 + 0x0069], %r10
mondo_40_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 183: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_108) + 32, 16, 16)) -> intp(3,0,29)
intvec_40_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 185: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e018  ! 186: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r10
	.word 0xab806a6a  ! 187: WR_CLEAR_SOFTINT_I	wr	%r1, 0x0a6a, %clear_softint
splash_hpstate_40_109:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81982f5e  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
mondo_40_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d92c007  ! 189: WRPR_WSTATE_R	wrpr	%r11, %r7, %wstate
	.word 0xc1bfde00  ! 190: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_40_111:
	setx 0x4da66fd62cef5c23, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d934013  ! 192: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
intveclr_40_113:
	setx 0x594c71288f9128f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0xa5a489d0  ! 195: FDIVd	fdivd	%f18, %f16, %f18
debug_40_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_115:
	mov 0x58a, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc005  ! 196: LDDF_R	ldd	[%r31, %r5], %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0xee6e04fe8fe8f336, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_118:
	setx 0xdd873a3b3743d0a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803e7c  ! 200: SIR	sir	0x1e7c
	ta	T_CHANGE_NONPRIV	! macro
pmu_40_119:
	nop
	setx 0xfffffc21fffff848, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_120) + 40, 16, 16)) -> intp(4,0,5)
intvec_40_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe028  ! 204: STD_I	std	%r16, [%r31 + 0x0028]
fpinit_40_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e66  ! 205: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe66] %asi, #one_read
pmu_40_122:
	nop
	setx 0xfffffb3afffff318, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc36c39fe  ! 207: PREFETCH_I	prefetch	[%r16 + 0xfffff9fe], #one_read
	.word 0xd23fe02c  ! 208: STD_I	std	%r9, [%r31 + 0x002c]
	.word 0xa9a00170  ! 209: FABSq	dis not found

splash_cmpr_40_124:
	setx 0xed6f120a3cefec5b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5b084cd  ! 211: FCMPNE32	fcmpne32	%d2, %d44, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_40_127:
	setx 0x9007f32bec65e7a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe018  ! 214: LDXA_I	ldxa	[%r31, + 0x0018] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_128) + 8, 16, 16)) -> intp(3,0,2)
intvec_40_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902fba  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x0fba, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_130) + 40, 16, 16)) -> intp(7,0,12)
intvec_40_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 218: Tcc_I	te	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_131:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 219: RDPC	rd	%pc, %r10
	.word 0xa3b44489  ! 220: FCMPLE32	fcmple32	%d48, %d40, %r17
splash_cmpr_40_132:
	setx 0xcb430640d860c1e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e098  ! 222: STH_I	sth	%r20, [%r31 + 0x0098]
jmptr_40_133:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_40_134:
	nop
	setx 0xfffff90dfffff32e, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x2cef7a38c0535d12, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_40_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_136:
	mov 0x7a0, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x10,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc032  ! 226: STDA_R	stda	%r20, [%r31 + %r18] 0x01
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x99a409c1  ! 230: FDIVd	fdivd	%f16, %f32, %f12
	rd %pc, %r19
	add %r19, (ivw_40_140-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_140:
	.word 0x91900011  ! 231: WRPR_PIL_R	wrpr	%r0, %r17, %pil
mondo_40_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94400a  ! 232: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	.word 0x9f802382  ! 233: SIR	sir	0x0382
pmu_40_142:
	nop
	setx 0xfffff393fffffb35, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9192b2ac  ! 235: WRPR_PIL_I	wrpr	%r10, 0x12ac, %pil
splash_hpstate_40_143:
	.word 0x81982a45  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a45, %hpstate
	.word 0x99702ea6  ! 237: POPC_I	popc	0x0ea6, %r12
memptr_40_144:
	set user_data_start, %r31
	.word 0x8580f637  ! 238: WRCCR_I	wr	%r3, 0x1637, %ccr
mondo_40_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d948003  ! 239: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x91a449ca  ! 240: FDIVd	fdivd	%f48, %f10, %f8
pmu_40_147:
	nop
	setx 0xffffff3efffff27a, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_40_148:
	setx 0xe274a8d6c69570e7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a0c9d1  ! 244: FDIVd	fdivd	%f34, %f48, %f20
	rd %pc, %r19
	add %r19, (ivw_40_149-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_149:
	.word 0x9191c00c  ! 245: WRPR_PIL_R	wrpr	%r7, %r12, %pil
fpinit_40_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 246: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_40_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d904014  ! 247: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
invtsb_40_152:
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
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_40_153:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 249: CASA_R	casa	[%r31] %asi, %r8, %r11
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_40_155:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d902c40  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x0c40, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_40_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_157:
	mov 0x4b3, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd63ff9a6  ! 254: STD_I	std	%r11, [%r31 + 0xfffff9a6]
intveclr_40_158:
	setx 0x531edefcbd59d8c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_159-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_159:
	.word 0x91934013  ! 256: WRPR_PIL_R	wrpr	%r13, %r19, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_40_160:
	set 0xb446db3b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d900012  ! 259: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
	.word 0x99a00172  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_163:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 263: RDPC	rd	%pc, %r13
mondo_40_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 264: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 265: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_40_165:
	set user_data_start, %r31
	.word 0x85837c2c  ! 266: WRCCR_I	wr	%r13, 0x1c2c, %ccr
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_168) + 48, 16, 16)) -> intp(4,0,22)
intvec_40_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_40_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_169:
	mov 0x656, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6bfc02c  ! 270: STDA_R	stda	%r19, [%r31 + %r12] 0x01
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xbeeda023ee7d72c2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_40_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 273: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xab804001  ! 274: WR_CLEAR_SOFTINT_R	wr	%r1, %r1, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e010  ! 276: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_40_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d904010  ! 278: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
memptr_40_174:
	set user_data_start, %r31
	.word 0x8584ed0e  ! 279: WRCCR_I	wr	%r19, 0x0d0e, %ccr
	.word 0x8d902731  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x0731, %pstate
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 281: RDPC	rd	%pc, %r20
	.word 0x97520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_177:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 283: RDPC	rd	%pc, %r8
fpinit_40_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 284: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx 0xab1a578cc418793b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_40_180:
	tsubcctv %r13, 0x1b01, %r19
	.word 0xd007e0d8  ! 286: LDUW_I	lduw	[%r31 + 0x00d8], %r8
debug_40_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_181:
	mov 0x5c7, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x10,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd1e7e005  ! 287: CASA_R	casa	[%r31] %asi, %r5, %r8
DS_40_182:
	.word 0x93a349c8  ! 1: FDIVd	fdivd	%f44, %f8, %f40
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x39400001  ! 293: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_40_186:
	tsubcctv %r10, 0x1b95, %r5
	.word 0xe607e0bc  ! 294: LDUW_I	lduw	[%r31 + 0x00bc], %r19
	setx 0x5d4e4ac67e43dff3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a049a9  ! 296: FDIVs	fdivs	%f1, %f9, %f20
intveclr_40_188:
	setx 0x959e72773f03f93a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_40_190:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_40_191:
	setx 0xd7b7d59015451498, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_40_192:
	setx 0x06ebfd5978ae1ba9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_40_193:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7848006  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r6, %-
	.word 0xa9a00172  ! 305: FABSq	dis not found

pmu_40_194:
	nop
	setx 0xfffff5bdfffff7b7, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02035  ! 307: Tcc_I	tne	icc_or_xcc, %r0 + 53
memptr_40_195:
	set user_data_start, %r31
	.word 0x8580aa9e  ! 308: WRCCR_I	wr	%r2, 0x0a9e, %ccr
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 309: RDPC	rd	%pc, %r16
	.word 0x95450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r10
pmu_40_197:
	nop
	setx 0xfffffee0fffffc2e, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 312: RDPC	rd	%pc, %r20
	.word 0xa5520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_200) + 48, 16, 16)) -> intp(7,0,11)
intvec_40_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_201:
	setx 0x31d951f174c24323, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_40_202-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_202:
	.word 0x91944013  ! 317: WRPR_PIL_R	wrpr	%r17, %r19, %pil
	.word 0xe2800b00  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r17
debug_40_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_203:
	mov 0xd34, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc034  ! 319: LDXA_R	ldxa	[%r31, %r20] 0x01, %r17
donret_40_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_204-donret_40_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009735ac | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x58f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_204:
	.word 0xe2ffe092  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x0092] %asi
	.word 0xd9e50027  ! 321: CASA_I	casa	[%r20] 0x 1, %r7, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_206)+0, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_206:
	.word 0xa9813625  ! 322: WR_SET_SOFTINT_I	wr	%r4, 0x1625, %set_softint
	.word 0x24cc8001  ! 323: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
mondo_40_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d94c00c  ! 324: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	setx 0xbaf364fffd96ae47, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 326: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_212) + 24, 16, 16)) -> intp(0,0,21)
intvec_40_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_40_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 330: FCMPd	fcmpd	%fcc<n>, %f0, %f4
DS_40_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f4, %f24
	.word 0x97b08303  ! 331: ALIGNADDRESS	alignaddr	%r2, %r3, %r11
	.word 0xd49fc380  ! 332: LDDA_R	ldda	[%r31, %r0] 0x1c, %r10
intveclr_40_215:
	setx 0x7eddc39e5f691dcf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_216-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_216:
	.word 0x91900007  ! 334: WRPR_PIL_R	wrpr	%r0, %r7, %pil
change_to_randtl_40_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_217:
	.word 0x8f902001  ! 335: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x2fb0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b187f3  ! 336: PDISTN	fmean16	%d6, %d50, %d10
memptr_40_218:
	set 0x60540000, %r31
	.word 0x8582ed41  ! 337: WRCCR_I	wr	%r11, 0x0d41, %ccr
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_40_220:
	setx 0xc285f25b5e8a02f2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_40_221:
	taddcctv %r1, 0x1420, %r11
	.word 0xe807e0a2  ! 340: LDUW_I	lduw	[%r31 + 0x00a2], %r20
	.word 0x9f802316  ! 341: SIR	sir	0x0316
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 342: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93a00172  ! 343: FABSq	dis not found

	.word 0xa3a289d4  ! 344: FDIVd	fdivd	%f10, %f20, %f48
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
    set (0x00323207 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa9e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_222:
	.word 0xe2ffe0c8  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x00c8] %asi
	.word 0xe187e0e0  ! 346: LDFA_I	lda	[%r31, 0x00e0], %f16
	rd %pc, %r19
	add %r19, (ivw_40_223-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_223:
	.word 0x91918000  ! 347: WRPR_PIL_R	wrpr	%r6, %r0, %pil
cwp_40_224:
    set user_data_start, %o7
	.word 0x93902003  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9170279d  ! 349: POPC_I	popc	0x079d, %r8
DS_40_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1347444  ! 1: STQF_I	-	%f16, [0x1444, %r17]
	normalw
	.word 0xa1458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r16
pmu_40_226:
	nop
	setx 0xfffff030fffff5ad, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_40_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f12, %f20
	.word 0xa1b1030c  ! 352: ALIGNADDRESS	alignaddr	%r4, %r12, %r16
splash_hpstate_40_228:
	.word 0x81982e64  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e64, %hpstate
splash_cmpr_40_229:
	setx 0x6b9864b84d7e8f90, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a4c9c2  ! 355: FDIVd	fdivd	%f50, %f2, %f18
memptr_40_230:
	set 0x60740000, %r31
	.word 0x85827d06  ! 356: WRCCR_I	wr	%r9, 0x1d06, %ccr
	.word 0xa1a00170  ! 357: FABSq	dis not found

DS_40_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_40_232:
	nop
	setx 0xfffff61cfffff7e6, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d90350e  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x150e, %pstate
fpinit_40_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 362: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xe927e0f2  ! 363: STF_I	st	%f20, [0x00f2, %r31]
fpinit_40_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 364: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x93d02035  ! 365: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_cmpr_40_236:
	setx 0xbc30d5946f3d72a9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_40_237:
	set user_data_start, %r31
	.word 0x8582a8e9  ! 367: WRCCR_I	wr	%r10, 0x08e9, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_238) + 32, 16, 16)) -> intp(4,0,31)
intvec_40_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_239:
	nop
	setx 0xfffffefdfffff711, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_240:
	set 0x616f69e6, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0x220f48002fa34388, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_40_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_242-donret_40_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dac3b8 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x69e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_242:
	.word 0xe8ffe0e4  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x00e4] %asi
pmu_40_243:
	nop
	setx 0xfffff7cdfffff344, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe8800aa0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r20
	.word 0x93a00170  ! 376: FABSq	dis not found

	.word 0xab84701d  ! 377: WR_CLEAR_SOFTINT_I	wr	%r17, 0x101d, %clear_softint
jmptr_40_244:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_40_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8260a  ! 379: PREFETCHA_I	prefetcha	[%r0, + 0x060a] %asi, #one_read
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_40_246:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_40_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_247:
	mov 0x602, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 382: CASA_R	casa	[%r31] %asi, %r19, %r17
donret_40_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_248-donret_40_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001bbbfc | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x21d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_248:
	.word 0xe2ffe07d  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x007d] %asi
DS_40_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_40_250:
	tsubcctv %r19, 0x1089, %r17
	.word 0xe207e00e  ! 385: LDUW_I	lduw	[%r31 + 0x000e], %r17
pmu_40_251:
	nop
	setx 0xffffffd9fffff991, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_40_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 387: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_decr_40_253:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa780c004  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r4, %-
splash_cmpr_40_254:
	setx 0x5b93b9ec7727c03e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_40_255:
	set user_data_start, %r31
	.word 0x85852dbb  ! 390: WRCCR_I	wr	%r20, 0x0dbb, %ccr
splash_lsu_40_256:
	set 0x13cd781b, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_40_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d904008  ! 393: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xe1bfde00  ! 395: STDFA_R	stda	%f16, [%r0, %r31]
donret_40_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_260-donret_40_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00da2fd1 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x39e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_260:
	.word 0xe0ffe03c  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x003c] %asi
	.word 0x87a84a43  ! 397: FCMPd	fcmpd	%fcc<n>, %f32, %f34
intveclr_40_262:
	setx 0xc6199e22a7a78505, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_40_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe934ebb4  ! 1: STQF_I	-	%f20, [0x0bb4, %r19]
	normalw
	.word 0xa5458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r18
DS_40_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
mondo_40_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d900006  ! 402: WRPR_WSTATE_R	wrpr	%r0, %r6, %wstate
	.word 0xa7a0016d  ! 403: FABSq	dis not found

mondo_40_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d900000  ! 404: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_267:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 405: RDPC	rd	%pc, %r17
mondo_40_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d904008  ! 406: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
	.word 0xa9540000  ! 407: RDPR_GL	rdpr	%-, %r20
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
    set (0x008b42b5 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x19c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_40_269:
	.word 0xe4ffe02d  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x002d] %asi
	.word 0x99902001  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 410: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 411: RDPC	rd	%pc, %r20
	.word 0x83d020b2  ! 412: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xa170238c  ! 413: POPC_I	popc	0x038c, %r16
splash_cmpr_40_272:
	setx 0xee9dcd907e9e87b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_40_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_273-donret_40_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001b7062 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc86, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x2ecac001  ! 1: BRGEZ	brgez,a,pt	%r11,<label_0xac001>
	done
donretarg_40_273:
	.word 0xe0ffe071  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x0071] %asi
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_274:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 416: RDPC	rd	%pc, %r19
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_40_275:
	set 0x60140000, %r31
	.word 0x8581a088  ! 418: WRCCR_I	wr	%r6, 0x0088, %ccr
splash_hpstate_40_276:
	.word 0x819826d4  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
intveclr_40_277:
	setx 0x6b0ae4833c4ce668, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_40_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_278:
	mov 0xb34, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe8bb  ! 421: STD_I	std	%r16, [%r31 + 0x08bb]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_279:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 422: RDPC	rd	%pc, %r16
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x91d020b5  ! 424: Tcc_I	ta	icc_or_xcc, %r0 + 181
intveclr_40_280:
	setx 0x6f0248f245b48550, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_281)+56, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_281:
	.word 0xa980ed30  ! 426: WR_SET_SOFTINT_I	wr	%r3, 0x0d30, %set_softint
	.word 0xe187da00  ! 427: LDFA_R	lda	[%r31, %r0], %f16
donret_40_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_282-donret_40_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000e415d | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_282:
	.word 0xd4ffe014  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x0014] %asi
	.word 0x83d020b4  ! 429: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xc36c62f7  ! 430: PREFETCH_I	prefetch	[%r17 + 0x02f7], #one_read
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 432: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f803a76  ! 433: SIR	sir	0x1a76
pmu_40_284:
	nop
	setx 0xfffff58afffffc83, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe008  ! 435: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r19
debug_40_285:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc011  ! 436: LDDF_R	ldd	[%r31, %r17], %f19
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_40_286:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_40_287:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9b500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 442: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_40_290:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_40_291:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe000  ! 446: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_40_292-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_292:
	.word 0x9194c001  ! 447: WRPR_PIL_R	wrpr	%r19, %r1, %pil
splash_cmpr_40_293:
	setx 0x7c3ad17ecac6a487, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_40_294:
	setx 0xd8df3c444f4de167, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_40_295:
	setx 0x7d96d69a49955ed7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e010  ! 451: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x83d02033  ! 452: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_hpstate_40_296:
	.word 0x8198200c  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_298) + 56, 16, 16)) -> intp(6,0,18)
intvec_40_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 456: Tcc_I	te	icc_or_xcc, %r0 + 52
	setx 0x0d6c14be8693bf74, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a0c9d3  ! 458: FDIVd	fdivd	%f34, %f50, %f12
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_40_300-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_300:
	.word 0x9190c002  ! 460: WRPR_PIL_R	wrpr	%r3, %r2, %pil
DS_40_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
jmptr_40_302:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_40_303:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe13fc011  ! 463: STDF_R	std	%f16, [%r17, %r31]
pmu_40_304:
	nop
	setx 0xfffff5e5fffff645, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_305:
	nop
	setx 0xfffffda5fffff030, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_306:
	setx 0x197aa7831b7dabde, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a489d1  ! 467: FDIVd	fdivd	%f18, %f48, %f48
    set 0xa7a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b407e7  ! 468: PDISTN	fmean16	%d16, %d38, %d8
	.word 0xa7a00169  ! 469: FABSq	dis not found

    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xe1bfc2c0  ! 471: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_308) + 56, 16, 16)) -> intp(5,0,29)
intvec_40_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 473: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd937e0f8  ! 474: STQF_I	-	%f12, [0x00f8, %r31]
tagged_40_309:
	taddcctv %r17, 0x1b06, %r6
	.word 0xd807e05c  ! 475: LDUW_I	lduw	[%r31 + 0x005c], %r12
	.word 0x24cc8001  ! 476: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_40_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 478: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0xa9a00170  ! 479: FABSq	dis not found

	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_40_313:
	setx 0x6309955e836c5db6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_40_314:
	setx 0x2fe551eb77bbf9c8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
invtsb_40_315:
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
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_40_317:
	taddcctv %r20, 0x11c5, %r16
	.word 0xe407e001  ! 485: LDUW_I	lduw	[%r31 + 0x0001], %r18
donret_40_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_318-donret_40_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c9a8a7 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x616, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	retry
donretarg_40_318:
	.word 0xe4ffe030  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x0030] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0x99464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x87ad0a54  ! 489: FCMPd	fcmpd	%fcc<n>, %f20, %f20
	.word 0x8d903772  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x1772, %pstate
	.word 0xe62fe06d  ! 491: STB_I	stb	%r19, [%r31 + 0x006d]
splash_htba_40_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_321:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 493: RDPC	rd	%pc, %r11
	.word 0xad84a5f9  ! 494: WR_SOFTINT_REG_I	wr	%r18, 0x05f9, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f8028f1  ! 496: SIR	sir	0x08f1
	.word 0x95a309c5  ! 497: FDIVd	fdivd	%f12, %f36, %f10
jmptr_40_322:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_40_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d930008  ! 500: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0xd86fe03b  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x003b]
	.word 0x9f8028a9  ! 502: SIR	sir	0x08a9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_324) + 8, 16, 16)) -> intp(3,0,7)
intvec_40_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_325:
	nop
	setx 0xfffff78ffffff24c, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x99a00170  ! 506: FABSq	dis not found

splash_lsu_40_327:
	set 0x3fe8a54f, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 508: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fe020  ! 509: STD_I	std	%r20, [%r31 + 0x0020]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_329:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 510: RDPC	rd	%pc, %r13
	.word 0xe187e080  ! 511: LDFA_I	lda	[%r31, 0x0080], %f16
intveclr_40_330:
	setx 0xe63cff89f0183689, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_331:
	.word 0x81982d9d  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9d, %hpstate
DS_40_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe3328008  ! 1: STQF_R	-	%f17, [%r8, %r10]
	normalw
	.word 0xa9458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r20
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 515: RDPC	rd	%pc, %r17
jmptr_40_334:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe0e9  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x00e9]
splash_tba_40_335:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x997036fe  ! 519: POPC_I	popc	0x16fe, %r12
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_336:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 520: RDPC	rd	%pc, %r19
intveclr_40_337:
	setx 0x517c00fccad08b93, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r12
mondo_40_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d92c00b  ! 523: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
intveclr_40_339:
	setx 0xcf9faeb06373e80f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 525: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
splash_hpstate_40_341:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982e0f  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
	.word 0xe26fe0f2  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x00f2]
splash_lsu_40_342:
	set 0x3fc230d0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24cc4001  ! 529: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
tagged_40_344:
	tsubcctv %r16, 0x121d, %r18
	.word 0xd807e0e8  ! 530: LDUW_I	lduw	[%r31 + 0x00e8], %r12
	.word 0xd8cfe038  ! 531: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r12
pmu_40_345:
	nop
	setx 0xfffff0eefffff5ce, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e010  ! 533: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_40_346:
	setx 0x89363f634ac767a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_347:
	setx 0x6b0eafa9059bf113, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc2c0  ! 537: STDFA_R	stda	%f0, [%r0, %r31]
donret_40_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_348-donret_40_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0035e45e | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf04, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	retry
donretarg_40_348:
	.word 0xd8ffe070  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x0070] %asi
	.word 0xc1bfdc00  ! 539: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa981800d  ! 540: WR_SET_SOFTINT_R	wr	%r6, %r13, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 541: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802192  ! 542: SIR	sir	0x0192
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_40_349:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_40_350:
	set 0x67ad6ddb, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc400  ! 546: LDDA_R	ldda	[%r31, %r0] 0x20, %r12
intveclr_40_351:
	setx 0x2ee56b8e693731f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_40_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 548: FDIVd	fdivd	%f0, %f4, %f6
intveclr_40_353:
	setx 0x673a2b3e86663369, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 550: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_354:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 551: RDPC	rd	%pc, %r13
	setx 0xf70a21549f0e0a61, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_358) + 24, 16, 16)) -> intp(3,0,10)
intvec_40_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x8a41119d8480fd63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd71fe028  ! 559: LDDF_I	ldd	[%r31, 0x0028], %f11
mondo_40_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d90c003  ! 560: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
intveclr_40_361:
	setx 0xa471983fec1ae387, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_362:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 562: RDPC	rd	%pc, %r9
splash_tba_40_363:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_40_364:
	setx 0x59a931a34e1abafb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0x9ba189c5  ! 566: FDIVd	fdivd	%f6, %f36, %f44
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 568: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_40_366:
	nop
	setx 0xfffff868fffff4ee, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_367:
	setx 0xa6fe67b68668d9ba, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_369:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 572: RDPC	rd	%pc, %r13
	rd %pc, %r19
	add %r19, (ivw_40_370-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_370:
	.word 0x91910010  ! 573: WRPR_PIL_R	wrpr	%r4, %r16, %pil
mondo_40_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d950011  ! 574: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
mondo_40_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d948013  ! 575: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
DS_40_373:
	.word 0x93a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f40
	pdist %f10, %f16, %f22
	.word 0xa5b44312  ! 576: ALIGNADDRESS	alignaddr	%r17, %r18, %r18
	.word 0xa1a089cd  ! 577: FDIVd	fdivd	%f2, %f44, %f16
debug_40_375:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc012  ! 578: STDF_R	std	%f12, [%r18, %r31]
splash_hpstate_40_376:
	.word 0x81982c97  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c97, %hpstate
	.word 0xe187e080  ! 580: LDFA_I	lda	[%r31, 0x0080], %f16
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_377:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 581: RDPC	rd	%pc, %r19
mondo_40_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d928011  ! 582: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
intveclr_40_379:
	setx 0xa10aac0758fc3091, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_40_381:
	set 0xec182ab6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87a8ca47  ! 586: FCMPd	fcmpd	%fcc<n>, %f34, %f38
tagged_40_383:
	taddcctv %r20, 0x1f43, %r16
	.word 0xd807e020  ! 587: LDUW_I	lduw	[%r31 + 0x0020], %r12
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_384:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 588: RDPC	rd	%pc, %r8
	.word 0x93a509cc  ! 589: FDIVd	fdivd	%f20, %f12, %f40
pmu_40_385:
	nop
	setx 0xfffffdedfffff6e3, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_40_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f20, %f2
	.word 0x91b50312  ! 591: ALIGNADDRESS	alignaddr	%r20, %r18, %r8
jmptr_40_387:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91d020b5  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_40_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_40_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 595: FDIVs	fdivs	%f0, %f4, %f6
splash_hpstate_40_390:
	.word 0x81982e35  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e35, %hpstate
	.word 0x8d903d5a  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x1d5a, %pstate
cwp_40_392:
    set user_data_start, %o7
	.word 0x93902002  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa7b504d3  ! 599: FCMPNE32	fcmpne32	%d20, %d50, %r19
donret_40_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_394-donret_40_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00be31b2 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x35d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	retry
donretarg_40_394:
	.word 0xd8ffe078  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x0078] %asi
	.word 0xa1a449d2  ! 601: FDIVd	fdivd	%f48, %f18, %f16
mondo_40_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d92c009  ! 602: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
jmptr_40_396:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_40_397:
	setx 0x67709a00aa6cbcca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_398:
	nop
	setx 0xfffffc21fffff344, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_40_399:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc030  ! 606: STDA_R	stda	%r18, [%r31 + %r16] 0x01
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_400)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_400:
	.word 0xa982a645  ! 607: WR_SET_SOFTINT_I	wr	%r10, 0x0645, %set_softint
	rd %pc, %r19
	add %r19, (ivw_40_401-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_401:
	.word 0x9195000d  ! 608: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	.word 0x9f802738  ! 609: SIR	sir	0x0738
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_402) + 40, 16, 16)) -> intp(5,0,8)
intvec_40_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_40_403:
	set 0x60540000, %r31
	.word 0x8584f7e3  ! 611: WRCCR_I	wr	%r19, 0x17e3, %ccr
	.word 0xe46fe0b1  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x00b1]
cwp_40_404:
    set user_data_start, %o7
	.word 0x93902000  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_405)+0, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_405:
	.word 0xa981bc45  ! 614: WR_SET_SOFTINT_I	wr	%r6, 0x1c45, %set_softint
	.word 0x24cc8001  ! 1: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0x8d9037a8  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x17a8, %pstate
mondo_40_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94800c  ! 616: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
debug_40_408:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe53fc013  ! 617: STDF_R	std	%f18, [%r19, %r31]
pmu_40_409:
	nop
	setx 0xfffffbe6fffff7fb, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_410:
	setx 0x7b3b236643449145, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5500000  ! 620: RDPR_TPC	rdpr	%tpc, %r18
	setx 0xadfa47bd47d99e4b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ac0a4c  ! 622: FCMPd	fcmpd	%fcc<n>, %f16, %f12
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e034  ! 624: STF_I	st	%f19, [0x0034, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_40_413:
	nop
	setx 0xfffffc95ffffff4d, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_40_414-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_414:
	.word 0x9190c010  ! 627: WRPR_PIL_R	wrpr	%r3, %r16, %pil
	.word 0x9192f82b  ! 628: WRPR_PIL_I	wrpr	%r11, 0x182b, %pil
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_415:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 629: RDPC	rd	%pc, %r13
change_to_randtl_40_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_416:
	.word 0x8f902001  ! 630: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 632: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_40_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 635: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0x9b464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r13
donret_40_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_420-donret_40_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0050da6e | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x207, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	retry
donretarg_40_420:
	.word 0xd6ffe0f8  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x00f8] %asi
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_421:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 638: RDPC	rd	%pc, %r13
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_40_422-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_422:
	.word 0x91904004  ! 640: WRPR_PIL_R	wrpr	%r1, %r4, %pil
splash_cmpr_40_423:
	setx 0xc038b8f7939d4d9e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_40_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_424-donret_40_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dff07d | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x24cc0001  ! 1: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	retry
donretarg_40_424:
	.word 0xe0ffe0f0  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x00f0] %asi
	.word 0x91a00173  ! 643: FABSq	dis not found

memptr_40_425:
	set 0x60740000, %r31
	.word 0x8584f35b  ! 644: WRCCR_I	wr	%r19, 0x135b, %ccr
	.word 0xe48fe028  ! 645: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r18
splash_cmpr_40_426:
	setx 0xb83deb5c8c5291c8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xa40ee35e3c709b98, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_40_428:
	nop
	setx 0xffffff48fffffc58, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e018  ! 650: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r18
	.word 0xe46fe065  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x0065]
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a0016a  ! 653: FABSq	dis not found

	.word 0xe6800a80  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r19
splash_lsu_40_429:
	set 0x35d50415, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1540000  ! 656: RDPR_GL	rdpr	%-, %r16
	.word 0x9f803019  ! 657: SIR	sir	0x1019
	.word 0x87aa4a47  ! 658: FCMPd	fcmpd	%fcc<n>, %f40, %f38
	rd %pc, %r19
	add %r19, (ivw_40_431-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_431:
	.word 0x91904001  ! 659: WRPR_PIL_R	wrpr	%r1, %r1, %pil
DS_40_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8b728448	! Random illegal ?
	.word 0x95a00552  ! 1: FSQRTd	fsqrt	
	.word 0x97a0c820  ! 660: FADDs	fadds	%f3, %f0, %f11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 662: Tcc_R	te	icc_or_xcc, %r0 + %r30
donret_40_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_433-donret_40_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002bb342 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_433:
	.word 0xd8ffe068  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x0068] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_40_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe73168a8  ! 1: STQF_I	-	%f19, [0x08a8, %r5]
	normalw
	.word 0xa5458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r18
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_436:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 666: RDPC	rd	%pc, %r20
splash_htba_40_437:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_438)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_438:
	.word 0xa9816d60  ! 668: WR_SET_SOFTINT_I	wr	%r5, 0x0d60, %set_softint
pmu_40_439:
	nop
	setx 0xffffffaefffff911, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97a309b1  ! 670: FDIVs	fdivs	%f12, %f17, %f11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_440) + 8, 16, 16)) -> intp(5,0,31)
intvec_40_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_40_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d903b91  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x1b91, %pstate
splash_hpstate_40_443:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81982a56  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a56, %hpstate
pmu_40_444:
	nop
	setx 0xffffffcefffff754, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_decr_40_445:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa782c003  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r3, %-
	.word 0xda77e06c  ! 678: STX_I	stx	%r13, [%r31 + 0x006c]
jmptr_40_446:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f802f23  ! 680: SIR	sir	0x0f23
DS_40_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x9ba00553  ! 1: FSQRTd	fsqrt	
	.word 0x91a34831  ! 681: FADDs	fadds	%f13, %f17, %f8
	.word 0xda37e028  ! 682: STH_I	sth	%r13, [%r31 + 0x0028]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_448:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 683: RDPC	rd	%pc, %r12
pmu_40_449:
	nop
	setx 0xfffffecdfffff4eb, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_450:
	set 0x4d251424, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xe0a786b6a8d50158, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_452:
	setx 0xd3e60c678a754265, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_40_454:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x819824c7  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_40_455:
	setx 0xe7d236ee59c13ec9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e038  ! 692: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r9
splash_lsu_40_456:
	set 0x6e606518, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab84f764  ! 694: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1764, %clear_softint
memptr_40_457:
	set 0x60540000, %r31
	.word 0x8584fd95  ! 695: WRCCR_I	wr	%r19, 0x1d95, %ccr
splash_cmpr_40_458:
	setx 0x36bf0005574758ac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_decr_40_460:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa784400c  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r12, %-
	rd %pc, %r19
	add %r19, (ivw_40_461-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_461:
	.word 0x91944010  ! 700: WRPR_PIL_R	wrpr	%r17, %r16, %pil
	.word 0xa5454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0xa9a00170  ! 1: FABSq	dis not found

	.word 0xe187e080  ! 2: LDFA_I	lda	[%r31, 0x0080], %f16
	.word 0x97a00163  ! 3: FABSq	dis not found

    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	fbl skip_20_1
	fbg skip_20_1
.align 1024
skip_20_1:
	.word 0x99a149c6  ! 5: FDIVd	fdivd	%f36, %f6, %f12
pmu_20_2:
	nop
	setx 0xfffff7a4fffff04b, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe09e  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x009e]
donret_20_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_3-donret_20_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0006ad9d | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 23, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_3:
	.word 0xd2ffe071  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x0071] %asi
jmptr_20_4:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe020  ! 10: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r9
	.word 0xa9a00172  ! 11: FABSq	dis not found

DS_20_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xa9480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xa3480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_20_6:
	setx 0xbcdaf97f9e6ef8fe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e038  ! 17: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r18
	.word 0xe4dfe010  ! 18: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r18
DS_20_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb34c014  ! 1: STQF_R	-	%f13, [%r20, %r19]
	normalw
	.word 0xa3458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r17
intveclr_20_8:
	setx 0x18a2b6d2b2fabe1a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_9:
	nop
	setx 0xfffff99ffffff7e9, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e09f  ! 23: STX_I	stx	%r20, [%r31 + 0x009f]
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 24: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a00174  ! 25: FABSq	dis not found

intveclr_20_10:
	setx 0x66db18c3dc736769, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_11:
	.word 0x81982246  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0246, %hpstate
splash_tba_20_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xe28001ee6ec0336a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_20_15:
	nop
	setx 0xfffffdc7fffffbcb, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbne,a,pn	%fcc0,  skip_20_16
	.word 0xc3683f88  ! 1: PREFETCH_I	prefetch	[%r0 + 0xffffff88], #one_read
.align 1024
skip_20_16:
	.word 0x91b1c4c9  ! 32: FCMPNE32	fcmpne32	%d38, %d40, %r8
splash_cmpr_20_17:
	setx 0x853ad2d06129758c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_20_18:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_20_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d944006  ! 35: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xa3500000  ! 36: RDPR_TPC	rdpr	%tpc, %r17
jmptr_20_20:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_20_21:
	setx 0x59f63c9566d0dcc7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802142  ! 39: SIR	sir	0x0142
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_20_22-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_22:
	.word 0x91948001  ! 41: WRPR_PIL_R	wrpr	%r18, %r1, %pil
	.word 0xa3a00172  ! 42: FABSq	dis not found

DS_20_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a4c9c4  ! 1: FDIVd	fdivd	%f50, %f4, %f8
	.word 0x95a4c831  ! 43: FADDs	fadds	%f19, %f17, %f10
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xa1a489c8  ! 45: FDIVd	fdivd	%f18, %f8, %f16
	fbg,a,pn	%fcc0,  skip_20_24
	.word 0xd3e48033  ! 1: CASA_I	casa	[%r18] 0x 1, %r19, %r9
.align 2048
skip_20_24:
	.word 0x9ba449d4  ! 46: FDIVd	fdivd	%f48, %f20, %f44
donret_20_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_25-donret_20_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0061eadc | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x116, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_25:
	.word 0xe2ffe000  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x0000] %asi
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 48: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe26fe088  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x0088]
	.word 0xe26fe034  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x0034]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xe1bfe0c0  ! 52: STDFA_I	stda	%f16, [0x00c0, %r31]
tagged_20_26:
	tsubcctv %r16, 0x1309, %r7
	.word 0xe207e0fc  ! 53: LDUW_I	lduw	[%r31 + 0x00fc], %r17
	rd %pc, %r19
	add %r19, (ivw_20_27-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_27:
	.word 0x91914010  ! 54: WRPR_PIL_R	wrpr	%r5, %r16, %pil
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f803eca  ! 56: SIR	sir	0x1eca
splash_hpstate_20_29:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982485  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0485, %hpstate
	.word 0xe277e022  ! 58: STX_I	stx	%r17, [%r31 + 0x0022]
debug_20_30:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc014  ! 59: STDF_R	std	%f17, [%r20, %r31]
jmptr_20_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe0b2  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x00b2]
	rd %pc, %r19
	add %r19, (ivw_20_32-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_32:
	.word 0x9192c002  ! 62: WRPR_PIL_R	wrpr	%r11, %r2, %pil
	.word 0x91d02033  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xad813efc  ! 64: WR_SOFTINT_REG_I	wr	%r4, 0x1efc, %softint
intveclr_20_33:
	setx 0x96c8e568f8b2b07b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d902215  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0xc187da00  ! 67: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x99520000  ! 68: RDPR_PIL	rdpr	%pil, %r12
	.word 0xd8800b40  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
splash_cmpr_20_35:
	setx 0x069e8dcc66ad81c8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_20_36:
	set user_data_start, %r31
	.word 0x85842df9  ! 71: WRCCR_I	wr	%r16, 0x0df9, %ccr
	rd %pc, %r19
	add %r19, (ivw_20_37-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_37:
	.word 0x91918011  ! 72: WRPR_PIL_R	wrpr	%r6, %r17, %pil
intveclr_20_38:
	setx 0xa9b231ffc2a4d4df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a009cb  ! 74: FDIVd	fdivd	%f0, %f42, %f12
	.word 0xa5a00171  ! 75: FABSq	dis not found

DS_20_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 50
pmu_20_40:
	nop
	setx 0xfffff4a9ffffffa5, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9021e4  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x01e4, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_20_42:
	setx 0x203442e080c5c946, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_20_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_43-donret_20_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002a4042 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_43:
	.word 0xe8ffe09c  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x009c] %asi
debug_20_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_44:
	mov 0xe99, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc033  ! 83: STDA_R	stda	%r20, [%r31 + %r19] 0x01
splash_htba_20_45:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_20_46:
	setx 0xf0afa2a7f2ae71b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0xe1bfe0a0  ! 87: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xa78060a2  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r1, 0x00a2, %-
	setx 0xc8446ab121a0d679, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d924010  ! 90: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
donret_20_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_49-donret_20_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00715dd6 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa0f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_49:
	.word 0xd8ffe094  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x0094] %asi
DS_20_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa9a0016d  ! 93: FABSq	dis not found

	.word 0xd46fe0ce  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x00ce]
debug_20_51:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd51fc004  ! 95: LDDF_R	ldd	[%r31, %r4], %f10
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0x9745c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_52) + 0, 16, 16)) -> intp(5,0,18)
intvec_20_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_20_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_20_54-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_54:
	.word 0x91914006  ! 100: WRPR_PIL_R	wrpr	%r5, %r6, %pil
DS_20_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5144011  ! 1: LDQF_R	-	[%r17, %r17], %f18
	.word 0x9ba14826  ! 101: FADDs	fadds	%f5, %f6, %f13
DS_20_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x914f2f7d	! Random illegal ?
	.word 0x95a00551  ! 1: FSQRTd	fsqrt	
	.word 0xa7a5082b  ! 102: FADDs	fadds	%f20, %f11, %f19
	.word 0xd327e00c  ! 103: STF_I	st	%f9, [0x000c, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_20_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d94000a  ! 106: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
	setx 0xfd3c42ba4f6a9140, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800b00  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r9
DS_20_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_20_61:
	setx 0xa75122e141f074ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_20_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_64:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 115: RDPC	rd	%pc, %r19
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_66) + 32, 16, 16)) -> intp(6,0,6)
intvec_20_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_20_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_67:
	mov 0x7ad, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe497c027  ! 118: LDUHA_R	lduha	[%r31, %r7] 0x01, %r18
intveclr_20_68:
	setx 0x0a66cf66809461b8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xa044948233fe0b3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d920003  ! 121: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	setx 0x0db5f48f9096d3ee, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a489ca  ! 123: FDIVd	fdivd	%f18, %f10, %f8
splash_cmpr_20_72:
	setx 0xa1be85905948c898, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802ba4  ! 125: SIR	sir	0x0ba4
jmptr_20_73:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d902fc2  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x0fc2, %pstate
	brlz,a,pt	%r19, skip_20_75
	fbn skip_20_75
.align 512
skip_20_75:
	.word 0xd03a8011  ! 128: STD_R	std	%r8, [%r10 + %r17]
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f802d48  ! 130: SIR	sir	0x0d48
	.word 0x97a209c6  ! 131: FDIVd	fdivd	%f8, %f6, %f42
	.word 0xe8bfe005  ! 132: STDA_I	stda	%r20, [%r31 + 0x0005] %asi
splash_htba_20_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_20_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa3a089d4  ! 1: FDIVd	fdivd	%f2, %f20, %f48
	normalw
	.word 0x99458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r12
change_to_randtl_20_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_78:
	.word 0x8f902000  ! 135: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_20_79:
	set 0x8c8e46fd, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e0e4  ! 137: STF_I	st	%f20, [0x00e4, %r31]
splash_cmpr_20_80:
	setx 0xe3c5aa28cdb01ead, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d02033  ! 139: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe8cfe000  ! 140: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
splash_htba_20_81:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xc187db60  ! 142: LDFA_R	lda	[%r31, %r0], %f0
jmptr_20_82:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	bvs,a	 skip_20_83
	.word 0x93b344d1  ! 1: FCMPNE32	fcmpne32	%d44, %d48, %r9
.align 1024
skip_20_83:
	.word 0xc36c7fe4  ! 144: PREFETCH_I	prefetch	[%r17 + 0xffffffe4], #one_read
	.word 0xa7848002  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r2, %-
splash_lsu_20_85:
	set 0xa4b43469, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_86:
	setx 0x5cee43dd4b177840, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00160  ! 148: FABSq	dis not found

	.word 0xa3a00173  ! 149: FABSq	dis not found

pmu_20_87:
	nop
	setx 0xfffffa25ffffffbd, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a00163  ! 151: FABSq	dis not found

mondo_20_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d948011  ! 152: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0xda57e028  ! 153: LDSH_I	ldsh	[%r31 + 0x0028], %r13
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 154: RDPC	rd	%pc, %r17
intveclr_20_90:
	setx 0x16165736f2525d98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d934011  ! 156: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
donret_20_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_92-donret_20_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0048e1f4 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x39400001  ! 1: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_92:
	.word 0xd6ffe0f6  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x00f6] %asi
	.word 0xa7848014  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r20, %-
mondo_20_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d900003  ! 159: WRPR_WSTATE_R	wrpr	%r0, %r3, %wstate
memptr_20_95:
	set 0x60740000, %r31
	.word 0x85816318  ! 160: WRCCR_I	wr	%r5, 0x0318, %ccr
debug_20_96:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd63feba4  ! 161: STD_I	std	%r11, [%r31 + 0x0ba4]
memptr_20_97:
	set 0x60140000, %r31
	.word 0x8581309a  ! 162: WRCCR_I	wr	%r4, 0x109a, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_98) + 0, 16, 16)) -> intp(2,0,22)
intvec_20_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_99:
	.word 0x81982bc4  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	.word 0xd727e030  ! 165: STF_I	st	%f11, [0x0030, %r31]
	fbule skip_20_100
	.word 0xa9a109d3  ! 1: FDIVd	fdivd	%f4, %f50, %f20
.align 128
skip_20_100:
	.word 0xd5e48030  ! 166: CASA_I	casa	[%r18] 0x 1, %r16, %r10
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0x99a00174  ! 168: FABSq	dis not found

fpinit_20_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83b24  ! 169: PREFETCHA_I	prefetcha	[%r0, + 0xfffffb24] %asi, #one_read
DS_20_102:
	.word 0x9ba209d0  ! 1: FDIVd	fdivd	%f8, %f16, %f44
	allclean
	.word 0xa9b0c305  ! 170: ALIGNADDRESS	alignaddr	%r3, %r5, %r20
mondo_20_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 171: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
pmu_20_104:
	nop
	setx 0xfffff8b5fffff109, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0x97a309c2  ! 174: FDIVd	fdivd	%f12, %f2, %f42
	.word 0xa7a00173  ! 175: FABSq	dis not found

	.word 0xa9a509d0  ! 176: FDIVd	fdivd	%f20, %f16, %f20
	.word 0xd44fe030  ! 177: LDSB_I	ldsb	[%r31 + 0x0030], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_20_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c007  ! 179: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xe187de00  ! 181: LDFA_R	lda	[%r31, %r0], %f16
tagged_20_106:
	tsubcctv %r19, 0x11b0, %r0
	.word 0xd407e018  ! 182: LDUW_I	lduw	[%r31 + 0x0018], %r10
mondo_20_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d928008  ! 183: WRPR_WSTATE_R	wrpr	%r10, %r8, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_108) + 8, 16, 16)) -> intp(0,0,5)
intvec_20_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 185: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e038  ! 186: LDSWA_I	ldswa	[%r31, + 0x0038] %asi, %r10
	.word 0xab81668b  ! 187: WR_CLEAR_SOFTINT_I	wr	%r5, 0x068b, %clear_softint
splash_hpstate_20_109:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982adf  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
mondo_20_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d944010  ! 189: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xe1bfdc00  ! 190: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_20_111:
	setx 0x4b44d53b45cb7d04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90000b  ! 192: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
intveclr_20_113:
	setx 0x13619060880ad59c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x97b0c493  ! 195: FCMPLE32	fcmple32	%d34, %d50, %r11
debug_20_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_115:
	mov 0x6e2, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc025  ! 196: LDXA_R	ldxa	[%r31, %r5] 0x01, %r16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0xab28f8b0c34caf37, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_118:
	setx 0x8e8cb99c80987081, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f8022ff  ! 200: SIR	sir	0x02ff
	ta	T_CHANGE_NONPRIV	! macro
pmu_20_119:
	nop
	setx 0xfffff067fffff389, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_120) + 8, 16, 16)) -> intp(2,0,17)
intvec_20_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe038  ! 204: STD_I	std	%r16, [%r31 + 0x0038]
fpinit_20_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 205: FDIVd	fdivd	%f0, %f4, %f4
pmu_20_122:
	nop
	setx 0xfffff054fffffe41, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbuge skip_20_123
	ba,a	 skip_20_123
.align 128
skip_20_123:
	.word 0xe43b4014  ! 207: STD_R	std	%r18, [%r13 + %r20]
	.word 0xd23fe090  ! 208: STD_I	std	%r9, [%r31 + 0x0090]
	.word 0x91a00171  ! 209: FABSq	dis not found

splash_cmpr_20_124:
	setx 0xc6e4405eb0488eb0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	fbul,a,pn	%fcc0,  skip_20_125
	brlz,pt  	%r20, skip_20_125
.align 512
skip_20_125:
	.word 0x87ac4a51  ! 211: FCMPd	fcmpd	%fcc<n>, %f48, %f48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_20_127:
	setx 0x760a7bb4ff003f95, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe028  ! 214: LDXA_I	ldxa	[%r31, + 0x0028] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_128) + 24, 16, 16)) -> intp(0,0,18)
intvec_20_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902710  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x0710, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_130) + 32, 16, 16)) -> intp(0,0,23)
intvec_20_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 218: Tcc_I	ta	icc_or_xcc, %r0 + 181
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 219: RDPC	rd	%pc, %r18
	.word 0x87aa0a53  ! 220: FCMPd	fcmpd	%fcc<n>, %f8, %f50
splash_cmpr_20_132:
	setx 0x1af4bb7005915e08, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e0e3  ! 222: STH_I	sth	%r20, [%r31 + 0x00e3]
jmptr_20_133:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_20_134:
	nop
	setx 0xfffff2e7fffffbd7, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xbbb00cc28382e1a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_20_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_136:
	mov 0x493, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x20,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe83fe916  ! 226: STD_I	std	%r20, [%r31 + 0x0916]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
unsupttte20_139:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5b18484  ! 230: FCMPLE32	fcmple32	%d6, %d4, %r18
	rd %pc, %r19
	add %r19, (ivw_20_140-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_140:
	.word 0x91950012  ! 231: WRPR_PIL_R	wrpr	%r20, %r18, %pil
mondo_20_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 232: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x9f80278b  ! 233: SIR	sir	0x078b
pmu_20_142:
	nop
	setx 0xfffff152fffffe7d, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91952c6a  ! 235: WRPR_PIL_I	wrpr	%r20, 0x0c6a, %pil
splash_hpstate_20_143:
	.word 0x81982746  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
	.word 0xa3a449c5  ! 237: FDIVd	fdivd	%f48, %f36, %f48
memptr_20_144:
	set user_data_start, %r31
	.word 0x85827f9d  ! 238: WRCCR_I	wr	%r9, 0x1f9d, %ccr
mondo_20_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d900007  ! 239: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
unsupttte20_146:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x93a149c4  ! 240: FDIVd	fdivd	%f36, %f4, %f40
pmu_20_147:
	nop
	setx 0xfffff594fffffc94, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_20_148:
	setx 0x6fcb748263140fdf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a509c9  ! 244: FDIVd	fdivd	%f20, %f40, %f18
	rd %pc, %r19
	add %r19, (ivw_20_149-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_149:
	.word 0x9190800a  ! 245: WRPR_PIL_R	wrpr	%r2, %r10, %pil
fpinit_20_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 246: FDIVd	fdivd	%f0, %f4, %f6
mondo_20_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d900011  ! 247: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_20_153:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 249: CASA_R	casa	[%r31] %asi, %r8, %r11
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_20_155:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9022ea  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x02ea, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_20_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_157:
	mov 0x71e, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+24), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc008  ! 254: LDDF_R	ldd	[%r31, %r8], %f11
intveclr_20_158:
	setx 0x8c866de34d3369dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_159-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_159:
	.word 0x91940005  ! 256: WRPR_PIL_R	wrpr	%r16, %r5, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_20_160:
	set 0xb907f0b6, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d944012  ! 259: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
	.word 0xa7a00169  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_163:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 263: RDPC	rd	%pc, %r18
mondo_20_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d908012  ! 264: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 265: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_20_165:
	set user_data_start, %r31
	.word 0x8580aacb  ! 266: WRCCR_I	wr	%r2, 0x0acb, %ccr
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_168) + 16, 16, 16)) -> intp(5,0,21)
intvec_20_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_20_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_169:
	mov 0x683, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x20,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02c  ! 270: LDUHA_R	lduha	[%r31, %r12] 0x01, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xfa5f8797bfcea1e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 273: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xab810012  ! 274: WR_CLEAR_SOFTINT_R	wr	%r4, %r18, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e008  ! 276: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_20_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 278: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
memptr_20_174:
	set user_data_start, %r31
	.word 0x8582e27f  ! 279: WRCCR_I	wr	%r11, 0x027f, %ccr
	.word 0x8d9027da  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x07da, %pstate
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 281: RDPC	rd	%pc, %r17
	.word 0x99520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 283: RDPC	rd	%pc, %r20
fpinit_20_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 284: FDIVs	fdivs	%f0, %f4, %f8
	setx 0x8762711565aee9ca, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_20_180:
	tsubcctv %r0, 0x1fac, %r17
	.word 0xd007e0f0  ! 286: LDUW_I	lduw	[%r31 + 0x00f0], %r8
debug_20_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_181:
	mov 0x5a1, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x37,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd13fc005  ! 287: STDF_R	std	%f8, [%r5, %r31]
DS_20_182:
	.word 0xa5a1c9d2  ! 1: FDIVd	fdivd	%f38, %f18, %f18
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	ble,a	 skip_20_185
	.word 0x87ac0a4b  ! 1: FCMPd	fcmpd	%fcc<n>, %f16, %f42
.align 2048
skip_20_185:
	.word 0xa9a1c9cc  ! 293: FDIVd	fdivd	%f38, %f12, %f20
tagged_20_186:
	tsubcctv %r19, 0x169c, %r18
	.word 0xe607e0e0  ! 294: LDUW_I	lduw	[%r31 + 0x00e0], %r19
	setx 0xcd82ea3a62842b63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a489d3  ! 296: FDIVd	fdivd	%f18, %f50, %f50
intveclr_20_188:
	setx 0xa9e999ab225586f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_20_190:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_20_191:
	setx 0xb3e47e5d0a2c31f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_20_192:
	setx 0xd8de01988956c670, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa785000a  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r10, %-
	.word 0x91a00174  ! 305: FABSq	dis not found

pmu_20_194:
	nop
	setx 0xfffffac4fffff1d7, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b3  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 179
memptr_20_195:
	set user_data_start, %r31
	.word 0x85802911  ! 308: WRCCR_I	wr	%r0, 0x0911, %ccr
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 309: RDPC	rd	%pc, %r18
	.word 0x9b450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r13
pmu_20_197:
	nop
	setx 0xfffff0dbfffffc86, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_198:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 312: RDPC	rd	%pc, %r8
	.word 0x91520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_200) + 56, 16, 16)) -> intp(7,0,24)
intvec_20_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_201:
	setx 0x642f035da34aa206, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_20_202-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_202:
	.word 0x9194800c  ! 317: WRPR_PIL_R	wrpr	%r18, %r12, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_20_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_203:
	mov 0xe3f, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe297c034  ! 319: LDUHA_R	lduha	[%r31, %r20] 0x01, %r17
donret_20_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_204-donret_20_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007cdc6d | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	retry
donretarg_20_204:
	.word 0xe2ffe068  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x0068] %asi
	brlez,pt  	%r10, skip_20_205
	brlez,a,pn	%r20, skip_20_205
.align 1024
skip_20_205:
	.word 0x97b404d4  ! 321: FCMPNE32	fcmpne32	%d16, %d20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_206)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_206:
	.word 0xa9836e48  ! 322: WR_SET_SOFTINT_I	wr	%r13, 0x0e48, %set_softint
	bleu,a	 skip_20_207
	brgez,a,pn	%r3, skip_20_207
.align 2048
skip_20_207:
	.word 0x91a509cd  ! 323: FDIVd	fdivd	%f20, %f44, %f8
mondo_20_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 324: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	setx 0x89f4b3dee25be595, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_20_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d950007  ! 326: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_212) + 16, 16, 16)) -> intp(1,0,21)
intvec_20_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_20_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 330: FCMPLE32	fcmple32	%d0, %d4, %r8
DS_20_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f16, %f14
	.word 0xa5b1030c  ! 331: ALIGNADDRESS	alignaddr	%r4, %r12, %r18
	.word 0xd49fc540  ! 332: LDDA_R	ldda	[%r31, %r0] 0x2a, %r10
intveclr_20_215:
	setx 0x428a2ec69b61941d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_216-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_216:
	.word 0x91918013  ! 334: WRPR_PIL_R	wrpr	%r6, %r19, %pil
change_to_randtl_20_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_217:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    set 0x1eb0, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b347f3  ! 336: PDISTN	fmean16	%d44, %d50, %d42
memptr_20_218:
	set 0x60740000, %r31
	.word 0x85827d39  ! 337: WRCCR_I	wr	%r9, 0x1d39, %ccr
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_20_220:
	setx 0x09ff233ad8031d22, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_20_221:
	taddcctv %r18, 0x1133, %r9
	.word 0xe807e030  ! 340: LDUW_I	lduw	[%r31 + 0x0030], %r20
	.word 0x9f802fd6  ! 341: SIR	sir	0x0fd6
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 342: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91a00164  ! 343: FABSq	dis not found

	.word 0x97a489c3  ! 344: FDIVd	fdivd	%f18, %f34, %f42
donret_20_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_222-donret_20_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bbaf5b | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb55, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_222:
	.word 0xe2ffe054  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x0054] %asi
	.word 0xe187e020  ! 346: LDFA_I	lda	[%r31, 0x0020], %f16
	rd %pc, %r19
	add %r19, (ivw_20_223-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_223:
	.word 0x9194c012  ! 347: WRPR_PIL_R	wrpr	%r19, %r18, %pil
cwp_20_224:
    set user_data_start, %o7
	.word 0x93902003  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc3ec0030  ! 349: PREFETCHA_R	prefetcha	[%r16, %r16] 0x01, #one_read
DS_20_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe730bcb7  ! 1: STQF_I	-	%f19, [0x1cb7, %r2]
	normalw
	.word 0xa1458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r16
pmu_20_226:
	nop
	setx 0xfffff753fffff56b, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_20_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f18, %f30
	.word 0xa1b4c307  ! 352: ALIGNADDRESS	alignaddr	%r19, %r7, %r16
splash_hpstate_20_228:
	.word 0x81982bce  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bce, %hpstate
splash_cmpr_20_229:
	setx 0xb01fc98566aede3c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a509cb  ! 355: FDIVd	fdivd	%f20, %f42, %f42
memptr_20_230:
	set 0x60340000, %r31
	.word 0x8584786c  ! 356: WRCCR_I	wr	%r17, 0x186c, %ccr
	.word 0x93a00165  ! 357: FABSq	dis not found

DS_20_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_20_232:
	nop
	setx 0xfffff9a8fffff85a, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c1f  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x1c1f, %pstate
fpinit_20_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 362: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xe927e0ac  ! 363: STF_I	st	%f20, [0x00ac, %r31]
fpinit_20_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e828d6  ! 364: PREFETCHA_I	prefetcha	[%r0, + 0x08d6] %asi, #one_read
	.word 0x93d02032  ! 365: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_20_236:
	setx 0xb466ebb3dd5b0c34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_20_237:
	set user_data_start, %r31
	.word 0x8582f902  ! 367: WRCCR_I	wr	%r11, 0x1902, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_238) + 8, 16, 16)) -> intp(7,0,25)
intvec_20_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_239:
	nop
	setx 0xfffff0e2fffff1ef, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_240:
	set 0x2e87b661, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0xd2792b54f76af233, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_20_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_242-donret_20_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fbd451 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x18d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_242:
	.word 0xe8ffe09a  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x009a] %asi
pmu_20_243:
	nop
	setx 0xfffff053fffffa72, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe88008a0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xa9a00166  ! 376: FABSq	dis not found

	.word 0xab8424d8  ! 377: WR_CLEAR_SOFTINT_I	wr	%r16, 0x04d8, %clear_softint
jmptr_20_244:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_20_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 379: FCMPLE32	fcmple32	%d0, %d4, %r6
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_20_246:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_20_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_247:
	mov 0x6d3, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc033  ! 382: LDXA_R	ldxa	[%r31, %r19] 0x01, %r17
donret_20_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_248-donret_20_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f7e3bd | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_248:
	.word 0xe2ffe0d4  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x00d4] %asi
DS_20_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_20_250:
	tsubcctv %r19, 0x1098, %r12
	.word 0xe207e067  ! 385: LDUW_I	lduw	[%r31 + 0x0067], %r17
pmu_20_251:
	nop
	setx 0xfffff07bfffff41e, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_20_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 387: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa7840006  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r6, %-
splash_cmpr_20_254:
	setx 0xb130ecfe1e8316ab, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_20_255:
	set user_data_start, %r31
	.word 0x8580613a  ! 390: WRCCR_I	wr	%r1, 0x013a, %ccr
splash_lsu_20_256:
	set 0x9c95fe80, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	bpos,a	 skip_20_257
	fbg skip_20_257
.align 128
skip_20_257:
	.word 0x87ad0a43  ! 392: FCMPd	fcmpd	%fcc<n>, %f20, %f34
mondo_20_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d940014  ! 393: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xe1bfdc00  ! 395: STDFA_R	stda	%f16, [%r0, %r31]
donret_20_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_260-donret_20_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0076ecde | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x61f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_260:
	.word 0xe0ffe0b6  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x00b6] %asi
unsupttte20_261:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x97a149d4  ! 397: FDIVd	fdivd	%f36, %f20, %f42
intveclr_20_262:
	setx 0x88c0030e0ca179d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_20_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb34ff05  ! 1: STQF_I	-	%f13, [0x1f05, %r19]
	normalw
	.word 0x93458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r9
DS_20_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
mondo_20_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 402: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xa5a00172  ! 403: FABSq	dis not found

mondo_20_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d91c013  ! 404: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_267:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 405: RDPC	rd	%pc, %r8
mondo_20_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d950011  ! 406: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0xa7540000  ! 407: RDPR_GL	<illegal instruction>
donret_20_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_269-donret_20_269-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00701cbc | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x96, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x2acac001  ! 1: BRNZ	brnz,a,pt	%r11,<label_0xac001>
	done
donretarg_20_269:
	.word 0xe4ffe040  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x0040] %asi
	.word 0x99902001  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 410: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_271:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 411: RDPC	rd	%pc, %r8
	.word 0x91d02032  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa9a489d0  ! 413: FDIVd	fdivd	%f18, %f16, %f20
splash_cmpr_20_272:
	setx 0xdbf3de0fbe1d0754, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_20_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_273-donret_20_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00da8b51 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe95, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	done
donretarg_20_273:
	.word 0xe0ffe0ac  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x00ac] %asi
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_274:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 416: RDPC	rd	%pc, %r9
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_20_275:
	set 0x60740000, %r31
	.word 0x8584f7bb  ! 418: WRCCR_I	wr	%r19, 0x17bb, %ccr
splash_hpstate_20_276:
	.word 0x81982b7c  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b7c, %hpstate
intveclr_20_277:
	setx 0x296074445e73b421, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_20_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_278:
	mov 0xd6e, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc031  ! 421: STDA_R	stda	%r16, [%r31 + %r17] 0x01
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_279:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 422: RDPC	rd	%pc, %r17
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x83d02035  ! 424: Tcc_I	te	icc_or_xcc, %r0 + 53
intveclr_20_280:
	setx 0x660c1faffbc483bb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_281)+56, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_281:
	.word 0xa9847942  ! 426: WR_SET_SOFTINT_I	wr	%r17, 0x1942, %set_softint
	.word 0xc187dc00  ! 427: LDFA_R	lda	[%r31, %r0], %f0
donret_20_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_282-donret_20_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aa2cd4 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x51c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_282:
	.word 0xd4ffe0c8  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x00c8] %asi
	.word 0x83d02032  ! 429: Tcc_I	te	icc_or_xcc, %r0 + 50
	brgz,pt  	%r7, skip_20_283
	.word 0xa3a4c9c7  ! 1: FDIVd	fdivd	%f50, %f38, %f48
.align 512
skip_20_283:
	.word 0xe43a8010  ! 430: STD_R	std	%r18, [%r10 + %r16]
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802d0c  ! 433: SIR	sir	0x0d0c
pmu_20_284:
	nop
	setx 0xfffff240fffffd01, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe008  ! 435: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r19
debug_20_285:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe6dfc031  ! 436: LDXA_R	ldxa	[%r31, %r17] 0x01, %r19
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_20_286:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_20_287:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x95500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 442: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_20_290:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_20_291:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe010  ! 446: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_20_292-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_292:
	.word 0x91918014  ! 447: WRPR_PIL_R	wrpr	%r6, %r20, %pil
splash_cmpr_20_293:
	setx 0xa5430af91f9ab080, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_20_294:
	setx 0xaef3ba417905ac4a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_20_295:
	setx 0x7f732d1463483be2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e018  ! 451: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r11
	.word 0x93d020b4  ! 452: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_hpstate_20_296:
	.word 0x81982d85  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d85, %hpstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_298) + 32, 16, 16)) -> intp(0,0,2)
intvec_20_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 51
	setx 0x595dfbd59f1b4951, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a489ca  ! 458: FDIVd	fdivd	%f18, %f10, %f50
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_20_300-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_300:
	.word 0x91944005  ! 460: WRPR_PIL_R	wrpr	%r17, %r5, %pil
DS_20_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
jmptr_20_302:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_20_303:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe617  ! 463: STD_I	std	%r16, [%r31 + 0x0617]
pmu_20_304:
	nop
	setx 0xfffff608fffff804, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_305:
	nop
	setx 0xfffffef1ffffff31, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_306:
	setx 0x4e6ceb56cf2b6410, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a009d1  ! 467: FDIVd	fdivd	%f0, %f48, %f42
    set 0x1d7f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b007e9  ! 468: PDISTN	fmean16	%d0, %d40, %d42
	.word 0x9ba00164  ! 469: FABSq	dis not found

    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xe1bfdc00  ! 471: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_308) + 48, 16, 16)) -> intp(3,0,24)
intvec_20_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 473: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd937e0b4  ! 474: STQF_I	-	%f12, [0x00b4, %r31]
tagged_20_309:
	taddcctv %r19, 0x1375, %r13
	.word 0xd807e04c  ! 475: LDUW_I	lduw	[%r31 + 0x004c], %r12
	bvc  	 skip_20_310
	bg  	 skip_20_310
.align 2048
skip_20_310:
	.word 0x24c9c001  ! 476: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_20_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d940004  ! 478: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0xa5a0016b  ! 479: FABSq	dis not found

	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 480: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_20_313:
	setx 0x473c3aa9af554e94, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_20_314:
	setx 0xd4f337395a1565a7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_20_317:
	taddcctv %r16, 0x11be, %r11
	.word 0xe407e009  ! 485: LDUW_I	lduw	[%r31 + 0x0009], %r18
donret_20_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_318-donret_20_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00053409 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x807, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	retry
donretarg_20_318:
	.word 0xe4ffe087  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x0087] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0x9b464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x91b04489  ! 489: FCMPLE32	fcmple32	%d32, %d40, %r8
	.word 0x8d902fbb  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x0fbb, %pstate
	.word 0xe62fe0c9  ! 491: STB_I	stb	%r19, [%r31 + 0x00c9]
splash_htba_20_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_321:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 493: RDPC	rd	%pc, %r8
	.word 0xad806daa  ! 494: WR_SOFTINT_REG_I	wr	%r1, 0x0daa, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f803719  ! 496: SIR	sir	0x1719
	.word 0xa1a449d3  ! 497: FDIVd	fdivd	%f48, %f50, %f16
jmptr_20_322:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_20_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d91400a  ! 500: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
	.word 0xd86fe006  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x0006]
	.word 0x9f80322e  ! 502: SIR	sir	0x122e
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_324) + 16, 16, 16)) -> intp(2,0,1)
intvec_20_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_325:
	nop
	setx 0xfffff019fffff9fb, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xa1a00164  ! 506: FABSq	dis not found

splash_lsu_20_327:
	set 0x839967ad, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brz,a,pn	%r11, skip_20_328
	bpos  	 skip_20_328
.align 128
skip_20_328:
	.word 0xc36aaca5  ! 508: PREFETCH_I	prefetch	[%r10 + 0x0ca5], #one_read
	.word 0xe83fe0e0  ! 509: STD_I	std	%r20, [%r31 + 0x00e0]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 510: RDPC	rd	%pc, %r20
	.word 0xc187e0c0  ! 511: LDFA_I	lda	[%r31, 0x00c0], %f0
intveclr_20_330:
	setx 0x903530eefd8dd69f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_331:
	.word 0x819827c4  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c4, %hpstate
DS_20_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5344014  ! 1: STQF_R	-	%f10, [%r20, %r17]
	normalw
	.word 0xa1458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r16
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 515: RDPC	rd	%pc, %r20
jmptr_20_334:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe0c5  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x00c5]
splash_tba_20_335:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa37020ac  ! 519: POPC_I	popc	0x00ac, %r17
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_336:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 520: RDPC	rd	%pc, %r17
intveclr_20_337:
	setx 0x566e6391273e5595, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r16
mondo_20_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d914011  ! 523: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
intveclr_20_339:
	setx 0xa3fc4e73abf4229f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d92c00d  ! 525: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
splash_hpstate_20_341:
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x81982597  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0597, %hpstate
	.word 0xe26fe0c8  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x00c8]
splash_lsu_20_342:
	set 0xf56008a2, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fbug skip_20_343
	.word 0xa1a4c9cc  ! 1: FDIVd	fdivd	%f50, %f12, %f16
.align 128
skip_20_343:
	.word 0x95a509cb  ! 529: FDIVd	fdivd	%f20, %f42, %f10
tagged_20_344:
	tsubcctv %r9, 0x1499, %r20
	.word 0xd807e0c5  ! 530: LDUW_I	lduw	[%r31 + 0x00c5], %r12
	.word 0xd8cfe000  ! 531: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
pmu_20_345:
	nop
	setx 0xfffff5bbfffff13a, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e018  ! 533: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_20_346:
	setx 0x5b5195fca69ec60a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_347:
	setx 0x38b157449e921666, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfdb60  ! 537: STDFA_R	stda	%f16, [%r0, %r31]
donret_20_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_348-donret_20_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x001112d3 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe14, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	retry
donretarg_20_348:
	.word 0xd8ffe003  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x0003] %asi
	.word 0xc1bfdc00  ! 539: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa9814013  ! 540: WR_SET_SOFTINT_R	wr	%r5, %r19, %set_softint
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f80223d  ! 542: SIR	sir	0x023d
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_20_349:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_20_350:
	set 0xd1f76f59, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fd060  ! 546: LDDA_R	ldda	[%r31, %r0] 0x83, %r12
intveclr_20_351:
	setx 0xad2d40874b3a91a5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_20_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 548: FCMPd	fcmpd	%fcc<n>, %f0, %f4
intveclr_20_353:
	setx 0x493f49328bb15fe2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 550: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_354:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 551: RDPC	rd	%pc, %r16
	setx 0xe3e61562ab509af9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_358) + 8, 16, 16)) -> intp(0,0,11)
intvec_20_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x00082f9dd2e6901d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 557: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d020b3  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd71fe008  ! 559: LDDF_I	ldd	[%r31, 0x0008], %f11
mondo_20_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d944012  ! 560: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
intveclr_20_361:
	setx 0x55052954877813dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_362:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 562: RDPC	rd	%pc, %r11
splash_tba_20_363:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_20_364:
	setx 0x8ceca5b2c6d6162d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0xa3a349cd  ! 566: FDIVd	fdivd	%f44, %f44, %f48
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 568: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_20_366:
	nop
	setx 0xfffffffdfffff92d, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_367:
	setx 0xd546bf829ed9f352, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_369:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 572: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_20_370-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_370:
	.word 0x91934011  ! 573: WRPR_PIL_R	wrpr	%r13, %r17, %pil
mondo_20_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 574: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
mondo_20_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d930001  ! 575: WRPR_WSTATE_R	wrpr	%r12, %r1, %wstate
DS_20_373:
	.word 0xa7a4c9d4  ! 1: FDIVd	fdivd	%f50, %f20, %f50
	pdist %f18, %f8, %f14
	.word 0xa1b20304  ! 576: ALIGNADDRESS	alignaddr	%r8, %r4, %r16
unsupttte20_374:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3eb0028  ! 577: PREFETCHA_R	prefetcha	[%r12, %r8] 0x01, #one_read
debug_20_375:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc032  ! 578: LDXA_R	ldxa	[%r31, %r18] 0x01, %r12
splash_hpstate_20_376:
	.word 0x81982706  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0706, %hpstate
	.word 0xe187e060  ! 580: LDFA_I	lda	[%r31, 0x0060], %f16
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_377:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 581: RDPC	rd	%pc, %r17
mondo_20_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c006  ! 582: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
intveclr_20_379:
	setx 0x8a90293b186988cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_20_381:
	set 0xe58e3abd, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fble,a,pn	%fcc0,  skip_20_382
	.word 0xe3e4402a  ! 1: CASA_I	casa	[%r17] 0x 1, %r10, %r17
.align 128
skip_20_382:
	.word 0xd9e14032  ! 586: CASA_I	casa	[%r5] 0x 1, %r18, %r12
tagged_20_383:
	taddcctv %r19, 0x1d34, %r6
	.word 0xd807e0d9  ! 587: LDUW_I	lduw	[%r31 + 0x00d9], %r12
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_384:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 588: RDPC	rd	%pc, %r16
	.word 0xa5a489c9  ! 589: FDIVd	fdivd	%f18, %f40, %f18
pmu_20_385:
	nop
	setx 0xfffff8fcfffffd12, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_20_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f0, %f8
	.word 0xa1b40311  ! 591: ALIGNADDRESS	alignaddr	%r16, %r17, %r16
jmptr_20_387:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91d02032  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_20_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_20_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 595: FCMPd	fcmpd	%fcc<n>, %f0, %f4
splash_hpstate_20_390:
	.word 0x81982c3e  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c3e, %hpstate
	.word 0x8d903fbc  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x1fbc, %pstate
cwp_20_392:
    set user_data_start, %o7
	.word 0x93902005  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ble,a	 skip_20_393
	.word 0xe639c000  ! 1: STD_R	std	%r19, [%r7 + %r0]
.align 512
skip_20_393:
	.word 0xd1e4c031  ! 599: CASA_I	casa	[%r19] 0x 1, %r17, %r8
donret_20_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_394-donret_20_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f1ea4e | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf04, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_394:
	.word 0xd8ffe0d5  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x00d5] %asi
	.word 0xa1a049b2  ! 601: FDIVs	fdivs	%f1, %f18, %f16
mondo_20_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d950013  ! 602: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
jmptr_20_396:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_20_397:
	setx 0x74e76bb60cbae8ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_398:
	nop
	setx 0xfffffaaffffffa8c, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_20_399:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc030  ! 606: STDA_R	stda	%r18, [%r31 + %r16] 0x01
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_400)+24, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_400:
	.word 0xa98160fc  ! 607: WR_SET_SOFTINT_I	wr	%r5, 0x00fc, %set_softint
	rd %pc, %r19
	add %r19, (ivw_20_401-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_401:
	.word 0x91950005  ! 608: WRPR_PIL_R	wrpr	%r20, %r5, %pil
	.word 0x9f802a9e  ! 609: SIR	sir	0x0a9e
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_402) + 48, 16, 16)) -> intp(0,0,17)
intvec_20_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_20_403:
	set 0x60340000, %r31
	.word 0x85816a07  ! 611: WRCCR_I	wr	%r5, 0x0a07, %ccr
	.word 0xe46fe012  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x0012]
cwp_20_404:
    set user_data_start, %o7
	.word 0x93902007  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_405)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_405:
	.word 0xa981ba1f  ! 614: WR_SET_SOFTINT_I	wr	%r6, 0x1a1f, %set_softint
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d90279b  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x079b, %pstate
mondo_20_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d91c010  ! 616: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
debug_20_408:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc013  ! 617: LDDF_R	ldd	[%r31, %r19], %f18
pmu_20_409:
	nop
	setx 0xffffff7dfffff9b4, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_410:
	setx 0x8597d572532691d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3500000  ! 620: RDPR_TPC	<illegal instruction>
	setx 0x00150b7196e81071, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa77026e1  ! 622: POPC_I	popc	0x06e1, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e018  ! 624: STF_I	st	%f19, [0x0018, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_20_413:
	nop
	setx 0xfffff6f2fffffa73, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_20_414-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_414:
	.word 0x9194c013  ! 627: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0x91903012  ! 628: WRPR_PIL_I	wrpr	%r0, 0x1012, %pil
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_415:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 629: RDPC	rd	%pc, %r12
change_to_randtl_20_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_416:
	.word 0x8f902001  ! 630: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 632: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_20_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 635: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xa1464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r16
donret_20_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_420-donret_20_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00de8efd | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe57, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_420:
	.word 0xd6ffe0e8  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x00e8] %asi
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_421:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 638: RDPC	rd	%pc, %r16
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 639: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_20_422-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_422:
	.word 0x91910014  ! 640: WRPR_PIL_R	wrpr	%r4, %r20, %pil
splash_cmpr_20_423:
	setx 0x6967cffb73c30273, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_20_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_424-donret_20_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00735e52 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_20_424:
	.word 0xe0ffe0a4  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x00a4] %asi
	.word 0xa5a00174  ! 643: FABSq	dis not found

memptr_20_425:
	set 0x60540000, %r31
	.word 0x8584a897  ! 644: WRCCR_I	wr	%r18, 0x0897, %ccr
	.word 0xe48fe010  ! 645: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
splash_cmpr_20_426:
	setx 0x29ad9c1aca1878d6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x8fb610b278e2257d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_20_428:
	nop
	setx 0xfffff8fcfffff5e4, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e018  ! 650: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r18
	.word 0xe46fe037  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x0037]
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a00165  ! 653: FABSq	dis not found

	.word 0xe68008a0  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_lsu_20_429:
	set 0x43c992c1, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95540000  ! 656: RDPR_GL	rdpr	%-, %r10
	.word 0x9f803a49  ! 657: SIR	sir	0x1a49
	bge  	 skip_20_430
	.word 0xa1a289c3  ! 1: FDIVd	fdivd	%f10, %f34, %f16
.align 512
skip_20_430:
	.word 0xa3a449ca  ! 658: FDIVd	fdivd	%f48, %f10, %f48
	rd %pc, %r19
	add %r19, (ivw_20_431-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_431:
	.word 0x91910011  ! 659: WRPR_PIL_R	wrpr	%r4, %r17, %pil
DS_20_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1469b43	! Random illegal ?
	.word 0xa7a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa5a1c830  ! 660: FADDs	fadds	%f7, %f16, %f18
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 661: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 662: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_20_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_433-donret_20_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b1e57e | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc8c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_433:
	.word 0xd8ffe0dc  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x00dc] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_20_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe134f4dc  ! 1: STQF_I	-	%f16, [0x14dc, %r19]
	normalw
	.word 0xa9458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r20
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_436:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 666: RDPC	rd	%pc, %r13
splash_htba_20_437:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_438)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_438:
	.word 0xa98033ab  ! 668: WR_SET_SOFTINT_I	wr	%r0, 0x13ab, %set_softint
pmu_20_439:
	nop
	setx 0xfffff7c9fffffb53, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9b507f2  ! 670: PDISTN	fmean16	%d20, %d18, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_440) + 56, 16, 16)) -> intp(5,0,17)
intvec_20_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_20_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d903ae4  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x1ae4, %pstate
splash_hpstate_20_443:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982556  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0556, %hpstate
pmu_20_444:
	nop
	setx 0xfffff4b6fffff7e8, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7810008  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r8, %-
	.word 0xda77e050  ! 678: STX_I	stx	%r13, [%r31 + 0x0050]
jmptr_20_446:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f8031ad  ! 680: SIR	sir	0x11ad
DS_20_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a00554  ! 1: FSQRTd	fsqrt	
	.word 0x91a40822  ! 681: FADDs	fadds	%f16, %f2, %f8
	.word 0xda37e0e6  ! 682: STH_I	sth	%r13, [%r31 + 0x00e6]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_448:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 683: RDPC	rd	%pc, %r19
pmu_20_449:
	nop
	setx 0xfffff575fffffb44, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_450:
	set 0xb6ca190a, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x080d46f3b510c6d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_452:
	setx 0x9273bc5efb8ffb4a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_20_454:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81982c8c  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8c, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_20_455:
	setx 0x0a504c6f724bd4f8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e008  ! 692: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r9
splash_lsu_20_456:
	set 0x83e8be1e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab852401  ! 694: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0401, %clear_softint
memptr_20_457:
	set 0x60540000, %r31
	.word 0x85842293  ! 695: WRCCR_I	wr	%r16, 0x0293, %ccr
splash_cmpr_20_458:
	setx 0x6bcbd5286cc7e54a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xa7830002  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r2, %-
	rd %pc, %r19
	add %r19, (ivw_20_461-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_461:
	.word 0x9194c004  ! 700: WRPR_PIL_R	wrpr	%r19, %r4, %pil
	.word 0xa5454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0x95a00170  ! 1: FABSq	dis not found

	.word 0xe187e060  ! 2: LDFA_I	lda	[%r31, 0x0060], %f16
	.word 0xa1a0016b  ! 3: FABSq	dis not found

    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x87a9ca48  ! 5: FCMPd	fcmpd	%fcc<n>, %f38, %f8
pmu_10_2:
	nop
	setx 0xfffff968fffff207, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe0e3  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x00e3]
donret_10_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_3-donret_10_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004d0e82 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x78e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_3:
	.word 0xd2ffe0b9  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x00b9] %asi
jmptr_10_4:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe018  ! 10: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r9
	.word 0x9ba00163  ! 11: FABSq	dis not found

DS_10_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0x93480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xa5480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_10_6:
	setx 0xb7d10c85928304aa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e018  ! 17: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r18
	.word 0xe4dfe020  ! 18: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r18
DS_10_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb32c010  ! 1: STQF_R	-	%f13, [%r16, %r11]
	normalw
	.word 0xa1458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r16
intveclr_10_8:
	setx 0x548c7ec4661715e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_9:
	nop
	setx 0xfffff941fffff60e, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e062  ! 23: STX_I	stx	%r20, [%r31 + 0x0062]
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 24: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7a00172  ! 25: FABSq	dis not found

intveclr_10_10:
	setx 0x02eab4520208b375, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_11:
	.word 0x81982885  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0885, %hpstate
splash_tba_10_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xc43650efb7f88cd3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_10_15:
	nop
	setx 0xfffffe98fffff8e8, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc36caccb  ! 32: PREFETCH_I	prefetch	[%r18 + 0x0ccb], #one_read
splash_cmpr_10_17:
	setx 0x3cd159d8f905ca43, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_10_18:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_10_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 35: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0x9b500000  ! 36: RDPR_TPC	<illegal instruction>
jmptr_10_20:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_10_21:
	setx 0xe682942303cec432, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802629  ! 39: SIR	sir	0x0629
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_10_22-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_22:
	.word 0x91944005  ! 41: WRPR_PIL_R	wrpr	%r17, %r5, %pil
	.word 0xa5a00169  ! 42: FABSq	dis not found

DS_10_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f40
	.word 0xa7a08832  ! 43: FADDs	fadds	%f2, %f18, %f19
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x91a509d3  ! 45: FDIVd	fdivd	%f20, %f50, %f8
	.word 0x87ad0a4b  ! 46: FCMPd	fcmpd	%fcc<n>, %f20, %f42
donret_10_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_25-donret_10_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a77ca6 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7dd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_25:
	.word 0xe2ffe0d8  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x00d8] %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 48: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe26fe09d  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x009d]
	.word 0xe26fe005  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x0005]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xe1bfe0e0  ! 52: STDFA_I	stda	%f16, [0x00e0, %r31]
tagged_10_26:
	tsubcctv %r20, 0x1482, %r16
	.word 0xe207e0ba  ! 53: LDUW_I	lduw	[%r31 + 0x00ba], %r17
	rd %pc, %r19
	add %r19, (ivw_10_27-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_27:
	.word 0x91944006  ! 54: WRPR_PIL_R	wrpr	%r17, %r6, %pil
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f8024c2  ! 56: SIR	sir	0x04c2
splash_hpstate_10_29:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x819829c5  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c5, %hpstate
	.word 0xe277e0f9  ! 58: STX_I	stx	%r17, [%r31 + 0x00f9]
debug_10_30:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_30:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_30
    nop
debug_wait10_30:
    ld [%r23], %r16
    brnz %r16, debug_wait10_30
    nop
    ba,a debug_startwait10_30
continue_debug_10_30:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_30:
    cmp %r13, %r17
    bne,a wait_for_stat_10_30
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_30:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_30
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050aac00042,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc014  ! 59: STDF_R	std	%f17, [%r20, %r31]
jmptr_10_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe0c7  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x00c7]
	rd %pc, %r19
	add %r19, (ivw_10_32-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_32:
	.word 0x91900011  ! 62: WRPR_PIL_R	wrpr	%r0, %r17, %pil
	.word 0x93d02034  ! 63: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xad84e4e2  ! 64: WR_SOFTINT_REG_I	wr	%r19, 0x04e2, %softint
intveclr_10_33:
	setx 0x9ba53114e0d76429, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b1b  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0b1b, %pstate
	.word 0xe187de00  ! 67: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x95520000  ! 68: RDPR_PIL	rdpr	%pil, %r10
	.word 0xd8800c20  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
splash_cmpr_10_35:
	setx 0x95785819385179b7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_10_36:
	set user_data_start, %r31
	.word 0x8582f4db  ! 71: WRCCR_I	wr	%r11, 0x14db, %ccr
	rd %pc, %r19
	add %r19, (ivw_10_37-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_37:
	.word 0x91920006  ! 72: WRPR_PIL_R	wrpr	%r8, %r6, %pil
intveclr_10_38:
	setx 0x0295fb0c69e031fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a409d1  ! 74: FDIVd	fdivd	%f16, %f48, %f10
	.word 0x99a00172  ! 75: FABSq	dis not found

DS_10_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 50
pmu_10_40:
	nop
	setx 0xffffff85fffffcd9, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d903dee  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1dee, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_10_42:
	setx 0x2eaf75becbaf5d4f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_10_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_43-donret_10_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000eb945 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x756, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_43:
	.word 0xe8ffe058  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x0058] %asi
debug_10_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_44:
	mov 0xfdc, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe897c033  ! 83: LDUHA_R	lduha	[%r31, %r19] 0x01, %r20
splash_htba_10_45:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_10_46:
	setx 0xdce1386153405c34, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xc1bfe080  ! 87: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0xa7827a05  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r9, 0x1a05, %-
	setx 0x0e5dac7ac940fa86, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 90: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
donret_10_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_49-donret_10_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006b099b | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcd6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	done
donretarg_10_49:
	.word 0xd8ffe00c  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x000c] %asi
DS_10_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x95a00171  ! 93: FABSq	dis not found

	.word 0xd46fe027  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x0027]
debug_10_51:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_51:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_51
    nop
debug_wait10_51:
    ld [%r23], %r16
    brnz %r16, debug_wait10_51
    nop
    ba,a debug_startwait10_51
continue_debug_10_51:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_51:
    cmp %r13, %r17
    bne,a wait_for_stat_10_51
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_51:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_51
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005004c042a4,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd4bfc024  ! 95: STDA_R	stda	%r10, [%r31 + %r4] 0x01
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0x9345c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_52) + 40, 16, 16)) -> intp(4,0,9)
intvec_10_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_10_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_10_54-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_54:
	.word 0x9192c00b  ! 100: WRPR_PIL_R	wrpr	%r11, %r11, %pil
DS_10_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7130010  ! 1: LDQF_R	-	[%r12, %r16], %f19
	.word 0x91a48822  ! 101: FADDs	fadds	%f18, %f2, %f8
DS_10_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd15acc4f	! Random illegal ?
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a2882d  ! 102: FADDs	fadds	%f10, %f13, %f9
	.word 0xd327e0b8  ! 103: STF_I	st	%f9, [0x00b8, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_10_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d920014  ! 106: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	setx 0xd5bdf0470dcc980a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800be0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
DS_10_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_10_61:
	setx 0xa249b9ac51aaa3a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_10_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_64:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 115: RDPC	rd	%pc, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_66) + 32, 16, 16)) -> intp(7,0,9)
intvec_10_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_10_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_67:
	mov 0x585, %r20
	mov 0x11, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe497c027  ! 118: LDUHA_R	lduha	[%r31, %r7] 0x01, %r18
intveclr_10_68:
	setx 0xa321f2e858036a7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x2ec7eead45f8440c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d940010  ! 121: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	setx 0x26d70164ecee6bd3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a289d4  ! 123: FDIVd	fdivd	%f10, %f20, %f16
splash_cmpr_10_72:
	setx 0x0097da59ebaa2c1b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8038b6  ! 125: SIR	sir	0x18b6
jmptr_10_73:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d903b9a  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x1b9a, %pstate
	.word 0xe9e48029  ! 128: CASA_I	casa	[%r18] 0x 1, %r9, %r20
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f80277b  ! 130: SIR	sir	0x077b
	.word 0x99b40490  ! 131: FCMPLE32	fcmple32	%d16, %d16, %r12
	.word 0xe8bfe048  ! 132: STDA_I	stda	%r20, [%r31 + 0x0048] %asi
splash_htba_10_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_10_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a049d3  ! 1: FDIVd	fdivd	%f32, %f50, %f8
	normalw
	.word 0xa7458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r19
change_to_randtl_10_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_78:
	.word 0x8f902000  ! 135: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_10_79:
	set 0x11a20c23, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e014  ! 137: STF_I	st	%f20, [0x0014, %r31]
splash_cmpr_10_80:
	setx 0x1dad640e2b44a780, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b2  ! 139: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe8cfe020  ! 140: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
splash_htba_10_81:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xc187de00  ! 142: LDFA_R	lda	[%r31, %r0], %f0
jmptr_10_82:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91a349ca  ! 144: FDIVd	fdivd	%f44, %f10, %f8
	.word 0xa7848014  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r20, %-
splash_lsu_10_85:
	set 0x29de69f3, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_86:
	setx 0x63740c6239ab23da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00170  ! 148: FABSq	dis not found

	.word 0xa1a00172  ! 149: FABSq	dis not found

pmu_10_87:
	nop
	setx 0xfffff26afffffbe5, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a00167  ! 151: FABSq	dis not found

mondo_10_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94c012  ! 152: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xda57e030  ! 153: LDSH_I	ldsh	[%r31 + 0x0030], %r13
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_89:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 154: RDPC	rd	%pc, %r13
intveclr_10_90:
	setx 0x6c87cd500fd5a619, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d920010  ! 156: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
donret_10_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_92-donret_10_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f93b28 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd87, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x2eca4001  ! 1: BRGEZ	brgez,a,pt	%r9,<label_0xa4001>
	retry
donretarg_10_92:
	.word 0xd6ffe0c4  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x00c4] %asi
	.word 0xa7820001  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r1, %-
mondo_10_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d91400c  ! 159: WRPR_WSTATE_R	wrpr	%r5, %r12, %wstate
memptr_10_95:
	set 0x60340000, %r31
	.word 0x85847a7a  ! 160: WRCCR_I	wr	%r17, 0x1a7a, %ccr
debug_10_96:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_96:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_96
    nop
debug_wait10_96:
    ld [%r23], %r16
    brnz %r16, debug_wait10_96
    nop
    ba,a debug_startwait10_96
continue_debug_10_96:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_96:
    cmp %r13, %r17
    bne,a wait_for_stat_10_96
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_96:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_96
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005084c2a42a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc014  ! 161: LDDF_R	ldd	[%r31, %r20], %f11
memptr_10_97:
	set 0x60140000, %r31
	.word 0x8584f697  ! 162: WRCCR_I	wr	%r19, 0x1697, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_98) + 0, 16, 16)) -> intp(0,0,30)
intvec_10_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_99:
	.word 0x81982f46  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f46, %hpstate
	.word 0xd727e096  ! 165: STF_I	st	%f11, [0x0096, %r31]
	.word 0xa1b504c9  ! 166: FCMPNE32	fcmpne32	%d20, %d40, %r16
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0x93a00174  ! 168: FABSq	dis not found

fpinit_10_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 169: FDIVs	fdivs	%f0, %f4, %f8
DS_10_102:
	.word 0x9ba009cb  ! 1: FDIVd	fdivd	%f0, %f42, %f44
	allclean
	.word 0xa9b08312  ! 170: ALIGNADDRESS	alignaddr	%r2, %r18, %r20
mondo_10_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d940011  ! 171: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
pmu_10_104:
	nop
	setx 0xfffff727fffff27b, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xa3a509d2  ! 174: FDIVd	fdivd	%f20, %f18, %f48
	.word 0xa9a00172  ! 175: FABSq	dis not found

	.word 0x97b4c7f4  ! 176: PDISTN	fmean16	%d50, %d20, %d42
	.word 0xd44fe030  ! 177: LDSB_I	ldsb	[%r31 + 0x0030], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_10_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d940011  ! 179: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xe187da00  ! 181: LDFA_R	lda	[%r31, %r0], %f16
tagged_10_106:
	tsubcctv %r19, 0x12af, %r2
	.word 0xd407e07c  ! 182: LDUW_I	lduw	[%r31 + 0x007c], %r10
mondo_10_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90c014  ! 183: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_108) + 8, 16, 16)) -> intp(5,0,12)
intvec_10_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 185: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e008  ! 186: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r10
	.word 0xab8533d4  ! 187: WR_CLEAR_SOFTINT_I	wr	%r20, 0x13d4, %clear_softint
splash_hpstate_10_109:
	.word 0x2acb4001  ! 1: BRNZ	brnz,a,pt	%r13,<label_0xb4001>
	.word 0x81982a8d  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8d, %hpstate
mondo_10_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d950014  ! 189: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xc1bfde00  ! 190: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_10_111:
	setx 0x711c145184af81df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 192: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
intveclr_10_113:
	setx 0x9e4a6471a2f97c43, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x87a9ca53  ! 195: FCMPd	fcmpd	%fcc<n>, %f38, %f50
debug_10_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_115:
	mov 0x72e, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc025  ! 196: STDA_R	stda	%r16, [%r31 + %r5] 0x01
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0x10a6eb13855e51f2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_118:
	setx 0x7bcd27da5f9ba1c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802643  ! 200: SIR	sir	0x0643
	ta	T_CHANGE_NONPRIV	! macro
pmu_10_119:
	nop
	setx 0xfffff648fffff7ee, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_120) + 40, 16, 16)) -> intp(2,0,18)
intvec_10_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe0aa  ! 204: STD_I	std	%r16, [%r31 + 0x00aa]
fpinit_10_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 205: FDIVd	fdivd	%f0, %f4, %f6
pmu_10_122:
	nop
	setx 0xfffff904fffff0d5, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x24c9c001  ! 207: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
	.word 0xd23fe060  ! 208: STD_I	std	%r9, [%r31 + 0x0060]
	.word 0x93a00173  ! 209: FABSq	dis not found

splash_cmpr_10_124:
	setx 0xbdf7e263dab152f2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x39400001  ! 211: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_10_127:
	setx 0xfadcb46f2df655c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe038  ! 214: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_128) + 40, 16, 16)) -> intp(5,0,11)
intvec_10_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d5d  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x1d5d, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_130) + 40, 16, 16)) -> intp(7,0,10)
intvec_10_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b4  ! 218: Tcc_I	tne	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 219: RDPC	rd	%pc, %r16
	.word 0xa1a1c9d0  ! 220: FDIVd	fdivd	%f38, %f16, %f16
splash_cmpr_10_132:
	setx 0x01755b62c4447f67, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e076  ! 222: STH_I	sth	%r20, [%r31 + 0x0076]
jmptr_10_133:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_10_134:
	nop
	setx 0xfffff53dfffffd32, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x61d2ccff4c72cbe8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_10_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_136:
	mov 0x60c, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x133,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc032  ! 226: STDA_R	stda	%r20, [%r31 + %r18] 0x01
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xc3e8c024  ! 230: PREFETCHA_R	prefetcha	[%r3, %r4] 0x01, #one_read
	rd %pc, %r19
	add %r19, (ivw_10_140-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_140:
	.word 0x91944012  ! 231: WRPR_PIL_R	wrpr	%r17, %r18, %pil
mondo_10_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d924005  ! 232: WRPR_WSTATE_R	wrpr	%r9, %r5, %wstate
	.word 0x9f80252b  ! 233: SIR	sir	0x052b
pmu_10_142:
	nop
	setx 0xfffffbcefffff8dc, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9191ace0  ! 235: WRPR_PIL_I	wrpr	%r6, 0x0ce0, %pil
splash_hpstate_10_143:
	.word 0x8198200e  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000e, %hpstate
	.word 0xa5a289b2  ! 237: FDIVs	fdivs	%f10, %f18, %f18
memptr_10_144:
	set user_data_start, %r31
	.word 0x8584e41f  ! 238: WRCCR_I	wr	%r19, 0x041f, %ccr
mondo_10_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d910014  ! 239: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
	.word 0xa5a449c5  ! 240: FDIVd	fdivd	%f48, %f36, %f18
pmu_10_147:
	nop
	setx 0xfffff10ffffffe5c, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_10_148:
	setx 0xbc06c3484c5916a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a009c7  ! 244: FDIVd	fdivd	%f0, %f38, %f16
	rd %pc, %r19
	add %r19, (ivw_10_149-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_149:
	.word 0x9191400c  ! 245: WRPR_PIL_R	wrpr	%r5, %r12, %pil
fpinit_10_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 246: FDIVs	fdivs	%f0, %f4, %f6
mondo_10_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d900002  ! 247: WRPR_WSTATE_R	wrpr	%r0, %r2, %wstate
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_10_153:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_153:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_153
    nop
debug_wait10_153:
    ld [%r23], %r16
    brnz %r16, debug_wait10_153
    nop
    ba,a debug_startwait10_153
continue_debug_10_153:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_153:
    cmp %r13, %r17
    bne,a wait_for_stat_10_153
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_153:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_153
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000503ce42aa2,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc028  ! 249: LDXA_R	ldxa	[%r31, %r8] 0x01, %r11
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_10_155:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d90343e  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x143e, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_10_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_157:
	mov 0x615, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6bfc028  ! 254: STDA_R	stda	%r11, [%r31 + %r8] 0x01
intveclr_10_158:
	setx 0xdf9ddb0f4b73eb88, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_159-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_159:
	.word 0x91920012  ! 256: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_10_160:
	set 0x1dff072e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 259: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xa1a00171  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_163:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 263: RDPC	rd	%pc, %r17
mondo_10_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 264: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_10_165:
	set user_data_start, %r31
	.word 0x8582bd72  ! 266: WRCCR_I	wr	%r10, 0x1d72, %ccr
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_168) + 16, 16, 16)) -> intp(0,0,28)
intvec_10_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_10_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_169:
	mov 0x79f, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x20,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 270: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x6283bae415e1555d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e828cf  ! 273: PREFETCHA_I	prefetcha	[%r0, + 0x08cf] %asi, #one_read
	.word 0xab81c00c  ! 274: WR_CLEAR_SOFTINT_R	wr	%r7, %r12, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e030  ! 276: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_10_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d904011  ! 278: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
memptr_10_174:
	set user_data_start, %r31
	.word 0x8584f12f  ! 279: WRCCR_I	wr	%r19, 0x112f, %ccr
	.word 0x8d902a68  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x0a68, %pstate
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 281: RDPC	rd	%pc, %r19
	.word 0x97520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_177:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 283: RDPC	rd	%pc, %r8
fpinit_10_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8236b  ! 284: PREFETCHA_I	prefetcha	[%r0, + 0x036b] %asi, #one_read
	setx 0xdcf0b7167487474f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_10_180:
	tsubcctv %r17, 0x1ac3, %r20
	.word 0xd007e0f2  ! 286: LDUW_I	lduw	[%r31 + 0x00f2], %r8
debug_10_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_181:
	mov 0x77f, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x37,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd03fe36b  ! 287: STD_I	std	%r8, [%r31 + 0x036b]
DS_10_182:
	.word 0x97a489c4  ! 1: FDIVd	fdivd	%f18, %f4, %f42
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_184:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x87ac4a4c  ! 293: FCMPd	fcmpd	%fcc<n>, %f48, %f12
tagged_10_186:
	tsubcctv %r1, 0x14e6, %r19
	.word 0xe607e099  ! 294: LDUW_I	lduw	[%r31 + 0x0099], %r19
	setx 0x2b72969b457a82ac, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3b1c7f2  ! 296: PDISTN	fmean16	%d38, %d18, %d48
intveclr_10_188:
	setx 0xcc3f427fa2390152, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_10_190:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_10_191:
	setx 0x25408ca9cc65bab2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_10_192:
	setx 0xa0ec4b628a082b53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7850008  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r8, %-
	.word 0x97a00161  ! 305: FABSq	dis not found

pmu_10_194:
	nop
	setx 0xfffff743fffff01a, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b2  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 178
memptr_10_195:
	set user_data_start, %r31
	.word 0x85817f43  ! 308: WRCCR_I	wr	%r5, 0x1f43, %ccr
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 309: RDPC	rd	%pc, %r20
	.word 0xa9450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r20
pmu_10_197:
	nop
	setx 0xfffffedafffff76e, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 312: RDPC	rd	%pc, %r19
	.word 0xa9520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_200) + 24, 16, 16)) -> intp(2,0,26)
intvec_10_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_201:
	setx 0x58c5537fdbe447a0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_10_202-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_202:
	.word 0x91918010  ! 317: WRPR_PIL_R	wrpr	%r6, %r16, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_10_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_203:
	mov 0xbba, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe33fc014  ! 319: STDF_R	std	%f17, [%r20, %r31]
donret_10_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_204-donret_10_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e71aff | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x60c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x26cc4001  ! 1: BRLZ	brlz,a,pt	%r17,<label_0xc4001>
	retry
donretarg_10_204:
	.word 0xe2ffe027  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x0027] %asi
	.word 0x97a089d1  ! 321: FDIVd	fdivd	%f2, %f48, %f42
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_206)+8, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_206:
	.word 0xa981324a  ! 322: WR_SET_SOFTINT_I	wr	%r4, 0x124a, %set_softint
	.word 0x87ac4a54  ! 323: FCMPd	fcmpd	%fcc<n>, %f48, %f20
mondo_10_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d950004  ! 324: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	setx 0x02a1be5ae2df0119, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_10_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d904001  ! 326: WRPR_WSTATE_R	wrpr	%r1, %r1, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_212) + 56, 16, 16)) -> intp(6,0,29)
intvec_10_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_10_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83f91  ! 330: PREFETCHA_I	prefetcha	[%r0, + 0xffffff91] %asi, #one_read
DS_10_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f0, %f16
	.word 0xa5b2c313  ! 331: ALIGNADDRESS	alignaddr	%r11, %r19, %r18
	.word 0xd49fc540  ! 332: LDDA_R	ldda	[%r31, %r0] 0x2a, %r10
intveclr_10_215:
	setx 0x606ebcbb8c8b8424, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_216-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_216:
	.word 0x91948012  ! 334: WRPR_PIL_R	wrpr	%r18, %r18, %pil
change_to_randtl_10_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_217:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    set 0x10bc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b487f3  ! 336: PDISTN	fmean16	%d18, %d50, %d40
memptr_10_218:
	set 0x60540000, %r31
	.word 0x8580fc8d  ! 337: WRCCR_I	wr	%r3, 0x1c8d, %ccr
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_10_220:
	setx 0x76fa96108562aae0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_10_221:
	taddcctv %r2, 0x17dd, %r5
	.word 0xe807e074  ! 340: LDUW_I	lduw	[%r31 + 0x0074], %r20
	.word 0x9f8037b8  ! 341: SIR	sir	0x17b8
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 342: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99a00163  ! 343: FABSq	dis not found

	.word 0xa3a4c9d4  ! 344: FDIVd	fdivd	%f50, %f20, %f48
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
    set (0x001d0375 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x59e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_222:
	.word 0xe2ffe0bc  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x00bc] %asi
	.word 0xc187e020  ! 346: LDFA_I	lda	[%r31, 0x0020], %f0
	rd %pc, %r19
	add %r19, (ivw_10_223-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_223:
	.word 0x91908006  ! 347: WRPR_PIL_R	wrpr	%r2, %r6, %pil
cwp_10_224:
    set user_data_start, %o7
	.word 0x93902001  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc3ecc022  ! 349: PREFETCHA_R	prefetcha	[%r19, %r2] 0x01, #one_read
DS_10_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd931e710  ! 1: STQF_I	-	%f12, [0x0710, %r7]
	normalw
	.word 0x91458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r8
pmu_10_226:
	nop
	setx 0xfffff035fffff0ae, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_10_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f12, %f18
	.word 0xa3b4c304  ! 352: ALIGNADDRESS	alignaddr	%r19, %r4, %r17
splash_hpstate_10_228:
	.word 0x81982fa6  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fa6, %hpstate
splash_cmpr_10_229:
	setx 0xe9a3f4cbc6e865b8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a489d0  ! 355: FDIVd	fdivd	%f18, %f16, %f10
memptr_10_230:
	set 0x60740000, %r31
	.word 0x85853270  ! 356: WRCCR_I	wr	%r20, 0x1270, %ccr
	.word 0x97a00160  ! 357: FABSq	dis not found

DS_10_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_10_232:
	nop
	setx 0xfffffc54fffff766, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d902684  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x0684, %pstate
fpinit_10_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 362: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xe927e0c4  ! 363: STF_I	st	%f20, [0x00c4, %r31]
fpinit_10_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 364: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x91d02035  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_10_236:
	setx 0xa17f702d6174437f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_10_237:
	set user_data_start, %r31
	.word 0x8584237c  ! 367: WRCCR_I	wr	%r16, 0x037c, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_238) + 24, 16, 16)) -> intp(3,0,22)
intvec_10_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_239:
	nop
	setx 0xfffff9d0ffffffdf, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_240:
	set 0x51e698aa, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0x8f3b519c9679a570, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_10_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_242-donret_10_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004056d7 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x957, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_242:
	.word 0xe8ffe0e0  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x00e0] %asi
pmu_10_243:
	nop
	setx 0xfffff3cdffffff6b, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe88008a0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x93a00161  ! 376: FABSq	dis not found

	.word 0xab847457  ! 377: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1457, %clear_softint
jmptr_10_244:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_10_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 379: FDIVs	fdivs	%f0, %f4, %f6
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_10_246:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_10_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_247:
	mov 0x639, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+24), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe23fe60a  ! 382: STD_I	std	%r17, [%r31 + 0x060a]
donret_10_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_248-donret_10_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dd69f6 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd0f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	retry
donretarg_10_248:
	.word 0xe2ffe0b9  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x00b9] %asi
DS_10_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_10_250:
	tsubcctv %r16, 0x1b67, %r0
	.word 0xe207e0a6  ! 385: LDUW_I	lduw	[%r31 + 0x00a6], %r17
pmu_10_251:
	nop
	setx 0xfffff0bffffffd19, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_10_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8260a  ! 387: PREFETCHA_I	prefetcha	[%r0, + 0x060a] %asi, #one_read
	.word 0xa784000d  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r13, %-
splash_cmpr_10_254:
	setx 0x0bce468830c630bd, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_10_255:
	set user_data_start, %r31
	.word 0x8581e38d  ! 390: WRCCR_I	wr	%r7, 0x038d, %ccr
splash_lsu_10_256:
	set 0x28914c44, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3b484c7  ! 392: FCMPNE32	fcmpne32	%d18, %d38, %r17
mondo_10_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d904006  ! 393: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xc1bfdc00  ! 395: STDFA_R	stda	%f0, [%r0, %r31]
donret_10_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_260-donret_10_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00812487 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xec7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_260:
	.word 0xe0ffe040  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x0040] %asi
	.word 0xa9b30493  ! 397: FCMPLE32	fcmple32	%d12, %d50, %r20
intveclr_10_262:
	setx 0xa074bd20e9744d75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_10_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3352f1f  ! 1: STQF_I	-	%f17, [0x0f1f, %r20]
	normalw
	.word 0x91458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r8
DS_10_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
mondo_10_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 402: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0xa9a00172  ! 403: FABSq	dis not found

mondo_10_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d928010  ! 404: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_267:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 405: RDPC	rd	%pc, %r10
mondo_10_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d948000  ! 406: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0x9b540000  ! 407: RDPR_GL	<illegal instruction>
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
    set (0x0052629b | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8d6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x26cb0001  ! 1: BRLZ	brlz,a,pt	%r12,<label_0xb0001>
	done
donretarg_10_269:
	.word 0xe4ffe0d2  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x00d2] %asi
	.word 0x99902003  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_270:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 410: RDPC	rd	%pc, %r12
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 411: RDPC	rd	%pc, %r16
	.word 0x83d020b4  ! 412: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x9ba089b1  ! 413: FDIVs	fdivs	%f2, %f17, %f13
splash_cmpr_10_272:
	setx 0x46f97a5fba2aada0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_10_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_273-donret_10_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004ce46c | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x99c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	done
donretarg_10_273:
	.word 0xe0ffe008  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x0008] %asi
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_274:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 416: RDPC	rd	%pc, %r10
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_10_275:
	set 0x60340000, %r31
	.word 0x8584ffa1  ! 418: WRCCR_I	wr	%r19, 0x1fa1, %ccr
splash_hpstate_10_276:
	.word 0x819829f6  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09f6, %hpstate
intveclr_10_277:
	setx 0x4ec6f89b0f060bb4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_10_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_278:
	mov 0x973, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe097c031  ! 421: LDUHA_R	lduha	[%r31, %r17] 0x01, %r16
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_279:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 422: RDPC	rd	%pc, %r16
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x91d02033  ! 424: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_10_280:
	setx 0xeea4cca1b6037825, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_281)+40, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_281:
	.word 0xa9816b55  ! 426: WR_SET_SOFTINT_I	wr	%r5, 0x0b55, %set_softint
	.word 0xc187db60  ! 427: LDFA_R	lda	[%r31, %r0], %f0
donret_10_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_282-donret_10_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0039ce60 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb46, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_282:
	.word 0xd4ffe0bd  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x00bd] %asi
	.word 0x91d020b2  ! 429: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd5e30026  ! 430: CASA_I	casa	[%r12] 0x 1, %r6, %r10
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802fb7  ! 433: SIR	sir	0x0fb7
pmu_10_284:
	nop
	setx 0xfffff3aefffff26d, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe038  ! 435: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r19
debug_10_285:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_285:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_285
    nop
debug_wait10_285:
    ld [%r23], %r16
    brnz %r16, debug_wait10_285
    nop
    ba,a debug_startwait10_285
continue_debug_10_285:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_285:
    cmp %r13, %r17
    bne,a wait_for_stat_10_285
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_285:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_285
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005033eaa22c,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe63fe617  ! 436: STD_I	std	%r19, [%r31 + 0x0617]
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_10_286:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_10_287:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xa5500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_10_290:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_10_291:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe028  ! 446: LDXA_I	ldxa	[%r31, + 0x0028] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_10_292-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_292:
	.word 0x91948012  ! 447: WRPR_PIL_R	wrpr	%r18, %r18, %pil
splash_cmpr_10_293:
	setx 0xf5bd584252ece2f1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_10_294:
	setx 0x2bf64d9d07f806da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_10_295:
	setx 0x2c43b2e374b1c94a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e008  ! 451: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r11
	.word 0x91d02035  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_10_296:
	.word 0x81982046  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0046, %hpstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_298) + 32, 16, 16)) -> intp(3,0,12)
intvec_10_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 456: Tcc_I	tne	icc_or_xcc, %r0 + 179
	setx 0xccdfac21399f9f7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a249c6  ! 458: FDIVd	fdivd	%f40, %f6, %f50
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_10_300-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_300:
	.word 0x91930014  ! 460: WRPR_PIL_R	wrpr	%r12, %r20, %pil
DS_10_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
jmptr_10_302:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_10_303:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_303:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_303
    nop
debug_wait10_303:
    ld [%r23], %r16
    brnz %r16, debug_wait10_303
    nop
    ba,a debug_startwait10_303
continue_debug_10_303:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_303:
    cmp %r13, %r17
    bne,a wait_for_stat_10_303
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_303:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_303
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000503ae22c7e,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe097c031  ! 463: LDUHA_R	lduha	[%r31, %r17] 0x01, %r16
pmu_10_304:
	nop
	setx 0xfffff171fffffd11, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_305:
	nop
	setx 0xfffff8e7fffffe60, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_306:
	setx 0x5722cb81e19615df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a449cc  ! 467: FDIVd	fdivd	%f48, %f12, %f10
    set 0x32fa, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b347f0  ! 468: PDISTN	fmean16	%d44, %d16, %d50
	.word 0xa7a00164  ! 469: FABSq	dis not found

    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xc1bfc2c0  ! 471: STDFA_R	stda	%f0, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_308) + 0, 16, 16)) -> intp(6,0,5)
intvec_10_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 473: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd937e018  ! 474: STQF_I	-	%f12, [0x0018, %r31]
tagged_10_309:
	taddcctv %r2, 0x1398, %r7
	.word 0xd807e000  ! 475: LDUW_I	lduw	[%r31 + 0x0000], %r12
	.word 0xa9a409cb  ! 476: FDIVd	fdivd	%f16, %f42, %f20
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_10_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d92c000  ! 478: WRPR_WSTATE_R	wrpr	%r11, %r0, %wstate
	.word 0xa1a00161  ! 479: FABSq	dis not found

	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_10_313:
	setx 0x0979dc474e726524, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_10_314:
	setx 0x97896632b8f3dfbb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_10_317:
	taddcctv %r11, 0x140d, %r18
	.word 0xe407e058  ! 485: LDUW_I	lduw	[%r31 + 0x0058], %r18
donret_10_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_318-donret_10_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dfc6ef | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x2cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	retry
donretarg_10_318:
	.word 0xe4ffe0e0  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x00e0] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0xa9464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0xa1b4c489  ! 489: FCMPLE32	fcmple32	%d50, %d40, %r16
	.word 0x8d90239d  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x039d, %pstate
	.word 0xe62fe0a5  ! 491: STB_I	stb	%r19, [%r31 + 0x00a5]
splash_htba_10_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_321:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 493: RDPC	rd	%pc, %r9
	.word 0xad843266  ! 494: WR_SOFTINT_REG_I	wr	%r16, 0x1266, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f8037ef  ! 496: SIR	sir	0x17ef
	.word 0x93a489d3  ! 497: FDIVd	fdivd	%f18, %f50, %f40
jmptr_10_322:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_10_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d94c003  ! 500: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0xd86fe0f2  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x00f2]
	.word 0x9f802aaf  ! 502: SIR	sir	0x0aaf
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_324) + 48, 16, 16)) -> intp(0,0,10)
intvec_10_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_325:
	nop
	setx 0xfffff1e1fffffd66, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9ba00168  ! 506: FABSq	dis not found

splash_lsu_10_327:
	set 0x236b7bf0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 508: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fe0cb  ! 509: STD_I	std	%r20, [%r31 + 0x00cb]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 510: RDPC	rd	%pc, %r17
	.word 0xc187e040  ! 511: LDFA_I	lda	[%r31, 0x0040], %f0
intveclr_10_330:
	setx 0xbb0b296cd5aeeb68, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_331:
	.word 0x81982385  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0385, %hpstate
DS_10_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe7334000  ! 1: STQF_R	-	%f19, [%r0, %r13]
	normalw
	.word 0x97458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r11
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_333:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 515: RDPC	rd	%pc, %r9
jmptr_10_334:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe021  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x0021]
splash_tba_10_335:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91b48486  ! 519: FCMPLE32	fcmple32	%d18, %d6, %r8
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_336:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 520: RDPC	rd	%pc, %r20
intveclr_10_337:
	setx 0x692a7c9472fbb3ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r13
mondo_10_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d928010  ! 523: WRPR_WSTATE_R	wrpr	%r10, %r16, %wstate
intveclr_10_339:
	setx 0x27b06e3addca75ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d924004  ! 525: WRPR_WSTATE_R	wrpr	%r9, %r4, %wstate
splash_hpstate_10_341:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81982e46  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e46, %hpstate
	.word 0xe26fe06c  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x006c]
splash_lsu_10_342:
	set 0x379fb402, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7b484ca  ! 529: FCMPNE32	fcmpne32	%d18, %d10, %r19
tagged_10_344:
	tsubcctv %r17, 0x145f, %r4
	.word 0xd807e040  ! 530: LDUW_I	lduw	[%r31 + 0x0040], %r12
	.word 0xd8cfe038  ! 531: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r12
pmu_10_345:
	nop
	setx 0xfffff8ebfffffacd, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e008  ! 533: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_10_346:
	setx 0x9c76cbd4442b1e9a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_347:
	setx 0x5998462b94f098c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfdc00  ! 537: STDFA_R	stda	%f0, [%r0, %r31]
donret_10_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_348-donret_10_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007e1c16 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1d4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	retry
donretarg_10_348:
	.word 0xd8ffe0ac  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x00ac] %asi
	.word 0xe1bfda00  ! 539: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa9848013  ! 540: WR_SET_SOFTINT_R	wr	%r18, %r19, %set_softint
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 541: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802d06  ! 542: SIR	sir	0x0d06
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_10_349:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_10_350:
	set 0x46a92f2c, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc2c0  ! 546: LDDA_R	ldda	[%r31, %r0] 0x16, %r12
intveclr_10_351:
	setx 0xa94a2edc106d42b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_10_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 548: FDIVs	fdivs	%f0, %f4, %f6
intveclr_10_353:
	setx 0x17cf0070772ac9e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 550: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_354:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 551: RDPC	rd	%pc, %r20
	setx 0x696f71530994e974, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_358) + 8, 16, 16)) -> intp(2,0,17)
intvec_10_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x44a6ffef9f6dd848, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd71fe038  ! 559: LDDF_I	ldd	[%r31, 0x0038], %f11
mondo_10_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d90800c  ! 560: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
intveclr_10_361:
	setx 0x588ed88a5a01ac1f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_362:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 562: RDPC	rd	%pc, %r18
splash_tba_10_363:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_10_364:
	setx 0x20b7d9174aab864d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0xa5a489d3  ! 566: FDIVd	fdivd	%f18, %f50, %f18
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 568: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_10_366:
	nop
	setx 0xfffff713fffffbc9, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_367:
	setx 0x3823fd7565218012, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_369:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 572: RDPC	rd	%pc, %r19
	rd %pc, %r19
	add %r19, (ivw_10_370-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_370:
	.word 0x9194c013  ! 573: WRPR_PIL_R	wrpr	%r19, %r19, %pil
mondo_10_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d944011  ! 574: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
mondo_10_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d948009  ! 575: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
DS_10_373:
	.word 0x93a509c2  ! 1: FDIVd	fdivd	%f20, %f2, %f40
	pdist %f26, %f24, %f30
	.word 0xa7b1c300  ! 576: ALIGNADDRESS	alignaddr	%r7, %r0, %r19
	.word 0xa3a309d1  ! 577: FDIVd	fdivd	%f12, %f48, %f48
debug_10_375:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_375:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_375
    nop
debug_wait10_375:
    ld [%r23], %r16
    brnz %r16, debug_wait10_375
    nop
    ba,a debug_startwait10_375
continue_debug_10_375:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_375:
    cmp %r13, %r17
    bne,a wait_for_stat_10_375
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_375:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_375
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000503fec7e10,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd83ffed8  ! 578: STD_I	std	%r12, [%r31 + 0xfffffed8]
splash_hpstate_10_376:
	.word 0x81982c17  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
	.word 0xc187e080  ! 580: LDFA_I	lda	[%r31, 0x0080], %f0
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_377:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 581: RDPC	rd	%pc, %r18
mondo_10_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d948014  ! 582: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
intveclr_10_379:
	setx 0xf82104e655ba374d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_10_381:
	set 0x8a08410e, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 586: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_10_383:
	taddcctv %r8, 0x1493, %r19
	.word 0xd807e07e  ! 587: LDUW_I	lduw	[%r31 + 0x007e], %r12
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_384:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 588: RDPC	rd	%pc, %r8
	.word 0xa7a049d4  ! 589: FDIVd	fdivd	%f32, %f20, %f50
pmu_10_385:
	nop
	setx 0xfffff8bcfffff13a, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_10_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f12, %f26
	.word 0xa9b14314  ! 591: ALIGNADDRESS	alignaddr	%r5, %r20, %r20
jmptr_10_387:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x93d02033  ! 593: Tcc_I	tne	icc_or_xcc, %r0 + 51
DS_10_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_10_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e44  ! 595: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe44] %asi, #one_read
splash_hpstate_10_390:
	.word 0x8198280c  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080c, %hpstate
	.word 0x8d902385  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0385, %pstate
cwp_10_392:
    set user_data_start, %o7
	.word 0x93902000  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc369a14f  ! 599: PREFETCH_I	prefetch	[%r6 + 0x014f], #one_read
donret_10_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_394-donret_10_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00655118 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x51e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	retry
donretarg_10_394:
	.word 0xd8ffe03c  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x003c] %asi
	.word 0xc3ecc028  ! 601: PREFETCHA_R	prefetcha	[%r19, %r8] 0x01, #one_read
mondo_10_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d934000  ! 602: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
jmptr_10_396:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_10_397:
	setx 0x1ffc74b5168c8830, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_398:
	nop
	setx 0xfffffef8fffff8b0, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_10_399:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_399:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_399
    nop
debug_wait10_399:
    ld [%r23], %r16
    brnz %r16, debug_wait10_399
    nop
    ba,a debug_startwait10_399
continue_debug_10_399:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_399:
    cmp %r13, %r17
    bne,a wait_for_stat_10_399
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_399:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_399
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005033fe1072,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 606: CASA_R	casa	[%r31] %asi, %r16, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_400)+16, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_400:
	.word 0xa984a583  ! 607: WR_SET_SOFTINT_I	wr	%r18, 0x0583, %set_softint
	rd %pc, %r19
	add %r19, (ivw_10_401-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_401:
	.word 0x91920012  ! 608: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	.word 0x9f802196  ! 609: SIR	sir	0x0196
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_402) + 48, 16, 16)) -> intp(4,0,22)
intvec_10_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_10_403:
	set 0x60740000, %r31
	.word 0x8584ea66  ! 611: WRCCR_I	wr	%r19, 0x0a66, %ccr
	.word 0xe46fe037  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x0037]
cwp_10_404:
    set user_data_start, %o7
	.word 0x93902002  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_405)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_405:
	.word 0xa9817b30  ! 614: WR_SET_SOFTINT_I	wr	%r5, 0x1b30, %set_softint
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x8d9027e7  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x07e7, %pstate
mondo_10_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 616: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
debug_10_408:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_408:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_408
    nop
debug_wait10_408:
    ld [%r23], %r16
    brnz %r16, debug_wait10_408
    nop
    ba,a debug_startwait10_408
continue_debug_10_408:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_408:
    cmp %r13, %r17
    bne,a wait_for_stat_10_408
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_408:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_408
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005091d07282,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc013  ! 617: LDDF_R	ldd	[%r31, %r19], %f18
pmu_10_409:
	nop
	setx 0xfffffbe3fffff128, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_410:
	setx 0x1fac8ae3bf2741c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b500000  ! 620: RDPR_TPC	<illegal instruction>
	setx 0x4745edd4845ef2ab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7b30494  ! 622: FCMPLE32	fcmple32	%d12, %d20, %r19
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e0e2  ! 624: STF_I	st	%f19, [0x00e2, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_10_413:
	nop
	setx 0xfffff485ffffff9b, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_10_414-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_414:
	.word 0x91934011  ! 627: WRPR_PIL_R	wrpr	%r13, %r17, %pil
	.word 0x9194b672  ! 628: WRPR_PIL_I	wrpr	%r18, 0x1672, %pil
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_415:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 629: RDPC	rd	%pc, %r12
change_to_randtl_10_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_416:
	.word 0x8f902000  ! 630: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 632: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_10_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 635: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa1464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r16
donret_10_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_420-donret_10_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cc3109 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	retry
donretarg_10_420:
	.word 0xd6ffe094  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x0094] %asi
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_421:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 638: RDPC	rd	%pc, %r9
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 639: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_10_422-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_422:
	.word 0x91940009  ! 640: WRPR_PIL_R	wrpr	%r16, %r9, %pil
splash_cmpr_10_423:
	setx 0x4d283f2f69716a44, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_10_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_424-donret_10_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cca8ed | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x18c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	retry
donretarg_10_424:
	.word 0xe0ffe0a0  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x00a0] %asi
	.word 0x93a0016a  ! 643: FABSq	dis not found

memptr_10_425:
	set 0x60740000, %r31
	.word 0x8584a72d  ! 644: WRCCR_I	wr	%r18, 0x072d, %ccr
	.word 0xe48fe000  ! 645: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
splash_cmpr_10_426:
	setx 0x122bef887d3da724, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xaa57b6513242e2d9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_10_428:
	nop
	setx 0xfffff2a0fffff728, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e030  ! 650: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe46fe09d  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x009d]
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a00171  ! 653: FABSq	dis not found

	.word 0xe6800bc0  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
splash_lsu_10_429:
	set 0xa6127370, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1540000  ! 656: RDPR_GL	rdpr	%-, %r16
	.word 0x9f802c23  ! 657: SIR	sir	0x0c23
	.word 0xc3692f3e  ! 658: PREFETCH_I	prefetch	[%r4 + 0x0f3e], #one_read
	rd %pc, %r19
	add %r19, (ivw_10_431-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_431:
	.word 0x91940000  ! 659: WRPR_PIL_R	wrpr	%r16, %r0, %pil
DS_10_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9d7cfd59	! Random illegal ?
	.word 0xa7a00550  ! 1: FSQRTd	fsqrt	
	.word 0x91a4c821  ! 660: FADDs	fadds	%f19, %f1, %f8
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 662: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_10_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_433-donret_10_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ce47de | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc0e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_433:
	.word 0xd8ffe0b0  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x00b0] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_10_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3353b44  ! 1: STQF_I	-	%f9, [0x1b44, %r20]
	normalw
	.word 0xa7458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r19
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_436:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 666: RDPC	rd	%pc, %r13
splash_htba_10_437:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_438)+48, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_438:
	.word 0xa980e30a  ! 668: WR_SET_SOFTINT_I	wr	%r3, 0x030a, %set_softint
pmu_10_439:
	nop
	setx 0xfffff026fffff14c, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc3ecc02c  ! 670: PREFETCHA_R	prefetcha	[%r19, %r12] 0x01, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_440) + 24, 16, 16)) -> intp(4,0,25)
intvec_10_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_10_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8d90234d  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x034d, %pstate
splash_hpstate_10_443:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982cce  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cce, %hpstate
pmu_10_444:
	nop
	setx 0xfffff58dffffff38, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa784c009  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r9, %-
	.word 0xda77e081  ! 678: STX_I	stx	%r13, [%r31 + 0x0081]
jmptr_10_446:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f802709  ! 680: SIR	sir	0x0709
DS_10_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x93a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa5a00829  ! 681: FADDs	fadds	%f0, %f9, %f18
	.word 0xda37e0d4  ! 682: STH_I	sth	%r13, [%r31 + 0x00d4]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_448:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 683: RDPC	rd	%pc, %r19
pmu_10_449:
	nop
	setx 0xfffff8f4fffffdd3, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_450:
	set 0x5aa871f5, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x710ea76ee18b70f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_452:
	setx 0x72ca8ba6d0e9746f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_10_454:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8198289c  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089c, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_10_455:
	setx 0xf42f4335b078b744, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e008  ! 692: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r9
splash_lsu_10_456:
	set 0x618e7814, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab84ac85  ! 694: WR_CLEAR_SOFTINT_I	wr	%r18, 0x0c85, %clear_softint
memptr_10_457:
	set 0x60340000, %r31
	.word 0x85816ced  ! 695: WRCCR_I	wr	%r5, 0x0ced, %ccr
splash_cmpr_10_458:
	setx 0x05ac3d55f3e21775, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xa7818003  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r3, %-
	rd %pc, %r19
	add %r19, (ivw_10_461-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_461:
	.word 0x9194c013  ! 700: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0x91454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0xa5a00169  ! 1: FABSq	dis not found

	.word 0xe187e0a0  ! 2: LDFA_I	lda	[%r31, 0x00a0], %f16
	.word 0xa7a0016a  ! 3: FABSq	dis not found

    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0x39400001  ! 5: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_2:
	nop
	setx 0xfffffcf9fffffdfe, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe047  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x0047]
donret_8_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_3-donret_8_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007bdaa8 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe5c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_3:
	.word 0xd2ffe0d9  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x00d9] %asi
jmptr_8_4:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe028  ! 10: LDDA_I	ldda	[%r31, + 0x0028] %asi, %r9
	.word 0x97a00170  ! 11: FABSq	dis not found

DS_8_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0x97480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xa7480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_8_6:
	setx 0x9b080f3a4e01c41e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e000  ! 17: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe4dfe000  ! 18: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
DS_8_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1330012  ! 1: STQF_R	-	%f8, [%r18, %r12]
	normalw
	.word 0xa5458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r18
intveclr_8_8:
	setx 0x46b1f326d359d612, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_9:
	nop
	setx 0xfffff340fffff02d, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e098  ! 23: STX_I	stx	%r20, [%r31 + 0x0098]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 24: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba00163  ! 25: FABSq	dis not found

intveclr_8_10:
	setx 0x900bda2352cab9cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_11:
	.word 0x819827ce  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ce, %hpstate
splash_tba_8_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0xb257048820d7ffb9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_8_15:
	nop
	setx 0xfffffd2cffffffd5, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x24cc8001  ! 32: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
splash_cmpr_8_17:
	setx 0xe376c6383bcca819, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_8_18:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_8_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d93000b  ! 35: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	.word 0x9b500000  ! 36: RDPR_TPC	<illegal instruction>
jmptr_8_20:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_8_21:
	setx 0xb318857b9bdfb508, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8024a9  ! 39: SIR	sir	0x04a9
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_8_22-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_22:
	.word 0x91914012  ! 41: WRPR_PIL_R	wrpr	%r5, %r18, %pil
	.word 0x9ba00167  ! 42: FABSq	dis not found

DS_8_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x95a4c9c1  ! 1: FDIVd	fdivd	%f50, %f32, %f10
	.word 0x95a10823  ! 43: FADDs	fadds	%f4, %f3, %f10
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x95a009c3  ! 45: FDIVd	fdivd	%f0, %f34, %f10
	.word 0x87ac4a40  ! 46: FCMPd	fcmpd	%fcc<n>, %f48, %f0
donret_8_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_25-donret_8_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a3240f | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe1d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_25:
	.word 0xe2ffe085  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x0085] %asi
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 48: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe26fe08f  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x008f]
	.word 0xe26fe060  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x0060]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xc1bfe0a0  ! 52: STDFA_I	stda	%f0, [0x00a0, %r31]
tagged_8_26:
	tsubcctv %r3, 0x101a, %r9
	.word 0xe207e00c  ! 53: LDUW_I	lduw	[%r31 + 0x000c], %r17
	rd %pc, %r19
	add %r19, (ivw_8_27-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_27:
	.word 0x91944013  ! 54: WRPR_PIL_R	wrpr	%r17, %r19, %pil
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f803cc5  ! 56: SIR	sir	0x1cc5
splash_hpstate_8_29:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982c54  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c54, %hpstate
	.word 0xe277e014  ! 58: STX_I	stx	%r17, [%r31 + 0x0014]
debug_8_30:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc014  ! 59: LDDF_R	ldd	[%r31, %r20], %f17
jmptr_8_31:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe020  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x0020]
	rd %pc, %r19
	add %r19, (ivw_8_32-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_32:
	.word 0x91914010  ! 62: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0x91d020b2  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xad84b2b3  ! 64: WR_SOFTINT_REG_I	wr	%r18, 0x12b3, %softint
intveclr_8_33:
	setx 0x88468def2ea593bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f00  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0f00, %pstate
	.word 0xe187da00  ! 67: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x95520000  ! 68: RDPR_PIL	rdpr	%pil, %r10
	.word 0xd8800b80  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r12
splash_cmpr_8_35:
	setx 0x9016390c7c725bf0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_8_36:
	set user_data_start, %r31
	.word 0x8580b669  ! 71: WRCCR_I	wr	%r2, 0x1669, %ccr
	rd %pc, %r19
	add %r19, (ivw_8_37-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_37:
	.word 0x9190800b  ! 72: WRPR_PIL_R	wrpr	%r2, %r11, %pil
intveclr_8_38:
	setx 0x289096fe39603810, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a509c5  ! 74: FDIVd	fdivd	%f20, %f36, %f50
	.word 0xa1a00165  ! 75: FABSq	dis not found

DS_8_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b4  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 180
pmu_8_40:
	nop
	setx 0xfffffd66fffff9e4, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d902788  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x0788, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_8_42:
	setx 0xea54160ac811e3df, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_8_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_43-donret_8_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d986f3 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x594, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_43:
	.word 0xe8ffe0ae  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x00ae] %asi
debug_8_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_44:
	mov 0x95d, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe897c033  ! 83: LDUHA_R	lduha	[%r31, %r19] 0x01, %r20
splash_htba_8_45:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_8_46:
	setx 0xa1184d9e729ec546, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
	.word 0xe1bfe040  ! 87: STDFA_I	stda	%f16, [0x0040, %r31]
	.word 0xa7817048  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r5, 0x1048, %-
	setx 0xa3cecbeb75a2b05d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d918014  ! 90: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
donret_8_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_49-donret_8_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0067b58f | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x704, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_49:
	.word 0xd8ffe0f8  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x00f8] %asi
DS_8_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x9ba00171  ! 93: FABSq	dis not found

	.word 0xd46fe01a  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x001a]
debug_8_51:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd4dfc024  ! 95: LDXA_R	ldxa	[%r31, %r4] 0x01, %r10
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0xa345c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_52) + 16, 16, 16)) -> intp(6,0,21)
intvec_8_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_8_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_8_54-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_54:
	.word 0x9194800b  ! 100: WRPR_PIL_R	wrpr	%r18, %r11, %pil
DS_8_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe714c014  ! 1: LDQF_R	-	[%r19, %r20], %f19
	.word 0xa5a04833  ! 101: FADDs	fadds	%f1, %f19, %f18
DS_8_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc5661ac0	! Random illegal ?
	.word 0x93a00553  ! 1: FSQRTd	fsqrt	
	.word 0x91a4c82b  ! 102: FADDs	fadds	%f19, %f11, %f8
	.word 0xd327e01c  ! 103: STF_I	st	%f9, [0x001c, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_8_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d950010  ! 106: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	setx 0x60728941c4efcbad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
DS_8_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_8_61:
	setx 0xbc150111b74e94a4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_8_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_64:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 115: RDPC	rd	%pc, %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_66) + 0, 16, 16)) -> intp(7,0,0)
intvec_8_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_8_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_67:
	mov 0x6e9, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc007  ! 118: LDDF_R	ldd	[%r31, %r7], %f18
intveclr_8_68:
	setx 0x4b745e13d30775a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xcb92d713d7e019cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 121: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	setx 0x10c9bcf7d5df87bc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a4c9d0  ! 123: FDIVd	fdivd	%f50, %f16, %f50
splash_cmpr_8_72:
	setx 0x2d68852f73f467ce, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80246c  ! 125: SIR	sir	0x046c
jmptr_8_73:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x24c88001  ! 1: BRLEZ	brlez,a,pt	%r2,<label_0x88001>
	.word 0x8d903c6d  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x1c6d, %pstate
	.word 0x97b344d1  ! 128: FCMPNE32	fcmpne32	%d44, %d48, %r11
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f802719  ! 130: SIR	sir	0x0719
	.word 0xc3e94031  ! 131: PREFETCHA_R	prefetcha	[%r5, %r17] 0x01, #one_read
	.word 0xe8bfe0c0  ! 132: STDA_I	stda	%r20, [%r31 + 0x00c0] %asi
splash_htba_8_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_8_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa3a2c9d0  ! 1: FDIVd	fdivd	%f42, %f16, %f48
	normalw
	.word 0x93458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r9
change_to_randtl_8_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_78:
	.word 0x8f902000  ! 135: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_8_79:
	set 0x09fd0d13, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e05d  ! 137: STF_I	st	%f20, [0x005d, %r31]
splash_cmpr_8_80:
	setx 0x1d35aa467123898e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93d020b3  ! 139: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xe8cfe010  ! 140: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
splash_htba_8_81:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xc187de00  ! 142: LDFA_R	lda	[%r31, %r0], %f0
jmptr_8_82:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x87ac8a54  ! 144: FCMPd	fcmpd	%fcc<n>, %f18, %f20
splash_decr_8_84:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7848013  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r19, %-
splash_lsu_8_85:
	set 0xfefb8e85, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_86:
	setx 0xcdf24b2cd8afdca4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a00162  ! 148: FABSq	dis not found

	.word 0x95a00172  ! 149: FABSq	dis not found

pmu_8_87:
	nop
	setx 0xfffff01afffff1d7, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97a00171  ! 151: FABSq	dis not found

mondo_8_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d920012  ! 152: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0xda57e008  ! 153: LDSH_I	ldsh	[%r31 + 0x0008], %r13
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 154: RDPC	rd	%pc, %r18
intveclr_8_90:
	setx 0x47699768fcd08c49, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d940007  ! 156: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
donret_8_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_92-donret_8_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e94b4e | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe9c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_92:
	.word 0xd6ffe040  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x0040] %asi
splash_decr_8_93:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7804006  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r6, %-
mondo_8_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d918007  ! 159: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
memptr_8_95:
	set 0x60740000, %r31
	.word 0x85847309  ! 160: WRCCR_I	wr	%r17, 0x1309, %ccr
debug_8_96:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd697c034  ! 161: LDUHA_R	lduha	[%r31, %r20] 0x01, %r11
memptr_8_97:
	set 0x60140000, %r31
	.word 0x858475d2  ! 162: WRCCR_I	wr	%r17, 0x15d2, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_98) + 48, 16, 16)) -> intp(0,0,26)
intvec_8_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_99:
	.word 0x81982bff  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bff, %hpstate
	.word 0xd727e0c0  ! 165: STF_I	st	%f11, [0x00c0, %r31]
	.word 0x39400001  ! 166: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0x95a00171  ! 168: FABSq	dis not found

fpinit_8_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 169: FDIVs	fdivs	%f0, %f4, %f4
DS_8_102:
	.word 0x93a409c4  ! 1: FDIVd	fdivd	%f16, %f4, %f40
	allclean
	.word 0x99b4830d  ! 170: ALIGNADDRESS	alignaddr	%r18, %r13, %r12
mondo_8_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94400a  ! 171: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
pmu_8_104:
	nop
	setx 0xfffffb59fffff1f0, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r9
	.word 0xa5a449cb  ! 174: FDIVd	fdivd	%f48, %f42, %f18
	.word 0x93a00174  ! 175: FABSq	dis not found

	.word 0x87a98a54  ! 176: FCMPd	fcmpd	%fcc<n>, %f6, %f20
	.word 0xd44fe010  ! 177: LDSB_I	ldsb	[%r31 + 0x0010], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_8_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d920014  ! 179: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xe187de00  ! 181: LDFA_R	lda	[%r31, %r0], %f16
tagged_8_106:
	tsubcctv %r9, 0x1d23, %r10
	.word 0xd407e048  ! 182: LDUW_I	lduw	[%r31 + 0x0048], %r10
mondo_8_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d91400a  ! 183: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_108) + 16, 16, 16)) -> intp(3,0,12)
intvec_8_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 185: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e028  ! 186: LDSWA_I	ldswa	[%r31, + 0x0028] %asi, %r10
	.word 0xab82f6bb  ! 187: WR_CLEAR_SOFTINT_I	wr	%r11, 0x16bb, %clear_softint
splash_hpstate_8_109:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982f1d  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1d, %hpstate
mondo_8_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d940007  ! 189: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0xe1bfc2c0  ! 190: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_8_111:
	setx 0x021e40d7fb160fdf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d92c012  ! 192: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
intveclr_8_113:
	setx 0xceecf150692089f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x99b087e5  ! 195: PDISTN	fmean16	%d2, %d36, %d12
debug_8_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_115:
	mov 0x4a0, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc025  ! 196: LDXA_R	ldxa	[%r31, %r5] 0x01, %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0x4fb49763cf27444a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_118:
	setx 0x1048ce68052b1acd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802c01  ! 200: SIR	sir	0x0c01
	ta	T_CHANGE_NONPRIV	! macro
pmu_8_119:
	nop
	setx 0xfffffc61fffff62a, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_120) + 0, 16, 16)) -> intp(4,0,15)
intvec_8_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe079  ! 204: STD_I	std	%r16, [%r31 + 0x0079]
fpinit_8_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 205: FCMPd	fcmpd	%fcc<n>, %f0, %f4
pmu_8_122:
	nop
	setx 0xfffff44efffff728, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7b504d0  ! 207: FCMPNE32	fcmpne32	%d20, %d16, %r19
	.word 0xd23fe060  ! 208: STD_I	std	%r9, [%r31 + 0x0060]
	.word 0x97a00164  ! 209: FABSq	dis not found

splash_cmpr_8_124:
	setx 0x548f942c61192e17, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9b4c4c9  ! 211: FCMPNE32	fcmpne32	%d50, %d40, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_8_127:
	setx 0x19d424432b204e1a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe018  ! 214: LDXA_I	ldxa	[%r31, + 0x0018] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_128) + 24, 16, 16)) -> intp(4,0,26)
intvec_8_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902afe  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x0afe, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_130) + 56, 16, 16)) -> intp(5,0,25)
intvec_8_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 218: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 219: RDPC	rd	%pc, %r17
	.word 0x99a509d0  ! 220: FDIVd	fdivd	%f20, %f16, %f12
splash_cmpr_8_132:
	setx 0x623c7bde36530aea, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e07c  ! 222: STH_I	sth	%r20, [%r31 + 0x007c]
jmptr_8_133:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_8_134:
	nop
	setx 0xfffffef5fffff595, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x99b8db02a1c0ec4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_8_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_136:
	mov 0x76d, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x37,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 226: CASA_R	casa	[%r31] %asi, %r18, %r20
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x91b10493  ! 230: FCMPLE32	fcmple32	%d4, %d50, %r8
	rd %pc, %r19
	add %r19, (ivw_8_140-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_140:
	.word 0x91948006  ! 231: WRPR_PIL_R	wrpr	%r18, %r6, %pil
mondo_8_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d944013  ! 232: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0x9f802d45  ! 233: SIR	sir	0x0d45
pmu_8_142:
	nop
	setx 0xfffff57dfffff54c, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9194bfb2  ! 235: WRPR_PIL_I	wrpr	%r18, 0x1fb2, %pil
splash_hpstate_8_143:
	.word 0x819822cd  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	.word 0x87a80a52  ! 237: FCMPd	fcmpd	%fcc<n>, %f0, %f18
memptr_8_144:
	set user_data_start, %r31
	.word 0x85852ce1  ! 238: WRCCR_I	wr	%r20, 0x0ce1, %ccr
mondo_8_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d92400d  ! 239: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
	.word 0xa5a449c2  ! 240: FDIVd	fdivd	%f48, %f2, %f18
pmu_8_147:
	nop
	setx 0xfffffb91fffff0a9, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_8_148:
	setx 0x0371cc97533e4e98, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a509d0  ! 244: FDIVd	fdivd	%f20, %f16, %f40
	rd %pc, %r19
	add %r19, (ivw_8_149-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_149:
	.word 0x9191800a  ! 245: WRPR_PIL_R	wrpr	%r6, %r10, %pil
fpinit_8_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 246: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_8_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 247: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
invtsb_8_152:
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
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_8_153:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd63ff9a6  ! 249: STD_I	std	%r11, [%r31 + 0xfffff9a6]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_8_155:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d902114  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x0114, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_8_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_157:
	mov 0x733, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd697c028  ! 254: LDUHA_R	lduha	[%r31, %r8] 0x01, %r11
intveclr_8_158:
	setx 0x6b6805db5fb66071, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_159-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_159:
	.word 0x91914007  ! 256: WRPR_PIL_R	wrpr	%r5, %r7, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_8_160:
	set 0xfc1762eb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d910012  ! 259: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	.word 0xa3a0016a  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_163:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 263: RDPC	rd	%pc, %r11
mondo_8_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d94000d  ! 264: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 265: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_8_165:
	set user_data_start, %r31
	.word 0x858271e7  ! 266: WRCCR_I	wr	%r9, 0x11e7, %ccr
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_168) + 32, 16, 16)) -> intp(5,0,3)
intvec_8_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_8_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_169:
	mov 0x754, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x1b5,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02c  ! 270: LDUHA_R	lduha	[%r31, %r12] 0x01, %r19
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xd59fdbbc3be592cb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 273: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xab834011  ! 274: WR_CLEAR_SOFTINT_R	wr	%r13, %r17, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e038  ! 276: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_8_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d944004  ! 278: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
memptr_8_174:
	set user_data_start, %r31
	.word 0x85852e74  ! 279: WRCCR_I	wr	%r20, 0x0e74, %ccr
	.word 0x8d902586  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x0586, %pstate
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_176:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 281: RDPC	rd	%pc, %r8
	.word 0xa3520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 283: RDPC	rd	%pc, %r17
fpinit_8_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 284: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	setx 0xe70ff371d0847ec4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_8_180:
	tsubcctv %r17, 0x10ec, %r18
	.word 0xd007e02c  ! 286: LDUW_I	lduw	[%r31 + 0x002c], %r8
debug_8_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_181:
	mov 0x7a9, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x133,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd097c025  ! 287: LDUHA_R	lduha	[%r31, %r5] 0x01, %r8
DS_8_182:
	.word 0x99a489cc  ! 1: FDIVd	fdivd	%f18, %f12, %f12
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_184:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xa3b1c4c4  ! 293: FCMPNE32	fcmpne32	%d38, %d4, %r17
tagged_8_186:
	tsubcctv %r17, 0x1fdd, %r1
	.word 0xe607e0e1  ! 294: LDUW_I	lduw	[%r31 + 0x00e1], %r19
	setx 0x6b689b4487aeb9ed, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc3ec4033  ! 296: PREFETCHA_R	prefetcha	[%r17, %r19] 0x01, #one_read
intveclr_8_188:
	setx 0x511d2ccce393eebc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_8_190:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_8_191:
	setx 0x43580b6228d5ef19, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_8_192:
	setx 0x21ddd7c15686fd26, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_8_193:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa780000a  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r10, %-
	.word 0x93a00173  ! 305: FABSq	dis not found

pmu_8_194:
	nop
	setx 0xfffffdf2fffffa5d, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 50
memptr_8_195:
	set user_data_start, %r31
	.word 0x85832b7d  ! 308: WRCCR_I	wr	%r12, 0x0b7d, %ccr
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_196:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 309: RDPC	rd	%pc, %r10
	.word 0x93450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r9
pmu_8_197:
	nop
	setx 0xfffff38ffffff84b, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_198:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 312: RDPC	rd	%pc, %r10
	.word 0xa9520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_200) + 32, 16, 16)) -> intp(5,0,4)
intvec_8_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_201:
	setx 0x273ed6829ac44996, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_8_202-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_202:
	.word 0x9190c013  ! 317: WRPR_PIL_R	wrpr	%r3, %r19, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_8_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_203:
	mov 0xd12, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc034  ! 319: STDA_R	stda	%r17, [%r31 + %r20] 0x01
donret_8_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_204-donret_8_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008bf6c0 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x86, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_204:
	.word 0xe2ffe05a  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x005a] %asi
	.word 0xa5b084c9  ! 321: FCMPNE32	fcmpne32	%d2, %d40, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_206)+24, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_206:
	.word 0xa9852f42  ! 322: WR_SET_SOFTINT_I	wr	%r20, 0x0f42, %set_softint
	.word 0xc36c3f91  ! 323: PREFETCH_I	prefetch	[%r16 + 0xffffff91], #one_read
mondo_8_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 324: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	setx 0x1a65d083d5f9f143, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d8] %asi
	.word 0x9d950009  ! 326: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_212) + 0, 16, 16)) -> intp(6,0,31)
intvec_8_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_8_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 330: FCMPd	fcmpd	%fcc<n>, %f0, %f4
DS_8_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f6, %f0, %f18
	.word 0x97b08314  ! 331: ALIGNADDRESS	alignaddr	%r2, %r20, %r11
	.word 0xd49fc280  ! 332: LDDA_R	ldda	[%r31, %r0] 0x14, %r10
intveclr_8_215:
	setx 0x207e1d33d02feff5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_216-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_216:
	.word 0x9190c00a  ! 334: WRPR_PIL_R	wrpr	%r3, %r10, %pil
change_to_randtl_8_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_217:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    set 0x2a35, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b307f0  ! 336: PDISTN	fmean16	%d12, %d16, %d20
memptr_8_218:
	set 0x60140000, %r31
	.word 0x8584ff06  ! 337: WRCCR_I	wr	%r19, 0x1f06, %ccr
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_8_220:
	setx 0x00566a2eef074645, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_8_221:
	taddcctv %r12, 0x1d99, %r19
	.word 0xe807e0d0  ! 340: LDUW_I	lduw	[%r31 + 0x00d0], %r20
	.word 0x9f8025e4  ! 341: SIR	sir	0x05e4
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a00167  ! 343: FABSq	dis not found

	.word 0xa1a4c9ca  ! 344: FDIVd	fdivd	%f50, %f10, %f16
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
    set (0x00b6f099 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xddc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_222:
	.word 0xe2ffe0d0  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x00d0] %asi
	.word 0xc187e060  ! 346: LDFA_I	lda	[%r31, 0x0060], %f0
	rd %pc, %r19
	add %r19, (ivw_8_223-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_223:
	.word 0x9194000b  ! 347: WRPR_PIL_R	wrpr	%r16, %r11, %pil
cwp_8_224:
    set user_data_start, %o7
	.word 0x93902005  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91a509a3  ! 349: FDIVs	fdivs	%f20, %f3, %f8
DS_8_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd93439e8  ! 1: STQF_I	-	%f12, [0x19e8, %r16]
	normalw
	.word 0x91458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r8
pmu_8_226:
	nop
	setx 0xfffff8a6fffff364, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_8_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f28, %f24
	.word 0xa7b50310  ! 352: ALIGNADDRESS	alignaddr	%r20, %r16, %r19
splash_hpstate_8_228:
	.word 0x81982f4f  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4f, %hpstate
splash_cmpr_8_229:
	setx 0x4a87de809a10cc72, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a189d4  ! 355: FDIVd	fdivd	%f6, %f20, %f48
memptr_8_230:
	set 0x60140000, %r31
	.word 0x8584e5c8  ! 356: WRCCR_I	wr	%r19, 0x05c8, %ccr
	.word 0x95a00171  ! 357: FABSq	dis not found

DS_8_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_8_232:
	nop
	setx 0xfffff112fffffc1c, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d9021c9  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x01c9, %pstate
fpinit_8_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 362: FDIVs	fdivs	%f0, %f4, %f8
	.word 0xe927e02c  ! 363: STF_I	st	%f20, [0x002c, %r31]
fpinit_8_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 364: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x91d020b2  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_8_236:
	setx 0x513f57f4c6c3e86a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_8_237:
	set user_data_start, %r31
	.word 0x85807f55  ! 367: WRCCR_I	wr	%r1, 0x1f55, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_238) + 48, 16, 16)) -> intp(6,0,6)
intvec_8_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_239:
	nop
	setx 0xfffff60bfffffd71, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_240:
	set 0xfbe8e6cc, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0x8d90201d93e74770, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_8_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_242-donret_8_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00773851 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc54, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	retry
donretarg_8_242:
	.word 0xe8ffe088  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x0088] %asi
pmu_8_243:
	nop
	setx 0xfffffe22fffff140, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe88008a0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x97a00172  ! 376: FABSq	dis not found

	.word 0xab84e658  ! 377: WR_CLEAR_SOFTINT_I	wr	%r19, 0x0658, %clear_softint
jmptr_8_244:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_8_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 379: FDIVd	fdivd	%f0, %f4, %f4
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 380: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_8_246:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_8_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_247:
	mov 0x5b9, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 382: CASA_R	casa	[%r31] %asi, %r19, %r17
donret_8_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_248-donret_8_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005ae9a1 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x487, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	retry
donretarg_8_248:
	.word 0xe2ffe0a8  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x00a8] %asi
DS_8_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_8_250:
	tsubcctv %r16, 0x136f, %r19
	.word 0xe207e0c4  ! 385: LDUW_I	lduw	[%r31 + 0x00c4], %r17
pmu_8_251:
	nop
	setx 0xfffffc27fffff02d, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_8_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 387: FCMPLE32	fcmple32	%d0, %d4, %r6
splash_decr_8_253:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7840002  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r2, %-
splash_cmpr_8_254:
	setx 0xde9cb1b17f081659, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_8_255:
	set user_data_start, %r31
	.word 0x85806f8c  ! 390: WRCCR_I	wr	%r1, 0x0f8c, %ccr
splash_lsu_8_256:
	set 0xff5c946a, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 392: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_8_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d924013  ! 393: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xc1bfda00  ! 395: STDFA_R	stda	%f0, [%r0, %r31]
donret_8_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_260-donret_8_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a165d6 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x155, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_260:
	.word 0xe0ffe018  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x0018] %asi
	.word 0xa9a0c9b0  ! 397: FDIVs	fdivs	%f3, %f16, %f20
intveclr_8_262:
	setx 0x06ed74664dd68990, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
DS_8_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe5317fd6  ! 1: STQF_I	-	%f18, [0x1fd6, %r5]
	normalw
	.word 0xa7458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r19
DS_8_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_8_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d900001  ! 402: WRPR_WSTATE_R	wrpr	%r0, %r1, %wstate
	.word 0x95a00166  ! 403: FABSq	dis not found

mondo_8_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d91800b  ! 404: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_267:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 405: RDPC	rd	%pc, %r11
mondo_8_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d90c00a  ! 406: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
	.word 0xa3540000  ! 407: RDPR_GL	<illegal instruction>
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
    set (0x00886c1e | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	done
donretarg_8_269:
	.word 0xe4ffe001  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x0001] %asi
	.word 0x99902001  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 410: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 411: RDPC	rd	%pc, %r19
	.word 0x91d02034  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa7b28492  ! 413: FCMPLE32	fcmple32	%d10, %d18, %r19
splash_cmpr_8_272:
	setx 0x9efd88f76e577185, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_8_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_273-donret_8_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00555e5d | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x69e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	done
donretarg_8_273:
	.word 0xe0ffe01a  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x001a] %asi
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_274:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 416: RDPC	rd	%pc, %r17
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_8_275:
	set 0x60340000, %r31
	.word 0x858072cd  ! 418: WRCCR_I	wr	%r1, 0x12cd, %ccr
splash_hpstate_8_276:
	.word 0x8198210f  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010f, %hpstate
intveclr_8_277:
	setx 0x94f9b8c995f528e1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_8_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_278:
	mov 0xf12, %r20
	mov 0xb, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe13fc011  ! 421: STDF_R	std	%f16, [%r17, %r31]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_279:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 422: RDPC	rd	%pc, %r20
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x91d020b2  ! 424: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_8_280:
	setx 0xb41720de35cdfa85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_281)+24, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_281:
	.word 0xa9827192  ! 426: WR_SET_SOFTINT_I	wr	%r9, 0x1192, %set_softint
	.word 0xe187da00  ! 427: LDFA_R	lda	[%r31, %r0], %f16
donret_8_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_282-donret_8_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0039b29b | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb4e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_282:
	.word 0xd4ffe005  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x0005] %asi
	.word 0x91d020b3  ! 429: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xc36ce719  ! 430: PREFETCH_I	prefetch	[%r19 + 0x0719], #one_read
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802d8c  ! 433: SIR	sir	0x0d8c
pmu_8_284:
	nop
	setx 0xfffffeacfffffc7e, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe038  ! 435: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r19
debug_8_285:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 436: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_8_286:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_8_287:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x95500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_8_290:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_8_291:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe000  ! 446: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_8_292-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_292:
	.word 0x91950010  ! 447: WRPR_PIL_R	wrpr	%r20, %r16, %pil
splash_cmpr_8_293:
	setx 0xe3869567352cdd74, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_8_294:
	setx 0xf0951b536a30c726, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_8_295:
	setx 0xa69228e7c5a0bab3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e018  ! 451: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r11
	.word 0x91d02035  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_8_296:
	.word 0x8198251c  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051c, %hpstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_298) + 24, 16, 16)) -> intp(1,0,10)
intvec_8_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 179
	setx 0x2303583eda85b41b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a109d4  ! 458: FDIVd	fdivd	%f4, %f20, %f18
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_8_300-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_300:
	.word 0x91910006  ! 460: WRPR_PIL_R	wrpr	%r4, %r6, %pil
DS_8_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
jmptr_8_302:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_8_303:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe617  ! 463: STD_I	std	%r16, [%r31 + 0x0617]
pmu_8_304:
	nop
	setx 0xfffff80afffff1bc, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_305:
	nop
	setx 0xfffff762fffff00a, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_306:
	setx 0x453830dd214ef7f4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a309d1  ! 467: FDIVd	fdivd	%f12, %f48, %f10
    set 0x2642, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b287f4  ! 468: PDISTN	fmean16	%d10, %d20, %d16
	.word 0x93a00173  ! 469: FABSq	dis not found

    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xc1bfdb60  ! 471: STDFA_R	stda	%f0, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_308) + 56, 16, 16)) -> intp(7,0,12)
intvec_8_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd937e070  ! 474: STQF_I	-	%f12, [0x0070, %r31]
tagged_8_309:
	taddcctv %r18, 0x17d8, %r16
	.word 0xd807e00e  ! 475: LDUW_I	lduw	[%r31 + 0x000e], %r12
	.word 0xc369e14b  ! 476: PREFETCH_I	prefetch	[%r7 + 0x014b], #one_read
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_8_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 478: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xa5a00173  ! 479: FABSq	dis not found

	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 480: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_8_313:
	setx 0x6ef77ed7785710bc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_8_314:
	setx 0x31602b964948be33, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
invtsb_8_315:
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
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_8_317:
	taddcctv %r6, 0x1a3e, %r18
	.word 0xe407e0a0  ! 485: LDUW_I	lduw	[%r31 + 0x00a0], %r18
donret_8_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_318-donret_8_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fe4303 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xbdd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	retry
donretarg_8_318:
	.word 0xe4ffe024  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x0024] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0x97464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x91a489a9  ! 489: FDIVs	fdivs	%f18, %f9, %f8
	.word 0x8d9039a1  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x19a1, %pstate
	.word 0xe62fe013  ! 491: STB_I	stb	%r19, [%r31 + 0x0013]
splash_htba_8_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_321:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 493: RDPC	rd	%pc, %r12
	.word 0xad84f9b9  ! 494: WR_SOFTINT_REG_I	wr	%r19, 0x19b9, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f8034dd  ! 496: SIR	sir	0x14dd
	.word 0x93a449d1  ! 497: FDIVd	fdivd	%f48, %f48, %f40
jmptr_8_322:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_8_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d950006  ! 500: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
	.word 0xd86fe0ae  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x00ae]
	.word 0x9f803f07  ! 502: SIR	sir	0x1f07
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_324) + 48, 16, 16)) -> intp(0,0,17)
intvec_8_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_325:
	nop
	setx 0xfffff6bffffffd9d, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xa1a00173  ! 506: FABSq	dis not found

splash_lsu_8_327:
	set 0xc928bfa8, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9b2c4ca  ! 508: FCMPNE32	fcmpne32	%d42, %d10, %r20
	.word 0xe83fe031  ! 509: STD_I	std	%r20, [%r31 + 0x0031]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_329:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 510: RDPC	rd	%pc, %r10
	.word 0xc187e000  ! 511: LDFA_I	lda	[%r31, 0x0000], %f0
intveclr_8_330:
	setx 0x601da3ba728aaba9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_331:
	.word 0x81982b8d  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
DS_8_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb348011  ! 1: STQF_R	-	%f13, [%r17, %r18]
	normalw
	.word 0x95458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r10
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 515: RDPC	rd	%pc, %r18
jmptr_8_334:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe0ee  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ee]
splash_tba_8_335:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87ac0a51  ! 519: FCMPd	fcmpd	%fcc<n>, %f16, %f48
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_336:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 520: RDPC	rd	%pc, %r10
intveclr_8_337:
	setx 0xd85beeabed05ebb5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r16
mondo_8_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d94c013  ! 523: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
intveclr_8_339:
	setx 0x22e9951ba1ade9fc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94000c  ! 525: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
splash_hpstate_8_341:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x819825de  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05de, %hpstate
	.word 0xe26fe0d2  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x00d2]
splash_lsu_8_342:
	set 0xb0c6c179, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24c80001  ! 529: BRLEZ	brlez,a,pt	%r0,<label_0x80001>
tagged_8_344:
	tsubcctv %r18, 0x1363, %r0
	.word 0xd807e055  ! 530: LDUW_I	lduw	[%r31 + 0x0055], %r12
	.word 0xd8cfe030  ! 531: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
pmu_8_345:
	nop
	setx 0xfffffb45fffff5c5, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e028  ! 533: LDSWA_I	ldswa	[%r31, + 0x0028] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_8_346:
	setx 0x1bb909ff72dca642, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_347:
	setx 0x2bd1b8b507af3d88, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 537: STDFA_R	stda	%f0, [%r0, %r31]
donret_8_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_348-donret_8_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0042cee8 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x914, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	retry
donretarg_8_348:
	.word 0xd8ffe0c1  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x00c1] %asi
	.word 0xe1bfdb60  ! 539: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa9804011  ! 540: WR_SET_SOFTINT_R	wr	%r1, %r17, %set_softint
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803c21  ! 542: SIR	sir	0x1c21
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_8_349:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_8_350:
	set 0x6c3ce736, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fd040  ! 546: LDDA_R	ldda	[%r31, %r0] 0x82, %r12
intveclr_8_351:
	setx 0x6afebf7984c7389d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_8_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 548: FDIVs	fdivs	%f0, %f4, %f6
intveclr_8_353:
	setx 0x6f01e44b80107e30, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 550: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_354:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 551: RDPC	rd	%pc, %r9
	setx 0xc4dfb89c561da5ca, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_358) + 8, 16, 16)) -> intp(3,0,8)
intvec_8_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x5907be076bf3085d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd71fe030  ! 559: LDDF_I	ldd	[%r31, 0x0030], %f11
mondo_8_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d904011  ! 560: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
intveclr_8_361:
	setx 0x4c7f0bb51248e696, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_362:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 562: RDPC	rd	%pc, %r16
splash_tba_8_363:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_8_364:
	setx 0xd4d7cab34894d38d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0x97a409d3  ! 566: FDIVd	fdivd	%f16, %f50, %f42
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 568: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_8_366:
	nop
	setx 0xfffffb1dfffff756, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_367:
	setx 0x693e07b4f370933f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_369:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 572: RDPC	rd	%pc, %r13
	rd %pc, %r19
	add %r19, (ivw_8_370-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_370:
	.word 0x9190800b  ! 573: WRPR_PIL_R	wrpr	%r2, %r11, %pil
mondo_8_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d950002  ! 574: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
mondo_8_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d940013  ! 575: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
DS_8_373:
	.word 0xa5a089c9  ! 1: FDIVd	fdivd	%f2, %f40, %f18
	pdist %f30, %f4, %f0
	.word 0x97b50308  ! 576: ALIGNADDRESS	alignaddr	%r20, %r8, %r11
	.word 0xc3ec0034  ! 577: PREFETCHA_R	prefetcha	[%r16, %r20] 0x01, #one_read
debug_8_375:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc032  ! 578: LDXA_R	ldxa	[%r31, %r18] 0x01, %r12
splash_hpstate_8_376:
	.word 0x81982e4f  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4f, %hpstate
	.word 0xe187e080  ! 580: LDFA_I	lda	[%r31, 0x0080], %f16
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_377:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 581: RDPC	rd	%pc, %r18
mondo_8_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d944014  ! 582: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
intveclr_8_379:
	setx 0xa7f0ba61d6b939ab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_8_381:
	set 0xf51d820c, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe83ac009  ! 586: STD_R	std	%r20, [%r11 + %r9]
tagged_8_383:
	taddcctv %r17, 0x1c6f, %r5
	.word 0xd807e060  ! 587: LDUW_I	lduw	[%r31 + 0x0060], %r12
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_384:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 588: RDPC	rd	%pc, %r12
	.word 0x99a189d2  ! 589: FDIVd	fdivd	%f6, %f18, %f12
pmu_8_385:
	nop
	setx 0xfffff41affffffed, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_8_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f24, %f6, %f14
	.word 0xa1b4c312  ! 591: ALIGNADDRESS	alignaddr	%r19, %r18, %r16
jmptr_8_387:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91d02034  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_8_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_8_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e44  ! 595: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe44] %asi, #one_read
splash_hpstate_8_390:
	.word 0x819820f6  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00f6, %hpstate
	.word 0x8d902c51  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
cwp_8_392:
    set user_data_start, %o7
	.word 0x93902000  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87a9ca51  ! 599: FCMPd	fcmpd	%fcc<n>, %f38, %f48
donret_8_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_394-donret_8_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007f4db5 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xadc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_394:
	.word 0xd8ffe0b6  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x00b6] %asi
	.word 0x99a449b2  ! 601: FDIVs	fdivs	%f17, %f18, %f12
mondo_8_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d900014  ! 602: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
jmptr_8_396:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_8_397:
	setx 0xc7aae38b0d01a22f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_398:
	nop
	setx 0xfffff761fffffefe, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_8_399:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 606: CASA_R	casa	[%r31] %asi, %r16, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_400)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_400:
	.word 0xa984ac45  ! 607: WR_SET_SOFTINT_I	wr	%r18, 0x0c45, %set_softint
	rd %pc, %r19
	add %r19, (ivw_8_401-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_401:
	.word 0x91944009  ! 608: WRPR_PIL_R	wrpr	%r17, %r9, %pil
	.word 0x9f8028e6  ! 609: SIR	sir	0x08e6
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_402) + 48, 16, 16)) -> intp(7,0,2)
intvec_8_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_8_403:
	set 0x60740000, %r31
	.word 0x85847575  ! 611: WRCCR_I	wr	%r17, 0x1575, %ccr
	.word 0xe46fe053  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x0053]
cwp_8_404:
    set user_data_start, %o7
	.word 0x93902006  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_405)+24, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_405:
	.word 0xa9806c47  ! 614: WR_SET_SOFTINT_I	wr	%r1, 0x0c47, %set_softint
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d903927  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x1927, %pstate
mondo_8_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 616: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
debug_8_408:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe497c033  ! 617: LDUHA_R	lduha	[%r31, %r19] 0x01, %r18
pmu_8_409:
	nop
	setx 0xfffff791fffff1ef, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_410:
	setx 0xdc0e2739dac1b026, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1500000  ! 620: RDPR_TPC	<illegal instruction>
	setx 0xf3a15bc21cba2381, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5b2c7f3  ! 622: PDISTN	fmean16	%d42, %d50, %d18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e01f  ! 624: STF_I	st	%f19, [0x001f, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_8_413:
	nop
	setx 0xfffff61ffffffeb0, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_8_414-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_414:
	.word 0x91908013  ! 627: WRPR_PIL_R	wrpr	%r2, %r19, %pil
	.word 0x9194ee45  ! 628: WRPR_PIL_I	wrpr	%r19, 0x0e45, %pil
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_415:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 629: RDPC	rd	%pc, %r18
change_to_randtl_8_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_416:
	.word 0x8f902000  ! 630: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 632: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_8_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 635: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xa3464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r17
donret_8_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_420-donret_8_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00690513 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x496, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	retry
donretarg_8_420:
	.word 0xd6ffe028  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x0028] %asi
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_421:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 638: RDPC	rd	%pc, %r13
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_8_422-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_422:
	.word 0x91950012  ! 640: WRPR_PIL_R	wrpr	%r20, %r18, %pil
splash_cmpr_8_423:
	setx 0x94f8e09c819b8451, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_8_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_424-donret_8_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00dd805e | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xcd4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	retry
donretarg_8_424:
	.word 0xe0ffe0ed  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x00ed] %asi
	.word 0xa7a0016b  ! 643: FABSq	dis not found

memptr_8_425:
	set 0x60340000, %r31
	.word 0x85816fcd  ! 644: WRCCR_I	wr	%r5, 0x0fcd, %ccr
	.word 0xe48fe038  ! 645: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r18
splash_cmpr_8_426:
	setx 0x540a9d629417bbeb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x58c1480d2ca8e053, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_8_428:
	nop
	setx 0xfffffd43fffff92c, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e008  ! 650: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r18
	.word 0xe46fe083  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x0083]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7a00170  ! 653: FABSq	dis not found

	.word 0xe6800c40  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
splash_lsu_8_429:
	set 0xe8f1f55b, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93540000  ! 656: RDPR_GL	rdpr	%-, %r9
	.word 0x9f803bba  ! 657: SIR	sir	0x1bba
	.word 0x97a309c7  ! 658: FDIVd	fdivd	%f12, %f38, %f42
	rd %pc, %r19
	add %r19, (ivw_8_431-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_431:
	.word 0x9191800c  ! 659: WRPR_PIL_R	wrpr	%r6, %r12, %pil
DS_8_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc150df27	! Random illegal ?
	.word 0x91a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa5a48833  ! 660: FADDs	fadds	%f18, %f19, %f18
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 662: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_8_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_433-donret_8_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c9ae98 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xac4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_433:
	.word 0xd8ffe068  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x0068] %asi
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_8_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdb30bb89  ! 1: STQF_I	-	%f13, [0x1b89, %r2]
	normalw
	.word 0xa5458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r18
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_436:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 666: RDPC	rd	%pc, %r13
splash_htba_8_437:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_438)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_438:
	.word 0xa9813eff  ! 668: WR_SET_SOFTINT_I	wr	%r4, 0x1eff, %set_softint
pmu_8_439:
	nop
	setx 0xfffff8b2fffffbaf, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93703f55  ! 670: POPC_I	popc	0x1f55, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_440) + 56, 16, 16)) -> intp(4,0,19)
intvec_8_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_8_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8d902138  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x0138, %pstate
splash_hpstate_8_443:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8198235f  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035f, %hpstate
pmu_8_444:
	nop
	setx 0xffffff34fffff896, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_decr_8_445:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa780c014  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r20, %-
	.word 0xda77e088  ! 678: STX_I	stx	%r13, [%r31 + 0x0088]
jmptr_8_446:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f803a89  ! 680: SIR	sir	0x1a89
DS_8_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00545  ! 1: FSQRTd	fsqrt	
	.word 0xa1a40833  ! 681: FADDs	fadds	%f16, %f19, %f16
	.word 0xda37e0a6  ! 682: STH_I	sth	%r13, [%r31 + 0x00a6]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_448:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 683: RDPC	rd	%pc, %r9
pmu_8_449:
	nop
	setx 0xfffffcb5fffffcd8, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_450:
	set 0x0f253303, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x9e9edcbfb0f4b349, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_452:
	setx 0x181d3380a92ea570, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_8_454:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x81982386  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0386, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_8_455:
	setx 0x81b3fc2b35e3559c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e008  ! 692: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r9
splash_lsu_8_456:
	set 0xda87e37e, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab852e23  ! 694: WR_CLEAR_SOFTINT_I	wr	%r20, 0x0e23, %clear_softint
memptr_8_457:
	set 0x60540000, %r31
	.word 0x858328ea  ! 695: WRCCR_I	wr	%r12, 0x08ea, %ccr
splash_cmpr_8_458:
	setx 0x9635ed420656d195, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_decr_8_460:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa781c011  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r17, %-
	rd %pc, %r19
	add %r19, (ivw_8_461-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_461:
	.word 0x91914010  ! 700: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0x95454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0xa3a00173  ! 1: FABSq	dis not found

	.word 0xc187e020  ! 2: LDFA_I	lda	[%r31, 0x0020], %f0
	.word 0x93a00174  ! 3: FABSq	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	brgz,a,pt	%r18, skip_4_1
	fbue,a,pn	%fcc0,  skip_4_1
.align 1024
skip_4_1:
	.word 0x87ac8a54  ! 5: FCMPd	fcmpd	%fcc<n>, %f18, %f20
pmu_4_2:
	nop
	setx 0xfffff27dfffff63b, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe0af  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x00af]
donret_4_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_3-donret_4_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0065ce06 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe56, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_3:
	.word 0xd2ffe01a  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x001a] %asi
jmptr_4_4:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe030  ! 10: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r9
	.word 0x99a00163  ! 11: FABSq	dis not found

DS_4_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0xa7480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xa1480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_6:
	setx 0xa23c3ea3913801ae, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e028  ! 17: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r18
	.word 0xe4dfe010  ! 18: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r18
DS_4_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5340003  ! 1: STQF_R	-	%f10, [%r3, %r16]
	normalw
	.word 0xa7458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r19
intveclr_4_8:
	setx 0x0cccfc9d9844de7f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_9:
	nop
	setx 0xfffff706fffff36a, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e094  ! 23: STX_I	stx	%r20, [%r31 + 0x0094]
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 24: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1a00162  ! 25: FABSq	dis not found

intveclr_4_10:
	setx 0xe44d13cdbe4c3188, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_11:
	.word 0x81982fd7  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
splash_tba_4_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x54af0955ea65e3b5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_4_15:
	nop
	setx 0xfffff37afffffa96, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbue,a,pn	%fcc0,  skip_4_16
	.word 0x87acca50  ! 1: FCMPd	fcmpd	%fcc<n>, %f50, %f16
.align 1024
skip_4_16:
	.word 0x87ac8a50  ! 32: FCMPd	fcmpd	%fcc<n>, %f18, %f16
splash_cmpr_4_17:
	setx 0x5b95f2ebe6254307, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_4_18:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_4_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d900011  ! 35: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
	.word 0xa3500000  ! 36: RDPR_TPC	<illegal instruction>
jmptr_4_20:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_4_21:
	setx 0xb6e85db4e12ea5d4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802600  ! 39: SIR	sir	0x0600
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_4_22-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_22:
	.word 0x91930003  ! 41: WRPR_PIL_R	wrpr	%r12, %r3, %pil
	.word 0x9ba0016c  ! 42: FABSq	dis not found

DS_4_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a409c4  ! 1: FDIVd	fdivd	%f16, %f4, %f42
	.word 0xa5a44834  ! 43: FADDs	fadds	%f17, %f20, %f18
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xa3a009d3  ! 45: FDIVd	fdivd	%f0, %f50, %f48
	fbl skip_4_24
	.word 0xe3e04022  ! 1: CASA_I	casa	[%r1] 0x 1, %r2, %r17
.align 2048
skip_4_24:
	.word 0xe3e50020  ! 46: CASA_I	casa	[%r20] 0x 1, %r0, %r17
donret_4_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_25-donret_4_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b94dce | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x546, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_25:
	.word 0xe2ffe002  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x0002] %asi
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 48: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe26fe040  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x0040]
	.word 0xe26fe0a2  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a2]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xc1bfe060  ! 52: STDFA_I	stda	%f0, [0x0060, %r31]
tagged_4_26:
	tsubcctv %r18, 0x1a03, %r3
	.word 0xe207e0e4  ! 53: LDUW_I	lduw	[%r31 + 0x00e4], %r17
	rd %pc, %r19
	add %r19, (ivw_4_27-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_27:
	.word 0x9194c000  ! 54: WRPR_PIL_R	wrpr	%r19, %r0, %pil
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f803b92  ! 56: SIR	sir	0x1b92
splash_hpstate_4_29:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81982595  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0595, %hpstate
	.word 0xe277e0bb  ! 58: STX_I	stx	%r17, [%r31 + 0x00bb]
debug_4_30:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe23fe3ad  ! 59: STD_I	std	%r17, [%r31 + 0x03ad]
jmptr_4_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe039  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x0039]
	rd %pc, %r19
	add %r19, (ivw_4_32-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_32:
	.word 0x91918001  ! 62: WRPR_PIL_R	wrpr	%r6, %r1, %pil
	.word 0x83d02032  ! 63: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xad82e581  ! 64: WR_SOFTINT_REG_I	wr	%r11, 0x0581, %softint
intveclr_4_33:
	setx 0x1c5c38e521f9d6eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d902e57  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0e57, %pstate
	.word 0xe187c2c0  ! 67: LDFA_R	lda	[%r31, %r0], %f16
	.word 0x93520000  ! 68: RDPR_PIL	rdpr	%pil, %r9
	.word 0xd88008a0  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_cmpr_4_35:
	setx 0xbbb7f42fc929f148, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_36:
	set user_data_start, %r31
	.word 0x858475e4  ! 71: WRCCR_I	wr	%r17, 0x15e4, %ccr
	rd %pc, %r19
	add %r19, (ivw_4_37-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_37:
	.word 0x91944004  ! 72: WRPR_PIL_R	wrpr	%r17, %r4, %pil
intveclr_4_38:
	setx 0xa0b981ce5ae9858f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a4c9c4  ! 74: FDIVd	fdivd	%f50, %f4, %f8
	.word 0x91a00173  ! 75: FABSq	dis not found

DS_4_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 50
pmu_4_40:
	nop
	setx 0xfffff096fffffe48, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2acb0001  ! 1: BRNZ	brnz,a,pt	%r12,<label_0xb0001>
	.word 0x8d903bcd  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1bcd, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_4_42:
	setx 0x0bca31e50c5e7413, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_43-donret_4_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0012c020 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_43:
	.word 0xe8ffe0dc  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x00dc] %asi
debug_4_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_44:
	mov 0x88a, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe8bfc033  ! 83: STDA_R	stda	%r20, [%r31 + %r19] 0x01
splash_htba_4_45:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_4_46:
	setx 0x7aa0a60e1f1cbae8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xe1bfe0c0  ! 87: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0xa782ff1d  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x1f1d, %-
	setx 0xeeb4867c0ad3876e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d940006  ! 90: WRPR_WSTATE_R	wrpr	%r16, %r6, %wstate
donret_4_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_49-donret_4_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c7515a | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xac5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x2ac8c001  ! 1: BRNZ	brnz,a,pt	%r3,<label_0x8c001>
	done
donretarg_4_49:
	.word 0xd8ffe0b0  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x00b0] %asi
DS_4_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa5a00172  ! 93: FABSq	dis not found

	.word 0xd46fe0e0  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x00e0]
debug_4_51:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd497c024  ! 95: LDUHA_R	lduha	[%r31, %r4] 0x01, %r10
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0x9745c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_52) + 16, 16, 16)) -> intp(3,0,24)
intvec_4_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_4_54-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_54:
	.word 0x91950011  ! 100: WRPR_PIL_R	wrpr	%r20, %r17, %pil
DS_4_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe912c014  ! 1: LDQF_R	-	[%r11, %r20], %f20
	.word 0x95a40828  ! 101: FADDs	fadds	%f16, %f8, %f10
DS_4_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8f48cb33	! Random illegal ?
	.word 0x95a00550  ! 1: FSQRTd	fsqrt	
	.word 0x97a24831  ! 102: FADDs	fadds	%f9, %f17, %f11
	.word 0xd327e0b3  ! 103: STF_I	st	%f9, [0x00b3, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_4_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d928012  ! 106: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	setx 0xbd8c9ed5b948de3e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd2800ac0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r9
DS_4_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_4_61:
	setx 0xcd2a57c470adac33, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_64:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 115: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_66) + 40, 16, 16)) -> intp(0,0,0)
intvec_4_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_67:
	mov 0x64c, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe53fc007  ! 118: STDF_R	std	%f18, [%r7, %r31]
intveclr_4_68:
	setx 0x8fd880bcd525a8ca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x185bef100e3a935a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d940013  ! 121: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	setx 0xb8714edf3beb1bfe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a049d1  ! 123: FDIVd	fdivd	%f32, %f48, %f18
splash_cmpr_4_72:
	setx 0x5c29cf17a2946b1a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802514  ! 125: SIR	sir	0x0514
jmptr_4_73:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903a41  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x1a41, %pstate
	be  	 skip_4_75
	fbl skip_4_75
.align 512
skip_4_75:
	.word 0xc36b3f01  ! 128: PREFETCH_I	prefetch	[%r12 + 0xffffff01], #one_read
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f803acf  ! 130: SIR	sir	0x1acf
	.word 0x97a2c9a2  ! 131: FDIVs	fdivs	%f11, %f2, %f11
	.word 0xe8bfe0c2  ! 132: STDA_I	stda	%r20, [%r31 + 0x00c2] %asi
splash_htba_4_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_4_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa7a449c5  ! 1: FDIVd	fdivd	%f48, %f36, %f50
	normalw
	.word 0x93458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r9
change_to_randtl_4_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_78:
	.word 0x8f902001  ! 135: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_4_79:
	set 0x88edc548, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e03d  ! 137: STF_I	st	%f20, [0x003d, %r31]
splash_cmpr_4_80:
	setx 0x82ec03791737a46c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x83d020b2  ! 139: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xe8cfe038  ! 140: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r20
splash_htba_4_81:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe187c2c0  ! 142: LDFA_R	lda	[%r31, %r0], %f16
jmptr_4_82:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	fbule,a,pn	%fcc0,  skip_4_83
	.word 0xc36cf66d  ! 1: PREFETCH_I	prefetch	[%r19 + 0xfffff66d], #one_read
.align 1024
skip_4_83:
	.word 0x87a9ca40  ! 144: FCMPd	fcmpd	%fcc<n>, %f38, %f0
	.word 0xa7844002  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r2, %-
splash_lsu_4_85:
	set 0xb021dd51, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_86:
	setx 0x397b94cb291284fb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91a00173  ! 148: FABSq	dis not found

	.word 0xa9a0016d  ! 149: FABSq	dis not found

pmu_4_87:
	nop
	setx 0xfffff6e3fffffb0c, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a00170  ! 151: FABSq	dis not found

mondo_4_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d948013  ! 152: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xda57e028  ! 153: LDSH_I	ldsh	[%r31 + 0x0028], %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_89:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 154: RDPC	rd	%pc, %r13
intveclr_4_90:
	setx 0x2eab7b4426251680, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d944003  ! 156: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
donret_4_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_92-donret_4_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000e4f9a | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	retry
donretarg_4_92:
	.word 0xd6ffe010  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x0010] %asi
	.word 0xa7818002  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r2, %-
mondo_4_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 159: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
memptr_4_95:
	set 0x60140000, %r31
	.word 0x858468d7  ! 160: WRCCR_I	wr	%r17, 0x08d7, %ccr
debug_4_96:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd6bfc034  ! 161: STDA_R	stda	%r11, [%r31 + %r20] 0x01
memptr_4_97:
	set 0x60340000, %r31
	.word 0x85807f2e  ! 162: WRCCR_I	wr	%r1, 0x1f2e, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_98) + 24, 16, 16)) -> intp(3,0,18)
intvec_4_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_99:
	.word 0x81982457  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0xd727e0a6  ! 165: STF_I	st	%f11, [0x00a6, %r31]
	ba,a	 skip_4_100
	fbuge skip_4_100
.align 128
skip_4_100:
	.word 0xc36cbb24  ! 166: PREFETCH_I	prefetch	[%r18 + 0xfffffb24], #one_read
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0xa9a00171  ! 168: FABSq	dis not found

fpinit_4_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 169: FDIVd	fdivd	%f0, %f4, %f6
DS_4_102:
	.word 0x93a509c7  ! 1: FDIVd	fdivd	%f20, %f38, %f40
	allclean
	.word 0xa9b50312  ! 170: ALIGNADDRESS	alignaddr	%r20, %r18, %r20
mondo_4_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914013  ! 171: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
pmu_4_104:
	nop
	setx 0xfffffc5ffffffa28, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xa1a509d2  ! 174: FDIVd	fdivd	%f20, %f18, %f16
	.word 0xa9a00166  ! 175: FABSq	dis not found

	.word 0x87a98a50  ! 176: FCMPd	fcmpd	%fcc<n>, %f6, %f16
	.word 0xd44fe010  ! 177: LDSB_I	ldsb	[%r31 + 0x0010], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_4_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d948010  ! 179: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xc187dc00  ! 181: LDFA_R	lda	[%r31, %r0], %f0
tagged_4_106:
	tsubcctv %r10, 0x146d, %r17
	.word 0xd407e074  ! 182: LDUW_I	lduw	[%r31 + 0x0074], %r10
mondo_4_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d950008  ! 183: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_108) + 56, 16, 16)) -> intp(5,0,6)
intvec_4_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 185: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e018  ! 186: LDSWA_I	ldswa	[%r31, + 0x0018] %asi, %r10
	.word 0xab842e0a  ! 187: WR_CLEAR_SOFTINT_I	wr	%r16, 0x0e0a, %clear_softint
splash_hpstate_4_109:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8198259f  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059f, %hpstate
mondo_4_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d944007  ! 189: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0xe1bfc2c0  ! 190: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_4_111:
	setx 0x49a930b847367bfd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d90400b  ! 192: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
intveclr_4_113:
	setx 0x10a19a51a38adcd5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0xc3e8802d  ! 195: PREFETCHA_R	prefetcha	[%r2, %r13] 0x01, #one_read
debug_4_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_115:
	mov 0x6b7, %r20
	mov 0x1d, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe0bfc025  ! 196: STDA_R	stda	%r16, [%r31 + %r5] 0x01
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0x01ac0745af22a361, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_118:
	setx 0x6aba15d07982d23a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f80305a  ! 200: SIR	sir	0x105a
	ta	T_CHANGE_NONPRIV	! macro
pmu_4_119:
	nop
	setx 0xfffff169ffffff08, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_120) + 8, 16, 16)) -> intp(5,0,19)
intvec_4_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe0d8  ! 204: STD_I	std	%r16, [%r31 + 0x00d8]
fpinit_4_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 205: FCMPd	fcmpd	%fcc<n>, %f0, %f4
pmu_4_122:
	nop
	setx 0xfffff5e8fffff78d, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	fbge skip_4_123
	fbge,a,pn	%fcc0,  skip_4_123
.align 128
skip_4_123:
	.word 0x99a449d3  ! 207: FDIVd	fdivd	%f48, %f50, %f12
	.word 0xd23fe0b8  ! 208: STD_I	std	%r9, [%r31 + 0x00b8]
	.word 0x91a00164  ! 209: FABSq	dis not found

splash_cmpr_4_124:
	setx 0x63126300691f0df6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	fbug skip_4_125
	fbne,a,pn	%fcc0,  skip_4_125
.align 512
skip_4_125:
	.word 0x24cd0001  ! 211: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_4_127:
	setx 0x819a8354c5f4dd3b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe000  ! 214: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_128) + 8, 16, 16)) -> intp(2,0,26)
intvec_4_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a6f  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x1a6f, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_130) + 8, 16, 16)) -> intp(7,0,18)
intvec_4_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 218: Tcc_I	ta	icc_or_xcc, %r0 + 181
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 219: RDPC	rd	%pc, %r18
	.word 0x87ac8a43  ! 220: FCMPd	fcmpd	%fcc<n>, %f18, %f34
splash_cmpr_4_132:
	setx 0x8a3498fa9a08784d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e0e2  ! 222: STH_I	sth	%r20, [%r31 + 0x00e2]
jmptr_4_133:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_4_134:
	nop
	setx 0xffffffbefffff4b3, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xb0b420c66766c23c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_136:
	mov 0x56b, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x133,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe91fc012  ! 226: LDDF_R	ldd	[%r31, %r18], %f20
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
unsupttte4_139:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87aa4a53  ! 230: FCMPd	fcmpd	%fcc<n>, %f40, %f50
	rd %pc, %r19
	add %r19, (ivw_4_140-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_140:
	.word 0x91940008  ! 231: WRPR_PIL_R	wrpr	%r16, %r8, %pil
mondo_4_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94800a  ! 232: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
	.word 0x9f80300e  ! 233: SIR	sir	0x100e
pmu_4_142:
	nop
	setx 0xfffff674fffff8e0, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91922084  ! 235: WRPR_PIL_I	wrpr	%r8, 0x0084, %pil
splash_hpstate_4_143:
	.word 0x819825cd  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cd, %hpstate
	.word 0xa9a509c2  ! 237: FDIVd	fdivd	%f20, %f2, %f20
memptr_4_144:
	set user_data_start, %r31
	.word 0x85842c83  ! 238: WRCCR_I	wr	%r16, 0x0c83, %ccr
mondo_4_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d950012  ! 239: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
unsupttte4_146:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a8ca4b  ! 240: FCMPd	fcmpd	%fcc<n>, %f34, %f42
pmu_4_147:
	nop
	setx 0xfffffe1dfffff139, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_4_148:
	setx 0x74efc1abe76663b9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a509d0  ! 244: FDIVd	fdivd	%f20, %f16, %f40
	rd %pc, %r19
	add %r19, (ivw_4_149-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_149:
	.word 0x91924000  ! 245: WRPR_PIL_R	wrpr	%r9, %r0, %pil
fpinit_4_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 246: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_4_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 247: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_4_153:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd697c028  ! 249: LDUHA_R	lduha	[%r31, %r8] 0x01, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_4_155:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d902fb2  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x0fb2, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_4_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_157:
	mov 0x648, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd697c028  ! 254: LDUHA_R	lduha	[%r31, %r8] 0x01, %r11
intveclr_4_158:
	setx 0xd03813b3b69c4d01, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_159-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_159:
	.word 0x9194c008  ! 256: WRPR_PIL_R	wrpr	%r19, %r8, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_4_160:
	set 0xd16e0e07, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d930009  ! 259: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
	.word 0x91a00170  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_163:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 263: RDPC	rd	%pc, %r16
mondo_4_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d94c001  ! 264: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 265: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_4_165:
	set user_data_start, %r31
	.word 0x85853d39  ! 266: WRCCR_I	wr	%r20, 0x1d39, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_168) + 40, 16, 16)) -> intp(1,0,8)
intvec_4_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_169:
	mov 0x519, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x37,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc00c  ! 270: LDDF_R	ldd	[%r31, %r12], %f19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x4ce4fb30b13a2716, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e828cf  ! 273: PREFETCHA_I	prefetcha	[%r0, + 0x08cf] %asi, #one_read
	.word 0xab84c008  ! 274: WR_CLEAR_SOFTINT_R	wr	%r19, %r8, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e020  ! 276: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_4_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d920001  ! 278: WRPR_WSTATE_R	wrpr	%r8, %r1, %wstate
memptr_4_174:
	set user_data_start, %r31
	.word 0x85833707  ! 279: WRCCR_I	wr	%r12, 0x1707, %ccr
	.word 0x8d903033  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x1033, %pstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 281: RDPC	rd	%pc, %r17
	.word 0xa9520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_177:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 283: RDPC	rd	%pc, %r13
fpinit_4_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 284: FCMPLE32	fcmple32	%d0, %d4, %r8
	setx 0xe804ee1e055e90c5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_4_180:
	tsubcctv %r13, 0x16ba, %r20
	.word 0xd007e04b  ! 286: LDUW_I	lduw	[%r31 + 0x004b], %r8
debug_4_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_181:
	mov 0x57c, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x10,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd03fe36b  ! 287: STD_I	std	%r8, [%r31 + 0x036b]
DS_4_182:
	.word 0xa5a409c2  ! 1: FDIVd	fdivd	%f16, %f2, %f18
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_184:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	bcs  	 skip_4_185
	brlez,pt  	%r19, skip_4_185
.align 2048
skip_4_185:
	.word 0xd5e50030  ! 293: CASA_I	casa	[%r20] 0x 1, %r16, %r10
tagged_4_186:
	tsubcctv %r20, 0x12fd, %r6
	.word 0xe607e00a  ! 294: LDUW_I	lduw	[%r31 + 0x000a], %r19
	setx 0x07bd769ef69c39e9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7b0c7f1  ! 296: PDISTN	fmean16	%d34, %d48, %d50
intveclr_4_188:
	setx 0x6d016b33d3156ace, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_4_190:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_4_191:
	setx 0x8260bdc676832543, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_4_192:
	setx 0x9c6545d69c035a6d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7818014  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r20, %-
	.word 0xa9a0016a  ! 305: FABSq	dis not found

pmu_4_194:
	nop
	setx 0xfffff83efffffd77, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 52
memptr_4_195:
	set user_data_start, %r31
	.word 0x85846485  ! 308: WRCCR_I	wr	%r17, 0x0485, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_196:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 309: RDPC	rd	%pc, %r12
	.word 0xa3450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r17
pmu_4_197:
	nop
	setx 0xfffff3f9fffff24b, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 312: RDPC	rd	%pc, %r20
	.word 0xa3520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_200) + 8, 16, 16)) -> intp(2,0,19)
intvec_4_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_201:
	setx 0xbfd94c950ca086b0, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_4_202-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_202:
	.word 0x91950001  ! 317: WRPR_PIL_R	wrpr	%r20, %r1, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_4_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_203:
	mov 0xb62, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe297c034  ! 319: LDUHA_R	lduha	[%r31, %r20] 0x01, %r17
donret_4_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_204-donret_4_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002520d6 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	retry
donretarg_4_204:
	.word 0xe2ffe02c  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x002c] %asi
	be  	 skip_4_205
	.word 0xa1b184d1  ! 1: FCMPNE32	fcmpne32	%d6, %d48, %r16
.align 1024
skip_4_205:
	.word 0x24cb4001  ! 321: BRLEZ	brlez,a,pt	%r13,<label_0xb4001>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_206)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_206:
	.word 0xa9843180  ! 322: WR_SET_SOFTINT_I	wr	%r16, 0x1180, %set_softint
	fbule skip_4_207
	brz,a,pn	%r4, skip_4_207
.align 2048
skip_4_207:
	.word 0xd1e48034  ! 323: CASA_I	casa	[%r18] 0x 1, %r20, %r8
mondo_4_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 324: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
	setx 0x49b7f6896b2f0e48, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d948013  ! 326: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_212) + 0, 16, 16)) -> intp(1,0,22)
intvec_4_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_4_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 330: FDIVd	fdivd	%f0, %f4, %f8
DS_4_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f20, %f24
	.word 0x97b40314  ! 331: ALIGNADDRESS	alignaddr	%r16, %r20, %r11
	.word 0xd49fc2c0  ! 332: LDDA_R	ldda	[%r31, %r0] 0x16, %r10
intveclr_4_215:
	setx 0x9d69dfb4d047c8ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_216-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_216:
	.word 0x91930013  ! 334: WRPR_PIL_R	wrpr	%r12, %r19, %pil
change_to_randtl_4_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_217:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x2bc, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b1c7f4  ! 336: PDISTN	fmean16	%d38, %d20, %d42
memptr_4_218:
	set 0x60340000, %r31
	.word 0x85846695  ! 337: WRCCR_I	wr	%r17, 0x0695, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_4_220:
	setx 0xc91c52e9aba380ad, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_4_221:
	taddcctv %r12, 0x1709, %r8
	.word 0xe807e0e4  ! 340: LDUW_I	lduw	[%r31 + 0x00e4], %r20
	.word 0x9f8036c9  ! 341: SIR	sir	0x16c9
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 342: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97a00160  ! 343: FABSq	dis not found

	.word 0x91a009c3  ! 344: FDIVd	fdivd	%f0, %f34, %f8
donret_4_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_222-donret_4_222-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ad5e20 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xad5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_222:
	.word 0xe2ffe0c8  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x00c8] %asi
	.word 0xc187e080  ! 346: LDFA_I	lda	[%r31, 0x0080], %f0
	rd %pc, %r19
	add %r19, (ivw_4_223-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_223:
	.word 0x91940014  ! 347: WRPR_PIL_R	wrpr	%r16, %r20, %pil
cwp_4_224:
    set user_data_start, %o7
	.word 0x93902002  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x97a4c9a2  ! 349: FDIVs	fdivs	%f19, %f2, %f11
DS_4_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1336be1  ! 1: STQF_I	-	%f16, [0x0be1, %r13]
	normalw
	.word 0x91458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r8
pmu_4_226:
	nop
	setx 0xfffffb7afffff25f, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_4_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f8, %f20
	.word 0xa7b4c311  ! 352: ALIGNADDRESS	alignaddr	%r19, %r17, %r19
splash_hpstate_4_228:
	.word 0x8198270f  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
splash_cmpr_4_229:
	setx 0x249df21e828557fe, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a149cd  ! 355: FDIVd	fdivd	%f36, %f44, %f16
memptr_4_230:
	set 0x60740000, %r31
	.word 0x8584a3c9  ! 356: WRCCR_I	wr	%r18, 0x03c9, %ccr
	.word 0xa1a00172  ! 357: FABSq	dis not found

DS_4_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_4_232:
	nop
	setx 0xfffff09bfffff724, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x22ccc001  ! 1: BRZ	brz,a,pt	%r19,<label_0xcc001>
	.word 0x8d903f37  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x1f37, %pstate
fpinit_4_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 362: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xe927e064  ! 363: STF_I	st	%f20, [0x0064, %r31]
fpinit_4_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 364: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x91d020b2  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_4_236:
	setx 0xeae78621283849e3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_237:
	set user_data_start, %r31
	.word 0x8581be7c  ! 367: WRCCR_I	wr	%r6, 0x1e7c, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_238) + 8, 16, 16)) -> intp(6,0,6)
intvec_4_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_239:
	nop
	setx 0xfffffea8fffff458, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_240:
	set 0xecb892b6, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0xadda3e1e1749124c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_242-donret_4_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0076c55e | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x14c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	retry
donretarg_4_242:
	.word 0xe8ffe0bc  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x00bc] %asi
pmu_4_243:
	nop
	setx 0xfffff593fffffe59, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe8800c00  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r20
	.word 0x9ba00170  ! 376: FABSq	dis not found

	.word 0xab84a48d  ! 377: WR_CLEAR_SOFTINT_I	wr	%r18, 0x048d, %clear_softint
jmptr_4_244:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_4_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 379: FDIVd	fdivd	%f0, %f4, %f6
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 380: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_4_246:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_4_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_247:
	mov 0x7d0, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe31fc013  ! 382: LDDF_R	ldd	[%r31, %r19], %f17
donret_4_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_248-donret_4_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff7de4 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	retry
donretarg_4_248:
	.word 0xe2ffe0a2  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x00a2] %asi
DS_4_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_4_250:
	tsubcctv %r1, 0x1577, %r17
	.word 0xe207e008  ! 385: LDUW_I	lduw	[%r31 + 0x0008], %r17
pmu_4_251:
	nop
	setx 0xfffffec8fffffb52, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_4_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 387: FCMPLE32	fcmple32	%d0, %d4, %r8
	.word 0xa7800011  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r17, %-
splash_cmpr_4_254:
	setx 0xfd500deb167773a7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_4_255:
	set user_data_start, %r31
	.word 0x8584e474  ! 390: WRCCR_I	wr	%r19, 0x0474, %ccr
splash_lsu_4_256:
	set 0xe9ebd534, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	bleu  	 skip_4_257
	fbe skip_4_257
.align 128
skip_4_257:
	.word 0x93a049d1  ! 392: FDIVd	fdivd	%f32, %f48, %f40
mondo_4_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 393: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xe1bfde00  ! 395: STDFA_R	stda	%f16, [%r0, %r31]
donret_4_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_260-donret_4_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00aa06bf | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x886, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_260:
	.word 0xe0ffe0d8  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x00d8] %asi
unsupttte4_261:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87acca41  ! 397: FCMPd	fcmpd	%fcc<n>, %f50, %f32
intveclr_4_262:
	setx 0x9adbc263c971d65c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_4_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe134260e  ! 1: STQF_I	-	%f16, [0x060e, %r16]
	normalw
	.word 0x97458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r11
DS_4_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
mondo_4_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d914012  ! 402: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0x9ba00162  ! 403: FABSq	dis not found

mondo_4_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c012  ! 404: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_267:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 405: RDPC	rd	%pc, %r17
mondo_4_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d92c011  ! 406: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0xa9540000  ! 407: RDPR_GL	<illegal instruction>
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
    set (0x009c061c | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x24f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_4_269:
	.word 0xe4ffe050  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x0050] %asi
	.word 0x99902004  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_270:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 410: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_271:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 411: RDPC	rd	%pc, %r11
	.word 0x91d02033  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87aa0a44  ! 413: FCMPd	fcmpd	%fcc<n>, %f8, %f4
splash_cmpr_4_272:
	setx 0xa1f7d5c6094c7d29, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_273-donret_4_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00b2eba5 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb47, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	done
donretarg_4_273:
	.word 0xe0ffe07a  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x007a] %asi
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_274:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 416: RDPC	rd	%pc, %r17
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_4_275:
	set 0x60540000, %r31
	.word 0x85816773  ! 418: WRCCR_I	wr	%r5, 0x0773, %ccr
splash_hpstate_4_276:
	.word 0x819827dd  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dd, %hpstate
intveclr_4_277:
	setx 0x44654ef53be12a4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_278:
	mov 0xec0, %r20
	mov 0x12, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 421: CASA_R	casa	[%r31] %asi, %r17, %r16
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_279:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 422: RDPC	rd	%pc, %r13
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x83d02034  ! 424: Tcc_I	te	icc_or_xcc, %r0 + 52
intveclr_4_280:
	setx 0xba220ace48e51000, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_281)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_281:
	.word 0xa9842d8e  ! 426: WR_SET_SOFTINT_I	wr	%r16, 0x0d8e, %set_softint
	.word 0xc187db60  ! 427: LDFA_R	lda	[%r31, %r0], %f0
donret_4_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_282-donret_4_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0035377b | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_282:
	.word 0xd4ffe058  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x0058] %asi
	.word 0x91d020b2  ! 429: Tcc_I	ta	icc_or_xcc, %r0 + 178
	fbn skip_4_283
	brlez,a,pt	%r7, skip_4_283
.align 512
skip_4_283:
	.word 0xa3a2c9d1  ! 430: FDIVd	fdivd	%f42, %f48, %f48
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803620  ! 433: SIR	sir	0x1620
pmu_4_284:
	nop
	setx 0xfffff172fffffda4, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe018  ! 435: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r19
debug_4_285:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe63fe617  ! 436: STD_I	std	%r19, [%r31 + 0x0617]
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_4_286:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_4_287:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x93500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 442: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_4_290:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_4_291:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe018  ! 446: LDXA_I	ldxa	[%r31, + 0x0018] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_4_292-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_292:
	.word 0x9191c010  ! 447: WRPR_PIL_R	wrpr	%r7, %r16, %pil
splash_cmpr_4_293:
	setx 0xf8a23e81875c49ad, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_294:
	setx 0xd65b2ae53972e172, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_295:
	setx 0xdff904f35fc037e6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e010  ! 451: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x91d02035  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_4_296:
	.word 0x81982557  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0557, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_298) + 48, 16, 16)) -> intp(0,0,14)
intvec_4_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0x08cfa8a1331f744b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a4c9d0  ! 458: FDIVd	fdivd	%f50, %f16, %f18
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_4_300-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_300:
	.word 0x91948010  ! 460: WRPR_PIL_R	wrpr	%r18, %r16, %pil
DS_4_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
jmptr_4_302:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_4_303:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe0dfc031  ! 463: LDXA_R	ldxa	[%r31, %r17] 0x01, %r16
pmu_4_304:
	nop
	setx 0xfffff757fffff65c, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_305:
	nop
	setx 0xfffff7fafffffe54, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_306:
	setx 0x0632e6c4afd62543, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a449c6  ! 467: FDIVd	fdivd	%f48, %f6, %f18
    set 0x220f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b4c7e8  ! 468: PDISTN	fmean16	%d50, %d8, %d50
	.word 0xa7a00171  ! 469: FABSq	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xc1bfde00  ! 471: STDFA_R	stda	%f0, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_308) + 8, 16, 16)) -> intp(7,0,5)
intvec_4_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd937e004  ! 474: STQF_I	-	%f12, [0x0004, %r31]
tagged_4_309:
	taddcctv %r13, 0x1bb6, %r19
	.word 0xd807e03c  ! 475: LDUW_I	lduw	[%r31 + 0x003c], %r12
	fbe skip_4_310
	fbe skip_4_310
.align 2048
skip_4_310:
	.word 0xda3a8001  ! 476: STD_R	std	%r13, [%r10 + %r1]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_4_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d944013  ! 478: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xa3a0016d  ! 479: FABSq	dis not found

	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_313:
	setx 0x28c409cf73f02daa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_4_314:
	setx 0xc2e0ff5cffaffab5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_4_317:
	taddcctv %r20, 0x10d7, %r9
	.word 0xe407e008  ! 485: LDUW_I	lduw	[%r31 + 0x0008], %r18
donret_4_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_318-donret_4_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004b4782 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x60f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_318:
	.word 0xe4ffe068  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x0068] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0x95464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x97a409cd  ! 489: FDIVd	fdivd	%f16, %f44, %f42
	.word 0x8d902610  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0xe62fe015  ! 491: STB_I	stb	%r19, [%r31 + 0x0015]
splash_htba_4_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_321:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 493: RDPC	rd	%pc, %r19
	.word 0xad80b900  ! 494: WR_SOFTINT_REG_I	wr	%r2, 0x1900, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f803a8f  ! 496: SIR	sir	0x1a8f
	.word 0xa7a0c9cc  ! 497: FDIVd	fdivd	%f34, %f12, %f50
jmptr_4_322:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_4_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 500: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xd86fe012  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x0012]
	.word 0x9f8039f0  ! 502: SIR	sir	0x19f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_324) + 40, 16, 16)) -> intp(1,0,1)
intvec_4_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_325:
	nop
	setx 0xfffffcf6fffff2bc, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x99a00170  ! 506: FABSq	dis not found

splash_lsu_4_327:
	set 0xb5f2f96e, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fble,a,pn	%fcc0,  skip_4_328
	fbg,a,pn	%fcc0,  skip_4_328
.align 128
skip_4_328:
	.word 0xc36aed80  ! 508: PREFETCH_I	prefetch	[%r11 + 0x0d80], #one_read
	.word 0xe83fe0aa  ! 509: STD_I	std	%r20, [%r31 + 0x00aa]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_329:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 510: RDPC	rd	%pc, %r12
	.word 0xe187e020  ! 511: LDFA_I	lda	[%r31, 0x0020], %f16
intveclr_4_330:
	setx 0xc69d6fdf8188decb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_331:
	.word 0x81982dcf  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcf, %hpstate
DS_4_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe9350002  ! 1: STQF_R	-	%f20, [%r2, %r20]
	normalw
	.word 0xa9458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r20
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 515: RDPC	rd	%pc, %r16
jmptr_4_334:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe028  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x0028]
splash_tba_4_335:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xc3e80026  ! 519: PREFETCHA_R	prefetcha	[%r0, %r6] 0x01, #one_read
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_336:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 520: RDPC	rd	%pc, %r12
intveclr_4_337:
	setx 0x5e705395d177c5b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r20
mondo_4_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c013  ! 523: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
intveclr_4_339:
	setx 0x640e5e4c737fab73, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 525: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
splash_hpstate_4_341:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81982c16  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c16, %hpstate
	.word 0xe26fe0c3  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x00c3]
splash_lsu_4_342:
	set 0x9b0fb6c9, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fbug,a,pn	%fcc0,  skip_4_343
	fbuge,a,pn	%fcc0,  skip_4_343
.align 128
skip_4_343:
	.word 0xe6380008  ! 529: STD_R	std	%r19, [%r0 + %r8]
tagged_4_344:
	tsubcctv %r17, 0x18fc, %r12
	.word 0xd807e011  ! 530: LDUW_I	lduw	[%r31 + 0x0011], %r12
	.word 0xd8cfe020  ! 531: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
pmu_4_345:
	nop
	setx 0xfffffd01fffffdb0, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e008  ! 533: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_4_346:
	setx 0x7a1d97830c4cd640, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_347:
	setx 0x13211bb2dae439e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfde00  ! 537: STDFA_R	stda	%f0, [%r0, %r31]
donret_4_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_348-donret_4_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ee6926 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x94c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_348:
	.word 0xd8ffe015  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x0015] %asi
	.word 0xe1bfda00  ! 539: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa9830007  ! 540: WR_SET_SOFTINT_R	wr	%r12, %r7, %set_softint
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f80273c  ! 542: SIR	sir	0x073c
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 543: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_4_349:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_4_350:
	set 0xff3e58d5, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc540  ! 546: LDDA_R	ldda	[%r31, %r0] 0x2a, %r12
intveclr_4_351:
	setx 0x7b829ce4e1c8ab59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_4_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83ed8  ! 548: PREFETCHA_I	prefetcha	[%r0, + 0xfffffed8] %asi, #one_read
intveclr_4_353:
	setx 0xf00ccf7401f98c38, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 550: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_354:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 551: RDPC	rd	%pc, %r11
	setx 0x678b7642b49c1e5e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_358) + 8, 16, 16)) -> intp(6,0,9)
intvec_4_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0x69a2d668fa6d828f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd71fe038  ! 559: LDDF_I	ldd	[%r31, 0x0038], %f11
mondo_4_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c011  ! 560: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
intveclr_4_361:
	setx 0x3d7f5f0933a75eb6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_362:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 562: RDPC	rd	%pc, %r19
splash_tba_4_363:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_4_364:
	setx 0x1d6f5c3fe9f445d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0xa1a049d2  ! 566: FDIVd	fdivd	%f32, %f18, %f16
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 568: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_4_366:
	nop
	setx 0xfffff2fcfffff179, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_367:
	setx 0xf72b48c51d7e6f09, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_369:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 572: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_4_370-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_370:
	.word 0x91944011  ! 573: WRPR_PIL_R	wrpr	%r17, %r17, %pil
mondo_4_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d914013  ! 574: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
mondo_4_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d930008  ! 575: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
DS_4_373:
	.word 0xa1a409d4  ! 1: FDIVd	fdivd	%f16, %f20, %f16
	pdist %f26, %f22, %f0
	.word 0xa3b00314  ! 576: ALIGNADDRESS	alignaddr	%r0, %r20, %r17
unsupttte4_374:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5a249d3  ! 577: FDIVd	fdivd	%f40, %f50, %f18
debug_4_375:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc012  ! 578: LDDF_R	ldd	[%r31, %r18], %f12
splash_hpstate_4_376:
	.word 0x819825d5  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d5, %hpstate
	.word 0xe187e0e0  ! 580: LDFA_I	lda	[%r31, 0x00e0], %f16
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_377:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 581: RDPC	rd	%pc, %r10
mondo_4_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d94c010  ! 582: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
intveclr_4_379:
	setx 0x613e13df3e5ee0ba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_4_381:
	set 0x4cf2e0f4, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	fbe,a,pn	%fcc0,  skip_4_382
	.word 0xd43d0003  ! 1: STD_R	std	%r10, [%r20 + %r3]
.align 128
skip_4_382:
	.word 0x99a189d2  ! 586: FDIVd	fdivd	%f6, %f18, %f12
tagged_4_383:
	taddcctv %r9, 0x1899, %r6
	.word 0xd807e044  ! 587: LDUW_I	lduw	[%r31 + 0x0044], %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_384:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 588: RDPC	rd	%pc, %r17
	.word 0xa9a009cb  ! 589: FDIVd	fdivd	%f0, %f42, %f20
pmu_4_385:
	nop
	setx 0xfffffe7bfffff1ad, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_4_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f18, %f30
	.word 0x9bb18312  ! 591: ALIGNADDRESS	alignaddr	%r6, %r18, %r13
jmptr_4_387:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91d020b2  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_4_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_4_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 595: FCMPLE32	fcmple32	%d0, %d4, %r6
splash_hpstate_4_390:
	.word 0x81982044  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0044, %hpstate
	.word 0x8d902c82  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0c82, %pstate
cwp_4_392:
    set user_data_start, %o7
	.word 0x93902005  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	bl,a	 skip_4_393
	.word 0xd1e10033  ! 1: CASA_I	casa	[%r4] 0x 1, %r19, %r8
.align 512
skip_4_393:
	.word 0x95a109c6  ! 599: FDIVd	fdivd	%f4, %f6, %f10
donret_4_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_394-donret_4_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002ba488 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa16, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	retry
donretarg_4_394:
	.word 0xd8ffe0f4  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x00f4] %asi
	.word 0xa5a249cd  ! 601: FDIVd	fdivd	%f40, %f44, %f18
mondo_4_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d944010  ! 602: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
jmptr_4_396:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_4_397:
	setx 0xd0162ba7f78c1883, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_398:
	nop
	setx 0xfffff44dfffffaac, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_4_399:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc030  ! 606: STDA_R	stda	%r18, [%r31 + %r16] 0x01
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_400)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_400:
	.word 0xa980aa7c  ! 607: WR_SET_SOFTINT_I	wr	%r2, 0x0a7c, %set_softint
	rd %pc, %r19
	add %r19, (ivw_4_401-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_401:
	.word 0x9190c007  ! 608: WRPR_PIL_R	wrpr	%r3, %r7, %pil
	.word 0x9f802c3b  ! 609: SIR	sir	0x0c3b
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_402) + 40, 16, 16)) -> intp(6,0,15)
intvec_4_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_4_403:
	set 0x60340000, %r31
	.word 0x858021de  ! 611: WRCCR_I	wr	%r0, 0x01de, %ccr
	.word 0xe46fe0ac  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x00ac]
cwp_4_404:
    set user_data_start, %o7
	.word 0x93902002  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_405)+0, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_405:
	.word 0xa9823531  ! 614: WR_SET_SOFTINT_I	wr	%r8, 0x1531, %set_softint
	.word 0x24cb0001  ! 1: BRLEZ	brlez,a,pt	%r12,<label_0xb0001>
	.word 0x8d903edb  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x1edb, %pstate
mondo_4_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948004  ! 616: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
debug_4_408:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc033  ! 617: STDA_R	stda	%r18, [%r31 + %r19] 0x01
pmu_4_409:
	nop
	setx 0xfffff84ffffff030, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_410:
	setx 0x2c0436b7ddc25feb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5500000  ! 620: RDPR_TPC	<illegal instruction>
	setx 0x7fdb6eb3ebfea996, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ac0a40  ! 622: FCMPd	fcmpd	%fcc<n>, %f16, %f0
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e0a1  ! 624: STF_I	st	%f19, [0x00a1, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_4_413:
	nop
	setx 0xfffffb39fffffca3, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_414-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_414:
	.word 0x91944008  ! 627: WRPR_PIL_R	wrpr	%r17, %r8, %pil
	.word 0x9194b9bb  ! 628: WRPR_PIL_I	wrpr	%r18, 0x19bb, %pil
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_415:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 629: RDPC	rd	%pc, %r8
change_to_randtl_4_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_416:
	.word 0x8f902001  ! 630: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 632: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_4_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 635: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x9b464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r13
donret_4_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_420-donret_4_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ae29e7 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x884, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_4_420:
	.word 0xd6ffe000  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x0000] %asi
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_421:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 638: RDPC	rd	%pc, %r16
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_4_422-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_422:
	.word 0x91928013  ! 640: WRPR_PIL_R	wrpr	%r10, %r19, %pil
splash_cmpr_4_423:
	setx 0x7d654459499d35f4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_4_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_424-donret_4_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d70307 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x39c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x24ccc001  ! 1: BRLEZ	brlez,a,pt	%r19,<label_0xcc001>
	retry
donretarg_4_424:
	.word 0xe0ffe08c  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x008c] %asi
	.word 0xa7a00173  ! 643: FABSq	dis not found

memptr_4_425:
	set 0x60140000, %r31
	.word 0x85827cbc  ! 644: WRCCR_I	wr	%r9, 0x1cbc, %ccr
	.word 0xe48fe000  ! 645: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r18
splash_cmpr_4_426:
	setx 0x0465b139afdfee8d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xe7dda2001cbf1b36, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_4_428:
	nop
	setx 0xfffffa07fffffc69, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e020  ! 650: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe46fe0ef  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x00ef]
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba00172  ! 653: FABSq	dis not found

	.word 0xe68008a0  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_lsu_4_429:
	set 0x1d39b773, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5540000  ! 656: RDPR_GL	rdpr	%-, %r18
	.word 0x9f803736  ! 657: SIR	sir	0x1736
	fbo skip_4_430
	.word 0xe43c4014  ! 1: STD_R	std	%r18, [%r17 + %r20]
.align 512
skip_4_430:
	.word 0xe43c8002  ! 658: STD_R	std	%r18, [%r18 + %r2]
	rd %pc, %r19
	add %r19, (ivw_4_431-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_431:
	.word 0x91928007  ! 659: WRPR_PIL_R	wrpr	%r10, %r7, %pil
DS_4_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd146eaea	! Random illegal ?
	.word 0x95a00544  ! 1: FSQRTd	fsqrt	
	.word 0x97a14830  ! 660: FADDs	fadds	%f5, %f16, %f11
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 661: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 662: Tcc_R	tne	icc_or_xcc, %r0 + %r30
donret_4_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_433-donret_4_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002bf71a | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x847, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_433:
	.word 0xd8ffe059  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x0059] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_4_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe534b3c8  ! 1: STQF_I	-	%f18, [0x13c8, %r18]
	normalw
	.word 0xa3458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_436:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 666: RDPC	rd	%pc, %r11
splash_htba_4_437:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_438)+24, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_438:
	.word 0xa9817cea  ! 668: WR_SET_SOFTINT_I	wr	%r5, 0x1cea, %set_softint
pmu_4_439:
	nop
	setx 0xfffff08dfffffec2, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3b0c481  ! 670: FCMPLE32	fcmple32	%d34, %d32, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_440) + 0, 16, 16)) -> intp(4,0,9)
intvec_4_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_4_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903b59  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x1b59, %pstate
splash_hpstate_4_443:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x81982b07  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b07, %hpstate
pmu_4_444:
	nop
	setx 0xfffff9f9fffff3b1, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7834000  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r13, %r0, %-
	.word 0xda77e093  ! 678: STX_I	stx	%r13, [%r31 + 0x0093]
jmptr_4_446:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f80238d  ! 680: SIR	sir	0x038d
DS_4_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa3a00541  ! 1: FSQRTd	fsqrt	
	.word 0xa5a2082d  ! 681: FADDs	fadds	%f8, %f13, %f18
	.word 0xda37e020  ! 682: STH_I	sth	%r13, [%r31 + 0x0020]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_448:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 683: RDPC	rd	%pc, %r11
pmu_4_449:
	nop
	setx 0xfffff13cfffff9ea, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_450:
	set 0x7815098e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xd7aa3d4db8c1ea83, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_452:
	setx 0xfdf26fb84ee662a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_4_454:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982a4f  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4f, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_4_455:
	setx 0x1c8c74ec170984cb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e000  ! 692: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
splash_lsu_4_456:
	set 0x2c2dcd23, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab8524f3  ! 694: WR_CLEAR_SOFTINT_I	wr	%r20, 0x04f3, %clear_softint
memptr_4_457:
	set 0x60540000, %r31
	.word 0x85813f1d  ! 695: WRCCR_I	wr	%r4, 0x1f1d, %ccr
splash_cmpr_4_458:
	setx 0xfb3fa00ee979ee09, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
	.word 0xa784c012  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r18, %-
	rd %pc, %r19
	add %r19, (ivw_4_461-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_461:
	.word 0x91920014  ! 700: WRPR_PIL_R	wrpr	%r8, %r20, %pil
	.word 0x95454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0xa7a00174  ! 1: FABSq	dis not found

	.word 0xc187e0c0  ! 2: LDFA_I	lda	[%r31, 0x00c0], %f0
	.word 0xa9a0016d  ! 3: FABSq	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	.word 0xd7e24026  ! 5: CASA_I	casa	[%r9] 0x 1, %r6, %r11
pmu_2_2:
	nop
	setx 0xfffff819fffff0c2, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe068  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x0068]
donret_2_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_3-donret_2_3-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0038d78e | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9ce, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_3:
	.word 0xd2ffe040  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x0040] %asi
jmptr_2_4:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe030  ! 10: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r9
	.word 0x99a00173  ! 11: FABSq	dis not found

DS_2_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0x99480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x91480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 15: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_2_6:
	setx 0x844a2f66e220757d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e028  ! 17: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r18
	.word 0xe4dfe000  ! 18: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
DS_2_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe1340002  ! 1: STQF_R	-	%f16, [%r2, %r16]
	normalw
	.word 0xa5458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r18
intveclr_2_8:
	setx 0x98b59b7035fa6f5a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_9:
	nop
	setx 0xfffff999fffff7c4, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e0a8  ! 23: STX_I	stx	%r20, [%r31 + 0x00a8]
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 24: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1a00173  ! 25: FABSq	dis not found

intveclr_2_10:
	setx 0x0b1a0d088db3cbed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_11:
	.word 0x81982a15  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
splash_tba_2_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x6e9f96255065a510, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_2_15:
	nop
	setx 0xfffffe75fffff372, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe63cc013  ! 32: STD_R	std	%r19, [%r19 + %r19]
splash_cmpr_2_17:
	setx 0x32897c1c4ec26efe, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_2_18:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_2_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d904012  ! 35: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0x9b500000  ! 36: RDPR_TPC	<illegal instruction>
jmptr_2_20:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_2_21:
	setx 0x6bc3b81f193e717b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80237c  ! 39: SIR	sir	0x037c
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
	rd %pc, %r19
	add %r19, (ivw_2_22-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_22:
	.word 0x91944010  ! 41: WRPR_PIL_R	wrpr	%r17, %r16, %pil
	.word 0x95a00161  ! 42: FABSq	dis not found

DS_2_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa1a409c8  ! 1: FDIVd	fdivd	%f16, %f8, %f16
	.word 0xa7a50832  ! 43: FADDs	fadds	%f20, %f18, %f19
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xa9a509c9  ! 45: FDIVd	fdivd	%f20, %f40, %f20
	.word 0x39400001  ! 46: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_25-donret_2_25-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00cb60c1 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x80f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_25:
	.word 0xe2ffe039  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x0039] %asi
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 48: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe26fe06d  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x006d]
	.word 0xe26fe039  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x0039]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xe1bfe020  ! 52: STDFA_I	stda	%f16, [0x0020, %r31]
tagged_2_26:
	tsubcctv %r17, 0x1b08, %r17
	.word 0xe207e0c8  ! 53: LDUW_I	lduw	[%r31 + 0x00c8], %r17
	rd %pc, %r19
	add %r19, (ivw_2_27-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_27:
	.word 0x91950014  ! 54: WRPR_PIL_R	wrpr	%r20, %r20, %pil
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f802ee1  ! 56: SIR	sir	0x0ee1
splash_hpstate_2_29:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x81982816  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0xe277e088  ! 58: STX_I	stx	%r17, [%r31 + 0x0088]
debug_2_30:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe297c034  ! 59: LDUHA_R	lduha	[%r31, %r20] 0x01, %r17
jmptr_2_31:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe02d  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x002d]
	rd %pc, %r19
	add %r19, (ivw_2_32-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_32:
	.word 0x9191000b  ! 62: WRPR_PIL_R	wrpr	%r4, %r11, %pil
	.word 0x83d02035  ! 63: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xad80a268  ! 64: WR_SOFTINT_REG_I	wr	%r2, 0x0268, %softint
intveclr_2_33:
	setx 0x988cf22b457e9626, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902208  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x0208, %pstate
	.word 0xc187db60  ! 67: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x91520000  ! 68: RDPR_PIL	rdpr	%pil, %r8
	.word 0xd8800b40  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
splash_cmpr_2_35:
	setx 0xbcbf366ed8e189d3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_36:
	set user_data_start, %r31
	.word 0x8582e3af  ! 71: WRCCR_I	wr	%r11, 0x03af, %ccr
	rd %pc, %r19
	add %r19, (ivw_2_37-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_37:
	.word 0x9192400c  ! 72: WRPR_PIL_R	wrpr	%r9, %r12, %pil
intveclr_2_38:
	setx 0x635eb87014c803df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a409c9  ! 74: FDIVd	fdivd	%f16, %f40, %f48
	.word 0xa1a00171  ! 75: FABSq	dis not found

DS_2_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93d02035  ! 77: Tcc_I	tne	icc_or_xcc, %r0 + 53
pmu_2_40:
	nop
	setx 0xffffffa4fffffa89, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d9032a3  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x12a3, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_2_42:
	setx 0x9972895e9b6806cf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_43-donret_2_43-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fce4e2 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc4f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_43:
	.word 0xe8ffe0a2  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x00a2] %asi
debug_2_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_44:
	mov 0xb1d, %r20
	mov 0x19, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe897c033  ! 83: LDUHA_R	lduha	[%r31, %r19] 0x01, %r20
splash_htba_2_45:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_2_46:
	setx 0xfae2de45312dab6c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0xc1bfe000  ! 87: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xa784285e  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r16, 0x085e, %-
	setx 0xe792e20335c5a6f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d94c008  ! 90: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
donret_2_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_49-donret_2_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008647ce | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x95e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_49:
	.word 0xd8ffe040  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x0040] %asi
DS_2_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x99a00169  ! 93: FABSq	dis not found

	.word 0xd46fe094  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x0094]
debug_2_51:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd4bfc024  ! 95: STDA_R	stda	%r10, [%r31 + %r4] 0x01
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0x9b45c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_52) + 56, 16, 16)) -> intp(6,0,17)
intvec_2_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
	rd %pc, %r19
	add %r19, (ivw_2_54-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_54:
	.word 0x9191000a  ! 100: WRPR_PIL_R	wrpr	%r4, %r10, %pil
DS_2_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9150014  ! 1: LDQF_R	-	[%r20, %r20], %f12
	.word 0x93a4c82a  ! 101: FADDs	fadds	%f19, %f10, %f9
DS_2_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe94d1385	! Random illegal ?
	.word 0x9ba00548  ! 1: FSQRTd	fsqrt	
	.word 0x9ba18826  ! 102: FADDs	fadds	%f6, %f6, %f13
	.word 0xd327e044  ! 103: STF_I	st	%f9, [0x0044, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_2_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d948010  ! 106: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	setx 0x065469b77eb6ee5c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
DS_2_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_2_61:
	setx 0x9c92bb7075053c72, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_64:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 115: RDPC	rd	%pc, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_66) + 48, 16, 16)) -> intp(5,0,27)
intvec_2_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_67:
	mov 0x688, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe4dfc027  ! 118: LDXA_R	ldxa	[%r31, %r7] 0x01, %r18
intveclr_2_68:
	setx 0x4b875c58a5eddd07, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xb8cae33cbcfa081e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d920014  ! 121: WRPR_WSTATE_R	wrpr	%r8, %r20, %wstate
	setx 0x112c53c8f7738e3c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a4c9cb  ! 123: FDIVd	fdivd	%f50, %f42, %f10
splash_cmpr_2_72:
	setx 0xf3f6c8f076e8972e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802575  ! 125: SIR	sir	0x0575
jmptr_2_73:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d9037b2  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x17b2, %pstate
	.word 0xa9a0c9c8  ! 128: FDIVd	fdivd	%f34, %f8, %f20
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f802948  ! 130: SIR	sir	0x0948
	.word 0x99b187e6  ! 131: PDISTN	fmean16	%d6, %d6, %d12
	.word 0xe8bfe0da  ! 132: STDA_I	stda	%r20, [%r31 + 0x00da] %asi
splash_htba_2_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_2_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x9ba189c1  ! 1: FDIVd	fdivd	%f6, %f32, %f44
	normalw
	.word 0xa1458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r16
change_to_randtl_2_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_78:
	.word 0x8f902001  ! 135: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_2_79:
	set 0xcb808ba5, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e020  ! 137: STF_I	st	%f20, [0x0020, %r31]
splash_cmpr_2_80:
	setx 0x0c269e1dcdca316d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 139: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe8cfe028  ! 140: LDSBA_I	ldsba	[%r31, + 0x0028] %asi, %r20
splash_htba_2_81:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe187dc00  ! 142: LDFA_R	lda	[%r31, %r0], %f16
jmptr_2_82:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa5a149d1  ! 144: FDIVd	fdivd	%f36, %f48, %f18
splash_decr_2_84:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa7830013  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r19, %-
splash_lsu_2_85:
	set 0xca27bf61, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_86:
	setx 0x0480cca516069f8b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a00173  ! 148: FABSq	dis not found

	.word 0xa7a00170  ! 149: FABSq	dis not found

pmu_2_87:
	nop
	setx 0xfffff024ffffffda, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a00174  ! 151: FABSq	dis not found

mondo_2_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d940010  ! 152: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xda57e018  ! 153: LDSH_I	ldsh	[%r31 + 0x0018], %r13
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_89:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 154: RDPC	rd	%pc, %r18
intveclr_2_90:
	setx 0xf59f65259a6c54a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d95000c  ! 156: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
donret_2_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_92-donret_2_92-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0033306e | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5ce, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_92:
	.word 0xd6ffe0cc  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x00cc] %asi
splash_decr_2_93:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa784000a  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r10, %-
mondo_2_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914008  ! 159: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
memptr_2_95:
	set 0x60140000, %r31
	.word 0x8581e820  ! 160: WRCCR_I	wr	%r7, 0x0820, %ccr
debug_2_96:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc034  ! 161: LDXA_R	ldxa	[%r31, %r20] 0x01, %r11
memptr_2_97:
	set 0x60740000, %r31
	.word 0x858133cc  ! 162: WRCCR_I	wr	%r4, 0x13cc, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_98) + 0, 16, 16)) -> intp(7,0,19)
intvec_2_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_99:
	.word 0x8198256e  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x056e, %hpstate
	.word 0xd727e05c  ! 165: STF_I	st	%f11, [0x005c, %r31]
	.word 0x24c80001  ! 166: BRLEZ	brlez,a,pt	%r0,<label_0x80001>
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0x99a00171  ! 168: FABSq	dis not found

fpinit_2_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 169: FCMPLE32	fcmple32	%d0, %d4, %r8
DS_2_102:
	.word 0x9ba0c9c0  ! 1: FDIVd	fdivd	%f34, %f0, %f44
	allclean
	.word 0xa3b48309  ! 170: ALIGNADDRESS	alignaddr	%r18, %r9, %r17
mondo_2_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d95000a  ! 171: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
pmu_2_104:
	nop
	setx 0xfffff25bfffff6fc, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xa7a489d3  ! 174: FDIVd	fdivd	%f18, %f50, %f50
	.word 0x99a00171  ! 175: FABSq	dis not found

	.word 0xa7b48492  ! 176: FCMPLE32	fcmple32	%d18, %d18, %r19
	.word 0xd44fe010  ! 177: LDSB_I	ldsb	[%r31 + 0x0010], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_2_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90c014  ! 179: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xe187de00  ! 181: LDFA_R	lda	[%r31, %r0], %f16
tagged_2_106:
	tsubcctv %r6, 0x132c, %r17
	.word 0xd407e0fc  ! 182: LDUW_I	lduw	[%r31 + 0x00fc], %r10
mondo_2_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d924011  ! 183: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_108) + 24, 16, 16)) -> intp(1,0,3)
intvec_2_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e008  ! 186: LDSWA_I	ldswa	[%r31, + 0x0008] %asi, %r10
	.word 0xab8022af  ! 187: WR_CLEAR_SOFTINT_I	wr	%r0, 0x02af, %clear_softint
splash_hpstate_2_109:
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x81982cc6  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc6, %hpstate
mondo_2_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d928013  ! 189: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	.word 0xc1bfda00  ! 190: STDFA_R	stda	%f0, [%r0, %r31]
intveclr_2_111:
	setx 0x9a0079240cefa906, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94c004  ! 192: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
intveclr_2_113:
	setx 0x7aba771ba3c1151c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0x97a489d2  ! 195: FDIVd	fdivd	%f18, %f18, %f42
debug_2_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_115:
	mov 0x615, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc005  ! 196: LDDF_R	ldd	[%r31, %r5], %f16
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0x887467ceff254f7b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_118:
	setx 0x5748d9850254e37c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802037  ! 200: SIR	sir	0x0037
	ta	T_CHANGE_NONPRIV	! macro
pmu_2_119:
	nop
	setx 0xfffff087fffffb31, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_120) + 32, 16, 16)) -> intp(5,0,26)
intvec_2_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe049  ! 204: STD_I	std	%r16, [%r31 + 0x0049]
fpinit_2_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 205: FCMPLE32	fcmple32	%d0, %d4, %r8
pmu_2_122:
	nop
	setx 0xfffffd0dfffff229, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc36b6916  ! 207: PREFETCH_I	prefetch	[%r13 + 0x0916], #one_read
	.word 0xd23fe024  ! 208: STD_I	std	%r9, [%r31 + 0x0024]
	.word 0x97a00170  ! 209: FABSq	dis not found

splash_cmpr_2_124:
	setx 0xfd805b41f71931b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x24c94001  ! 211: BRLEZ	brlez,a,pt	%r5,<label_0x94001>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_2_127:
	setx 0x2395875caaa02ba6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe020  ! 214: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_128) + 0, 16, 16)) -> intp(4,0,22)
intvec_2_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903f1c  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x1f1c, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_130) + 56, 16, 16)) -> intp(7,0,12)
intvec_2_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 218: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_131:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 219: RDPC	rd	%pc, %r17
	.word 0x91a189b1  ! 220: FDIVs	fdivs	%f6, %f17, %f8
splash_cmpr_2_132:
	setx 0x051440670e0bdb1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e040  ! 222: STH_I	sth	%r20, [%r31 + 0x0040]
jmptr_2_133:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_2_134:
	nop
	setx 0xfffff0f9fffff515, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x3cf942988cffbfc7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_136:
	mov 0x47f, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x37,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 226: CASA_R	casa	[%r31] %asi, %r18, %r20
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0x91a0c9d1  ! 230: FDIVd	fdivd	%f34, %f48, %f8
	rd %pc, %r19
	add %r19, (ivw_2_140-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_140:
	.word 0x91940006  ! 231: WRPR_PIL_R	wrpr	%r16, %r6, %pil
mondo_2_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c00d  ! 232: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
	.word 0x9f80346a  ! 233: SIR	sir	0x146a
pmu_2_142:
	nop
	setx 0xfffff4cbfffff06f, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91937367  ! 235: WRPR_PIL_I	wrpr	%r13, 0x1367, %pil
splash_hpstate_2_143:
	.word 0x81982b45  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b45, %hpstate
	.word 0xa9b147e2  ! 237: PDISTN	fmean16	%d36, %d2, %d20
memptr_2_144:
	set user_data_start, %r31
	.word 0x8584b8c6  ! 238: WRCCR_I	wr	%r18, 0x18c6, %ccr
mondo_2_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d918012  ! 239: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0x87ac0a47  ! 240: FCMPd	fcmpd	%fcc<n>, %f16, %f38
pmu_2_147:
	nop
	setx 0xfffffe19ffffff3f, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_2_148:
	setx 0x8cefa1ee41451253, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a489d4  ! 244: FDIVd	fdivd	%f18, %f20, %f48
	rd %pc, %r19
	add %r19, (ivw_2_149-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_149:
	.word 0x91900006  ! 245: WRPR_PIL_R	wrpr	%r0, %r6, %pil
fpinit_2_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 246: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_2_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d930013  ! 247: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
invtsb_2_152:
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
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_2_153:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 249: CASA_R	casa	[%r31] %asi, %r8, %r11
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_2_155:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d903a55  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x1a55, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_2_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_157:
	mov 0x464, %r20
	mov 0x17, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc008  ! 254: LDDF_R	ldd	[%r31, %r8], %f11
intveclr_2_158:
	setx 0xde5bbe29b3e60c4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_159-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_159:
	.word 0x9194c010  ! 256: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_2_160:
	set 0x0b4a6b66, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94c00b  ! 259: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
	.word 0x91a00173  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_163:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 263: RDPC	rd	%pc, %r10
mondo_2_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d948005  ! 264: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_2_165:
	set user_data_start, %r31
	.word 0x8582216d  ! 266: WRCCR_I	wr	%r8, 0x016d, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_167
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_167:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_168) + 48, 16, 16)) -> intp(5,0,5)
intvec_2_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_169:
	mov 0x416, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe697c02c  ! 270: LDUHA_R	lduha	[%r31, %r12] 0x01, %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0x2a341b28a0141cbd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e828cf  ! 273: PREFETCHA_I	prefetcha	[%r0, + 0x08cf] %asi, #one_read
	.word 0xab84c003  ! 274: WR_CLEAR_SOFTINT_R	wr	%r19, %r3, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e010  ! 276: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_2_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d920011  ! 278: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
memptr_2_174:
	set user_data_start, %r31
	.word 0x858170f3  ! 279: WRCCR_I	wr	%r5, 0x10f3, %ccr
	.word 0x8d902895  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_176:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 281: RDPC	rd	%pc, %r12
	.word 0xa3520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 283: RDPC	rd	%pc, %r20
fpinit_2_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8236b  ! 284: PREFETCHA_I	prefetcha	[%r0, + 0x036b] %asi, #one_read
	setx 0x1b1ad47c07c9f648, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_2_180:
	tsubcctv %r0, 0x15ca, %r19
	.word 0xd007e043  ! 286: LDUW_I	lduw	[%r31 + 0x0043], %r8
debug_2_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_181:
	mov 0x720, %r20
	mov 0x0, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x20,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd097c025  ! 287: LDUHA_R	lduha	[%r31, %r5] 0x01, %r8
DS_2_182:
	.word 0x97a509d1  ! 1: FDIVd	fdivd	%f20, %f48, %f42
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_184:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0xa9b4c4c2  ! 293: FCMPNE32	fcmpne32	%d50, %d2, %r20
tagged_2_186:
	tsubcctv %r6, 0x10cd, %r20
	.word 0xe607e019  ! 294: LDUW_I	lduw	[%r31 + 0x0019], %r19
	setx 0x5c8463dae1f7fbb5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5b047f1  ! 296: PDISTN	fmean16	%d32, %d48, %d18
intveclr_2_188:
	setx 0x1b8ccee562b4392f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_2_190:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_2_191:
	setx 0xc2b7d3cb33652a78, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_2_192:
	setx 0xcc55f604118fe001, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_2_193:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7818005  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r5, %-
	.word 0x99a00172  ! 305: FABSq	dis not found

pmu_2_194:
	nop
	setx 0xfffff7b8fffff05b, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b4  ! 307: Tcc_I	tne	icc_or_xcc, %r0 + 180
memptr_2_195:
	set user_data_start, %r31
	.word 0x858477fc  ! 308: WRCCR_I	wr	%r17, 0x17fc, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 309: RDPC	rd	%pc, %r18
	.word 0xa1450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r16
pmu_2_197:
	nop
	setx 0xfffff8dbfffffa80, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 312: RDPC	rd	%pc, %r19
	.word 0xa3520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_200) + 40, 16, 16)) -> intp(6,0,27)
intvec_2_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_201:
	setx 0x3a3d878d2f5f448b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_2_202-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_202:
	.word 0x9194c013  ! 317: WRPR_PIL_R	wrpr	%r19, %r19, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_2_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_203:
	mov 0xd76, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2bfc034  ! 319: STDA_R	stda	%r17, [%r31 + %r20] 0x01
donret_2_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_204-donret_2_204-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00473c63 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x28f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	retry
donretarg_2_204:
	.word 0xe2ffe044  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x0044] %asi
	.word 0xc36cac82  ! 321: PREFETCH_I	prefetch	[%r18 + 0x0c82], #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_206)+24, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_206:
	.word 0xa984bc7e  ! 322: WR_SET_SOFTINT_I	wr	%r18, 0x1c7e, %set_softint
	.word 0x95a0c9d4  ! 323: FDIVd	fdivd	%f34, %f20, %f10
mondo_2_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94400a  ! 324: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	setx 0x93ea025787b15e8e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c014  ! 326: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_212) + 0, 16, 16)) -> intp(3,0,12)
intvec_2_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_2_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 330: FDIVs	fdivs	%f0, %f4, %f4
DS_2_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f18, %f10
	.word 0x9bb30300  ! 331: ALIGNADDRESS	alignaddr	%r12, %r0, %r13
	.word 0xd49fd140  ! 332: LDDA_R	ldda	[%r31, %r0] 0x8a, %r10
intveclr_2_215:
	setx 0xf339505f9f1961b5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_216-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_216:
	.word 0x91924014  ! 334: WRPR_PIL_R	wrpr	%r9, %r20, %pil
change_to_randtl_2_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_217:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0xc16, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b147ed  ! 336: PDISTN	fmean16	%d36, %d44, %d40
memptr_2_218:
	set 0x60740000, %r31
	.word 0x8584e5a6  ! 337: WRCCR_I	wr	%r19, 0x05a6, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_2_220:
	setx 0xea58228e179c97eb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_2_221:
	taddcctv %r2, 0x1995, %r12
	.word 0xe807e0dc  ! 340: LDUW_I	lduw	[%r31 + 0x00dc], %r20
	.word 0x9f802afa  ! 341: SIR	sir	0x0afa
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95a00167  ! 343: FABSq	dis not found

	.word 0x95a509d1  ! 344: FDIVd	fdivd	%f20, %f48, %f10
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
    set (0x00c1d833 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x457, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_222:
	.word 0xe2ffe090  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x0090] %asi
	.word 0xc187e0e0  ! 346: LDFA_I	lda	[%r31, 0x00e0], %f0
	rd %pc, %r19
	add %r19, (ivw_2_223-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_223:
	.word 0x91920001  ! 347: WRPR_PIL_R	wrpr	%r8, %r1, %pil
cwp_2_224:
    set user_data_start, %o7
	.word 0x93902001  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa5a409a7  ! 349: FDIVs	fdivs	%f16, %f7, %f18
DS_2_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe731ef03  ! 1: STQF_I	-	%f19, [0x0f03, %r7]
	normalw
	.word 0xa3458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r17
pmu_2_226:
	nop
	setx 0xfffffb33fffff833, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_2_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f22, %f24, %f8
	.word 0xa1b4c30c  ! 352: ALIGNADDRESS	alignaddr	%r19, %r12, %r16
splash_hpstate_2_228:
	.word 0x819821e6  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01e6, %hpstate
splash_cmpr_2_229:
	setx 0x50153cf49bca5c9e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a509c2  ! 355: FDIVd	fdivd	%f20, %f2, %f48
memptr_2_230:
	set 0x60540000, %r31
	.word 0x85833d33  ! 356: WRCCR_I	wr	%r12, 0x1d33, %ccr
	.word 0x9ba00173  ! 357: FABSq	dis not found

DS_2_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_2_232:
	nop
	setx 0xffffff9cfffff048, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2ecd0001  ! 1: BRGEZ	brgez,a,pt	%r20,<label_0xd0001>
	.word 0x8d9021aa  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x01aa, %pstate
fpinit_2_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 362: FDIVd	fdivd	%f0, %f4, %f4
	.word 0xe927e050  ! 363: STF_I	st	%f20, [0x0050, %r31]
fpinit_2_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 364: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91d02035  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_2_236:
	setx 0xe074171c57451751, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_237:
	set user_data_start, %r31
	.word 0x8584a223  ! 367: WRCCR_I	wr	%r18, 0x0223, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_238) + 8, 16, 16)) -> intp(2,0,17)
intvec_2_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_239:
	nop
	setx 0xfffffa44fffffbe6, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_240:
	set 0x5b061c4d, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0x7b50b5bc7493015b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_242-donret_2_242-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0066df9e | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfde, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	retry
donretarg_2_242:
	.word 0xe8ffe030  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x0030] %asi
pmu_2_243:
	nop
	setx 0xfffffdf7fffff1ae, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe8800c20  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r20
	.word 0x97a00173  ! 376: FABSq	dis not found

	.word 0xab81bbbf  ! 377: WR_CLEAR_SOFTINT_I	wr	%r6, 0x1bbf, %clear_softint
jmptr_2_244:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_2_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 379: FCMPLE32	fcmple32	%d0, %d4, %r4
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 380: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_2_246:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_2_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_247:
	mov 0x575, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc033  ! 382: LDXA_R	ldxa	[%r31, %r19] 0x01, %r17
donret_2_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_248-donret_2_248-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0094363b | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x947, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_248:
	.word 0xe2ffe048  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x0048] %asi
DS_2_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_2_250:
	tsubcctv %r8, 0x11a8, %r2
	.word 0xe207e06c  ! 385: LDUW_I	lduw	[%r31 + 0x006c], %r17
pmu_2_251:
	nop
	setx 0xfffffe09ffffff0b, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_2_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 387: FCMPLE32	fcmple32	%d0, %d4, %r8
splash_decr_2_253:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa7848006  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r6, %-
splash_cmpr_2_254:
	setx 0xbd85e50a201ac08b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_2_255:
	set user_data_start, %r31
	.word 0x85837d95  ! 390: WRCCR_I	wr	%r13, 0x1d95, %ccr
splash_lsu_2_256:
	set 0x5a096c13, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5a089c3  ! 392: FDIVd	fdivd	%f2, %f34, %f18
mondo_2_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d918011  ! 393: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xc1bfc2c0  ! 395: STDFA_R	stda	%f0, [%r0, %r31]
donret_2_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_260-donret_2_260-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00a0b979 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 23, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_260:
	.word 0xe0ffe02b  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x002b] %asi
	.word 0x87ac4a51  ! 397: FCMPd	fcmpd	%fcc<n>, %f48, %f48
intveclr_2_262:
	setx 0x934d2e1ee885c9c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_2_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe732ea0d  ! 1: STQF_I	-	%f19, [0x0a0d, %r11]
	normalw
	.word 0x97458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r11
DS_2_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_2_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d92c012  ! 402: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
	.word 0x95a00174  ! 403: FABSq	dis not found

mondo_2_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 404: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_267:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 405: RDPC	rd	%pc, %r11
mondo_2_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d948014  ! 406: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0x93540000  ! 407: RDPR_GL	<illegal instruction>
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
    set (0x00a3f81a | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x81d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_2_269:
	.word 0xe4ffe09c  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x009c] %asi
	.word 0x99902003  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_270:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 410: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 411: RDPC	rd	%pc, %r18
	.word 0x91d02034  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1b447e8  ! 413: PDISTN	fmean16	%d48, %d8, %d16
splash_cmpr_2_272:
	setx 0x34ab18a65f6406d5, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_273-donret_2_273-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00682e71 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x49e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	done
donretarg_2_273:
	.word 0xe0ffe02c  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x002c] %asi
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_274:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 416: RDPC	rd	%pc, %r12
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_2_275:
	set 0x60340000, %r31
	.word 0x8584b817  ! 418: WRCCR_I	wr	%r18, 0x1817, %ccr
splash_hpstate_2_276:
	.word 0x819829e5  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09e5, %hpstate
intveclr_2_277:
	setx 0xd8662e32c7238c51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_278:
	mov 0xb7b, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe11fc011  ! 421: LDDF_R	ldd	[%r31, %r17], %f16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_279:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 422: RDPC	rd	%pc, %r20
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x83d02033  ! 424: Tcc_I	te	icc_or_xcc, %r0 + 51
intveclr_2_280:
	setx 0xe1f77351b7ac2dde, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_281)+48, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_281:
	.word 0xa98230b8  ! 426: WR_SET_SOFTINT_I	wr	%r8, 0x10b8, %set_softint
	.word 0xc187db60  ! 427: LDFA_R	lda	[%r31, %r0], %f0
donret_2_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_282-donret_2_282-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002f428b | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa44, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_282:
	.word 0xd4ffe09e  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x009e] %asi
	.word 0x91d020b3  ! 429: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87ac0a46  ! 430: FCMPd	fcmpd	%fcc<n>, %f16, %f6
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 432: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802ff6  ! 433: SIR	sir	0x0ff6
pmu_2_284:
	nop
	setx 0xfffffbedfffff0ba, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe038  ! 435: LDUBA_I	lduba	[%r31, + 0x0038] %asi, %r19
debug_2_285:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc011  ! 436: LDDF_R	ldd	[%r31, %r17], %f19
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_2_286:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_2_287:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x97500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 442: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_2_290:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_2_291:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe010  ! 446: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	rd %pc, %r19
	add %r19, (ivw_2_292-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_292:
	.word 0x91950000  ! 447: WRPR_PIL_R	wrpr	%r20, %r0, %pil
splash_cmpr_2_293:
	setx 0x857f2daf8d2f1d4d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_294:
	setx 0x88541a8a590b6d4e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_295:
	setx 0xe0cf363ad26190b7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e020  ! 451: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	.word 0x93d020b4  ! 452: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_hpstate_2_296:
	.word 0x8198218d  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_298) + 0, 16, 16)) -> intp(5,0,31)
intvec_2_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0x8284dd32cbe6626a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a4c9c1  ! 458: FDIVd	fdivd	%f50, %f32, %f42
	ta	T_CHANGE_NONPRIV	! macro
	rd %pc, %r19
	add %r19, (ivw_2_300-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_300:
	.word 0x91944011  ! 460: WRPR_PIL_R	wrpr	%r17, %r17, %pil
DS_2_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
jmptr_2_302:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_2_303:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe097c031  ! 463: LDUHA_R	lduha	[%r31, %r17] 0x01, %r16
pmu_2_304:
	nop
	setx 0xfffffaeefffff05c, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_305:
	nop
	setx 0xfffff27ffffff5dc, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_306:
	setx 0xe3d69439c50dbc72, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a349c8  ! 467: FDIVd	fdivd	%f44, %f8, %f20
    set 0x1d7d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507e4  ! 468: PDISTN	fmean16	%d20, %d4, %d40
	.word 0xa7a00161  ! 469: FABSq	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xc1bfde00  ! 471: STDFA_R	stda	%f0, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_308) + 16, 16, 16)) -> intp(1,0,23)
intvec_2_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd937e04a  ! 474: STQF_I	-	%f12, [0x004a, %r31]
tagged_2_309:
	taddcctv %r9, 0x1088, %r18
	.word 0xd807e025  ! 475: LDUW_I	lduw	[%r31 + 0x0025], %r12
	.word 0x87a9ca45  ! 476: FCMPd	fcmpd	%fcc<n>, %f38, %f36
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_2_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d930013  ! 478: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
	.word 0x97a00171  ! 479: FABSq	dis not found

	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_313:
	setx 0xe9a42c964e7a78ec, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_2_314:
	setx 0x9e783e3f556e5ba9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
invtsb_2_315:
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
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_2_317:
	taddcctv %r11, 0x19f6, %r12
	.word 0xe407e064  ! 485: LDUW_I	lduw	[%r31 + 0x0064], %r18
donret_2_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_318-donret_2_318-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ff0cfe | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfc6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_318:
	.word 0xe4ffe0b0  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x00b0] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0xa3464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0xa7b4c7f2  ! 489: PDISTN	fmean16	%d50, %d18, %d50
	.word 0x8d9036a2  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x16a2, %pstate
	.word 0xe62fe097  ! 491: STB_I	stb	%r19, [%r31 + 0x0097]
splash_htba_2_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_321:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 493: RDPC	rd	%pc, %r11
	.word 0xad82b4eb  ! 494: WR_SOFTINT_REG_I	wr	%r10, 0x14eb, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f802808  ! 496: SIR	sir	0x0808
	.word 0xa1a509c3  ! 497: FDIVd	fdivd	%f20, %f34, %f16
jmptr_2_322:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_2_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d900008  ! 500: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0xd86fe0a4  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x00a4]
	.word 0x9f803675  ! 502: SIR	sir	0x1675
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_324) + 16, 16, 16)) -> intp(0,0,21)
intvec_2_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_325:
	nop
	setx 0xfffff7f5fffffb22, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x97a00173  ! 506: FABSq	dis not found

splash_lsu_2_327:
	set 0xe208f07c, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87acca45  ! 508: FCMPd	fcmpd	%fcc<n>, %f50, %f36
	.word 0xe83fe023  ! 509: STD_I	std	%r20, [%r31 + 0x0023]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_329:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 510: RDPC	rd	%pc, %r17
	.word 0xe187e040  ! 511: LDFA_I	lda	[%r31, 0x0040], %f16
intveclr_2_330:
	setx 0xba674efff7bb8368, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_331:
	.word 0x81982c85  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c85, %hpstate
DS_2_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd532c010  ! 1: STQF_R	-	%f10, [%r16, %r11]
	normalw
	.word 0x99458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_333:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 515: RDPC	rd	%pc, %r18
jmptr_2_334:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe024  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x0024]
splash_tba_2_335:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x87aa0a50  ! 519: FCMPd	fcmpd	%fcc<n>, %f8, %f16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_336:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 520: RDPC	rd	%pc, %r20
intveclr_2_337:
	setx 0x561d2116c1ef25e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r17
mondo_2_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d908014  ! 523: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
intveclr_2_339:
	setx 0xc35b46538098ec58, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d940014  ! 525: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
splash_hpstate_2_341:
	.word 0x2ccc8001  ! 1: BRGZ	brgz,a,pt	%r18,<label_0xc8001>
	.word 0x81982405  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
	.word 0xe26fe0a2  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x00a2]
splash_lsu_2_342:
	set 0x8bdb56f9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd9e1c02a  ! 529: CASA_I	casa	[%r7] 0x 1, %r10, %r12
tagged_2_344:
	tsubcctv %r16, 0x1331, %r18
	.word 0xd807e012  ! 530: LDUW_I	lduw	[%r31 + 0x0012], %r12
	.word 0xd8cfe038  ! 531: LDSBA_I	ldsba	[%r31, + 0x0038] %asi, %r12
pmu_2_345:
	nop
	setx 0xfffffa9cfffff82a, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e000  ! 533: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_2_346:
	setx 0xf91cf9d2eb906dee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_347:
	setx 0xd00047e4b9a9e06e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfda00  ! 537: STDFA_R	stda	%f16, [%r0, %r31]
donret_2_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_348-donret_2_348-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00342a15 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x817, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_348:
	.word 0xd8ffe0ed  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x00ed] %asi
	.word 0xe1bfdb60  ! 539: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa9840007  ! 540: WR_SET_SOFTINT_R	wr	%r16, %r7, %set_softint
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 541: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f8033dd  ! 542: SIR	sir	0x13dd
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_2_349:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_2_350:
	set 0x80e08f74, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fd000  ! 546: LDDA_R	ldda	[%r31, %r0] 0x80, %r12
intveclr_2_351:
	setx 0x0272f85cd1ab8eec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_2_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 548: FDIVs	fdivs	%f0, %f4, %f6
intveclr_2_353:
	setx 0x0f36f7b5df1c7823, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 550: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_354:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 551: RDPC	rd	%pc, %r8
	setx 0x5e616455db37192b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_358) + 16, 16, 16)) -> intp(6,0,18)
intvec_2_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xedccb0d7623b983d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd71fe018  ! 559: LDDF_I	ldd	[%r31, 0x0018], %f11
mondo_2_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d944005  ! 560: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
intveclr_2_361:
	setx 0xcf0cc23c5de11d4a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_362:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 562: RDPC	rd	%pc, %r19
splash_tba_2_363:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_2_364:
	setx 0xc349114939f485c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0xa3a309d3  ! 566: FDIVd	fdivd	%f12, %f50, %f48
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 568: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_2_366:
	nop
	setx 0xfffff52ffffffbf0, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_367:
	setx 0x521242d080d5582d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_369:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 572: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_2_370-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_370:
	.word 0x91924010  ! 573: WRPR_PIL_R	wrpr	%r9, %r16, %pil
mondo_2_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d918007  ! 574: WRPR_WSTATE_R	wrpr	%r6, %r7, %wstate
mondo_2_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d950011  ! 575: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
DS_2_373:
	.word 0xa3a209c6  ! 1: FDIVd	fdivd	%f8, %f6, %f48
	pdist %f28, %f28, %f20
	.word 0xa5b50313  ! 576: ALIGNADDRESS	alignaddr	%r20, %r19, %r18
	.word 0xa3b50490  ! 577: FCMPLE32	fcmple32	%d20, %d16, %r17
debug_2_375:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd8bfc032  ! 578: STDA_R	stda	%r12, [%r31 + %r18] 0x01
splash_hpstate_2_376:
	.word 0x81982504  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0504, %hpstate
	.word 0xe187e080  ! 580: LDFA_I	lda	[%r31, 0x0080], %f16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_377:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 581: RDPC	rd	%pc, %r17
mondo_2_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91c010  ! 582: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
intveclr_2_379:
	setx 0x40acb7b19988ce02, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_2_381:
	set 0x717748af, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 586: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_2_383:
	taddcctv %r4, 0x10cf, %r19
	.word 0xd807e050  ! 587: LDUW_I	lduw	[%r31 + 0x0050], %r12
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_384:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 588: RDPC	rd	%pc, %r10
	.word 0xa3a449d2  ! 589: FDIVd	fdivd	%f48, %f18, %f48
pmu_2_385:
	nop
	setx 0xfffff963ffffff5d, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_2_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f28, %f14
	.word 0x97b40307  ! 591: ALIGNADDRESS	alignaddr	%r16, %r7, %r11
jmptr_2_387:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91d020b5  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_2_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_2_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83e44  ! 595: PREFETCHA_I	prefetcha	[%r0, + 0xfffffe44] %asi, #one_read
splash_hpstate_2_390:
	.word 0x81982ead  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ead, %hpstate
	.word 0x8d903989  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x1989, %pstate
cwp_2_392:
    set user_data_start, %o7
	.word 0x93902007  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99b404d0  ! 599: FCMPNE32	fcmpne32	%d16, %d16, %r12
donret_2_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_394-donret_2_394-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00396ee0 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x205, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_394:
	.word 0xd8ffe070  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x0070] %asi
	.word 0x87ad0a4c  ! 601: FCMPd	fcmpd	%fcc<n>, %f20, %f12
mondo_2_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d930011  ! 602: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
jmptr_2_396:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_2_397:
	setx 0xfcb858511aafd090, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_398:
	nop
	setx 0xfffffda6fffffeba, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_2_399:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe51fc010  ! 606: LDDF_R	ldd	[%r31, %r16], %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_400)+32, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_400:
	.word 0xa9843d7d  ! 607: WR_SET_SOFTINT_I	wr	%r16, 0x1d7d, %set_softint
	rd %pc, %r19
	add %r19, (ivw_2_401-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_401:
	.word 0x9190c010  ! 608: WRPR_PIL_R	wrpr	%r3, %r16, %pil
	.word 0x9f802f97  ! 609: SIR	sir	0x0f97
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_402) + 16, 16, 16)) -> intp(0,0,9)
intvec_2_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_2_403:
	set 0x60340000, %r31
	.word 0x8584f73d  ! 611: WRCCR_I	wr	%r19, 0x173d, %ccr
	.word 0xe46fe09f  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x009f]
cwp_2_404:
    set user_data_start, %o7
	.word 0x93902001  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_405)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_405:
	.word 0xa9817323  ! 614: WR_SET_SOFTINT_I	wr	%r5, 0x1323, %set_softint
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f5c  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x0f5c, %pstate
mondo_2_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d934007  ! 616: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
debug_2_408:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe53fc013  ! 617: STDF_R	std	%f18, [%r19, %r31]
pmu_2_409:
	nop
	setx 0xfffff957ffffff47, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_410:
	setx 0xf6708db0ffbb8454, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b500000  ! 620: RDPR_TPC	<illegal instruction>
	setx 0x2af4f47a456f88fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5b507e6  ! 622: PDISTN	fmean16	%d20, %d6, %d18
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e03c  ! 624: STF_I	st	%f19, [0x003c, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_2_413:
	nop
	setx 0xfffff3fcfffff60f, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_414-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_414:
	.word 0x9190800d  ! 627: WRPR_PIL_R	wrpr	%r2, %r13, %pil
	.word 0x91942abc  ! 628: WRPR_PIL_I	wrpr	%r16, 0x0abc, %pil
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_415:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 629: RDPC	rd	%pc, %r11
change_to_randtl_2_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_416:
	.word 0x8f902001  ! 630: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 632: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_2_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 635: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xa9464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r20
donret_2_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_420-donret_2_420-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005454c8 | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x387, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x2acd0001  ! 1: BRNZ	brnz,a,pt	%r20,<label_0xd0001>
	retry
donretarg_2_420:
	.word 0xd6ffe0cc  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x00cc] %asi
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_421:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 638: RDPC	rd	%pc, %r8
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_2_422-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_422:
	.word 0x9192c013  ! 640: WRPR_PIL_R	wrpr	%r11, %r19, %pil
splash_cmpr_2_423:
	setx 0x66b64b43454cebe4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_2_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_424-donret_2_424-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e6f517 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x217, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	retry
donretarg_2_424:
	.word 0xe0ffe0b0  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x00b0] %asi
	.word 0xa7a00163  ! 643: FABSq	dis not found

memptr_2_425:
	set 0x60340000, %r31
	.word 0x8584b729  ! 644: WRCCR_I	wr	%r18, 0x1729, %ccr
	.word 0xe48fe030  ! 645: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
splash_cmpr_2_426:
	setx 0x55a4d7f7f2502a05, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xef7f88ef22f36af9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_2_428:
	nop
	setx 0xfffff22efffff102, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e018  ! 650: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r18
	.word 0xe46fe0b7  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x00b7]
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a00170  ! 653: FABSq	dis not found

	.word 0xe68008a0  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_lsu_2_429:
	set 0x03bc90af, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3540000  ! 656: RDPR_GL	<illegal instruction>
	.word 0x9f803655  ! 657: SIR	sir	0x1655
	.word 0xd7e4002b  ! 658: CASA_I	casa	[%r16] 0x 1, %r11, %r11
	rd %pc, %r19
	add %r19, (ivw_2_431-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_431:
	.word 0x9190c001  ! 659: WRPR_PIL_R	wrpr	%r3, %r1, %pil
DS_2_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdd47c2e1	! Random illegal ?
	.word 0x93a00554  ! 1: FSQRTd	fsqrt	
	.word 0xa1a4882d  ! 660: FADDs	fadds	%f18, %f13, %f16
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 662: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_2_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_433-donret_2_433-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00babe35 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_433:
	.word 0xd8ffe036  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x0036] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_2_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd934f8fb  ! 1: STQF_I	-	%f12, [0x18fb, %r19]
	normalw
	.word 0xa5458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r18
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_436:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 666: RDPC	rd	%pc, %r16
splash_htba_2_437:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_438)+24, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_438:
	.word 0xa984e944  ! 668: WR_SET_SOFTINT_I	wr	%r19, 0x0944, %set_softint
pmu_2_439:
	nop
	setx 0xfffff1f4fffffb78, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x87aa4a52  ! 670: FCMPd	fcmpd	%fcc<n>, %f40, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_440) + 48, 16, 16)) -> intp(1,0,20)
intvec_2_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_2_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x26cac001  ! 1: BRLZ	brlz,a,pt	%r11,<label_0xac001>
	.word 0x8d9027b8  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x07b8, %pstate
splash_hpstate_2_443:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982807  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
pmu_2_444:
	nop
	setx 0xfffff5f4fffff962, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_decr_2_445:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa781c014  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r20, %-
	.word 0xda77e0d0  ! 678: STX_I	stx	%r13, [%r31 + 0x00d0]
jmptr_2_446:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f802887  ! 680: SIR	sir	0x0887
DS_2_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x97a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xa3a4c821  ! 681: FADDs	fadds	%f19, %f1, %f17
	.word 0xda37e068  ! 682: STH_I	sth	%r13, [%r31 + 0x0068]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_448:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 683: RDPC	rd	%pc, %r9
pmu_2_449:
	nop
	setx 0xfffff91bfffff83f, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_450:
	set 0xc267a227, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x038a319f94476647, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_452:
	setx 0x1a9bb408873e12a4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_2_454:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x81982255  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0255, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_2_455:
	setx 0x842555fd895e6cd2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e020  ! 692: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
splash_lsu_2_456:
	set 0x6969304a, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab846fb0  ! 694: WR_CLEAR_SOFTINT_I	wr	%r17, 0x0fb0, %clear_softint
memptr_2_457:
	set 0x60540000, %r31
	.word 0x85843014  ! 695: WRCCR_I	wr	%r16, 0x1014, %ccr
splash_cmpr_2_458:
	setx 0x1ee31230a9b34904, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_decr_2_460:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa783000b  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r11, %-
	rd %pc, %r19
	add %r19, (ivw_2_461-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_461:
	.word 0x91928000  ! 700: WRPR_PIL_R	wrpr	%r10, %r0, %pil
	.word 0x99454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0xa5a00161  ! 1: FABSq	dis not found

	.word 0xe187e060  ! 2: LDFA_I	lda	[%r31, 0x0060], %f16
	.word 0x9ba00162  ! 3: FABSq	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_0
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_0:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e002  ! 4: CASA_R	casa	[%r31] %asi, %r2, %r13
	brnz,pn  	%r7, skip_1_1
	fbne,a,pn	%fcc0,  skip_1_1
.align 1024
skip_1_1:
	.word 0xd3e40030  ! 5: CASA_I	casa	[%r16] 0x 1, %r16, %r9
pmu_1_2:
	nop
	setx 0xfffff89efffff99c, %g1, %g7
	.word 0xa3800007  ! 6: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe0ed  ! 7: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ed]
donret_1_3:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_3-donret_1_3-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ed57d8 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc9e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_3:
	.word 0xd2ffe031  ! 8: SWAPA_I	swapa	%r9, [%r31 + 0x0031] %asi
jmptr_1_4:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 9: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd29fe038  ! 10: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r9
	.word 0xa3a00165  ! 11: FABSq	dis not found

DS_1_5:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 12: SAVE_R	save	%r31, %r0, %r31
	.word 0x97480000  ! 13: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xa5480000  ! 14: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_1_6:
	setx 0xae2c50f708d812cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 16: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe497e008  ! 17: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r18
	.word 0xe4dfe000  ! 18: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
DS_1_7:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1348011  ! 1: STQF_R	-	%f8, [%r17, %r18]
	normalw
	.word 0xa9458000  ! 19: RD_SOFTINT_REG	rd	%softint, %r20
intveclr_1_8:
	setx 0x14a465b4b865235e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 20: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_9:
	nop
	setx 0xffffff68fffffce2, %g1, %g7
	.word 0xa3800007  ! 21: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c700001  ! 22: BPNEG	<illegal instruction>
	.word 0xe877e06c  ! 23: STX_I	stx	%r20, [%r31 + 0x006c]
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 24: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9a0016c  ! 25: FABSq	dis not found

intveclr_1_10:
	setx 0xcbf5a64e1644336c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 26: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_11:
	.word 0x8198294e  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
splash_tba_1_12:
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 28: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	setx 0x3b1a265555e24e9d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_13:
	.word 0x39400001  ! 29: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_14:
	ta	T_CHANGE_NONHPRIV	! macro
pmu_1_15:
	nop
	setx 0xfffff60dfffff43a, %g1, %g7
	.word 0xa3800007  ! 31: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	brz,a,pt	%r18, skip_1_16
	.word 0x91b304cb  ! 1: FCMPNE32	fcmpne32	%d12, %d42, %r8
.align 1024
skip_1_16:
	.word 0x99b4c4d1  ! 32: FCMPNE32	fcmpne32	%d50, %d48, %r12
splash_cmpr_1_17:
	setx 0x53dc910d0292e156, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_htba_1_18:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 34: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
mondo_1_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d950012  ! 35: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0x9b500000  ! 36: RDPR_TPC	<illegal instruction>
jmptr_1_20:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 37: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_1_21:
	setx 0x40f44147992411ff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 38: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80270d  ! 39: SIR	sir	0x070d
	.word 0xda47c000  ! 40: LDSW_R	ldsw	[%r31 + %r0], %r13
cmp_1_22:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_22:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_22
    nop
cmp_wait1_22:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_22
    nop
    ba,a cmp_startwait1_22
continue_cmp_1_22:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 40, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924014  ! 41: WRPR_PIL_R	wrpr	%r9, %r20, %pil
	.word 0x97a00164  ! 42: FABSq	dis not found

DS_1_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x91a4c9c4  ! 1: FDIVd	fdivd	%f50, %f4, %f8
	.word 0x93a28827  ! 43: FADDs	fadds	%f10, %f7, %f9
	.word 0xd21fc000  ! 44: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x97a289c7  ! 45: FDIVd	fdivd	%f10, %f38, %f42
	be  	 skip_1_24
	.word 0xe4390013  ! 1: STD_R	std	%r18, [%r4 + %r19]
.align 2048
skip_1_24:
	.word 0xe3e40032  ! 46: CASA_I	casa	[%r16] 0x 1, %r18, %r17
donret_1_25:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_25-donret_1_25-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000fc828 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf07, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_25:
	.word 0xe2ffe0de  ! 47: SWAPA_I	swapa	%r17, [%r31 + 0x00de] %asi
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 48: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe26fe0f2  ! 49: LDSTUB_I	ldstub	%r17, [%r31 + 0x00f2]
	.word 0xe26fe08e  ! 50: LDSTUB_I	ldstub	%r17, [%r31 + 0x008e]
	.word 0xe257c000  ! 51: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0xc1bfe0e0  ! 52: STDFA_I	stda	%f0, [0x00e0, %r31]
tagged_1_26:
	tsubcctv %r20, 0x18be, %r19
	.word 0xe207e07c  ! 53: LDUW_I	lduw	[%r31 + 0x007c], %r17
cmp_1_27:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_27:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_27
    nop
cmp_wait1_27:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_27
    nop
    ba,a cmp_startwait1_27
continue_cmp_1_27:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x9e, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924014  ! 54: WRPR_PIL_R	wrpr	%r9, %r20, %pil
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_28
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_28:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 55: CASA_R	casa	[%r31] %asi, %r20, %r17
	.word 0x9f8023ad  ! 56: SIR	sir	0x03ad
splash_hpstate_1_29:
	.word 0x2ac90001  ! 1: BRNZ	brnz,a,pt	%r4,<label_0x90001>
	.word 0x81982214  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
	.word 0xe277e099  ! 58: STX_I	stx	%r17, [%r31 + 0x0099]
debug_1_30:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_30:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_30
    nop
debug_wait1_30:
    ld [%r23], %r16
    brnz %r16, debug_wait1_30
    nop
    ba,a debug_startwait1_30
continue_debug_1_30:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_30:
    cmp %r13, %r17
    bne,a wait_for_stat_1_30
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_30:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_30
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005089c0042a,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe297c034  ! 59: LDUHA_R	lduha	[%r31, %r20] 0x01, %r17
jmptr_1_31:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 60: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe26fe0fd  ! 61: LDSTUB_I	ldstub	%r17, [%r31 + 0x00fd]
cmp_1_32:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_32:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_32
    nop
cmp_wait1_32:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_32
    nop
    ba,a cmp_startwait1_32
continue_cmp_1_32:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x62, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91918012  ! 62: WRPR_PIL_R	wrpr	%r6, %r18, %pil
	.word 0x91d02033  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xad8539a1  ! 64: WR_SOFTINT_REG_I	wr	%r20, 0x19a1, %softint
intveclr_1_33:
	setx 0xa74df9cc3e720718, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d903d36  ! 66: WRPR_PSTATE_I	wrpr	%r0, 0x1d36, %pstate
	.word 0xc187da00  ! 67: LDFA_R	lda	[%r31, %r0], %f0
	.word 0x99520000  ! 68: RDPR_PIL	rdpr	%pil, %r12
	.word 0xd8800c00  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
splash_cmpr_1_35:
	setx 0xcc8d1a350ee3e62e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 70: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_36:
	set user_data_start, %r31
	.word 0x8584a2f4  ! 71: WRCCR_I	wr	%r18, 0x02f4, %ccr
cmp_1_37:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_37:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_37
    nop
cmp_wait1_37:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_37
    nop
    ba,a cmp_startwait1_37
continue_cmp_1_37:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 20, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950012  ! 72: WRPR_PIL_R	wrpr	%r20, %r18, %pil
intveclr_1_38:
	setx 0x8cfaae7b4f47c8ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 73: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a449d4  ! 74: FDIVd	fdivd	%f48, %f20, %f8
	.word 0xa9a00173  ! 75: FABSq	dis not found

DS_1_39:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 76: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b4  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 180
pmu_1_40:
	nop
	setx 0xfffff5cafffff37c, %g1, %g7
	.word 0xa3800007  ! 78: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026f5  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x06f5, %pstate
	.word 0xe937c000  ! 80: STQF_R	-	%f20, [%r0, %r31]
splash_cmpr_1_42:
	setx 0x024c21f5de8ee62c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 81: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_43:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_43-donret_1_43-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fe422a | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7c4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_43:
	.word 0xe8ffe0ac  ! 82: SWAPA_I	swapa	%r20, [%r31 + 0x00ac] %asi
debug_1_44:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_44:
	mov 0xe9d, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe9e7e013  ! 83: CASA_R	casa	[%r31] %asi, %r19, %r20
splash_htba_1_45:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 84: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_1_46:
	setx 0x58af0a57e8406608, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 85: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99454000  ! 86: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
	.word 0xe1bfe0c0  ! 87: STDFA_I	stda	%f16, [0x00c0, %r31]
	.word 0xa782e3b0  ! 88: WR_GRAPHICS_STATUS_REG_I	wr	%r11, 0x03b0, %-
	setx 0x55b3b01161cd33db, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_47:
	.word 0x39400001  ! 89: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_48:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d940001  ! 90: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
donret_1_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_49-donret_1_49-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00093f33 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x144, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x26c8c001  ! 1: BRLZ	brlz,a,pt	%r3,<label_0x8c001>
	done
donretarg_1_49:
	.word 0xd8ffe018  ! 91: SWAPA_I	swapa	%r12, [%r31 + 0x0018] %asi
DS_1_50:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 92: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x95a00164  ! 93: FABSq	dis not found

	.word 0xd46fe0e0  ! 94: LDSTUB_I	ldstub	%r10, [%r31 + 0x00e0]
debug_1_51:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_51:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_51
    nop
debug_wait1_51:
    ld [%r23], %r16
    brnz %r16, debug_wait1_51
    nop
    ba,a debug_startwait1_51
continue_debug_1_51:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_51:
    cmp %r13, %r17
    bne,a wait_for_stat_1_51
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_51:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_51
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000502bc42a42,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd53fc004  ! 95: STDF_R	std	%f10, [%r4, %r31]
	.word 0x34700001  ! 96: BPG	<illegal instruction>
	.word 0x9345c000  ! 97: RD_TICK_CMPR_REG	rd	%-, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_52) + 24, 16, 16)) -> intp(4,0,20)
intvec_1_52:
	.word 0x39400001  ! 98: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 99: SAVE_R	save	%r31, %r0, %r31
cmp_1_54:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_54:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_54
    nop
cmp_wait1_54:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_54
    nop
    ba,a cmp_startwait1_54
continue_cmp_1_54:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x4a, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91924000  ! 100: WRPR_PIL_R	wrpr	%r9, %r0, %pil
DS_1_55:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5140010  ! 1: LDQF_R	-	[%r16, %r16], %f18
	.word 0xa9a00830  ! 101: FADDs	fadds	%f0, %f16, %f20
DS_1_56:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x95454fbb	! Random illegal ?
	.word 0xa3a00553  ! 1: FSQRTd	fsqrt	
	.word 0x93a4082a  ! 102: FADDs	fadds	%f16, %f10, %f9
	.word 0xd327e023  ! 103: STF_I	st	%f9, [0x0023, %r31]
	.word 0x32700001  ! 104: BPNE	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_57
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_57:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 105: CASA_R	casa	[%r31] %asi, %r10, %r9
mondo_1_58:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944007  ! 106: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	setx 0xf28bce7f014defa8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_59:
	.word 0x39400001  ! 107: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd327c000  ! 108: STF_R	st	%f9, [%r0, %r31]
	.word 0xd28008a0  ! 109: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
DS_1_60:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 110: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x28800001  ! 111: BLEU	bleu,a	<label_0x1>
intveclr_1_61:
	setx 0x31ba731b36b4f361, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 112: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_62:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 113: SAVE_R	save	%r31, %r0, %r31
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_63
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_63:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e007  ! 114: CASA_R	casa	[%r31] %asi, %r7, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_64
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_64
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_64:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 115: RDPC	rd	%pc, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_65:
	ta	T_CHANGE_NONHPRIV	! macro
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_66) + 8, 16, 16)) -> intp(2,0,0)
intvec_1_66:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_67:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_67:
	mov 0x6dc, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe53fc007  ! 118: STDF_R	std	%f18, [%r7, %r31]
intveclr_1_68:
	setx 0xb34db6877e7a19b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 119: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xb10020c8f9712432, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_69:
	.word 0x39400001  ! 120: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_70:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91c011  ! 121: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
	setx 0x55d4fafd64b6fbe6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_71:
	.word 0x39400001  ! 122: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a089d2  ! 123: FDIVd	fdivd	%f2, %f18, %f12
splash_cmpr_1_72:
	setx 0x740ee59ea15f09c7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 124: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803078  ! 125: SIR	sir	0x1078
jmptr_1_73:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 126: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e6e  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x1e6e, %pstate
	bg,a	 skip_1_75
	bgu  	 skip_1_75
.align 512
skip_1_75:
	.word 0xa5b104c0  ! 128: FCMPNE32	fcmpne32	%d4, %d0, %r18
	.word 0xe43fc000  ! 129: STD_R	std	%r18, [%r31 + %r0]
	.word 0x9f802615  ! 130: SIR	sir	0x0615
	.word 0xa9b207f1  ! 131: PDISTN	fmean16	%d8, %d48, %d20
	.word 0xe8bfe08c  ! 132: STDA_I	stda	%r20, [%r31 + 0x008c] %asi
splash_htba_1_76:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 133: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_1_77:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f18
	normalw
	.word 0xa9458000  ! 134: RD_SOFTINT_REG	rd	%softint, %r20
change_to_randtl_1_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_78:
	.word 0x8f902001  ! 135: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_1_79:
	set 0xbd05a653, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 136: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe927e0af  ! 137: STF_I	st	%f20, [0x00af, %r31]
splash_cmpr_1_80:
	setx 0x13e183dd430f7bbe, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 138: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x91d020b5  ! 139: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe8cfe010  ! 140: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
splash_htba_1_81:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xe187de00  ! 142: LDFA_R	lda	[%r31, %r0], %f16
jmptr_1_82:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 143: JMPL_R	jmpl	%r27 + %r0, %r27
	fbo skip_1_83
	.word 0x95a109d4  ! 1: FDIVd	fdivd	%f4, %f20, %f10
.align 1024
skip_1_83:
	.word 0xc36c68be  ! 144: PREFETCH_I	prefetch	[%r17 + 0x08be], #one_read
splash_decr_1_84:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7840010  ! 145: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r16, %-
splash_lsu_1_85:
	set 0x7248ebd6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 146: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_86:
	setx 0x53fb7407d616f849, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 147: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a00172  ! 148: FABSq	dis not found

	.word 0xa1a00171  ! 149: FABSq	dis not found

pmu_1_87:
	nop
	setx 0xfffff0c3fffff410, %g1, %g7
	.word 0xa3800007  ! 150: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00166  ! 151: FABSq	dis not found

mondo_1_88:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d914006  ! 152: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xda57e010  ! 153: LDSH_I	ldsh	[%r31 + 0x0010], %r13
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_89
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_89
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_89:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 154: RDPC	rd	%pc, %r11
intveclr_1_90:
	setx 0x2ab93c8770ca0d75, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 155: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d940013  ! 156: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
donret_1_92:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_92-donret_1_92-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e4ef58 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe5f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_92:
	.word 0xd6ffe018  ! 157: SWAPA_I	swapa	%r11, [%r31 + 0x0018] %asi
splash_decr_1_93:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa780c006  ! 158: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r6, %-
mondo_1_94:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 159: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
memptr_1_95:
	set 0x60740000, %r31
	.word 0x85852ba4  ! 160: WRCCR_I	wr	%r20, 0x0ba4, %ccr
debug_1_96:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_96:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_96
    nop
debug_wait1_96:
    ld [%r23], %r16
    brnz %r16, debug_wait1_96
    nop
    ba,a debug_startwait1_96
continue_debug_1_96:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_96:
    cmp %r13, %r17
    bne,a wait_for_stat_1_96
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_96:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_96
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050a3ea42aa,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd697c034  ! 161: LDUHA_R	lduha	[%r31, %r20] 0x01, %r11
memptr_1_97:
	set 0x60140000, %r31
	.word 0x8584bfac  ! 162: WRCCR_I	wr	%r18, 0x1fac, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_98) + 40, 16, 16)) -> intp(2,0,15)
intvec_1_98:
	.word 0x39400001  ! 163: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_99:
	.word 0x81982eaf  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eaf, %hpstate
	.word 0xd727e0d8  ! 165: STF_I	st	%f11, [0x00d8, %r31]
	bleu,a	 skip_1_100
	.word 0x91b484c0  ! 1: FCMPNE32	fcmpne32	%d18, %d0, %r8
.align 128
skip_1_100:
	.word 0x39400001  ! 166: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe137c000  ! 167: STQF_R	-	%f16, [%r0, %r31]
	.word 0x99a00161  ! 168: FABSq	dis not found

fpinit_1_101:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 169: FDIVs	fdivs	%f0, %f4, %f4
DS_1_102:
	.word 0xa7a309c2  ! 1: FDIVd	fdivd	%f12, %f2, %f50
	allclean
	.word 0x97b48304  ! 170: ALIGNADDRESS	alignaddr	%r18, %r4, %r11
mondo_1_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d950012  ! 171: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
pmu_1_104:
	nop
	setx 0xfffff1ecfffff61c, %g1, %g7
	.word 0xa3800007  ! 172: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95450000  ! 173: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xa9a489c2  ! 174: FDIVd	fdivd	%f18, %f2, %f20
	.word 0x97a0016d  ! 175: FABSq	dis not found

	.word 0x95703547  ! 176: POPC_I	popc	0x1547, %r10
	.word 0xd44fe018  ! 177: LDSB_I	ldsb	[%r31 + 0x0018], %r10
	.word 0xd537c000  ! 178: STQF_R	-	%f10, [%r0, %r31]
mondo_1_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d908014  ! 179: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0xd527c000  ! 180: STF_R	st	%f10, [%r0, %r31]
	.word 0xc187db60  ! 181: LDFA_R	lda	[%r31, %r0], %f0
tagged_1_106:
	tsubcctv %r1, 0x1484, %r16
	.word 0xd407e0d1  ! 182: LDUW_I	lduw	[%r31 + 0x00d1], %r10
mondo_1_107:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92800d  ! 183: WRPR_WSTATE_R	wrpr	%r10, %r13, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_108) + 56, 16, 16)) -> intp(6,0,5)
intvec_1_108:
	.word 0x39400001  ! 184: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e020  ! 186: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	.word 0xab806326  ! 187: WR_CLEAR_SOFTINT_I	wr	%r1, 0x0326, %clear_softint
splash_hpstate_1_109:
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x819826d5  ! 188: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
mondo_1_110:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90000b  ! 189: WRPR_WSTATE_R	wrpr	%r0, %r11, %wstate
	.word 0xe1bfdc00  ! 190: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_1_111:
	setx 0x91a6221316e61552, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 191: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_112:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d944004  ! 192: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
intveclr_1_113:
	setx 0x5bd7181695cf2902, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_114:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e004  ! 194: CASA_R	casa	[%r31] %asi, %r4, %r10
	.word 0xa1a049a5  ! 195: FDIVs	fdivs	%f1, %f5, %f16
debug_1_115:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_115:
	mov 0x5d9, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe03fe326  ! 196: STD_I	std	%r16, [%r31 + 0x0326]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_116:
	ta	T_CHANGE_NONHPRIV	! macro
	setx 0xabeab584d0181715, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_117:
	.word 0x39400001  ! 198: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_118:
	setx 0xed5460dbcb3656a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803e66  ! 200: SIR	sir	0x1e66
	ta	T_CHANGE_NONPRIV	! macro
pmu_1_119:
	nop
	setx 0xfffff07afffff482, %g1, %g7
	.word 0xa3800007  ! 202: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_120) + 24, 16, 16)) -> intp(4,0,2)
intvec_1_120:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe03fe054  ! 204: STD_I	std	%r16, [%r31 + 0x0054]
fpinit_1_121:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 205: FCMPLE32	fcmple32	%d0, %d4, %r4
pmu_1_122:
	nop
	setx 0xfffff5eafffff92f, %g1, %g7
	.word 0xa3800007  ! 206: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	ba  	 skip_1_123
	brlez,pt  	%r19, skip_1_123
.align 128
skip_1_123:
	.word 0x93b444d2  ! 207: FCMPNE32	fcmpne32	%d48, %d18, %r9
	.word 0xd23fe0c8  ! 208: STD_I	std	%r9, [%r31 + 0x00c8]
	.word 0xa5a0016d  ! 209: FABSq	dis not found

splash_cmpr_1_124:
	setx 0x34afc14a374ca104, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 210: WR_STICK_REG_R	wr	%r0, %r1, %-
	brgz,pn  	%r18, skip_1_125
	brgez,pn  	%r16, skip_1_125
.align 512
skip_1_125:
	.word 0xe7e4c033  ! 211: CASA_I	casa	[%r19] 0x 1, %r19, %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_126:
	ta	T_CHANGE_NONHPRIV	! macro
intveclr_1_127:
	setx 0x5da4bb0eaa830272, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 213: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe6dfe018  ! 214: LDXA_I	ldxa	[%r31, + 0x0018] %asi, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_128) + 56, 16, 16)) -> intp(1,0,9)
intvec_1_128:
	.word 0x39400001  ! 215: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903150  ! 216: WRPR_PSTATE_I	wrpr	%r0, 0x1150, %pstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_130) + 32, 16, 16)) -> intp(2,0,8)
intvec_1_130:
	.word 0x39400001  ! 217: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 218: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_131
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_131:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 219: RDPC	rd	%pc, %r12
	.word 0xa9b287f2  ! 220: PDISTN	fmean16	%d10, %d18, %d20
splash_cmpr_1_132:
	setx 0x8bf130f0fd107055, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 221: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe837e086  ! 222: STH_I	sth	%r20, [%r31 + 0x0086]
jmptr_1_133:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 223: JMPL_R	jmpl	%r27 + %r0, %r27
pmu_1_134:
	nop
	setx 0xfffff148fffffb93, %g1, %g7
	.word 0xa3800007  ! 224: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xc5e8ceb2f1255b8a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_135:
	.word 0x39400001  ! 225: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_136:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_136:
	mov 0x7a4, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x133,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe91fc012  ! 226: LDDF_R	ldd	[%r31, %r18], %f20
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_137:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 227: CASA_R	casa	[%r31] %asi, %r18, %r20
	.word 0xe83fc000  ! 228: STD_R	std	%r20, [%r31 + %r0]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_138
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_138:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e012  ! 229: CASA_R	casa	[%r31] %asi, %r18, %r20
unsupttte1_139:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ec0033  ! 230: PREFETCHA_R	prefetcha	[%r16, %r19] 0x01, #one_read
cmp_1_140:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_140:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_140
    nop
cmp_wait1_140:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_140
    nop
    ba,a cmp_startwait1_140
continue_cmp_1_140:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe0, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c010  ! 231: WRPR_PIL_R	wrpr	%r19, %r16, %pil
mondo_1_141:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d91c00a  ! 232: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	.word 0x9f802757  ! 233: SIR	sir	0x0757
pmu_1_142:
	nop
	setx 0xfffffcd5ffffff78, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9194e2bd  ! 235: WRPR_PIL_I	wrpr	%r19, 0x02bd, %pil
splash_hpstate_1_143:
	.word 0x81982f15  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
	.word 0xc3e80027  ! 237: PREFETCHA_R	prefetcha	[%r0, %r7] 0x01, #one_read
memptr_1_144:
	set user_data_start, %r31
	.word 0x8582b9a6  ! 238: WRCCR_I	wr	%r10, 0x19a6, %ccr
mondo_1_145:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d95000d  ! 239: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
unsupttte1_146:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xc3ed0021  ! 240: PREFETCHA_R	prefetcha	[%r20, %r1] 0x01, #one_read
pmu_1_147:
	nop
	setx 0xfffff115fffff927, %g1, %g7
	.word 0xa3800007  ! 241: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 242: LDX_R	ldx	[%r31 + %r0], %r18
splash_cmpr_1_148:
	setx 0xa43ff761a51c2d71, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 243: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a089d3  ! 244: FDIVd	fdivd	%f2, %f50, %f42
cmp_1_149:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_149:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_149
    nop
cmp_wait1_149:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_149
    nop
    ba,a cmp_startwait1_149
continue_cmp_1_149:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6e, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c014  ! 245: WRPR_PIL_R	wrpr	%r19, %r20, %pil
fpinit_1_150:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 246: FDIVd	fdivd	%f0, %f4, %f4
mondo_1_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d944008  ! 247: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
invtsb_1_152:
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
	.word 0x29800001  ! 248: FBL	fbl,a	<label_0x1>
debug_1_153:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_153:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_153
    nop
debug_wait1_153:
    ld [%r23], %r16
    brnz %r16, debug_wait1_153
    nop
    ba,a debug_startwait1_153
continue_debug_1_153:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_153:
    cmp %r13, %r17
    bne,a wait_for_stat_1_153
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_153:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_153
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000503bc2aa22,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc028  ! 249: LDXA_R	ldxa	[%r31, %r8] 0x01, %r11
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_154:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e008  ! 250: CASA_R	casa	[%r31] %asi, %r8, %r11
jmptr_1_155:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 251: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9028f1  ! 252: WRPR_PSTATE_I	wrpr	%r0, 0x08f1, %pstate
	.word 0x24700001  ! 253: BPLE	<illegal instruction>
debug_1_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_157:
	mov 0x583, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+24), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd73fc008  ! 254: STDF_R	std	%f11, [%r8, %r31]
intveclr_1_158:
	setx 0x59baaba2c90748d7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 255: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmp_1_159:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_159:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_159
    nop
cmp_wait1_159:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_159
    nop
    ba,a cmp_startwait1_159
continue_cmp_1_159:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x72, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91930010  ! 256: WRPR_PIL_R	wrpr	%r12, %r16, %pil
	.word 0xd737c000  ! 257: STQF_R	-	%f11, [%r0, %r31]
splash_lsu_1_160:
	set 0x1ae184cf, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 258: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_161:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d924014  ! 259: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0xa5a00160  ! 260: FABSq	dis not found

	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_162:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_163
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_163
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_163:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 263: RDPC	rd	%pc, %r19
mondo_1_164:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94800c  ! 264: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_165:
	set user_data_start, %r31
	.word 0x8581a8cf  ! 266: WRCCR_I	wr	%r6, 0x08cf, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_166
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_166:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 267: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe7e7e00c  ! 268: CASA_R	casa	[%r31] %asi, %r12, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_168) + 0, 16, 16)) -> intp(5,0,5)
intvec_1_168:
	.word 0x39400001  ! 269: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_169:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_169:
	mov 0x411, %r20
	mov 0x6, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x120,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 270: CASA_R	casa	[%r31] %asi, %r12, %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_170
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_170:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e00c  ! 271: CASA_R	casa	[%r31] %asi, %r12, %r19
	setx 0xa9476da5ad3e952f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_171:
	.word 0x39400001  ! 272: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_172:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e828cf  ! 273: PREFETCHA_I	prefetcha	[%r0, + 0x08cf] %asi, #one_read
	.word 0xab800005  ! 274: WR_CLEAR_SOFTINT_R	wr	%r0, %r5, %clear_softint
	.word 0xe727c000  ! 275: STF_R	st	%f19, [%r0, %r31]
	.word 0xe697e010  ! 276: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe65fc000  ! 277: LDX_R	ldx	[%r31 + %r0], %r19
mondo_1_173:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d8] %asi
	.word 0x9d948005  ! 278: WRPR_WSTATE_R	wrpr	%r18, %r5, %wstate
memptr_1_174:
	set user_data_start, %r31
	.word 0x8581636b  ! 279: WRCCR_I	wr	%r5, 0x036b, %ccr
	.word 0x8d9028ad  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x08ad, %pstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_176
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_176:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 281: RDPC	rd	%pc, %r20
	.word 0xa7520000  ! 282: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_177:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 283: RDPC	rd	%pc, %r8
fpinit_1_178:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 284: FDIVd	fdivd	%f0, %f4, %f4
	setx 0x519dd6d46ea35d27, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_179:
	.word 0x39400001  ! 285: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_1_180:
	tsubcctv %r0, 0x1cce, %r0
	.word 0xd007e0a0  ! 286: LDUW_I	lduw	[%r31 + 0x00a0], %r8
debug_1_181:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_181:
	mov 0x4e4, %r20
	mov 0x5, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rdhpr %htba, %r19
	mov 0x37,  %r20
	sllx %r20, 5, %r20
	add %r20, %r19, %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd0dfc025  ! 287: LDXA_R	ldxa	[%r31, %r5] 0x01, %r8
DS_1_182:
	.word 0xa7a209d1  ! 1: FDIVd	fdivd	%f8, %f48, %f50
	.word 0xbfefc000  ! 288: RESTORE_R	restore	%r31, %r0, %r31
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_183
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_183:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 289: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x26800001  ! 290: BL	bl,a	<label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 291: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_184
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_184:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 292: CASA_R	casa	[%r31] %asi, %r17, %r19
	fbul skip_1_185
	.word 0x87a94a53  ! 1: FCMPd	fcmpd	%fcc<n>, %f36, %f50
.align 2048
skip_1_185:
	.word 0xe7e10024  ! 293: CASA_I	casa	[%r4] 0x 1, %r4, %r19
tagged_1_186:
	tsubcctv %r20, 0x188b, %r20
	.word 0xe607e052  ! 294: LDUW_I	lduw	[%r31 + 0x0052], %r19
	setx 0xb382092435fd4744, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_187:
	.word 0x39400001  ! 295: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a409a4  ! 296: FDIVs	fdivs	%f16, %f4, %f11
intveclr_1_188:
	setx 0x4b496daf527fc947, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 297: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd60fc000  ! 298: LDUB_R	ldub	[%r31 + %r0], %r11
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_189:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e004  ! 299: CASA_R	casa	[%r31] %asi, %r4, %r11
splash_htba_1_190:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 300: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
intveclr_1_191:
	setx 0xf8699228051ee95c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 301: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 302: LDD_R	ldd	[%r31 + %r0], %r11
intveclr_1_192:
	setx 0x29d39ff221e3a801, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_decr_1_193:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa7850006  ! 304: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r6, %-
	.word 0x93a00173  ! 305: FABSq	dis not found

pmu_1_194:
	nop
	setx 0xfffff62efffff706, %g1, %g7
	.word 0xa3800007  ! 306: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b2  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 178
memptr_1_195:
	set user_data_start, %r31
	.word 0x85836f11  ! 308: WRCCR_I	wr	%r13, 0x0f11, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 309: RDPC	rd	%pc, %r20
	.word 0x91450000  ! 310: RD_SET_SOFTINT	rd	%set_softint, %r8
pmu_1_197:
	nop
	setx 0xfffff099fffff1fc, %g1, %g7
	.word 0xa3800007  ! 311: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_198:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 312: RDPC	rd	%pc, %r9
	.word 0xa3520000  ! 313: RDPR_PIL	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_199
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_199:
    ta T_CHANGE_NONHPRIV
	.word 0xe3e7e013  ! 314: CASA_R	casa	[%r31] %asi, %r19, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_200) + 48, 16, 16)) -> intp(4,0,28)
intvec_1_200:
	.word 0x39400001  ! 315: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_201:
	setx 0x782f3980df42be95, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 316: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_1_202:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_202:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_202
    nop
cmp_wait1_202:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_202
    nop
    ba,a cmp_startwait1_202
continue_cmp_1_202:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x78, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944014  ! 317: WRPR_PIL_R	wrpr	%r17, %r20, %pil
	.word 0xe28008a0  ! 318: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
debug_1_203:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_203:
	mov 0xf2c, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe3e7e014  ! 319: CASA_R	casa	[%r31] %asi, %r20, %r17
donret_1_204:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_204-donret_1_204-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d420b7 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7de, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_204:
	.word 0xe2ffe00c  ! 320: SWAPA_I	swapa	%r17, [%r31 + 0x000c] %asi
	brgz,pn  	%r18, skip_1_205
	.word 0xe8380014  ! 1: STD_R	std	%r20, [%r0 + %r20]
.align 1024
skip_1_205:
	.word 0x99b244d0  ! 321: FCMPNE32	fcmpne32	%d40, %d16, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_206)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_206:
	.word 0xa9803113  ! 322: WR_SET_SOFTINT_I	wr	%r0, 0x1113, %set_softint
	fbl,a,pn	%fcc0,  skip_1_207
	fbuge,a,pn	%fcc0,  skip_1_207
.align 2048
skip_1_207:
	.word 0x39400001  ! 323: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d918000  ! 324: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
	setx 0x7e9917e0341b12aa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_209:
	.word 0x39400001  ! 325: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_210:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d950009  ! 326: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_211:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd527c000  ! 328: STF_R	st	%f10, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_212) + 32, 16, 16)) -> intp(1,0,8)
intvec_1_212:
	.word 0x39400001  ! 329: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
fpinit_1_213:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 330: FCMPLE32	fcmple32	%d0, %d4, %r4
DS_1_214:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f4, %f18
	.word 0x95b0c310  ! 331: ALIGNADDRESS	alignaddr	%r3, %r16, %r10
	.word 0xd49fc540  ! 332: LDDA_R	ldda	[%r31, %r0] 0x2a, %r10
intveclr_1_215:
	setx 0x645d9c02e0191671, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 333: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmp_1_216:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_216:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_216
    nop
cmp_wait1_216:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_216
    nop
    ba,a cmp_startwait1_216
continue_cmp_1_216:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 50, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91928001  ! 334: WRPR_PIL_R	wrpr	%r10, %r1, %pil
change_to_randtl_1_217:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_217:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x1785, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b107e8  ! 336: PDISTN	fmean16	%d4, %d8, %d20
memptr_1_218:
	set 0x60140000, %r31
	.word 0x85842d45  ! 337: WRCCR_I	wr	%r16, 0x0d45, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_219:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e008  ! 338: CASA_R	casa	[%r31] %asi, %r8, %r20
splash_cmpr_1_220:
	setx 0x42f0df448422e717, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 339: WR_STICK_REG_R	wr	%r0, %r1, %-
tagged_1_221:
	taddcctv %r19, 0x17f3, %r20
	.word 0xe807e06c  ! 340: LDUW_I	lduw	[%r31 + 0x006c], %r20
	.word 0x9f803fc4  ! 341: SIR	sir	0x1fc4
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 342: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97a00168  ! 343: FABSq	dis not found

	.word 0xa3a509c6  ! 344: FDIVd	fdivd	%f20, %f6, %f48
donret_1_222:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_222-donret_1_222-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0066d109 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xd4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_222:
	.word 0xe2ffe068  ! 345: SWAPA_I	swapa	%r17, [%r31 + 0x0068] %asi
	.word 0xe187e0e0  ! 346: LDFA_I	lda	[%r31, 0x00e0], %f16
cmp_1_223:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_223:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_223
    nop
cmp_wait1_223:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_223
    nop
    ba,a cmp_startwait1_223
continue_cmp_1_223:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x64, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c014  ! 347: WRPR_PIL_R	wrpr	%r11, %r20, %pil
cwp_1_224:
    set user_data_start, %o7
	.word 0x93902000  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa7a489b2  ! 349: FDIVs	fdivs	%f18, %f18, %f19
DS_1_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe13260b6  ! 1: STQF_I	-	%f16, [0x00b6, %r9]
	normalw
	.word 0xa7458000  ! 350: RD_SOFTINT_REG	rd	%softint, %r19
pmu_1_226:
	nop
	setx 0xffffff0afffff16d, %g1, %g7
	.word 0xa3800007  ! 351: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_1_227:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f12, %f2
	.word 0xa9b4c30c  ! 352: ALIGNADDRESS	alignaddr	%r19, %r12, %r20
splash_hpstate_1_228:
	.word 0x819828a4  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08a4, %hpstate
splash_cmpr_1_229:
	setx 0xd8124bb4b5e856ff, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 354: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a409d3  ! 355: FDIVd	fdivd	%f16, %f50, %f16
memptr_1_230:
	set 0x60340000, %r31
	.word 0x8584a8d6  ! 356: WRCCR_I	wr	%r18, 0x08d6, %ccr
	.word 0xa9a00160  ! 357: FABSq	dis not found

DS_1_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0xe857c000  ! 359: LDSH_R	ldsh	[%r31 + %r0], %r20
pmu_1_232:
	nop
	setx 0xfffff36ffffff428, %g1, %g7
	.word 0xa3800007  ! 360: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d9023be  ! 361: WRPR_PSTATE_I	wrpr	%r0, 0x03be, %pstate
fpinit_1_234:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 362: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xe927e074  ! 363: STF_I	st	%f20, [0x0074, %r31]
fpinit_1_235:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 364: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91d02035  ! 365: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_cmpr_1_236:
	setx 0xb55c8f65bbf6df7b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 366: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_237:
	set user_data_start, %r31
	.word 0x85846235  ! 367: WRCCR_I	wr	%r17, 0x0235, %ccr
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_238) + 0, 16, 16)) -> intp(5,0,9)
intvec_1_238:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_239:
	nop
	setx 0xfffffa4dfffff041, %g1, %g7
	.word 0xa3800007  ! 369: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_240:
	set 0x8d9d97b8, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe877c000  ! 371: STX_R	stx	%r20, [%r31 + %r0]
	setx 0x2b7260f4b6ec152c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_241:
	.word 0x39400001  ! 372: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_242:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_242-donret_1_242-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e258ea | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe95, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	retry
donretarg_1_242:
	.word 0xe8ffe028  ! 373: SWAPA_I	swapa	%r20, [%r31 + 0x0028] %asi
pmu_1_243:
	nop
	setx 0xfffffee9fffff495, %g1, %g7
	.word 0xa3800007  ! 374: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe8800ba0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
	.word 0xa3a00173  ! 376: FABSq	dis not found

	.word 0xab84660a  ! 377: WR_CLEAR_SOFTINT_I	wr	%r17, 0x060a, %clear_softint
jmptr_1_244:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 378: JMPL_R	jmpl	%r27 + %r0, %r27
fpinit_1_245:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 379: FDIVs	fdivs	%f0, %f4, %f8
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_246:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 381: WRPR_TBA_R	wrpr	%r0, %r12, %tba
debug_1_247:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_247:
	mov 0x7e5, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+8), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe2dfc033  ! 382: LDXA_R	ldxa	[%r31, %r19] 0x01, %r17
donret_1_248:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_248-donret_1_248-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004a0306 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3d4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	retry
donretarg_1_248:
	.word 0xe2ffe02a  ! 383: SWAPA_I	swapa	%r17, [%r31 + 0x002a] %asi
DS_1_249:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
tagged_1_250:
	tsubcctv %r13, 0x1a37, %r19
	.word 0xe207e010  ! 385: LDUW_I	lduw	[%r31 + 0x0010], %r17
pmu_1_251:
	nop
	setx 0xfffffae9fffff09c, %g1, %g7
	.word 0xa3800007  ! 386: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
fpinit_1_252:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 387: FDIVd	fdivd	%f0, %f4, %f8
splash_decr_1_253:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa784400c  ! 388: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r12, %-
splash_cmpr_1_254:
	setx 0x25a43975e2783dca, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 389: WR_STICK_REG_R	wr	%r0, %r1, %-
memptr_1_255:
	set user_data_start, %r31
	.word 0x85806c3a  ! 390: WRCCR_I	wr	%r1, 0x0c3a, %ccr
splash_lsu_1_256:
	set 0x99061964, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brlez,a,pt	%r4, skip_1_257
	bn,a	 skip_1_257
.align 128
skip_1_257:
	.word 0xe1e30032  ! 392: CASA_I	casa	[%r12] 0x 1, %r18, %r16
mondo_1_258:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d934004  ! 393: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_259
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_259:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e004  ! 394: CASA_R	casa	[%r31] %asi, %r4, %r16
	.word 0xc1bfda00  ! 395: STDFA_R	stda	%f0, [%r0, %r31]
donret_1_260:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_260-donret_1_260-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008c077c | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x94d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_260:
	.word 0xe0ffe089  ! 396: SWAPA_I	swapa	%r16, [%r31 + 0x0089] %asi
unsupttte1_261:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa3a1c9d1  ! 397: FDIVd	fdivd	%f38, %f48, %f48
intveclr_1_262:
	setx 0x2f77190254174560, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 398: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 399: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_1_263:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd33534e2  ! 1: STQF_I	-	%f9, [0x14e2, %r20]
	normalw
	.word 0xa9458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r20
DS_1_264:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
mondo_1_265:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d93000d  ! 402: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
	.word 0x91a00174  ! 403: FABSq	dis not found

mondo_1_266:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d94c002  ! 404: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_267
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_267
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_267:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 405: RDPC	rd	%pc, %r12
mondo_1_268:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d900008  ! 406: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
	.word 0xa5540000  ! 407: RDPR_GL	<illegal instruction>
donret_1_269:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_269-donret_1_269-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006e969d | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x81c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_1_269:
	.word 0xe4ffe088  ! 408: SWAPA_I	swapa	%r18, [%r31 + 0x0088] %asi
	.word 0x99902001  ! 409: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_270
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_270
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_270:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 410: RDPC	rd	%pc, %r10
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_271
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_271
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 411: RDPC	rd	%pc, %r20
	.word 0x91d02032  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87ac4a51  ! 413: FCMPd	fcmpd	%fcc<n>, %f48, %f48
splash_cmpr_1_272:
	setx 0x18802faf1316c237, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 414: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_273:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_273-donret_1_273-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d51f15 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x64c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	done
donretarg_1_273:
	.word 0xe0ffe078  ! 415: SWAPA_I	swapa	%r16, [%r31 + 0x0078] %asi
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_274
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_274
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_274:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 416: RDPC	rd	%pc, %r16
	.word 0x3a800001  ! 417: BCC	bcc,a	<label_0x1>
memptr_1_275:
	set 0x60340000, %r31
	.word 0x8581a8bb  ! 418: WRCCR_I	wr	%r6, 0x08bb, %ccr
splash_hpstate_1_276:
	.word 0x81982cec  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cec, %hpstate
intveclr_1_277:
	setx 0x14952ef85a80b94c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 420: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_278:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_278:
	mov 0xbec, %r20
	mov 0x1b, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 421: CASA_R	casa	[%r31] %asi, %r17, %r16
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_279
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_279
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_279:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 422: RDPC	rd	%pc, %r10
	.word 0xd537c000  ! 423: STQF_R	-	%f10, [%r0, %r31]
	.word 0x91d020b3  ! 424: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_1_280:
	setx 0x21ca98d8cf6d3b4c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 425: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_281)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_281:
	.word 0xa982ebdc  ! 426: WR_SET_SOFTINT_I	wr	%r11, 0x0bdc, %set_softint
	.word 0xe187dc00  ! 427: LDFA_R	lda	[%r31, %r0], %f16
donret_1_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_282-donret_1_282-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0064ea13 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x717, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_282:
	.word 0xd4ffe034  ! 428: SWAPA_I	swapa	%r10, [%r31 + 0x0034] %asi
	.word 0x91d02035  ! 429: Tcc_I	ta	icc_or_xcc, %r0 + 53
	fbge,a,pn	%fcc0,  skip_1_283
	fbuge skip_1_283
.align 512
skip_1_283:
	.word 0xe7e4c031  ! 430: CASA_I	casa	[%r19] 0x 1, %r17, %r19
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe65fc000  ! 431: LDX_R	ldx	[%r31 + %r0], %r19
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 432: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802617  ! 433: SIR	sir	0x0617
pmu_1_284:
	nop
	setx 0xfffff87afffff62b, %g1, %g7
	.word 0xa3800007  ! 434: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe68fe030  ! 435: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
debug_1_285:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_285:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_285
    nop
debug_wait1_285:
    ld [%r23], %r16
    brnz %r16, debug_wait1_285
    nop
    ba,a debug_startwait1_285
continue_debug_1_285:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_285:
    cmp %r13, %r17
    bne,a wait_for_stat_1_285
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_285:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_285
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000509aea22c7,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe71fc011  ! 436: LDDF_R	ldd	[%r31, %r17], %f19
	.word 0xe737c000  ! 437: STQF_R	-	%f19, [%r0, %r31]
jmptr_1_286:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 438: JMPL_R	jmpl	%r27 + %r0, %r27
jmptr_1_287:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 439: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_288
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_288:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 440: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x97500000  ! 441: RDPR_TPC	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 442: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_289:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 443: CASA_R	casa	[%r31] %asi, %r17, %r11
splash_htba_1_290:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 444: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
jmptr_1_291:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 445: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd6dfe008  ! 446: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r11
cmp_1_292:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_292:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_292
    nop
cmp_wait1_292:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_292
    nop
    ba,a cmp_startwait1_292
continue_cmp_1_292:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe8, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944011  ! 447: WRPR_PIL_R	wrpr	%r17, %r17, %pil
splash_cmpr_1_293:
	setx 0xce02dd1928ab2f51, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 448: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_294:
	setx 0xd2ee9e9cc989fde0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 449: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_295:
	setx 0xa68a168ae5a22ae4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 450: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd697e010  ! 451: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x91d02035  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_hpstate_1_296:
	.word 0x8198280f  ! 453: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_297
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_297:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e011  ! 454: CASA_R	casa	[%r31] %asi, %r17, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_298) + 32, 16, 16)) -> intp(4,0,5)
intvec_1_298:
	.word 0x39400001  ! 455: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 53
	setx 0x773c201b274ea2f2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_299:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a149c5  ! 458: FDIVd	fdivd	%f36, %f36, %f16
	ta	T_CHANGE_NONPRIV	! macro
cmp_1_300:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_300:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_300
    nop
cmp_wait1_300:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_300
    nop
    ba,a cmp_startwait1_300
continue_cmp_1_300:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x64, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c011  ! 460: WRPR_PIL_R	wrpr	%r7, %r17, %pil
DS_1_301:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 461: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
jmptr_1_302:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 462: JMPL_R	jmpl	%r27 + %r0, %r27
debug_1_303:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_303:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_303
    nop
debug_wait1_303:
    ld [%r23], %r16
    brnz %r16, debug_wait1_303
    nop
    ba,a debug_startwait1_303
continue_debug_1_303:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_303:
    cmp %r13, %r17
    bne,a wait_for_stat_1_303
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_303:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_303
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050ace2c7e1,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe097c031  ! 463: LDUHA_R	lduha	[%r31, %r17] 0x01, %r16
pmu_1_304:
	nop
	setx 0xfffff510fffff61d, %g1, %g7
	.word 0xa3800007  ! 464: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_305:
	nop
	setx 0xfffffac1fffff6d8, %g1, %g7
	.word 0xa3800007  ! 465: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_306:
	setx 0x09c10ae94e72a253, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 466: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a149c1  ! 467: FDIVd	fdivd	%f36, %f32, %f12
    set 0x2890, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b287f3  ! 468: PDISTN	fmean16	%d10, %d50, %d12
	.word 0x99a00160  ! 469: FABSq	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_307
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_307:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e000  ! 470: CASA_R	casa	[%r31] %asi, %r0, %r12
	.word 0xe1bfdb60  ! 471: STDFA_R	stda	%f16, [%r0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_308) + 24, 16, 16)) -> intp(6,0,14)
intvec_1_308:
	.word 0x39400001  ! 472: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd937e069  ! 474: STQF_I	-	%f12, [0x0069, %r31]
tagged_1_309:
	taddcctv %r19, 0x1492, %r10
	.word 0xd807e094  ! 475: LDUW_I	lduw	[%r31 + 0x0094], %r12
	bcs  	 skip_1_310
	bge,a	 skip_1_310
.align 2048
skip_1_310:
	.word 0x87a90a52  ! 476: FCMPd	fcmpd	%fcc<n>, %f4, %f18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_311
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_311:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e012  ! 477: CASA_R	casa	[%r31] %asi, %r18, %r13
mondo_1_312:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 478: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0xa5a00170  ! 479: FABSq	dis not found

	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 480: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_1_313:
	setx 0xd946c6313f6cd8c9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 481: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_cmpr_1_314:
	setx 0x42c05e8c8b2d3f6f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 482: WR_STICK_REG_R	wr	%r0, %r1, %-
invtsb_1_315:
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
	.word 0x29800001  ! 483: FBL	fbl,a	<label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_316
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_316:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 484: CASA_R	casa	[%r31] %asi, %r16, %r18
tagged_1_317:
	taddcctv %r20, 0x15ca, %r2
	.word 0xe407e09c  ! 485: LDUW_I	lduw	[%r31 + 0x009c], %r18
donret_1_318:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_318-donret_1_318-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0009f35f | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc1e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_318:
	.word 0xe4ffe048  ! 486: SWAPA_I	swapa	%r18, [%r31 + 0x0048] %asi
	.word 0xe527c000  ! 487: STF_R	st	%f18, [%r0, %r31]
	.word 0xa9464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x87a88a54  ! 489: FCMPd	fcmpd	%fcc<n>, %f2, %f20
	.word 0x8d903f4d  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x1f4d, %pstate
	.word 0xe62fe019  ! 491: STB_I	stb	%r19, [%r31 + 0x0019]
splash_htba_1_320:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 492: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_321
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_321:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 493: RDPC	rd	%pc, %r20
	.word 0xad8067d4  ! 494: WR_SOFTINT_REG_I	wr	%r1, 0x07d4, %softint
	.word 0x34700001  ! 495: BPG	<illegal instruction>
	.word 0x9f803875  ! 496: SIR	sir	0x1875
	.word 0x99a489cb  ! 497: FDIVd	fdivd	%f18, %f42, %f12
jmptr_1_322:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 498: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x2e700001  ! 499: BPVS	<illegal instruction>
mondo_1_323:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d914010  ! 500: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0xd86fe042  ! 501: LDSTUB_I	ldstub	%r12, [%r31 + 0x0042]
	.word 0x9f8028c5  ! 502: SIR	sir	0x08c5
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_324) + 56, 16, 16)) -> intp(3,0,27)
intvec_1_324:
	.word 0x39400001  ! 503: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_325:
	nop
	setx 0xfffffaeefffffa4a, %g1, %g7
	.word 0xa3800007  ! 504: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_326:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0xa3a00173  ! 506: FABSq	dis not found

splash_lsu_1_327:
	set 0x27820ce5, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	bl,a	 skip_1_328
	fbul,a,pn	%fcc0,  skip_1_328
.align 128
skip_1_328:
	.word 0x39400001  ! 508: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe83fe049  ! 509: STD_I	std	%r20, [%r31 + 0x0049]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_329
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_329
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_329:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 510: RDPC	rd	%pc, %r11
	.word 0xe187e080  ! 511: LDFA_I	lda	[%r31, 0x0080], %f16
intveclr_1_330:
	setx 0xd1e40219213d0dc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 512: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_331:
	.word 0x8198270d  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070d, %hpstate
DS_1_332:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3300004  ! 1: STQF_R	-	%f9, [%r4, %r0]
	normalw
	.word 0xa9458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_333
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_333
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_333:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 515: RDPC	rd	%pc, %r9
jmptr_1_334:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 516: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd26fe09a  ! 517: LDSTUB_I	ldstub	%r9, [%r31 + 0x009a]
splash_tba_1_335:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 518: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x97a409cd  ! 519: FDIVd	fdivd	%f16, %f44, %f42
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_336
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_336
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_336:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 520: RDPC	rd	%pc, %r20
intveclr_1_337:
	setx 0x1fa3eed1f876b1db, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 521: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3450000  ! 522: RD_SET_SOFTINT	rd	%set_softint, %r17
mondo_1_338:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 523: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
intveclr_1_339:
	setx 0x005ae466201e199b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 524: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d948001  ! 525: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
splash_hpstate_1_341:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81982846  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0846, %hpstate
	.word 0xe26fe0e1  ! 527: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e1]
splash_lsu_1_342:
	set 0xb386769b, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	bvc,a	 skip_1_343
	.word 0xc36ab8e8  ! 1: PREFETCH_I	prefetch	[%r10 + 0xfffff8e8], #one_read
.align 128
skip_1_343:
	.word 0xc36a2fd3  ! 529: PREFETCH_I	prefetch	[%r8 + 0x0fd3], #one_read
tagged_1_344:
	tsubcctv %r16, 0x1ea9, %r20
	.word 0xd807e0aa  ! 530: LDUW_I	lduw	[%r31 + 0x00aa], %r12
	.word 0xd8cfe028  ! 531: LDSBA_I	ldsba	[%r31, + 0x0028] %asi, %r12
pmu_1_345:
	nop
	setx 0xfffffc07fffff656, %g1, %g7
	.word 0xa3800007  ! 532: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd8c7e038  ! 533: LDSWA_I	ldswa	[%r31, + 0x0038] %asi, %r12
	.word 0xd9e7c02a  ! 534: CASA_I	casa	[%r31] 0x 1, %r10, %r12
intveclr_1_346:
	setx 0x6c498d2d27fd6f78, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 535: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_347:
	setx 0xe523f45984a17cee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 536: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfda00  ! 537: STDFA_R	stda	%f16, [%r0, %r31]
donret_1_348:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_348-donret_1_348-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x009289f6 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7c4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	retry
donretarg_1_348:
	.word 0xd8ffe0d0  ! 538: SWAPA_I	swapa	%r12, [%r31 + 0x00d0] %asi
	.word 0xc1bfde00  ! 539: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa9850014  ! 540: WR_SET_SOFTINT_R	wr	%r20, %r20, %set_softint
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803ed8  ! 542: SIR	sir	0x1ed8
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 543: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_1_349:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 544: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_lsu_1_350:
	set 0xd6055fe8, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc3c0  ! 546: LDDA_R	ldda	[%r31, %r0] 0x1e, %r12
intveclr_1_351:
	setx 0x611c349558de2ca0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_1_352:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 548: FDIVd	fdivd	%f0, %f4, %f6
intveclr_1_353:
	setx 0xd56daa4a6d478f00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 549: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 550: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_354
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_354
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_354:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 551: RDPC	rd	%pc, %r11
	setx 0xae2e880f192acb7c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_355:
	.word 0x39400001  ! 552: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_356:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 553: CASA_R	casa	[%r31] %asi, %r20, %r11
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_357
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_357:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 554: CASA_R	casa	[%r31] %asi, %r20, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_358) + 32, 16, 16)) -> intp(2,0,7)
intvec_1_358:
	.word 0x39400001  ! 555: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	setx 0xf7bb0090f4e9cec9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_359:
	.word 0x39400001  ! 556: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd71fe028  ! 559: LDDF_I	ldd	[%r31, 0x0028], %f11
mondo_1_360:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d90400a  ! 560: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
intveclr_1_361:
	setx 0xebbae7401cf27da2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 561: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_362
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_362
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_362:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 562: RDPC	rd	%pc, %r20
splash_tba_1_363:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 563: WRPR_TBA_R	wrpr	%r0, %r12, %tba
intveclr_1_364:
	setx 0xb79af1f7a0e28bdd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 564: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_365:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e00a  ! 565: CASA_R	casa	[%r31] %asi, %r10, %r20
	.word 0x9ba289d4  ! 566: FDIVd	fdivd	%f10, %f20, %f44
	.word 0xdb3fc000  ! 567: STDF_R	std	%f13, [%r0, %r31]
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 568: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_1_366:
	nop
	setx 0xfffff456ffffffa9, %g1, %g7
	.word 0xa3800007  ! 569: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_367:
	setx 0x8b7379b8c8ed980e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 570: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_368:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_369
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_369
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_369:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 572: RDPC	rd	%pc, %r11
cmp_1_370:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_370:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_370
    nop
cmp_wait1_370:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_370
    nop
    ba,a cmp_startwait1_370
continue_cmp_1_370:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x7e, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948013  ! 573: WRPR_PIL_R	wrpr	%r18, %r19, %pil
mondo_1_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d920011  ! 574: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
mondo_1_372:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d930012  ! 575: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
DS_1_373:
	.word 0xa9a149d3  ! 1: FDIVd	fdivd	%f36, %f50, %f20
	pdist %f24, %f16, %f6
	.word 0x91b10311  ! 576: ALIGNADDRESS	alignaddr	%r4, %r17, %r8
unsupttte1_374:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99b44492  ! 577: FCMPLE32	fcmple32	%d48, %d18, %r12
debug_1_375:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_375:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_375
    nop
debug_wait1_375:
    ld [%r23], %r16
    brnz %r16, debug_wait1_375
    nop
    ba,a debug_startwait1_375
continue_debug_1_375:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_375:
    cmp %r13, %r17
    bne,a wait_for_stat_1_375
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_375:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_375
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005018c7e107,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc032  ! 578: LDXA_R	ldxa	[%r31, %r18] 0x01, %r12
splash_hpstate_1_376:
	.word 0x8198275f  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075f, %hpstate
	.word 0xc187e0e0  ! 580: LDFA_I	lda	[%r31, 0x00e0], %f0
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_377
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_377
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_377:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 581: RDPC	rd	%pc, %r18
mondo_1_378:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d92c001  ! 582: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
intveclr_1_379:
	setx 0x37ece092359cd357, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 583: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_380:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e001  ! 584: CASA_R	casa	[%r31] %asi, %r1, %r18
splash_lsu_1_381:
	set 0xd2113bf3, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	brnz,a,pt	%r16, skip_1_382
	.word 0xe23d0009  ! 1: STD_R	std	%r17, [%r20 + %r9]
.align 128
skip_1_382:
	.word 0xc368be44  ! 586: PREFETCH_I	prefetch	[%r2 + 0xfffffe44], #one_read
tagged_1_383:
	taddcctv %r16, 0x116c, %r0
	.word 0xd807e06a  ! 587: LDUW_I	lduw	[%r31 + 0x006a], %r12
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_384
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_384
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_384:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 588: RDPC	rd	%pc, %r20
	.word 0xa3a249c8  ! 589: FDIVd	fdivd	%f40, %f8, %f48
pmu_1_385:
	nop
	setx 0xfffff7d4fffff14f, %g1, %g7
	.word 0xa3800007  ! 590: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_1_386:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f22, %f6
	.word 0x93b24314  ! 591: ALIGNADDRESS	alignaddr	%r9, %r20, %r9
jmptr_1_387:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 592: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x83d020b2  ! 593: Tcc_I	te	icc_or_xcc, %r0 + 178
DS_1_388:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 594: SAVE_R	save	%r31, %r0, %r31
fpinit_1_389:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 595: FDIVd	fdivd	%f0, %f4, %f6
splash_hpstate_1_390:
	.word 0x819825b6  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05b6, %hpstate
	.word 0x8d9024fa  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x04fa, %pstate
cwp_1_392:
    set user_data_start, %o7
	.word 0x93902003  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	brlz,a,pt	%r1, skip_1_393
	fbuge,a,pn	%fcc0,  skip_1_393
.align 512
skip_1_393:
	.word 0x87ac4a52  ! 599: FCMPd	fcmpd	%fcc<n>, %f48, %f18
donret_1_394:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_394-donret_1_394-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0006ce26 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_394:
	.word 0xd8ffe020  ! 600: SWAPA_I	swapa	%r12, [%r31 + 0x0020] %asi
	.word 0xa5a449d0  ! 601: FDIVd	fdivd	%f48, %f16, %f18
mondo_1_395:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d910010  ! 602: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
jmptr_1_396:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_1_397:
	setx 0x377bdfbccc38ff31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 604: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_398:
	nop
	setx 0xfffffde2fffffc03, %g1, %g7
	.word 0xa3800007  ! 605: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_1_399:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_399:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_399
    nop
debug_wait1_399:
    ld [%r23], %r16
    brnz %r16, debug_wait1_399
    nop
    ba,a debug_startwait1_399
continue_debug_1_399:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_399:
    cmp %r13, %r17
    bne,a wait_for_stat_1_399
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_399:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_399
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000500fe10728,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe4bfc030  ! 606: STDA_R	stda	%r18, [%r31 + %r16] 0x01
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_400)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_400:
	.word 0xa9853f54  ! 607: WR_SET_SOFTINT_I	wr	%r20, 0x1f54, %set_softint
cmp_1_401:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_401:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_401
    nop
cmp_wait1_401:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_401
    nop
    ba,a cmp_startwait1_401
continue_cmp_1_401:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xd2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948009  ! 608: WRPR_PIL_R	wrpr	%r18, %r9, %pil
	.word 0x9f803f9e  ! 609: SIR	sir	0x1f9e
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_402) + 48, 16, 16)) -> intp(5,0,6)
intvec_1_402:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
memptr_1_403:
	set 0x60740000, %r31
	.word 0x8584e0fa  ! 611: WRCCR_I	wr	%r19, 0x00fa, %ccr
	.word 0xe46fe055  ! 612: LDSTUB_I	ldstub	%r18, [%r31 + 0x0055]
cwp_1_404:
    set user_data_start, %o7
	.word 0x93902002  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_405)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_405:
	.word 0xa98171c9  ! 614: WR_SET_SOFTINT_I	wr	%r5, 0x11c9, %set_softint
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d902846  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
mondo_1_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d950013  ! 616: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
debug_1_408:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_408:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_408
    nop
debug_wait1_408:
    ld [%r23], %r16
    brnz %r16, debug_wait1_408
    nop
    ba,a debug_startwait1_408
continue_debug_1_408:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_408:
    cmp %r13, %r17
    bne,a wait_for_stat_1_408
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_408:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_408
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050f8c72827,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe53fc013  ! 617: STDF_R	std	%f18, [%r19, %r31]
pmu_1_409:
	nop
	setx 0xfffff490fffff718, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_410:
	setx 0x678230f0d2fde71b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 619: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 620: RDPR_TPC	<illegal instruction>
	setx 0x5080afe266033d8a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_411:
	.word 0x39400001  ! 621: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7b187e2  ! 622: PDISTN	fmean16	%d6, %d2, %d50
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_412
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_412:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 623: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe727e0aa  ! 624: STF_I	st	%f19, [0x00aa, %r31]
	.word 0xe64fc000  ! 625: LDSB_R	ldsb	[%r31 + %r0], %r19
pmu_1_413:
	nop
	setx 0xfffff014fffffdbe, %g1, %g7
	.word 0xa3800007  ! 626: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_1_414:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_414:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_414
    nop
cmp_wait1_414:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_414
    nop
    ba,a cmp_startwait1_414
continue_cmp_1_414:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x50, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940013  ! 627: WRPR_PIL_R	wrpr	%r16, %r19, %pil
	.word 0x9194b954  ! 628: WRPR_PIL_I	wrpr	%r18, 0x1954, %pil
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_415:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 629: RDPC	rd	%pc, %r10
change_to_randtl_1_416:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_416:
	.word 0x8f902001  ! 630: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x38700001  ! 631: BPGU	<illegal instruction>
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 632: Tcc_R	te	icc_or_xcc, %r0 + %r30
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_417:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 633: CASA_R	casa	[%r31] %asi, %r19, %r10
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_418
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_418:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e013  ! 634: CASA_R	casa	[%r31] %asi, %r19, %r10
fpinit_1_419:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 635: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x97464000  ! 636: RD_STICK_CMPR_REG	rd	%-, %r11
donret_1_420:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_420-donret_1_420-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005021fc | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x554, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	retry
donretarg_1_420:
	.word 0xd6ffe06c  ! 637: SWAPA_I	swapa	%r11, [%r31 + 0x006c] %asi
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_421
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_421
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_421:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 638: RDPC	rd	%pc, %r16
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 639: Tcc_R	te	icc_or_xcc, %r0 + %r30
cmp_1_422:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_422:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_422
    nop
cmp_wait1_422:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_422
    nop
    ba,a cmp_startwait1_422
continue_cmp_1_422:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 46, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91900003  ! 640: WRPR_PIL_R	wrpr	%r0, %r3, %pil
splash_cmpr_1_423:
	setx 0x545ed2c04af2b871, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 641: WR_STICK_REG_R	wr	%r0, %r1, %-
donret_1_424:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_424-donret_1_424-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0067b0fc | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	retry
donretarg_1_424:
	.word 0xe0ffe0ed  ! 642: SWAPA_I	swapa	%r16, [%r31 + 0x00ed] %asi
	.word 0xa5a00161  ! 643: FABSq	dis not found

memptr_1_425:
	set 0x60140000, %r31
	.word 0x8580f72c  ! 644: WRCCR_I	wr	%r3, 0x172c, %ccr
	.word 0xe48fe028  ! 645: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r18
splash_cmpr_1_426:
	setx 0xb063d34efa9dacd9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 646: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xdbb5eb0f4116b8a5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_427:
	.word 0x39400001  ! 647: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe457c000  ! 648: LDSH_R	ldsh	[%r31 + %r0], %r18
pmu_1_428:
	nop
	setx 0xfffffbd4fffffb4d, %g1, %g7
	.word 0xa3800007  ! 649: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe497e008  ! 650: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r18
	.word 0xe46fe032  ! 651: LDSTUB_I	ldstub	%r18, [%r31 + 0x0032]
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 652: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa7a00165  ! 653: FABSq	dis not found

	.word 0xe6800ac0  ! 654: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r19
splash_lsu_1_429:
	set 0xe955124e, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99540000  ! 656: RDPR_GL	<illegal instruction>
	.word 0x9f802c47  ! 657: SIR	sir	0x0c47
	fbo,a,pn	%fcc0,  skip_1_430
	.word 0xc3686298  ! 1: PREFETCH_I	prefetch	[%r1 + 0x0298], #one_read
.align 512
skip_1_430:
	.word 0x95a1c9c7  ! 658: FDIVd	fdivd	%f38, %f38, %f10
cmp_1_431:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_431:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_431
    nop
cmp_wait1_431:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_431
    nop
    ba,a cmp_startwait1_431
continue_cmp_1_431:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6e, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908014  ! 659: WRPR_PIL_R	wrpr	%r2, %r20, %pil
DS_1_432:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8d69dc54	! Random illegal ?
	.word 0x97a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x99a50831  ! 660: FADDs	fadds	%f20, %f17, %f12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 662: Tcc_R	ta	icc_or_xcc, %r0 + %r30
donret_1_433:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_433-donret_1_433-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x1198 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xace, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_433:
	.word 0xd8ffe014  ! 663: SWAPA_I	swapa	%r12, [%r31 + 0x0014] %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_434:
	ta	T_CHANGE_NONHPRIV	! macro
DS_1_435:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd7336be6  ! 1: STQF_I	-	%f11, [0x0be6, %r13]
	normalw
	.word 0x91458000  ! 665: RD_SOFTINT_REG	rd	%softint, %r8
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_436
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_436:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 666: RDPC	rd	%pc, %r13
splash_htba_1_437:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_438)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_438:
	.word 0xa980b853  ! 668: WR_SET_SOFTINT_I	wr	%r2, 0x1853, %set_softint
pmu_1_439:
	nop
	setx 0xfffff812fffffc37, %g1, %g7
	.word 0xa3800007  ! 669: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba309d2  ! 670: FDIVd	fdivd	%f12, %f18, %f44
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_440) + 16, 16, 16)) -> intp(6,0,3)
intvec_1_440:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xda5fc000  ! 672: LDX_R	ldx	[%r31 + %r0], %r13
DS_1_441:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 673: SAVE_R	save	%r31, %r0, %r31
	.word 0x2ecc0001  ! 1: BRGEZ	brgez,a,pt	%r16,<label_0xc0001>
	.word 0x8d903dd1  ! 674: WRPR_PSTATE_I	wrpr	%r0, 0x1dd1, %pstate
splash_hpstate_1_443:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x819823d5  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
pmu_1_444:
	nop
	setx 0xfffff087fffffed7, %g1, %g7
	.word 0xa3800007  ! 676: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_decr_1_445:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7850010  ! 677: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r16, %-
	.word 0xda77e000  ! 678: STX_I	stx	%r13, [%r31 + 0x0000]
jmptr_1_446:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 679: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9f8029f2  ! 680: SIR	sir	0x09f2
DS_1_447:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x99a00554  ! 1: FSQRTd	fsqrt	
	.word 0x9ba0c82a  ! 681: FADDs	fadds	%f3, %f10, %f13
	.word 0xda37e024  ! 682: STH_I	sth	%r13, [%r31 + 0x0024]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_448
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_448:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 683: RDPC	rd	%pc, %r9
pmu_1_449:
	nop
	setx 0xfffff04ffffff957, %g1, %g7
	.word 0xa3800007  ! 684: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_450:
	set 0x748a6592, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 685: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xed13dbe800e26a83, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_451:
	.word 0x39400001  ! 686: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_452:
	setx 0x80658dae489b467f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 687: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_453
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_453:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 688: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_hpstate_1_454:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8198275d  ! 689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
	.word 0x26800001  ! 690: BL	bl,a	<label_0x1>
splash_cmpr_1_455:
	setx 0x2a975e8456089334, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0xb1800001  ! 691: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd297e030  ! 692: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
splash_lsu_1_456:
	set 0xf062ea81, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 693: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab837215  ! 694: WR_CLEAR_SOFTINT_I	wr	%r13, 0x1215, %clear_softint
memptr_1_457:
	set 0x60340000, %r31
	.word 0x85802ec9  ! 695: WRCCR_I	wr	%r0, 0x0ec9, %ccr
splash_cmpr_1_458:
	setx 0x91227f95abc81fc2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0xb1800001  ! 696: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x3e800001  ! 697: BVC	bvc,a	<label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_459
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_459:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00a  ! 698: CASA_R	casa	[%r31] %asi, %r10, %r9
splash_decr_1_460:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa781c008  ! 699: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r8, %-
cmp_1_461:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_461:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_461
    nop
cmp_wait1_461:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_461
    nop
    ba,a cmp_startwait1_461
continue_cmp_1_461:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 46, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190400b  ! 700: WRPR_PIL_R	wrpr	%r1, %r11, %pil
	.word 0x9b454000  ! 701: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
cmpenall_1_462:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait1_462:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_1_462
    nop
cmpenall_wait1_462:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait1_462
    nop
    ba,a cmpenall_startwait1_462
continue_cmpenall_1_462:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_1_462:
    cmp %r13, %r14
    bne,a wait_for_cmpstat_1_462
    ldxa [0x58]%asi, %r14       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_1_462:
    cmp %r14, %r16
    bne,a wait_for_cmpstat2_1_462
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
.align 128
.global user_data_start
.data
user_data_start:

	.xword	0x05809a9323e4b668
	.xword	0xadce16d8d8929071
	.xword	0x0bd361e4988d18a9
	.xword	0x7412171068705304
	.xword	0x85e1e7af5b8f7cb1
	.xword	0x919e5b3dc56f3290
	.xword	0xa863cf6e4bffbcb0
	.xword	0x6641e4878e3fdff3
	.xword	0xd210c651b2f215d8
	.xword	0xabc6c9c2374f3673
	.xword	0x0b5881f1b7124704
	.xword	0x55bb070518ca9e43
	.xword	0x82db3f31495b9ee2
	.xword	0xd3cbd283ecd53537
	.xword	0x7550764bb58f9da7
	.xword	0x988300004ea563f6
	.xword	0x51764ecc2221373a
	.xword	0xdcfc9b090322d7d5
	.xword	0xd68fdbc00215a51a
	.xword	0xb54fb0a80c87637d
	.xword	0xcff302efb9736fcc
	.xword	0xf62774e6db7336c4
	.xword	0xb28515254f788bed
	.xword	0x03f42fe1ba82ec63
	.xword	0x976405bd5ac722ce
	.xword	0x86975d976f4d68d3
	.xword	0xf9887d019639b7ae
	.xword	0x606cb9c5ccdf858e
	.xword	0xbef41341d1cbf34e
	.xword	0x0f69ff87c51b2c77
	.xword	0x1378bfceffd276c7
	.xword	0x63062754033c7427
	.xword	0x52a2b2ace0c3ff35
	.xword	0x7aee21d854b1325d
	.xword	0xffe2e2bd213ffb0a
	.xword	0x2fe407cce6fcab91
	.xword	0xc5936b8f20d6021a
	.xword	0x201c505b1a5db774
	.xword	0x7efa28513a00daea
	.xword	0x02d713d407ef9a40
	.xword	0x62eb08e8502f7817
	.xword	0x3d873ad6c70eaf74
	.xword	0x067f1d8d98ed01e7
	.xword	0x094da890624c89a2
	.xword	0x865ce72540abafd0
	.xword	0x9da041d29b98a7b1
	.xword	0xcbc9b36c95b00aa6
	.xword	0xc04cba79b2afc1d3
	.xword	0xb89dea713d11764d
	.xword	0xe86f6aee28da909b
	.xword	0x3e6992b9ee8142c1
	.xword	0xb29a68563f6e9039
	.xword	0xb84716b395a9b315
	.xword	0xf2c65ae60ff572c1
	.xword	0x0797576e80bc5fb9
	.xword	0x8a5ef304e61341b3
	.xword	0xfaf112b75d02fbde
	.xword	0x433888a1cc577230
	.xword	0x1e6f58e16e77ecfd
	.xword	0x3a07f245f6fef963
	.xword	0xdec1c1a41c38e0dd
	.xword	0x3bc12c22e224beeb
	.xword	0x8f00c693eb2a7dfd
	.xword	0x33c84371834f7d85
	.xword	0x97908b5f14021d58
	.xword	0x2971d876300e0470
	.xword	0x25de3c147a4e88fe
	.xword	0xdb60e5524ea0bee6
	.xword	0x25ed8aed82f50a1c
	.xword	0x3a68d2f1b1bd606e
	.xword	0x97d2e8c30c91b987
	.xword	0xb12f104fadacff68
	.xword	0x6efd5c0f3ebf575f
	.xword	0x94ae7bf7354c4ec0
	.xword	0xd10dfb4e3f4fa4ee
	.xword	0x4d4b58dce8b4a727
	.xword	0x5c4416da2fc221a0
	.xword	0xeb0a2dfc8893880e
	.xword	0x68367b3293610489
	.xword	0xdafbcfead4f2ecb7
	.xword	0x69c032d026f0afac
	.xword	0x1c9578c2ee6ba28b
	.xword	0x0affd3a9fa7d4cb4
	.xword	0xb602ef8da9b5f62f
	.xword	0x6ee05ec688ee4266
	.xword	0xd684edc56339f06f
	.xword	0x2c8f2b46c14e38e8
	.xword	0xe1be1f5127cf566c
	.xword	0xa6f133c3f7c25607
	.xword	0xa4949d46cd8d8fb3
	.xword	0xe3553d9036f5b7da
	.xword	0x62d0be9e23fd4d24
	.xword	0x7b78caeacc5ede0e
	.xword	0xefce3f871e85e19d
	.xword	0x6433756ed199d0ac
	.xword	0x4500a0108053c100
	.xword	0x056545894ebbc7d2
	.xword	0xf327ee6ac80967ef
	.xword	0xaef598f0259672eb
	.xword	0xf73d81a81be2ef36
	.xword	0x4cfcd040743d3890
	.xword	0x2eaa3957d28813a8
	.xword	0x899b208a221878e7
	.xword	0x34365d1c7215e975
	.xword	0xd62d718ec7a232b7
	.xword	0x0c6e1dd7010ced2a
	.xword	0x5656cbb489cc8c2b
	.xword	0x6fd389171c7ae02a
	.xword	0x5544742951aa7437
	.xword	0xb51f7b2d37950018
	.xword	0x4cbfbf95a7a10a7a
	.xword	0x43b496fdca731957
	.xword	0x0b504d1dfb28a689
	.xword	0x2e717b80451ccef3
	.xword	0xe448899b062a7058
	.xword	0xa0b615f47739941c
	.xword	0x6f691423fd9c689a
	.xword	0x0d4218ed26fd619f
	.xword	0xb0ce3a3e438ba291
	.xword	0x27297c39578cfb16
	.xword	0xf394438044d71b37
	.xword	0x5af99d9d4a5e8df8
	.xword	0x7b249f0897121be4
	.xword	0xb86885134f8d113d
	.xword	0x0886a0f9ee8d5ef1
	.xword	0xf52dfc5c8de6f37a
	.xword	0xa9fb14f5c3f4f938
	.xword	0xcc4bc5255eeeda6b
	.xword	0x1588f6812a9028d8
	.xword	0x60e5abb9fc6d53b0
	.xword	0x055e72f68e379b44
	.xword	0xbb312128bd62643d
	.xword	0x69087b330c5c7f9a
	.xword	0x34f90359e7b20c42
	.xword	0xda20a8a926835ede
	.xword	0x6fc5d573aca7f61e
	.xword	0x5669acd148f93f36
	.xword	0x9240d605a86d7ac3
	.xword	0xf974da7542108fb9
	.xword	0x3887c9eb6bea5a07
	.xword	0x03eff57229cddd39
	.xword	0xca4276a9f8f3b5ad
	.xword	0x742d563267c212fd
	.xword	0x7920d1b3b2dc9fd9
	.xword	0xfb18f8efefeb712a
	.xword	0x0bd43a2b409358c9
	.xword	0x5e8970d4d202120a
	.xword	0xcd11610c74da85ad
	.xword	0x9ce24bf82c304a1b
	.xword	0x4c1c6986c150a8d9
	.xword	0x1f501928410072d8
	.xword	0xe44bab7221080725
	.xword	0x0991e98d802803fc
	.xword	0xa72dbf650cc45853
	.xword	0xd872a635d85f7275
	.xword	0xb7b918e5410dd8fe
	.xword	0xe19444d870dd4e51
	.xword	0x2c2a0cee6d06fee7
	.xword	0xab1fdc5901ed2ac5
	.xword	0x2aecabb171c596e6
	.xword	0xa8389762583ac5d6
	.xword	0x3923c126eae05cd5
	.xword	0x9893aed6776de51c
	.xword	0x25148ac74cb5991c
	.xword	0xeaddb0ff08895147
	.xword	0x0959e27f7a3f65e9
	.xword	0xd97ca8fa97a39274
	.xword	0xa60ebdc1f5e6fd32
	.xword	0xff2f170fd969144c
	.xword	0xf11476d314e94c59
	.xword	0x7e84eda07a5c9475
	.xword	0x65dfe4c497935ebb
	.xword	0x881144f57421642d
	.xword	0x461fdc9a49824806
	.xword	0x77728db96536800e
	.xword	0x3e36aa393122782e
	.xword	0x6b4f62244bb4e7f2
	.xword	0xb33d90f8842602df
	.xword	0xb5ed0483721d0cc7
	.xword	0x26801083619a419b
	.xword	0xfbc984b8547d2928
	.xword	0x6d84b3f1822cd7dd
	.xword	0x0e1e604bd5b469fc
	.xword	0x50cdeced20158bba
	.xword	0xfd02a81c906e2b19
	.xword	0x86fdc8c1ceda1752
	.xword	0x6352f48a5d800446
	.xword	0xca8ad81add7a8a74
	.xword	0x136f2045f5759ce7
	.xword	0xc015278c00c23702
	.xword	0x9e1fa8fe5f8c805c
	.xword	0xad173efa5aa481cb
	.xword	0xc568f2219ddce3dc
	.xword	0x5e89e8615e0e46ea
	.xword	0x3349ba33c48e3f0b
	.xword	0x498becc1d8406949
	.xword	0x5df544d1ed9972a6
	.xword	0x132b5903204415d7
	.xword	0xaff5884c618e4716
	.xword	0x3b6e31334b036d24
	.xword	0x19d1cce08d6ada78
	.xword	0x729496a437b45575
	.xword	0x9695de44900976a0
	.xword	0x29e3112856d04788
	.xword	0xde78af9e7c82e137
	.xword	0xb42d4d41474e5aa6
	.xword	0x1775707b4dad4845
	.xword	0x7dbcb4aa9fa3c2d2
	.xword	0xc54410e6245883c0
	.xword	0xbeea943c7b6d7b6a
	.xword	0x0f0664e9da8ff364
	.xword	0xdb3395153a0e4be8
	.xword	0xc81af46c802fc219
	.xword	0x469f3571e678b42d
	.xword	0x2fe587a513f422e4
	.xword	0xbb87790e0ffae97f
	.xword	0x17181f0650915dfa
	.xword	0xa9dec1257639b77c
	.xword	0xb74b5095c357c253
	.xword	0x33252983ca435bd9
	.xword	0x59dfa450ac264e0d
	.xword	0xe9b4c5dfb0c4b80f
	.xword	0xfdb74390656da986
	.xword	0xcd5916c82cfb0007
	.xword	0x9f72fd936d3b2952
	.xword	0x7fe0f3cb1ab465ce
	.xword	0x8e2158d4e34eaed4
	.xword	0xdb2defdf321d67c2
	.xword	0x72b4c173e6fc4a36
	.xword	0x0f4f0b2d092a5066
	.xword	0x06fa2401506e71ea
	.xword	0xc8718c8e17ea101d
	.xword	0xa979e59a350d8c34
	.xword	0xa92b32e66addb3cc
	.xword	0xd1aef6b092fe7c56
	.xword	0x6399f337f66e5d8a
	.xword	0x30b45dd5f3add6ae
	.xword	0x1c0afe53809c423b
	.xword	0x8185947c0451c827
	.xword	0x6772dde735aff589
	.xword	0xd0b6554856e4b34b
	.xword	0x099aba9409f01bdc
	.xword	0xf0ce59ff367ecda9
	.xword	0x5641713aa6850560
	.xword	0xab23209bcf1b2c06
	.xword	0x3343b5ee9fa15d51
	.xword	0xc13babd5e2da20ca
	.xword	0x8e0e336fc6d25950
	.xword	0x956ad32a740eeb66
	.xword	0xf832247686b66990
	.xword	0x85deb3b445323355
	.xword	0xe3036f50f54888bd
	.xword	0x1a3c5315132910dd
	.xword	0xac25649314de718e
	.xword	0xdec6ae5141c59087
	.xword	0xe9b21cf80683d512

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
# 768 "diag.j"
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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
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
	TTE_CV	 = 1,
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
	TTE_CP	 = 1,
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
	TTE_CV	 = 1,
	TTE_E	 = 0,
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
	Name	 = .MyDATA_0,
	RA	 = 0x0000000170100000,
	PA	 = ra2pa(0x0000000170100000,0),
	part_0_ctx_zero_tsb_config_1,
	part_0_ctx_nonzero_tsb_config_1,
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
	Name	 = .MyDATA_0,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_0,
	hypervisor
}

.data
	.xword	0x564bd3945d1cdaf2
	.xword	0x30e02746f0da3c7a
	.xword	0x59e92fa72e9b594c
	.xword	0xba901100f81efe64
	.xword	0x1010d0b42522cc84
	.xword	0xf502439b416e2061
	.xword	0x35dab722b4f13046
	.xword	0x18df7874af0c0bc9
	.xword	0x89100cf7f13583a1
	.xword	0x0e321d07bfad94f4
	.xword	0xafce140aa20b79b1
	.xword	0x8e67dcdd532a369e
	.xword	0xb25e056f5fc3724a
	.xword	0xf402b1a36d32f551
	.xword	0x03f5510e0a73d028
	.xword	0xbfd1ede7249df733
	.xword	0x2e881dc5dbf5abe4
	.xword	0xb8f1a5cca7ad87f3
	.xword	0x33a47ca40709a421
	.xword	0xc94387580c77ca04
	.xword	0x4fb34829ef2d9e0f
	.xword	0xfe05f886796e332b
	.xword	0x75f284741436206a
	.xword	0x6bd814c6501f33ed
	.xword	0x6d3a2a169fccd81a
	.xword	0x7a8e120e525659f1
	.xword	0x7286aa24005e6a25
	.xword	0xfebdd1e2d37bfbd4
	.xword	0x75b5e01736ccb650
	.xword	0xd3eab20976fb5b43
	.xword	0x55b48df58b43fdca
	.xword	0x2463d1ef23d3f029



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
	TTE_Size	 = 0,
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
	.xword	0xc21228ab3b8069c7
	.xword	0xf7e79eb2c6d3cfdf
	.xword	0x9be9f9e9bbdc93c2
	.xword	0x56ec53bab804843f
	.xword	0x9ae2921e96970093
	.xword	0xb426a53185046208
	.xword	0xfde64ed9967115c0
	.xword	0x7acdfe7d859b6ab8
	.xword	0x15220b431e2205b9
	.xword	0x68148ff146f13b42
	.xword	0x1d412e8272438b3a
	.xword	0xefc65611ff248032
	.xword	0x8f807c6981da8a48
	.xword	0x243993e000ae900f
	.xword	0x610e73d677742472
	.xword	0x3ed14e5cdea3b061
	.xword	0x8c5e8f34a48e30ee
	.xword	0x6d8d9a369bbb77a3
	.xword	0x8334e3f574c02cf7
	.xword	0xbae07256cec63837
	.xword	0x4ae7a242574f29b3
	.xword	0x0b91ceffe81bbfe8
	.xword	0xfad0edf83dd266fa
	.xword	0xd099da863a477e18
	.xword	0xeb4f1af4716d49cf
	.xword	0x2da3b7c7d85457b8
	.xword	0x47a617a0a0251270
	.xword	0xe1ff02c5ed55baef
	.xword	0x7fefeb4808079d16
	.xword	0x31f832f129154241
	.xword	0xcbef3d25f98effb8
	.xword	0xd801fb405141cbc8



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


attr_data {
	Name	 = .MyDATA_2,
	RA	 = 0x0000000170500000,
	PA	 = ra2pa(0x0000000170500000,0),
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
	.xword	0xa32cc385f3468f5c
	.xword	0x160bf15f10d148a0
	.xword	0x8889a78120484ab5
	.xword	0x4655606904c53f05
	.xword	0xc95b0b8f74f864bc
	.xword	0x3861683d6dc59ef4
	.xword	0x3be1adb6d4198225
	.xword	0x204b9d44cad5c070
	.xword	0x4db5abb795ff0138
	.xword	0x13d605ea32e8a0a4
	.xword	0xb054055e2dc8bf79
	.xword	0x3f0c40d57ab22137
	.xword	0x0d5b58265df3194f
	.xword	0xaca95dce0e13b05e
	.xword	0x6ddd1b4d2372a3b0
	.xword	0x8994e0ecf007b75d
	.xword	0x97b531ed9d5a84f7
	.xword	0xd84a25e77dea9147
	.xword	0x5a4daff8caf2ce97
	.xword	0x1a609a5eba561ad2
	.xword	0x7706868e38de9052
	.xword	0xbcb91e6a6492290c
	.xword	0x0d564cc67162dac6
	.xword	0x7b0799c2699cfd42
	.xword	0xf25c57f1c14da0e6
	.xword	0x953dd8b6906f0e86
	.xword	0x9059340d4cd242c9
	.xword	0x207671c8220465ac
	.xword	0xd8027553d0986c4b
	.xword	0x9da8d35a1256716e
	.xword	0x7887db98c333be7b
	.xword	0x5873147776af4f87



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
	.xword	0x710fe4a0fbd49978
	.xword	0x4d968154ba144a52
	.xword	0x67ad81fd1d79053f
	.xword	0x524e95ece0679594
	.xword	0x39be87f5f422734c
	.xword	0xb7be0a9d4a21a2a2
	.xword	0x19599b155fab5911
	.xword	0xab05c48f8b854eb3
	.xword	0x03b0d1abe8a125e4
	.xword	0xaedb4a9baee49772
	.xword	0x0ef4eed31a6d7769
	.xword	0x0a837c0ea109fcb3
	.xword	0x70066984892ef4d7
	.xword	0xb77133d164c84149
	.xword	0x8418a4a899e07bf7
	.xword	0x1609eaa9f52ceae2
	.xword	0x9fd0f6af21f2d872
	.xword	0x5b0f16d9c40e8155
	.xword	0x31dacae2eb3537bf
	.xword	0x49e78941ff09a7ed
	.xword	0x92037e5655b8bea8
	.xword	0xce5e44071e12a18e
	.xword	0x359be57574362b16
	.xword	0x5a48d017ec08ed12
	.xword	0x1718dc462bb51b33
	.xword	0xd9c9dd042b798d5b
	.xword	0xd91b697054d85700
	.xword	0xaa634ac70f2ca902
	.xword	0x07e446dab4567dcf
	.xword	0x82386fdb6a7f2bb6
	.xword	0xc28842e0d0464054
	.xword	0x2b60f4b111df467f





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
	TTE_Size	 = 5,
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
	TTE_W	 = 1
}

.text
nuff_said_1:
	fdivs %f0, %f4, %f4
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
	TTE_CP	 = 0,
	TTE_CV	 = 1,
	TTE_E	 = 0,
	TTE_P	 = 0,
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
	TTE_W	 = 0
}

.text
nuff_said_3:
	fdivs %f0, %f4, %f6
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f4



#if 0
#endif
