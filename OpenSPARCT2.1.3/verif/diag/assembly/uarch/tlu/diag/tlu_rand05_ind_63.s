/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_63.s
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
# 375 "diag.j"
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
# 422 "diag.j"
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
	mov 0xb2, %r14
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
	mov 0xb3, %r14
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
	mov 0xb5, %r14
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
    set CWQ_BASE, %l6

    !# write base addr to first, head, and tail ptr
    !# first store to first
    stxa    %l6, [%g0 + ASI_SPU_CWQ_FIRST] %asi	!# first store to first

    stxa    %l6, [%g0 + ASI_SPU_CWQ_HEAD] %asi	!# then to head
    stxa    %l6, [%g0 + ASI_SPU_CWQ_TAIL] %asi	!# then to tail
    setx CWQ_LAST, %g1, %l5				!# then end of CWQ region to LAST
    stxa    %l5, [%g0 + ASI_SPU_CWQ_LAST] %asi

    !# set  CWQ control word ([38:36] is strand ID ..)
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
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
mondo_80_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d92c001  ! 1: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
intveclr_80_1:
	setx 0xd6e5d40087f5e88c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_2:
	setx 0x479dc41b736a05ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 4: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_3
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_3:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 5: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_4)+32, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_4:
	.word 0xa982a963  ! 6: WR_SET_SOFTINT_I	wr	%r10, 0x0963, %set_softint
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_80_6:
	set user_data_start, %r31
	.word 0x8584b2d0  ! 8: WRCCR_I	wr	%r18, 0x12d0, %ccr
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_7
    set CWQ_BASE, %l6
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
	.word 0xa3414000  ! 9: RDPC	rd	%pc, %r17
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x8d902761  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x0761, %pstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_80_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_cmpr_80_11:
	setx 0x6872d289f066d60d, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_12) + 24, 16, 16)) -> intp(4,0,19)
intvec_80_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_13:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8198288d  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088d, %hpstate
	.word 0xe1bfd960  ! 16: STDFA_R	stda	%f16, [%r0, %r31]
pmu_80_14:
	nop
	setx 0xfffff321fffffc5a, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_80_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 19: FCMPLE32	fcmple32	%d0, %d4, %r4
donret_80_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_17-donret_80_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006b338e | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb56, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_17:
	.word 0xe6ffe078  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x0078] %asi
DS_80_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e07e  ! 23: STQF_I	-	%f19, [0x007e, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_80_20:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe838000c  ! 27: STD_R	std	%r20, [%r0 + %r12]
DS_80_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad852c60  ! 29: WR_SOFTINT_REG_I	wr	%r20, 0x0c60, %softint
	.word 0xe19fdb60  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_80_23:
	.word 0x81982d9f  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9f, %hpstate
	.word 0xd73fe0bd  ! 32: STDF_I	std	%f11, [0x00bd, %r31]
pmu_80_24:
	nop
	setx 0xfffffca7fffff1eb, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d940014  ! 34: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
mondo_80_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d95000b  ! 35: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	setx 0xc69852be51e79fe0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_28:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x81982d47  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d47, %hpstate
jmptr_80_29:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa9b00993  ! 39: BSHUFFLE	fmovc32	%d0, %d50, %d20
	.word 0xa9b444d4  ! 40: FCMPNE32	fcmpne32	%d48, %d20, %r20
jmptr_80_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_80_32:
	setx 0x4975899152b6c5f3, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_80_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_33-donret_80_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f90f4e | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_80_33:
	.word 0xd6ffe040  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x0040] %asi
debug_80_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_34:
	mov 0x481, %r20
	mov 0xa, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+24), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc003  ! 45: LDDF_R	ldd	[%r31, %r3], %f11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1b44981  ! 47: BSHUFFLE	fmovc32	%d48, %d32, %d16
	.word 0x95a00166  ! 48: FABSq	dis not found

memptr_80_36:
	set user_data_start, %r31
	.word 0x85842a7a  ! 49: WRCCR_I	wr	%r16, 0x0a7a, %ccr
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_37
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_37:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 50: RDPC	rd	%pc, %r12
DS_80_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_80_39:
	setx 0xfb32e0c02044faa9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_80_40:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe0ef  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x00ef]
donret_80_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_41-donret_80_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eb7f9e | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf44, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	done
donretarg_80_41:
	.word 0xe0ffe0f4  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x00f4] %asi
mondo_80_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d94c004  ! 56: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
DS_80_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_80_45:
	nop
	setx 0xfffff3adfffffaa1, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_80_46:
	nop
	setx 0xffffffd2fffff114, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 61: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_80_48:
	set user_data_start, %r31
	.word 0x8584e5fe  ! 64: WRCCR_I	wr	%r19, 0x05fe, %ccr
intveclr_80_49:
	setx 0xf1d758ab3373be5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
unsupttte_80_50:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a489c7  ! 67: FDIVd	fdivd	%f18, %f38, %f12
	.word 0xd427e058  ! 68: STW_I	stw	%r10, [%r31 + 0x0058]
splash_cmpr_80_51:
	setx 0x8129bfd8c7c95e29, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_52) + 0, 16, 16)) -> intp(5,0,1)
intvec_80_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_80_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f24, %f30
	.word 0x95b2430a  ! 71: ALIGNADDRESS	alignaddr	%r9, %r10, %r10
donret_80_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_54-donret_80_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003f4747 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x587, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_54:
	.word 0xe2ffe03c  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x003c] %asi
	.word 0x91b44993  ! 73: BSHUFFLE	fmovc32	%d48, %d50, %d8
	.word 0x9f802855  ! 74: SIR	sir	0x0855
	.word 0x9f803250  ! 75: SIR	sir	0x1250
fpinit_80_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 76: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91d020b2  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd8d7e018  ! 78: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r12
	.word 0x8d903752  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1752, %pstate
jmptr_80_58:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe070  ! 81: STDF_I	std	%f12, [0x0070, %r31]
	.word 0x91500000  ! 82: RDPR_TPC	rdpr	%tpc, %r8
mondo_80_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 83: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_60
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_60:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 84: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_61
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_61:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 85: RDPC	rd	%pc, %r13
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d903542  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x1542, %pstate
splash_lsu_80_63:
	ta T_CHANGE_HPRIV
	set 0xc4931ea5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_64:
	.word 0x819820d6  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d6, %hpstate
intveclr_80_65:
	setx 0x063800062ded8827, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd9e0802c  ! 90: CASA_I	casa	[%r2] 0x 1, %r12, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_66) + 0, 16, 16)) -> intp(5,0,9)
intvec_80_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_67:
	setx 0x0324b5901f6631a4, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_80_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_68:
	mov 0xa16, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c031  ! 93: LDUHA_R	lduha	[%r31, %r17] 0x01, %r9
splash_cmpr_80_69:
	setx 0x463cdf9b568f02cb, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_80_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_71:
	mov 0x85d, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc011  ! 96: STDF_R	std	%f9, [%r17, %r31]
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0xa7a00174  ! 98: FABSq	dis not found

pmu_80_72:
	nop
	setx 0xfffff656fffff184, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_73)+24, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_73:
	.word 0xa98029fa  ! 100: WR_SET_SOFTINT_I	wr	%r0, 0x09fa, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_80_74:
	.word 0x95a089c6  ! 1: FDIVd	fdivd	%f2, %f6, %f10
	pdist %f20, %f2, %f2
	.word 0xa7b1c305  ! 102: ALIGNADDRESS	alignaddr	%r7, %r5, %r19
fpinit_80_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 103: FCMPd	fcmpd	%fcc<n>, %f0, %f4
memptr_80_76:
	set 0x60340000, %r31
	.word 0x8581faf7  ! 104: WRCCR_I	wr	%r7, 0x1af7, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_80_77:
	nop
	setx 0xfffff193fffffc14, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_80_78:
	setx 0x3623e8b30b347db7, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_80_79:
	taddcctv %r17, 0x1826, %r17
	.word 0xe807e090  ! 109: LDUW_I	lduw	[%r31 + 0x0090], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d020b4  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 180
unsupttte_80_80:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87a88a44  ! 112: FCMPd	fcmpd	%fcc<n>, %f2, %f4
	.word 0xe66fe056  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x0056]
	.word 0x91d02033  ! 114: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_80_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91c00c  ! 115: WRPR_WSTATE_R	wrpr	%r7, %r12, %wstate
splash_htba_80_82:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8024cc  ! 117: SIR	sir	0x04cc
	.word 0xc19fdf20  ! 118: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x1b649bdff3d65d87, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 120: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_84
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_84:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 121: RDPC	rd	%pc, %r11
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 122: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d903268  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x1268, %pstate
splash_tba_80_86:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
pmu_80_87:
	nop
	setx 0xfffffe2bfffff6d1, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_88) + 40, 16, 16)) -> intp(2,0,12)
intvec_80_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe1bfe000  ! 128: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xd297e038  ! 129: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r9
splash_lsu_80_89:
	ta T_CHANGE_HPRIV
	set 0x5467bfbd, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_90:
	nop
	setx 0xfffff8cafffffbd5, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x9194226c  ! 133: WRPR_PIL_I	wrpr	%r16, 0x026c, %pil
mondo_80_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d944011  ! 134: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
mondo_80_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950008  ! 135: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a00171  ! 137: FABSq	dis not found

	.word 0x9f803eb3  ! 138: SIR	sir	0x1eb3
jmptr_80_94:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe3e4c023  ! 141: CASA_I	casa	[%r19] 0x 1, %r3, %r17
splash_lsu_80_95:
	ta T_CHANGE_HPRIV
	set 0xc96e00f3, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_80_96:
	nop
	setx 0xfffff411fffffd15, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_80_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_97:
	mov 0x6c1, %r20
	mov 0x7, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+56), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc021  ! 144: LDXA_R	ldxa	[%r31, %r1] 0x01, %r12
	.word 0xd897e020  ! 145: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0xa9500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_98) + 56, 16, 16)) -> intp(5,0,16)
intvec_80_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a489d3  ! 148: FDIVd	fdivd	%f18, %f50, %f42
splash_tba_80_99:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_80_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d924011  ! 150: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
splash_hpstate_80_101:
	.word 0x3c800001  ! 1: BPOS	bpos,a	<label_0x1>
	.word 0x819825c7  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c7, %hpstate
	rd %pc, %r19
	add %r19, (ivw_80_102-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_102:
	.word 0x91940013  ! 152: WRPR_PIL_R	wrpr	%r16, %r19, %pil
mondo_80_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 153: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d90368b  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x168b, %pstate
	.word 0xe1bfde00  ! 155: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f802fbd  ! 156: SIR	sir	0x0fbd
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_80_106:
	setx 0x1c45b065b85360b0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_80_107:
	set 0x60140000, %r31
	.word 0x8581f51b  ! 159: WRCCR_I	wr	%r7, 0x151b, %ccr
	.word 0xe1bfe0a0  ! 160: STDFA_I	stda	%f16, [0x00a0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_108)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_108:
	.word 0xa981fc8c  ! 161: WR_SET_SOFTINT_I	wr	%r7, 0x1c8c, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_80_111:
	nop
	setx 0xfffffac1fffff786, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe014  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x0014]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_112
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_112:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 167: RDPC	rd	%pc, %r9
	.word 0x97a00174  ! 168: FABSq	dis not found

	.word 0x9150c000  ! 169: RDPR_TT	<illegal instruction>
mondo_80_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d944001  ! 170: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0x99a00165  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_114
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_114:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 172: RDPC	rd	%pc, %r9
intveclr_80_115:
	setx 0x4fc77ce33aa9c1ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_116-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_116:
	.word 0x91934007  ! 174: WRPR_PIL_R	wrpr	%r13, %r7, %pil
	setx 0xf184ebb01c25aa60, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbuge skip_80_118
	.word 0x91a4c9cd  ! 1: FDIVd	fdivd	%f50, %f44, %f8
.align 1024
skip_80_118:
	.word 0xe3e7c020  ! 176: CASA_I	casa	[%r31] 0x 1, %r0, %r17
mondo_80_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c010  ! 177: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
pmu_80_120:
	nop
	setx 0xfffff503fffff369, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe028  ! 179: LDDA_I	ldda	[%r31, + 0x0028] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_121
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 180: RDPC	rd	%pc, %r20
change_to_randtl_80_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_122:
	.word 0x8f902001  ! 181: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_80_123:
	.word 0x819829e4  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09e4, %hpstate
DS_80_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd37db4aa	! Random illegal ?
	.word 0xa9a449d3  ! 1: FDIVd	fdivd	%f48, %f50, %f20
	.word 0x99a50833  ! 183: FADDs	fadds	%f20, %f19, %f12
	.word 0x91d020b3  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 179
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_125
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_125:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 185: RDPC	rd	%pc, %r19
DS_80_126:
	.word 0x99a449cc  ! 1: FDIVd	fdivd	%f48, %f12, %f12
	allclean
	.word 0xa9b20301  ! 186: ALIGNADDRESS	alignaddr	%r8, %r1, %r20
	.word 0x93d020b4  ! 187: Tcc_I	tne	icc_or_xcc, %r0 + 180
intveclr_80_127:
	setx 0x8670e9c33d6b7c04, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab8270ef  ! 189: WR_CLEAR_SOFTINT_I	wr	%r9, 0x10ef, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_128) + 8, 16, 16)) -> intp(2,0,0)
intvec_80_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_129:
	nop
	setx 0xffffff24fffff398, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe020  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x0020]
	rd %pc, %r19
	add %r19, (ivw_80_130-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_130:
	.word 0x91940014  ! 193: WRPR_PIL_R	wrpr	%r16, %r20, %pil
	.word 0xe19fdc00  ! 194: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad846291  ! 196: WR_SOFTINT_REG_I	wr	%r17, 0x0291, %softint
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe0e5  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x00e5]
intveclr_80_132:
	setx 0x4be74506b4a74673, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_133)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_133:
	.word 0xa982f030  ! 200: WR_SET_SOFTINT_I	wr	%r11, 0x1030, %set_softint
	.word 0x8d903287  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1287, %pstate
jmptr_80_135:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9037f9  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x17f9, %pstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x83d02035  ! 205: Tcc_I	te	icc_or_xcc, %r0 + 53
debug_80_138:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc001  ! 206: LDDF_R	ldd	[%r31, %r1], %f12
memptr_80_139:
	set 0x60140000, %r31
	.word 0x858439ea  ! 207: WRCCR_I	wr	%r16, 0x19ea, %ccr
	.word 0xa7a209d0  ! 208: FDIVd	fdivd	%f8, %f16, %f50
splash_hpstate_80_140:
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8198205d  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005d, %hpstate
	.word 0x91d02034  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x98a6cc1c83411568, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_142)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_142:
	.word 0xa982f08f  ! 214: WR_SET_SOFTINT_I	wr	%r11, 0x108f, %set_softint
DS_80_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f22, %f30
	.word 0x97b50303  ! 215: ALIGNADDRESS	alignaddr	%r20, %r3, %r11
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_144:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 216: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_80_145-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_145:
	.word 0x9194c005  ! 217: WRPR_PIL_R	wrpr	%r19, %r5, %pil
	.word 0x93b4c493  ! 218: FCMPLE32	fcmple32	%d50, %d50, %r9
debug_80_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_80_146:
	mov 0xff4, %r20
	mov 0xe, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe63fffa2  ! 219: STD_I	std	%r19, [%r31 + 0xffffffa2]
	.word 0xe71fe000  ! 220: LDDF_I	ldd	[%r31, 0x0000], %f19
	.word 0xc19fd960  ! 221: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x5129e1a5c3788638, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 223: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
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
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0x99b207eb  ! 225: PDISTN	fmean16	%d8, %d42, %d12
mondo_80_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d948007  ! 226: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
	.word 0xe4dfe030  ! 227: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_150)+24, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_150:
	.word 0xa9843c0d  ! 229: WR_SET_SOFTINT_I	wr	%r16, 0x1c0d, %set_softint
	.word 0xe46fe028  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x0028]
mondo_80_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d908012  ! 231: WRPR_WSTATE_R	wrpr	%r2, %r18, %wstate
jmptr_80_152:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x40c36521f96040ba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_80_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe334c014  ! 1: STQF_R	-	%f17, [%r20, %r19]
	normalw
	.word 0xa3458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x9f803bc8  ! 235: SIR	sir	0x1bc8
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 236: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_80_155:
	nop
	setx 0xffffff1ffffff855, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_80_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 239: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
debug_80_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_80_157:
	mov 0x475, %r20
	mov 0x14, %r19
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
	.word 0xe73fc014  ! 240: STDF_R	std	%f19, [%r20, %r31]
	.word 0x8d9034a5  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x14a5, %pstate
mondo_80_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d934010  ! 242: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f8021b9  ! 244: SIR	sir	0x01b9
	.word 0xa3a00170  ! 245: FABSq	dis not found

intveclr_80_161:
	setx 0x7dedb868bb65d885, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_80_162:
	nop
	setx 0xfffff682ffffff07, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_80_163:
	setx 0x7e3272643b880db2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	fbul skip_80_164
	.word 0x87ac8a48  ! 1: FCMPd	fcmpd	%fcc<n>, %f18, %f8
.align 2048
skip_80_164:
	.word 0xc36fe0b1  ! 250: PREFETCH_I	prefetch	[%r31 + 0x00b1], #one_read
debug_80_165:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 251: CASA_R	casa	[%r31] %asi, %r19, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_166) + 0, 16, 16)) -> intp(4,0,9)
intvec_80_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_167:
	setx 0x3b458c4f1a5ee72a, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_80_168:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_80_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d930014  ! 255: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
jmptr_80_170:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_80_171-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_171:
	.word 0x91948014  ! 257: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	.word 0x93a489cd  ! 258: FDIVd	fdivd	%f18, %f44, %f40
mondo_80_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d940012  ! 259: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 260: RDPC	rd	%pc, %r17
splash_lsu_80_174:
	ta T_CHANGE_HPRIV
	set 0x67703fdf, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0xa9b487f3  ! 263: PDISTN	fmean16	%d18, %d50, %d20
	.word 0xc1bfe020  ! 264: STDFA_I	stda	%f0, [0x0020, %r31]
intveclr_80_176:
	setx 0xf304ed88c6f275c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e0c9  ! 266: STX_I	stx	%r20, [%r31 + 0x00c9]
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_80_178:
	nop
	setx 0xfffff8c0fffff8c1, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe80fe010  ! 272: LDUB_I	ldub	[%r31 + 0x0010], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_180)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_180:
	.word 0xa980a4df  ! 273: WR_SET_SOFTINT_I	wr	%r2, 0x04df, %set_softint
jmptr_80_181:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_80_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 277: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xa1b4898b  ! 278: BSHUFFLE	fmovc32	%d18, %d42, %d16
	.word 0x87a84a4b  ! 279: FCMPd	fcmpd	%fcc<n>, %f32, %f42
	.word 0xe26fe03f  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x003f]
	setx 0xf84ede5888c77641, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_80_186:
	.word 0x81982e0e  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0e, %hpstate
cwp_80_187:
    set user_data_start, %o7
	.word 0x93902003  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
intveclr_80_188:
	setx 0x928ba58f12aee481, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe064  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x0064]
	.word 0x93d020b5  ! 286: Tcc_I	tne	icc_or_xcc, %r0 + 181
intveclr_80_189:
	setx 0xca5b3c2e51580181, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_80_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d948012  ! 288: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
fpinit_80_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83433  ! 289: PREFETCHA_I	prefetcha	[%r0, + 0xfffff433] %asi, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_192) + 40, 16, 16)) -> intp(7,0,11)
intvec_80_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_193:
	nop
	setx 0xfffff5fafffff2a6, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a089c3  ! 293: FDIVd	fdivd	%f2, %f34, %f48
fpinit_80_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 294: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x9194fb14  ! 295: WRPR_PIL_I	wrpr	%r19, 0x1b14, %pil
	.word 0x91d02033  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	fbuge skip_80_196
	fbuge,a,pn	%fcc0,  skip_80_196
.align 32
skip_80_196:
	.word 0xc36fe036  ! 299: PREFETCH_I	prefetch	[%r31 + 0x0036], #one_read
fpinit_80_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 300: FDIVs	fdivs	%f0, %f4, %f4
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 301: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 302: RDPC	rd	%pc, %r17
splash_lsu_80_199:
	ta T_CHANGE_HPRIV
	set 0x934ac615, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d924011  ! 304: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
memptr_80_201:
	set user_data_start, %r31
	.word 0x858375db  ! 305: WRCCR_I	wr	%r13, 0x15db, %ccr
	.word 0x9f8030d6  ! 306: SIR	sir	0x10d6
splash_lsu_80_202:
	ta T_CHANGE_HPRIV
	set 0x708665df, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f8037cf  ! 308: SIR	sir	0x17cf
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_203
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_203:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 309: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_204) + 56, 16, 16)) -> intp(3,0,5)
intvec_80_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_205
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 311: RDPC	rd	%pc, %r17
mondo_80_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d908011  ! 312: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
cwp_80_207:
    set user_data_start, %o7
	.word 0x93902003  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_80_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d918012  ! 315: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
unsupttte_80_209:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x9ba109b0  ! 317: FDIVs	fdivs	%f4, %f16, %f13
	.word 0xd91fe018  ! 318: LDDF_I	ldd	[%r31, 0x0018], %f12
	.word 0xe1bfd920  ! 319: STDFA_R	stda	%f16, [%r0, %r31]
memptr_80_210:
	set user_data_start, %r31
	.word 0x8584bcad  ! 320: WRCCR_I	wr	%r18, 0x1cad, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_80_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x97a0c9c2  ! 1: FDIVd	fdivd	%f34, %f2, %f42
	.word 0x9ba40828  ! 322: FADDs	fadds	%f16, %f8, %f13
	.word 0xe137e0f4  ! 323: STQF_I	-	%f16, [0x00f4, %r31]
pmu_80_212:
	nop
	setx 0xfffff93ffffff48f, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8020d8  ! 325: SIR	sir	0x00d8
mondo_80_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d90c005  ! 326: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
	.word 0xa66c8002  ! 327: UDIVX_R	udivx 	%r18, %r2, %r19
	.word 0x9f803d81  ! 328: SIR	sir	0x1d81
	.word 0xc1bfde00  ! 329: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa945c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe137e04a  ! 331: STQF_I	-	%f16, [0x004a, %r31]
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a049c9  ! 333: FDIVd	fdivd	%f32, %f40, %f16
	.word 0x83d02034  ! 334: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x99500000  ! 335: RDPR_TPC	rdpr	%tpc, %r12
intveclr_80_214:
	setx 0x0935da2b71bb098f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 50
	rd %pc, %r19
	add %r19, (ivw_80_215-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_215:
	.word 0x91944006  ! 338: WRPR_PIL_R	wrpr	%r17, %r6, %pil
	.word 0x9ba009d2  ! 339: FDIVd	fdivd	%f0, %f18, %f44
	.word 0xa7464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r19
pmu_80_216:
	nop
	setx 0xfffff53afffff4cb, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_218) + 32, 16, 16)) -> intp(3,0,27)
intvec_80_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_219
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_219:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 344: RDPC	rd	%pc, %r10
splash_htba_80_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9145c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xc1bfc2c0  ! 347: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa7a349d1  ! 348: FDIVd	fdivd	%f44, %f48, %f50
	setx 0xc5e43dd3484b34aa, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe000  ! 350: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r13
mondo_80_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d950001  ! 351: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_80_223:
	set 0x60140000, %r31
	.word 0x85847255  ! 353: WRCCR_I	wr	%r17, 0x1255, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe060  ! 355: STDA_I	stda	%r13, [%r31 + 0x0060] %asi
pmu_80_224:
	nop
	setx 0xfffff931fffffb92, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x95b40491  ! 358: FCMPLE32	fcmple32	%d16, %d48, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_225)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_225:
	.word 0xa9843a3d  ! 359: WR_SET_SOFTINT_I	wr	%r16, 0x1a3d, %set_softint
	.word 0x9f803488  ! 360: SIR	sir	0x1488
intveclr_80_226:
	setx 0x868f41d2eabd3f4b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_80_228:
	set user_data_start, %r31
	.word 0x85816b64  ! 363: WRCCR_I	wr	%r5, 0x0b64, %ccr
	.word 0x83d02032  ! 364: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x91b44490  ! 365: FCMPLE32	fcmple32	%d48, %d16, %r8
	.word 0x9f803678  ! 366: SIR	sir	0x1678
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_229)+24, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_229:
	.word 0xa984300c  ! 367: WR_SET_SOFTINT_I	wr	%r16, 0x100c, %set_softint
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_230:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 368: RDPC	rd	%pc, %r12
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x93a00173  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_80_232-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_232:
	.word 0x91948000  ! 372: WRPR_PIL_R	wrpr	%r18, %r0, %pil
splash_decr_80_233:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7848010  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
DS_80_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d9038c0  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x18c0, %pstate
intveclr_80_237:
	setx 0xb35b44d15bda6df6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a409c6  ! 378: FDIVd	fdivd	%f16, %f6, %f12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_238) + 48, 16, 16)) -> intp(5,0,13)
intvec_80_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_80_239:
	.word 0xa7a489d4  ! 1: FDIVd	fdivd	%f18, %f20, %f50
	.word 0xdb34235d  ! 1: STQF_I	-	%f13, [0x035d, %r16]
	normalw
	.word 0x97458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r11
splash_hpstate_80_240:
	.word 0x819823bc  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03bc, %hpstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_242
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_242:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 383: RDPC	rd	%pc, %r8
	.word 0xe127e05e  ! 384: STF_I	st	%f16, [0x005e, %r31]
DS_80_243:
	.word 0x97a109d2  ! 1: FDIVd	fdivd	%f4, %f18, %f42
	.word 0xdb336f43  ! 1: STQF_I	-	%f13, [0x0f43, %r13]
	normalw
	.word 0xa3458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r17
fpinit_80_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 386: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xe1bfdb60  ! 387: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d02033  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_80_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d950013  ! 389: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_246) + 48, 16, 16)) -> intp(2,0,15)
intvec_80_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_247
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_247:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 391: RDPC	rd	%pc, %r19
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_80_248:
	setx 0x2be67382141f6df1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_249-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_249:
	.word 0x91948013  ! 394: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	.word 0xe62fe02e  ! 395: STB_I	stb	%r19, [%r31 + 0x002e]
fpinit_80_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82503  ! 396: PREFETCHA_I	prefetcha	[%r0, + 0x0503] %asi, #one_read
mondo_80_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d900014  ! 397: WRPR_WSTATE_R	wrpr	%r0, %r20, %wstate
DS_80_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe9350008  ! 1: STQF_R	-	%f20, [%r8, %r20]
	normalw
	.word 0xa5458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xe1bfe0e0  ! 399: STDFA_I	stda	%f16, [0x00e0, %r31]
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_80_253:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_254
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_254:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 402: RDPC	rd	%pc, %r13
fpinit_80_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 403: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9745c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xe8dfe030  ! 407: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 408: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_80_257:
	nop
	setx 0xfffffabbfffff6c4, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_80_258:
	ta T_CHANGE_HPRIV
	set 0x557ecca2, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_259:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_80_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7844014  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
	.word 0x9f802f22  ! 413: SIR	sir	0x0f22
memptr_80_261:
	set user_data_start, %r31
	.word 0x8581a738  ! 414: WRCCR_I	wr	%r6, 0x0738, %ccr
mondo_80_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d914010  ! 415: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x8d9023ee  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x03ee, %pstate
	.word 0xa5a00170  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_264
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_264:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 418: RDPC	rd	%pc, %r9
pmu_80_265:
	nop
	setx 0xfffffd45fffff562, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02034  ! 420: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa7a509c6  ! 421: FDIVd	fdivd	%f20, %f6, %f50
	.word 0xe427e02c  ! 422: STW_I	stw	%r18, [%r31 + 0x002c]
	rd %pc, %r19
	add %r19, (ivw_80_266-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_266:
	.word 0x91904008  ! 423: WRPR_PIL_R	wrpr	%r1, %r8, %pil
	.word 0x93500000  ! 424: RDPR_TPC	rdpr	%tpc, %r9
	fbne,a,pn	%fcc0,  skip_80_267
	fbne skip_80_267
.align 2048
skip_80_267:
	.word 0xc36fe0ad  ! 425: PREFETCH_I	prefetch	[%r31 + 0x00ad], #one_read
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_268) + 8, 16, 16)) -> intp(4,0,28)
intvec_80_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_80_269:
	setx 0xb89a967732473167, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_80_270:
	set user_data_start, %r31
	.word 0x85852a21  ! 429: WRCCR_I	wr	%r20, 0x0a21, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_271:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 430: RDPC	rd	%pc, %r10
    set 0x1d25, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b1c7f3  ! 431: PDISTN	fmean16	%d38, %d50, %d20
	.word 0x93d02032  ! 432: Tcc_I	tne	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_272
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_272:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 433: RDPC	rd	%pc, %r9
	.word 0x83d02035  ! 434: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa3a00170  ! 435: FABSq	dis not found

splash_hpstate_80_273:
	.word 0x2cca4001  ! 1: BRGZ	brgz,a,pt	%r9,<label_0xa4001>
	.word 0x81982696  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0696, %hpstate
intveclr_80_274:
	setx 0xeb2dd70a936c00f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe030  ! 438: LDD_I	ldd	[%r31 + 0x0030], %r20
	rd %pc, %r19
	add %r19, (ivw_80_275-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_275:
	.word 0x91918014  ! 439: WRPR_PIL_R	wrpr	%r6, %r20, %pil
donret_80_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_276-donret_80_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0029ecf3 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfd7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	retry
donretarg_80_276:
	.word 0xe8ffe019  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x0019] %asi
splash_hpstate_80_277:
	.word 0x819821c7  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0x53439f21ceeee4b5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_80_280:
	nop
	setx 0xffffffacffffffcf, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_80_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_281:
	.word 0x8f902001  ! 445: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_80_282:
	setx 0x44418ce33f0fc3a6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc3e0  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe93fe05a  ! 448: STDF_I	std	%f20, [0x005a, %r31]
	.word 0xe1bfde00  ! 449: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe8dfe038  ! 450: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r20
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d902f8c  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x0f8c, %pstate
	.word 0x87aaca51  ! 452: FCMPd	fcmpd	%fcc<n>, %f42, %f48
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	brnz,a,pt	%r6, skip_80_284
	brnz,pt  	%r5, skip_80_284
.align 32
skip_80_284:
	.word 0xc36fe00d  ! 454: PREFETCH_I	prefetch	[%r31 + 0x000d], #one_read
	.word 0x97a049d2  ! 455: FDIVd	fdivd	%f32, %f18, %f42
splash_cmpr_80_285:
	setx 0x32f05dcfc99a4ad5, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_80_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d908013  ! 457: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
	.word 0xc1bfda00  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fe0a0  ! 459: LDDFA_I	ldda	[%r31, 0x00a0], %f0
pmu_80_287:
	nop
	setx 0xfffff844fffffbf9, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_80_288:
	.word 0x9ba309d0  ! 1: FDIVd	fdivd	%f12, %f16, %f44
	allclean
	.word 0x99b0c30a  ! 461: ALIGNADDRESS	alignaddr	%r3, %r10, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 462: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xa3c32f724b75c1f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_290)+0, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_290:
	.word 0xa9813bae  ! 464: WR_SET_SOFTINT_I	wr	%r4, 0x1bae, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_291)+8, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_291:
	.word 0xa984e79e  ! 465: WR_SET_SOFTINT_I	wr	%r19, 0x079e, %set_softint
	.word 0xe20fe020  ! 466: LDUB_I	ldub	[%r31 + 0x0020], %r17
	.word 0xa3540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0xa150c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_292
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_292:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 469: RDPC	rd	%pc, %r12
	.word 0x9f8030c4  ! 470: SIR	sir	0x10c4
intveclr_80_293:
	setx 0x82b4d64e9b33574e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_80_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 472: FDIVs	fdivs	%f0, %f4, %f4
pmu_80_295:
	nop
	setx 0xfffff8f1fffff308, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_80_296:
	.word 0x81982b1e  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1e, %hpstate
donret_80_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_297-donret_80_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e9500e | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x145, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (80)
	done
donretarg_80_297:
	.word 0xe2ffe04f  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x004f] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02035  ! 477: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_80_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5541bd6	! Random illegal ?
	.word 0xd5110013  ! 1: LDQF_R	-	[%r4, %r19], %f10
	.word 0xa3a48832  ! 478: FADDs	fadds	%f18, %f18, %f17
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xa3b48987  ! 480: BSHUFFLE	fmovc32	%d18, %d38, %d48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_80_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_80_302:
	setx 0x0b66672a34d04f13, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe0bb  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x00bb]
	.word 0x9f803cd2  ! 484: SIR	sir	0x1cd2
	setx 0xc9ad10cf08c7d68e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba4c9c8  ! 486: FDIVd	fdivd	%f50, %f8, %f44
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 487: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d902da9  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x0da9, %pstate
	.word 0xa1b307f0  ! 489: PDISTN	fmean16	%d12, %d16, %d16
	.word 0x99a00171  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_305
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_305:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 491: RDPC	rd	%pc, %r13
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_80_306:
	setx 0xdd775ac43ef336c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803d61  ! 495: SIR	sir	0x1d61
	.word 0x99a00174  ! 496: FABSq	dis not found

	.word 0x9ba489b4  ! 497: FDIVs	fdivs	%f18, %f20, %f13
	.word 0xc19fe020  ! 498: LDDFA_I	ldda	[%r31, 0x0020], %f0
	.word 0xd64fe018  ! 499: LDSB_I	ldsb	[%r31 + 0x0018], %r11
	.word 0xa5b1c986  ! 500: BSHUFFLE	fmovc32	%d38, %d6, %d18
	.word 0x99a00171  ! 501: FABSq	dis not found

DS_80_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_80_309:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9750c000  ! 504: RDPR_TT	rdpr	%tt, %r11
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f8038e7  ! 506: SIR	sir	0x18e7
jmptr_80_311:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_312
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_312:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 508: RDPC	rd	%pc, %r16
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xe19fda00  ! 510: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_314) + 0, 16, 16)) -> intp(7,0,26)
intvec_80_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_80_315:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_80_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb519756	! Random illegal ?
	.word 0xa1a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa1a08829  ! 513: FADDs	fadds	%f2, %f9, %f16
memptr_80_317:
	set 0x60540000, %r31
	.word 0x8584f4a5  ! 514: WRCCR_I	wr	%r19, 0x14a5, %ccr
splash_lsu_80_318:
	ta T_CHANGE_HPRIV
	set 0x33e481e0, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x019a7ad0249e429d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_80_320:
	setx 0xd3b54a84197892b8, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_80_321:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00d  ! 519: CASA_R	casa	[%r31] %asi, %r13, %r9
memptr_80_322:
	set 0x60740000, %r31
	.word 0x85853be0  ! 520: WRCCR_I	wr	%r20, 0x1be0, %ccr
	.word 0xd25fe030  ! 521: LDX_I	ldx	[%r31 + 0x0030], %r9
fpinit_80_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 522: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x83d020b3  ! 523: Tcc_I	te	icc_or_xcc, %r0 + 179
change_to_randtl_80_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_80_324:
	.word 0x8f902000  ! 524: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab84c011  ! 525: WR_CLEAR_SOFTINT_R	wr	%r19, %r17, %clear_softint
	.word 0xd26fe085  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x0085]
	setx 0x897d440c5d1564d8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_80_326-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_326:
	.word 0x91930001  ! 528: WRPR_PIL_R	wrpr	%r12, %r1, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_80_327:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd2bfc020  ! 532: STDA_R	stda	%r9, [%r31 + %r0] 0x01
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_328
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_328:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 533: RDPC	rd	%pc, %r11
	.word 0xe26fe06d  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x006d]
	.word 0x93520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d90306f  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x106f, %pstate
mondo_80_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d914012  ! 537: WRPR_WSTATE_R	wrpr	%r5, %r18, %wstate
	.word 0x9f8027a1  ! 538: SIR	sir	0x07a1
mondo_80_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 539: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_80_332:
	setx 0x05b5fd55de0eee3c, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_80_333:
	setx 0x400b69bdaab6219c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_334
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_334:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 544: RDPC	rd	%pc, %r12
pmu_80_335:
	nop
	setx 0xfffff1f9fffffe7d, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_80_336:
	setx 0x2e070479021c5208, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_80_337:
	setx 0x2d7c7ec934207f4d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 181
	rd %pc, %r19
	add %r19, (ivw_80_338-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_338:
	.word 0x91934013  ! 549: WRPR_PIL_R	wrpr	%r13, %r19, %pil
splash_lsu_80_339:
	ta T_CHANGE_HPRIV
	set 0x337e7acc, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d900004  ! 551: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
	.word 0xe19fe0c0  ! 552: LDDFA_I	ldda	[%r31, 0x00c0], %f16
	setx 0x15a43ff0d7abd79b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe018  ! 554: LDUB_I	ldub	[%r31 + 0x0018], %r9
	.word 0x8d902fe0  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x0fe0, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_80_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_80_343-donret_80_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e29bf9 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xc8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (80)
	done
donretarg_80_343:
	.word 0xd2ffe03e  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x003e] %asi
	.word 0x8d903763  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x1763, %pstate
mondo_80_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d90c011  ! 559: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
splash_lsu_80_346:
	ta T_CHANGE_HPRIV
	set 0x98a49ef2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa2ac4013  ! 561: ANDNcc_R	andncc 	%r17, %r19, %r17
jmptr_80_347:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_80_348:
	setx 0x81900ab3e3b07d9c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_80_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe22fe093  ! 565: STB_I	stb	%r17, [%r31 + 0x0093]
	.word 0xe19fdf20  ! 566: LDDFA_R	ldda	[%r31, %r0], %f16
tagged_80_350:
	tsubcctv %r5, 0x18b5, %r12
	.word 0xe207e016  ! 567: LDUW_I	lduw	[%r31 + 0x0016], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_80_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_352
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_352:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 569: RDPC	rd	%pc, %r17
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_80_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 571: FDIVs	fdivs	%f0, %f4, %f8
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
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
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_80_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 574: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	fbule,a,pn	%fcc0,  skip_80_358
	fbuge,a,pn	%fcc0,  skip_80_358
.align 512
skip_80_358:
	.word 0xe7e7c020  ! 575: CASA_I	casa	[%r31] 0x 1, %r0, %r19
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_360)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_360:
	.word 0xa984ff1b  ! 577: WR_SET_SOFTINT_I	wr	%r19, 0x1f1b, %set_softint
memptr_80_361:
	set 0x60140000, %r31
	.word 0x85833f93  ! 578: WRCCR_I	wr	%r12, 0x1f93, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_80_362:
	.word 0x8198280c  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080c, %hpstate
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 581: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_80_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e823f3  ! 582: PREFETCHA_I	prefetcha	[%r0, + 0x03f3] %asi, #one_read
	.word 0xab81c013  ! 583: WR_CLEAR_SOFTINT_R	wr	%r7, %r19, %clear_softint
	.word 0xab82ed98  ! 584: WR_CLEAR_SOFTINT_I	wr	%r11, 0x0d98, %clear_softint
pmu_80_364:
	nop
	setx 0xfffffce3fffff8c2, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_365
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_365:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 586: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_366
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_366:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 587: RDPC	rd	%pc, %r20
change_to_randtl_80_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_80_367:
	.word 0x8f902000  ! 588: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
invtsb_80_368:
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
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0x97a00170  ! 590: FABSq	dis not found

	.word 0xd037e05a  ! 591: STH_I	sth	%r8, [%r31 + 0x005a]
	rd %pc, %r19
	add %r19, (ivw_80_369-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_369:
	.word 0x91944012  ! 592: WRPR_PIL_R	wrpr	%r17, %r18, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_80_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 594: FCMPLE32	fcmple32	%d0, %d4, %r8
mondo_80_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e8] %asi
	.word 0x9d93000b  ! 595: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
	.word 0xd04fe028  ! 596: LDSB_I	ldsb	[%r31 + 0x0028], %r8
DS_80_372:
	.word 0x93a489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f40
	allclean
	.word 0x95b0830d  ! 597: ALIGNADDRESS	alignaddr	%r2, %r13, %r10
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_373
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_373:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 598: RDPC	rd	%pc, %r11
mondo_80_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d92c001  ! 599: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
DS_80_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe1bfdb60  ! 601: STDFA_R	stda	%f16, [%r0, %r31]
pmu_80_376:
	nop
	setx 0xfffff4b6fffff2e4, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_80_377:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 604: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_80_378:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_80_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d900013  ! 607: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xe19fc2c0  ! 608: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91d020b4  ! 609: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_80_380:
	setx 0xe3bf9a2db25a5e31, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0x0b39f8a0cc00853d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00161  ! 613: FABSq	dis not found

splash_cmpr_80_382:
	setx 0x4e7854ec4fbabbfa, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_80_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 615: FCMPd	fcmpd	%fcc<n>, %f0, %f4
jmptr_80_384:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fd920  ! 617: LDDFA_R	ldda	[%r31, %r0], %f16
	bpos,a	 skip_80_385
	bge  	 skip_80_385
.align 32
skip_80_385:
	.word 0xe03fc000  ! 618: STD_R	std	%r16, [%r31 + %r0]
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_386
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_386:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 619: RDPC	rd	%pc, %r13
pmu_80_387:
	nop
	setx 0xfffff27bfffffab8, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_388
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_388:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 621: RDPC	rd	%pc, %r17
pmu_80_389:
	nop
	setx 0xfffffb70fffffc8f, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe093  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x0093]
fpinit_80_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 624: FDIVs	fdivs	%f0, %f4, %f8
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a1c9d2  ! 626: FDIVd	fdivd	%f38, %f18, %f20
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_80_391:
	nop
	setx 0xfffffb22fffffacf, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a2c9c4  ! 629: FDIVd	fdivd	%f42, %f4, %f8
	.word 0xe4bfe05a  ! 630: STDA_I	stda	%r18, [%r31 + 0x005a] %asi
	.word 0xe1bfe0a0  ! 631: STDFA_I	stda	%f16, [0x00a0, %r31]
	.word 0xe527e053  ! 632: STF_I	st	%f18, [0x0053, %r31]
tagged_80_392:
	tsubcctv %r16, 0x1f6a, %r19
	.word 0xe407e0a5  ! 633: LDUW_I	lduw	[%r31 + 0x00a5], %r18
	.word 0x9ba00172  ! 634: FABSq	dis not found

	.word 0xe19fdc00  ! 635: LDDFA_R	ldda	[%r31, %r0], %f16
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 636: Tcc_R	tne	icc_or_xcc, %r0 + %r30
unsupttte_80_393:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9a289ca  ! 637: FDIVd	fdivd	%f10, %f10, %f20
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_80_395:
	setx 0x105f44dbc9ddf753, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 641: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_80_396:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7844013  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r19, %-
	rd %pc, %r19
	add %r19, (ivw_80_397-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_397:
	.word 0x91940001  ! 643: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	.word 0xe0d7e010  ! 644: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_80_399:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_80_400:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x8198288d  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088d, %hpstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_80_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d950005  ! 649: WRPR_WSTATE_R	wrpr	%r20, %r5, %wstate
	.word 0x95a189d1  ! 650: FDIVd	fdivd	%f6, %f48, %f10
	.word 0x9ba0016a  ! 651: FABSq	dis not found

mondo_80_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d910014  ! 652: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
    mov (80+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_80_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_80_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xc19fc2c0  ! 654: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x458b140bb855fbbc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_80_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_80_406:
	setx 0xcf308b6074411291, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_80_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d948008  ! 657: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0xe06fe01f  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x001f]
splash_cmpr_80_408:
	setx 0x3927b8cf8cb442a2, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_409
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 660: RDPC	rd	%pc, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_410) + 16, 16, 16)) -> intp(3,0,8)
intvec_80_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f802879  ! 663: SIR	sir	0x0879
DS_80_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa5a1c9cb  ! 1: FDIVd	fdivd	%f38, %f42, %f18
	.word 0xa9a00550  ! 1: FSQRTd	fsqrt	
	.word 0x97a10824  ! 664: FADDs	fadds	%f4, %f4, %f11
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd83fe070  ! 667: STD_I	std	%r12, [%r31 + 0x0070]
mondo_80_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d930000  ! 668: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
mondo_80_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d930008  ! 669: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0xa7a00172  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_80_414) + 40, 16, 16)) -> intp(7,0,4)
intvec_80_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a1c9d4  ! 673: FDIVd	fdivd	%f38, %f20, %f12
	.word 0xe5e2c032  ! 674: CASA_I	casa	[%r11] 0x 1, %r18, %r18
	fbg,a,pn	%fcc0,  skip_80_415
	fbe skip_80_415
.align 1024
skip_80_415:
	.word 0xc36fe025  ! 675: PREFETCH_I	prefetch	[%r31 + 0x0025], #one_read
splash_lsu_80_416:
	ta T_CHANGE_HPRIV
	set 0x79e4eec5, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_80_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d950007  ! 677: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0xe88fe030  ! 678: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r20
cwp_80_418:
    set user_data_start, %o7
	.word 0x93902000  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x95a509c1  ! 680: FDIVd	fdivd	%f20, %f32, %f10
mondo_80_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d924012  ! 681: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803106  ! 683: SIR	sir	0x1106
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_80_420)+40, 16, 16)) -> intp(mask2tid(0x80),1,3)
xir_80_420:
	.word 0xa9847e8f  ! 684: WR_SET_SOFTINT_I	wr	%r17, 0x1e8f, %set_softint
pmu_80_421:
	nop
	setx 0xfffffe3efffff39e, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 686: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97a509d1  ! 687: FDIVd	fdivd	%f20, %f48, %f42
	rd %pc, %r19
	add %r19, (ivw_80_422-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_80_422:
	.word 0x91940006  ! 688: WRPR_PIL_R	wrpr	%r16, %r6, %pil
	.word 0xc19fdf20  ! 689: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91927f49  ! 690: WRPR_PIL_I	wrpr	%r9, 0x1f49, %pil
	.word 0x99902000  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd097e000  ! 692: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
splash_cmpr_80_423:
	setx 0xa29e69a917079a6e, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d903229  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x1229, %pstate
	.word 0x91d020b3  ! 695: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa3a00171  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_425
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_425:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 697: RDPC	rd	%pc, %r13
	.word 0xd6d7e000  ! 698: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
pmu_80_426:
	nop
	setx 0xfffff305fffff7e1, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe19fd960  ! 700: LDDFA_R	ldda	[%r31, %r0], %f16
    ta T_CHANGE_HPRIV
    mov (80+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_80_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_80_427
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_80_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 701: RDPC	rd	%pc, %r17
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
mondo_40_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d910004  ! 1: WRPR_WSTATE_R	wrpr	%r4, %r4, %wstate
intveclr_40_1:
	setx 0x99c40167347aafe4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_2:
	setx 0xa024aaf8b52900a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_3
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_3:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 5: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_4)+56, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_4:
	.word 0xa981f328  ! 6: WR_SET_SOFTINT_I	wr	%r7, 0x1328, %set_softint
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_40_6:
	set user_data_start, %r31
	.word 0x85837518  ! 8: WRCCR_I	wr	%r13, 0x1518, %ccr
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_7
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 9: RDPC	rd	%pc, %r16
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8d902fba  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x0fba, %pstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_40_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_40_11:
	setx 0x0b8717f8093f392a, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_12) + 24, 16, 16)) -> intp(2,0,16)
intvec_40_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_13:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8198210c  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010c, %hpstate
	.word 0xc1bfe060  ! 16: STDFA_I	stda	%f0, [0x0060, %r31]
pmu_40_14:
	nop
	setx 0xfffff5a3fffffc00, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_40_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 19: FCMPLE32	fcmple32	%d0, %d4, %r8
donret_40_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_17-donret_40_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00931dd9 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf1e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_17:
	.word 0xe6ffe0a6  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x00a6] %asi
DS_40_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e0d0  ! 23: STQF_I	-	%f19, [0x00d0, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_40_20:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xc368666c  ! 27: PREFETCH_I	prefetch	[%r1 + 0x066c], #one_read
DS_40_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad85348f  ! 29: WR_SOFTINT_REG_I	wr	%r20, 0x148f, %softint
	.word 0xc19fd920  ! 30: LDDFA_R	ldda	[%r31, %r0], %f0
splash_hpstate_40_23:
	.word 0x81982b5f  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
	.word 0xd73fe0e5  ! 32: STDF_I	std	%f11, [0x00e5, %r31]
pmu_40_24:
	nop
	setx 0xfffffaccfffff332, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d934000  ! 34: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
mondo_40_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d948000  ! 35: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	setx 0xb4fc70d75da478b1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_28:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x81982a17  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
jmptr_40_29:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
tglhtw_40_30:
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
	.word 0x91b0c98a  ! 39: BSHUFFLE	fmovc32	%d34, %d10, %d8
	.word 0x24cc4001  ! 40: BRLEZ	brlez,a,pt	%r17,<label_0xc4001>
jmptr_40_31:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_40_32:
	setx 0x278e5f0ae854c929, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_40_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_33-donret_40_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0078aa97 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x5dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_40_33:
	.word 0xd6ffe060  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x0060] %asi
debug_40_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_34:
	mov 0x404, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc023  ! 45: LDXA_R	ldxa	[%r31, %r3] 0x01, %r11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
tglhtw_40_35:
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
	.word 0xa9b50988  ! 47: BSHUFFLE	fmovc32	%d20, %d8, %d20
	.word 0x95a00160  ! 48: FABSq	dis not found

memptr_40_36:
	set user_data_start, %r31
	.word 0x8583323b  ! 49: WRCCR_I	wr	%r12, 0x123b, %ccr
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_37
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_37:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 50: RDPC	rd	%pc, %r11
DS_40_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_40_39:
	setx 0xe95de0eb35bf2598, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_40_40:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe04c  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x004c]
donret_40_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_41-donret_40_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00f0bf1a | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa9c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	done
donretarg_40_41:
	.word 0xe0ffe05d  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x005d] %asi
mondo_40_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d940014  ! 56: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
DS_40_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_40_45:
	nop
	setx 0xfffff063fffff12a, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_40_46:
	nop
	setx 0xfffff714fffff866, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d900005  ! 61: WRPR_WSTATE_R	wrpr	%r0, %r5, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_40_48:
	set user_data_start, %r31
	.word 0x858322f9  ! 64: WRCCR_I	wr	%r12, 0x02f9, %ccr
intveclr_40_49:
	setx 0x1f65bb4dbeb2bfd2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0xc3eb4021  ! 67: PREFETCHA_R	prefetcha	[%r13, %r1] 0x01, #one_read
	.word 0xd427e0a1  ! 68: STW_I	stw	%r10, [%r31 + 0x00a1]
splash_cmpr_40_51:
	setx 0x666da057ffe403f9, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_52) + 0, 16, 16)) -> intp(3,0,28)
intvec_40_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_40_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f6, %f8
	.word 0x91b2c311  ! 71: ALIGNADDRESS	alignaddr	%r11, %r17, %r8
donret_40_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_54-donret_40_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00412155 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x18c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_54:
	.word 0xe2ffe085  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x0085] %asi
tglhtw_40_55:
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
	.word 0x93b48994  ! 73: BSHUFFLE	fmovc32	%d18, %d20, %d40
	.word 0x9f8022e9  ! 74: SIR	sir	0x02e9
	.word 0x9f803819  ! 75: SIR	sir	0x1819
fpinit_40_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 76: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x91d02032  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd8d7e000  ! 78: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x8d903d99  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1d99, %pstate
jmptr_40_58:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe028  ! 81: STDF_I	std	%f12, [0x0028, %r31]
	.word 0x93500000  ! 82: RDPR_TPC	rdpr	%tpc, %r9
mondo_40_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948013  ! 83: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_60
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 84: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_61
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_61:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 85: RDPC	rd	%pc, %r13
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d902178  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x0178, %pstate
splash_lsu_40_63:
	ta T_CHANGE_HPRIV
	set 0xfbd8583f, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_64:
	.word 0x8198261c  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061c, %hpstate
intveclr_40_65:
	setx 0x0a5250dcda0bdbc4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x39400001  ! 90: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_66) + 32, 16, 16)) -> intp(3,0,31)
intvec_40_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_67:
	setx 0xdd86d6ad4a9e8446, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_40_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_68:
	mov 0x97b, %r20
	mov 0x4, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc011  ! 93: STDF_R	std	%f9, [%r17, %r31]
splash_cmpr_40_69:
	setx 0x647d7913bcd1de1c, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_40_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_71:
	mov 0xdbf, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd2dfc031  ! 96: LDXA_R	ldxa	[%r31, %r17] 0x01, %r9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0x91a00173  ! 98: FABSq	dis not found

pmu_40_72:
	nop
	setx 0xfffff4b4fffff782, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_73)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_73:
	.word 0xa981bbd8  ! 100: WR_SET_SOFTINT_I	wr	%r6, 0x1bd8, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_40_74:
	.word 0xa7a409c9  ! 1: FDIVd	fdivd	%f16, %f40, %f50
	pdist %f2, %f16, %f26
	.word 0xa1b00313  ! 102: ALIGNADDRESS	alignaddr	%r0, %r19, %r16
fpinit_40_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 103: FCMPLE32	fcmple32	%d0, %d4, %r8
memptr_40_76:
	set 0x60140000, %r31
	.word 0x858524ae  ! 104: WRCCR_I	wr	%r20, 0x04ae, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_40_77:
	nop
	setx 0xfffffd00fffff55c, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_40_78:
	setx 0xc0cd76c26af4c68d, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_40_79:
	taddcctv %r2, 0x1f25, %r19
	.word 0xe807e0ea  ! 109: LDUW_I	lduw	[%r31 + 0x00ea], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02032  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99a509c9  ! 112: FDIVd	fdivd	%f20, %f40, %f12
	.word 0xe66fe054  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x0054]
	.word 0x93d020b4  ! 114: Tcc_I	tne	icc_or_xcc, %r0 + 180
mondo_40_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 115: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
splash_htba_40_82:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802bc2  ! 117: SIR	sir	0x0bc2
	.word 0xc1bfc2c0  ! 118: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0x5b93075df2df8ec3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 120: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_84
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_84:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 121: RDPC	rd	%pc, %r12
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 122: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x37400001  ! 1: FBPGE	fbge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903f16  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x1f16, %pstate
splash_tba_40_86:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
pmu_40_87:
	nop
	setx 0xfffffb2bfffffe4c, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_88) + 56, 16, 16)) -> intp(7,0,15)
intvec_40_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd960  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd297e030  ! 129: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
splash_lsu_40_89:
	ta T_CHANGE_HPRIV
	set 0x46df8ef2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_90:
	nop
	setx 0xfffff87bfffff7a6, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0x9194e2a7  ! 133: WRPR_PIL_I	wrpr	%r19, 0x02a7, %pil
mondo_40_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d910014  ! 134: WRPR_WSTATE_R	wrpr	%r4, %r20, %wstate
mondo_40_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d94c004  ! 135: WRPR_WSTATE_R	wrpr	%r19, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0016d  ! 137: FABSq	dis not found

	.word 0x9f803ecb  ! 138: SIR	sir	0x1ecb
jmptr_40_94:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe2390014  ! 141: STD_R	std	%r17, [%r4 + %r20]
splash_lsu_40_95:
	ta T_CHANGE_HPRIV
	set 0x1c0c5c0a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_40_96:
	nop
	setx 0xfffff009fffff86c, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_40_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_97:
	mov 0x699, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd89fc021  ! 144: LDDA_R	ldda	[%r31, %r1] 0x01, %r12
	.word 0xd897e018  ! 145: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r12
	.word 0xa1500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_98) + 0, 16, 16)) -> intp(1,0,20)
intvec_40_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba009c0  ! 148: FDIVd	fdivd	%f0, %f0, %f44
splash_tba_40_99:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_40_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d94c003  ! 150: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
splash_hpstate_40_101:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81982a07  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a07, %hpstate
	rd %pc, %r19
	add %r19, (ivw_40_102-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_102:
	.word 0x91950002  ! 152: WRPR_PIL_R	wrpr	%r20, %r2, %pil
mondo_40_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d95000b  ! 153: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0x24cd0001  ! 1: BRLEZ	brlez,a,pt	%r20,<label_0xd0001>
	.word 0x8d903e9e  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1e9e, %pstate
	.word 0xe19fde00  ! 155: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802e45  ! 156: SIR	sir	0x0e45
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_40_106:
	setx 0xa1f21d7b1e5fca10, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_40_107:
	set 0x60340000, %r31
	.word 0x85807144  ! 159: WRCCR_I	wr	%r1, 0x1144, %ccr
	.word 0xc1bfe080  ! 160: STDFA_I	stda	%f0, [0x0080, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_108)+32, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_108:
	.word 0xa984a212  ! 161: WR_SET_SOFTINT_I	wr	%r18, 0x0212, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_40_111:
	nop
	setx 0xfffff77fffffff15, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe0ac  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ac]
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_112
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_112:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 167: RDPC	rd	%pc, %r17
	.word 0x93a00162  ! 168: FABSq	dis not found

	.word 0xa350c000  ! 169: RDPR_TT	<illegal instruction>
mondo_40_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 170: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	.word 0x93a00171  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_114
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 172: RDPC	rd	%pc, %r17
intveclr_40_115:
	setx 0x2a1f45b3a534f7d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_116-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_116:
	.word 0x9194c004  ! 174: WRPR_PIL_R	wrpr	%r19, %r4, %pil
	setx 0x462a5362fa70d466, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe23fc000  ! 176: STD_R	std	%r17, [%r31 + %r0]
mondo_40_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94000a  ! 177: WRPR_WSTATE_R	wrpr	%r16, %r10, %wstate
pmu_40_120:
	nop
	setx 0xfffff027fffff0ed, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe020  ! 179: LDDA_I	ldda	[%r31, + 0x0020] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_121
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_121:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 180: RDPC	rd	%pc, %r12
change_to_randtl_40_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_122:
	.word 0x8f902001  ! 181: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_40_123:
	.word 0x8198239f  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039f, %hpstate
DS_40_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe15f9aef	! Random illegal ?
	.word 0xa3a209c0  ! 1: FDIVd	fdivd	%f8, %f0, %f48
	.word 0xa7a50830  ! 183: FADDs	fadds	%f20, %f16, %f19
	.word 0x91d020b5  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 181
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_125
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_125:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 185: RDPC	rd	%pc, %r17
DS_40_126:
	.word 0xa9a449c6  ! 1: FDIVd	fdivd	%f48, %f6, %f20
	allclean
	.word 0xa3b4430d  ! 186: ALIGNADDRESS	alignaddr	%r17, %r13, %r17
	.word 0x91d020b3  ! 187: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_40_127:
	setx 0xbc1cf00642f217e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab84f02a  ! 189: WR_CLEAR_SOFTINT_I	wr	%r19, 0x102a, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_128) + 16, 16, 16)) -> intp(7,0,27)
intvec_40_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_129:
	nop
	setx 0xfffff5d2fffffbf9, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe034  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x0034]
	rd %pc, %r19
	add %r19, (ivw_40_130-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_130:
	.word 0x91950010  ! 193: WRPR_PIL_R	wrpr	%r20, %r16, %pil
	.word 0xe19fdf20  ! 194: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad83793b  ! 196: WR_SOFTINT_REG_I	wr	%r13, 0x193b, %softint
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe0db  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x00db]
intveclr_40_132:
	setx 0x2b40f9e93cabd2c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_133)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_133:
	.word 0xa984b25f  ! 200: WR_SET_SOFTINT_I	wr	%r18, 0x125f, %set_softint
	.word 0x8d9030cf  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x10cf, %pstate
jmptr_40_135:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d903d74  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x1d74, %pstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x91d020b4  ! 205: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_40_138:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd8bfc021  ! 206: STDA_R	stda	%r12, [%r31 + %r1] 0x01
memptr_40_139:
	set 0x60140000, %r31
	.word 0x8584f173  ! 207: WRCCR_I	wr	%r19, 0x1173, %ccr
	.word 0x91a309d1  ! 208: FDIVd	fdivd	%f12, %f48, %f8
splash_hpstate_40_140:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8198298c  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
	.word 0x83d020b2  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 178
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xd99f4da00e818a6b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_142)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_142:
	.word 0xa9852104  ! 214: WR_SET_SOFTINT_I	wr	%r20, 0x0104, %set_softint
DS_40_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f4, %f10
	.word 0xa9b00311  ! 215: ALIGNADDRESS	alignaddr	%r0, %r17, %r20
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 216: RDPC	rd	%pc, %r18
	rd %pc, %r19
	add %r19, (ivw_40_145-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_145:
	.word 0x91918014  ! 217: WRPR_PIL_R	wrpr	%r6, %r20, %pil
	.word 0x93a349b0  ! 218: FDIVs	fdivs	%f13, %f16, %f9
debug_40_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_40_146:
	mov 0xac2, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe7e7e002  ! 219: CASA_R	casa	[%r31] %asi, %r2, %r19
	.word 0xe71fe010  ! 220: LDDF_I	ldd	[%r31, 0x0010], %f19
	.word 0xc19fdb60  ! 221: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xde0a30c42c9a4a72, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc369ecfd  ! 223: PREFETCH_I	prefetch	[%r7 + 0x0cfd], #one_read
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0x93b2c7e7  ! 225: PDISTN	fmean16	%d42, %d38, %d40
mondo_40_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d900004  ! 226: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
	.word 0xe4dfe008  ! 227: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_150)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_150:
	.word 0xa9852761  ! 229: WR_SET_SOFTINT_I	wr	%r20, 0x0761, %set_softint
	.word 0xe46fe099  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x0099]
mondo_40_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d920006  ! 231: WRPR_WSTATE_R	wrpr	%r8, %r6, %wstate
jmptr_40_152:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x48f345a36140d04a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_40_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1350011  ! 1: STQF_R	-	%f16, [%r17, %r20]
	normalw
	.word 0x91458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x9f803adc  ! 235: SIR	sir	0x1adc
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 236: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_40_155:
	nop
	setx 0xfffff6d2ffffffd3, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_40_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 239: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
debug_40_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_40_157:
	mov 0x421, %r20
	mov 0x13, %r19
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
	.word 0xe6bfc034  ! 240: STDA_R	stda	%r19, [%r31 + %r20] 0x01
	.word 0x8d903e3d  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x1e3d, %pstate
mondo_40_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d950000  ! 242: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f8020a6  ! 244: SIR	sir	0x00a6
	.word 0x97a00167  ! 245: FABSq	dis not found

intveclr_40_161:
	setx 0x93d3aee26c3a7aa2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_40_162:
	nop
	setx 0xfffffca9fffffe0b, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_40_163:
	setx 0x169fc40f95e09f3e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe43fc000  ! 250: STD_R	std	%r18, [%r31 + %r0]
debug_40_165:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 251: CASA_R	casa	[%r31] %asi, %r19, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_166) + 40, 16, 16)) -> intp(5,0,4)
intvec_40_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_167:
	setx 0x7222b37b8f1587f0, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_40_168:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_40_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d94c010  ! 255: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
jmptr_40_170:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_40_171-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_171:
	.word 0x91948012  ! 257: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	.word 0x97a0c9c6  ! 258: FDIVd	fdivd	%f34, %f6, %f42
mondo_40_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d944012  ! 259: WRPR_WSTATE_R	wrpr	%r17, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 260: RDPC	rd	%pc, %r17
splash_lsu_40_174:
	ta T_CHANGE_HPRIV
	set 0xafc96c62, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0x91703940  ! 263: POPC_I	popc	0x1940, %r8
	.word 0xe19fc3e0  ! 264: LDDFA_R	ldda	[%r31, %r0], %f16
intveclr_40_176:
	setx 0xf0e543afb6ad15c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e0a3  ! 266: STX_I	stx	%r20, [%r31 + 0x00a3]
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_40_178:
	nop
	setx 0xfffffad0fffffb8c, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe80fe038  ! 272: LDUB_I	ldub	[%r31 + 0x0038], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_180)+24, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_180:
	.word 0xa9812dd7  ! 273: WR_SET_SOFTINT_I	wr	%r4, 0x0dd7, %set_softint
jmptr_40_181:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_40_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 277: FCMPd	fcmpd	%fcc<n>, %f0, %f4
tglhtw_40_184:
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
	.word 0x91b50994  ! 278: BSHUFFLE	fmovc32	%d20, %d20, %d8
	.word 0xa7b1c4d0  ! 279: FCMPNE32	fcmpne32	%d38, %d16, %r19
	.word 0xe26fe01b  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x001b]
	setx 0x53fb35124a5267cf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_40_186:
	.word 0x81982c64  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c64, %hpstate
cwp_40_187:
    set user_data_start, %o7
	.word 0x93902006  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
intveclr_40_188:
	setx 0xe6bf0f4df8df674c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe0f1  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x00f1]
	.word 0x91d020b3  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_40_189:
	setx 0xa49fd818c1c4801d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_40_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 288: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
fpinit_40_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 289: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_192) + 16, 16, 16)) -> intp(4,0,12)
intvec_40_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_193:
	nop
	setx 0xfffff1a6fffff4af, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a4c9d4  ! 293: FDIVd	fdivd	%f50, %f20, %f16
fpinit_40_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 294: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x9194ee1c  ! 295: WRPR_PIL_I	wrpr	%r19, 0x0e1c, %pil
	.word 0x91d020b2  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe9e7c020  ! 299: CASA_I	casa	[%r31] 0x 1, %r0, %r20
fpinit_40_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 300: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 301: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 302: RDPC	rd	%pc, %r19
splash_lsu_40_199:
	ta T_CHANGE_HPRIV
	set 0x71599d31, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 304: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
memptr_40_201:
	set user_data_start, %r31
	.word 0x85803c1a  ! 305: WRCCR_I	wr	%r0, 0x1c1a, %ccr
	.word 0x9f802be1  ! 306: SIR	sir	0x0be1
splash_lsu_40_202:
	ta T_CHANGE_HPRIV
	set 0xb23bf5af, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802dbb  ! 308: SIR	sir	0x0dbb
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_203
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_203:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 309: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_204) + 56, 16, 16)) -> intp(7,0,20)
intvec_40_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_205
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_205:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 311: RDPC	rd	%pc, %r8
mondo_40_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d93400b  ! 312: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
cwp_40_207:
    set user_data_start, %o7
	.word 0x93902007  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_40_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d924007  ! 315: WRPR_WSTATE_R	wrpr	%r9, %r7, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9bb44494  ! 317: FCMPLE32	fcmple32	%d48, %d20, %r13
	.word 0xd91fe018  ! 318: LDDF_I	ldd	[%r31, 0x0018], %f12
	.word 0xe1bfda00  ! 319: STDFA_R	stda	%f16, [%r0, %r31]
memptr_40_210:
	set user_data_start, %r31
	.word 0x8580f0a6  ! 320: WRCCR_I	wr	%r3, 0x10a6, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_40_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa7a349d4  ! 1: FDIVd	fdivd	%f44, %f20, %f50
	.word 0x95a18823  ! 322: FADDs	fadds	%f6, %f3, %f10
	.word 0xe137e089  ! 323: STQF_I	-	%f16, [0x0089, %r31]
pmu_40_212:
	nop
	setx 0xffffffbdfffffa86, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80352d  ! 325: SIR	sir	0x152d
mondo_40_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d914011  ! 326: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0x966cc013  ! 327: UDIVX_R	udivx 	%r19, %r19, %r11
	.word 0x9f803116  ! 328: SIR	sir	0x1116
	.word 0xc1bfc3e0  ! 329: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9945c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xe137e078  ! 331: STQF_I	-	%f16, [0x0078, %r31]
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a0c9c6  ! 333: FDIVd	fdivd	%f34, %f6, %f42
	.word 0x93d020b2  ! 334: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x93500000  ! 335: RDPR_TPC	rdpr	%tpc, %r9
intveclr_40_214:
	setx 0xe616c839e18e57d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b4  ! 337: Tcc_I	tne	icc_or_xcc, %r0 + 180
	rd %pc, %r19
	add %r19, (ivw_40_215-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_215:
	.word 0x9193000c  ! 338: WRPR_PIL_R	wrpr	%r12, %r12, %pil
	.word 0xa3a489d1  ! 339: FDIVd	fdivd	%f18, %f48, %f48
	.word 0x93464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r9
pmu_40_216:
	nop
	setx 0xfffffd7bffffff95, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_218) + 32, 16, 16)) -> intp(6,0,16)
intvec_40_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_219
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_219:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 344: RDPC	rd	%pc, %r20
splash_htba_40_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa745c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xc19fdb60  ! 347: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xa3a509d2  ! 348: FDIVd	fdivd	%f20, %f18, %f48
	setx 0xb25097b7a8bc07be, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe000  ! 350: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r13
mondo_40_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d948000  ! 351: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_40_223:
	set 0x60140000, %r31
	.word 0x8582f9d2  ! 353: WRCCR_I	wr	%r11, 0x19d2, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe0e5  ! 355: STDA_I	stda	%r13, [%r31 + 0x00e5] %asi
pmu_40_224:
	nop
	setx 0xfffffb35fffff4b1, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x93b487f4  ! 358: PDISTN	fmean16	%d18, %d20, %d40
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_225)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_225:
	.word 0xa984a0a5  ! 359: WR_SET_SOFTINT_I	wr	%r18, 0x00a5, %set_softint
	.word 0x9f803aed  ! 360: SIR	sir	0x1aed
intveclr_40_226:
	setx 0xc3358bb6113a101c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_40_228:
	set user_data_start, %r31
	.word 0x8581e072  ! 363: WRCCR_I	wr	%r7, 0x0072, %ccr
	.word 0x91d020b3  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9bb4c481  ! 365: FCMPLE32	fcmple32	%d50, %d32, %r13
	.word 0x9f80373c  ! 366: SIR	sir	0x173c
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_229)+24, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_229:
	.word 0xa982fa9a  ! 367: WR_SET_SOFTINT_I	wr	%r11, 0x1a9a, %set_softint
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_230
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_230:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 368: RDPC	rd	%pc, %r10
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x99a0016c  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_40_232-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_232:
	.word 0x91950001  ! 372: WRPR_PIL_R	wrpr	%r20, %r1, %pil
	.word 0xa7844014  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r20, %-
DS_40_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x8d902128  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x0128, %pstate
intveclr_40_237:
	setx 0x97c3e54a4eecf317, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a489d2  ! 378: FDIVd	fdivd	%f18, %f18, %f40
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_238) + 16, 16, 16)) -> intp(6,0,26)
intvec_40_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_40_239:
	.word 0xa3a089ca  ! 1: FDIVd	fdivd	%f2, %f10, %f48
	.word 0xd731ffc2  ! 1: STQF_I	-	%f11, [0x1fc2, %r7]
	normalw
	.word 0x91458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r8
splash_hpstate_40_240:
	.word 0x81982f84  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_242
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_242:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 383: RDPC	rd	%pc, %r18
	.word 0xe127e020  ! 384: STF_I	st	%f16, [0x0020, %r31]
DS_40_243:
	.word 0x93a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f40
	.word 0xe7306606  ! 1: STQF_I	-	%f19, [0x0606, %r1]
	normalw
	.word 0x91458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r8
fpinit_40_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82503  ! 386: PREFETCHA_I	prefetcha	[%r0, + 0x0503] %asi, #one_read
	.word 0xc1bfe060  ! 387: STDFA_I	stda	%f0, [0x0060, %r31]
	.word 0x93d020b3  ! 388: Tcc_I	tne	icc_or_xcc, %r0 + 179
mondo_40_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d914007  ! 389: WRPR_WSTATE_R	wrpr	%r5, %r7, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_246) + 8, 16, 16)) -> intp(7,0,6)
intvec_40_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_247
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_247:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 391: RDPC	rd	%pc, %r16
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_40_248:
	setx 0x773267e656f08ab8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_249-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_249:
	.word 0x91940012  ! 394: WRPR_PIL_R	wrpr	%r16, %r18, %pil
	.word 0xe62fe0b5  ! 395: STB_I	stb	%r19, [%r31 + 0x00b5]
fpinit_40_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82503  ! 396: PREFETCHA_I	prefetcha	[%r0, + 0x0503] %asi, #one_read
mondo_40_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d91c010  ! 397: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
DS_40_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9348011  ! 1: STQF_R	-	%f12, [%r17, %r18]
	normalw
	.word 0x97458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xc1bfdf20  ! 399: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_40_253:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_254
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_254:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 402: RDPC	rd	%pc, %r9
fpinit_40_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 403: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9945c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0xe8dfe008  ! 407: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r20
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 408: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_40_257:
	nop
	setx 0xfffffed9fffff520, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_40_258:
	ta T_CHANGE_HPRIV
	set 0x9662236a, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_40_259:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa784c00c  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r12, %-
	.word 0x9f803759  ! 413: SIR	sir	0x1759
memptr_40_261:
	set user_data_start, %r31
	.word 0x8580b963  ! 414: WRCCR_I	wr	%r2, 0x1963, %ccr
mondo_40_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d924013  ! 415: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0x8d903005  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x1005, %pstate
	.word 0x93a00173  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_264
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_264:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 418: RDPC	rd	%pc, %r9
pmu_40_265:
	nop
	setx 0xfffff2b3fffffd57, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b3  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa1a449d0  ! 421: FDIVd	fdivd	%f48, %f16, %f16
	.word 0xe427e048  ! 422: STW_I	stw	%r18, [%r31 + 0x0048]
	rd %pc, %r19
	add %r19, (ivw_40_266-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_266:
	.word 0x91950010  ! 423: WRPR_PIL_R	wrpr	%r20, %r16, %pil
	.word 0x9b500000  ! 424: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xd7e7c020  ! 425: CASA_I	casa	[%r31] 0x 1, %r0, %r11
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_268) + 32, 16, 16)) -> intp(5,0,8)
intvec_40_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_40_269:
	setx 0x6251db637cdb1ab5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_40_270:
	set user_data_start, %r31
	.word 0x8582f428  ! 429: WRCCR_I	wr	%r11, 0x1428, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 430: RDPC	rd	%pc, %r16
    set 0x2823, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b507f2  ! 431: PDISTN	fmean16	%d20, %d18, %d40
	.word 0x91d020b2  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_272
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 433: RDPC	rd	%pc, %r16
	.word 0x83d02035  ! 434: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9ba00170  ! 435: FABSq	dis not found

splash_hpstate_40_273:
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x819822c4  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
intveclr_40_274:
	setx 0x3c146241404ff72f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe010  ! 438: LDD_I	ldd	[%r31 + 0x0010], %r20
	rd %pc, %r19
	add %r19, (ivw_40_275-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_275:
	.word 0x91940003  ! 439: WRPR_PIL_R	wrpr	%r16, %r3, %pil
donret_40_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_276-donret_40_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x007beab4 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x11d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	retry
donretarg_40_276:
	.word 0xe8ffe03e  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x003e] %asi
splash_hpstate_40_277:
	.word 0x81982c1e  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1e, %hpstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0x809d9dd79686a25a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_40_280:
	nop
	setx 0xfffffd2cfffff7ac, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_40_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_281:
	.word 0x8f902002  ! 445: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_40_282:
	setx 0x8fe4aff549955b79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd920  ! 447: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe93fe042  ! 448: STDF_I	std	%f20, [0x0042, %r31]
	.word 0xc1bfde00  ! 449: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe8dfe038  ! 450: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r20
	.word 0x2accc001  ! 1: BRNZ	brnz,a,pt	%r19,<label_0xcc001>
	.word 0x8d9024b9  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x04b9, %pstate
	.word 0x91a489d0  ! 452: FDIVd	fdivd	%f18, %f16, %f8
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd23fc000  ! 454: STD_R	std	%r9, [%r31 + %r0]
	.word 0xa1a409c8  ! 455: FDIVd	fdivd	%f16, %f8, %f16
splash_cmpr_40_285:
	setx 0x1962185944bec5dc, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_40_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d940010  ! 457: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xc1bfda00  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fe000  ! 459: LDDFA_I	ldda	[%r31, 0x0000], %f0
pmu_40_287:
	nop
	setx 0xfffff507fffff1ac, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_40_288:
	.word 0xa9a4c9c1  ! 1: FDIVd	fdivd	%f50, %f32, %f20
	allclean
	.word 0x95b4c311  ! 461: ALIGNADDRESS	alignaddr	%r19, %r17, %r10
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 462: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0xad7ab33243289470, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_290)+48, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_290:
	.word 0xa9853cd0  ! 464: WR_SET_SOFTINT_I	wr	%r20, 0x1cd0, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_291)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_291:
	.word 0xa984aed0  ! 465: WR_SET_SOFTINT_I	wr	%r18, 0x0ed0, %set_softint
	.word 0xe20fe010  ! 466: LDUB_I	ldub	[%r31 + 0x0010], %r17
	.word 0xa1540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0xa350c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_292
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_292:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 469: RDPC	rd	%pc, %r16
	.word 0x9f803e41  ! 470: SIR	sir	0x1e41
intveclr_40_293:
	setx 0xf4299d6963b6773c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_40_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 472: FCMPLE32	fcmple32	%d0, %d4, %r4
pmu_40_295:
	nop
	setx 0xfffffb98fffffa15, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_40_296:
	.word 0x81982fcc  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcc, %hpstate
donret_40_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_297-donret_40_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008108e5 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x19e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (40)
	done
donretarg_40_297:
	.word 0xe2ffe004  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x0004] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83d020b3  ! 477: Tcc_I	te	icc_or_xcc, %r0 + 179
DS_40_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xdf6fdb18	! Random illegal ?
	.word 0xe7148013  ! 1: LDQF_R	-	[%r18, %r19], %f19
	.word 0x91a1c825  ! 478: FADDs	fadds	%f7, %f5, %f8
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
tglhtw_40_300:
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
	.word 0x91b50991  ! 480: BSHUFFLE	fmovc32	%d20, %d48, %d8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_40_302:
	setx 0xaa387cd176dac816, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe018  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x0018]
	.word 0x9f8029e9  ! 484: SIR	sir	0x09e9
	setx 0x0018ea5bcb105888, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba309cd  ! 486: FDIVd	fdivd	%f12, %f44, %f44
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 487: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902882  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x0882, %pstate
	.word 0xa1702f3a  ! 489: POPC_I	popc	0x0f3a, %r16
	.word 0x93a00170  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_305
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_305:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 491: RDPC	rd	%pc, %r8
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_40_306:
	setx 0xef6b14cbe18d9c4d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803931  ! 495: SIR	sir	0x1931
	.word 0xa9a00173  ! 496: FABSq	dis not found

	.word 0xa570314a  ! 497: POPC_I	popc	0x114a, %r18
	.word 0xe19fe020  ! 498: LDDFA_I	ldda	[%r31, 0x0020], %f16
	.word 0xd64fe028  ! 499: LDSB_I	ldsb	[%r31 + 0x0028], %r11
tglhtw_40_307:
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
	.word 0x9bb48981  ! 500: BSHUFFLE	fmovc32	%d18, %d32, %d44
	.word 0x95a00173  ! 501: FABSq	dis not found

DS_40_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_40_309:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9750c000  ! 504: RDPR_TT	rdpr	%tt, %r11
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f803c10  ! 506: SIR	sir	0x1c10
jmptr_40_311:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_312
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_312:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 508: RDPC	rd	%pc, %r18
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xe19fd960  ! 510: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_314) + 48, 16, 16)) -> intp(4,0,18)
intvec_40_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_40_315:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_40_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbf5c05d8	! Random illegal ?
	.word 0xa5a00540  ! 1: FSQRTd	fsqrt	
	.word 0x99a4c822  ! 513: FADDs	fadds	%f19, %f2, %f12
memptr_40_317:
	set 0x60140000, %r31
	.word 0x8581f4ee  ! 514: WRCCR_I	wr	%r7, 0x14ee, %ccr
splash_lsu_40_318:
	ta T_CHANGE_HPRIV
	set 0x5591cdbb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x5a4e5280d1fd77b2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_40_320:
	setx 0x7e4baf203bcb71e6, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_40_321:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc00d  ! 519: STDF_R	std	%f9, [%r13, %r31]
memptr_40_322:
	set 0x60140000, %r31
	.word 0x858326bd  ! 520: WRCCR_I	wr	%r12, 0x06bd, %ccr
	.word 0xd25fe028  ! 521: LDX_I	ldx	[%r31 + 0x0028], %r9
fpinit_40_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 522: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91d020b3  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 179
change_to_randtl_40_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_40_324:
	.word 0x8f902001  ! 524: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab850011  ! 525: WR_CLEAR_SOFTINT_R	wr	%r20, %r17, %clear_softint
	.word 0xd26fe0db  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x00db]
	setx 0x3c16eb7514558b9f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_40_326-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_326:
	.word 0x91904007  ! 528: WRPR_PIL_R	wrpr	%r1, %r7, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_40_327:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd2bfc020  ! 532: STDA_R	stda	%r9, [%r31 + %r0] 0x01
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_328
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_328:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 533: RDPC	rd	%pc, %r17
	.word 0xe26fe068  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x0068]
	.word 0xa1520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x8d90228d  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x028d, %pstate
mondo_40_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d914010  ! 537: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x9f803113  ! 538: SIR	sir	0x1113
mondo_40_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 539: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_40_332:
	setx 0xd30b631f2f35e46c, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_40_333:
	setx 0xa2df8e0bae9b6126, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_334
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_334:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 544: RDPC	rd	%pc, %r18
pmu_40_335:
	nop
	setx 0xfffff5a6fffff013, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_40_336:
	setx 0x3f8ba6f8129183fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_40_337:
	setx 0xb50c3e8e1be7b00f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 179
	rd %pc, %r19
	add %r19, (ivw_40_338-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_338:
	.word 0x91948010  ! 549: WRPR_PIL_R	wrpr	%r18, %r16, %pil
splash_lsu_40_339:
	ta T_CHANGE_HPRIV
	set 0xbc061a0b, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d930014  ! 551: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0xc19fe0a0  ! 552: LDDFA_I	ldda	[%r31, 0x00a0], %f0
	setx 0xc996753ce158f06b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe020  ! 554: LDUB_I	ldub	[%r31 + 0x0020], %r9
	.word 0x8d903862  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x1862, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_40_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_40_343-donret_40_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00eee94a | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7de, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (40)
	done
donretarg_40_343:
	.word 0xd2ffe05e  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x005e] %asi
	.word 0x8d9037d1  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x17d1, %pstate
mondo_40_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d92c013  ! 559: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
splash_lsu_40_346:
	ta T_CHANGE_HPRIV
	set 0xc1a6aaed, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa2ac800a  ! 561: ANDNcc_R	andncc 	%r18, %r10, %r17
jmptr_40_347:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_40_348:
	setx 0xbdb1501d507ee56a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_40_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe22fe081  ! 565: STB_I	stb	%r17, [%r31 + 0x0081]
	.word 0xc1bfc2c0  ! 566: STDFA_R	stda	%f0, [%r0, %r31]
tagged_40_350:
	tsubcctv %r6, 0x193e, %r18
	.word 0xe207e024  ! 567: LDUW_I	lduw	[%r31 + 0x0024], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_40_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_352
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_352:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 569: RDPC	rd	%pc, %r11
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_40_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 571: FCMPLE32	fcmple32	%d0, %d4, %r4
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_356:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_40_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94c009  ! 574: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xc36fe08f  ! 575: PREFETCH_I	prefetch	[%r31 + 0x008f], #one_read
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_360)+40, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_360:
	.word 0xa984fcca  ! 577: WR_SET_SOFTINT_I	wr	%r19, 0x1cca, %set_softint
memptr_40_361:
	set 0x60740000, %r31
	.word 0x85826ade  ! 578: WRCCR_I	wr	%r9, 0x0ade, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_40_362:
	.word 0x81982ad7  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad7, %hpstate
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 581: Tcc_R	tne	icc_or_xcc, %r0 + %r30
fpinit_40_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 582: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xab814012  ! 583: WR_CLEAR_SOFTINT_R	wr	%r5, %r18, %clear_softint
	.word 0xab8421c4  ! 584: WR_CLEAR_SOFTINT_I	wr	%r16, 0x01c4, %clear_softint
pmu_40_364:
	nop
	setx 0xfffff897fffff998, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_365
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_365:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 586: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_366
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_366:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 587: RDPC	rd	%pc, %r12
change_to_randtl_40_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_40_367:
	.word 0x8f902002  ! 588: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0x99a00162  ! 590: FABSq	dis not found

	.word 0xd037e074  ! 591: STH_I	sth	%r8, [%r31 + 0x0074]
	rd %pc, %r19
	add %r19, (ivw_40_369-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_369:
	.word 0x91948012  ! 592: WRPR_PIL_R	wrpr	%r18, %r18, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_40_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 594: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_40_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d924012  ! 595: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0xd04fe018  ! 596: LDSB_I	ldsb	[%r31 + 0x0018], %r8
DS_40_372:
	.word 0x9ba489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f44
	allclean
	.word 0xa5b4830b  ! 597: ALIGNADDRESS	alignaddr	%r18, %r11, %r18
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_373
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_373:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 598: RDPC	rd	%pc, %r12
mondo_40_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d950000  ! 599: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
DS_40_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe1bfe0c0  ! 601: STDFA_I	stda	%f16, [0x00c0, %r31]
pmu_40_376:
	nop
	setx 0xfffffa7efffff622, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_40_377:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_40_378:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_40_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944001  ! 607: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0xc19fd960  ! 608: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d02033  ! 609: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_40_380:
	setx 0x1ae27ffb9dd484b1, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0xe7f2d852e495ef78, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00166  ! 613: FABSq	dis not found

splash_cmpr_40_382:
	setx 0x8b10bdc8054aef67, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_40_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 615: FCMPLE32	fcmple32	%d0, %d4, %r8
jmptr_40_384:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fc3e0  ! 617: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xc36fe0f1  ! 618: PREFETCH_I	prefetch	[%r31 + 0x00f1], #one_read
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_386
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_386:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 619: RDPC	rd	%pc, %r20
pmu_40_387:
	nop
	setx 0xfffff7effffffc77, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_388
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_388:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 621: RDPC	rd	%pc, %r18
pmu_40_389:
	nop
	setx 0xfffff494fffff701, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe076  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x0076]
fpinit_40_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 624: FCMPLE32	fcmple32	%d0, %d4, %r6
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a109d3  ! 626: FDIVd	fdivd	%f4, %f50, %f8
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_40_391:
	nop
	setx 0xfffffd42fffffdee, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a509d0  ! 629: FDIVd	fdivd	%f20, %f16, %f40
	.word 0xe4bfe022  ! 630: STDA_I	stda	%r18, [%r31 + 0x0022] %asi
	.word 0xe1bfe000  ! 631: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xe527e0c0  ! 632: STF_I	st	%f18, [0x00c0, %r31]
tagged_40_392:
	tsubcctv %r16, 0x13d7, %r19
	.word 0xe407e076  ! 633: LDUW_I	lduw	[%r31 + 0x0076], %r18
	.word 0xa9a00169  ! 634: FABSq	dis not found

	.word 0xc1bfd960  ! 635: STDFA_R	stda	%f0, [%r0, %r31]
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 636: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a409d1  ! 637: FDIVd	fdivd	%f16, %f48, %f48
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_40_395:
	setx 0xe58d6cd7bd97d275, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 641: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa782400b  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r11, %-
	rd %pc, %r19
	add %r19, (ivw_40_397-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_397:
	.word 0x91924012  ! 643: WRPR_PIL_R	wrpr	%r9, %r18, %pil
	.word 0xe0d7e018  ! 644: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r16
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_40_399:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_40_400:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x819821c4  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_40_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d950011  ! 649: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0xa9a249c2  ! 650: FDIVd	fdivd	%f40, %f2, %f20
	.word 0xa7a00160  ! 651: FABSq	dis not found

mondo_40_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d94800d  ! 652: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
    mov (40+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_40_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_40_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xe1bfdb60  ! 654: STDFA_R	stda	%f16, [%r0, %r31]
	setx 0x93e7ea550f40e9a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_40_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_40_406:
	setx 0xf8b6c6bdca9c91d5, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_40_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d944013  ! 657: WRPR_WSTATE_R	wrpr	%r17, %r19, %wstate
	.word 0xe06fe0d9  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x00d9]
splash_cmpr_40_408:
	setx 0xe5edd720f8c4e835, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_409
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 660: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_410) + 56, 16, 16)) -> intp(1,0,25)
intvec_40_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f802f66  ! 663: SIR	sir	0x0f66
DS_40_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa3a409cd  ! 1: FDIVd	fdivd	%f16, %f44, %f48
	.word 0x95a00553  ! 1: FSQRTd	fsqrt	
	.word 0x99a4082d  ! 664: FADDs	fadds	%f16, %f13, %f12
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 666: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd83fe0c5  ! 667: STD_I	std	%r12, [%r31 + 0x00c5]
mondo_40_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d940008  ! 668: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
mondo_40_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d920000  ! 669: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0xa3a00171  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_40_414) + 0, 16, 16)) -> intp(7,0,9)
intvec_40_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a209c2  ! 673: FDIVd	fdivd	%f8, %f2, %f10
	.word 0x39400001  ! 674: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe9e7c020  ! 675: CASA_I	casa	[%r31] 0x 1, %r0, %r20
splash_lsu_40_416:
	ta T_CHANGE_HPRIV
	set 0x0a8a1dd4, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_40_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d930010  ! 677: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0xe88fe028  ! 678: LDUBA_I	lduba	[%r31, + 0x0028] %asi, %r20
cwp_40_418:
    set user_data_start, %o7
	.word 0x93902006  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93a109d2  ! 680: FDIVd	fdivd	%f4, %f18, %f40
mondo_40_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d90c011  ! 681: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f802ed1  ! 683: SIR	sir	0x0ed1
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_40_420)+16, 16, 16)) -> intp(mask2tid(0x40),1,3)
xir_40_420:
	.word 0xa984bed9  ! 684: WR_SET_SOFTINT_I	wr	%r18, 0x1ed9, %set_softint
pmu_40_421:
	nop
	setx 0xfffff528ffffff32, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3ecc021  ! 687: PREFETCHA_R	prefetcha	[%r19, %r1] 0x01, #one_read
	rd %pc, %r19
	add %r19, (ivw_40_422-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_40_422:
	.word 0x91914003  ! 688: WRPR_PIL_R	wrpr	%r5, %r3, %pil
	.word 0xe19fc2c0  ! 689: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91932cd5  ! 690: WRPR_PIL_I	wrpr	%r12, 0x0cd5, %pil
	.word 0x99902005  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd097e010  ! 692: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
splash_cmpr_40_423:
	setx 0xa8d4458615e261e4, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d902682  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0682, %pstate
	.word 0x93d02034  ! 695: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa7a00174  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_425
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_425:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 697: RDPC	rd	%pc, %r18
	.word 0xd6d7e018  ! 698: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r11
pmu_40_426:
	nop
	setx 0xfffff9ebfffff52f, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe19fd960  ! 700: LDDFA_R	ldda	[%r31, %r0], %f16
    ta T_CHANGE_HPRIV
    mov (40+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_40_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_40_427
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_40_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 701: RDPC	rd	%pc, %r20
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
mondo_20_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d920009  ! 1: WRPR_WSTATE_R	wrpr	%r8, %r9, %wstate
intveclr_20_1:
	setx 0x37b39aff38e6d67a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_2:
	setx 0x16afe9131aeeee5d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 4: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_3
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_3:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 5: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_4)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_4:
	.word 0xa9816277  ! 6: WR_SET_SOFTINT_I	wr	%r5, 0x0277, %set_softint
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_20_6:
	set user_data_start, %r31
	.word 0x85843d5b  ! 8: WRCCR_I	wr	%r16, 0x1d5b, %ccr
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_7
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 9: RDPC	rd	%pc, %r18
	.word 0x2ec84001  ! 1: BRGEZ	brgez,a,pt	%r1,<label_0x84001>
	.word 0x8d9038f3  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x18f3, %pstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_20_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_cmpr_20_11:
	setx 0xba6dfceaf03efaff, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_12) + 40, 16, 16)) -> intp(1,0,29)
intvec_20_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_13:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982915  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0915, %hpstate
	.word 0xc19fdb60  ! 16: LDDFA_R	ldda	[%r31, %r0], %f0
pmu_20_14:
	nop
	setx 0xfffffbb8fffff62d, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_20_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82029  ! 19: PREFETCHA_I	prefetcha	[%r0, + 0x0029] %asi, #one_read
donret_20_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_17-donret_20_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d4a433 | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_17:
	.word 0xe6ffe0fc  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x00fc] %asi
DS_20_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e0a0  ! 23: STQF_I	-	%f19, [0x00a0, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_20_20:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xd83c4002  ! 27: STD_R	std	%r12, [%r17 + %r2]
DS_20_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad80a884  ! 29: WR_SOFTINT_REG_I	wr	%r2, 0x0884, %softint
	.word 0xe19fdf20  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_20_23:
	.word 0x8198209c  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009c, %hpstate
	.word 0xd73fe040  ! 32: STDF_I	std	%f11, [0x0040, %r31]
pmu_20_24:
	nop
	setx 0xfffffb11fffff9a1, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d924009  ! 34: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
mondo_20_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94000c  ! 35: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	setx 0x605ee400a2225bf2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_28:
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8198228c  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
jmptr_20_29:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91b48993  ! 39: BSHUFFLE	fmovc32	%d18, %d50, %d8
	.word 0x39400001  ! 40: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_20_31:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_20_32:
	setx 0x2c14d231b9a3cb76, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_20_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_33-donret_20_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e884a3 | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x4d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_33:
	.word 0xd6ffe060  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x0060] %asi
debug_20_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_34:
	mov 0x5e2, %r20
	mov 0x9, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc003  ! 45: LDDF_R	ldd	[%r31, %r3], %f11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5b2c984  ! 47: BSHUFFLE	fmovc32	%d42, %d4, %d18
	.word 0x99a0016b  ! 48: FABSq	dis not found

memptr_20_36:
	set user_data_start, %r31
	.word 0x8580ec69  ! 49: WRCCR_I	wr	%r3, 0x0c69, %ccr
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_37
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_37:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 50: RDPC	rd	%pc, %r8
DS_20_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_20_39:
	setx 0x1a06c75cc30d1e0b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_20_40:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe053  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x0053]
donret_20_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_41-donret_20_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0053091a | (22 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa1c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	done
donretarg_20_41:
	.word 0xe0ffe034  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x0034] %asi
mondo_20_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 56: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
DS_20_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_20_45:
	nop
	setx 0xfffff6ccfffff9ea, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_20_46:
	nop
	setx 0xfffff01cfffffdff, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d94800b  ! 61: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_20_48:
	set user_data_start, %r31
	.word 0x85807897  ! 64: WRCCR_I	wr	%r1, 0x1897, %ccr
intveclr_20_49:
	setx 0xafddc9e16f98adf5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0xc3e98032  ! 67: PREFETCHA_R	prefetcha	[%r6, %r18] 0x01, #one_read
	.word 0xd427e011  ! 68: STW_I	stw	%r10, [%r31 + 0x0011]
splash_cmpr_20_51:
	setx 0x39bab5995cb59481, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_52) + 56, 16, 16)) -> intp(6,0,6)
intvec_20_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_20_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f12, %f4
	.word 0xa7b50310  ! 71: ALIGNADDRESS	alignaddr	%r20, %r16, %r19
donret_20_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_54-donret_20_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x000827a4 | (16 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6d7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_54:
	.word 0xe2ffe0d8  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x00d8] %asi
	.word 0xa1b44981  ! 73: BSHUFFLE	fmovc32	%d48, %d32, %d16
	.word 0x9f803454  ! 74: SIR	sir	0x1454
	.word 0x9f802667  ! 75: SIR	sir	0x0667
fpinit_20_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 76: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x93d02035  ! 77: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd8d7e000  ! 78: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x8d90269e  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x069e, %pstate
jmptr_20_58:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe00a  ! 81: STDF_I	std	%f12, [0x000a, %r31]
	.word 0x99500000  ! 82: RDPR_TPC	rdpr	%tpc, %r12
mondo_20_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d94c002  ! 83: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_60
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_60:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 84: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_61
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_61:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 85: RDPC	rd	%pc, %r20
	.word 0x22c9c001  ! 1: BRZ	brz,a,pt	%r7,<label_0x9c001>
	.word 0x8d902900  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x0900, %pstate
splash_lsu_20_63:
	ta T_CHANGE_HPRIV
	set 0x2de16940, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_64:
	.word 0x81982616  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0616, %hpstate
intveclr_20_65:
	setx 0xa1b5fa5d1b75010f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda3cc00c  ! 90: STD_R	std	%r13, [%r19 + %r12]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_66) + 40, 16, 16)) -> intp(3,0,11)
intvec_20_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_67:
	setx 0x8f2c2f412ecd61b3, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_20_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_68:
	mov 0xdfa, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd31fc011  ! 93: LDDF_R	ldd	[%r31, %r17], %f9
splash_cmpr_20_69:
	setx 0xb165ca67d68293b0, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_20_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_71:
	mov 0x990, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 96: CASA_R	casa	[%r31] %asi, %r17, %r9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0xa9a00167  ! 98: FABSq	dis not found

pmu_20_72:
	nop
	setx 0xfffffd73fffff2c2, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_73)+16, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_73:
	.word 0xa981f8ad  ! 100: WR_SET_SOFTINT_I	wr	%r7, 0x18ad, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_20_74:
	.word 0xa9a049c7  ! 1: FDIVd	fdivd	%f32, %f38, %f20
	pdist %f10, %f22, %f26
	.word 0xa7b50314  ! 102: ALIGNADDRESS	alignaddr	%r20, %r20, %r19
fpinit_20_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 103: FDIVd	fdivd	%f0, %f4, %f6
memptr_20_76:
	set 0x60140000, %r31
	.word 0x8584fbb1  ! 104: WRCCR_I	wr	%r19, 0x1bb1, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_20_77:
	nop
	setx 0xfffff851fffff8e7, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_20_78:
	setx 0xbf6d09ef4db76490, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_20_79:
	taddcctv %r5, 0x1d65, %r8
	.word 0xe807e098  ! 109: LDUW_I	lduw	[%r31 + 0x0098], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93d02034  ! 111: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa1a409d4  ! 112: FDIVd	fdivd	%f16, %f20, %f16
	.word 0xe66fe04a  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x004a]
	.word 0x93d020b4  ! 114: Tcc_I	tne	icc_or_xcc, %r0 + 180
mondo_20_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d91c005  ! 115: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
splash_htba_20_82:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8032f0  ! 117: SIR	sir	0x12f0
	.word 0xc1bfe020  ! 118: STDFA_I	stda	%f0, [0x0020, %r31]
	setx 0xc9d8be46c28ab138, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 120: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_84
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_84:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 121: RDPC	rd	%pc, %r11
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 122: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d903328  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x1328, %pstate
splash_tba_20_86:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa5454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
pmu_20_87:
	nop
	setx 0xfffff3e6fffffcbe, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_88) + 8, 16, 16)) -> intp(7,0,4)
intvec_20_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc19fd960  ! 128: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd297e038  ! 129: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r9
splash_lsu_20_89:
	ta T_CHANGE_HPRIV
	set 0x911b6795, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_90:
	nop
	setx 0xfffffd81fffff1b1, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x9194b2e7  ! 133: WRPR_PIL_I	wrpr	%r18, 0x12e7, %pil
mondo_20_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d910000  ! 134: WRPR_WSTATE_R	wrpr	%r4, %r0, %wstate
mondo_20_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d950014  ! 135: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a00160  ! 137: FABSq	dis not found

	.word 0x9f80253c  ! 138: SIR	sir	0x053c
jmptr_20_94:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x24c84001  ! 141: BRLEZ	brlez,a,pt	%r1,<label_0x84001>
splash_lsu_20_95:
	ta T_CHANGE_HPRIV
	set 0x7cf54fe9, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_20_96:
	nop
	setx 0xfffff885fffffa38, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_20_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_97:
	mov 0x557, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd89fc021  ! 144: LDDA_R	ldda	[%r31, %r1] 0x01, %r12
	.word 0xd897e000  ! 145: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0xa3500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_98) + 40, 16, 16)) -> intp(4,0,9)
intvec_20_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a409c8  ! 148: FDIVd	fdivd	%f16, %f8, %f40
splash_tba_20_99:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_20_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90c011  ! 150: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
splash_hpstate_20_101:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982217  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0217, %hpstate
	rd %pc, %r19
	add %r19, (ivw_20_102-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_102:
	.word 0x91904010  ! 152: WRPR_PIL_R	wrpr	%r1, %r16, %pil
mondo_20_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 153: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
	.word 0x30800001  ! 1: BA	ba,a	<label_0x1>
	.word 0x8d903704  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x1704, %pstate
	.word 0xe1bfdb60  ! 155: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9f8026a2  ! 156: SIR	sir	0x06a2
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_20_106:
	setx 0xfa2b8f68bd76665a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_20_107:
	set 0x60340000, %r31
	.word 0x858366bd  ! 159: WRCCR_I	wr	%r13, 0x06bd, %ccr
	.word 0xc1bfe060  ! 160: STDFA_I	stda	%f0, [0x0060, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_108)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_108:
	.word 0xa98075b8  ! 161: WR_SET_SOFTINT_I	wr	%r1, 0x15b8, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_20_111:
	nop
	setx 0xffffff17fffff6c3, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe01b  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x001b]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_112
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_112:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 167: RDPC	rd	%pc, %r12
	.word 0x93a0016a  ! 168: FABSq	dis not found

	.word 0x9750c000  ! 169: RDPR_TT	<illegal instruction>
mondo_20_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d944006  ! 170: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xa1a00172  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_114
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 172: RDPC	rd	%pc, %r19
intveclr_20_115:
	setx 0x662a6d8017bb8373, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_116-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_116:
	.word 0x9194c001  ! 174: WRPR_PIL_R	wrpr	%r19, %r1, %pil
	setx 0x8ee47de35af5397d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe3e7c020  ! 176: CASA_I	casa	[%r31] 0x 1, %r0, %r17
mondo_20_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d950011  ! 177: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
pmu_20_120:
	nop
	setx 0xfffff06ffffffdf7, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe038  ! 179: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_121
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 180: RDPC	rd	%pc, %r17
change_to_randtl_20_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_122:
	.word 0x8f902000  ! 181: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_hpstate_20_123:
	.word 0x819823ef  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ef, %hpstate
DS_20_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8b5369a2	! Random illegal ?
	.word 0x97a449c4  ! 1: FDIVd	fdivd	%f48, %f4, %f42
	.word 0x97a50828  ! 183: FADDs	fadds	%f20, %f8, %f11
	.word 0x91d02033  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_125
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_125:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 185: RDPC	rd	%pc, %r16
DS_20_126:
	.word 0x91a409ca  ! 1: FDIVd	fdivd	%f16, %f10, %f8
	allclean
	.word 0xa9b34309  ! 186: ALIGNADDRESS	alignaddr	%r13, %r9, %r20
	.word 0x91d02032  ! 187: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_20_127:
	setx 0xc4a8faf6b166c7ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab8466e2  ! 189: WR_CLEAR_SOFTINT_I	wr	%r17, 0x06e2, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_128) + 40, 16, 16)) -> intp(4,0,3)
intvec_20_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_129:
	nop
	setx 0xfffff186fffffec8, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe016  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x0016]
	rd %pc, %r19
	add %r19, (ivw_20_130-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_130:
	.word 0x91948011  ! 193: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	.word 0xe19fd960  ! 194: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad84258a  ! 196: WR_SOFTINT_REG_I	wr	%r16, 0x058a, %softint
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe07c  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x007c]
intveclr_20_132:
	setx 0x99ed40b4c5580ead, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_133)+24, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_133:
	.word 0xa981f77d  ! 200: WR_SET_SOFTINT_I	wr	%r7, 0x177d, %set_softint
	.word 0x8d903b3a  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1b3a, %pstate
jmptr_20_135:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9035a4  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x15a4, %pstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x93d020b5  ! 205: Tcc_I	tne	icc_or_xcc, %r0 + 181
debug_20_138:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc001  ! 206: STDF_R	std	%f12, [%r1, %r31]
memptr_20_139:
	set 0x60140000, %r31
	.word 0x8582788a  ! 207: WRCCR_I	wr	%r9, 0x188a, %ccr
	.word 0x95a189d4  ! 208: FDIVd	fdivd	%f6, %f20, %f10
splash_hpstate_20_140:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x81982884  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0884, %hpstate
	.word 0x91d02033  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xd7390f8e1adfe48f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_142)+8, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_142:
	.word 0xa9853480  ! 214: WR_SET_SOFTINT_I	wr	%r20, 0x1480, %set_softint
DS_20_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f18, %f28
	.word 0x99b3030d  ! 215: ALIGNADDRESS	alignaddr	%r12, %r13, %r12
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_144
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_144:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 216: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_20_145-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_145:
	.word 0x91948005  ! 217: WRPR_PIL_R	wrpr	%r18, %r5, %pil
	.word 0x87ac8a4b  ! 218: FCMPd	fcmpd	%fcc<n>, %f18, %f42
debug_20_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_20_146:
	mov 0xc3f, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc002  ! 219: STDF_R	std	%f19, [%r2, %r31]
	.word 0xe71fe038  ! 220: LDDF_I	ldd	[%r31, 0x0038], %f19
	.word 0xc19fc2c0  ! 221: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xd3de49160ddb4ce8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4390014  ! 223: STD_R	std	%r10, [%r4 + %r20]
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
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0x9ba349d2  ! 225: FDIVd	fdivd	%f44, %f18, %f44
mondo_20_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d908008  ! 226: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0xe4dfe000  ! 227: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_150)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_150:
	.word 0xa984ff93  ! 229: WR_SET_SOFTINT_I	wr	%r19, 0x1f93, %set_softint
	.word 0xe46fe0a2  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x00a2]
mondo_20_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944014  ! 231: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
jmptr_20_152:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x9b9053c041c8d664, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_20_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd130800b  ! 1: STQF_R	-	%f8, [%r11, %r2]
	normalw
	.word 0xa1458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x9f8023ef  ! 235: SIR	sir	0x03ef
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_20_155:
	nop
	setx 0xfffffce3fffff1a5, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_20_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d928005  ! 239: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
debug_20_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_20_157:
	mov 0x443, %r20
	mov 0x1e, %r19
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
	.word 0xe63fe54e  ! 240: STD_I	std	%r19, [%r31 + 0x054e]
	.word 0x8d902664  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x0664, %pstate
mondo_20_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948011  ! 242: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f8037e7  ! 244: SIR	sir	0x17e7
	.word 0x99a00170  ! 245: FABSq	dis not found

intveclr_20_161:
	setx 0x9994051f1620c78e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_20_162:
	nop
	setx 0xfffff939fffff525, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_20_163:
	setx 0x327b344fba1c2958, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc36fe064  ! 250: PREFETCH_I	prefetch	[%r31 + 0x0064], #one_read
debug_20_165:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe497c033  ! 251: LDUHA_R	lduha	[%r31, %r19] 0x01, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_166) + 40, 16, 16)) -> intp(2,0,11)
intvec_20_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_167:
	setx 0x15912306ad7beb44, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_20_168:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_20_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d914008  ! 255: WRPR_WSTATE_R	wrpr	%r5, %r8, %wstate
jmptr_20_170:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_20_171-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_171:
	.word 0x91920012  ! 257: WRPR_PIL_R	wrpr	%r8, %r18, %pil
	.word 0x9ba4c9c4  ! 258: FDIVd	fdivd	%f50, %f4, %f44
mondo_20_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d934005  ! 259: WRPR_WSTATE_R	wrpr	%r13, %r5, %wstate
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_173:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 260: RDPC	rd	%pc, %r11
splash_lsu_20_174:
	ta T_CHANGE_HPRIV
	set 0x5bb7d9eb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0x97b34480  ! 263: FCMPLE32	fcmple32	%d44, %d0, %r11
	.word 0xe19fde00  ! 264: LDDFA_R	ldda	[%r31, %r0], %f16
intveclr_20_176:
	setx 0xf915a0c71c9482cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e048  ! 266: STX_I	stx	%r20, [%r31 + 0x0048]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_20_178:
	nop
	setx 0xfffff44bfffff177, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 271: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe80fe028  ! 272: LDUB_I	ldub	[%r31 + 0x0028], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_180)+56, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_180:
	.word 0xa9826ea0  ! 273: WR_SET_SOFTINT_I	wr	%r9, 0x0ea0, %set_softint
jmptr_20_181:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_20_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83433  ! 277: PREFETCHA_I	prefetcha	[%r0, + 0xfffff433] %asi, #one_read
	.word 0x93b18980  ! 278: BSHUFFLE	fmovc32	%d6, %d0, %d40
	.word 0x87ac4a43  ! 279: FCMPd	fcmpd	%fcc<n>, %f48, %f34
	.word 0xe26fe082  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x0082]
	setx 0x497564aae15dce9c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_20_186:
	.word 0x81982d85  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d85, %hpstate
cwp_20_187:
    set user_data_start, %o7
	.word 0x93902004  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
intveclr_20_188:
	setx 0x60ea99832b751e72, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe070  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x0070]
	.word 0x91d02033  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_20_189:
	setx 0x1aa9e214f8a8a871, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_20_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918005  ! 288: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
fpinit_20_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 289: FDIVd	fdivd	%f0, %f4, %f6
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_192) + 48, 16, 16)) -> intp(2,0,19)
intvec_20_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_193:
	nop
	setx 0xfffffcb7fffff320, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a409c4  ! 293: FDIVd	fdivd	%f16, %f4, %f50
fpinit_20_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83433  ! 294: PREFETCHA_I	prefetcha	[%r0, + 0xfffff433] %asi, #one_read
	.word 0x9190a68a  ! 295: WRPR_PIL_I	wrpr	%r2, 0x068a, %pil
	.word 0x93d02034  ! 296: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc36fe0c5  ! 299: PREFETCH_I	prefetch	[%r31 + 0x00c5], #one_read
fpinit_20_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83455  ! 300: PREFETCHA_I	prefetcha	[%r0, + 0xfffff455] %asi, #one_read
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 301: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 302: RDPC	rd	%pc, %r18
splash_lsu_20_199:
	ta T_CHANGE_HPRIV
	set 0x15ab9ca9, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d924010  ! 304: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
memptr_20_201:
	set user_data_start, %r31
	.word 0x85803df2  ! 305: WRCCR_I	wr	%r0, 0x1df2, %ccr
	.word 0x9f802668  ! 306: SIR	sir	0x0668
splash_lsu_20_202:
	ta T_CHANGE_HPRIV
	set 0x5d90a927, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f80342e  ! 308: SIR	sir	0x142e
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_203
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_203:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 309: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_204) + 8, 16, 16)) -> intp(0,0,7)
intvec_20_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_205
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 311: RDPC	rd	%pc, %r16
mondo_20_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d944004  ! 312: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
cwp_20_207:
    set user_data_start, %o7
	.word 0x93902007  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_20_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d924013  ! 315: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a509c2  ! 317: FDIVd	fdivd	%f20, %f2, %f12
	.word 0xd91fe028  ! 318: LDDF_I	ldd	[%r31, 0x0028], %f12
	.word 0xc19fc3e0  ! 319: LDDFA_R	ldda	[%r31, %r0], %f0
memptr_20_210:
	set user_data_start, %r31
	.word 0x8584ae5e  ! 320: WRCCR_I	wr	%r18, 0x0e5e, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_20_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x99a509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f12
	.word 0x93a50834  ! 322: FADDs	fadds	%f20, %f20, %f9
	.word 0xe137e0d5  ! 323: STQF_I	-	%f16, [0x00d5, %r31]
pmu_20_212:
	nop
	setx 0xfffffa27ffffff71, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803d9f  ! 325: SIR	sir	0x1d9f
mondo_20_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d90c008  ! 326: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0x98680007  ! 327: UDIVX_R	udivx 	%r0, %r7, %r12
	.word 0x9f8034f1  ! 328: SIR	sir	0x14f1
	.word 0xc1bfd920  ! 329: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9745c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xe137e061  ! 331: STQF_I	-	%f16, [0x0061, %r31]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a509d0  ! 333: FDIVd	fdivd	%f20, %f16, %f20
	.word 0x91d02035  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93500000  ! 335: RDPR_TPC	rdpr	%tpc, %r9
intveclr_20_214:
	setx 0xa41a397a5fe215b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 180
	rd %pc, %r19
	add %r19, (ivw_20_215-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_215:
	.word 0x91940001  ! 338: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	.word 0x99a4c9d3  ! 339: FDIVd	fdivd	%f50, %f50, %f12
	.word 0xa9464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r20
pmu_20_216:
	nop
	setx 0xfffffb25fffff867, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_218) + 56, 16, 16)) -> intp(1,0,29)
intvec_20_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_219
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_219:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 344: RDPC	rd	%pc, %r13
splash_htba_20_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa145c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xe19fde00  ! 347: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xa9a049d3  ! 348: FDIVd	fdivd	%f32, %f50, %f20
	setx 0x15780f16bf57bf87, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe038  ! 350: LDDA_I	ldda	[%r31, + 0x0038] %asi, %r13
mondo_20_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d950013  ! 351: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 352: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_20_223:
	set 0x60140000, %r31
	.word 0x8584f7d1  ! 353: WRCCR_I	wr	%r19, 0x17d1, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe0f0  ! 355: STDA_I	stda	%r13, [%r31 + 0x00f0] %asi
pmu_20_224:
	nop
	setx 0xfffff5c9fffffacb, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x9b70207f  ! 358: POPC_I	popc	0x007f, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_225)+0, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_225:
	.word 0xa9827949  ! 359: WR_SET_SOFTINT_I	wr	%r9, 0x1949, %set_softint
	.word 0x9f8032a1  ! 360: SIR	sir	0x12a1
intveclr_20_226:
	setx 0xab98ea9323fa63a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_20_228:
	set user_data_start, %r31
	.word 0x858325d8  ! 363: WRCCR_I	wr	%r12, 0x05d8, %ccr
	.word 0x91d02032  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93702c5b  ! 365: POPC_I	popc	0x0c5b, %r9
	.word 0x9f802a54  ! 366: SIR	sir	0x0a54
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_229)+8, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_229:
	.word 0xa9842686  ! 367: WR_SET_SOFTINT_I	wr	%r16, 0x0686, %set_softint
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_230:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 368: RDPC	rd	%pc, %r11
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x95a00170  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_20_232-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_232:
	.word 0x9195000a  ! 372: WRPR_PIL_R	wrpr	%r20, %r10, %pil
splash_decr_20_233:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7840007  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r7, %-
DS_20_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d902913  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x0913, %pstate
intveclr_20_237:
	setx 0xe9a81168bbfa407d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3a2c9c3  ! 378: FDIVd	fdivd	%f42, %f34, %f48
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_238) + 8, 16, 16)) -> intp(3,0,13)
intvec_20_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_20_239:
	.word 0xa3a209c2  ! 1: FDIVd	fdivd	%f8, %f2, %f48
	.word 0xd734a311  ! 1: STQF_I	-	%f11, [0x0311, %r18]
	normalw
	.word 0xa1458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r16
splash_hpstate_20_240:
	.word 0x81982d8d  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_242
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_242:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 383: RDPC	rd	%pc, %r9
	.word 0xe127e0dc  ! 384: STF_I	st	%f16, [0x00dc, %r31]
DS_20_243:
	.word 0xa1a489d4  ! 1: FDIVd	fdivd	%f18, %f20, %f16
	.word 0xd1347acc  ! 1: STQF_I	-	%f8, [0x1acc, %r17]
	normalw
	.word 0x91458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r8
fpinit_20_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 386: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xe1bfc2c0  ! 387: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x91d020b2  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_20_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90c00c  ! 389: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_246) + 0, 16, 16)) -> intp(6,0,7)
intvec_20_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_247
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_247:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 391: RDPC	rd	%pc, %r18
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_20_248:
	setx 0x3358bbb52e729fe0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_249-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_249:
	.word 0x91940010  ! 394: WRPR_PIL_R	wrpr	%r16, %r16, %pil
	.word 0xe62fe0af  ! 395: STB_I	stb	%r19, [%r31 + 0x00af]
fpinit_20_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82503  ! 396: PREFETCHA_I	prefetcha	[%r0, + 0x0503] %asi, #one_read
mondo_20_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90800d  ! 397: WRPR_WSTATE_R	wrpr	%r2, %r13, %wstate
DS_20_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9320014  ! 1: STQF_R	-	%f12, [%r20, %r8]
	normalw
	.word 0xa5458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xc1bfda00  ! 399: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_20_253:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_254
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_254:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 402: RDPC	rd	%pc, %r9
fpinit_20_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 403: FCMPLE32	fcmple32	%d0, %d4, %r4
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa145c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xe8dfe038  ! 407: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r20
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 408: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_20_257:
	nop
	setx 0xfffffafefffff48a, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_20_258:
	ta T_CHANGE_HPRIV
	set 0x845b2fc6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_259:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_20_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa784000a  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r10, %-
	.word 0x9f803bae  ! 413: SIR	sir	0x1bae
memptr_20_261:
	set user_data_start, %r31
	.word 0x858523b5  ! 414: WRCCR_I	wr	%r20, 0x03b5, %ccr
mondo_20_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d910007  ! 415: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
	.word 0x8d903ec8  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x1ec8, %pstate
	.word 0xa3a00172  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_264
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_264:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 418: RDPC	rd	%pc, %r10
pmu_20_265:
	nop
	setx 0xfffffc55fffff7ea, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d020b3  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9ba449c1  ! 421: FDIVd	fdivd	%f48, %f32, %f44
	.word 0xe427e04b  ! 422: STW_I	stw	%r18, [%r31 + 0x004b]
	rd %pc, %r19
	add %r19, (ivw_20_266-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_266:
	.word 0x9192c013  ! 423: WRPR_PIL_R	wrpr	%r11, %r19, %pil
	.word 0x95500000  ! 424: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xd63fc000  ! 425: STD_R	std	%r11, [%r31 + %r0]
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_268) + 40, 16, 16)) -> intp(2,0,25)
intvec_20_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_20_269:
	setx 0x9c53180462645c2e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_20_270:
	set user_data_start, %r31
	.word 0x8580b0cb  ! 429: WRCCR_I	wr	%r2, 0x10cb, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_271:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 430: RDPC	rd	%pc, %r19
    set 0x3f4f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b087eb  ! 431: PDISTN	fmean16	%d2, %d42, %d42
	.word 0x93d02035  ! 432: Tcc_I	tne	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_272
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 433: RDPC	rd	%pc, %r20
	.word 0x91d020b5  ! 434: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa5a00171  ! 435: FABSq	dis not found

splash_hpstate_20_273:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982f74  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f74, %hpstate
intveclr_20_274:
	setx 0x9df96b88ddd2e5a3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe020  ! 438: LDD_I	ldd	[%r31 + 0x0020], %r20
	rd %pc, %r19
	add %r19, (ivw_20_275-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_275:
	.word 0x91928006  ! 439: WRPR_PIL_R	wrpr	%r10, %r6, %pil
donret_20_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_276-donret_20_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00832cff | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3d4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	retry
donretarg_20_276:
	.word 0xe8ffe05c  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x005c] %asi
splash_hpstate_20_277:
	.word 0x819822d4  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0x0dabbfa030bb8598, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_20_280:
	nop
	setx 0xfffff866fffff741, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_20_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_281:
	.word 0x8f902001  ! 445: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_20_282:
	setx 0x202053173ed1bafe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc3e0  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe93fe0c0  ! 448: STDF_I	std	%f20, [0x00c0, %r31]
	.word 0xe19fdc00  ! 449: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe8dfe008  ! 450: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r20
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ae0  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x1ae0, %pstate
	.word 0x39400001  ! 452: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	.word 0xc36fe0a7  ! 454: PREFETCH_I	prefetch	[%r31 + 0x00a7], #one_read
	.word 0xa5a489c1  ! 455: FDIVd	fdivd	%f18, %f32, %f18
splash_cmpr_20_285:
	setx 0x514c9795f45c8265, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_20_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d934003  ! 457: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
	.word 0xc1bfc3e0  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fe0c0  ! 459: LDDFA_I	ldda	[%r31, 0x00c0], %f16
pmu_20_287:
	nop
	setx 0xfffff609fffffb7b, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_20_288:
	.word 0x91a189ca  ! 1: FDIVd	fdivd	%f6, %f10, %f8
	allclean
	.word 0x93b4430c  ! 461: ALIGNADDRESS	alignaddr	%r17, %r12, %r9
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 462: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0x5e53c0ba70f359ac, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_290)+40, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_290:
	.word 0xa9846ec1  ! 464: WR_SET_SOFTINT_I	wr	%r17, 0x0ec1, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_291)+48, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_291:
	.word 0xa9813392  ! 465: WR_SET_SOFTINT_I	wr	%r4, 0x1392, %set_softint
	.word 0xe20fe030  ! 466: LDUB_I	ldub	[%r31 + 0x0030], %r17
	.word 0x99540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0xa350c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_292
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_292:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 469: RDPC	rd	%pc, %r9
	.word 0x9f802fd3  ! 470: SIR	sir	0x0fd3
intveclr_20_293:
	setx 0x7f0a25ac6ddae06b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_20_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 472: FCMPLE32	fcmple32	%d0, %d4, %r8
pmu_20_295:
	nop
	setx 0xfffffa1bfffff071, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_20_296:
	.word 0x81982c1c  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1c, %hpstate
donret_20_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_297-donret_20_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008dc861 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x844, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (20)
	done
donretarg_20_297:
	.word 0xe2ffe0fc  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x00fc] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d020b5  ! 477: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_20_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa1594cbe	! Random illegal ?
	.word 0xe5114012  ! 1: LDQF_R	-	[%r5, %r18], %f18
	.word 0xa7a48827  ! 478: FADDs	fadds	%f18, %f7, %f19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x99b08993  ! 480: BSHUFFLE	fmovc32	%d2, %d50, %d12
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_20_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_20_302:
	setx 0x381866873155f119, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe099  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x0099]
	.word 0x9f802cd8  ! 484: SIR	sir	0x0cd8
	setx 0xd9a7dfa4db2c5e57, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a509d3  ! 486: FDIVd	fdivd	%f20, %f50, %f20
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x8d90383c  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x183c, %pstate
	.word 0xc3ec8027  ! 489: PREFETCHA_R	prefetcha	[%r18, %r7] 0x01, #one_read
	.word 0xa3a0016b  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_305
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_305:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 491: RDPC	rd	%pc, %r13
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_20_306:
	setx 0xe1a1c7d359b6ffb6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f802a39  ! 495: SIR	sir	0x0a39
	.word 0x9ba00164  ! 496: FABSq	dis not found

	.word 0x87acca52  ! 497: FCMPd	fcmpd	%fcc<n>, %f50, %f18
	.word 0xe19fe0e0  ! 498: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xd64fe000  ! 499: LDSB_I	ldsb	[%r31 + 0x0000], %r11
	.word 0x99b5098d  ! 500: BSHUFFLE	fmovc32	%d20, %d44, %d12
	.word 0xa5a00170  ! 501: FABSq	dis not found

DS_20_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_20_309:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa350c000  ! 504: RDPR_TT	rdpr	%tt, %r17
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f803a60  ! 506: SIR	sir	0x1a60
jmptr_20_311:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_312
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_312:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 508: RDPC	rd	%pc, %r8
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xc19fd920  ! 510: LDDFA_R	ldda	[%r31, %r0], %f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_314) + 32, 16, 16)) -> intp(7,0,5)
intvec_20_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_20_315:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_20_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xed7c12ef	! Random illegal ?
	.word 0xa5a00542  ! 1: FSQRTd	fsqrt	
	.word 0xa3a10826  ! 513: FADDs	fadds	%f4, %f6, %f17
memptr_20_317:
	set 0x60140000, %r31
	.word 0x8584e266  ! 514: WRCCR_I	wr	%r19, 0x0266, %ccr
splash_lsu_20_318:
	ta T_CHANGE_HPRIV
	set 0xbbeb683c, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xb38df99a03751d12, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_20_320:
	setx 0x511d7e145124c81b, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_20_321:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc00d  ! 519: STDF_R	std	%f9, [%r13, %r31]
memptr_20_322:
	set 0x60340000, %r31
	.word 0x85852d4f  ! 520: WRCCR_I	wr	%r20, 0x0d4f, %ccr
	.word 0xd25fe020  ! 521: LDX_I	ldx	[%r31 + 0x0020], %r9
fpinit_20_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 522: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x83d020b5  ! 523: Tcc_I	te	icc_or_xcc, %r0 + 181
change_to_randtl_20_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_20_324:
	.word 0x8f902001  ! 524: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab808008  ! 525: WR_CLEAR_SOFTINT_R	wr	%r2, %r8, %clear_softint
	.word 0xd26fe09b  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x009b]
	setx 0x1ce96dfcf25a7e2d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_20_326-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_326:
	.word 0x9191c010  ! 528: WRPR_PIL_R	wrpr	%r7, %r16, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_20_327:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc000  ! 532: STDF_R	std	%f9, [%r0, %r31]
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_328
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_328:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 533: RDPC	rd	%pc, %r16
	.word 0xe26fe081  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x0081]
	.word 0xa3520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a64  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x1a64, %pstate
mondo_20_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d930012  ! 537: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	.word 0x9f803b11  ! 538: SIR	sir	0x1b11
mondo_20_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948000  ! 539: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_20_332:
	setx 0xe851540cb66b6e76, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_20_333:
	setx 0x54b11798516ff336, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_334
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_334:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 544: RDPC	rd	%pc, %r20
pmu_20_335:
	nop
	setx 0xfffffe0cfffff04c, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_20_336:
	setx 0xd83fe1b68ef6a251, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_20_337:
	setx 0x6c71f571a59443b6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 53
	rd %pc, %r19
	add %r19, (ivw_20_338-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_338:
	.word 0x91920014  ! 549: WRPR_PIL_R	wrpr	%r8, %r20, %pil
splash_lsu_20_339:
	ta T_CHANGE_HPRIV
	set 0x5da2dd57, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d95000d  ! 551: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xc19fe0e0  ! 552: LDDFA_I	ldda	[%r31, 0x00e0], %f0
	setx 0x567e0e7ea8e4b2eb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe008  ! 554: LDUB_I	ldub	[%r31 + 0x0008], %r9
	.word 0x8d902735  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x0735, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_20_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_20_343-donret_20_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004c728a | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa05, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (20)
	done
donretarg_20_343:
	.word 0xd2ffe04c  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x004c] %asi
	.word 0x8d903aa6  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x1aa6, %pstate
mondo_20_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d908011  ! 559: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
splash_lsu_20_346:
	ta T_CHANGE_HPRIV
	set 0xea05eb46, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9aad0012  ! 561: ANDNcc_R	andncc 	%r20, %r18, %r13
jmptr_20_347:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_20_348:
	setx 0x7bc7456b4397c731, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_20_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe22fe0a5  ! 565: STB_I	stb	%r17, [%r31 + 0x00a5]
	.word 0xe1bfc3e0  ! 566: STDFA_R	stda	%f16, [%r0, %r31]
tagged_20_350:
	tsubcctv %r5, 0x19cb, %r1
	.word 0xe207e0c8  ! 567: LDUW_I	lduw	[%r31 + 0x00c8], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_20_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_352
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_352:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 569: RDPC	rd	%pc, %r13
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_20_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 571: FCMPLE32	fcmple32	%d0, %d4, %r8
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_356:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_20_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d928007  ! 574: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	.word 0xe7e7c020  ! 575: CASA_I	casa	[%r31] 0x 1, %r0, %r19
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_360)+32, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_360:
	.word 0xa981a18e  ! 577: WR_SET_SOFTINT_I	wr	%r6, 0x018e, %set_softint
memptr_20_361:
	set 0x60340000, %r31
	.word 0x8581f5b3  ! 578: WRCCR_I	wr	%r7, 0x15b3, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_20_362:
	.word 0x81982114  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0114, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 581: Tcc_R	te	icc_or_xcc, %r0 + %r30
fpinit_20_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 582: FDIVs	fdivs	%f0, %f4, %f6
	.word 0xab850006  ! 583: WR_CLEAR_SOFTINT_R	wr	%r20, %r6, %clear_softint
	.word 0xab84ff68  ! 584: WR_CLEAR_SOFTINT_I	wr	%r19, 0x1f68, %clear_softint
pmu_20_364:
	nop
	setx 0xfffff658fffff896, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_365
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_365:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 586: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_366
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_366:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 587: RDPC	rd	%pc, %r18
change_to_randtl_20_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_20_367:
	.word 0x8f902001  ! 588: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
invtsb_20_368:
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
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0xa3a00168  ! 590: FABSq	dis not found

	.word 0xd037e02e  ! 591: STH_I	sth	%r8, [%r31 + 0x002e]
	rd %pc, %r19
	add %r19, (ivw_20_369-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_369:
	.word 0x91908012  ! 592: WRPR_PIL_R	wrpr	%r2, %r18, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_20_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830d0  ! 594: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0d0] %asi, #one_read
mondo_20_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94000d  ! 595: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0xd04fe008  ! 596: LDSB_I	ldsb	[%r31 + 0x0008], %r8
DS_20_372:
	.word 0x93a249d3  ! 1: FDIVd	fdivd	%f40, %f50, %f40
	allclean
	.word 0x95b10301  ! 597: ALIGNADDRESS	alignaddr	%r4, %r1, %r10
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_373
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_373:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 598: RDPC	rd	%pc, %r8
mondo_20_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d918013  ! 599: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
DS_20_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc1bfe040  ! 601: STDFA_I	stda	%f0, [0x0040, %r31]
pmu_20_376:
	nop
	setx 0xfffff77dfffffab0, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_20_377:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_20_378:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_20_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d948013  ! 607: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	.word 0xe19fdf20  ! 608: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91d02032  ! 609: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_20_380:
	setx 0x63798e6350e2fb26, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0x434b7f5d9b7d69fe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00173  ! 613: FABSq	dis not found

splash_cmpr_20_382:
	setx 0x64bbe64a6ec5ce09, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_20_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 615: FDIVd	fdivd	%f0, %f4, %f4
jmptr_20_384:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fde00  ! 617: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1e7c020  ! 618: CASA_I	casa	[%r31] 0x 1, %r0, %r16
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_386
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_386:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 619: RDPC	rd	%pc, %r19
pmu_20_387:
	nop
	setx 0xfffff6f2fffff502, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_388
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_388:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 621: RDPC	rd	%pc, %r12
pmu_20_389:
	nop
	setx 0xfffff080ffffff6a, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe08e  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x008e]
fpinit_20_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 624: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a189d3  ! 626: FDIVd	fdivd	%f6, %f50, %f18
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_20_391:
	nop
	setx 0xfffff36bffffff8f, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9a489c6  ! 629: FDIVd	fdivd	%f18, %f6, %f20
	.word 0xe4bfe0f4  ! 630: STDA_I	stda	%r18, [%r31 + 0x00f4] %asi
	.word 0xc1bfe040  ! 631: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xe527e01a  ! 632: STF_I	st	%f18, [0x001a, %r31]
tagged_20_392:
	tsubcctv %r9, 0x1fa6, %r13
	.word 0xe407e0d8  ! 633: LDUW_I	lduw	[%r31 + 0x00d8], %r18
	.word 0xa5a00170  ! 634: FABSq	dis not found

	.word 0xc1bfde00  ! 635: STDFA_R	stda	%f0, [%r0, %r31]
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 636: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87ac8a46  ! 637: FCMPd	fcmpd	%fcc<n>, %f18, %f6
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_20_395:
	setx 0xa5b52a7941a06275, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 641: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_20_396:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7844003  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r3, %-
	rd %pc, %r19
	add %r19, (ivw_20_397-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_397:
	.word 0x91930000  ! 643: WRPR_PIL_R	wrpr	%r12, %r0, %pil
	.word 0xe0d7e010  ! 644: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_20_399:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_20_400:
	.word 0x24cc0001  ! 1: BRLEZ	brlez,a,pt	%r16,<label_0xc0001>
	.word 0x81982b8c  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8c, %hpstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_20_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d940003  ! 649: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0x99a009d4  ! 650: FDIVd	fdivd	%f0, %f20, %f12
	.word 0xa7a00173  ! 651: FABSq	dis not found

mondo_20_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918010  ! 652: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
    mov (20+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_20_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_20_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xc1bfdb60  ! 654: STDFA_R	stda	%f0, [%r0, %r31]
	setx 0x8712f9776ef084a0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_20_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_20_406:
	setx 0x6c2676f505432bf8, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_20_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94c00c  ! 657: WRPR_WSTATE_R	wrpr	%r19, %r12, %wstate
	.word 0xe06fe052  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x0052]
splash_cmpr_20_408:
	setx 0x67915f2ac1f4c469, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_409
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 660: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_410) + 0, 16, 16)) -> intp(5,0,22)
intvec_20_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f803e95  ! 663: SIR	sir	0x1e95
DS_20_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f20
	.word 0xa9a00554  ! 1: FSQRTd	fsqrt	
	.word 0x95a48827  ! 664: FADDs	fadds	%f18, %f7, %f10
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd83fe018  ! 667: STD_I	std	%r12, [%r31 + 0x0018]
mondo_20_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d940009  ! 668: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
mondo_20_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d908007  ! 669: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
	.word 0x93a00172  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_20_414) + 32, 16, 16)) -> intp(0,0,14)
intvec_20_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a249d4  ! 673: FDIVd	fdivd	%f40, %f20, %f12
	.word 0xe1e0802b  ! 674: CASA_I	casa	[%r2] 0x 1, %r11, %r16
	.word 0xe83fc000  ! 675: STD_R	std	%r20, [%r31 + %r0]
splash_lsu_20_416:
	ta T_CHANGE_HPRIV
	set 0x8a50dfb6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_20_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d908011  ! 677: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0xe88fe008  ! 678: LDUBA_I	lduba	[%r31, + 0x0008] %asi, %r20
cwp_20_418:
    set user_data_start, %o7
	.word 0x93902002  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9ba4c9d4  ! 680: FDIVd	fdivd	%f50, %f20, %f44
mondo_20_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d904004  ! 681: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8025b2  ! 683: SIR	sir	0x05b2
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_20_420)+24, 16, 16)) -> intp(mask2tid(0x20),1,3)
xir_20_420:
	.word 0xa984a75e  ! 684: WR_SET_SOFTINT_I	wr	%r18, 0x075e, %set_softint
pmu_20_421:
	nop
	setx 0xfffffb94fffff51a, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a409d2  ! 687: FDIVd	fdivd	%f16, %f18, %f16
	rd %pc, %r19
	add %r19, (ivw_20_422-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_20_422:
	.word 0x91934010  ! 688: WRPR_PIL_R	wrpr	%r13, %r16, %pil
	.word 0xe19fdc00  ! 689: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x919238ab  ! 690: WRPR_PIL_I	wrpr	%r8, 0x18ab, %pil
	.word 0x99902004  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd097e030  ! 692: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
splash_cmpr_20_423:
	setx 0x7e7ab7311760bc2e, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d902eb2  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0eb2, %pstate
	.word 0x91d02034  ! 695: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1a00164  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_425
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_425:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 697: RDPC	rd	%pc, %r19
	.word 0xd6d7e038  ! 698: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r11
pmu_20_426:
	nop
	setx 0xfffffb7cfffff014, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe19fdc00  ! 700: LDDFA_R	ldda	[%r31, %r0], %f16
    ta T_CHANGE_HPRIV
    mov (20+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_20_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_20_427
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_20_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 701: RDPC	rd	%pc, %r19
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
mondo_10_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d920002  ! 1: WRPR_WSTATE_R	wrpr	%r8, %r2, %wstate
intveclr_10_1:
	setx 0x654f19d7e4bf5034, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_2:
	setx 0x18ad9bd591fdd79e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 4: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_3
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_3:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 5: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_4)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_4:
	.word 0xa980beef  ! 6: WR_SET_SOFTINT_I	wr	%r2, 0x1eef, %set_softint
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_10_6:
	set user_data_start, %r31
	.word 0x8584f749  ! 8: WRCCR_I	wr	%r19, 0x1749, %ccr
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_7
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 9: RDPC	rd	%pc, %r16
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d9024e3  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x04e3, %pstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_10_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_10_11:
	setx 0xa3885ed21fe29820, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_12) + 0, 16, 16)) -> intp(0,0,30)
intvec_10_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_13:
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x819829de  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0xe19fc3e0  ! 16: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_10_14:
	nop
	setx 0xfffff3a1fffffd89, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_10_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82029  ! 19: PREFETCHA_I	prefetcha	[%r0, + 0x0029] %asi, #one_read
donret_10_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_17-donret_10_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00958a45 | (0x58 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x96, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_17:
	.word 0xe6ffe070  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x0070] %asi
DS_10_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e0fc  ! 23: STQF_I	-	%f19, [0x00fc, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_10_20:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xa1a209cc  ! 27: FDIVd	fdivd	%f8, %f12, %f16
DS_10_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad802d95  ! 29: WR_SOFTINT_REG_I	wr	%r0, 0x0d95, %softint
	.word 0xe19fd960  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_10_23:
	.word 0x8198249d  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049d, %hpstate
	.word 0xd73fe080  ! 32: STDF_I	std	%f11, [0x0080, %r31]
pmu_10_24:
	nop
	setx 0xfffff77efffffcaf, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d930002  ! 34: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
mondo_10_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d90c014  ! 35: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	setx 0x5835dc261a778da0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_28:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x81982246  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0246, %hpstate
jmptr_10_29:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x95b28990  ! 39: BSHUFFLE	fmovc32	%d10, %d16, %d10
	.word 0xe43d0004  ! 40: STD_R	std	%r18, [%r20 + %r4]
jmptr_10_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_10_32:
	setx 0x6aed8820f03eba52, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_10_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_33-donret_10_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00033b3f | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa06, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	done
donretarg_10_33:
	.word 0xd6ffe0ea  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x00ea] %asi
debug_10_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_34:
	mov 0x4dc, %r20
	mov 0x3, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6bfc023  ! 45: STDA_R	stda	%r11, [%r31 + %r3] 0x01
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97b4c990  ! 47: BSHUFFLE	fmovc32	%d50, %d16, %d42
	.word 0x95a00162  ! 48: FABSq	dis not found

memptr_10_36:
	set user_data_start, %r31
	.word 0x8584b5ae  ! 49: WRCCR_I	wr	%r18, 0x15ae, %ccr
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_37
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_37:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 50: RDPC	rd	%pc, %r11
DS_10_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_10_39:
	setx 0xad2090e0aab329c9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_10_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe0a7  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x00a7]
donret_10_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_41-donret_10_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00392a5e | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb8c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	done
donretarg_10_41:
	.word 0xe0ffe0d5  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x00d5] %asi
mondo_10_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d950014  ! 56: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
DS_10_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_10_45:
	nop
	setx 0xfffff280fffff668, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_10_46:
	nop
	setx 0xfffffa2dfffff061, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d934003  ! 61: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_10_48:
	set user_data_start, %r31
	.word 0x8584677f  ! 64: WRCCR_I	wr	%r17, 0x077f, %ccr
intveclr_10_49:
	setx 0x76905fc892361d4b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x87a84a46  ! 67: FCMPd	fcmpd	%fcc<n>, %f32, %f6
	.word 0xd427e081  ! 68: STW_I	stw	%r10, [%r31 + 0x0081]
splash_cmpr_10_51:
	setx 0x9c41fcecad93e4ce, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_52) + 16, 16, 16)) -> intp(1,0,25)
intvec_10_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_10_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f0, %f30
	.word 0xa9b4830d  ! 71: ALIGNADDRESS	alignaddr	%r18, %r13, %r20
donret_10_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_54-donret_10_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x008ed898 | (0x89 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf5d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_54:
	.word 0xe2ffe0d0  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x00d0] %asi
	.word 0x95b00989  ! 73: BSHUFFLE	fmovc32	%d0, %d40, %d10
	.word 0x9f802790  ! 74: SIR	sir	0x0790
	.word 0x9f802ea9  ! 75: SIR	sir	0x0ea9
fpinit_10_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e820c2  ! 76: PREFETCHA_I	prefetcha	[%r0, + 0x00c2] %asi, #one_read
	.word 0x91d020b3  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd8d7e038  ! 78: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r12
	.word 0x8d903f7b  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x1f7b, %pstate
jmptr_10_58:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe0a8  ! 81: STDF_I	std	%f12, [0x00a8, %r31]
	.word 0xa1500000  ! 82: RDPR_TPC	rdpr	%tpc, %r16
mondo_10_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944014  ! 83: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_60
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_60:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 84: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_61
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_61:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 85: RDPC	rd	%pc, %r11
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a7c  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x1a7c, %pstate
splash_lsu_10_63:
	ta T_CHANGE_HPRIV
	set 0xed1c065b, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_64:
	.word 0x8198240d  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
intveclr_10_65:
	setx 0xa86fe707c1f67a7d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9b104d2  ! 90: FCMPNE32	fcmpne32	%d4, %d18, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_66) + 32, 16, 16)) -> intp(7,0,19)
intvec_10_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_67:
	setx 0x258160d15587ee73, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_10_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_68:
	mov 0xdd3, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd23ff650  ! 93: STD_I	std	%r9, [%r31 + 0xfffff650]
splash_cmpr_10_69:
	setx 0x1e84bcc06ba77e51, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_10_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_71:
	mov 0x94d, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd2dfc031  ! 96: LDXA_R	ldxa	[%r31, %r17] 0x01, %r9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0xa1a00171  ! 98: FABSq	dis not found

pmu_10_72:
	nop
	setx 0xfffffffcfffff571, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_73)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_73:
	.word 0xa980adb8  ! 100: WR_SET_SOFTINT_I	wr	%r2, 0x0db8, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_10_74:
	.word 0xa1a2c9d4  ! 1: FDIVd	fdivd	%f42, %f20, %f16
	pdist %f26, %f16, %f28
	.word 0x99b10312  ! 102: ALIGNADDRESS	alignaddr	%r4, %r18, %r12
fpinit_10_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 103: FCMPd	fcmpd	%fcc<n>, %f0, %f4
memptr_10_76:
	set 0x60540000, %r31
	.word 0x85836f17  ! 104: WRCCR_I	wr	%r13, 0x0f17, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_10_77:
	nop
	setx 0xfffff96afffff6be, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_10_78:
	setx 0x8ad4d86d5a0abec5, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 108: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_10_79:
	taddcctv %r13, 0x1eab, %r18
	.word 0xe807e090  ! 109: LDUW_I	lduw	[%r31 + 0x0090], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d020b2  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87a98a41  ! 112: FCMPd	fcmpd	%fcc<n>, %f6, %f32
	.word 0xe66fe065  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x0065]
	.word 0x91d02032  ! 114: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_10_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 115: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
splash_htba_10_82:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802a74  ! 117: SIR	sir	0x0a74
	.word 0xc19fda00  ! 118: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x0e4f670bdfa724ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 120: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_84
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_84:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 121: RDPC	rd	%pc, %r20
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 122: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x8d902971  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x0971, %pstate
splash_tba_10_86:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
pmu_10_87:
	nop
	setx 0xfffffea8fffff9b2, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_88) + 24, 16, 16)) -> intp(6,0,12)
intvec_10_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfda00  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd297e020  ! 129: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
splash_lsu_10_89:
	ta T_CHANGE_HPRIV
	set 0x18d3f6d5, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_90:
	nop
	setx 0xfffff50efffff81a, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	.word 0x9192f8f0  ! 133: WRPR_PIL_I	wrpr	%r11, 0x18f0, %pil
mondo_10_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d918014  ! 134: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
mondo_10_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d940011  ! 135: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0016a  ! 137: FABSq	dis not found

	.word 0x9f802180  ! 138: SIR	sir	0x0180
jmptr_10_94:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x39400001  ! 141: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_10_95:
	ta T_CHANGE_HPRIV
	set 0xe201a0c7, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_10_96:
	nop
	setx 0xfffff953fffff431, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_10_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_97:
	mov 0x5bb, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 144: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd897e010  ! 145: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x91500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_98) + 8, 16, 16)) -> intp(4,0,1)
intvec_10_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a0c9c8  ! 148: FDIVd	fdivd	%f34, %f8, %f48
splash_tba_10_99:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_10_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d914009  ! 150: WRPR_WSTATE_R	wrpr	%r5, %r9, %wstate
splash_hpstate_10_101:
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x81982e1e  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1e, %hpstate
	rd %pc, %r19
	add %r19, (ivw_10_102-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_102:
	.word 0x91924011  ! 152: WRPR_PIL_R	wrpr	%r9, %r17, %pil
mondo_10_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d944001  ! 153: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d902572  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0572, %pstate
	.word 0xe1bfe060  ! 155: STDFA_I	stda	%f16, [0x0060, %r31]
	.word 0x9f802d89  ! 156: SIR	sir	0x0d89
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_10_106:
	setx 0xa6b491a143222755, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_10_107:
	set 0x60740000, %r31
	.word 0x85802766  ! 159: WRCCR_I	wr	%r0, 0x0766, %ccr
	.word 0xe1bfe0e0  ! 160: STDFA_I	stda	%f16, [0x00e0, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_108)+8, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_108:
	.word 0xa985361c  ! 161: WR_SET_SOFTINT_I	wr	%r20, 0x161c, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_10_111:
	nop
	setx 0xfffff3bbfffff19c, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe05f  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x005f]
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_112
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_112:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 167: RDPC	rd	%pc, %r18
	.word 0xa1a0016a  ! 168: FABSq	dis not found

	.word 0x9750c000  ! 169: RDPR_TT	<illegal instruction>
mondo_10_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d90c000  ! 170: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	.word 0xa3a00174  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_114
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 172: RDPC	rd	%pc, %r17
intveclr_10_115:
	setx 0x6efe4162e4e8f98e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_116-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_116:
	.word 0x9192c012  ! 174: WRPR_PIL_R	wrpr	%r11, %r18, %pil
	setx 0xc7ffa5a86457856b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe23fc000  ! 176: STD_R	std	%r17, [%r31 + %r0]
mondo_10_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d940014  ! 177: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
pmu_10_120:
	nop
	setx 0xfffff0f3ffffffca, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe028  ! 179: LDDA_I	ldda	[%r31, + 0x0028] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_121
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 180: RDPC	rd	%pc, %r20
change_to_randtl_10_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_122:
	.word 0x8f902001  ! 181: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_10_123:
	.word 0x8198289d  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
DS_10_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe37a6c1e	! Random illegal ?
	.word 0xa9a189c3  ! 1: FDIVd	fdivd	%f6, %f34, %f20
	.word 0x93a4c829  ! 183: FADDs	fadds	%f19, %f9, %f9
	.word 0x91d020b3  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 179
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_125
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_125:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 185: RDPC	rd	%pc, %r13
DS_10_126:
	.word 0x95a009c9  ! 1: FDIVd	fdivd	%f0, %f40, %f10
	allclean
	.word 0xa3b00302  ! 186: ALIGNADDRESS	alignaddr	%r0, %r2, %r17
	.word 0x91d020b3  ! 187: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_10_127:
	setx 0xb3ca48c15e38da23, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab817f99  ! 189: WR_CLEAR_SOFTINT_I	wr	%r5, 0x1f99, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_128) + 8, 16, 16)) -> intp(3,0,24)
intvec_10_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_129:
	nop
	setx 0xfffff7ebfffff730, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe08b  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x008b]
	rd %pc, %r19
	add %r19, (ivw_10_130-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_130:
	.word 0x9194c011  ! 193: WRPR_PIL_R	wrpr	%r19, %r17, %pil
	.word 0xe19fde00  ! 194: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad8227de  ! 196: WR_SOFTINT_REG_I	wr	%r8, 0x07de, %softint
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe00d  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x000d]
intveclr_10_132:
	setx 0x9c73e20794ab7214, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_133)+48, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_133:
	.word 0xa980a113  ! 200: WR_SET_SOFTINT_I	wr	%r2, 0x0113, %set_softint
	.word 0x8d902276  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0276, %pstate
jmptr_10_135:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d902e6f  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x0e6f, %pstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x93d020b3  ! 205: Tcc_I	tne	icc_or_xcc, %r0 + 179
debug_10_138:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_138:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_138
    nop
debug_wait10_138:
    ld [%r23], %r16
    brnz %r16, debug_wait10_138
    nop
    ba,a debug_startwait10_138
continue_debug_10_138:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_138:
    cmp %r13, %r17
    bne,a wait_for_stat_10_138
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_138:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_138
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050b2c00026,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd89fc021  ! 206: LDDA_R	ldda	[%r31, %r1] 0x01, %r12
memptr_10_139:
	set 0x60340000, %r31
	.word 0x8580b5f5  ! 207: WRCCR_I	wr	%r2, 0x15f5, %ccr
	.word 0xa5a509d1  ! 208: FDIVd	fdivd	%f20, %f48, %f18
splash_hpstate_10_140:
	.word 0x2ec8c001  ! 1: BRGEZ	brgez,a,pt	%r3,<label_0x8c001>
	.word 0x819829c6  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c6, %hpstate
	.word 0x91d02033  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xc93089f199ed8e08, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_142)+8, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_142:
	.word 0xa9846cf3  ! 214: WR_SET_SOFTINT_I	wr	%r17, 0x0cf3, %set_softint
DS_10_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f12, %f28
	.word 0xa3b14302  ! 215: ALIGNADDRESS	alignaddr	%r5, %r2, %r17
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_144:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 216: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_10_145-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_145:
	.word 0x91940009  ! 217: WRPR_PIL_R	wrpr	%r16, %r9, %pil
	.word 0xc3eac027  ! 218: PREFETCHA_R	prefetcha	[%r11, %r7] 0x01, #one_read
debug_10_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_10_146:
	mov 0xb7f, %r20
	mov 0xd, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe63fffa2  ! 219: STD_I	std	%r19, [%r31 + 0xffffffa2]
	.word 0xe71fe038  ! 220: LDDF_I	ldd	[%r31, 0x0038], %f19
	.word 0xe19fda00  ! 221: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x66a7b649955cce17, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ad0a54  ! 223: FCMPd	fcmpd	%fcc<n>, %f20, %f20
invtsb_10_148:
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
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0x9b702578  ! 225: POPC_I	popc	0x0578, %r13
mondo_10_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948010  ! 226: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe4dfe020  ! 227: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_150)+24, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_150:
	.word 0xa982ee2d  ! 229: WR_SET_SOFTINT_I	wr	%r11, 0x0e2d, %set_softint
	.word 0xe46fe035  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x0035]
mondo_10_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d90000d  ! 231: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
jmptr_10_152:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xc38b5e03debf828c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_10_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe131c010  ! 1: STQF_R	-	%f16, [%r16, %r7]
	normalw
	.word 0x99458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x9f8038cd  ! 235: SIR	sir	0x18cd
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_10_155:
	nop
	setx 0xfffff2b3fffff545, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_10_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d944007  ! 239: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
debug_10_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_10_157:
	mov 0x439, %r20
	mov 0x1b, %r19
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
	.word 0xe73fc014  ! 240: STDF_R	std	%f19, [%r20, %r31]
	.word 0x8d903009  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x1009, %pstate
mondo_10_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94c012  ! 242: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f803ea3  ! 244: SIR	sir	0x1ea3
	.word 0x93a00174  ! 245: FABSq	dis not found

intveclr_10_161:
	setx 0x5cb3b6ebe9c2262c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_10_162:
	nop
	setx 0xfffffa38fffff9ad, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_10_163:
	setx 0x6ca987c08f595223, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe5e7c020  ! 250: CASA_I	casa	[%r31] 0x 1, %r0, %r18
debug_10_165:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_165:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_165
    nop
debug_wait10_165:
    ld [%r23], %r16
    brnz %r16, debug_wait10_165
    nop
    ba,a debug_startwait10_165
continue_debug_10_165:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_165:
    cmp %r13, %r17
    bne,a wait_for_stat_10_165
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_165:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_165
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000502bc02607,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe43fe327  ! 251: STD_I	std	%r18, [%r31 + 0x0327]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_166) + 56, 16, 16)) -> intp(7,0,24)
intvec_10_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_167:
	setx 0xc00b36d550e7eb5f, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_10_168:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_10_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d940013  ! 255: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
jmptr_10_170:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_10_171-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_171:
	.word 0x91950013  ! 257: WRPR_PIL_R	wrpr	%r20, %r19, %pil
	.word 0x97a309d3  ! 258: FDIVd	fdivd	%f12, %f50, %f42
mondo_10_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d918005  ! 259: WRPR_WSTATE_R	wrpr	%r6, %r5, %wstate
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 260: RDPC	rd	%pc, %r16
splash_lsu_10_174:
	ta T_CHANGE_HPRIV
	set 0x8d28dbd9, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0xc3e9402a  ! 263: PREFETCHA_R	prefetcha	[%r5, %r10] 0x01, #one_read
	.word 0xc19fc3e0  ! 264: LDDFA_R	ldda	[%r31, %r0], %f0
intveclr_10_176:
	setx 0xc317c82af7b9701b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e0a0  ! 266: STX_I	stx	%r20, [%r31 + 0x00a0]
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_10_178:
	nop
	setx 0xfffffc62fffffef7, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe80fe030  ! 272: LDUB_I	ldub	[%r31 + 0x0030], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_180)+48, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_180:
	.word 0xa980a4f3  ! 273: WR_SET_SOFTINT_I	wr	%r2, 0x04f3, %set_softint
jmptr_10_181:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_10_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 277: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xa1b50991  ! 278: BSHUFFLE	fmovc32	%d20, %d48, %d16
	.word 0x24c88001  ! 279: BRLEZ	brlez,a,pt	%r2,<label_0x88001>
	.word 0xe26fe062  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x0062]
	setx 0xacfb769cca6ce8d9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_10_186:
	.word 0x81982b3f  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b3f, %hpstate
cwp_10_187:
    set user_data_start, %o7
	.word 0x93902006  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
intveclr_10_188:
	setx 0x022e299595a5b5f5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe08c  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x008c]
	.word 0x83d020b4  ! 286: Tcc_I	te	icc_or_xcc, %r0 + 180
intveclr_10_189:
	setx 0xac785c68553578f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_10_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92c00c  ! 288: WRPR_WSTATE_R	wrpr	%r11, %r12, %wstate
fpinit_10_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83433  ! 289: PREFETCHA_I	prefetcha	[%r0, + 0xfffff433] %asi, #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_192) + 8, 16, 16)) -> intp(4,0,22)
intvec_10_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_193:
	nop
	setx 0xfffff746fffff166, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a509c9  ! 293: FDIVd	fdivd	%f20, %f40, %f18
fpinit_10_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83433  ! 294: PREFETCHA_I	prefetcha	[%r0, + 0xfffff433] %asi, #one_read
	.word 0x9194f2f7  ! 295: WRPR_PIL_I	wrpr	%r19, 0x12f7, %pil
	.word 0x91d02034  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc36fe0bd  ! 299: PREFETCH_I	prefetch	[%r31 + 0x00bd], #one_read
fpinit_10_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 300: FDIVd	fdivd	%f0, %f4, %f4
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 301: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_198:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 302: RDPC	rd	%pc, %r12
splash_lsu_10_199:
	ta T_CHANGE_HPRIV
	set 0x3c8e5275, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d930012  ! 304: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
memptr_10_201:
	set user_data_start, %r31
	.word 0x858166a3  ! 305: WRCCR_I	wr	%r5, 0x06a3, %ccr
	.word 0x9f80329b  ! 306: SIR	sir	0x129b
splash_lsu_10_202:
	ta T_CHANGE_HPRIV
	set 0x2bb3b244, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803df5  ! 308: SIR	sir	0x1df5
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_203
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_203:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 309: RDPC	rd	%pc, %r17
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_204) + 56, 16, 16)) -> intp(1,0,22)
intvec_10_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_205
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_205:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 311: RDPC	rd	%pc, %r10
mondo_10_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d948007  ! 312: WRPR_WSTATE_R	wrpr	%r18, %r7, %wstate
cwp_10_207:
    set user_data_start, %o7
	.word 0x93902002  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_10_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d904012  ! 315: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc3ec8031  ! 317: PREFETCHA_R	prefetcha	[%r18, %r17] 0x01, #one_read
	.word 0xd91fe000  ! 318: LDDF_I	ldd	[%r31, 0x0000], %f12
	.word 0xe1bfda00  ! 319: STDFA_R	stda	%f16, [%r0, %r31]
memptr_10_210:
	set user_data_start, %r31
	.word 0x858538cf  ! 320: WRCCR_I	wr	%r20, 0x18cf, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_10_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x99a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f12
	.word 0x99a4482d  ! 322: FADDs	fadds	%f17, %f13, %f12
	.word 0xe137e05e  ! 323: STQF_I	-	%f16, [0x005e, %r31]
pmu_10_212:
	nop
	setx 0xfffffa63fffff149, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803e62  ! 325: SIR	sir	0x1e62
mondo_10_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d930002  ! 326: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
	.word 0xa6680005  ! 327: UDIVX_R	udivx 	%r0, %r5, %r19
	.word 0x9f802ecb  ! 328: SIR	sir	0x0ecb
	.word 0xc1bfdb60  ! 329: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9745c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xe137e050  ! 331: STQF_I	-	%f16, [0x0050, %r31]
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a109c8  ! 333: FDIVd	fdivd	%f4, %f8, %f18
	.word 0x91d020b4  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa7500000  ! 335: RDPR_TPC	rdpr	%tpc, %r19
intveclr_10_214:
	setx 0x4fb2cae7f4ab5aeb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 337: Tcc_I	te	icc_or_xcc, %r0 + 51
	rd %pc, %r19
	add %r19, (ivw_10_215-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_215:
	.word 0x91950012  ! 338: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0x91a009c4  ! 339: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xa9464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r20
pmu_10_216:
	nop
	setx 0xfffff71cfffff7e4, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_218) + 24, 16, 16)) -> intp(1,0,26)
intvec_10_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_219
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_219:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 344: RDPC	rd	%pc, %r9
splash_htba_10_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9545c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xe1bfdf20  ! 347: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa3a509d4  ! 348: FDIVd	fdivd	%f20, %f20, %f48
	setx 0xabcbeb92bb34dad4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe008  ! 350: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r13
mondo_10_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d914000  ! 351: WRPR_WSTATE_R	wrpr	%r5, %r0, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_10_223:
	set 0x60740000, %r31
	.word 0x85852331  ! 353: WRCCR_I	wr	%r20, 0x0331, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe07c  ! 355: STDA_I	stda	%r13, [%r31 + 0x007c] %asi
pmu_10_224:
	nop
	setx 0xfffff51bfffffc00, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0xa9b087e3  ! 358: PDISTN	fmean16	%d2, %d34, %d20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_225)+0, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_225:
	.word 0xa98528ea  ! 359: WR_SET_SOFTINT_I	wr	%r20, 0x08ea, %set_softint
	.word 0x9f8031ab  ! 360: SIR	sir	0x11ab
intveclr_10_226:
	setx 0x763e6e87fa16707a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_10_228:
	set user_data_start, %r31
	.word 0x8581b0cb  ! 363: WRCCR_I	wr	%r6, 0x10cb, %ccr
	.word 0x91d020b4  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1b0c7f0  ! 365: PDISTN	fmean16	%d34, %d16, %d16
	.word 0x9f802300  ! 366: SIR	sir	0x0300
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_229)+24, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_229:
	.word 0xa984acf0  ! 367: WR_SET_SOFTINT_I	wr	%r18, 0x0cf0, %set_softint
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_230:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 368: RDPC	rd	%pc, %r10
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0xa5a00174  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_10_232-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_232:
	.word 0x91924004  ! 372: WRPR_PIL_R	wrpr	%r9, %r4, %pil
splash_decr_10_233:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r18, [%r1] 0x45
	.word 0xa784c010  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r16, %-
DS_10_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d902307  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x0307, %pstate
intveclr_10_237:
	setx 0x20bfde5e901e278d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a2c9c7  ! 378: FDIVd	fdivd	%f42, %f38, %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_238) + 40, 16, 16)) -> intp(2,0,27)
intvec_10_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_10_239:
	.word 0x99a489c1  ! 1: FDIVd	fdivd	%f18, %f32, %f12
	.word 0xd934ab4d  ! 1: STQF_I	-	%f12, [0x0b4d, %r18]
	normalw
	.word 0x91458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r8
splash_hpstate_10_240:
	.word 0x81982dfd  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dfd, %hpstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_242
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_242:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 383: RDPC	rd	%pc, %r18
	.word 0xe127e08e  ! 384: STF_I	st	%f16, [0x008e, %r31]
DS_10_243:
	.word 0x95a249d1  ! 1: FDIVd	fdivd	%f40, %f48, %f10
	.word 0xe134632b  ! 1: STQF_I	-	%f16, [0x032b, %r17]
	normalw
	.word 0xa9458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r20
fpinit_10_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 386: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xe1bfdb60  ! 387: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x93d02034  ! 388: Tcc_I	tne	icc_or_xcc, %r0 + 52
mondo_10_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 389: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_246) + 8, 16, 16)) -> intp(2,0,14)
intvec_10_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_247
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_247:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 391: RDPC	rd	%pc, %r16
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_10_248:
	setx 0x0d2b2868d3800bb0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_249-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_249:
	.word 0x91910012  ! 394: WRPR_PIL_R	wrpr	%r4, %r18, %pil
	.word 0xe62fe07c  ! 395: STB_I	stb	%r19, [%r31 + 0x007c]
fpinit_10_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 396: FDIVs	fdivs	%f0, %f4, %f6
mondo_10_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c001  ! 397: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
DS_10_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe530c012  ! 1: STQF_R	-	%f18, [%r18, %r3]
	normalw
	.word 0x97458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe1bfdf20  ! 399: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_10_253:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_254
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_254:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 402: RDPC	rd	%pc, %r9
fpinit_10_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 403: FCMPd	fcmpd	%fcc<n>, %f0, %f4
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9745c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xe8dfe030  ! 407: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 408: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_10_257:
	nop
	setx 0xfffffb90fffff3b1, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_10_258:
	ta T_CHANGE_HPRIV
	set 0x448c35a0, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_259:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_10_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r14, [%r1] 0x45
	.word 0xa7840013  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r19, %-
	.word 0x9f803ff0  ! 413: SIR	sir	0x1ff0
memptr_10_261:
	set user_data_start, %r31
	.word 0x858426f7  ! 414: WRCCR_I	wr	%r16, 0x06f7, %ccr
mondo_10_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d940001  ! 415: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0x8d90216c  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x016c, %pstate
	.word 0x99a00170  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_264
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_264:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 418: RDPC	rd	%pc, %r8
pmu_10_265:
	nop
	setx 0xfffff429fffffbd1, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa7a049c8  ! 421: FDIVd	fdivd	%f32, %f8, %f50
	.word 0xe427e034  ! 422: STW_I	stw	%r18, [%r31 + 0x0034]
	rd %pc, %r19
	add %r19, (ivw_10_266-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_266:
	.word 0x91950009  ! 423: WRPR_PIL_R	wrpr	%r20, %r9, %pil
	.word 0xa5500000  ! 424: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xc36fe0f4  ! 425: PREFETCH_I	prefetch	[%r31 + 0x00f4], #one_read
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_268) + 32, 16, 16)) -> intp(0,0,29)
intvec_10_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_10_269:
	setx 0x10a97fd353e99602, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_10_270:
	set user_data_start, %r31
	.word 0x8584fe5f  ! 429: WRCCR_I	wr	%r19, 0x1e5f, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_271:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 430: RDPC	rd	%pc, %r12
    set 0x21c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa7b407f0  ! 431: PDISTN	fmean16	%d16, %d16, %d50
	.word 0x91d02033  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_272
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_272:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 433: RDPC	rd	%pc, %r12
	.word 0x91d020b4  ! 434: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa3a00172  ! 435: FABSq	dis not found

splash_hpstate_10_273:
	.word 0x2b400001  ! 1: FBPUG	fbug,a,pn	%fcc0, <label_0x1>
	.word 0x81982c66  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c66, %hpstate
intveclr_10_274:
	setx 0xcef935163cdf5f4c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe030  ! 438: LDD_I	ldd	[%r31 + 0x0030], %r20
	rd %pc, %r19
	add %r19, (ivw_10_275-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_275:
	.word 0x9194c011  ! 439: WRPR_PIL_R	wrpr	%r19, %r17, %pil
donret_10_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_276-donret_10_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00acb792 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xe44, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	retry
donretarg_10_276:
	.word 0xe8ffe0d2  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x00d2] %asi
splash_hpstate_10_277:
	.word 0x81982a95  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0x37af27b84406bb4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_10_280:
	nop
	setx 0xfffff043fffff11c, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_10_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_281:
	.word 0x8f902000  ! 445: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_10_282:
	setx 0xfa6c4db0bc4eb273, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fdf20  ! 447: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe93fe0e1  ! 448: STDF_I	std	%f20, [0x00e1, %r31]
	.word 0xc1bfe0c0  ! 449: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0xe8dfe010  ! 450: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0x25400001  ! 1: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902056  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x0056, %pstate
	.word 0x24cc8001  ! 452: BRLEZ	brlez,a,pt	%r18,<label_0xc8001>
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	.word 0xc36fe0da  ! 454: PREFETCH_I	prefetch	[%r31 + 0x00da], #one_read
	.word 0xa3a349c0  ! 455: FDIVd	fdivd	%f44, %f0, %f48
splash_cmpr_10_285:
	setx 0x7d9611f9f696efad, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_10_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d94c014  ! 457: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xe1bfd920  ! 458: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xe19fe0e0  ! 459: LDDFA_I	ldda	[%r31, 0x00e0], %f16
pmu_10_287:
	nop
	setx 0xfffff11cfffff286, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_10_288:
	.word 0xa3a409c1  ! 1: FDIVd	fdivd	%f16, %f32, %f48
	allclean
	.word 0x91b4030b  ! 461: ALIGNADDRESS	alignaddr	%r16, %r11, %r8
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 462: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x904240a7b666cf38, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_290)+16, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_290:
	.word 0xa9836f95  ! 464: WR_SET_SOFTINT_I	wr	%r13, 0x0f95, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_291)+24, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_291:
	.word 0xa9806774  ! 465: WR_SET_SOFTINT_I	wr	%r1, 0x0774, %set_softint
	.word 0xe20fe010  ! 466: LDUB_I	ldub	[%r31 + 0x0010], %r17
	.word 0xa5540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0x9350c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_292
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_292:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 469: RDPC	rd	%pc, %r20
	.word 0x9f8029d1  ! 470: SIR	sir	0x09d1
intveclr_10_293:
	setx 0xdda5c9f7df27ad0c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_10_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 472: FCMPd	fcmpd	%fcc<n>, %f0, %f4
pmu_10_295:
	nop
	setx 0xfffffa22fffffe45, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_10_296:
	.word 0x81982396  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0396, %hpstate
donret_10_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_297-donret_10_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00209333 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (10)
	done
donretarg_10_297:
	.word 0xe2ffe00c  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x000c] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93d020b5  ! 477: Tcc_I	tne	icc_or_xcc, %r0 + 181
DS_10_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc15126f8	! Random illegal ?
	.word 0xe114400b  ! 1: LDQF_R	-	[%r17, %r11], %f16
	.word 0xa5a0c832  ! 478: FADDs	fadds	%f3, %f18, %f18
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xa9b44987  ! 480: BSHUFFLE	fmovc32	%d48, %d38, %d20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_10_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_10_302:
	setx 0x4353ad44e9432633, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe0bf  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x00bf]
	.word 0x9f803c92  ! 484: SIR	sir	0x1c92
	setx 0x5ffb8800f02abd41, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a4c9c0  ! 486: FDIVd	fdivd	%f50, %f0, %f8
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x8d9035ff  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x15ff, %pstate
	.word 0xa7a489aa  ! 489: FDIVs	fdivs	%f18, %f10, %f19
	.word 0xa5a00171  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_305
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_305:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 491: RDPC	rd	%pc, %r20
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_10_306:
	setx 0xbe888218da5aca3d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803317  ! 495: SIR	sir	0x1317
	.word 0xa9a0016a  ! 496: FABSq	dis not found

	.word 0x87a8ca4c  ! 497: FCMPd	fcmpd	%fcc<n>, %f34, %f12
	.word 0xc19fe020  ! 498: LDDFA_I	ldda	[%r31, 0x0020], %f0
	.word 0xd64fe000  ! 499: LDSB_I	ldsb	[%r31 + 0x0000], %r11
	.word 0xa7b4498d  ! 500: BSHUFFLE	fmovc32	%d48, %d44, %d50
	.word 0x99a00168  ! 501: FABSq	dis not found

DS_10_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_10_309:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa550c000  ! 504: RDPR_TT	<illegal instruction>
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f8028d1  ! 506: SIR	sir	0x08d1
jmptr_10_311:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_312
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_312:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 508: RDPC	rd	%pc, %r12
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xe19fd960  ! 510: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_314) + 48, 16, 16)) -> intp(5,0,14)
intvec_10_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_10_315:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_10_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9d46dc59	! Random illegal ?
	.word 0x95a00541  ! 1: FSQRTd	fsqrt	
	.word 0xa3a1c826  ! 513: FADDs	fadds	%f7, %f6, %f17
memptr_10_317:
	set 0x60740000, %r31
	.word 0x85846030  ! 514: WRCCR_I	wr	%r17, 0x0030, %ccr
splash_lsu_10_318:
	ta T_CHANGE_HPRIV
	set 0x06b3f509, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x8e413f937f765bef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_10_320:
	setx 0xc4494eb343bcd101, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_10_321:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_321:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_321
    nop
debug_wait10_321:
    ld [%r23], %r16
    brnz %r16, debug_wait10_321
    nop
    ba,a debug_startwait10_321
continue_debug_10_321:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_321:
    cmp %r13, %r17
    bne,a wait_for_stat_10_321
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_321:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_321
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000508fe60759,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd297c02d  ! 519: LDUHA_R	lduha	[%r31, %r13] 0x01, %r9
memptr_10_322:
	set 0x60140000, %r31
	.word 0x858031a6  ! 520: WRCCR_I	wr	%r0, 0x11a6, %ccr
	.word 0xd25fe030  ! 521: LDX_I	ldx	[%r31 + 0x0030], %r9
fpinit_10_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82f18  ! 522: PREFETCHA_I	prefetcha	[%r0, + 0x0f18] %asi, #one_read
	.word 0x91d020b2  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 178
change_to_randtl_10_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_10_324:
	.word 0x8f902000  ! 524: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab834002  ! 525: WR_CLEAR_SOFTINT_R	wr	%r13, %r2, %clear_softint
	.word 0xd26fe084  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x0084]
	setx 0x69b7a11d70de4c30, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_10_326-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_326:
	.word 0x9192c011  ! 528: WRPR_PIL_R	wrpr	%r11, %r17, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 531: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_10_327:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait10_327:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_10_327
    nop
debug_wait10_327:
    ld [%r23], %r16
    brnz %r16, debug_wait10_327
    nop
    ba,a debug_startwait10_327
continue_debug_10_327:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_10_327:
    cmp %r13, %r17
    bne,a wait_for_stat_10_327
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_10_327:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_10_327
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050ffc75900,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e000  ! 532: CASA_R	casa	[%r31] %asi, %r0, %r9
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_328
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_328:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 533: RDPC	rd	%pc, %r8
	.word 0xe26fe094  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x0094]
	.word 0x99520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2acc4001  ! 1: BRNZ	brnz,a,pt	%r17,<label_0xc4001>
	.word 0x8d903e73  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x1e73, %pstate
mondo_10_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d948003  ! 537: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
	.word 0x9f803027  ! 538: SIR	sir	0x1027
mondo_10_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d944014  ! 539: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 541: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_10_332:
	setx 0xcc4815b2daedd2c6, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_10_333:
	setx 0x4018eda60ff8e127, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_334
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_334:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 544: RDPC	rd	%pc, %r20
pmu_10_335:
	nop
	setx 0xfffffe03fffff7b8, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_10_336:
	setx 0x0eff0382710ec799, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_10_337:
	setx 0x7f6e1457efe3ec79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 179
	rd %pc, %r19
	add %r19, (ivw_10_338-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_338:
	.word 0x91950001  ! 549: WRPR_PIL_R	wrpr	%r20, %r1, %pil
splash_lsu_10_339:
	ta T_CHANGE_HPRIV
	set 0xbedc0f70, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 551: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0xe19fe020  ! 552: LDDFA_I	ldda	[%r31, 0x0020], %f16
	setx 0x643209f1ae128eaf, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe010  ! 554: LDUB_I	ldub	[%r31 + 0x0010], %r9
	.word 0x8d903f6b  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x1f6b, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_10_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_10_343-donret_10_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ba0bb5 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x255, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (10)
	done
donretarg_10_343:
	.word 0xd2ffe078  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x0078] %asi
	.word 0x8d90303e  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x103e, %pstate
mondo_10_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d918001  ! 559: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
splash_lsu_10_346:
	ta T_CHANGE_HPRIV
	set 0xedaaaf66, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa0aa8003  ! 561: ANDNcc_R	andncc 	%r10, %r3, %r16
jmptr_10_347:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_10_348:
	setx 0x48437f090d6502f8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_10_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe22fe08b  ! 565: STB_I	stb	%r17, [%r31 + 0x008b]
	.word 0xc1bfdb60  ! 566: STDFA_R	stda	%f0, [%r0, %r31]
tagged_10_350:
	tsubcctv %r16, 0x1436, %r10
	.word 0xe207e007  ! 567: LDUW_I	lduw	[%r31 + 0x0007], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_10_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_352
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_352:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 569: RDPC	rd	%pc, %r17
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_10_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 571: FDIVd	fdivd	%f0, %f4, %f6
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_356:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_10_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d920011  ! 574: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
	.word 0xe7e7c020  ! 575: CASA_I	casa	[%r31] 0x 1, %r0, %r19
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_360)+56, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_360:
	.word 0xa9846d0c  ! 577: WR_SET_SOFTINT_I	wr	%r17, 0x0d0c, %set_softint
memptr_10_361:
	set 0x60540000, %r31
	.word 0x8584670f  ! 578: WRCCR_I	wr	%r17, 0x070f, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_10_362:
	.word 0x81982196  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0196, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_10_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 582: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xab848001  ! 583: WR_CLEAR_SOFTINT_R	wr	%r18, %r1, %clear_softint
	.word 0xab84a8fa  ! 584: WR_CLEAR_SOFTINT_I	wr	%r18, 0x08fa, %clear_softint
pmu_10_364:
	nop
	setx 0xfffff3effffff874, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_365
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_365:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 586: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_366
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_366:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 587: RDPC	rd	%pc, %r20
change_to_randtl_10_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_10_367:
	.word 0x8f902000  ! 588: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
invtsb_10_368:
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
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0x91a00174  ! 590: FABSq	dis not found

	.word 0xd037e056  ! 591: STH_I	sth	%r8, [%r31 + 0x0056]
	rd %pc, %r19
	add %r19, (ivw_10_369-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_369:
	.word 0x9194400b  ! 592: WRPR_PIL_R	wrpr	%r17, %r11, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_10_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 594: FDIVs	fdivs	%f0, %f4, %f8
mondo_10_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d950008  ! 595: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0xd04fe028  ! 596: LDSB_I	ldsb	[%r31 + 0x0028], %r8
DS_10_372:
	.word 0x91a309c8  ! 1: FDIVd	fdivd	%f12, %f8, %f8
	allclean
	.word 0x97b1c305  ! 597: ALIGNADDRESS	alignaddr	%r7, %r5, %r11
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_373
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_373:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 598: RDPC	rd	%pc, %r16
mondo_10_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d910010  ! 599: WRPR_WSTATE_R	wrpr	%r4, %r16, %wstate
DS_10_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe19fdb60  ! 601: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_10_376:
	nop
	setx 0xfffff864fffff4ef, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_10_377:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_10_378:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_10_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d950011  ! 607: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0xe1bfdb60  ! 608: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x83d02032  ! 609: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_cmpr_10_380:
	setx 0x1d948d08d818b083, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0xbb5b91776864f383, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00170  ! 613: FABSq	dis not found

splash_cmpr_10_382:
	setx 0xb53cbdba6d0329a9, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_10_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830d0  ! 615: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0d0] %asi, #one_read
jmptr_10_384:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fc2c0  ! 617: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe1e7c020  ! 618: CASA_I	casa	[%r31] 0x 1, %r0, %r16
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_386
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_386:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 619: RDPC	rd	%pc, %r13
pmu_10_387:
	nop
	setx 0xfffff9f4fffff411, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_388
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_388:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 621: RDPC	rd	%pc, %r11
pmu_10_389:
	nop
	setx 0xfffff997fffff266, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe0c5  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x00c5]
fpinit_10_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 624: FDIVd	fdivd	%f0, %f4, %f8
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 625: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1a489d4  ! 626: FDIVd	fdivd	%f18, %f20, %f16
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 627: Tcc_R	tne	icc_or_xcc, %r0 + %r30
pmu_10_391:
	nop
	setx 0xffffff09fffffa47, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a509d0  ! 629: FDIVd	fdivd	%f20, %f16, %f10
	.word 0xe4bfe080  ! 630: STDA_I	stda	%r18, [%r31 + 0x0080] %asi
	.word 0xc1bfe080  ! 631: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0xe527e0f8  ! 632: STF_I	st	%f18, [0x00f8, %r31]
tagged_10_392:
	tsubcctv %r7, 0x13fe, %r3
	.word 0xe407e06e  ! 633: LDUW_I	lduw	[%r31 + 0x006e], %r18
	.word 0xa3a00171  ! 634: FABSq	dis not found

	.word 0xe1bfe040  ! 635: STDFA_I	stda	%f16, [0x0040, %r31]
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 636: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc3ea0030  ! 637: PREFETCHA_R	prefetcha	[%r8, %r16] 0x01, #one_read
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_10_395:
	setx 0x85f11e3c181f6662, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 641: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_decr_10_396:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa782800a  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r10, %r10, %-
	rd %pc, %r19
	add %r19, (ivw_10_397-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_397:
	.word 0x9191c013  ! 643: WRPR_PIL_R	wrpr	%r7, %r19, %pil
	.word 0xe0d7e030  ! 644: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_10_399:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_10_400:
	.word 0x2acc0001  ! 1: BRNZ	brnz,a,pt	%r16,<label_0xc0001>
	.word 0x81982107  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_10_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d900013  ! 649: WRPR_WSTATE_R	wrpr	%r0, %r19, %wstate
	.word 0xa7a109d2  ! 650: FDIVd	fdivd	%f4, %f18, %f50
	.word 0xa1a00171  ! 651: FABSq	dis not found

mondo_10_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d92400d  ! 652: WRPR_WSTATE_R	wrpr	%r9, %r13, %wstate
    mov (10+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_10_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_10_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xe1bfd920  ! 654: STDFA_R	stda	%f16, [%r0, %r31]
	setx 0x32e0d8b4dbb6e100, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_10_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_10_406:
	setx 0x4cf1431fa9109af3, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_10_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d94c00a  ! 657: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0xe06fe02a  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x002a]
splash_cmpr_10_408:
	setx 0x6be921610445dc91, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_409
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_409:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 660: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_410) + 48, 16, 16)) -> intp(4,0,5)
intvec_10_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f80344e  ! 663: SIR	sir	0x144e
DS_10_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a409c6  ! 1: FDIVd	fdivd	%f16, %f6, %f12
	.word 0x95a00550  ! 1: FSQRTd	fsqrt	
	.word 0xa9a0c830  ! 664: FADDs	fadds	%f3, %f16, %f20
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd83fe079  ! 667: STD_I	std	%r12, [%r31 + 0x0079]
mondo_10_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d92c011  ! 668: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
mondo_10_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d934010  ! 669: WRPR_WSTATE_R	wrpr	%r13, %r16, %wstate
	.word 0xa9a00171  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_10_414) + 8, 16, 16)) -> intp(6,0,19)
intvec_10_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a509d2  ! 673: FDIVd	fdivd	%f20, %f18, %f48
	.word 0xa7a209d1  ! 674: FDIVd	fdivd	%f8, %f48, %f50
	.word 0xe83fc000  ! 675: STD_R	std	%r20, [%r31 + %r0]
splash_lsu_10_416:
	ta T_CHANGE_HPRIV
	set 0x771b892f, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_10_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d92000b  ! 677: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
	.word 0xe88fe030  ! 678: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r20
cwp_10_418:
    set user_data_start, %o7
	.word 0x93902002  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa9a489c6  ! 680: FDIVd	fdivd	%f18, %f6, %f20
mondo_10_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d948012  ! 681: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803ab0  ! 683: SIR	sir	0x1ab0
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_10_420)+32, 16, 16)) -> intp(mask2tid(0x10),1,3)
xir_10_420:
	.word 0xa984ecf6  ! 684: WR_SET_SOFTINT_I	wr	%r19, 0x0cf6, %set_softint
pmu_10_421:
	nop
	setx 0xfffff1defffffe45, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 686: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc3e94028  ! 687: PREFETCHA_R	prefetcha	[%r5, %r8] 0x01, #one_read
	rd %pc, %r19
	add %r19, (ivw_10_422-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_10_422:
	.word 0x91944002  ! 688: WRPR_PIL_R	wrpr	%r17, %r2, %pil
	.word 0xe19fde00  ! 689: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9191a106  ! 690: WRPR_PIL_I	wrpr	%r6, 0x0106, %pil
	.word 0x99902002  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd097e028  ! 692: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r8
splash_cmpr_10_423:
	setx 0xb6a35705582b487e, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d903af8  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x1af8, %pstate
	.word 0x93d02034  ! 695: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa3a0016a  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_425
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_425:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 697: RDPC	rd	%pc, %r8
	.word 0xd6d7e020  ! 698: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
pmu_10_426:
	nop
	setx 0xfffff108fffff270, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc19fdc00  ! 700: LDDFA_R	ldda	[%r31, %r0], %f0
    ta T_CHANGE_HPRIV
    mov (10+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_10_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_10_427
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_10_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 701: RDPC	rd	%pc, %r16
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
mondo_8_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d94c011  ! 1: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
intveclr_8_1:
	setx 0xda5f28b6dc569f00, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_2:
	setx 0x83b3fea131ee8555, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_3
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_3:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 5: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_4)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_4:
	.word 0xa98272eb  ! 6: WR_SET_SOFTINT_I	wr	%r9, 0x12eb, %set_softint
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_8_6:
	set user_data_start, %r31
	.word 0x85803174  ! 8: WRCCR_I	wr	%r0, 0x1174, %ccr
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_7
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_7:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 9: RDPC	rd	%pc, %r9
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d902b0e  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x0b0e, %pstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_8_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_8_11:
	setx 0x4b0b45eedf99b546, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_12) + 56, 16, 16)) -> intp(2,0,15)
intvec_8_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_13:
	.word 0x29400001  ! 1: FBPL	fbl,a,pn	%fcc0, <label_0x1>
	.word 0x81982ec7  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	.word 0xc1bfd920  ! 16: STDFA_R	stda	%f0, [%r0, %r31]
pmu_8_14:
	nop
	setx 0xfffff2e6fffff5ee, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_8_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82029  ! 19: PREFETCHA_I	prefetcha	[%r0, + 0x0029] %asi, #one_read
donret_8_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_17-donret_8_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x005f6a48 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x114, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_17:
	.word 0xe6ffe0d8  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x00d8] %asi
DS_8_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e020  ! 23: STQF_I	-	%f19, [0x0020, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_8_20:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xd3e0c026  ! 27: CASA_I	casa	[%r3] 0x 1, %r6, %r9
DS_8_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad847a55  ! 29: WR_SOFTINT_REG_I	wr	%r17, 0x1a55, %softint
	.word 0xe19fde00  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_8_23:
	.word 0x819825d7  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
	.word 0xd73fe04a  ! 32: STDF_I	std	%f11, [0x004a, %r31]
pmu_8_24:
	nop
	setx 0xfffffa1bfffffe69, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d918013  ! 34: WRPR_WSTATE_R	wrpr	%r6, %r19, %wstate
mondo_8_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d950002  ! 35: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	setx 0xf3f8fbf99d27fb68, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_28:
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8198248d  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048d, %hpstate
jmptr_8_29:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
tglhtw_8_30:
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
	.word 0x99b40982  ! 39: BSHUFFLE	fmovc32	%d16, %d2, %d12
	.word 0xc36c7b05  ! 40: PREFETCH_I	prefetch	[%r17 + 0xfffffb05], #one_read
jmptr_8_31:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_8_32:
	setx 0xc493a5b03c00a3b7, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_8_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_33-donret_8_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c54fa8 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x7cc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	done
donretarg_8_33:
	.word 0xd6ffe0fe  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x00fe] %asi
debug_8_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_34:
	mov 0x7df, %r20
	mov 0x16, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc023  ! 45: LDXA_R	ldxa	[%r31, %r3] 0x01, %r11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
tglhtw_8_35:
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
	.word 0x97b18992  ! 47: BSHUFFLE	fmovc32	%d6, %d18, %d42
	.word 0xa3a0016b  ! 48: FABSq	dis not found

memptr_8_36:
	set user_data_start, %r31
	.word 0x85823b9f  ! 49: WRCCR_I	wr	%r8, 0x1b9f, %ccr
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_37
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_37:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 50: RDPC	rd	%pc, %r10
DS_8_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_8_39:
	setx 0xa953ccec4d93c5bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_8_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe044  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x0044]
donret_8_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_41-donret_8_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00201f45 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x78d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	done
donretarg_8_41:
	.word 0xe0ffe0a8  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x00a8] %asi
mondo_8_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d94c012  ! 56: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
DS_8_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_8_45:
	nop
	setx 0xfffffc46fffff6e3, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_8_46:
	nop
	setx 0xfffffe16fffff584, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d928012  ! 61: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_8_48:
	set user_data_start, %r31
	.word 0x8584361c  ! 64: WRCCR_I	wr	%r16, 0x161c, %ccr
intveclr_8_49:
	setx 0x04683bc3f1250b29, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
unsupttte_8_50:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa9b0048d  ! 67: FCMPLE32	fcmple32	%d0, %d44, %r20
	.word 0xd427e04e  ! 68: STW_I	stw	%r10, [%r31 + 0x004e]
splash_cmpr_8_51:
	setx 0xae555753710e54ca, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_52) + 32, 16, 16)) -> intp(1,0,19)
intvec_8_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_8_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f12, %f4
	.word 0x99b44314  ! 71: ALIGNADDRESS	alignaddr	%r17, %r20, %r12
donret_8_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_54-donret_8_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e4924d | (0x8b << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_54:
	.word 0xe2ffe038  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x0038] %asi
tglhtw_8_55:
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
	.word 0xa7b4c985  ! 73: BSHUFFLE	fmovc32	%d50, %d36, %d50
	.word 0x9f802fce  ! 74: SIR	sir	0x0fce
	.word 0x9f803977  ! 75: SIR	sir	0x1977
fpinit_8_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 76: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x93d020b4  ! 77: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xd8d7e020  ! 78: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0x8d90237c  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x037c, %pstate
jmptr_8_58:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe030  ! 81: STDF_I	std	%f12, [0x0030, %r31]
	.word 0xa3500000  ! 82: RDPR_TPC	rdpr	%tpc, %r17
mondo_8_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d928011  ! 83: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_60
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_60:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 84: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_61
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_61:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 85: RDPC	rd	%pc, %r12
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d902114  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x0114, %pstate
splash_lsu_8_63:
	ta T_CHANGE_HPRIV
	set 0xbed7ef27, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_64:
	.word 0x81982c4e  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4e, %hpstate
intveclr_8_65:
	setx 0x6c7a47e91bb89ea9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc369f650  ! 90: PREFETCH_I	prefetch	[%r7 + 0xfffff650], #one_read
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_66) + 24, 16, 16)) -> intp(7,0,17)
intvec_8_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_67:
	setx 0x30821074b9aaf193, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_8_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_68:
	mov 0x994, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd23ff650  ! 93: STD_I	std	%r9, [%r31 + 0xfffff650]
splash_cmpr_8_69:
	setx 0xd591ddc94f1ef98a, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_8_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_71:
	mov 0xd8b, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd31fc011  ! 96: LDDF_R	ldd	[%r31, %r17], %f9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0x93a0016d  ! 98: FABSq	dis not found

pmu_8_72:
	nop
	setx 0xfffff776fffff47e, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_73)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_73:
	.word 0xa9847793  ! 100: WR_SET_SOFTINT_I	wr	%r17, 0x1793, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_8_74:
	.word 0xa5a509cc  ! 1: FDIVd	fdivd	%f20, %f12, %f18
	pdist %f6, %f16, %f24
	.word 0xa3b44303  ! 102: ALIGNADDRESS	alignaddr	%r17, %r3, %r17
fpinit_8_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 103: FDIVd	fdivd	%f0, %f4, %f4
memptr_8_76:
	set 0x60540000, %r31
	.word 0x8581f427  ! 104: WRCCR_I	wr	%r7, 0x1427, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_8_77:
	nop
	setx 0xfffff15ffffffca1, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_8_78:
	setx 0xda60f5efccd9f978, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_8_79:
	taddcctv %r16, 0x1344, %r19
	.word 0xe807e024  ! 109: LDUW_I	lduw	[%r31 + 0x0024], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02034  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 52
unsupttte_8_80:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x87ab0a53  ! 112: FCMPd	fcmpd	%fcc<n>, %f12, %f50
	.word 0xe66fe04b  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x004b]
	.word 0x83d020b4  ! 114: Tcc_I	te	icc_or_xcc, %r0 + 180
mondo_8_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d918010  ! 115: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
splash_htba_8_82:
	ta T_CHANGE_HPRIV
	setx 0x00000000002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f80292a  ! 117: SIR	sir	0x092a
	.word 0xc19fde00  ! 118: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x4b3d9b6e0e1a4b22, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 120: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_84
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_84:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 121: RDPC	rd	%pc, %r12
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 122: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033dc  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x13dc, %pstate
splash_tba_8_86:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa3454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
pmu_8_87:
	nop
	setx 0xfffffa66ffffff25, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_88) + 24, 16, 16)) -> intp(3,0,25)
intvec_8_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe19fdb60  ! 128: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd297e008  ! 129: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r9
splash_lsu_8_89:
	ta T_CHANGE_HPRIV
	set 0x5352010e, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_90:
	nop
	setx 0xfffff60cfffffe5e, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x9194683a  ! 133: WRPR_PIL_I	wrpr	%r17, 0x083a, %pil
mondo_8_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91c003  ! 134: WRPR_WSTATE_R	wrpr	%r7, %r3, %wstate
mondo_8_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d944014  ! 135: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba00170  ! 137: FABSq	dis not found

	.word 0x9f803fcb  ! 138: SIR	sir	0x1fcb
jmptr_8_94:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x24ca8001  ! 141: BRLEZ	brlez,a,pt	%r10,<label_0xa8001>
splash_lsu_8_95:
	ta T_CHANGE_HPRIV
	set 0x8c952e57, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_8_96:
	nop
	setx 0xfffff964fffff9f0, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_8_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_97:
	mov 0x664, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd897c021  ! 144: LDUHA_R	lduha	[%r31, %r1] 0x01, %r12
	.word 0xd897e008  ! 145: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r12
	.word 0x97500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_98) + 56, 16, 16)) -> intp(3,0,5)
intvec_8_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a009c7  ! 148: FDIVd	fdivd	%f0, %f38, %f10
splash_tba_8_99:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_8_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d92c003  ! 150: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
splash_hpstate_8_101:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982c9e  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9e, %hpstate
	rd %pc, %r19
	add %r19, (ivw_8_102-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_102:
	.word 0x91940010  ! 152: WRPR_PIL_R	wrpr	%r16, %r16, %pil
mondo_8_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d950007  ! 153: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d9033de  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x13de, %pstate
	.word 0xe19fdb60  ! 155: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f8036ff  ! 156: SIR	sir	0x16ff
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_8_106:
	setx 0x702e94c33ec421f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_8_107:
	set 0x60140000, %r31
	.word 0x8584a92e  ! 159: WRCCR_I	wr	%r18, 0x092e, %ccr
	.word 0xc1bfe000  ! 160: STDFA_I	stda	%f0, [0x0000, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_108)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_108:
	.word 0xa9843a0d  ! 161: WR_SET_SOFTINT_I	wr	%r16, 0x1a0d, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_8_111:
	nop
	setx 0xfffff830fffffc89, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe086  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x0086]
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_112
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_112:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 167: RDPC	rd	%pc, %r13
	.word 0x95a0016c  ! 168: FABSq	dis not found

	.word 0xa950c000  ! 169: RDPR_TT	<illegal instruction>
mondo_8_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d94400c  ! 170: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0xa1a00172  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_114
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 172: RDPC	rd	%pc, %r17
intveclr_8_115:
	setx 0xcf569ef32c483ebe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_116-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_116:
	.word 0x91950012  ! 174: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	setx 0x6aef167e08eeba15, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	bneg,a	 skip_8_118
	brlez,pn  	%r17, skip_8_118
.align 1024
skip_8_118:
	.word 0xe23fc000  ! 176: STD_R	std	%r17, [%r31 + %r0]
mondo_8_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d910005  ! 177: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
pmu_8_120:
	nop
	setx 0xfffffd07fffff7c1, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe008  ! 179: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_121
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_121:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 180: RDPC	rd	%pc, %r11
change_to_randtl_8_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_122:
	.word 0x8f902000  ! 181: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_hpstate_8_123:
	.word 0x8198291f  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091f, %hpstate
DS_8_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xaf47fea2	! Random illegal ?
	.word 0xa3a489d1  ! 1: FDIVd	fdivd	%f18, %f48, %f48
	.word 0xa7a0082d  ! 183: FADDs	fadds	%f0, %f13, %f19
	.word 0x91d020b5  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 181
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_125
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_125:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 185: RDPC	rd	%pc, %r10
DS_8_126:
	.word 0xa1a409d1  ! 1: FDIVd	fdivd	%f16, %f48, %f16
	allclean
	.word 0xa7b0030d  ! 186: ALIGNADDRESS	alignaddr	%r0, %r13, %r19
	.word 0x93d020b3  ! 187: Tcc_I	tne	icc_or_xcc, %r0 + 179
intveclr_8_127:
	setx 0xcb06842d455a7c9c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab817ad0  ! 189: WR_CLEAR_SOFTINT_I	wr	%r5, 0x1ad0, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_128) + 8, 16, 16)) -> intp(7,0,19)
intvec_8_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_129:
	nop
	setx 0xfffff57cfffff016, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe0a4  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x00a4]
	rd %pc, %r19
	add %r19, (ivw_8_130-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_130:
	.word 0x91940012  ! 193: WRPR_PIL_R	wrpr	%r16, %r18, %pil
	.word 0xe19fda00  ! 194: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad80bd30  ! 196: WR_SOFTINT_REG_I	wr	%r2, 0x1d30, %softint
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe0c7  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x00c7]
intveclr_8_132:
	setx 0xf7eb7b77ec551e28, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_133)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_133:
	.word 0xa9852a78  ! 200: WR_SET_SOFTINT_I	wr	%r20, 0x0a78, %set_softint
	.word 0x8d9036c4  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x16c4, %pstate
jmptr_8_135:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9020f7  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x00f7, %pstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x91d02032  ! 205: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_8_138:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc001  ! 206: LDDF_R	ldd	[%r31, %r1], %f12
memptr_8_139:
	set 0x60140000, %r31
	.word 0x8581e927  ! 207: WRCCR_I	wr	%r7, 0x0927, %ccr
	.word 0xa5a449c6  ! 208: FDIVd	fdivd	%f48, %f6, %f18
splash_hpstate_8_140:
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x81982115  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0115, %hpstate
	.word 0x83d02032  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 50
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 211: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0x546fc0726f2bd4fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_142)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_142:
	.word 0xa981fd9b  ! 214: WR_SET_SOFTINT_I	wr	%r7, 0x1d9b, %set_softint
DS_8_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f20, %f8
	.word 0xa5b44312  ! 215: ALIGNADDRESS	alignaddr	%r17, %r18, %r18
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 216: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_8_145-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_145:
	.word 0x91950011  ! 217: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0xa5a149a5  ! 218: FDIVs	fdivs	%f5, %f5, %f18
debug_8_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_8_146:
	mov 0xf84, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe69fc022  ! 219: LDDA_R	ldda	[%r31, %r2] 0x01, %r19
	.word 0xe71fe000  ! 220: LDDF_I	ldd	[%r31, 0x0000], %f19
	.word 0xe19fd920  ! 221: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x26172ccc01a6cb63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36aefec  ! 223: PREFETCH_I	prefetch	[%r11 + 0x0fec], #one_read
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0x91b4c7e9  ! 225: PDISTN	fmean16	%d50, %d40, %d8
mondo_8_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d91c004  ! 226: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0xe4dfe028  ! 227: LDXA_I	ldxa	[%r31, + 0x0028] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_150)+8, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_150:
	.word 0xa9837712  ! 229: WR_SET_SOFTINT_I	wr	%r13, 0x1712, %set_softint
	.word 0xe46fe07f  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x007f]
mondo_8_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950013  ! 231: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
jmptr_8_152:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xa660e063a2f4c76b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_8_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd532c00a  ! 1: STQF_R	-	%f10, [%r10, %r11]
	normalw
	.word 0x93458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x9f8022c2  ! 235: SIR	sir	0x02c2
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_8_155:
	nop
	setx 0xfffff138fffff446, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_8_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d914011  ! 239: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
debug_8_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_8_157:
	mov 0x613, %r20
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
	.word 0xe69fc034  ! 240: LDDA_R	ldda	[%r31, %r20] 0x01, %r19
	.word 0x8d9021fe  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x01fe, %pstate
mondo_8_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d91c007  ! 242: WRPR_WSTATE_R	wrpr	%r7, %r7, %wstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f802312  ! 244: SIR	sir	0x0312
	.word 0xa9a0016a  ! 245: FABSq	dis not found

intveclr_8_161:
	setx 0x82f0f959f196d171, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_8_162:
	nop
	setx 0xfffffef2fffffd27, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_8_163:
	setx 0x7e417ae636cd4d70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	brgz,a,pt	%r19, skip_8_164
	.word 0x87a8ca51  ! 1: FCMPd	fcmpd	%fcc<n>, %f34, %f48
.align 2048
skip_8_164:
	.word 0xe43fc000  ! 250: STD_R	std	%r18, [%r31 + %r0]
debug_8_165:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe49fc033  ! 251: LDDA_R	ldda	[%r31, %r19] 0x01, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_166) + 56, 16, 16)) -> intp(4,0,0)
intvec_8_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_167:
	setx 0xf6c359aa537a0cbd, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_8_168:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_8_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d948013  ! 255: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
jmptr_8_170:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_8_171-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_171:
	.word 0x9194c010  ! 257: WRPR_PIL_R	wrpr	%r19, %r16, %pil
	.word 0x99a309c0  ! 258: FDIVd	fdivd	%f12, %f0, %f12
mondo_8_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d948001  ! 259: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_173:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 260: RDPC	rd	%pc, %r8
splash_lsu_8_174:
	ta T_CHANGE_HPRIV
	set 0xacc4318d, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0x95a309cb  ! 263: FDIVd	fdivd	%f12, %f42, %f10
	.word 0xe1bfdb60  ! 264: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_8_176:
	setx 0xcd4c4add74245142, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e030  ! 266: STX_I	stx	%r20, [%r31 + 0x0030]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_8_178:
	nop
	setx 0xfffffa4ffffffb17, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe80fe008  ! 272: LDUB_I	ldub	[%r31 + 0x0008], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_180)+24, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_180:
	.word 0xa982265f  ! 273: WR_SET_SOFTINT_I	wr	%r8, 0x065f, %set_softint
jmptr_8_181:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_8_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 277: FCMPLE32	fcmple32	%d0, %d4, %r8
tglhtw_8_184:
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
	.word 0xa3b50994  ! 278: BSHUFFLE	fmovc32	%d20, %d20, %d48
	.word 0xa9a489d1  ! 279: FDIVd	fdivd	%f18, %f48, %f20
	.word 0xe26fe08c  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x008c]
	setx 0xa8d30a680978d3f4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_8_186:
	.word 0x819826be  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06be, %hpstate
cwp_8_187:
    set user_data_start, %o7
	.word 0x93902006  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
intveclr_8_188:
	setx 0xb9efc748bc7c056e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe07d  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x007d]
	.word 0x91d02033  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_8_189:
	setx 0x7a63880553787967, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_8_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d910013  ! 288: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
fpinit_8_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 289: FDIVd	fdivd	%f0, %f4, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_192) + 16, 16, 16)) -> intp(2,0,7)
intvec_8_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_193:
	nop
	setx 0xfffff330fffff7de, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a009c3  ! 293: FDIVd	fdivd	%f0, %f34, %f12
fpinit_8_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 294: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0x9194bf57  ! 295: WRPR_PIL_I	wrpr	%r18, 0x1f57, %pil
	.word 0x91d02034  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	fbu,a,pn	%fcc0,  skip_8_196
	brlez,pt  	%r7, skip_8_196
.align 32
skip_8_196:
	.word 0xe9e7c020  ! 299: CASA_I	casa	[%r31] 0x 1, %r0, %r20
fpinit_8_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 300: FDIVd	fdivd	%f0, %f4, %f4
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_198:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 302: RDPC	rd	%pc, %r10
splash_lsu_8_199:
	ta T_CHANGE_HPRIV
	set 0x6e6e5918, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d94c014  ! 304: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
memptr_8_201:
	set user_data_start, %r31
	.word 0x8581eaf4  ! 305: WRCCR_I	wr	%r7, 0x0af4, %ccr
	.word 0x9f803e78  ! 306: SIR	sir	0x1e78
splash_lsu_8_202:
	ta T_CHANGE_HPRIV
	set 0xeb5efec2, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802daf  ! 308: SIR	sir	0x0daf
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_203
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_203:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 309: RDPC	rd	%pc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_204) + 0, 16, 16)) -> intp(6,0,9)
intvec_8_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_205
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_205:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 311: RDPC	rd	%pc, %r12
mondo_8_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d928012  ! 312: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
cwp_8_207:
    set user_data_start, %o7
	.word 0x93902001  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_8_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d94c012  ! 315: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
unsupttte_8_209:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95b50494  ! 317: FCMPLE32	fcmple32	%d20, %d20, %r10
	.word 0xd91fe038  ! 318: LDDF_I	ldd	[%r31, 0x0038], %f12
	.word 0xe19fdf20  ! 319: LDDFA_R	ldda	[%r31, %r0], %f16
memptr_8_210:
	set user_data_start, %r31
	.word 0x8584f4d2  ! 320: WRCCR_I	wr	%r19, 0x14d2, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_8_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa3a089cc  ! 1: FDIVd	fdivd	%f2, %f12, %f48
	.word 0xa3a44821  ! 322: FADDs	fadds	%f17, %f1, %f17
	.word 0xe137e001  ! 323: STQF_I	-	%f16, [0x0001, %r31]
pmu_8_212:
	nop
	setx 0xfffffd48fffffe3c, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803f58  ! 325: SIR	sir	0x1f58
mondo_8_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d940012  ! 326: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0x926d0000  ! 327: UDIVX_R	udivx 	%r20, %r0, %r9
	.word 0x9f803023  ! 328: SIR	sir	0x1023
	.word 0xe1bfd960  ! 329: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9345c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xe137e060  ! 331: STQF_I	-	%f16, [0x0060, %r31]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a089d1  ! 333: FDIVd	fdivd	%f2, %f48, %f16
	.word 0x91d020b2  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa1500000  ! 335: RDPR_TPC	<illegal instruction>
intveclr_8_214:
	setx 0xb5f44f9224a372b5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 181
	rd %pc, %r19
	add %r19, (ivw_8_215-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_215:
	.word 0x9191400b  ! 338: WRPR_PIL_R	wrpr	%r5, %r11, %pil
	.word 0xa1a349c0  ! 339: FDIVd	fdivd	%f44, %f0, %f16
	.word 0x95464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r10
pmu_8_216:
	nop
	setx 0xfffff23efffffd8e, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_218) + 40, 16, 16)) -> intp(3,0,22)
intvec_8_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_219
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_219:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 344: RDPC	rd	%pc, %r17
splash_htba_8_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9345c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xc1bfe0e0  ! 347: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xa5a2c9c9  ! 348: FDIVd	fdivd	%f42, %f40, %f18
	setx 0x671bbbefcc7ca04e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe000  ! 350: LDDA_I	ldda	[%r31, + 0x0000] %asi, %r13
mondo_8_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d940013  ! 351: WRPR_WSTATE_R	wrpr	%r16, %r19, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 352: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_8_223:
	set 0x60740000, %r31
	.word 0x8581a75b  ! 353: WRCCR_I	wr	%r6, 0x075b, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe074  ! 355: STDA_I	stda	%r13, [%r31 + 0x0074] %asi
pmu_8_224:
	nop
	setx 0xfffff095fffff711, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x91703424  ! 358: POPC_I	popc	0x1424, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_225)+40, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_225:
	.word 0xa98478e8  ! 359: WR_SET_SOFTINT_I	wr	%r17, 0x18e8, %set_softint
	.word 0x9f8032da  ! 360: SIR	sir	0x12da
intveclr_8_226:
	setx 0x8bffa9abbec58fba, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_8_228:
	set user_data_start, %r31
	.word 0x8584ebc4  ! 363: WRCCR_I	wr	%r19, 0x0bc4, %ccr
	.word 0x93d02035  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa5a409c4  ! 365: FDIVd	fdivd	%f16, %f4, %f18
	.word 0x9f80231a  ! 366: SIR	sir	0x031a
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_229)+16, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_229:
	.word 0xa981ee36  ! 367: WR_SET_SOFTINT_I	wr	%r7, 0x0e36, %set_softint
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_230:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 368: RDPC	rd	%pc, %r19
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x91a00167  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_8_232-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_232:
	.word 0x91918006  ! 372: WRPR_PIL_R	wrpr	%r6, %r6, %pil
	.word 0xa7848010  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r16, %-
DS_8_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8d903c2a  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x1c2a, %pstate
intveclr_8_237:
	setx 0x3c16eb7b80a7c497, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a149c4  ! 378: FDIVd	fdivd	%f36, %f4, %f10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_238) + 8, 16, 16)) -> intp(1,0,1)
intvec_8_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_8_239:
	.word 0x99a009d4  ! 1: FDIVd	fdivd	%f0, %f20, %f12
	.word 0xe532bff1  ! 1: STQF_I	-	%f18, [0x1ff1, %r10]
	normalw
	.word 0xa3458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r17
splash_hpstate_8_240:
	.word 0x81982edf  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_242
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_242:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 383: RDPC	rd	%pc, %r12
	.word 0xe127e0e1  ! 384: STF_I	st	%f16, [0x00e1, %r31]
DS_8_243:
	.word 0x91a509d1  ! 1: FDIVd	fdivd	%f20, %f48, %f8
	.word 0xd530e9bb  ! 1: STQF_I	-	%f10, [0x09bb, %r3]
	normalw
	.word 0xa7458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r19
fpinit_8_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 386: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xc1bfe0e0  ! 387: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0x91d02035  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_8_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 389: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_246) + 0, 16, 16)) -> intp(0,0,28)
intvec_8_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_247
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_247:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 391: RDPC	rd	%pc, %r20
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_8_248:
	setx 0x66acbbbf4a464567, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_249-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_249:
	.word 0x91918000  ! 394: WRPR_PIL_R	wrpr	%r6, %r0, %pil
	.word 0xe62fe03b  ! 395: STB_I	stb	%r19, [%r31 + 0x003b]
fpinit_8_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 396: FCMPLE32	fcmple32	%d0, %d4, %r6
mondo_8_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 397: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
DS_8_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd7348008  ! 1: STQF_R	-	%f11, [%r8, %r18]
	normalw
	.word 0x97458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xc19fdc00  ! 399: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_8_253:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_254
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_254:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 402: RDPC	rd	%pc, %r16
fpinit_8_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 403: FDIVd	fdivd	%f0, %f4, %f6
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa945c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe8dfe030  ! 407: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 408: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_8_257:
	nop
	setx 0xfffff523fffff51d, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_8_258:
	ta T_CHANGE_HPRIV
	set 0x4f516cfc, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_8_259:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa781c001  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r1, %-
	.word 0x9f803823  ! 413: SIR	sir	0x1823
memptr_8_261:
	set user_data_start, %r31
	.word 0x858177af  ! 414: WRCCR_I	wr	%r5, 0x17af, %ccr
mondo_8_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d95000d  ! 415: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0x8d9035be  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x15be, %pstate
	.word 0x91a00171  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_264
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_264:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 418: RDPC	rd	%pc, %r8
pmu_8_265:
	nop
	setx 0xfffffb93fffff945, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa5a449d0  ! 421: FDIVd	fdivd	%f48, %f16, %f18
	.word 0xe427e06c  ! 422: STW_I	stw	%r18, [%r31 + 0x006c]
	rd %pc, %r19
	add %r19, (ivw_8_266-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_266:
	.word 0x91920014  ! 423: WRPR_PIL_R	wrpr	%r8, %r20, %pil
	.word 0x9b500000  ! 424: RDPR_TPC	<illegal instruction>
	bl,a	 skip_8_267
	bneg,a	 skip_8_267
.align 2048
skip_8_267:
	.word 0xd63fc000  ! 425: STD_R	std	%r11, [%r31 + %r0]
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_268) + 16, 16, 16)) -> intp(1,0,24)
intvec_8_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_8_269:
	setx 0x8fe1d591a6b3b7a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_8_270:
	set user_data_start, %r31
	.word 0x8584a63a  ! 429: WRCCR_I	wr	%r18, 0x063a, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_271:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 430: RDPC	rd	%pc, %r13
    set 0x2ca8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b247e4  ! 431: PDISTN	fmean16	%d40, %d4, %d12
	.word 0x91d020b3  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 179
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_272
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_272:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 433: RDPC	rd	%pc, %r10
	.word 0x93d02032  ! 434: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x99a0016c  ! 435: FABSq	dis not found

splash_hpstate_8_273:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x819825be  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05be, %hpstate
intveclr_8_274:
	setx 0x4c7d4f02e068a4d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe000  ! 438: LDD_I	ldd	[%r31 + 0x0000], %r20
	rd %pc, %r19
	add %r19, (ivw_8_275-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_275:
	.word 0x91940010  ! 439: WRPR_PIL_R	wrpr	%r16, %r16, %pil
donret_8_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_276-donret_8_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x006e2d23 | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x90d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	retry
donretarg_8_276:
	.word 0xe8ffe0f5  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x00f5] %asi
splash_hpstate_8_277:
	.word 0x8198221d  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021d, %hpstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0xe7891e24553c1c7d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_8_280:
	nop
	setx 0xffffff6bfffff0c1, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_8_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_281:
	.word 0x8f902002  ! 445: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_8_282:
	setx 0x664dd6e8650cb6e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc2c0  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe93fe04a  ! 448: STDF_I	std	%f20, [0x004a, %r31]
	.word 0xc1bfda00  ! 449: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe8dfe008  ! 450: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r20
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ae0  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x0ae0, %pstate
	.word 0xa9b504c7  ! 452: FCMPNE32	fcmpne32	%d20, %d38, %r20
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	brlz,a,pn	%r4, skip_8_284
	ble  	 skip_8_284
.align 32
skip_8_284:
	.word 0xd23fc000  ! 454: STD_R	std	%r9, [%r31 + %r0]
	.word 0x95a4c9cb  ! 455: FDIVd	fdivd	%f50, %f42, %f10
splash_cmpr_8_285:
	setx 0xae28c1505e198a67, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_8_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d904012  ! 457: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
	.word 0xc1bfd960  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fe0a0  ! 459: LDDFA_I	ldda	[%r31, 0x00a0], %f16
pmu_8_287:
	nop
	setx 0xfffff8bffffff3d5, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_8_288:
	.word 0x93a489d2  ! 1: FDIVd	fdivd	%f18, %f18, %f40
	allclean
	.word 0xa5b20307  ! 461: ALIGNADDRESS	alignaddr	%r8, %r7, %r18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 462: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x8ea7618d3a4156ff, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_290)+32, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_290:
	.word 0xa981f45a  ! 464: WR_SET_SOFTINT_I	wr	%r7, 0x145a, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_291)+48, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_291:
	.word 0xa984f6d6  ! 465: WR_SET_SOFTINT_I	wr	%r19, 0x16d6, %set_softint
	.word 0xe20fe018  ! 466: LDUB_I	ldub	[%r31 + 0x0018], %r17
	.word 0x93540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0x9950c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_292
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_292:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 469: RDPC	rd	%pc, %r10
	.word 0x9f803aaf  ! 470: SIR	sir	0x1aaf
intveclr_8_293:
	setx 0x0f39c4b7339880d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_8_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 472: FCMPd	fcmpd	%fcc<n>, %f0, %f4
pmu_8_295:
	nop
	setx 0xfffffe70fffffc72, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_8_296:
	.word 0x81982b16  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b16, %hpstate
donret_8_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_297-donret_8_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d994ee | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xfdd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (8)
	done
donretarg_8_297:
	.word 0xe2ffe09c  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x009c] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02033  ! 477: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_8_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcb55df9a	! Random illegal ?
	.word 0xe5140013  ! 1: LDQF_R	-	[%r16, %r19], %f18
	.word 0xa7a44822  ! 478: FADDs	fadds	%f17, %f2, %f19
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
tglhtw_8_300:
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
	.word 0xa3b2498b  ! 480: BSHUFFLE	fmovc32	%d40, %d42, %d48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_8_302:
	setx 0x6cda64ffb716b032, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe039  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x0039]
	.word 0x9f802450  ! 484: SIR	sir	0x0450
	setx 0x749300d310d04172, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a189c2  ! 486: FDIVd	fdivd	%f6, %f2, %f48
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 487: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e6e  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x1e6e, %pstate
	.word 0xc3ec402c  ! 489: PREFETCHA_R	prefetcha	[%r17, %r12] 0x01, #one_read
	.word 0x97a0016d  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_305
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_305:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 491: RDPC	rd	%pc, %r16
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_8_306:
	setx 0x41009e434cee4f69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803034  ! 495: SIR	sir	0x1034
	.word 0x97a00161  ! 496: FABSq	dis not found

	.word 0xa37025f4  ! 497: POPC_I	popc	0x05f4, %r17
	.word 0xe19fe040  ! 498: LDDFA_I	ldda	[%r31, 0x0040], %f16
	.word 0xd64fe030  ! 499: LDSB_I	ldsb	[%r31 + 0x0030], %r11
tglhtw_8_307:
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
	.word 0x97b2c990  ! 500: BSHUFFLE	fmovc32	%d42, %d16, %d42
	.word 0xa7a00169  ! 501: FABSq	dis not found

DS_8_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_8_309:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa750c000  ! 504: RDPR_TT	<illegal instruction>
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f8038b1  ! 506: SIR	sir	0x18b1
jmptr_8_311:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_312
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_312:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 508: RDPC	rd	%pc, %r18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xe19fc2c0  ! 510: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_314) + 24, 16, 16)) -> intp(2,0,27)
intvec_8_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_8_315:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_8_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9f5c6833	! Random illegal ?
	.word 0xa5a0054c  ! 1: FSQRTd	fsqrt	
	.word 0xa7a34833  ! 513: FADDs	fadds	%f13, %f19, %f19
memptr_8_317:
	set 0x60140000, %r31
	.word 0x8584b1f7  ! 514: WRCCR_I	wr	%r18, 0x11f7, %ccr
splash_lsu_8_318:
	ta T_CHANGE_HPRIV
	set 0x590df704, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xf557408bb57ea5fe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_8_320:
	setx 0x77b7d8a477d8c636, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_8_321:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc00d  ! 519: STDF_R	std	%f9, [%r13, %r31]
memptr_8_322:
	set 0x60340000, %r31
	.word 0x85812cae  ! 520: WRCCR_I	wr	%r4, 0x0cae, %ccr
	.word 0xd25fe020  ! 521: LDX_I	ldx	[%r31 + 0x0020], %r9
fpinit_8_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 522: FDIVd	fdivd	%f0, %f4, %f8
	.word 0x83d02033  ! 523: Tcc_I	te	icc_or_xcc, %r0 + 51
change_to_randtl_8_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_8_324:
	.word 0x8f902000  ! 524: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab830002  ! 525: WR_CLEAR_SOFTINT_R	wr	%r12, %r2, %clear_softint
	.word 0xd26fe047  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x0047]
	setx 0xa444b1828ccdefa9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_8_326-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_326:
	.word 0x91948006  ! 528: WRPR_PIL_R	wrpr	%r18, %r6, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_8_327:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc020  ! 532: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_328
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_328:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 533: RDPC	rd	%pc, %r18
	.word 0xe26fe0bb  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x00bb]
	.word 0x91520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	.word 0x8d902b59  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x0b59, %pstate
mondo_8_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d908014  ! 537: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0x9f80228e  ! 538: SIR	sir	0x028e
mondo_8_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d908014  ! 539: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_8_332:
	setx 0xe759d30237336652, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_8_333:
	setx 0x5454fbd27e5e2c9d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_334
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_334:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 544: RDPC	rd	%pc, %r18
pmu_8_335:
	nop
	setx 0xfffffdb7fffff7ba, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_8_336:
	setx 0x707c398dd1e633b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_8_337:
	setx 0x17ffa67d126df86d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 53
	rd %pc, %r19
	add %r19, (ivw_8_338-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_338:
	.word 0x91914010  ! 549: WRPR_PIL_R	wrpr	%r5, %r16, %pil
splash_lsu_8_339:
	ta T_CHANGE_HPRIV
	set 0xab587cc2, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d930000  ! 551: WRPR_WSTATE_R	wrpr	%r12, %r0, %wstate
	.word 0xc19fe020  ! 552: LDDFA_I	ldda	[%r31, 0x0020], %f0
	setx 0x155277e9c2666b49, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe028  ! 554: LDUB_I	ldub	[%r31 + 0x0028], %r9
	.word 0x8d902e2a  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x0e2a, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_8_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_8_343-donret_8_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00390921 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xa05, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (8)
	done
donretarg_8_343:
	.word 0xd2ffe0c0  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x00c0] %asi
	.word 0x8d902992  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x0992, %pstate
mondo_8_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d95000d  ! 559: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
splash_lsu_8_346:
	ta T_CHANGE_HPRIV
	set 0xf0ffb31a, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa4ac4011  ! 561: ANDNcc_R	andncc 	%r17, %r17, %r18
jmptr_8_347:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_8_348:
	setx 0x024968aaf42a42d6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_8_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe22fe06a  ! 565: STB_I	stb	%r17, [%r31 + 0x006a]
	.word 0xe1bfe060  ! 566: STDFA_I	stda	%f16, [0x0060, %r31]
tagged_8_350:
	tsubcctv %r12, 0x19ac, %r4
	.word 0xe207e0da  ! 567: LDUW_I	lduw	[%r31 + 0x00da], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_8_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_352
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_352:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 569: RDPC	rd	%pc, %r9
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_8_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 571: FCMPLE32	fcmple32	%d0, %d4, %r4
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
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
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_8_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d91c013  ! 574: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	brgez,a,pn	%r5, skip_8_358
	.word 0xa1b404d3  ! 1: FCMPNE32	fcmpne32	%d16, %d50, %r16
.align 512
skip_8_358:
	.word 0xc36fe0da  ! 575: PREFETCH_I	prefetch	[%r31 + 0x00da], #one_read
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_360)+0, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_360:
	.word 0xa9852d4e  ! 577: WR_SET_SOFTINT_I	wr	%r20, 0x0d4e, %set_softint
memptr_8_361:
	set 0x60540000, %r31
	.word 0x8580fa7d  ! 578: WRCCR_I	wr	%r3, 0x1a7d, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_8_362:
	.word 0x81982984  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0984, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_8_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 582: FCMPLE32	fcmple32	%d0, %d4, %r6
	.word 0xab804008  ! 583: WR_CLEAR_SOFTINT_R	wr	%r1, %r8, %clear_softint
	.word 0xab807316  ! 584: WR_CLEAR_SOFTINT_I	wr	%r1, 0x1316, %clear_softint
pmu_8_364:
	nop
	setx 0xfffffe52fffff6a1, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_365
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_365:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 586: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_366
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_366:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 587: RDPC	rd	%pc, %r8
change_to_randtl_8_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_8_367:
	.word 0x8f902002  ! 588: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0x93a0016a  ! 590: FABSq	dis not found

	.word 0xd037e0a6  ! 591: STH_I	sth	%r8, [%r31 + 0x00a6]
	rd %pc, %r19
	add %r19, (ivw_8_369-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_369:
	.word 0x91934011  ! 592: WRPR_PIL_R	wrpr	%r13, %r17, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_8_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 594: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_8_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d948001  ! 595: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
	.word 0xd04fe020  ! 596: LDSB_I	ldsb	[%r31 + 0x0020], %r8
DS_8_372:
	.word 0x9ba209d3  ! 1: FDIVd	fdivd	%f8, %f50, %f44
	allclean
	.word 0xa7b18302  ! 597: ALIGNADDRESS	alignaddr	%r6, %r2, %r19
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_373
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_373:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 598: RDPC	rd	%pc, %r10
mondo_8_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 599: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
DS_8_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc1bfe040  ! 601: STDFA_I	stda	%f0, [0x0040, %r31]
pmu_8_376:
	nop
	setx 0xfffff5effffff36a, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_8_377:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_8_378:
	ta T_CHANGE_PRIV
	setx 0x00000000003a0000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_8_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d910013  ! 607: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
	.word 0xc19fdf20  ! 608: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x83d02032  ! 609: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_cmpr_8_380:
	setx 0xdd28265da2d856f7, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0x91e6c95de1a966e2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00164  ! 613: FABSq	dis not found

splash_cmpr_8_382:
	setx 0x8f646a6456b39c9e, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_8_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830d0  ! 615: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0d0] %asi, #one_read
jmptr_8_384:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fde00  ! 617: LDDFA_R	ldda	[%r31, %r0], %f0
	bvc  	 skip_8_385
	brz,pn  	%r8, skip_8_385
.align 32
skip_8_385:
	.word 0xe1e7c020  ! 618: CASA_I	casa	[%r31] 0x 1, %r0, %r16
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_386
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_386:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 619: RDPC	rd	%pc, %r20
pmu_8_387:
	nop
	setx 0xfffff295fffff5cf, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_388
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_388:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 621: RDPC	rd	%pc, %r10
pmu_8_389:
	nop
	setx 0xfffffb54fffffcf8, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe054  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x0054]
fpinit_8_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830d0  ! 624: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0d0] %asi, #one_read
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a509c6  ! 626: FDIVd	fdivd	%f20, %f6, %f42
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_8_391:
	nop
	setx 0xfffff36ffffffe04, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7a449d2  ! 629: FDIVd	fdivd	%f48, %f18, %f50
	.word 0xe4bfe028  ! 630: STDA_I	stda	%r18, [%r31 + 0x0028] %asi
	.word 0xe1bfe000  ! 631: STDFA_I	stda	%f16, [0x0000, %r31]
	.word 0xe527e075  ! 632: STF_I	st	%f18, [0x0075, %r31]
tagged_8_392:
	tsubcctv %r9, 0x1bef, %r9
	.word 0xe407e0e5  ! 633: LDUW_I	lduw	[%r31 + 0x00e5], %r18
	.word 0xa3a00173  ! 634: FABSq	dis not found

	.word 0xc1bfd960  ! 635: STDFA_R	stda	%f0, [%r0, %r31]
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 636: Tcc_R	ta	icc_or_xcc, %r0 + %r30
unsupttte_8_393:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa5b24488  ! 637: FCMPLE32	fcmple32	%d40, %d8, %r18
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_8_395:
	setx 0x416c871ab5957a4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 641: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa781c014  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r20, %-
	rd %pc, %r19
	add %r19, (ivw_8_397-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_397:
	.word 0x91940011  ! 643: WRPR_PIL_R	wrpr	%r16, %r17, %pil
	.word 0xe0d7e020  ! 644: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_8_399:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_8_400:
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x81982edf  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edf, %hpstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_8_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d94400b  ! 649: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0xa7a409cb  ! 650: FDIVd	fdivd	%f16, %f42, %f50
	.word 0x91a00161  ! 651: FABSq	dis not found

mondo_8_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d914014  ! 652: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
    mov (8+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_8_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_8_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xe1bfda00  ! 654: STDFA_R	stda	%f16, [%r0, %r31]
	setx 0x9d18299d477ede58, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_8_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_8_406:
	setx 0xb09ef5f37ba28832, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_8_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d930013  ! 657: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
	.word 0xe06fe0f2  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x00f2]
splash_cmpr_8_408:
	setx 0x3240080381da5405, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_409
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_409:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 660: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_410) + 56, 16, 16)) -> intp(5,0,15)
intvec_8_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f802458  ! 663: SIR	sir	0x0458
DS_8_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a409c2  ! 1: FDIVd	fdivd	%f16, %f2, %f12
	.word 0x93a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x97a44823  ! 664: FADDs	fadds	%f17, %f3, %f11
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd83fe048  ! 667: STD_I	std	%r12, [%r31 + 0x0048]
mondo_8_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 668: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
mondo_8_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d950013  ! 669: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	.word 0xa3a00165  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_8_414) + 24, 16, 16)) -> intp(5,0,20)
intvec_8_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a509cc  ! 673: FDIVd	fdivd	%f20, %f12, %f50
	.word 0xc36cbc25  ! 674: PREFETCH_I	prefetch	[%r18 + 0xfffffc25], #one_read
	fbue skip_8_415
	fbg skip_8_415
.align 1024
skip_8_415:
	.word 0xc36fe073  ! 675: PREFETCH_I	prefetch	[%r31 + 0x0073], #one_read
splash_lsu_8_416:
	ta T_CHANGE_HPRIV
	set 0xe9fdefaa, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_8_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d95000a  ! 677: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xe88fe020  ! 678: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r20
cwp_8_418:
    set user_data_start, %o7
	.word 0x93902006  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91a2c9d4  ! 680: FDIVd	fdivd	%f42, %f20, %f8
mondo_8_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d940003  ! 681: WRPR_WSTATE_R	wrpr	%r16, %r3, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80344b  ! 683: SIR	sir	0x144b
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_8_420)+24, 16, 16)) -> intp(mask2tid(0x8),1,3)
xir_8_420:
	.word 0xa9843cb5  ! 684: WR_SET_SOFTINT_I	wr	%r16, 0x1cb5, %set_softint
pmu_8_421:
	nop
	setx 0xfffff4edfffff775, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3ec0031  ! 687: PREFETCHA_R	prefetcha	[%r16, %r17] 0x01, #one_read
	rd %pc, %r19
	add %r19, (ivw_8_422-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_8_422:
	.word 0x9195000c  ! 688: WRPR_PIL_R	wrpr	%r20, %r12, %pil
	.word 0xc19fdf20  ! 689: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x919533d6  ! 690: WRPR_PIL_I	wrpr	%r20, 0x13d6, %pil
	.word 0x99902000  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd097e008  ! 692: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r8
splash_cmpr_8_423:
	setx 0x461454c5b87b2bf4, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d90382f  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x182f, %pstate
	.word 0x91d020b4  ! 695: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x91a00169  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_425
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_425:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 697: RDPC	rd	%pc, %r17
	.word 0xd6d7e028  ! 698: LDSHA_I	ldsha	[%r31, + 0x0028] %asi, %r11
pmu_8_426:
	nop
	setx 0xfffffe54fffff4c7, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc19fd920  ! 700: LDDFA_R	ldda	[%r31, %r0], %f0
    ta T_CHANGE_HPRIV
    mov (8+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_8_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_8_427
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_8_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 701: RDPC	rd	%pc, %r16
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
mondo_4_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 1: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
intveclr_4_1:
	setx 0x9378b79ba4292bd3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_2:
	setx 0x12c40c21eb401c16, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 4: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_3
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_3:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 5: RDPC	rd	%pc, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_4)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_4:
	.word 0xa9822856  ! 6: WR_SET_SOFTINT_I	wr	%r8, 0x0856, %set_softint
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_4_6:
	set user_data_start, %r31
	.word 0x85803ebb  ! 8: WRCCR_I	wr	%r0, 0x1ebb, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_7
    set CWQ_BASE, %l6
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
	.word 0x93414000  ! 9: RDPC	rd	%pc, %r9
	.word 0x35400001  ! 1: FBPUE	fbue,a,pn	%fcc0, <label_0x1>
	.word 0x8d9030fc  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x10fc, %pstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_4_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_cmpr_4_11:
	setx 0xe3aea5e82d973595, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_12) + 8, 16, 16)) -> intp(2,0,3)
intvec_4_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_13:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x81982e15  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e15, %hpstate
	.word 0xe1bfd920  ! 16: STDFA_R	stda	%f16, [%r0, %r31]
pmu_4_14:
	nop
	setx 0xfffff71afffff687, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_4_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 19: FCMPd	fcmpd	%fcc<n>, %f0, %f4
donret_4_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_17-donret_4_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e80bd5 | (0x4f << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x29d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_17:
	.word 0xe6ffe08a  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x008a] %asi
DS_4_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e0a1  ! 23: STQF_I	-	%f19, [0x00a1, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_4_20:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xa9a349c3  ! 27: FDIVd	fdivd	%f44, %f34, %f20
DS_4_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad8324d2  ! 29: WR_SOFTINT_REG_I	wr	%r12, 0x04d2, %softint
	.word 0xc19fdb60  ! 30: LDDFA_R	ldda	[%r31, %r0], %f0
splash_hpstate_4_23:
	.word 0x81982a4f  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4f, %hpstate
	.word 0xd73fe060  ! 32: STDF_I	std	%f11, [0x0060, %r31]
pmu_4_24:
	nop
	setx 0xfffff64cfffff94a, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91c009  ! 34: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
mondo_4_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d904011  ! 35: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	setx 0x10439cb5a9bb3e0f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_28:
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x81982ace  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ace, %hpstate
jmptr_4_29:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9bb2c987  ! 39: BSHUFFLE	fmovc32	%d42, %d38, %d44
	.word 0xd9e0c030  ! 40: CASA_I	casa	[%r3] 0x 1, %r16, %r12
jmptr_4_31:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_4_32:
	setx 0x2262529341064cf2, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_4_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_33-donret_4_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00e8c201 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x30c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	.word 0x2acc8001  ! 1: BRNZ	brnz,a,pt	%r18,<label_0xc8001>
	done
donretarg_4_33:
	.word 0xd6ffe031  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x0031] %asi
debug_4_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_34:
	mov 0x622, %r20
	mov 0x1e, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+32), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd71fc003  ! 45: LDDF_R	ldd	[%r31, %r3], %f11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97b30991  ! 47: BSHUFFLE	fmovc32	%d12, %d48, %d42
	.word 0xa9a00165  ! 48: FABSq	dis not found

memptr_4_36:
	set user_data_start, %r31
	.word 0x85823db2  ! 49: WRCCR_I	wr	%r8, 0x1db2, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_37
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_37:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 50: RDPC	rd	%pc, %r13
DS_4_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_4_39:
	setx 0x9da8236e208c84ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_4_40:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe0d1  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x00d1]
donret_4_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_41-donret_4_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00bf3247 | (0x83 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1cf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	.word 0x3a800001  ! 1: BCC	bcc,a	<label_0x1>
	done
donretarg_4_41:
	.word 0xe0ffe041  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x0041] %asi
mondo_4_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d940005  ! 56: WRPR_WSTATE_R	wrpr	%r16, %r5, %wstate
DS_4_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_4_45:
	nop
	setx 0xfffffa87ffffff6d, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_46:
	nop
	setx 0xfffff7a0fffff287, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d940011  ! 61: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_4_48:
	set user_data_start, %r31
	.word 0x8584a141  ! 64: WRCCR_I	wr	%r18, 0x0141, %ccr
intveclr_4_49:
	setx 0x6b9412d6a6456b27, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x95a509b0  ! 67: FDIVs	fdivs	%f20, %f16, %f10
	.word 0xd427e0d4  ! 68: STW_I	stw	%r10, [%r31 + 0x00d4]
splash_cmpr_4_51:
	setx 0xf7708fb521686f6a, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_52) + 32, 16, 16)) -> intp(1,0,21)
intvec_4_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f24, %f26
	.word 0xa7b48314  ! 71: ALIGNADDRESS	alignaddr	%r18, %r20, %r19
donret_4_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_54-donret_4_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00119517 | (20 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x79d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_54:
	.word 0xe2ffe07c  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x007c] %asi
	.word 0xa9b44991  ! 73: BSHUFFLE	fmovc32	%d48, %d48, %d20
	.word 0x9f803719  ! 74: SIR	sir	0x1719
	.word 0x9f80214b  ! 75: SIR	sir	0x014b
fpinit_4_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 76: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x83d020b2  ! 77: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xd8d7e000  ! 78: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x8d9033b6  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x13b6, %pstate
jmptr_4_58:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe0d8  ! 81: STDF_I	std	%f12, [0x00d8, %r31]
	.word 0xa5500000  ! 82: RDPR_TPC	<illegal instruction>
mondo_4_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d948012  ! 83: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_60
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 84: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_61
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_61:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 85: RDPC	rd	%pc, %r18
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d903e60  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x1e60, %pstate
splash_lsu_4_63:
	ta T_CHANGE_HPRIV
	set 0x24cdaea7, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_64:
	.word 0x819825d7  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d7, %hpstate
intveclr_4_65:
	setx 0xf4ac1a751f9a33ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe23cc010  ! 90: STD_R	std	%r17, [%r19 + %r16]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_66) + 48, 16, 16)) -> intp(0,0,0)
intvec_4_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_67:
	setx 0x3bdefe0f3cd059da, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_4_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_68:
	mov 0xbac, %r20
	mov 0x15, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c031  ! 93: LDUHA_R	lduha	[%r31, %r17] 0x01, %r9
splash_cmpr_4_69:
	setx 0x9e8c6d01b1252c2e, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_4_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_71:
	mov 0xc00, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 96: CASA_R	casa	[%r31] %asi, %r17, %r9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0xa5a00173  ! 98: FABSq	dis not found

pmu_4_72:
	nop
	setx 0xfffff364fffff6f1, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_73)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_73:
	.word 0xa9837989  ! 100: WR_SET_SOFTINT_I	wr	%r13, 0x1989, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_74:
	.word 0x99a289c4  ! 1: FDIVd	fdivd	%f10, %f4, %f12
	pdist %f26, %f0, %f30
	.word 0xa5b50312  ! 102: ALIGNADDRESS	alignaddr	%r20, %r18, %r18
fpinit_4_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 103: FDIVs	fdivs	%f0, %f4, %f8
memptr_4_76:
	set 0x60740000, %r31
	.word 0x85836f31  ! 104: WRCCR_I	wr	%r13, 0x0f31, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_4_77:
	nop
	setx 0xfffff31dfffff29e, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_78:
	setx 0xf8ae816837c77b58, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_79:
	taddcctv %r4, 0x11e9, %r1
	.word 0xe807e0f0  ! 109: LDUW_I	lduw	[%r31 + 0x00f0], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d020b2  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9bb48493  ! 112: FCMPLE32	fcmple32	%d18, %d50, %r13
	.word 0xe66fe051  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x0051]
	.word 0x91d02033  ! 114: Tcc_I	ta	icc_or_xcc, %r0 + 51
mondo_4_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92800c  ! 115: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
splash_htba_4_82:
	ta T_CHANGE_HPRIV
	setx 0x0000000200280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f802bab  ! 117: SIR	sir	0x0bab
	.word 0xe1bfe060  ! 118: STDFA_I	stda	%f16, [0x0060, %r31]
	setx 0x77d1ce2884bfad6f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 120: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_84
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_84:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 121: RDPC	rd	%pc, %r13
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 122: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x8d903e66  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x1e66, %pstate
splash_tba_4_86:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
pmu_4_87:
	nop
	setx 0xfffff105fffff72f, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_88) + 16, 16, 16)) -> intp(0,0,5)
intvec_4_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfda00  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd297e020  ! 129: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
splash_lsu_4_89:
	ta T_CHANGE_HPRIV
	set 0x533c0565, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_90:
	nop
	setx 0xfffff342fffff938, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r17
	.word 0x9192bbd0  ! 133: WRPR_PIL_I	wrpr	%r10, 0x1bd0, %pil
mondo_4_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 134: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
mondo_4_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d950014  ! 135: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0016c  ! 137: FABSq	dis not found

	.word 0x9f802f25  ! 138: SIR	sir	0x0f25
jmptr_4_94:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc36c752e  ! 141: PREFETCH_I	prefetch	[%r17 + 0xfffff52e], #one_read
splash_lsu_4_95:
	ta T_CHANGE_HPRIV
	set 0x3aa71e62, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_4_96:
	nop
	setx 0xfffff476fffff930, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_4_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_97:
	mov 0x733, %r20
	mov 0x8, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+40), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd897c021  ! 144: LDUHA_R	lduha	[%r31, %r1] 0x01, %r12
	.word 0xd897e018  ! 145: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r12
	.word 0x99500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_98) + 56, 16, 16)) -> intp(0,0,1)
intvec_4_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a4c9cd  ! 148: FDIVd	fdivd	%f50, %f44, %f42
splash_tba_4_99:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d944002  ! 150: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
splash_hpstate_4_101:
	.word 0x28800001  ! 1: BLEU	bleu,a	<label_0x1>
	.word 0x819823c6  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c6, %hpstate
	rd %pc, %r19
	add %r19, (ivw_4_102-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_102:
	.word 0x91948009  ! 152: WRPR_PIL_R	wrpr	%r18, %r9, %pil
mondo_4_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d92c010  ! 153: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0x2a800001  ! 1: BCS	bcs,a	<label_0x1>
	.word 0x8d902daa  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0daa, %pstate
	.word 0xe19fdc00  ! 155: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x9f802974  ! 156: SIR	sir	0x0974
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_4_106:
	setx 0x6ab37106f9cab138, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_107:
	set 0x60740000, %r31
	.word 0x8581ac90  ! 159: WRCCR_I	wr	%r6, 0x0c90, %ccr
	.word 0xc1bfe000  ! 160: STDFA_I	stda	%f0, [0x0000, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_108)+56, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_108:
	.word 0xa9807e40  ! 161: WR_SET_SOFTINT_I	wr	%r1, 0x1e40, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_4_111:
	nop
	setx 0xfffff407fffffc59, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe02b  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x002b]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_112
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_112:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 167: RDPC	rd	%pc, %r12
	.word 0x93a00173  ! 168: FABSq	dis not found

	.word 0x9150c000  ! 169: RDPR_TT	<illegal instruction>
mondo_4_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d904013  ! 170: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0x97a00172  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_114
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_114:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 172: RDPC	rd	%pc, %r8
intveclr_4_115:
	setx 0xfd9fec7753a8d197, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_116-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_116:
	.word 0x91904010  ! 174: WRPR_PIL_R	wrpr	%r1, %r16, %pil
	setx 0x3203ec8989778919, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe3e7c020  ! 176: CASA_I	casa	[%r31] 0x 1, %r0, %r17
mondo_4_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d95000a  ! 177: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
pmu_4_120:
	nop
	setx 0xfffffbd7fffff18d, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe018  ! 179: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_121
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 180: RDPC	rd	%pc, %r17
change_to_randtl_4_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_122:
	.word 0x8f902000  ! 181: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_hpstate_4_123:
	.word 0x81982cb5  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cb5, %hpstate
DS_4_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbb553963	! Random illegal ?
	.word 0x93a509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f40
	.word 0x95a28831  ! 183: FADDs	fadds	%f10, %f17, %f10
	.word 0x91d02035  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_125
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_125:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 185: RDPC	rd	%pc, %r20
DS_4_126:
	.word 0x99a0c9c3  ! 1: FDIVd	fdivd	%f34, %f34, %f12
	allclean
	.word 0x9bb4c312  ! 186: ALIGNADDRESS	alignaddr	%r19, %r18, %r13
	.word 0x91d02035  ! 187: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_4_127:
	setx 0xc42f17d8e5cda146, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab833f9f  ! 189: WR_CLEAR_SOFTINT_I	wr	%r12, 0x1f9f, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_128) + 8, 16, 16)) -> intp(4,0,13)
intvec_4_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_129:
	nop
	setx 0xffffff89fffff93a, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe0f3  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x00f3]
	rd %pc, %r19
	add %r19, (ivw_4_130-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_130:
	.word 0x91908011  ! 193: WRPR_PIL_R	wrpr	%r2, %r17, %pil
	.word 0xc19fda00  ! 194: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad82309c  ! 196: WR_SOFTINT_REG_I	wr	%r8, 0x109c, %softint
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe0df  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x00df]
intveclr_4_132:
	setx 0x6c7353700bbb1993, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_133)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_133:
	.word 0xa9852231  ! 200: WR_SET_SOFTINT_I	wr	%r20, 0x0231, %set_softint
	.word 0x8d9021e1  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x01e1, %pstate
jmptr_4_135:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9020a5  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x00a5, %pstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x91d02033  ! 205: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_4_138:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd93fc001  ! 206: STDF_R	std	%f12, [%r1, %r31]
memptr_4_139:
	set 0x60540000, %r31
	.word 0x8584251b  ! 207: WRCCR_I	wr	%r16, 0x051b, %ccr
	.word 0x93a489c4  ! 208: FDIVd	fdivd	%f18, %f4, %f40
splash_hpstate_4_140:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x81982f87  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
	.word 0x91d02033  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xddc2c3294b579e0e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_142)+16, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_142:
	.word 0xa980b8ba  ! 214: WR_SET_SOFTINT_I	wr	%r2, 0x18ba, %set_softint
DS_4_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f30, %f0, %f14
	.word 0x99b44300  ! 215: ALIGNADDRESS	alignaddr	%r17, %r0, %r12
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_144:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 216: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_4_145-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_145:
	.word 0x91934011  ! 217: WRPR_PIL_R	wrpr	%r13, %r17, %pil
	.word 0x91a4c9ab  ! 218: FDIVs	fdivs	%f19, %f11, %f8
debug_4_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_4_146:
	mov 0x9cf, %r20
	mov 0xc, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe6dfc022  ! 219: LDXA_R	ldxa	[%r31, %r2] 0x01, %r19
	.word 0xe71fe008  ! 220: LDDF_I	ldd	[%r31, 0x0008], %f19
	.word 0xe19fde00  ! 221: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x264d7ff53bf2d064, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87ac8a53  ! 223: FCMPd	fcmpd	%fcc<n>, %f18, %f50
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
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0xa1a009d2  ! 225: FDIVd	fdivd	%f0, %f18, %f16
mondo_4_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 226: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0xe4dfe030  ! 227: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_150)+16, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_150:
	.word 0xa9842bad  ! 229: WR_SET_SOFTINT_I	wr	%r16, 0x0bad, %set_softint
	.word 0xe46fe061  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x0061]
mondo_4_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d920013  ! 231: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
jmptr_4_152:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xa50ef9507195adc9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd5318014  ! 1: STQF_R	-	%f10, [%r20, %r6]
	normalw
	.word 0xa3458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x9f8023fa  ! 235: SIR	sir	0x03fa
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_4_155:
	nop
	setx 0xfffff53cfffff060, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d918003  ! 239: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
debug_4_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_4_157:
	mov 0x516, %r20
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
	.word 0xe697c034  ! 240: LDUHA_R	lduha	[%r31, %r20] 0x01, %r19
	.word 0x8d902e70  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x0e70, %pstate
mondo_4_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d92c00d  ! 242: WRPR_WSTATE_R	wrpr	%r11, %r13, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f80359d  ! 244: SIR	sir	0x159d
	.word 0xa5a00161  ! 245: FABSq	dis not found

intveclr_4_161:
	setx 0xfb9a2fafbf518855, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_162:
	nop
	setx 0xfffff612fffff66a, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_4_163:
	setx 0xba3c8332a6b4f400, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc36fe032  ! 250: PREFETCH_I	prefetch	[%r31 + 0x0032], #one_read
debug_4_165:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe497c033  ! 251: LDUHA_R	lduha	[%r31, %r19] 0x01, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_166) + 56, 16, 16)) -> intp(2,0,29)
intvec_4_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_167:
	setx 0x0e75508d1fd30931, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_4_168:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_4_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d950013  ! 255: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
jmptr_4_170:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_4_171-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_171:
	.word 0x9193000d  ! 257: WRPR_PIL_R	wrpr	%r12, %r13, %pil
	.word 0x91a489d2  ! 258: FDIVd	fdivd	%f18, %f18, %f8
mondo_4_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d944014  ! 259: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 260: RDPC	rd	%pc, %r20
splash_lsu_4_174:
	ta T_CHANGE_HPRIV
	set 0x05f99e00, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0x93a249b3  ! 263: FDIVs	fdivs	%f9, %f19, %f9
	.word 0xe19fdf20  ! 264: LDDFA_R	ldda	[%r31, %r0], %f16
intveclr_4_176:
	setx 0xeeea563543f96c30, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e0a0  ! 266: STX_I	stx	%r20, [%r31 + 0x00a0]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_4_178:
	nop
	setx 0xfffffd96fffff691, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 271: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe80fe000  ! 272: LDUB_I	ldub	[%r31 + 0x0000], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_180)+48, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_180:
	.word 0xa982fdc7  ! 273: WR_SET_SOFTINT_I	wr	%r11, 0x1dc7, %set_softint
jmptr_4_181:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_4_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 277: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x99b30988  ! 278: BSHUFFLE	fmovc32	%d12, %d8, %d12
	.word 0x97b2c4c6  ! 279: FCMPNE32	fcmpne32	%d42, %d6, %r11
	.word 0xe26fe0e4  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e4]
	setx 0x124027a07a04d812, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_186:
	.word 0x819827ff  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ff, %hpstate
cwp_4_187:
    set user_data_start, %o7
	.word 0x93902007  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
intveclr_4_188:
	setx 0x53001b5561ed9e2b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe02e  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x002e]
	.word 0x91d020b2  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 178
intveclr_4_189:
	setx 0xf3df2aeafa7e5856, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d928009  ! 288: WRPR_WSTATE_R	wrpr	%r10, %r9, %wstate
fpinit_4_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 289: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_192) + 32, 16, 16)) -> intp(7,0,17)
intvec_4_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_193:
	nop
	setx 0xfffff68dfffff5af, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a409d2  ! 293: FDIVd	fdivd	%f16, %f18, %f8
fpinit_4_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 294: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x919424eb  ! 295: WRPR_PIL_I	wrpr	%r16, 0x04eb, %pil
	.word 0x91d02034  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe83fc000  ! 299: STD_R	std	%r20, [%r31 + %r0]
fpinit_4_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 300: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 301: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 302: RDPC	rd	%pc, %r20
splash_lsu_4_199:
	ta T_CHANGE_HPRIV
	set 0x4fe5bcd6, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d930009  ! 304: WRPR_WSTATE_R	wrpr	%r12, %r9, %wstate
memptr_4_201:
	set user_data_start, %r31
	.word 0x8581299a  ! 305: WRCCR_I	wr	%r4, 0x099a, %ccr
	.word 0x9f803cce  ! 306: SIR	sir	0x1cce
splash_lsu_4_202:
	ta T_CHANGE_HPRIV
	set 0x3561354b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f803fd9  ! 308: SIR	sir	0x1fd9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_203
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_203:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 309: RDPC	rd	%pc, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_204) + 8, 16, 16)) -> intp(5,0,30)
intvec_4_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_205
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 311: RDPC	rd	%pc, %r18
mondo_4_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d920005  ! 312: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
cwp_4_207:
    set user_data_start, %o7
	.word 0x93902006  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d950012  ! 315: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc3ea8033  ! 317: PREFETCHA_R	prefetcha	[%r10, %r19] 0x01, #one_read
	.word 0xd91fe008  ! 318: LDDF_I	ldd	[%r31, 0x0008], %f12
	.word 0xe1bfe0e0  ! 319: STDFA_I	stda	%f16, [0x00e0, %r31]
memptr_4_210:
	set user_data_start, %r31
	.word 0x85843d9c  ! 320: WRCCR_I	wr	%r16, 0x1d9c, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_4_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa5a2c9c4  ! 1: FDIVd	fdivd	%f42, %f4, %f18
	.word 0xa9a1082a  ! 322: FADDs	fadds	%f4, %f10, %f20
	.word 0xe137e038  ! 323: STQF_I	-	%f16, [0x0038, %r31]
pmu_4_212:
	nop
	setx 0xfffff731fffff90c, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f80312c  ! 325: SIR	sir	0x112c
mondo_4_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d940011  ! 326: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x986a4008  ! 327: UDIVX_R	udivx 	%r9, %r8, %r12
	.word 0x9f8026d7  ! 328: SIR	sir	0x06d7
	.word 0xc1bfd960  ! 329: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xa345c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xe137e0f4  ! 331: STQF_I	-	%f16, [0x00f4, %r31]
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 332: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa3a4c9d4  ! 333: FDIVd	fdivd	%f50, %f20, %f48
	.word 0x91d02032  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93500000  ! 335: RDPR_TPC	<illegal instruction>
intveclr_4_214:
	setx 0x0dadc7d45cd95f3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 51
	rd %pc, %r19
	add %r19, (ivw_4_215-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_215:
	.word 0x9194c009  ! 338: WRPR_PIL_R	wrpr	%r19, %r9, %pil
	.word 0xa1a4c9c1  ! 339: FDIVd	fdivd	%f50, %f32, %f16
	.word 0xa7464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r19
pmu_4_216:
	nop
	setx 0xfffff459fffff40d, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_218) + 40, 16, 16)) -> intp(5,0,8)
intvec_4_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_219
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_219:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 344: RDPC	rd	%pc, %r17
splash_htba_4_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9145c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0xc1bfe020  ! 347: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xa9a349cd  ! 348: FDIVd	fdivd	%f44, %f44, %f20
	setx 0x79e9718c0d04ff21, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe018  ! 350: LDDA_I	ldda	[%r31, + 0x0018] %asi, %r13
mondo_4_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d950013  ! 351: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_223:
	set 0x60540000, %r31
	.word 0x8584ad3e  ! 353: WRCCR_I	wr	%r18, 0x0d3e, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe004  ! 355: STDA_I	stda	%r13, [%r31 + 0x0004] %asi
pmu_4_224:
	nop
	setx 0xfffff60afffff6fa, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0xa5a109aa  ! 358: FDIVs	fdivs	%f4, %f10, %f18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_225)+0, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_225:
	.word 0xa981e97a  ! 359: WR_SET_SOFTINT_I	wr	%r7, 0x097a, %set_softint
	.word 0x9f802863  ! 360: SIR	sir	0x0863
intveclr_4_226:
	setx 0x7b825329bf275946, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_4_228:
	set user_data_start, %r31
	.word 0x8584208d  ! 363: WRCCR_I	wr	%r16, 0x008d, %ccr
	.word 0x93d020b4  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x97a509ab  ! 365: FDIVs	fdivs	%f20, %f11, %f11
	.word 0x9f802d3c  ! 366: SIR	sir	0x0d3c
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_229)+16, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_229:
	.word 0xa981799b  ! 367: WR_SET_SOFTINT_I	wr	%r5, 0x199b, %set_softint
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_230:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 368: RDPC	rd	%pc, %r10
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x93a00173  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_4_232-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_232:
	.word 0x91934014  ! 372: WRPR_PIL_R	wrpr	%r13, %r20, %pil
splash_decr_4_233:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa7840004  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r4, %-
DS_4_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902c68  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x0c68, %pstate
intveclr_4_237:
	setx 0xfe497715df4ff632, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a4c9c9  ! 378: FDIVd	fdivd	%f50, %f40, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_238) + 8, 16, 16)) -> intp(4,0,3)
intvec_4_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_4_239:
	.word 0xa9a4c9d4  ! 1: FDIVd	fdivd	%f50, %f20, %f20
	.word 0xe734e402  ! 1: STQF_I	-	%f19, [0x0402, %r19]
	normalw
	.word 0xa5458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r18
splash_hpstate_4_240:
	.word 0x81982c85  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c85, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_242
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_242:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 383: RDPC	rd	%pc, %r16
	.word 0xe127e090  ! 384: STF_I	st	%f16, [0x0090, %r31]
DS_4_243:
	.word 0xa9a449d2  ! 1: FDIVd	fdivd	%f48, %f18, %f20
	.word 0xe534ac7d  ! 1: STQF_I	-	%f18, [0x0c7d, %r18]
	normalw
	.word 0x99458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r12
fpinit_4_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 386: FDIVd	fdivd	%f0, %f4, %f8
	.word 0xc1bfe0c0  ! 387: STDFA_I	stda	%f0, [0x00c0, %r31]
	.word 0x91d020b4  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 180
mondo_4_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d91c009  ! 389: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_246) + 56, 16, 16)) -> intp(1,0,10)
intvec_4_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_247
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_247:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 391: RDPC	rd	%pc, %r11
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_248:
	setx 0xa9ac7b737fe6f010, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_249-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_249:
	.word 0x91948014  ! 394: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	.word 0xe62fe0e8  ! 395: STB_I	stb	%r19, [%r31 + 0x00e8]
fpinit_4_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 396: FDIVd	fdivd	%f0, %f4, %f6
mondo_4_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d944008  ! 397: WRPR_WSTATE_R	wrpr	%r17, %r8, %wstate
DS_4_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe531c011  ! 1: STQF_R	-	%f18, [%r17, %r7]
	normalw
	.word 0xa1458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xc1bfe0e0  ! 399: STDFA_I	stda	%f0, [0x00e0, %r31]
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_4_253:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_254
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_254:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 402: RDPC	rd	%pc, %r20
fpinit_4_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 403: FDIVs	fdivs	%f0, %f4, %f4
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9345c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0xe8dfe010  ! 407: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 408: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_4_257:
	nop
	setx 0xfffffb33fffff0e8, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_4_258:
	ta T_CHANGE_HPRIV
	set 0x7bb93ede, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_259:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_4_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7848006  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r6, %-
	.word 0x9f80310e  ! 413: SIR	sir	0x110e
memptr_4_261:
	set user_data_start, %r31
	.word 0x858435a6  ! 414: WRCCR_I	wr	%r16, 0x15a6, %ccr
mondo_4_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d93400b  ! 415: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	.word 0x8d903125  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x1125, %pstate
	.word 0x91a0016a  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_264
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_264:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 418: RDPC	rd	%pc, %r19
pmu_4_265:
	nop
	setx 0xfffffe91fffff502, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02034  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa5a509cb  ! 421: FDIVd	fdivd	%f20, %f42, %f18
	.word 0xe427e049  ! 422: STW_I	stw	%r18, [%r31 + 0x0049]
	rd %pc, %r19
	add %r19, (ivw_4_266-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_266:
	.word 0x91910010  ! 423: WRPR_PIL_R	wrpr	%r4, %r16, %pil
	.word 0x95500000  ! 424: RDPR_TPC	<illegal instruction>
	.word 0xc36fe065  ! 425: PREFETCH_I	prefetch	[%r31 + 0x0065], #one_read
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_268) + 40, 16, 16)) -> intp(3,0,24)
intvec_4_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_4_269:
	setx 0xb6c6b8489ef4a838, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_270:
	set user_data_start, %r31
	.word 0x858524b4  ! 429: WRCCR_I	wr	%r20, 0x04b4, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_271:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 430: RDPC	rd	%pc, %r13
    set 0x1fad, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b147e7  ! 431: PDISTN	fmean16	%d36, %d38, %d18
	.word 0x91d02033  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_272
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 433: RDPC	rd	%pc, %r16
	.word 0x91d02034  ! 434: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa3a00167  ! 435: FABSq	dis not found

splash_hpstate_4_273:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x81982b57  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b57, %hpstate
intveclr_4_274:
	setx 0xd86d6be0d4fadae5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe010  ! 438: LDD_I	ldd	[%r31 + 0x0010], %r20
	rd %pc, %r19
	add %r19, (ivw_4_275-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_275:
	.word 0x91950013  ! 439: WRPR_PIL_R	wrpr	%r20, %r19, %pil
donret_4_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_276-donret_4_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00ef0e28 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x70e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_276:
	.word 0xe8ffe038  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x0038] %asi
splash_hpstate_4_277:
	.word 0x819828d7  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0xcc23ce9488ef5460, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_280:
	nop
	setx 0xfffff1e9fffff0cb, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_4_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_281:
	.word 0x8f902001  ! 445: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_4_282:
	setx 0x5a31b13caa1a7d4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd920  ! 447: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe93fe0c0  ! 448: STDF_I	std	%f20, [0x00c0, %r31]
	.word 0xe1bfe020  ! 449: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0xe8dfe008  ! 450: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r20
	.word 0x3f400001  ! 1: FBPO	fbo,a,pn	%fcc0, <label_0x1>
	.word 0x8d902504  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x0504, %pstate
	.word 0x39400001  ! 452: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd23fc000  ! 454: STD_R	std	%r9, [%r31 + %r0]
	.word 0x97a4c9c4  ! 455: FDIVd	fdivd	%f50, %f4, %f42
splash_cmpr_4_285:
	setx 0x9ba1c45b7de421f3, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_4_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d92c00a  ! 457: WRPR_WSTATE_R	wrpr	%r11, %r10, %wstate
	.word 0xc1bfda00  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xc19fe060  ! 459: LDDFA_I	ldda	[%r31, 0x0060], %f0
pmu_4_287:
	nop
	setx 0xfffff39ffffff73b, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_4_288:
	.word 0x99a349d2  ! 1: FDIVd	fdivd	%f44, %f18, %f12
	allclean
	.word 0x99b4830d  ! 461: ALIGNADDRESS	alignaddr	%r18, %r13, %r12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 462: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0xfb12a2174d4432f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_290)+0, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_290:
	.word 0xa980a020  ! 464: WR_SET_SOFTINT_I	wr	%r2, 0x0020, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_291)+0, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_291:
	.word 0xa984a01e  ! 465: WR_SET_SOFTINT_I	wr	%r18, 0x001e, %set_softint
	.word 0xe20fe010  ! 466: LDUB_I	ldub	[%r31 + 0x0010], %r17
	.word 0xa3540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0xa350c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_292
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_292:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 469: RDPC	rd	%pc, %r8
	.word 0x9f802a7a  ! 470: SIR	sir	0x0a7a
intveclr_4_293:
	setx 0x0c99c5be8547f99b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_4_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e8211b  ! 472: PREFETCHA_I	prefetcha	[%r0, + 0x011b] %asi, #one_read
pmu_4_295:
	nop
	setx 0xfffff628fffffda8, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_4_296:
	.word 0x81982307  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
donret_4_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_297-donret_4_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00db1219 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xdc5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_297:
	.word 0xe2ffe0c8  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x00c8] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02035  ! 477: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_4_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xb94bc4b8	! Random illegal ?
	.word 0xe3140010  ! 1: LDQF_R	-	[%r16, %r16], %f17
	.word 0xa1a1c834  ! 478: FADDs	fadds	%f7, %f20, %f16
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x95b30982  ! 480: BSHUFFLE	fmovc32	%d12, %d2, %d10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_4_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_4_302:
	setx 0x8dea30164b89c6c2, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe06d  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x006d]
	.word 0x9f802016  ! 484: SIR	sir	0x0016
	setx 0xbb138a41b3587df9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a509ca  ! 486: FDIVd	fdivd	%f20, %f10, %f20
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x26cc4001  ! 1: BRLZ	brlz,a,pt	%r17,<label_0xc4001>
	.word 0x8d902925  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x0925, %pstate
	.word 0xa1a189d0  ! 489: FDIVd	fdivd	%f6, %f16, %f16
	.word 0xa3a00160  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_305
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_305:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 491: RDPC	rd	%pc, %r19
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_306:
	setx 0x80006d85ac653082, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803d3b  ! 495: SIR	sir	0x1d3b
	.word 0x95a00166  ! 496: FABSq	dis not found

	.word 0xa7b10493  ! 497: FCMPLE32	fcmple32	%d4, %d50, %r19
	.word 0xe19fe000  ! 498: LDDFA_I	ldda	[%r31, 0x0000], %f16
	.word 0xd64fe008  ! 499: LDSB_I	ldsb	[%r31 + 0x0008], %r11
	.word 0x97b4898b  ! 500: BSHUFFLE	fmovc32	%d18, %d42, %d42
	.word 0x93a00171  ! 501: FABSq	dis not found

DS_4_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_4_309:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xa550c000  ! 504: RDPR_TT	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f80247f  ! 506: SIR	sir	0x047f
jmptr_4_311:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_312
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_312:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 508: RDPC	rd	%pc, %r12
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xc19fd920  ! 510: LDDFA_R	ldda	[%r31, %r0], %f0
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_314) + 16, 16, 16)) -> intp(0,0,7)
intvec_4_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_4_315:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_4_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa152c2e8	! Random illegal ?
	.word 0x93a00554  ! 1: FSQRTd	fsqrt	
	.word 0x93a1c821  ! 513: FADDs	fadds	%f7, %f1, %f9
memptr_4_317:
	set 0x60340000, %r31
	.word 0x8584a0df  ! 514: WRCCR_I	wr	%r18, 0x00df, %ccr
splash_lsu_4_318:
	ta T_CHANGE_HPRIV
	set 0xba91f30f, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x8c153a0527dc8417, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_4_320:
	setx 0xcd3fe0d2c072ec61, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_4_321:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd33fc00d  ! 519: STDF_R	std	%f9, [%r13, %r31]
memptr_4_322:
	set 0x60540000, %r31
	.word 0x8580e7bf  ! 520: WRCCR_I	wr	%r3, 0x07bf, %ccr
	.word 0xd25fe008  ! 521: LDX_I	ldx	[%r31 + 0x0008], %r9
fpinit_4_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 522: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91d020b2  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 178
change_to_randtl_4_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_324:
	.word 0x8f902001  ! 524: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab840013  ! 525: WR_CLEAR_SOFTINT_R	wr	%r16, %r19, %clear_softint
	.word 0xd26fe008  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x0008]
	setx 0x9ef8ee988659efb8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_4_326-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_326:
	.word 0x91950012  ! 528: WRPR_PIL_R	wrpr	%r20, %r18, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 531: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_4_327:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd23fef18  ! 532: STD_I	std	%r9, [%r31 + 0x0f18]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_328
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_328:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 533: RDPC	rd	%pc, %r16
	.word 0xe26fe07b  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x007b]
	.word 0xa7520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2ec98001  ! 1: BRGEZ	brgez,a,pt	%r6,<label_0x98001>
	.word 0x8d9020ca  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
mondo_4_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d940004  ! 537: WRPR_WSTATE_R	wrpr	%r16, %r4, %wstate
	.word 0x9f802c23  ! 538: SIR	sir	0x0c23
mondo_4_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d948010  ! 539: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_4_332:
	setx 0xb2b206dd5de77b61, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_4_333:
	setx 0x91dc0b665b362756, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_334
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_334:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 544: RDPC	rd	%pc, %r13
pmu_4_335:
	nop
	setx 0xfffff823fffffb1a, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_4_336:
	setx 0x0d92b5620c6e40a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_337:
	setx 0x6002783d42c28e61, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 548: Tcc_I	tne	icc_or_xcc, %r0 + 179
	rd %pc, %r19
	add %r19, (ivw_4_338-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_338:
	.word 0x91934005  ! 549: WRPR_PIL_R	wrpr	%r13, %r5, %pil
splash_lsu_4_339:
	ta T_CHANGE_HPRIV
	set 0xfe520623, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d904010  ! 551: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xc19fe0c0  ! 552: LDDFA_I	ldda	[%r31, 0x00c0], %f0
	setx 0x44183744d31a09b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe020  ! 554: LDUB_I	ldub	[%r31 + 0x0020], %r9
	.word 0x8d902514  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x0514, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_4_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_343-donret_4_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00d46991 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x1c4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_343:
	.word 0xd2ffe097  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x0097] %asi
	.word 0x8d903c03  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x1c03, %pstate
mondo_4_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d94800d  ! 559: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
splash_lsu_4_346:
	ta T_CHANGE_HPRIV
	set 0x4afaee78, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa4ab4013  ! 561: ANDNcc_R	andncc 	%r13, %r19, %r18
jmptr_4_347:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_4_348:
	setx 0x8542cf6adb3ad687, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_4_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe22fe0e5  ! 565: STB_I	stb	%r17, [%r31 + 0x00e5]
	.word 0xe19fda00  ! 566: LDDFA_R	ldda	[%r31, %r0], %f16
tagged_4_350:
	tsubcctv %r16, 0x1f5d, %r7
	.word 0xe207e0f6  ! 567: LDUW_I	lduw	[%r31 + 0x00f6], %r17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_4_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_352
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_352:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 569: RDPC	rd	%pc, %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_4_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8db00484  ! 571: FCMPLE32	fcmple32	%d0, %d4, %r6
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_356:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_4_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d940012  ! 574: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
	.word 0xc36fe0fe  ! 575: PREFETCH_I	prefetch	[%r31 + 0x00fe], #one_read
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_360)+32, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_360:
	.word 0xa9807d2f  ! 577: WR_SET_SOFTINT_I	wr	%r1, 0x1d2f, %set_softint
memptr_4_361:
	set 0x60540000, %r31
	.word 0x85803b04  ! 578: WRCCR_I	wr	%r0, 0x1b04, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_4_362:
	.word 0x8198211c  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011c, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_4_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 582: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xab81400c  ! 583: WR_CLEAR_SOFTINT_R	wr	%r5, %r12, %clear_softint
	.word 0xab826c9d  ! 584: WR_CLEAR_SOFTINT_I	wr	%r9, 0x0c9d, %clear_softint
pmu_4_364:
	nop
	setx 0xfffff74efffff8fe, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_365
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_365:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 586: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_366
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_366:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 587: RDPC	rd	%pc, %r10
change_to_randtl_4_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_367:
	.word 0x8f902002  ! 588: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
invtsb_4_368:
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
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0xa9a00170  ! 590: FABSq	dis not found

	.word 0xd037e0c4  ! 591: STH_I	sth	%r8, [%r31 + 0x00c4]
	rd %pc, %r19
	add %r19, (ivw_4_369-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_369:
	.word 0x91924013  ! 592: WRPR_PIL_R	wrpr	%r9, %r19, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_4_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e830d0  ! 594: PREFETCHA_I	prefetcha	[%r0, + 0xfffff0d0] %asi, #one_read
mondo_4_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d904009  ! 595: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0xd04fe008  ! 596: LDSB_I	ldsb	[%r31 + 0x0008], %r8
DS_4_372:
	.word 0x93a449c3  ! 1: FDIVd	fdivd	%f48, %f34, %f40
	allclean
	.word 0x95b48301  ! 597: ALIGNADDRESS	alignaddr	%r18, %r1, %r10
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_373
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_373:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 598: RDPC	rd	%pc, %r10
mondo_4_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944003  ! 599: WRPR_WSTATE_R	wrpr	%r17, %r3, %wstate
DS_4_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe1bfda00  ! 601: STDFA_R	stda	%f16, [%r0, %r31]
pmu_4_376:
	nop
	setx 0xfffff19cfffffe16, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_4_377:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_4_378:
	ta T_CHANGE_PRIV
	setx 0x0000000400380000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_4_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d948004  ! 607: WRPR_WSTATE_R	wrpr	%r18, %r4, %wstate
	.word 0xc19fda00  ! 608: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x93d020b4  ! 609: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_cmpr_4_380:
	setx 0x018d9c75a30a79c3, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0xec82f146ae0c1ae7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a00168  ! 613: FABSq	dis not found

splash_cmpr_4_382:
	setx 0x3f7dc729f69d3e25, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_4_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 615: FDIVd	fdivd	%f0, %f4, %f6
jmptr_4_384:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fdc00  ! 617: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe03fc000  ! 618: STD_R	std	%r16, [%r31 + %r0]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_386
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_386:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 619: RDPC	rd	%pc, %r17
pmu_4_387:
	nop
	setx 0xfffffa1fffffffe4, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_388
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_388:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 621: RDPC	rd	%pc, %r18
pmu_4_389:
	nop
	setx 0xfffff25cfffff555, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe021  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x0021]
fpinit_4_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 624: FDIVs	fdivs	%f0, %f4, %f6
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 625: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa3a489d2  ! 626: FDIVd	fdivd	%f18, %f18, %f48
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 627: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_4_391:
	nop
	setx 0xfffff462fffff0e0, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97a089c3  ! 629: FDIVd	fdivd	%f2, %f34, %f42
	.word 0xe4bfe0a0  ! 630: STDA_I	stda	%r18, [%r31 + 0x00a0] %asi
	.word 0xe1bfe020  ! 631: STDFA_I	stda	%f16, [0x0020, %r31]
	.word 0xe527e0e0  ! 632: STF_I	st	%f18, [0x00e0, %r31]
tagged_4_392:
	tsubcctv %r16, 0x14ac, %r20
	.word 0xe407e069  ! 633: LDUW_I	lduw	[%r31 + 0x0069], %r18
	.word 0xa9a00166  ! 634: FABSq	dis not found

	.word 0xe1bfe0a0  ! 635: STDFA_I	stda	%f16, [0x00a0, %r31]
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 636: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87ad0a51  ! 637: FCMPd	fcmpd	%fcc<n>, %f20, %f48
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_395:
	setx 0x5f9d6965107d372c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 641: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_4_396:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7800009  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r9, %-
	rd %pc, %r19
	add %r19, (ivw_4_397-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_397:
	.word 0x9194400c  ! 643: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0xe0d7e018  ! 644: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r16
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_4_399:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_4_400:
	.word 0x2cccc001  ! 1: BRGZ	brgz,a,pt	%r19,<label_0xcc001>
	.word 0x81982d96  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d96, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_4_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d94c00a  ! 649: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
	.word 0x9ba089d4  ! 650: FDIVd	fdivd	%f2, %f20, %f44
	.word 0xa7a00170  ! 651: FABSq	dis not found

mondo_4_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d910011  ! 652: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xc1bfe0c0  ! 654: STDFA_I	stda	%f0, [0x00c0, %r31]
	setx 0x6be4e7beee12e970, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_406:
	setx 0xb3f2f897aa037e25, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_4_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d930010  ! 657: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0xe06fe0c5  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x00c5]
splash_cmpr_4_408:
	setx 0x7a8758b83b9f128c, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_409
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_409:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 660: RDPC	rd	%pc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_410) + 24, 16, 16)) -> intp(4,0,31)
intvec_4_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f8023a3  ! 663: SIR	sir	0x03a3
DS_4_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa9a4c9c9  ! 1: FDIVd	fdivd	%f50, %f40, %f20
	.word 0x97a00551  ! 1: FSQRTd	fsqrt	
	.word 0x91a34834  ! 664: FADDs	fadds	%f13, %f20, %f8
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd83fe0a0  ! 667: STD_I	std	%r12, [%r31 + 0x00a0]
mondo_4_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d93400a  ! 668: WRPR_WSTATE_R	wrpr	%r13, %r10, %wstate
mondo_4_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d950004  ! 669: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0xa1a00173  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_414) + 48, 16, 16)) -> intp(7,0,20)
intvec_4_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7a209c5  ! 673: FDIVd	fdivd	%f8, %f36, %f50
	.word 0x39400001  ! 674: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36fe04b  ! 675: PREFETCH_I	prefetch	[%r31 + 0x004b], #one_read
splash_lsu_4_416:
	ta T_CHANGE_HPRIV
	set 0x263b38a1, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_4_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d92c009  ! 677: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	.word 0xe88fe018  ! 678: LDUBA_I	lduba	[%r31, + 0x0018] %asi, %r20
cwp_4_418:
    set user_data_start, %o7
	.word 0x93902000  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9ba4c9ca  ! 680: FDIVd	fdivd	%f50, %f10, %f44
mondo_4_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d914011  ! 681: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f80240b  ! 683: SIR	sir	0x040b
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_420)+8, 16, 16)) -> intp(mask2tid(0x4),1,3)
xir_4_420:
	.word 0xa9843ea1  ! 684: WR_SET_SOFTINT_I	wr	%r16, 0x1ea1, %set_softint
pmu_4_421:
	nop
	setx 0xfffffd27fffff96f, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x957027fa  ! 687: POPC_I	popc	0x07fa, %r10
	rd %pc, %r19
	add %r19, (ivw_4_422-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_422:
	.word 0x9190400d  ! 688: WRPR_PIL_R	wrpr	%r1, %r13, %pil
	.word 0xe19fdf20  ! 689: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91946941  ! 690: WRPR_PIL_I	wrpr	%r17, 0x0941, %pil
	.word 0x99902003  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd097e000  ! 692: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
splash_cmpr_4_423:
	setx 0x718f55e6102ad04f, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d903b0e  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x1b0e, %pstate
	.word 0x91d02034  ! 695: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa3a0016b  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_425
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_425:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 697: RDPC	rd	%pc, %r18
	.word 0xd6d7e010  ! 698: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
pmu_4_426:
	nop
	setx 0xfffffc93fffff70a, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc19fd920  ! 700: LDDFA_R	ldda	[%r31, %r0], %f0
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_427
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 701: RDPC	rd	%pc, %r18
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
mondo_2_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d910006  ! 1: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
intveclr_2_1:
	setx 0x759d13dc6d039263, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_2:
	setx 0x8117528c03fb6274, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_3
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_3:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 5: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_4)+24, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_4:
	.word 0xa981ec18  ! 6: WR_SET_SOFTINT_I	wr	%r7, 0x0c18, %set_softint
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_2_6:
	set user_data_start, %r31
	.word 0x858471aa  ! 8: WRCCR_I	wr	%r17, 0x11aa, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_7
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_7:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 9: RDPC	rd	%pc, %r12
	.word 0x2f400001  ! 1: FBPU	fbu,a,pn	%fcc0, <label_0x1>
	.word 0x8d9020b9  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x00b9, %pstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_2_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_2_11:
	setx 0x208d7685782a9e08, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_12) + 8, 16, 16)) -> intp(0,0,2)
intvec_2_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_13:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x8198271c  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	.word 0xc1bfde00  ! 16: STDFA_R	stda	%f0, [%r0, %r31]
pmu_2_14:
	nop
	setx 0xfffffb34ffffffa7, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_2_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82029  ! 19: PREFETCHA_I	prefetcha	[%r0, + 0x0029] %asi, #one_read
donret_2_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_17-donret_2_17-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fd8a1a | (0x8a << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x54c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_17:
	.word 0xe6ffe0b0  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x00b0] %asi
DS_2_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e060  ! 23: STQF_I	-	%f19, [0x0060, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_2_20:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xd7e40031  ! 27: CASA_I	casa	[%r16] 0x 1, %r17, %r11
DS_2_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad84bfd0  ! 29: WR_SOFTINT_REG_I	wr	%r18, 0x1fd0, %softint
	.word 0xe19fd960  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_2_23:
	.word 0x81982454  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0454, %hpstate
	.word 0xd73fe070  ! 32: STDF_I	std	%f11, [0x0070, %r31]
pmu_2_24:
	nop
	setx 0xfffff0edfffffba6, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 34: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
mondo_2_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90000d  ! 35: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
	setx 0xe3ee1249c4f3dd1e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_28:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x8198289f  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
jmptr_2_29:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x97b04992  ! 39: BSHUFFLE	fmovc32	%d32, %d18, %d42
	.word 0xd63d0003  ! 40: STD_R	std	%r11, [%r20 + %r3]
jmptr_2_31:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_2_32:
	setx 0x8478140e0db4ed68, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_2_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_33-donret_2_33-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00c3ac91 | (0x80 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x65c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	done
donretarg_2_33:
	.word 0xd6ffe0bf  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x00bf] %asi
debug_2_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_34:
	mov 0x432, %r20
	mov 0x1, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+0), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd6dfc023  ! 45: LDXA_R	ldxa	[%r31, %r3] 0x01, %r11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93b34991  ! 47: BSHUFFLE	fmovc32	%d44, %d48, %d40
	.word 0x9ba00174  ! 48: FABSq	dis not found

memptr_2_36:
	set user_data_start, %r31
	.word 0x858423d9  ! 49: WRCCR_I	wr	%r16, 0x03d9, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_37
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 50: RDPC	rd	%pc, %r18
DS_2_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_2_39:
	setx 0x206f6767a36bedc2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_2_40:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe0ec  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x00ec]
donret_2_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_41-donret_2_41-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00783869 | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x78c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	.word 0x22cc8001  ! 1: BRZ	brz,a,pt	%r18,<label_0xc8001>
	done
donretarg_2_41:
	.word 0xe0ffe020  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x0020] %asi
mondo_2_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 56: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
DS_2_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_2_45:
	nop
	setx 0xfffffe36fffff426, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_46:
	nop
	setx 0xfffff118fffffed4, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d928005  ! 61: WRPR_WSTATE_R	wrpr	%r10, %r5, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_2_48:
	set user_data_start, %r31
	.word 0x8585270b  ! 64: WRCCR_I	wr	%r20, 0x070b, %ccr
intveclr_2_49:
	setx 0xcaac69c4872bb67b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0xa3a249ad  ! 67: FDIVs	fdivs	%f9, %f13, %f17
	.word 0xd427e07c  ! 68: STW_I	stw	%r10, [%r31 + 0x007c]
splash_cmpr_2_51:
	setx 0xe1ae92435724624c, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_52) + 32, 16, 16)) -> intp(3,0,22)
intvec_2_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f2, %f10
	.word 0x97b44313  ! 71: ALIGNADDRESS	alignaddr	%r17, %r19, %r11
donret_2_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_54-donret_2_54-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00486959 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x9df, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_54:
	.word 0xe2ffe0ed  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x00ed] %asi
	.word 0xa1b2c985  ! 73: BSHUFFLE	fmovc32	%d42, %d36, %d16
	.word 0x9f803b26  ! 74: SIR	sir	0x1b26
	.word 0x9f802f3f  ! 75: SIR	sir	0x0f3f
fpinit_2_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 76: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0x91d020b5  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd8d7e018  ! 78: LDSHA_I	ldsha	[%r31, + 0x0018] %asi, %r12
	.word 0x8d902690  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x0690, %pstate
jmptr_2_58:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe0f2  ! 81: STDF_I	std	%f12, [0x00f2, %r31]
	.word 0xa9500000  ! 82: RDPR_TPC	<illegal instruction>
mondo_2_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d950012  ! 83: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_60
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 84: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_61
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_61:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 85: RDPC	rd	%pc, %r20
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f20  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x0f20, %pstate
splash_lsu_2_63:
	ta T_CHANGE_HPRIV
	set 0x4d932b6d, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_64:
	.word 0x81982005  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0005, %hpstate
intveclr_2_65:
	setx 0x23ed98665424a89b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd23d0011  ! 90: STD_R	std	%r9, [%r20 + %r17]
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_66) + 48, 16, 16)) -> intp(3,0,6)
intvec_2_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_67:
	setx 0x772f3d1cb1bb0047, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_2_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_68:
	mov 0xc83, %r20
	mov 0x14, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 93: CASA_R	casa	[%r31] %asi, %r17, %r9
splash_cmpr_2_69:
	setx 0x44855b780670ee66, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_2_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_71:
	mov 0x8d6, %r20
	mov 0xf, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd297c031  ! 96: LDUHA_R	lduha	[%r31, %r17] 0x01, %r9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0x95a00170  ! 98: FABSq	dis not found

pmu_2_72:
	nop
	setx 0xfffff611fffff58d, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_73)+0, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_73:
	.word 0xa9813403  ! 100: WR_SET_SOFTINT_I	wr	%r4, 0x1403, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_74:
	.word 0xa7a409c0  ! 1: FDIVd	fdivd	%f16, %f0, %f50
	pdist %f10, %f24, %f2
	.word 0x91b40309  ! 102: ALIGNADDRESS	alignaddr	%r16, %r9, %r8
fpinit_2_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 103: FDIVd	fdivd	%f0, %f4, %f8
memptr_2_76:
	set 0x60740000, %r31
	.word 0x8580277d  ! 104: WRCCR_I	wr	%r0, 0x077d, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_2_77:
	nop
	setx 0xfffff5a9fffffc6b, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_78:
	setx 0x516844c473a53b8e, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_79:
	taddcctv %r0, 0x1aaa, %r17
	.word 0xe807e0c1  ! 109: LDUW_I	lduw	[%r31 + 0x00c1], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d020b2  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x97a509d1  ! 112: FDIVd	fdivd	%f20, %f48, %f42
	.word 0xe66fe0a5  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x00a5]
	.word 0x93d02033  ! 114: Tcc_I	tne	icc_or_xcc, %r0 + 51
mondo_2_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d950014  ! 115: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
splash_htba_2_82:
	ta T_CHANGE_HPRIV
	setx 0x00000002002a0000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f803192  ! 117: SIR	sir	0x1192
	.word 0xc19fda00  ! 118: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0x88c370e6ce284b89, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 120: Tcc_R	te	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_84
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_84:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 121: RDPC	rd	%pc, %r13
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 122: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d902dd2  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x0dd2, %pstate
splash_tba_2_86:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x91454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
pmu_2_87:
	nop
	setx 0xfffffe48ffffff8c, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_88) + 56, 16, 16)) -> intp(1,0,27)
intvec_2_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfc2c0  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd297e000  ! 129: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
splash_lsu_2_89:
	ta T_CHANGE_HPRIV
	set 0x6a4ce1a1, %r2
	mov 0x6, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_90:
	nop
	setx 0xfffff6f9fffffd93, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0x919133a2  ! 133: WRPR_PIL_I	wrpr	%r4, 0x13a2, %pil
mondo_2_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d910012  ! 134: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
mondo_2_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d924012  ! 135: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a00174  ! 137: FABSq	dis not found

	.word 0x9f803486  ! 138: SIR	sir	0x1486
jmptr_2_94:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc36c791a  ! 141: PREFETCH_I	prefetch	[%r17 + 0xfffff91a], #one_read
splash_lsu_2_95:
	ta T_CHANGE_HPRIV
	set 0x9e5f6733, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_2_96:
	nop
	setx 0xfffff1fcfffff23a, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_2_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_97:
	mov 0x4f2, %r20
	mov 0x13, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd8dfc021  ! 144: LDXA_R	ldxa	[%r31, %r1] 0x01, %r12
	.word 0xd897e030  ! 145: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x9b500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_98) + 48, 16, 16)) -> intp(2,0,5)
intvec_2_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a4c9d0  ! 148: FDIVd	fdivd	%f50, %f16, %f16
splash_tba_2_99:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d910009  ! 150: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
splash_hpstate_2_101:
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x81982e8f  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
	rd %pc, %r19
	add %r19, (ivw_2_102-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_102:
	.word 0x9192c008  ! 152: WRPR_PIL_R	wrpr	%r11, %r8, %pil
mondo_2_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948012  ! 153: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x21400001  ! 1: FBPN	fbn,a,pn	%fcc0, <label_0x1>
	.word 0x8d90317c  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x117c, %pstate
	.word 0xc19fc2c0  ! 155: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x9f8031b4  ! 156: SIR	sir	0x11b4
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_2_106:
	setx 0x478a8ed61c432dc4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_107:
	set 0x60340000, %r31
	.word 0x8582a00b  ! 159: WRCCR_I	wr	%r10, 0x000b, %ccr
	.word 0xe1bfe080  ! 160: STDFA_I	stda	%f16, [0x0080, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_108)+8, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_108:
	.word 0xa9837289  ! 161: WR_SET_SOFTINT_I	wr	%r13, 0x1289, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_2_111:
	nop
	setx 0xfffff710fffffad0, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe0ef  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x00ef]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_112
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_112:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 167: RDPC	rd	%pc, %r17
	.word 0x9ba00162  ! 168: FABSq	dis not found

	.word 0x9b50c000  ! 169: RDPR_TT	<illegal instruction>
mondo_2_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 170: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
	.word 0x93a00172  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_114
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_114:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 172: RDPC	rd	%pc, %r8
intveclr_2_115:
	setx 0xc0ae5d4521a176bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_116-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_116:
	.word 0x91940003  ! 174: WRPR_PIL_R	wrpr	%r16, %r3, %pil
	setx 0xe5cdd9ce6efb3e34, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe3e7c020  ! 176: CASA_I	casa	[%r31] 0x 1, %r0, %r17
mondo_2_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d934014  ! 177: WRPR_WSTATE_R	wrpr	%r13, %r20, %wstate
pmu_2_120:
	nop
	setx 0xfffff82ffffff880, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe010  ! 179: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_121
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_121:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 180: RDPC	rd	%pc, %r13
change_to_randtl_2_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_122:
	.word 0x8f902001  ! 181: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_hpstate_2_123:
	.word 0x81982ccf  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccf, %hpstate
DS_2_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xed721587	! Random illegal ?
	.word 0x91a189c4  ! 1: FDIVd	fdivd	%f6, %f4, %f8
	.word 0x9ba2c831  ! 183: FADDs	fadds	%f11, %f17, %f13
	.word 0x93d02034  ! 184: Tcc_I	tne	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_125
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_125:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 185: RDPC	rd	%pc, %r12
DS_2_126:
	.word 0xa3a1c9c9  ! 1: FDIVd	fdivd	%f38, %f40, %f48
	allclean
	.word 0xa5b34306  ! 186: ALIGNADDRESS	alignaddr	%r13, %r6, %r18
	.word 0x93d02032  ! 187: Tcc_I	tne	icc_or_xcc, %r0 + 50
intveclr_2_127:
	setx 0x8ef1cee0a37d0f52, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab84756f  ! 189: WR_CLEAR_SOFTINT_I	wr	%r17, 0x156f, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_128) + 16, 16, 16)) -> intp(3,0,26)
intvec_2_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_129:
	nop
	setx 0xfffffd1afffffae0, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe0cd  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x00cd]
	rd %pc, %r19
	add %r19, (ivw_2_130-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_130:
	.word 0x9190400b  ! 193: WRPR_PIL_R	wrpr	%r1, %r11, %pil
	.word 0xc19fd920  ! 194: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad8421ca  ! 196: WR_SOFTINT_REG_I	wr	%r16, 0x01ca, %softint
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe031  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x0031]
intveclr_2_132:
	setx 0x7bc4b8e095525172, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_133)+8, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_133:
	.word 0xa980e7aa  ! 200: WR_SET_SOFTINT_I	wr	%r3, 0x07aa, %set_softint
	.word 0x8d903897  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1897, %pstate
jmptr_2_135:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d9026ec  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x06ec, %pstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x91d020b2  ! 205: Tcc_I	ta	icc_or_xcc, %r0 + 178
debug_2_138:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 206: CASA_R	casa	[%r31] %asi, %r1, %r12
memptr_2_139:
	set 0x60740000, %r31
	.word 0x858427a2  ! 207: WRCCR_I	wr	%r16, 0x07a2, %ccr
	.word 0xa3a489d4  ! 208: FDIVd	fdivd	%f18, %f20, %f48
splash_hpstate_2_140:
	.word 0x2cc8c001  ! 1: BRGZ	brgz,a,pt	%r3,<label_0x8c001>
	.word 0x81982187  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0187, %hpstate
	.word 0x83d02033  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x532e30f3e384c945, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_142)+24, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_142:
	.word 0xa981bef6  ! 214: WR_SET_SOFTINT_I	wr	%r6, 0x1ef6, %set_softint
DS_2_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f24, %f2
	.word 0xa9b50313  ! 215: ALIGNADDRESS	alignaddr	%r20, %r19, %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_144:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 216: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_2_145-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_145:
	.word 0x91944002  ! 217: WRPR_PIL_R	wrpr	%r17, %r2, %pil
	.word 0xa7b287e7  ! 218: PDISTN	fmean16	%d10, %d38, %d50
debug_2_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_2_146:
	mov 0xbde, %r20
	mov 0x18, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe73fc002  ! 219: STDF_R	std	%f19, [%r2, %r31]
	.word 0xe71fe000  ! 220: LDDF_I	ldd	[%r31, 0x0000], %f19
	.word 0xc19fc3e0  ! 221: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xd4049d9658c1f217, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36c30e3  ! 223: PREFETCH_I	prefetch	[%r16 + 0xfffff0e3], #one_read
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
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0x99b347f1  ! 225: PDISTN	fmean16	%d44, %d48, %d12
mondo_2_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d948010  ! 226: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe4dfe028  ! 227: LDXA_I	ldxa	[%r31, + 0x0028] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_150)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_150:
	.word 0xa980e572  ! 229: WR_SET_SOFTINT_I	wr	%r3, 0x0572, %set_softint
	.word 0xe46fe044  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x0044]
mondo_2_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d940010  ! 231: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
jmptr_2_152:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0xe6202529b6f92534, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1344004  ! 1: STQF_R	-	%f16, [%r4, %r17]
	normalw
	.word 0x95458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x9f802e13  ! 235: SIR	sir	0x0e13
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_2_155:
	nop
	setx 0xfffff2e2fffff11e, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d904003  ! 239: WRPR_WSTATE_R	wrpr	%r1, %r3, %wstate
debug_2_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_2_157:
	mov 0x51a, %r20
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
	.word 0xe73fc014  ! 240: STDF_R	std	%f19, [%r20, %r31]
	.word 0x8d9027d7  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x07d7, %pstate
mondo_2_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d94c014  ! 242: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f802a32  ! 244: SIR	sir	0x0a32
	.word 0x9ba00172  ! 245: FABSq	dis not found

intveclr_2_161:
	setx 0x0382775b9ccc558d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_162:
	nop
	setx 0xfffffe7efffff564, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_2_163:
	setx 0xb3fd487b4cbe3261, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe43fc000  ! 250: STD_R	std	%r18, [%r31 + %r0]
debug_2_165:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xe49fc033  ! 251: LDDA_R	ldda	[%r31, %r19] 0x01, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_166) + 0, 16, 16)) -> intp(3,0,5)
intvec_2_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_167:
	setx 0xb1e935289fcb26c8, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_2_168:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_2_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d94c009  ! 255: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
jmptr_2_170:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
	rd %pc, %r19
	add %r19, (ivw_2_171-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_171:
	.word 0x9191c012  ! 257: WRPR_PIL_R	wrpr	%r7, %r18, %pil
	.word 0x9ba349c9  ! 258: FDIVd	fdivd	%f44, %f40, %f44
mondo_2_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d914014  ! 259: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_173
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_173:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 260: RDPC	rd	%pc, %r18
splash_lsu_2_174:
	ta T_CHANGE_HPRIV
	set 0x3f24de82, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0xc3e94034  ! 263: PREFETCHA_R	prefetcha	[%r5, %r20] 0x01, #one_read
	.word 0xe1bfd920  ! 264: STDFA_R	stda	%f16, [%r0, %r31]
intveclr_2_176:
	setx 0x5d5b96a320e3c96f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e06c  ! 266: STX_I	stx	%r20, [%r31 + 0x006c]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_2_178:
	nop
	setx 0xfffff13cfffff07c, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe80fe000  ! 272: LDUB_I	ldub	[%r31 + 0x0000], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_180)+16, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_180:
	.word 0xa9836137  ! 273: WR_SET_SOFTINT_I	wr	%r13, 0x0137, %set_softint
jmptr_2_181:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_2_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e83433  ! 277: PREFETCHA_I	prefetcha	[%r0, + 0xfffff433] %asi, #one_read
	.word 0x97b18985  ! 278: BSHUFFLE	fmovc32	%d6, %d36, %d42
	.word 0x99a409d0  ! 279: FDIVd	fdivd	%f16, %f16, %f12
	.word 0xe26fe00d  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x000d]
	setx 0xb1156305ff442550, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_186:
	.word 0x819826b7  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06b7, %hpstate
cwp_2_187:
    set user_data_start, %o7
	.word 0x93902000  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_2_188:
	setx 0xef74464cc7a16f5a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe0bb  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x00bb]
	.word 0x91d020b3  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 179
intveclr_2_189:
	setx 0xd86eaaff62ec3b23, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914014  ! 288: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
fpinit_2_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 289: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_192) + 0, 16, 16)) -> intp(1,0,28)
intvec_2_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_193:
	nop
	setx 0xfffff17bfffffb2b, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_2_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a1c9d1  ! 293: FDIVd	fdivd	%f38, %f48, %f48
fpinit_2_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 294: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x9194a213  ! 295: WRPR_PIL_I	wrpr	%r18, 0x0213, %pil
	.word 0x91d02035  ! 296: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xc36fe030  ! 299: PREFETCH_I	prefetch	[%r31 + 0x0030], #one_read
fpinit_2_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 300: FDIVs	fdivs	%f0, %f4, %f6
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 301: Tcc_R	te	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 302: RDPC	rd	%pc, %r19
splash_lsu_2_199:
	ta T_CHANGE_HPRIV
	set 0xbd4c6862, %r2
	mov 0x1, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d90c012  ! 304: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
memptr_2_201:
	set user_data_start, %r31
	.word 0x8584a25c  ! 305: WRCCR_I	wr	%r18, 0x025c, %ccr
	.word 0x9f8039d7  ! 306: SIR	sir	0x19d7
splash_lsu_2_202:
	ta T_CHANGE_HPRIV
	set 0xd4c7eedb, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802785  ! 308: SIR	sir	0x0785
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_203
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_203:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 309: RDPC	rd	%pc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_204) + 24, 16, 16)) -> intp(7,0,2)
intvec_2_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_205
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 311: RDPC	rd	%pc, %r17
mondo_2_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d910013  ! 312: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
cwp_2_207:
    set user_data_start, %o7
	.word 0x93902003  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d950008  ! 315: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc3ecc025  ! 317: PREFETCHA_R	prefetcha	[%r19, %r5] 0x01, #one_read
	.word 0xd91fe000  ! 318: LDDF_I	ldd	[%r31, 0x0000], %f12
	.word 0xe1bfde00  ! 319: STDFA_R	stda	%f16, [%r0, %r31]
memptr_2_210:
	set user_data_start, %r31
	.word 0x8580b5da  ! 320: WRCCR_I	wr	%r2, 0x15da, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_2_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x99a4c9d1  ! 1: FDIVd	fdivd	%f50, %f48, %f12
	.word 0x9ba48833  ! 322: FADDs	fadds	%f18, %f19, %f13
	.word 0xe137e090  ! 323: STQF_I	-	%f16, [0x0090, %r31]
pmu_2_212:
	nop
	setx 0xfffff500ffffff60, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f803484  ! 325: SIR	sir	0x1484
mondo_2_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d948014  ! 326: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xa66c8013  ! 327: UDIVX_R	udivx 	%r18, %r19, %r19
	.word 0x9f803ccf  ! 328: SIR	sir	0x1ccf
	.word 0xc1bfd960  ! 329: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0x9745c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xe137e0a1  ! 331: STQF_I	-	%f16, [0x00a1, %r31]
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 332: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa5a249d1  ! 333: FDIVd	fdivd	%f40, %f48, %f18
	.word 0x83d02034  ! 334: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x99500000  ! 335: RDPR_TPC	<illegal instruction>
intveclr_2_214:
	setx 0x6137c4a5676e9133, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 181
	rd %pc, %r19
	add %r19, (ivw_2_215-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_215:
	.word 0x91944010  ! 338: WRPR_PIL_R	wrpr	%r17, %r16, %pil
	.word 0xa7a289cd  ! 339: FDIVd	fdivd	%f10, %f44, %f50
	.word 0xa7464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r19
pmu_2_216:
	nop
	setx 0xfffffbaefffff6fe, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_218) + 8, 16, 16)) -> intp(3,0,6)
intvec_2_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_219
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_219:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 344: RDPC	rd	%pc, %r12
splash_htba_2_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0xa345c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0xe1bfdc00  ! 347: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0x9ba449c7  ! 348: FDIVd	fdivd	%f48, %f38, %f44
	setx 0x3c9ef2e59d04c39d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe030  ! 350: LDDA_I	ldda	[%r31, + 0x0030] %asi, %r13
mondo_2_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d908014  ! 351: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_2_223:
	set 0x60140000, %r31
	.word 0x8584700f  ! 353: WRCCR_I	wr	%r17, 0x100f, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe050  ! 355: STDA_I	stda	%r13, [%r31 + 0x0050] %asi
pmu_2_224:
	nop
	setx 0xfffff9fcfffffd8e, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0xa7b20494  ! 358: FCMPLE32	fcmple32	%d8, %d20, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_225)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_225:
	.word 0xa9826baf  ! 359: WR_SET_SOFTINT_I	wr	%r9, 0x0baf, %set_softint
	.word 0x9f80304f  ! 360: SIR	sir	0x104f
intveclr_2_226:
	setx 0xa2ada5122cd9c5ae, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_2_228:
	set user_data_start, %r31
	.word 0x8584724a  ! 363: WRCCR_I	wr	%r17, 0x124a, %ccr
	.word 0x91d02035  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc3e98030  ! 365: PREFETCHA_R	prefetcha	[%r6, %r16] 0x01, #one_read
	.word 0x9f8025d4  ! 366: SIR	sir	0x05d4
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_229)+48, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_229:
	.word 0xa9817c67  ! 367: WR_SET_SOFTINT_I	wr	%r5, 0x1c67, %set_softint
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_230:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 368: RDPC	rd	%pc, %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0x97a00161  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_2_232-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_232:
	.word 0x91944001  ! 372: WRPR_PIL_R	wrpr	%r17, %r1, %pil
splash_decr_2_233:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7848013  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r19, %-
DS_2_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	.word 0x8d903267  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x1267, %pstate
intveclr_2_237:
	setx 0x324e6934b437adf5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a409d4  ! 378: FDIVd	fdivd	%f16, %f20, %f50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_238) + 24, 16, 16)) -> intp(4,0,12)
intvec_2_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_2_239:
	.word 0x99a509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f12
	.word 0xd1312e8a  ! 1: STQF_I	-	%f8, [0x0e8a, %r4]
	normalw
	.word 0xa9458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r20
splash_hpstate_2_240:
	.word 0x8198249e  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049e, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_242
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_242:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 383: RDPC	rd	%pc, %r8
	.word 0xe127e03e  ! 384: STF_I	st	%f16, [0x003e, %r31]
DS_2_243:
	.word 0xa5a0c9d2  ! 1: FDIVd	fdivd	%f34, %f18, %f18
	.word 0xd9332ada  ! 1: STQF_I	-	%f12, [0x0ada, %r12]
	normalw
	.word 0xa7458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r19
fpinit_2_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 386: FDIVd	fdivd	%f0, %f4, %f6
	.word 0xc19fc3e0  ! 387: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d020b5  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_2_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 389: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_246) + 8, 16, 16)) -> intp(1,0,30)
intvec_2_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_247
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_247:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 391: RDPC	rd	%pc, %r9
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_248:
	setx 0x95baa4c1456ffef2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_249-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_249:
	.word 0x91918001  ! 394: WRPR_PIL_R	wrpr	%r6, %r1, %pil
	.word 0xe62fe0ad  ! 395: STB_I	stb	%r19, [%r31 + 0x00ad]
fpinit_2_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 396: FCMPLE32	fcmple32	%d0, %d4, %r4
mondo_2_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d8] %asi
	.word 0x9d94c001  ! 397: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
DS_2_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3348014  ! 1: STQF_R	-	%f17, [%r20, %r18]
	normalw
	.word 0xa5458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xc1bfe040  ! 399: STDFA_I	stda	%f0, [0x0040, %r31]
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_2_253:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_254
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_254:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 402: RDPC	rd	%pc, %r18
fpinit_2_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82503  ! 403: PREFETCHA_I	prefetcha	[%r0, + 0x0503] %asi, #one_read
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
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
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd28008a0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9b45c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xe8dfe038  ! 407: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r20
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 408: Tcc_R	te	icc_or_xcc, %r0 + %r30
pmu_2_257:
	nop
	setx 0xfffff3e9fffff202, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_2_258:
	ta T_CHANGE_HPRIV
	set 0x14adaf21, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_259:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_2_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r11, [%r1] 0x45
	.word 0xa7850011  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r17, %-
	.word 0x9f80310c  ! 413: SIR	sir	0x110c
memptr_2_261:
	set user_data_start, %r31
	.word 0x8581228b  ! 414: WRCCR_I	wr	%r4, 0x028b, %ccr
mondo_2_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d948012  ! 415: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x8d9032da  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x12da, %pstate
	.word 0x9ba00161  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_264
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_264:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 418: RDPC	rd	%pc, %r9
pmu_2_265:
	nop
	setx 0xfffff83dffffffc2, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b5  ! 420: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xa5a449d1  ! 421: FDIVd	fdivd	%f48, %f48, %f18
	.word 0xe427e001  ! 422: STW_I	stw	%r18, [%r31 + 0x0001]
	rd %pc, %r19
	add %r19, (ivw_2_266-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_266:
	.word 0x91948014  ! 423: WRPR_PIL_R	wrpr	%r18, %r20, %pil
	.word 0xa3500000  ! 424: RDPR_TPC	<illegal instruction>
	.word 0xd7e7c020  ! 425: CASA_I	casa	[%r31] 0x 1, %r0, %r11
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_268) + 24, 16, 16)) -> intp(7,0,30)
intvec_2_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_2_269:
	setx 0x12b755ab0a069ec7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_270:
	set user_data_start, %r31
	.word 0x8581af49  ! 429: WRCCR_I	wr	%r6, 0x0f49, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_271:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 430: RDPC	rd	%pc, %r12
    set 0x28ed, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407f3  ! 431: PDISTN	fmean16	%d16, %d50, %d40
	.word 0x91d020b4  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_272
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 433: RDPC	rd	%pc, %r18
	.word 0x93d02033  ! 434: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa5a00162  ! 435: FABSq	dis not found

splash_hpstate_2_273:
	.word 0x24ca4001  ! 1: BRLEZ	brlez,a,pt	%r9,<label_0xa4001>
	.word 0x81982bb5  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bb5, %hpstate
intveclr_2_274:
	setx 0x09aed8b4429bfa7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe010  ! 438: LDD_I	ldd	[%r31 + 0x0010], %r20
	rd %pc, %r19
	add %r19, (ivw_2_275-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_275:
	.word 0x91948013  ! 439: WRPR_PIL_R	wrpr	%r18, %r19, %pil
donret_2_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_276-donret_2_276-8), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00da08eb | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x3cc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_276:
	.word 0xe8ffe0c8  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x00c8] %asi
splash_hpstate_2_277:
	.word 0x819822dd  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0x81e6b13e2eedfaca, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_280:
	nop
	setx 0xfffffcf7fffffcd5, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_2_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_281:
	.word 0x8f902000  ! 445: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_2_282:
	setx 0x21ebaf49751e2e15, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe19fd920  ! 447: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe93fe020  ! 448: STDF_I	std	%f20, [0x0020, %r31]
	.word 0xe19fda00  ! 449: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe8dfe018  ! 450: LDXA_I	ldxa	[%r31, + 0x0018] %asi, %r20
	.word 0x24c9c001  ! 1: BRLEZ	brlez,a,pt	%r7,<label_0x9c001>
	.word 0x8d903423  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x1423, %pstate
	.word 0x39400001  ! 452: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	.word 0xd3e7c020  ! 454: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x93a209d2  ! 455: FDIVd	fdivd	%f8, %f18, %f40
splash_cmpr_2_285:
	setx 0xf240833e4a537fed, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_2_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d950014  ! 457: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
	.word 0xc1bfdf20  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fe080  ! 459: LDDFA_I	ldda	[%r31, 0x0080], %f16
pmu_2_287:
	nop
	setx 0xfffffc03fffff23d, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_2_288:
	.word 0xa7a009d0  ! 1: FDIVd	fdivd	%f0, %f16, %f50
	allclean
	.word 0x97b0c305  ! 461: ALIGNADDRESS	alignaddr	%r3, %r5, %r11
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 462: Tcc_R	te	icc_or_xcc, %r0 + %r30
	setx 0xc24cb2c0ae6f5c9c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_290)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_290:
	.word 0xa984b4d4  ! 464: WR_SET_SOFTINT_I	wr	%r18, 0x14d4, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_291)+16, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_291:
	.word 0xa9852b3b  ! 465: WR_SET_SOFTINT_I	wr	%r20, 0x0b3b, %set_softint
	.word 0xe20fe018  ! 466: LDUB_I	ldub	[%r31 + 0x0018], %r17
	.word 0xa3540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0xa150c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_292
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_292:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 469: RDPC	rd	%pc, %r12
	.word 0x9f803095  ! 470: SIR	sir	0x1095
intveclr_2_293:
	setx 0xf7b14ed7410bdabf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_2_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 472: FCMPd	fcmpd	%fcc<n>, %f0, %f4
pmu_2_295:
	nop
	setx 0xfffff9effffff9f2, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_2_296:
	.word 0x8198269d  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069d, %hpstate
donret_2_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_297-donret_2_297-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00fde6b4 | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb8d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_297:
	.word 0xe2ffe086  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x0086] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93d02035  ! 477: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_2_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9628d89	! Random illegal ?
	.word 0xd7140012  ! 1: LDQF_R	-	[%r16, %r18], %f11
	.word 0xa7a48831  ! 478: FADDs	fadds	%f18, %f17, %f19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0x91b48994  ! 480: BSHUFFLE	fmovc32	%d18, %d20, %d8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_2_302:
	setx 0x07c921c20ab44e8a, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe08e  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x008e]
	.word 0x9f802990  ! 484: SIR	sir	0x0990
	setx 0x4adc023466a33f5d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a049d4  ! 486: FDIVd	fdivd	%f32, %f20, %f20
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x8d9034df  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x14df, %pstate
	.word 0xa37039d5  ! 489: POPC_I	popc	0x19d5, %r17
	.word 0x9ba00164  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_305
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_305:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 491: RDPC	rd	%pc, %r20
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_306:
	setx 0x752ef2620d84d3fe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803984  ! 495: SIR	sir	0x1984
	.word 0xa5a00169  ! 496: FABSq	dis not found

	.word 0xa1a4c9b1  ! 497: FDIVs	fdivs	%f19, %f17, %f16
	.word 0xc19fe000  ! 498: LDDFA_I	ldda	[%r31, 0x0000], %f0
	.word 0xd64fe010  ! 499: LDSB_I	ldsb	[%r31 + 0x0010], %r11
	.word 0xa3b44992  ! 500: BSHUFFLE	fmovc32	%d48, %d18, %d48
	.word 0xa7a0016a  ! 501: FABSq	dis not found

DS_2_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_2_309:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9750c000  ! 504: RDPR_TT	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f80346b  ! 506: SIR	sir	0x146b
jmptr_2_311:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_312
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_312:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 508: RDPC	rd	%pc, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xe19fd960  ! 510: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_314) + 32, 16, 16)) -> intp(7,0,15)
intvec_2_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_2_315:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_2_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x815b9d5d	! Random illegal ?
	.word 0x91a00547  ! 1: FSQRTd	fsqrt	
	.word 0x93a40826  ! 513: FADDs	fadds	%f16, %f6, %f9
memptr_2_317:
	set 0x60340000, %r31
	.word 0x8584ec64  ! 514: WRCCR_I	wr	%r19, 0x0c64, %ccr
splash_lsu_2_318:
	ta T_CHANGE_HPRIV
	set 0xadf4f4e1, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xd61d8603a7099c0c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_2_320:
	setx 0xd6568182ea0b88ac, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_2_321:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd2dfc02d  ! 519: LDXA_R	ldxa	[%r31, %r13] 0x01, %r9
memptr_2_322:
	set 0x60140000, %r31
	.word 0x85813866  ! 520: WRCCR_I	wr	%r4, 0x1866, %ccr
	.word 0xd25fe028  ! 521: LDX_I	ldx	[%r31 + 0x0028], %r9
fpinit_2_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 522: FDIVd	fdivd	%f0, %f4, %f4
	.word 0x91d02032  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_2_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_324:
	.word 0x8f902001  ! 524: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xab84c007  ! 525: WR_CLEAR_SOFTINT_R	wr	%r19, %r7, %clear_softint
	.word 0xd26fe01e  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x001e]
	setx 0xedce4a5b4782017d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	rd %pc, %r19
	add %r19, (ivw_2_326-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_326:
	.word 0x91914014  ! 528: WRPR_PIL_R	wrpr	%r5, %r20, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 531: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_2_327:
	nop
	ta T_CHANGE_HPRIV
	ta T_CHANGE_NONHPRIV
	.word 0xd297c020  ! 532: LDUHA_R	lduha	[%r31, %r0] 0x01, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_328
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_328:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 533: RDPC	rd	%pc, %r19
	.word 0xe26fe0e7  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x00e7]
	.word 0xa3520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	.word 0x8d903ee8  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x1ee8, %pstate
mondo_2_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d944011  ! 537: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0x9f802b4d  ! 538: SIR	sir	0x0b4d
mondo_2_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d908014  ! 539: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_2_332:
	setx 0xf8310c0ddf973004, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_2_333:
	setx 0x1061516cbd7adaa5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_334
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_334:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 544: RDPC	rd	%pc, %r12
pmu_2_335:
	nop
	setx 0xfffffc11fffffc57, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_2_336:
	setx 0xe68fba3f5cee2db2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_337:
	setx 0x8fbecb2a7a610b55, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 181
	rd %pc, %r19
	add %r19, (ivw_2_338-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_338:
	.word 0x9194400c  ! 549: WRPR_PIL_R	wrpr	%r17, %r12, %pil
splash_lsu_2_339:
	ta T_CHANGE_HPRIV
	set 0xa47a81e3, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d904010  ! 551: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xe19fe020  ! 552: LDDFA_I	ldda	[%r31, 0x0020], %f16
	setx 0x73ea90a3ccf04b3a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe030  ! 554: LDUB_I	ldub	[%r31 + 0x0030], %r9
	.word 0x8d9036d9  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x16d9, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_2_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_343-donret_2_343-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x002f5d1e | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xf87, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_343:
	.word 0xd2ffe0dc  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x00dc] %asi
	.word 0x8d9037aa  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x17aa, %pstate
mondo_2_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d948008  ! 559: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
splash_lsu_2_346:
	ta T_CHANGE_HPRIV
	set 0x7d39ac41, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa4ab4014  ! 561: ANDNcc_R	andncc 	%r13, %r20, %r18
jmptr_2_347:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_2_348:
	setx 0x69f199737198f66e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_2_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe22fe0bd  ! 565: STB_I	stb	%r17, [%r31 + 0x00bd]
	.word 0xe1bfd920  ! 566: STDFA_R	stda	%f16, [%r0, %r31]
tagged_2_350:
	tsubcctv %r16, 0x19c3, %r17
	.word 0xe207e06c  ! 567: LDUW_I	lduw	[%r31 + 0x006c], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_2_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_352
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_352:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 569: RDPC	rd	%pc, %r13
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_2_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 571: FDIVs	fdivs	%f0, %f4, %f4
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
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
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_2_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d90c00c  ! 574: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	.word 0xc36fe05e  ! 575: PREFETCH_I	prefetch	[%r31 + 0x005e], #one_read
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_360)+32, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_360:
	.word 0xa9807720  ! 577: WR_SET_SOFTINT_I	wr	%r1, 0x1720, %set_softint
memptr_2_361:
	set 0x60340000, %r31
	.word 0x8585358e  ! 578: WRCCR_I	wr	%r20, 0x158e, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_2_362:
	.word 0x81982c56  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c56, %hpstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_2_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 582: FCMPd	fcmpd	%fcc<n>, %f0, %f4
	.word 0xab84c014  ! 583: WR_CLEAR_SOFTINT_R	wr	%r19, %r20, %clear_softint
	.word 0xab81b24b  ! 584: WR_CLEAR_SOFTINT_I	wr	%r6, 0x124b, %clear_softint
pmu_2_364:
	nop
	setx 0xfffffeacfffffc09, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_365
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_365:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 586: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_366
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_366:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 587: RDPC	rd	%pc, %r20
change_to_randtl_2_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_367:
	.word 0x8f902002  ! 588: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
invtsb_2_368:
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
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0xa3a00172  ! 590: FABSq	dis not found

	.word 0xd037e0de  ! 591: STH_I	sth	%r8, [%r31 + 0x00de]
	rd %pc, %r19
	add %r19, (ivw_2_369-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_369:
	.word 0x9191c012  ! 592: WRPR_PIL_R	wrpr	%r7, %r18, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_2_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 594: FCMPd	fcmpd	%fcc<n>, %f0, %f4
mondo_2_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d95000a  ! 595: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
	.word 0xd04fe018  ! 596: LDSB_I	ldsb	[%r31 + 0x0018], %r8
DS_2_372:
	.word 0xa3a189d2  ! 1: FDIVd	fdivd	%f6, %f18, %f48
	allclean
	.word 0xa1b24305  ! 597: ALIGNADDRESS	alignaddr	%r9, %r5, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_373
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_373:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 598: RDPC	rd	%pc, %r10
mondo_2_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d950010  ! 599: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
DS_2_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc1bfe0c0  ! 601: STDFA_I	stda	%f0, [0x00c0, %r31]
pmu_2_376:
	nop
	setx 0xfffff187fffff910, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_2_377:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_378:
	ta T_CHANGE_PRIV
	setx 0x00000004003a0000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_2_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d920013  ! 607: WRPR_WSTATE_R	wrpr	%r8, %r19, %wstate
	.word 0xe19fd960  ! 608: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91d020b5  ! 609: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_2_380:
	setx 0x9c3238bcd9f12685, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0xd35f64f0712fea51, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a00167  ! 613: FABSq	dis not found

splash_cmpr_2_382:
	setx 0x384764a5219a1c50, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_2_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 615: FDIVs	fdivs	%f0, %f4, %f4
jmptr_2_384:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe19fc2c0  ! 617: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe1e7c020  ! 618: CASA_I	casa	[%r31] 0x 1, %r0, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_386
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_386:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 619: RDPC	rd	%pc, %r17
pmu_2_387:
	nop
	setx 0xfffffdb6fffffd87, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_388
    set CWQ_BASE, %l6
    best_set_reg(0x20610060, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_388:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 621: RDPC	rd	%pc, %r9
pmu_2_389:
	nop
	setx 0xfffffbbbfffffbf8, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe046  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x0046]
fpinit_2_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009c4  ! 624: FDIVd	fdivd	%f0, %f4, %f8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99a2c9d0  ! 626: FDIVd	fdivd	%f42, %f16, %f12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_2_391:
	nop
	setx 0xfffff46cfffff8dc, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9a509c4  ! 629: FDIVd	fdivd	%f20, %f4, %f20
	.word 0xe4bfe0ad  ! 630: STDA_I	stda	%r18, [%r31 + 0x00ad] %asi
	.word 0xc1bfe020  ! 631: STDFA_I	stda	%f0, [0x0020, %r31]
	.word 0xe527e0f8  ! 632: STF_I	st	%f18, [0x00f8, %r31]
tagged_2_392:
	tsubcctv %r17, 0x173a, %r10
	.word 0xe407e0fc  ! 633: LDUW_I	lduw	[%r31 + 0x00fc], %r18
	.word 0xa5a00171  ! 634: FABSq	dis not found

	.word 0xe1bfe040  ! 635: STDFA_I	stda	%f16, [0x0040, %r31]
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 636: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9ba4c9a3  ! 637: FDIVs	fdivs	%f19, %f3, %f13
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_395:
	setx 0x45ee88e409385982, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 641: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_decr_2_396:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7850007  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_397-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_397:
	.word 0x91940003  ! 643: WRPR_PIL_R	wrpr	%r16, %r3, %pil
	.word 0xe0d7e010  ! 644: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_2_399:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_2_400:
	.word 0x3b400001  ! 1: FBPLE	fble,a,pn	%fcc0, <label_0x1>
	.word 0x81982e06  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_2_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d940014  ! 649: WRPR_WSTATE_R	wrpr	%r16, %r20, %wstate
	.word 0x93a509d2  ! 650: FDIVd	fdivd	%f20, %f18, %f40
	.word 0x95a00170  ! 651: FABSq	dis not found

mondo_2_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d928014  ! 652: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xe1bfe060  ! 654: STDFA_I	stda	%f16, [0x0060, %r31]
	setx 0xaf3f2a1fd4c250a0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_406:
	setx 0xee9f97250cb42357, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_2_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d924011  ! 657: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0xe06fe01a  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x001a]
splash_cmpr_2_408:
	setx 0xedc319602d0991b6, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_409
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_409:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 660: RDPC	rd	%pc, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_410) + 16, 16, 16)) -> intp(0,0,30)
intvec_2_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f80249b  ! 663: SIR	sir	0x049b
DS_2_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x91a089d3  ! 1: FDIVd	fdivd	%f2, %f50, %f8
	.word 0xa5a00552  ! 1: FSQRTd	fsqrt	
	.word 0xa7a5082a  ! 664: FADDs	fadds	%f20, %f10, %f19
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd83fe0ae  ! 667: STD_I	std	%r12, [%r31 + 0x00ae]
mondo_2_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 668: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
mondo_2_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d94c010  ! 669: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xa5a00170  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_414) + 16, 16, 16)) -> intp(6,0,22)
intvec_2_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a509c6  ! 673: FDIVd	fdivd	%f20, %f6, %f12
	.word 0xa9b304c4  ! 674: FCMPNE32	fcmpne32	%d12, %d4, %r20
	.word 0xe9e7c020  ! 675: CASA_I	casa	[%r31] 0x 1, %r0, %r20
splash_lsu_2_416:
	ta T_CHANGE_HPRIV
	set 0x6f5375d5, %r2
	mov 0x4, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_2_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950012  ! 677: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xe88fe000  ! 678: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
cwp_2_418:
    set user_data_start, %o7
	.word 0x93902007  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99a089c4  ! 680: FDIVd	fdivd	%f2, %f4, %f12
mondo_2_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d94c010  ! 681: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f803fe6  ! 683: SIR	sir	0x1fe6
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_420)+56, 16, 16)) -> intp(mask2tid(0x2),1,3)
xir_2_420:
	.word 0xa980b951  ! 684: WR_SET_SOFTINT_I	wr	%r2, 0x1951, %set_softint
pmu_2_421:
	nop
	setx 0xfffffd92fffff008, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a109ab  ! 687: FDIVs	fdivs	%f4, %f11, %f8
	rd %pc, %r19
	add %r19, (ivw_2_422-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_422:
	.word 0x91948011  ! 688: WRPR_PIL_R	wrpr	%r18, %r17, %pil
	.word 0xc19fd960  ! 689: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91952bdd  ! 690: WRPR_PIL_I	wrpr	%r20, 0x0bdd, %pil
	.word 0x99902001  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd097e038  ! 692: LDUHA_I	lduha	[%r31, + 0x0038] %asi, %r8
splash_cmpr_2_423:
	setx 0xd874c10c1d181c6f, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d902d4b  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0d4b, %pstate
	.word 0x91d020b3  ! 695: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x97a00167  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_425
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_425:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 697: RDPC	rd	%pc, %r12
	.word 0xd6d7e020  ! 698: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
pmu_2_426:
	nop
	setx 0xfffff457fffff85d, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xc19fdc00  ! 700: LDDFA_R	ldda	[%r31, %r0], %f0
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_427
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_427:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 701: RDPC	rd	%pc, %r8
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
mondo_1_0:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94c013  ! 1: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
intveclr_1_1:
	setx 0x998ce31f6bcd8513, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_2:
	setx 0x696b6145d1721645, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 3: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_3
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_3
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_3:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 5: RDPC	rd	%pc, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_4)+24, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_4:
	.word 0xa9817ce2  ! 6: WR_SET_SOFTINT_I	wr	%r5, 0x1ce2, %set_softint
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_5:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e013  ! 7: CASA_R	casa	[%r31] %asi, %r19, %r9
memptr_1_6:
	set user_data_start, %r31
	.word 0x85842029  ! 8: WRCCR_I	wr	%r16, 0x0029, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_7
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_7
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_7:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 9: RDPC	rd	%pc, %r19
	.word 0x3e800001  ! 1: BVC	bvc,a	<label_0x1>
	.word 0x8d903f88  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x1f88, %pstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_9
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_9:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 11: CASA_R	casa	[%r31] %asi, %r19, %r19
DS_1_10:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 12: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_cmpr_1_11:
	setx 0xe779a308f9d3f344, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 13: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_12) + 40, 16, 16)) -> intp(4,0,16)
intvec_1_12:
	.word 0x39400001  ! 14: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_13:
	.word 0x26800001  ! 1: BL	bl,a	<label_0x1>
	.word 0x81982c0f  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0xe1bfdc00  ! 16: STDFA_R	stda	%f16, [%r0, %r31]
pmu_1_14:
	nop
	setx 0xfffff616fffff1bf, %g1, %g7
	.word 0xa3800007  ! 17: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_15
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_15:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 18: CASA_R	casa	[%r31] %asi, %r19, %r19
fpinit_1_16:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 19: FCMPd	fcmpd	%fcc<n>, %f0, %f4
donret_1_17:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_17-donret_1_17-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00111823 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x706, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_17:
	.word 0xe6ffe054  ! 20: SWAPA_I	swapa	%r19, [%r31 + 0x0054] %asi
DS_1_18:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 21: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_19
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_19:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 22: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xe737e098  ! 23: STQF_I	-	%f19, [0x0098, %r31]
	.word 0xb1800001  ! 24: WR_STICK_REG_R	wr	%r0, %r1, %-
jmptr_1_20:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 25: JMPL_R	jmpl	%r27 + %r0, %r27
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_21
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00021fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_21:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 26: CASA_R	casa	[%r31] %asi, %r19, %r19
	.word 0xc36b67b2  ! 27: PREFETCH_I	prefetch	[%r13 + 0x07b2], #one_read
DS_1_22:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 28: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xad832c99  ! 29: WR_SOFTINT_REG_I	wr	%r12, 0x0c99, %softint
	.word 0xe19fc2c0  ! 30: LDDFA_R	ldda	[%r31, %r0], %f16
splash_hpstate_1_23:
	.word 0x81982c8c  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8c, %hpstate
	.word 0xd73fe0d8  ! 32: STDF_I	std	%f11, [0x00d8, %r31]
pmu_1_24:
	nop
	setx 0xfffff2c5fffff31e, %g1, %g7
	.word 0xa3800007  ! 33: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_25:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d940012  ! 34: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
mondo_1_26:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d93400b  ! 35: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	setx 0xb047284e60a94a8c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_27:
	.word 0x39400001  ! 36: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_28:
	.word 0x27400001  ! 1: FBPUL	fbul,a,pn	%fcc0, <label_0x1>
	.word 0x81982986  ! 37: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0986, %hpstate
jmptr_1_29:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 38: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x91b24981  ! 39: BSHUFFLE	fmovc32	%d40, %d32, %d8
	.word 0xc36ce0db  ! 40: PREFETCH_I	prefetch	[%r19 + 0x00db], #one_read
jmptr_1_31:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 41: JMPL_R	jmpl	%r27 + %r0, %r27
splash_cmpr_1_32:
	setx 0x4fe7f61a0ed0f8ee, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 42: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xd727c000  ! 43: STF_R	st	%f11, [%r0, %r31]
donret_1_33:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_33-donret_1_33-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003e06fb | (0x82 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x206, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	.word 0x2c800001  ! 1: BNEG	bneg,a	<label_0x1>
	done
donretarg_1_33:
	.word 0xd6ffe088  ! 44: SWAPA_I	swapa	%r11, [%r31 + 0x0088] %asi
debug_1_34:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_34:
	mov 0x610, %r20
	mov 0x1f, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+16), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd69fc023  ! 45: LDDA_R	ldda	[%r31, %r3] 0x01, %r11
	.word 0xb1800001  ! 46: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9bb20989  ! 47: BSHUFFLE	fmovc32	%d8, %d40, %d44
	.word 0x93a00165  ! 48: FABSq	dis not found

memptr_1_36:
	set user_data_start, %r31
	.word 0x85842456  ! 49: WRCCR_I	wr	%r16, 0x0456, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_37
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_37
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_37:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 50: RDPC	rd	%pc, %r16
DS_1_38:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 51: SAVE_R	save	%r31, %r0, %r31
intveclr_1_39:
	setx 0x652914cc8d5fc116, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 52: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
jmptr_1_40:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 53: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe06fe050  ! 54: LDSTUB_I	ldstub	%r16, [%r31 + 0x0050]
donret_1_41:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_41-donret_1_41-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0088f436 | (0x55 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0xb14, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	.word 0x2d400001  ! 1: FBPG	fbg,a,pn	%fcc0, <label_0x1>
	done
donretarg_1_41:
	.word 0xe0ffe024  ! 55: SWAPA_I	swapa	%r16, [%r31 + 0x0024] %asi
mondo_1_42:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d930006  ! 56: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
DS_1_43:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 57: RESTORE_R	restore	%r31, %r0, %r31
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_44
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_44:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e006  ! 58: CASA_R	casa	[%r31] %asi, %r6, %r16
pmu_1_45:
	nop
	setx 0xfffffd79fffffaf0, %g1, %g7
	.word 0xa3800007  ! 59: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_46:
	nop
	setx 0xfffff2aafffffcc6, %g1, %g7
	.word 0xa3800007  ! 60: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_47:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d944011  ! 61: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
	.word 0xb1800001  ! 62: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe11fc000  ! 63: LDDF_R	ldd	[%r31, %r0], %f16
memptr_1_48:
	set user_data_start, %r31
	.word 0x8584794a  ! 64: WRCCR_I	wr	%r17, 0x194a, %ccr
intveclr_1_49:
	setx 0x9e5e879086a3a127, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 65: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 66: LDSH_R	ldsh	[%r31 + %r0], %r16
unsupttte_1_50:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x5c        ! D unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x95b2848d  ! 67: FCMPLE32	fcmple32	%d10, %d44, %r10
	.word 0xd427e04c  ! 68: STW_I	stw	%r10, [%r31 + 0x004c]
splash_cmpr_1_51:
	setx 0x1fbb02e6a834bf06, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 69: WRPR_TICK_R	wrpr	%r0, %r1, %tick
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_52) + 40, 16, 16)) -> intp(2,0,15)
intvec_1_52:
	.word 0x39400001  ! 70: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_53:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f26, %f4
	.word 0xa3b48305  ! 71: ALIGNADDRESS	alignaddr	%r18, %r5, %r17
donret_1_54:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_54-donret_1_54-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x00307517 | (0x88 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x6d4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_54:
	.word 0xe2ffe0f7  ! 72: SWAPA_I	swapa	%r17, [%r31 + 0x00f7] %asi
	.word 0x99b50983  ! 73: BSHUFFLE	fmovc32	%d20, %d34, %d12
	.word 0x9f803d7a  ! 74: SIR	sir	0x1d7a
	.word 0x9f8020c2  ! 75: SIR	sir	0x00c2
fpinit_1_56:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 76: FDIVs	fdivs	%f0, %f4, %f6
	.word 0x91d02033  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd8d7e030  ! 78: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
	.word 0x8d90311c  ! 79: WRPR_PSTATE_I	wrpr	%r0, 0x111c, %pstate
jmptr_1_58:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 80: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xd93fe071  ! 81: STDF_I	std	%f12, [0x0071, %r31]
	.word 0x9b500000  ! 82: RDPR_TPC	<illegal instruction>
mondo_1_59:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d920002  ! 83: WRPR_WSTATE_R	wrpr	%r8, %r2, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_60
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_60
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_60:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 84: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_61
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_61
    set CWQ_BASE, %l6
    best_set_reg(0x20610040, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_61:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 85: RDPC	rd	%pc, %r12
	.word 0x26cb0001  ! 1: BRLZ	brlz,a,pt	%r12,<label_0xb0001>
	.word 0x8d902ec4  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x0ec4, %pstate
splash_lsu_1_63:
	ta T_CHANGE_HPRIV
	set 0x0acfb53b, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 87: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_64:
	.word 0x819825ce  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
intveclr_1_65:
	setx 0x7d68749a4bfd598e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 89: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x24c88001  ! 90: BRLEZ	brlez,a,pt	%r2,<label_0x88001>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_66) + 48, 16, 16)) -> intp(0,0,30)
intvec_1_66:
	.word 0x39400001  ! 91: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_67:
	setx 0xacf10c5786accf79, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 92: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_1_68:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_68:
	mov 0x829, %r20
	mov 0x2, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc031  ! 93: LDDA_R	ldda	[%r31, %r17] 0x01, %r9
splash_cmpr_1_69:
	setx 0x2c0d37226def81a2, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 94: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_70
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_70:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e011  ! 95: CASA_R	casa	[%r31] %asi, %r17, %r9
debug_1_71:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_71:
	mov 0xa9a, %r20
	mov 0x10, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc031  ! 96: LDDA_R	ldda	[%r31, %r17] 0x01, %r9
	.word 0x30800001  ! 97: BA	ba,a	<label_0x1>
	.word 0x95a00173  ! 98: FABSq	dis not found

pmu_1_72:
	nop
	setx 0xfffff694ffffffcb, %g1, %g7
	.word 0xa3800007  ! 99: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_73)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_73:
	.word 0xa9842bf8  ! 100: WR_SET_SOFTINT_I	wr	%r16, 0x0bf8, %set_softint
	.word 0xb1800001  ! 101: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_74:
	.word 0x93a509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f40
	pdist %f14, %f4, %f10
	.word 0xa9b2c30b  ! 102: ALIGNADDRESS	alignaddr	%r11, %r11, %r20
fpinit_1_75:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0xc3e82bf8  ! 103: PREFETCHA_I	prefetcha	[%r0, + 0x0bf8] %asi, #one_read
memptr_1_76:
	set 0x60140000, %r31
	.word 0x85826a09  ! 104: WRCCR_I	wr	%r9, 0x0a09, %ccr
	.word 0x81510000  ! 105: RDPR_TICK	rdpr	%tick, %r0
pmu_1_77:
	nop
	setx 0xfffffaa8fffff336, %g1, %g7
	.word 0xa3800007  ! 106: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_78:
	setx 0xbfd1b040b90b7b25, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 107: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 108: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_1_79:
	taddcctv %r6, 0x1f95, %r7
	.word 0xe807e072  ! 109: LDUW_I	lduw	[%r31 + 0x0072], %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02032  ! 111: Tcc_I	ta	icc_or_xcc, %r0 + 50
unsupttte_1_80:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa7b18493  ! 112: FCMPLE32	fcmple32	%d6, %d50, %r19
	.word 0xe66fe019  ! 113: LDSTUB_I	ldstub	%r19, [%r31 + 0x0019]
	.word 0x83d02034  ! 114: Tcc_I	te	icc_or_xcc, %r0 + 52
mondo_1_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90400a  ! 115: WRPR_WSTATE_R	wrpr	%r1, %r10, %wstate
splash_htba_1_82:
	ta T_CHANGE_HPRIV
	setx 0x0000000000280000, %r11, %r12
	.word 0x8b98000c  ! 116: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9f8038e9  ! 117: SIR	sir	0x18e9
	.word 0xe1bfe0a0  ! 118: STDFA_I	stda	%f16, [0x00a0, %r31]
	setx 0x0e771204059789bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 120: Tcc_R	tne	icc_or_xcc, %r0 + %r30
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_84
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_84
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_84:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 121: RDPC	rd	%pc, %r13
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 122: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x24800001  ! 1: BLE	ble,a	<label_0x1>
	.word 0x8d902bde  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x0bde, %pstate
splash_tba_1_86:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 124: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93454000  ! 125: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
pmu_1_87:
	nop
	setx 0xfffffb46fffff8e8, %g1, %g7
	.word 0xa3800007  ! 126: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_88) + 40, 16, 16)) -> intp(0,0,18)
intvec_1_88:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc1bfd920  ! 128: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xd297e018  ! 129: LDUHA_I	lduha	[%r31, + 0x0018] %asi, %r9
splash_lsu_1_89:
	ta T_CHANGE_HPRIV
	set 0x52aa63ae, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 130: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_90:
	nop
	setx 0xfffff576fffff096, %g1, %g7
	.word 0xa3800007  ! 131: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97454000  ! 132: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0x919275dc  ! 133: WRPR_PIL_I	wrpr	%r9, 0x15dc, %pil
mondo_1_91:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d90c000  ! 134: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
mondo_1_92:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 135: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_93:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0016c  ! 137: FABSq	dis not found

	.word 0x9f80226a  ! 138: SIR	sir	0x026a
jmptr_1_94:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 139: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xb1800001  ! 140: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd8380001  ! 141: STD_R	std	%r12, [%r0 + %r1]
splash_lsu_1_95:
	ta T_CHANGE_HPRIV
	set 0x6df0e5f2, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
pmu_1_96:
	nop
	setx 0xfffff5b9fffff592, %g1, %g7
	.word 0xa3800007  ! 143: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_1_97:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_97:
	mov 0x63e, %r20
	mov 0x1a, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	rd %pc, %r19
	add %r19, (64+48), %r19
	stxa %r19, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xd83ff91a  ! 144: STD_I	std	%r12, [%r31 + 0xfffff91a]
	.word 0xd897e008  ! 145: LDUHA_I	lduha	[%r31, + 0x0008] %asi, %r12
	.word 0x95500000  ! 146: RDPR_TPC	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_98) + 48, 16, 16)) -> intp(5,0,18)
intvec_1_98:
	.word 0x39400001  ! 147: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a449c7  ! 148: FDIVd	fdivd	%f48, %f38, %f40
splash_tba_1_99:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 149: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_100:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d948011  ! 150: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
splash_hpstate_1_101:
	.word 0x38800001  ! 1: BGU	bgu,a	<label_0x1>
	.word 0x819828cd  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
cmp_1_102:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_102:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_102
    nop
cmp_wait1_102:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_102
    nop
    ba,a cmp_startwait1_102
continue_cmp_1_102:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xa8, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c001  ! 152: WRPR_PIL_R	wrpr	%r19, %r1, %pil
mondo_1_103:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d94800b  ! 153: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x26cc8001  ! 1: BRLZ	brlz,a,pt	%r18,<label_0xc8001>
	.word 0x8d902585  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0585, %pstate
	.word 0xc1bfe0a0  ! 155: STDFA_I	stda	%f0, [0x00a0, %r31]
	.word 0x9f803436  ! 156: SIR	sir	0x1436
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_105
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_105:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 157: CASA_R	casa	[%r31] %asi, %r11, %r9
intveclr_1_106:
	setx 0x5cbd7a9a0f6750b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 158: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_107:
	set 0x60140000, %r31
	.word 0x8582e26e  ! 159: WRCCR_I	wr	%r11, 0x026e, %ccr
	.word 0xe1bfe020  ! 160: STDFA_I	stda	%f16, [0x0020, %r31]
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_108)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_108:
	.word 0xa98423fd  ! 161: WR_SET_SOFTINT_I	wr	%r16, 0x03fd, %set_softint
	.word 0x28700001  ! 162: BPLEU	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_109
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_109:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 163: CASA_R	casa	[%r31] %asi, %r11, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_110
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_110:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e00b  ! 164: CASA_R	casa	[%r31] %asi, %r11, %r9
pmu_1_111:
	nop
	setx 0xfffff93cfffff5a4, %g1, %g7
	.word 0xa3800007  ! 165: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd26fe006  ! 166: LDSTUB_I	ldstub	%r9, [%r31 + 0x0006]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_112
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_112
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_112:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 167: RDPC	rd	%pc, %r9
	.word 0x93a00169  ! 168: FABSq	dis not found

	.word 0xa150c000  ! 169: RDPR_TT	<illegal instruction>
mondo_1_113:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d91c004  ! 170: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0xa7a00170  ! 171: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_114
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 172: RDPC	rd	%pc, %r17
intveclr_1_115:
	setx 0x1440d758f2a76f08, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 173: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmp_1_116:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_116:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_116
    nop
cmp_wait1_116:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_116
    nop
    ba,a cmp_startwait1_116
continue_cmp_1_116:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xf4, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950004  ! 174: WRPR_PIL_R	wrpr	%r20, %r4, %pil
	setx 0xbb645631f95a692a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_117:
	.word 0x39400001  ! 175: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbe,a,pn	%fcc0,  skip_1_118
	.word 0x9ba109d2  ! 1: FDIVd	fdivd	%f4, %f18, %f44
.align 1024
skip_1_118:
	.word 0xe23fc000  ! 176: STD_R	std	%r17, [%r31 + %r0]
mondo_1_119:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 177: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
pmu_1_120:
	nop
	setx 0xfffff0c2fffff12d, %g1, %g7
	.word 0xa3800007  ! 178: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe29fe008  ! 179: LDDA_I	ldda	[%r31, + 0x0008] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_121
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_121
    set CWQ_BASE, %l6
    best_set_reg(0x206100f0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_121:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 180: RDPC	rd	%pc, %r18
change_to_randtl_1_122:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_122:
	.word 0x8f902000  ! 181: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_hpstate_1_123:
	.word 0x8198225d  ! 182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025d, %hpstate
DS_1_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8f6aae5f	! Random illegal ?
	.word 0xa3a089cd  ! 1: FDIVd	fdivd	%f2, %f44, %f48
	.word 0xa5a1882b  ! 183: FADDs	fadds	%f6, %f11, %f18
	.word 0x91d02034  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 52
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_125
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_125
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_125:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 185: RDPC	rd	%pc, %r19
DS_1_126:
	.word 0x9ba189d1  ! 1: FDIVd	fdivd	%f6, %f48, %f44
	allclean
	.word 0x99b40304  ! 186: ALIGNADDRESS	alignaddr	%r16, %r4, %r12
	.word 0x93d020b3  ! 187: Tcc_I	tne	icc_or_xcc, %r0 + 179
intveclr_1_127:
	setx 0xd614b18045ba6579, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 188: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xab843ff8  ! 189: WR_CLEAR_SOFTINT_I	wr	%r16, 0x1ff8, %clear_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_128) + 16, 16, 16)) -> intp(2,0,17)
intvec_1_128:
	.word 0x39400001  ! 190: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_129:
	nop
	setx 0xfffff4effffffd43, %g1, %g7
	.word 0xa3800007  ! 191: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd86fe09c  ! 192: LDSTUB_I	ldstub	%r12, [%r31 + 0x009c]
cmp_1_130:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_130:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_130
    nop
cmp_wait1_130:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_130
    nop
    ba,a cmp_startwait1_130
continue_cmp_1_130:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe2, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944001  ! 193: WRPR_PIL_R	wrpr	%r17, %r1, %pil
	.word 0xc19fde00  ! 194: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xd937c000  ! 195: STQF_R	-	%f12, [%r0, %r31]
	.word 0xad8361c0  ! 196: WR_SOFTINT_REG_I	wr	%r13, 0x01c0, %softint
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_131
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_131:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 197: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0xd86fe085  ! 198: LDSTUB_I	ldstub	%r12, [%r31 + 0x0085]
intveclr_1_132:
	setx 0x82c2f1cbd5131c96, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 199: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_133)+56, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_133:
	.word 0xa980a077  ! 200: WR_SET_SOFTINT_I	wr	%r2, 0x0077, %set_softint
	.word 0x8d903e1a  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x1e1a, %pstate
jmptr_1_135:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 202: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x8d902ac8  ! 203: WRPR_PSTATE_I	wrpr	%r0, 0x0ac8, %pstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_137:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e001  ! 204: CASA_R	casa	[%r31] %asi, %r1, %r12
	.word 0x83d020b5  ! 205: Tcc_I	te	icc_or_xcc, %r0 + 181
debug_1_138:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_138:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_138
    nop
debug_wait1_138:
    ld [%r23], %r16
    brnz %r16, debug_wait1_138
    nop
    ba,a debug_startwait1_138
continue_debug_1_138:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_138:
    cmp %r13, %r17
    bne,a wait_for_stat_1_138
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_138:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_138
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005098c00260,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd91fc001  ! 206: LDDF_R	ldd	[%r31, %r1], %f12
memptr_1_139:
	set 0x60140000, %r31
	.word 0x8582348a  ! 207: WRCCR_I	wr	%r8, 0x148a, %ccr
	.word 0xa1a409d3  ! 208: FDIVd	fdivd	%f16, %f50, %f16
splash_hpstate_1_140:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x81982ad4  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad4, %hpstate
	.word 0x91d02033  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 211: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	setx 0x6b766e3c1eddcf53, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_141:
	.word 0x39400001  ! 212: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 213: RD_STICK_REG	stbar
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_142)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_142:
	.word 0xa9843fa2  ! 214: WR_SET_SOFTINT_I	wr	%r16, 0x1fa2, %set_softint
DS_1_143:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f16, %f8, %f20
	.word 0x97b48301  ! 215: ALIGNADDRESS	alignaddr	%r18, %r1, %r11
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_144
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_144
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_144:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 216: RDPC	rd	%pc, %r19
cmp_1_145:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_145:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_145
    nop
cmp_wait1_145:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_145
    nop
    ba,a cmp_startwait1_145
continue_cmp_1_145:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 26, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91914000  ! 217: WRPR_PIL_R	wrpr	%r5, %r0, %pil
	.word 0xc3ed0022  ! 218: PREFETCHA_R	prefetcha	[%r20, %r2] 0x01, #one_read
debug_1_146:
	nop
	ta T_CHANGE_HPRIV
debug_dvapa_1_146:
	mov 0xcf9, %r20
	mov 0x1c, %r19
	sllx %r20, 23, %r20
	or %r19, %r20, %r19
	stxa %r19, [%g0] ASI_LSU_CONTROL
	mov 0x38, %r18
	stxa %r31, [%r18]0x58
	ta T_CHANGE_NONHPRIV
	.word 0xe63fffa2  ! 219: STD_I	std	%r19, [%r31 + 0xffffffa2]
	.word 0xe71fe028  ! 220: LDDF_I	ldd	[%r31, 0x0028], %f19
	.word 0xe19fd920  ! 221: LDDFA_R	ldda	[%r31, %r0], %f16
	setx 0x4b2dcd27a4b17634, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_147:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc36837fa  ! 223: PREFETCH_I	prefetch	[%r0 + 0xfffff7fa], #one_read
invtsb_1_148:
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
	.word 0x29800001  ! 224: FBL	fbl,a	<label_0x1>
	.word 0xa5b447f3  ! 225: PDISTN	fmean16	%d48, %d50, %d18
mondo_1_149:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d948010  ! 226: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xe4dfe008  ! 227: LDXA_I	ldxa	[%r31, + 0x0008] %asi, %r18
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_150)+0, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_150:
	.word 0xa9823cf6  ! 229: WR_SET_SOFTINT_I	wr	%r8, 0x1cf6, %set_softint
	.word 0xe46fe0e5  ! 230: LDSTUB_I	ldstub	%r18, [%r31 + 0x00e5]
mondo_1_151:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c006  ! 231: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
jmptr_1_152:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 232: JMPL_R	jmpl	%r27 + %r0, %r27
	setx 0x3de86f86ddc18450, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_153:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_154:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe9304004  ! 1: STQF_R	-	%f20, [%r4, %r1]
	normalw
	.word 0xa7458000  ! 234: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x9f80254e  ! 235: SIR	sir	0x054e
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 236: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
pmu_1_155:
	nop
	setx 0xfffffc32fffff335, %g1, %g7
	.word 0xa3800007  ! 238: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_156:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d930014  ! 239: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
debug_1_157:
	nop
	ta T_CHANGE_HPRIV
debug_iva_1_157:
	mov 0x540, %r20
	mov 0x16, %r19
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
	.word 0xe63fe54e  ! 240: STD_I	std	%r19, [%r31 + 0x054e]
	.word 0x8d902692  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x0692, %pstate
mondo_1_159:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d900011  ! 242: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_160:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e011  ! 243: CASA_R	casa	[%r31] %asi, %r17, %r19
	.word 0x9f802327  ! 244: SIR	sir	0x0327
	.word 0xa5a00173  ! 245: FABSq	dis not found

intveclr_1_161:
	setx 0xcef505cf1c278871, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 246: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_162:
	nop
	setx 0xfffffadbfffff228, %g1, %g7
	.word 0xa3800007  ! 247: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x81460000  ! 248: RD_STICK_REG	stbar
intveclr_1_163:
	setx 0xa71f6bcfd3d1a2b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 249: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	be  	 skip_1_164
	fbuge skip_1_164
.align 2048
skip_1_164:
	.word 0xe5e7c020  ! 250: CASA_I	casa	[%r31] 0x 1, %r0, %r18
debug_1_165:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_165:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_165
    nop
debug_wait1_165:
    ld [%r23], %r16
    brnz %r16, debug_wait1_165
    nop
    ba,a debug_startwait1_165
continue_debug_1_165:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_165:
    cmp %r13, %r17
    bne,a wait_for_stat_1_165
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_165:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_165
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x0000005001c26075,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xe497c033  ! 251: LDUHA_R	lduha	[%r31, %r19] 0x01, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_166) + 32, 16, 16)) -> intp(7,0,24)
intvec_1_166:
	.word 0x39400001  ! 252: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_167:
	setx 0xefe77ced4d490b42, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 253: WRPR_TICK_R	wrpr	%r0, %r1, %tick
jmptr_1_168:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 254: JMPL_R	jmpl	%r27 + %r0, %r27
mondo_1_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d940001  ! 255: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
jmptr_1_170:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 256: JMPL_R	jmpl	%r27 + %r0, %r27
cmp_1_171:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_171:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_171
    nop
cmp_wait1_171:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_171
    nop
    ba,a cmp_startwait1_171
continue_cmp_1_171:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe2, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91904001  ! 257: WRPR_PIL_R	wrpr	%r1, %r1, %pil
	.word 0x97a309c2  ! 258: FDIVd	fdivd	%f12, %f2, %f42
mondo_1_172:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d940012  ! 259: WRPR_WSTATE_R	wrpr	%r16, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_173
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_173:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 260: RDPC	rd	%pc, %r10
splash_lsu_1_174:
	ta T_CHANGE_HPRIV
	set 0xf8593f36, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_175
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_175:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e012  ! 262: CASA_R	casa	[%r31] %asi, %r18, %r10
	.word 0xa97038b8  ! 263: POPC_I	popc	0x18b8, %r20
	.word 0xe1bfe0c0  ! 264: STDFA_I	stda	%f16, [0x00c0, %r31]
intveclr_1_176:
	setx 0x23e514e99ed539ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 265: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe877e018  ! 266: STX_I	stx	%r20, [%r31 + 0x0018]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_177:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 267: CASA_R	casa	[%r31] %asi, %r20, %r20
pmu_1_178:
	nop
	setx 0xfffff8e1fffffee7, %g1, %g7
	.word 0xa3800007  ! 268: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_179
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_179:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 269: CASA_R	casa	[%r31] %asi, %r20, %r20
	.word 0xe927c000  ! 270: STF_R	st	%f20, [%r0, %r31]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe80fe038  ! 272: LDUB_I	ldub	[%r31 + 0x0038], %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_180)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_180:
	.word 0xa9853433  ! 273: WR_SET_SOFTINT_I	wr	%r20, 0x1433, %set_softint
jmptr_1_181:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 274: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xe927c000  ! 275: STF_R	st	%f20, [%r0, %r31]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_182
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_182:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e014  ! 276: CASA_R	casa	[%r31] %asi, %r20, %r20
fpinit_1_183:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 277: FDIVd	fdivd	%f0, %f4, %f6
	.word 0x9bb48991  ! 278: BSHUFFLE	fmovc32	%d18, %d48, %d44
	.word 0xa3b504c9  ! 279: FCMPNE32	fcmpne32	%d20, %d40, %r17
	.word 0xe26fe0dc  ! 280: LDSTUB_I	ldstub	%r17, [%r31 + 0x00dc]
	setx 0xaa212be5ba361f32, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_185:
	.word 0x39400001  ! 281: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_186:
	.word 0x819824d5  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d5, %hpstate
cwp_1_187:
    set user_data_start, %o7
	.word 0x93902000  ! 283: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
intveclr_1_188:
	setx 0xd3caa1e4850fc19b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 284: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe26fe019  ! 285: LDSTUB_I	ldstub	%r17, [%r31 + 0x0019]
	.word 0x91d02034  ! 286: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_1_189:
	setx 0x16e871055de3cd73, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 287: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_190:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d90c011  ! 288: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
fpinit_1_191:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 289: FCMPd	fcmpd	%fcc<n>, %f0, %f4
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_192) + 56, 16, 16)) -> intp(3,0,17)
intvec_1_192:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_193:
	nop
	setx 0xfffff3bdfffffddc, %g1, %g7
	.word 0xa3800007  ! 291: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_194:
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a449c8  ! 293: FDIVd	fdivd	%f48, %f8, %f20
fpinit_1_195:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89b00484  ! 294: FCMPLE32	fcmple32	%d0, %d4, %r4
	.word 0x9194f455  ! 295: WRPR_PIL_I	wrpr	%r19, 0x1455, %pil
	.word 0x93d020b5  ! 296: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xb1800001  ! 297: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 298: WR_STICK_REG_R	wr	%r0, %r1, %-
	brlez,pt  	%r1, skip_1_196
	fbuge,a,pn	%fcc0,  skip_1_196
.align 32
skip_1_196:
	.word 0xe9e7c020  ! 299: CASA_I	casa	[%r31] 0x 1, %r0, %r20
fpinit_1_197:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009c4  ! 300: FDIVd	fdivd	%f0, %f4, %f6
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610080, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 302: RDPC	rd	%pc, %r17
splash_lsu_1_199:
	ta T_CHANGE_HPRIV
	set 0x47feedb0, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d95000b  ! 304: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
memptr_1_201:
	set user_data_start, %r31
	.word 0x8582f87e  ! 305: WRCCR_I	wr	%r11, 0x187e, %ccr
	.word 0x9f803973  ! 306: SIR	sir	0x1973
splash_lsu_1_202:
	ta T_CHANGE_HPRIV
	set 0xdfba22f8, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 307: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f8023cf  ! 308: SIR	sir	0x03cf
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_203
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_203
    set CWQ_BASE, %l6
    best_set_reg(0x20610050, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_203:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 309: RDPC	rd	%pc, %r20
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_204) + 24, 16, 16)) -> intp(2,0,7)
intvec_1_204:
	.word 0x39400001  ! 310: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_205
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_205
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_205:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 311: RDPC	rd	%pc, %r18
mondo_1_206:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d914001  ! 312: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
cwp_1_207:
    set user_data_start, %o7
	.word 0x93902005  ! 313: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xb1800001  ! 314: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_208:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d904011  ! 315: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
	ta	T_CHANGE_NONPRIV	! macro
unsupttte_1_209:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0x99a289b3  ! 317: FDIVs	fdivs	%f10, %f19, %f12
	.word 0xd91fe010  ! 318: LDDF_I	ldd	[%r31, 0x0010], %f12
	.word 0xe1bfe020  ! 319: STDFA_I	stda	%f16, [0x0020, %r31]
memptr_1_210:
	set user_data_start, %r31
	.word 0x8581ffe5  ! 320: WRCCR_I	wr	%r7, 0x1fe5, %ccr
	.word 0x36700001  ! 321: BPGE	<illegal instruction>
DS_1_211:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa5a1c9d0  ! 1: FDIVd	fdivd	%f38, %f16, %f18
	.word 0xa1a4c833  ! 322: FADDs	fadds	%f19, %f19, %f16
	.word 0xe137e04a  ! 323: STQF_I	-	%f16, [0x004a, %r31]
pmu_1_212:
	nop
	setx 0xfffffc46fffffc69, %g1, %g7
	.word 0xa3800007  ! 324: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9f8026f5  ! 325: SIR	sir	0x06f5
mondo_1_213:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e8] %asi
	.word 0x9d90400d  ! 326: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	.word 0xa66ac00d  ! 327: UDIVX_R	udivx 	%r11, %r13, %r19
	.word 0x9f803ece  ! 328: SIR	sir	0x1ece
	.word 0xe1bfda00  ! 329: STDFA_R	stda	%f16, [%r0, %r31]
	.word 0xa145c000  ! 330: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0xe137e049  ! 331: STQF_I	-	%f16, [0x0049, %r31]
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a4c9c0  ! 333: FDIVd	fdivd	%f50, %f0, %f20
	.word 0x91d02032  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x95500000  ! 335: RDPR_TPC	<illegal instruction>
intveclr_1_214:
	setx 0x0a5e6a937e1242a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 336: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 337: Tcc_I	te	icc_or_xcc, %r0 + 50
cmp_1_215:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_215:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_215
    nop
cmp_wait1_215:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_215
    nop
    ba,a cmp_startwait1_215
continue_cmp_1_215:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 48, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c009  ! 338: WRPR_PIL_R	wrpr	%r19, %r9, %pil
	.word 0x99a449c3  ! 339: FDIVd	fdivd	%f48, %f34, %f12
	.word 0x97464000  ! 340: RD_STICK_CMPR_REG	rd	%-, %r11
pmu_1_216:
	nop
	setx 0xfffff7fdfffff4c6, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_217
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_217:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 342: CASA_R	casa	[%r31] %asi, %r3, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_218) + 40, 16, 16)) -> intp(0,0,19)
intvec_1_218:
	.word 0x39400001  ! 343: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_219
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_219
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_219:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 344: RDPC	rd	%pc, %r16
splash_htba_1_220:
	ta T_CHANGE_HPRIV
	best_set_reg(HV_TRAP_BASE_PA, %r11,%r12)
	.word 0x8b98000c  ! 345: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
	.word 0x9b45c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xc1bfe080  ! 347: STDFA_I	stda	%f0, [0x0080, %r31]
	.word 0x9ba309d2  ! 348: FDIVd	fdivd	%f12, %f18, %f44
	setx 0x7d0cc6fd88afe0ad, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_221:
	.word 0x39400001  ! 349: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe010  ! 350: LDDA_I	ldda	[%r31, + 0x0010] %asi, %r13
mondo_1_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d940010  ! 351: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_223:
	set 0x60540000, %r31
	.word 0x8582f315  ! 353: WRCCR_I	wr	%r11, 0x1315, %ccr
	.word 0xdabfc020  ! 354: STDA_R	stda	%r13, [%r31 + %r0] 0x01
	.word 0xdabfe09d  ! 355: STDA_I	stda	%r13, [%r31 + 0x009d] %asi
pmu_1_224:
	nop
	setx 0xffffff4bfffff46c, %g1, %g7
	.word 0xa3800007  ! 356: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xda4fc000  ! 357: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0xa5b44491  ! 358: FCMPLE32	fcmple32	%d48, %d48, %r18
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_225)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_225:
	.word 0xa984e645  ! 359: WR_SET_SOFTINT_I	wr	%r19, 0x0645, %set_softint
	.word 0x9f8025a1  ! 360: SIR	sir	0x05a1
intveclr_1_226:
	setx 0x68cd643716f22a78, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 361: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 362: CASA_R	casa	[%r31] %asi, %r17, %r18
memptr_1_228:
	set user_data_start, %r31
	.word 0x8584b19d  ! 363: WRCCR_I	wr	%r18, 0x119d, %ccr
	.word 0x91d02032  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa7b5048c  ! 365: FCMPLE32	fcmple32	%d20, %d12, %r19
	.word 0x9f803391  ! 366: SIR	sir	0x1391
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_229)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_229:
	.word 0xa9827759  ! 367: WR_SET_SOFTINT_I	wr	%r9, 0x1759, %set_softint
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_230
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_230:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 368: RDPC	rd	%pc, %r16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_231
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_231:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00c  ! 369: CASA_R	casa	[%r31] %asi, %r12, %r16
	.word 0xa5a00161  ! 370: FABSq	dis not found

	.word 0xb1800001  ! 371: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_1_232:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_232:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_232
    nop
cmp_wait1_232:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_232
    nop
    ba,a cmp_startwait1_232
continue_cmp_1_232:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 52, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191000c  ! 372: WRPR_PIL_R	wrpr	%r4, %r12, %pil
splash_decr_1_233:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa7804007  ! 373: WR_GRAPHICS_STATUS_REG_R	wr	%r1, %r7, %-
DS_1_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 374: SAVE_R	save	%r31, %r0, %r31
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_235
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_235:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e007  ! 375: CASA_R	casa	[%r31] %asi, %r7, %r18
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8d9035e2  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x15e2, %pstate
intveclr_1_237:
	setx 0x5f740f1028e22840, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 377: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ba009c8  ! 378: FDIVd	fdivd	%f0, %f8, %f44
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_238) + 8, 16, 16)) -> intp(4,0,0)
intvec_1_238:
	.word 0x39400001  ! 379: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_1_239:
	.word 0x93a489d0  ! 1: FDIVd	fdivd	%f18, %f16, %f40
	.word 0xd1336689  ! 1: STQF_I	-	%f8, [0x0689, %r13]
	normalw
	.word 0xa7458000  ! 380: RD_SOFTINT_REG	rd	%softint, %r19
splash_hpstate_1_240:
	.word 0x8198267d  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x067d, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_241
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_241:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e010  ! 382: CASA_R	casa	[%r31] %asi, %r16, %r19
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_242
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_242
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_242:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 383: RDPC	rd	%pc, %r16
	.word 0xe127e00a  ! 384: STF_I	st	%f16, [0x000a, %r31]
DS_1_243:
	.word 0xa9a489c1  ! 1: FDIVd	fdivd	%f18, %f32, %f20
	.word 0xd930e503  ! 1: STQF_I	-	%f12, [0x0503, %r3]
	normalw
	.word 0x93458000  ! 385: RD_SOFTINT_REG	rd	%softint, %r9
fpinit_1_244:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 386: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xc19fc3e0  ! 387: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x91d020b2  ! 388: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_1_245:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d94c005  ! 389: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_246) + 24, 16, 16)) -> intp(5,0,15)
intvec_1_246:
	.word 0x39400001  ! 390: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_247
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_247
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_247:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 391: RDPC	rd	%pc, %r19
	.word 0xb1800001  ! 392: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_248:
	setx 0x4370b8a1ba368bc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 393: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
cmp_1_249:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_249:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_249
    nop
cmp_wait1_249:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_249
    nop
    ba,a cmp_startwait1_249
continue_cmp_1_249:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb0, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944013  ! 394: WRPR_PIL_R	wrpr	%r17, %r19, %pil
	.word 0xe62fe01b  ! 395: STB_I	stb	%r19, [%r31 + 0x001b]
fpinit_1_250:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91a009a4  ! 396: FDIVs	fdivs	%f0, %f4, %f8
mondo_1_251:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d950014  ! 397: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
DS_1_252:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe334c010  ! 1: STQF_R	-	%f17, [%r16, %r19]
	normalw
	.word 0x97458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe19fdf20  ! 399: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xd64fc000  ! 400: LDSB_R	ldsb	[%r31 + %r0], %r11
splash_tba_1_253:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 401: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_254
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_254
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_254:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 402: RDPC	rd	%pc, %r9
fpinit_1_255:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 403: FDIVs	fdivs	%f0, %f4, %f4
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_256:
    ta T_CHANGE_NONHPRIV
	.word 0xd3e7e010  ! 404: CASA_R	casa	[%r31] %asi, %r16, %r9
	.word 0xd2800be0  ! 405: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
	.word 0xa945c000  ! 406: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xe8dfe038  ! 407: LDXA_I	ldxa	[%r31, + 0x0038] %asi, %r20
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 408: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_1_257:
	nop
	setx 0xfffff4ccfffffbef, %g1, %g7
	.word 0xa3800007  ! 409: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_lsu_1_258:
	ta T_CHANGE_HPRIV
	set 0x5fbd4bbb, %r2
	mov 0x7, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
reduce_priv_lvl_1_259:
	ta	T_CHANGE_NONHPRIV	! macro
splash_decr_1_260:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r12, [%r1] 0x45
	.word 0xa7844005  ! 412: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r5, %-
	.word 0x9f802331  ! 413: SIR	sir	0x0331
memptr_1_261:
	set user_data_start, %r31
	.word 0x858472b0  ! 414: WRCCR_I	wr	%r17, 0x12b0, %ccr
mondo_1_262:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d948011  ! 415: WRPR_WSTATE_R	wrpr	%r18, %r17, %wstate
	.word 0x8d9021b0  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x01b0, %pstate
	.word 0xa1a00161  ! 417: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_264
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_264
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_264:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 418: RDPC	rd	%pc, %r12
pmu_1_265:
	nop
	setx 0xfffff598fffff946, %g1, %g7
	.word 0xa3800007  ! 419: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b3  ! 420: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0xa5a349d4  ! 421: FDIVd	fdivd	%f44, %f20, %f18
	.word 0xe427e032  ! 422: STW_I	stw	%r18, [%r31 + 0x0032]
cmp_1_266:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_266:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_266
    nop
cmp_wait1_266:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_266
    nop
    ba,a cmp_startwait1_266
continue_cmp_1_266:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x44, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c011  ! 423: WRPR_PIL_R	wrpr	%r11, %r17, %pil
	.word 0x97500000  ! 424: RDPR_TPC	<illegal instruction>
	bneg,a	 skip_1_267
	brlez,a,pt	%r17, skip_1_267
.align 2048
skip_1_267:
	.word 0xd7e7c020  ! 425: CASA_I	casa	[%r31] 0x 1, %r0, %r11
	.word 0xb1800001  ! 426: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_268) + 16, 16, 16)) -> intp(0,0,11)
intvec_1_268:
	.word 0x39400001  ! 427: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
intveclr_1_269:
	setx 0x81a4ecb4608cc22e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 428: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_270:
	set user_data_start, %r31
	.word 0x858477f8  ! 429: WRCCR_I	wr	%r17, 0x17f8, %ccr
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
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_271:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 430: RDPC	rd	%pc, %r8
    set 0x1070, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb407f1  ! 431: PDISTN	fmean16	%d16, %d48, %d44
	.word 0x91d020b2  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 178
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_272
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 433: RDPC	rd	%pc, %r16
	.word 0x83d02033  ! 434: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa9a00161  ! 435: FABSq	dis not found

splash_hpstate_1_273:
	.word 0x36800001  ! 1: BGE	bge,a	<label_0x1>
	.word 0x81982355  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
intveclr_1_274:
	setx 0x6549e393f65f44df, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 437: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe81fe030  ! 438: LDD_I	ldd	[%r31 + 0x0030], %r20
cmp_1_275:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_275:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_275
    nop
cmp_wait1_275:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_275
    nop
    ba,a cmp_startwait1_275
continue_cmp_1_275:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xbc, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934010  ! 439: WRPR_PIL_R	wrpr	%r13, %r16, %pil
donret_1_276:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_276-donret_1_276-8), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x003e1f5c | (28 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x884, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_276:
	.word 0xe8ffe08c  ! 440: SWAPA_I	swapa	%r20, [%r31 + 0x008c] %asi
splash_hpstate_1_277:
	.word 0x8198250e  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050e, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_278
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00161fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_278:
    ta T_CHANGE_NONHPRIV
	.word 0xe9e7e010  ! 442: CASA_R	casa	[%r31] %asi, %r16, %r20
	setx 0x1bcd1d64a27b10d4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_279:
	.word 0x39400001  ! 443: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_280:
	nop
	setx 0xfffff1d0fffff104, %g1, %g7
	.word 0xa3800007  ! 444: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_1_281:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_281:
	.word 0x8f902001  ! 445: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_1_282:
	setx 0xf2bde9c098a1277a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xc19fc2c0  ! 447: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0xe93fe090  ! 448: STDF_I	std	%f20, [0x0090, %r31]
	.word 0xe19fdc00  ! 449: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0xe8dfe010  ! 450: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d903261  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x1261, %pstate
	.word 0xd2388012  ! 452: STD_R	std	%r9, [%r2 + %r18]
	.word 0xd337c000  ! 453: STQF_R	-	%f9, [%r0, %r31]
	bcc  	 skip_1_284
	fbne skip_1_284
.align 32
skip_1_284:
	.word 0xc36fe0e4  ! 454: PREFETCH_I	prefetch	[%r31 + 0x00e4], #one_read
	.word 0xa5a4c9cb  ! 455: FDIVd	fdivd	%f50, %f42, %f18
splash_cmpr_1_285:
	setx 0xed1ecd17315d7af3, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	ta T_CHANGE_NONPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 456: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_1_286:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d0] %asi
	.word 0x9d944004  ! 457: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0xc1bfdf20  ! 458: STDFA_R	stda	%f0, [%r0, %r31]
	.word 0xe19fe0c0  ! 459: LDDFA_I	ldda	[%r31, 0x00c0], %f16
pmu_1_287:
	nop
	setx 0xfffff409fffffd6d, %g1, %g7
	.word 0xa3800007  ! 460: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_1_288:
	.word 0xa9a149d1  ! 1: FDIVd	fdivd	%f36, %f48, %f20
	allclean
	.word 0xa3b1c310  ! 461: ALIGNADDRESS	alignaddr	%r7, %r16, %r17
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 462: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	setx 0x7fa64e7b51a602b6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_289:
	.word 0x39400001  ! 463: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_290)+56, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_290:
	.word 0xa980aa32  ! 464: WR_SET_SOFTINT_I	wr	%r2, 0x0a32, %set_softint
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_291)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_291:
	.word 0xa9806c40  ! 465: WR_SET_SOFTINT_I	wr	%r1, 0x0c40, %set_softint
	.word 0xe20fe028  ! 466: LDUB_I	ldub	[%r31 + 0x0028], %r17
	.word 0xa7540000  ! 467: RDPR_GL	<illegal instruction>
	.word 0x9350c000  ! 468: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_292
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_292
    set CWQ_BASE, %l6
    best_set_reg(0x20610070, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_292:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 469: RDPC	rd	%pc, %r17
	.word 0x9f80211b  ! 470: SIR	sir	0x011b
intveclr_1_293:
	setx 0x4215ccae170fd846, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 471: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
fpinit_1_294:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 472: FDIVs	fdivs	%f0, %f4, %f4
pmu_1_295:
	nop
	setx 0xfffff467fffff85b, %g1, %g7
	.word 0xa3800007  ! 473: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_hpstate_1_296:
	.word 0x8198228f  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028f, %hpstate
donret_1_297:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_297-donret_1_297-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x0076f597 | (4 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x887, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_297:
	.word 0xe2ffe0e0  ! 475: SWAPA_I	swapa	%r17, [%r31 + 0x00e0] %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d020b2  ! 477: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_1_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd5788512	! Random illegal ?
	.word 0xe9114011  ! 1: LDQF_R	-	[%r5, %r17], %f20
	.word 0xa5a14833  ! 478: FADDs	fadds	%f5, %f19, %f18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_299
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_299:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e013  ! 479: CASA_R	casa	[%r31] %asi, %r19, %r18
	.word 0xa5b48994  ! 480: BSHUFFLE	fmovc32	%d18, %d20, %d18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_301:
	ta	T_CHANGE_NONHPRIV	! macro
splash_cmpr_1_302:
	setx 0x3db0d7abfe075b5d, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 482: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0xe46fe001  ! 483: LDSTUB_I	ldstub	%r18, [%r31 + 0x0001]
	.word 0x9f80353d  ! 484: SIR	sir	0x153d
	setx 0x596d6feb30971f07, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_303:
	.word 0x39400001  ! 485: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a409d0  ! 486: FDIVd	fdivd	%f16, %f16, %f12
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 487: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x8d90318e  ! 488: WRPR_PSTATE_I	wrpr	%r0, 0x118e, %pstate
	.word 0xc3ec8028  ! 489: PREFETCHA_R	prefetcha	[%r18, %r8] 0x01, #one_read
	.word 0xa9a00166  ! 490: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_305
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_305
    set CWQ_BASE, %l6
    best_set_reg(0x206100c0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_305:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 491: RDPC	rd	%pc, %r12
	.word 0xb1800001  ! 492: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xb1800001  ! 493: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_306:
	setx 0xd8739dff395213ca, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 494: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9f803e64  ! 495: SIR	sir	0x1e64
	.word 0xa9a00173  ! 496: FABSq	dis not found

	.word 0x97703dbb  ! 497: POPC_I	popc	0x1dbb, %r11
	.word 0xe19fe0e0  ! 498: LDDFA_I	ldda	[%r31, 0x00e0], %f16
	.word 0xd64fe020  ! 499: LDSB_I	ldsb	[%r31 + 0x0020], %r11
	.word 0x91b4c991  ! 500: BSHUFFLE	fmovc32	%d50, %d48, %d8
	.word 0x93a00170  ! 501: FABSq	dis not found

DS_1_308:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 502: RESTORE_R	restore	%r31, %r0, %r31
jmptr_1_309:
    nop
    set 0xe1200000, %r27
	.word 0xb7c6c000  ! 503: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0x9950c000  ! 504: RDPR_TT	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_310
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_310:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 505: CASA_R	casa	[%r31] %asi, %r16, %r12
	.word 0x9f80295c  ! 506: SIR	sir	0x095c
jmptr_1_311:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 507: JMPL_R	jmpl	%r27 + %r0, %r27
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_312
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_312
    set CWQ_BASE, %l6
    best_set_reg(0x206100d0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_312:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 508: RDPC	rd	%pc, %r18
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_313
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_313:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e010  ! 509: CASA_R	casa	[%r31] %asi, %r16, %r18
	.word 0xe19fd920  ! 510: LDDFA_R	ldda	[%r31, %r0], %f16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_314) + 8, 16, 16)) -> intp(1,0,6)
intvec_1_314:
	.word 0x39400001  ! 511: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
jmptr_1_315:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 512: JMPL_R	jmpl	%r27 + %r0, %r27
DS_1_316:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc76984d3	! Random illegal ?
	.word 0x93a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a5082d  ! 513: FADDs	fadds	%f20, %f13, %f9
memptr_1_317:
	set 0x60340000, %r31
	.word 0x85813821  ! 514: WRCCR_I	wr	%r4, 0x1821, %ccr
splash_lsu_1_318:
	ta T_CHANGE_HPRIV
	set 0x660e6905, %r2
	mov 0x5, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x30fc5a606e76e81f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_319:
	.word 0x39400001  ! 516: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2c800001  ! 517: BNEG	bneg,a	<label_0x1>
splash_cmpr_1_320:
	setx 0xf3b0ce0e40c35e88, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 518: WRPR_TICK_R	wrpr	%r0, %r1, %tick
debug_1_321:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_321:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_321
    nop
debug_wait1_321:
    ld [%r23], %r16
    brnz %r16, debug_wait1_321
    nop
    ba,a debug_startwait1_321
continue_debug_1_321:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_321:
    cmp %r13, %r17
    bne,a wait_for_stat_1_321
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_321:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_321
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x000000501be07590,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd29fc02d  ! 519: LDDA_R	ldda	[%r31, %r13] 0x01, %r9
memptr_1_322:
	set 0x60740000, %r31
	.word 0x85802f18  ! 520: WRCCR_I	wr	%r0, 0x0f18, %ccr
	.word 0xd25fe008  ! 521: LDX_I	ldx	[%r31 + 0x0008], %r9
fpinit_1_323:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 522: FDIVs	fdivs	%f0, %f4, %f4
	.word 0x91d02032  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_1_324:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_324:
	.word 0x8f902000  ! 524: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xab848005  ! 525: WR_CLEAR_SOFTINT_R	wr	%r18, %r5, %clear_softint
	.word 0xd26fe049  ! 526: LDSTUB_I	ldstub	%r9, [%r31 + 0x0049]
	setx 0x6e87cc350851c2f6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_325:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
cmp_1_326:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_326:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_326
    nop
cmp_wait1_326:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_326
    nop
    ba,a cmp_startwait1_326
continue_cmp_1_326:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x5c, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91948000  ! 528: WRPR_PIL_R	wrpr	%r18, %r0, %pil
	.word 0xb1800001  ! 529: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd277c000  ! 530: STX_R	stx	%r9, [%r31 + %r0]
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_327:
	nop
	ta T_CHANGE_HPRIV
    mov 8, %r18
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait1_327:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_1_327
    nop
debug_wait1_327:
    ld [%r23], %r16
    brnz %r16, debug_wait1_327
    nop
    ba,a debug_startwait1_327
continue_debug_1_327:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r17       !Running_status
wait_for_stat_1_327:
    cmp %r13, %r17
    bne,a wait_for_stat_1_327
    ldxa [0x58]%asi, %r17       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_1_327:
    ldxa [0x58]%asi, %r17       !Running_status
    cmp %r14, %r17
    bne,a wait_for_debug_1_327
    ldxa [0x50]%asi, %r14       !Running_rw
    best_set_reg(0x00000050d9f59005,%r19, %r20)
    stxa %r20, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	ta T_CHANGE_NONHPRIV
	.word 0xd31fc000  ! 532: LDDF_R	ldd	[%r31, %r0], %f9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_328
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_328
    set CWQ_BASE, %l6
    best_set_reg(0x206100e0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_328:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 533: RDPC	rd	%pc, %r17
	.word 0xe26fe079  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0x0079]
	.word 0xa1520000  ! 535: RDPR_PIL	<illegal instruction>
	.word 0x33400001  ! 1: FBPE	fbe,a,pn	%fcc0, <label_0x1>
	.word 0x8d90297f  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x097f, %pstate
mondo_1_330:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d92c003  ! 537: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
	.word 0x9f8031cb  ! 538: SIR	sir	0x11cb
mondo_1_331:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 539: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
	.word 0xe0bfc020  ! 540: STDA_R	stda	%r16, [%r31 + %r0] 0x01
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 541: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_1_332:
	setx 0x3099ac1e8e07f09d, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 542: WRPR_TICK_R	wrpr	%r0, %r1, %tick
intveclr_1_333:
	setx 0xd1ee669a2a97767b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 543: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_334
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_334
    set CWQ_BASE, %l6
    best_set_reg(0x20610030, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_334:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 544: RDPC	rd	%pc, %r9
pmu_1_335:
	nop
	setx 0xffffff6efffff53b, %g1, %g7
	.word 0xa3800007  ! 545: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
intveclr_1_336:
	setx 0x5562056adf64db4f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 546: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_337:
	setx 0xca062ff6f3d2b2d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 547: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 548: Tcc_I	ta	icc_or_xcc, %r0 + 53
cmp_1_338:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_338:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_338
    nop
cmp_wait1_338:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_338
    nop
    ba,a cmp_startwait1_338
continue_cmp_1_338:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xec, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91910005  ! 549: WRPR_PIL_R	wrpr	%r4, %r5, %pil
splash_lsu_1_339:
	ta T_CHANGE_HPRIV
	set 0x2806bae5, %r2
	mov 0x3, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	ta T_CHANGE_NONHPRIV
	.word 0x3d400001  ! 550: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_340:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d950012  ! 551: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xe19fe020  ! 552: LDDFA_I	ldda	[%r31, 0x0020], %f16
	setx 0xe1aaef5e5befbdd2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_341:
	.word 0x39400001  ! 553: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe038  ! 554: LDUB_I	ldub	[%r31 + 0x0038], %r9
	.word 0x8d9027ec  ! 555: WRPR_PSTATE_I	wrpr	%r0, 0x07ec, %pstate
	ta	T_CHANGE_NONPRIV	! macro
donret_1_343:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_343-donret_1_343-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    set (0x004ea17b | (32 << 24)), %r13
    rdpr %tstate, %r16
    mov 0x1f, %r19
    and %r19, %r16, %r17
    andn %r16, %r19, %r16
    or %r16, %r17, %r20
    wrpr %r20, %g0, %tstate
    wrhpr %g0, 0x8d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_343:
	.word 0xd2ffe0dd  ! 557: SWAPA_I	swapa	%r9, [%r31 + 0x00dd] %asi
	.word 0x8d903ff6  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x1ff6, %pstate
mondo_1_345:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d950011  ! 559: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
splash_lsu_1_346:
	ta T_CHANGE_HPRIV
	set 0xcec80daf, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa2ab0014  ! 561: ANDNcc_R	andncc 	%r12, %r20, %r17
jmptr_1_347:
    nop
    set 0xe0200000, %r27
	.word 0xb7c6c000  ! 562: JMPL_R	jmpl	%r27 + %r0, %r27
intveclr_1_348:
	setx 0xb6999daf18a82b1a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 563: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
DS_1_349:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 564: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xe22fe044  ! 565: STB_I	stb	%r17, [%r31 + 0x0044]
	.word 0xe19fde00  ! 566: LDDFA_R	ldda	[%r31, %r0], %f16
tagged_1_350:
	tsubcctv %r17, 0x12dd, %r7
	.word 0xe207e0e1  ! 567: LDUW_I	lduw	[%r31 + 0x00e1], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_lvl_1_351:
	ta	T_CHANGE_NONHPRIV	! macro
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_352
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_352
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_352:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 569: RDPC	rd	%pc, %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_353
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_353:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 570: CASA_R	casa	[%r31] %asi, %r20, %r19
fpinit_1_354:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x8da009a4  ! 571: FDIVs	fdivs	%f0, %f4, %f6
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_355
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_355:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 572: CASA_R	casa	[%r31] %asi, %r20, %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_356
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00121fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_356:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 573: CASA_R	casa	[%r31] %asi, %r20, %r19
mondo_1_357:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d948013  ! 574: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	bcs,a	 skip_1_358
	.word 0x87a90a54  ! 1: FCMPd	fcmpd	%fcc<n>, %f4, %f20
.align 512
skip_1_358:
	.word 0xe63fc000  ! 575: STD_R	std	%r19, [%r31 + %r0]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_359
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x001e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_359:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e013  ! 576: CASA_R	casa	[%r31] %asi, %r19, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_360)+16, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_360:
	.word 0xa985383c  ! 577: WR_SET_SOFTINT_I	wr	%r20, 0x183c, %set_softint
memptr_1_361:
	set 0x60740000, %r31
	.word 0x858523f3  ! 578: WRCCR_I	wr	%r20, 0x03f3, %ccr
	.word 0xe64fc000  ! 579: LDSB_R	ldsb	[%r31 + %r0], %r19
splash_hpstate_1_362:
	.word 0x81982655  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0655, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 581: Tcc_R	ta	icc_or_xcc, %r0 + %r30
fpinit_1_363:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009a4  ! 582: FDIVs	fdivs	%f0, %f4, %f4
	.word 0xab850012  ! 583: WR_CLEAR_SOFTINT_R	wr	%r20, %r18, %clear_softint
	.word 0xab80f0d0  ! 584: WR_CLEAR_SOFTINT_I	wr	%r3, 0x10d0, %clear_softint
pmu_1_364:
	nop
	setx 0xfffff384fffff0a5, %g1, %g7
	.word 0xa3800007  ! 585: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_365
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_365
    set CWQ_BASE, %l6
    best_set_reg(0x20610090, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_365:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 586: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_366
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_366
    set CWQ_BASE, %l6
    best_set_reg(0x20610020, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_366:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 587: RDPC	rd	%pc, %r16
change_to_randtl_1_367:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_367:
	.word 0x8f902000  ! 588: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
invtsb_1_368:
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
	.word 0x29800001  ! 589: FBL	fbl,a	<label_0x1>
	.word 0x91a00171  ! 590: FABSq	dis not found

	.word 0xd037e0b2  ! 591: STH_I	sth	%r8, [%r31 + 0x00b2]
cmp_1_369:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_369:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_369
    nop
cmp_wait1_369:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_369
    nop
    ba,a cmp_startwait1_369
continue_cmp_1_369:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x7c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940001  ! 592: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	.word 0x36700001  ! 593: BPGE	<illegal instruction>
fpinit_1_370:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x89a009c4  ! 594: FDIVd	fdivd	%f0, %f4, %f4
mondo_1_371:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d92c009  ! 595: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
	.word 0xd04fe018  ! 596: LDSB_I	ldsb	[%r31 + 0x0018], %r8
DS_1_372:
	.word 0xa5a449d4  ! 1: FDIVd	fdivd	%f48, %f20, %f18
	allclean
	.word 0xa1b50312  ! 597: ALIGNADDRESS	alignaddr	%r20, %r18, %r16
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_373
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_373
    set CWQ_BASE, %l6
    best_set_reg(0x206100a0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_373:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 598: RDPC	rd	%pc, %r13
mondo_1_374:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950002  ! 599: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
DS_1_375:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 600: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe19fde00  ! 601: LDDFA_R	ldda	[%r31, %r0], %f16
pmu_1_376:
	nop
	setx 0xfffff19affffffaf, %g1, %g7
	.word 0xa3800007  ! 602: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
jmptr_1_377:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 603: JMPL_R	jmpl	%r27 + %r0, %r27
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_378:
	ta T_CHANGE_PRIV
	setx 0x0000000000380000, %r11, %r12
	.word 0x8b90000c  ! 605: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xdb27c000  ! 606: STF_R	st	%f13, [%r0, %r31]
mondo_1_379:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d920007  ! 607: WRPR_WSTATE_R	wrpr	%r8, %r7, %wstate
	.word 0xe19fdc00  ! 608: LDDFA_R	ldda	[%r31, %r0], %f16
	.word 0x91d02032  ! 609: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_1_380:
	setx 0xbc3acd617d53ef05, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 610: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x3c700001  ! 611: BPPOS	<illegal instruction>
	setx 0x55cb71114b04e1c9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_381:
	.word 0x39400001  ! 612: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00166  ! 613: FABSq	dis not found

splash_cmpr_1_382:
	setx 0xc0e8dd4a1cd53e05, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 40, %g1
	.word 0x89900001  ! 614: WRPR_TICK_R	wrpr	%r0, %r1, %tick
fpinit_1_383:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x87a80a44  ! 615: FCMPd	fcmpd	%fcc<n>, %f0, %f4
jmptr_1_384:
    nop
    set 0xe1a00000, %r27
	.word 0xb7c6c000  ! 616: JMPL_R	jmpl	%r27 + %r0, %r27
	.word 0xc19fdf20  ! 617: LDDFA_R	ldda	[%r31, %r0], %f0
	brnz,a,pn	%r19, skip_1_385
	fbl skip_1_385
.align 32
skip_1_385:
	.word 0xc36fe00e  ! 618: PREFETCH_I	prefetch	[%r31 + 0x000e], #one_read
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_386
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_386:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 619: RDPC	rd	%pc, %r20
pmu_1_387:
	nop
	setx 0xfffffdf1fffff5c2, %g1, %g7
	.word 0xa3800007  ! 620: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_388
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_388
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_388:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 621: RDPC	rd	%pc, %r8
pmu_1_389:
	nop
	setx 0xfffffc74fffffcae, %g1, %g7
	.word 0xa3800007  ! 622: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd06fe0de  ! 623: LDSTUB_I	ldstub	%r8, [%r31 + 0x00de]
fpinit_1_390:
    setx fp_data_quads, %r19, %r20
    ldd [%r20], %f0
    ldd [%r20+8], %f4
    ld  [%r20+16], %fsr
    ld  [%r20+24], %r19
    wr  %r19, %g0, %gsr
	.word 0x91b00484  ! 624: FCMPLE32	fcmple32	%d0, %d4, %r8
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a1c9c4  ! 626: FDIVd	fdivd	%f38, %f4, %f48
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
pmu_1_391:
	nop
	setx 0xfffff540fffff646, %g1, %g7
	.word 0xa3800007  ! 628: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a109d2  ! 629: FDIVd	fdivd	%f4, %f18, %f18
	.word 0xe4bfe0e1  ! 630: STDA_I	stda	%r18, [%r31 + 0x00e1] %asi
	.word 0xc1bfe000  ! 631: STDFA_I	stda	%f0, [0x0000, %r31]
	.word 0xe527e0d0  ! 632: STF_I	st	%f18, [0x00d0, %r31]
tagged_1_392:
	tsubcctv %r5, 0x1730, %r6
	.word 0xe407e0e0  ! 633: LDUW_I	lduw	[%r31 + 0x00e0], %r18
	.word 0x9ba00167  ! 634: FABSq	dis not found

	.word 0xc19fdf20  ! 635: LDDFA_R	ldda	[%r31, %r0], %f0
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 636: Tcc_R	tne	icc_or_xcc, %r0 + %r30
unsupttte_1_393:
    nop
    ta T_CHANGE_HPRIV
    mov 1, %r20
    sllx %r20, 63, %r20
    or %r20, 2,%r20
    stxa %r20, [%g0]0x54        ! I unsupported page size ..
    ta T_CHANGE_NONHPRIV
	.word 0xa1b48492  ! 637: FCMPLE32	fcmple32	%d18, %d18, %r16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x00061fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_394:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e012  ! 638: CASA_R	casa	[%r31] %asi, %r18, %r16
	.word 0xb1800001  ! 639: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_395:
	setx 0xcda6dd84c1eed44c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 640: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 641: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_decr_1_396:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r9, [%r1] 0x45
	.word 0xa784c004  ! 642: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r4, %-
cmp_1_397:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait1_397:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_1_397
    nop
cmp_wait1_397:
    ld [%r23], %r10
    brnz %r10, cmp_wait1_397
    nop
    ba,a cmp_startwait1_397
continue_cmp_1_397:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb0, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950011  ! 643: WRPR_PIL_R	wrpr	%r20, %r17, %pil
	.word 0xe0d7e038  ! 644: LDSHA_I	ldsha	[%r31, + 0x0038] %asi, %r16
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_398
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000a1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_398:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 645: CASA_R	casa	[%r31] %asi, %r17, %r16
jmptr_1_399:
    nop
    set 0xe0a00000, %r27
	.word 0xb7c6c000  ! 646: JMPL_R	jmpl	%r27 + %r0, %r27
splash_hpstate_1_400:
	.word 0x23400001  ! 1: FBPNE	fbne,a,pn	%fcc0, <label_0x1>
	.word 0x81982d0f  ! 647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0f, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_401
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_401:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 648: CASA_R	casa	[%r31] %asi, %r17, %r16
mondo_1_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d92c011  ! 649: WRPR_WSTATE_R	wrpr	%r11, %r17, %wstate
	.word 0xa7a309d4  ! 650: FDIVd	fdivd	%f12, %f20, %f50
	.word 0xa1a00172  ! 651: FABSq	dis not found

mondo_1_403:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d950010  ! 652: WRPR_WSTATE_R	wrpr	%r20, %r16, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %g0
	set 0x000e1fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e010  ! 653: CASA_R	casa	[%r31] %asi, %r16, %r16
	.word 0xc19fda00  ! 654: LDDFA_R	ldda	[%r31, %r0], %f0
	setx 0xc84149e8b2f1b173, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_405:
	.word 0x39400001  ! 655: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_406:
	setx 0xd2d392edfdd88707, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 656: WRPR_TICK_R	wrpr	%r0, %r1, %tick
mondo_1_407:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 657: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xe06fe0ac  ! 658: LDSTUB_I	ldstub	%r16, [%r31 + 0x00ac]
splash_cmpr_1_408:
	setx 0x3cb391ddb7520a31, %g2, %g1
	ta T_CHANGE_HPRIV
	wrhpr %g1, %g0, %hsys_tick_cmpr
	ta T_CHANGE_NONHPRIV
	sub %g1, 40, %g1
	.word 0x89900001  ! 659: WRPR_TICK_R	wrpr	%r0, %r1, %tick
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_409
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_409
    set CWQ_BASE, %l6
    best_set_reg(0x206100b0, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_409:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 660: RDPC	rd	%pc, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_410) + 32, 16, 16)) -> intp(7,0,22)
intvec_1_410:
	.word 0x39400001  ! 661: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26700001  ! 662: BPL	<illegal instruction>
	.word 0x9f80339e  ! 663: SIR	sir	0x139e
DS_1_411:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xa1a409d3  ! 1: FDIVd	fdivd	%f16, %f50, %f16
	.word 0xa7a00543  ! 1: FSQRTd	fsqrt	
	.word 0x99a18826  ! 664: FADDs	fadds	%f6, %f6, %f12
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 666: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd83fe0a0  ! 667: STD_I	std	%r12, [%r31 + 0x00a0]
mondo_1_412:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d914011  ! 668: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
mondo_1_413:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d948000  ! 669: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0x91a00170  ! 670: FABSq	dis not found

!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_414) + 48, 16, 16)) -> intp(2,0,8)
intvec_1_414:
	.word 0x39400001  ! 671: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xb1800001  ! 672: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a289d0  ! 673: FDIVd	fdivd	%f10, %f16, %f10
	.word 0x39400001  ! 674: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	fbule skip_1_415
	bge,a	 skip_1_415
.align 1024
skip_1_415:
	.word 0xe83fc000  ! 675: STD_R	std	%r20, [%r31 + %r0]
splash_lsu_1_416:
	ta T_CHANGE_HPRIV
	set 0x31572e50, %r2
	mov 0x2, %r1
	sllx %r1, 32, %r1
	or %r1, %r2, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
mondo_1_417:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d914003  ! 677: WRPR_WSTATE_R	wrpr	%r5, %r3, %wstate
	.word 0xe88fe000  ! 678: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r20
cwp_1_418:
    set user_data_start, %o7
	.word 0x93902002  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa3a4c9d4  ! 680: FDIVd	fdivd	%f50, %f20, %f48
mondo_1_419:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d950012  ! 681: WRPR_WSTATE_R	wrpr	%r20, %r18, %wstate
	.word 0xb1800001  ! 682: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9f8034d3  ! 683: SIR	sir	0x14d3
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_420)+48, 16, 16)) -> intp(mask2tid(0x1),1,3)
xir_1_420:
	.word 0xa98375ba  ! 684: WR_SET_SOFTINT_I	wr	%r13, 0x15ba, %set_softint
pmu_1_421:
	nop
	setx 0xfffff2fdfffff1dc, %g1, %g7
	.word 0xa3800007  ! 685: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc3ec0024  ! 687: PREFETCHA_R	prefetcha	[%r16, %r4] 0x01, #one_read
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
    and %r14, 0x8a, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944013  ! 688: WRPR_PIL_R	wrpr	%r17, %r19, %pil
	.word 0xc19fdc00  ! 689: LDDFA_R	ldda	[%r31, %r0], %f0
	.word 0x919164da  ! 690: WRPR_PIL_I	wrpr	%r5, 0x04da, %pil
	.word 0x99902001  ! 691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd097e028  ! 692: LDUHA_I	lduha	[%r31, + 0x0028] %asi, %r8
splash_cmpr_1_423:
	setx 0x0720015740920f18, %g2, %g1
	ta T_CHANGE_PRIV
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 40, %g1
	.word 0x89900001  ! 693: WRPR_TICK_R	wrpr	%r0, %r1, %tick
	.word 0x8d902e67  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0e67, %pstate
	.word 0x83d02033  ! 695: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa3a00172  ! 696: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_425
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_425
    set CWQ_BASE, %l6
    best_set_reg(0x20610010, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_425:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 697: RDPC	rd	%pc, %r11
	.word 0xd6d7e000  ! 698: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
pmu_1_426:
	nop
	setx 0xfffff6cefffffb21, %g1, %g7
	.word 0xa3800007  ! 699: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xe19fde00  ! 700: LDDFA_R	ldda	[%r31, %r0], %f16
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_427
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_427
    set CWQ_BASE, %l6
    best_set_reg(0x20610000, %l1, %l2)		!#		Control Word
    sllx %l2, 32, %l2
    stx  %l2, [%l6 + 0x0]
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_427:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 701: RDPC	rd	%pc, %r19
cmpenall_1_428:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait1_428:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_1_428
    nop
cmpenall_wait1_428:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait1_428
    nop
    ba,a cmpenall_startwait1_428
continue_cmpenall_1_428:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_1_428:
    cmp %r13, %r14
    bne,a wait_for_cmpstat_1_428
    ldxa [0x58]%asi, %r14       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r16       !Running_status
wait_for_cmpstat2_1_428:
    cmp %r14, %r16
    bne,a wait_for_cmpstat2_1_428
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

	.xword	0x3e37f582015c0ed6
	.xword	0xce235f95ad6fd461
	.xword	0xbe0925fe8e8eeb6c
	.xword	0xbb949e244c9ddf57
	.xword	0x34768dd230d899f9
	.xword	0xc66ce6f9f88c5ac5
	.xword	0xeb30e1069132df0a
	.xword	0xbeeba400b19a5f8a
	.xword	0xdb611ff98d6e7ff3
	.xword	0x1897ace13f5a7e17
	.xword	0x15028980fba209e7
	.xword	0xca4396fc4e64469e
	.xword	0xc797ffb1bca1d407
	.xword	0x2fc7c4bfb58aa8b3
	.xword	0xd2508b730190b660
	.xword	0x38a785580f74c02c
	.xword	0x7cd64360c689afc3
	.xword	0xc08e014139092320
	.xword	0x4a68498c2496867e
	.xword	0x5a975d89eec35d49
	.xword	0x065b65237de2c53b
	.xword	0x9c16015c34e2dfa7
	.xword	0x322623f1f03fe3ae
	.xword	0x19347eabe289a8ee
	.xword	0xce0f14bd1c31e175
	.xword	0x6e4ab9d087616a6c
	.xword	0x51e32ffed3f6b24c
	.xword	0x88109d87ef85984a
	.xword	0x45ad3a6cf9e46307
	.xword	0xaf54c9826e7a7c5a
	.xword	0xd1a664349203362d
	.xword	0x42a233adcdf8804f
	.xword	0x07aff52476014a5e
	.xword	0x2e2fab707d7ac00c
	.xword	0x9fa7d0a46234d4d6
	.xword	0xb4fd8db1a6a202d9
	.xword	0x0afd6106fe224171
	.xword	0x4217d6ccbc9c9ceb
	.xword	0x553107229a7e82e4
	.xword	0x4d134778fd80a292
	.xword	0x0e2c2756e218c245
	.xword	0xf8d28ba50994f61a
	.xword	0x7f39e07965c4b9f3
	.xword	0x14bb1fcda12e402c
	.xword	0xb683d3fc896ab6eb
	.xword	0x6b951d7f6d4521fd
	.xword	0x6867081db203b132
	.xword	0xf1a3bfbcc6a41d04
	.xword	0xb53dd6ee475d4959
	.xword	0x68109b2c44408204
	.xword	0x9f42597b601f89cb
	.xword	0x9d3df2bcf7d2c42b
	.xword	0x787aea2347847c96
	.xword	0x4d3435b5ae536750
	.xword	0x23cd9060b4b11a87
	.xword	0x3a09022af5f25315
	.xword	0xf89f77b60379ce8a
	.xword	0x484c8cee306686f7
	.xword	0x04e32989c857badc
	.xword	0x2ac744f7300d4453
	.xword	0xe9e4bc8c92498200
	.xword	0x7917106316c589e4
	.xword	0x16720757d67b9186
	.xword	0xa37fac21e3cf1edf
	.xword	0xe6c51f5f1e89fc29
	.xword	0x49de796e68fed388
	.xword	0xd816f28a3b7da753
	.xword	0xd2ceac0a34e41596
	.xword	0xf0975e18d2be867c
	.xword	0x792e5c0b12ee3085
	.xword	0xdc65fff8a0650bed
	.xword	0x59dba523edf20009
	.xword	0xf3a3385c0c46b80a
	.xword	0xf028ec8f8efeaf10
	.xword	0x93d1aa806c4dc8d1
	.xword	0xf00b6e98667d6193
	.xword	0x5966fd6fff4b7bc9
	.xword	0x8ef55e2fc3bf7db0
	.xword	0x3ff45265999d11a9
	.xword	0x265827662465eaf3
	.xword	0xa4ca7f4ac6fb9489
	.xword	0x11a8124eb9fa682e
	.xword	0x4fe213f7275634af
	.xword	0x1ef1e55789cab580
	.xword	0xfe764ff95b53d886
	.xword	0x8ce72a2e261f168e
	.xword	0x8f6aff290b0693c8
	.xword	0x17ca9c984d2f2fc3
	.xword	0xc393deb7eb73a9a5
	.xword	0xee4e0dc233d4857d
	.xword	0x6f4f0b8e1cdfaf96
	.xword	0xc271b857f553e0d2
	.xword	0x5a1afececc7d0ac3
	.xword	0xe583fd73452e9cc1
	.xword	0x66abaf06d6aabfd0
	.xword	0x2189c7283f1c8c1e
	.xword	0xb30414838a085982
	.xword	0xc7cb7aed34f678a7
	.xword	0x4ede8a576e4539b9
	.xword	0xc9b08e749d3d7232
	.xword	0xea30f494b51b7a5b
	.xword	0xda4f2cb65d74dd12
	.xword	0xe101f321f7656a2e
	.xword	0x9fbf6c36623994e1
	.xword	0xb0f6bf5cbfe48c4e
	.xword	0x0159936f0291b3b3
	.xword	0xba994a4d053fbcd0
	.xword	0xe96ac230cb66925b
	.xword	0x17fddc6dab5173bc
	.xword	0xd82c953ad433b52b
	.xword	0x008871bde486113b
	.xword	0x37cac1600e70594b
	.xword	0xb398d54834563644
	.xword	0xeb358da397683756
	.xword	0x5e5d1dd100dc3c59
	.xword	0x273230a5cae24eb6
	.xword	0x587f84b14fd1a185
	.xword	0x0bd078db76763f40
	.xword	0x56af5cd161159f57
	.xword	0xdaaeb31142a81042
	.xword	0xf3c1adc37ddda5e6
	.xword	0x15f082b84ebf3f0a
	.xword	0x6c524c58357819a8
	.xword	0x5073153e1e97a297
	.xword	0xfc7816ad8c9256b9
	.xword	0x221b56c45fe579f9
	.xword	0x03ff2a83474ed940
	.xword	0x20ad760a7104bd4c
	.xword	0x6afc1708a40bc915
	.xword	0x8a00c256a3a824df
	.xword	0xd00c5e06f8f645f2
	.xword	0xce1085eb99d5a203
	.xword	0x5921583b33178b60
	.xword	0xc0114ab099d63ca4
	.xword	0xb18648fe3b766ade
	.xword	0xffa85ebc3befc4e8
	.xword	0x3d24595dcac55c8f
	.xword	0x00369f16326dcafd
	.xword	0x5bb2cd1a93de7181
	.xword	0xfe79c1fa8c8e87f1
	.xword	0xed937d2917416c3d
	.xword	0xbf05c88bf7131ed8
	.xword	0xd7c444cbd43ef8d0
	.xword	0x7340924346a36d43
	.xword	0x1487940a32962d3e
	.xword	0xabec6468d9075ce0
	.xword	0x536483b35e4e1eb8
	.xword	0xa37c3afaf3cf80a4
	.xword	0xe6e18ab4074a80b0
	.xword	0x5f853448c3c7daee
	.xword	0x500c96307aa98990
	.xword	0x877b3295cedbc75b
	.xword	0x61963a7871985521
	.xword	0x653088d2de934688
	.xword	0x7d27b92cad25a265
	.xword	0xc9e5a784967d564e
	.xword	0x58dd6f3dd7bb46ae
	.xword	0xa29f8530d7844b15
	.xword	0x6db6f4f51adfc22f
	.xword	0xa12e258ec7039a33
	.xword	0xcfb73da9a95b3f7e
	.xword	0x52b4c444edb6ef8f
	.xword	0x3b9b8effb880f018
	.xword	0xec07ffdcc2b5b076
	.xword	0x4e5cd078fb9681f6
	.xword	0xf0b3ae2c3ea5846b
	.xword	0x0402fdd778230a4b
	.xword	0x475dc365d1613bd8
	.xword	0x069a39fc2919640f
	.xword	0xa03a25c3c60c4cc4
	.xword	0x9d3b92b059a20b08
	.xword	0x609b7f7066ed1939
	.xword	0xd3a96c94a3e87af2
	.xword	0x5bdf3066ce8de6de
	.xword	0x04a8cbb892934c64
	.xword	0x7db5fbe6bb43c396
	.xword	0x03ab355dafd50441
	.xword	0x912f50ad176d4154
	.xword	0xad829c42b02ad916
	.xword	0xefb6fd56230b538d
	.xword	0x91e3db1a8592fbad
	.xword	0x83aea9d8d17ba9c4
	.xword	0x8357a619d7ebc5d5
	.xword	0x92140c04461f97ac
	.xword	0x36508302886f3b3d
	.xword	0x7aa97add8d793e16
	.xword	0x97a208720fbde530
	.xword	0x8de621f1c1bc99a2
	.xword	0x8b84791458195975
	.xword	0x37fadce0b2da8ba2
	.xword	0x3b87a0c52a745566
	.xword	0x08ff6810e164fc3c
	.xword	0xf91575227e4ae655
	.xword	0x1994aeb7226c9d17
	.xword	0xe897ee05f4e578b4
	.xword	0xf152206f36c7b341
	.xword	0x411d67eb5130c042
	.xword	0x5f9e541410ccc6b3
	.xword	0x55f40825608ba6a6
	.xword	0xf7571029dc721cad
	.xword	0x9c53bd9a39c96c06
	.xword	0xaaa238dcf73c981b
	.xword	0x8eccf78876036b53
	.xword	0x645b692dc7f1e38e
	.xword	0x7ad6a2ed081390ef
	.xword	0x91c59e2a311a0f03
	.xword	0xb14b20095d2516ac
	.xword	0xc70ec933192f11c3
	.xword	0x2af73e23ab2e79a7
	.xword	0x92886bfe23681012
	.xword	0x5ed52d372b785d0b
	.xword	0xfe5d166d1d51b291
	.xword	0xb25735080de013c7
	.xword	0x1b159b2e2994d828
	.xword	0x70a8ba5dc2e8846b
	.xword	0xd963d498dcf5abea
	.xword	0xa18ca08be2307d6e
	.xword	0x698ac054001f3e98
	.xword	0x802a0d6c9b6dbe44
	.xword	0xad97aa78ab647b94
	.xword	0x5e8c40a2fdc1d274
	.xword	0x8f4f57d43c0139a0
	.xword	0x8fa2b15b6773e5b5
	.xword	0x23eee520b12b5777
	.xword	0x987d78916709d18e
	.xword	0x6685098db2c1f028
	.xword	0xb416ca3df2406d3e
	.xword	0x777ea4dcc9b250cc
	.xword	0x0069f7a8336a1cb3
	.xword	0xfe3882cb3a9611b8
	.xword	0x27b4f3284d297770
	.xword	0xc075d5a6b74796e7
	.xword	0x9c4308b75bc0c352
	.xword	0xbaac5555f05c167f
	.xword	0x1ac8585141d17505
	.xword	0xb79f7ad5a27b2013
	.xword	0x260496f82d27eb41
	.xword	0x449a698ecf698fb3
	.xword	0xd50982a95a6b990b
	.xword	0x11745221e96d8574
	.xword	0xec010efc2cc25c92
	.xword	0x3b34c4a3d3e5c34f
	.xword	0x493462f01982f2c1
	.xword	0x43f67e3e5c1eb5e6
	.xword	0x1a4bc1636ac83be1
	.xword	0x37cea4be96ba0f98
	.xword	0xab78968d542a7538
	.xword	0x29727601cbebfcbd
	.xword	0xac7278c380c47c9b
	.xword	0x8cc794cc8ad55bf4
	.xword	0xef11f70789032477
	.xword	0x22cf1f5b379643d8
	.xword	0xe0b6e5c7a2cb03f4
	.xword	0x5613078cd893b3a4
	.xword	0x4e1b521f0a7012c7
	.xword	0x1e898aaaf6f84c69

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
# 771 "diag.j"
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
	TTE_CV	 = 0,
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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
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
	.xword	0xaf413d279b2cddd6
	.xword	0x48f68d0880ff1331
	.xword	0x3b516b97eec403a9
	.xword	0x7ed48683862a9a5e
	.xword	0xa63760850438404e
	.xword	0x5a37841d51844e8d
	.xword	0x5d4c33041af3af62
	.xword	0x220ff008f14bdf9a
	.xword	0x41b09b172bda91a2
	.xword	0x2931d3d361623163
	.xword	0xf91129f24692ace5
	.xword	0x58a23d4b54e9f03c
	.xword	0x4f0542a5c4cbb6a2
	.xword	0xd44fa51ec629f7d8
	.xword	0x5da763a898a0a250
	.xword	0x868aba282ede5742
	.xword	0xf49b6d52d3697935
	.xword	0x2d12a112e99bbad1
	.xword	0x3bb874a7e465a75f
	.xword	0x4c9b2bd91e03fd02
	.xword	0x51ca3c5c3f9ddc0d
	.xword	0x82c6182f7a166c24
	.xword	0xff1aa5d48529acf7
	.xword	0x192f74bb590906ed
	.xword	0x5df3f4b998e1691a
	.xword	0xd3f174a2cafafd2e
	.xword	0xdb77be42ebc18eb8
	.xword	0x26e86e9a09cc7293
	.xword	0x5499429c723c34e0
	.xword	0xbd078349ac8fc31d
	.xword	0x23f80fa33c1fb603
	.xword	0xe8cd4dccbb55e621



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


attr_data {
	Name	 = .MyDATA_1,
	RA	 = 0x0000000170300000,
	PA	 = ra2pa(0x0000000170300000,0),
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
	Name	 = .MyDATA_1,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_1,
	hypervisor
}

.data
	.xword	0x5a5c45c979d96fcc
	.xword	0xd3061900478cc10a
	.xword	0xcda3b1ef39c76e71
	.xword	0x40e22bf279163b51
	.xword	0x1abecb4a80895033
	.xword	0x9983a83a4bf11397
	.xword	0x75b7f1cc110270fa
	.xword	0x8f4e64e547244b53
	.xword	0xed73f4b4ba978852
	.xword	0x0ba8b7ce0bea07b8
	.xword	0xd76dd0f1ecea1cc7
	.xword	0x3bded6ed1c3ebad1
	.xword	0x29b0a7f4ea0c1d66
	.xword	0xf25215336997c322
	.xword	0xd69dc8478ce160b6
	.xword	0xa662c91565995692
	.xword	0x948ba4d89f11d610
	.xword	0xcedf81fe0646b54c
	.xword	0x4134122f0000652f
	.xword	0xfb4d2b3093bab49f
	.xword	0x70e107963b7a9c24
	.xword	0x55d9b074414be719
	.xword	0xfc9cae308cc643ad
	.xword	0xaebc42df2f6499f6
	.xword	0x51aea02ecd156723
	.xword	0x3195acef2ac3a90d
	.xword	0x5fab89033f76290d
	.xword	0x02aaa435d10c9b08
	.xword	0x5e4e95ca535f1698
	.xword	0x154c06890f51b0b9
	.xword	0x0215614a0f46b97d
	.xword	0xf1a0c18025d9be9c



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
	TTE_IE	 = 1,
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
	Name	 = .MyDATA_2,
	hypervisor
}


attr_text {
	Name	 = .MyDATA_2,
	hypervisor
}

.data
	.xword	0x9e79bf4920dae568
	.xword	0xf54d65ae0add6d12
	.xword	0x1d649b69ac802655
	.xword	0xf386f8792a88d17b
	.xword	0x8235c5c27c3f55bd
	.xword	0x78b5d2aecef53137
	.xword	0xf1c79ac85d8ed296
	.xword	0xa1e32c1a296e336d
	.xword	0x3e05a37be64c28d2
	.xword	0xb924950e84b0c147
	.xword	0x845a1bc6fdc1cb01
	.xword	0xbb4e82506677a8d7
	.xword	0x175e2902dd2512a1
	.xword	0x424b5380c230f2e7
	.xword	0x81300aec89ea5daf
	.xword	0x4fa734cc833cb142
	.xword	0x1acaa2ca5dbca5cd
	.xword	0xd8d4a8a8c2d98410
	.xword	0xb176b6998a2d3077
	.xword	0xd65deb02c9eb6507
	.xword	0x29bbd593eb20efa3
	.xword	0x189f3d69e203c432
	.xword	0xde11bd787c5d503f
	.xword	0xa8d83db624d5b40d
	.xword	0x79fbb5350738498d
	.xword	0xc9cba46e0b76af5d
	.xword	0x92acc1f5172212cd
	.xword	0xa7f9138f3fe898b2
	.xword	0x6b5a4a4573b3c04b
	.xword	0x0af379c9f929506f
	.xword	0x9eb2b8ae6711cd0b
	.xword	0xef8f73dc80d5bec1



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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
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
	TTE_Context	 = SCONTEXT,
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
	.xword	0x10e47d056fe068f5
	.xword	0x13470c57b0a97e52
	.xword	0x5172af170debd585
	.xword	0x7776ea3f21671f0a
	.xword	0x42adb6f95f10a923
	.xword	0x209b24efd24a1fed
	.xword	0x5ecfa8ac6f1d519b
	.xword	0x1f5511c866b54b05
	.xword	0xd13d85a11d5aabe8
	.xword	0x36bf0ca3e87a60f4
	.xword	0xa690f7f10434d67d
	.xword	0x42cc9ff920b2f06f
	.xword	0x31588068791cd598
	.xword	0x773b98b9af1ed9e5
	.xword	0x7faafcde5990f3e8
	.xword	0x3f516ebb86bf97d0
	.xword	0x699c957bf282e327
	.xword	0x44e7add2cd9207bf
	.xword	0x14070b52f6bf9d0b
	.xword	0x8f35d33a39089483
	.xword	0x0679349e934e457d
	.xword	0xb4f3c0f5825633f0
	.xword	0xf5813274dd676a1e
	.xword	0x5409d8989ce2dd09
	.xword	0x28e5f0013605fa5e
	.xword	0xbd3adaf4dcd1b453
	.xword	0x629a122cbda9b610
	.xword	0xe7746b77d34cee51
	.xword	0x407d18642e462d1c
	.xword	0x3c4e2c62795b2834
	.xword	0x5ec4975b344318e9
	.xword	0x8ea216b233a4335f





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
	TTE_W	 = 1
}

.text
nuff_said_0:
	fdivd %f0, %f4, %f8
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
	TTE_Size	 = 1,
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
	TTE_W	 = 0
}

.text
nuff_said_2:
	fdivd %f0, %f4, %f6
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
	TTE_IE	 = 1,
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
nuff_said_3:
	fdivs %f0, %f4, %f8
	jmpl %r27+8, %r0
	fdivd %f0, %f4, %f8



#if 0
#endif

